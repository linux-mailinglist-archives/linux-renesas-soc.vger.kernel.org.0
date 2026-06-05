Return-Path: <linux-renesas-soc+bounces-33636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yNbWAt0sI2rZjgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 22:09:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96F64B1B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 22:09:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=Zpl4iv3W;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BFBB3010B9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 20:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29E93B103B;
	Fri,  5 Jun 2026 20:06:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCAB345CC0;
	Fri,  5 Jun 2026 20:06:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780689984; cv=fail; b=ZfYf5vkblEUFd6zuFowFtp/zQEvtLZc1zyX9HKUDC6wXMHpdfsXPaLikan24Gy1VQZDyaS9o/gat1nSYHoehRY9cORog8Sj6gwlgfrz8Ez19Z0dYDoBZOubqMU4UsXNGwE+LTeTy901h6YCVmZMIem8k+EXTSHnYxb9VzvZJXcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780689984; c=relaxed/simple;
	bh=HJewihLOyijcDBWJM0kh9LRTm6ecChjeVhOVOnFQTD0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ek1Kg973DBmRkTFxeZ938BmkfTy1sXjfMfriZLIdvpztPWkSZl53nbi7PjBT6Oi3ZGPzUOg07j+zY6s9Lz3otFWuCK9dKOaNC1z0DDLIkG+3/Hf2u6pyLURHem6tOwzznJ2ThBJUmi7B7jhN7AnQ+TUcVs2W0e6O8GaVYCJHOJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Zpl4iv3W; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgiOJ/2nhPVcmQHwf3CL07ULg8dgd+O2t5KiyDiiGlh65kSLbqAZ6RhWKGlVsoddIjoQcRNaG4XPMKqyCqCG0KRDn4kiMa36UaVG2+MDVZHDzMvH8HiNv/zIDMmM2VDN58M9oSgj/J+T0sSvXLfrGHfDObZwQuGAn7XkiGbBZuQgbhx4DqT5aTc5/9qevRfvXzMVLYz9t2XuNr/g706/o/b4a3PkruolonfiDsoZIbYUKfqNn6i7mpeo3PYWat77nW7NWgCdp/h2zyn7fpas67d4JYl7erSJXQ5KZtp+HxSAckWHWU147OJx9/bQER5+T3iFbI2V3memJ/aGd0SbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCz4B7cg4fA3aTYNrTZsdfM1dWGuMa3Roi4FHySpBBQ=;
 b=TBvzsXtRG/uzY4+Jw+b6knwqCH3INdhjnLQtgHgAF8DweZG3t7qMgOQwSq5Jbm4ZBbUljaRfO7dW9s7sZcH75AoSQ7CsOFV/IHkSpjTZ4DAnBZJLmdIOdd6xG4cYP6FJ6eg6q/fl+dSQCXswNcP18WgPWu5QvHfseiiWK129TjAySqDlT/LN1QLHvcNmvjLRz/uhRLSWUqisIwGqOG4YZgPMZQWAz2VyJbs3X3rNRYt/eq+9wq1G3Donmbjv6YdrXcAORyOATjnYyqploycwE9WBJQniz3ut4MHHYxfE6iI2+NADMJg3ki51dVNVjPkXDShvYgMp/ymXG36oI8izLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCz4B7cg4fA3aTYNrTZsdfM1dWGuMa3Roi4FHySpBBQ=;
 b=Zpl4iv3WYT1uVm9Sadqzzun+5niAwLGrOido9u6V2s1qYmU21I1yTvwQ5KTMyzRIIJjItKqpcovd31yu5hRzSgQW+QpNIurcArC/84cYQOZGg1T6TbMXGlI3l76TIXOADHC7VMqR5brSn2w4TPoLDIit95UVuUofMMjsMWxnI68=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8212.jpnprd01.prod.outlook.com (2603:1096:604:176::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 20:06:20 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 20:06:17 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix dma-names and ports schema
Date: Fri,  5 Jun 2026 20:05:26 +0000
Message-Id: <20260605200526.683577-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0271.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::13) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: a429309f-657c-40c1-a9a4-08dec33de73a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|11063799006|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	oknQPK8icmbqO7tirBt5HpZzq3pfU+51iv66TbT8LfBC//OAvgQW5+z4yc1uYXCO0IIMzfVJK4iXjlOlJm+S4BK2L5CKtHf9d4c/AOy4Naa+nmxyHQp09v+hkA6o2gBAz+l+hpkEyM6cF+l+EB62dFOyxprXat3fZZ13YuRvaw2Ut8FSQtB4/AT0mTHIC3LSshE7lEdsdZHB6oG7u9VE+WzPHBNDHyIC2OOlbjDKUv/OARt/8hcXeYLBbU8OqEctqrWCwoAZIBs62cyNi2OkSsonfcAeUHF6TrgIsXAU8TEYm4CIKgZsmzgraY1IOeixQAXf9p9hwYvVCT/pJhw9SKZ2mDtlC4OEz4wdl8vs608J67VANS0hR3NayTW66SJGsW962Fh27LL45/dpnsOEWMGX+7ggrc+lbQd3Mg6IzYvzl7I3SUUpcpAVuzLUHsFHw2NSQGW/VNKp+VNjP323eM2Wfb1wHtWEBGv6UY9Wkwvo/bqufv+0UTyuuCTIJTvtVSOUWNd56ZdGmP3c4AgeFPoPdGyRw1ggbI149gA5f0zhxVra595I2dE7d2nIDKYOYlmKxrF0mfFUDBmS0S6Od4CUM/ONmZnw1hDz1ThmaabbCaVQObg94R5jenxzHImoZAWWVlYUOw704KfqgXmZAXEKyosltOEV4TpNUlFvtDUcsab3gqbhiyhbhAXWaiT53D+2481GZbICuCdQnsoDV47UJrrhSvdmoPpPmTrVabarFN833ICBhUQiXT7BMPOn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(11063799006)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qB6i46nrvWhFIlbRfP6wysQQGTlJjpg0PrbJORpOqr+Dyb9/Xz8ezvbOMxBH?=
 =?us-ascii?Q?YUulNXP/hWvYJAGkV99LOJhxdaDieJbcLxPXIEHkasWW3uIrBSuU2Z16XLw6?=
 =?us-ascii?Q?dwlcd2VjL9TaNOk1j4If9SYDOHaA4HtI9GqoWhk2dm8AMI8XRQ8sjYG5isj/?=
 =?us-ascii?Q?TAccYlYXM3sn+WixA1LwUA6CCRpVVLyfEf+aafhgfoKuFLZHJzp67ySJY5P7?=
 =?us-ascii?Q?5rKbjVBnsCIGthzSWp4XioL8LJkjf7ZOhuR11YqIEjIIUKCFynIbxVNzSyqk?=
 =?us-ascii?Q?dIwNAnEd8AI7Ap4zC+6cyuFM1aSCXh75aV96aZmghXm9dPb/LpBJVWvNXpgD?=
 =?us-ascii?Q?6mCS2lkkPCZP95t+K0OC7lF4vmqTuWEZ2Z+iNCtzhJCxPQ/zNIZaWgZPyzkh?=
 =?us-ascii?Q?6W47ySwU9xaIeKZEvZ+sEji5OwMWSLn3lyYXR2VP7DkXAwJmeLxDYrbLWDil?=
 =?us-ascii?Q?zHBNC+5poBMM4EJxhVC5V2/Gfk5qnt9nqX8CFilW6A1b60nuFwwj9M05H9Kt?=
 =?us-ascii?Q?RYuXnxkVEqH9LAbUSr7tRPhBrY48+sxKeXw6PYTPsvUuFNQYSPnlxfrl5wGt?=
 =?us-ascii?Q?LlXiojOkVdXy2CiwOMr52t4/uku7Lzx/7hIaaOfKHAdzZYWkblMChP6aIeNS?=
 =?us-ascii?Q?BTX3nGAA/5fMAs/Yc3akbt4uRonUCZcPMCXYAHKo5MPUdCoegQVLzV8puW4k?=
 =?us-ascii?Q?6F/h3car4bcC3Mx41mDwQIiXyKtMDDmn+8Vp03FkKJ+HyXk1zz1AZQ+CX/lj?=
 =?us-ascii?Q?IRq8IvVve2E6Zb1p2K/z5aVgNL+o7EKXibM0wgCcmYIphp0oTXVSD+lBo93X?=
 =?us-ascii?Q?NjMTu5bvyP/NMP5EmxJaJLjZgmIlhbKL10kBfhwr4Gv4WXlBmc2x1fQNQ2kO?=
 =?us-ascii?Q?UYshUSOzKQP7AJ9vlzwKc6inMQIBDtbN6kqrxj67MoOLJRMirieSXANlA+2r?=
 =?us-ascii?Q?SMJmi02SHBwxa+z7aeDP4V5169i/B8sAKwDrUy3iFW2dIn4D01bD3ylbwFSN?=
 =?us-ascii?Q?9Ct52epuqqy97DHFHQGvHQpvg1oYfpgqm3XK2bQJO81hemxfXubBk/dinSCa?=
 =?us-ascii?Q?k9RsYiO04eNXj3ifDKQ/cCt6AG5uEAwIdD/iGIE+qvwGtPqFWWKKXAkZks4V?=
 =?us-ascii?Q?+I4gRIELTfeAz8YDecoDolnWHViCjy38k4ZDRjuzB0wGqZzAYx0Y67tjziDD?=
 =?us-ascii?Q?eg4cT/EYePhLFuhAlQQGlBNEk6lRpDuCSloEbnTHOLQkxkafr1ceEXQrRMrJ?=
 =?us-ascii?Q?bidE7OP4LM1QK4OVTEz78Jwbhcx+Mx+u8NgHBB9XzSTtz0c2skShxuw/GoFG?=
 =?us-ascii?Q?QMj+YZFUHneU4CCNgezO7qByvYFSh91rik10KAK8QCmjiKGlYeo2KC3VowrT?=
 =?us-ascii?Q?DtDgkiiYRdKxtgFgko9tFBo5vJGLDv1B8SluijBSdAjxYuQ8D1hDJvZDPtOd?=
 =?us-ascii?Q?WkjLn7dcnTeklyuAdjWLXQXEu1R1VrAxlW/1hnCxmRslyNMhOLYN27lT8zcT?=
 =?us-ascii?Q?T5rtUed1XC/xsw9cCC9+7hPF3thLC80aJuJP9nHWpnoGxgNw7C0ZRzLkyH/Y?=
 =?us-ascii?Q?hb2+lGv7Yv4h0EczkKw4KH06eCC7EU1sC/szxnsifH/hyEfyiy+16+1XCP0t?=
 =?us-ascii?Q?VnyR66wwMaUKdzJxlnK3Qy6HTILbtk1AAwdxjdgYQIP1zewhoZUxqvtfmxNo?=
 =?us-ascii?Q?jNqiXhYU4BgIw5emK/EmlM5L1T6tIZdnRWOlySIYsbrE/TfnLn+wyp63iEU7?=
 =?us-ascii?Q?vqluzrncvcSKIN3V9fPWiSkzzePNkSk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a429309f-657c-40c1-a9a4-08dec33de73a
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 20:06:17.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CNtHzFSHK6pk+vZGRO6PoleFFIrVtN/tHclT0+ZSF5k3AEERaINWIepGpm3bKzll0STBhNBLKAf7xlOaaqIOrYKl3NnFBhhf1hwuReqmyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33636-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kuninori.morimoto.gx@renesas.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:john.madieu.xa@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[renesas.com,vger.kernel.org,gmail.com,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:from_mime,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C96F64B1B1

Replace the allOf-wrapped enum in the dvc/src/ssiu dma-names with a plain
scalar items schema bounded by minItems/maxItems and point the ports
container at graph.yaml's ports definition instead of port-base (a ports
container is not itself a port).

