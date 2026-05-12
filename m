Return-Path: <linux-renesas-soc+bounces-32508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDmoFOJxA2q55wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:30:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 514BC527AD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F4773019035
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A206385D9D;
	Tue, 12 May 2026 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GaOCFgB4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AB6385D94;
	Tue, 12 May 2026 18:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610500; cv=fail; b=jbfRFMIWH39ygfsWloQjjP48qL1To43LKnCRIE5szNEDW7caOygMWbpfqD+/ViAwSCclAAMApq0BVzmul7M9h48GNNKcF6mGsasroKH91R+wLOdtfSW4Gn/5Y4BpYx3mClFooqOy+BlL5ixdzwh0xhLGpsfjRJ4DxuctZXqxQ2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610500; c=relaxed/simple;
	bh=ddLkNmI4jzJPP9GQ772BGB12UnOkAmXPhp1WeyDQ9t0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EQuZBsLhLoo9VpVdWRM/QwdIPyRq8vT70e7vK4yq934NOoUhodbrXY3HthRgTMFSyis2G4AZMgzEGhEfGQPOKk0HYVeZ6MJPE8ZlbrIFlkfEmwwCJwAVQsbNI6rbojinZyYZJZFEQ+tkUu48kBG7Zdxrujq1OinODxneJ2YfiUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GaOCFgB4; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBnMQhmJUhGRgxgV266WEsRlyRJ9JbMX6x98bNImxnc35kUfgLvD2hslAl5PGeNPUO1yy5UGs9RrT2Pp6NnTlzAmHV+J1Q8uUPPKG/x7GI22s3vNqDp9HtHokpRQSFJOyH7sixQxf6y5WDfqmpZhRYFhwrCK8zyqMLt8OPZPsyUY2OXoPzwgIfZ8EiLQ+kanSyPLADwhn1B2062Lk33k1a6LtCdlLU92g2EJea5JtH3G1mVAsZXs+jAQJZEdxudNCXLnNQdhSF80XyPkd2taTJn/y9tNLYDaPls/WR3+docijIxGv4hGEN0XAR3J3Jcjx3+Bkd+UTy+/+eK0SGP9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hWC8rOtIP/9+8d8Qcx1LFpjTyx0lTf/7qadWPUEItI=;
 b=KfHfiigOfs57oQHgmoRAQZ5LdPvZQAeXb+TJvK12En9mUedg6aj95MN7ChGh91XPatpYOeo0EfZXteIF/SiWms7wEfRXq2acMti5hNE1nhFdW3JJq5fDq8s4gS+JJy4q5S6yOrBe+mW/md/pUGVgN5FHJHswO7m/cFnIqelQUKe3LWYu3cqjCnum9g+rNeJQzwR1af90JesgVAYvY8CDpNI3GOlaD5L5wUJ1hiRjgbWEpCHayMag40rWfl6dFRFVQKXR5sZwa1QBDued/OUp1hehXeLcVAAXtKYVP6fa0bh/GWm6S4c/nfUbqhdEfjeFh0K5/rkfx+1mw15cNv+H8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hWC8rOtIP/9+8d8Qcx1LFpjTyx0lTf/7qadWPUEItI=;
 b=GaOCFgB4vIX1ogdyArI77N2N0YVxoYAw+87UuokyCHJn8V9SuEIJHNvmhIS4U3Em9u2MUOhi1SESK8Yz8mF+1ZTDbZl/PflgefLES1SvjHiH6VUM0Q6yz4PEd7X8y+yESgVLZYSphfOjNo4Mc3OQLV2r6OHpcUL1y30XvZH0IME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB8431.jpnprd01.prod.outlook.com (2603:1096:400:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 18:28:16 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:28:16 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 05/16] ASoC: rsnd: Add RZ/G3E SoC probing and register map
