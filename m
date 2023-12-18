Return-Path: <linux-renesas-soc+bounces-1178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E263C8166B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 07:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F3011F210DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 06:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5226FCB;
	Mon, 18 Dec 2023 06:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BpLKx7sH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2111.outbound.protection.outlook.com [40.107.114.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06FE54A;
	Mon, 18 Dec 2023 06:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJ/FiSCpqEugGSVQeRs3EdSnThtBaQSHzpivlBikzQq7t8QQkzz3GgtLmQUcSnZby1Lfds1SLVbdlOPVSiTPx8EdUqyRDH1MB9UlUa4HTFYHp7MGIcnpO9yPvcuGnKJxWKryLrvE2M0s7LQlXxhTZnM02LOHygekF/EqLfHBoCw4xFWQYH8rXIiJmTN28b7hV69JJiE4Ln/mP+TienikTwxNsEvnIIG/OH4P/n2XWYcOMtga7b/xqHJo4h96OJpcEtlCqWJuAT7qBnb5xnNEo7pyt0YFhRC4dzOLBojVPyxiKt60avsKxG9txlg8vTxrUrHAf9q47DfSS2ULcnEZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auiV8sZOYIaB0x196tzFYi4vkytWXANMlpKBxSDAHRY=;
 b=U0d4FLoofHvU48IzOESpqAMVgefJxrv2nAgmWSj1/yhgmZMqApEHLIkJuhErvibk3BbGTBOAoRVbKKwccFNzr10QnIwKbSTclwI8B2bkmCZd6yh18LVfBXdIH58zCgRKOb7i2Qkfy5QicxKK2ssiOdfBYlcepy1ZsnwIzD6YfhN2FBAGQ7HCynp2zRIg3jM91E3waMhzNynxqHkcQvdyc2E8jbWWp210W0ib0amKRCBcL9KZ70eaooMhJ3dz6YHlKmpNjdTlrx0Q3E9P2HskZWRguZePG1rOxsMV6QStVltSJdczNiMp7+z79mZTMXtOOGuuYPQ2vrMI6NypzprXgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auiV8sZOYIaB0x196tzFYi4vkytWXANMlpKBxSDAHRY=;
 b=BpLKx7sHlcM+ciefFc8bhDjWiVm3a8BJNjdqfnAY1+r+8xGhK8M9znONdxqxrnwNLFNMLQa7lB4T3d9H8wEaCCRxczQDNIIwZyeVKbSWrF7X5/If7YixMSDOvdE8cjzBinThcG7T+C+LlP5lcJDUlF8Ek7QYGD+Qhz0YIsQvhAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8348.jpnprd01.prod.outlook.com
 (2603:1096:400:177::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.15; Mon, 18 Dec
 2023 06:45:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::eadb:ae7b:5fed:8377]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::eadb:ae7b:5fed:8377%5]) with mapi id 15.20.7113.010; Mon, 18 Dec 2023
 06:45:49 +0000