While at it, drop the unused top-level #address-cells/#size-cells since no
child node uses a unit address and the ports node provides its own, require
interrupts/dmas/dma-names on the src sub-nodes to match the ssi/ssiu
sub-nodes and the driver, and pin clocks and resets to their fixed counts
(47 and 14) to match the clock-names/reset-names lists. In the example, put
compatible and reg first, include renesas,r9a09g047-cpg.h, and restore the
CPG_MOD cell on the clock specifiers.

Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v2:
 - dma-names: drop the per-position items list in favour of a scalar items
   schema with minItems/maxItems. The list form forced exactly N entries,
   and a scalar items schema needs both bounds to satisfy string-array.yaml
   (Rob Herring, sashiko-bot).
 - Example: restore the CPG_MOD cell on the clock specifiers and add the
   renesas,r9a09g047-cpg.h include (Geert Uytterhoeven).

v1:
 - https://lore.kernel.org/r/20260603202805.3530046-1-john.madieu.xa@bp.renesas.com

 .../sound/renesas,r9a09g047-sound.yaml        | 100 +++++++++---------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
index d7fa16554698..933edc729f6c 100644
--- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -42,13 +42,8 @@ properties:
   "#clock-cells":
     const: 0
 
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
   clocks:
+    minItems: 47
     maxItems: 47
 
   clock-names:
