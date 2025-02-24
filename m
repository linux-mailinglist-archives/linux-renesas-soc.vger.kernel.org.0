Return-Path: <linux-renesas-soc+bounces-13597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C8A4285C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 17:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E7943A7E28
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 16:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EF423BCE0;
	Mon, 24 Feb 2025 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hVmDZXbr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A001157465
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740415888; cv=fail; b=c2MoHQWZPL+6Fh0ZraHxz48CGL1YgHA1a2ag0KEDRmIQ9kvtXGd2Xs92hWNvq3qDxu6JHMLWQp+QCf0e2tL5YGDFGpjFbG9ItqfOoeNl00VZT/HX6wxuE4nepcXabSSU40ZZnbuS02lFfb8uBlbK56z91Su7fOx7ESPZQDcP5dA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740415888; c=relaxed/simple;
	bh=c6tWH/jlnioIcd868FQphCPplqBHEIp3fmLFOQ+8lzY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NwvSR4+UKHuHdcPV9NUMKXvtXYTdOad8+gQqY+uwlZr174cLWbzM3ghnVMONBigT0cmh6AOtwvqNIyXZrIvNZU9otUrOqKLv/ln6aNuuWTeSEI87LdYtNS79EI8KQXhKtZp1zREz6qj+Uc1gaoHSprg+LUP3BjENN3EbKz6Wi88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hVmDZXbr; arc=fail smtp.client-ip=52.101.229.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUPVujdFtk62195AuEyyX+gajKzVUqOZyhaYGbSzTl7iRHGtRWOI3sYFdvRSfJKzabHMdf6rovr3wy/IzZ5YO+414Peo4GLBihvLwN+tOI8MrkbpCU8yG14vbg30aUURJpoGRYtAT9eP7CHUs/lxr7Ggm//lSFnE67iRcnaQdT406Kp2/ITTtwa0pxD8XS46dyMNC7r1SBc8ooObid2JVJtnR/fJBwu1PoLiw/kywy/aFQoz+rhzW66eAhbiS14lghz5oBfmqEmYlbuwzPFDHGvAAIH7L14hvIxfh7x5rU/5i5Eec74RpAb6+4/UfLFyNoDdm3MFz26pRxhh7cO3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZBfOWBMxLspqs8fE9KISVQIGZ7inpIbYsMTLSwcMYw=;
 b=nE8Y1Xu39udstJkC2SRo2IuZD0NqAyP9wC8yuy5hl3tlCLcoBgnhsvGYkm/y1tAucSJziKB82MOAyOjrETS8LKVRM//Nl9a9u035k5Efeyk6WsJzz0mZwybOSpVj1Slvw3vzBzcA3uAHs/3b4tDOUs5JweSk2T9x9WwjV+3jisICb2ar+nEJQ/W9kbUuOJTNssdUd8cCglEMCpYnaqjs+FFeCpq4Xn/0Be2wdzx4Betqroa8mG0re4zsSaZDQghCvwbc4ao+8bU0DSVFtJC1N5XPUilkVyqvxbajvq1HuOHE8tN25Cr7raW2swszhgtCZlkfoGcLVcNmlbLsYUckSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZBfOWBMxLspqs8fE9KISVQIGZ7inpIbYsMTLSwcMYw=;
 b=hVmDZXbri/CeFLYQ6iOmfFzvN42kNIBhiI6DGAPJVjBfDol32Pi8F9BfmDx2IyqpBWgi9i7NqCdVbPVGIFUDRJMINqGEilsspBAEN1s6D7kPdVypiy1NLxVZUtqEiRlD21i1RDsZqM0xsxE9LsW5xDu8+mLsz+EzWo1Vt/o66GE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14938.jpnprd01.prod.outlook.com (2603:1096:405:257::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 16:51:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 16:51:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros
 ICU_TSSR_TSSEL_{MASK,PREP}
Thread-Topic: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros
 ICU_TSSR_TSSEL_{MASK,PREP}
Thread-Index: AQHbhr3mOj04C0ZTW0Gqyq3ESU+j9rNWeP4AgAAA5ICAACEFAIAABmDQgAAJDBA=
Date: Mon, 24 Feb 2025 16:51:21 +0000
Message-ID:
 <TY3PR01MB11346E0D108DA47D74828606886C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
 <20250224131253.134199-12-biju.das.jz@bp.renesas.com>
 <CAMuHMdWjpdHH-+R5pQ9DJ+_MJQ8Nd06dYcKEqqo2Asd7TLTMTA@mail.gmail.com>
 <TY3PR01MB11346ECB931169C195A63F49386C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <87v7szfifx.ffs@tglx>
 <TY3PR01MB1134605A7E0F71277EBB3056C86C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134605A7E0F71277EBB3056C86C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14938:EE_
x-ms-office365-filtering-correlation-id: 1973fc17-69fe-41c1-20d0-08dd54f37792
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?d7QtAL/h8a31HihBWQ7X9+S3EWdCIDErKHVwHrpbjd/tfZHetx2b2rbvsrzn?=
 =?us-ascii?Q?8e0r7bCj2QUWv1mq/+5ASv1X/32gNGiDIIj4907HzqTjfCjck5Jf03rT9rNh?=
 =?us-ascii?Q?5LFxaGBR9XU1/lL3PhV2bjzBpqzlhIclAMuzF3v4m7W7/Qy7lhhzDDXHSz1x?=
 =?us-ascii?Q?vo4sN0GkzNYPqXFVONMN1KztB7+OCqe/TFeK3i/56h5ZFj3ZFJC/AWm/K31N?=
 =?us-ascii?Q?SzmyCV9j+BE+pC8iUFH89BV+8s0qsdNuXDfoBbWcnpEcPqBUAqXVPh1TmrtT?=
 =?us-ascii?Q?BgJmrjooIx+UXMB3H710NfUH+7BcEfUHjB4xcZ3jACwf9Czt0J9t0GR0LT5h?=
 =?us-ascii?Q?OsGueRumCUnE+RxuLlyoE328ABZIMIkWkzYTY+zb21pXxh41lWanOW3BgUF/?=
 =?us-ascii?Q?60bThuOl1XjCrJiKWt8+9HjDQmuGmgNZIVsU3mP9wiTYJacZgYZNa4/x+Gao?=
 =?us-ascii?Q?JrFYmek5rk0jtLusHb+tpra+xO1SW9al8yw5FCUvuXD0zx0AvnO71X6F2Odf?=
 =?us-ascii?Q?1UzAUkUh3xGFleSQpCkDc54TDYTviU2FLRHMTWVtcqpE1Wkp7b4oMQuTkOYg?=
 =?us-ascii?Q?yJNSUhAai9HSC/gq4zxFHs0SHzLPWbh1HpdQIc+EsGIW/shLf4x+kBf7PAvq?=
 =?us-ascii?Q?CFUDYk97YnAvJVnFbl12qK4Dg6ClmctTtcoUgYHkfmccyJ45fDdBXYwL5TD6?=
 =?us-ascii?Q?xyL5SZTrGBc+94P83igDJAcV9+KLNqyv32Nd2Qt2j3H4sAVFBxkDasxYtGLZ?=
 =?us-ascii?Q?bKs3CF1VahZENHY6ZyLPqMCFsdRsL/OnTjBhe4YWmBhSFoTRYuMdIgYMkVTO?=
 =?us-ascii?Q?YtSYZKr4lZCJnH+c4HgY3lTdy0GNWuGWqG9JtrhpvXFWWGoHN/yiRQQTJYrM?=
 =?us-ascii?Q?xhxjIupps13O/foTccX040mKeCaJL/2VARlqezyfX5ccbmha6NzBEkzJ3Ylv?=
 =?us-ascii?Q?F4LLa8Esnpklv+qhCXJZJg/Zi5DttD3qb/AHcW335TZx1lvWzpFVnlhxl6tQ?=
 =?us-ascii?Q?Cv1XOEX+hC1D0WoKQjghm1SrixOfXlvcz2Y0YuyEsqvVv4sOrDVMTJ21Vf+R?=
 =?us-ascii?Q?kFKVGDjsS4N5XJc3dv1gJ/KHk+e66POMlIo65V9g06jqn/8zUfYZDtHnyg1U?=
 =?us-ascii?Q?0GLybqT6JnNkGvxhCHBpUBhDjnLw5r/dc6wPc/6pSUNeqBsEiRJzU9lTixq9?=
 =?us-ascii?Q?pQyNH3PwADwqcWwu5JoCDCjFYaT6mAfHZ85qEVn2y+G5XgZVUDH86j50Bga3?=
 =?us-ascii?Q?yZUDMi3LS+VHWKQJSJNBqUWxTf4iQyIjjwemwRy/GH14oWoozIjqfnyWDxaq?=
 =?us-ascii?Q?u6B/XCEdw77d+nlwHbvdNpKNQf4LuLY6fJoz6K6tu95Nf0Jncq71UZR571Yi?=
 =?us-ascii?Q?CngWEbaWuuqHTVYODDMgwgTwLvYG3AyOgfPVEedfVl434VCnowsPemkjG1k7?=
 =?us-ascii?Q?WHMyUpbiTHM0x8d6pGtmxqnM+qY7PASI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kzpQHCBQe96Cydj/k/uWdLekDLVEdHn3UDWRc/mxWRBrVqc5rhyTeZbfSG1F?=
 =?us-ascii?Q?9tDcNLki5xOGPZeD3vQcp69tFBYWUlaV5A8vrPzfvQQEGe/e+PvN12JEyVoK?=
 =?us-ascii?Q?qAdkauU8K2KWJ2DAKuZh3sxQty43xSP2J80d4/Dm1jL29kMjVjatV2ZNzdZY?=
 =?us-ascii?Q?YtgD2kAg6N8CrRU6uEjZz7uh9XxqRZlEuBqFJzUnHIPQpWgPwT+L1o/2BQO1?=
 =?us-ascii?Q?/C+oNsxe0fVQfXbjXPaW/JcXArvj+QE9f1GTg346MDhHwDFzQCYcaIfTWSvx?=
 =?us-ascii?Q?0EOIJtfdLVOtUeR74jL1FyM9y515U8BXRhDnFay2nOBTwG814HFmLZE4I09x?=
 =?us-ascii?Q?LQ+udsaiiliK37fU+UKCVbLzf5VolLNSvSYUOG6WUmGs0tx8jE/iVsIVAmKT?=
 =?us-ascii?Q?bkej2S3wZTdaUCFOaTTrgwsawV8BTYtoOfZwzPjgm7a5Kpae37HdHmR3kqzN?=
 =?us-ascii?Q?lvjglO02Otqu2K09gjyPLqsx4hsZjbZcET2EvSWKO+zx2rHz6YOT7Xb7gcOE?=
 =?us-ascii?Q?b7fLQILIX/FIuxVcS1qN5KrnmiacIX/tn1rg2sx6c/yr926N08/JQq46md3p?=
 =?us-ascii?Q?EuulHtHkN9nik64k1duvHHmaxYmEVYC2lrYdkq+kIweuFIo/daki/mu7P7VM?=
 =?us-ascii?Q?D68TrCumCkDhema5yUnMt4NbWGj7je6/TFqQE9dJL6sswwHS6xh+LCcyTChl?=
 =?us-ascii?Q?0S3v78qXdq5YkKLu7QKF43Zd05RR36SCbdBgFi+diJNNdXFVVYMvbmAGBOJU?=
 =?us-ascii?Q?bZ6AJncW8PPfAZEo7JHuukwVoDyTz0tze5q1b2o6KgtrNiPwAZj3VN1PNSLy?=
 =?us-ascii?Q?ZFKdt2iYpFJbSOeH5LJV2SVi6X+j62NomSCFqHOBKbDW0I2rxbYGHNEog+IM?=
 =?us-ascii?Q?oCP5mfPFxTck7cs5egTNUd+6h0/GVXnrZVUcmNYcBTIbkdzDkQaiKL46Y4BC?=
 =?us-ascii?Q?j12LRDzzQ4blXD6PYwjBczxoq/Y9g8Uqn32+w6cCBbvxgbI1Frgajhp+0zoF?=
 =?us-ascii?Q?Rth4g/hNyMzhcNVian8dX+y+IsjlXIi1AgFvG2/VKWEb7tjc9C1FnkgWYmN3?=
 =?us-ascii?Q?vYzxR8RWQOD9o6AV7ciJYlx+4Au5uk3jgpwg/LmcxdOkxN2UOYcpgk7WG6Bf?=
 =?us-ascii?Q?FeeAs91QA176pA9NJ1LenU+/GW5UuKmLBE/QFgU4aSu7QJunoa+BOcXDKBBV?=
 =?us-ascii?Q?yWdl3eVZzBmcAWXaDSMvQTczOwDkrpxUrAgFkcBdBzfusYt7LKUHz6gOhibO?=
 =?us-ascii?Q?hRDXm4/iC5WlF8k4kZY5B/jdjFLgEEbjpaWBBtuJPKhn8U0H+3FJDhAKLsyM?=
 =?us-ascii?Q?nQ3vKQbmuouw3YueIE8KM4aTyUSCi0vetiXaWLRL2kaDgM8Co5mKF2OLwvdv?=
 =?us-ascii?Q?fNFxZ9h8coEbigr+iggWiOOfjFlID5csvCDYzhU5ckLinwD0U1R3TCLC3JKK?=
 =?us-ascii?Q?tjJ9gFKCr8p7Wisn+fQoQG8bdo4OUZrR65rbxL3aiVPfWFh0SEQ7ekOX5gBA?=
 =?us-ascii?Q?eLXMyPAE5Q78+MyWho8gW4Zojs9cnqVRoQZPfw678/RMhq8v6oqWdoFiL4SX?=
 =?us-ascii?Q?rseTLoJjFLuAclsEG9KvbR4oSV0uegGY9uwZmjtkBM4NVDXOCSvN8lQVAQNv?=
 =?us-ascii?Q?tQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1973fc17-69fe-41c1-20d0-08dd54f37792
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 16:51:21.5689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JII+tbYjk2n3iRax2U5ol+F0Mfg14DFmcNWxgeHMe3ajBmx3f6KahpthKlFCN5/eTFi5qfgTz1j4ibm++qp8ffgplu+2hBj6gd2DCByyYKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14938

Hi Thomas,

Updated patch#11 by using field_width as macro parameter.=20

Cheers,
Biju

> -----Original Message-----
> From: Biju Das
> Sent: 24 February 2025 16:41
> To: Thomas Gleixner <tglx@linutronix.de>; Geert Uytterhoeven <geert@linux=
-m68k.org>
> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; biju=
.das.au
> <biju.das.au@gmail.com>; linux-renesas-soc@vger.kernel.org
> Subject: RE: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros ICU_TS=
SR_TSSEL_{MASK,PREP}
>=20
> Hi Thomas,
>=20
> > -----Original Message-----
> > From: Thomas Gleixner <tglx@linutronix.de>
> > Sent: 24 February 2025 15:53
> > Subject: RE: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros
> > ICU_TSSR_TSSEL_{MASK,PREP}
> >
> > On Mon, Feb 24 2025 at 13:59, Biju Das wrote:
> > >> From: Geert Uytterhoeven <geert@linux-m68k.org>
> > >> > -#define ICU_TSSR_TSSEL_PREP(tssel, n)          ((tssel) << ((n) *=
 8))
