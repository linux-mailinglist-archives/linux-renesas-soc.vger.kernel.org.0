Return-Path: <linux-renesas-soc+bounces-9035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C0985154
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 05:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 345A7284BDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 03:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E275154444;
	Wed, 25 Sep 2024 03:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7/1SmHS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BDA14BF8A;
	Wed, 25 Sep 2024 03:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727233918; cv=none; b=S9olaqU+Ae1MXJKSo2ohbaUQpE8AAjKY+5vjakaJngemOIjI+EOyS9SprQQR06KWKEzbMUkF4/rCjuJjy55aRrf+3j1Og6w0ctg+YNsVREqhl7gKajySF33wZALJR2WJMlry6SVCVuldbzJWsLDkjPLnpfXayL7lxnqLRtkMcL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727233918; c=relaxed/simple;
	bh=jFJWLHyG2GDtDlLlGadkE9PrQYTPOgyJl1v8kcfqWBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fpjcB4xuTVBgCeTIRgShG1yaWLPXCw/xfpQtMzud1jBdILEVXIIrkhB007O27drzBKGIN5Opg0AWAVXK5eEjtK8F1e9E0pMsMaieqpiX/uxijcEwFZniJVh1ZqeKSc8UJLky0p+3c/rnVmmZqaDiI9U3rhW4zyRbouAvEIVtaTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7/1SmHS; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2054feabfc3so56475835ad.1;
        Tue, 24 Sep 2024 20:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727233915; x=1727838715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr55MRVxi+MlPMWwuSXwNd4BqHB7k/6Ez5oSHzG2iOk=;
        b=I7/1SmHSWHPpmzDPxVvBJEKCasLTllT1oYkiy/iwjd1YhZ7gNGGBSYGnVQJEkC7juZ
         bhcNunGRklW4ydUUt6dvQBON4x+PTuDsJWGZuqz3tfbmAt7u4jS2YYlGjGpHaqOsrviC
         62KGdVLK/GyzeFrHTuxRPD228ppCGzmay4QRveI7Kuhs5Cy4txr8rwrIh9uPfibRJCR2
         iU+XkqUzd34ee3r9CX9Ak90fgk+CgjgVQGZXIC2M4LW6en8yI379K26Vt/qVgfAi45yG
         ffKYHMiL6S/devBTBZOnxDwGQ039xehSkqFfOE6zzy5udp+/TV1oilMpXCBWLjhJKxA7
         4bLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727233915; x=1727838715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tr55MRVxi+MlPMWwuSXwNd4BqHB7k/6Ez5oSHzG2iOk=;
        b=T5L3NypXhKdeENpUNa1fDR+dR4HitxA16ruOGLVnGgcatAwq0d25q5MKeZU+4YP2Zd
         2gpnn0NrlXXoZAxcLwWM3cNSwSP9lpAYLybcYW58hMjW68/jaW854plMlMT3RwXSzyNX
         tgOohHEm4JZaNa7b+qEMNF9IY8PWX/fnyogEw2pcIlbJZPac0HNDl8yVlVo6Lf9h/tq/
         dC6tVCC3ctk0Bb9l9EkUj/tg2Mg2M7aIpRqqlbT5ZAQIP0e/n9ElI45DTJL6xk9cS08o
         URJiJquUReQrtRo7KIEIcGieF3VGW6chdt1uNEfvb9CiG2n0an73YnExPX15hKP7nrsl
         xBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHol0Cs+On1aT4w9uQRVPh6h3DNQTrCM0pS6+B77Ik38F6PxfATjrjt6Fh1LOdqb5Xp4F11BLDXD17ZUDlypvbNZA=@vger.kernel.org, AJvYcCUwcfAndrJONQp7/WN/xYtcVrf2fj2cWBXYWwM+QQrpaEsuKhhmv8tVB5U9f4HGWbJkrlQCtjraH7Pv@vger.kernel.org, AJvYcCUz/9Fq5G5Zd5VwfS0AqedcRXZ3RpDqSBy7fhOgLUmK+8W9MAVY49FGIg7ikpw5hPkkN9q9pPfDorgSc6A=@vger.kernel.org, AJvYcCWtgnhZ+m3xmTJ+R7AvnlEqWfWas2oK92ChfsMeH8WmT/17LBZSRlVFdiR+SSDf83BZmrzHQA3YCaAS@vger.kernel.org, AJvYcCXzuVEHoiR5vBkL0Yxy9RhzPTcJICpjBJC0kv5HDyUZ1q1k9hEsZcHWUffLmbBVwD3nquXgHsGRavGQ6gtf@vger.kernel.org
