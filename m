Return-Path: <linux-renesas-soc+bounces-11090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA83A9E90B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 11:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0BEE280D44
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 10:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E5F21764E;
	Mon,  9 Dec 2024 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gpfB1NtF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1922F2165FD;
	Mon,  9 Dec 2024 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741002; cv=fail; b=HAmmGbegpAOkYU68i4N9u7MAomupxaKEq2ekuahN6oQ2nXf1bEVqYrD0K45elbINhbe/un1kA6DLcbiC76jmRTiMdu/aLxwAXKkak8Gdj67URpqgZvJuCGTZUKn9jPgVb8WkSt4TbHS0m3Bx5Cp2i889+0C4MK+UWMorhcuHTOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741002; c=relaxed/simple;
	bh=OWwMnKw3iyuUuXn9OJWy8OHTMqsYFumBxfyt8rhu38k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GQNVOb1KWvynluAtH3ypEzbZUNpMe8eYB4r+1fituLPCmJhRjVF/dqTi/NoNAMZVl0WlnO2dBXhRgambvNheGXILoAjkbslPJ/nk6OAPEc8dPsTL+5Shv/wHC2YI3T22KlGJsrqY6UWv//alFbzGR3qu5Qqjtrq+ny+bU1s1Eoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gpfB1NtF; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUrhBKZ/w81sua35mBjARs/Hdvp8901Z5iADgZ1PA4Msuaeo56Cp4EyBcUqfjZFWwhT4prT0pDIoiKUREsTvcgmofPvXawFUCXb/4E7/odqDLC1zq6l6xcMtrMtalnbL5gi/dASB/zsjHwnUuGE2Zrz/zaGPl3Eo9BaXWYTqXgpOweUYtQF1cn/ZNBM9rXx9fPQ48NJBrONqGWJAwkPMvuYr6ROLi0ctpibzsrrE4l0iZW9Z11ebY3RdbrJyhD/MLnat3q0osKn3GNMSINCa1Mm7zda+e2MbBKNK7F/AhKniDP4fRbev2G/P/nE7nBEd2eNAnQ+IcVzbSPDERe9O2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogWLdAq8zA5GU9Au2C7Lvci57NAjoAdVeZdN+hs3GKk=;
 b=smYq1Lf406yRtXZDUp6O+SDxA3iX2WeuUUktnu1cAKs1n/gjgWyIv9A1xsbN0xzvUmkoJw2WmQFbNnnTsDr5+hQ7XNDV71V8cnx1trlmGdoeD5/i9ASA/8RHsIRrps0JK2baaTJ4p+zAJTWrhRGzkWiLNQGUjf4VBA713Ez+2fGUx7d46v3t6GgnUD46VdZanw1LpjyU2NVNGzWef/cLwDuTul/aLmvRUKqOrcip7syiKWzjRZYNMveqnbvQXfPmhkQ8bQRRKAbH1ogcRVl/xGkUiVJfEnAS2R/z26N4KKZjHCP+/Vu62AOygo1O7jHk7qPFc4m8p/pcB0CJ2iD0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogWLdAq8zA5GU9Au2C7Lvci57NAjoAdVeZdN+hs3GKk=;
 b=gpfB1NtFgATegxthEo+CGFvko55Zv/KT0hUSvS0nxZSzstL38dchTtHKKVtt8Lt3u6AxTLQ3DuQFkaKdEnuf0L1yYfGuLB4VFxGI/FME62e7mMxLZmemrP5nVlO3Ups0HK2uzj4e31VUj4QN+K/fuhWToaRmlAuCZQBqVkwJZ2s=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by TYAPR01MB6073.jpnprd01.prod.outlook.com (2603:1096:402:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 10:43:15 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 10:43:15 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
CC: "john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
Thread-Topic: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
Thread-Index: AQHbSCWICEbBAzxrrkCsh7zbKWm91rLal1OAgAMlWbA=
Date: Mon, 9 Dec 2024 10:43:15 +0000
Message-ID:
 <OSBPR01MB2775AE8E6BCA228071028C10FF3C2@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB1134653DFB1CEB5D81F357B1A86322@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134653DFB1CEB5D81F357B1A86322@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|TYAPR01MB6073:EE_
x-ms-office365-filtering-correlation-id: 08670a7e-e68a-4b93-8428-08dd183e494d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jPqc1mRBAG0bEB0XB5ZRzPFBtgoP33xFuRa/1aUZeZSnvjvw8Km6Y6MGueqM?=
 =?us-ascii?Q?STkJDx8Ez5O1i1UNGKLDbQjiFtz3aZJsosd+lm63bMk0CGlM+KLf2kuAfzYB?=
 =?us-ascii?Q?dG2/tY52j+Qei72q58PjRFMyUJgU2l0Um6SE9s6sN8+mbBEnUIsd1nClclSS?=
 =?us-ascii?Q?B1xqdHXYYrU9HRv9hsk6SJRJtRsY6yxouPJTEzZDP9seVgb3IKP4taclOW68?=
 =?us-ascii?Q?aQxyy8v7KXes7qHUNFFQ0n5PlHWKeQ/posq1hE9wpcg6As37Ow9iRMRsaOcF?=
 =?us-ascii?Q?MtUZ8Gn9b71kKNtKUKVoAsMJQjNvgfhrs8HBOeTUqhW7pVaXcLssgwHcjmrR?=
 =?us-ascii?Q?x8IVcr3XDILkFsh4kN8PbSl9S9aqvJbhM7JRwyPPhe9H3k82smjMoAYZsLrR?=
 =?us-ascii?Q?mWJfDgjeQAX4J767+5w12xQTN92dNKHWreXYwIAUfeu8zXAboG8ahWUCeQIe?=
 =?us-ascii?Q?LeATD09Ne9Se3v9FwO7UsdbChzZogUWhyrsA59yJYYaH/Kg73UEdGFTJULeK?=
 =?us-ascii?Q?InS0V89rCzkh1S2vi5mQ82/liNYayGCxcJEbX+qAU7l22iZiFurHS2FTbmNk?=
 =?us-ascii?Q?9xG7miVTqxLOfPJsVlsCykQM8Pi756qMYKuc7iqNHe35jmFdo5tLuW1Ucxem?=
 =?us-ascii?Q?YiorzZqeN0IL6VgI9e2TQQFTCwqplwwc7fVyAsgDJa+JZIUrHVF+U+nfnJqT?=
 =?us-ascii?Q?wC8o45xqb4uv6j2TOYyKLnoBeUnXyVQKOvVfr6siBCIQKk2W6IFONuwMLxDo?=
 =?us-ascii?Q?P0srnUQna8xIQazryF/ewqw9KH4n1OqaRqy/0Jodynl9JjRL9J4WA5Oqnepv?=
 =?us-ascii?Q?9SAkuD4tS2kFmFkQjXUJy0bGhC9IA5rEdvcIJlrY4Fd1Z0XS8IvQJkrRoKHd?=
 =?us-ascii?Q?viDdf1sjKhnnPMP3E6F0adlh4Xg+bTnAHpwE526q0guhm+Oe4bEKwm4JcZqF?=
 =?us-ascii?Q?PnP3qWVWJm/X14ukJTKAvPOESUygdgCRO8LRIrNxUO6kS4nwtIj41+OjKZ7u?=
 =?us-ascii?Q?W6eVaQcwxCyktzX3/pf06GRmCcMSHEPvdvUkr74qmS9COFNQv6FE/JAywC2z?=
 =?us-ascii?Q?3QvAyLH1CUv9dLjU5ml9e54i4nw59WCuGfDGxkackcvN//VPxloq7rlcjL7l?=
 =?us-ascii?Q?n9DrfS2osKIF5FM4te4v4dkF3N8W1HUA8k3ISS1SmNqhs5L8VNVmYy5mDDyF?=
 =?us-ascii?Q?iKYX6ecyMLChAMlewkf4Ixq3wkvApedJAdVKG51qIjWqIvYHGvj4a05o1c+L?=
 =?us-ascii?Q?hS3GwLhFob80ZxsQPyzT4xfRZX3zgXuFKyfJtu/2D6T4k+bgxgOt3Na1k0He?=
 =?us-ascii?Q?c+LjMWwF4aMl7q7S9F3HaLsU0rker7p7OF7DfRv72fJA393qmo7OFCUfCAwl?=
 =?us-ascii?Q?7oHVF5D02afNKD7KP4EcXK2cWY73MkePNG58o6i3tu2T5taeWw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p8jiwO6zyvT3UbqO1bwl5sVRls9cFqjxNmpem1m7xE7M3qcbgEny0ob472VZ?=
 =?us-ascii?Q?WqhJhuZduZkNtwn8HG6lDoXrzzsGit3IO0eAPccM2eHCKVY8LhWVAEV6rKcd?=
 =?us-ascii?Q?W2UE7ALHR5h1NWMaVWoa89XADxfLvXLFmsNo51YEwYztaZAbpHqv91w5O7uS?=
 =?us-ascii?Q?jXN+4IBOdKwmIEkOxrlbpzWCzF/ndL3SnfZhGatOuU0s6mOhzFk/gCjaixFD?=
 =?us-ascii?Q?Mk2IP5w2IpxMWeji1Y1U67iENeM+Wc9SR7Ei6rZDH1bHHqnrz8wZ8wcnxA+z?=
 =?us-ascii?Q?lhuX1oMlh/gBmDI2uq4bx2uguyUZGv3VbKen2l8lJPd1Zv4LS/6OJ+/eSEpR?=
 =?us-ascii?Q?awd2/+X0LYCgGKgxR8Tfi1sPkHZ6JIx8cBLs9yWctb+h92y8AVYx55sf4Vgl?=
 =?us-ascii?Q?mm/fNKGGInHo9pfDm9y2Kn/Cj071i9sG1OXWl98Q+kgtjTN57KzMbIM0gJm8?=
 =?us-ascii?Q?SZelil9FUOpimc6Sj+zqfIjG3geRBO4m/jQeGyXcjvM0h+fnllngpaABTqr2?=
 =?us-ascii?Q?nRjAFAgCjmHa1k1VCBQY9o4+4H5BwLlAw2ERRmxFQhZFor7I2RG4TkXwWjMw?=
 =?us-ascii?Q?Xq3LVVwOnpTQeO7jVtl6M3Kf5brYlem0yQ7KTqIBXkvoOm8lMpBpsScoXLyp?=
 =?us-ascii?Q?uPs8PXbgp4gnwiYDW8R5roSkM0QOny0JP+IOegFzycx1vFVZfk/VgyHWRErY?=
 =?us-ascii?Q?3Don4lTaH+3JLv+Wk+u6u743OS3xo034JY5zM5LhM6bn9GdLhuD8FjorEVDJ?=
 =?us-ascii?Q?9nTUFQ04WQ478/xjRMmdguR6HKr9eEXPOXDAf5sSpYO7Kl4laqRWv5NMraHy?=
 =?us-ascii?Q?SFW7i8OqjqsWcdLE9M2vRi6zjdFo0LNKMTAY/aTYUu+Am1LfjtHzXpAjQQQq?=
 =?us-ascii?Q?GsQ8RGo/KQSLuy2Qi20R7fpXUC7f7Kl55uas7vFv0geD/XRJ6iENf2xWdvk7?=
 =?us-ascii?Q?5Z24rtQefb7SXtxhMUS89nMntmjeP4KRzjW31d85q8Olc3DSqvS+JkNpeN+z?=
 =?us-ascii?Q?xl05zoMgx6mEnE/OLSTjEjDn5Ln+/dLOmmk9btcf+lu8Gg4gIhJPQ2p+wFNa?=
 =?us-ascii?Q?jck1LbpPTurOEQB4OkJFzn25FGYeDwUjG7pG1tVtqrElXWbJ/Y9LHK0pyoEP?=
 =?us-ascii?Q?nz3PPJA6ksO8qqrcIJQmEv6KVwD0eTpUfBkcCmVVUyu2/kItqp6pePhn/Ehm?=
 =?us-ascii?Q?CUHxHlhZb69nqsCb0OumH+X/Qd+VmL3ujJl0JsRoQhgmT/1nt5kEMGsZFBjL?=
 =?us-ascii?Q?aO3CGgl9tQNNwjdmM9ZFHHTeo8/EDr9VksqbtmYTXVFrR/EjRKKHADkolIXL?=
 =?us-ascii?Q?9V0qQ9etVSWWcvrjrcorl3/QF8M/1QoWfV11/bKdi99js3ZyUQl8x4vtPmhe?=
 =?us-ascii?Q?lR5HFpKDI718IiE4YljtXq8BBJ3X7EDJIB9NHLNygPb94mgTTUJwYzg2QcZf?=
 =?us-ascii?Q?YPiZzdjncbN2dBCA2UFXs6SMbBpudz8+YOSrrSphDxnkxLa2hhKLffd2rHTb?=
 =?us-ascii?Q?W7P5BhHligDpRtQNwyt57LaU3rAhS20FZ2OZXJE/CBdnXaxn/7qpq4jOqjD7?=
 =?us-ascii?Q?qGydq5z0hneWLNDoR4B/eygeDMPAdvOU8xkq9D8XHo2mS27a0lR2r9EqlgEs?=
 =?us-ascii?Q?bQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08670a7e-e68a-4b93-8428-08dd183e494d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 10:43:15.3029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1F+obuTJx/dt7tAjkGoVNGDkkxBFt6im3eZjWos3dLYe0yWH/+2SufukeJn48LXEz5vk+aDATOkSnoyg46CeZN7tUSt9PJEayp8qTX3F/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6073



> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Saturday, December 7, 2024 11:36 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; Claudiu Beznea
> <claudiu.beznea.uj@bp.renesas.com>
> Cc: john.madieu@gmail.com; linux-renesas-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; John Madieu
> <john.madieu.xa@bp.renesas.com>
> Subject: RE: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E
> family
>=20
> Hi John,
Hi Biju,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 06 December 2024 21:26
> > Subject: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E
> > family
> >
> > Add SoC detection support for RZ/G3E SoC. Also add support for
> > detecting the number of cores and
> > ETHOS-U55 NPU and also detect PLL mismatch for SW settings other than
> 1.7GHz.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >  drivers/soc/renesas/Kconfig          |  6 +++
> >  drivers/soc/renesas/Makefile         |  1 +
> >  drivers/soc/renesas/r9a09g047-sysc.c | 70 ++++++++++++++++++++++++++++
> >  drivers/soc/renesas/rz-sysc.c        | 44 +++++++++++------
> >  drivers/soc/renesas/rz-sysc.h        |  7 +++
> >  5 files changed, 114 insertions(+), 14 deletions(-)  create mode
> > 100644 drivers/soc/renesas/r9a09g047-sysc.c
> >
> > diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> > index
> > a792a3e915fe..9e46b0ee6e80 100644
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -348,6 +348,7 @@ config ARCH_R9A09G011
> >
> >  config ARCH_R9A09G047
> >  	bool "ARM64 Platform support for RZ/G3E"
> > +	select SYSC_R9A09G047
> >  	help
> >  	  This enables support for the Renesas RZ/G3E SoC variants.
> >
> > @@ -386,9 +387,14 @@ config RST_RCAR
> >
> >  config SYSC_RZ
> >  	bool "System controller for RZ SoCs" if COMPILE_TEST
> > +	depends on MFD_SYSCON
> >
> >  config SYSC_R9A08G045
> >  	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
> >  	select SYSC_RZ
> >
> > +config SYSC_R9A09G047
> > +	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
> > +	select SYSC_RZ
> > +
> >  endif # SOC_RENESAS
> > diff --git a/drivers/soc/renesas/Makefile
> > b/drivers/soc/renesas/Makefile index
> > 8cd139b3dd0a..3256706112d9 100644
> > --- a/drivers/soc/renesas/Makefile
> > +++ b/drivers/soc/renesas/Makefile
> > @@ -7,6 +7,7 @@ ifdef CONFIG_SMP
> >  obj-$(CONFIG_ARCH_R9A06G032)	+=3D r9a06g032-smp.o
> >  endif
> >  obj-$(CONFIG_SYSC_R9A08G045)	+=3D r9a08g045-sysc.o
> > +obj-$(CONFIG_SYSC_R9A09G047)	+=3D r9a09g047-sysc.o
> >
> >  # Family
> >  obj-$(CONFIG_PWC_RZV2M)		+=3D pwc-rzv2m.o
> > diff --git a/drivers/soc/renesas/r9a09g047-sysc.c
> > b/drivers/soc/renesas/r9a09g047-sysc.c
> > new file mode 100644
> > index 000000000000..32bdab9f1774
> > --- /dev/null
> > +++ b/drivers/soc/renesas/r9a09g047-sysc.c
> > @@ -0,0 +1,70 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RZ/G3E System controller driver
> > + *
> > + * Copyright (C) 2024 Renesas Electronics Corp.
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/device.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +
> > +#include "rz-sysc.h"
> > +
> > +/* Register definitions */
> > +#define SYS_LSI_DEVID	0x304
> > +#define SYS_LSI_MODE	0x300
> > +#define SYS_LSI_PRR	0x308
> > +#define SYS_LSI_DEVID_REV	GENMASK(31, 28)
> > +#define SYS_LSI_DEVID_SPECIFIC	GENMASK(27, 0)
> > +#define SYS_LSI_PRR_CA55_DIS	BIT(8)
> > +#define SYS_LSI_PRR_NPU_DIS	BIT(1)
> > +/*
> > + * BOOTPLLCA[1:0]
> > + *	[0,0] =3D> 1.1GHZ
> > + *	[0,1] =3D> 1.5GHZ
> > + *	[1,0] =3D> 1.6GHZ
> > + *	[1,1] =3D> 1.7GHZ
> > + */
> > +#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
> > +#define SYS_LSI_MODE_CA55_1_7GHz	0x3
> > +
> > +static void rzg3e_extended_device_identification(struct device *dev,
> > +				void __iomem *sysc_base,
> > +				struct soc_device_attribute *soc_dev_attr) {
> > +	u32 prr_val, mode_val;
> > +	bool is_quad_core, npu_enabled;
> > +
> > +	prr_val =3D readl(sysc_base + SYS_LSI_PRR);
> > +	mode_val =3D readl(sysc_base + SYS_LSI_MODE);
> > +
> > +	/* Check CPU and NPU configuration */
> > +	is_quad_core =3D !(prr_val & SYS_LSI_PRR_CA55_DIS);
> > +	npu_enabled =3D !(prr_val & SYS_LSI_PRR_NPU_DIS);
> > +
> > +	dev_info(dev, "Detected Renesas %s Core %s %s Rev %s  %s\n",
> > +		 is_quad_core ? "Quad" : "Dual",
> > +		 soc_dev_attr->family,
> > +		 soc_dev_attr->soc_id,
> > +		 soc_dev_attr->revision,
> > +		 npu_enabled ? "with Ethos-U55" : "");
> > +
> > +	/* Check CA55 PLL configuration */
> > +	if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) !=3D
> SYS_LSI_MODE_CA55_1_7GHz)
> > +		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n"); }
> > +
> > +static const struct rz_sysc_soc_id_init_data
> rzg3e_sysc_soc_id_init_data __initconst =3D {
> > +	.family =3D "RZ/G3E",
> > +	.id =3D 0x8679447,
> > +	.offset =3D SYS_LSI_DEVID,
> > +	.revision_mask =3D SYS_LSI_DEVID_REV,
> > +	.specific_id_mask =3D SYS_LSI_DEVID_SPECIFIC,
> > +	.extended_device_identification =3D
> > +rzg3e_extended_device_identification,
> > +};
> > +
> > +const struct rz_sysc_init_data rzg3e_sysc_init_data =3D {
> > +	.soc_id_init_data =3D &rzg3e_sysc_soc_id_init_data, };
> > diff --git a/drivers/soc/renesas/rz-sysc.c
> > b/drivers/soc/renesas/rz-sysc.c index d34d295831b8..515eca249b6e
> > 100644
> > --- a/drivers/soc/renesas/rz-sysc.c
> > +++ b/drivers/soc/renesas/rz-sysc.c
> > @@ -231,7 +231,7 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc,
> > const struct of_device_id *mat
> >
> >  	soc_id_start =3D strchr(match->compatible, ',') + 1;
> >  	soc_id_end =3D strchr(match->compatible, '-');
> > -	size =3D soc_id_end - soc_id_start;
> > +	size =3D soc_id_end - soc_id_start + 1;
> >  	if (size > 32)
> >  		size =3D 32;
> >  	strscpy(soc_id, soc_id_start, size); @@ -257,8 +257,16 @@ static int
> > rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
> >  		return -ENODEV;
> >  	}
> >
> > -	dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n", soc_dev_attr-
> >family,
> > -		 soc_dev_attr->soc_id, soc_dev_attr->revision);
> > +	/* Try to call SoC-specific device identification */
> > +	if (soc_data->extended_device_identification) {
> > +		soc_data->extended_device_identification(sysc->dev, sysc-
> >base,
> > +							 soc_dev_attr);
> > +	} else {
> > +		dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n",
> > +			 soc_dev_attr->family,
> > +			 soc_dev_attr->soc_id,
> > +			 soc_dev_attr->revision);
> > +	}
> >
> >  	soc_dev =3D soc_device_register(soc_dev_attr);
> >  	if (IS_ERR(soc_dev))
> > @@ -283,6 +291,9 @@ static struct regmap_config rz_sysc_regmap =3D {
> > static const struct of_device_id rz_sysc_match[] =3D {  #ifdef
> CONFIG_SYSC_R9A08G045
> >  	{ .compatible =3D "renesas,r9a08g045-sysc", .data =3D
> > &rzg3s_sysc_init_data },
> > +#endif
> > +#ifdef CONFIG_SYSC_R9A09G047
> > +	{ .compatible =3D "renesas,r9a09g047-sys", .data =3D
> > +&rzg3e_sysc_init_data },
> >  #endif
> >  	{ }
> >  };
> > @@ -315,20 +326,25 @@ static int rz_sysc_probe(struct platform_device
> *pdev)
> >  		return ret;
> >
> >  	data =3D match->data;
> > -	if (!data->max_register_offset)
> > -		return -EINVAL;
> > +	if (data->signals_init_data) {
> > +		if (!data->max_register_offset)
> > +			return -EINVAL;
>=20
> I assume you don't have any signal use case like RZ/G3S.
> Can you please confirm is it correct for RZ/G3E?
There is no such concept of signal.
>=20
> Multiple drivers/devices accessing same register like USB PWRRDY register
> in RZ/G3S?
There is no register shared between drivers/devices. They each have
their own respective registers.
>=20
> Cheers,
> Biju