Date: Tue, 12 May 2026 18:26:20 +0000
Message-Id: <20260512182631.3842065-6-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::17) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYWPR01MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: c082e579-61c5-4e7d-1088-08deb0543bab
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|18002099003|22082099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	7MLbJGuT8YQ21SVC2Tb6TyCNRTgtGDYNBXcJ3rgAise1JAwZlShL4DSoMK5fE44aeorC39ggyBiS+/+VzIpRdyUHRK2OJ1iXbwDKhgle/TK63yYLY7nVmCTGoDozdc63qy5BWB3ocP72Ha9sStqffEgSg2zk+cKtcJ0FWSsr85omH/1ZECfG+oVrzt2gfkAU3hy4Z9Mq76TBUoSjEB/pZo/l+CB7cO9C6RbY5kE4gkH8kjE+r1Ki4R5ejytFezuD+72mLDeQgm4ZUWVJRZkFHH69FOQbL5vyG8VDD9KjMeSDvE9qKVEDxLb9TFjGqZFMUK3R3tvbR2CDVR+zAi1V9hVRNne9mr2L40mVHeTOrSqOqCETPcPCqgOPR7/RLjKVcNtJexK4NPshGdUiR4GxP8k14c+DZvdQak4ajBz/2hZ1FCB/a5sdUG8AZNp1aPtRHb2MMzeBHiZCK+vwvE/KB6Uopu5wjEfcrWQ4fBHYKrrQL5CASBZt8EikfkKNhI3rddQl3agcQKAZZcWvly8AcBXfqXoKGcg+vm6Gw07WUAhAv1iww0MaNBtNT84afSD26Hkk6m62Pm3g7r1fLbjg7Ivu5bBALEpg1biunUeBk1pg+6tXmpq6rZxHls+1m82pgv+IHVlHfZ+ZOPnYE5SQK70umhCWQAMQjEWEKj8BOjqUP6a+rn9N3Yr6gljxa0EQy6ViiszAL92118dH0dX83QkXWksf5szYydCsame/a7n0yRNpLxD9L2gE83Dnn8IN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FFVD4oAwXwthyv8uXk0wQNtqn356pqnUO69tyR/vc2LEQIp/mHlb1N6nk7YO?=
 =?us-ascii?Q?/zOi0qGNdvRUduxuOtWlJ7cjm1CwG0cEWO/OODaOOQum1EyjdGsd7WMURQj9?=
 =?us-ascii?Q?ZKxRSCBqvZXl67RQBT3tiI01vN79oPmK5gFLgydtjyQgjrx1ejNAR/c/hiD5?=
 =?us-ascii?Q?jI41Nz+AnF/bZAv84FSr7iEvenNGP28g9t6Cdu7uCRLgbgcikCN0ndxrgghc?=
 =?us-ascii?Q?AS17nQveGXod7POQvy9zGKZKFq5ri6l3H9bO9cx+2As6nu/c7/O9D+a4pIYz?=
 =?us-ascii?Q?VhynN4oxLEIUwa1Jt2G3oDArqiXyHuO9819r74dcdqLLq/qP7IM1S1W+KKk3?=
 =?us-ascii?Q?b+G/vkuaKDAD5CyfQtydB7djQdAKqskYiZQghV6bde1lhiV93ueUYMiCzQTH?=
 =?us-ascii?Q?1YOOMWnsH3X6708uMHdJTwXkJdM27eZFGBGZKM8eVpKSJR/3uSRa+R5aB3vM?=
 =?us-ascii?Q?PjadREARvlPmvjkqQc4vYSOFDrnMdoAODlirvTvXcV5Dcl5gpi8E6pg0J5yx?=
 =?us-ascii?Q?xrbjd7OJM21qPNmIuMR/s+ptlSTIXp++6CcHv2c3zi9fnnkUWevgJYuBzVkt?=
 =?us-ascii?Q?pOGpsv8f3sOgwVzd/DAHBDAHAAo3N36YZdvPTGiENRTECbdXXBYNNpzTPT0Q?=
 =?us-ascii?Q?QG7sBiLQGM/pAhgf22h4lqiBRYEUltSf3x1sqauaJE/dYrC1BnYABBDUxijk?=
 =?us-ascii?Q?/qasprM6FOcX7Prr1SKWtarEth8C3m6Q4+bQXVk8aqGf3GOCxpNOJQ9Sbtr4?=
 =?us-ascii?Q?sbho7I3ca+N0HxKkOhX99sLSbCt3uYrN0X/VX0oaMFlZ+ZThgmWGSQFeikJ3?=
 =?us-ascii?Q?gTXQBmNlsfv4zdIU1kjSyhX6FwB81wAL/C6o0PyzPPqeAVkDs/Cx9PAm0+gr?=
 =?us-ascii?Q?JqVRIADaQwR5P+YTH+AjtbOSj3YOuc6GH83bRHLYXzrFNWcToXqdADWKW9TF?=
 =?us-ascii?Q?UQiIRq1TsKCsBNTqfECtLf8QAvOeKnAFvTgkMR5pYF7Wnb5x4+mGL5+GAwld?=
 =?us-ascii?Q?jklVGqXF8W8Q8HdVWk7A29HUw9mtuIbT+j2eFR9BsqXNqefeEHkR9JrH/wVg?=
 =?us-ascii?Q?qlIZIqWKB9RWsWQQwvS47Gfup3tWbeWgeQx2C845fLZXWf+dU0SV4zPyMRj1?=
 =?us-ascii?Q?korS2hhg5YuSVi40A0CwFwsmnfygEEC7+NnJyWfNBgmH47TTUNqScr1gaCyi?=
 =?us-ascii?Q?tnrMJdXKqPFwRvMsezenmLaiiehygblHlGpjcTZUNid98LAr1yCsJ4qkO7I/?=
 =?us-ascii?Q?d89GGdngRX4hvI90QVNEQpsihNP8eKmZ4sg49ym/5UWgX02NJkcF6+ocr/Ck?=
 =?us-ascii?Q?1PZPGohAJo1z9TFz55m9V4m2coqx2kIdNMSe1R4WXu3SUgWPttS9sN/P5YNo?=
 =?us-ascii?Q?CPQAOxyvVndHYEFgIhaKPIJ875TgvThYZSSPuo23oPWD5m0lLDyWi45/VQAt?=
 =?us-ascii?Q?jWS4PkzJ8NZoVTMpNsQAU8+a0l3RYlCL1e38GABI+O2Q7PB5WMdyJyMBZOaf?=
 =?us-ascii?Q?niCCf+AeyxNKboexYAmr8OvvSWHyvtmjuDs/ZXr5APJOHqqwI5w7gQ9F9PCp?=
 =?us-ascii?Q?iVCHbbUUZUbwWkovI5l/oqjCtBO9tIPOq+4XQ9fSocFEGOVBVYobfAcfub64?=
 =?us-ascii?Q?C5dxpU4DdxmHOO64SNZHbe0ylsKES/clk5fut30l6ZaSJtLADxjyIzTipGFY?=
 =?us-ascii?Q?Yk2kHBdmEMIQaQn6LRFw7h6RQ4r7xTB0al+eh1xKXtQ6Tjy3UkN0vrYx0iGx?=
 =?us-ascii?Q?ch7oMKwEAnR5pcCOe4kpR/dUMNLOwAY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c082e579-61c5-4e7d-1088-08deb0543bab
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:28:16.1020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fiFDl+nsZmIk3GQUfm/+dUjnYf5dX4baGj6BZsbTYldvlz6Xs2VtRu5DvCYqIuyxY7xCbOPE1LoyIhlOmGw+KMXuvphKE97YEgbiCQwttuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8431
X-Rspamd-Queue-Id: 514BC527AD2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32508-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: no action