X-Gm-Message-State: AOJu0YzGlSttY9awMUzoHFUyDMjoNRLLVk5gi0Mqbm8IaZ5oeD93UM7C
	WhM0v+/BmCbARyI4yYxcZVHlkdJN6ihrhOp3nfuVea/P2szPydEK
X-Google-Smtp-Source: AGHT+IFQLa7kbK5xHzwkSGxaw2sVz5fTtKjfOqzQhXpNMBP+3fN+sE+YeZiSjvI+X/Bh6WGZpsrSmA==
X-Received: by 2002:a17:902:db08:b0:206:88fa:54a6 with SMTP id d9443c01a7336-20afc465dfbmr19961505ad.21.1727233915439;
        Tue, 24 Sep 2024 20:11:55 -0700 (PDT)
Received: from localhost.localdomain (27-51-112-33.adsl.fetnet.net. [27.51.112.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af185be0csm16054755ad.294.2024.09.24.20.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 20:11:55 -0700 (PDT)
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
To: patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 2/2] hwmon: (isl28022) new driver for ISL28022 power monitor
Date: Wed, 25 Sep 2024 11:11:28 +0800
Message-Id: <20240925031131.14645-3-yikai.tsai.wiwynn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925031131.14645-1-yikai.tsai.wiwynn@gmail.com>
References: <20240925031131.14645-1-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Driver for Renesas ISL28022 power monitor with I2C interface.
The device monitors voltage, current via shunt resistor
and calculated power.

Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/isl28022.rst |  63 ++++
 MAINTAINERS                      |   2 +
 drivers/hwmon/Kconfig            |  11 +
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/isl28022.c         | 533 +++++++++++++++++++++++++++++++
 6 files changed, 611 insertions(+)
 create mode 100644 Documentation/hwmon/isl28022.rst
 create mode 100644 drivers/hwmon/isl28022.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index ea3b5be8fe4f..4d15664bc41e 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -96,6 +96,7 @@ Hardware Monitoring Kernel Drivers
    ir35221
    ir38064
    ir36021
+   isl28022
    isl68137
    it87
    jc42
diff --git a/Documentation/hwmon/isl28022.rst b/Documentation/hwmon/isl28022.rst
new file mode 100644
index 000000000000..8d4422a2dacd
--- /dev/null
+++ b/Documentation/hwmon/isl28022.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver isl28022
+======================
+
+Supported chips:
+
+  * Renesas ISL28022
+
+    Prefix: 'isl28022'
+
+    Addresses scanned: none
+
+    Datasheet: Publicly available at the Renesas website
+
+	       https://www.renesas.com/us/en/www/doc/datasheet/isl28022.pdf
+
+Author:
+    Carsten Spieß <mail@carsten-spiess.de>
+
+Description
+-----------
+
+The ISL28022 is a power monitor with I2C interface. The device monitors
+voltage, current via shunt resistor and calculated power.
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+device explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+The shunt value in micro-ohms, shunt voltage range and averaging can be set
+with device properties.
+Please refer to the Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
+for bindings if the device tree is used.
+
+The driver supports only shunt and bus continuous ADC mode at 15bit resolution.
+Averaging can be set from 1 to 128 samples (power of 2) on both channels.
+Shunt voltage range of 40, 80, 160 or 320mV is allowed
+The bus voltage range is 60V fixed.
+
+Sysfs entries
+-------------
+
+The following attributes are supported. All attributes are read-only.
+
+======================= =======================================================
+in0_input		bus voltage (milli Volt)
+
+curr1_input		current (milli Ampere)
+power1_input		power (micro Watt)
+======================= =======================================================
+
+Debugfs entries
+---------------
+
+The following attributes are supported. All attributes are read-only.
+
+======================= =======================================================
+shunt_voltage		shunt voltage (micro Volt)
+======================= =======================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 9407481c03a2..a1531c358423 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12080,6 +12080,8 @@ M:	Carsten Spieß <mail@carsten-spiess.de>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
+F:	Documentation/hwmon/isl28022.rst
+F:	drivers/hwmon/isl28022.c
 
 ISOFS FILESYSTEM
 M:	Jan Kara <jack@suse.cz>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 65ea92529406..ad0f8c0a9535 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -853,6 +853,17 @@ config SENSORS_CORETEMP
 	  sensor inside your CPU. Most of the family 6 CPUs
 	  are supported. Check Documentation/hwmon/coretemp.rst for details.
 
+config SENSORS_ISL28022
+	tristate "Renesas ISL28022"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for ISL28022 power monitor.
+	  Check Documentation/hwmon/isl28022.rst for details.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called isl28022.
+
 config SENSORS_IT87
 	tristate "ITE IT87xx and compatibles"
 	depends on HAS_IOPORT
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 9554d2fdcf7b..4ea6f7c95315 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_SENSORS_INA2XX)	+= ina2xx.o
 obj-$(CONFIG_SENSORS_INA238)	+= ina238.o
 obj-$(CONFIG_SENSORS_INA3221)	+= ina3221.o
 obj-$(CONFIG_SENSORS_INTEL_M10_BMC_HWMON) += intel-m10-bmc-hwmon.o
