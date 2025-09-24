Return-Path: <linux-renesas-soc+bounces-22277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE13B98320
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB6952E5BD7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B9519CC37;
	Wed, 24 Sep 2025 04:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Hgetgk6e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603BF4C85
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688185; cv=fail; b=UtD8sx2heDUfymUr81t3ptILD6lTiR5gPtdr93wgeuf+YGPakXMcHNcZD2hazSiv0LUyJyb67JIbzsq6ZZ0LebMUjbHWYM6naQJuhS2hxRp9Tq3FL5NaPLvIl73KuLlX4zyxk/DwBE2fXYLAN19yJubyTp57Q0qxGCmEogTQFDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688185; c=relaxed/simple;
	bh=dUa7dbGHtSh7piut1NsiWIeDWd+fX/Qe9SJ2P2nJBKI=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=mS7dL9HnlIFTuY/aSG+KW74wqIiY6vTcTszO1nOI6GKvjqq6XrOCOfXkUyYeiCb834nwLDSwwygalVsFpNHGJ9PbmOC/R3QSLPdLcqcOATnPGFM14Syt6pK2sw+6Md/rK12z4NU4+SOSFMXf/gpQKE8GrfCjA++hAYOdz3dHGiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Hgetgk6e; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnSgXirhQt6XXiyisL2VJEvj9ZO03+Dg0UAimwX6emybA3OTehkh3/jOgBJMpoGkfkAJQGMd4LfeRdBw8la5X2/VJPH+u35PgTFBRE9AZWMJys7SaobnwQiJVUvMpt3fXtdC6YaggKSkTbji9KhScDcuSfVXbGbHfDz4ycD7KPkPjVEbPmiFx6EXmouXvGuLyKAkcDBsz9EoYTI/V89N9yd47z++C/gISJVKj7tiCP3Tgy0ZmgyTFv+rwThjqxdQQlDHeUrPWG/isdu5g+tfuHZ8BfxpJ1jjljLYn04pDEvBAed9LaQlxJdBaXNzIBE+UpjfE6BlSONyckGn2yrTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvEY3FhUihTTE9uyyPm9ZUTMiI99q8e0JhRm3Ve/Hjo=;
 b=B15HS46To3d4xMyYatG05VxHWDJGRNaFoeiS4jd1+rSfOZpn8U1seTPKVpl+NUyPuAtCJsNNZqktHE08To5HPl70sny8ggdcRABC4VGxPiVriEX7zSQBygQ0tciFrwNKLsFsOsLh5IKHkyJZYVYIu67FkY3PG1/BxbRCc6rEUm+eRLYqpG/KhVBB2VxjB5hM3XXESW5QK9DYqHP0RKKyfoHy5m0ayJYy7FIY9JrDWu5okGKCNH1Io26tWgZPXTFIGe5OUNji8s3n9vlzmEclUGPB7HUDpHSsGMV3dCo/9KDGQtKa0/JxZHD2q2L4diMFfDWUABvNfUT/G1Z8VjXfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvEY3FhUihTTE9uyyPm9ZUTMiI99q8e0JhRm3Ve/Hjo=;
 b=Hgetgk6esaCMMpRbSPxQ7r1OHJrQlqtR/amiRTOCKGmUGRrXD8iHVNE5hwO8ffGXpLDC1CKYFFGqFUU9OUJxHQg960DmUIJQ0sHFcNsWcq2GQQEADVLcWJ1pWKFO5vUH8fAsMbMTgWgGs7LyDBqFXPNeUeKAz7YC/CORccYlYQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10255.jpnprd01.prod.outlook.com
 (2603:1096:400:1ab::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:29:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:29:40 +0000
Message-ID: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/26] arm64: dts: renesas: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:29:39 +0000
X-ClientProxiedBy: TYCP286CA0249.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10255:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed6f85a-868e-41c8-d6a4-08ddfb22f9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JvJJZ1e7v3JlOqtRchQ4/OoR4NUnwxB0D9odEmV5KDmtWbl/OQbHCdHVv9an?=
 =?us-ascii?Q?XTVk/9JmoQDA5hwO1+I2daXMn+uHWEnBpKJQktKhvTA7+6TdkXE7/k5PQHJx?=
 =?us-ascii?Q?jYjQzFaOizIR21hMbH+wOSeN1ZgjPyNgZSBlPWzRypghDfzGFefggZUybNjQ?=
 =?us-ascii?Q?KqWPXiiy412XP3K+e/kLOnBGgEAhcJvFlIG+iQt8o9fVND7Alc160N7NK9KK?=
 =?us-ascii?Q?aLKc6C1vX05k84l+Mf4HgK+bRWfNTD8ZkkoXVQamz+ha76aauyZPVs15sKyr?=
 =?us-ascii?Q?ivCXNlpiSOyepiDR1Wa37/03VQVjeqR+bdZSmj4wo0y6WGNQXnop2mQRtVKx?=
 =?us-ascii?Q?1FpI7/JJ0z6k5oaybr7Ju77kxi7xuwTWN7ltF/sdOU9BppjF4aRSQNvCKtEx?=
 =?us-ascii?Q?LOzygYUqInN76ERnWqMYm8m4eTxFZRkdudC6gHDpbrhMmT/ekzb/1P08xWO0?=
 =?us-ascii?Q?HwqJuJXCBvzG+5pI8IHdDbB2ns22cvBIcr2KoUBzWUfJaIgPocxXrharzWAb?=
 =?us-ascii?Q?Pwrs4mzyuWpZ0SelCx3ByL+3yCIuRCbQ6ZfnTyuhhzruXvWmVykAMXKdvfWA?=
 =?us-ascii?Q?8BMujnTr3OpWHaulA2zImaK0OGPQT3zyxg/NFyQx3wr9Gwf+Clz8Yr53/Yy9?=
 =?us-ascii?Q?rEsaHPuKESqzi3Xyc9b7lVl6JFMOj09vm5h6oMIKGQ5SobGqmOo7N+MFjm4k?=
 =?us-ascii?Q?5MYIQCSi43lFco2jY3uceuGHHCEmsVK7b988kgpjqN8ZHrgO/gtTluAsPFqB?=
 =?us-ascii?Q?eNl0Y9tDTp0R2EBcTCN6drGzhfSGayc0cL2pHnNchCIDJqn8yIz+gNyzGkVS?=
 =?us-ascii?Q?DB8MW9ikQrtYCrI4AlCc3wfWBO3LHni0/kfLq2SgII4ViWB9iZFoXVtia0O/?=
 =?us-ascii?Q?6LM4/jefNeVzD/YrYo0N062+qQW+ajDtaR1hzSE7eFY8wacQFbtPQzgC7tBl?=
 =?us-ascii?Q?idWSVl5UkyIAzMd56Ou5rDx6TlAN3dgc4IGsG7b/jkNamv1QzH6CwoAOjM2n?=
 =?us-ascii?Q?aW7m6kXP6lHem4WxRiACxtxgpHvi8kWbj5g3kWYMBsnq2clm8DeHbpUltS0+?=
 =?us-ascii?Q?PY2yJNpj6PuvwchMcPYS629pEF5Bw/QCC/O9oBg4xHWOWQeOfygl3SEQbQWN?=
 =?us-ascii?Q?Snsh7eMxfUrL1SqJJt9dBWsLIAqN4ZmWNZvvQnVlnr36//YGsRzvu3Sg6YI6?=
 =?us-ascii?Q?ABPLowcp22cenKfuCxr6+YntSoINb8hQqO1rKH8Y9anFK2x8WD1b6z9Z20FZ?=
 =?us-ascii?Q?G1wT544A1Xm/8BpPntKEmYzX+PowGTMSfBe2rFneWzsqr8iI2npUtZEBqvFh?=
 =?us-ascii?Q?ASo7jNnirk6ajBQRfPhX/wzmzQ5x+ZyjyFPBxtM5qHF14TiqIUv2ln+fMgnA?=
 =?us-ascii?Q?3Zlc+/NPRrf89vhME9GZHSc0yU8RK3Cv4RpYq+eFcUUYkATmHuPAdueYAaTr?=
 =?us-ascii?Q?av6tWT/IVkQ0eRVpgo5aqMGcC+QfYCgIY/l0f8xQ+45RlGfY1bLB8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i/h18lJHKR5thr2kQ4VADMYZG4dyIJca4tPYydQk6wmoSivS92rY78GTlKHL?=
 =?us-ascii?Q?uPrMQVyXBm9Zad0E0+cc/kPsca52oG2mScXRGV1dKQzPMOPxOmy7XSHEfWJv?=
 =?us-ascii?Q?txvByXdrr7q4kwDQrQmZzUg17EXr05x/Qmh3HGNid0VGotoGdL5nNZz19/pJ?=
 =?us-ascii?Q?XgG0UgwZi0SLShk5nUSZbb7TUG1jx05itR9A8rhV1J/oDdJxWqfNs1Kuktcz?=
 =?us-ascii?Q?C6za98XvHaazDXAIdNw6NTkbwhlXqHfXeVpMRj55yj2Do3Fj/JFk94wrQlSK?=
 =?us-ascii?Q?ghfP6oIBsfElY8djXPu3/qwHMOY8QZ1CDcisWv5fvEKzCdZwVTEvhTERnn3z?=
 =?us-ascii?Q?dTn9dZM7hqoGOk8oLmM3C4w+iIbwHE30aru1rr6nsZ9Py5xhflMNb0VzdOpX?=
 =?us-ascii?Q?3FE1XJvkZSmFS9joJ6s9t/6UFFOO91KIG7rf74uE29wqphs4yNqy8CYbI5eR?=
 =?us-ascii?Q?kaGe0wxFq6TmLGYXguXT/hY6foAwUISnM7aDeVrSMF/iSF30R5FVZlGco72B?=
 =?us-ascii?Q?3+tQIxoozcOMN7hH0A0Me77BlIm4W6BMz4Yxfdf6kzHoijJqLzKCthBTTuq2?=
 =?us-ascii?Q?yEYFOsNMea3cWTQ8cKnzH71hjHR375X0f5epug8f+DVgp2hXzwDloqUPLjDe?=
 =?us-ascii?Q?EMYoiLbj2Sfa/dNUKGqptV+pAO5PUWU1qsDJWoWXM2vatM4co2rRbUs6CQ9m?=
 =?us-ascii?Q?nByd8Iz2I4tj2VoZcZaDE7hWACucl4SE+a5Z+sjBwo09kLi7Ij3KrUPPWBlg?=
 =?us-ascii?Q?PNFhDUiTL6T/M6aS//jZRxS3MNEWQBAl8L30pgl119HuTRWjV1DbUncGONtM?=
 =?us-ascii?Q?ElSpj6n+zaGwzyVF9UJVet+fKgWuH4M+KX7yOSVk1n9NznW5Wu7ax4XBpSdz?=
 =?us-ascii?Q?sjfiNh1kfzcXNKldDb7YHBnpjL++zgLLSWm50kEy08/S6VUM+5gWwfnRDS/8?=
 =?us-ascii?Q?5Yc9JnGhcbq3Uc66mvPGJOOoHXHuNFKsVwD8c4JkK23IVxS00JtrPi2saiTl?=
 =?us-ascii?Q?9do4SDSD5r/aRLD6KWDSsgZKKBNNPOuL4fK4anmKFlVHPMKa/MR/7LFCsKZb?=
 =?us-ascii?Q?Y9b6BxO6OoUA8zhxy/VXOl5Cun2B4SmYC1lHCqmr99Iiw1cQV4TwR3ql4Kqw?=
 =?us-ascii?Q?aW6U+dP2JBK4X3+jvS/dGDC8gDUfQsuHGcKgfYvSauNS6Oa1JytFJVxb4KKI?=
 =?us-ascii?Q?wDj5q5Qe2XMaoFAuazWTEjX70r60kIFL6jWCYV/dh9pB8MB+uF+Ox8HtVzeL?=
 =?us-ascii?Q?BXJeYb27+Y++kMTs1u5znZU3RufqJYKSKcGhysBMk+SflkyyimEyBLYWoezz?=
 =?us-ascii?Q?U1+czVJvro+kIEG4KZEzyzzuVN29PxrpbGuvji/NjA5HdheV59V8YlPhazTw?=
 =?us-ascii?Q?V/gGWBII4Na4ZbWlQnSDAxSUQnXlUa2PMsf2s6Oa7jvkjNz9Jyiw3EFHB3+T?=
 =?us-ascii?Q?hQcW5AVbpVqLxTat14v1H12ElZx8KkgAHv5J8WR6DK5EDDp7AZy36ncn+Dgl?=
 =?us-ascii?Q?pPkSR44O1cp5cBkdsFuqTpS9AFIKDBRvwuDadlGyRvdCXhDCWkpx0Lb6lYVY?=
 =?us-ascii?Q?R8ga/HOEQnNJuBPWG9/25DoBo6oB/csN6T+1Et9G1AuZDSOs5E8lTg8ka3ng?=
 =?us-ascii?Q?RTuf+h17PipZrDvrquXcPtc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed6f85a-868e-41c8-d6a4-08ddfb22f9f5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:29:39.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aSak7xtPKmmk9tsERgDotIsxM1Uzl43AOFvHsPpdYCrqY/oksFuNuK3BjVKeTea2mlOTsAAckFbEOtU8kLNG6zFQJ6jE7h9t1h0Oi7z73ujKUeB8OmyZX/FMPRHQGUv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10255