@@ -105,6 +100,7 @@ properties:
     maxItems: 1
 
   resets:
+    minItems: 14
     maxItems: 14
 
   reset-names:
@@ -143,11 +139,10 @@ properties:
               through the list to find a free channel.
 
           dma-names:
+            minItems: 1
             maxItems: 5
-            allOf:
-              - items:
-                  enum:
-                    - tx
+            items:
+              const: tx
 
         required:
           - dmas
@@ -203,12 +198,15 @@ properties:
               falls through the list to find a free channel.
 
           dma-names:
+            minItems: 1
             maxItems: 10
-            allOf:
-              - items:
-                  enum:
-                    - tx
-                    - rx
+            items:
+              enum: [ tx, rx ]
+
+        required:
+          - interrupts
+          - dmas
+          - dma-names
 
   ssiu:
     type: object
@@ -229,12 +227,10 @@ properties:
               falls through the list to find a free channel.
 
           dma-names:
+            minItems: 1
             maxItems: 10
-            allOf:
-              - items:
-                  enum:
-                    - tx
-                    - rx
+            items:
+              enum: [ tx, rx ]
 
         required:
           - dmas
@@ -261,10 +257,9 @@ properties:
           - interrupts
 
   ports:
-    $ref: audio-graph-port.yaml#/definitions/port-base
-    unevaluatedProperties: false
+    $ref: /schemas/graph.yaml#/properties/ports
     patternProperties:
