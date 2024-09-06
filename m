Return-Path: <linux-renesas-soc+bounces-8752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE396E9DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57253B231F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE9614264A;
	Fri,  6 Sep 2024 06:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="DUEuwVfH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2074.outbound.protection.outlook.com [40.107.117.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032FA13D8B5;
	Fri,  6 Sep 2024 06:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725603300; cv=fail; b=YJUfIi9z/ROQTSGGI6DcmFJQD9wkY2ED2LkvhQsQl6/geCrjPIF4KovHCWcXO+5VrLxxwuqxffoJsiyrMAkJmOO5VKyssbWeds3+RPeAlO+ulQwxrzTWC869w/6ogTPx5L6a83qY7wJS8dyWVY2yNxoRDdqhRQ3gCanNDZfCEi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725603300; c=relaxed/simple;
	bh=uXRTK5E/ZkYd/IejJmeE/1meXCAlHODbEcF6DbfbFAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=De3hlIaMy8yTK3978P4s5eA6vPfm7jscqKVl5dNcmqAUNTNnpVcHCw1/Ctcq/9XNbs2kaKtSSIiCb2xTIhuZ+YbIYt8N+RVZ/crTXCMytbp7I93Uu/azB+6OD2fuVfJoGiFqr4YhU1Ib2QQcaaFD0kcNOVdOwD1dcM2Mjp1BZj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=DUEuwVfH; arc=fail smtp.client-ip=40.107.117.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXFA8u4TaMiSq+ut2vtgcxQG5/Jbi9yWj0GGord/9TQMzIXhZjlVjb7Hp1M3zgpRkAfsJP7TqgCEtc9nmbTuL/KYMuX/dtyxpCRP026TT//6r4HB+TD/OAPTUJ0GgWWCzGXvX3tR1kGDyivXQx+F12CV/J9fDYQfHHLnZgkhX5M33Clnfy7uQZoiduAjQg3NvClUMY5mscT9b5R/9fSSA9YqNe+wMhPiC+WFfviUCsxZ/+fVfSaJ7wSohv5kkq898qzUUEeDmdNFd0RV3GSYATrUHPcSL6HEjQM1Z54JZJjCcAmc+PFiSO4Vc+I6xfYIaZ8Bqrci1jTzPvUA0ZWbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjSPiGVt5mrfI/V12S/7TXpE76spvcLvJ8nRI8PHiHw=;
 b=glprz1sPMyBsWD2yMLpPv3k20GcLYRLTnJ2X6a7F7ffUfWQ/ejALqHSV9b3V8mK1NiWzi4oejua+XeEpZxMBwuUucxgGAHbnQ5kTb1VFb7/BqKQ3actI1sFMDoe/SeS0G9nVgaQ1BSpyU57j+HTCv9zGWdOGhEDx7ofASlBh8QDYmvnksGyYhnw1MKb3FnGAJLG9bx5c6W9/GEGoJ+M/iJc1yPZ3JyqC7wy/Rl0Xs/d3sKKf/vCau3cxMYxrLeJ/w5eH9dtiYngUeR9UxwK/LjakeurOdl+nhOgCGxV16RL+h5EusfIjlsXC13mQZI2V/dsPQvwCuBO1+YzPkjOdrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjSPiGVt5mrfI/V12S/7TXpE76spvcLvJ8nRI8PHiHw=;
 b=DUEuwVfHN3TOKzjRBVbeaQGpZx65RZve3TRwi1JNQfKw/TUI1v9zm3+TmHrBdHhjh2dBQcrAM8vW9EEs9j9wmnEo3xjd6gEE4RVy8dH3AjDCaq7BDXZmr5QiGeCprzJduOkNtxAISB7Ae5TAI7KY+kpp813b/4qMqWzJQpoYfwIn8qTaA0tSTmKBCGum+2o3lKUdbCvaIW9SSjRMRQcUf72aPqz7Pkbuw/L/Q9mZNWzlFSRXVQ56YVTWXLuqN8PYSa57S4gSOOi7kZqlZkfCT6cC6nPiKY4ARwuu0TGGGF6rO1sNQouB/qKPS0Ssbhl8Z1T17K1fkvHV5Rfjg1pnzw==
