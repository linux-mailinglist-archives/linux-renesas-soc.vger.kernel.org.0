Return-Path: <linux-renesas-soc+bounces-8751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB6D96E9D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8F911C233F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9524013D53D;
	Fri,  6 Sep 2024 06:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="G6XpT2Bp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2042.outbound.protection.outlook.com [40.107.255.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C9F12CDBF;
	Fri,  6 Sep 2024 06:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725603298; cv=fail; b=ksfDu+xX1j2+JmSvurLfQNvAXj0ars6TnkTk6RXfKYQTJmF027tNCSZABLrl9cjZT6yS4YzTjZP2wzoswVhEme/5j0pl4bquE6C83MVQQGGdzHnt8M8svhVSb914nmqg3S+hJCSyQEFPzDmVPjEONpCXeCssb6glIOgZoXbtNX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725603298; c=relaxed/simple;
	bh=KXJ3sx2SMSQUXAA6dYszmvDTZTWlzrzxgUlyFJDTLXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISfH/YhaF3W5hxH+23TFaRbLCFfr5kuZX6gjNeqa/xQygCBEj3J5sCF2Ge6U+20Ja+/RmruObQiFX8DfG2aEM5RTO/KLpQNToPDqZmJYIlUXbLL30V1D+i8Uey1cGRYSu5L1oxDDS4/9COauw8O7O6H3HxYaRL2qw9IxXQ7xkeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=G6XpT2Bp; arc=fail smtp.client-ip=40.107.255.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NieXIwEdvy5XXlUFMfYgqz7K9neJFb7yfBTWKaoXEyjTiRkP22o4F2nIvk1wQQkhNyY+Rxxl9J96nc7OjBiydyl1OnQNq2YauhvmrpMhb1c1qkb4sKe0ViK87f4wcJT5cMhkfIrrfpHEYKKZaFY50bR2kKthWiGX5dlVEea7UzVVwYBrLIxSv8QtTtlj8uHEMPosyu9fI4/5WiVXvoizaNnuYRAHdyXt0kfBHKvfYTzCl9d3oRHFBI+iZn8f5p6rD6ZoNNO1JqFDB93TyQw3jZTW+xPon2TJS7EwAwVsWk2Lj5DxymYFY0/1NwbjxYbRRvmknW0fpvdAgTt362ZaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7ucJlfrlg+2C/BO13Tzapl5mJ5uI4gnw8ddYiin3aY=;
 b=HmvgRcZ16hsPLwJQtoWP3g5moalnERAygQwQCp3ZZvfao5AFrRzLjgrtjZU0i1kqPUU0GhfugGUa+geFwieY144NQgRxKusRpTr9WIJtnj6ppJvbRFeGj2mLSn0TKkijjNVoP8IgfZqaiax71SJ1gYRnoKXpDf1sSR2poPVE44xhoZuG6Ex/m+uF05mDkOiwFk5zcSwEwOyhn754XpVBaeRhuCPm5PA18VyHKMhSfy44V4NnX3Q/cO/7Js1UH33S7l3AehzHBhTdGBSfcNK0OQFHqpXsIOF4B1gmvKc8f7jrKcPH0b1tK4X2J1e5D6dTokfPYv0aePYWzZRpD8dqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7ucJlfrlg+2C/BO13Tzapl5mJ5uI4gnw8ddYiin3aY=;
 b=G6XpT2BpqFH++n2iju806hbVoJPlR64shD16Z7DTHOJIEA3GJ/mhXU/27dYUfQdMxePz0IIYuCYIAKeDppEP5uTN1scBk5J2ir4hYdQ6WJtq1yGvS1op/xN5VpfZHN2+/NkOoKsOW0qsQIcbUOKkhKObI81A0sbtNa3rNKB9Arj9mYpfvf+lAzAZPy9KAjiWUv5EYHOZb3W4XICZogsOIBfDYL1z1clnqEg2RnRCsFLYq44TJJPjTskrzB4DXralcZ7ftu89bxp2TJs0iEUaUIBNcZrwciP2IpRP5d6yjWtef/p6i5sKo5O6iiIeJeGqOMkstsVOd1ZEHXpUU68q+g==
