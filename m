Return-Path: <linux-renesas-soc+bounces-32142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKGVFqJg+2kuaQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:39:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A88874DD688
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD09C3077298
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8953E48C8D5;
	Wed,  6 May 2026 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RtPJ61aJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20903F1676;
	Wed,  6 May 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081667; cv=fail; b=JGLD6i+YmCjiECgoYs3pGQ4od3XLzX8yfKTcr/cfjqWkgtOas5FITWosL0WD0qlv2SlxcCF9bmi7QS4GNfZJy0KynqdLrRcGA4+NJZLYVDXMgcJIArB/MTg+gqhS73Mmn3Redpelmg5VyI47eibQZ5LRyThHVt89MXKSMrJ2YJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081667; c=relaxed/simple;
	bh=VGBN0i7R7QE2MC3VmYHRrvzSYN0RoJbdI7IX65MLbE0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TzfPBPgyXd6uohvK3HZH+8wB8VCsMRJ2Mvd58JeDjvZ/CZLZcchZk+C6sPgDOT/qhCFMDjBqGwKLVJbg75KpG+LJRMxas8yZylgJmzNj/F6yYkwYqTvZJePa4eXmoDKJzUc65lV+4TBNu/WxOgluygGtMtO3Xi9zysj8MbIC+9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RtPJ61aJ; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ija0YOG4T+Kk/07ZVui716yBO9OUruC65lls4+0xymBAqOcQ5gDkMYOs7oEUKgiKn2VqbT3GCls7qCgyZ7kj2ClpaHbFTDHMphGolDIcjdSEoF39hp4Zyce6rsQ/09SfHjNiEdfIJKOd5tbN/HyQ2P2vhIAHqm5YyzWbr3VsMIy2GzHPOvSn/uCy7R0dL4dEHGuTnzfgTSQdZXzlVd2GRagE3Iy1PLj0OUx3t1jsYkXEVkPzaeMTlbjTSpHj7YVbaWb2imeWRC3S5THHo8LczNlV71DjYoM9jgFT6HHMd421JZxwmDvxSrsjO7ErSDY7Vnns/sX54Jm68xrp8EgGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B9YW1Ck4qu2cjRy/tdGiyuUBQqV/sa7sjOilg8iEYU=;
 b=xnsuhzOOH02px7P/TRyvyJ5HNB925/zUfOz3F/6ubyYcXSzBKVFTxrutlB4oyd35Y2bABZulHWQ3JmcO95let1wRBnhIHsvaDVWyWYGhkQ88nlg+cQXbM20YS/WzLwR+AL2fnEqyXfWMc8Cghfj9czCz5JBWFt51EZmPdACQN79sKO15FFTrwv4APHu9tyaDmu9oQk1Bi6FzJnC7n8xiZBuTkZdGld1qdoiRCMGr2wg3tIezTZP7utQ7we2qFD9I6ZHJc4H7FoIrKGvMCXGsBbhDfu9kkvitnCjZxy2TRnScZ3DJbKk6KYHy5BLyZuJqe6NmGzhwWfzyTBY8eh1Prg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3B9YW1Ck4qu2cjRy/tdGiyuUBQqV/sa7sjOilg8iEYU=;
 b=RtPJ61aJnw//JHMREBv8+34o9+0SLiu6/jBNQESu7dPp8Iq/xVc/LY0xsjygGI0S6np19Ya4uTDDvWugY3ZBLlNeSqZUuiVLe4l5NeehQ6jsO3BBMnQT0r+7+Wxbokae3fBjAkKuJgTwL2FsrIydQ9WUPeValu9/4DGmyVUfwvI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8218.jpnprd01.prod.outlook.com (2603:1096:604:1a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Wed, 6 May
 2026 15:34:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 15:34:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hans Zhang <18255117159@163.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>, "pali@kernel.org" <pali@kernel.org>,
	"ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
	"jianjun.wang@mediatek.com" <jianjun.wang@mediatek.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "mpillai@cadence.com"
	<mpillai@cadence.com>
CC: "robh@kernel.org" <robh@kernel.org>, "s-vadapalli@ti.com"
	<s-vadapalli@ti.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
Thread-Topic: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
Thread-Index: AQHc3WypLYbFrTGQQEK3Lt/fnk7ymbYBIExA
Date: Wed, 6 May 2026 15:34:14 +0000
Message-ID:
 <TY3PR01MB1134694C0F3D14E4A69EFB8CA863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-2-18255117159@163.com>
