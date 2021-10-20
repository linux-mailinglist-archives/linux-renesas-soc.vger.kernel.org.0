Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7EEB435264
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Oct 2021 20:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhJTSMZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Oct 2021 14:12:25 -0400
Received: from mail-eopbgr1410112.outbound.protection.outlook.com ([40.107.141.112]:50816
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230395AbhJTSMW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 14:12:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=od5tOiRpH6JGQtCmeyYBqtsc4PxnUbkFt74srpXY5uATFjq4TPyOKyRe8fOgaXTbjFdSiGVyJpVIO6KP/svI2gCpyFwdV91OfhYTPTHDCDOjtDz7xoiHnY2jdr32EzNSfMoayieA4qnQf9rXgo0PlvjAjsFOS6QcgL85Gn/2nfQYSitKtW03jdGS4AeGDgRL9x0tq1UaEjyDYBy3df+s8W8PRC3bgrVGDhkMux0IjjXYCejiHzBYJ8ExvAdOGv7yiEYFeqIUU4b8Dy6Dq2vYRgoQHhZ9FJCmWURnI9Gmj1+sA3jKU702orsjgpKr3vdFVwc5YmzkpNf4Efjwk7HvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qM/l3v3nz3Yg8K8AtM9xTqkkbpP84rJMVUGpzSkND4=;
 b=A8DQxhRhlamaFfQ5rhhj0vWFbZIol2KbqFDfY/GiPhKk0xEiB3go3vTUrS0OgeQB5FJ2oV76iVdwS6iLyIYf/g4UY/lDgAXA22MqdQXeg5waGRdtTyevDKsf69ZGZGNbrzljN9Aiu1UzJsV2Ea/OzRYb43y5lNsl9LkFfX/QV3vYnJ/AXSlV+ESTbszeIso0hdno9X9LnWA2ojpFT+/F9/1RcIr7EpLmewpHGgzMeVJB4dJrsq3blO8cAic9QJuYETo+GDfnV/Rlc8qlUjxMRyUuF9SP3sC0zwQWttiQmkJRXLlHCpDu+yJUPM54xMdKVTFzb7XS6KlJTzSf51mu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qM/l3v3nz3Yg8K8AtM9xTqkkbpP84rJMVUGpzSkND4=;
 b=HyLumfFeKHhLPkelOHykTZB69C2Ai8bQMc2B23jixeNGAooWFPargG/b7wXHV/SUAj5r52f0PJvrJvQDj8RrtLpMtCwzM9cKByZPpwdZVgfEgaGXjhOHBxvVRngY89HUn29IR7DdJvYpfSiBmgkgFPr+ocNPkOWCW+MgjHJ61A4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (20.178.102.215) by
 OSBPR01MB2712.jpnprd01.prod.outlook.com (52.134.253.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15; Wed, 20 Oct 2021 18:10:05 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e%6]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 18:10:04 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v7 0/2] Renesas 8T49N241 device driver
