package Updater.Util;

import Updater.GUI.LogPanel;
import Updater.Tennis.Player;

import javax.swing.*;
import javax.swing.text.BadLocationException;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.ZonedDateTime;
import java.util.Objects;
import java.util.logging.*;

public class MyLogger {

    private static Logger logger;

    public MyLogger() {
        File file = new File("Error.txt");
        if (file.exists()) {
            file.delete();
        }
        logger = Logger.getLogger(MyLogger.class.getName());
        logger.setUseParentHandlers(false);
        Handler consoleHandler = new ConsoleHandler();
        consoleHandler.setFormatter(new Formatter() {
            public String format(LogRecord record) {
                StringBuilder sb = new StringBuilder();


                if (!record.getLevel().equals(Level.INFO)) {
                    sb.append(record.getLevel().getLocalizedName());
                    sb.append(": ");
                }

                if (!Objects.equals(formatMessage(record), "\n")) {
                    ZonedDateTime zonedDateTime = ZonedDateTime.now();
                    sb.append(formatTime(zonedDateTime.getHour()))
                            .append(":").append(formatTime(zonedDateTime.getMinute()))
                            .append(":").append(formatTime(zonedDateTime.getSecond()))
                            .append(" ");
                }

                sb.append(formatMessage(record));

                if (!Objects.equals(formatMessage(record), "\n")) {
                    sb.append(System.getProperty("line.separator"));
                }

                return sb.toString();
            }
        });
        logger.addHandler(consoleHandler);
    }

    private static String formatTime(int time) {
        String currentTime = String.valueOf(time);
        if (time < 10) {
            currentTime = "0" + time;
        }
        return currentTime;
    }

    public static void log(Level level, final String msg){
        logger.log(level, msg);
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                StringBuilder sb = new StringBuilder();

                if (!msg.equals("\n")) {
                    ZonedDateTime zonedDateTime = ZonedDateTime.now();
                    sb.append(formatTime(zonedDateTime.getHour()))
                            .append(":").append(formatTime(zonedDateTime.getMinute()))
                            .append(":").append(formatTime(zonedDateTime.getSecond()))
                            .append(" ");
                }

                trunkTextArea(LogPanel.getjTextArea());
                LogPanel.getjTextArea().append(sb.toString() +  msg + "\n");
            }
        });
    }

    final static int SCROLL_BUFFER_SIZE = 300;
    private static void trunkTextArea(JTextArea txtWin) {
        int numLinesToTrunk = txtWin.getLineCount() - SCROLL_BUFFER_SIZE;
        if(numLinesToTrunk > 0) {
            try {
                int posOfLastLineToTrunk = txtWin.getLineEndOffset(numLinesToTrunk - 1);
                txtWin.replaceRange("",0,posOfLastLineToTrunk);
            }
            catch (BadLocationException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static void log(String msg) {
        log(Level.INFO, msg);
    }

    public static void logError(Throwable e) {
        for (StackTraceElement element : e.getStackTrace()) {
            log(Level.SEVERE, element.toString());
        }
    }

    public static void writeError(Throwable e) {
        try {
            File file = new File("Error.txt");

            // if file doesn't exists, then create it
            if (!file.exists()) {
                //noinspection ResultOfMethodCallIgnored
                file.createNewFile();
            }

            // true = append file
            FileWriter fw = new FileWriter(file.getAbsoluteFile(), true);
            BufferedWriter bw = new BufferedWriter(fw);

            bw.write(e.getCause().toString() + "\n");
            for (StackTraceElement element : e.getStackTrace()) {
                bw.write(element.toString() +"\n");
            }

            bw.close();
            fw.close();
        } catch (IOException z) {
            z.printStackTrace();
        }
    }

}
