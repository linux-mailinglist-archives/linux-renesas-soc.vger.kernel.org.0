Return-Path: <linux-renesas-soc+bounces-33078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N6m/KNcsFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:04:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4E75C998A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 270E93002538
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3FA37C0EB;
	Mon, 25 May 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YTS7MKRw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D636999F;
	Mon, 25 May 2026 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707090; cv=fail; b=NT6nRALCBc17sgrx1l8E66D9/uOfHeA7isiDM/2nOVOhqos6LcMxaI/s7d84R/zvcxDFJagzyZBPvWt2ONql/U9xniT3WGWTGTfhcYnNSyMqPYM1/zpojfpOtNTMjGkl4bf2P++ICbSgFOPrI8ezg6zcBgTuF+v+sRjafca+NSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707090; c=relaxed/simple;
	bh=Ke5cteZDwg9j94f2JrmxjIYAn98ppMcm/3Tj1BtkHe4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XNzgCmcFs8AzfLjJNQLB1rkWzFsJZuPKU+he/xZVC5+GtJRJWKVdD31DTJ3l2+NXcgdUkTrBaNbaToDWA/Kf4zQETsXZ+9BpZiIp4xkS8FkP1HmSWv7Otv2Z6Ruc2gyh3Ehyqeqk1aizpIDb2sqePrCNAcGKr+kWY5WnK9lvQ9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YTS7MKRw; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCbkWx0FJvfJxKNCu7IPGidw+nix5F/QrTyfomhHhG9Xa+1GdKkMc9mTfN3qQP+mmTf5hVM9NqXgY7avbcXNknrzMnpzsJBcyzEUJzbPd7RHicQkf6Ad6muR62Gu3BHenAWLAIR2XCH0Jgy6Om0S9R0KAESK5WMh7aBTVbg4siT/K7uYMIwYcuf5CkuOXcuNVbFDO/QIQNbxIT7a9UMjk1Z8vL2R9brQJ3o5DQGTbxsMKzHudJ9GPfwSEw0PwS0Q3R1scTTJUX8YmCTe2O88Cj8ylQOG+3RjiTc0kk1P6wVwFi6thszM8UuE+6mAp2Kun/ADjQ83ieMp2u/xm/bYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JX1hjFziBj6/T0afZ7kLA8immu4Kd0NLLT14tAil8Q=;
 b=JbEzP98IAfO2GZbAj3Pf2d+NVouw5Bo5C3+SH7CNwsyWfbcEj66XZ7T8eHJqiOU4uOXqzj9gsBN9UFN7lWoSh+Wjyc/Nar7m1VjDTcOQbGzw8z0Ed9fDUVSZKoVcKiJ1YXQkzDAoKf0MDfQIvogyeQSs7EXkLxd0oA2BpE+8NPi00zqD5gELvwKA+AMm4Ks3ZacLTqgDSGH224C4pwaY89KkKC2eITCJBgS8kd3quzOWyWwJ7xaMQzndrMWXVV7bWQXrFPrgxRYmZys2lXuVtkTpO+melRHPPE38wu1BJfXwbAcvEyv5nVodbR3d+4WpK7fzfND6et2WIRsYJxQ9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JX1hjFziBj6/T0afZ7kLA8immu4Kd0NLLT14tAil8Q=;
 b=YTS7MKRwRA6fxnNd5FH+9jm/pLkTZ0qQkYT6xzO2u3K0yZLtc/LzYh2j16lPyGG8BG59642JKgvRtMdeOQwTD+mv7pgnm7auF3+MJJlGe+X71R14pjFAxvmMp+0qileJyplB90HOidumfdVL4kQZ0bVBUROzm9YMwElQo6lKT6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:04:36 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:04:36 +0000
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
Subject: [PATCH v7 11/18] ASoC: rsnd: Add SSI reset support for RZ/G3E platform
Date: Mon, 25 May 2026 11:02:23 +0000
Message-Id: <20260525110230.4014435-12-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: a43fb6ee-40f8-429a-8207-08deba4d6825
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GJsBvgMau1lX8+DBiEFxLRbqY1DDM9b8bCPQxyT2aTehoqWqOjPHLnKDY4yO8sFjCt8DBk5T3vWWxs4xrhMSsxJ0O8Am5OMc80tjV42aI1Z6R0bbXp6EQXayf47fPvAqH3cn3lrrDrR2VIlZ86O+2vLZ88+N5CCdWal536J4t9anSuhGvAGl9fgWXxSgczaxTW31pUvsHCmZ+SYplL8ZFQh/JItF/V669tuksuyRBH+KRgjZTovrqAwzzrfngXK0Xnj1zvEVNDha+ThR8tmivqkpnrewo+4YKX+r6kQHt4sKdDt3oy6MoQLip5DlA4ve+5xv4A//4cJcNiyR+ohjJwAWIZqXhHuIeSo7BsRosDsFce3SbJMK0csJ46XUKRBVkkPJiWEs3IdHd3aefKymdaPJfh65LxeCG8IINcKJwX0KhsRWJG4bjSSSLiMIuzJeDz8t62DqWfpo2cDQFD6myuYOajs+SGxCuJJCc0iWVoqd2FlUXKBkR0IxJ+gYswWfpF38MXeytz+1yulxHUS0Z7y4JN1RmqcYWhZ+AsWgV7FLhmn5b8ZXUUkDZdM3rf6s2zMtGFS60q0plbnA5fnPCxrighet4woU1e81b16H+2UcNFd8ym7I/U3OAD+HyWwfbkZjtQqI6WMuAIKDwMAop/NvnbIVE7tmWNAy/S+/7qZRhdj4WPni2Vmo9eR+jjkmgA2HnwUj2RNINaK+QR3gI3W63TQUSff6jr1cS31xcYyQSDYwpS4TuSpApp0icAlH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(6133799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8A6GtkbvI4JIiL2s6x/fl15QFF9knmM7gOg1vxU7+7DvH7FSbY2dWMHXMseF?=
 =?us-ascii?Q?jsijiczeA3H9BIvNuFbUK6JUGJhHOyD5KqR5gPTXXLmrLmLfCydX2iwBoz0x?=
 =?us-ascii?Q?ELolAmyaj9XcgNV0i2PYTKCRT2FzBUoGJFauL7Lzr+haODICH6P+5TNaQu+Y?=
 =?us-ascii?Q?4m8KKsHTvfTomwtt26jdFFqv0e5Cq02W+eSzYsg9OVBj16aWhsHsrpUPIUTN?=
 =?us-ascii?Q?O86fyUjNiXbYy8lfiDyaDDt3F2/Qpsageg+R0EoID7/KNwzM5QhZ9PKO5v/R?=
 =?us-ascii?Q?/wFrQ6eSrDO5MmhmmUNlX6smtuOkgKmNjMzCoqSk+M0BkPJ6+hYrDE5asiTg?=
 =?us-ascii?Q?stz6cL2z2u+00iMfS1UqoADqc43ymZweIeLTtFh8gu9G6ZhLGN87cpaBEROV?=
 =?us-ascii?Q?kgF5a6oAtI33vB3/vemp5rybBTIgNLgeHOjurdanUzIgVOjsjFVpfSHKONGA?=
 =?us-ascii?Q?ZbX04dg9JTfIxlc6mDuDrptHxYu4nNztOdMlXnN5O5WXXG99tuwd8OnXE0oX?=
 =?us-ascii?Q?THNUiOz64esNl9Sn3HjeS3V4AUDqFjuvKrs+4WlQhrtsf1bcgqq+UeiRzlx5?=
 =?us-ascii?Q?I03NUEGd9Tk+alt5aTTd/2YoliCCUahVo24Bw+u/MmR52srQTwppa6HErwUK?=
 =?us-ascii?Q?9VgAef3kCvWwk7aYGqEpyx0ppHj3RXnec18TOFKFcHrfGIS7MQ6APSFjmFHa?=
 =?us-ascii?Q?TQMdvxzhEFc4rOBS6jC0Qp1j451+E+qkeK0K3JznH7T6e17Zgrr01mq21ISO?=
 =?us-ascii?Q?cgcmIp+kS9kPVjcuId3kyIqVtSQD1J1V9QwsHGM1eKlni9Bl17WkhOKia6jb?=
 =?us-ascii?Q?jH6ICNH/mGoOgdNixqGqcXYOT6lUho8KhsIS75XV/6BsjO5dCayCQcYIM/mP?=
 =?us-ascii?Q?2arris0d5JXeY7X22ACHk9S00RjgEVmYwNfh6XhokdpGpMWL/1cGu4J3ygGe?=
 =?us-ascii?Q?Dk8CoKArZxclNB+PHO/BWQYraGD57QT1p9uHYl5LWfFsBzzbvAsSwiVdNlrC?=
 =?us-ascii?Q?4EpUv1f0EtHMneD8Vq/00hJQgQ0i0iCdyS/RwVfxy5RG3rKwMx5MYUEtr4hy?=
 =?us-ascii?Q?ZCPZqmzDHpbGFY5N7P+lePo6OAVnYJ2T58lN0SAikd+SAYtHl+OrUU/zTbBl?=
 =?us-ascii?Q?asvvhiNXa3fffcDxk9wJkeKXwIw8+fhbz4Jh8Cb1pOmNPi0HY9mkUP8ELfYg?=
 =?us-ascii?Q?88tEFEh+bCIdlQsBs4+ZoF+dux7MI5EHFitsMpsxhMOOxjxSTS5bXu9iblV+?=
 =?us-ascii?Q?N1E+NCalkaiV2ukFT4SI0yO2VsS/uYn+wVzdRzJxl5UWldGvKZE3GomogT73?=
 =?us-ascii?Q?nYLEEhwEods47HeJgA0SFUKC15m547iA3mB5N3XVok+ZvCWe4djWu5QCiWkK?=
 =?us-ascii?Q?iO6S/ETambBCSvFUm/qqTtYdVaqZ/SLihjgSKznwCNMjz2HCT1EfLR/rvsrC?=
 =?us-ascii?Q?qCwx5u+QvFyfkvxJXyDOGG5PiKrGffxPfu0EROm/yXYJayJY+r3tAQxkpbL6?=
 =?us-ascii?Q?pXKbbEuCEkp0F6Aexe2R01L5V1JBJe6iYyNvfvPCh9WY89RKZCe/Hb1iT/0u?=
 =?us-ascii?Q?SxYXNAP0mrg66hMZ37VhvnFTDgfrejxsZTZ3/NzGY1rtzIrXtgBBu88V1A9R?=
 =?us-ascii?Q?1PUuEbvMpdgeTSKjmCxUqml+rwFGCkmEN0++FeLl34BQ2Cs+uFMiav7poXXr?=
 =?us-ascii?Q?XvtaVdUwENFXqnLWbszR2PcYcjqwAwnKdxg8a8D8AIopoio+I7mTcOt/JPz6?=
 =?us-ascii?Q?Ywi8w/EiFsZQrxUz0EIAVLBqCziz2oU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43fb6ee-40f8-429a-8207-08deba4d6825
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:04:35.9189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jo5S1f/gZoUXWKbEblHAEfnMnzcDBlBaPApU2kN/Jv1IUagONtMApNYUFi+Fn6AB2aeloYQEx9mGP9IHngPBWX8bG8uLwBjiCHVDfTkgPzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33078-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9D4E75C998A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Acquire the per-SSI reset controller and pass it through
rsnd_mod_init() so it is wired into the rsnd_mod->rstc plumbing.

