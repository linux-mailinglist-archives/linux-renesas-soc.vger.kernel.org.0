Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E89D436CAE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 23:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbhJUVeD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 17:34:03 -0400
Received: from mail-eopbgr1410110.outbound.protection.outlook.com ([40.107.141.110]:58640
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230340AbhJUVd4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 17:33:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeQumN2Om/0/BmsJQeQyAneq+t287WTUQeGlTeZjVqBNxKpISdLwHlh8wo2PbCea4WsXpgivT8/r0gGFPUd8j7M0to8G0Gx+kEyNf7POUScwmvEf/GTnt3jrZwxD2VFORIA26DPek1c2EcL5kpD2MWT9lkppNZPT2pGY4UrHY93ahhd98DEF5qUtFzbVgaHPKOlGEzk0nT6GlKl/B7T0sWxLu1ybJUu69QH2LeeC24/X3VBE8tuPdJpBJHtR5nKOoA4WYzgHd1oHa9Idqr436VnPGg3euFC0wUHoFv1BK1FkzOYAma0X6n5NdOPgntA00EoqanQSXsJQDxOhTvbhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHE4YsvyigS52ZYBHVVx9TxN9vVfBV8ZhBF12hVysvQ=;
 b=hLl7CLUKCeY1w9awhAlKCoe6dwmKG3Ln/C2OAnQYo00GreGX7DbdEAMbBQZ4WWFjKN9nd9lMTK0BZAo0JPubsf4qHormXkSmq+fn5ZrA/Exfaargiv8WWKFrs6w8HTfLoszLSAGtxhcsuCt4RQP4UABNLP8SCPuGQKv2524D0acLgT2Dcn9sGr28XEVogeqZFW5OTuve9N53Z+aYLIexeoHsXbgLbPWm88VHCwFPMgzrU1K3MyJGV2brZj58pfpn9RGrPcZUsdeuAFfRlGJ6ejuMSoZ8oBkIgx70PmMb324Vhed2QWO1YiZ2cHIuPD/aVRB2RtU1gBvMVXe9VtQJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHE4YsvyigS52ZYBHVVx9TxN9vVfBV8ZhBF12hVysvQ=;
 b=i1FJV7034Z7Q1Mzf/YB3xKnDqfwemfYHYx1+Yysb/sarIHk4Dmp0LMb5jJv4Y3T2/TK212ZkxDxsJlAq7v68v7rHtodF/qrFf5A1/JEcYNokqkBFN3zVsJENWpEvNgZINpM/4LLZDDwT9ijuDFbE7dg2Ohw4oRI06tCfSTb8/oA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS3PR01MB6577.jpnprd01.prod.outlook.com (2603:1096:604:101::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Thu, 21 Oct
 2021 21:31:35 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e%6]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 21:31:26 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v8 0/2] Renesas 8T49N241 device driver