Message-ID: <87o7eom2jn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 0/4] drivers: clk: renesas: ignore all clocks which are assigned to non-Linux system
To: Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com> 
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 18 Dec 2023 06:45:49 +0000
X-ClientProxiedBy: TYCP286CA0184.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e70ca0-180d-4cb6-e61c-08dbff94f899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w6AMmxBSzWDlLwRy2Q7NvEUZx7rjNxPI7z2hBHqQXPiKKyOIQeMEjiuwPvaomkA07SVQQDurwksKbBWsv+DmFLb+dPAzELDio9TrBXm+6utCP4rAqD+qZ8yWEmq6PGh+IEPfx4/S5GjNDUM2+C5mi8vl6bn3PMNButjggRU6NWdwVaBm5tP/3APpgk3y3f+ma1BNy33aRmgGPeHV0w+8hlf+EaRzOiAFunBDQqo+mUJd6KlmgnaV5jy7Ap+pY0rxyNBjacrh6Ch0LpSJBDTys41SVNnwRrHatahAD6y3R1Svm3aSrRBrlE9+TA7K1N5ROC9yhHpzE4Ejd2MifyVmlWRD2198WEGVLo6dmz2ItYIV4E+ZSHov4wooVQd1w+MumU+2qKVPx63/eshBKh/FXN37rJFKkmU1msaEmCMi6y4x+LrXXZNP0sPE1TmGPcFf1l1d7jIw/E3wx9sOZoJIug/r0nzqHSJi4nQiezzsNtR94M960nscpmk3u2kBxnincoxFmxRiQ4CkY0pxVTKwgst0nmGjenlVl0hjniBR+rMemptDGQx8+cZbmKxGHrKdlQkCTr0VuEi8fbqj5BZY0dmMbBUzrdif6UKrY4Ee2g8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(376002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(66556008)(110136005)(41300700001)(54906003)(316002)(66476007)(52116002)(6512007)(6506007)(66946007)(2906002)(6486002)(86362001)(8936002)(2616005)(8676002)(478600001)(966005)(107886003)(38100700002)(26005)(4326008)(7416002)(36756003)(83380400001)(38350700005)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OkgYpREvqe6TqNwa2EKhiV2H51FPBjnAFNm86xF8JKgu8YwbsWAu5RB++vIz?=
 =?us-ascii?Q?UB1ZnfVsiHzntA+QjIGGAKgRQMndBCtB6OsH1/+m+adq8G4r4h2jEgL3FYRA?=
 =?us-ascii?Q?Kfkm0XJ8lwT9UI8T2ZPgwJt1APTOpHFw/v4HkKF5r50BfOeTkCy6HFPLduMc?=
 =?us-ascii?Q?AG4li6+oNW6HfxlGdM0BM0OF43+tJhFvJnYCLKiHhewaVqfOVXBWu38djeFV?=
 =?us-ascii?Q?/q7Wpf2J+DW7Pj5C9XsX5ATxN78bN2t348an3n2oIYiOQEj/3MmJQVgMSIA7?=
 =?us-ascii?Q?GmdsklGeGM5dUiHLgznAGtrGSABGLr/Qcam/Mt3QqsRsnLcImNMoA5QYoKce?=
 =?us-ascii?Q?tUpRCVWhCcMCZ7xloVLXXcWrSraAlfh52hnP7c0SHuFJkEpcDzq1Wdn6m8Xd?=
 =?us-ascii?Q?gM9MpW2M6dArjRHNav6cCEN8fjM1hClfmXjioH7AnnhsMUl432e23Dn21IlP?=
 =?us-ascii?Q?kGzmrmXnJFTg6Qfu4vbn+Liqc68uxSX2qgSznqmMGnTrwlACUDkAtX3GHUgm?=
 =?us-ascii?Q?q0wU9suMzQItujlKffvPffCdnpSIoGHOzQD3dumraU15+hWq0fL0JeSDpWz4?=
 =?us-ascii?Q?pcb0VZ+4XcG98rqRGvo/S8vl0sIPpTdSGndM8LOQsZEpoR2LGuF2MLgI/U7k?=
 =?us-ascii?Q?q/n3ofxWJbQ+XCe3LwC240hhCxxVcVdISbLvqX7ICWsbbdBvLh0wpjynwXkh?=
 =?us-ascii?Q?GZjEQsb57X0083PwIKNj1PuyOLGv3QWWU6SJZkWiSJDj8rc/mOlopdiPtEpv?=
 =?us-ascii?Q?5aR0nHBlXhCmxvJGJflbFa21XzOoJCofgkilMZAyngLW8LJPfJfGLWzMgQor?=
 =?us-ascii?Q?EP42SzhefDSbcCM+MQiyKCrt8ERhALUzIlWgGfOiK5fbKx3oOWq2UkBPAbY/?=
 =?us-ascii?Q?CXh7CJ2beUJHmzNaSPZB4TlZsNxVMXylj88/PQGAZqbP3iVx+zmrumSq3hqM?=
 =?us-ascii?Q?oftxxJg/Wzu9c+keH4PO4EEsBTB8mpwBtuWX6L4PN6XVtG6PaWhqpXQLOQoJ?=
 =?us-ascii?Q?5h0HLd1gpwyftP/P2dg0wUDROVQpTVA/0dh2Ku1CzjnLqJJMSSVMZAdn/KPD?=
 =?us-ascii?Q?fPpJY5tG4faMQ/FK7G5L3M910l9zqF4+DNSpwj6xpEsNaNdxBki9jn9VcAHz?=
 =?us-ascii?Q?+Kx4FRma6UOblW9+81nVA2y3/V+cndhj/a24zZ66IZL3HfkcmZSA9VFJqjLC?=
 =?us-ascii?Q?I9t/sAU9k+Ov6FfKXll9lyg0Oy+IEsNujW0zb5ovn2m2R1LSzK0551OT7YAF?=
 =?us-ascii?Q?qrn5SrZDWXdE6gzj8iyWVVt1VtJsBZNkykEK8jgXSxTFryooVZ79c7GZ8EvB?=
 =?us-ascii?Q?7Hac33LIgjQyL2qXJo0OqzqCNzCVwurqcFP+jhfkE5PH+oAVCF4+NWy6BfL5?=
 =?us-ascii?Q?2AGPZWwDEVmVDVlAF7ymVqv6JRHjvX0Vx6T3gQbNrIKzW2CArJswVLTvGmqa?=
 =?us-ascii?Q?4dhj+yaz41q65A+KIhBo7HM37Kh2oPhZl0EfN84tAJBgp41klat2neiYj/Hh?=
 =?us-ascii?Q?wmjq5lTUE/dcgw1jt4nU07W/fK0f3ybetr+aAkvI52yAG0u4pXYRWtQ//Id1?=
 =?us-ascii?Q?gAnfYb1GwgzMKQX+2aSlT6twDUjUx+bkI8ObB5kM8adNz1UlhOMsL2LxMckf?=
 =?us-ascii?Q?rzmlgGKyA5OI1TmXEFAtJks=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e70ca0-180d-4cb6-e61c-08dbff94f899
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:45:49.5734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQz1o+sX7+L3alDNEIGPaB9Jm+Es3dp+kHOfKPSkLQEZJ01pX+YNKO2duDklav1HFIIzEUeMubYxpvdI0Up47woX8hua5QzW+wkDvcjtbXZGKWvHsR4iD7gClYu0cS/2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348


Hi Rob, Geert
Cc Aymeric, Goda-san

This is v5 of ignoring non Linux system assinged device.

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


