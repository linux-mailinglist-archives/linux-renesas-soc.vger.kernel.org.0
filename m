Return-Path: <linux-renesas-soc+bounces-33074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INBzBbIsFGraKQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:04:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3975C994E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F2C63001CF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FABB36F8EC;
	Mon, 25 May 2026 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="npKT2of4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCFC3112AD;
	Mon, 25 May 2026 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707053; cv=fail; b=r0Ue3FEgI+HTLWiGUdqt8phNlkuisq9Zv7xcrsRo56VBQdwvC//aItbx7opf5IlmgO1op0jSZDJLz1Jhb6PPSxd7aKm9DAOy0x1iQWEStf3YVgmyz/eyrneCMZIJ2dLgnqArXs4XU+T8JKNJkDZt6HFZNpm5KpCXOipwfhRXMWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707053; c=relaxed/simple;
	bh=oFIUjzwUoCm7Rmu3+SQot7bOTaAQnELLmjrzAeUl4xc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HRK23KYTl+Z96tqurWYVh/gEjTYyuW6eAa1L1aYIyRS8CA0e9gQKexf1E9NuTx3DI7DofUZfhMrt9Akl7L5jGTOgz1mywp1hbJRad5KqQQyyufVetDwzlgSHOp36Jb/kBQggSk6Yl1DDZ8pI6lOla5TjCBhsaErGRUuaRO/R3wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=npKT2of4; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETNLvMnrn2KBZ3RJNKuXrwuI0cg0qI0fOCF1I4CaqhgItRS/nshh/MLFQ1mNVjaMpFDBfg9BOIRVEKs7XxOgbtv+fRSP15plaCv0xkI0Ab7WtWFswmv7MglJwcasjNMraVR53ZpK5B4WDy+CKpYB5xIXAPTmWCexsfg0Cy4GqNwJ+ni+2xWHLUfS5yFZfVS9yBD/woWcvy76WNCPOPJ30gLm0ZEq58kS4CxAux8enlnjkbqKmseu3UMlajvSTHBz1mxbPims8X1245p3IrRO9OQ3thFU9q6Bm2YCLlK5PBwaZIkBInl3DhOhaDjqMjtPckA59PDoC9BA+TPPRDQuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJCx/JnINat/nWGNkM/7u/296io0zhO2leZEfGquE3A=;
 b=ayPGkbt5hmTNJFPNGgquTtnH3sfAez00U47J4oJ4+sWJ3rGfdG322ofARipLLFHblco9YxlJ8zX2G/l25rS+ELhts2sZdpOTssCBIE+s+eCgvV4hnKkgpz9sQ9l3u5g7EfU+wC1HN70uprNy+c3EBWpYoJvr0nCSl/WzFUG1iiTiQNDal7U66PAm+I3BA4f5Foddvvp7JUp0HKjwyp57XoJfOnu9NEYeBUhYBX3ueMDll3zRh+gEV3z+y14RSigZgFG6Q4uWflq77zVbjsK+WbDQ/s4v/jI83xVKj774XeJBcBCC0p86q6WIWU6IRr4TQRNr7LMLLkAdp8Gou8wJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJCx/JnINat/nWGNkM/7u/296io0zhO2leZEfGquE3A=;
 b=npKT2of44I1V07EGLBsJXeEB6H52k425xf4bOudHQ2n8o5bfs29IZ0ksJ5FzLx6NQ+DLZq5oZWFxNdLezb+0xJJ6PSRSUvcl/nn4KjPCpKvg80Uvt50Nno2tRL+K/ntq/dDhF+/lLX5TVTnoxiGt+OclmuUAwSjUyE0VwUbcDk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB6982.jpnprd01.prod.outlook.com (2603:1096:604:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 11:04:09 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:04:09 +0000
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
Subject: [PATCH v7 07/18] ASoC: rsnd: Refactor DMA address tables with named structs
Date: Mon, 25 May 2026 11:02:19 +0000
Message-Id: <20260525110230.4014435-8-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 758520c3-bab4-4d30-af72-08deba4d586b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|22082099003|18002099003|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	X4gxE7OA2amnS+AQ0SOdpLh/tWP7VL6pJ8ezhX/hV1aYPNapSD+pi8+8H+Ln9wR9gwylzwJllhiqA2ptZljxWKmy61lrHhwqVGTrjlC/4aBg6eqDNm8LekZ30knJEC21xMjhYHDpLXbEHzlLz4DJflxDyWOOJ08otEkPrz8x7DGGCmVleKjfzvDzTRUK6hewQ9UyYmjhj4VBXlKbnGtIkEu3Nkb9rpDwj0So2VxqcofcoTb7DLF03Plc6UZtDr2Gu6eyrQZrdF5p3vNzIP4CKJZXQg3c3QJadOZsziQLOstJefN/Tsocy2kinJ+YXJ8friC3jPHd1jIuzsOyDpkSzu1f1eamNflEQGK8KUdIN/wM1Ns6g06nOwM0B4VCo2J4HnIGlajYfAy9apifzL21713gFYwG1KVZmkJLAbbPLtfcZWlKgmh1qqK8XWwwZheyf6q3odk+iwWfybrpdgfXstXr/gGMlMt7C423Lchk+HaGX70Ou4poQHcs6QxNDDpEcdGlQgpqX3ebL97/gYPi7DEvvosORLpqKolbrrn1mBYlm1zcFWK51azAzbQBKZFsM6+dihZ91jzmAUkhbBdjIzs0BQUdRspUaiUGArKWTsFwHQWpU6/NqyupA7la9NLMbBGrUY4udYyDyX2ggkZhcJy+D/4kvp73cTG+IciAVTeCuXBmnvaDUEO83v2hqJyiw7VOqrImfSc0+qFQrG5CpgRyQhTFH6GKH7EcdQCz0CDinIBkjhJMczoQMuYxoz8x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(22082099003)(18002099003)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/DzAr9jZ3HOYJygqYg0aX0/+AkSLI+zMf3wx6/IR3yNn+vMov1+fqRMzlMYb?=
 =?us-ascii?Q?53S11Z5fkOcPp3skkwRTCPblL2507hWeQt4C04JJHLSN0a1Er1tUfGwxJS84?=
 =?us-ascii?Q?t1q1tBLafAeOjI456/Qy/EFsPL5K3TqwXfTxKUjMTp/+pUs1l2WOeZb0qwfo?=
 =?us-ascii?Q?z4m0j9+vVOXejTMj8WyFm26a6yaEgAkgIDKMb6TnTOXqdG22w07kYEiw4Uzn?=
 =?us-ascii?Q?xaNw9xdk7kvdLJ5uui957OpEMnlv0WT7TogUWX2lzPyT1InP8h//831k+PRK?=
 =?us-ascii?Q?IqiH/p+BdMPT9Oh+kB+5gvdMp/BXyHNMHPjSIeA2yVikwWBc2qmruUMPQZgq?=
 =?us-ascii?Q?FVkpPJdkS8kORikfS6bPeq2IqqW2qONk3m6dVGK2HyLhZ4cSYSzYXkOpzs1p?=
 =?us-ascii?Q?PnLPCAd8L5sRNHBYwd8660XO2LwJeWJSAY6BF1krRAoyZ3S+8kp7Oud1BEcz?=
 =?us-ascii?Q?wLZYhWHu28tMdiQhpncyRtXS3g813IrAhcfL0LlZlCJ6D0KqooknUfzkXx4k?=
 =?us-ascii?Q?w8BaJIjgPwj2e9kB1O+jb3t4b7CTSfFYq7R0A+qZpFvysjsProTIVcV8MQac?=
 =?us-ascii?Q?M18XXWJz0skEYMqE/iw2No5mmvGP+3KI9LKpF0LQDQyLZY8pCxEmJj2nLUfm?=
 =?us-ascii?Q?5/lXZjI8kDqIZmCmLazKDxPHy/sk6wBivgcbDTfp44Caf474zBDInDN9Qfz/?=
 =?us-ascii?Q?hVaK+HddHrojibffaUml4UzUY4u7u0toAg8fWnZHN0qu8plC9nvejeoe0aRl?=
 =?us-ascii?Q?uCv0DTvsSO+xvKEvutbYmVnstMMl4wJ3s7hwtFVgmr1MBkx1ueyAncUZZ4Tb?=
 =?us-ascii?Q?K8kbxNijsxAREeR1mQZ30YO23tYDwUPh4M9VYqLb93Nq5qKPrsmbLTLXXVSa?=
 =?us-ascii?Q?MObx0/j8107lRAAvEyWXFJ+223/fFxFl0k2x4vNWzxcrXhRamDxmlO+xS++p?=
 =?us-ascii?Q?ZH0e4gnHGGSKKR2EqTnhUspQpxa8UgOd0Tw7CUugNguV8tWcG1+aKQvZyGGs?=
 =?us-ascii?Q?wydvQjlRzHTH7NifofjUhWjN0ItNaj2txNE/De/aLOi+csaUES/1qEdoKVRG?=
 =?us-ascii?Q?yN3Jan18yg+BgrQnDmZOgrsLQdVqZQ8WcodnqKAC8UN6bbW6C08HzkfGCr3u?=
 =?us-ascii?Q?VyGqYa9JnZDWdUAYgx9HWkZxvXhcKBsPok9lFEA9dBacdlyzNVcT34tdvZUu?=
 =?us-ascii?Q?3dsgOxTUzTN6Dh07dMOJbXKyNe+bw+Usi+A+/jo4ZMyPIMCcrbb4OaWPB190?=
 =?us-ascii?Q?cHUhWmAzuYSqpeeveJMbQAVrnIoGn7jqUFn/SUrpOGpYtD3P3w8eYgKY4lss?=
 =?us-ascii?Q?nTrHj16Ufv201HPRNqsv/QHZ70YgG4nPWStzpxleVsnurYCnQ/I7KcmaAkr4?=
 =?us-ascii?Q?0rGZr4s8zx0G9THBdQu/FVZDXQrPxzjL8iEYnbmaHOYIrbD5B7/SWReUQaM+?=
 =?us-ascii?Q?XZeSLU6vk18l0ne4qiINQ4cfkfGprzEIAGEQqK4qzsV6aHoYpt0HlAvQyMKE?=
 =?us-ascii?Q?Y/G7QVsOjjrHfN48j7oKiD1xXV/9SluOEU6mNqfEpYDh1xX98ER/pq4bYjgY?=
 =?us-ascii?Q?MuXbVt+BT+E1AF+wvvgDa6rmv3Qqo2ON3DIMzI4L/tHptNOMMVJPjmM471M8?=
 =?us-ascii?Q?s4IAEPrqj2S6tVDuIE+RsGr5dRGNl7VGsPE50FrrcZlfAn7lglhuJJpqQJop?=
 =?us-ascii?Q?Zkj4rqw+WlnHxxml/d3J3bdgbxDidq4CnxeGSfYLN3AOElmyQn8eUpU2BuOq?=
 =?us-ascii?Q?3RSIE1xiqfvqVBEVcXWgz5LU8CPfS6I=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758520c3-bab4-4d30-af72-08deba4d586b
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:04:09.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtogoanR5l+zr/Wq1EnRu3mdoeFHyqyucQbW22SShDeYibUpDrfQqG+zP0GAOf8/TrKW8r/lFhX2yphAnRaoH9mqWayXu05L/1RFKwSlI7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6982
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
	TAGGED_FROM(0.00)[bounces-33074-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1B3975C994E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the raw multi-dimensional array used for DMA address lookup in
rsnd_gen2_dma_addr() with properly named structs: rsnd_dma_addr (in/out
pair), rsnd_dma_addr_dir (capture/playback arrays), and
rsnd_dma_addr_map (src/ssi/ssiu module sets).

While at it, extract the common lookup logic (is_ssi / use_src / use_cmd
evaluation and table indexing) into a shared rsnd_dma_addr_lookup()
function.

No functional change. This is a preparatory refactor for upcoming RZ/G3E
support which will add its own DMA address map using the same struct and
lookup function.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: No changes

v6: No changes

v5:
 - New patch, extracted from v4 patch 06/12 as a standalone
   preparatory refactor per Kuninori's request.
 - No RZ/G3E content; purely the struct introduction and
   rsnd_gen2 conversion.

 sound/soc/renesas/rcar/dma.c | 147 +++++++++++++++++++++++------------
 1 file changed, 99 insertions(+), 48 deletions(-)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index d52cada711e5..0ce77eee338d 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -481,6 +481,69 @@ static struct rsnd_mod_ops rsnd_dmapp_ops = {
 	DEBUG_INFO
 };
 
+struct rsnd_dma_addr {
+	dma_addr_t out_addr;
+	dma_addr_t in_addr;
+};
+
+struct rsnd_dma_addr_dir {
+	struct rsnd_dma_addr capture[3];
+	struct rsnd_dma_addr playback[3];
+};
+
+struct rsnd_dma_addr_map {
+	struct rsnd_dma_addr_dir src;
+	struct rsnd_dma_addr_dir ssi;
+	struct rsnd_dma_addr_dir ssiu;
+};
+
+static dma_addr_t
+rsnd_dma_addr_lookup(struct rsnd_dai_stream *io,
+		     struct rsnd_mod *mod,
+		     struct rsnd_priv *priv,
+		     const struct rsnd_dma_addr_map *map,
+		     int is_play, int is_from)
+{
+	struct device *dev = rsnd_priv_to_dev(priv);
+	int is_ssi = !!(rsnd_io_to_mod_ssi(io) == mod) ||
+		     !!(rsnd_io_to_mod_ssiu(io) == mod);
+	int use_src = !!rsnd_io_to_mod_src(io);
+	int use_cmd = !!rsnd_io_to_mod_dvc(io) ||
+		      !!rsnd_io_to_mod_mix(io) ||
+		      !!rsnd_io_to_mod_ctu(io);
+	int id = rsnd_mod_id(mod);
+	const struct rsnd_dma_addr_dir *dir;
+	const struct rsnd_dma_addr *addr;
+
+	/* it shouldn't happen */
+	if (use_cmd && !use_src)
+		dev_err(dev, "DVC is selected without SRC\n");
+
+	/* use SSIU or SSI? */
+	if (is_ssi && rsnd_ssi_use_busif(io))
+		is_ssi++;
+
+	dev_dbg(dev, "dma%d addr : is_ssi=%d use_src=%d use_cmd=%d\n",
+		id, is_ssi, use_src, use_cmd);
+
+	switch (is_ssi) {
+	case 2:
+		dir = &map->ssiu;
+		break;
+	case 1:
+		dir = &map->ssi;
+		break;
+	default:
+		dir = &map->src;
+		break;
+	}
+
+	addr = is_play ? &dir->playback[use_src + use_cmd]
+		       : &dir->capture[use_src + use_cmd];
+
+	return is_from ? addr->out_addr : addr->in_addr;
+}
+
 /*
  *		Common DMAC Interface
  */
@@ -527,47 +590,45 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 	struct device *dev = rsnd_priv_to_dev(priv);
 	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
 	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
-	int is_ssi = !!(rsnd_io_to_mod_ssi(io) == mod) ||
-		     !!(rsnd_io_to_mod_ssiu(io) == mod);
-	int use_src = !!rsnd_io_to_mod_src(io);
-	int use_cmd = !!rsnd_io_to_mod_dvc(io) ||
-		      !!rsnd_io_to_mod_mix(io) ||
-		      !!rsnd_io_to_mod_ctu(io);
 	int id = rsnd_mod_id(mod);
 	int busif = rsnd_mod_id_sub(rsnd_io_to_mod_ssiu(io));
-	struct dma_addr {
-		dma_addr_t out_addr;
-		dma_addr_t in_addr;
-	} dma_addrs[3][2][3] = {
-		/* SRC */
-		/* Capture */
-		{{{ 0,				0 },
-		  { RDMA_SRC_O_N(src, id),	RDMA_SRC_I_P(src, id) },
-		  { RDMA_CMD_O_N(src, id),	RDMA_SRC_I_P(src, id) } },
-		 /* Playback */
-		 {{ 0,				0, },
-		  { RDMA_SRC_O_P(src, id),	RDMA_SRC_I_N(src, id) },
-		  { RDMA_CMD_O_P(src, id),	RDMA_SRC_I_N(src, id) } }
+	const struct rsnd_dma_addr_map map = {
+		.src = {
+			.capture = {
+				{ 0,				0 },
+				{ RDMA_SRC_O_N(src, id),	RDMA_SRC_I_P(src, id) },
+				{ RDMA_CMD_O_N(src, id),	RDMA_SRC_I_P(src, id) },
+			},
+			.playback = {
+				{ 0,				0 },
+				{ RDMA_SRC_O_P(src, id),	RDMA_SRC_I_N(src, id) },
+				{ RDMA_CMD_O_P(src, id),	RDMA_SRC_I_N(src, id) },
+			},
+		},
+		.ssi = {
+			.capture = {
+				{ RDMA_SSI_O_N(ssi, id),		0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,			RDMA_SSI_I_N(ssi, id) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+			},
 		},
-		/* SSI */
-		/* Capture */
-		{{{ RDMA_SSI_O_N(ssi, id),		0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 } },
-		 /* Playback */
-		 {{ 0,			RDMA_SSI_I_N(ssi, id) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) } }
+		.ssiu = {
+			.capture = {
+				{ RDMA_SSIU_O_N(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,			RDMA_SSIU_I_N(ssi, id, busif) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+			},
 		},
-		/* SSIU */
-		/* Capture */
-		{{{ RDMA_SSIU_O_N(ssi, id, busif),	0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 } },
-		 /* Playback */
-		 {{ 0,			RDMA_SSIU_I_N(ssi, id, busif) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) } } },
 	};
 
 	/*
@@ -580,17 +641,7 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 		dev_err(dev, "This driver doesn't support SSI%d-%d, so far",
 			id, busif);
 
-	/* it shouldn't happen */
-	if (use_cmd && !use_src)
-		dev_err(dev, "DVC is selected without SRC\n");
-
-	/* use SSIU or SSI ? */
-	if (is_ssi && rsnd_ssi_use_busif(io))
-		is_ssi++;
-
-	return (is_from) ?
-		dma_addrs[is_ssi][is_play][use_src + use_cmd].out_addr :
-		dma_addrs[is_ssi][is_play][use_src + use_cmd].in_addr;
+	return rsnd_dma_addr_lookup(io, mod, priv, &map, is_play, is_from);
 }
 
 /*
-- 
2.25.1


