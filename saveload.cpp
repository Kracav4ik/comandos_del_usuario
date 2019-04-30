#include "saveload.h"

#include <QFile>

void SaveLoad::saveModelText(const QString &s) {
    QFile file("model.json");
    file.open(QIODevice::WriteOnly);
    file.write(s.toUtf8());
}

QString SaveLoad::loadModelText() {
    QFile file("model.json");
    if (!file.exists()) {
        return "[]";
    }
    file.open(QIODevice::ReadOnly);
    return QString::fromUtf8(file.readAll());
}
