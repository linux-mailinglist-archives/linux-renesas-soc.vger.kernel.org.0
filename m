Return-Path: <linux-renesas-soc+bounces-5964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C448B900A31
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 18:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4121F22970
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 16:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B712E199EB9;
	Fri,  7 Jun 2024 16:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QQcQJHi9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2062.outbound.protection.outlook.com [40.107.114.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECCC1991C6;
	Fri,  7 Jun 2024 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717777225; cv=fail; b=Tk0IhYd1e9zdTPErnoekLWQMCHwq6kLdAF7wtBoH4GMQ/yZ2dxfcgxsYqxkzBSNdPxGilTzt+bh7DVVnEgmjMOk45G9cipiUYOXy926SzL/U4TkL2rG4lCwvfIvbzBhlN8LMt6MSPotJfQFkHb4W6UeppBwVg2hasjeV+Og2eew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717777225; c=relaxed/simple;
	bh=MZjBd/bFBudodF+fpnLFSRIwTRK4y4rQ3cOiVG/B0uk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hL1/gbSPbWZs7QxwA280vpaIIYbd+bBnn8/z0IboebVf4PlI1ONl9eDVx2mdomyrh4SPbp1EiuTry8Dall31aDJvv1/roe5n1OHu805Ykr0mSU/U1+wwzqTu/nQh82PIKhIQwoe6OFW1z+Z5/u73mv01O/m4YT8YaaDmIUp3QJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QQcQJHi9; arc=fail smtp.client-ip=40.107.114.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpE7qNxaKBAL7OZKYuNj6MNW1tSgr30aZBbR4yef+82NqpGFLSDuO+/Jaig7JKg2fmqiIhtpg5qJVcXpWUe1WAr90p53qEk4WqTH5zuLl9GSbQ2Pl5D5QVfpRVE9yXljH6bS9oFCi4M9rUB6yrUHwJtAOrfgRLjYcTAJDDAxLJ6qSSg7Y1Vyn6Jh8jinUCVhcnvUXtUbUGM2gT5EXXlfkCnJyov4srzGzNYH1PwWbf9gCxRiLYoaALGgUWDjzdtv8EHLdAd82EYQ/DYoIV60psoNpu+9825JDEfvr+h2yBZU/YuouR2Dyj1HC7cK45I5gp+XNoQKCuB9P3Zt9/rmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAJcHf0RwM2fZbIYtX6rzmwOJAvBGoKx/8mhKVOomqY=;
 b=ZaaBstjpPUXkhRx851isIjxTE2JssVmql7ca4YoIZ6krlBe0/IxZr+HeCHo968EHPLoAdH0bd1M4ZTQVfmSUTqf5vcftCmCi89FISfPTPY3W66oKwa6YSWMTutriKgF1DTc71zh758oRY7jg+Ya+V1yne9HB1zeFg9q1aEB7K51AhoYE/kau+bgVZPED4YRcUd+Nqq7dLtGLPepR6ny3nIQw7HxI184nqYqQSrWOrYdnZjfxZemvfRbn39Tt0qCwARsUAoj61GiKZhoTH3xtH9tLYiUfkc8vA3DWP8ILoECflK2YaiefJPMLhHDfyRR6iT2mMoEuP/yAfqt6FwPxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAJcHf0RwM2fZbIYtX6rzmwOJAvBGoKx/8mhKVOomqY=;
 b=QQcQJHi9BFIIbPfZStCa0GYh0r8Iya1oRucIxJlsdg2+iS5wvtpksvcS11s+UeHX7yrIo8ue7Z6CcVxgujgHaemukVE2nN7El7DrxpmsYEGIviaTQGju9yY1JVpoZt5/pdCsJzupgVLxuSvDUTOfrS2AQchc3HDj1bww/JpO/VM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11999.jpnprd01.prod.outlook.com (2603:1096:604:245::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 7 Jun
 2024 16:20:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.036; Fri, 7 Jun 2024
 16:20:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH RFC v2 2/4] regulator: Add Renesas RZ/G2L USB VBUS
 regulator driver
Thread-Topic: [PATCH RFC v2 2/4] regulator: Add Renesas RZ/G2L USB VBUS
 regulator driver
Thread-Index: AQHauM8pbcjZIWPwZUmmO1HOljJI+rG8bckAgAAMeNA=
Date: Fri, 7 Jun 2024 16:20:10 +0000
Message-ID:
 <TY3PR01MB1134695C9D89C84EABF7B2E2E86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
 <20240607113745.73934-3-biju.das.jz@bp.renesas.com>
 <ZmMntvriR32aqI-m@finisterre.sirena.org.uk>
In-Reply-To: <ZmMntvriR32aqI-m@finisterre.sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11999:EE_
x-ms-office365-filtering-correlation-id: 487e3e9d-c18f-4055-bf3b-08dc870db3fd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mXS3bqAmKdO171IvvvjdaMg24QN8RLJiFdaKXnq/Ywl9oWbj4ajtgayjQcYa?=
 =?us-ascii?Q?WoUwcpgns+LQzVkfBj2CQE5RffFh7+K5u9f8R8gQXLhMhCpdt5VBUdBWL2JD?=
 =?us-ascii?Q?pCZZQZUg3C0OvaLpVa7VHyZX99y1hGNRAsc1T77+sYfM+KBF97+aJ7lyIv8v?=
 =?us-ascii?Q?W51FVICetzMoTf5W6H61yuAU36yaHiu3lZjNm6gB3Cr4kXNedWkATpjYN+M8?=
 =?us-ascii?Q?oRUtq1EzWt/niyeYyxTcxqpcfqowjCSGEM4JZ3c5opEYyIHYJi+J9UX+y7Sb?=
 =?us-ascii?Q?D9BMAMWu5xvpzHUo/wVk8zjDZF1LoK2JOcIkdgBxXYbjPaUODF3a9A3xLg71?=
 =?us-ascii?Q?sjBEPeppg9Y/Xb9YlioLBbujNs9MVcgBWYKwtJcxIBFco40rhS04dVusSulf?=
 =?us-ascii?Q?xigru+jeejn4RhT+x7XZmScj535SjfHrwb6MVs0Nqxs48HG8Jm8lQnKrw5NR?=
 =?us-ascii?Q?aVjNgrvhTAETMRxe7SXIKNE306jM5MXURTOYR7u4worhwfk8PH+2BHNdXrrO?=
 =?us-ascii?Q?Tm32LYDujUzc5pK5BGcO5IX6Rh5j0sPj2AaCyHg5opliqUK6rYJ2Dn1T6aWx?=
 =?us-ascii?Q?E3GcVvbEVhmbpl+WkTVp5zPOZdmsFdSmIfjJ/HUsAwklD9SksFeuuo0rmzkF?=
 =?us-ascii?Q?N/C/jJG01M769L1gld2drhOaChYFlAp/y7I0AmmOt6mdYrdf0gNmVXS0y54W?=
 =?us-ascii?Q?yZggnyfbCSEfe1G0KuLcIBOdyOGwJhvQiatL/f4ilebLMgIwfYAxR0kG4Zqa?=
 =?us-ascii?Q?FC25UR0tlySOetm75yHJy7zmghaRx6uGZBnCzNa7o397NCgDPfHDIbPcJcY3?=
 =?us-ascii?Q?bUgZWcd+qaEjS/iiN3IuzBx6UA2oB9ulYKQOjZj+oA8owECHVCSz8jBrFPXq?=
 =?us-ascii?Q?ekk8bZdMK1tQtjIPlksqkfBF7iK/7gq9zeIfU0NIXqc3NyPZORTZ4W93H2TQ?=
 =?us-ascii?Q?pgtU6Q6tPHcoIakpna8CuEF4bq8bW0jlGF5Hp5HM620w7GW/136vo08tSCML?=
 =?us-ascii?Q?E9seI8zuREcRgF7in+zx0F+DgHHX3nGmLGggvhpB70jmwLjHrda2a/C1RzLg?=
 =?us-ascii?Q?Mmy2PVpjKxxfMpmVXi/gCynw/XPhX+mnH/XT/ue5u05IeM3vKgvA4bvqMLVW?=
 =?us-ascii?Q?bAzSdlx82n4IAKPqVGCT66I3zNfOJ2GtyBgMNMITRgL5bJB+nMcXA4q4AmYH?=
 =?us-ascii?Q?jcayb2bG2xlh32EaEoo2Jx5RcDuFt2kwXvxP0IXeWV3vC07c/Y+tvyJBhq44?=
 =?us-ascii?Q?EV+ruSUw3s2ofYrGdWia8i+9qTkfNJI+LWh9ujgIUGqaZuCYXZDKdzhVDwNp?=
 =?us-ascii?Q?ey/2ccXtPgk7D+pvRjW5xdc7hBMI1hxaCAgDUXpGA3iTvKtX+lT0ymeLmtah?=
 =?us-ascii?Q?7YxUckk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qeFOfVc6D4/fxaumIEO8mVR10HSh7bNTFPGuLnvq5Q/HlQCJ4o32P6PRSxVt?=
 =?us-ascii?Q?dnOgpF/fKzDBmdiojJ11cTTwZ3QpjyCoeHIIzHjzr6a6ACV0KlZ6Cq4ncAOO?=
 =?us-ascii?Q?c6MEtcStXYh6kZVPmnZ3T/WK5FPvCF58a8LC+go/vHdP300ekYxukMURcLJk?=
 =?us-ascii?Q?zGD13yQZCU7pKCWi0kYNfwuwXEdNBvuLvkRrQK0U6A++CZBnB3ICdhm1/O8L?=
 =?us-ascii?Q?Cs6pjHqD9eTQmxlfv5/Aa6OtsUa4ahlYM4f+LQAaWUNVXFZct7JGFoGwA3Y2?=
 =?us-ascii?Q?bfP8gqLvO9bXFoDfpbqOK8yp1N6afa/b9EUaqnjL9GoykaLpq14i59sKvyP+?=
 =?us-ascii?Q?RvvxptMHia+No0zoC3YpB/6WmhcJbZouTyPTznU72GW2OKRQmMIReQft9J4u?=
 =?us-ascii?Q?Dkaa2qLkD7NF/vTkBVq0bLzDSXaYNmOGjsmwc1GukP9DxCeH/m20SQZKGxoM?=
 =?us-ascii?Q?tKx2/xG9Isf58GgIsXYePn0A206bI+PT0+AP2sb2v+1ducT1Qq3NFd9gNzS5?=
 =?us-ascii?Q?UQAD6JP7t2f24QrhyKxBOPr1e4bQUqUfQ1zd1qDPlnFXniCRCkLqEGFV2cOO?=
 =?us-ascii?Q?P4GgdeX9SQFOYRe7Hue/48TddK9WJbeXlpXvqhFPTVMkjA4hFwvL7tl5vBXW?=
 =?us-ascii?Q?dTol5HXCzXQ571V8sOLzvP0S/CnBHcPS+Q2i3GfgVHx8A3pe9pQHOaANKS1P?=
 =?us-ascii?Q?NGVLgdARqC67M118o2KXbZmP2iZpF3lY9Dna9Abd1cfPWXoG93goiQCaeL7o?=
 =?us-ascii?Q?tgD16K/NFUm8gIwo99Q4NAJAN3K2KdwFPiWlSDO5QqPmGDN/6mRySfGfyeP8?=
 =?us-ascii?Q?cRadBgfnBO5ejL7k81KMYQmXr8nff2rkX8EJ8c1P7tZ1Nc7mGtPcmYLao9mT?=
 =?us-ascii?Q?rY/0uevYUWFmIAX/e+pDS/cA74/M+ioSiym5QBKDldh6QMBBLoJwWYg7yOGV?=
 =?us-ascii?Q?p4jr0Yew7evfNwS4HuuuixyL0IHAOSk5gHLxaDQ5h3IhPW94dL+ifZoILFbn?=
 =?us-ascii?Q?ulszT67WZrYaAqiob6wEYViL+KO/Kj/MEXQ6LJpx67cMi5PDZ2X1HcMQJ+ox?=
 =?us-ascii?Q?WYBttX8KuGX599/WNMuMXO+yFWgkwbtt9TSk5VI9eIKp9SZbrJwXeqD61e4T?=
 =?us-ascii?Q?DUc6TxjP+5B+Uvywg8htORwb8pwipw+S/1kpZaIU+N+uXdZfOIngfE7PDetp?=
 =?us-ascii?Q?fw6Xte5YMJQD10SbdRYoSow6WRIoKfvRYusthuzEWmMDIF7Qw9Q8y6r0tQ+5?=
 =?us-ascii?Q?EGb7pJXHqyO0n5iSK2TxE4yZglSaCE9cJVW5oHdiHl63ocSgP0H75UIr81qn?=
 =?us-ascii?Q?sj+eZCNHtKV6mGFCVhbSTnCSW4SjkvpUrHXynLXb86mIvMNbv/t1M8nGoJvQ?=
 =?us-ascii?Q?yCp3bq5Q6FAFCoKVmJDO42VTvAuL96y1TDMDzJSedcBLVTiwQ2IbrEIroY19?=
 =?us-ascii?Q?JG953uUq4h/TqhiusMyGIzVhZUDkytpL2I5m71jCfYiNgiW7Q3kBp1BlEHDh?=
 =?us-ascii?Q?k8yVv0P0qPEF+Hsqysk33cKqpdZLRdl6r+/H+abvgLFcAZKQqotu8VxWO2/F?=
 =?us-ascii?Q?jWgzFvp3oB0UPBtqXctf2onYrkOMK1trkh6lByIgR/l2ogkyl1cYuG0PLUm8?=
 =?us-ascii?Q?dw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 487e3e9d-c18f-4055-bf3b-08dc870db3fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 16:20:10.3248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DMTZ3DrSlEJnxhKyVT4lXgVSWg+6pFQBb/fMUm/+FYrrtOhEz7n9Muh+QVtMB6F5BbGkZ6FMn7EJRoKnRyPY5tIZFFC3q+y1R91TTX8Cezg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11999

Hi Mark Brown,

Thanks for the feedc

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, June 7, 2024 4:31 PM
> Subject: Re: [PATCH RFC v2 2/4] regulator: Add Renesas RZ/G2L USB VBUS re=
gulator driver
>=20
> On Fri, Jun 07, 2024 at 12:37:43PM +0100, Biju Das wrote:
>=20
> > +static const unsigned int vbus_voltages[] =3D {
> > +	3300000, 0
> > +};
> > +
> > +static const struct regulator_ops rzg2l_usb_vbus_reg_ops =3D {
> > +	.list_voltage =3D regulator_list_voltage_table, };
>=20
> This is an enable control, not a voltage set control?

Yes, it is enable control(inverted logic). Disabling the bit supplies the V=
bus voltage.

Is there any atomic regulator API's I can make use of enabling it?? VBUS de=
tection
happens in interrupt context.

Cheers,
Biju