In-Reply-To: <20260506152346.166056-2-18255117159@163.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8218:EE_
x-ms-office365-filtering-correlation-id: b1f5b8f9-eaab-4b5c-c3fd-08deab84edf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 xAntCA+hOnGYLejX/VhdJvJSy6xuw1AkmAnuzvOTs27Rhh+goC16tpX+9xfeA+tkctJYvZAn1zBRz4XgSg1gACiI3sjjHY0GG0yf1wwFTtii1UL7RVzlgJjRnFSJ1RMpK2DpEWUyCMq5Xp/ErQjYPOc67sVBipsjkatNts8ibA6U6W3sVH3tgzSmvMCWZJNHGqcRYBlS7+WTBrkJsqOk3mttq0qLAMtjvqVM1h7oCzzeankoqJlrJuSKb74ryRv69wjZZyXF6aFTVVqwytPdoy1F3UGcDIriwOYBH88nIuKeIVi4AVHrFgJizuwPtEX12EJZtonYnls9RBCBFWy1Rd1Ftltzb6TA+GH9bCd6Bu25GMrIkIVJpMoFQQOuyTbkEVtn/gib26YDEK0P8gMjd4c7ZcdcIHQs+lQnGZLmAHvLOi/rCTGjD3EQVIvAoFRwtabFpjWVMRtKsza4MVXP68b7byN4/U1AyvzyW3uhrsJsQsXs7hf1FKi5IzwufEpMe0X2lImNU+8VxBe40GX8/jiroTI7kzcbQ9yxCNiBkrej0LmxjvdX18Wiwr7v1xJUbMPrYQwGxg6DS89jzXxKrtAQOmNMOcTgzXpyTBctMd5t22I9HSX8qo45F8S+viowKElQlZJC4q7TmtY3AwJsYjA1MV1zFI6k4Nl5LrcKX/Lko6tnnzqXbbl0ZsXpBOVnE/m6BpcMkcTSpbT2cLLwYLlb2XS875oUulpY/V07Fmx8J5x7Gns/MHw4s390thlXBqhQYqrtdgo5m31NBrh8iA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QBb8NPB88SppxanmO4JYuzSCFcKdkbPU7Rnyy75ZJdGgjwpbWq4o+Q9IGK4r?=
 =?us-ascii?Q?/3wCXcHSnJZr088BQIN8HtygQJToCLZ6CTNPGv3ed0ZTtUZm+NkqJffCijvq?=
 =?us-ascii?Q?Z1LGCALoO3dXjj8VR/rqre3IDmcPhCW4OCT3kgir7R7StRqIPMMpEtriAZ42?=
 =?us-ascii?Q?9ngGFfKQ6+eUa0iwHmZEu9xZwt0iXpsBsfZ7RubkXAHw+9xaBey0kyM8/Rsf?=
 =?us-ascii?Q?4Xacg4kyl5plDGIeS1KXAqcBTVV0BQvUbSrh4HVReSghoAhi44aCnrBWQ9Ff?=
 =?us-ascii?Q?OLfoDnxDujJ1FA7gyy2WR4/K4MCCWNRFegH9afVz7Ptiw26B2Hn8Rh1IBiM7?=
 =?us-ascii?Q?h/0+yZg6+Jyb3bJhJnq5skTrEah7I1ZXk/ttrcSO9x1iouYkqIUctpVDNOKi?=
 =?us-ascii?Q?3F6BWTvQLZa9oSFKfib2tDMisN7ZyaRUi9chLrkHWhp4M3KtDaXnl9zjj47T?=
 =?us-ascii?Q?i/fQIhO9uOvZyGlNPcHuTAvzKlCwe9spyjeJPTyC8TMpUbBVjX7eAIb52LYJ?=
 =?us-ascii?Q?pO3W+Imoiq4WXvbGXI482BG05x4QcZLMFFjHIjjCE241mRSuOuS4QPiSvxWg?=
 =?us-ascii?Q?i1E8/TzcA7u7QmL4nq8BjBNCF1S7F5a+3a5oAjkJZG5PNLkXjU1s82KpnRKG?=
 =?us-ascii?Q?XLBNwhazxexoo/V3UXNWvMRFq+KAsfKDqwUqtF2TKopW6o4FqfZH4z85cb+k?=
 =?us-ascii?Q?myU64LsscpHtnUDx9+5f5sPyNWxdN2715Ta+9S7pnr6DGYQTW54rAD4+9tUi?=
 =?us-ascii?Q?SX0//Joqj2MMQxRmj8RDVrUKV5Xt5f5gkLYKXUDOJow39LZ6OVNCUu2vCZrr?=
 =?us-ascii?Q?ovTgfPs0zWom+52LaYyJBvFVWrOsnDzzzk3cW3SV+Cl6koLa2+y9WjxyopH0?=
 =?us-ascii?Q?j7LUjiLwioJFTOcqQDfgO4ryg7B/K71pVDpy7LTAQS0gxj9OkgLa5RmCD+fo?=
 =?us-ascii?Q?eQSdMlHMVLwl4o+WjyR27xV/T1BB/Of2YBkwM3kr6bFAVY8Irwb7/U2eQ5a8?=
 =?us-ascii?Q?fBvI893ECTTqdWdodAIGZv24WLatr1VtjlaiKGv41DHhI0PNH1JA8riyrrjt?=
 =?us-ascii?Q?GMfudPxMM2Ss4aBqQRYIZxceTMheeY0sVLuPXgbuZoYSERw701D8cMvXZxZd?=
 =?us-ascii?Q?gZ3reTUprwuyEUvnEEKSlDFUyz1dm33kE/D97yeEJt2XD4LhlRxkTy4fDU3x?=
 =?us-ascii?Q?y+q9Eriq9Sb5Xz7i6pTBmRZCmj7rK9Q+vo7glgVl6HiT+nsO2s7Y2R4lzr/j?=
 =?us-ascii?Q?jMHOes/HG+95UiOxWWw2/NiDTaHBcAX1CuM7A3QEupoJvUj1E04jjugLcWrb?=
 =?us-ascii?Q?ya8bIUuH2OfGR+paR6UE04ULSLJWStTL/07e23bx9ycQvjScje5bft+Kkzm/?=
 =?us-ascii?Q?krtdNfYRSs8jj6Bdl4vnOwEGuHlCBt1fJHTlF+cZ3DtGjfJhJyTTIuba/yTG?=
 =?us-ascii?Q?E82L1U19t0dYeoPqxS4+AduH18S2vpz+ZtFDczn5WfKXHwvvMI0tqLk/8AuX?=
 =?us-ascii?Q?s5XHtFQ1IBIHUQgTJ8IGs6STTG3vk5ml+IqI9X7sv/ZNpooKxgDXbaplSRpr?=
 =?us-ascii?Q?BuLz4meNJCEZRLAxPKeWNQ3r2wvNe9/UcGTEhY/pzUQO08jc8bEdosKT6vY4?=
 =?us-ascii?Q?PczllOdswOnMXRzcHujF1MdH9tfs8/RG59xp8YXzDJ4/gGISO+P3rPaPsmen?=
 =?us-ascii?Q?cyhLmU/TcTfHSwcgho7DLS/+xsfvN2otd0Ft5kpwhhDDlTKioSI5bRZm3GJc?=
 =?us-ascii?Q?sBLiNTLIWA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f5b8f9-eaab-4b5c-c3fd-08deab84edf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 15:34:14.9080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAgYJl/hNfUgvRRCRKf/2QNzW7ogANDgj3KxYI5SSb0CkwX1XSBZUfv7gDj/+Ro8+RjvGjkb//5bQ16/uy+i+SEU7r/Kpccff6mZRhOG1eE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8218
