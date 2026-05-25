Return-Path: <linux-renesas-soc+bounces-33079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB4nMOUtFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:09:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDB15C9AF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E40DE305903D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCFC37D108;
	Mon, 25 May 2026 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="okjQi73Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580F437CD21;
	Mon, 25 May 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707091; cv=fail; b=XYBBofXgIWpFt7/wsemmr+TxXhdFfhzifD1nnoCgmVuzmIg0fwVs06PSFXWBE6vx+1LTB5pRRfaX/LTDQie5C5+FsryEsqvViGLMxPYsv3wOEh1wkquQXZxLfaZurUmd4o0zkbDk/wZA4JYZjaEd2XSCn3sjNI31AXIdjYhOvSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707091; c=relaxed/simple;
	bh=Fnc0Ve2ik51iVQeX+ktffbVEyGjUvYkFHTjcEDMWlMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AKSRIacQBgHD2eYqgZJBEbgQDpqWPpgXg6ZfsxJ8pTq7TCZ07aBi7Kp276U+Lz7JS4mzDKmRMS0yn7gA74M04LRYUrMKeS48cExk65kN7jTJ/WNTqda7Uil+OkB6t1CltkN7/TTepAylJx5CfHEGCqs7x51oqP1Si84t9Zy2T/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=okjQi73Q; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akWmjXQlW00MahO4yqBwvQAgS6pZAyS0gcCWKk0MGfsjhszh/oGOo02MMnGuVY7yWhWQXN6W99TG92yDlZjq56pDMW+XZQD34Rek7JwQwygqzskBF4CFRg3CQe4+mXDnWFG+junRh4ddsco1NRVMrARqkgHjAykjWMNDCifCo8luNuCgSEC3klCy1MZt5nrOKRwkAqvjS2XQkTVb7QeADk7LZcsg8oI+w/rVuAE+7hAhBt16U9LboXxMfv+HoaggU0S+/JaFJm44aUubH8C0jBvb2dyBP8JrrdacFpptBjy0jhI7gtfcynnVH2/3YAzhLiqKQQiEFyg7M2DVq3n2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf+iW926c/g9zUhCgEad/9UPC1XMxmkAix9BS5sQXfk=;
 b=ACSABMtq9PUd9q2p0MHapgBiT1LeGAxQca9rEDnUSjWinw0MnzwRqY2BS02e2MiI4gn9iwTSlW6rP19ElU0D4y3zh1qpLagvZurxpmJJumfDpqTCw9dkBYoqr3SZrTRj8yeYaStxB8o05bHp3+wLsPGKEA2gTkgkLGCByYBPAKH1cfcoLHMwWhcqNAZdnpa6ritUP0h353s+LLyjTEI3GG76fX3IfuX0aIyDM5VCy62lKytJibcrLQhQj6P+pEoGdxEDqDPl9KUHhb/uSOF4bJQJ53SaYxDYWg0m+lBvFQ9fpClqTf2HXU2+tlUXNirfwH2R60dBW1yEx1PMIsOssA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf+iW926c/g9zUhCgEad/9UPC1XMxmkAix9BS5sQXfk=;
 b=okjQi73QZO1iUgnzrTx1UsOJaqr7zDXVJPAj3PGgbARIbhoN23FdYDDvnOZxhv7+cssZZOEmL2C4cHI5AI9hYj8WDxZcuDgGzRKzHUsA+HkVDSFesWz7+Lytwse23LjRLZQeKvOqV6bQpoZ7rfQsuyxMiGog0u/kZ9QPpnaJCOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:04:42 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:04:42 +0000
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
Subject: [PATCH v7 12/18] ASoC: rsnd: Add ADG reset support for RZ/G3E
Date: Mon, 25 May 2026 11:02:24 +0000
Message-Id: <20260525110230.4014435-13-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6f5dad28-1910-467d-6f6a-08deba4d6c00
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pXMg4mNCQN+PJ5rPwodkBM6J99dLNG9nYUKxxkRbRYexIYj3HV9IAPJJEYpXrddLhAvEXNRWfSRHiF0x2oWxEuu1ARUB3mD29IPa44z9+d+IM83yMZEIaSPbSJBDlgaxkW1z6uMWvjyUCjfHkT0xsBscZTpvSGUTooqv+jI5LvK8OqNEda+zOFDE7mrUMTpxUOrlpoHq3blJcJqNbcYCJXAAD5436umfEI7fk7wFR+dgL4gq1UoobSJ71vciSWVmS9vZvQ2uL6yYEWxLryocDIO1PPRyuqQKO6YJ5NyeIe+lxopmses0gcuQ/TD32DJ9v0EY4cxn5iTN53t/J9vVGWIR7aTaMZNN3cI2821UEvV0ySsMPsrvpBe97iAiK+fhuysrgKbo9wf3IjZ0yWrabo5b90Nttk5JeiUgPh/EWpsGdIr/qwnC1gL+GNpAPRJfkvkbe0shbSCbs+7R67aFrilcPaGC1hAxha4laJ2x5UlHG2QkK2jfjFWg0Kc+Rd3uAZLfzmiFaOUBF5fYlsEiIViK/z3qBTyrWOb3M+B7DZRKeILLOEGp5+HTqfm2dTk9PY+YSZ9/GJewlh35KsiIc/aX1h/vOUmzMlSUuR/G0hC7pTB0FTT9VsfG5RUvh49Id+MaQdmpAqcj6vA8SCJSleZ6GtDZ9gyTKTGENWGdxHoduW1KBJH7GXi8Uj5EPsBf297L3Vea+oMHDl+4GvnFHlqBF5+VS2oStqsEUIkwCcGLDAkmohpmQFCg5XfwQ6QI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s5ETTmAcStV5LLsCknboG305K1EgKW+oKn6J8ifekTYUuyDzkd6e4ds+FbS9?=
 =?us-ascii?Q?1KdCtL/uiYdZqD3lRd0DCf0s5btxxallMMQQgmZngo2KA7GqTOnFO/D1gld2?=
 =?us-ascii?Q?foti/SLAVGf1aQ6Z/5Zz46GGCCZcAnXMUctjnlOuXx9EHuJTnG8aRzZm5Qpn?=
 =?us-ascii?Q?5rZTH/7NFdM0/wJcRYgnCcxWs+oHW/kAK9jntuImUtXjctkF72IgVxESlMVB?=
 =?us-ascii?Q?/GvuxJYol9S5Capa+9kga8PFP78+eNzq43Bi8iCwx2NUyWRfvzTRgtq2PDyN?=
 =?us-ascii?Q?nj7yn33lgFU9DoZoA6rElMUiibK9MOiq5epBIIqSNyjUqafyfwx8gTFM8gx9?=
 =?us-ascii?Q?2ZJGw0+5sNNiwqF+RoeAh5r/eIr1sa5OBnHo0y+LJGB/Oh/wpZaiScKfAyd9?=
 =?us-ascii?Q?m89Tsf/IFtdUDmTa1oUNtYzwtISIfGZ7jD7jbzL+kYvEpHchgv7i3KEXvvIX?=
 =?us-ascii?Q?HyAhhl1MjCjvyYmLZhoykcF9fX/xhOK7buYmHNRv4VF1qxfRdFjmU6qwTmXP?=
 =?us-ascii?Q?TTrQDxfp4aBlXnhIt5b98JQkyAVxtteW77Mfo3qmwbTmX54m5UxteeiHBrdc?=
 =?us-ascii?Q?nc5a+NA1EfLIKaZiR/KYdMIlu1vI+GI3UP3A3vKRTQzJxh+E92D7r4JmmceD?=
 =?us-ascii?Q?jkDsQmiwY0evVKGsUdehFsIQMTqcsl0huyVBZ/qC6zYWyqBkNINj/JIQmICY?=
 =?us-ascii?Q?pEGI2RjLJdSzs8E6wbBG5Lf+i4k19KWNQcDptAS/YR4hooz7oinajYQ0Rkh7?=
 =?us-ascii?Q?+snT3WWIK9sVC4tOC+YEX7OT8F/bs19itkiGe/NBKAKdy0Cr1ZXFTtHdedsl?=
 =?us-ascii?Q?DlbFhXxrLjGdbd328Wq/JbnFqf6GjjhvWw8JxZZH1/5jVL7PCmmJdg6QBWrK?=
 =?us-ascii?Q?Ij0IwHlLhLpJP2XkIklhBZ2bbQv7cSSGNzp7hXEXb0jnp7ceJkJfyOXfoOJ+?=
 =?us-ascii?Q?K43BlW5zaudq2SdFJC1UhXgC68rbFO9fGwnZ+EIVCNOd/hFxQRTInjQqViaa?=
 =?us-ascii?Q?k5F253yf+m+6JUiej7gN/z7QiUXLhskR0yVByg8IApUxylIhce740nZfE4yy?=
 =?us-ascii?Q?uUw4EL2B1JMr6ptYAS5DdwGcljCccMVcltu3uO+cEyaYcWUXaPImWzHjHogW?=
 =?us-ascii?Q?se+2mSZHs/QzV0v0rBq1F8Zxrb8cKSFxnA+hFCxU/Nw6UQzjH42Rg1Mx2GvT?=
 =?us-ascii?Q?PX8MZt3IUjgLUGvvL8LC7ZmG1RSMiM7vkiXUcjQIvqkVz4Y7Bl1VG817LXUC?=
 =?us-ascii?Q?JerXrJBfaKtMSAbLZ1AX5LkyG+3WpIT1rn8HOopqsorr1jgTcAHI+oROHROn?=
 =?us-ascii?Q?qJAJFJubcN0UmNGI+LaeKK4aGWDqNA0pZHq9lauFHzWFrMBloX+PC2LF6uM9?=
 =?us-ascii?Q?/7wIiKp5o/kDnYUzpiaNwN7M7UH74g1u2acezIqjjNbMJch6EEyxDQP4ylSL?=
 =?us-ascii?Q?/EVV+Ew1nM0r+icejgfVct4HWGwzHVQ64waOlUp6+mQnLKjQELDplFehbSEV?=
 =?us-ascii?Q?nPiLX4SZlAXh1jq/OfdULwiGN1HHnK1rNDRQ3hhMB+tBKh3D6TDEke5ZVCJj?=
 =?us-ascii?Q?pftlKMNFdrM3qU0VNrWv+y5ocRtZ8inAeWu0QuytWuhLUN7i7MkJyIT6OvVw?=
 =?us-ascii?Q?nm+a2AhazvX2pqGHHvu6yLD6P/rL1809w0PBRGX/10C4YqTiQ6Rac86U4err?=
 =?us-ascii?Q?xkrhP+lYKXjCummwRI6A6kjFyshzqt13fkOeidEyZ77oCdi3QUdl4aUV+FmL?=
 =?us-ascii?Q?tgZ36PvrrpwqNhsT0iGszUaFta9BVOw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5dad28-1910-467d-6f6a-08deba4d6c00
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:04:42.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOhvy/OTj91UhrNZ5mOaeIydsM5LOpwlbylAxeBe49OPTPSxvFWnPRzHPawSth3mXfcFR0eTd3OtS92dSvzOOFMO87E0Cs03Wb1CdmrWSVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
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
	TAGGED_FROM(0.00)[bounces-33079-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6DDB15C9AF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E requires the ADG reset line to be deasserted for the audio
subsystem to operate. The ADG module clock is already managed via
rsnd_adg_clk_enable/disable() through adg->adg, so no additional
clock handling is needed.

Add support for the optional "adg" reset control on Renesas RZ/G3E SoC.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: No changes

v6: No changes

v5: No changes

v4:
 - Collapse dev_err_probe() and rsnd_mod_init() calls to single
   lines.

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/adg.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 0105c60a144e..813ad5eabba6 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -771,6 +771,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 
 int rsnd_adg_probe(struct rsnd_priv *priv)
 {
+	struct reset_control *rstc;
 	struct rsnd_adg *adg;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	int ret;
@@ -779,8 +780,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (!adg)
 		return -ENOMEM;
 
-	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
-		      NULL, NULL, 0, 0);
+	rstc = devm_reset_control_get_optional_exclusive(dev, "adg");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get adg reset\n");
+
+	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops, NULL, rstc, 0, 0);
 	if (ret)
 		return ret;
 
-- 
2.25.1