RZ/G3E audio subsystem has a different register layout compared to
R-Car Gen2/Gen3/Gen4, as described below:

- Different base address organization (SCU, ADG, SSIU, SSI as
  separate regions accessed by name)
- Additional registers: AUDIO_CLK_SEL3, SSI_MODE3, SSI_CONTROL2
- Different register offsets within each region

Add RZ/G3E SoC's audio subsystem register layouts and probe support.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6: No changes

v5:
 - Simplify flags layout comment per Kuninori's feedback.
 - RSND_SOC_MASK fix moved to dedicated patch 02/14.

v4:
 - Fix RSND_SOC_MASK to (0xF << 4) to avoid overlap with
   RSND_RZ_MASK.
 - Add comment documenting flag nibble layout.

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/core.c |   1 +
 sound/soc/renesas/rcar/gen.c  | 180 ++++++++++++++++++++++++++++++++++
 sound/soc/renesas/rcar/rsnd.h |  26 ++++-
 3 files changed, 204 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 5f3841565d49..fa6a12571198 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -107,6 +107,7 @@ static const struct of_device_id rsnd_of_match[] = {
 	{ .compatible = "renesas,rcar_sound-gen4", .data = (void *)RSND_GEN4 },
 	/* Special Handling */
 	{ .compatible = "renesas,rcar_sound-r8a77990", .data = (void *)(RSND_GEN3 | RSND_SOC_E) },
+	{ .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rsnd_of_match);
diff --git a/sound/soc/renesas/rcar/gen.c b/sound/soc/renesas/rcar/gen.c
index d1f20cde66be..05d5f656fb01 100644
--- a/sound/soc/renesas/rcar/gen.c
+++ b/sound/soc/renesas/rcar/gen.c
@@ -464,6 +464,184 @@ static int rsnd_gen1_probe(struct rsnd_priv *priv)
 	return ret_adg | ret_ssi;
 }
 
