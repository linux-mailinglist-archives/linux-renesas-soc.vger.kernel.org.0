Return-Path: <linux-renesas-soc+bounces-33076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOA9G6QtFGpYKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:08:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E475C9AB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D6533025924
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F332937B017;
	Mon, 25 May 2026 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ncyv+LmL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D33112AD;
	Mon, 25 May 2026 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707067; cv=fail; b=twPcKTf4fTBIPDWJ5oZ8s7C8lZSI642DFLlJfbiC3qzSvYmaVvOT99Be8xrPRH8WO3LwraN075SbyKLeiuQd8rjLI3Z4L4+DO+0aTHFEG8yUPfkCuPeWGeWy9y5ZSBXgYypHsEpO5vRGAAj3HwtlLwQSshK3wlZPJF5M7cHcHGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707067; c=relaxed/simple;
	bh=RSYyks7dSWR85ngrikNV3ga1j7Hp/cdyFu9XwJfxgHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sdK+1KEWBjJAl72MAjRsJl7+DyuO8oUnHf+2wbqL2VIt4ASW34citcAbilWF9yF38+035I3QATU5uYmqtdUFwTCcBczvD99hzGkoi347lYoXS0esS6mfP0UdwUTr8STTbwvrS+81tFZRs/gwPYC8CjcqIx8nv74tCSxTVLUYVWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ncyv+LmL; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYe/LMCQh7fXa+XIcOMNtLg3Qus7h7iRGzdBv9ovyk57SMXsOKjlAJDReBsLRSoW1hjEkvDw+pKIc5lWu4ZSRYMz3vh8JiCuyAhvOlQngj0PK0HQ2MIOT/xXwe6h0Zr9a75GqOs2KChkjL9lNuDHgNjG+OXt1MYGY+8IRUO84Qy0NqDko2iEjlSc60YgdFjGgJV1uOL3DpdMbUVTOzudWnt33pm3LrEJeO9vKwyX1EeXzrJkZp2LIqmLx3K+KXzrn6xF9tXeTtZ3wcgWUuFFSkrVkwFNOcVYZjOz+x+wbzDb2ClmIZZAe4aBHhRehvWqaw3hwPDNi1HpzaRdxQ7tGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDlBOfia7SuiqenJ0zlGUBNgQIAxNaVGxIDHxilBrIA=;
 b=QwxqZOTpmM0w/JogY08pY+THqe08q7hYRq/kAG4LlD4mt2Dp7h0sGLXktIjPb1wxBQtuxgDOrZw8j4Vi//0ulJphSpwlY4UWeDqpPd6PJAwyfKGpeDbw4yhrKjEJMd7ovWNnxqCtMj9+SSiOlDqNUMm5mWN+4q8oJjNxfKu62ZjhmAlbVWjVOc7DPqCuToWTp+yFmi/OsZUGkYhKCrr8LxXS7e54GTua8vUkOzWtk1yM/cPibFqH3xA27OaF4hBMHoZRzMeg4g4qmeASGHvGs69B0p7n98oi5mz7G0FFSVUj4EdiTiT4gAntFvW8D2FWrgzNWngWMJ/ZDRaT/wiz1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDlBOfia7SuiqenJ0zlGUBNgQIAxNaVGxIDHxilBrIA=;
 b=ncyv+LmLEiFBcQVSdSRcrvzlwKWAdNI+5gNQ65JRJW5MzhcgPZXe6N1ZMFJP4/Hvg6HrXN4Fm/Vz6OK9XDpBtyLbLX0jR3d/wIANHd4limSoWI5xNAOnGNsZ6QlEn5SgCcKWdoOt6dVTlRy2/Z5k+s7sTrUG6ex1YIHVaMBcz1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:04:23 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:04:23 +0000
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
Subject: [PATCH v7 09/18] ASoC: rsnd: ssiu: Add shared SSI reset controller support
Date: Mon, 25 May 2026 11:02:21 +0000
Message-Id: <20260525110230.4014435-10-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 06906f11-a705-491b-b563-08deba4d6076
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x3aqaIzJne+GF6l3dHjGVoXUWv/RrXX48Df5vYGRpPofdC+8IFe7+QIWpgT70rmVT1jRF62woG7ll5Pgop0cz1QiQumyJYSqSFah0bTxbCfkEmFZr2YaHIsVSjx6kpB5svgIUqzERbF5k/FKTna7++KzlHMspIYJdZk2je/iGyYf4e7VnS/6cHBuDxWCQJWwscoWGIowj3YVOXyGfMYmnJRswZLL7mgj5PhFV6b8+Gpd6WmOJtxaGuWbMyuCa+1pEtd1P4bxls507XFQR4PKDSk+21mOBBONt/G7pI07DI5IRjH8iVAieL+Pif0iVapWZE+Ap/ZluNi+c5ntuwvfSSnG5XgCFJTN8scVmcOVzQtDv9NLgn6QeIZJ+diU1nuWVT8A/7D0xYuPLt3eUMO9c7YfdPkADXkoaIemU9lEfOeqYcSdlst8r0tKEIXDB81FX1sx6dHYL9K9K5IzJWWbD19Tko93cf5qbGdB9f7gQoAF8Mm8rdbdZfLpOoV8uP0Sry2jYD4Xc0TJs5LoNxptGFs0+3sjCbvfYSdDjXJnFa2iUV0WXATrHXIs7rAOEI7XPr602qpAAe9FpeBHL6RQofB+w7G/84Z1nWd3TYz61s9jNHbTagQo4Io5m8svK9Ho8+BZ8pzibwZJEXJGq5g0QcahI/DmIxpnSH0WVPPvS0v0vXSKGwwNarwtLPKwrBSNA/s5vu4+/Y/F83NjpKtrLt6FL+QLmwxsv3eK8UN1Z//IqknYiKQw1f0ie9Y6hd1g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(6133799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YOcLqSi9an4hOpeJSn/eB3Od6BcHxMywJwahCf5oIkHIocuWgTmrTSdjRvBo?=
 =?us-ascii?Q?U0HhSzJtFvS2GOqFMjiJ8odBflIIq5/9sLwMXx5kSLasRqP2TMmKO0aygi/d?=
 =?us-ascii?Q?TymR6jnYZpyMz/x1/Umn1w710p5EyAUyU+M/Npfb94bduodIB7o8DuLQLKqn?=
 =?us-ascii?Q?q4zggkhPZ3WCxQd4EzvEzLnLE7PFKS7+m+PqxQrQ2RJIafq6tRLZaoiz3Rga?=
 =?us-ascii?Q?4JlL3YnAIkd8+D4Xpc9uVyTx4ZnXrzbg569kf1s4YhkDcnt2mbLO43fsu1g5?=
 =?us-ascii?Q?8iQXb/Ir1UzKJDRR1zHfiOqv2/p98zBoBZtZellNnX8QyHyVBPXey+GxMxpQ?=
 =?us-ascii?Q?cJ9ghT6+zAreqrPaieub6lpYLXzWBc9Ftvd1i6hR2NUsTkHLFtj3MxB3V0kr?=
 =?us-ascii?Q?FrVPVZSZbC5Nw8PCve7q3zZsIC0KuTqoYLHGXjHpMrN7XmlehlSvdG2itBOV?=
 =?us-ascii?Q?HyQ4npR1ti0D2qyQwbS435419dzRQsTs8ls6bCitzfLOf08WVDasX7EFDcur?=
 =?us-ascii?Q?whVYxVUhphDiZyS6H94jTsrDXw2soHGkx5+3kutydB7DqsV8hsu5bUfPdKgk?=
 =?us-ascii?Q?xuGk2UUuaI1ioNLEFgR5X2gyNlBy0avCb51PmadfscPSfGYo3P6TNC6+Dxw1?=
 =?us-ascii?Q?tBeD3iW3he8Fa3vw6uwzyBerY8C0rnraAlHKPHeHpm3MPy8yIUrvFWA/OGaz?=
 =?us-ascii?Q?kA5VnzObX4Nap4XaHBC6bXiLlaUAHUypTcn9l/T/de+CgEfJx0ipooVZP7H5?=
 =?us-ascii?Q?Vvbhr/2J5J5x+V7moxHhZDhOOUJIXpMtQ4jfWwc4rdh/ZzioSTHgLSMcgP6D?=
 =?us-ascii?Q?LTk0iEAhhuz1qEKEf1nOWbEN5G/Uk+If79UifkPYwraWq0+PqFyZibsJvOk4?=
 =?us-ascii?Q?C60XSdojrwCBbbKUFL0l5abKJWe2n/OIhSHhbHBDYATy+uAo9WaZvYPlGNBw?=
 =?us-ascii?Q?D89bp0qDFpdzInSIKsYpihsTHqIGwO7OkYm0XXEmikrAJYd8Em3TGGI6gkYV?=
 =?us-ascii?Q?FKjaXEYCWwdAKzVwIj86qZvPV0OmniQDZ278Zu+9L3ptNePAfo8USgOa5uQ6?=
 =?us-ascii?Q?z0jS8Z2wocTa2peaWqKsA8wat7D+1fEWDyjH7D1jcm0V4yr2QAdI6IYVDsrk?=
 =?us-ascii?Q?Hr2nDGktRhxMVK85WR3LVa8u2tFzY5ERitXHMuZ5o2w2BOxKSt96a0l9nokp?=
 =?us-ascii?Q?zXPXntZVLguoRFe3+iplmSvh9X8lfTwaArUabysQXODTVEwtuWsvxe9Z3Npb?=
 =?us-ascii?Q?ki37/FWJlslZq5ZBgrdpi/KU+4DECrnSJEmG85tuBxbLA0X9biaUzHdKzxeH?=
 =?us-ascii?Q?1w+IIBMlUvYULBPzZThk42c/JtwDJscNVMkQqptXlEGVjNfmPv1H90kPhBLI?=
 =?us-ascii?Q?ETwkJ3j4xcrs4EiMcb+ajqlGQ4Q/adY18EHqsQJ/3oZBXsAiDhXz3rWPz2tF?=
 =?us-ascii?Q?KfkTyAsR9/1N5hiZe7mH3nRA7pOROPPxWjhz3INoep8mVhVSzdfo2S0n4FUa?=
 =?us-ascii?Q?WgISBs4ihb3TDlMueLNNCLwtp93pOrdYJbYHTMfmrgdcfX8CZBh5g796KOS9?=
 =?us-ascii?Q?9YlMeHGPtc8/6EmJOmd0VXJFSayFO3ETqGgZsvAEWBY8cL8Wsuwa6HBi4jO5?=
 =?us-ascii?Q?yCOg2yF8Wi3T2cpMrgf2/W3KZlpD9rzdWU5cvOETOKuQ4oUEiTLzJAF7NieK?=
 =?us-ascii?Q?42gk7baAPHSjgQ22UE8tx7ybGl/Y6mYVFz7zYqouRhMOUXEXYuGMZhD6eZf+?=
 =?us-ascii?Q?6KL3gI42v9U2fTZ/2/jD+JZFPB0EQSk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06906f11-a705-491b-b563-08deba4d6076
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:04:22.9800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLt2uAlIzT9wcb+nBJiQj9SkH+p57Wdp5LlFJmHOImBUBt8S1RV/KwMJHfaPFRxxt74Lwz+/ubRfOEVUVJyqBpIh150Yc6NRHTFNPIQ8n64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33076-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B2E475C9AB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/G3E SoC exposes a single shared "ssi-all" reset that gates all
SSI/SSIU modules. Acquire it at SSIU probe and pass it through
rsnd_mod_init() so it is wired into the rsnd_mod->rstc plumbing.

