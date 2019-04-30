#pragma once
#include <QObject>


class SaveLoad : public QObject {
Q_OBJECT
public:
    Q_INVOKABLE void saveModelText(const QString& s);
    Q_INVOKABLE QString loadModelText();
};
