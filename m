Return-Path: <linux-renesas-soc+bounces-32504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKdMENJ2A2pY6AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:52:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D250F528314
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6657730C54E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C47D3859CF;
	Tue, 12 May 2026 18:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PvaFFR0k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5803EDE55;
	Tue, 12 May 2026 18:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610478; cv=fail; b=teB5XFEehCkfB/kJiQkekQvIHd7MStBue/lAxtvIeVDly7e5gMNhEWRZeVy8RZ2W4RjdMNFy2gm24lxaqOA84TPJ8jKcbA3I8jSqzPG8PfCt1P86Xj5hE+2NerpA2tvs/TeGoJ2ZJTs/QvaFzeg+KpLji5ZsM41Q3bmZZTdCdnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610478; c=relaxed/simple;
	bh=mH71PKTz+5/rGKZVbbzNZEclZWE4pHGfbkWYW6VJaVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xdn7hMvsbUpHNz5E3me6tu15LV/UKGdgtF7c+UCINDRdWeKIOaxB0U44/c81nwu1aSjm6+Znsy1vCfJ4+SswtTZSkp+WisFJmJWBpoB/7H6sC6c3XgxYmUAdmtZIRzBBzLZcReu2O94kU2y+8Nhfe4U1l5FlY5sp+TqPyxGHk8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PvaFFR0k; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2Z4tDvNuXUPnO9GmzKZQL3UuEBBgotoK/pKERYmvJM9SDnhxUNiePxQ5v78qC8xHf8nrNtupXFvfWSaBdu/WSniFPJDtez87iV6PaStIz63TmULheoIamt+Cup+Fmt/UjPgpvbQh6iwD7cA2bD4mrikX4ozh9EvJBRKuUTG50pVt9oDOYYPzDeUVA52x5PLt3wIY4ZIosqaZqoUrZKT7m+eq3jXfvN7bfT0Bo2gIAgiXif2piILf5UHhWeSDdlxXRiOdLULesl/7RSzlSHjRhRx8DDXp/5bif5/N0HBYhgVmLayX5MELslkQhtMspfQLQ3Xp0vA9Xjim3kcNwcWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCoqcD2ygd8nu5dYCsh0C8juol4ix361+Jj8BLFb2gM=;
 b=EHFOmHOC8nQB6R+6UCJxJa08Idh5IqavKiujPwueCwU3hjt55vMOJoIeJGLLZ24t9IJiM39wSvxXL9O2J96aQd36v/9LC+is63rt6y9x/aKadKhDd4YIQbhEO15fMuBU0dHqvToDM2iYFzSf0CaSTpkGHzcxTapj8bRT9OhFk6Tz6op/yduNnUONIxO3inOmCMiX6e+HWJwTPVvCAsE9WVJeta0jHlwCZzNR36471NM9RhTYvCeZjgBgKxAlaVFdOV1UEiwyp9vOMw3jMTj2cy267vKDe69CKnMk9Eke6eSi3S0LcSR6yZ8kWMnwYS+CvXeFY3YCC+6CvXO9rOQaVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCoqcD2ygd8nu5dYCsh0C8juol4ix361+Jj8BLFb2gM=;
 b=PvaFFR0kCYUVhm1fy5ZVKT2S8Jt3utwk3YnrLkuiOH5sQ/iUL6L2EFUQbc72GSy6CUrwbBZYL8LrpafnWurBlu8UpO63F7j12EY4tqlOfmP0h+T90xPMUPPFMb+Tjbnm4RYZAL8tx91n+i1rbilGO7hqc/hBcFySe+fOm1ciYbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB8431.jpnprd01.prod.outlook.com (2603:1096:400:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 18:27:50 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:27:50 +0000
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
Subject: [PATCH v6 01/16] ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound
Date: Tue, 12 May 2026 18:26:16 +0000
Message-Id: <20260512182631.3842065-2-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 891b22f2-1365-44ec-2b42-08deb0542c39
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|18002099003|22082099003|38350700014|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	Ki3pdPcrKVF31hBUHhApNgHcZxJxPFJdWBp7f+t70DCVtzUvBL431FCenGZdIjNsVELpeSq7Nix/ZLb20Vd8ygm8M9nxKyFSGTwkX5QHWVslfUkhJISkwN6NBXd9X+qFfL0SM66wNpAPKFBmGqOtQ5C1C5cAD4cBvCzBxdnf3nuoFRkvY/qFTcqqIYXxwYh/EtaknuTcKsGPF6jh7fTEglZRyMUXWjM90U53npwaknXiqtcxZM7eHyi9tw81ipTse6O0JLekGM2Sq9hM/AVM3HgD9kQ91Wc20D2rOEieuQ91uDgsnGLY6DjVugp2jU80vpmclKKxfDvodEEuqe9jREXCbqzqbcbhKGsYCU8aJLxe++uC6utXFIzkiuidERtVPZqHGv6VNdN+Wj57CTzJoRFgfQR5XRGx1y+oIBZElrBV6KRkd/JnJB/iNA18W07ILdwRhFjeCBbTYdSBV1QzwXXUeYWCCBRxnnJkfAgahOkaf5Xz0QAr2CDYeSsQsgEkAgFPdIX1LpBVDYcFqeHn3nlCio4yQmh59Z8wuaM1p8t1MI8G/7MdGNPn0ABSsuTQ5iwJwKBtQ/VgS2yRJsgRInn2MDy48VBi3HvVkJWs9JeaCSvWOsFWMNCReW7jPQhuLI0++qL/TzG9H7I2g+MxTbVyePe100otmHGlhsssMnG4jwGNNKjyJy0Czr5EIuXyVnAVLtOPLLJk2wY3FvKNWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?60nF/YmktCrVo+0sowJcw9zbGvaoIASpHLuerQk+oJOL4Cu8GzmHuQJW88h9?=
 =?us-ascii?Q?qPLH25hA9rOJ0D40zRy+hyNCjuBZ0FDF8ed6RhgMqigehYdntXB5mveMGGKY?=
 =?us-ascii?Q?S7usg9485YZI2ukHOZBV2W+Oi1yf1Vc+f4Dr3RdPHebuUHd4Yz3odb4PIhVd?=
 =?us-ascii?Q?hrmFFeyLrYKcCQpsVTF5Q2QAk+Sg2baFlxW9zsstVft7pI9GZhFraB2o5m0f?=
 =?us-ascii?Q?oXA7ne90tA2tB2AaF9YFJ1ztiiczalbzWXgfhh3XMAJCTqv/BmPiQkWTwCw8?=
 =?us-ascii?Q?GYvqjRmHLDK/q+aYilNjdsFKH4BIJDYzxE7bmuHLnnWsjQjE8lytYo2dCyL+?=
 =?us-ascii?Q?fcgwj/CpOhtO2Nlfej97P4FjDPoHwB91lJORcsvLlhCRrqu4kCFn82FN2Zch?=
 =?us-ascii?Q?E8DBui4nL1ZwfCwbWoeUtwGh13XAKHHfskFqXWivf4BQcuulM4e2AQPN/tDo?=
 =?us-ascii?Q?hWOrhbbfULDTgbsNlru9Vt9VWptuVLLovfstTfFoq3D9ByhbUf2IGcDo0YQ0?=
 =?us-ascii?Q?MzzCfj1K4LZB69S3W8wS+a2R2GsmRg1ZuO5N7yarzdJ7auTdqg2JZw+gx9nz?=
 =?us-ascii?Q?0k/TYYRDmSsnZey6kA+zWQ7mXpv9oxuB5IE5nNFbP17OYltWQpEn5L/SVP1s?=
 =?us-ascii?Q?FbzGedrMI55uotYAD1dLkLIPI8iYX14ON7G9QqVTgjtaRW8y9wCkFifLvXDF?=
 =?us-ascii?Q?m/WbOCbnlTXmbeGbYaTVEYN91EqHkP7sw8krk8yP0l9A8ZjIVwZ+YMNDxtQN?=
 =?us-ascii?Q?SAz3xpRXuIZt9q+YSfpobxiAgafwpq2Q54YNdZq9j71wlbT6LnSkIeICdntx?=
 =?us-ascii?Q?1URSsiCmDSNAgLHwYb5Rdy4JCeS8flODzQQJ7QDdWu2sCajPyXSCY9y6Y0Nk?=
 =?us-ascii?Q?+NxWyIwrHceyIK+7tnk7UqL7aUKKUJdcyIfTGFx5rh1iN9G/LJ/A8041v9Nd?=
 =?us-ascii?Q?onOUuH23VOWf9S4WeS5VJle2peiltbTrsO8mAHw+XFJOHKM8Vxwwm9ivmMIv?=
 =?us-ascii?Q?un5drl1KIWNhtgFp0DuvBiVbpx3BpRsU/HR3yJo8mGOigycm6W0gpz5vRlf+?=
 =?us-ascii?Q?b62P8ipTvEAJHQF7F+XRx5bTl2vXGZACa1bFnsh9GSFaLpCyiCMgFa679JfC?=
 =?us-ascii?Q?d4ilbKw49iGYR2td2uB6IPJoMi/uz4e8ChZJd9/VI0Uj48vXjPbPUqZ2yER9?=
 =?us-ascii?Q?tm4oZh/IJs3WRspzPPN4YF6EMhoOoRX3NaHzxlNA7alDaPo+b9zoYYD4FfGP?=
 =?us-ascii?Q?kW+CgRwZO0XEhtGw1SUTRvDYiMVTk/UqV4Z1nUfNr7VA/+WP8X2XAKzdxfhI?=
 =?us-ascii?Q?e9rKS+5kblqlKl1sj+brOmFKacclz5yy/n3OStasby1c6SOj5yrL43Jjgin9?=
 =?us-ascii?Q?B5Je2qD4Ysq9pOFElZkkCqapkQVu8TZq9zlKvEQ+v6PtJgvsChll+Z1wLMBO?=
 =?us-ascii?Q?6SMJTru9RRLArkRLwzcD8MLVuOGEG9XR6YUW3NEIUQpr8aA/R0+DimfWnMSy?=
 =?us-ascii?Q?dWVR2dVhSQxd2bJNZ76VeqFn8C47W1E+ICCqmKB+YTOxs+n6Xrxf7IuFmk1m?=
 =?us-ascii?Q?lz8G3taB7aRazgq1RWj94F4rXJVjS/EvEpdIy8fZqXDtwrw3gjgsAraqjubY?=
 =?us-ascii?Q?0GhtuAqlGtDTCehMNH63YGOLdWMPDpwXJKeUomkkk2w8J8RY9tOSVMMZPH01?=
 =?us-ascii?Q?1LQp3CtgQu0pbrRzIrJaDDLzBVQBoYKiFSjIbfQT7XoszSAkv7ywReDN62P5?=
 =?us-ascii?Q?tsTuH59S8CH3iWON+8katK28lJubY98=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891b22f2-1365-44ec-2b42-08deb0542c39
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:27:50.0452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSL8eJrZDdwCy/HRdi/4tu16pfiyFrqcnP2sI05X+cClNYJJHgxNGMuIlnkr1p5XEvaOSWqFh0202xXDOs48BGcRJyTSx2ezyQMznpNkuPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8431
X-Rspamd-Queue-Id: D250F528314
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32504-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,n:email,bp.renesas.com:mid,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,13c00000:email]
X-Rspamd-Action: no action

