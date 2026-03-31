Return-Path: <linux-renesas-soc+bounces-30662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Hf5GzgJzGn+NQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 19:49:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E9936F5E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 19:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4157A331644D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 17:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031EA313293;
	Tue, 31 Mar 2026 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="f0+6x7yh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566F3128BE;
	Tue, 31 Mar 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977043; cv=fail; b=V5zMwGyof95eJAg2Dw6ukXWMrxOzrBodWo7oBGpChlUtM/yBGoOXUSN1XN8uhNXXs8qNaj5ZMj2ct4D0geIJ3QGIh/D4eh5RJWF7WmXWI1k2T5Jhp50yxcD/3HLvPk0dXoyuKzl5rMEqvWAQd3+UfgjX7mAj+LWYvMkjUkiaQEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977043; c=relaxed/simple;
	bh=xhW+qcc9IF/PtalkWplDxB7Tmkv2KODam/MqI11J/8Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j1jMthAI74aJQpvsh+KhPgX+z1gSdihorvzwKiFOlRFJz2JM7pN8wVD8HlNodH0XHR8CgC4kn0WAfY5ytAF33uwcj1wV6GlD1dcGqX3Sbhfact6tfsmblx2hysZZXlKbmzv3RquYbaVgYagxASI8HH05iilQVRHBdDA9DHau5/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=f0+6x7yh; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbWmadX582zLc0ZUqqlVJHwXhUcbcE9A2hOLg4PrP7IJo19jeo44p+iuchXDYUggZgEZbCK1qy+08RkrFYPupe9qzl6yMsow1STKS66Jzj+rV1+82mMDn+MSe9R9JqT3OKpS15l9c4+idpItdAy+EI5/Iq6hlhbsuMAhNX8//bLuqDI+ejplhx7V/3G+xshzP/7N4laBVX84C8P3aIcC0hTN4oUZFXT4GaWk/PT64o+POFElQJ+A5tjq+DKHMiP7R7GWNIl5IiAsbIbN3BU7/aaGjICyGTnNIZDhnB+v2nwCbYCxMZJcfTg4H7ZDLHyVBD95MHctW6HhslbnB9tb4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9/6dNrTdEZLfrEeLEItW7YNucwP0X9E4a9U8W+xlBM=;
 b=P4gt9aFdnsZn9oDzDe4T1vLXXsKWha1gcbA1dDVUNwBKVcgIVpHKufsCUoHdKwCTiVo+vz9aSrs9kDKBYcNDFkM0Rr743lQDB0Tz5L8sToEfLOhOSEGlkCeN9FGLinpDxq+uYb6HRKb/XiDZdeCK4GWnBl3+lEWSV9UEbfNy0ZIwImBaomuriB21VgBJIfzQOz+wVQvmLg8Ry7T5cgKT2bh4uG6Ikju6to1Xm5seCe48ig+f38ikdlmgCQzWOHjcylvwAKvOKcFBC1RT7W/rpSNK7fXm5/hh37GLqFpcFmPC4MUnGm6mw69Bc4/WF96Pa0V54kk7b6rCFmSNPswT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9/6dNrTdEZLfrEeLEItW7YNucwP0X9E4a9U8W+xlBM=;
 b=f0+6x7yhmO5gXB7TCd+rU9CCF2OSZBDmGrXfgrqsedXA0K5R2QHxEoMQ4yfHnkPCSqRtO21la7CpbAlbwMIU1syGJ0AaGFnopApNr0iBzLg1fhzU18pNNIG8t1buoqnms03uY9O4ikPSVU/zTuo2pj1dWN22Ok6N37suQq8LCD8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB16220.jpnprd01.prod.outlook.com (2603:1096:405:2e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 17:10:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.015; Tue, 31 Mar 2026
 17:10:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
Thread-Topic: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
Thread-Index: AQHcvp5UlC3Sbj2+60yBPqFW97WwkLXI1hIAgAABSyA=
Date: Tue, 31 Mar 2026 17:10:39 +0000
Message-ID:
 <TY3PR01MB113462DB4547CBE03D94F93628653A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
 <20260328103324.134131-4-biju.das.jz@bp.renesas.com> <87qzp07z5v.ffs@tglx>
In-Reply-To: <87qzp07z5v.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB16220:EE_
x-ms-office365-filtering-correlation-id: 428a5637-00a9-4a0f-0ef5-08de8f486f29
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 RKxq4DsB2+ugbW/YfM72K163pqvkke4uuHS35vAfmFxvM9k2Umw6sEX/VardUz/XVrNljMKpqACbwZmsArGz1IwczmIo3jT5Pb8L7ioIm/69puhFa2RjVOs28WEhIHFnzu2J3QVRDw/iafaDvgvUKHBdUqwJMmSZa55cAIrdxgum2iMtG5SLiJ7WRuU89Qr6ht7OcUg5lD3UTJ7bVIauck/J+fvA48AOVdmwADCi58QNG9nH5l4Zuybnl5ND5tdt/tA3lzZn3gMSRmDseBj1LCu11DhOXCpJPcTGbQYtCShz/EkuFuPCHFyXc01d7ykjdWW7NmHMgI2ZlDFucjEu3zduVIADc4WfZADATf6brIXNd6OnUz5ajPLVUtkE6oV4cOtfR1J/CVpC9Pq6dWzqHRmZvt3cb+i3Zbks6z+X212o0c4HNYlzf8b6EfuAAoHnVYPWKog0JHXOdSWUUwjmBLEnXJTO2+jgNWwTQavygMbPq3Ap2wmSwJ+iY8z5qFUZsVv4i/NtaG5P5XoEZSkMSrh7V8wdQUWIFGqrH3vCVmycilexr8Qq0P4e+1loUEdAX0yfI3/qGUtApdypz+2fFXGwRaey3xHUUU77gHmsKqM5K7fpm7M+X8RNSD93IzWgkw2UFo1f1Qux9/ZqSkU7s6wm1G0Og3hEjBnuulrGu3WeCk3A+xDLT2ATGjeizcONm6ZcJ8IUUprV9IKPPG0ZGW+2SMgMIlX3YXxqX+jylgDBOgYXsp9P+LVdNKQV1jj3Ppzze+jRUZWtQjCVC6//fdBgergquNu6UPUYLLThesE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?t4swtrbWtan9rnLahTf06NscJYziE93ImqUUWHz0zjHN323cyVcnqHTiGBcB?=
 =?us-ascii?Q?r5190RwEvakgCQH0jzvJRWMlfwGAHuM9TlPTJJdmPpr1T8ei8AqbyiT6JP4A?=
 =?us-ascii?Q?AzsINSianbU7ee77DLJfxoGpmKQKQyx7Egy6gZ5HjcyM9mn8yF5FtBVf+7sA?=
 =?us-ascii?Q?sQBpSCvTYQO7qPWvA1V63+5LUGS4MzIW3Bz+0HB0V0Wr/Qs/VPyL3oTRXqjH?=
 =?us-ascii?Q?keZilGkDfWgYLRihU+lqtasrUhU05Doh0nTDMoJscNKgh+ChoxiVmGmKpCcA?=
 =?us-ascii?Q?Xu/IKiM5CYYknq/x6XiVu/nZ5bbC4TaYIThMvpEE7VAHHz73qUi9HY0w3CIs?=
 =?us-ascii?Q?HRROdPY9qKaIsT0eKHPY1rkKME+OO8qB65jzPaEMYsksai9osHG3AVwM+DZV?=
 =?us-ascii?Q?j5rXo6cNN0VbFTyfmWugkX+S9Hwfus0eo0qB9yYYmMEbN0j0RYThNdt5jZnG?=
 =?us-ascii?Q?WD2yT/8zWyMhRTDlbPOFd9uZJrxKcYG+zlSwYpn4yTHrp85CSS18VAKS20fI?=
 =?us-ascii?Q?cY00Bfdhpf60Jc/MKUXUowpf38OtCxhUfAJxm//ztS2MVLA4JnOlVLcbeQrW?=
 =?us-ascii?Q?GUuwUAtJrMqmZ83q7kOAVg3MOI2ov1m1YP+cUYUnPY9FhG3eJ7OTPafHl+om?=
 =?us-ascii?Q?wZvRad+7LJiLhWGNsyzy0wjtv1bgg5kM0teserMHWNdeyrh7QZlgV1Y0cjdm?=
 =?us-ascii?Q?XJ8Jnsa1yNcq2PzCS7K/KKXZC6L3AmNI4B901MDGql395hKsq7rW3kClmb0J?=
 =?us-ascii?Q?C4NZ/WwY61WSQ0fYUhDa+NPmbeLopzUOCufiozRw5eHcmEi8vxivID4zG+tm?=
 =?us-ascii?Q?L5jcaBvAWwMNZl+yRSVcndwSDptrkZl4x+71TKT69wzosOQ9kt5Tk5lAt4xm?=
 =?us-ascii?Q?vpfmzwXoDfoQeGVv/ILv2YymnjtKspYURvrfP5hlxXBLcEAZ18iqSV2HhwCH?=
 =?us-ascii?Q?3muygvN+A5F/tjp0uoiZJg6nrNHZ3KoeF16wP8dmnKMYH3VPM0wWDwgVedLl?=
 =?us-ascii?Q?tVAd4mqu1wchjuwJPGg0oKFXzEqPQQOMcQq1l7CQowizvvsPYQKZeRNrwoXS?=
 =?us-ascii?Q?1CQO2e+qN9aqw+sgGoxk/x5X5QZoEs7YMY2ZESVVEzjUiOZeN31AiHW4z6W7?=
 =?us-ascii?Q?3CTkA26N4uYvWWg9R0kyOOhPq6eSSb4ek2wbXnBd2R5aLlB/BUMXaKubOa66?=
 =?us-ascii?Q?ZMI6y95uE2vN4rEqstxXshSwFBZatx/uznAiv2FGQRmsBZFZScPVniCLT2ff?=
 =?us-ascii?Q?rv0+f/3Pi5UG5Y1wMs7EaoKflQyYrVgZNBcoiny0O0cfsDs+qxnFLH/wnceU?=
 =?us-ascii?Q?aAIJvAMoyZFhtXd+Rwo7tTtK5ckK5Cu9wAgu47qoKdUzROJOz2LhEthdtwQK?=
 =?us-ascii?Q?+LIrHYLgN+ixz8Bw1lkwzkWBnfbSiFIJW15DMo7RoNf9IHd5yZv/1Th29uBM?=
 =?us-ascii?Q?flxpB7wARKoEHkL/dYnAhyki9ThxvokPTPZbFZyPHQMs1vRgVSViNBo8Xri6?=
 =?us-ascii?Q?aaN4g4gsN6w0uXheyc1y0n2sUSgIxKH97a+1pup9ROQ+EL6+f3PSLJMra06s?=
 =?us-ascii?Q?sPHVOVMUmt93ZjTMNJtGJRGRVwnZ8Ww8eWFs+vCK+6equNY27Q54HRivmumU?=
 =?us-ascii?Q?eISW07mpBkFTp1tV7JAURZcv1Va6rFdgK4dp60Q1gSbdVz4J3g/Hty2Hj8Ew?=
 =?us-ascii?Q?vH7KygHG05UYX9lDyZmMotizwcmgeg+8Td/F/2vpQZ52KHytOJOwAumLPEK3?=
 =?us-ascii?Q?YTaIsllLNQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 428a5637-00a9-4a0f-0ef5-08de8f486f29
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 17:10:39.8089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g9RG4scJdCu6vCT2/ybsYamcJg1Aqzcj0INtFNQs6k7uEhcG8ZR9VdCYPYozrb3qQHjNKmcppvih7KB3g7pYYoDYwGYmSl0NsnXwypFXvdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16220
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30662-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 02E9936F5E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 31 March 2026 17:16
> Subject: Re: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
>=20
> On Sat, Mar 28 2026 at 10:33, Biju wrote:
> > +static void rzg2l_irqc_nmi_eoi(struct irq_data *d) {
> > +	struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d);
> > +	unsigned int hw_irq =3D irqd_to_hwirq(d);
> > +
> > +	scoped_guard(raw_spinlock, &priv->lock)
> > +		rzg2l_clear_nmi_int(priv, hw_irq);
>=20
> Is priv is shared between regular interrupts and the NMI?

Yes.

>=20
> If so, then you can't take the lock.

OK.

>=20
>     // Some other context (task, interrupt)
>     raw_spinlock(priv->lock);
>=20
> --> NMI
>=20
>         raw_spinlock(priv->lock);
>=20
> --> Livelock.

Will drop the lock as it is not RMW operation.

Cheers,
Biju