The RZ/G3E SoC exposes one reset line per SSI instance. Use the
indexed-name rsnd_devm_reset_control_get_optional_indexed() helper
so the same code accepts both the hyphenated RZ/G3E names
("ssi-0", "ssi-1", ...) and the legacy dotted names used by R-Car
("ssi.0", ...).

The helper returns NULL when no reset is described in DT, leaving
existing R-Car generations unaffected.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: No changes

v6:
 - Acquire the per-SSI reset through the new
   rsnd_devm_reset_control_get_optional_indexed() helper from
   patch 04/16, so the same code accepts both the hyphenated
   RZ/G3E names ("ssi-0") and the legacy dotted names ("ssi.0").
 - Rewrite the commit message accordingly.

v5: No changes

v4:
 - Clarify in commit message that PIO mode remains available on
   R-Car Gen2/Gen3/Gen4 platforms.

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/ssi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index cf98cc9ee44c..e6734671328c 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1157,6 +1157,7 @@ int __rsnd_ssi_is_pin_sharing(struct rsnd_mod *mod)
 
 int rsnd_ssi_probe(struct rsnd_priv *priv)
 {
+	struct reset_control *rstc;
 	struct device_node *node;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_mod_ops *ops;
@@ -1202,6 +1203,17 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			goto rsnd_ssi_probe_done;
 		}
 
+		/*
+		 * RZ/G3E uses per-SSI reset controllers.
+		 * R-Car platforms typically don't have SSI reset controls.
+		 */
+		rstc = rsnd_devm_reset_control_get_optional_indexed(dev,
+								    SSI_NAME, i);
+		if (IS_ERR(rstc)) {
+			ret = PTR_ERR(rstc);
+			goto rsnd_ssi_probe_done;
+		}
+
 		if (of_property_read_bool(np, "shared-pin"))
 			rsnd_flags_set(ssi, RSND_SSI_CLK_PIN_SHARE);
 
@@ -1220,7 +1232,7 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			ops = &rsnd_ssi_dma_ops;
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssi), ops, clk,
-				    NULL, RSND_MOD_SSI, i);
+				    rstc, RSND_MOD_SSI, i);
 		if (ret)
 			goto rsnd_ssi_probe_done;
 
-- 
2.25.1