+/*
+ *		RZ/G3E Generation
+ */
+static int rsnd_rzg3e_probe(struct rsnd_priv *priv)
+{
+	static const struct rsnd_regmap_field_conf conf_ssiu[] = {
+		RSND_GEN_S_REG(SSI_MODE1,		0x804),
+		RSND_GEN_S_REG(SSI_MODE2,		0x808),
+		RSND_GEN_S_REG(SSI_MODE3,		0x80c),
+		RSND_GEN_S_REG(SSI_CONTROL,		0x810),
+		RSND_GEN_S_REG(SSI_CONTROL2,		0x814),
+		RSND_GEN_S_REG(SSI_SYS_STATUS0,		0x840),
+		RSND_GEN_S_REG(SSI_SYS_STATUS1,		0x844),
+		RSND_GEN_S_REG(SSI_SYS_STATUS2,		0x848),
+		RSND_GEN_S_REG(SSI_SYS_STATUS3,		0x84c),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE0,	0x850),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE1,	0x854),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE2,	0x858),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE3,	0x85c),
+		RSND_GEN_M_REG(SSI_BUSIF0_MODE,		0x0,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF0_ADINR,	0x4,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF0_DALIGN,	0x8,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF1_MODE,		0x20,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF1_ADINR,	0x24,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF1_DALIGN,	0x28,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF2_MODE,		0x40,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF2_ADINR,	0x44,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF2_DALIGN,	0x48,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF3_MODE,		0x60,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF3_ADINR,	0x64,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF3_DALIGN,	0x68,	0x80),
+		RSND_GEN_M_REG(SSI_MODE,		0xc,	0x80),
+		RSND_GEN_M_REG(SSI_CTRL,		0x10,	0x80),
+		RSND_GEN_M_REG(SSI_INT_ENABLE,		0x18,	0x80),
+		RSND_GEN_S_REG(SSI9_BUSIF0_MODE,	0x480),
+		RSND_GEN_S_REG(SSI9_BUSIF0_ADINR,	0x484),
+		RSND_GEN_S_REG(SSI9_BUSIF0_DALIGN,	0x488),
+		RSND_GEN_S_REG(SSI9_BUSIF1_MODE,	0x4a0),
+		RSND_GEN_S_REG(SSI9_BUSIF1_ADINR,	0x4a4),
+		RSND_GEN_S_REG(SSI9_BUSIF1_DALIGN,	0x4a8),
+		RSND_GEN_S_REG(SSI9_BUSIF2_MODE,	0x4c0),
+		RSND_GEN_S_REG(SSI9_BUSIF2_ADINR,	0x4c4),
+		RSND_GEN_S_REG(SSI9_BUSIF2_DALIGN,	0x4c8),
+		RSND_GEN_S_REG(SSI9_BUSIF3_MODE,	0x4e0),
+		RSND_GEN_S_REG(SSI9_BUSIF3_ADINR,	0x4e4),
+		RSND_GEN_S_REG(SSI9_BUSIF3_DALIGN,	0x4e8),
+	};
+	static const struct rsnd_regmap_field_conf conf_scu[] = {
+		RSND_GEN_M_REG(SRC_I_BUSIF_MODE,	0x0,	0x20),
+		RSND_GEN_M_REG(SRC_O_BUSIF_MODE,	0x4,	0x20),
+		RSND_GEN_M_REG(SRC_BUSIF_DALIGN,	0x8,	0x20),
+		RSND_GEN_M_REG(SRC_ROUTE_MODE0,		0xc,	0x20),
+		RSND_GEN_M_REG(SRC_CTRL,		0x10,	0x20),
+		RSND_GEN_M_REG(SRC_INT_ENABLE0,		0x18,	0x20),
+		RSND_GEN_M_REG(CMD_BUSIF_MODE,		0x184,	0x20),
+		RSND_GEN_M_REG(CMD_BUSIF_DALIGN,	0x188,	0x20),
+		RSND_GEN_M_REG(CMD_ROUTE_SLCT,		0x18c,	0x20),
+		RSND_GEN_M_REG(CMD_CTRL,		0x190,	0x20),
+		RSND_GEN_S_REG(SCU_SYS_STATUS0,		0x1c8),
+		RSND_GEN_S_REG(SCU_SYS_INT_EN0,		0x1cc),
+		RSND_GEN_S_REG(SCU_SYS_STATUS1,		0x1d0),
+		RSND_GEN_S_REG(SCU_SYS_INT_EN1,		0x1d4),
+		RSND_GEN_M_REG(SRC_SWRSR,		0x200,	0x40),
+		RSND_GEN_M_REG(SRC_SRCIR,		0x204,	0x40),
+		RSND_GEN_M_REG(SRC_ADINR,		0x214,	0x40),
+		RSND_GEN_M_REG(SRC_IFSCR,		0x21c,	0x40),
+		RSND_GEN_M_REG(SRC_IFSVR,		0x220,	0x40),
+		RSND_GEN_M_REG(SRC_SRCCR,		0x224,	0x40),
+		RSND_GEN_M_REG(SRC_BSDSR,		0x22c,	0x40),
+		RSND_GEN_M_REG(SRC_BSISR,		0x238,	0x40),
+		RSND_GEN_M_REG(CTU_SWRSR,		0x500,	0x100),
+		RSND_GEN_M_REG(CTU_CTUIR,		0x504,	0x100),
+		RSND_GEN_M_REG(CTU_ADINR,		0x508,	0x100),
+		RSND_GEN_M_REG(CTU_CPMDR,		0x510,	0x100),
+		RSND_GEN_M_REG(CTU_SCMDR,		0x514,	0x100),
+		RSND_GEN_M_REG(CTU_SV00R,		0x518,	0x100),
+		RSND_GEN_M_REG(CTU_SV01R,		0x51c,	0x100),
+		RSND_GEN_M_REG(CTU_SV02R,		0x520,	0x100),
+		RSND_GEN_M_REG(CTU_SV03R,		0x524,	0x100),
+		RSND_GEN_M_REG(CTU_SV04R,		0x528,	0x100),
+		RSND_GEN_M_REG(CTU_SV05R,		0x52c,	0x100),
+		RSND_GEN_M_REG(CTU_SV06R,		0x530,	0x100),
+		RSND_GEN_M_REG(CTU_SV07R,		0x534,	0x100),
+		RSND_GEN_M_REG(CTU_SV10R,		0x538,	0x100),
+		RSND_GEN_M_REG(CTU_SV11R,		0x53c,	0x100),
+		RSND_GEN_M_REG(CTU_SV12R,		0x540,	0x100),
+		RSND_GEN_M_REG(CTU_SV13R,		0x544,	0x100),
+		RSND_GEN_M_REG(CTU_SV14R,		0x548,	0x100),
+		RSND_GEN_M_REG(CTU_SV15R,		0x54c,	0x100),
+		RSND_GEN_M_REG(CTU_SV16R,		0x550,	0x100),
+		RSND_GEN_M_REG(CTU_SV17R,		0x554,	0x100),
+		RSND_GEN_M_REG(CTU_SV20R,		0x558,	0x100),
+		RSND_GEN_M_REG(CTU_SV21R,		0x55c,	0x100),
+		RSND_GEN_M_REG(CTU_SV22R,		0x560,	0x100),
+		RSND_GEN_M_REG(CTU_SV23R,		0x564,	0x100),
+		RSND_GEN_M_REG(CTU_SV24R,		0x568,	0x100),
+		RSND_GEN_M_REG(CTU_SV25R,		0x56c,	0x100),
+		RSND_GEN_M_REG(CTU_SV26R,		0x570,	0x100),
+		RSND_GEN_M_REG(CTU_SV27R,		0x574,	0x100),
+		RSND_GEN_M_REG(CTU_SV30R,		0x578,	0x100),
+		RSND_GEN_M_REG(CTU_SV31R,		0x57c,	0x100),
+		RSND_GEN_M_REG(CTU_SV32R,		0x580,	0x100),
+		RSND_GEN_M_REG(CTU_SV33R,		0x584,	0x100),
+		RSND_GEN_M_REG(CTU_SV34R,		0x588,	0x100),
+		RSND_GEN_M_REG(CTU_SV35R,		0x58c,	0x100),
+		RSND_GEN_M_REG(CTU_SV36R,		0x590,	0x100),
+		RSND_GEN_M_REG(CTU_SV37R,		0x594,	0x100),
+		RSND_GEN_M_REG(MIX_SWRSR,		0xd00,	0x40),
+		RSND_GEN_M_REG(MIX_MIXIR,		0xd04,	0x40),
+		RSND_GEN_M_REG(MIX_ADINR,		0xd08,	0x40),
+		RSND_GEN_M_REG(MIX_MIXMR,		0xd10,	0x40),
+		RSND_GEN_M_REG(MIX_MVPDR,		0xd14,	0x40),
+		RSND_GEN_M_REG(MIX_MDBAR,		0xd18,	0x40),
+		RSND_GEN_M_REG(MIX_MDBBR,		0xd1c,	0x40),
+		RSND_GEN_M_REG(MIX_MDBCR,		0xd20,	0x40),
+		RSND_GEN_M_REG(MIX_MDBDR,		0xd24,	0x40),
+		RSND_GEN_M_REG(MIX_MDBER,		0xd28,	0x40),
+		RSND_GEN_M_REG(DVC_SWRSR,		0xe00,	0x100),
+		RSND_GEN_M_REG(DVC_DVUIR,		0xe04,	0x100),
+		RSND_GEN_M_REG(DVC_ADINR,		0xe08,	0x100),
+		RSND_GEN_M_REG(DVC_DVUCR,		0xe10,	0x100),
+		RSND_GEN_M_REG(DVC_ZCMCR,		0xe14,	0x100),
+		RSND_GEN_M_REG(DVC_VRCTR,		0xe18,	0x100),
+		RSND_GEN_M_REG(DVC_VRPDR,		0xe1c,	0x100),
+		RSND_GEN_M_REG(DVC_VRDBR,		0xe20,	0x100),
+		RSND_GEN_M_REG(DVC_VOL0R,		0xe28,	0x100),
+		RSND_GEN_M_REG(DVC_VOL1R,		0xe2c,	0x100),
+		RSND_GEN_M_REG(DVC_VOL2R,		0xe30,	0x100),
+		RSND_GEN_M_REG(DVC_VOL3R,		0xe34,	0x100),
+		RSND_GEN_M_REG(DVC_VOL4R,		0xe38,	0x100),
+		RSND_GEN_M_REG(DVC_VOL5R,		0xe3c,	0x100),
+		RSND_GEN_M_REG(DVC_VOL6R,		0xe40,	0x100),
+		RSND_GEN_M_REG(DVC_VOL7R,		0xe44,	0x100),
+		RSND_GEN_M_REG(DVC_DVUER,		0xe48,	0x100),
+	};
+	static const struct rsnd_regmap_field_conf conf_adg[] = {
+		RSND_GEN_S_REG(BRRA,			0x00),
+		RSND_GEN_S_REG(BRRB,			0x04),
+		RSND_GEN_S_REG(BRGCKR,			0x08),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL0,		0x0c),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL1,		0x10),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL2,		0x14),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL3,		0x18),
+		RSND_GEN_S_REG(DIV_EN,			0x30),
+		RSND_GEN_S_REG(SRCIN_TIMSEL0,		0x34),
+		RSND_GEN_S_REG(SRCIN_TIMSEL1,		0x38),
+		RSND_GEN_S_REG(SRCIN_TIMSEL2,		0x3c),
+		RSND_GEN_S_REG(SRCIN_TIMSEL3,		0x40),
+		RSND_GEN_S_REG(SRCIN_TIMSEL4,		0x44),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL0,		0x48),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL1,		0x4c),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL2,		0x50),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL3,		0x54),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL4,		0x58),
+		RSND_GEN_S_REG(CMDOUT_TIMSEL,		0x5c),
+	};
+	static const struct rsnd_regmap_field_conf conf_ssi[] = {
+		RSND_GEN_M_REG(SSICR,			0x00,	0x40),
+		RSND_GEN_M_REG(SSISR,			0x04,	0x40),
+		RSND_GEN_M_REG(SSIWSR,			0x20,	0x40),
+	};
+	int ret;
+
+	ret = rsnd_gen_regmap_init(priv, 10, RSND_BASE_SCU, "scu", conf_scu);
+	if (ret < 0)
+		return ret;
+
+	ret = rsnd_gen_regmap_init(priv, 1, RSND_BASE_ADG, "adg", conf_adg);
+	if (ret < 0)
+		return ret;
+
+	ret = rsnd_gen_regmap_init(priv, 10, RSND_BASE_SSIU, "ssiu", conf_ssiu);
+	if (ret < 0)
+		return ret;
+
+	return rsnd_gen_regmap_init(priv, 10, RSND_BASE_SSI, "ssi", conf_ssi);
+}
+
 /*
  *		Gen
  */
