Return-Path: <linux-renesas-soc+bounces-33068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN4fHpMsFGpYKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:03:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D55C991E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FEB7301C6CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E80A36A345;
	Mon, 25 May 2026 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CbQa7K0F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB0D35DA75;
	Mon, 25 May 2026 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707013; cv=fail; b=LUYXP/4Uh3veT2PL+6m40rqXZPXcBt3T3bXcRDUPFSMkyJZhgJlZlWO3AQJO3o82j0A5mo/sIq1W7ax6xEL/IScRbTePB+LfhpOS/M2L7Im+QAK2v8/Wi5qSC9vkGlGH8ECGwCZ99SwgE1RyLnrgNfSVapM/LH6JYqi8HWhrb18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707013; c=relaxed/simple;
	bh=ja3COp3WVrjehkzZNcRO7wb+t3t4d75zi6WcJhC794k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OcsAXQlcTfU95nPTwsHydP+4fqz/x8S2iizY4nAuqfbyxVSxbGIE1ec0sVH9ajGStwYF61o88WSngldXUNqfKa9OtU2I11hev/9hZJLA6dZUNNegP/fNoVr+GtXs7blJMarYHa40Dsbybcw1mua1QEZlyHW12J5e3t8iOsuxKdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CbQa7K0F; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fktIVODNgW15hN0h8ExUemryIx4AiOY08lQSq+a75J1ZpIaTVFhKjFy1mnUlqa4D7mHg44pWjSr3goyDuXkx6FfjfX8GEP4Z85Al7Mky+HKTmjHwoJUZfK04XdZPoV1NXOH2buNoOBJ3ouBHNlNTquoV6mv0H4kXy1pFGGA/bxOzCjIRC+6twNAAgxEF8l1QVIN9U1iwuJB6V9IdlSlU0acCWeIvICHZ+/EOqrrBl7phuFvRibl7Sf0J0E2HLY8QI55jOrGMXBk3DhSuO3E4X3xocSbntPv+BIhEt4Br6jLLiB+kLQJ53f0gSuJnGE5bhrPC/MZtdVjAvcKZpd7FMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLKM0+a1GueJMnUt8m69GxrAKJNh8Pgh34TZi6U7EWc=;
 b=UUrVX1LqmgMefLODfLDE87a60YVgNc0YXsIC14acdSU7d/0TU832tiOc2cmxGdhFBq3k0BCePR5PzB6/vidqKIQkD9OM/V9NQ76xVocZUYdr5+4H9xAIHqPTLBziwoTAga6GigFzMeoKCCUQnNirroAvbXGa3HuWW3ZLP36QNmIphu43+cLmiINvCoOB5/jkBOMZZiQgj8kbwvNwGJaeeWphb6U2u2VvM7hT58gJpYHu+A0mQSHOLyxYtyp+QvPtG9FJ88GXHlV1k95MEZyNnlLmrMbRpXO33I0Uw1SsazhQHvMGiPit2qI1uxLLkcW3uTfF8niMGThpkibLj2L+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLKM0+a1GueJMnUt8m69GxrAKJNh8Pgh34TZi6U7EWc=;
 b=CbQa7K0F9Y45rvAnF9Z0zflxJ9stPNclKwnvqT0Rm0dcjgCmDFEAp6u+Na5Jgn11tVFiMiXJptYP+Vo6aPsFUMmvRT1HZHUNFhTr2XigsQh1wuZsyqBxG7tQb+dvSy238h2U10TxFkqqx5wnJZfkpCfbpgwy91f9RzQkBrg64Ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB6982.jpnprd01.prod.outlook.com (2603:1096:604:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 11:03:28 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:03:27 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
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
Subject: [PATCH v7 01/18] ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound
Date: Mon, 25 May 2026 11:02:13 +0000
Message-Id: <20260525110230.4014435-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0180.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::6) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d707c2-1a0a-418a-24f1-08deba4d3f29
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|22082099003|18002099003|3023799007|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	Hxy5nJNz93HUFtF0LJFImC3EQRFXVqSulesTjgkfwdz+t7/A+pOnmWvXSUWL7tucP2ulqJFnzVrp/K1oL6SM+NFnLuqRMoTwq0CKuHTLiGEAJ4q1PHC2nBB+xZB2JRdJ+oxE8mQVmjPmWSTM3B02rsM3TiDfj+GChRHfoJTAoBu89IZLCh/S6u1K6WWfL7st37oZYOX8GPJKhh5e3oaxJJJmLQUn3w48k4Fse1fILzDKaVZn8s5dDTPXaPCohVzYyTf+lR4xwwFxpbHyxPyrqrBpPpPNVFVVcXd4R2rFfX3e6bFlWMIYPE1QZWlNCzIQKoBrx7ZpPDCig31tdKm5WM2OZqnTDfGYc9zNUJovhBGBZi5joK+/iYeUGF6Pq6Wil3uXFxkIRjG/i4AADAVvDGnAF57RZXwlemwz3ez5uxPpmlSjpbjPWzVKBMId9SOVhCZzBoGSD3jUdrlbCQ3HhPZvsJbB4shtUt+v6+Wq/qksua1g+L3KgH+Cu/mgwptPx1B5XzrlAcIgN0dxTQts3weq8eviJXWl6gA85+icOqr9Rua60wbAF1IFlkngMDnAUSqnxHMdhmU5lmuw7DfKdBcYOu0GWZVrF7NqQEvCJYtWg6yw3DwcxhGr6hCk2r8u5GxgjgpJY33I0KFSg1UX8hBnKTndaAXLllE8Zd57UyfOPflfhLjlew5H7vIXkRPzlsOtYOxQGPAIn0vMpbbg7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(22082099003)(18002099003)(3023799007)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MWfhK8QyRYRQFJwp9UZHzwRyc2tPuqQgUvBBB42tajx00ClbGiXJJnniM1l6?=
 =?us-ascii?Q?JjwrN/hNvnblJ4QJFtA4/zJjO+4qEb2dSkKbO1vU5NZJS7iHaGKi9iUfNeuJ?=
 =?us-ascii?Q?H6FVLX80AQvEHUIj68zQp8KSxEDx4LcY9VKHIWYaXyyDlJC/aTXkL2erQA7A?=
 =?us-ascii?Q?ScXjen7+UgC4MjioJCkxa9ejBzEIhPXCKYaavkjUpWXjafYDY8W4N1vX2O/n?=
 =?us-ascii?Q?QbOMoOBERPV6y+AF5FOuBHJYeo+DfjrDPrRqryAiocXL96S29UyYW3Gdd5Fq?=
 =?us-ascii?Q?YVcofc56lmY0nJ/skjyZovTLQz8E53lj83tvRoZWNpvcb4ZxMEdyQccGXORw?=
 =?us-ascii?Q?ey7duqagbqD2PCgBbfJ8pzpwEPW4qQv2p60mY+EDheXx+7jHBv3RwSfvQejM?=
 =?us-ascii?Q?iIVeiebbVeHCiP8fmqAHL8voj0l1gJ3rupjHD0jaHoOKiM/mej3Otzh1NiZ/?=
 =?us-ascii?Q?Ynh5sMyJI530WJsq5C/pdKLzR15ydOI0Dj9MgJEqqsAQ/lp4oDdbGdlaFRdX?=
 =?us-ascii?Q?THnaUBg7ESnY27zwsOxwTGPVRApVd1p3k0RAMtxVLTZVT0TpgjCgjIl3Aprv?=
 =?us-ascii?Q?QOtGiIIUkd58zXale6nvzgDh/LxvGZ6nljAdsvjeSrC/NUcE73xiPrdHsqh5?=
 =?us-ascii?Q?9bcA3v1z0xoyOqnikhOnNLru1cvYqy4RJBNofy98P7Bl6m0oW5Si2NfnA7pr?=
 =?us-ascii?Q?WUgORc8SquWO9q8GIGt2PBmfUbGmRk5R9g8jb8cZNI/cYDzPko4wofny6KzC?=
 =?us-ascii?Q?m6+nFGrO9fmYFYTUmaErBx7JhMI97fUTz5uQwscBlBSM/amx5Qvuc3UsW3dL?=
 =?us-ascii?Q?AMg1EywKqbDHFIhFaf83NdrSVA4DWAj+023QgpnlO1sxTiiADiBnrH5tE5q9?=
 =?us-ascii?Q?5c5gB7owhleUO9z3qRbOJgAlMgzlF+q5PMcOx3UuTntww+rjAIqbk9X1XPi2?=
 =?us-ascii?Q?sn1YJY8nvzDfuTQyWpzH4ibr0ycy1L6BvBiRkWwIAVNuU+O2Axc0h1D6cH+/?=
 =?us-ascii?Q?zX72x9CDF+Kp5rWbJUtiU0eALftZSquoZvI3PetCP7aQ+pPmlS6dyTYyY3mx?=
 =?us-ascii?Q?KTnMA7ktOH6pq/BIt9QuonGQVAdmfvA/TkUQg+nThdqiD8l8ajONTGiWFbF5?=
 =?us-ascii?Q?RJFvNkI4wQ5IYe9uOr7jQ+2zE/o2hxh0OX+npRkE3mhKaIrLJEDZuGpcbFTl?=
 =?us-ascii?Q?6S3sI9xW94pnWKaNY8H9XZTvcGuJXTVMOdoDHyRKU/3ZsoFnq1PqPY0w/j8s?=
 =?us-ascii?Q?rJDT6Db/9veVd+ls/oAvmmVTyET5R7BRf2xULUZ9ATCKCK3lWmcMT099ffaa?=
 =?us-ascii?Q?xhVnXn/pcrJm8RPKyh6RqgNgWE1NOUJxTe8JgrPDVPZCcEau3orSUWDRyheN?=
 =?us-ascii?Q?DAX6zdQYkSM4XFaYynGH/ZDP9MjYQg4F4CFuRdvL5QT2SAUqI01qfjvXSq+v?=
 =?us-ascii?Q?W6F0Sd9IoIbFh6bmTCfYWavGQy56BpjXVs/x7ielS350KN8DzzZLC7oS9tMr?=
 =?us-ascii?Q?Ea3Dp93megMO5clJeaot7cBACrJto875B139CkM2PKwE8ecRgps6c4I66Haj?=
 =?us-ascii?Q?xBt2NcovufxCt0mtY+tlsOx9bjguQ5bcET357+lNcGCurDlr7pgMMHoccU6i?=
 =?us-ascii?Q?BCgGMRiMZfZzPbqMXQpW8fcrfPqKBWfAirH+I71oAyQIlN49VJyV7cL+4VCG?=
 =?us-ascii?Q?XQ7+AILkqraJ2DCBP6SXXjQMAUFRbyPXGin9Zet2dKBqGrgcGw0INBia5l/z?=
 =?us-ascii?Q?a81Mf3kyUliG6FTdPQ8xVxTmAwiAu4Q=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d707c2-1a0a-418a-24f1-08deba4d3f29
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:03:27.3807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdTlrrhFDzzRo7NCj1s59oMzhGp3dTtEGE9jUY+cg4pQ66a4ZxpEOUZqu61xqcoIjJVo4LsjyI75xIag0gzpcNKhllc8h8Yu0YLu9GikKI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6982
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33068-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,bp.renesas.com:mid,bp.renesas.com:dkim,0.0.0.0:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C55D55C991E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