> > >> > -#define ICU_TSSR_TSSEL_MASK(n)                 ICU_TSSR_TSSEL_PRE=
P(0x7F, n)
> > >> > +#define ICU_TSSR_TSSEL_PREP(tssel, n, f_width) ((tssel) << ((n) *=
 (f_width)))
> > >> > +#define ICU_TSSR_TSSEL_MASK(n, _field_width)   \
> > >>
> > >> Nit: please use f_width or field_width consistently.
> > >
> > > With field_width there was some alignment issue, that is the reason
> > > it is shortened to f_width.
> > >
> > > If there are no other comments for this patch, I will switch using
> > > field_width in the next version.
> >
> > If this is the only change, then please just post an updated version
> > of _this_ patch (11/12) as a reply to the patch itself. No need to
> > resend the whole series for that cosmetic change,

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-rene=
sas-rzv2h.c
index 8d0bd4d69de2..7bc4397ec149 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -64,8 +64,13 @@
 #define ICU_TINT_LEVEL_HIGH			2
 #define ICU_TINT_LEVEL_LOW			3
=20
-#define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
-#define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
+#define ICU_TSSR_TSSEL_PREP(tssel, n, field_width)	((tssel) << ((n) * (fie=
ld_width)))
+#define ICU_TSSR_TSSEL_MASK(n, field_width)	\
+({\
+		typeof(field_width) (_field_width) =3D (field_width); \
+		ICU_TSSR_TSSEL_PREP((GENMASK(((_field_width) - 2), 0)), (n), _field_widt=
h); \
+})
+
 #define ICU_TSSR_TIEN(n, field_width)	\
 ({\
 		typeof(field_width) (_field_width) =3D (field_width); \
@@ -326,8 +331,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsi=
gned int type)
 	guard(raw_spinlock)(&priv->lock);
=20
 	tssr =3D readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k)=
);
-	tssr &=3D ~(ICU_TSSR_TSSEL_MASK(tssel_n) | tien);
-	tssr |=3D ICU_TSSR_TSSEL_PREP(tint, tssel_n);
+	tssr &=3D ~(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width) | tien)=
;
+	tssr |=3D ICU_TSSR_TSSEL_PREP(tint, tssel_n, priv->info->field_width);
=20
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
=20
--=20
2.43.0