Received: from PS2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::19) by JH0PR04MB7252.apcprd04.prod.outlook.com
 (2603:1096:990:37::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:14:49 +0000
Received: from HK2PEPF00006FB3.apcprd02.prod.outlook.com
 (2603:1096:300:58:cafe::df) by PS2PR01CA0031.outlook.office365.com
 (2603:1096:300:58::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:14:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB3.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:14:48
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 1/3] hwmon: (isl28022) new driver for ISL28022 power monitor
Date: Fri,  6 Sep 2024 14:14:16 +0800
Message-Id: <20240906061421.9392-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906061421.9392-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906061421.9392-1-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB3:EE_|JH0PR04MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: b0956ca9-daaa-4619-18fc-08dcce3b366e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z21qNFNqc21BY09IZWFwMEhmdWExdXQvYklBTFhKNEtXQi8vSStYYjJ6WkJh?=
 =?utf-8?B?NkhWdUp1OUN2cTRtd01IZC91NmhqQ040eEZjMm8yZ2NXbEFqdFB3TUg3OXdX?=
 =?utf-8?B?V3pRcU5UdFFDQm9WSnJUTVlYbmJYam1xazdXcGRMNGt0Z3JQaEkzZFFBbkVG?=
 =?utf-8?B?anVheEFFcytLZVY4WDladUFTbmZrNTc4MnZmTGxWUnRURU5FZmFJOHpVUm5R?=
 =?utf-8?B?Ry85QlZKZEthTHJhY0ZHVzBDVld6eFpEWFBESmNtanFsWTZHWE9ZVWFBU0VU?=
 =?utf-8?B?TlZodmpjczVBTStyd0lERTNOSXhMbEU3Q1JYNkg4akl1dU5BVENTcE8zMDVN?=
 =?utf-8?B?VlYwVU93RytLZFZEa1AxZ3FncnZFVVVmTSsyMXJHbUVpSXltNzNsQ1plODgy?=
 =?utf-8?B?cmIwaWQ3aGtjZXlZV2JOcTZiZ3hTQkJReS9sb1lFdElnOVU5TExua1NxRXov?=
 =?utf-8?B?SUYrampMUWo1cTlOcE5ZQjZlaHUwZUNBV2t6Zks3b2JSVTRsWkN4bVFESUNO?=
 =?utf-8?B?d2JpZXh6QkJjM1hFSktodFRVV1hyZkZHSnV4WVROeTllNjU2TVAxaFdmVzdK?=
 =?utf-8?B?eTlNYmdWcTMveGRBRklEWFVteEhxNHpjWVZaVHlrbWE0YmVGaFVxSkV6OWRL?=
 =?utf-8?B?N0k5VlNmUnJrVW5Tc1BFN2c3dTlPQzdDMG5iNkZlVEhBeUs2b2pZdVFSeHBV?=
 =?utf-8?B?ZXR6WlphZC9hd041VFRsak9XTXJSVTIrZklac1F4VHB6cW5vdUdrSVNDSzVo?=
 =?utf-8?B?bHJVTEl1Sm5LRmtFUjVqZXlKaEJoYVZobDBQY2VjbW94RnEzWVdXVFJURTdE?=
 =?utf-8?B?R3d6bTRXeFh6S0ZxcjNLVUZ2Q1ZPT2t5Yzdlc2tsMzA5cXBvTTJvOVBNOFBM?=
 =?utf-8?B?WG1hd2tnU3ZIM0pkblNtc2dSYkd1T1RLUFR5V3ptUkJDZGk0L2JoSFNZcEpV?=
 =?utf-8?B?R1Z2eXNkM28yR0JzM1VkSWxOZFBHaHBFbW1SR3VVdXdLcTVFU1Q5UEhhTXRH?=
 =?utf-8?B?WG5ycWUvWDNvQXRHc0pnd2tWTFl1SU5JVjk4N0J1eEs0TWRtTlZ0Zkd3a3o1?=
 =?utf-8?B?TE1hYUErN3FwUG96RnVzc1BON3FPeGJrM0E0aTUyR01pRDQ0VUgzZ0pTVTJ2?=
 =?utf-8?B?MEk0MG1zekYrVE9TMlQ5alg3Y0Y4bXJGeDFtM3lKMjRMZi9aVTBDNGhUYkZi?=
 =?utf-8?B?L1AwL1JMY3QrVi81RTVpMXdLY2lBZkxldnFDUWl5ZklENitxWm1oejJTdk5Q?=
 =?utf-8?B?REdQMGIveCtzNlRKOVVoUlUvVXRxd2Y0c3BwdGFDR1ozcjBrNHpzTkRWL3dD?=
 =?utf-8?B?dnFaUUpUeFNlcVoxNWd6MWhYakdBNE5CdWhvelBQZ1dpQTViTlBNaWtzYXFr?=
 =?utf-8?B?ckNKZTZlVkc0WmxLY3lHQXVJUnhHenBGc3poaklKZjFkTVppSXFUcmhOdExq?=
 =?utf-8?B?NzhqcHVGVm13MEdXZmtvNkVUYzN0WTJDRE4xUFM5RjVPWnR0Q0k3ekJ2OUNL?=
 =?utf-8?B?YzNWdkF0OWM1UXBmQjNiTnVoSGhkb3Y2emkycDVya2dtZUo1bkNKelF4VXls?=
 =?utf-8?B?dldqQTZSMkRncnlWajB0MitVWk9ZVFM0cUxBLy9jeDBkWmtpT2NaL0NwazZP?=
 =?utf-8?B?VlNZcnpOZEVWei8waGtSQWo3RDNYUGZhK2pIZXFPMFlkMG56dzI1K2NRcG1x?=
 =?utf-8?B?OHIwbHRmUGEzVURza1FsaVdCYlBsY05RaktEY2l1bFN1YmF3QU5aS2liaW5k?=
 =?utf-8?B?M01CVjRkTmc3ZklOWkhLSkpFNCtoMnM3aFlHc2luMTZGWXBreHNqam5xUjk3?=
 =?utf-8?B?WENpV1QrQzc1dHZlZXBmekU5RXE5ZjNNeHloZWFPVGxNVWFIZG1kd0tjREtN?=
 =?utf-8?B?VVEzMnNjN1VDS0hTa211TGVrd0FHRzh2YnBySTgwWGZTYkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:14:48.8532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0956ca9-daaa-4619-18fc-08dcce3b366e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7252

From: Carsten Spieß <mail@carsten-spiess.de>

Driver for Renesas ISL28022 power monitor with I2C interface.
The device monitors voltage, current via shunt resistor
and calculated power.

Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/isl28022.rst |  63 +++++
 MAINTAINERS                      |   7 +
 drivers/hwmon/Kconfig            |  11 +
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/isl28022.c         | 471 +++++++++++++++++++++++++++++++
 6 files changed, 554 insertions(+)
 create mode 100644 Documentation/hwmon/isl28022.rst
 create mode 100644 drivers/hwmon/isl28022.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 913c11390a45..ba297c43d902 100644
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
index fe83ba7194ea..d39199ed51da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11932,6 +11932,13 @@ F:	drivers/isdn/Makefile
 F:	drivers/isdn/hardware/
 F:	drivers/isdn/mISDN/
 
+ISL28022 HARDWARE MONITORING DRIVER
+M:	Carsten Spieß <mail@carsten-spiess.de>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/isl28022.rst
+F:	drivers/hwmon/isl28022.c
+
 ISOFS FILESYSTEM
 M:	Jan Kara <jack@suse.cz>
 L:	linux-fsdevel@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index b60fe2e58ad6..adbbbb128afc 100644
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
index b1c7056c37db..51132b2b2c07 100644
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
index 000000000000..f0494c3bd483
--- /dev/null
+++ b/drivers/hwmon/isl28022.c
@@ -0,0 +1,471 @@
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
+#include <linux/slab.h>
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
+	u16			config;
+	u16			calib;
+};
+
+static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct isl28022_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+
+	switch (type) {
+	case hwmon_in:
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
+			return -EINVAL;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			err = regmap_read(data->regmap,
+					  ISL28022_REG_CURRENT, &regval);
+			if (err < 0)
+				return err;
+			*val = ((long)regval * 1250L * (long)data->gain) /
+				(long)data->shunt;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+			err = regmap_read(data->regmap,
+					  ISL28022_REG_POWER, &regval);
+			if (err < 0)
+				return err;
+			*val = ((51200000L * ((long)data->gain)) /
+				(long)data->shunt) * (long)regval;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
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
+			   HWMON_I_INPUT),	/* channel 0: bus voltage (mV) */
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
+static const struct i2c_device_id isl28022_ids[] = {
+	{ "isl28022", 0},
+	{ /* LIST END */ }
+};
+MODULE_DEVICE_TABLE(i2c, isl28022_ids);
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
+		dev_err(dev, "renesas,shunt-range-microvolt invalid value %d\n", val);
+		return -EINVAL;
+	}
+
+	err = device_property_read_u32(dev, "renesas,average-samples", &val);
+	if (err == -EINVAL)
+		val = 1;
+	else if (err < 0)
+		return err;
+	if (val > 128 || hweight32(val) != 1) {
+		dev_err(dev, "renesas,average-samples invalid value %d\n", val);
+		return -EINVAL;
+	}
+	data->average = val;
+
+	return 0;
+
+shunt_invalid:
+	dev_err(dev, "renesas,shunt-resistor-microvolt invalid value %d\n", data->shunt);
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
+
+	data->config = (ISL28022_MODE_CONT_SB << ISL28022_MODE_SHIFT) |
+			(ISL28022_BRNG_60 << ISL28022_BRNG_SHIFT) |
+			(__ffs(data->gain) << ISL28022_PG_SHIFT) |
+			((ISL28022_ADC_15_1 + __ffs(data->average)) << ISL28022_SADC_SHIFT) |
+			((ISL28022_ADC_15_1 + __ffs(data->average)) << ISL28022_BADC_SHIFT);
+
+	data->calib = data->shunt ? 0x8000 / data->gain : 0;
+
+	err = regmap_write(data->regmap, ISL28022_REG_CONFIG, data->config);
+	if (err < 0)
+		return err;
+
+	err = regmap_write(data->regmap, ISL28022_REG_CALIB, data->calib);
+	if (err < 0)
+		return err;
+
+	return 0;
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
+				     I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WORD_DATA))
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
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "isl28022_hwmon",
+							 data, &isl28022_chip_info, NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);
+	return 0;
+}
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
+	.probe_new	= isl28022_probe,
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


