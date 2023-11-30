Return-Path: <linux-renesas-soc+bounces-440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA57FE68A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 03:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8462F1C2099A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 02:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589BACA51;
	Thu, 30 Nov 2023 02:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ShR7eaj7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C01CD66;
	Wed, 29 Nov 2023 18:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYg5y8tA25+PAdBn4hQ4s1AzComNEJejrlrK9kANeQ+RgwjN/DTRgmjLlSFkYHG98HFSYS15sEqQNz4vIOqD1ARtGPWJ2q5JuAD0fdKGKWVwsnqbwEqtGbUAYEk0O9pWd1QRpcA917drYkO/wY5knor9z29abs+271NLJBO93ws9xNKBx3IKJE5+i9s2iDTZomME4G7IBHg1vNk5mfcHfng+sIa0NC/zXTo/b29f55mnqwcRLNMzSzqsDZYL73itdBOLWMjvmd40kHV6QCuHChPgR6dwuDuP4OVeDBKmNMbTAgSupsr3Ht6ehzTUCjTeE/uvz9z9fII1kd7NXp3nfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5crKv1c0g3NaUG3tXmJP3+seaVXuWNVQNE/QmHihCDc=;
 b=hGpF2BCdceQMIMdQXH0lE4UIW7EyXyjNlywVUGlc8HsS8vsKMTJSsBag8tZWo+xXDR/9kVoJ1XUI0+J+UhM40cojXh3RduxhFsKSi5QgjMMP6DUpzDwuCBrmOtvW3zAxPfIX2QQo9L6AexUN2uylnAZy9LaDmfpyLHjpio2ht5jfHrIl6WJ2AqoRVlKsewg1cJW/7+L2OrqL18Zwvjq0kTWAZxuyQf8ZQLWmq6xXuYh1ci5T6j2+r3CG0PyG1h1jDzhzv/22nOL/QFdW4dbmTwVWuLqdUbTbLz+ozaDRR+2vERVtPQV5rSp7oTXPoEgKfzSncrtoKsTDPyAS1YMang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5crKv1c0g3NaUG3tXmJP3+seaVXuWNVQNE/QmHihCDc=;
 b=ShR7eaj7yk17tZCCiUzlLWNxLKjd6mf0HU7MYEMfXOJhMldtdLqesw8Aq+xGAolJom5hAYkzOAhXQGEkccUPKFstHKH/UasjXkj4WwpGZqt+CB9ZgZWBnRWNPyHdWPY1EQ1mHPMqMAb5XoFIvgDKbEt296Oas3a+TKhwk4D3Tmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10232.jpnprd01.prod.outlook.com
 (2603:1096:604:1e4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 02:14:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 02:14:29 +0000
Message-ID: <87v89k0yyj.wl-kuninori.morimoto.gx@renesas.com>
To: Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 0/4] drivers: clk: renesas: ignore all clocks which is assinged to non Linux system
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 Nov 2023 02:14:28 +0000
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10232:EE_
X-MS-Office365-Filtering-Correlation-Id: 0623a70a-26fc-4931-1229-08dbf14a1560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FSjD4e7kWl0a71k1a/m8TPIhCawBkSoJnhtYBo6clbg1f6z1mmfUA+k7wjU3STbMCGwe+WrlZLILMePV6cWwI0J5ukFQKl+0r72FqiEeAdEe2tMH8yg1/POR+TNwLx/Srw53lsvsIeG8FpwBsgjaO4+mGA8dWeh98vu5jOP1ZAyvc5RBDwNAjRtPBFyFPLqBnayhGAUu4r5KAozZTiCIbdLR0NXvR8t7cQWvBde9KDzlOXCdkMzMjBDH1vV6nmx/nYMkTNXzdIWhyMYrQjsO60jpje6Ndlxi6ykO2l7BLg0a66nID2LPhHFAxjkDMLYbT3TGgEYwqbmlR25/vmEGtUADvvvkIVl4w/V7F0TGuR1cpzPmb3VVtIp0g39UGtmDUaNKGuvfC1g3IG707xuGRmhapKxIHx2RoC/PbRaOFQ6xGsNOyf+ytyE3AZuZhzSBRp9SEwMvRx35DZASXvxCHU9iodflc1eMH3KziU7KGX0fy8yCcMeyNEEZJcJ/XfDqRm6u2m0POD0/xUIrhcTdxgWU8YTRN5f1wKA5C9pxWEXk8ZLPZWgZ6WcQqeQSY+DOnK8NGu0YMm/9Cqrgn+6I4BM2QH8FHqFT/RM+sdFwo75VJ7sQ51uK06/L+TNWl/tZEkJonxdu4PV2OMSbRg3oHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2906002)(7416002)(38350700005)(5660300002)(202311291699003)(6512007)(8936002)(52116002)(36756003)(6506007)(6486002)(41300700001)(478600001)(2616005)(83380400001)(38100700002)(966005)(8676002)(316002)(66556008)(107886003)(66946007)(4326008)(66476007)(54906003)(26005)(86362001)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1uMrnodZVDIms2LTD003TMk7STwz3wPcAjSNhmivKAqReG4Vv5nCY+cfUehF?=
 =?us-ascii?Q?e/vPNOZMTH8/o0e83PNBkMcJngBVWjuejZSiGgB4zgp6+CPdED4PNP+6rJc0?=
 =?us-ascii?Q?FGgV0w6bAla0r381/p0D3jUdZT/I/5hkErLjTjEADvmGfaNPTv1zVhomMjxw?=
 =?us-ascii?Q?hNKYBNDkgamSHgLbVhYtT8YDmZ3vGMHeLaJB7Pm84VP0DwmJjrZ0urR3R4By?=
 =?us-ascii?Q?niHJ6+qR9UEi/X2xE9/oaSKlh3EiCAE/hdq2adTWhG7anzpnrIcSqrbIHqTX?=
 =?us-ascii?Q?fS9COnveoqoZj0rfflGA4IW5kGHhEnCshXZLc9j38cFDmdEwjuiJdH2KX2vR?=
 =?us-ascii?Q?B2M3jzS5vewmN9WPT6iYfPW4usVMN2rh9IBiImAu6fmLn7yK5yQPPH01Vkqb?=
 =?us-ascii?Q?P3LJzbH8laoNi88B6etvik1ZpjvJxzHQlzUorceWsiwrO4nIeKWY+q0T3PaF?=
 =?us-ascii?Q?LU5p9TA2HJidhcx26UNk1gkd21zDraFRi4rNrnEg/5snUFxxB1Q/vXgLdx12?=
 =?us-ascii?Q?sgvq5JcEYTQJ8U0q4s3cXnyN2NUIEmb3lFG3bDozTZJIZerE0WJfBQMdZobx?=
 =?us-ascii?Q?ufxZGxfYpbmBB0iuBsDNSu1uEV2w70XfVcJhMPFeQX2fEpx4NcK8Xdwd9ItZ?=
 =?us-ascii?Q?gpNl06ZO0W3aIrLPtNpaEIx6/KbkyeFG0n/pX7qFmITKdageflHJ3w6GiBl0?=
 =?us-ascii?Q?mJDtCRGvWqr1MlcfQ7C2OIfDmJ18bQsYi0sMu3YH2dq3p+JEfUE9hKMamIuT?=
 =?us-ascii?Q?xH61rlsC1gSyacIg4VGk0mtq4oYrV3L2CjvzK1A5hglb5JYQOeELagEIpCAo?=
 =?us-ascii?Q?wJhUqfv1Es9qly4wsh8trdLC65r4WmjMIEVCL/A6lBUfzC7X4qF05RIVkJI/?=
 =?us-ascii?Q?Zyepg5zzzZpjk4noJduky6c3EWUMeI6H8OsegNoczEaX+V7lh0tl/hA7yH8B?=
 =?us-ascii?Q?B/zr/mrIiu7zooaBBpeBHqz+BdjfTDUQAFX9t52thohBP4IiMnaVdlLJXRM4?=
 =?us-ascii?Q?GFAkK9ZksFj77e7SKuQ+0dYcMT7veoiWiBZNJRrZn0PyAJLpvmiqerdPSYIm?=
 =?us-ascii?Q?i8jZHmTGCv6DTkcaA/rEbt6UcCFvX3RVtIIpoyqqtKWAFLBA4HlCHMjuOyTf?=
 =?us-ascii?Q?ZmqwE2f0C9+XWaIJhICoU3xaSqPUts8fTxEEjwromawb7vstuWEdNIbhGfw7?=
 =?us-ascii?Q?3FE4Zl+urQOmRONhrJfJcv8R18FQXlG9vYC+aSXPakdniiiwQUAzC45CWvMx?=
 =?us-ascii?Q?gm3QvPAyXcf3IaMIzhDF9vL+v3I4cAE/r3bVxsO6gCEBK5x1mOTKXikZKyKg?=
 =?us-ascii?Q?AJ5e+YBcUVsKh2RzUOnBWeabIuAXF/UksglV3dfyuZzW1JROmbA+LbNiLn4p?=
 =?us-ascii?Q?NiwiP3khS5WRxlKH/pLZYZRdKOe35SJ/7tqTy4Z0bJ0Zgo8tcA88NMNIhy47?=
 =?us-ascii?Q?210gTdlYRKB+8ACaXAiCxeqrA6yGLtFT5CEZn6sEuvPPkRQtQb3eFkM3GSQR?=
 =?us-ascii?Q?WsLI1KgJr4fTALVTVRomh1KuyKhpgwfv9fTjH/tKcoZSIaEgF1Uw0r9B8zpr?=
 =?us-ascii?Q?kxDZTVSMiEcRh4d2A1UrllCd28eJUpqD47a6gJLQFdpYW3J5o600DWpvgNDh?=
 =?us-ascii?Q?W9Ujn6DwlJtibn4GG8hd1YY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0623a70a-26fc-4931-1229-08dbf14a1560
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 02:14:29.2444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcKUwMKVzRIUfAy1iG8SzA8jD40s8ALjzVQVyLdcnB98r4ZFbF0tglZc3eUbGXepP98vOXQoR+A7cOHpEmkPT1+LEkDTyfXovtJt7PdoJAT1dCP88lMK1H4rsxGJwtqF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10232


Hi Rob, Geert
Cc Aymeric, Goda-san

This is v3 of ignoring non Linux system assinged device.

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
  drivers: clk: renesas: ignore all clocks which is assinged to non Linux system

 drivers/clk/renesas/renesas-cpg-mssr.c | 118 +++++++++++++++++++++++--
 drivers/of/base.c                      | 111 ++++++++++++++++-------
 include/linux/of.h                     |  11 +++
 3 files changed, 201 insertions(+), 39 deletions(-)

-- 
2.25.1