-      '^port@[0-9a-f]+$':
+      '^port(@[0-9a-f]+)?$':
         $ref: audio-graph-port.yaml#/definitions/port-base
         unevaluatedProperties: false
         properties:
@@ -276,6 +271,8 @@ properties:
             properties:
               playback:
                 $ref: /schemas/types.yaml#/definitions/phandle-array
+                items:
+                  maxItems: 1
                 description:
                   Ordered list of phandles to the in-SoC modules used
                   by this DAI in the playback direction. Each phandle
@@ -285,6 +282,8 @@ properties:
                   from CPU to off-SoC endpoint.
               capture:
                 $ref: /schemas/types.yaml#/definitions/phandle-array
+                items:
+                  maxItems: 1
                 description:
                   Ordered list of phandles to the in-SoC modules used
                   by this DAI in the capture direction. Each phandle
@@ -308,11 +307,10 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     sound@13c00000 {
-      #sound-dai-cells = <1>;
-      #clock-cells = <0>;
       compatible = "renesas,r9a09g047-sound";
       reg = <0x13c00000 0x10000>,
             <0x13c20000 0x10000>,
@@ -320,31 +318,33 @@ examples:
             <0x13c31000 0x1f000>,
             <0x13c50000 0x10000>;
       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
-      clocks = <&cpg 245>,
-               <&cpg 385>, <&cpg 386>,
-               <&cpg 387>, <&cpg 388>,
-               <&cpg 389>, <&cpg 390>,
-               <&cpg 391>, <&cpg 392>,
-               <&cpg 393>, <&cpg 394>,
-               <&cpg 372>, <&cpg 373>,
-               <&cpg 374>, <&cpg 375>,
-               <&cpg 376>, <&cpg 377>,
-               <&cpg 378>, <&cpg 379>,
-               <&cpg 380>, <&cpg 381>,
-               <&cpg 370>, <&cpg 371>,
-               <&cpg 370>, <&cpg 371>,
-               <&cpg 368>, <&cpg 369>,
-               <&cpg 251>, <&cpg 252>,
-               <&cpg 253>, <&cpg 250>,
-               <&cpg 384>,
-               <&cpg 246>, <&cpg 247>,
-               <&cpg 382>,
-               <&cpg 352>, <&cpg 353>,
-               <&cpg 354>, <&cpg 355>,
-               <&cpg 356>, <&cpg 357>,
-               <&cpg 358>, <&cpg 359>,
-               <&cpg 360>, <&cpg 361>,
-               <&cpg 248>, <&cpg 249>;
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      clocks = <&cpg CPG_MOD 245>,
+               <&cpg CPG_MOD 385>, <&cpg CPG_MOD 386>,
+               <&cpg CPG_MOD 387>, <&cpg CPG_MOD 388>,
+               <&cpg CPG_MOD 389>, <&cpg CPG_MOD 390>,
+               <&cpg CPG_MOD 391>, <&cpg CPG_MOD 392>,
+               <&cpg CPG_MOD 393>, <&cpg CPG_MOD 394>,
+               <&cpg CPG_MOD 372>, <&cpg CPG_MOD 373>,
+               <&cpg CPG_MOD 374>, <&cpg CPG_MOD 375>,
+               <&cpg CPG_MOD 376>, <&cpg CPG_MOD 377>,
+               <&cpg CPG_MOD 378>, <&cpg CPG_MOD 379>,
+               <&cpg CPG_MOD 380>, <&cpg CPG_MOD 381>,
+               <&cpg CPG_MOD 370>, <&cpg CPG_MOD 371>,
+               <&cpg CPG_MOD 370>, <&cpg CPG_MOD 371>,
+               <&cpg CPG_MOD 368>, <&cpg CPG_MOD 369>,
+               <&cpg CPG_MOD 251>, <&cpg CPG_MOD 252>,
+               <&cpg CPG_MOD 253>, <&cpg CPG_MOD 250>,
+               <&cpg CPG_MOD 384>,
+               <&cpg CPG_MOD 246>, <&cpg CPG_MOD 247>,
+               <&cpg CPG_MOD 382>,
+               <&cpg CPG_MOD 352>, <&cpg CPG_MOD 353>,
+               <&cpg CPG_MOD 354>, <&cpg CPG_MOD 355>,
+               <&cpg CPG_MOD 356>, <&cpg CPG_MOD 357>,
+               <&cpg CPG_MOD 358>, <&cpg CPG_MOD 359>,
+               <&cpg CPG_MOD 360>, <&cpg CPG_MOD 361>,
+               <&cpg CPG_MOD 248>, <&cpg CPG_MOD 249>;
       clock-names = "ssi-all",
                     "ssi-0", "ssi-1",
                     "ssi-2", "ssi-3",
-- 
2.25.1


