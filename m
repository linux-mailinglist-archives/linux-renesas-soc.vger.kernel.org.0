Return-Path: <linux-renesas-soc+bounces-19411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE24CAFDEE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 06:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B4AB56819C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 04:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433F4267732;
	Wed,  9 Jul 2025 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NLeTwLFb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8417981ACA;
	Wed,  9 Jul 2025 04:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752036684; cv=fail; b=PDxYezgDg6vXpokvsPNNd2q1unQeHyd53L6kfgzAGYht7xr4ESvJrHcp/m8ltYFIz0yUKBanlo2GUVNuKj8sGIFi71clLoXPZumEgx3QOvtzIUMI4z2KmJLqIJsLiFmGoT5xkJ1TJyidW452VBN3vYL7jNX7EcxvLOjEAOCaeko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752036684; c=relaxed/simple;
	bh=V+L1+W7LneFlhgJACW4MxOM+EDhXcZ6lR9Bm40OvQME=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kvz39Punt4HS+3ySzGhaWrI83j/Fpy2sb+egXjj9j0TY/k4Q1CyPYaDRM1+ecc6bjJTmZ5vb1BinxvtZvhn4jzM0KTUqWDtuJTEUkZ72j1ipFFQEzkMVFlI518MVAQUlQvC/3mXjGOHqaLgZ2qFow/ji0jUsCt1mYwzyXcNH9bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NLeTwLFb; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icBv2z00a3SuQLeBzB3vI1hUYsh+WyJa3EsvnCzYNL80iEmBejarllvM350uBIHZ4JZbwAWfSY9VB4zmS8yV1K2IYjvR9pxkNNB37WckhjErL7zpVV9KExcx8/KW53t9V+s7Xt/gd5WnC4Hh1KsyEQy9s14e9xMVWqgOgzR6/G6QQb3ts4W7Dz9Z7G10+50b+vz78Jlh8ZS9YbJWejd/GC60VQEWFgDXuCUllkCF0VGgmVBc9qYSTEindC9rYEDxBMgsrZxb0cGlAZeisxcQyzS6egKbboLv5f5+66KJSwv7yB7xZpGW9zlbCb7KyuIUAFu+TNL0BpCRUvjCc3S6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaeLppkZBGLp2STtLOkCrLHD7O5c7ftnzgkSg+N2D5M=;
 b=u5X7rPbITVHGo42qCpkmdNPBkLtXygGJgoJ13uxVCHScO7JAzwMRzgxW/cigLBCHa8whHVwcT1BYd6HQUQWAwkc7B+Uci78FiG+QtIl+HiokO07y41dmF3HTwd4Hp00u2rvBVqQPLYXxLi7c4v5IWxULowXSrhhKsVJDLf1K6T+0OaFcAjM6dkoA1T0ewC2WhdcTR5wZD7VnLkSaFVEo9TOjRywA3hLfq1R7npvDV/OSmK/YbaB3T6aad3eHAlBWnrUBGxGp6ASFgzdvSblDbLWw56huBd1KolXver3fBL+jGKLUwf6XVxQTHVNwPhLzuF2MJJ2+eVdzvpTbsr2zoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaeLppkZBGLp2STtLOkCrLHD7O5c7ftnzgkSg+N2D5M=;
 b=NLeTwLFbnRx8UYkkgObb33iahu/9WZmzelfVXETmnumZVlR6sbV+xI3PcbEeOBvcf7yJ5sdUJ1WIq7oDU1KsMcl+jHLoAIkcGCr30ski9eppPUf75vHwnA4uQrZbSpIKkDVW6bMQsaT5GCcz41GMZRwPCibDVB95KixXQIsa6SI=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYRPR01MB16439.jpnprd01.prod.outlook.com (2603:1096:405:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Wed, 9 Jul
 2025 04:51:18 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 04:51:15 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH v2 1/4] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Thread-Topic: [PATCH v2 1/4] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Thread-Index: AQHb7+qWSZR6ltvTaUqmsLGike6YcrQoxhEAgABzuqA=