Date:   Thu, 21 Oct 2021 14:31:04 -0700
Message-Id: <20211021213106.315-1-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
Received: from az-ahelms.na.ads.idt.com (192.48.119.236) by SJ0PR05CA0161.namprd05.prod.outlook.com (2603:10b6:a03:339::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.10 via Frontend Transport; Thu, 21 Oct 2021 21:31:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb0782a8-2afe-4b4f-84d2-08d994da22f2
X-MS-TrafficTypeDiagnostic: OS3PR01MB6577:
X-Microsoft-Antispam-PRVS: <OS3PR01MB6577D71CA3E9A4B587801A8CC8BF9@OS3PR01MB6577.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ExtTU82/GwA8wzh57P2U1l6YzxKhm42KJjhKvrx1/qAWDdN5o68QwLWVBYBZvWDoRCjoS4Cc2fKdOxHmJH8Ebx7h+fjU8vRjrQpLG1lYbBZbaPz8B3lfFjKJFaMjA2kSODuztD3j1o1FujAcfjBwn/RM9jUGuPOMpdsDMiixqZ1WtSJm8vjpX02CS4e+ilQ9dSKMs2mmHn8z46Plq0ZD91HaT7uT9PnEJ//j0Eo2OIQdJvG87iRNVduldIOx0/5eUVDMJMYy/caoKmGIQaZjju62Se32beIQfd9fSj9WF8Uvvy902Aet9tyXq9EQVjn5z2CvF8EJq8od6ZwWl5p8b++Bxe/+w2+q8w1nmoolDp16ht42K9Vi1oeeWxVqH/AbZUeHUw/k9sfax9iCb1ocPDDKZBP1NzLFsZv+cW+wzCIsSUg4rbub9mVPEOSUHvdU881UiTqoZ516fs+M9+egaYNMzeD0/n3B1izhfXcptqC3uYXhtqBdpqEJYsUI28iwhKPPgKEhpb+NZkSgPYpdjxFheF8htwlqHwx1JL6880x1dPeu+ILzCknOaMRKfCV7C1MyPlOKCxBfMiOSIO2R8mJg6ITU7Drh2hCteoKE2vAuuxodAmtOpR9Oq4CXNSEKDuVDAVq5hGi4uP/pgY2+gVkeBxpX0pGM4zcJleRY6BIK0M089OfW1jMgUdpQZiF7n8mAAQHHc+7lVq2kdlnWVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6512007)(508600001)(86362001)(8936002)(6506007)(5660300002)(103116003)(8676002)(36756003)(2906002)(38350700002)(186003)(38100700002)(956004)(1076003)(2616005)(6666004)(26005)(316002)(6486002)(52116002)(4326008)(66946007)(66476007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9MTNZbMBBjzn+J3GFkW7yw1fgbazsR/gmsTF1gYZfgZYcyzQHjVjbMk69RXx?=
 =?us-ascii?Q?Af23ktOZkDhi+YdjZw1VJETlQUNsmjMlah5wDUn+ju/3EtbIUOPcFQMEZZHU?=
 =?us-ascii?Q?h6Zpg0pYryg+u4AQX4TLFdGorsTMR4zBUqwj/LcKr1twQ7QOJfyK9u7cNCfv?=
 =?us-ascii?Q?BUS4d8gJEY9Iqus4gT8a7j3GBK1/60Mf/4xPHg83lmT8fgj9Dws1EqyXbTcA?=
 =?us-ascii?Q?S0gsOE9JWF/btWm04mGnGmcQZpGmFOrOYBR/qKHehc2zcXGzK5a+FAcooYEl?=
 =?us-ascii?Q?zUwH8oxD/HDy6kh37Be0E0gEnK2mt4IPaCaqJWSUwL1Y5UkQbAoFIXku8fa/?=
 =?us-ascii?Q?I8IP9uPk58vSszO5NnSP9Zs6nr6eXJ7DhboEEXDzfYJnyu6vSce5yGUrI4fd?=
 =?us-ascii?Q?R3jaGnSl7noz9rAFapK5t8D4OetvjuFxVI4z/gzzUU6ol0BEgPSuMxueonXe?=
 =?us-ascii?Q?S5kIsdgW24Ga6uYHwXV5bc6k4f+krhGYt1GBT6BoCLxdLjiskto2QNOvX+cT?=
 =?us-ascii?Q?ZZW/GytKXwQtctbKEEtdCe14MCERNNC7B76JSJ7k+PSji4Pr9R1bYUOTR8Fg?=
 =?us-ascii?Q?JO4s1v/gGSThBg0oiARCcItOXJc1RpmLsaQ7QJt+sq2m/F1cDDdZOGIYtKvv?=
 =?us-ascii?Q?xuO1QVbpsUJFpELFT9s5tBfN6cGDjgHcvSTmv40bRSzaE13HivcAXrco3Lye?=
 =?us-ascii?Q?Pm/zuG/aJg+IX+TsCYe+ms56X7J+MZP/HgUYHa9AMJabDstk56ORE7Cq+6R+?=
 =?us-ascii?Q?Hm4kT4zDyBdbUajAmI7xULHFiLWCgop1BD+QZz6AW9joXNc6ThsFd65Zx+0q?=
 =?us-ascii?Q?hKu1zKI21VeEhwRn3lFfMpWBKqEaoUwM1ubxuJUnHVNw+TEjXg3yMJjsc43X?=
 =?us-ascii?Q?xt9ujWK5ph/U49rcQKKlHpflSRNyZd4eMT9ys3PCoMsyDA6ghvLdLhaOL1EM?=
 =?us-ascii?Q?8xHRTgF150glELdx3xzcU6iyitCpUapOb7zUqvYOCRSSfOubJVgaFc47TBRd?=
 =?us-ascii?Q?CEBpL8B099w6PY5qu98ZdVExGAk7bEqithFiXMII7jCUqAl85I7sLsjJYG74?=
 =?us-ascii?Q?U67s5OL0shu+LZBYNrfZTWNwA05N1yZt+lAwCixo+3WceMvmBbzupFPelkFn?=
 =?us-ascii?Q?/I4b+yNM9YJH6L79H/qzhc4eaLGWcL1x/TTjItvUjG6ROjmlwTaFtzuGCkvB?=
 =?us-ascii?Q?K4gmUeLEkW2DAW1HXZHNmx8x6akYqv5SXRIt4GOh0SAP3awMi5gfC7hdbOkL?=
 =?us-ascii?Q?ozEsEwcmIgn8q+GbJYkEShOemoMkfSVv0WyctP/AAhmSIKbllEBTLxxP72xB?=
 =?us-ascii?Q?UVOFyy/XRXzxJUX5BALlgYJb+3vSUhkzR5AKPQ4Fcq0bbBeyWYJBnndqdVxS?=
 =?us-ascii?Q?h+5HRP6zHjhtDYD8sQXY2mNjy2gw17QW0QneXMJqhnTjZf12jHJSHS5rdx7j?=
 =?us-ascii?Q?w52fxKItLE+6ZbrtR2eymJIzAieRG/3Y7/BCdqx7pqBka699nxwBaQ=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0782a8-2afe-4b4f-84d2-08d994da22f2
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 21:31:26.2384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alexander.helms.jy@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6577
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Changes in v8:
 * Use __ffs instead of ffs
 * Change from 64 bit to 32 bit division
 * Minor math changes to avoid possible overflow
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
 drivers/clk/8t49n24x-core.c                   | 752 ++++++++++++++++++
 drivers/clk/8t49n24x-core.h                   | 242 ++++++
 drivers/clk/8t49n24x.c                        | 565 +++++++++++++
 drivers/clk/Kconfig                           |  21 +
 drivers/clk/Makefile                          |   2 +
 7 files changed, 1779 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
 create mode 100644 drivers/clk/8t49n24x-core.c
 create mode 100644 drivers/clk/8t49n24x-core.h
 create mode 100644 drivers/clk/8t49n24x.c


base-commit: 519d81956ee277b4419c723adfb154603c2565ba
-- 
2.30.2

