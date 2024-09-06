Return-Path: <linux-renesas-soc+bounces-8753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12496E9E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B6B31F2498B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE3414A4DE;
	Fri,  6 Sep 2024 06:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="YuWBRc64"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2055.outbound.protection.outlook.com [40.107.215.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C7A13D2BE;
	Fri,  6 Sep 2024 06:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725603309; cv=fail; b=Uw9bAnaIQSKXGnBUk+L6I1oumF9Zbm9z36LqjeK05xnN2hy9yYHVGXvcq1labr44d2wFCGOTmaGbxJasYBqB+wVW6vQGCVMhRd07zCCNShtSmgTRFV7e81RWglwvuWniwhiE1EOeWL4anAW91YvVpq+SMiLk8Z3Y2rsQK8tiZiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725603309; c=relaxed/simple;
	bh=tixLFoDRlOvZFLUwjZTvhCpnTkCm3ZcNdrF51v9zfXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AW3ZE4EyxU7WI18O05I7O9mEsKIMzzOJVYSm0IJpZrdvM6Oh7JF0jLFuoWAbre3jBlIRA8IwxmbN3j9J1Hlls5oPKeNqkg+fgBd/tlVXvrcJ3lsprhqCrnSv1+jyXQZga4Mn+xGjtBzUjb2QBjKpfDLefyrXUpE0NAeuQ/4hlEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=YuWBRc64; arc=fail smtp.client-ip=40.107.215.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CguR4EIHODDpHuxvYxg2LdbnRGSXmc2jVoi+ycpRgxMNMJ30m+KJqEyv18QFR72ZIXbUTV3a4RETxSurcOByLWSWitLBORyakGxpXrKSBF0oYLp8pnOAGg9xoUT58fGPaguGMC40VLYusaY/r87S6S3Kpt5Np5Yn3vwiDAswaPdySHeeXxax38z4i6TLwwa7WdEf4pwN8cU/iATt+I/81Jk3b2exkZGKaXhQ/P34rSBZ/LI2euVDni1Ar7P5LIk5e33UcLwVw9DGErA2uDTgkn+QCMNCi1QgsQ32P1dNkHYA59FoPGi6TxgUSzxKoVdkQE7BBo5HDJZqLa53GrhUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDRNL8aqBLV1TuuBW7ADbrQVrbs0/GZw0WSSfkNDrCo=;
 b=uYzqdp/Wq5b2nUzyWbnP4RYeX3M8aLuAB9Le242UbwdlPUz8ZR9qpxevH1GbWPtW/oI1tnMIFXREtmW6SW6X4ir+FatHhyx6FLTnK0mEDPx7XYLlxgWtER2M5kV27AmpSc4KG3Dlp2oXxITo+4pNCAMVFsh5Xci/UarPfcwR6XAwKVrbIUHpzflNlx1vUrytXgvvjORzjY8+9LHVrOnKWE7C3MhQqvZxSNnxCnRrMImU1Yg0lwkgfl0TW0Ow+Q9jyJsAUY9S9l0ig2hCXfTjGbfR45/kECtuC7nApvqlSYZ2XrEB6ra1hzYw17xkjjXEf9/IMWrbCrLHJAmMpPeUIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDRNL8aqBLV1TuuBW7ADbrQVrbs0/GZw0WSSfkNDrCo=;
 b=YuWBRc64yhh3DelzsYtJZYmL56SZoUQaEv26rymJ3tJC7booIWLJ/ZpY7Jf8qcVrcB0hCu2dBV9BrzuENA4GwuLQycD2hBNOBSOXYbFU48plwXCE7Jda98eQ3rdoyAWEEFQ5VPe1i2pgc8yFknBHNsn1dueJhSkQ+xC55nEuVIMytkFozLMWvXAIB/DKOYxAC+P4LyX/WoaIQ6Zu/5Tt/cvo8HgKGPySabDdsT/tEYQOuOU8/P0RkDqJ9qg9Y2hFfD2hs2QhLxHIr28sSepSyBsWthHpHMOhH/dDYeYoHUApiynye2u59KnmVDNX73PouIPCVo8CkqjcXb/4KovnRQ==
Received: from PS2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::13) by TYSPR04MB7566.apcprd04.prod.outlook.com
 (2603:1096:400:46e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 06:14:58 +0000
Received: from HK2PEPF00006FB3.apcprd02.prod.outlook.com
 (2603:1096:300:58:cafe::ec) by PS2PR01CA0025.outlook.office365.com
 (2603:1096:300:58::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:14:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB3.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:14:57
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 3/3] hwmon: (isl28022) support shunt voltage for ISL28022 power monitor
Date: Fri,  6 Sep 2024 14:14:18 +0800
Message-Id: <20240906061421.9392-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906061421.9392-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906061421.9392-1-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB3:EE_|TYSPR04MB7566:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8083e210-0cb1-4277-f37c-08dcce3b3b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xJ1dcAzHoWRcg17izxydOxFC8LyyC0oha+hyfedD2M6JbmGfsEJ9VXNwmom3?=
 =?us-ascii?Q?eZfBwQv1DLkpHPwwatrTPMG4INjMiOmM05dBsxbVL0goQcHbKGxbvL73kY+a?=
 =?us-ascii?Q?/ROw5xuQBVAZm+1JT0vJN28Nvd9e8QsUfJnrim2j5guo7pjmC1vD5hfzoFrH?=
 =?us-ascii?Q?N/OZeP3RAlRn1T4tgoV1CFqvSxWUR9SkeOyY7XxQ3udU5Kzfe7eUqbasxvpp?=
 =?us-ascii?Q?0oLyi8iziN0rUfALGbFhIWa4z1IXii2GYcJZpdACX1M2brcruGPYBoEhkYdQ?=
 =?us-ascii?Q?rzYCCG+1boedTRYLYwWX+b66NfJo9fO8eW00cVgWeJhRllE2x9mPc35GtUfH?=
 =?us-ascii?Q?ZPM0Pje1HvY5Ie/RQLaMQ/3r6QsxKQGUuaij7nWLzCxuyDLylwQN6+SuFEny?=
 =?us-ascii?Q?Y2XlUxWbRL9tuU6NpCOONl7CToI1bnS8ogEpTA/snMVsbnlhAmc8rOsnBofN?=
 =?us-ascii?Q?VN7s44qXgWgZ0UeV9siS0XfDFu+KUVSq1an3ENQjPAYghqH3DS/QVvLLgmNq?=
 =?us-ascii?Q?yY3SJTNYt1AxMy0sG4/pM8xWXzUO+gXw1vhZqr6hIxcqiyOkjRJVTPzC0nGP?=
 =?us-ascii?Q?QLBen0AzkaJK+94pnCuYTzJFGC0uJy1mt15CLC6Xu4xr3o4EWmst+j7u7URe?=
 =?us-ascii?Q?W1RncRCvmn5M++/uDdQXXQ3gcIIPzVwX1YgQIZjfW+gSUXQ/FkHVeclnMe8e?=
 =?us-ascii?Q?hFHocluoXTz9lIGLqZOblFuG81wjaP0Ru9WVH8XqgMzrGplGOWlBVC2pSKmU?=
 =?us-ascii?Q?A1a2VrIPyFc8ilwH3GjSmt7Llc6KEUK6PISl/UD4wTE7xZlYmhQ6dptLEPiE?=
 =?us-ascii?Q?ZrNRVi+CXybIJ6XyZl4+obhlndx4ccMPbSiwQYFm6c7ZzPl9k51hPBQT+EnV?=
 =?us-ascii?Q?uROPhTpRwuU0kMzDYzcT4eFjTu7JT3Qg3gspf5wg0c1c3T8B5oDJQW3C08tT?=
 =?us-ascii?Q?ZLXB9ak6zbLCMmhNqACX8x+y8TeCOv0Lf3p8ZeDHbL4CTIoUj07IcLjE/1Pm?=
 =?us-ascii?Q?C9kylo93YgF9/8afaZiSnTfT94FPTz4X83kuyJwtWzesLUrRWMF+7jH+T29E?=
 =?us-ascii?Q?V+4aO2XTuL9nBqYooQ+f1HjwgsTWF8OGsiglAbDppR9NLJqNtwQaQ+DASrEK?=
 =?us-ascii?Q?vp5WOCXenbgDz5Pi/Pu805Gsv2GyeVKds0kqMyAtG5ld3SM6i0s2kQYXu6Ca?=
 =?us-ascii?Q?p3UevqgOpcplc/IrDzEQHQZpjG4Iu4lnxky5twPtARNdqACJV6PhUiVjIZsJ?=
 =?us-ascii?Q?dAAh4/vXRFp8al18j+7+HGHXZpxgRUlvkOYploqESlGN1eV/Iq3VYGGlCOVE?=
 =?us-ascii?Q?ocu1QueAqMp67zor+PUnLLoJJpSY4fW9uCe1W2CELAm6rubZ5qaofEoUXiZC?=
 =?us-ascii?Q?btR2I3E5+QUCkvKwYvnbrZVIJaXN85IZMwKiDnOWPTbLXF/hnexTIiCyat+2?=
 =?us-ascii?Q?HDA8gPH85Us6myz1i0n9UiwlpQuOY7D4?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:14:57.4939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8083e210-0cb1-4277-f37c-08dcce3b3b96
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7566

Added support reading shunt voltage in mV and revise code
for Renesas ISL28022.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 drivers/hwmon/isl28022.c | 93 ++++++++++++++++++++++++++++------------
 1 file changed, 66 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
index f0494c3bd483..01220fad813d 100644
--- a/drivers/hwmon/isl28022.c
+++ b/drivers/hwmon/isl28022.c
@@ -85,8 +85,6 @@ struct isl28022_data {
 	u32			shunt;
 	u32			gain;
 	u32			average;
-	u16			config;
-	u16			calib;
 };
 
 static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
@@ -95,20 +93,61 @@ static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
 	struct isl28022_data *data = dev_get_drvdata(dev);
 	unsigned int regval;
 	int err;
+	u16 sign_bit;
 
 	switch (type) {
 	case hwmon_in:
-		switch (attr) {
-		case hwmon_in_input:
-			err = regmap_read(data->regmap,
-					  ISL28022_REG_BUS, &regval);
-			if (err < 0)
-				return err;
-			/* driver supports only 60V mode (BRNG 11) */
-			*val = (long)(((u16)regval) & 0xFFFC);
+		switch (channel) {
+		case 0:
+			switch (attr) {
+			case hwmon_in_input:
+				err = regmap_read(data->regmap,
+						  ISL28022_REG_BUS, &regval);
+				if (err < 0)
+					return err;
+				/* driver supports only 60V mode (BRNG 11) */
+				*val = (long)(((u16)regval) & 0xFFFC);
+				break;
+			default:
+				return -EOPNOTSUPP;
+			}
+			break;
+		case 1:
+			switch (attr) {
+			case hwmon_in_input:
+				err = regmap_read(data->regmap,
+						  ISL28022_REG_SHUNT, &regval);
+				if (err < 0)
+					return err;
+			switch (data->gain) {
+			case 8:
+				sign_bit = (regval >> 15) & 0x01;
+				*val = (long)((((u16)regval) & 0x7FFF) -
+					   (sign_bit * 32768)) / 100;
+				break;
+			case 4:
+				sign_bit = (regval >> 14) & 0x01;
+				*val = (long)((((u16)regval) & 0x3FFF) -
+					   (sign_bit * 16384)) / 100;
+				break;
+			case 2:
+				sign_bit = (regval >> 13) & 0x01;
+				*val = (long)((((u16)regval) & 0x1FFF) -
+					   (sign_bit * 8192)) / 100;
+				break;
+			case 1:
+				sign_bit = (regval >> 12) & 0x01;
+				*val = (long)((((u16)regval) & 0x0FFF) -
+					   (sign_bit * 4096)) / 100;
+				break;
+			}
+			break;
+			default:
+				return -EOPNOTSUPP;
+			}
 			break;
 		default:
-			return -EINVAL;
+			return -EOPNOTSUPP;
 		}
 		break;
 	case hwmon_curr:
@@ -122,7 +161,7 @@ static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
 				(long)data->shunt;
 			break;
 		default:
-			return -EINVAL;
+			return -EOPNOTSUPP;
 		}
 		break;
 	case hwmon_power:
@@ -136,11 +175,11 @@ static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
 				(long)data->shunt) * (long)regval;
 			break;
 		default:
-			return -EINVAL;
+			return -EOPNOTSUPP;
 		}
 		break;
 	default:
-		return -EINVAL;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -182,7 +221,8 @@ static umode_t isl28022_is_visible(const void *data, enum hwmon_sensor_types typ
 
 static const struct hwmon_channel_info *isl28022_info[] = {
 	HWMON_CHANNEL_INFO(in,
-			   HWMON_I_INPUT),	/* channel 0: bus voltage (mV) */
+			   HWMON_I_INPUT,	/* channel 0: bus voltage (mV) */
+			   HWMON_I_INPUT),	/* channel 1: shunt voltage (mV) */
 	HWMON_CHANNEL_INFO(curr,
 			   HWMON_C_INPUT),	/* channel 1: current (mA) */
 	HWMON_CHANNEL_INFO(power,
@@ -368,24 +408,22 @@ static int isl28022_read_properties(struct device *dev, struct isl28022_data *da
 static int isl28022_config(struct isl28022_data *data)
 {
 	int err;
+	u16 config;
+	u16 calib;
 
-	data->config = (ISL28022_MODE_CONT_SB << ISL28022_MODE_SHIFT) |
+	config = (ISL28022_MODE_CONT_SB << ISL28022_MODE_SHIFT) |
 			(ISL28022_BRNG_60 << ISL28022_BRNG_SHIFT) |
 			(__ffs(data->gain) << ISL28022_PG_SHIFT) |
 			((ISL28022_ADC_15_1 + __ffs(data->average)) << ISL28022_SADC_SHIFT) |
 			((ISL28022_ADC_15_1 + __ffs(data->average)) << ISL28022_BADC_SHIFT);
 
-	data->calib = data->shunt ? 0x8000 / data->gain : 0;
-
-	err = regmap_write(data->regmap, ISL28022_REG_CONFIG, data->config);
-	if (err < 0)
-		return err;
+	calib = data->shunt ? 0x8000 / data->gain : 0;
 
-	err = regmap_write(data->regmap, ISL28022_REG_CALIB, data->calib);
+	err = regmap_write(data->regmap, ISL28022_REG_CONFIG, config);
 	if (err < 0)
 		return err;
 
-	return 0;
+	return regmap_write(data->regmap, ISL28022_REG_CALIB, calib);
 }
 
 static int isl28022_probe(struct i2c_client *client)
@@ -396,8 +434,8 @@ static int isl28022_probe(struct i2c_client *client)
 	int err;
 
 	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_BYTE_DATA |
-				     I2C_FUNC_SMBUS_WORD_DATA))
+					 I2C_FUNC_SMBUS_BYTE_DATA |
+					 I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
 
 	data = devm_kzalloc(dev, sizeof(struct isl28022_data), GFP_KERNEL);
@@ -418,7 +456,7 @@ static int isl28022_probe(struct i2c_client *client)
 
 	isl28022_debugfs_init(client, data);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, "isl28022_hwmon",
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data, &isl28022_chip_info, NULL);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
@@ -437,8 +475,9 @@ static struct i2c_driver isl28022_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "isl28022",
+		.of_match_table = of_match_ptr(isl28022_of_match),
 	},
-	.probe_new	= isl28022_probe,
+	.probe	= isl28022_probe,
 	.id_table	= isl28022_ids,
 };
 
-- 
2.25.1