Date: Wed, 9 Jul 2025 04:51:15 +0000
Message-ID:
 <TY4PR01MB142820C1D63335E2637495E4C8249A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
 <20250708-add_l2_switching-v2-1-f91f5556617a@renesas.com>
 <90353bcc-af82-44dd-962e-568e31808f08@lunn.ch>
In-Reply-To: <90353bcc-af82-44dd-962e-568e31808f08@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYRPR01MB16439:EE_
x-ms-office365-filtering-correlation-id: ae423d11-b381-48f1-506d-08ddbea43c8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?72p/FahyU2Z9Zv0YCoZhIHetY+UGVwWvDPIoEjybbfAwS7+Hy4rm82Gql7?=
 =?iso-8859-1?Q?HjgJF8UZBlDIjLe3UgwlB4Ck98o0dcTZIBx/niW/jX8SXYvCuPOrrIeLVJ?=
 =?iso-8859-1?Q?m9leLbuUl69NAj7m1T6RHn7wATM+WOBJnsru8/RzR1exAUTrylinukXu1J?=
 =?iso-8859-1?Q?1etYvleuMoEFbgf1GRl/aBdGHi/y6nksuZuP0GrAtxCitixbeNPtC8ngA0?=
 =?iso-8859-1?Q?ICRLlmnyLdqpmaqkzrsycGqymA5mlY1ubuykSypbTDlQlSqsCHLNeZLM3q?=
 =?iso-8859-1?Q?CRiqnBomXz9dZ+/JsHiFvlADm0MwkbPdttn5a6eOra8ddsdTjlpF/oa0bF?=
 =?iso-8859-1?Q?rs/gsVtmVycYR9jTmZgWUVOyOymCRd98S732dtKiXW5T+OZM9Wgyh9mFbt?=
 =?iso-8859-1?Q?stPAPR745F7YL9TljHH+5fXSjpfj+oLsMFrtBMXIXovU5qyxCpstU2kxyN?=
 =?iso-8859-1?Q?z1z0CjDCGhghyoPebFKbgCUQAXSGpbliUf9CRo/TvEsb5JNjoM0hJpF5Ky?=
 =?iso-8859-1?Q?H7yxnDyVWWSqNs6x/c3cjFDmhRGDOysangS65oek5rodAuL9al62r39Vwz?=
 =?iso-8859-1?Q?ROIZkscgWmm3cjHNV57OQQ+h7FU2hQGV8WH4gJyBEFiUf6MRgk+XVXSYjm?=
 =?iso-8859-1?Q?egL8ZSEKgoHDsgspqXi7j11ZnJtroKGVUSP9U6o1Bn7BQE5vFaGIEU/W8n?=
 =?iso-8859-1?Q?l12KEmJCgN3i6JXGdFNrSk08Jg1xHKzrJOJdtKBA5PA3GBRUYbIqvH8V9L?=
 =?iso-8859-1?Q?esv0+GjbPBDfvWQpl9k9bM8bvtPRXy7OubKLuRZ6jm0U8gCk98SqIBPfP4?=
 =?iso-8859-1?Q?Y0M/5eJ2LJ1wrIPw1bFPvEnoPkA0CayULUd+y07WR0aNHtgKQSprgNpMmn?=
 =?iso-8859-1?Q?r9Qha5FnngjJu4D16QyHnc1RqHBb8o7v87h8kzvAaTflo7szsmMZNnsQws?=
 =?iso-8859-1?Q?7Knfpvf59zm1KRwaDHjVYQJjBxagbEhljsY499xmx0GXB6fm9uzSunuDqH?=
 =?iso-8859-1?Q?KZRe4G98kM3DhLCxn3/ipyavK+BdjIplBro8M8yHTYKdkdqwmQXDCyO79T?=
 =?iso-8859-1?Q?Cs7QbVrzl7TpnReCs7SMbxbjYUyisVtUpfW7A53imaoSOqLfPYHnbdsWCe?=
 =?iso-8859-1?Q?nqJbVTZIxyD7DMTHLiOSpcF9rf1FkYQ3mqgsloyavTAt+RwMK+knCaT3Zo?=
 =?iso-8859-1?Q?3SnAj56pAhFMamDAklGiy1QnjCcdI2KRqs6fC9YSyTw5UdJKh1LdRpfdLX?=
 =?iso-8859-1?Q?jqRXEyxpueVVey0Js96sDWwqj9GAUpgDyJ1tg0IgzUbBsIRfFM9GkCKqtt?=
 =?iso-8859-1?Q?W7nVSxSS1c5cmDfxkFRdxFg6r0n5ir17+MFG3Yqm/AYDAa+gwyUpzSVFbP?=
 =?iso-8859-1?Q?bMaFWVIwqfKQRKQw8BGUF8O8ALtTDEVkl0Ebi+3uiFwVaGtEbRsxX9uMh5?=
 =?iso-8859-1?Q?OgxPr60ZvRghBo75yapOzpdD6A6eC7/a/7Nx8P4Vt0Notv/ye/KRx3L3ZR?=
 =?iso-8859-1?Q?EpRco4K2rRXeTr+eT+85NVyPLtKAXwvNt/UjsQcshBCw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MGHUrIOv+ZxHQN43ZkHS2thpxfw73Xz2/KNeL+637cD8Kq3rMHSDuoh1aN?=
 =?iso-8859-1?Q?ELNG9sxEDVARXxV5eGkAtDNP1wTgvRBe+mD2pwzEo7RrLEqpRgVKOidWBh?=
 =?iso-8859-1?Q?cLKAJVl+718IRntMPt90gu9jIxqqR+rvmCTxJHdq/vifN0OqsXcAe1OOa1?=
 =?iso-8859-1?Q?oP0yRBKxTrs1Qj5dhsJqVA4GziGin13ADib7WS1QT8JgRRD1JsyDrwoQ0x?=
 =?iso-8859-1?Q?quLY9zI5BLvCdoqShLL7pijmFoZH/RmZE93GLxz/WOhAxMAShcNXVM4AXV?=
 =?iso-8859-1?Q?ZNPVsAMZK7TKIkQai2z0JaibK/c0S2422kVkJpCsiIMqzB4gUp/QSbCLxz?=
 =?iso-8859-1?Q?PX7Bt7CBfC8bwg0UP6Wd6eAAjUu8DPx88Nvjv/iC4Ae80GVnW2UGyRcXTb?=
 =?iso-8859-1?Q?+mFD8Pps3TBmWTR1oFPS9wrtaW3YrDOR/kJAsK/1yNw27sGVxGut67RjkG?=
 =?iso-8859-1?Q?OsdT6FvYci9D7aFUDooDEA6DGXIe9hsw2DfJdku50yeK7Or/vMj8C24ANP?=
 =?iso-8859-1?Q?pb3HnUU5UanNG/Sq00OMJHM2KiOX9jB3eIV8qZhN+WBXVQauQoM0f/9PqO?=
 =?iso-8859-1?Q?D3XR6WZQI0B1Xn5QWyv546YGrmfVThpMz7DEwXgvjdJWYwEpb0q6SpNZFE?=
 =?iso-8859-1?Q?pbRLA1655mmHvMtbvifv+aRjK+BGvJtUKZ3YKcb2IjUBIHqJdqVEHIy5st?=
 =?iso-8859-1?Q?giJ3JD1NNvhdFRh4rn3b1FnAe0HmoSVB5gRaBuKV1s6M0Y8YV359Vl2EVb?=
 =?iso-8859-1?Q?ZAhVOik+VgvG7D+CI4J9voyot8l7bpFcYYEarqEDHVuvNVHDemPD+GNRGF?=
 =?iso-8859-1?Q?JYq+RqLGYJFHf7OS0zXmN1rN+BxfVJplH7t8/EY/bBoxLEQFDH+/b8/Xim?=
 =?iso-8859-1?Q?feyuDayEni/xsahiNrS6CkAIfUlCIbToQBNv0yujXomZ2EaMLTTRfxwG4L?=
 =?iso-8859-1?Q?qUXrGpv8UZWlcdrcIm3C+W/heWil4tcejsEYeo540ClTiRwxgcCKXvQa9u?=
 =?iso-8859-1?Q?uTUlb1jSatf55ikbdoJ7jtWRTdSVV/gmJrRVEaZWqrqQAU+xSOYbLnrw59?=
 =?iso-8859-1?Q?KZeabyaxG51liLx1MxyZvdouhfWuXRmo1S00W7fcpsyj9FRz1e/9Z7mkTk?=
 =?iso-8859-1?Q?pd8v9Es7CwrTGcbGAeA6H8s9owQTAxAwYUzFm6FXDRwRGWNeY1uT6xaPy1?=
 =?iso-8859-1?Q?rHy87vtZy56UJLxYj+7U6XAsDMppTfv3hRI9DFxuo1uBOSbF09XZXwNu/q?=
 =?iso-8859-1?Q?p4tc/fJww2RvJG/ED+wkF/m8fROyitUGCzJfUqV54SCMKtaakqpzOSUkjy?=
 =?iso-8859-1?Q?z+e9aq/Z2p4rExP/M8qEpfnjHWw/qcICRiRDKvmuCobAn0EH4VGxKOBTd1?=
 =?iso-8859-1?Q?Ruvwys6OlkoMKJ2e1mtM4DpAYlE1LoqL8C9xJynmU5+TXU+xlgcpsY4JFh?=
 =?iso-8859-1?Q?ycQL6e7aXoYdje08svnJfX/rmFJmwSZ5DiD7FpQaN3bmAVDA0wGLQDTzvF?=
 =?iso-8859-1?Q?mkutzaVpvrNtsSAXpqr7SeXJ+Hf9UB9hyrnoxO5/xK5HA+vg9uiibHV6IZ?=
 =?iso-8859-1?Q?tITWQHxJs+PyHtYGmwjEmf8jeWP7bReA+3dyYxPB50DnVajeW37FvpFpbm?=
 =?iso-8859-1?Q?1rYqT7aPTEFuz+pvJyA2n7ZSJvzWTHp3LB?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae423d11-b381-48f1-506d-08ddbea43c8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 04:51:15.5959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xUodEol48xFrULP+GtgCF+MYRU+rjMbOl/FW2CRiQ+nE6FJBab2VAW50E1/oYrMn+rJQn4krgoEMc+knOLeEErW0bAX7rgDA/YxuurjF/yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16439

Hello Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, July 8, 2025 11:55 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Niklas S=F6derl=
und
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Andrew L=
unn <andrew+netdev@lunn.ch>;
> David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>=
; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; netdev@vger.kernel.or=
g; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; Nikita Yushchenko <nik=
ita.yoush@cogentembedded.com>
> Subject: Re: [PATCH v2 1/4] net: renesas: rswitch: rename rswitch.c to rs=
witch_main.c
>
> On Tue, Jul 08, 2025 at 11:27:37AM +0200, Michael Dege wrote:
> > Adding new functionality to the driver. Therefore splitting into
> > multiple c files to keep them manageable. New functionality will be
> > added to separate files.
> >
> > Signed-off-by: Michael Dege <michael.dege@renesas.com>
>
> I gave a Reviewed-by: for this patch. You are expected to include this in=
 new versions of the patch.
> b4 prep can do a lot of this monkey work for you if you use it.

I am sorry, I didn't check this before sending v2. I am using b4. I don't k=
now why it wasn't added
Automatically.

Michael

>
>     Andrew
>
> ---
> pw-bot: cr
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

