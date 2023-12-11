Return-Path: <linux-renesas-soc+bounces-876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E81B80BF86
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 04:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F071C20908
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 03:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E867915AD0;
	Mon, 11 Dec 2023 03:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nZgvu2oP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114DACE;
	Sun, 10 Dec 2023 19:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7Wv1LAjuhSdQrpv052VV5BZpIIcZUyXMUlLWbGmpNHkNawhe3Uw2sO0gar4UUMnuPHVRXX6RmeXwVvu2L9axWD8PtUWJrCN6G3fXhQ6e5XEhSnXyPpMaTubpVmk9G2xuGrRvj0Hja7SItQA0SeOt5Yg6behZYRvt5cD8RJXCsluL6i1KOBSRJfWt86axnrHMBTa07zR3zhwkbNUB0AeMgykSIlfJBAK+Wt7j0DQJbJguhNoavBXONIRCLmkfKh+oCyBg+aQeku6DjW07YIYauv1ZrK9AVCBc6lMJoHcrPxY/Pog5AoptXDgK0w8hUpmIfxtpx40ALfVVE/JJV1abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElOt9JZwPn62x5J9wrQyx9JMp6wCY/qTOMCqHm2VvvE=;
 b=C6q+NZ6T+12uZYE5Ma5opdwygqrchODFjYaGBqWhHI5SL5akSKnrw9I4KUVAy3wBg6s8QEPjgxhZSoWJI123l2KyrFRZVJ9VmQeXNUfToC/DXlYk3tVj5J37ObCx7U8IoiabMYr8iyUSRZIj8zEL+8vft5P8xKwX0uOsJSRf5qw0DKERZNGJlVJ5iTWEmVPDqYgB0FKvSDL4fZuGAVhP9k5duO75y1nRddvgOd9xaRjI9TE7ZKkSd8SEAiwPCZ8O1wgahgz+8TQAomTg4y7UrvnS6JhnUpxdkxnWgG7iq6B16PuxS2fPWUc56esvWOR3L+Icd0BWU48An8mThIT6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElOt9JZwPn62x5J9wrQyx9JMp6wCY/qTOMCqHm2VvvE=;
 b=nZgvu2oPh0CmF/KUJMgit+dGu8rCO7akwesCruV8hoKf2JoYc2m2Qs6tl00WwTck8BSS9cVUtal0o0UsJgRcMPPJbIk82haenAIJp4MRzQ/F4obrk9QXH/KeG0PpEAIjdaed6o969mnEhvYZvXB93PYxWt3+CwRub9rjzmQA+MY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Mon, 11 Dec
 2023 03:02:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 03:02:48 +0000
