Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4114041C39B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Sep 2021 13:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245731AbhI2Lpt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Sep 2021 07:45:49 -0400
Received: from mail-mw2nam12on2042.outbound.protection.outlook.com ([40.107.244.42]:48351
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229469AbhI2Lps (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Sep 2021 07:45:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkyWdZuuzpsOqJr/pqX2V3Qx8zuIgG/dTGzmqzcx86GXLRpXsBKoYmtYo+TjqqIM3tsEZKGNgXh4lMvjgKWk3O0eAp6IVuwS16tUHp+HCGLtbdcU3HqXCB+RVmLfrBN8uMCKN48FJbX++cvoIwY8J5Lypsaa/7C09cCi5v6Xkuz6oEBq/u0ty1/7wJveXZvyVcrPngRSCZXY/O+T9PGQuG//R4f+1oAZ1Ief6osQBSAVu1WbesqrxRRM3uYTH7UJcRdCHZfeNSrbrr/rZHDH3NVvmYmBSDysmtz+cBEZFWQGTO8d1uUxVDowz9VfVKhiAajHL6JVM11PWGOj1KRDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RbancQn79mcktWDNiJV95qtn3Xkmj//wyKMHNbJCVWk=;
 b=BbF5fp14x2w8MweP6OlnHb7DtScs/uUTsq/87dTiENt4VOtWfTKNZ1LLMbt8ww/Ek9DtleLe86pq11EciqaXWzg2DmbhCOWKya6/dy1v8+ssle2Z69uHawWCwLtQgiImLntkaoPs0eVdNoLUNsfPpRazdWfWTE2o3+TQJRHUyjNEzI5TwBDp2f+p1phofoi3eC0czTmsMT79GthI2jvITjLrTjSKLGK0TmmnSsYO8hI+BzeNhapvY6pLWW39maZzgBW52LmNLe6/rpOEeO5YIL4jgEJuGTj/LAVFRXoX+5MWQnMnqGIX38jIExNje0/nXZs/hGjz0uklhZi57+AlKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=renesas.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbancQn79mcktWDNiJV95qtn3Xkmj//wyKMHNbJCVWk=;
 b=ldbu8Ig4BPWvuSU/p3z9nTx3IRbvLdqrV9W5MVtRS/AZOvE9Dk2qNYqxbsdhRk1+zvj+GBhANOjzmwPz5qjrAa3TQpUBoxoImjiR7FETXrP0HlYxsJcrZ9tUVJwCRTvkz1YIo8gHwhf1nSHTaAe1gLBsMlNQze683WUHCus4qYk=
Received: from BN6PR11CA0056.namprd11.prod.outlook.com (2603:10b6:404:f7::18)
 by PH0PR02MB7736.namprd02.prod.outlook.com (2603:10b6:510:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 29 Sep
 2021 11:44:04 +0000
Received: from BN1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::cb) by BN6PR11CA0056.outlook.office365.com
 (2603:10b6:404:f7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Wed, 29 Sep 2021 11:44:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT009.mail.protection.outlook.com (10.13.2.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Wed, 29 Sep 2021 11:44:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 29 Sep 2021 04:44:01 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 29 Sep 2021 04:44:01 -0700
Envelope-to: david.cater.jc@renesas.com,
 geert+renesas@glider.be,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 robh+dt@kernel.org,
 linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 alexander.helms.jy@renesas.com
Received: from [10.254.241.49] (port=58988)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mVY0G-00056r-UH; Wed, 29 Sep 2021 04:44:01 -0700
Subject: Re: [PATCH v6 2/2] clk: Add ccf driver for Renesas 8T49N241
To:     Alex Helms <alexander.helms.jy@renesas.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC:     <robh+dt@kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <geert+renesas@glider.be>,
        <david.cater.jc@renesas.com>, <michal.simek@xilinx.com>
References: <20210913170436.243-1-alexander.helms.jy@renesas.com>
 <20210913170436.243-3-alexander.helms.jy@renesas.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <e201d00b-2e7a-8808-162c-075a53c34921@xilinx.com>
Date:   Wed, 29 Sep 2021 13:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210913170436.243-3-alexander.helms.jy@renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a1ed6fe-1000-40fc-db54-08d9833e7038
X-MS-TrafficTypeDiagnostic: PH0PR02MB7736:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7736DAC2E20BB4E228641491C6A99@PH0PR02MB7736.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EE2R/VzaeRsjpfdQz6F8coqcnJmrGXEOGN9v9zn8MUF8Fgb+BfwXQzN5vM5GZNWVRB48MUPJstV2m5hSrJ6y27qihHTUFFwCHPZH9ShB8x2T538mAVJ/n80HYRQ30D6gMMFW2ysmRYL/j4h7n+UNDStBQZ6dgd8i54a5RRLAy+8U7GV+4LsxyHzCOR8XA0XwghFEa84lC7Q7DpF6iiqyiJWaDvKuF0uTbDiZ6j1V0I1grumcDhLzpE6QSoxyOK3VSRYWpZlqAd0tyxBkO+9EGdQVdjI+xNrOmqrjuJijQIKnZ8sYtozZyKuyWgAX3K9kn/tG+F36MCPTJ0iYWiyyuHfhGEmJGOv6iJ5hVmSiebLt5uU514Je1iXKTPGet/Fj+buRvY71Knlm9640duKWYJtzejvcxV/3QFzW/PPHBFShFjqmQD044fg7cTiOm4koj/b9WYDZbjYdGE3TKKC/RkTDkerN9B6kh/qxtOaaTwJNZScMb3XHk3ljW01yMsY3e+rNZEwjUyIVcyjvWrdrYGCAUmbRdb1V11YAMwQAhyy1n99X2wDYij4GufcRZicVAkp3XAt+DbThPW7oFZvhDBEzTXYbS0SEpUWH0WgGKsjc3mEVdhAOIP4zc8e/G4aoLXBk1nX3Buv+s8EsUAe09fF0IX1XPkUX/U8uW4hVaCV15s2j26Jv0T8lQTdBgrhI0n2y4iLQxRTkBYph5fIETTOf8gjY9Rk+usF9ruwFnyn5YGe6bPPvMnN2Djdp5y86lXCsAHp5gAwdHgX5iFUKnA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(110136005)(36906005)(54906003)(316002)(7636003)(356005)(8676002)(6666004)(83380400001)(53546011)(31696002)(2906002)(82310400003)(2616005)(426003)(36756003)(186003)(26005)(31686004)(336012)(70586007)(70206006)(47076005)(36860700001)(4326008)(44832011)(30864003)(5660300002)(107886003)(7416002)(8936002)(508600001)(9786002)(50156003)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 11:44:04.2141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1ed6fe-1000-40fc-db54-08d9833e7038
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7736
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 9/13/21 7:04 PM, Alex Helms wrote:
> This is a common clock framework driver that supports the 8T49N241 chip.
> No other chips in the family are currently supported. The driver
> supports setting the rate for all four outputs on the chip and
> automatically calculating/setting the appropriate VCO value.
> 
> The driver can read a full register map from the device tree
> and will use that register map to initialize the attached device
> (via I2C) when the system boots. Any configuration not supported by
> the common clock framework must be done via the full register map,
> including optimized settings.
> 
> All outputs are currently assumed to be LVDS unless overridden in
> the full register map in the DT.
> 
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/clk/8t49n24x-core.c | 836 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/8t49n24x-core.h | 250 +++++++++++
>  drivers/clk/8t49n24x.c      | 572 ++++++++++++++++++++++++
>  drivers/clk/Kconfig         |  21 +
>  drivers/clk/Makefile        |   2 +
>  6 files changed, 1682 insertions(+)
>  create mode 100644 drivers/clk/8t49n24x-core.c
>  create mode 100644 drivers/clk/8t49n24x-core.h
>  create mode 100644 drivers/clk/8t49n24x.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b470d369..2a66c82d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15939,6 +15939,7 @@ M:	Alex Helms <alexander.helms.jy@renesas.com>
>  M:	David Cater <david.cater.jc@renesas.com>
>  S:	Odd Fixes
>  F:	Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> +F:	drivers/clk/8t49n24x*
>  
>  RENESAS CLOCK DRIVERS
>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
> diff --git a/drivers/clk/8t49n24x-core.c b/drivers/clk/8t49n24x-core.c
> new file mode 100644
> index 000000000..0e8ad92b2
> --- /dev/null
> +++ b/drivers/clk/8t49n24x-core.c
> @@ -0,0 +1,836 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* 8t49n24x-core.c - Program 8T49N24x settings via I2C (common code)
> + *
> + * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +
> +#include "8t49n24x-core.h"
> +
> +/*
> + * In Timing Commander, Q0 is changed from 25MHz to Q0 75MHz, the following
> + * changes occur:
> + *
> + * 2 bytes change in EEPROM data string.
> + *
> + * DSM_INT R0025[0],R0026[7:0] : 35 => 30
> + * NS2_Q0 R0040[7:0],R0041[7:0] : 14 => 4
> + *
> + * In EEPROM
> + * 1. R0026
> + * 2. R0041
> + *
> + * Note that VCO_Frequency (metadata) also changed (3500 =>3000).
> + * This reflects a change to DSM_INT.
> + *
> + * Note that the Timing Commander code has workarounds in the workflow scripts
> + * to handle dividers for the 8T49N241 (because the development of that GUI
> + * predates chip override functionality). That affects NS1_Qx (x in 1-3)
> + * and NS2_Qx. NS1_Qx contains the upper bits of NS_Qx, and NS2_Qx contains
> + * the lower bits. That is NOT the case for Q0, though. In that case NS1_Q0
> + * is the 1st stage output divider (/5, /6, /4) and NS2_Q0 is the 16-bit
> + * second stage (with actual divide being twice the value stored in the
> + * register).
> + *
> + * NS1_Q0 R003F[1:0]
> + */
> +
> +#define RENESAS24X_VCO_MIN			2999997000u
> +#define RENESAS24X_VCO_MAX			4000004000u
> +#define RENESAS24X_VCO_OPT			3500000000u
> +#define RENESAS24X_MIN_INT_DIVIDER	6
> +#define RENESAS24X_MIN_NS1			4
> +#define RENESAS24X_MAX_NS1			6
> +
> +static u8 q0_ns1_options[3] = { 5, 6, 4 };
> +
> +/**
> + * __renesas_bits_to_shift - num bits to shift given specified mask
> + * @mask:	32-bit word input to count zero bits on right
> + *
> + * Given a bit mask indicating where a value will be stored in
> + * a register, return the number of bits you need to shift the value
> + * before ORing it into the register value.
> + *
> + * Return: number of bits to shift
> + */
> +int __renesas_bits_to_shift(unsigned int mask)
> +{
> +	/* the number of zero bits on the right */
> +	unsigned int c = 32;
> +
> +	mask &= ~mask + 1;
> +	if (mask)
> +		c--;
> +	if (mask & 0x0000FFFF)
> +		c -= 16;
> +	if (mask & 0x00FF00FF)
> +		c -= 8;
> +	if (mask & 0x0F0F0F0F)
> +		c -= 4;
> +	if (mask & 0x33333333)
> +		c -= 2;
> +	if (mask & 0x55555555)
> +		c -= 1;
> +	return c;
> +}
> +
> +/*
> + * TODO: Consider replacing this with regmap_multi_reg_write, which
> + * supports introducing a delay after each write. Experiment to see if
> + * the writes succeed consistently when using that API.
> + */
> +static int regmap_bulk_write_with_retry(struct regmap *map, unsigned int offset,
> +					u8 *val, int val_count,
> +					int max_attempts)
> +{
> +	int err = 0, count = 1;
> +
> +	do {
> +		err = regmap_bulk_write(map, offset, val, val_count);
> +		if (err == 0)
> +			return 0;
> +		usleep_range(100, 200);
> +	} while (count++ <= max_attempts);
> +	return err;
> +}
> +
> +static int regmap_write_with_retry(struct regmap *map, unsigned int offset,
> +				   unsigned int val, int max_attempts)
> +{
> +	int err = 0, count = 1;
> +
> +	do {
> +		err = regmap_write(map, offset, val);
> +		if (err == 0)
> +			return 0;
> +		usleep_range(100, 200);
> +	} while (count++ <= max_attempts);
> +	return err;
> +}
> +
> +/*
> + * TODO: Consider using regmap_multi_reg_write instead. Explore
> + * use of regmap to configure WRITE_BLOCK_SIZE, and using the delay
> + * mechanism in regmap_multi_reg_write instead of retrying multiple
> + * times (regmap_bulk_write_with_retry).
> + */
> +int __renesas_i2c_write_bulk(struct i2c_client *client, struct regmap *map,
> +			     unsigned int reg, u8 val[], size_t val_count)
> +{
> +	char dbg[128];
> +	u8 block[WRITE_BLOCK_SIZE];
> +	unsigned int block_offset = reg;
> +	int x = 0, err = 0, currentOffset = 0;
> +
> +	dev_dbg(&client->dev,
> +		"I2C->0x%04x : [hex] . First byte: %02x, Second byte: %02x",
> +		reg, reg >> 8, reg & 0xFF);
> +
> +	dbg[0] = 0;
> +
> +	for (x = 0; x < val_count; x++) {
> +		char data[4];
> +
> +		block[currentOffset++] = val[x];
> +		sprintf(data, "%02x ", val[x]);
> +		strcat(dbg, data);
> +		if (x > 0 && (x + 1) % WRITE_BLOCK_SIZE == 0) {
> +			dev_dbg(&client->dev, "%s", dbg);
> +			dbg[0] = '\0';
> +			sprintf(dbg,
> +				"(loop) calling regmap_bulk_write @ 0x%04x [%d bytes]",
> +				block_offset, WRITE_BLOCK_SIZE);
> +			dev_dbg(&client->dev, "%s", dbg);
> +			dbg[0] = '\0';
> +			err = regmap_bulk_write_with_retry(map, block_offset, block,
> +							   WRITE_BLOCK_SIZE, 5);
> +			if (err)
> +				break;
> +			block_offset += WRITE_BLOCK_SIZE;
> +			currentOffset = 0;
> +		}
> +	}
> +	if (err == 0 && currentOffset > 0) {
> +		dev_dbg(&client->dev, "%s", dbg);
> +		dev_dbg(&client->dev,
> +			"(final) calling regmap_bulk_write @ 0x%04x [%d bytes]",
> +			block_offset, currentOffset);
> +		err = regmap_bulk_write_with_retry(map, block_offset, block, currentOffset, 5);
> +	}
> +
> +	return err;
> +}
> +
> +static int __i2c_write(struct i2c_client *client, struct regmap *map,
> +		       unsigned int reg, unsigned int val)
> +{
> +	int err = 0;
> +
> +	dev_dbg(&client->dev, "I2C->0x%x : [hex] %x", reg, val);
> +	err = regmap_write_with_retry(map, reg, val, 5);
> +	usleep_range(100, 200);
> +	return err;
> +}
> +
> +static int __i2c_write_with_mask(struct i2c_client *client, struct regmap *map,
> +				 unsigned int reg, u8 val, u8 original, u8 mask)
> +{
> +	return __i2c_write(client, map, reg,
> +			   ((val << __renesas_bits_to_shift(mask)) & mask) | (original & ~mask));
> +}
> +
> +int renesas24x_get_offsets(u8 output_num, struct clk_register_offsets *offsets)
> +{
> +	switch (output_num) {
> +	case 0:
> +		offsets->oe_offset = RENESAS24X_REG_OUTEN;
> +		offsets->oe_mask = RENESAS24X_REG_OUTEN0_MASK;
> +		offsets->dis_mask = RENESAS24X_REG_Q0_DIS_MASK;
> +		offsets->ns1_offset = RENESAS24X_REG_NS1_Q0;
> +		offsets->ns1_offset_mask = RENESAS24X_REG_NS1_Q0_MASK;
> +		offsets->ns2_15_8_offset = RENESAS24X_REG_NS2_Q0_15_8;
> +		offsets->ns2_7_0_offset = RENESAS24X_REG_NS2_Q0_7_0;
> +		break;
> +	case 1:
> +		offsets->oe_offset = RENESAS24X_REG_OUTEN;
> +		offsets->oe_mask = RENESAS24X_REG_OUTEN1_MASK;
> +		offsets->dis_mask = RENESAS24X_REG_Q1_DIS_MASK;
> +		offsets->n_17_16_offset = RENESAS24X_REG_N_Q1_17_16;
> +		offsets->n_17_16_mask = RENESAS24X_REG_N_Q1_17_16_MASK;
> +		offsets->n_15_8_offset = RENESAS24X_REG_N_Q1_15_8;
> +		offsets->n_7_0_offset = RENESAS24X_REG_N_Q1_7_0;
> +		offsets->nfrac_27_24_offset = RENESAS24X_REG_NFRAC_Q1_27_24;
> +		offsets->nfrac_27_24_mask = RENESAS24X_REG_NFRAC_Q1_27_24_MASK;
> +		offsets->nfrac_23_16_offset = RENESAS24X_REG_NFRAC_Q1_23_16;
> +		offsets->nfrac_15_8_offset = RENESAS24X_REG_NFRAC_Q1_15_8;
> +		offsets->nfrac_7_0_offset = RENESAS24X_REG_NFRAC_Q1_7_0;
> +		break;
> +	case 2:
> +		offsets->oe_offset = RENESAS24X_REG_OUTEN;
> +		offsets->oe_mask = RENESAS24X_REG_OUTEN2_MASK;
> +		offsets->dis_mask = RENESAS24X_REG_Q2_DIS_MASK;
> +		offsets->n_17_16_offset = RENESAS24X_REG_N_Q2_17_16;
> +		offsets->n_17_16_mask = RENESAS24X_REG_N_Q2_17_16_MASK;
> +		offsets->n_15_8_offset = RENESAS24X_REG_N_Q2_15_8;
> +		offsets->n_7_0_offset = RENESAS24X_REG_N_Q2_7_0;
> +		offsets->nfrac_27_24_offset = RENESAS24X_REG_NFRAC_Q2_27_24;
> +		offsets->nfrac_27_24_mask = RENESAS24X_REG_NFRAC_Q2_27_24_MASK;
> +		offsets->nfrac_23_16_offset = RENESAS24X_REG_NFRAC_Q2_23_16;
> +		offsets->nfrac_15_8_offset = RENESAS24X_REG_NFRAC_Q2_15_8;
> +		offsets->nfrac_7_0_offset = RENESAS24X_REG_NFRAC_Q2_7_0;
> +		break;
> +	case 3:
> +		offsets->oe_offset = RENESAS24X_REG_OUTEN;
> +		offsets->oe_mask = RENESAS24X_REG_OUTEN3_MASK;
> +		offsets->dis_mask = RENESAS24X_REG_Q3_DIS_MASK;
> +		offsets->n_17_16_offset = RENESAS24X_REG_N_Q3_17_16;
> +		offsets->n_17_16_mask = RENESAS24X_REG_N_Q3_17_16_MASK;
> +		offsets->n_15_8_offset = RENESAS24X_REG_N_Q3_15_8;
> +		offsets->n_7_0_offset = RENESAS24X_REG_N_Q3_7_0;
> +		offsets->nfrac_27_24_offset = RENESAS24X_REG_NFRAC_Q3_27_24;
> +		offsets->nfrac_27_24_mask = RENESAS24X_REG_NFRAC_Q3_27_24_MASK;
> +		offsets->nfrac_23_16_offset = RENESAS24X_REG_NFRAC_Q3_23_16;
> +		offsets->nfrac_15_8_offset = RENESAS24X_REG_NFRAC_Q3_15_8;
> +		offsets->nfrac_7_0_offset = RENESAS24X_REG_NFRAC_Q3_7_0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * renesas24x_calc_div_q0 - Calculate dividers and VCO freq to generate
> + *		the specified Q0 frequency.
> + * @chip:	Device data structure. contains all requested frequencies
> + *		for all outputs.
> + *
> + * The actual output divider is ns1 * ns2 * 2. fOutput = fVCO / (ns1 * ns2 * 2)
> + *
> + * The options for ns1 (when the source is the VCO) are 4,5,6. ns2 is a
> + * 16-bit value.
> + *
> + * chip->divs: structure for specifying ns1/ns2 values. If 0 after this
> + * function, Q0 is not requested
> + *
> + * Return: 0 on success, negative errno otherwise.
> + */
> +static int renesas24x_calc_div_q0(struct clk_renesas24x_chip *chip)
> +{
> +	u8 x = 0;
> +	u32 min_div = 0, max_div = 0, best_vco = 0;
> +	u16 min_ns2 = 0, max_ns2 = 0;
> +	bool is_lower_vco = false;
> +
> +	chip->divs.ns1_q0 = 0;
> +	chip->divs.ns2_q0 = 0;
> +
> +	if (chip->clk[0].requested == 0)
> +		return 0;
> +
> +	min_div = div64_u64((u64)RENESAS24X_VCO_MIN, chip->clk[0].requested * 2) * 2;
> +	max_div = div64_u64((u64)RENESAS24X_VCO_MAX, chip->clk[0].requested * 2) * 2;
> +
> +	dev_dbg(&chip->i2c_client->dev,
> +		"requested: %u, min_div: %u, max_div: %u",
> +		chip->clk[0].requested, min_div, max_div);
> +
> +	min_ns2 = div64_u64((u64)min_div, RENESAS24X_MAX_NS1 * 2);
> +	max_ns2 = div64_u64((u64)max_div, RENESAS24X_MIN_NS1 * 2);
> +
> +	dev_dbg(&chip->i2c_client->dev, "min_ns2: %u, max_ns2: %u", min_ns2, max_ns2);
> +
> +	for (x = 0; x < ARRAY_SIZE(q0_ns1_options); x++) {
> +		u16 y = min_ns2;
> +
> +		while (y <= max_ns2) {
> +			u32 actual_div = q0_ns1_options[x] * y * 2;
> +			u32 current_vco = actual_div * chip->clk[0].requested;
> +
> +			if (current_vco < RENESAS24X_VCO_MIN)
> +				dev_dbg(&chip->i2c_client->dev,
> +					"ignore div: (ns1=%u * ns2=%u * 2 * %u) == %u < %u",
> +					q0_ns1_options[x], y,
> +					chip->clk[0].requested, current_vco,
> +					RENESAS24X_VCO_MIN);
> +			else if (current_vco > RENESAS24X_VCO_MAX) {
> +				dev_dbg(&chip->i2c_client->dev,
> +					"ignore div: (ns1=%u * ns2=%u * 2 * %u) == %u > %u. EXIT LOOP.",
> +					q0_ns1_options[x], y,
> +					chip->clk[0].requested, current_vco,
> +					RENESAS24X_VCO_MAX);
> +				y = max_ns2;
> +			} else {
> +				bool use = false;
> +
> +				dev_dbg(&chip->i2c_client->dev,
> +					"contender: (ns1=%u * ns2=%u * 2 * %u) == %u [in range]",
> +					q0_ns1_options[x], y,
> +					chip->clk[0].requested, current_vco);
> +				if (current_vco <= RENESAS24X_VCO_OPT) {
> +					if (current_vco > best_vco || !is_lower_vco) {
> +						is_lower_vco = true;
> +						use = true;
> +					}
> +				} else if (!is_lower_vco && current_vco > best_vco) {
> +					use = true;
> +				}
> +				if (use) {
> +					chip->divs.ns1_q0 = x;
> +					chip->divs.ns2_q0 = y;
> +					best_vco = current_vco;
> +				}
> +			}
> +			y++;
> +		}
> +	}
> +
> +	dev_dbg(&chip->i2c_client->dev,
> +		"best: (ns1=%u [/%u] * ns2=%u * 2 * %u) == %u",
> +		chip->divs.ns1_q0, q0_ns1_options[chip->divs.ns1_q0],
> +		chip->divs.ns2_q0, chip->clk[0].requested, best_vco);
> +	return 0;
> +}
> +
> +/**
> + * renesas24x_calc_divs - Calculate dividers to generate the specified frequency.
> + * @chip:	Device data structure. contains all requested frequencies
> + *		for all outputs.
> + *
> + * Calculate the clock dividers (dsmint, dsmfrac for vco; ns1/ns2 for q0,
> + * n/nfrac for q1-3) for a given target frequency.
> + *
> + * Return: 0 on success, negative errno otherwise.
> + */
> +static int renesas24x_calc_divs(struct clk_renesas24x_chip *chip)
> +{
> +	u32 vco = 0;
> +	int result = 0;
> +
> +	result = renesas24x_calc_div_q0(chip);
> +	if (result < 0)
> +		return result;
> +
> +	dev_dbg(&chip->i2c_client->dev,
> +		"after renesas24x_calc_div_q0. ns1: %u [/%u], ns2: %u",
> +		chip->divs.ns1_q0, q0_ns1_options[chip->divs.ns1_q0],
> +		chip->divs.ns2_q0);
> +
> +	chip->divs.dsmint = 0;
> +	chip->divs.dsmfrac = 0;
> +
> +	if (chip->clk[0].requested > 0) {
> +		/* Q0 is in use and is governing the actual VCO freq */
> +		vco = q0_ns1_options[chip->divs.ns1_q0] * chip->divs.ns2_q0
> +			* 2 * chip->clk[0].requested;
> +	} else {
> +		u32 freq = 0;
> +		u32 walk = 0;
> +		u32 min_div = 0, max_div = 0;
> +		bool is_lower_vco = false;
> +
> +		/*
> +		 * Q0 is not in use. Use the first requested (fractional)
> +		 * output frequency as the one controlling the VCO.
> +		 */
> +		for (walk = 1; walk < NUM_OUTPUTS; walk++) {
> +			if (chip->clk[walk].requested != 0) {
> +				freq = chip->clk[walk].requested;
> +				break;
> +			}
> +		}
> +
> +		if (freq == 0) {
> +			dev_err(&chip->i2c_client->dev, "NO FREQUENCIES SPECIFIED");
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * First, determine the min/max div for the output frequency.
> +		 */
> +		min_div = RENESAS24X_MIN_INT_DIVIDER;
> +		max_div = div64_u64((u64)RENESAS24X_VCO_MAX, freq * 2) * 2;
> +
> +		dev_dbg(&chip->i2c_client->dev,
> +			"calc_divs for fractional output. freq: %u, min_div: %u, max_div: %u",
> +			freq, min_div, max_div);
> +
> +		walk = min_div;
> +
> +		while (walk <= max_div) {
> +			u32 current_vco = freq * walk;
> +
> +			dev_dbg(&chip->i2c_client->dev,
> +				"calc_divs for fractional output. walk: %u, freq: %u, vco: %u",
> +				walk, freq, vco);
> +			if (current_vco >= RENESAS24X_VCO_MIN &&
> +			    vco <= RENESAS24X_VCO_MAX) {
> +				if (current_vco <= RENESAS24X_VCO_OPT) {
> +					if (current_vco > vco || !is_lower_vco) {
> +						is_lower_vco = true;
> +						vco = current_vco;
> +					}
> +				} else if (!is_lower_vco && current_vco > vco) {
> +					vco = current_vco;
> +				}
> +			}
> +			/* Divider must be even. */
> +			walk += 2;
> +		}
> +	}
> +
> +	if (vco != 0) {
> +		u32 pfd = 0;
> +		u64 rem = 0;
> +		int x = 0;
> +
> +		/* Setup dividers for outputs with fractional dividers. */
> +		for (x = 1; x < NUM_OUTPUTS; x++) {
> +			if (chip->clk[x].requested != 0) {
> +				/*
> +				 * The value written to the chip is half
> +				 * the calculated divider.
> +				 */
> +				chip->divs.nint[x - 1] = div64_u64_rem((u64)vco,
> +								       chip->clk[x].requested * 2,
> +								       &rem);
> +				chip->divs.nfrac[x - 1] = div64_u64(rem * 1 << 28,
> +								    chip->clk[x].requested * 2);
> +				dev_dbg(&chip->i2c_client->dev,
> +					"div to get Q%i freq %u from vco %u: int part: %u, rem: %llu, frac part: %u",
> +					x, chip->clk[x].requested,
> +					vco, chip->divs.nint[x - 1], rem,
> +					chip->divs.nfrac[x - 1]);
> +			}
> +		}
> +
> +		/* Calculate freq for pfd */
> +		pfd = chip->input_clk_freq * (chip->doubler_disabled ? 1 : 2);
> +
> +		/*
> +		 * Calculate dsmint & dsmfrac:
> +		 * -----------------------------
> +		 * dsm = float(vco)/float(pfd)
> +		 * dsmfrac = dsm-floor(dsm) * 2^21
> +		 * rem = vco % pfd
> +		 * therefore:
> +		 * dsmfrac = (rem * 2^21)/pfd
> +		 */
> +		chip->divs.dsmint = div64_u64_rem(vco, pfd, &rem);
> +		chip->divs.dsmfrac = div64_u64(rem * 1 << 21, pfd);
> +
> +		dev_dbg(&chip->i2c_client->dev,
> +			"vco: %u, pfd: %u, dsmint: %u, dsmfrac: %u, rem: %llu",
> +			vco, pfd, chip->divs.dsmint,
> +			chip->divs.dsmfrac, rem);
> +	} else {
> +		dev_err(&chip->i2c_client->dev, "no integer divider in range found. NOT SUPPORTED.");
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * renesas24x_enable_output - Enable/disable a particular output
> + * @chip:	Device data structure
> + * @output:	Output to enable/disable
> + * @enable:	Enable (true/false)
> + *
> + * Return: passes on regmap_write return value.
> + */
> +static int renesas24x_enable_output(struct clk_renesas24x_chip *chip, u8 output,
> +				    bool enable)
> +{
> +	int err = 0;
> +	struct clk_register_offsets offsets;
> +	struct i2c_client *client = chip->i2c_client;
> +
> +	/*
> +	 * When an output is enabled, enable it in the original
> +	 * data read from the chip and cached. Otherwise it may be
> +	 * accidentally	turned off when another output is enabled.
> +	 *
> +	 * E.g., the driver starts with all outputs off in reg_out_en_x.
> +	 * Q1 is enabled with the appropriate mask. Q2 is then enabled,
> +	 * which results in Q1 being turned back off (because Q1 was off
> +	 * in reg_out_en_x).
> +	 */
> +
> +	err = renesas24x_get_offsets(output, &offsets);
> +	if (err) {
> +		dev_err(&client->dev, "error calling renesas24x_get_offsets for %d: %i",
> +			output, err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev,
> +		"q%u enable? %d. reg_out_en_x before: 0x%x, reg_out_mode_0_1 before: 0x%x",
> +		output, enable, chip->reg_out_en_x, chip->reg_out_mode_0_1);
> +
> +	dev_dbg(&client->dev, "reg_out_mode_2_3 before: 0x%x, reg_qx_dis before: 0x%x",
> +		chip->reg_out_mode_2_3, chip->reg_qx_dis);
> +
> +	chip->reg_out_en_x = chip->reg_out_en_x & ~offsets.oe_mask;
> +	if (enable)
> +		chip->reg_out_en_x |= (1 << __renesas_bits_to_shift(offsets.oe_mask));
> +
> +	chip->reg_qx_dis = chip->reg_qx_dis & ~offsets.dis_mask;
> +	dev_dbg(&client->dev,
> +		"q%u enable? %d. reg_qx_dis mask: 0x%x, before checking enable: 0x%x",
> +		output, enable, offsets.dis_mask, chip->reg_qx_dis);
> +
> +	if (!enable)
> +		chip->reg_qx_dis |= (1 << __renesas_bits_to_shift(offsets.dis_mask));
> +
> +	dev_dbg(&client->dev,
> +		"q%u enable? %d. reg_out_en_x after: 0x%x, reg_qx_dis after: 0x%x",
> +		output, enable, chip->reg_out_en_x, chip->reg_qx_dis);
> +
> +	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_OUTEN, chip->reg_out_en_x);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_OUTEN: %i", err);
> +		return err;
> +	}
> +
> +	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_OUTMODE0_1, chip->reg_out_mode_0_1);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_OUTMODE0_1: %i", err);
> +		return err;
> +	}
> +
> +	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_OUTMODE2_3, chip->reg_out_mode_2_3);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_OUTMODE2_3: %i", err);
> +		return err;
> +	}
> +
> +	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_Q_DIS, chip->reg_qx_dis);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_Q_DIS: %i", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * renesas24x_update_device - write registers to the chip
> + * @chip:	Device data structure
> + *
> + * Write all values to hardware that we	have calculated.
> + *
> + * Return: passes on regmap_bulk_write return value.
> + */
> +static int renesas24x_update_device(struct clk_renesas24x_chip *chip)
> +{
> +	int err = 0, x = -1;
> +	struct i2c_client *client = chip->i2c_client;
> +
> +	dev_dbg(&client->dev, "setting DSM_INT_8 (val %u @ %u)",
> +		chip->divs.dsmint >> 8, RENESAS24X_REG_DSM_INT_8);
> +
> +	err = __i2c_write_with_mask(client, chip->regmap, RENESAS24X_REG_DSM_INT_8,
> +				    (chip->divs.dsmint >> 8) & RENESAS24X_REG_DSM_INT_8_MASK,
> +				    chip->reg_dsm_int_8, RENESAS24X_REG_DSM_INT_8_MASK);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_DSM_INT_8: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev, "setting DSM_INT_7_0 (val %u @ 0x%x)",
> +		chip->divs.dsmint & 0xFF, RENESAS24X_REG_DSM_INT_7_0);
> +
> +	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_DSM_INT_7_0,
> +			  chip->divs.dsmint & 0xFF);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_DSM_INT_7_0: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev,
> +		"setting RENESAS24X_REG_DSMFRAC_20_16 (val %u @ 0x%x)",
> +		chip->divs.dsmfrac >> 16,
> +		RENESAS24X_REG_DSMFRAC_20_16);
> +
> +	err = __i2c_write_with_mask(client, chip->regmap, RENESAS24X_REG_DSMFRAC_20_16,
> +				    (chip->divs.dsmfrac >> 16) & RENESAS24X_REG_DSMFRAC_20_16_MASK,
> +				    chip->reg_dsm_int_8, RENESAS24X_REG_DSMFRAC_20_16_MASK);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_DSMFRAC_20_16: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev,
> +		"setting RENESAS24X_REG_DSMFRAC_15_8 (val %u @ 0x%x)",
> +		(chip->divs.dsmfrac >> 8) & 0xFF,
> +		RENESAS24X_REG_DSMFRAC_15_8);
> +
> +	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_DSMFRAC_15_8,
> +			  (chip->divs.dsmfrac >> 8) & 0xFF);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_DSMFRAC_15_8: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev,
> +		"setting RENESAS24X_REG_DSMFRAC_7_0 (val %u @ 0x%x)",
> +		chip->divs.dsmfrac & 0xFF,
> +		RENESAS24X_REG_DSMFRAC_7_0);
> +
> +	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_DSMFRAC_7_0,
> +			  chip->divs.dsmfrac & 0xFF);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_DSMFRAC_7_0: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev,
> +		"setting RENESAS24X_REG_NS1_Q0 (val %u @ 0x%x)",
> +		chip->divs.ns1_q0, RENESAS24X_REG_NS1_Q0);
> +
> +	err = __i2c_write_with_mask(client, chip->regmap, RENESAS24X_REG_NS1_Q0,
> +				    chip->divs.ns1_q0 & RENESAS24X_REG_NS1_Q0_MASK,
> +				    chip->reg_ns1_q0, RENESAS24X_REG_NS1_Q0_MASK);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_NS1_Q0: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev,
> +		"setting RENESAS24X_REG_NS2_Q0_15_8 (val %u @ 0x%x)",
> +		(chip->divs.ns2_q0 >> 8) & 0xFF, RENESAS24X_REG_NS2_Q0_15_8);
> +
> +	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_NS2_Q0_15_8,
> +			  (chip->divs.ns2_q0 >> 8) & 0xFF);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_NS2_Q0_15_8: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev,
> +		"setting RENESAS24X_REG_NS2_Q0_7_0 (val %u @ 0x%x)",
> +		chip->divs.ns2_q0 & 0xFF, RENESAS24X_REG_NS2_Q0_7_0);
> +
> +	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_NS2_Q0_7_0,
> +			  chip->divs.ns2_q0 & 0xFF);
> +	if (err) {
> +		dev_err(&client->dev, "error setting RENESAS24X_REG_NS2_Q0_7_0: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev,
> +		"calling renesas24x_enable_output for Q0. requestedFreq: %u",
> +		chip->clk[0].requested);
> +	renesas24x_enable_output(chip, 0, chip->clk[0].requested != 0);
> +
> +	dev_dbg(&client->dev, "writing values for q1-q3");
> +	for (x = 1; x < NUM_OUTPUTS; x++) {
> +		struct clk_register_offsets offsets;
> +
> +		if (chip->clk[x].requested != 0) {
> +			dev_dbg(&client->dev, "calling renesas24x_get_offsets for %u", x);
> +			err = renesas24x_get_offsets(x, &offsets);
> +			if (err) {
> +				dev_err(&client->dev, "error calling renesas24x_get_offsets: %i",
> +					err);
> +				return err;
> +			}
> +
> +			dev_dbg(&client->dev, "(q%u, nint: %u, nfrac: %u)",
> +				x, chip->divs.nint[x - 1],
> +				chip->divs.nfrac[x - 1]);
> +
> +			dev_dbg(&client->dev,
> +				"setting n_17_16_offset (q%u, val %u @ 0x%x)",
> +				x, chip->divs.nint[x - 1] >> 16,
> +				offsets.n_17_16_offset);
> +
> +			err = __i2c_write_with_mask(client, chip->regmap,
> +						    offsets.n_17_16_offset,
> +						    (chip->divs.nint[x - 1] >> 16) &
> +							offsets.n_17_16_mask,
> +						    chip->reg_n_qx_17_16[x - 1],
> +						    offsets.n_17_16_mask);
> +			if (err) {
> +				dev_err(&client->dev, "error setting n_17_16_offset: %i", err);
> +				return err;
> +			}
> +
> +			dev_dbg(&client->dev,
> +				"setting n_15_8_offset (q%u, val %u @ 0x%x)",
> +				x, (chip->divs.nint[x - 1] >> 8) & 0xFF,
> +				offsets.n_15_8_offset);
> +
> +			err = __i2c_write(client, chip->regmap,
> +					  offsets.n_15_8_offset,
> +					  (chip->divs.nint[x - 1] >> 8) & 0xFF);
> +			if (err) {
> +				dev_err(&client->dev, "error setting n_15_8_offset: %i", err);
> +				return err;
> +			}
> +
> +			dev_dbg(&client->dev,
> +				"setting n_7_0_offset (q%u, val %u @ 0x%x)",
> +				x, chip->divs.nint[x - 1] & 0xFF,
> +				offsets.n_7_0_offset);
> +
> +			err = __i2c_write(client, chip->regmap,
> +					  offsets.n_7_0_offset,
> +					  chip->divs.nint[x - 1] & 0xFF);
> +			if (err) {
> +				dev_err(&client->dev, "error setting n_7_0_offset: %i", err);
> +				return err;
> +			}
> +
> +			dev_dbg(&client->dev,
> +				"setting nfrac_27_24_offset (q%u, val %u @ 0x%x)",
> +				x, (chip->divs.nfrac[x - 1] >> 24),
> +				offsets.nfrac_27_24_offset);
> +
> +			err = __i2c_write_with_mask(client, chip->regmap,
> +						    offsets.nfrac_27_24_offset,
> +						    (chip->divs.nfrac[x - 1] >> 24) &
> +							offsets.nfrac_27_24_mask,
> +						    chip->reg_nfrac_qx_27_24[x - 1],
> +						    offsets.nfrac_27_24_mask);
> +			if (err) {
> +				dev_err(&client->dev, "error setting nfrac_27_24_offset: %i", err);
> +				return err;
> +			}
> +
> +			dev_dbg(&client->dev,
> +				"setting nfrac_23_16_offset (q%u, val %u @ 0x%x)",
> +				x, (chip->divs.nfrac[x - 1] >> 16) & 0xFF,
> +				offsets.nfrac_23_16_offset);
> +
> +			err = __i2c_write(client, chip->regmap,
> +					  offsets.nfrac_23_16_offset,
> +					  (chip->divs.nfrac[x - 1] >> 16) & 0xFF);
> +			if (err) {
> +				dev_err(&client->dev, "error setting nfrac_23_16_offset: %i", err);
> +				return err;
> +			}
> +
> +			dev_dbg(&client->dev,
> +				"setting nfrac_15_8_offset (q%u, val %u @ 0x%x)",
> +				x, (chip->divs.nfrac[x - 1] >> 8) & 0xFF,
> +				offsets.nfrac_15_8_offset);
> +
> +			err = __i2c_write(client, chip->regmap, offsets.nfrac_15_8_offset,
> +					  (chip->divs.nfrac[x - 1] >> 8) & 0xFF);
> +			if (err) {
> +				dev_err(&client->dev, "error setting nfrac_15_8_offset: %i", err);
> +				return err;
> +			}
> +
> +			dev_dbg(&client->dev,
> +				"setting nfrac_7_0_offset (q%u, val %u @ 0x%x)",
> +				x, chip->divs.nfrac[x - 1] & 0xFF,
> +				offsets.nfrac_7_0_offset);
> +
> +			err = __i2c_write(client, chip->regmap,
> +					  offsets.nfrac_7_0_offset,
> +					  chip->divs.nfrac[x - 1] & 0xFF);
> +			if (err) {
> +				dev_err(&client->dev, "error setting nfrac_7_0_offset: %i", err);
> +				return err;
> +			}
> +		}
> +		renesas24x_enable_output(chip, x, chip->clk[x].requested != 0);
> +		chip->clk[x].actual = chip->clk[x].requested;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * renesas24x_set_frequency - Adjust output frequency on the attached chip.
> + * @chip:	Device data structure, including all requested frequencies.
> + *
> + * Return: 0 on success.
> + */
> +int renesas24x_set_frequency(struct clk_renesas24x_chip *chip)
> +{
> +	int err = 0, x = 0;
> +	bool all_disabled = true;
> +	struct i2c_client *client = chip->i2c_client;
> +
> +	for (x = 0; x < NUM_OUTPUTS; x++) {
> +		if (chip->clk[x].requested == 0) {
> +			renesas24x_enable_output(chip, x, false);
> +			chip->clk[x].actual = 0;
> +		} else {
> +			all_disabled = false;
> +		}
> +	}
> +
> +	if (all_disabled)
> +		/*
> +		 * no requested frequencies, so nothing else to calculate
> +		 * or write to the chip. If the consumer wants to disable
> +		 * all outputs, they can request 0 for all frequencies.
> +		 */
> +		return 0;
> +
> +	if (chip->input_clk_freq == 0) {
> +		dev_err(&client->dev, "no input frequency; can't continue.");
> +		return -EINVAL;
> +	}
> +
> +	err = renesas24x_calc_divs(chip);
> +	if (err) {
> +		dev_err(&client->dev,
> +			"error calling renesas24x_calc_divs: %i", err);
> +		return err;
> +	}
> +
> +	err = renesas24x_update_device(chip);
> +	if (err) {
> +		dev_err(&client->dev, "error updating the device: %i", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/clk/8t49n24x-core.h b/drivers/clk/8t49n24x-core.h
> new file mode 100644
> index 000000000..0786aa03a
> --- /dev/null
> +++ b/drivers/clk/8t49n24x-core.h
> @@ -0,0 +1,250 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + * 8t49n24x-core.h - Program 8T49N24x settings via I2C (common code)
> + *
> + * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
> + */
> +
> +#ifndef __8T49N24X_CORE_H_
> +#define __8T49N24X_CORE_H_
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +
> +/*
> + * The configurations in the settings file have 0x317 registers (last offset is 0x316).
> + */
> +#define NUM_CONFIG_REGISTERS			0x317
> +#define NUM_INPUTS				2
> +#define NUM_OUTPUTS				4
> +#define WRITE_BLOCK_SIZE			2
> +
> +/* Non output-specific registers */
> +#define RENESAS24X_REG_DBL_DIS			0x6C
> +#define RENESAS24X_REG_DBL_DIS_MASK		0x01
> +#define RENESAS24X_REG_DSM_INT_8		0x25
> +#define RENESAS24X_REG_DSM_INT_8_MASK		0x01
> +#define RENESAS24X_REG_DSM_INT_7_0		0x26
> +#define RENESAS24X_REG_DSMFRAC_20_16		0x28
> +#define RENESAS24X_REG_DSMFRAC_20_16_MASK	0x1F
> +#define RENESAS24X_REG_DSMFRAC_15_8		0x29
> +#define RENESAS24X_REG_DSMFRAC_7_0		0x2A
> +#define RENESAS24X_REG_OUTEN			0x39
> +#define RENESAS24X_REG_OUTMODE0_1		0x3E
> +#define RENESAS24X_REG_OUTMODE2_3		0x3D
> +#define RENESAS24X_REG_Q_DIS			0x6F
> +
> +/* Q0 */
> +#define RENESAS24X_REG_OUTEN0_MASK		0x01
> +#define RENESAS24X_REG_OUTMODE0_MASK		0x0E
> +#define RENESAS24X_REG_Q0_DIS_MASK		0x01
> +#define RENESAS24X_REG_NS1_Q0			0x3F
> +#define RENESAS24X_REG_NS1_Q0_MASK		0x03
> +#define RENESAS24X_REG_NS2_Q0_15_8		0x40
> +#define RENESAS24X_REG_NS2_Q0_7_0		0x41
> +
> +/* Q1 */
> +#define RENESAS24X_REG_OUTEN1_MASK		0x02
> +#define RENESAS24X_REG_OUTMODE1_MASK		0xE0
> +#define RENESAS24X_REG_Q1_DIS_MASK		0x02
> +#define RENESAS24X_REG_N_Q1_17_16		0x42
> +#define RENESAS24X_REG_N_Q1_17_16_MASK		0x03
> +#define RENESAS24X_REG_N_Q1_15_8		0x43
> +#define RENESAS24X_REG_N_Q1_7_0			0x44
> +#define RENESAS24X_REG_NFRAC_Q1_27_24		0x57
> +#define RENESAS24X_REG_NFRAC_Q1_27_24_MASK	0x0F
> +#define RENESAS24X_REG_NFRAC_Q1_23_16		0x58
> +#define RENESAS24X_REG_NFRAC_Q1_15_8		0x59
> +#define RENESAS24X_REG_NFRAC_Q1_7_0		0x5A
> +
> +/* Q2 */
> +#define RENESAS24X_REG_OUTEN2_MASK		0x04
> +#define RENESAS24X_REG_OUTMODE2_MASK		0x0E
> +#define RENESAS24X_REG_Q2_DIS_MASK		0x04
> +#define RENESAS24X_REG_N_Q2_17_16		0x45
> +#define RENESAS24X_REG_N_Q2_17_16_MASK		0x03
> +#define RENESAS24X_REG_N_Q2_15_8		0x46
> +#define RENESAS24X_REG_N_Q2_7_0			0x47
> +#define RENESAS24X_REG_NFRAC_Q2_27_24		0x5B
> +#define RENESAS24X_REG_NFRAC_Q2_27_24_MASK	0x0F
> +#define RENESAS24X_REG_NFRAC_Q2_23_16		0x5C
> +#define RENESAS24X_REG_NFRAC_Q2_15_8		0x5D
> +#define RENESAS24X_REG_NFRAC_Q2_7_0		0x5E
> +
> +/* Q3 */
> +#define RENESAS24X_REG_OUTEN3_MASK		0x08
> +#define RENESAS24X_REG_OUTMODE3_MASK		0xE0
> +#define RENESAS24X_REG_Q3_DIS_MASK		0x08
> +#define RENESAS24X_REG_N_Q3_17_16		0x48
> +#define RENESAS24X_REG_N_Q3_17_16_MASK		0x03
> +#define RENESAS24X_REG_N_Q3_15_8		0x49
> +#define RENESAS24X_REG_N_Q3_7_0			0x4A
> +#define RENESAS24X_REG_NFRAC_Q3_27_24		0x5F
> +#define RENESAS24X_REG_NFRAC_Q3_27_24_MASK	0x0F
> +#define RENESAS24X_REG_NFRAC_Q3_23_16		0x60
> +#define RENESAS24X_REG_NFRAC_Q3_15_8		0x61
> +#define RENESAS24X_REG_NFRAC_Q3_7_0		0x62
> +
> +/**
> + * struct renesas24x_output - device output information
> + * @hw:		hw registration info for this specific output clcok. This gets
> + *		passed as an argument to CCF api calls (e.g., set_rate).
> + *		container_of can then be used to get the reference to this
> + *		struct.
> + * @chip:	store a reference to the parent device structure. container_of
> + *		cannot be used to get to the parent device structure from
> + *		renesas24x_output, because clk_renesas24x_chip contains an array of
> + *		output structs (for future enhancements to support devices
> + *		with different numbers of output clocks).
> + * @index:	identifies output on the chip; used in debug statements
> + * @requested:	requested output clock frequency (in Hz)
> + * @actual:	actual output clock frequency (in Hz). Will only be set after
> + *		successful update of the device.
> + */
> +struct renesas24x_output {
> +	struct clk_hw hw;
> +	struct clk_renesas24x_chip *chip;
> +	u8 index;
> +	u32 requested;
> +	u32 actual;
> +};
> +
> +/**
> + * struct renesas24x_dividers - output dividers
> + * @dsmint:	int component of feedback divider for VCO (2-stage divider)
> + * @dsmfrac:	fractional component of feedback divider for VCO
> + * @ns1_q0:	ns1 divider component for Q0
> + * @ns2_q0:	ns2 divider component for Q0
> + * @nint:	int divider component for Q1-3
> + * @nfrac:	fractional divider component for Q1-3
> + */
> +struct renesas24x_dividers {
> +	u16 dsmint;
> +	u32 dsmfrac;
> +
> +	u8 ns1_q0;
> +	u16 ns2_q0;
> +
> +	u32 nint[3];
> +	u32 nfrac[3];
> +};
> +
> +/**
> + * struct clk_renesas24x_chip - device info for chip
> + * @regmap:		register map used to perform i2c writes to the chip
> + * @i2c_client:		i2c_client struct passed to probe
> + * @min_freq:		min frequency for this chip
> + * @max_freq:		max frequency for this chip
> + * @settings:		filled in if full register map is specified in the DT
> + * @has_settings:	true if settings array is valid
> + * @input_clk:		ptr to input clock specified in DT
> + * @input_clk_num:	which input clock was specified. 0-based. A value of
> + *			NUM_INPUTS indicates that a XTAL is used as the input.
> + * @input_clk_nb:	notification support (if input clk changes)
> + * @input_clk_freq:	current freq of input_clk
> + * @doubler_disabled:	whether input doubler is enabled. This value is read
> + *			from the hw on probe (in case it is set in @settings).
> + * @clk:		array of outputs. One entry per output supported by the
> + *			chip. Frequencies requested via the ccf api will be
> + *			recorded in this array.
> + * @reg_dsm_int_8:	record current value from hw to avoid modifying
> + *			when writing register values
> + * @reg_dsm_frac_20_16:	record current value
> + * @reg_out_en_x:	record current value
> + * @reg_out_mode_0_1:	record current value
> + * @reg_out_mode_2_3:	record current value
> + * @reg_qx_dis:		record current value
> + * @reg_ns1_q0:		record current value
> + * @reg_n_qx_17_16:	record current value
> + * @reg_nfrac_qx_27_24:	record current value
> + * @divs:		output divider values for all outputs
> + */
> +struct clk_renesas24x_chip {
> +	struct regmap *regmap;
> +	struct i2c_client *i2c_client;
> +
> +	u32 min_freq;
> +	u32 max_freq;
> +
> +	u8 settings[NUM_CONFIG_REGISTERS];
> +
> +	bool has_settings;
> +
> +	struct clk *input_clk;
> +	int input_clk_num;
> +	struct notifier_block input_clk_nb;
> +	u32 input_clk_freq;
> +
> +	bool doubler_disabled;
> +
> +	struct renesas24x_output clk[NUM_OUTPUTS];
> +
> +	unsigned int reg_dsm_int_8;
> +	unsigned int reg_dsm_frac_20_16;
> +	unsigned int reg_out_en_x;
> +	unsigned int reg_out_mode_0_1;
> +	unsigned int reg_out_mode_2_3;
> +	unsigned int reg_qx_dis;
> +	unsigned int reg_ns1_q0;
> +	unsigned int reg_n_qx_17_16[3];
> +	unsigned int reg_nfrac_qx_27_24[3];
> +
> +	struct renesas24x_dividers divs;
> +};
> +
> +#define to_renesas24x_output(_hw) \
> +	container_of(_hw, struct renesas24x_output, hw)
> +
> +#define to_clk_renesas24x_from_client(_client) \
> +	container_of(_client, struct clk_renesas24x_chip, i2c_client)
> +
> +#define to_clk_renesas24x_from_nb(_nb) \
> +	container_of(_nb, struct clk_renesas24x_chip, input_clk_nb)
> +
> +/**
> + * struct clk_register_offsets - register offsets for current context
> + * @oe_offset:		offset for current output enable and mode
> + * @oe_mask:		mask for current output enable
> + * @dis_mask:		mask for current output disable
> + * @n_17_16_offset:	offset for current output int divider (bits 17:16)
> + * @n_17_16_mask:	mask for current output int divider (bits 17:16)
> + * @n_15_8_offset:	offset for current output int divider (bits 15:8)
> + * @n_7_0_offset:	offset for current output int divider (bits 7:0)
> + * @nfrac_27_24_offset:	offset for current output frac divider (bits 27:24)
> + * @nfrac_27_24_mask:	mask for current output frac divider (bits 27:24)
> + * @nfrac_23_16_offset:	offset for current output frac divider (bits 23:16)
> + * @nfrac_15_8_offset:	offset for current output frac divider (bits 15:8)
> + * @nfrac_7_0_offset:	offset for current output frac divider (bits 7:0)
> + * @ns1_offset:		offset for stage 1 div for output Q0
> + * @ns1_offset_mask:	mask for stage 1 div for output Q0
> + * @ns2_15_8_offset:	offset for stage 2 div for output Q0 (bits 15:8)
> + * @ns2_7_0_offset:	offset for stage 2 div for output Q0 (bits 7:0)
> + */
> +struct clk_register_offsets {
> +	u16 oe_offset;
> +	u8 oe_mask;
> +	u8 dis_mask;
> +
> +	u16 n_17_16_offset;
> +	u8 n_17_16_mask;
> +	u16 n_15_8_offset;
> +	u16 n_7_0_offset;
> +	u16 nfrac_27_24_offset;
> +	u8 nfrac_27_24_mask;
> +	u16 nfrac_23_16_offset;
> +	u16 nfrac_15_8_offset;
> +	u16 nfrac_7_0_offset;
> +
> +	u16 ns1_offset;
> +	u8 ns1_offset_mask;
> +	u16 ns2_15_8_offset;
> +	u16 ns2_7_0_offset;
> +};
> +
> +int __renesas_bits_to_shift(unsigned int mask);
> +int __renesas_i2c_write_bulk(struct i2c_client *client, struct regmap *map,
> +			     unsigned int reg, u8 val[], size_t val_count);
> +int renesas24x_get_offsets(u8 output_num, struct clk_register_offsets *offsets);
> +int renesas24x_set_frequency(struct clk_renesas24x_chip *chip);
> +
> +#endif /* #ifndef __8T49N24X_CORE_H_ */
> diff --git a/drivers/clk/8t49n24x.c b/drivers/clk/8t49n24x.c
> new file mode 100644
> index 000000000..5d95705c0
> --- /dev/null
> +++ b/drivers/clk/8t49n24x.c
> @@ -0,0 +1,572 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* 8t49n24x.c - Program 8T49N24x settings via I2C.
> + *
> + * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +#include "8t49n24x-core.h"
> +
> +#define OUTPUTMODE_HIGHZ		0
> +#define OUTPUTMODE_LVDS			2
> +#define RENESAS24X_MIN_FREQ		1000000L
> +#define RENESAS24X_MAX_FREQ		300000000L
> +
> +enum clk_renesas24x_variant { renesas24x };
> +
> +static u32 __mask_and_shift(u32 value, u8 mask)
> +{
> +	value &= mask;
> +	return value >> __renesas_bits_to_shift(mask);
> +}
> +
> +/**
> + * renesas24x_set_output_mode - Set the mode for a particular clock
> + * output in the register.
> + * @reg:	The current register value before setting the mode.
> + * @mask:	The bitmask identifying where in the register the
> + *		output mode is stored.
> + * @mode:	The mode to set.
> + *
> + * Return: the new register value with the specified mode bits set.
> + */
> +static int renesas24x_set_output_mode(u32 reg, u8 mask, u8 mode)
> +{
> +	if (((reg & mask) >> __renesas_bits_to_shift(mask)) == OUTPUTMODE_HIGHZ) {
> +		reg = reg & ~mask;
> +		reg |= OUTPUTMODE_LVDS << __renesas_bits_to_shift(mask);
> +	}
> +	return reg;
> +}
> +
> +/**
> + * renesas24x_read_from_hw - Get the current values on the hw
> + * @chip:	Device data structure
> + *
> + * Return: 0 on success, negative errno otherwise.
> + */
> +static int renesas24x_read_from_hw(struct clk_renesas24x_chip *chip)
> +{
> +	int err = 0;
> +	u32 tmp = 0, tmp2 = 0;
> +	u8 output = 0;
> +	struct i2c_client *client = chip->i2c_client;
> +
> +	err = regmap_read(chip->regmap, RENESAS24X_REG_DSM_INT_8, &chip->reg_dsm_int_8);
> +	if (err) {
> +		dev_err(&client->dev, "error reading RENESAS24X_REG_DSM_INT_8: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev, "reg_dsm_int_8: 0x%x", chip->reg_dsm_int_8);
> +
> +	err = regmap_read(chip->regmap, RENESAS24X_REG_DSMFRAC_20_16_MASK,
> +			  &chip->reg_dsm_frac_20_16);
> +	if (err) {
> +		dev_err(&client->dev, "error reading RENESAS24X_REG_DSMFRAC_20_16_MASK: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev, "reg_dsm_frac_20_16: 0x%x", chip->reg_dsm_frac_20_16);
> +
> +	err = regmap_read(chip->regmap, RENESAS24X_REG_OUTEN, &chip->reg_out_en_x);
> +	if (err) {
> +		dev_err(&client->dev, "error reading RENESAS24X_REG_OUTEN: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev, "reg_out_en_x: 0x%x", chip->reg_out_en_x);
> +
> +	err = regmap_read(chip->regmap, RENESAS24X_REG_OUTMODE0_1, &tmp);
> +	if (err) {
> +		dev_err(&client->dev, "error reading RENESAS24X_REG_OUTMODE0_1: %i", err);
> +		return err;
> +	}
> +
> +	tmp2 = renesas24x_set_output_mode(tmp, RENESAS24X_REG_OUTMODE0_MASK, OUTPUTMODE_LVDS);
> +	tmp2 = renesas24x_set_output_mode(tmp2, RENESAS24X_REG_OUTMODE1_MASK, OUTPUTMODE_LVDS);
> +	dev_dbg(&client->dev,
> +		"reg_out_mode_0_1 original: 0x%x. After OUT0/1 to LVDS if necessary: 0x%x",
> +		tmp, tmp2);
> +
> +	chip->reg_out_mode_0_1 = tmp2;
> +	err = regmap_read(chip->regmap, RENESAS24X_REG_OUTMODE2_3, &tmp);
> +	if (err) {
> +		dev_err(&client->dev, "error reading RENESAS24X_REG_OUTMODE2_3: %i", err);
> +		return err;
> +	}
> +
> +	tmp2 = renesas24x_set_output_mode(tmp, RENESAS24X_REG_OUTMODE2_MASK, OUTPUTMODE_LVDS);
> +	tmp2 = renesas24x_set_output_mode(tmp2, RENESAS24X_REG_OUTMODE3_MASK, OUTPUTMODE_LVDS);
> +	dev_dbg(&client->dev,
> +		"reg_out_mode_2_3 original: 0x%x. After OUT2/3 to LVDS if necessary: 0x%x",
> +		tmp, tmp2);
> +
> +	chip->reg_out_mode_2_3 = tmp2;
> +	err = regmap_read(chip->regmap, RENESAS24X_REG_Q_DIS, &chip->reg_qx_dis);
> +	if (err) {
> +		dev_err(&client->dev, "error reading RENESAS24X_REG_Q_DIS: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev, "reg_qx_dis: 0x%x", chip->reg_qx_dis);
> +
> +	err = regmap_read(chip->regmap, RENESAS24X_REG_NS1_Q0, &chip->reg_ns1_q0);
> +	if (err) {
> +		dev_err(&client->dev, "error reading RENESAS24X_REG_NS1_Q0: %i", err);
> +		return err;
> +	}
> +
> +	dev_dbg(&client->dev, "reg_ns1_q0: 0x%x", chip->reg_ns1_q0);
> +
> +	for (output = 1; output <= 3; output++) {
> +		struct clk_register_offsets offsets;
> +
> +		err = renesas24x_get_offsets(output, &offsets);
> +		if (err) {
> +			dev_err(&client->dev, "error calling renesas24x_get_offsets: %i", err);
> +			return err;
> +		}
> +
> +		err = regmap_read(chip->regmap, offsets.n_17_16_offset,
> +				  &chip->reg_n_qx_17_16[output - 1]);
> +		if (err) {
> +			dev_err(&client->dev,
> +				"error reading n_17_16_offset output %d (offset: 0x%x): %i",
> +				output, offsets.n_17_16_offset, err);
> +			return err;
> +		}
> +
> +		dev_dbg(&client->dev, "reg_n_qx_17_16[Q%u]: 0x%x", output,
> +			chip->reg_n_qx_17_16[output - 1]);
> +
> +		err = regmap_read(chip->regmap, offsets.nfrac_27_24_offset,
> +				  &chip->reg_nfrac_qx_27_24[output - 1]);
> +		if (err) {
> +			dev_err(&client->dev,
> +				"error reading nfrac_27_24_offset output %d (offset: 0x%x): %i",
> +				output, offsets.nfrac_27_24_offset,
> +				err);
> +			return err;
> +		}
> +
> +		dev_dbg(&client->dev, "reg_nfrac_qx_27_24[Q%u]: 0x%x", output,
> +			chip->reg_nfrac_qx_27_24[output - 1]);
> +	}
> +
> +	dev_info(&client->dev, "initial values read from chip successfully");
> +
> +	/* Also read DBL_DIS to determine whether the doubler is disabled. */
> +	err = regmap_read(chip->regmap, RENESAS24X_REG_DBL_DIS, &tmp);
> +	if (err) {
> +		dev_err(&client->dev, "error reading RENESAS24X_REG_DBL_DIS: %i", err);
> +		return err;
> +	}
> +
> +	chip->doubler_disabled = __mask_and_shift(tmp, RENESAS24X_REG_DBL_DIS_MASK);
> +	dev_dbg(&client->dev, "doubler_disabled: %d", chip->doubler_disabled);
> +
> +	return 0;
> +}
> +
> +/**
> + * renesas24x_set_rate - Sets the specified output clock to the specified rate.
> + * @hw:		clk_hw struct that identifies the specific output clock.
> + * @rate:	the rate (in Hz) for the specified clock.
> + * @parent_rate:(not sure) the rate for a parent signal (e.g.,
> + *		the VCO feeding the output)
> + *
> + * This function will call renesas24x_set_frequency, which means it will
> + * calculate divider for all requested outputs and update the attached
> + * device (issue I2C commands to update the registers).
> + *
> + * Return: 0 on success.
> + */
> +static int renesas24x_set_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long parent_rate)
> +{
> +	int err = 0;
> +
> +	/*
> +	 * hw->clk is the pointer to the specific output clock the user is
> +	 * requesting. We use hw to get back to the output structure for
> +	 * the output clock. Set the requested rate in the output structure.
> +	 * Note that container_of cannot be used to find the device structure
> +	 * (clk_renesas24x_chip) from clk_hw, because clk_renesas24x_chip has an array
> +	 * of renesas24x_output structs. That is why it is necessary to use
> +	 * output->chip to access the device structure.
> +	 */
> +	struct renesas24x_output *output = to_renesas24x_output(hw);
> +	struct i2c_client *client = output->chip->i2c_client;
> +
> +	if (rate < output->chip->min_freq || rate > output->chip->max_freq) {
> +		dev_err(&client->dev,
> +			"requested frequency (%luHz) is out of range\n", rate);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Set the requested frequency in the output data structure, and then
> +	 * call renesas24x_set_frequency. renesas24x_set_frequency considers all
> +	 * requested frequencies when deciding on a vco frequency and
> +	 * calculating dividers.
> +	 */
> +	output->requested = rate;
> +
> +	dev_info(&client->dev, "calling renesas24x_set_frequency for Q%u. rate: %lu",
> +		 output->index, rate);
> +	err = renesas24x_set_frequency(output->chip);
> +	if (err)
> +		dev_err(&client->dev, "error calling set_frequency: %d", err);
> +
> +	return err;
> +}
> +
> +/**
> + * renesas24x_round_rate - get valid rate that is closest to the requested rate
> + * @hw:		clk_hw struct that identifies the specific output clock.
> + * @rate:	the rate (in Hz) for the specified clock.
> + * @parent_rate:(not sure) the rate for a parent signal (e.g., the VCO
> + *		feeding the output). This is an i/o param.
> + *		If the driver supports a parent clock for the output (e.g.,
> + *		the VCO(?), then set this param to indicate what the rate of
> + *		the parent would be (e.g., the VCO frequency) if the rounded
> + *		rate is used.
> + *
> + * Returns the closest rate to the requested rate actually supported by the
> + * chip.
> + *
> + * Return: adjusted rate
> + */
> +static long renesas24x_round_rate(struct clk_hw *hw, unsigned long rate,
> +				  unsigned long *parent_rate)
> +{
> +	/*
> +	 * The chip has fractional output dividers, so assume it
> +	 * can provide the requested rate.
> +	 *
> +	 * TODO: figure out the closest rate that chip can support
> +	 * within a low error threshold and return that rate.
> +	 */
> +	return rate;
> +}
> +
> +/**
> + * renesas24x_recalc_rate - return the frequency being provided by the clock.
> + * @hw:			clk_hw struct that identifies the specific output clock.
> + * @parent_rate:	(not sure) the rate for a parent signal (e.g., the
> + *			VCO feeding the output)
> + *
> + * This API appears to be used to read the current values from the hardware
> + * and report the frequency being provided by the clock. Without this function,
> + * the clock will be initialized to 0 by default. The OS appears to be
> + * calling this to find out what the current value of the clock is at
> + * startup, so it can determine when .set_rate is actually changing the
> + * frequency.
> + *
> + * Return: the frequency of the specified clock.
> + */
> +static unsigned long renesas24x_recalc_rate(struct clk_hw *hw,
> +					    unsigned long parent_rate)
> +{
> +	struct renesas24x_output *output = to_renesas24x_output(hw);
> +
> +	return output->requested;
> +}
> +
> +/*
> + * Note that .prepare and .unprepare appear to be used more in Gates.
> + * They do not appear to be necessary for this device.
> + * Instead, update the device when .set_rate is called.
> + */
> +static const struct clk_ops renesas24x_clk_ops = {
> +	.recalc_rate = renesas24x_recalc_rate,
> +	.round_rate = renesas24x_round_rate,
> +	.set_rate = renesas24x_set_rate,
> +};
> +
> +static bool renesas24x_regmap_is_volatile(struct device *dev, unsigned int reg)
> +{
> +	return false;
> +}
> +
> +static bool renesas24x_regmap_is_writeable(struct device *dev, unsigned int reg)
> +{
> +	return true;
> +}
> +
> +static const struct regmap_config renesas24x_regmap_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_RBTREE,
> +	.max_register = 0xffff,
> +	.writeable_reg = renesas24x_regmap_is_writeable,
> +	.volatile_reg = renesas24x_regmap_is_volatile,
> +};
> +
> +/**
> + * renesas24x_clk_notifier_cb - Clock rate change callback
> + * @nb:		Pointer to notifier block
> + * @event:	Notification reason
> + * @data:	Pointer to notification data object
> + *
> + * This function is called when the input clock frequency changes.
> + * The callback checks whether a valid bus frequency can be generated after the
> + * change. If so, the change is acknowledged, otherwise the change is aborted.
> + * New dividers are written to the HW in the pre- or post change notification
> + * depending on the scaling direction.
> + *
> + * Return:	NOTIFY_STOP if the rate change should be aborted, NOTIFY_OK
> + *		to acknowledge the change, NOTIFY_DONE if the notification is
> + *		considered irrelevant.
> + */
> +static int renesas24x_clk_notifier_cb(struct notifier_block *nb,
> +				      unsigned long event, void *data)
> +{
> +	struct clk_notifier_data *ndata = data;
> +	struct clk_renesas24x_chip *chip = to_clk_renesas24x_from_nb(nb);
> +	int err = 0;
> +
> +	dev_info(&chip->i2c_client->dev, "input changed: %lu Hz. event: %lu",
> +		 ndata->new_rate, event);
> +
> +	switch (event) {
> +	case PRE_RATE_CHANGE: {
> +		dev_dbg(&chip->i2c_client->dev, "PRE_RATE_CHANGE\n");
> +		return NOTIFY_OK;
> +	}
> +	case POST_RATE_CHANGE:
> +		chip->input_clk_freq = ndata->new_rate;
> +		/*
> +		 * Can't call clock API clk_set_rate here; I believe
> +		 * it will be ignored if the rate is the same as we
> +		 * set previously. Need to call our internal function.
> +		 */
> +		dev_dbg(&chip->i2c_client->dev, "POST_RATE_CHANGE. Calling renesas24x_set_frequency\n");
> +		err = renesas24x_set_frequency(chip);
> +		if (err)
> +			dev_err(&chip->i2c_client->dev, "error setting frequency (%i)\n", err);
> +		return NOTIFY_OK;
> +	case ABORT_RATE_CHANGE:
> +		return NOTIFY_OK;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +static struct clk_hw *of_clk_renesas24x_get(struct of_phandle_args *clkspec,
> +					    void *_data)
> +{
> +	struct clk_renesas24x_chip *chip = _data;
> +	unsigned int idx = clkspec->args[0];
> +
> +	if (idx >= ARRAY_SIZE(chip->clk)) {
> +		pr_err("invalid index %u\n", idx);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return &chip->clk[idx].hw;
> +}
> +
> +/**
> + * renesas24x_probe - main entry point for ccf driver
> + * @client:	pointer to i2c_client structure
> + * @id:		pointer to i2c_device_id structure
> + *
> + * Main entry point function that gets called to initialize the driver.
> + *
> + * Return: 0 for success.
> + */
> +static int renesas24x_probe(struct i2c_client *client,
> +			    const struct i2c_device_id *id)
> +{
> +	struct clk_renesas24x_chip *chip;
> +	struct clk_init_data init;
> +
> +	int err = 0, x = 0;
> +	char buf[6];
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	init.ops = &renesas24x_clk_ops;
> +	init.flags = 0;
> +	init.num_parents = 0;
> +	chip->i2c_client = client;
> +
> +	chip->min_freq = RENESAS24X_MIN_FREQ;
> +	chip->max_freq = RENESAS24X_MAX_FREQ;
> +
> +	for (x = 0; x < NUM_INPUTS + 1; x++) {
> +		char name[12];
> +
> +		sprintf(name, x == NUM_INPUTS ? "xtal" : "clk%i", x);

I think you should do this differently to avoid this smatch warning.

drivers/clk/8t49n24x.c:407 renesas24x_probe() warn: excess argument
passed to 'sprintf'


Other then this driver is fine.

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