Hi Geert

We can choose not to use interrupt-parent by moving interrupts-parent.

Kuninori Morimoto (26):
  arm64: dts: renesas: r8a774a1: move interrupt-parent to top node
  arm64: dts: renesas: r8a774b1: move interrupt-parent to top node
  arm64: dts: renesas: r8a774c0: move interrupt-parent to top node
  arm64: dts: renesas: r8a774e1: move interrupt-parent to top node
  arm64: dts: renesas: r8a77951: move interrupt-parent to top node
  arm64: dts: renesas: r8a77960: move interrupt-parent to top node
  arm64: dts: renesas: r8a77961: move interrupt-parent to top node
  arm64: dts: renesas: r8a77965: move interrupt-parent to top node
  arm64: dts: renesas: r8a77970: move interrupt-parent to top node
  arm64: dts: renesas: r8a77980: move interrupt-parent to top node
  arm64: dts: renesas: r8a77990: move interrupt-parent to top node
  arm64: dts: renesas: r8a77995: move interrupt-parent to top node
  arm64: dts: renesas: r8a779a0: move interrupt-parent to top node
  arm64: dts: renesas: r8a779f0: move interrupt-parent to top node
  arm64: dts: renesas: r8a779g0: move interrupt-parent to top node
  arm64: dts: renesas: r8a779h0: move interrupt-parent to top node
  arm64: dts: renesas: r9a07g043u: move interrupt-parent to top node
  arm64: dts: renesas: r9a07g044: move interrupt-parent to top node
  arm64: dts: renesas: r9a07g054: move interrupt-parent to top node
  arm64: dts: renesas: r9a08g045: move interrupt-parent to top node
  arm64: dts: renesas: r9a09g011: move interrupt-parent to top node
  arm64: dts: renesas: r9a09g047: move interrupt-parent to top node
  arm64: dts: renesas: r9a09g056: move interrupt-parent to top node
  arm64: dts: renesas: r9a09g057: move interrupt-parent to top node
  arm64: dts: renesas: r9a09g077: move interrupt-parent to top node
  arm64: dts: renesas: r9a09g087: move interrupt-parent to top node

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi   | 22 ++++++++---------
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi   | 14 +++++------
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi   | 14 +++++------
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi   | 26 ++++++++++-----------
 arch/arm64/boot/dts/renesas/r8a77951.dtsi   | 26 ++++++++++-----------
 arch/arm64/boot/dts/renesas/r8a77960.dtsi   | 22 ++++++++---------
 arch/arm64/boot/dts/renesas/r8a77961.dtsi   | 22 ++++++++---------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi   | 14 +++++------
 arch/arm64/boot/dts/renesas/r8a77970.dtsi   | 14 +++++------
 arch/arm64/boot/dts/renesas/r8a77980.dtsi   | 22 +++++++----------
 arch/arm64/boot/dts/renesas/r8a77990.dtsi   | 14 +++++------
 arch/arm64/boot/dts/renesas/r8a77995.dtsi   | 12 +++++-----
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi   | 14 +++++------
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi   | 14 +++++------
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi   | 14 +++++------
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi   | 14 +++++------
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 16 ++++++-------
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi  | 14 +++++------
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi  | 14 +++++------
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi  | 12 +++++-----
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi  | 10 ++++----
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi  | 12 +++++-----
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi  | 12 +++++-----
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi  | 12 +++++-----
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi  | 12 +++++-----
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi  | 12 +++++-----
 26 files changed, 200 insertions(+), 204 deletions(-)

-- 
2.43.0


