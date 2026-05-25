Return-Path: <linux-renesas-soc+bounces-33083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O2TOYAtFGpYKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:07:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 806CC5C9A6C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 922573044953
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE6737CD46;
	Mon, 25 May 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bl+CdU/X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3124437DE80;
	Mon, 25 May 2026 11:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707113; cv=fail; b=ZxMztb1S8zpWq63ObenUc56Po2oT+yVU/OQZ7MUwseXidd8t/CcU3wFpTP7Yv9Z5of3948ZzSQTG+5w1XgeRSMdHR5flbQEtdfmix9AGq7A3QKAkxUGJEPA88+vbwZrhk5kxd3/1pdsq0ELgZY0XtT9YSdVV0PXWMCTP2BABXho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707113; c=relaxed/simple;
	bh=nGTn+j750oPGYzgB4vPLgpZNQgYRB9LXMHTc4AN+VdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HCce9jJU0dqzsgXkYFPMj3I/CS+wxgt89j3LP1hTNCsM3rlpl38crLQ22ZxtSVKarrPEkpxjGFbZW3tk33qgeEMWFhVu3N54jB5rDObhWVtgvq/CzSEKhtgq5cFPv8dehHle0XtzS3AFeplFGD2gWEX4s/7+f0JEdDkxEj7uJhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bl+CdU/X; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1PBH6G3th99LbDPjNQksx55o/cAUljY4tpfXA0LmK1lFAq8R9OKSi1sLNyC2Jo/fWuDRq3LMi0kB4lZmk4hyf4/GjmKenJ2PCDvUdi8iYrJKiCJwirNAqRGnZedNoLqHSRhRc83tGz8JJwwgi80i2/pWXie/no8r9rhf4fKplk5kJJjwIsd3atGLYl3wEctTmdKS7nmMvqpiJVRbShr/EZqaFIs54xaqL0HJBLY3HrLyszWntdIr/ciDP8dl4gzKFjbEEi9qLznqt/NgRWbOtywZTe0Kfdn2ndyQA7DF3IZggocXpNdNeGfHykuin5TiP+VwiOmCr427FeUUM2jKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjnS3kX+6f+c3odQped6cbSmF01RzjNIqTPsquqhtAw=;
 b=UfEH1E7SIIwsEG/qLMLHkr8zcuGgPFWqzOzFzT5vU24VYGSaGcdNjDZ9hPbjBNbvjQIWNDvclvlBfeRwaHbLUSBKxA/S5gngac8GrGV0IiXklLEd/wNRteu2FDhXSbTOIwSYtRHzLvUaYjdDW10UWVM1C3chRyr/oTsdiI3h513cfk7aTvRSZ/DZ4DoBgKoABNgg9sQGifzyi3P+JafN9RJUTt7yJ0lyzz3NBZ166jgl4FyBhOk56qjtt2iBeS7K9lI1Juy6dcUGPNlVIpZy4+AIFtv2ei71qncyCuz37mnADYCWz/+RrBmZQKsJPn5CP5HUd+KRsBU6gmlyNf+kFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjnS3kX+6f+c3odQped6cbSmF01RzjNIqTPsquqhtAw=;
 b=bl+CdU/XAyCgFbQCBZwOeRbGSE/PQf8Ak61vQKTgCLnFsUM0grG+Vqd6/Pgp6+rnNW+g+m0NsMHTg1uNov4LaOiRTQ+ykgt8ZiJ5/7NhKtDzVvGMv2MyvFeCCVX0WxAbXeLnRnU3TrAYHrp4tWA15364LwiioiGvpl4AYqssAww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:05:08 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:05:07 +0000
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
Subject: [PATCH v7 16/18] ASoC: rsnd: src: Add SRC reset support for RZ/G3E
Date: Mon, 25 May 2026 11:02:28 +0000
Message-Id: <20260525110230.4014435-17-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: e2ede505-20b2-4b8b-0037-08deba4d7b3c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EmjrEn26lamZ8OUmLeKV5KRXzVwRj1WZMlkg95QRWvTmYJZ3e+Ff4Kq8kwkUplcDXt7ybDPZh8ow0SF844Ne/okZh5yEcWqkRXgjtir9oY2+g+xOyJB7py6PSavCRhPiU7kTNylVdIDWNrP8f9po5vwqIFhTCyoHgPtbGb4MEtEvE+cBjrl7z0DhkMKe3Db1JVwSjyjul8/tWbXzyaizdVpC/vrcLyLWFFn/FXfLX2Jj2Ey1GeWLhNEFQ2eD2lutVw60BHKXHMTeZW++Pkm1EF1RFcGZGcVMpiqFyYvER3w5Z+63OB5NfviwUZm1dLbNxU35ehauvxZ7o8aMmbIZIMzdrNxFfrWnkpdfMZEoAuM1NvFJ34VHDnvRJjxtasik43eVIIIA/BpFRGMZe4eXPcbvabCDfDzKT0OtuNk86gcn6GWEsV+vrW70lFVA1tFA7bPh6QsH/WixRa8Ssz9/ry9RBNVv3KUrDEGhKylzaSDYRF1+nlxIgAIyTnWHC8Q0nagS7X9kkge5PROfvMgx5nIGwIrD5fxjp9ShgLNmBO4sPOqxEPy49uS5XGooZseeg8PMnkNF+a84mryixuw++3mYoHlGPebVD0Q8OqiUIxaZ5jUSl4DVWtvXJBxCCxlIRaIjX02q5xMl3LUt0VK2ENFiFjhCN/dEdNKHh4usmni89bpF1z7RCafcJ65wWyc7MVkSRN0ZqqerJRRlHiaHH7PCgMaJXpJe1GmheFtoUlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(6133799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?31laDCbV8sS+VzdmnTi/9r9zCb3mMhlsuexUcvQoE61aVyiUtPaboIrscCWX?=
 =?us-ascii?Q?Y4nlTomxIS2Tczcwqe9ROEUftH5I6X8rwi/y0oPWuoDO/Ofcft+5L7cektzt?=
 =?us-ascii?Q?mFB+el9G6WtR8QhoMU7NmbfOTmMk2bvnKtRhRuXk8e0jvXsTQNERAU5KioMB?=
 =?us-ascii?Q?aoR+sVVADJO5Gak6Jo2dcSmvpZQQ2bCenVQTO4FgA4H6zd3f9BRCzDxtVIco?=
 =?us-ascii?Q?zgn3+ko+Xtk3Tcm1/z/q0k7mldn7jtQJbPO6z2u/CqvRhCj6fgMs7/3ccJ5D?=
 =?us-ascii?Q?JoMTgitGz8GtaifMf/kSM9TiozO1qAt+JpHelq6ODWqO44LNiq7lSFZQyBSC?=
 =?us-ascii?Q?95/Fkf93JfiSQQOARaeHvhfiSIIvkqf/ZATb8fhgj9Ouf0XN/b96vK2u9lln?=
 =?us-ascii?Q?GrYTQduBDwPQ8O7xm2DaBK/GQL4oxRjdRocT7F3/rSZxLZ2fnRZRwHPt5kdU?=
 =?us-ascii?Q?7k8RpJAtx8TaXDOwSc1OoxNqgmY3Fcj9zn93S6QAswW7QSrvw8UPZGHhjzsz?=
 =?us-ascii?Q?aPhkfho471PTQzZbGt6j2vwc69493qGtI5DT+Rj69V9xNCQUGCmMsM8S5WoW?=
 =?us-ascii?Q?GDaJAL8RJ/7POcG86TiOMpQS8weib+1OfJ/QXT4EZSKY8CcKufouCQCKwD1c?=
 =?us-ascii?Q?NkEjQO7Z/2a4NF3i4EmbfE48agOVAzGGVgtBUBMT1H8sdnkHz8G+c8HRi8/c?=
 =?us-ascii?Q?iJDbg32qfSTzDGWIC0zW4VYhq/O7tf9Gb9lGAIiWPREaIARcKSs1pBL6Iczk?=
 =?us-ascii?Q?2EChszSJtC06Cx4ylSoLK8r47WgI8ByYgj8ChtK3TbVEu6nwh5yNIJLL9ilY?=
 =?us-ascii?Q?zB53WWtg7/L1WIAvZXf47CQnCqHSC/uHCsoPT75RkeqplzCSNfuPqahpt8uG?=
 =?us-ascii?Q?V3CyaIS3pAkhG6i+PBQvBUad910v2t16hHDGrKdbrzkV97Bi4Z2fic4p6bLo?=
 =?us-ascii?Q?9BwlnHtlwjNJ1ntb5qpBRcLdesVR/o/Nhc78z8JmCnXVAMuSufomsp+T417g?=
 =?us-ascii?Q?eY1m1WWQTXTDfYFtLMqATsSuHF2x21GzQJkfPbA9snxDKzsgyvmt1uJFAkER?=
 =?us-ascii?Q?4NACInfzISbnWP89pEweTiUVtL2JKzwFegc78njhyzAgJpbPSeYh/8n7564g?=
 =?us-ascii?Q?8uE4PQR8vE5a0piXxIlDD1tU4uOSnUC08eCrKhSkOXRqePx02SE3NRaGCc4+?=
 =?us-ascii?Q?ZV92Ilxt35lYup7jsqnHlAHIjOqNXysTk+Lp9mCdiRrPJoV1/swXbMHJFjFF?=
 =?us-ascii?Q?61LLm31n1vb+iqjcUQLOrjGpoz5Yo3VsRlKd8QaMvGMKTebr3jgAOlzDSdGL?=
 =?us-ascii?Q?ZW+Dye92lZJYhSR2w3G1SKD+ytVOU6aqZY+vs4XdaMZMMi7PrRowAgnQzDtF?=
 =?us-ascii?Q?jNlU6zaA0NwNbIM5qYYB7mwfIb62tAM605FwWV0J0ohimW1z+sygP0P04h8B?=
 =?us-ascii?Q?rq/c10QkHv2EhIUzgeyub79wavVaGKfuNRbBcveB/HkkaBW+kdk3QLyWT6bR?=
 =?us-ascii?Q?u6IbcAnrCCSLiDtaOE5kQ0J59lXG9RbvtijDj98fcAdGxDbo0/K5eM0WCxlO?=
 =?us-ascii?Q?Dv/936FDZi1l98bw8G0Ks3lE5LiCr64k6tzKNwAUj6e+9z6usdF5kPz04Muy?=
 =?us-ascii?Q?V0vN0jVViCnD63wj8fNcvCS61lbYT0M+ZYr6H+vKyDrGJMgeUwAvRG1ZONo1?=
 =?us-ascii?Q?QvdtNyEyCs87RZvZoN7TfaHGhOlAVHFaVGnOvqEWwlGMyZGXbmxyT9sRemhX?=
 =?us-ascii?Q?U0VB6VkpuGfCFS0pctJSlW+2/yP0oEs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ede505-20b2-4b8b-0037-08deba4d7b3c
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:05:07.8906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93MJiVTBAGWO9ZNa57eJwhIo2EhdMpiBOkbnqUnMDcVyUoBtvYHvtmOOvGDAQtc2N/IVuWgGl42eRMSv/z2CZ+08N8vV/lJHIdiTqbV7Gp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33083-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 806CC5C9A6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/G3E SoC exposes a shared SCU reset controller used by all SRC
modules. Acquire it once and pass it through per-instance's
rsnd_mod_init() so it is wired into the rsnd_mod->rstc plumbing.

devm_reset_control_get_optional_shared() returns NULL when no reset
is described in DT, leaving existing R-Car generations unaffected.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: New patch. Split out of [PATCH v6 14/16] "ASoC: rsnd: src: Add
    SRC reset and clock support for RZ/G3E" per Kuninori Morimoto's
    request. This patch carries only the shared "scu" reset
    acquisition and its rsnd_mod_init() plumbing.
 - Acquire the shared "scu" reset once, before the per-SRC probe
   loop, instead of inside it.

 sound/soc/renesas/rcar/src.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 88ea9aad5cae..cad15fcc37f2 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -720,6 +720,7 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 {
 	struct device_node *node;
 	struct device *dev = rsnd_priv_to_dev(priv);
+	struct reset_control *rstc;
 	struct rsnd_src_ctrl *src_ctrl;
 	struct rsnd_src *src;
 	struct clk *clk;
@@ -772,6 +773,16 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		goto rsnd_src_probe_done;
 	}
 
+	/*
+	 * Shared SCU reset for every SRC module; acquire once.
+	 * R-Car platforms typically don't have SRC reset controls.
+	 */
+	rstc = devm_reset_control_get_optional_shared(dev, "scu");
+	if (IS_ERR(rstc)) {
+		ret = PTR_ERR(rstc);
+		goto rsnd_src_probe_done;
+	}
+
 	i = 0;
 	for_each_child_of_node_scoped(node, np) {
 		if (!of_device_is_available(np))
@@ -798,7 +809,7 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(src),
-				    &rsnd_src_ops, clk, NULL, RSND_MOD_SRC, i);
+				    &rsnd_src_ops, clk, rstc, RSND_MOD_SRC, i);
 		if (ret)
 			goto rsnd_src_probe_done;
 
-- 
2.25.1