Add a standalone device tree binding for the Renesas RZ/G3E (R9A09G047)
sound controller.

The RZ/G3E sound IP is based on R-Car Sound but differs in several ways:
- Uses unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu) instead
  of R-Car's rcar_sound,xxx prefixed names.
- Supports up to 5 DMA controllers per direction, allowing multiple DMA
  entries with repeated channel names in SSIU, SRC and DVC sub-nodes.
- Has 47 clocks including per-SSI ADG clocks (adg-ssi-[0-9]), SCU clocks
  (scu, scu_x2, scu_supply), SSIF supply clock, AUDMAC peri-peri clock,
  and ADG clock.
- Has 14 reset lines including SCU, ADG and AUDMAC peri-peri resets.
- SSI operates exclusively in BUSIF mode.

These differences make the RZ/G3E binding incompatible with the existing
renesas,rsnd.yaml, so it is added as a separate standalone binding with
its own $ref to dai-common.yaml.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6:
 - Rename all indexed clock-names and reset-names from the dotted
   form (ssi.0, src.0, adg.ssi.0, clk_a, clk_b, clk_c, clk_i) to
   the hyphenated form (ssi-0, src-0, adg-ssi-0, audio-clka,
   audio-clkb, audio-clkc, audio-clki) so the new binding follows
   the standard DT naming convention.
 - Tighten #sound-dai-cells to const: 1.
 - Drop unused properties: clock-frequency, clkout-lr-asynchronous.
 - Simplify the ports/endpoint schema (single ports object with
   port@N children referencing audio-graph-port.yaml), drop the
   separate top-level dai patternProperties block.
 - Move additionalProperties: false to the top of each sub-object
   (dvc, mix, ctu, src, ssiu, ssi).
 - Reorder example clocks/resets to match the new ordinal-ascending
   name order.