@@ -487,6 +665,8 @@ int rsnd_gen_probe(struct rsnd_priv *priv)
 		ret = rsnd_gen2_probe(priv);
 	else if (rsnd_is_gen4(priv))
 		ret = rsnd_gen4_probe(priv);
+	else if (rsnd_is_rzg3e(priv))
+		ret = rsnd_rzg3e_probe(priv);
 
 	if (ret < 0)
 		dev_err(dev, "unknown generation R-Car sound device\n");
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index f3f1ad1180f8..e917aa12fa80 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -143,13 +143,16 @@ enum rsnd_reg {
 	AUDIO_CLK_SEL0,
 	AUDIO_CLK_SEL1,
 	AUDIO_CLK_SEL2,
+	AUDIO_CLK_SEL3,
 
 	/* SSIU */
 	SSI_MODE,
 	SSI_MODE0,
 	SSI_MODE1,
 	SSI_MODE2,
+	SSI_MODE3,
 	SSI_CONTROL,
+	SSI_CONTROL2,
 	SSI_CTRL,
 	SSI_BUSIF0_MODE,
 	SSI_BUSIF1_MODE,
@@ -641,14 +644,28 @@ struct rsnd_priv {
 	struct platform_device *pdev;
 	spinlock_t lock;
 	unsigned long flags;
+
+	/*
+	 * Flags layout: 0xDCBA
+	 *
+	 * A: R-Car generation (Gen1/Gen2/Gen3/Gen4)
+	 * B: R-Car SoC variant (e.g. SOC_E for E1/E2/E3)
+	 * C: RZ series generation
+	 * D: RZ series SoC identifier (e.g. RZG3E)
+	 *
+	 * Bits 16+ are used for capability flags.
+	 */
 #define RSND_GEN_MASK	(0xF << 0)
 #define RSND_GEN1	(1 << 0)
 #define RSND_GEN2	(2 << 0)
 #define RSND_GEN3	(3 << 0)
 #define RSND_GEN4	(4 << 0)
-#define RSND_SOC_MASK	(0xF << 4)
-#define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
-
+#define RSND_SOC_MASK	(0xF << 4)  /* nibble B */
+#define RSND_SOC_E	(1 << 4)    /* E1/E2/E3 */
+#define RSND_RZ_MASK	(0xF << 8)  /* nibble C */
+#define RSND_RZ3	(3 << 8)
+#define RSND_RZ_ID_MASK	(0xF << 12) /* nibble D */
+#define RSND_RZG3E	(1 << 12)
 	/*
 	 * below value will be filled on rsnd_gen_probe()
 	 */
@@ -727,6 +744,9 @@ struct rsnd_priv {
 #define rsnd_is_gen3_e3(priv)	(((priv)->flags & \
 					(RSND_GEN_MASK | RSND_SOC_MASK)) == \
 					(RSND_GEN3 | RSND_SOC_E))
+#define rsnd_is_rzg3e(priv) (((priv)->flags & \
+				(RSND_RZ_MASK | RSND_RZ_ID_MASK)) == \
+					(RSND_RZ3 | RSND_RZG3E))
 
 #define rsnd_flags_has(p, f) ((p)->flags & (f))
 #define rsnd_flags_set(p, f) ((p)->flags |= (f))
-- 
2.25.1