Message-ID: <87wmtlo2zs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 0/4] drivers: clk: renesas: ignore all clocks which are assinged to non-Linux system
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com> 
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Dec 2023 03:02:47 +0000
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11269:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b61975-ca87-4078-db27-08dbf9f5a7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	toi9CPfu2cHNTUVd1bCzUp8EpN8sow9jJBfDnQ2hA3h4pv2wYHwta2iBH0i7Fonk51pFIWrxmuJupAieldZc3Ai0zqFDfVXUtP3hoM8tz7vhjpP85x89/w5xqwkYg4uJx4IF5kMV0UmiPJ4J8nVFIySGTOJZO9xOgevz6xLEcRLBmEissXSYOtVDRyo/Jk0dIj7AI8TW6Eqj5iT/IUsM9Fnxyn6iuu2NaDTNGjjGOzJe80TUHn+S6tVVx/XK1pvfXlcHWPq2L28BHjhn4bfCgCepZcljeKWjhRTXUtCnN2OGCI65RjDBxGKvqON1XQTZm5vH3nI1T/aSKWNNcnBchGB8ud1IpfVeGcRMlwBSDeqVuEKynoLvKAo9hzt1kmTElV469QYOX6uHW/s60SzDFkTJb3Q5jhcmJVsXsVL9WH4kZKuulAnkZkAuXq1+/3OWIj0i4RyxUCW8ZMaHCvCokDIyw4Q3OjGW2mfpyqsBntXA301yX1RIYP/K6vBvyCaULqdhHGn9Fsc7m+COsR7DRN0a7neeQaye9cOGSQA/RZXb0q37JICTyFNhiMKP9WQLSYkgkRWLT0BU/UiFA2TMK4NxiCAlgUXcHdbps5M4qOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(5660300002)(26005)(2616005)(107886003)(36756003)(7416002)(54906003)(66476007)(66556008)(66946007)(6486002)(966005)(2906002)(83380400001)(41300700001)(38350700005)(478600001)(86362001)(8676002)(8936002)(4326008)(52116002)(110136005)(316002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FMBBTvjftykMxQv4B/9FPoH26RKtB4OJ+c7i2UVV5biYTDOY+h/YTkZ8sUFW?=
 =?us-ascii?Q?kVkdEG2zdOpwRme7gmptf7DQBlvJ22DhEvQucu609ztGHbXRbSKWebgSj7CS?=
 =?us-ascii?Q?QpqSa3UbDIJv+sx7KJ8b0sM8bmPBkCnad7rCf4MVM0cAOYHA5KOimsyK5GwA?=
 =?us-ascii?Q?0lpZsVYSIektQIzli29qPSfpvk5tt9LU51DDq79I/aQcUdCv6jYiyNWDAwJu?=
 =?us-ascii?Q?LkdEOlbrf8aM2v8JL/s6OciO2x6PbwnsOoMXL7BA93h7KLFS37tQwvpGNqPs?=
 =?us-ascii?Q?MpxFKqCljVA1RJd9+UDlJ+WF/iDh9XSjqmHgPuHwPzIpDt/b66Wou7gWLOxX?=
 =?us-ascii?Q?enxVxm7ChafA9/xesHw2iGdp85AdTau4EZF98gtNPzVRf3TF3iBOQlSgkhQ0?=
 =?us-ascii?Q?gc1ne4Br5z8g1BdlwrtbGmHs+21RjZc2ttd1pF2Yc16iApXDVHRJsO83eOlg?=
 =?us-ascii?Q?Vcd6sV+a9nr+MKpTpGdp3FY3VfP/7MajExMhxKXgHoVSO9ZyFtFoiC6WnBzZ?=
 =?us-ascii?Q?KbAqO2ycwGLURV/fO4pa8VDhm4fn+fG3KcNUXns1ol7C6eGFblx8Qhcs9YgJ?=
 =?us-ascii?Q?j/VuhTeGmkXVp75Y20J66OJNMvybMuY4Zs3z4aJXtfPtzSeP+jJHoGQ9/5fJ?=
 =?us-ascii?Q?Lt8REbiSt6gdoeQW2PWP/IY1ViV2UX7A02C+uBevY6CStDYzob8impB5XCUZ?=
 =?us-ascii?Q?ohuVfE9YDerJt+shWj9WENEDD9HeEMU3JlBPpIQ9Z6AH66906CflrBGI0Y5F?=
 =?us-ascii?Q?Wbmql1bat+AoLRUf3Yg5kzKdDbXM5jLOsK0P/zZjNPy/jnm7wEz7jsqSB2pw?=
 =?us-ascii?Q?TBm6iHv1q43rdIyf4kFjP0SX/208sIx50T/VBdqsJKoznlOsCRLjF1lXyAqd?=
 =?us-ascii?Q?09+mddMwvrwz/neWiRgeLSETPgd++aYtEq+QT0l5mhi8cdar84r3qTqyEhBO?=
 =?us-ascii?Q?Wd4SVw3iCObEsMXzlM8vebgr4SJhzDs4ppbTTdTODyjDdjzBtbGV2kjVNpU0?=
 =?us-ascii?Q?50nKIsKs4cUPoJs9deAiDbMgYczx2qKBHvk8XRHI43F/qsemWUSPcjtI+unC?=
 =?us-ascii?Q?pTVAmmHHFv6M9BuUqH+GZyuAVrv7X6ewLrTAAM8CD5etxuT2po+Gt9iaCu3M?=
 =?us-ascii?Q?2r0ACMraMDI9wqSEIHPBKMD2y8om3bXLx1YXc2d2UmKGFY9VcbhHYLYvGzcg?=
 =?us-ascii?Q?tB5yapPnnHNNfkoc+GA0aeosjnr909PYmBSJ8Z1E47n9j9DP+Alq4bq4+aF0?=
 =?us-ascii?Q?YVGDj1c+qBRo5AHeQKgc2bT/vjCaskHpteI+dCfjiuMkUQOU4pZ1rYm4UqTd?=
 =?us-ascii?Q?PMdu4ttqDAhjVPBZA1J61vOCIiWogE21GH+IxiW5jCwaRq8dTsZac1/WiK11?=
 =?us-ascii?Q?3gUeGQIY+X5W2LlQKLyNVf6+C2GjcwSBGRqurDYsZSwdvdPAHTm9ISq1+VRa?=
 =?us-ascii?Q?T0CkzJnhh0U6WFx5i49GsU4S59rJhreM1+NDhdQizqiMdrNxs70ukvUW8BL6?=
 =?us-ascii?Q?UttoZPcrYR4E/5o4LK/3dDzwacQXPzjB58anl92K9XK/Rw46/6P1Me/kprE7?=
 =?us-ascii?Q?55hSXkPNeZiF9rOPNLcutO8Cl/1mzu1MVVN1df612IoU3B0k2rN2AfDNzSmD?=
 =?us-ascii?Q?cd8MumfgGoZtJxpTZYtqhVI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b61975-ca87-4078-db27-08dbf9f5a7b5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:02:48.0611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9vT2s3OCd1r9mqIbIBOukHtRVbRGUuqcJZ5kjgceA7Ns22nzaW08XLAfG9nFtK0HqZz8XN9K8KyrTubTpQUQ73euyc+8FMBV76DzjXNfpX0AUEVYTf2ZEzsiXG6U7yl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11269


Hi Rob, Geert
Cc Aymeric, Goda-san

This is v4 of ignoring non Linux system assinged device.

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
  drivers: clk: renesas: ignore all clocks which are assinged to non-Linux system

 drivers/clk/renesas/renesas-cpg-mssr.c | 101 ++++++++++++++++++++--
 drivers/of/base.c                      | 111 ++++++++++++++++++-------
 include/linux/of.h                     |  11 +++
 3 files changed, 187 insertions(+), 36 deletions(-)

-- 
2.25.1