Received: from PS2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::28) by KL1PR04MB7163.apcprd04.prod.outlook.com
 (2603:1096:820:f9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Fri, 6 Sep
 2024 06:14:53 +0000
Received: from HK2PEPF00006FB3.apcprd02.prod.outlook.com
 (2603:1096:300:58:cafe::15) by PS2PR01CA0040.outlook.office365.com
 (2603:1096:300:58::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:14:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB3.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:14:53
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 2/3] dt-bindings: hwmon: add renesas,isl28022
Date: Fri,  6 Sep 2024 14:14:17 +0800
Message-Id: <20240906061421.9392-3-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB3:EE_|KL1PR04MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 873b3221-1d01-4095-23b6-08dcce3b3900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzEvblR2ZWhDK1FGaGVndVhXSG42bytiN3lJWFBGMnRTZUp2Nm8xUy9UdXBJ?=
 =?utf-8?B?YStHQmZNYVJGT1N6YUtYR3p1cWRnc2NNK2l0cjBFU1VvcWxjdlc2Szdmekcv?=
 =?utf-8?B?dTBYTUVJTUd2OC9jRlFnYlZxYkhtazZjcFl0MlZQLytCQmNSSU93WHdMUjJm?=
 =?utf-8?B?TVBjQUEyQU9BWDR0UHlBNmNaSHhzK0xLTUxVbjdIR0JGcWZpWUVVMWdQaVdl?=
 =?utf-8?B?aXpBWlhZeWhic1E4MnYvMDFJZnVubmc1dXluQUZCMlN2eVRpdk45VDY1OGVr?=
 =?utf-8?B?elRrb2d1aktuVlkySHpoWitGdHM1dHY0SXpmZXI4anlVS0s5OUtWT1VvUk9D?=
 =?utf-8?B?TnB5WkdRNGJ0SFVsMFBvd05BSmc2SXhtVDRRbmNUa2FmTWFQUzJJS0U2bjJi?=
 =?utf-8?B?N3lkaUVBZUNUZ3h3OG41NmJrd3c1cWkvT2ZDRVZPaHhjeEttTkEvS2pXZUJB?=
 =?utf-8?B?QjVpYk53ek5iVks2SEFGNXVTMjgxVTVQRk9rblBCMzl2WittbENucWJJeFd3?=
 =?utf-8?B?TDJmM1NxYVBqSGk3VkZyR2g4Q2pwTEFtbXoraWJOaVBlQ0UrY1JkbUZFUGJh?=
 =?utf-8?B?MEVINC9VWEdEYnFCUFF6Z3RzbVd4T2VKSzg2K01HNEdjd3RQVENuakNCQXl0?=
 =?utf-8?B?NG9JQjZmeWZPS05xZFRzQ3BYaysyNitZMnIyQWYyR2FFZkJaS21Wc2lvMEFY?=
 =?utf-8?B?dG90QjM0VDFMUS9WekV4MUYybkNtOXlnK2h1VUgwRXU1cTdLWkkvSVZFb3k4?=
 =?utf-8?B?VEliUXhubGFzcHV4SHdFQnA0WStFVU1talhQVGpPYVc1dU1LSTd4bk41RDNQ?=
 =?utf-8?B?Sm9ENXlWVldjQ0V2U3E0NlR4QTFRKy9Nbk02WHAxZ1k0cWFMR2psMXQ1Q3E4?=
 =?utf-8?B?bTNIaCt2N3cxd2swWk9NZjZ5aVp4K3o1WnlObnNXSmJlZ2ttM2kzcHVCdS9O?=
 =?utf-8?B?cTFMTGx0dWhaS29DemhTdWhaU0RGSGdOaGkxdVVGZmZDUUJNbDNpbHh0YmRS?=
 =?utf-8?B?bWtkRS9pT0RORjFORmg2R1B4Z3FJK3dRQ0xUbDg3NkFIUXZzVzEvYUVXRktF?=
 =?utf-8?B?dTgyMnFteFlLN0FZQ1duelU4d2s2SG5CR0RuYWVraXV2T1RZaFVWcm1LMTdh?=
 =?utf-8?B?eXhNNzZvdTJRUE5DMHFqdndsRVpJUzlZcVYycW5VUURidzZ6S09mOUlyVjJa?=
 =?utf-8?B?dkJOUHRHQkwrZHdUTjBRWG40Um5UQjNpREdEeVlnU1U4WGFTTEtqQ1ZKUXhy?=
 =?utf-8?B?QzZrLy9aM3ZvZUlEd3pvZlhpeG5oVUVrR2pLdmdXZVY1OXRGb3lYekZNbGo1?=
 =?utf-8?B?ZjhkOUljRExiQTE4Q1JGdVh0YVBUWXZuelhyWnhSYTVpZTJDSlN0ajc1cmR1?=
 =?utf-8?B?VmRsSU0yQ29xcDdQdGpWZ3JubUdiQjhld3JOZjJmUkw4ZSttWWgyOXdvemsr?=
 =?utf-8?B?R2dmcWwxKzZpKzBMVVBucDZPeDFzbll2Tm5HMVJJNnZoTHYrdGhrb0tVcDk5?=
 =?utf-8?B?NmhETjF2eHQ0WUxqRFluVzVINTJIWnp5RW5oSGxRcXpvcnlHQm1iTkY3cDRE?=
 =?utf-8?B?S3lSQURaM0dFQTBEdnJVellVMkxzMzJxMm5ta2poZ1JjT1lpNnVuaEZIN1VX?=
 =?utf-8?B?cGFWQXl3bmUyL2tnbHJtMUhsdlY0UDYrUUJTWm9VY2wvRmRBTmN1MjNNWFJa?=
 =?utf-8?B?b2dNbGtoeFc4elRRMTNheHRuUmJZVGJKYW9vT0ZSTlZiY3RvdU0yZlBkZGV1?=
 =?utf-8?B?SjIxRFdYUEh5SWh4MjI1a2tKbUh2R2IvWnVObWRtWDE0bGlxeUs0Y2V0c3hv?=
 =?utf-8?B?cEZNNTFyZjNzaEhZbmU5Y2dGeDhYeE93bEFHQUw1ZkhNdGtVWC9MRExETTd1?=
 =?utf-8?Q?sWyt6thOQSQNQ?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:14:53.1501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 873b3221-1d01-4095-23b6-08dcce3b3900
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7163

From: Carsten Spieß <mail@carsten-spiess.de>

Add dt-bindings for Renesas ISL28022 power monitor.

Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/hwmon/renesas,isl28022.yaml      | 64 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml b/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
new file mode 100644
index 000000000000..dd82a80e4115
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/renesas,isl28022.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas ISL28022 power monitor
+
+maintainers:
+  - Carsten Spieß <mail@carsten-spiess.de>
+
+description: |
+  The ISL28022 is a power monitor with I2C interface. The device monitors
+  voltage, current via shunt resistor and calculated power.
+
+  Datasheets:
+    https://www.renesas.com/us/en/www/doc/datasheet/isl28022.pdf
+
+properties:
+  compatible:
+    const: renesas,isl28022
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description:
+      Shunt resistor value in micro-Ohm
+    minimum: 800
+    default: 10000
+
+  renesas,shunt-range-microvolt:
+    description:
+      Maximal shunt voltage range of +/- 40 mV, 80 mV, 160 mV or 320 mV
+    default: 320000
+    enum: [40000, 80000, 160000, 320000]
+
+  renesas,average-samples:
+    description:
+      Number of samples to be used to report voltage, current and power values.
+    default: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32, 64, 128]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-monitor@40 {
+            compatible = "renesas,isl28022";
+            reg = <0x40>;
+            shunt-resistor-micro-ohms = <8000>;
+            renesas,shunt-range-microvolt = <40000>;
+            renesas,average-samples = <128>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d39199ed51da..d5809cf181ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11936,6 +11936,7 @@ ISL28022 HARDWARE MONITORING DRIVER
 M:	Carsten Spieß <mail@carsten-spiess.de>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
 F:	Documentation/hwmon/isl28022.rst
 F:	drivers/hwmon/isl28022.c
 
-- 
2.25.1