+obj-$(CONFIG_SENSORS_ISL28022)	+= isl28022.o
 obj-$(CONFIG_SENSORS_IT87)	+= it87.o
 obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
 obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
new file mode 100644
index 000000000000..d7de8fbfe362
--- /dev/null
+++ b/drivers/hwmon/isl28022.c
@@ -0,0 +1,533 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * isl28022.c - driver for Renesas ISL28022 power monitor chip monitoring
+ *
+ * Copyright (c) 2023 Carsten Spieß <mail@carsten-spiess.de>
+ */
+
+#include <linux/debugfs.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+/* ISL28022 registers */
+#define ISL28022_REG_CONFIG	0x00
+#define ISL28022_REG_SHUNT	0x01
+#define ISL28022_REG_BUS	0x02
+#define ISL28022_REG_POWER	0x03
+#define ISL28022_REG_CURRENT	0x04
+#define ISL28022_REG_CALIB	0x05
+#define ISL28022_REG_SHUNT_THR	0x06
+#define ISL28022_REG_BUS_THR	0x07
+#define ISL28022_REG_INT	0x08
+#define ISL28022_REG_AUX	0x09
+#define ISL28022_REG_MAX	ISL28022_REG_AUX
+
+/* ISL28022 config flags */
+/* mode flags */
+#define ISL28022_MODE_SHIFT	0
+#define ISL28022_MODE_MASK	0x0007
+
+#define ISL28022_MODE_PWR_DOWN	0x0
+#define ISL28022_MODE_TRG_S	0x1
+#define ISL28022_MODE_TRG_B	0x2
+#define ISL28022_MODE_TRG_SB	0x3
+#define ISL28022_MODE_ADC_OFF	0x4
+#define ISL28022_MODE_CONT_S	0x5
+#define ISL28022_MODE_CONT_B	0x6
+#define ISL28022_MODE_CONT_SB	0x7
+
+/* shunt ADC settings */
+#define ISL28022_SADC_SHIFT	3
+#define ISL28022_SADC_MASK	0x0078
+
+#define ISL28022_BADC_SHIFT	7
+#define ISL28022_BADC_MASK	0x0780
+
+#define ISL28022_ADC_12		0x0	/* 12 bit ADC */
+#define ISL28022_ADC_13		0x1	/* 13 bit ADC */
+#define ISL28022_ADC_14		0x2	/* 14 bit ADC */
+#define ISL28022_ADC_15		0x3	/* 15 bit ADC */
+#define ISL28022_ADC_15_1	0x8	/* 15 bit ADC, 1 sample */
+#define ISL28022_ADC_15_2	0x9	/* 15 bit ADC, 2 samples */
+#define ISL28022_ADC_15_4	0xA	/* 15 bit ADC, 4 samples */
+#define ISL28022_ADC_15_8	0xB	/* 15 bit ADC, 8 samples */
+#define ISL28022_ADC_15_16	0xC	/* 15 bit ADC, 16 samples */
+#define ISL28022_ADC_15_32	0xD	/* 15 bit ADC, 32 samples */
+#define ISL28022_ADC_15_64	0xE	/* 15 bit ADC, 64 samples */
+#define ISL28022_ADC_15_128	0xF	/* 15 bit ADC, 128 samples */
+
+/* shunt voltage range */
+#define ISL28022_PG_SHIFT	11
+#define ISL28022_PG_MASK	0x1800
+
+#define ISL28022_PG_40		0x0	/* +/-40 mV */
+#define ISL28022_PG_80		0x1	/* +/-80 mV */
+#define ISL28022_PG_160		0x2	/* +/-160 mV */
+#define ISL28022_PG_320		0x3	/* +/-3200 mV */
+
+/* bus voltage range */
+#define ISL28022_BRNG_SHIFT	13
+#define ISL28022_BRNG_MASK	0x6000
+
+#define ISL28022_BRNG_16	0x0	/* 16 V */
+#define ISL28022_BRNG_32	0x1	/* 32 V */
+#define ISL28022_BRNG_60	0x3	/* 60 V */
+
+/* reset */
+#define ISL28022_RESET		0x8000
+
+struct isl28022_data {
+	struct regmap		*regmap;
+	u32			shunt;
+	u32			gain;
+	u32			average;
+};
+
+static int isl28022_read_in(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct isl28022_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+	u16 sign_bit;
+
+	switch (channel) {
+	case 0:
+		switch (attr) {
+		case hwmon_in_input:
+			err = regmap_read(data->regmap,
+					  ISL28022_REG_BUS, &regval);
+			if (err < 0)
+				return err;
+			/* driver supports only 60V mode (BRNG 11) */
+			*val = (long)(((u16)regval) & 0xFFFC);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case 1:
+		switch (attr) {
+		case hwmon_in_input:
+			err = regmap_read(data->regmap,
+					  ISL28022_REG_SHUNT, &regval);
+			if (err < 0)
+				return err;
+			switch (data->gain) {
+			case 8:
+				sign_bit = (regval >> 15) & 0x01;
+				*val = (long)((((u16)regval) & 0x7FFF) -
+					(sign_bit * 32768)) / 100;
+				break;
+			case 4:
+				sign_bit = (regval >> 14) & 0x01;
+				*val = (long)((((u16)regval) & 0x3FFF) -
+					(sign_bit * 16384)) / 100;
+				break;
+			case 2:
+				sign_bit = (regval >> 13) & 0x01;
+				*val = (long)((((u16)regval) & 0x1FFF) -
+					(sign_bit * 8192)) / 100;
+				break;
+			case 1:
+				sign_bit = (regval >> 12) & 0x01;
+				*val = (long)((((u16)regval) & 0x0FFF) -
+					(sign_bit * 4096)) / 100;
+				break;
+			}
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int isl28022_read_current(struct device *dev, u32 attr, long *val)
+{
+	struct isl28022_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+
+	switch (attr) {
+	case hwmon_curr_input:
+		err = regmap_read(data->regmap,
+				  ISL28022_REG_CURRENT, &regval);
+		if (err < 0)
+			return err;
+		*val = ((long)regval * 1250L * (long)data->gain) /
+			(long)data->shunt;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int isl28022_read_power(struct device *dev, u32 attr, long *val)
+{
+	struct isl28022_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+
+	switch (attr) {
+	case hwmon_power_input:
+		err = regmap_read(data->regmap,
+				  ISL28022_REG_POWER, &regval);
+		if (err < 0)
+			return err;
+		*val = ((51200000L * ((long)data->gain)) /
+			(long)data->shunt) * (long)regval;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_in:
+		return isl28022_read_in(dev, attr, channel, val);
+	case hwmon_curr:
+		return isl28022_read_current(dev, attr, val);
+	case hwmon_power:
+		return isl28022_read_power(dev, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static umode_t isl28022_is_visible(const void *data, enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *isl28022_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT,	/* channel 0: bus voltage (mV) */
+			   HWMON_I_INPUT),	/* channel 1: shunt voltage (mV) */
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT),	/* channel 1: current (mA) */
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT),	/* channel 1: power (µW) */
+	NULL
+};
+
+static const struct hwmon_ops isl28022_hwmon_ops = {
+	.is_visible = isl28022_is_visible,
+	.read = isl28022_read,
+};
+
+static const struct hwmon_chip_info isl28022_chip_info = {
+	.ops = &isl28022_hwmon_ops,
+	.info = isl28022_info,
+};
+
+static bool isl28022_is_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ISL28022_REG_CONFIG:
+	case ISL28022_REG_CALIB:
+	case ISL28022_REG_SHUNT_THR:
+	case ISL28022_REG_BUS_THR:
+	case ISL28022_REG_INT:
+	case ISL28022_REG_AUX:
+		return true;
+	}
+
+	return false;
+}
+
+static bool isl28022_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ISL28022_REG_CONFIG:
+	case ISL28022_REG_SHUNT:
+	case ISL28022_REG_BUS:
+	case ISL28022_REG_POWER:
+	case ISL28022_REG_CURRENT:
+	case ISL28022_REG_INT:
+	case ISL28022_REG_AUX:
+		return true;
+	}
+	return true;
+}
+
+static const struct regmap_config isl28022_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = ISL28022_REG_MAX,
+	.writeable_reg = isl28022_is_writeable_reg,
+	.volatile_reg = isl28022_is_volatile_reg,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static int shunt_voltage_show(struct seq_file *seqf, void *unused)
+{
+	struct isl28022_data *data = seqf->private;
+	unsigned int regval;
+	int err;
+
+	err = regmap_read(data->regmap,
+			  ISL28022_REG_SHUNT, &regval);
+	if (err)
+		return err;
+
+	/* print shunt voltage in micro volt  */
+	seq_printf(seqf, "%d\n", regval * 10);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(shunt_voltage);
+
+static struct dentry *isl28022_debugfs_root;
+
+static void isl28022_debugfs_remove(void *res)
+{
+	debugfs_remove_recursive(res);
+}
+
+static void isl28022_debugfs_init(struct i2c_client *client, struct isl28022_data *data)
+{
+	char name[16];
+	struct dentry *debugfs;
+
+	scnprintf(name, sizeof(name), "%d-%04hx", client->adapter->nr, client->addr);
+
+	debugfs = debugfs_create_dir(name, isl28022_debugfs_root);
+	debugfs_create_file("shunt_voltage", 0444, debugfs, data, &shunt_voltage_fops);
+
+	devm_add_action_or_reset(&client->dev, isl28022_debugfs_remove, debugfs);
+}
+
+/*
+ * read property values and make consistency checks.
+ *
+ * following values for shunt range and resistor are allowed:
+ *   40 mV -> gain 1, shunt min.  800 micro ohms
+ *   80 mV -> gain 2, shunt min. 1600 micro ohms
+ *  160 mV -> gain 4, shunt min. 3200 micro ohms
+ *  320 mV -> gain 8, shunt min. 6400 micro ohms
+ */
+static int isl28022_read_properties(struct device *dev, struct isl28022_data *data)
+{
+	u32 val;
+	int err;
+
+	err = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
+	if (err == -EINVAL)
+		val = 10000;
+	else if (err < 0)
+		return err;
+	data->shunt = val;
+
+	err = device_property_read_u32(dev, "renesas,shunt-range-microvolt", &val);
+	if (err == -EINVAL)
+		val = 320000;
+	else if (err < 0)
+		return err;
+
+	switch (val) {
+	case 40000:
+		data->gain = 1;
+		if (data->shunt < 800)
+			goto shunt_invalid;
+		break;
+	case 80000:
+		data->gain = 2;
+		if (data->shunt < 1600)
+			goto shunt_invalid;
+		break;
+	case 160000:
+		data->gain = 4;
+		if (data->shunt < 3200)
+			goto shunt_invalid;
+		break;
+	case 320000:
+		data->gain = 8;
+		if (data->shunt < 6400)
+			goto shunt_invalid;
+		break;
+	default:
+		dev_err_probe(dev, "renesas,shunt-range-microvolt invalid value %d\n", val);
+		return -EINVAL;
+	}
+
+	err = device_property_read_u32(dev, "renesas,average-samples", &val);
+	if (err == -EINVAL)
+		val = 1;
+	else if (err < 0)
+		return err;
+	if (val > 128 || hweight32(val) != 1) {
+		dev_err_probe(dev, "renesas,average-samples invalid value %d\n", val);
+		return -EINVAL;
+	}
+	data->average = val;
+
+	return 0;
+
+shunt_invalid:
+	dev_err_probe(dev, "renesas,shunt-resistor-microvolt invalid value %d\n", data->shunt);
+	return -EINVAL;
+}
+
+/*
+ * write configuration and calibration registers
+ *
+ * The driver supports only shunt and bus continuous ADC mode at 15bit resolution
+ * with averaging from 1 to 128 samples (pow of 2) on both channels.
+ * Shunt voltage gain 1,2,4 or 8 is allowed.
+ * The bus voltage range is 60V fixed.
+ */
+static int isl28022_config(struct isl28022_data *data)
+{
+	int err;
+	u16 config;
+	u16 calib;
+
+	config = (ISL28022_MODE_CONT_SB << ISL28022_MODE_SHIFT) |
+			(ISL28022_BRNG_60 << ISL28022_BRNG_SHIFT) |
+			(__ffs(data->gain) << ISL28022_PG_SHIFT) |
+			((ISL28022_ADC_15_1 + __ffs(data->average)) << ISL28022_SADC_SHIFT) |
+			((ISL28022_ADC_15_1 + __ffs(data->average)) << ISL28022_BADC_SHIFT);
+
+	calib = data->shunt ? 0x8000 / data->gain : 0;
+
+	err = regmap_write(data->regmap, ISL28022_REG_CONFIG, config);
+	if (err < 0)
+		return err;
+
+	return regmap_write(data->regmap, ISL28022_REG_CALIB, calib);
+}
+
+static int isl28022_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct isl28022_data *data;
+	int err;
+
+	if (!i2c_check_functionality(client->adapter,
+					 I2C_FUNC_SMBUS_BYTE_DATA |
+					 I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(struct isl28022_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	err = isl28022_read_properties(dev, data);
+	if (err)
+		return err;
+
+	data->regmap = devm_regmap_init_i2c(client, &isl28022_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	err = isl28022_config(data);
+	if (err)
+		return err;
+
+	isl28022_debugfs_init(client, data);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &isl28022_chip_info, NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);
+	return 0;
+}
+
+static const struct i2c_device_id isl28022_ids[] = {
+	{ "isl28022", 0},
+	{ /* LIST END */ }
+};
+MODULE_DEVICE_TABLE(i2c, isl28022_ids);
+
+static const struct of_device_id __maybe_unused isl28022_of_match[] = {
+	{ .compatible = "renesas,isl28022"},
+	{ /* LIST END */ }
+};
+MODULE_DEVICE_TABLE(of, isl28022_of_match);
+
+static struct i2c_driver isl28022_driver = {
+	.class		= I2C_CLASS_HWMON,
+	.driver = {
+		.name	= "isl28022",
+	},
+	.probe	= isl28022_probe,
+	.id_table	= isl28022_ids,
+};
+
+static int __init
+isl28022_init(void)
+{
+	int err;
+
+	isl28022_debugfs_root = debugfs_create_dir("isl28022", NULL);
+	err = i2c_add_driver(&isl28022_driver);
+	if (!err)
+		return 0;
+
+	debugfs_remove_recursive(isl28022_debugfs_root);
+	return err;
+}
+
+static void __exit
+isl28022_exit(void)
+{
+	i2c_del_driver(&isl28022_driver);
+	debugfs_remove_recursive(isl28022_debugfs_root);
+}
+
+module_init(isl28022_init);
+module_exit(isl28022_exit);
+
+MODULE_AUTHOR("Carsten Spieß <mail@carsten-spiess.de>");
+MODULE_DESCRIPTION("ISL28022 driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


