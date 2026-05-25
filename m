Return-Path: <linux-renesas-soc+bounces-33077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKYZM7otFGpYKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:08:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 273DA5C9AD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DDEE3028B4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E522D37BE9B;
	Mon, 25 May 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vrGwp7IF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300C7375F82;
	Mon, 25 May 2026 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707073; cv=fail; b=rDEmqKpIZnDFsY6JwSad1oxw2Iub0OxXAge3fS0hSPSJfMQW52/1rf+l94caFBpxZW+zrESZ7zP3Ts6lxoFSEUqCIVDl39AZBv7fKbPXou2r93EH0EK0LsUMpV7d4WfRfSYp91jlPF3j5Xq1DINu3G+TWG77AnUD9cGZMxqjsO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707073; c=relaxed/simple;
	bh=fHgOX5v4VZ9va9TNJXKwvPfLLZ05zgCod8fXEL3XKX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XDTdqQgMvPPeTiR4cjzIWz2d4mgUHy4aJS3IJkEZULJag+NAgPBHtx17WxEn4t5CJfKseOYXwD4mRNv4CzpgeBO6UWIo5f/Q9NPxKTqAK4PIq8USiVIgGfBSb4GWVAdgqJ05b9t3sEpuj10QMdoIgK+DHCjkVujF/veZe6w++tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vrGwp7IF; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoMXiDBU6wsITskdmqAs8gQXTpSvwR1YPMm6vVGDYOdKzfbM42JZCo1qNWeR3YiW+aq3zPmfv/enW9zf7oVl5hizh0JeNObnnp0m46sbcVk+VpbRkfyUhN8iD5eb1AReRP0Ae//M80pslLlA+HYeNuymJenkFubkVAQUAruhWcwVqhX7cvM8xeip4LbW24/Ji2yImir8YslLwVuet9kPyt25JYVr7O6CG1sPzzurs5y/BCP6JsHkGXyt48kozUwaOVXrTz5lMq6PVR0jy0YHCUYDyheLgvMDV53GS/umTijNc8ko+afq5uZDC1z067JaqUuuSye4g0ZzDHj+5oCnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsMas8VlZab1Q8mrU+z9AtnlYY9fOOxC5W+/Fvo5Dos=;
 b=nKwagexei441c5dKqYAdaEhzYd7MSbThQQ72PNBVI2RDt+SPFICpfNjHn1yCjADFapKSWzQs4xPiJBpb0SBUTYzVb2IB2DppW9cNTYWvUXDHDnCm2viKPj9X52FgCKS/kV2zO6T8afMQ2iyhEoZ6esDZFMM+6cuksPCaJdBiWRzlAzqqfjc6PcSKdCpZ5akS+9w99y2wZ1oqPGXIFca6NQmdp27dI0UOzsnkOeyr7MO0O/CvbfGXZx7kvP+F/yTAjXwL3Zh3buBoz6hJv5uyfpY2o12Qdx02Q8xM3nT5m3EA/F18fSQPFFN2sXdeOX/gEwJXk6jkej838nVYoSTlfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsMas8VlZab1Q8mrU+z9AtnlYY9fOOxC5W+/Fvo5Dos=;
 b=vrGwp7IFOpoWrxf0KwYCU9HJtuKf5ygvad3WpjZbNpMzZe5xcAjA6WR/63G8Hfbwl8F5gxWvAdsWXJVDkQO9sCMnVbgoe8rip6bUaFg9TH0B+0pd+zUjbuFRK/7F9Lx2qU1VaMQmNqHFUgEGuPBsgUHKqt3rH31upPKXEKcUAyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:04:29 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:04:29 +0000
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
Subject: [PATCH v7 10/18] ASoC: rsnd: ssiu: Add RZ/G3E BUSIF support
Date: Mon, 25 May 2026 11:02:22 +0000
Message-Id: <20260525110230.4014435-11-john.madieu.xa@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e9c345-9e99-457b-e769-08deba4d6460
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	osmPsh76Pk/IwdlVBvIJ4uT2xyGoia5ozbq3iURcipHStrG/uQCUzs9yyhsF8sDTpbZ3WY5Vtiza3tMOdhusRy0pMVommjx6FXbQQqllbqroF8noXEZbJ3zGNbcFkAJKYNnlYKKqyiHWgynzJKsrefZUqZuorLYWHrfMKm8kkodV3dZsdx8EA0wjQWxk4msRMndjClUYsSjGupz/J0WM2F2doFqMiR6wos/47KmpfF8owYx3wU8wH06QdwLv5t8hfmltoVSTCq++iAs/7S5kHTFfSxaLJ1eceQ+xu7HKX+BliBFD7D0glMFgFbKOmtTkIgXeMPMbei7+C1Hp9Sp/vK93b7KFmeIexTBYaf/p0SfPPtLJ4ZvdXwthaw8tsfjsLnS5mnglu/K+AzWVLQePPTDvIg7G8Mg6fCYMaMyvCBz5aRo+uzsD30JqeU23OUcxjYDotPN10WSrpXMlnW6Yzc4kGFdyPwjcpjy5b3VIUu4gWaQ0oXm04U2xA1EMhYpqI+WIswOt3pMIn4/WzpKiUhFDL36YrAZNC8vx4Y4vPRS4oNIqZ3hmajOl3qkl2atVElXm1LgU8MkdyuRPFhhLtGjZzesfe12OlgauRKPcjReGJyrOdpJ+3rMBJosaghyohLol0gqaWhvlaSUV1dBVcsRh5wQ9Y8sfaWHj+yZWSF26badxj6qMoR6FEjflwJjxTGy0ibCEv1MHUTRx7qZNvrTOFwyKnV20EZNxLj0MHkOHXEhs6wKZfeDm7IvZuj3V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oFQP4u9ExdnRMeA04s4cnh9U8oAQ16cgGDQlOxrJLnS37SMZwAfjvy8ryO9+?=
 =?us-ascii?Q?65smB77XSYsywrg7ywYB2/SgUXzACdncXuHXC3wyinanUo8il0qcMZ29nASc?=
 =?us-ascii?Q?1kBLLmq2OH4evwBdTNfd21fF0g+jY2ciR3khGGAOiugey1NfMnFYZRYtA7Ph?=
 =?us-ascii?Q?2x1/AiFPLyEKdPfMKrnb1jx69Pat6uqJp2M+YqXi/vuo0m+wZXk/n/DCozQs?=
 =?us-ascii?Q?d6Hq9ADk7c3zgSPhJn1QrsPZ7pyg5K/lPRZNkdwFvKxHZM17QdulrsEKxdqR?=
 =?us-ascii?Q?yX7g/BaZFnd1Yw4wRcST0Wzojm4ZkAcJ+ZnLX7H+Y2bQ/Cds87Vkg+zE0FRF?=
 =?us-ascii?Q?/ZIxKlAapii9WyfNaC7tzUWALHU1qNBvJE5vmkHZIJoKXW9hmu9VipSu2DGJ?=
 =?us-ascii?Q?p5MF9o02G0RtCxYdh1sZ+cdhmLPSTU+2BrUIZSdq1hlke+3pftE6NEURUjuW?=
 =?us-ascii?Q?giivxX89bTgUUz1BnQNG8MXeNSDrXF/3v28dRwfSn2jwMWpM1dAqbXZxFGbw?=
 =?us-ascii?Q?Q74MPwU9cKH4VEHcNvtUGIxLA44qx3FWnjuIFX1hinC5pAUOkSifWPElh77g?=
 =?us-ascii?Q?4rqmgeumw9PCPu5n7Gb5gS00t/y6X9LCrRBf96MTgEcEPMPb2SHrVIyJgyVE?=
 =?us-ascii?Q?Kc7Uw/gPEgVUoLdai6MUqys013HHmXIiwu3DR4faFHYakXOaM1JU6rO/oUhO?=
 =?us-ascii?Q?a0YJMK18U0DUNj1w/hj7+YreWy+b+BvLjyVtSDfYe6nV68RTgK/PaP8ZojJM?=
 =?us-ascii?Q?8bi4rKqOfiFUsWkQLQwMsoDtundIu7pPYoekVE+9pFcVhY1cLy0BRFGtqdjR?=
 =?us-ascii?Q?gi9xFaLlnnpgR8gvyx4vi6B2X/+NzhF3kjK/KIqveIq/Wr2M5k43Ia0HvpyD?=
 =?us-ascii?Q?ZgUYVAr3iD6cBr0oXjF0i4sjOwYPvYmVbwDvY28KC/jAttSj0h3aLM6870FU?=
 =?us-ascii?Q?YmR/u4jmK08UN6pG8U9pGFYzUXuLgRyo85BIlh0bQITmv2wb+qoJ+XFrPRE3?=
 =?us-ascii?Q?QaQwLz9WVxAB74dCArfgLR+UookMRzS5EOrL+NSx5IMLr1PxysOfc2KRbGAj?=
 =?us-ascii?Q?4Nos1ujE25Qxj9OGzYf81lt2wjvLO/HP4pDHLdZCOEtM9W4QqV0xpyRhS2Sq?=
 =?us-ascii?Q?NIrgfPqtbs20Q3o8YznMeFk97q+59CQL6hyZxOx8j2787E5EM/xth3FZG7xG?=
 =?us-ascii?Q?0O350yW6Rjh9amaNbSku7Yn/mSSsv1zuAs0p0h4Bm8hKgTJS20G3PmBzzwv/?=
 =?us-ascii?Q?mN2R3mc4iAdCMIxRyXGFaOfMxx6Jef4cqGfn5jZTxM6v9TCaIDxoCWQGLWdA?=
 =?us-ascii?Q?RjyT/6gxOeqakKDHlT6LLIkCKtFVhjqNen9VM98azKabVISbubBpvdGYG9ar?=
 =?us-ascii?Q?W1UUDEdJ5753Mz4AafUxLc1uTBqIR5gMj0f8xW3a9SvqWCkoXRDolrJLYHib?=
 =?us-ascii?Q?9n8+nFeDQ3gk1zFzQbPij+OWRdpR0EpuVEPtzW1wWvlhTyRQ5kquPKd+aamt?=
 =?us-ascii?Q?WJK/HlEPK9nwYpATFLp7q+c6pIBjKLnhfSd0vh0VYaSQE8NB90yeWRdmaMXa?=
 =?us-ascii?Q?FBTbGW10tYRXn2JASEe3FzBywnvyk8iVgaeSNeVa0ZX5893zWjdw4Rg5xELe?=
 =?us-ascii?Q?CZqQS3dTwTh0ky6yubZJG/p9XlEwp4afxNjNXff9bh1sA21lJQCR/i4I4FHm?=
 =?us-ascii?Q?YO2CDIRFJxn56NIfq+7sgbdd1u2qVwQLcCvmx3PKPi7LdYz46PTaZj7zOtyg?=
 =?us-ascii?Q?MsrhQ73i2hPCxgWIHBNglkB3l/OcaCo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e9c345-9e99-457b-e769-08deba4d6460
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:04:29.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwFQOiz9V6vmFXfwtX7YrNuvTZAVCARx7lt6PWAwfrYVTebVuyoptyAyrLRYPW45WlGokjNQXXg43zUP9rzNcyYEjM0qK8zEDHV3R0SMR4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33077-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 273DA5C9AD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the SSIU found on the Renesas RZ/G3E SoC, which
provides a different BUSIF layout compared to earlier generations:

 - SSI0-SSI4: 4 BUSIF instances each (BUSIF0-3)
 - SSI5-SSI8: 1 BUSIF instance each (BUSIF0 only)
 - SSI9:      4 BUSIF instances (BUSIF0-3)
 - Total:     28 BUSIFs

