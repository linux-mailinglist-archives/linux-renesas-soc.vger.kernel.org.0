Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272D3436CB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 23:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbhJUVeD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 17:34:03 -0400
Received: from mail-eopbgr1410110.outbound.protection.outlook.com ([40.107.141.110]:58640
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231607AbhJUVeC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 17:34:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzouaeQAvhqyxckJeyV5IAaFwUm6YTvnJH7apLaPdDIagDBqPo+j1THugeQ318qfrnACZcn+xQ+BBQzYwUD3jusxCePXMt41qLwbJBfqzcntD8VVjZOsN+sqPv6JGXuGSL2liBDDyfd4Blz8SuQns1kJx4j6hSE/e2RQSj+DvcFy+OmXb+rKRmKpacFHQ3sfCJcOkkYJrx2QWBeQfpJhlo9SAdDiuBkMq40EbJkl3e18AgRUlRuauHwLTtMzFNf0SispM96Hzd7NlpSOmCM1vUaS6J8n5KgXixB7df/oAX5Di4ldJke1UPArR6uDTX09QNTWv4MABAz/4BnSoTAHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Sl7th5R+jMqoJsXcWnS3+Fp3t1c3CN/ykznXGJirdA=;
 b=cemSevxYWgoScXIZ9espJYe3CLpq1e5/9Yt9Qr64H9mOEqwBXBk1P7DZ2/r2Ylk6tO3Xce9rOKM+qkgo0SAF4mOd25mVOD1JxDlzohfrxZWgUBXtQ5O3p/NonjWyqTSaf4BgaGr58MC/Zr9jhOh2+qQYKPxq9Z+TDwG1IcfNZM+25ceofyMEeiE6jVKsVoZzLOS5ACUFyHiCpLVCy0ORlH1MjWmdEsGM3OABg6mzNcIG5jkVZIEjfCIjK220cl0KeY4BgaO2mRAoNUNSc1JL7ddpseKH73CB5+/zc0RN2CnOkeceUrMA6SRPe1PiiOm65eTfRjYIChq71+ThZ1mjng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Sl7th5R+jMqoJsXcWnS3+Fp3t1c3CN/ykznXGJirdA=;
 b=N4P617ha1CiSJ2P+F7TNNCnEDRrK9aLB9nVNGp0ecLZPGAHx5imVhS12BAW//vYB97WWirF7v1DIEsahFl3ORyv9hXxYx6yVeQg0WnnTTVarY3WKF1CeionV7OwwuEOQIkCkMYlc/aEATxwPU5woR+YBaexkZBwFNp8uH9IT0cc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS3PR01MB6577.jpnprd01.prod.outlook.com (2603:1096:604:101::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Thu, 21 Oct
 2021 21:31:36 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e%6]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 21:31:36 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v8 2/2] clk: Add ccf driver for Renesas 8T49N241
Date:   Thu, 21 Oct 2021 14:31:06 -0700
Message-Id: <20211021213106.315-3-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021213106.315-1-alexander.helms.jy@renesas.com>
References: <20211021213106.315-1-alexander.helms.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
Received: from az-ahelms.na.ads.idt.com (192.48.119.236) by SJ0PR05CA0161.namprd05.prod.outlook.com (2603:10b6:a03:339::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.10 via Frontend Transport; Thu, 21 Oct 2021 21:31:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da3c9473-68f9-4e47-9c53-08d994da2684
X-MS-TrafficTypeDiagnostic: OS3PR01MB6577:
X-Microsoft-Antispam-PRVS: <OS3PR01MB6577E7D1F5E112FD511C77C7C8BF9@OS3PR01MB6577.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7cpZ8wHRrLxhjqJUd1hS1Ty48hn3HmfXDcqhKJGtcYOR1oT/P6si/cSf4I6hNTo/nnN7XkLf1r137N79l39vmbyyeqcplLlYrn/kvuunfXQUn5dM0eSYFgnmH7orV4gXBqexDCqMEckm3euRuul0zeIB+kCio4BXTSNYTUTGp7CfyXSvd+mr2Uqtnt+mszgvQMTXQTYvQHkJU0cASxdAst9K2EvFKpQWnX8R4P9ivcBT70oQk9StYbydz2DSlmAh3sb+7Q/Oupb7WImsE6PEe6FX+9iFSIb9FKincslJ50QOVivw37Bh8FXhuHeNYgGqsCj8xa2g6COvbQOcViPOzi8f5E/dqbObi6SlTRq3CaMfGA+VEtj8/tA6PIFjiHRxzlL6Wn2FZQ9cskh+Y4WtAW6DIwOkefAmufmzYqo1pgGCo5dq7YlB77W4EdOnXTbXK8Cl26j9vSlTakxquNFLWSUFiWfPjP0W6SjiULH/0Pb6ckTlFEU/6NGTT/DzJptqkfQI5yhyQss8HBcuh+YU8JnLVS0Ig0AvUTzvg2mwSBzFqMsioHqNlkdd6YKQy/G8xpGv6HqUHBRePWobBdt7Dp9NAEqG4BqScmPN/nBwHhefm8OhFqtV9WQTVcuayvuqIX/NvNrRgiRL7SQZfX5R8lmunVnI88nSE7OwnA+y7Fr5Rk/etdtllf57TPY4pWPvPep4FgR573+SeeCpmGcjGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6512007)(508600001)(86362001)(8936002)(6506007)(5660300002)(103116003)(8676002)(36756003)(2906002)(38350700002)(186003)(38100700002)(956004)(1076003)(2616005)(6666004)(26005)(316002)(6486002)(30864003)(52116002)(4326008)(66946007)(66476007)(66556008)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b4oN6m2KxvPTR3H3qqUu713YXu9t23uirRp0FafOuxhykU76UTTOSuyP6q66?=
 =?us-ascii?Q?P2FOA8tsIlrxMi41LDNw3OPiUkhiLl1yUa29QRFVzvgseb7Qu5LNIfiC8ScB?=
 =?us-ascii?Q?MPbdLR/76zCFe0IV/uA8ICnkJFvcIn69S/kkkYLeSizCIPkQYVMFVxdr/SVp?=
 =?us-ascii?Q?p4PQar1Yknh0A26sn6Dw9fjq4/x+lGFkjE3zRyu93f+bHYZCikziYwgMdhWV?=
 =?us-ascii?Q?i1XXx+9crkjuDDyodBeOK0GR6DP14CuhLwc4J8jNUUER6moR9GnJCJE3Slug?=
 =?us-ascii?Q?C7imuoZdE6lNupF5qjSzpJBtDX5iQMz9L8z9H7VWTPIMDpNAyZS5Oiz+Cu9t?=
 =?us-ascii?Q?rN9ZPpVsjb8kzaxxdSdJD1POqXYf4sX5MgHtl+kh84hJj839JtIUHtur5hzn?=
 =?us-ascii?Q?Ah0TN/bln/wp5EK3Cyy93ST7aIeqamu8It5QlnVxs12DMWSE+a7H3n0SAtwG?=
 =?us-ascii?Q?sxqWEHud8q8XdR9tL+E1U8/EePQ6HnihxyRfHRMxXNnBFl9pxlWnz1WCLR9p?=
 =?us-ascii?Q?xALkAsfxh8jjjcH6NSnM34V5YUhDpAxWrdBQniNP6rGOClg6lY2g8Z2V5wfb?=
 =?us-ascii?Q?/zE9Gz/MubGevhj/ZZ/CEVZCCCuZvKldlGgf/D2RjfgBPiRVt8XIkZHfHRmI?=
 =?us-ascii?Q?f2Fw/xJSdOtOBty0Ukw94bQmQTFj5neLxlSDUrWWm+Jre1Xz9CSUyRwgw52r?=
 =?us-ascii?Q?nU740ML+m6CwU9Ld75CKXDeQfpZSLB5FAoVogN1BBawRd7oj6Uv0xT1x2M9E?=
 =?us-ascii?Q?egQb1Khui7nr2xTnk1PavjmZhlB/n8UILCqTXQcnT6g+wK6biWlS2p1m9imi?=
 =?us-ascii?Q?Rmym6XtI0B5/5L7A5fSgRAHX8eo1ITmEEetiUCXDbSX0CdEMJJ3pRrzMZt3q?=
 =?us-ascii?Q?4OYqjd2oUe/XDKdkCjtAMD3/UOIAmACWQ5LMfUWUJ9p2IdVZNkZVUX49SMDU?=
 =?us-ascii?Q?lWywTu3YV0WP/pu2f3czk5tmHdactJUz2DXgQ1f0PrCjN2zasM0okrjRDU+L?=
 =?us-ascii?Q?F3/6uZteQWYBiU5R3sBoRZ4qudRHusEZ8b/40PGRVRwRH7zGhFqSP5Nt189h?=
 =?us-ascii?Q?zZg5BCs6BujrtHXFX5KdXEnO8o651x7tM1eF+JGCPNvz1fK+eL43hAcED/or?=
 =?us-ascii?Q?4grB0D/4X8GAJxxhVrk1hL512PEbfDps8FHT5fOozblEEStUIPXKqZkdmoi8?=
 =?us-ascii?Q?KtcFD4j8E60scj+Ikl+4MDsEabCkbqKc0foWKva0LgFYizHfEVdw/x3RXuzO?=
 =?us-ascii?Q?lgO4cuB54oGVexp+Ccw4cFjTDYbOYpZ1mkG4LLuYqcdsa9+/fsDBECYskfU3?=
 =?us-ascii?Q?8TYyG2vpQmEo85zteuUl5a3WWr6YdWWh8uD+tZHRDX9G3il8R7npeoD9ib7x?=
 =?us-ascii?Q?ykgpyYv769qOwNeXsd/vAcsu+mSanBX03EAz+df6fKRTmIEXr+1RcairKt6M?=
 =?us-ascii?Q?xo+eYG6MrUuxpa8Fwd6eZzQFwsTG1V966EnMqWl9WmQzAdPcPf0kkA=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3c9473-68f9-4e47-9c53-08d994da2684
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 21:31:32.6298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alexander.helms.jy@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6577
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is a common clock framework driver that supports the 8T49N241 chip.
No other chips in the family are currently supported. The driver
supports setting the rate for all four outputs on the chip and
automatically calculating/setting the appropriate VCO value.