devm_reset_control_get_optional_shared() returns NULL when no reset is
described in DT, leaving existing R-Car generations unaffected.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: New patch. Split out of [PATCH v6 09/16] "ASoC: rsnd: ssui: Add
    RZ/G3E SSIU BUSIF support" per Kuninori Morimoto's request that
    the reset, the BUSIF layout and busif_status_count be separate
    changes. This patch carries only the shared "ssi-all" reset
    acquisition in rsnd_ssiu_probe() and its rsnd_mod_init()
    plumbing; it is a no-op for non-RZ/G3E DTs.

 sound/soc/renesas/rcar/ssiu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 0cfa84fe5ea8..2b922ead62d0 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -510,6 +510,7 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *node __free(device_node) = rsnd_ssiu_of_node(priv);
+	struct reset_control *rstc;
 	struct rsnd_ssiu *ssiu;
 	struct rsnd_mod_ops *ops;
 	const int *list = NULL;
@@ -564,6 +565,12 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		}
 	}
 
+	/* Acquire shared reset once for all SSIU modules */
+	rstc = devm_reset_control_get_optional_shared(dev, "ssi-all");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc),
+				     "failed to get ssi-all reset\n");
+
 	for_each_rsnd_ssiu(ssiu, priv, i) {
 		int ret;
 
@@ -586,7 +593,7 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssiu),
-				    ops, NULL, NULL, RSND_MOD_SSIU, i);
+				    ops, NULL, rstc, RSND_MOD_SSIU, i);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1