Date:   Wed, 20 Oct 2021 11:09:47 -0700
Message-Id: <20211020180949.15024-1-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by SJ0PR13CA0218.namprd13.prod.outlook.com (2603:10b6:a03:2c1::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 18:10:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fca72c6-28d6-4f19-aff3-08d993f4d750
X-MS-TrafficTypeDiagnostic: OSBPR01MB2712:
X-Microsoft-Antispam-PRVS: <OSBPR01MB271286EF3F3267C7508164C6C8BE9@OSBPR01MB2712.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zxaMqn+x0E0fbVoqhY9oetAmZ/iescAT6muuIwyzszzgSxZAbn4cAvrP7fUoKcgP4bKWrdRfYP7y1EomeD0mcMx3gLwRl5GXmmoZA6MPYoKjKRy3J44IPSmQhCv7luqobbwrxAiksWFJ7gsUKPg7k/upZwi/PAszmS9YLXcscFPHOruKKGH9dsP8o2uOyFXeWewG3DFWzaNGbsoWxlAgv8DNXQ6isRFE+comcCt5n0+1QOwUmcoZfVDjO3heg+tGuyiESp3LEpzeNkg2eml6YCrNfJpdLpEHD0H/UQIGgfDFWLphwVeHjUKKpzwF0Z5ONOIBPlBqhKMRhzXyTf69QTMLtYbfA6r4eNh+fE1/CP2jofskqIcNu/ajT9W8KMR7TRaT44dA441+Q5k9L1FpvCfEyTE+vfW4dKAWEWLIwebh2Yd7cRq31dbDVnG8HICJ9PghFjMQgRoEwxy9lsCm0b+7lA3kALATkMSq2RczjpA/CX6L12PbQYDkr7HPeoYm+zKaO3YJq2LYbgjPtBEN+WgFhV+trnvdU2URPKMQsxstIi+2pbHfkOrB5hK383tJL6R5PI1nUeEosLgqaHtryVnk78QOh+nkyV06LbK5II3ZOAMHDVMi10vujplSysrsfwOfPbp+LRQy/KDABa2XRz429wjiK7tkMK00GdWufAKkhSPN2hLO+4emYWs5RXB6tqeh6bACzTiKIovLjUiu+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(52116002)(1076003)(6666004)(38100700002)(38350700002)(2906002)(36756003)(6512007)(956004)(316002)(5660300002)(8936002)(83380400001)(103116003)(6486002)(86362001)(66476007)(66946007)(66556008)(2616005)(8676002)(4326008)(508600001)(186003)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ozhwR8DdxVJDGjp6PDS6pSA86x/sYDp6NLSjGCTqX+mQJFeObUlLEvt5vHV7?=
 =?us-ascii?Q?aazX7yubRlxVMncSyhemZ2ctF3TZvCWUP8PFxZsflbRhP+9rN8zYGwRLUWVC?=
 =?us-ascii?Q?cKEMI1y8rwHSlJld5+H6yQupdqlLdagF2KghlbfEXCCXqKmhHEz4SdDw6FWG?=
 =?us-ascii?Q?46Ct9+pI3WuvxbWmxSbhY4nE2t31He2Zv2HnJb0H0Qf1cOquq1XeJ2c3WAyq?=
 =?us-ascii?Q?dFqgY0PM4UXBcY2L+joSfZSjbVY5AJmBxWbStcs6pUyVvFkpD9VDWYgpV6kz?=
 =?us-ascii?Q?6BuJQl2R+AeLMR805HOS5LTBFYmWaEPs7wbpZBEzkxdz5hLsFaoyXxBMizPu?=
 =?us-ascii?Q?1Q7VCH2OkZMWjrYUIjlk5KCsY2X4ILdTGBmExJL2h8BihQymx6xVoeIZwkF+?=
 =?us-ascii?Q?DI7K4W7ABzVY44fzK/R2FyuI+c+IXLGLzQIHmM+EDZvlVnU81bHVOVwICy4M?=
 =?us-ascii?Q?yzpLkI2WYEOWYAxQ3DGPkqq8vsMF0ZBfrlO181k0FHnI6ozcKd31CJ1HVpeB?=
 =?us-ascii?Q?73gMyjJ41pEMkkkOM5lUMkgVC4eowq8GZQv4qv3APXnA2t04A6aFrK3UyGxD?=
 =?us-ascii?Q?7ES/Rd/rRTd82PgA0L2r5VrmuhuRqC4hdUHzQ/fPVXlR00Pwr8uxePwXICNx?=
 =?us-ascii?Q?G6oMgt4RXxcHAdUjtBEAHv7P9/vQ4apIy+E/uupzoPONEdnGgwUVPopzIOPe?=
 =?us-ascii?Q?bt1hicaDUkVfUSszcTNynHZ/pE2VlwhH3so8DpqouKsHyvvhvBljYCwz/eQ1?=
 =?us-ascii?Q?NGwj+p35eRs8cXSmIlR/pZ1vwx+ZPByV67QpGGOjy0Hmx6rXF6dsHDovaOOW?=
 =?us-ascii?Q?cfvO9QJSCoohiAM/+OZp9VHzdRZo19de2HyURD0VkYIOvTddvaby/2LEPUYR?=
 =?us-ascii?Q?QbV67CWG21OzUA0Et7x4vpdVKWqYHUP2+PCltG66APBZKoSd1bc6sUFQ2BUI?=
 =?us-ascii?Q?lt69RW15PwfdL3Pygqe73QkgOTMlDmcW/wS0lsde+bnKSBUmzvjFdJflomYO?=
 =?us-ascii?Q?Kntu2aCf9y0Whb1eJb4N2WdbTEYEr6rY/JajKJrHw93goOULQG4boi/HjNaz?=
 =?us-ascii?Q?Wr4nJeoRjHhgGGLvapREHIXrjqIPsWTw54/G9UtBBRBE5PH42Ctsz0phkiLp?=
 =?us-ascii?Q?C+fI+iIi7cG9YamBU+ADC4Vn6FvaIYy8Zgl8+B7MEAqsMw8rPnYgn8i1PiZc?=
 =?us-ascii?Q?y0XrtxRxtckvUfR7ImnAsDAgzd9rKO5Y4rWy7fsxUUvvqrRoow/8tnyX0lKk?=
 =?us-ascii?Q?v1Es8q96QFrfOIzvAWz4JUQRprOxuBmqT3gCOsG4XL6H4yr6bYbNMrItPxjP?=
 =?us-ascii?Q?OtK3yriTaucW/vkBPlEpEodG9zGujROC13MxTyrZEBQ7kCfrwMNL7L11Wx3H?=
 =?us-ascii?Q?9WdKeZbZDE8xoNDgiPLSxTe01v4ou0Wo7t7JCXUHybtw7Y3WGlIdRptmEVeM?=
 =?us-ascii?Q?4CP0t0woAD2/rkMuDZn6jmfytdkyqlmY29f8aN1laOp8sPZuN8CO0Tgps7Ua?=
 =?us-ascii?Q?YHFPABDUtcGGMjq1eEUttyHmQASAY6f/4kxt6DMlpbbosKZlYvjL+I0jtLne?=
 =?us-ascii?Q?0KhMZKH8PlihLbut9cI1QCt5hDqUFGvfiYubKG1Iz3bNpYUSLRrcDV19NAr+?=
 =?us-ascii?Q?SlQZ6tW4tM8Wu/ZiSgx787t/IpKUXntApGE+HTY8GbEqRWpFukOve86sTsTb?=
 =?us-ascii?Q?UVoOQA=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fca72c6-28d6-4f19-aff3-08d993f4d750
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 18:10:04.6126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3n0wBsGTItPI9LcQltC15fAJxNt93tOPrlNsgLvxDfGH1pP+a6H5EPDzC+89mLhU0spTDBl/Ky2t4FKq4rl17Q/pB3Zok96qvCh5ogki0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2712
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

A common clock framework device driver for the Renesas 8T49N241 universal
frequency translator.

Changes in v7:
 * Rebase on v5.15-rc6
 * Rename renesas24x_* functions to r8t49n24x_*
 * Implement determine_rate instead of round_rate
 * Implement prepare/unprepare
 * Use devm_clk_get_optional and ensure clk0, clk1, and xtal are attempted before dev_err_probe
 * Use ffs() in __renesas_bits_to_shift
 * Remove regmap read/write retry
 * More consistent debug logging
 * Resolved many C related naming and initialization issues
Changes in v6:
 * Rebase on v5.15-rc1
 * Ensure Rob's Reviewed-by tag is included
Changes in v5:
 * Rebase on v5.14-rc2
 * Move driver files from clk/renesas to clk
Changes in v4:
 * Add vendor prefix to dt binding compatible property
 * Remove clock-names description in dt binding
 * Remove redundant 'input-' prefix on clock names
 * Clarify the settings property in dt binding, add data type
 * Fix define spacing
Changes in v3:
 * Clarify settings property in device tree bindings schema is optional
Changes in v2:
 * Correct missing semicolon in 8t49n24x-core.c

Alex Helms (2):
  dt-bindings: Add binding for Renesas 8T49N241
  clk: Add ccf driver for Renesas 8T49N241

 .../bindings/clock/renesas,8t49n241.yaml      | 190 +++++
 MAINTAINERS                                   |   7 +
 drivers/clk/8t49n24x-core.c                   | 753 ++++++++++++++++++
 drivers/clk/8t49n24x-core.h                   | 242 ++++++
 drivers/clk/8t49n24x.c                        | 565 +++++++++++++
 drivers/clk/Kconfig                           |  21 +
 drivers/clk/Makefile                          |   2 +
 7 files changed, 1780 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
 create mode 100644 drivers/clk/8t49n24x-core.c
 create mode 100644 drivers/clk/8t49n24x-core.h
 create mode 100644 drivers/clk/8t49n24x.c


base-commit: 519d81956ee277b4419c723adfb154603c2565ba
-- 
2.30.2

