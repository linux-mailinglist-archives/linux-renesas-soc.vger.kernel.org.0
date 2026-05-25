Return-Path: <linux-renesas-soc+bounces-33084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIJEIZctFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:08:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 193AD5C9A93
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E454B3047BEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56C137D11B;
	Mon, 25 May 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JGastcsf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5792C37CD4B;
	Mon, 25 May 2026 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707118; cv=fail; b=ACPMGMmDo4YY6Dx9Ami+hwSDPYw4HJQCZNICPnEUk6Aqfa21T+npcfJkyqEXcVQ9toHHlQPg2593WBYjSJAJY4Gv3n9lakb15reiRPcg5VikK0cKJHT5V3HaD1lrufMADWcexjtGpHvQ2s06jqFdwi74wwwTR2PPQWrQh7Ko4yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707118; c=relaxed/simple;
	bh=itFkZTxgxP0sTbsQd+itWJtXHAMOXK2kQZTNi9GbPBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nzze0tb8cgMLTi0Y9vyPWms+q/Zi+07PXChuZg+nTp7ttyEXDLFU+QDuAYbnR5f0XeNWLUxoZuGeWeeFpQIKzI196AWI41Qb7e0js2NLMSN9IwlYRsc3MUe9nwievZ/AT0oEKU9ABvwEbrc6HvYwymZbROPtnH7b6XtRgZ1TDgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JGastcsf; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUk3jQvXb8Vt8uf3xM7VHNjYyeikxV/i5CkwGLoeY8bK1VhW1NDqovYxapiJd1CNfGi9AIwIaR1+/bJB7ZolI4oqP6naBJe+3iDp35DHnrM+sjCU/zox3rvIwg+Xe3LdfNK1jBGsjgtF0r2dl+PNBSwjwuWLRWIkNc4NTCwGp1NmZL4sO1YcCL274UWrMHDdslRoEKRaJ+Td5zn+71PhgbDY09pOnsmUlR4uMQERzciK0d4KtZGlu4MDIb0sGYUBkfSn2/Aaie33RxpKj+2OZZYjCGIY9eTVQqJ2/zKHBB/BfR+De6H6a/XkqOlJL+Xi/kq2zbdFiUmTk7UTlOCGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LJksnLf1gFGDwNQsfqAwhyTi9WvCwz33gOutULRtlo=;
 b=nYilwIDEaMQ+tEM3fGlagc6K/JaKnSrUklIPIEgROLQkZvWVbVsGZWcecKx+rcwaaHJHzCGY1A5ri2j/yJx7elNtv0uF+yM85aZPHzaVMcaPJwtWJoBVmyRwvVi8A+sp37ApzwukoskCYNX8VcgTR5df0xNI3mSG00ZAQYvjllmpmzBwtdQOJJQOpRAJYJL4ts6T7KUbw1b171eve9IQpU5JZ9fpa04zk7it/G9fnohAnVS3Lk9yLFnh2M9oeNU4q05qqswnvBmHVzcmLHcq/H4p0khknLhmpHEsLnRUfcomp/zGKXY+u18sM5MoDj40FNEUO0KTy08iWOzG6oj9UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LJksnLf1gFGDwNQsfqAwhyTi9WvCwz33gOutULRtlo=;
 b=JGastcsfGBUV/9jVG5Iv/GzANckIGebc5sSexP/jedS8DKVMqXOFH8LHm4t7cjPq+hsVy5DxfK44aU8bys2TEug0dAAdpCDcrZwSwQMGwjsbh+fv65wACutRo8NfQ1ysFr4ZsTEafv/mqcKIlikWOEY6fbpmPng2p1LTcL47200=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:05:14 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:05:14 +0000
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
Subject: [PATCH v7 17/18] ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
Date: Mon, 25 May 2026 11:02:29 +0000
Message-Id: <20260525110230.4014435-18-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 69f3450c-b3a2-4cf6-640d-08deba4d7ef4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/71g56lbR+YaNPTb6STNHll8IDgffU4GZHLYTPrL+/0txpG9RWT2yUOvTHjap34HtkvZKtthPFMY31rikZdOifDkWC8dM23voEtSczB3nuVgxumJi4wHeKTkXP3I8VXy3ppzwHp+lXZTnWnuWxeCvXWzgvSSx0w+4CaD08Z2i0rSNoMjK2NNzswoFpyt5RcMIFeHBE9kdr+8ADofphnnmjpduNQXEkmiszrrBlvl0tbK0EwtRM3+G8XL29w6xAJGkzpPaHa/g0AvC3jHn768iNAq+FdOMxMXBIKMfGH944WFqwq0NJ7sx8R0QjEKFiqKOsAMApSPPHFW0p79v4xKF1PAopNhjqroopfoSuf29UWTfu3o585xcEoWHcoDPvfdG79oxLklRzE8e4E5ZuqRo1QraCiM+jT+WxUhbyYH5b1erVZDfroh6jsAmuxNwvMXy8XPCazxiuE4nkECGXETf32u8214UmWn0AGDx2dW49GIPTUlfylDtRq4lIROjavrsnyCdY/YvRIC0+YEqp7BW7QdmsuKbqB0E5F3VNFSBHfCV1hRrS6YlIUe1lpbiyWOjGVO/hCJPOIYys9fdlpd35KZpqHyfQbc9d9ndKVGwfl8+VeQcnaYm0dH0bbC29XXT88sXhocTU1o57QlOGHZjsUQfbKfvTg87EcBz3JJDG+XkErwPgjCpjGOBeHxaNK5ZBLcf7EMjq8flWpJ283y7SO9fi5obZ5EfpGISLj0rWDjmg25nv0jHUI40ChCYa5K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9dwdk8XYx8X2ZeZRArzNcugs6Pq0jVO/s7/2CgTVCzEk3QQehy6cngsILU1s?=
 =?us-ascii?Q?XvHewYhSFEZmX91UjUzu2mhmp29f4pnl9XQ+N5uDHU1lPV1eG7vHrEvvQi+i?=
 =?us-ascii?Q?YP7PJ5aPr9Mu0VnUCZzdQkkuC0MuUK4jCXs41JYIo+x6tGiUO9csYIAEgNCu?=
 =?us-ascii?Q?4y8Q+Qfhtyd1DhMKW11blWzgTxslaaOZCa/EsYcAegGKxsb1RcXxMvJYMLPl?=
 =?us-ascii?Q?F4fIflNwqHNqInLKpv/ByVLGVUvC+9TUZTTr2DOIKuFjLytE+7B2dI16D8Xs?=
 =?us-ascii?Q?39Ih4vLNkOxi8LtSprwIciWR/ABIxpfYq3otzyNEGhRTccHEyD9ceoVVLXgo?=
 =?us-ascii?Q?YgHV/dP+6hyc3W4lyTzAsnZ2e49HyzJkTnl0q+dRQWVeh8i2Bn3OGiMh9wmc?=
 =?us-ascii?Q?x9e6FDRu60G646GQRQocfRstkiOXQFYirFwKef32TPz/BmL42QZDu4XdygQK?=
 =?us-ascii?Q?0U9Ccq9eQHdte5/8DIFhODbJm/UAMNKlIAQ7vWLtjOuidJEVlfjsx7qo9TIt?=
 =?us-ascii?Q?rru+03S3sh14TWSOjxgX07UQg7p67NJEoYKC4U4PPLzPJIOhslPYjCeCAUMV?=
 =?us-ascii?Q?Urw97Mora6R0tqhv45QxSV4pM/GVOiIKDCQkB241eZa7wWIHsB4y47F9Kl4x?=
 =?us-ascii?Q?LZ2uFFb1EG+C+SMEyXLEmZVtS1H4D33KSfg2gKIfJqZd8vwO0V1Sr6EpAfP6?=
 =?us-ascii?Q?CuPS7u9VXW+QbNWIKEH8lqhNs9/RdFJUYMY7TLmmNAQ7pbPuwDeWug1l98k8?=
 =?us-ascii?Q?Cl2LTeMOWOvy8/k4JFjyML1SkxG0Yd+jwNLQIQfAw121XFAQF+XEQRMEfnhg?=
 =?us-ascii?Q?RW2VigCmChiE0padUmPa6pRr3cjrNuo6sJ/B8jof9BGqfyxx2JvsAuA8skRq?=
 =?us-ascii?Q?U7mKGSFTtpOUDIOGAXI3N4TJKjwsvT+5x6leEn5HAnbuMSeEVwX6ckpOHYdJ?=
 =?us-ascii?Q?xYdqI57TuZnRHWcmSfuyz34l8UmhjL6EQc10S0Okqn4+Eq0JjqpSmR4znHBI?=
 =?us-ascii?Q?kRbLRQrGRaUh09N7/GgHkGWk65/EmUdo/gH1eRGpqy9NFnidczE/JUlVXzkr?=
 =?us-ascii?Q?X5EmRY+e7FGbts58+4U+cLfD0XilepOingiKOvfJ3lzzUxm1dDejSZ8qnBdZ?=
 =?us-ascii?Q?ks0uRQ7FpYJeQt3OBvClnveyABTqALcUBUXCQiCBLjjQp0w+X5j+LjeCj7aK?=
 =?us-ascii?Q?HVILOFMDNLp9RQnQBaQlxUwOQ2icGDYC6D64N+XkLuCe+IXrCEqq8ohEHwLn?=
 =?us-ascii?Q?GJatDE83UZqX5t/7iJAl7FV3YIlCa55kPNZNIjdZw9SDwk1TNX8wSdZ8lAGo?=
 =?us-ascii?Q?Gtkj6VTBab/8SRu47SNFyju9i61JDgF0UhFTu8EhUwO0+dsjX1e1zx+j+DtY?=
 =?us-ascii?Q?p5oxuy6Ggs28fRfJFn/6gwl6+YUltqq/6EzVkSh0PX8rSKv694nrQUeZ0hq2?=
 =?us-ascii?Q?THGUEjpo2YKM0bBm5a9HryjVklA85svB+0zLqw6LBwxVZpKQLCMrX8iN4p9Z?=
 =?us-ascii?Q?E8L2WBi21+s8oJ/0WbEN7kgLWVgqZWZsGY5J4nJRQs4i4wLq2M2Rp4EmFFVN?=
 =?us-ascii?Q?crRsXPQz8HG/1dkKwOa9v6hlme9E7BxilROwtRkqcbzNhXOBRrkL1TTVRsHk?=
 =?us-ascii?Q?oKbDt2D/E6YTa8ytxGz+XLUs6y4ellrRJeR9bt7alFsH3zjpFoLdK6qcTMZ+?=
 =?us-ascii?Q?bBPGYXXkl3+3c/y+kvYw2x6es2ms7h46xNsNphOE1tusOvIkx9ElbpcRsFVi?=
 =?us-ascii?Q?Xk309M/MFCmiQVUMYnQiobqrLG5fiF8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f3450c-b3a2-4cf6-640d-08deba4d7ef4
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:05:14.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olKbb4tj6afcmTD0VzJdnv5tJftJ82bD0Ske8Iqnbenmta2weBnKOcr5l4GzhcEuF6YixHtKYFGCpHssQfvgXOP7euq9k6Jll7sA6BLtEkM=
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
	TAGGED_FROM(0.00)[bounces-33084-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 193AD5C9A93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/G3E device tree binding uses standard unprefixed node names
("ssi", "ssiu", "src", "dvc", "mix", "ctu") instead of the legacy
"rcar_sound," prefixed names used by R-Car bindings.

Convert rsnd_parse_of_node() from a macro into a function that tries
the legacy prefixed name first, then falls back to the unprefixed name
by stripping the "rcar_sound," prefix. This makes the driver work
transparently with both old and new bindings.

While at it, update the related comments in dma.c, ssi.c and ssiu.c
that reference the hardcoded "rcar_sound,ssiu" / "rcar_sound,ssi"
names to note that the driver now accepts both the prefixed and the
unprefixed forms.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: No changes

v6:
 - Factor the "rcar_sound," prefix-strip into a small static
   helper rsnd_node_name_strip_prefix() and call it from
   rsnd_parse_of_node(), so the convention is in one place.
 - Drop the of_node_name_eq() "dai" fallback that v5 added to
   rsnd_dai_of_node() and rsnd_dai_probe(); not needed once
   rsnd_parse_of_node() handles both forms uniformly.

v5: New patch.

 sound/soc/renesas/rcar/core.c | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/renesas/rcar/dma.c  |  8 ++++----
 sound/soc/renesas/rcar/rsnd.h |  4 ++--
 sound/soc/renesas/rcar/ssi.c  |  8 ++++----
 sound/soc/renesas/rcar/ssiu.c |  8 ++++----
 5 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index f5c8ba8c5d56..fbf7f7236460 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1301,6 +1301,40 @@ rsnd_devm_reset_control_get_optional_indexed(struct device *dev,
 	return devm_reset_control_get_optional(dev, name);
 }
 
+/*
+ * Strip the "rcar_sound," prefix from a legacy node name.
+ *
+ * The RZ/G3E binding uses unprefixed sub-node names (e.g. "ssi",
+ * "ssiu") while earlier R-Car bindings use the legacy "rcar_sound,*"
+ * form. This helper returns the unprefixed portion (the part after
+ * the comma) or NULL if there is no prefix.
+ *
+ * Centralising the convention here keeps every call site consistent.
+ */
+static const char *rsnd_node_name_strip_prefix(const char *name)
+{
+	const char *comma = strchr(name, ',');
+
+	return comma ? comma + 1 : NULL;
+}
+
+struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name)
+{
+	struct device_node *np = rsnd_priv_to_dev(priv)->of_node;
+	struct device_node *node;
+	const char *unprefixed;
+
+	node = of_get_child_by_name(np, name);
+	if (node)
+		return node;
+
+	unprefixed = rsnd_node_name_strip_prefix(name);
+	if (unprefixed)
+		node = of_get_child_by_name(np, unprefixed);
+
+	return node;
+}
+
 static struct device_node*
 	rsnd_pick_endpoint_node_for_ports(struct device_node *e_ports,
 					  struct device_node *e_port)
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 92974610ac15..537b71841f8e 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -794,11 +794,11 @@ static void rsnd_dma_of_path(struct rsnd_mod *this,
 	int nr, i, idx;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old version.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssiu_dma_req()
 	 *	rsnd_ssi_dma_req()
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 7d7da6cecf09..f38bd92d4faf 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -501,8 +501,8 @@ rsnd_devm_reset_control_get_optional_indexed(struct device *dev,
 /*
  * DT
  */
-#define rsnd_parse_of_node(priv, node)					\
-	of_get_child_by_name(rsnd_priv_to_dev(priv)->of_node, node)
+struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name);
+
 #define RSND_NODE_DAI	"rcar_sound,dai"
 #define RSND_NODE_SSI	"rcar_sound,ssi"
 #define RSND_NODE_SSIU	"rcar_sound,ssiu"
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index e6734671328c..007a7c91d470 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1009,11 +1009,11 @@ static struct dma_chan *rsnd_ssi_dma_req(struct rsnd_dai_stream *io,
 	char *name;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old version.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssiu_dma_req()
 	 *	rsnd_dma_of_path()
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 8d4ce9d35e9e..7d3d463c21bf 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -400,11 +400,11 @@ static struct dma_chan *rsnd_ssiu_dma_req(struct rsnd_dai_stream *io,
 	char *name;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old versions.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssi_dma_req()
 	 *	rsnd_dma_of_path()
-- 
2.25.1