v5:
 - Drop the two-patch rsnd.yaml split approach from v4. Replace
   with a single self-contained standalone binding that does not
   touch renesas,rsnd.yaml at all.
 - Remove select: false, redundant blanket properties
   (compatible: true, reg: true, etc.) and pointless
   patternProperties per Krzysztof's review.
 - Add missing #clock-cells and #sound-dai-cells constraints.
 - Add hardware description text instead of "Binding for ..."
   phrasing.
 - Move G3E-specific DMA comment into the binding itself rather
   than relying on a shared schema.
 - Use unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu)
   to reflect the actual RZ/G3E DT binding.

v4: No changes
v3: No changes
v2:
 - Introduce RZ/G3E sound binding as a standalone schema.

 .../sound/renesas,r9a09g047-sound.yaml        | 743 ++++++++++++++++++
 1 file changed, 743 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
new file mode 100644
index 000000000000..0b651214bd61
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -0,0 +1,743 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3E Sound Controller
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+  - John Madieu <john.madieu.xa@bp.renesas.com>
+
+description:
+  The RZ/G3E (R9A09G047) sound controller is based on R-Car Sound IP
+  with extended DMA channel support (up to 5 DMACs per direction),
+  additional clock domains (47 clocks including per-SSI ADG clocks),
+  and additional reset lines (14 including SCU, ADG and Audio DMAC
+  peri-peri resets). SSI operates exclusively in BUSIF mode with
+  2-4 BUSIF channels per SSI.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: renesas,r9a09g047-sound
+
+  reg:
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: scu
+      - const: adg
+      - const: ssiu
+      - const: ssi
+      - const: audmapp
+
+  "#sound-dai-cells":
+    const: 1
+
+  "#clock-cells":
+    const: 0
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    maxItems: 47
+
+  clock-names:
+    items:
+      - const: ssi-all
+      - const: ssi-0
+      - const: ssi-1
+      - const: ssi-2
+      - const: ssi-3
+      - const: ssi-4
+      - const: ssi-5
+      - const: ssi-6
+      - const: ssi-7
+      - const: ssi-8
+      - const: ssi-9
+      - const: src-0
+      - const: src-1
+      - const: src-2
+      - const: src-3
+      - const: src-4
+      - const: src-5
+      - const: src-6
+      - const: src-7
+      - const: src-8
+      - const: src-9
+      - const: mix-0
+      - const: mix-1
+      - const: ctu-0
+      - const: ctu-1
+      - const: dvc-0
+      - const: dvc-1
+      - const: audio-clka
+      - const: audio-clkb
+      - const: audio-clkc
+      - const: audio-clki
+      - const: ssif_supply
+      - const: scu
+      - const: scu_x2
+      - const: scu_supply
+      - const: adg-ssi-0
+      - const: adg-ssi-1
+      - const: adg-ssi-2
+      - const: adg-ssi-3
+      - const: adg-ssi-4
+      - const: adg-ssi-5
+      - const: adg-ssi-6
+      - const: adg-ssi-7
+      - const: adg-ssi-8
+      - const: adg-ssi-9
+      - const: audmapp
+      - const: adg
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 14
+
+  reset-names:
+    items:
+      - const: ssi-all
+      - const: ssi-0
+      - const: ssi-1
+      - const: ssi-2
+      - const: ssi-3
+      - const: ssi-4
+      - const: ssi-5
+      - const: ssi-6
+      - const: ssi-7
+      - const: ssi-8
+      - const: ssi-9
+      - const: scu
+      - const: adg
+      - const: audmapp
+
+  dvc:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^dvc-[0-1]$":
+        type: object
+        additionalProperties: false
+        properties:
+          dmas:
+            maxItems: 5
+          dma-names:
+            maxItems: 5
+            allOf:
+              - items:
+                  enum:
+                    - tx
+        required:
+          - dmas
+          - dma-names
+
+  mix:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^mix-[0-1]$":
+        type: object
+        additionalProperties: false
+
+  ctu:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^ctu-[0-7]$":
+        type: object
+        additionalProperties: false
+
+  src:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^src-[0-9]$":
+        type: object
+        additionalProperties: false
+        properties:
+          interrupts:
+            maxItems: 1
+          dmas:
+            maxItems: 10
+          dma-names:
+            maxItems: 10
+            allOf:
+              - items:
+                  enum:
+                    - tx
+                    - rx
+
+  ssiu:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^ssiu-[0-9]+$":
+        type: object
+        additionalProperties: false
+        properties:
+          dmas:
+            maxItems: 10
+          dma-names:
+            maxItems: 10
+            allOf:
+              - items:
+                  enum:
+                    - tx
+                    - rx
+        required:
+          - dmas
+          - dma-names
+
+  ssi:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^ssi-[0-9]$":
+        type: object
+        additionalProperties: false
+        properties:
+          interrupts:
+            maxItems: 1
+          dmas: true
+          dma-names: true
+          shared-pin:
+            description: Shared clock pin.
+            $ref: /schemas/types.yaml#/definitions/flag
+        required:
+          - interrupts
+
+  ports:
+    $ref: audio-graph-port.yaml#/definitions/port-base
+    unevaluatedProperties: false
+    patternProperties:
+      '^port@[0-9a-f]+$':
+        $ref: audio-graph-port.yaml#/definitions/port-base
+        unevaluatedProperties: false
+        properties:
+          reg:
+            maxItems: 1
+          endpoint:
+            $ref: audio-graph-port.yaml#/definitions/endpoint-base
+            unevaluatedProperties: false
+            properties:
+              playback:
+                $ref: /schemas/types.yaml#/definitions/phandle-array
+              capture:
+                $ref: /schemas/types.yaml#/definitions/phandle-array
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    sound@13c00000 {
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      compatible = "renesas,r9a09g047-sound";
+      reg = <0x13c00000 0x10000>,
+            <0x13c20000 0x10000>,
+            <0x13c30000 0x1000>,
+            <0x13c31000 0x1f000>,
+            <0x13c50000 0x10000>;
+      reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+      clocks = <&cpg 245>,
+               <&cpg 385>, <&cpg 386>,
+               <&cpg 387>, <&cpg 388>,
+               <&cpg 389>, <&cpg 390>,
+               <&cpg 391>, <&cpg 392>,
+               <&cpg 393>, <&cpg 394>,
+               <&cpg 372>, <&cpg 373>,
+               <&cpg 374>, <&cpg 375>,
+               <&cpg 376>, <&cpg 377>,
+               <&cpg 378>, <&cpg 379>,
+               <&cpg 380>, <&cpg 381>,
+               <&cpg 370>, <&cpg 371>,
+               <&cpg 370>, <&cpg 371>,
+               <&cpg 368>, <&cpg 369>,
+               <&cpg 251>, <&cpg 252>,
+               <&cpg 253>, <&cpg 250>,
+               <&cpg 384>,
+               <&cpg 246>, <&cpg 247>,
+               <&cpg 382>,
+               <&cpg 352>, <&cpg 353>,
+               <&cpg 354>, <&cpg 355>,
+               <&cpg 356>, <&cpg 357>,
+               <&cpg 358>, <&cpg 359>,
+               <&cpg 360>, <&cpg 361>,
+               <&cpg 248>, <&cpg 249>;
+      clock-names = "ssi-all",
+                    "ssi-0", "ssi-1",
+                    "ssi-2", "ssi-3",
+                    "ssi-4", "ssi-5",
+                    "ssi-6", "ssi-7",
+                    "ssi-8", "ssi-9",
+                    "src-0", "src-1",
+                    "src-2", "src-3",
+                    "src-4", "src-5",
+                    "src-6", "src-7",
+                    "src-8", "src-9",
+                    "mix-0", "mix-1",
+                    "ctu-0", "ctu-1",
+                    "dvc-0", "dvc-1",
+                    "audio-clka", "audio-clkb",
+                    "audio-clkc", "audio-clki",
+                    "ssif_supply",
+                    "scu", "scu_x2",
+                    "scu_supply",
+                    "adg-ssi-0", "adg-ssi-1",
+                    "adg-ssi-2", "adg-ssi-3",
+                    "adg-ssi-4", "adg-ssi-5",
+                    "adg-ssi-6", "adg-ssi-7",
+                    "adg-ssi-8", "adg-ssi-9",
+                    "audmapp", "adg";
+      power-domains = <&cpg>;
+      resets = <&cpg 225>,
+               <&cpg 226>, <&cpg 227>,
+               <&cpg 228>, <&cpg 229>,
+               <&cpg 230>, <&cpg 231>,
+               <&cpg 232>, <&cpg 233>,
+               <&cpg 234>, <&cpg 235>,
+               <&cpg 236>, <&cpg 238>, <&cpg 237>;
+      reset-names = "ssi-all",
+                    "ssi-0", "ssi-1",
+                    "ssi-2", "ssi-3",
+                    "ssi-4", "ssi-5",
+                    "ssi-6", "ssi-7",
+                    "ssi-8", "ssi-9",
+                    "scu", "adg",
+                    "audmapp";
+
+      ctu {
+        ctu-0 { };
+        ctu-1 { };
+        ctu-2 { };
+        ctu-3 { };
+        ctu-4 { };
+        ctu-5 { };
+        ctu-6 { };
+        ctu-7 { };
+      };
+
+      dvc {
+        dvc-0 {
+          dmas = <&dmac0 0x1db3>, <&dmac1 0x1db3>,
+                 <&dmac2 0x1db3>, <&dmac3 0x1db3>,
+                 <&dmac4 0x1db3>;
+          dma-names = "tx", "tx", "tx", "tx", "tx";
+        };
+        dvc-1 {
+          dmas = <&dmac0 0x1db4>, <&dmac1 0x1db4>,
+                 <&dmac2 0x1db4>, <&dmac3 0x1db4>,
+                 <&dmac4 0x1db4>;
+          dma-names = "tx", "tx", "tx", "tx", "tx";
+        };
+      };
+
+      mix {
+        mix-0 { };
+        mix-1 { };
+      };
+
+      src {
+        src-0 {
+          interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1d9f>, <&dmac0 0x1da9>,
+                 <&dmac1 0x1d9f>, <&dmac1 0x1da9>,
+                 <&dmac2 0x1d9f>, <&dmac2 0x1da9>,
+                 <&dmac3 0x1d9f>, <&dmac3 0x1da9>,
+                 <&dmac4 0x1d9f>, <&dmac4 0x1da9>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-1 {
+          interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da0>, <&dmac0 0x1daa>,
+                 <&dmac1 0x1da0>, <&dmac1 0x1daa>,
+                 <&dmac2 0x1da0>, <&dmac2 0x1daa>,
+                 <&dmac3 0x1da0>, <&dmac3 0x1daa>,
+                 <&dmac4 0x1da0>, <&dmac4 0x1daa>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-2 {
+          interrupts = <GIC_SPI 904 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da1>, <&dmac0 0x1dab>,
+                 <&dmac1 0x1da1>, <&dmac1 0x1dab>,
+                 <&dmac2 0x1da1>, <&dmac2 0x1dab>,
+                 <&dmac3 0x1da1>, <&dmac3 0x1dab>,
+                 <&dmac4 0x1da1>, <&dmac4 0x1dab>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-3 {
+          interrupts = <GIC_SPI 905 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da2>, <&dmac0 0x1dac>,
+                 <&dmac1 0x1da2>, <&dmac1 0x1dac>,
+                 <&dmac2 0x1da2>, <&dmac2 0x1dac>,
+                 <&dmac3 0x1da2>, <&dmac3 0x1dac>,
+                 <&dmac4 0x1da2>, <&dmac4 0x1dac>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-4 {
+          interrupts = <GIC_SPI 906 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da3>, <&dmac0 0x1dad>,
+                 <&dmac1 0x1da3>, <&dmac1 0x1dad>,
+                 <&dmac2 0x1da3>, <&dmac2 0x1dad>,
+                 <&dmac3 0x1da3>, <&dmac3 0x1dad>,
+                 <&dmac4 0x1da3>, <&dmac4 0x1dad>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-5 {
+          interrupts = <GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da4>, <&dmac0 0x1dae>,
+                 <&dmac1 0x1da4>, <&dmac1 0x1dae>,
+                 <&dmac2 0x1da4>, <&dmac2 0x1dae>,
+                 <&dmac3 0x1da4>, <&dmac3 0x1dae>,
+                 <&dmac4 0x1da4>, <&dmac4 0x1dae>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-6 {
+          interrupts = <GIC_SPI 908 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da5>, <&dmac0 0x1daf>,
+                 <&dmac1 0x1da5>, <&dmac1 0x1daf>,
+                 <&dmac2 0x1da5>, <&dmac2 0x1daf>,
+                 <&dmac3 0x1da5>, <&dmac3 0x1daf>,
+                 <&dmac4 0x1da5>, <&dmac4 0x1daf>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-7 {
+          interrupts = <GIC_SPI 909 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da6>, <&dmac0 0x1db0>,
+                 <&dmac1 0x1da6>, <&dmac1 0x1db0>,
+                 <&dmac2 0x1da6>, <&dmac2 0x1db0>,
+                 <&dmac3 0x1da6>, <&dmac3 0x1db0>,
+                 <&dmac4 0x1da6>, <&dmac4 0x1db0>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-8 {
+          interrupts = <GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da7>, <&dmac0 0x1db1>,
+                 <&dmac1 0x1da7>, <&dmac1 0x1db1>,
+                 <&dmac2 0x1da7>, <&dmac2 0x1db1>,
+                 <&dmac3 0x1da7>, <&dmac3 0x1db1>,
+                 <&dmac4 0x1da7>, <&dmac4 0x1db1>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-9 {
+          interrupts = <GIC_SPI 911 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da8>, <&dmac0 0x1db2>,
+                 <&dmac1 0x1da8>, <&dmac1 0x1db2>,
+                 <&dmac2 0x1da8>, <&dmac2 0x1db2>,
+                 <&dmac3 0x1da8>, <&dmac3 0x1db2>,
+                 <&dmac4 0x1da8>, <&dmac4 0x1db2>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+      };
+
+      ssi {
+        ssi-0 {
+          interrupts = <GIC_SPI 889 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-1 {
+          interrupts = <GIC_SPI 890 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-2 {
+          interrupts = <GIC_SPI 891 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-3 {
+          interrupts = <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-4 {
+          interrupts = <GIC_SPI 893 IRQ_TYPE_LEVEL_HIGH>;
+          shared-pin;
+        };
+        ssi-5 {
+          interrupts = <GIC_SPI 894 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-6 {
+          interrupts = <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-7 {
+          interrupts = <GIC_SPI 896 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-8 {
+          interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-9 {
+          interrupts = <GIC_SPI 898 IRQ_TYPE_LEVEL_HIGH>;
+        };
+      };
+
+      ssiu {
+        ssiu-0 {
+          dmas = <&dmac0 0x1d61>, <&dmac0 0x1d62>,
+                 <&dmac1 0x1d61>, <&dmac1 0x1d62>,
+                 <&dmac2 0x1d61>, <&dmac2 0x1d62>,
+                 <&dmac3 0x1d61>, <&dmac3 0x1d62>,
+                 <&dmac4 0x1d61>, <&dmac4 0x1d62>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-1 {
+          dmas = <&dmac0 0x1d63>, <&dmac0 0x1d64>,
+                 <&dmac1 0x1d63>, <&dmac1 0x1d64>,
+                 <&dmac2 0x1d63>, <&dmac2 0x1d64>,
+                 <&dmac3 0x1d63>, <&dmac3 0x1d64>,
+                 <&dmac4 0x1d63>, <&dmac4 0x1d64>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-2 {
+          dmas = <&dmac0 0x1d65>, <&dmac0 0x1d66>,
+                 <&dmac1 0x1d65>, <&dmac1 0x1d66>,
+                 <&dmac2 0x1d65>, <&dmac2 0x1d66>,
+                 <&dmac3 0x1d65>, <&dmac3 0x1d66>,
+                 <&dmac4 0x1d65>, <&dmac4 0x1d66>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-3 {
+          dmas = <&dmac0 0x1d67>, <&dmac0 0x1d68>,
+                 <&dmac1 0x1d67>, <&dmac1 0x1d68>,
+                 <&dmac2 0x1d67>, <&dmac2 0x1d68>,
+                 <&dmac3 0x1d67>, <&dmac3 0x1d68>,
+                 <&dmac4 0x1d67>, <&dmac4 0x1d68>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-4 {
+          dmas = <&dmac0 0x1d69>, <&dmac0 0x1d6a>,
+                 <&dmac1 0x1d69>, <&dmac1 0x1d6a>,
+                 <&dmac2 0x1d69>, <&dmac2 0x1d6a>,
+                 <&dmac3 0x1d69>, <&dmac3 0x1d6a>,
+                 <&dmac4 0x1d69>, <&dmac4 0x1d6a>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-5 {
+          dmas = <&dmac0 0x1d6b>, <&dmac0 0x1d6c>,
+                 <&dmac1 0x1d6b>, <&dmac1 0x1d6c>,
+                 <&dmac2 0x1d6b>, <&dmac2 0x1d6c>,
+                 <&dmac3 0x1d6b>, <&dmac3 0x1d6c>,
+                 <&dmac4 0x1d6b>, <&dmac4 0x1d6c>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-6 {
+          dmas = <&dmac0 0x1d6d>, <&dmac0 0x1d6e>,
+                 <&dmac1 0x1d6d>, <&dmac1 0x1d6e>,
+                 <&dmac2 0x1d6d>, <&dmac2 0x1d6e>,
+                 <&dmac3 0x1d6d>, <&dmac3 0x1d6e>,
+                 <&dmac4 0x1d6d>, <&dmac4 0x1d6e>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-7 {
+          dmas = <&dmac0 0x1d6f>, <&dmac0 0x1d70>,
+                 <&dmac1 0x1d6f>, <&dmac1 0x1d70>,
+                 <&dmac2 0x1d6f>, <&dmac2 0x1d70>,
+                 <&dmac3 0x1d6f>, <&dmac3 0x1d70>,
+                 <&dmac4 0x1d6f>, <&dmac4 0x1d70>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-8 {
+          dmas = <&dmac0 0x1d71>, <&dmac0 0x1d72>,
+                 <&dmac1 0x1d71>, <&dmac1 0x1d72>,
+                 <&dmac2 0x1d71>, <&dmac2 0x1d72>,
+                 <&dmac3 0x1d71>, <&dmac3 0x1d72>,
+                 <&dmac4 0x1d71>, <&dmac4 0x1d72>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-9 {
+          dmas = <&dmac0 0x1d73>, <&dmac0 0x1d74>,
+                 <&dmac1 0x1d73>, <&dmac1 0x1d74>,
+                 <&dmac2 0x1d73>, <&dmac2 0x1d74>,
+                 <&dmac3 0x1d73>, <&dmac3 0x1d74>,
+                 <&dmac4 0x1d73>, <&dmac4 0x1d74>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-10 {
+          dmas = <&dmac0 0x1d75>, <&dmac0 0x1d76>,
+                 <&dmac1 0x1d75>, <&dmac1 0x1d76>,
+                 <&dmac2 0x1d75>, <&dmac2 0x1d76>,
+                 <&dmac3 0x1d75>, <&dmac3 0x1d76>,
+                 <&dmac4 0x1d75>, <&dmac4 0x1d76>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-11 {
+          dmas = <&dmac0 0x1d77>, <&dmac0 0x1d78>,
+                 <&dmac1 0x1d77>, <&dmac1 0x1d78>,
+                 <&dmac2 0x1d77>, <&dmac2 0x1d78>,
+                 <&dmac3 0x1d77>, <&dmac3 0x1d78>,
+                 <&dmac4 0x1d77>, <&dmac4 0x1d78>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-12 {
+          dmas = <&dmac0 0x1d79>, <&dmac0 0x1d7a>,
+                 <&dmac1 0x1d79>, <&dmac1 0x1d7a>,
+                 <&dmac2 0x1d79>, <&dmac2 0x1d7a>,
+                 <&dmac3 0x1d79>, <&dmac3 0x1d7a>,
+                 <&dmac4 0x1d79>, <&dmac4 0x1d7a>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-13 {
+          dmas = <&dmac0 0x1d7b>, <&dmac0 0x1d7c>,
+                 <&dmac1 0x1d7b>, <&dmac1 0x1d7c>,
+                 <&dmac2 0x1d7b>, <&dmac2 0x1d7c>,
+                 <&dmac3 0x1d7b>, <&dmac3 0x1d7c>,
+                 <&dmac4 0x1d7b>, <&dmac4 0x1d7c>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-14 {
+          dmas = <&dmac0 0x1d7d>, <&dmac0 0x1d7e>,
+                 <&dmac1 0x1d7d>, <&dmac1 0x1d7e>,
+                 <&dmac2 0x1d7d>, <&dmac2 0x1d7e>,
+                 <&dmac3 0x1d7d>, <&dmac3 0x1d7e>,
+                 <&dmac4 0x1d7d>, <&dmac4 0x1d7e>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-15 {
+          dmas = <&dmac0 0x1d7f>, <&dmac0 0x1d80>,
+                 <&dmac1 0x1d7f>, <&dmac1 0x1d80>,
+                 <&dmac2 0x1d7f>, <&dmac2 0x1d80>,
+                 <&dmac3 0x1d7f>, <&dmac3 0x1d80>,
+                 <&dmac4 0x1d7f>, <&dmac4 0x1d80>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-16 {
+          dmas = <&dmac0 0x1d81>, <&dmac0 0x1d82>,
+                 <&dmac1 0x1d81>, <&dmac1 0x1d82>,
+                 <&dmac2 0x1d81>, <&dmac2 0x1d82>,
+                 <&dmac3 0x1d81>, <&dmac3 0x1d82>,
+                 <&dmac4 0x1d81>, <&dmac4 0x1d82>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-17 {
+          dmas = <&dmac0 0x1d83>, <&dmac0 0x1d84>,
+                 <&dmac1 0x1d83>, <&dmac1 0x1d84>,
+                 <&dmac2 0x1d83>, <&dmac2 0x1d84>,
+                 <&dmac3 0x1d83>, <&dmac3 0x1d84>,
+                 <&dmac4 0x1d83>, <&dmac4 0x1d84>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-18 {
+          dmas = <&dmac0 0x1d85>, <&dmac0 0x1d86>,
+                 <&dmac1 0x1d85>, <&dmac1 0x1d86>,
+                 <&dmac2 0x1d85>, <&dmac2 0x1d86>,
+                 <&dmac3 0x1d85>, <&dmac3 0x1d86>,
+                 <&dmac4 0x1d85>, <&dmac4 0x1d86>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-19 {
+          dmas = <&dmac0 0x1d87>, <&dmac0 0x1d88>,
+                 <&dmac1 0x1d87>, <&dmac1 0x1d88>,
+                 <&dmac2 0x1d87>, <&dmac2 0x1d88>,
+                 <&dmac3 0x1d87>, <&dmac3 0x1d88>,
+                 <&dmac4 0x1d87>, <&dmac4 0x1d88>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-20 {
+          dmas = <&dmac0 0x1d89>, <&dmac0 0x1d8a>,
+                 <&dmac1 0x1d89>, <&dmac1 0x1d8a>,
+                 <&dmac2 0x1d89>, <&dmac2 0x1d8a>,
+                 <&dmac3 0x1d89>, <&dmac3 0x1d8a>,
+                 <&dmac4 0x1d89>, <&dmac4 0x1d8a>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-21 {
+          dmas = <&dmac0 0x1d8b>, <&dmac0 0x1d8c>,
+                 <&dmac1 0x1d8b>, <&dmac1 0x1d8c>,
+                 <&dmac2 0x1d8b>, <&dmac2 0x1d8c>,
+                 <&dmac3 0x1d8b>, <&dmac3 0x1d8c>,
+                 <&dmac4 0x1d8b>, <&dmac4 0x1d8c>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-22 {
+          dmas = <&dmac0 0x1d8d>, <&dmac0 0x1d8e>,
+                 <&dmac1 0x1d8d>, <&dmac1 0x1d8e>,
+                 <&dmac2 0x1d8d>, <&dmac2 0x1d8e>,
+                 <&dmac3 0x1d8d>, <&dmac3 0x1d8e>,
+                 <&dmac4 0x1d8d>, <&dmac4 0x1d8e>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-23 {
+          dmas = <&dmac0 0x1d8f>, <&dmac0 0x1d90>,
+                 <&dmac1 0x1d8f>, <&dmac1 0x1d90>,
+                 <&dmac2 0x1d8f>, <&dmac2 0x1d90>,
+                 <&dmac3 0x1d8f>, <&dmac3 0x1d90>,
+                 <&dmac4 0x1d8f>, <&dmac4 0x1d90>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-24 {
+          dmas = <&dmac0 0x1d91>, <&dmac0 0x1d92>,
+                 <&dmac1 0x1d91>, <&dmac1 0x1d92>,
+                 <&dmac2 0x1d91>, <&dmac2 0x1d92>,
+                 <&dmac3 0x1d91>, <&dmac3 0x1d92>,
+                 <&dmac4 0x1d91>, <&dmac4 0x1d92>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-25 {
+          dmas = <&dmac0 0x1d93>, <&dmac0 0x1d94>,
+                 <&dmac1 0x1d93>, <&dmac1 0x1d94>,
+                 <&dmac2 0x1d93>, <&dmac2 0x1d94>,
+                 <&dmac3 0x1d93>, <&dmac3 0x1d94>,
+                 <&dmac4 0x1d93>, <&dmac4 0x1d94>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-26 {
+          dmas = <&dmac0 0x1d95>, <&dmac0 0x1d96>,
+                 <&dmac1 0x1d95>, <&dmac1 0x1d96>,
+                 <&dmac2 0x1d95>, <&dmac2 0x1d96>,
+                 <&dmac3 0x1d95>, <&dmac3 0x1d96>,
+                 <&dmac4 0x1d95>, <&dmac4 0x1d96>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-27 {
+          dmas = <&dmac0 0x1d97>, <&dmac0 0x1d98>,
+                 <&dmac1 0x1d97>, <&dmac1 0x1d98>,
+                 <&dmac2 0x1d97>, <&dmac2 0x1d98>,
+                 <&dmac3 0x1d97>, <&dmac3 0x1d98>,
+                 <&dmac4 0x1d97>, <&dmac4 0x1d98>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+      };
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        port@0 {
+          reg = <0>;
+          rsnd_endpoint0: endpoint {
+            remote-endpoint = <&codec_endpoint>;
+            dai-format = "i2s";
+            bitclock-master = <&rsnd_endpoint0>;
+            frame-master = <&rsnd_endpoint0>;
+            playback = <&ssi3>, <&src1>, <&dvc1>;
+            capture = <&ssi4>, <&src0>, <&dvc0>;
+          };
+        };
+      };
+    };
-- 
2.25.1


