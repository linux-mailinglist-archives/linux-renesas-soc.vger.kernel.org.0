Return-Path: <linux-renesas-soc+bounces-30991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IONyFvgx1mnqBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:46:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFCA3BAE2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F32EC30FEB74
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF16C3BADA0;
	Wed,  8 Apr 2026 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LD4PTwKo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AC53B8928;
	Wed,  8 Apr 2026 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644818; cv=fail; b=dv7xo7wbexxO5G0l8QaWJDEMZnwQ/hvzDWZQN4dehITxKu+84bUFYys1w8DR8sSpNKyKKSsvR/yUtVGuj2YahhgFac6jR0rRh/wbOWMfNsaKVJ8yAzON+rnSWU7RyOKm6zlJd+N2TPv4R8ZI2MJmisRT9PuJdv6+jECov6vs/bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644818; c=relaxed/simple;
	bh=OWGnTB+LIE2isHduDVCOXKh3ekSgZIsrB90w1nT7LO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oaRI8aGIiuDgtGBEnbBk3KyO8eVuIk6/HXjQa39EhdWyzww++/1sUHrrwjdZqj+tg62llSzmMf3qRGKU243p7moPbB0Po75xcszHCsTMdqpMrTz/QFyVYnakvjJLGiFhm/ZxhTFjumA1LFtoiJtIGXihKJMG3F/7+2qiTQ1wNiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LD4PTwKo; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idsY1G+T3pBGSX0is2xJnVomMf2vI59uDFrn2NbXEduNt1YOoqEb44UzjgksfY7y116yQkeDemWXnX0YwooY6QSzyegwD+6L9fqaq8djnozbRvb344KPzoJuJdk7GGOr/zdlQAdcoCTVLkeK0kcvUqJsqpZ0lWqM8jn5OfcKkmJtWikmNEbH7dmlASRdJQAwz6L4pFb1r2b5GO2puiPcwdvZjPP0dzUcsLahyYhZ/LpqxwFzCgtoK1dR0Fkq+pv+gVahlqOqHUpAPETW5Yui3mkE8ndl0P8btz3Wy2p/VfIG/4MZJ6lfZqpgbibPu4xM34uQ7hfcbiWefdu8z4UF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+4vIPgQdm/mE7p6aqG87Z2rACPtAgOPTAAWG5ONleo=;
 b=VHMHRZhBPqmoRmnO4CzioaH67cj3/FoDYSTylSIuEcwof/wBjwSM5M/cEa5uaEQvpfVWFqd88yWQv93PLqKnQ9f5WNNhVZ/QILgVAyNIRC8jxAo3aMNEnxr9sZLaoB1GXxxn0CNFMsILkRQwT/uayBLqUlFy0O7NAUtFMprPk+q6/gAxTV4T1G48HjADm5TMQnRiUeRg1+xOcuQ06MOfCsoz05Zy+tKhVIcXehVG04CWjoiAdFXrZapXkV1iWOM5vEKSEf2AqOqU31k9SeIP1aXmA258+s1498vb6AMpBkQo/EjrTt84DkbjJQJxXWlnOnzWFDoGGOe8eaDf63DxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+4vIPgQdm/mE7p6aqG87Z2rACPtAgOPTAAWG5ONleo=;
 b=LD4PTwKoVbIzZo1WSoCTZjV7RSLQpjG9VgXiM7sNwPxuI+KbGSUkMy2h04Vq6rmwLqDVfPaPtxTgD0GcQR222Q2BQh/9b05ULZVTE3qofDjjq/qEb4PUI/Dxzjm5zonVli6H1Hc4gGXvgFeSZQnSoS1hYYYrLpMW6G/+FZ0asss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYVPR01MB11293.jpnprd01.prod.outlook.com (2603:1096:400:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 10:40:14 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:40:14 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v6 18/21] arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