The RZ/G3E also has only two pairs of BUSIF error-status registers
instead of four, and the SSI always operates in BUSIF mode: the
SSI_MODE0 BUSIF/PIO select bit is not implemented and must not be written.

While at it, add RSND_SSIU_BUSIF_STATUS_COUNT_2 as a capability flag in
the match data, consumed via struct rsnd_ssiu_ctrl, to parametrise the two
BUSIF error-status loops.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: New patch. Split out of [PATCH v6 09/16] "ASoC: rsnd: ssui: Add
    RZ/G3E SSIU BUSIF support" per Kuninori Morimoto's request. This
    patch carries the RZ/G3E BUSIF layout: the rzg3e_id[] index
    table, struct rsnd_ssiu_ctrl with busif_status_count, the
    RSND_SSIU_BUSIF_STATUS_COUNT_2 capability flag and the SSI_MODE0
    guard.
 - Fix the "ssui" typo in the subject to "ssiu".
 - Split the r9a09g047 match-data initialiser line after the comma
   instead of after the pipe character.

 sound/soc/renesas/rcar/core.c |  3 +-
 sound/soc/renesas/rcar/rsnd.h |  2 ++
 sound/soc/renesas/rcar/ssiu.c | 55 +++++++++++++++++++++++------------
 3 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 7169d0ef8f90..f5c8ba8c5d56 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -106,7 +106,8 @@ static const struct of_device_id rsnd_of_match[] = {
 	{ .compatible = "renesas,rcar_sound-gen4", .data = (void *)RSND_GEN4 },
 	/* Special Handling */
 	{ .compatible = "renesas,rcar_sound-r8a77990", .data = (void *)(RSND_GEN3 | RSND_SOC_E) },
-	{ .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E) },
+	{ .compatible = "renesas,r9a09g047-sound",
+			.data = (void *)(RSND_RZ3 | RSND_RZG3E | RSND_SSIU_BUSIF_STATUS_COUNT_2) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rsnd_of_match);
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index e917aa12fa80..95843a20c43c 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -666,6 +666,7 @@ struct rsnd_priv {
 #define RSND_RZ3	(3 << 8)
 #define RSND_RZ_ID_MASK	(0xF << 12) /* nibble D */
 #define RSND_RZG3E	(1 << 12)
+#define RSND_SSIU_BUSIF_STATUS_COUNT_2	BIT(16) /* Only 2 BUSIF error-status register pairs */
 	/*
 	 * below value will be filled on rsnd_gen_probe()
 	 */
@@ -690,6 +691,7 @@ struct rsnd_priv {
 	/*
 	 * below value will be filled on rsnd_ssiu_probe()
 	 */
+	void *ssiu_ctrl;
 	void *ssiu;
 	int ssiu_nr;
 
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 2b922ead62d0..8d4ce9d35e9e 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -29,31 +29,39 @@ struct rsnd_ssiu {
 	     i++)
 
 /*
- *	SSI	Gen2		Gen3		Gen4
- *	0	BUSIF0-3	BUSIF0-7	BUSIF0-7
- *	1	BUSIF0-3	BUSIF0-7
- *	2	BUSIF0-3	BUSIF0-7
- *	3	BUSIF0		BUSIF0-7
- *	4	BUSIF0		BUSIF0-7
- *	5	BUSIF0		BUSIF0
- *	6	BUSIF0		BUSIF0
- *	7	BUSIF0		BUSIF0
- *	8	BUSIF0		BUSIF0
- *	9	BUSIF0-3	BUSIF0-7
- *	total	22		52		8
+ *	SSI	Gen2		Gen3		Gen4		RZ/G3E
+ *	0	BUSIF0-3	BUSIF0-7	BUSIF0-7	BUSIF0-3
+ *	1	BUSIF0-3	BUSIF0-7			BUSIF0-3
+ *	2	BUSIF0-3	BUSIF0-7			BUSIF0-3
+ *	3	BUSIF0		BUSIF0-7			BUSIF0-3
+ *	4	BUSIF0		BUSIF0-7			BUSIF0-3
+ *	5	BUSIF0		BUSIF0				BUSIF0
+ *	6	BUSIF0		BUSIF0				BUSIF0
+ *	7	BUSIF0		BUSIF0				BUSIF0
+ *	8	BUSIF0		BUSIF0				BUSIF0
+ *	9	BUSIF0-3	BUSIF0-7			BUSIF0-3
+ *	total	22		52		8		28
  */
 static const int gen2_id[] = { 0, 4,  8, 12, 13, 14, 15, 16, 17, 18 };
 static const int gen3_id[] = { 0, 8, 16, 24, 32, 40, 41, 42, 43, 44 };
 static const int gen4_id[] = { 0 };
+static const int rzg3e_id[] = { 0, 4, 8, 12, 16, 20, 21, 22, 23, 24 };
+
+struct rsnd_ssiu_ctrl {
+	unsigned int busif_status_count;
+};
+
+#define rsnd_priv_to_ssiu_ctrl(priv) \
+	((struct rsnd_ssiu_ctrl *)(priv)->ssiu_ctrl)
 
 /* enable busif buffer over/under run interrupt. */
 #define rsnd_ssiu_busif_err_irq_enable(mod)  rsnd_ssiu_busif_err_irq_ctrl(mod, 1)
 #define rsnd_ssiu_busif_err_irq_disable(mod) rsnd_ssiu_busif_err_irq_ctrl(mod, 0)
 static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
 	int id = rsnd_mod_id(mod);
 	int shift, offset;
-	int i;
 
 	switch (id) {
 	case 0:
@@ -72,7 +80,7 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 		return;
 	}
 
-	for (i = 0; i < 4; i++) {
+	for (unsigned int i = 0; i < rsnd_priv_to_ssiu_ctrl(priv)->busif_status_count; i++) {
 		enum rsnd_reg reg = SSI_SYS_INT_ENABLE((i * 2) + offset);
 		u32 val = 0xf << (shift * 4);
 		u32 sys_int_enable = rsnd_mod_read(mod, reg);
@@ -87,10 +95,10 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 
 bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
 	bool error = false;
 	int id = rsnd_mod_id(mod);
 	int shift, offset;
-	int i;
 
 	switch (id) {
 	case 0:
@@ -109,14 +117,13 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
 		goto out;
 	}
 
-	for (i = 0; i < 4; i++) {
+	for (unsigned int i = 0; i < rsnd_priv_to_ssiu_ctrl(priv)->busif_status_count; i++) {
 		u32 reg = SSI_SYS_STATUS(i * 2) + offset;
 		u32 status = rsnd_mod_read(mod, reg);
 		u32 val = 0xf << (shift * 4);
 
 		status &= val;
 		if (status) {
-			struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
 			struct device *dev = rsnd_priv_to_dev(priv);
 
 			rsnd_print_irq_status(dev, "%s err status : 0x%08x\n",
@@ -160,7 +167,8 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
 	/*
 	 * SSI_MODE0
 	 */
-	rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
+	if (!rsnd_is_rzg3e(priv))
+		rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
 
 	/*
 	 * SSI_MODE1 / SSI_MODE2
@@ -511,6 +519,7 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *node __free(device_node) = rsnd_ssiu_of_node(priv);
 	struct reset_control *rstc;
+	struct rsnd_ssiu_ctrl *ctrl;
 	struct rsnd_ssiu *ssiu;
 	struct rsnd_mod_ops *ops;
 	const int *list = NULL;
@@ -535,8 +544,15 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 	if (!ssiu)
 		return -ENOMEM;
 
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->busif_status_count = rsnd_flags_has(priv, RSND_SSIU_BUSIF_STATUS_COUNT_2) ? 2 : 4;
+
 	priv->ssiu	= ssiu;
 	priv->ssiu_nr	= nr;
+	priv->ssiu_ctrl	= ctrl;
 
 	if (rsnd_is_gen1(priv))
 		ops = &rsnd_ssiu_ops_gen1;
@@ -559,6 +575,9 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		} else if (rsnd_is_gen4(priv)) {
 			list	= gen4_id;
 			nr	= ARRAY_SIZE(gen4_id);
+		} else if (rsnd_is_rzg3e(priv)) {
+			list	= rzg3e_id;
+			nr	= ARRAY_SIZE(rzg3e_id);
 		} else {
 			dev_err(dev, "unknown SSIU\n");
 			return -ENODEV;
-- 
2.25.1