v7:
 - Add per-property descriptions for the DMA specifier lists in the
   dvc, ssiu and src sub-nodes, explaining that the dma-engine core
   falls through the repeated entries to find a free channel
   (Rob Herring).
 - Add descriptions for the property-less mix-N and ctu-N sub-nodes,
   explaining they exist only so the driver can enumerate the
   instances and so DT labels can be attached for the dai/playback/
   capture phandle routing arrays (Rob Herring).
 - Add descriptions for the dai playback and capture phandle arrays
   (Rob Herring).
 - Drop the dmas / dma-names blanket "true" allowance on the ssi
   sub-node; the SSI always operates in BUSIF mode (sashiko-bot).
 - Add "#sound-dai-cells" and "#clock-cells" to the required list
   (sashiko-bot).
 - Add DT labels (dvc0, dvc1, src0, src1, ssi3, ssi4) to the example
   so the playback/capture phandle references resolve and
   dt_binding_check passes (sashiko-bot).

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

 .../sound/renesas,r9a09g047-sound.yaml        | 800 ++++++++++++++++++
 1 file changed, 800 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
new file mode 100644
index 000000000000..d7fa16554698
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -0,0 +1,800 @@
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
+
+    patternProperties:
+      "^dvc-[0-1]$":
+        type: object
+        additionalProperties: false
+
+        properties:
+          dmas:
+            maxItems: 5
+            description:
+              List of references to DMA specifiers, one per DMA
+              controller, all for the transmission direction
+              (DVC is playback-only). The dma-engine core falls
+              through the list to find a free channel.
+
+          dma-names:
+            maxItems: 5
+            allOf:
+              - items:
+                  enum:
+                    - tx
+
+        required:
+          - dmas
+          - dma-names
+
+  mix:
+    type: object
+    additionalProperties: false
+    description:
+      Per-channel Mixer (MIX) sub-nodes. Each mix-N node has no
+      properties of its own. It exists so the driver can enumerate
+      the MIX instances and so that DT labels can be attached to it
+      for the dai/playback/capture phandle routing arrays.
+
+    patternProperties:
+      "^mix-[0-1]$":
+        type: object
+        additionalProperties: false
+
+  ctu:
+    type: object
+    additionalProperties: false
+    description:
+      Per-channel Channel Transfer Unit (CTU) sub-nodes. Each ctu-N
+      node has no properties of its own. It exists so the driver
+      can enumerate the CTU instances and so that DT labels can be
+      attached to it for the dai/playback/capture phandle routing arrays.
+
+    patternProperties:
+      "^ctu-[0-7]$":
+        type: object
+        additionalProperties: false
+
+  src:
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "^src-[0-9]$":
+        type: object
+        additionalProperties: false
+
+        properties:
+          interrupts:
+            maxItems: 1
+
+          dmas:
+            maxItems: 10
+            description:
+              Must contain a list of pairs of references to DMA
+              specifiers, one for transmission and one for reception,
+              repeated for each DMA controller. The dma-engine core
+              falls through the list to find a free channel.
+
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
+
+    patternProperties:
+      "^ssiu-[0-9]+$":
+        type: object
+        additionalProperties: false
+
+        properties:
+          dmas:
+            maxItems: 10
+            description:
+              Must contain a list of pairs of references to DMA
+              specifiers, one for transmission and one for reception,
+              repeated for each DMA controller. The dma-engine core
+              falls through the list to find a free channel.
+
+          dma-names:
+            maxItems: 10
+            allOf:
+              - items:
+                  enum:
+                    - tx
+                    - rx
+
+        required:
+          - dmas
+          - dma-names
+
+  ssi:
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "^ssi-[0-9]$":
+        type: object
+        additionalProperties: false
+
+        properties:
+          interrupts:
+            maxItems: 1
+
+          shared-pin:
+            description: Shared clock pin.
+            $ref: /schemas/types.yaml#/definitions/flag
+
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
+                description:
+                  Ordered list of phandles to the in-SoC modules used
+                  by this DAI in the playback direction. Each phandle
+                  must reference one of the ssi-N, src-N, ctu-N,
+                  mix-N or dvc-N sub-nodes of the parent sound
+                  controller. The list order is the pipeline order
+                  from CPU to off-SoC endpoint.
+              capture:
+                $ref: /schemas/types.yaml#/definitions/phandle-array
+                description:
+                  Ordered list of phandles to the in-SoC modules used
+                  by this DAI in the capture direction. Each phandle
+                  must reference one of the ssi-N, src-N, ctu-N,
+                  mix-N or dvc-N sub-nodes of the parent sound
+                  controller. The list order is the pipeline order
+                  from off-SoC endpoint to CPU.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#sound-dai-cells"
+  - "#clock-cells"
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
+        dvc0: dvc-0 {
+          dmas = <&dmac0 0x1db3>, <&dmac1 0x1db3>,
+                 <&dmac2 0x1db3>, <&dmac3 0x1db3>,
+                 <&dmac4 0x1db3>;
+          dma-names = "tx", "tx", "tx", "tx", "tx";
+        };
+        dvc1: dvc-1 {
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
+        src0: src-0 {
+          interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1d9f>, <&dmac0 0x1da9>,
+                 <&dmac1 0x1d9f>, <&dmac1 0x1da9>,
+                 <&dmac2 0x1d9f>, <&dmac2 0x1da9>,
+                 <&dmac3 0x1d9f>, <&dmac3 0x1da9>,
+                 <&dmac4 0x1d9f>, <&dmac4 0x1da9>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src1: src-1 {
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
+        ssi3: ssi-3 {
+          interrupts = <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi4: ssi-4 {
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
+            capture  = <&ssi4>, <&src0>, <&dvc0>;
+          };
+        };
+      };
+    };
-- 
2.25.1