X-Rspamd-Queue-Id: A88874DD688
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32142-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]



> -----Original Message-----
> From: Hans Zhang <18255117159@163.com>
> Sent: 06 May 2026 16:24
> Subject: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
>=20
> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream =
Port supporting Link speeds
> greater than 5.0 GT/s, software must wait a minimum of 100 ms after Link =
training completes before
> sending any Configuration Request.
>=20
> Introduce a static inline helper pcie_wait_after_link_train() that checks=
 the given max_link_speed (2 =3D
> 5.0 GT/s, 3 =3D 8.0 GT/s, etc.) and calls
> msleep(100) only when the speed is greater than 5.0 GT/s. The helper uses=
 the existing
> PCIE_RESET_CONFIG_WAIT_MS macro defined in pci.h.
>=20
> This allows multiple host controller drivers to share the same mandatory =
delay without duplicating the
> logic.
>=20
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/pci.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h index 4a14f88e543a..a8=
705a2a2d85 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -60,6 +60,19 @@ struct pcie_tlp_log;
>   */
>  #define PCIE_RESET_CONFIG_WAIT_MS	100
>=20
> +/**
> + * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
> + * @max_link_speed: the maximum link speed (2 =3D 5.0 GT/s, 3 =3D 8.0 GT=
/s,
> +...)
> + *
> + * Must be called after Link training completes and before the first
> + * Configuration Request is sent.
> + */
> +static inline void pcie_wait_after_link_train(int max_link_speed) {
> +	if (max_link_speed > 2)
> +		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> +}

Maybe move this patch to the user??

Cheers,
Biju

> +
>  /* Parameters for the waiting for link up routine */
>  #define PCIE_LINK_WAIT_MAX_RETRIES	10
>  #define PCIE_LINK_WAIT_SLEEP_MS		90
> --
> 2.34.1
>=20