Date: Wed,  8 Apr 2026 12:37:03 +0200
Message-ID: <1ba6a98ace4ad9525d054cbaa308d3aeeecfa22a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYVPR01MB11293:EE_
X-MS-Office365-Filtering-Correlation-Id: 1734b5f5-fcbc-447f-b49d-08de955b37e5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 WlbmQkAQLBxbjy47zpilQVSbzttm3VBsVDzekf6mP7TYz4PS5xWKZrqTYlnLswhB1OOoxXVqL1/VRy91r7TwC9PKQO5425tVYxSoDqGtKlCVX3yEirlEJRgjjQ3ToR8mc128Ox+E+NPCCir8hgk5bQilzN/jDVyJshjOSzr+QuPylC85th0BATnDDKVGEyYV1kcVIl13BjoUYUCSC4tYTmdGeOneovU4MnqlQIG677Qvf9pJkFx7DWIbnp1fsGxUusbg8HvqqYts9BLOaITuoBV2GPuaVFXNHbOJoflsCXPBlPkAq32rwLiI7QFH6GhuSEE9Glw35HKCIHZ5CsZAoN4LLANh/DxJ3dQ5pVTW9vcU1zH6B8GNdAsGK9jBWFIT54G5MIrcOkrFkTDRM6Z/RAtmGloFdfAeMVSCfdcaQ2XckXbvH9wDqQOdlvCHoC6u1zGGvYsocMdUcg1kiNLAPVW/Dst/I6drEOXSG/fyO/2MqxetTBEvfCOCedHSlQmMoVDIBk0AGcR+P92xTuNsh11hOPeLcJ+1wK/zGaQpxJFJ4Q2KinBFkHDINctiPSV86xXmmjm22gIhKtdPVNQ6BBj9xrqHMdwNTbPFS/xv7Bop+S/X8VGSxGYvu3pAD9WMp2n1xBaDRXLI123ivKSZYG3X2grpSBz9j2TnrhJq4AQeonXJq+cgxCdLzVEjKkzEgqT3YzTRJBAcRTM4I0156QCpOhqF+k9y/aKntUheTOXFiqkotVtIv7knnq4xSi6l741Rf7Njf8Dv3vPpxQ2THHRORvH3pqWYRzsCryHFAMM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WD2/BnoUR0Cw1vDIRjGK1sQqP29KW3irfME+05KLjY0AZl6/paggzGCQ1Pph?=
 =?us-ascii?Q?4o20TIIIr4uExPZsCdoV35ta+Mhihidg/OXKdkxrquQXpRrCOC5tKkOOEE41?=
 =?us-ascii?Q?WfAcVPVieRn96RThwOWIMn7zAXqQbUOCfmCVCrfnFommkRy4qEnovNFiYQCk?=
 =?us-ascii?Q?kTvi92LsHj3N13jOuX2NfaYJsvp+jpWTYwiv0Hl22d/x9Mq45t4IHfGLoa5G?=
 =?us-ascii?Q?Tl8C7DYGk7ruzluso6WImlR7/e2QySh/qUYbkEhTbgquL1V29Ib5MdVu1TFr?=
 =?us-ascii?Q?uJ63QN7IJ1JWc48f2/6pFd5GUDzIMf1KvgbzBBwBbHoGFpdlZKfYzRgOEk4h?=
 =?us-ascii?Q?aDOcR1UVsUpJzTA2CzBY8sia7MdaWg1ffmeHkWATaVbH/igtBY8M4AwpFxL6?=
 =?us-ascii?Q?HELXpeYDdSBeEVgt/m+IUiMprF/3oOYK+t3AdkDYdaenTckatOxpGOP3HeVn?=
 =?us-ascii?Q?ZGLYadJ6U7gm3rDr5t0Bejy+P08RnxbxBnVt7LpX5nVR9LzZA+FMlWkVprno?=
 =?us-ascii?Q?dHQy3otRtTc7JA82sE1nm7b/fdAdqkJ89TiGNdWmXkUb3nuwqZoMb1+qL7hX?=
 =?us-ascii?Q?e7DUSZqApNif4iyhhoh/TP74KCvRha3wz/96zKdfsIMoExnkirLtUbZnPObr?=
 =?us-ascii?Q?Z7UjPBsq7uB1eYYyccshtcarKzFSj1lGVbSZx3dfL4N4LXB1QorpeVeMZvgj?=
 =?us-ascii?Q?/i71I30MtguB235GDNJOD42ogZ1lDaqqusIaTvUB7poJ3e6Cxy1k/X/lRXH5?=
 =?us-ascii?Q?P5eZSXmQDSGgww0TbmOX5vOk32CsyoQJZEuYIRcuQh+wcSAERI399jUnAaG8?=
 =?us-ascii?Q?0gXW3TgiwD/sjJqWcnU7aDYiJEyCm6gZyQzhBAtzfnrGJzSGOK/26+XqinE0?=
 =?us-ascii?Q?03bzaTDyQNxDf9ABHxL2HLRcd55e202sogXklTR+f4/N83CYxuiE3eqUVnYd?=
 =?us-ascii?Q?/7vI76JBdsaRFmBfhW5x8nvsW5zEuBapkh+s8UIZFnYO9xjP1/9NkRjZQMiM?=
 =?us-ascii?Q?rMi/1mrVbzRuL2h2vn2lXEQhrGIa5ADKaBlBzpffkf9TRGVwWaxmew7TPIR0?=
 =?us-ascii?Q?8FMzT40T6cGpiqDUeuiuTmDkpYNLI5YwNDkocIchJ6xiAz2b+5KXRsxHJ4F/?=
 =?us-ascii?Q?7dVU4GX+hlHWkn7D6WrmT6NmJbrkymZYoN/TxszsAQD+qQCHoGfuZbvt+akd?=
 =?us-ascii?Q?DiD2gfCg5B1Wbfe+kF4AteMuT8LOb7SMIGhcLL/QU8rUlTjEtijtTojprdK3?=
 =?us-ascii?Q?0tNl3AGrLzYQuUwejopk2eOAWXNkz7ZdMnTFpThsmSn7zLWbetyIhvBJwZBa?=
 =?us-ascii?Q?dnu0OqiBMschUpRhNhk+vIRKyihKiWNk7wcyB7+udYghxiSSbHcKMqTvjOl+?=
 =?us-ascii?Q?yZWdYJXeMZkkExyhNl/wY8kBLZE5TlIAiIOgpNj1FTpmEGivpKnbnQenztcm?=
 =?us-ascii?Q?9GU+gSpFfhvXtvKeapXASDwvsPbwMr8BVkUefOJwui/SH6rE8q9Ey3gR1fau?=
 =?us-ascii?Q?6HKm4DEv483YYd3tt6GfYjL9kva/ASigOrPqgcNLV8SlHtMNFafoFeScwRUb?=
 =?us-ascii?Q?UKm9WX4JBeg1IRGB2TfgubDLlILnBgl6Rd7G7vXlh0rpoVs22JNkvVvtjZJZ?=
 =?us-ascii?Q?5HPkXETFNvr9DqhqldT5wDb8LXD0uRs20Sh1pb/sr2/Gnut0aKjPvIlLGSBb?=
 =?us-ascii?Q?NM+/0pua6bJCtucoJwm/A99UZqhvirLTm4eK0RIFGWCvbl0TAyY2BKJBQsUF?=
 =?us-ascii?Q?q3uirntfG740kf21U5hyWg3IiH4eDfH7ceO+vw9McO96E7heCuJo?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1734b5f5-fcbc-447f-b49d-08de955b37e5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:40:14.6657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVfVsLFDod4HBxEyEThAeDxboXzaUl8K3n1E/89WWLIz6GEp8IUftUu9WF5kFQxCrOfwpUZgUK3E0J6CQNXOTTBkNLjSgc5KNv+AEjFzfdWSyYQr+OShiLYjkcM4Pcie
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11293
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
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30991-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.251.79.240:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,glider.be:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,164a0000:email]
X-Rspamd-Queue-Id: 0EFCA3BAE2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add fcpvd{0,1} nodes to RZ/G3E SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes.

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Squashed fcpvd0 and fcpvd1 patches into a single patch.
 - Collected tags.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 95a4e30a064d..3115ab4b050f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1584,6 +1584,30 @@ csi2cru: endpoint@0 {
 				};
 			};
 		};
+
+		fcpvd0: fcp@16470000 {
+			compatible = "renesas,r9a09g047-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x16470000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+		};
+
+		fcpvd1: fcp@164a0000 {
+			compatible = "renesas,r9a09g047-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x164a0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0