The driver can read a full register map from the device tree
and will use that register map to initialize the attached device
(via I2C) when the system boots. Any configuration not supported by
the common clock framework must be done via the full register map,
including optimized settings.

All outputs are currently assumed to be LVDS unless overridden in
the full register map in the DT.

Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
 MAINTAINERS                 |   1 +
 drivers/clk/8t49n24x-core.c | 752 ++++++++++++++++++++++++++++++++++++
 drivers/clk/8t49n24x-core.h | 242 ++++++++++++
 drivers/clk/8t49n24x.c      | 565 +++++++++++++++++++++++++++
 drivers/clk/Kconfig         |  21 +
 drivers/clk/Makefile        |   2 +
 6 files changed, 1583 insertions(+)
 create mode 100644 drivers/clk/8t49n24x-core.c
 create mode 100644 drivers/clk/8t49n24x-core.h
 create mode 100644 drivers/clk/8t49n24x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9f244d3a7..e4659b943 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15946,6 +15946,7 @@ M:	Alex Helms <alexander.helms.jy@renesas.com>
 M:	David Cater <david.cater.jc@renesas.com>
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
+F:	drivers/clk/8t49n24x*
 
 RENESAS CLOCK DRIVERS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
diff --git a/drivers/clk/8t49n24x-core.c b/drivers/clk/8t49n24x-core.c
new file mode 100644
index 000000000..b052f763d
--- /dev/null
+++ b/drivers/clk/8t49n24x-core.c
@@ -0,0 +1,752 @@
+// SPDX-License-Identifier: GPL-2.0
+/* 8t49n24x-core.c - Program 8T49N24x settings via I2C (common code)
+ *
+ * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+#include "8t49n24x-core.h"
+
+/*
+ * In Timing Commander, Q0 is changed from 25MHz to Q0 75MHz, the following
+ * changes occur:
+ *
+ * 2 bytes change in EEPROM data string.
+ *
+ * DSM_INT R0025[0],R0026[7:0] : 35 => 30
+ * NS2_Q0 R0040[7:0],R0041[7:0] : 14 => 4
+ *
+ * In EEPROM
+ * 1. R0026
+ * 2. R0041
+ *
+ * Note that VCO_Frequency (metadata) also changed (3500 =>3000).
+ * This reflects a change to DSM_INT.
+ *
+ * Note that the Timing Commander code has workarounds in the workflow scripts
+ * to handle dividers for the 8T49N241 (because the development of that GUI
+ * predates chip override functionality). That affects NS1_Qx (x in 1-3)
+ * and NS2_Qx. NS1_Qx contains the upper bits of NS_Qx, and NS2_Qx contains
+ * the lower bits. That is NOT the case for Q0, though. In that case NS1_Q0
+ * is the 1st stage output divider (/5, /6, /4) and NS2_Q0 is the 16-bit
+ * second stage (with actual divide being twice the value stored in the
+ * register).
+ *
+ * NS1_Q0 R003F[1:0]
+ */
+
+#define R8T49N24X_VCO_MIN			2999997000u
+#define R8T49N24X_VCO_MAX			4000004000u
+#define R8T49N24X_VCO_OPT			3500000000u
+#define R8T49N24X_MIN_INT_DIVIDER	6
+#define R8T49N24X_MIN_NS1			4
+#define R8T49N24X_MAX_NS1			6
+
+static const u8 q0_ns1_options[3] = { 5, 6, 4 };
+
+/**
+ * __renesas_bits_to_shift - num bits to shift given specified mask
+ * @mask:	32-bit word input to count zero bits on right
+ *
+ * Given a bit mask indicating where a value will be stored in
+ * a register, return the number of bits you need to shift the value
+ * before ORing it into the register value.
+ *
+ * Return: number of bits to shift
+ */
+int __renesas_bits_to_shift(unsigned int mask)
+{
+	if (mask)
+		return __ffs(mask);
+	else
+		return 0;
+}
+
+int __renesas_i2c_write_bulk(struct i2c_client *client, struct regmap *map,
+			     unsigned int reg, u8 val[], size_t val_count)
+{
+	u8 block[WRITE_BLOCK_SIZE];
+	unsigned int block_offset = reg;
+	unsigned int i, currentOffset = 0;
+	int err;
+
+	dev_dbg(&client->dev,
+		"I2C->0x%04x : [hex] . First byte: %02x, Second byte: %02x",
+		reg, reg >> 8, reg & 0xFF);
+
+	print_hex_dump_debug("i2c_write_bulk: ", DUMP_PREFIX_NONE,
+			     16, 1, val, val_count, false);
+
+	for (i = 0; i < val_count; i++) {
+		block[currentOffset++] = val[i];
+
+		if (i > 0 && (i + 1) % WRITE_BLOCK_SIZE == 0) {
+			err = regmap_bulk_write(map, block_offset, block, WRITE_BLOCK_SIZE);
+			if (err)
+				break;
+			block_offset += WRITE_BLOCK_SIZE;
+			currentOffset = 0;
+		}
+	}
+
+	if (err == 0 && currentOffset > 0)
+		err = regmap_bulk_write(map, block_offset, block, currentOffset);
+
+	return err;
+}
+
+static int __i2c_write(struct i2c_client *client, struct regmap *map,
+		       unsigned int reg, unsigned int val)
+{
+	dev_dbg(&client->dev, "I2C->0x%x : [hex] %x", reg, val);
+	return regmap_write(map, reg, val);
+}
+
+static int __i2c_write_with_mask(struct i2c_client *client, struct regmap *map,
+				 unsigned int reg, u8 val, u8 original, u8 mask)
+{
+	return __i2c_write(client, map, reg,
+			   ((val << __renesas_bits_to_shift(mask)) & mask) | (original & ~mask));
+}
+
+void r8t49n24x_get_offsets(u8 output_num, struct clk_register_offsets *offsets)
+{
+	offsets->oe_offset = 0;
+	offsets->oe_mask = 0;
+	offsets->dis_mask = 0;
+	offsets->n_17_16_offset = 0;
+	offsets->n_17_16_mask = 0;
+	offsets->n_15_8_offset = 0;
+	offsets->n_7_0_offset = 0;
+	offsets->nfrac_27_24_offset = 0;
+	offsets->nfrac_27_24_mask = 0;
+	offsets->nfrac_23_16_offset = 0;
+	offsets->nfrac_15_8_offset = 0;
+	offsets->nfrac_7_0_offset = 0;
+
+	switch (output_num) {
+	case 0:
+		offsets->oe_offset = R8T49N24X_REG_OUTEN;
+		offsets->oe_mask = R8T49N24X_REG_OUTEN0_MASK;
+		offsets->dis_mask = R8T49N24X_REG_Q0_DIS_MASK;
+		break;
+	case 1:
+		offsets->oe_offset = R8T49N24X_REG_OUTEN;
+		offsets->oe_mask = R8T49N24X_REG_OUTEN1_MASK;
+		offsets->dis_mask = R8T49N24X_REG_Q1_DIS_MASK;
+		offsets->n_17_16_offset = R8T49N24X_REG_N_Q1_17_16;
+		offsets->n_17_16_mask = R8T49N24X_REG_N_Q1_17_16_MASK;
+		offsets->n_15_8_offset = R8T49N24X_REG_N_Q1_15_8;
+		offsets->n_7_0_offset = R8T49N24X_REG_N_Q1_7_0;
+		offsets->nfrac_27_24_offset = R8T49N24X_REG_NFRAC_Q1_27_24;
+		offsets->nfrac_27_24_mask = R8T49N24X_REG_NFRAC_Q1_27_24_MASK;
+		offsets->nfrac_23_16_offset = R8T49N24X_REG_NFRAC_Q1_23_16;
+		offsets->nfrac_15_8_offset = R8T49N24X_REG_NFRAC_Q1_15_8;
+		offsets->nfrac_7_0_offset = R8T49N24X_REG_NFRAC_Q1_7_0;
+		break;
+	case 2:
+		offsets->oe_offset = R8T49N24X_REG_OUTEN;
+		offsets->oe_mask = R8T49N24X_REG_OUTEN2_MASK;
+		offsets->dis_mask = R8T49N24X_REG_Q2_DIS_MASK;
+		offsets->n_17_16_offset = R8T49N24X_REG_N_Q2_17_16;
+		offsets->n_17_16_mask = R8T49N24X_REG_N_Q2_17_16_MASK;
+		offsets->n_15_8_offset = R8T49N24X_REG_N_Q2_15_8;
+		offsets->n_7_0_offset = R8T49N24X_REG_N_Q2_7_0;
+		offsets->nfrac_27_24_offset = R8T49N24X_REG_NFRAC_Q2_27_24;
+		offsets->nfrac_27_24_mask = R8T49N24X_REG_NFRAC_Q2_27_24_MASK;
+		offsets->nfrac_23_16_offset = R8T49N24X_REG_NFRAC_Q2_23_16;
+		offsets->nfrac_15_8_offset = R8T49N24X_REG_NFRAC_Q2_15_8;
+		offsets->nfrac_7_0_offset = R8T49N24X_REG_NFRAC_Q2_7_0;
+		break;
+	case 3:
+		offsets->oe_offset = R8T49N24X_REG_OUTEN;
+		offsets->oe_mask = R8T49N24X_REG_OUTEN3_MASK;
+		offsets->dis_mask = R8T49N24X_REG_Q3_DIS_MASK;
+		offsets->n_17_16_offset = R8T49N24X_REG_N_Q3_17_16;
+		offsets->n_17_16_mask = R8T49N24X_REG_N_Q3_17_16_MASK;
+		offsets->n_15_8_offset = R8T49N24X_REG_N_Q3_15_8;
+		offsets->n_7_0_offset = R8T49N24X_REG_N_Q3_7_0;
+		offsets->nfrac_27_24_offset = R8T49N24X_REG_NFRAC_Q3_27_24;
+		offsets->nfrac_27_24_mask = R8T49N24X_REG_NFRAC_Q3_27_24_MASK;
+		offsets->nfrac_23_16_offset = R8T49N24X_REG_NFRAC_Q3_23_16;
+		offsets->nfrac_15_8_offset = R8T49N24X_REG_NFRAC_Q3_15_8;
+		offsets->nfrac_7_0_offset = R8T49N24X_REG_NFRAC_Q3_7_0;
+		break;
+	}
+}
+
+/**
+ * r8t49n24x_calc_div_q0 - Calculate dividers and VCO freq to generate
+ *		the specified Q0 frequency.
+ * @chip:	Device data structure. contains all requested frequencies
+ *		for all outputs.
+ *
+ * The actual output divider is ns1 * ns2 * 2. fOutput = fVCO / (ns1 * ns2 * 2)
+ *
+ * The options for ns1 (when the source is the VCO) are 4,5,6. ns2 is a
+ * 16-bit value.
+ *
+ * chip->divs: structure for specifying ns1/ns2 values. If 0 after this
+ * function, Q0 is not requested
+ */
+static void r8t49n24x_calc_div_q0(struct clk_r8t49n24x_chip *chip)
+{
+	unsigned int i;
+	unsigned int min_div = 0, max_div = 0, best_vco = 0;
+	unsigned int min_ns2 = 0, max_ns2 = 0;
+	bool is_lower_vco = false;
+
+	chip->divs.ns1_q0 = 0;
+	chip->divs.ns2_q0 = 0;
+
+	if (chip->clk[0].requested == 0)
+		return;
+
+	min_div = (R8T49N24X_VCO_MIN / 2 / chip->clk[0].requested * 2) * 2;
+	max_div = (R8T49N24X_VCO_MAX / 2 / chip->clk[0].requested * 2) * 2;
+
+	dev_dbg(&chip->i2c_client->dev,
+		"requested: %lu, min_div: %u, max_div: %u",
+		chip->clk[0].requested, min_div, max_div);
+
+	min_ns2 = min_div / (R8T49N24X_MAX_NS1 * 2);
+	max_ns2 = max_div / (R8T49N24X_MIN_NS1 * 2);
+
+	dev_dbg(&chip->i2c_client->dev, "min_ns2: %u, max_ns2: %u", min_ns2, max_ns2);
+
+	for (i = 0; i < ARRAY_SIZE(q0_ns1_options); i++) {
+		unsigned int j = min_ns2;
+
+		while (j <= max_ns2) {
+			unsigned int actual_div = q0_ns1_options[i] * j * 2;
+			unsigned int current_vco = actual_div * chip->clk[0].requested;
+
+			if (current_vco < R8T49N24X_VCO_MIN)
+				dev_dbg(&chip->i2c_client->dev,
+					"ignore div: (ns1=%u * ns2=%u * 2 * %lu) == %u < %u",
+					q0_ns1_options[i], j,
+					chip->clk[0].requested, current_vco,
+					R8T49N24X_VCO_MIN);
+			else if (current_vco > R8T49N24X_VCO_MAX) {
+				dev_dbg(&chip->i2c_client->dev,
+					"ignore div: (ns1=%u * ns2=%u * 2 * %lu) == %u > %u. EXIT LOOP.",
+					q0_ns1_options[i], j,
+					chip->clk[0].requested, current_vco,
+					R8T49N24X_VCO_MAX);
+				j = max_ns2;
+			} else {
+				bool use = false;
+
+				dev_dbg(&chip->i2c_client->dev,
+					"contender: (ns1=%u * ns2=%u * 2 * %lu) == %u [in range]",
+					q0_ns1_options[i], j,
+					chip->clk[0].requested, current_vco);
+				if (current_vco <= R8T49N24X_VCO_OPT) {
+					if (current_vco > best_vco || !is_lower_vco) {
+						is_lower_vco = true;
+						use = true;
+					}
+				} else if (!is_lower_vco && current_vco > best_vco) {
+					use = true;
+				}
+				if (use) {
+					chip->divs.ns1_q0 = i;
+					chip->divs.ns2_q0 = j;
+					best_vco = current_vco;
+				}
+			}
+			j++;
+		}
+	}
+
+	dev_dbg(&chip->i2c_client->dev,
+		"best: (ns1=%u [/%u] * ns2=%u * 2 * %lu) == %u",
+		chip->divs.ns1_q0, q0_ns1_options[chip->divs.ns1_q0],
+		chip->divs.ns2_q0, chip->clk[0].requested, best_vco);
+}
+
+/**
+ * r8t49n24x_calc_divs - Calculate dividers to generate the specified frequency.
+ * @chip:	Device data structure. contains all requested frequencies
+ *		for all outputs.
+ *
+ * Calculate the clock dividers (dsmint, dsmfrac for vco; ns1/ns2 for q0,
+ * n/nfrac for q1-3) for a given target frequency.
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+static int r8t49n24x_calc_divs(struct clk_r8t49n24x_chip *chip)
+{
+	unsigned int i;
+	unsigned int vco = 0;
+	unsigned int pfd = 0;
+	unsigned int rem = 0;
+
+	r8t49n24x_calc_div_q0(chip);
+
+	dev_dbg(&chip->i2c_client->dev,
+		"after r8t49n24x_calc_div_q0. ns1: %u [/%u], ns2: %u",
+		chip->divs.ns1_q0, q0_ns1_options[chip->divs.ns1_q0],
+		chip->divs.ns2_q0);
+
+	chip->divs.dsmint = 0;
+	chip->divs.dsmfrac = 0;
+
+	if (chip->clk[0].requested > 0) {
+		/* Q0 is in use and is governing the actual VCO freq */
+		vco = q0_ns1_options[chip->divs.ns1_q0] * chip->divs.ns2_q0
+			* 2 * chip->clk[0].requested;
+	} else {
+		unsigned int freq = 0;
+		unsigned int min_div = 0, max_div = 0;
+		unsigned int i = 0;
+		bool is_lower_vco = false;
+
+		/*
+		 * Q0 is not in use. Use the first requested (fractional)
+		 * output frequency as the one controlling the VCO.
+		 */
+		for (i = 1; i < NUM_OUTPUTS; i++) {
+			if (chip->clk[i].requested != 0) {
+				freq = chip->clk[i].requested;
+				break;
+			}
+		}
+
+		if (!freq) {
+			dev_err(&chip->i2c_client->dev, "NO FREQUENCIES SPECIFIED");
+			return -EINVAL;
+		}
+
+		/*
+		 * First, determine the min/max div for the output frequency.
+		 */
+		min_div = R8T49N24X_MIN_INT_DIVIDER;
+		max_div = (R8T49N24X_VCO_MAX / 2 / freq) * 2;
+
+		dev_dbg(&chip->i2c_client->dev,
+			"calc_divs for fractional output. freq: %u, min_div: %u, max_div: %u",
+			freq, min_div, max_div);
+
+		i = min_div;
+
+		while (i <= max_div) {
+			unsigned int current_vco = freq * i;
+
+			dev_dbg(&chip->i2c_client->dev,
+				"calc_divs for fractional output. walk: %u, freq: %u, vco: %u",
+				i, freq, vco);
+
+			if (current_vco >= R8T49N24X_VCO_MIN &&
+			    vco <= R8T49N24X_VCO_MAX) {
+				if (current_vco <= R8T49N24X_VCO_OPT) {
+					if (current_vco > vco || !is_lower_vco) {
+						is_lower_vco = true;
+						vco = current_vco;
+					}
+				} else if (!is_lower_vco && current_vco > vco) {
+					vco = current_vco;
+				}
+			}
+			/* Divider must be even. */
+			i += 2;
+		}
+	}
+
+	if (!vco) {
+		dev_err(&chip->i2c_client->dev, "no integer divider in range found. NOT SUPPORTED.");
+		return -EINVAL;
+	}
+
+	/* Setup dividers for outputs with fractional dividers. */
+	for (i = 1; i < NUM_OUTPUTS; i++) {
+		if (chip->clk[i].requested) {
+			/*
+			 * The value written to the chip is half
+			 * the calculated divider.
+			 */
+			rem = vco % (chip->clk[i].requested * 2);
+			chip->divs.nint[i - 1] = vco / chip->clk[i].requested * 2;
+			chip->divs.nfrac[i - 1] = div64_ul(rem << 28,
+							   chip->clk[i].requested * 2);
+
+			dev_dbg(&chip->i2c_client->dev,
+				"div to get Q%i freq %lu from vco %u: int part: %u, rem: %u, frac part: %u",
+				i, chip->clk[i].requested,
+				vco, chip->divs.nint[i - 1], rem,
+				chip->divs.nfrac[i - 1]);
+		}
+	}
+
+	/* Calculate freq for pfd */
+	pfd = chip->input_clk_freq * (chip->doubler_disabled ? 1 : 2);
+
+	/*
+	 * Calculate dsmint & dsmfrac:
+	 * -----------------------------
+	 * dsm = float(vco)/float(pfd)
+	 * dsmfrac = dsm-floor(dsm) * 2^21
+	 * rem = vco % pfd
+	 * therefore:
+	 * dsmfrac = (rem * 2^21)/pfd
+	 */
+	rem = vco % pfd;
+	chip->divs.dsmint = vco / pfd;
+	chip->divs.dsmfrac = div64_ul(rem << 21, pfd);
+
+	dev_dbg(&chip->i2c_client->dev,
+		"vco: %u, pfd: %u, dsmint: %u, dsmfrac: %u, rem: %u",
+		vco, pfd, chip->divs.dsmint,
+		chip->divs.dsmfrac, rem);
+
+	return 0;
+}
+
+/**
+ * r8t49n24x_enable_output - Enable/disable a particular output
+ * @chip:	Device data structure
+ * @output:	Output to enable/disable
+ * @enable:	Enable (true/false)
+ *
+ * Return: passes on regmap_write return value.
+ */
+int r8t49n24x_enable_output(struct clk_r8t49n24x_chip *chip, u8 output, bool enable)
+{
+	int err;
+	struct clk_register_offsets offsets;
+	struct i2c_client *client = chip->i2c_client;
+
+	/*
+	 * When an output is enabled, enable it in the original
+	 * data read from the chip and cached. Otherwise it may be
+	 * accidentally	turned off when another output is enabled.
+	 *
+	 * E.g., the driver starts with all outputs off in reg_out_en_x.
+	 * Q1 is enabled with the appropriate mask. Q2 is then enabled,
+	 * which results in Q1 being turned back off (because Q1 was off
+	 * in reg_out_en_x).
+	 */
+
+	r8t49n24x_get_offsets(output, &offsets);
+
+	dev_dbg(&client->dev,
+		"q%u enable? %d. reg_out_en_x before: 0x%x, reg_out_mode_0_1 before: 0x%x",
+		output, enable, chip->reg_out_en_x, chip->reg_out_mode_0_1);
+
+	dev_dbg(&client->dev, "reg_out_mode_2_3 before: 0x%x, reg_qx_dis before: 0x%x",
+		chip->reg_out_mode_2_3, chip->reg_qx_dis);
+
+	chip->reg_out_en_x = chip->reg_out_en_x & ~offsets.oe_mask;
+	if (enable)
+		chip->reg_out_en_x |= BIT(__renesas_bits_to_shift(offsets.oe_mask));
+
+	chip->reg_qx_dis = chip->reg_qx_dis & ~offsets.dis_mask;
+	dev_dbg(&client->dev,
+		"q%u enable? %d. reg_qx_dis mask: 0x%x, before checking enable: 0x%x",
+		output, enable, offsets.dis_mask, chip->reg_qx_dis);
+
+	if (!enable)
+		chip->reg_qx_dis |= BIT(__renesas_bits_to_shift(offsets.dis_mask));
+
+	dev_dbg(&client->dev,
+		"q%u enable? %d. reg_out_en_x after: 0x%x, reg_qx_dis after: 0x%x",
+		output, enable, chip->reg_out_en_x, chip->reg_qx_dis);
+
+	err = __i2c_write(client, chip->regmap, R8T49N24X_REG_OUTEN, chip->reg_out_en_x);
+	if (err) {
+		dev_err(&client->dev, "error setting %s: %i", "R8T49N24X_REG_OUTEN", err);
+		return err;
+	}
+
+	err = __i2c_write(client, chip->regmap, R8T49N24X_REG_OUTMODE0_1, chip->reg_out_mode_0_1);
+	if (err) {
+		dev_err(&client->dev, "error setting %s: %i", "R8T49N24X_REG_OUTMODE0_1", err);
+		return err;
+	}
+
+	err = __i2c_write(client, chip->regmap, R8T49N24X_REG_OUTMODE2_3, chip->reg_out_mode_2_3);
+	if (err) {
+		dev_err(&client->dev, "error setting %s: %i", "R8T49N24X_REG_OUTMODE2_3", err);
+		return err;
+	}
+
+	err = __i2c_write(client, chip->regmap, R8T49N24X_REG_Q_DIS, chip->reg_qx_dis);
+	if (err) {
+		dev_err(&client->dev, "error setting %s: %i", "R8T49N24X_REG_Q_DIS", err);
+		return err;
+	}
+
+	return 0;
+}
+
+/**
+ * r8t49n24x_update_device - write registers to the chip
+ * @chip:	Device data structure
+ *
+ * Write all values to hardware that we	have calculated.
+ *
+ * Return: passes on regmap_bulk_write return value.
+ */
+static int r8t49n24x_update_device(struct clk_r8t49n24x_chip *chip)
+{
+	int err;
+	unsigned int i;
+	struct i2c_client *client = chip->i2c_client;
+
+	dev_dbg(&client->dev, "setting DSM_INT_8 (val %u @ %u)",
+		chip->divs.dsmint >> 8, R8T49N24X_REG_DSM_INT_8);
+
+	err = __i2c_write_with_mask(client, chip->regmap, R8T49N24X_REG_DSM_INT_8,
+				    (chip->divs.dsmint >> 8) & R8T49N24X_REG_DSM_INT_8_MASK,
+				    chip->reg_dsm_int_8, R8T49N24X_REG_DSM_INT_8_MASK);
+	if (err) {
+		dev_err(&client->dev, "error setting R8T49N24X_REG_DSM_INT_8: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "setting DSM_INT_7_0 (val %u @ 0x%x)",
+		chip->divs.dsmint & 0xFF, R8T49N24X_REG_DSM_INT_7_0);
+
+	err = __i2c_write(client, chip->regmap, R8T49N24X_REG_DSM_INT_7_0,
+			  chip->divs.dsmint & 0xFF);
+	if (err) {
+		dev_err(&client->dev, "error setting R8T49N24X_REG_DSM_INT_7_0: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting R8T49N24X_REG_DSMFRAC_20_16 (val %u @ 0x%x)",
+		chip->divs.dsmfrac >> 16,
+		R8T49N24X_REG_DSMFRAC_20_16);
+
+	err = __i2c_write_with_mask(client, chip->regmap, R8T49N24X_REG_DSMFRAC_20_16,
+				    (chip->divs.dsmfrac >> 16) & R8T49N24X_REG_DSMFRAC_20_16_MASK,
+				    chip->reg_dsm_int_8, R8T49N24X_REG_DSMFRAC_20_16_MASK);
+	if (err) {
+		dev_err(&client->dev, "error setting R8T49N24X_REG_DSMFRAC_20_16: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting R8T49N24X_REG_DSMFRAC_15_8 (val %u @ 0x%x)",
+		(chip->divs.dsmfrac >> 8) & 0xFF,
+		R8T49N24X_REG_DSMFRAC_15_8);
+
+	err = __i2c_write(client, chip->regmap, R8T49N24X_REG_DSMFRAC_15_8,
+			  (chip->divs.dsmfrac >> 8) & 0xFF);
+	if (err) {
+		dev_err(&client->dev, "error setting R8T49N24X_REG_DSMFRAC_15_8: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting R8T49N24X_REG_DSMFRAC_7_0 (val %u @ 0x%x)",
+		chip->divs.dsmfrac & 0xFF,
+		R8T49N24X_REG_DSMFRAC_7_0);
+
+	err = __i2c_write(client, chip->regmap, R8T49N24X_REG_DSMFRAC_7_0,
+			  chip->divs.dsmfrac & 0xFF);
+	if (err) {
+		dev_err(&client->dev, "error setting R8T49N24X_REG_DSMFRAC_7_0: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting R8T49N24X_REG_NS1_Q0 (val %u @ 0x%x)",
+		chip->divs.ns1_q0, R8T49N24X_REG_NS1_Q0);
+
+	err = __i2c_write_with_mask(client, chip->regmap, R8T49N24X_REG_NS1_Q0,
+				    chip->divs.ns1_q0 & R8T49N24X_REG_NS1_Q0_MASK,
+				    chip->reg_ns1_q0, R8T49N24X_REG_NS1_Q0_MASK);
+	if (err) {
+		dev_err(&client->dev, "error setting R8T49N24X_REG_NS1_Q0: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting R8T49N24X_REG_NS2_Q0_15_8 (val %u @ 0x%x)",
+		(chip->divs.ns2_q0 >> 8) & 0xFF, R8T49N24X_REG_NS2_Q0_15_8);
+
+	err = __i2c_write(client, chip->regmap, R8T49N24X_REG_NS2_Q0_15_8,
+			  (chip->divs.ns2_q0 >> 8) & 0xFF);
+	if (err) {
+		dev_err(&client->dev, "error setting R8T49N24X_REG_NS2_Q0_15_8: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting R8T49N24X_REG_NS2_Q0_7_0 (val %u @ 0x%x)",
+		chip->divs.ns2_q0 & 0xFF, R8T49N24X_REG_NS2_Q0_7_0);
+
+	err = __i2c_write(client, chip->regmap, R8T49N24X_REG_NS2_Q0_7_0,
+			  chip->divs.ns2_q0 & 0xFF);
+	if (err) {
+		dev_err(&client->dev, "error setting R8T49N24X_REG_NS2_Q0_7_0: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"calling r8t49n24x_enable_output for Q0. requestedFreq: %lu",
+		chip->clk[0].requested);
+	r8t49n24x_enable_output(chip, 0, chip->clk[0].requested != 0);
+
+	dev_dbg(&client->dev, "writing values for q1-q3");
+	for (i = 1; i < NUM_OUTPUTS; i++) {
+		struct clk_register_offsets offsets;
+
+		if (chip->clk[i].requested != 0) {
+			r8t49n24x_get_offsets(i, &offsets);
+
+			dev_dbg(&client->dev, "(q%u, nint: %u, nfrac: %u)",
+				i, chip->divs.nint[i - 1],
+				chip->divs.nfrac[i - 1]);
+
+			dev_dbg(&client->dev,
+				"setting n_17_16_offset (q%u, val %u @ 0x%x)",
+				i, chip->divs.nint[i - 1] >> 16,
+				offsets.n_17_16_offset);
+
+			err = __i2c_write_with_mask(client, chip->regmap,
+						    offsets.n_17_16_offset,
+						    (chip->divs.nint[i - 1] >> 16) &
+							offsets.n_17_16_mask,
+						    chip->reg_n_qx_17_16[i - 1],
+						    offsets.n_17_16_mask);
+			if (err) {
+				dev_err(&client->dev, "error setting n_17_16_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting n_15_8_offset (q%u, val %u @ 0x%x)",
+				i, (chip->divs.nint[i - 1] >> 8) & 0xFF,
+				offsets.n_15_8_offset);
+
+			err = __i2c_write(client, chip->regmap,
+					  offsets.n_15_8_offset,
+					  (chip->divs.nint[i - 1] >> 8) & 0xFF);
+			if (err) {
+				dev_err(&client->dev, "error setting n_15_8_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting n_7_0_offset (q%u, val %u @ 0x%x)",
+				i, chip->divs.nint[i - 1] & 0xFF,
+				offsets.n_7_0_offset);
+
+			err = __i2c_write(client, chip->regmap,
+					  offsets.n_7_0_offset,
+					  chip->divs.nint[i - 1] & 0xFF);
+			if (err) {
+				dev_err(&client->dev, "error setting n_7_0_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting nfrac_27_24_offset (q%u, val %u @ 0x%x)",
+				i, (chip->divs.nfrac[i - 1] >> 24),
+				offsets.nfrac_27_24_offset);
+
+			err = __i2c_write_with_mask(client, chip->regmap,
+						    offsets.nfrac_27_24_offset,
+						    (chip->divs.nfrac[i - 1] >> 24) &
+							offsets.nfrac_27_24_mask,
+						    chip->reg_nfrac_qx_27_24[i - 1],
+						    offsets.nfrac_27_24_mask);
+			if (err) {
+				dev_err(&client->dev, "error setting nfrac_27_24_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting nfrac_23_16_offset (q%u, val %u @ 0x%x)",
+				i, (chip->divs.nfrac[i - 1] >> 16) & 0xFF,
+				offsets.nfrac_23_16_offset);
+
+			err = __i2c_write(client, chip->regmap,
+					  offsets.nfrac_23_16_offset,
+					  (chip->divs.nfrac[i - 1] >> 16) & 0xFF);
+			if (err) {
+				dev_err(&client->dev, "error setting nfrac_23_16_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting nfrac_15_8_offset (q%u, val %u @ 0x%x)",
+				i, (chip->divs.nfrac[i - 1] >> 8) & 0xFF,
+				offsets.nfrac_15_8_offset);
+
+			err = __i2c_write(client, chip->regmap, offsets.nfrac_15_8_offset,
+					  (chip->divs.nfrac[i - 1] >> 8) & 0xFF);
+			if (err) {
+				dev_err(&client->dev, "error setting nfrac_15_8_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting nfrac_7_0_offset (q%u, val %u @ 0x%x)",
+				i, chip->divs.nfrac[i - 1] & 0xFF,
+				offsets.nfrac_7_0_offset);
+
+			err = __i2c_write(client, chip->regmap,
+					  offsets.nfrac_7_0_offset,
+					  chip->divs.nfrac[i - 1] & 0xFF);
+			if (err) {
+				dev_err(&client->dev, "error setting nfrac_7_0_offset: %i", err);
+				return err;
+			}
+		}
+		r8t49n24x_enable_output(chip, i, chip->clk[i].requested != 0);
+		chip->clk[i].actual = chip->clk[i].requested;
+	}
+	return 0;
+}
+
+/**
+ * r8t49n24x_set_frequency - Adjust output frequency on the attached chip.
+ * @chip:	Device data structure, including all requested frequencies.
+ *
+ * Return: 0 on success.
+ */
+int r8t49n24x_set_frequency(struct clk_r8t49n24x_chip *chip)
+{
+	unsigned int i;
+	int err;
+	bool all_disabled = true;
+	struct i2c_client *client = chip->i2c_client;
+
+	for (i = 0; i < NUM_OUTPUTS; i++) {
+		if (chip->clk[i].requested == 0) {
+			r8t49n24x_enable_output(chip, i, false);
+			chip->clk[i].actual = 0;
+		} else {
+			all_disabled = false;
+		}
+	}
+
+	if (all_disabled)
+		/*
+		 * no requested frequencies, so nothing else to calculate
+		 * or write to the chip. If the consumer wants to disable
+		 * all outputs, they can request 0 for all frequencies.
+		 */
+		return 0;
+
+	if (chip->input_clk_freq == 0) {
+		dev_err(&client->dev, "no input frequency; can't continue.");
+		return -EINVAL;
+	}
+
+	err = r8t49n24x_calc_divs(chip);
+	if (err)
+		return err;
+
+	err = r8t49n24x_update_device(chip);
+	if (err)
+		return err;
+
+	return 0;
+}
diff --git a/drivers/clk/8t49n24x-core.h b/drivers/clk/8t49n24x-core.h
new file mode 100644
index 000000000..93621fbdb
--- /dev/null
+++ b/drivers/clk/8t49n24x-core.h
@@ -0,0 +1,242 @@
+/* SPDX-License-Identifier: GPL-2.0
+ * 8t49n24x-core.h - Program 8T49N24x settings via I2C (common code)
+ *
+ * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
+ */
+
+#ifndef __8T49N24X_CORE_H_
+#define __8T49N24X_CORE_H_
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+
+/*
+ * The configurations in the settings file have 0x317 registers (last offset is 0x316).
+ */
+#define NUM_CONFIG_REGISTERS			0x317
+#define NUM_INPUTS				2
+#define NUM_OUTPUTS				4
+#define WRITE_BLOCK_SIZE			2
+
+/* Non output-specific registers */
+#define R8T49N24X_REG_DBL_DIS			0x6C
+#define R8T49N24X_REG_DBL_DIS_MASK		0x01
+#define R8T49N24X_REG_DSM_INT_8		0x25
+#define R8T49N24X_REG_DSM_INT_8_MASK		0x01
+#define R8T49N24X_REG_DSM_INT_7_0		0x26
+#define R8T49N24X_REG_DSMFRAC_20_16		0x28
+#define R8T49N24X_REG_DSMFRAC_20_16_MASK	0x1F
+#define R8T49N24X_REG_DSMFRAC_15_8		0x29
+#define R8T49N24X_REG_DSMFRAC_7_0		0x2A
+#define R8T49N24X_REG_OUTEN			0x39
+#define R8T49N24X_REG_OUTMODE0_1		0x3E
+#define R8T49N24X_REG_OUTMODE2_3		0x3D
+#define R8T49N24X_REG_Q_DIS			0x6F
+
+/* Q0 */
+#define R8T49N24X_REG_OUTEN0_MASK		0x01
+#define R8T49N24X_REG_OUTMODE0_MASK		0x0E
+#define R8T49N24X_REG_Q0_DIS_MASK		0x01
+#define R8T49N24X_REG_NS1_Q0			0x3F
+#define R8T49N24X_REG_NS1_Q0_MASK		0x03
+#define R8T49N24X_REG_NS2_Q0_15_8		0x40
+#define R8T49N24X_REG_NS2_Q0_7_0		0x41
+
+/* Q1 */
+#define R8T49N24X_REG_OUTEN1_MASK		0x02
+#define R8T49N24X_REG_OUTMODE1_MASK		0xE0
+#define R8T49N24X_REG_Q1_DIS_MASK		0x02
+#define R8T49N24X_REG_N_Q1_17_16		0x42
+#define R8T49N24X_REG_N_Q1_17_16_MASK		0x03
+#define R8T49N24X_REG_N_Q1_15_8		0x43
+#define R8T49N24X_REG_N_Q1_7_0			0x44
+#define R8T49N24X_REG_NFRAC_Q1_27_24		0x57
+#define R8T49N24X_REG_NFRAC_Q1_27_24_MASK	0x0F
+#define R8T49N24X_REG_NFRAC_Q1_23_16		0x58
+#define R8T49N24X_REG_NFRAC_Q1_15_8		0x59
+#define R8T49N24X_REG_NFRAC_Q1_7_0		0x5A
+
+/* Q2 */
+#define R8T49N24X_REG_OUTEN2_MASK		0x04
+#define R8T49N24X_REG_OUTMODE2_MASK		0x0E
+#define R8T49N24X_REG_Q2_DIS_MASK		0x04
+#define R8T49N24X_REG_N_Q2_17_16		0x45
+#define R8T49N24X_REG_N_Q2_17_16_MASK		0x03
+#define R8T49N24X_REG_N_Q2_15_8		0x46
+#define R8T49N24X_REG_N_Q2_7_0			0x47
+#define R8T49N24X_REG_NFRAC_Q2_27_24		0x5B
+#define R8T49N24X_REG_NFRAC_Q2_27_24_MASK	0x0F
+#define R8T49N24X_REG_NFRAC_Q2_23_16		0x5C
+#define R8T49N24X_REG_NFRAC_Q2_15_8		0x5D
+#define R8T49N24X_REG_NFRAC_Q2_7_0		0x5E
+
+/* Q3 */
+#define R8T49N24X_REG_OUTEN3_MASK		0x08
+#define R8T49N24X_REG_OUTMODE3_MASK		0xE0
+#define R8T49N24X_REG_Q3_DIS_MASK		0x08
+#define R8T49N24X_REG_N_Q3_17_16		0x48
+#define R8T49N24X_REG_N_Q3_17_16_MASK		0x03
+#define R8T49N24X_REG_N_Q3_15_8		0x49
+#define R8T49N24X_REG_N_Q3_7_0			0x4A
+#define R8T49N24X_REG_NFRAC_Q3_27_24		0x5F
+#define R8T49N24X_REG_NFRAC_Q3_27_24_MASK	0x0F
+#define R8T49N24X_REG_NFRAC_Q3_23_16		0x60
+#define R8T49N24X_REG_NFRAC_Q3_15_8		0x61
+#define R8T49N24X_REG_NFRAC_Q3_7_0		0x62
+
+/**
+ * struct r8t49n24x_output - device output information
+ * @hw:		hw registration info for this specific output clcok. This gets
+ *		passed as an argument to CCF api calls (e.g., set_rate).
+ *		container_of can then be used to get the reference to this
+ *		struct.
+ * @chip:	store a reference to the parent device structure. container_of
+ *		cannot be used to get to the parent device structure from
+ *		r8t49n24x_output, because clk_r8t49n24x_chip contains an array of
+ *		output structs (for future enhancements to support devices
+ *		with different numbers of output clocks).
+ * @index:	identifies output on the chip; used in debug statements
+ * @requested:	requested output clock frequency (in Hz)
+ * @actual:	actual output clock frequency (in Hz). Will only be set after
+ *		successful update of the device.
+ */
+struct r8t49n24x_output {
+	struct clk_hw hw;
+	struct clk_r8t49n24x_chip *chip;
+	u8 index;
+	unsigned long requested;
+	unsigned long actual;
+};
+
+/**
+ * struct r8t49n24x_dividers - output dividers
+ * @dsmint:	int component of feedback divider for VCO (2-stage divider)
+ * @dsmfrac:	fractional component of feedback divider for VCO
+ * @ns1_q0:	ns1 divider component for Q0
+ * @ns2_q0:	ns2 divider component for Q0
+ * @nint:	int divider component for Q1-3
+ * @nfrac:	fractional divider component for Q1-3
+ */
+struct r8t49n24x_dividers {
+	u16 dsmint;
+	u32 dsmfrac;
+
+	u8 ns1_q0;
+	u16 ns2_q0;
+
+	u32 nint[3];
+	u32 nfrac[3];
+};
+
+/**
+ * struct clk_r8t49n24x_chip - device info for chip
+ * @regmap:		register map used to perform i2c writes to the chip
+ * @i2c_client:		i2c_client struct passed to probe
+ * @min_freq:		min frequency for this chip
+ * @max_freq:		max frequency for this chip
+ * @settings:		filled in if full register map is specified in the DT
+ * @has_settings:	true if settings array is valid
+ * @input_clk:		ptr to input clock specified in DT
+ * @input_clk_num:	which input clock was specified. 0-based. A value of
+ *			NUM_INPUTS indicates that a XTAL is used as the input.
+ * @input_clk_nb:	notification support (if input clk changes)
+ * @input_clk_freq:	current freq of input_clk
+ * @doubler_disabled:	whether input doubler is enabled. This value is read
+ *			from the hw on probe (in case it is set in @settings).
+ * @clk:		array of outputs. One entry per output supported by the
+ *			chip. Frequencies requested via the ccf api will be
+ *			recorded in this array.
+ * @reg_dsm_int_8:	record current value from hw to avoid modifying
+ *			when writing register values
+ * @reg_dsm_frac_20_16:	record current value
+ * @reg_out_en_x:	record current value
+ * @reg_out_mode_0_1:	record current value
+ * @reg_out_mode_2_3:	record current value
+ * @reg_qx_dis:		record current value
+ * @reg_ns1_q0:		record current value
+ * @reg_n_qx_17_16:	record current value
+ * @reg_nfrac_qx_27_24:	record current value
+ * @divs:		output divider values for all outputs
+ */
+struct clk_r8t49n24x_chip {
+	struct regmap *regmap;
+	struct i2c_client *i2c_client;
+
+	u32 min_freq;
+	u32 max_freq;
+
+	u8 settings[NUM_CONFIG_REGISTERS];
+
+	bool has_settings;
+
+	struct clk *input_clk;
+	int input_clk_num;
+	struct notifier_block input_clk_nb;
+	u32 input_clk_freq;
+
+	bool doubler_disabled;
+
+	struct r8t49n24x_output clk[NUM_OUTPUTS];
+
+	unsigned int reg_dsm_int_8;
+	unsigned int reg_dsm_frac_20_16;
+	unsigned int reg_out_en_x;
+	unsigned int reg_out_mode_0_1;
+	unsigned int reg_out_mode_2_3;
+	unsigned int reg_qx_dis;
+	unsigned int reg_ns1_q0;
+	unsigned int reg_n_qx_17_16[3];
+	unsigned int reg_nfrac_qx_27_24[3];
+
+	struct r8t49n24x_dividers divs;
+};
+
+#define to_r8t49n24x_output(_hw) \
+	container_of(_hw, struct r8t49n24x_output, hw)
+
+#define to_clk_r8t49n24x_from_client(_client) \
+	container_of(_client, struct clk_r8t49n24x_chip, i2c_client)
+
+#define to_clk_r8t49n24x_from_nb(_nb) \
+	container_of(_nb, struct clk_r8t49n24x_chip, input_clk_nb)
+
+/**
+ * struct clk_register_offsets - register offsets for current context
+ * @oe_offset:		offset for current output enable and mode
+ * @oe_mask:		mask for current output enable
+ * @dis_mask:		mask for current output disable
+ * @n_17_16_offset:	offset for current output int divider (bits 17:16)
+ * @n_17_16_mask:	mask for current output int divider (bits 17:16)
+ * @n_15_8_offset:	offset for current output int divider (bits 15:8)
+ * @n_7_0_offset:	offset for current output int divider (bits 7:0)
+ * @nfrac_27_24_offset:	offset for current output frac divider (bits 27:24)
+ * @nfrac_27_24_mask:	mask for current output frac divider (bits 27:24)
+ * @nfrac_23_16_offset:	offset for current output frac divider (bits 23:16)
+ * @nfrac_15_8_offset:	offset for current output frac divider (bits 15:8)
+ * @nfrac_7_0_offset:	offset for current output frac divider (bits 7:0)
+ */
+struct clk_register_offsets {
+	u16 oe_offset;
+	u8 oe_mask;
+	u8 dis_mask;
+
+	u16 n_17_16_offset;
+	u8 n_17_16_mask;
+	u16 n_15_8_offset;
+	u16 n_7_0_offset;
+	u16 nfrac_27_24_offset;
+	u8 nfrac_27_24_mask;
+	u16 nfrac_23_16_offset;
+	u16 nfrac_15_8_offset;
+	u16 nfrac_7_0_offset;
+};
+
+int __renesas_bits_to_shift(unsigned int mask);
+int __renesas_i2c_write_bulk(struct i2c_client *client, struct regmap *map,
+			     unsigned int reg, u8 val[], size_t val_count);
+void r8t49n24x_get_offsets(u8 output_num, struct clk_register_offsets *offsets);
+int r8t49n24x_set_frequency(struct clk_r8t49n24x_chip *chip);
+int r8t49n24x_enable_output(struct clk_r8t49n24x_chip *chip, u8 output, bool enable);
+
+#endif /* #ifndef __8T49N24X_CORE_H_ */
diff --git a/drivers/clk/8t49n24x.c b/drivers/clk/8t49n24x.c
new file mode 100644
index 000000000..a48cd61ca
--- /dev/null
+++ b/drivers/clk/8t49n24x.c
@@ -0,0 +1,565 @@
+// SPDX-License-Identifier: GPL-2.0
+/* 8t49n24x.c - Program 8T49N24x settings via I2C.
+ *
+ * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "8t49n24x-core.h"
+
+#define OUTPUTMODE_HIGHZ		0
+#define OUTPUTMODE_LVDS			2
+#define R8T49N24X_MIN_FREQ		1000000U
+#define R8T49N24X_MAX_FREQ		300000000U
+
+enum clk_r8t49n24x_variant { renesas24x };
+
+static unsigned int __mask_and_shift(unsigned int value, unsigned int mask)
+{
+	value &= mask;
+	return value >> __renesas_bits_to_shift(mask);
+}
+
+/**
+ * r8t49n24x_set_output_mode - Set the mode for a particular clock
+ * output in the register.
+ * @reg:	The current register value before setting the mode.
+ * @mask:	The bitmask identifying where in the register the
+ *		output mode is stored.
+ * @mode:	The mode to set.
+ *
+ * Return: the new register value with the specified mode bits set.
+ */
+static int r8t49n24x_set_output_mode(u8 reg, u8 mask, u8 mode)
+{
+	if (((reg & mask) >> __renesas_bits_to_shift(mask)) == OUTPUTMODE_HIGHZ) {
+		reg = reg & ~mask;
+		reg |= OUTPUTMODE_LVDS << __renesas_bits_to_shift(mask);
+	}
+	return reg;
+}
+
+/**
+ * r8t49n24x_read_from_hw - Get the current values on the hw
+ * @chip:	Device data structure
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+static int r8t49n24x_read_from_hw(struct clk_r8t49n24x_chip *chip)
+{
+	int err;
+	u32 tmp = 0, tmp2;
+	unsigned int i;
+	struct i2c_client *client = chip->i2c_client;
+
+	err = regmap_read(chip->regmap, R8T49N24X_REG_DSM_INT_8, &chip->reg_dsm_int_8);
+	if (err) {
+		dev_err(&client->dev, "error reading R8T49N24X_REG_DSM_INT_8: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "reg_dsm_int_8: 0x%x", chip->reg_dsm_int_8);
+
+	err = regmap_read(chip->regmap, R8T49N24X_REG_DSMFRAC_20_16_MASK,
+			  &chip->reg_dsm_frac_20_16);
+	if (err) {
+		dev_err(&client->dev, "error reading R8T49N24X_REG_DSMFRAC_20_16_MASK: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "reg_dsm_frac_20_16: 0x%x", chip->reg_dsm_frac_20_16);
+
+	err = regmap_read(chip->regmap, R8T49N24X_REG_OUTEN, &chip->reg_out_en_x);
+	if (err) {
+		dev_err(&client->dev, "error reading R8T49N24X_REG_OUTEN: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "reg_out_en_x: 0x%x", chip->reg_out_en_x);
+
+	err = regmap_read(chip->regmap, R8T49N24X_REG_OUTMODE0_1, &tmp);
+	if (err) {
+		dev_err(&client->dev, "error reading R8T49N24X_REG_OUTMODE0_1: %i", err);
+		return err;
+	}
+
+	tmp2 = r8t49n24x_set_output_mode(tmp, R8T49N24X_REG_OUTMODE0_MASK, OUTPUTMODE_LVDS);
+	tmp2 = r8t49n24x_set_output_mode(tmp2, R8T49N24X_REG_OUTMODE1_MASK, OUTPUTMODE_LVDS);
+	dev_dbg(&client->dev,
+		"reg_out_mode_0_1 original: 0x%x. After OUT0/1 to LVDS if necessary: 0x%x",
+		tmp, tmp2);
+
+	chip->reg_out_mode_0_1 = tmp2;
+	err = regmap_read(chip->regmap, R8T49N24X_REG_OUTMODE2_3, &tmp);
+	if (err) {
+		dev_err(&client->dev, "error reading R8T49N24X_REG_OUTMODE2_3: %i", err);
+		return err;
+	}
+
+	tmp2 = r8t49n24x_set_output_mode(tmp, R8T49N24X_REG_OUTMODE2_MASK, OUTPUTMODE_LVDS);
+	tmp2 = r8t49n24x_set_output_mode(tmp2, R8T49N24X_REG_OUTMODE3_MASK, OUTPUTMODE_LVDS);
+	dev_dbg(&client->dev,
+		"reg_out_mode_2_3 original: 0x%x. After OUT2/3 to LVDS if necessary: 0x%x",
+		tmp, tmp2);
+
+	chip->reg_out_mode_2_3 = tmp2;
+	err = regmap_read(chip->regmap, R8T49N24X_REG_Q_DIS, &chip->reg_qx_dis);
+	if (err) {
+		dev_err(&client->dev, "error reading R8T49N24X_REG_Q_DIS: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "reg_qx_dis: 0x%x", chip->reg_qx_dis);
+
+	err = regmap_read(chip->regmap, R8T49N24X_REG_NS1_Q0, &chip->reg_ns1_q0);
+	if (err) {
+		dev_err(&client->dev, "error reading R8T49N24X_REG_NS1_Q0: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "reg_ns1_q0: 0x%x", chip->reg_ns1_q0);
+
+	for (i = 1; i <= NUM_OUTPUTS; i++) {
+		struct clk_register_offsets offsets;
+
+		r8t49n24x_get_offsets(i, &offsets);
+
+		err = regmap_read(chip->regmap, offsets.n_17_16_offset,
+				  &chip->reg_n_qx_17_16[i - 1]);
+		if (err) {
+			dev_err(&client->dev,
+				"error reading n_17_16_offset output %d (offset: 0x%x): %i",
+				i, offsets.n_17_16_offset, err);
+			return err;
+		}
+
+		dev_dbg(&client->dev, "reg_n_qx_17_16[Q%u]: 0x%x", i,
+			chip->reg_n_qx_17_16[i - 1]);
+
+		err = regmap_read(chip->regmap, offsets.nfrac_27_24_offset,
+				  &chip->reg_nfrac_qx_27_24[i - 1]);
+		if (err) {
+			dev_err(&client->dev,
+				"error reading nfrac_27_24_offset output %d (offset: 0x%x): %i",
+				i, offsets.nfrac_27_24_offset,
+				err);
+			return err;
+		}
+
+		dev_dbg(&client->dev, "reg_nfrac_qx_27_24[Q%u]: 0x%x", i,
+			chip->reg_nfrac_qx_27_24[i - 1]);
+	}
+
+	dev_dbg(&client->dev, "initial values read from chip successfully");
+
+	/* Also read DBL_DIS to determine whether the doubler is disabled. */
+	err = regmap_read(chip->regmap, R8T49N24X_REG_DBL_DIS, &tmp);
+	if (err) {
+		dev_err(&client->dev, "error reading R8T49N24X_REG_DBL_DIS: %i", err);
+		return err;
+	}
+
+	chip->doubler_disabled = __mask_and_shift(tmp, R8T49N24X_REG_DBL_DIS_MASK);
+	dev_dbg(&client->dev, "doubler_disabled: %d", chip->doubler_disabled);
+
+	return 0;
+}
+
+/**
+ * r8t49n24x_set_rate - Sets the specified output clock to the specified rate.
+ * @hw:		clk_hw struct that identifies the specific output clock.
+ * @rate:	the rate (in Hz) for the specified clock.
+ * @parent_rate:(not sure) the rate for a parent signal (e.g.,
+ *		the VCO feeding the output)
+ *
+ * This function will call r8t49n24x_set_frequency, which means it will
+ * calculate divider for all requested outputs and update the attached
+ * device (issue I2C commands to update the registers).
+ *
+ * Return: 0 on success.
+ */
+static int r8t49n24x_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	int err;
+
+	/*
+	 * hw->clk is the pointer to the specific output clock the user is
+	 * requesting. We use hw to get back to the output structure for
+	 * the output clock. Set the requested rate in the output structure.
+	 * Note that container_of cannot be used to find the device structure
+	 * (clk_r8t49n24x_chip) from clk_hw, because clk_r8t49n24x_chip has an array
+	 * of r8t49n24x_output structs. That is why it is necessary to use
+	 * output->chip to access the device structure.
+	 */
+	struct r8t49n24x_output *output = to_r8t49n24x_output(hw);
+	struct i2c_client *client = output->chip->i2c_client;
+
+	if (rate < output->chip->min_freq || rate > output->chip->max_freq) {
+		dev_err(&client->dev,
+			"requested frequency (%luHz) is out of range\n", rate);
+		return -EINVAL;
+	}
+
+	/*
+	 * Set the requested frequency in the output data structure, and then
+	 * call r8t49n24x_set_frequency. r8t49n24x_set_frequency considers all
+	 * requested frequencies when deciding on a vco frequency and
+	 * calculating dividers.
+	 */
+	output->requested = rate;
+
+	dev_dbg(&client->dev, "calling r8t49n24x_set_frequency for Q%u. rate: %lu",
+		output->index, rate);
+	err = r8t49n24x_set_frequency(output->chip);
+	if (err)
+		dev_dbg(&client->dev, "error calling set_frequency: %d", err);
+
+	return err;
+}
+
+/**
+ * r8t49n24x_determine_rate - get valid rate that is closest to the requested rate
+ * @hw:		clk_hw struct that identifies the specific output clock.
+ * @req:	the clk rate request struct.
+ *
+ * Returns the closest rate to the requested rate actually supported by the
+ * chip.
+ *
+ * Return: adjusted rate
+ */
+static int r8t49n24x_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	/*
+	 * The chip has fractional output dividers, so assume it
+	 * can provide the requested rate.
+	 *
+	 * TODO: figure out the closest rate that chip can support
+	 * within a low error threshold and return that rate.
+	 */
+	return req->rate;
+}
+
+/**
+ * r8t49n24x_unprepare - disable an output clock.
+ * @hw:		clk_hw struct that identifies the specific output clock.
+ */
+static void r8t49n24x_unprepare(struct clk_hw *hw)
+{
+	struct r8t49n24x_output *output = to_r8t49n24x_output(hw);
+
+	r8t49n24x_enable_output(output->chip, output->index, false);
+}
+
+/**
+ * r8t49n24x_prepare - enable an output clock.
+ * @hw:		clk_hw struct that identifies the specific output clock.
+ *
+ * Return: 0 for success.
+ */
+static int r8t49n24x_prepare(struct clk_hw *hw)
+{
+	struct r8t49n24x_output *output = to_r8t49n24x_output(hw);
+
+	return r8t49n24x_enable_output(output->chip, output->index, true);
+}
+
+/**
+ * r8t49n24x_recalc_rate - return the frequency being provided by the clock.
+ * @hw:			clk_hw struct that identifies the specific output clock.
+ * @parent_rate:	(not sure) the rate for a parent signal (e.g., the
+ *			VCO feeding the output)
+ *
+ * This API appears to be used to read the current values from the hardware
+ * and report the frequency being provided by the clock. Without this function,
+ * the clock will be initialized to 0 by default. The OS appears to be
+ * calling this to find out what the current value of the clock is at
+ * startup, so it can determine when .set_rate is actually changing the
+ * frequency.
+ *
+ * Return: the frequency of the specified clock.
+ */
+static unsigned long r8t49n24x_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct r8t49n24x_output *output = to_r8t49n24x_output(hw);
+
+	return output->requested;
+}
+
+/*
+ * Note that .prepare and .unprepare appear to be used more in Gates.
+ * They do not appear to be necessary for this device.
+ * Instead, update the device when .set_rate is called.
+ */
+static const struct clk_ops r8t49n24x_clk_ops = {
+	.recalc_rate = r8t49n24x_recalc_rate,
+	.determine_rate = r8t49n24x_determine_rate,
+	.set_rate = r8t49n24x_set_rate,
+	.prepare = r8t49n24x_prepare,
+	.unprepare = r8t49n24x_unprepare,
+};
+
+static bool r8t49n24x_regmap_is_volatile(struct device *dev, unsigned int reg)
+{
+	return false;
+}
+
+static const struct regmap_config r8t49n24x_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+	.max_register = 0xffff,
+	.volatile_reg = r8t49n24x_regmap_is_volatile,
+};
+
+/**
+ * r8t49n24x_clk_notifier_cb - Clock rate change callback
+ * @nb:		Pointer to notifier block
+ * @event:	Notification reason
+ * @data:	Pointer to notification data object
+ *
+ * This function is called when the input clock frequency changes.
+ * The callback checks whether a valid bus frequency can be generated after the
+ * change. If so, the change is acknowledged, otherwise the change is aborted.
+ * New dividers are written to the HW in the pre- or post change notification
+ * depending on the scaling direction.
+ *
+ * Return:	NOTIFY_STOP if the rate change should be aborted, NOTIFY_OK
+ *		to acknowledge the change, NOTIFY_DONE if the notification is
+ *		considered irrelevant.
+ */
+static int r8t49n24x_clk_notifier_cb(struct notifier_block *nb,
+				     unsigned long event, void *data)
+{
+	struct clk_notifier_data *ndata = data;
+	struct clk_r8t49n24x_chip *chip = to_clk_r8t49n24x_from_nb(nb);
+	int err;
+
+	dev_info(&chip->i2c_client->dev, "input changed: %lu Hz. event: %lu",
+		 ndata->new_rate, event);
+
+	switch (event) {
+	case PRE_RATE_CHANGE: {
+		dev_dbg(&chip->i2c_client->dev, "PRE_RATE_CHANGE\n");
+		return NOTIFY_OK;
+	}
+	case POST_RATE_CHANGE:
+		chip->input_clk_freq = ndata->new_rate;
+		/*
+		 * Can't call clock API clk_set_rate here; I believe
+		 * it will be ignored if the rate is the same as we
+		 * set previously. Need to call our internal function.
+		 */
+		dev_dbg(&chip->i2c_client->dev, "POST_RATE_CHANGE. Calling r8t49n24x_set_frequency\n");
+		err = r8t49n24x_set_frequency(chip);
+		if (err)
+			dev_dbg(&chip->i2c_client->dev, "error setting frequency (%i)\n", err);
+		return NOTIFY_OK;
+	case ABORT_RATE_CHANGE:
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static struct clk_hw *of_clk_r8t49n24x_get(struct of_phandle_args *clkspec,
+					   void *_data)
+{
+	struct clk_r8t49n24x_chip *chip = _data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= ARRAY_SIZE(chip->clk)) {
+		pr_err("invalid clock index %u for provider %pOF\n", idx, clkspec->np);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &chip->clk[idx].hw;
+}
+
+/**
+ * r8t49n24x_probe - main entry point for ccf driver
+ * @client:	pointer to i2c_client structure
+ * @id:		pointer to i2c_device_id structure
+ *
+ * Main entry point function that gets called to initialize the driver.
+ *
+ * Return: 0 for success.
+ */
+static int r8t49n24x_probe(struct i2c_client *client,
+			   const struct i2c_device_id *id)
+{
+	struct clk_r8t49n24x_chip *chip;
+	struct clk_init_data init;
+
+	int err, i;
+	char buf[6];
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	init.ops = &r8t49n24x_clk_ops;
+	init.flags = 0;
+	init.num_parents = 0;
+	chip->i2c_client = client;
+
+	chip->min_freq = R8T49N24X_MIN_FREQ;
+	chip->max_freq = R8T49N24X_MAX_FREQ;
+
+	for (i = 0; i <= NUM_INPUTS; i++) {
+		char name[12];
+
+		sprintf(name, i == NUM_INPUTS ? "xtal" : "clk%i", i);
+		dev_dbg(&client->dev, "attempting to get %s", name);
+		chip->input_clk = devm_clk_get_optional(&client->dev, name);
+		if (chip->input_clk) {
+			err = 0;
+			chip->input_clk_num = i;
+			break;
+		}
+	}
+
+	if (IS_ERR(chip->input_clk)) {
+		return dev_err_probe(&client->dev, PTR_ERR(chip->input_clk),
+				     "can't get input clock/xtal\n");
+	}
+
+	chip->input_clk_freq = clk_get_rate(chip->input_clk);
+	dev_dbg(&client->dev, "Frequency from clk in device tree: %uHz", chip->input_clk_freq);
+
+	chip->input_clk_nb.notifier_call = r8t49n24x_clk_notifier_cb;
+	if (clk_notifier_register(chip->input_clk, &chip->input_clk_nb))
+		dev_warn(&client->dev, "Unable to register clock notifier for input_clk.");
+
+	dev_dbg(&client->dev, "about to read settings: %zu", ARRAY_SIZE(chip->settings));
+
+	err = of_property_read_u8_array(client->dev.of_node, "renesas,settings", chip->settings,
+					ARRAY_SIZE(chip->settings));
+	if (!err) {
+		dev_dbg(&client->dev, "settings property specified in DT");
+		chip->has_settings = true;
+	} else if (err == -EOVERFLOW) {
+		dev_dbg(&client->dev, "EOVERFLOW reading settings. ARRAY_SIZE: %zu",
+			ARRAY_SIZE(chip->settings));
+			return err;
+	} else {
+		dev_dbg(&client->dev,
+			"settings property missing in DT (or an error that can be ignored: %i).",
+			err);
+	}
+
+	/*
+	 * Requested output frequencies cannot be specified in the DT.
+	 * Either a consumer needs to use the clock API to request the rate.
+	 * Use clock-names in DT to specify the output clock.
+	 */
+
+	chip->regmap = devm_regmap_init_i2c(client, &r8t49n24x_regmap_config);
+	if (IS_ERR(chip->regmap)) {
+		dev_err(&client->dev, "failed to allocate register map\n");
+		return PTR_ERR(chip->regmap);
+	}
+
+	dev_dbg(&client->dev, "call i2c_set_clientdata");
+	i2c_set_clientdata(client, chip);
+
+	if (chip->has_settings) {
+		/*
+		 * A raw settings array was specified in the DT. Write the
+		 * settings to the device immediately.
+		 */
+		err = __renesas_i2c_write_bulk(chip->i2c_client, chip->regmap, 0, chip->settings,
+					       ARRAY_SIZE(chip->settings));
+		if (err) {
+			dev_err(&client->dev, "error writing all settings to chip (%i)\n", err);
+			return err;
+		}
+		dev_dbg(&client->dev, "successfully wrote full settings array");
+	}
+
+	/*
+	 * Whether or not settings were written to the device, read all
+	 * current values from the hw.
+	 */
+	dev_dbg(&client->dev, "read from HW");
+	err = r8t49n24x_read_from_hw(chip);
+	if (err)
+		return err;
+
+	/* Create all 4 clocks */
+	for (i = 0; i < NUM_OUTPUTS; i++) {
+		init.name = kasprintf(GFP_KERNEL, "%s.Q%i", client->dev.of_node->name, i);
+		chip->clk[i].chip = chip;
+		chip->clk[i].hw.init = &init;
+		chip->clk[i].index = i;
+		err = devm_clk_hw_register(&client->dev, &chip->clk[i].hw);
+		kfree(init.name); /* clock framework made a copy of the name */
+		if (err) {
+			dev_err(&client->dev, "clock registration failed\n");
+			return err;
+		}
+		dev_dbg(&client->dev, "successfully registered Q%i", i);
+	}
+
+	err = of_clk_add_hw_provider(client->dev.of_node, of_clk_r8t49n24x_get, chip);
+	if (err) {
+		dev_err(&client->dev, "unable to add clk provider\n");
+		return err;
+	}
+
+	if (chip->input_clk_num == NUM_INPUTS)
+		sprintf(buf, "XTAL");
+	else
+		sprintf(buf, "CLK%i", chip->input_clk_num);
+
+	dev_info(&client->dev,
+		 "probe success. input freq: %uHz (%s), settings string? %s\n",
+		 chip->input_clk_freq, buf,
+		 chip->has_settings ? "true" : "false");
+
+	return 0;
+}
+
+static int r8t49n24x_remove(struct i2c_client *client)
+{
+	struct clk_r8t49n24x_chip *chip = to_clk_r8t49n24x_from_client(&client);
+
+	of_clk_del_provider(client->dev.of_node);
+
+	if (!chip->input_clk)
+		clk_notifier_unregister(chip->input_clk, &chip->input_clk_nb);
+	return 0;
+}
+
+static const struct i2c_device_id r8t49n24x_id[] = {
+	 { "8t49n24x", renesas24x },
+	 {}
+};
+MODULE_DEVICE_TABLE(i2c, r8t49n24x_id);
+
+static const struct of_device_id r8t49n24x_of_match[] = {
+	{ .compatible = "renesas,8t49n241" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, r8t49n24x_of_match);
+
+static struct i2c_driver r8t49n24x_driver = {
+	.driver = {
+		.name = "8t49n24x",
+		.of_match_table = r8t49n24x_of_match,
+	},
+	.probe = r8t49n24x_probe,
+	.remove = r8t49n24x_remove,
+	.id_table = r8t49n24x_id,
+};
+
+module_i2c_driver(r8t49n24x_driver);
+
+MODULE_DESCRIPTION("8T49N24x ccf driver");
+MODULE_AUTHOR("David Cater <david.cater.jc@renesas.com>");
+MODULE_AUTHOR("Alex Helms <alexander.helms.jy@renesas.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c5b3dc973..f0f8e6b29 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -334,6 +334,27 @@ config COMMON_CLK_VC5
 	  This driver supports the IDT VersaClock 5 and VersaClock 6
 	  programmable clock generators.
 
+config COMMON_CLK_8T49N24X
+	tristate "Clock driver for Renesas 8T49N24x"
+	depends on I2C
+	depends on OF
+	select REGMAP_I2C
+	help
+	  This driver supports the Renesas 8T49N24x universal frequency
+	  translator product family. The only chip in the family that is currently
+	  supported is the 8T49N241. The driver supports setting the rate for
+	  all four outputs on the chip and automatically calculating/setting
+	  the appropriate VCO value.
+
+	  The driver can read a full register map from the DT,
+	  and will use that register map to initialize the attached part
+	  (via I2C) when the system boots. Any configuration not supported
+	  by the common clock framework must be done via the full register
+	  map, including optimized settings.
+
+	  All outputs are currently assumed to be LVDS, unless overridden
+	  in the full register map in the DT.
+
 config COMMON_CLK_STM32MP157
 	def_bool COMMON_CLK && MACH_STM32MP157
 	help
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e42312121..e1c39e01d 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -17,6 +17,8 @@ endif
 
 # hardware specific clock types
 # please keep this section sorted lexicographically by file path name
+clk-8t49n24x-objs 			+= 8t49n24x.o 8t49n24x-core.o
+obj-$(CONFIG_COMMON_CLK_8T49N24X)	+= clk-8t49n24x.o
 obj-$(CONFIG_MACH_ASM9260)		+= clk-asm9260.o
 obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+= clk-axi-clkgen.o
 obj-$(CONFIG_ARCH_AXXIA)		+= clk-axm5516.o
-- 
2.30.2

