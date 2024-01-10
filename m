Return-Path: <linux-renesas-soc+bounces-1447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FED8291E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 02:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79900B21429
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 01:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5152D81B;
	Wed, 10 Jan 2024 01:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oHwyH2Ia"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049B2D50F;
	Wed, 10 Jan 2024 01:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2yO8zeajReMWNqI7CAE6EvurNj1QZEz+1LdzqEG31BcvAyk7t8i9UdBZ6GtQQtoO40enRghBkgUdlBAUHINT6j4Bda1ii8vwYWVQw9+j2UGQQ0nqngjkhnkgPMQah/FX/aHxo2IYIXsQeRYGah+fM9LscF0UQFfDC/ZSegyFVuiZSl5DzMZLYsG9WcYtq5PWEw6x62LVwSfNzk9MSkJvaX4nLfbtid2hLOE/oO4Mwpyn92ACdAr+wNqhZ/YS8jWLx5ODytmewT73bPaBgRXrLK144Qobxwjdttx5SZ069HPk3Dzq1JUN3vyn352HKgNe29fT3XDoALG0oT6oolwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fdffg3S0vHldXFHnLfD+5g9CpW9xZQgN1Coew7qGlm8=;
 b=Kf6Xv2hiZnkR3zEBTE/x9Motiud8Iv29Lk00rKUWoTX0D+x/r3wri9LCee1AHdHB57cJ+En1lp9+hJG91y+0xoU6916Pm6PhtB8yCF2cfS7P5VvNhJwpK2dKEcsNXwseYIptlEE2FglN2OSqEFuPlZqKBMXWnIaVO2+kYZJ+5moeXnaeUh4CL4rK/TtPCc0LnETyWTnxFLnpuPlljiZtt76ovifmrMcr2q2J07ZIuPCIu1h96Wy9SEN91H5kzSf+dwpLF20BJqmj5OkuGiH5XSuKjZ+hnwS4m1UBG+8tMV89kkpGLZoZZJP/nTB6JropOjUu2+v7ot06WHs3v+OX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fdffg3S0vHldXFHnLfD+5g9CpW9xZQgN1Coew7qGlm8=;
 b=oHwyH2IaTQzBuTPyMw0zwQSeu9of/c1Gx9FNhfZ6UMy2mIk0/tAtp4rgLHrrJqcZNODxpeJ8FjIePFa9tRsYPXyJcRQLh9jDEzP94rarDNda1cNHTG2uI2V1a0VDwGe+0CCLJOLPqMbpC/+oICHaRiuDPBzQ5+Ngg6PtraVjgss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8442.jpnprd01.prod.outlook.com
 (2603:1096:604:195::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:14:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:14:13 +0000
Message-ID: <87edeqgfbu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com> 
Subject: [PATCH v5 resend 0/4] drivers: clk: renesas: ignore all clocks which are assigned to non-Linux system
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jan 2024 01:14:13 +0000
X-ClientProxiedBy: TYCP301CA0044.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c25664d-255c-48fa-4668-08dc11797537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qnHNv1Tz3BaEfmA7x9eCqTB0a4C1rwohbzgDWgKG69Kq0bsXysJL031hIAGB2tI74581l6kdgwTetf24mDwlOB6GMZw2HrO8ILRyCHGFWubFPCEBQuH0pFv4fDRo3lPE8kQTGjLs8C90oujk3KN1wO9xJrPNZUGvYkHzlEZIe5291fBKjd1Z3uyq7DP1Mj4wrbHfG/O3fuEVa/TOmNdb1HQINDrkmrEBVHqnRaVUZwTyNZXt8g1T3h7OK3UL66ZUMo1NLwlBjzaMZOTw8nrEEJ/kzsXYvKaq2NPg5c1hk4xrK/ibwtTs0kTGzINJy6dv+klaHGyQyCPxuaAMs8mKPzFJedyizUE5D0o+rTOd7XMJ542+CSckDzUdQZjit+agiG6+x14bG2nhAIeiA9wrsFnVgSX/tFUz0a83yh8ySNzQqtOwWI/iyWeLXpdonZo2USOuWgq7Pfu3qvZRmc8vFV+AKDr9otZhvb1lFaJDAV29SkmGm3tNR3kzwoGOL3PVdiiE+A6ZO7nxLpSN4VRkNPxCdV9WLvbQPriHkMVNz/alS3hsNNnqNeDmeULaDCVELmBUFPTxAVoTsXVfjIK1paTjs2jU5ZkV9KNLT/lttwI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(478600001)(6486002)(83380400001)(966005)(54906003)(8936002)(8676002)(66556008)(66476007)(4326008)(110136005)(316002)(66946007)(36756003)(52116002)(107886003)(2616005)(26005)(6512007)(86362001)(6506007)(2906002)(38350700005)(5660300002)(7416002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phBA+qF72W1AECyrn4a4SCI9I6LGzI3w95apB8joytCdkMbPHbE9chW7TzbC?=
 =?us-ascii?Q?a/lz8CVzX5rtYG22wV46ENuzCvRqvfpC+iX4vKfrbZQGahzaY2YFh6ViFePR?=
 =?us-ascii?Q?an9v5Hwo0Ugw+jHhWhTBEbokaXz2ag+74prfvni6BguNWAvKaFEJp6LxccGb?=
 =?us-ascii?Q?R3lFLyS7WEKjOwryblnovnQMvKeSFbqzcrXLC4PPDO+P3H0VK6O8UNxgRPHq?=
 =?us-ascii?Q?1CEDk8MN+YBDVARENydsrzCDJo0dwvigxUcZ4Cs1W4hB7Br94Y0lRgvz0n6J?=
 =?us-ascii?Q?Lnu7jCBzNtsalAcY7eZ5WAysS/ZUPqhWqyabOWo6uYES6lSaEg22RU0Tqs0Q?=
 =?us-ascii?Q?usRIhud4YtBf2EV7G+T9vR+/Uee+GQPWKjJh6qft/yknMHymJV1KYCdTTdnI?=
 =?us-ascii?Q?b1RSktDFmt3ORJYqJeCg6oJ8O/BChd10ln1AGHAxFNoxiWA1DcyQuDIGrRYw?=
 =?us-ascii?Q?dxz9nIPbrIAB7xSne4WYVBkgTVR+xg9/RtG9XqF5JvIZ1Bcc/bN6AkZEhljv?=
 =?us-ascii?Q?vKZwd1I+5kefnF7G6ZGtHKjVsGo3ll+7qwedupQeHSxaXyqkpZU5XvvE3Mna?=
 =?us-ascii?Q?UBoYUHK1w5OvWP4LQQLe6h9xHWfpie56R8JK99DQotdVwlaYl0bGIvT/z8Sx?=
 =?us-ascii?Q?fKgBcsAyOkGo8VKoOLEyIxSb4WPFfY1DBnLaS6kYDAr7M47gNWzBEGMi5O3t?=
 =?us-ascii?Q?bnwMmAXlhPZp21ta7B4S/AwhCVCG4rxymE64QoGKOd9dSBZvODKxm5ykBE+L?=
 =?us-ascii?Q?DE2M+XpON+kSIB/K+JOn9FBUJl3t7PY/ECSB3VperAAj7aEavGbdktjlJy3E?=
 =?us-ascii?Q?QXfl9S5wKeQ69rbA0ojkB8y5I0/ax9x10J/3Tu7vS0d+jgCyhxiNAicXF4z9?=
 =?us-ascii?Q?nxEq4bF5MPLPLCb217c9KxVjxTwEWlLiAXTCPnpvLql1Gz52QtN/qOqKDzg2?=
 =?us-ascii?Q?K/9yRqh/ErNcURppMxE/00bW7IIZXoZ7IfAVK4u+vtshcDU+uonVQxgNaeJf?=
 =?us-ascii?Q?tOz+/6VxNnkAMP6YlO7Pv6o0DQUtbRIMnHiCtbgpNYrP2vtcHi2s/hDhKAhz?=
 =?us-ascii?Q?v9g5mUzIN6JP96DghJoSw553FFRUJ8uNxdcZJtNxnGa3nJH3D4cYWN8G9Ck8?=
 =?us-ascii?Q?jIcfGjG1LI2EIIfPq1AVpQKdaYzcp52vcUaQ7cRhEW0QD7dwytS1BgFdVX8p?=
 =?us-ascii?Q?bBqq6jXkl1mbOx6oKHj1KlBzVXzEQuVyAHtFN4mbbwK344QuICJqAIQxbCqQ?=
 =?us-ascii?Q?mO+sZnKN52KWUlAl7Kn5GBbsnhiUOwgua8lxSfaU/m+MdxHo3wDWf60YzmQv?=
 =?us-ascii?Q?IgqYisEbplWE3wmnJ6S2rZJL9Bo7PXHQ44iVBFvwuDnKYzvnxX9wkH+x7nCh?=
 =?us-ascii?Q?xdXjIR06YISbeAsjSHf3e1RwTBHZwqsYuhiHDrN4d5Y8Rj2Oycz02nfld3mM?=
 =?us-ascii?Q?j6Jwpc6y/7dc0GdulBCv7uDNR6oRa3Rv5EvyDJ68h4GvXkhJAXjB9qAiPmoA?=
 =?us-ascii?Q?UEcPHZTQcc8xkrxvZRrYQYz9PTFeJIzC4F0og+8GEfjw2z/n3n2lz7sLeO7/?=
 =?us-ascii?Q?RPrcgYlCcTmV7RpLkMEbP/MF+ow9j/XoX44aWo/OyCk9ZArjj77lgSAYl/kn?=
 =?us-ascii?Q?tcUH/mfWHLMiNp0BpcpAKD4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c25664d-255c-48fa-4668-08dc11797537
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:14:13.6202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Igb3brg+bSVUGpbXE5nxRQ2iIiF075fXUsbjA/SmFBuafKwIhcHNQ4JmQHRdACrc7wcwCEngA3fbKJJLxR/lmjEs+LpoJBqVuwCiUuySngABucnm3NObhwpiC5pQKJgr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8442


Hi Rob, Geert
Cc Aymeric, Goda-san

This is v5 resend of ignoring non Linux system assinged device.

Some board might use Linux and another OS in the same time. In such
case, current Linux will stop necessary module clock when booting
which is not used on Linux side, but is used on another OS side.

To avoid such situation, this patch-set try to find status = "reserved"
devices, and add CLK_IGNORE_UNUSED flag to its clock.

Table 2.4: Values for status property
https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf

"reserved"
	Indicates that the device is operational, but should not be
	used. Typically this is used for devices that are controlled
	by another software component, such as platform firmware.

[1/4] - [3/4] : expand existing function for "reserved"
[4/4]         : adjust to "reserved" device on Renesas CPG

v5 resend
	- add Acked-by from Rob

v4 -> v5
	- typo fix s/assinged/assigned/
	- separate error check on cpg_mssr_reserved_init()
	- care it.node on cpg_mssr_reserved_init() error
	- care of_clk_del_provider()
	- rename label "reserve_err" -> "reserve_exit"

v3 -> v4
	- add Reviewed-by from Geert
	- Tidyup many English
	- use of_for_each_phandle() instead of while(!of_parse_phandle_with_args())
	- move cpg_mssr_reserved_init() into cpg_mssr_common_init()

v2 -> v3
	- "__of_get_next_status_child()" -> "of_get_next_status_child()"
	- add Reviewed-by from Rob

v1 -> v2
	- remove "default_ret" from __of_device_is_status()
	- add new parameter explanation on cpg_mssr_priv

Kuninori Morimoto (4):
  of: add __of_device_is_status() and makes more generic status check
  of: add of_get_next_status_child() and makes more generic of_get_next
  of: add for_each_reserved_child_of_node()
  drivers: clk: renesas: ignore all clocks which are assigned to non-Linux system

 drivers/clk/renesas/renesas-cpg-mssr.c | 111 +++++++++++++++++++++++--
 drivers/of/base.c                      | 111 ++++++++++++++++++-------
 include/linux/of.h                     |  11 +++
 3 files changed, 196 insertions(+), 37 deletions(-)

-- 
2.25.1


