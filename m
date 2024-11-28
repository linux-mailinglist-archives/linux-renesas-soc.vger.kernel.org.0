Return-Path: <linux-renesas-soc+bounces-10745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039C49DB2ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 07:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66A78B20C6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 06:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCF0145A19;
	Thu, 28 Nov 2024 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="In9BkK2P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39696136349;
	Thu, 28 Nov 2024 06:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732776720; cv=fail; b=qDFTNFnsDDjGbxqJFw7rcv9ycArwTbs5fdllURldK374gMffAFgStJQ+uZPc7GLCeurpFubPta1d558pnDt31VlxQkPHyc5IalmWqcZK7zHFbSTIQTZjF3K2Xb5hDgT9fwPE6bIf7Umy2A2F9f4fi+hZ0D51dfmtNfv0i7lBoH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732776720; c=relaxed/simple;
	bh=eDbvdwBKrCsP3LamsSRO12Au1/kaKWjb7WAVabXu2iw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YV0ddO8TThXdzbaoKm502iYOv/hG8uIdfPKmAgvKE+I6r0dFdCA5iuI/7z+b0cdrrQ8J9Toa9HEXZ0ibDxzW54/E9QjWxgwHcgpXbVKwc2GKPs0n6TMR8EVTx1ZPX64Ak63/NkFACRzhQ/kcmyUoYyS49eg8fvJFX5YcaXDqSS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=In9BkK2P; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3oYRE74NlongG1FR25WqgJ9Y9OlZozmTqrq+LSk+lZ6ueDTmiPitm2NW4JTc7NHyxSYUxTMsQdf8DGbZFohyEoFXfnrVQVX/nBsybLy1oYc93bZpIC5Obyu96gNgBVXWJ/c9i6GTJDjwK8pFRGjg1T/dsgg+2iPpqY2QlVg4vdydQex+rsqkztB5UBpzDgCXXgcD5ebK1Wxbnz3bGBuS1BJjvlKXAVdhCLNxETW95cm3VE4nE7mfmPmNQ1jmaBDRgiNt+YkO1C5ZlywEJGW4yohHfkC4nmD1/q6FhANjJml3E7iD0JycIHQoAAl9I4uEcLPDK+e4p7MoCY/06Hfeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmKW1O00EaTwx6W9Y1a3PRjvUso8v8BMB9Xa6o58Ftk=;
 b=UbGvYMN1ZCL0dxfQ+BD6P9O98yx+/s8/NOyGeAJy/YM0u4WZlYNjR313m+yswuWEN+szMs7K/UG/viF3rUAFs5bv/gv9znJNLwf33g/DQYAjI2CQOCb+ohSRVpk0ufpyhkkSlpjL9ZF69331ZMuRnvV3MAo/mcG0bWFkTAE+UsFnxd6XYQQ+bG4AitjPjKzJDTYuSlw43UOUHwlP3ox6YSmI64OJ4l5M7LlUIqBu0lSP19lwRVAWd2HcGa8QEX0x/4AaDT79P7LxmVx9IstqsOHjscugdkYoUL1Tpq2ngch0abUaTyH2TidBRSkV2DhA7fVn7ji0CmCDrAGHyjQGXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmKW1O00EaTwx6W9Y1a3PRjvUso8v8BMB9Xa6o58Ftk=;
 b=In9BkK2Pee8qAXsr+lvUIfpMrJlC5iivr6Ypp8KyNHVR2V44Eziocv3HVWSZcclmltlNcyxKS1yiEM5xCAdCxK+wjlrQArdCNISJJz0ofHmxqwlKPKbG5ouPrgU9BSN+eTyW2y4IBYIwCJsv/b6yZUCXYyahC5u4F+fUPgfaOm8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11574.jpnprd01.prod.outlook.com (2603:1096:400:374::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 06:51:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 06:51:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMARC
 SoM and Carrier-II EVK
Thread-Topic: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMARC
 SoM and Carrier-II EVK
Thread-Index:
 AQHbPNyO/NJTh1WC/0KM88VRnUTf9bLIXIKAgAK487CAAETkAIAABnnQgAAz8oCAALPncA==
Date: Thu, 28 Nov 2024 06:51:52 +0000
Message-ID:
 <TY3PR01MB1134609A5A6381F1F2711794286292@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-4-biju.das.jz@bp.renesas.com>
 <20241125-straw-oozy-f95e18e4704f@spud>
 <TY3PR01MB11346BC7FA5C81C108B4E7A7786282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20241127-epidural-violin-651fd0ee2526@spud>
 <TY3PR01MB11346A0C7A4DAD6A250A6B55386282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20241127-cargo-impish-9117a49fa425@spud>
In-Reply-To: <20241127-cargo-impish-9117a49fa425@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11574:EE_
x-ms-office365-filtering-correlation-id: 4f57ef2a-c21f-4fd8-85d4-08dd0f7923c4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?UjGt7ksYV0bGENo6TViHhDnBH00GaUKQkBTkJdswxW40C+F9XVU2hrk98o/l?=
 =?us-ascii?Q?dywQvHlBaVlaIdIXnfRDhW1tLAsGtMPyWgj3T6P7L7UmnBu3vzNbhFitn2iv?=
 =?us-ascii?Q?mS8rAU7IgSapwQsQEgqBKvt39p99zx+j5lez0y/GNYuw8SqPMz6JHsdfDAEa?=
 =?us-ascii?Q?GNwydwj6mayU5iQ8Hhbg56irJA3WEkI2IE2OQF/NP/a2TDEJbNg/ZsojpZT0?=
 =?us-ascii?Q?AObSxY8vhsFTcIBJrBAO8otNR0Ls6brtnebESUSnWYUqasQepzffd9e/C34U?=
 =?us-ascii?Q?lXrH0hQxJNsGM+MjEkqdmNjPa4/2tgsJ3QH6iXpkqNbrAkQndzeTG2aWMynZ?=
 =?us-ascii?Q?WOizx94QsDmOuqZnI8l4qggTnufLG2fIfSxFd23Py52uCyEfuHmJ/CyxjeVK?=
 =?us-ascii?Q?WsOmK6t9PAp9iS4VWdqPSXZ9UIzZAnyjJ0CskaCLNlA5uwR/rRxEJ/zu7KKh?=
 =?us-ascii?Q?pDHWr/xnOT0rO8vu8cbwjcdQXYuSPotgAIKZp7lCcQ39lmgjGZx6/GkaPuPn?=
 =?us-ascii?Q?ZE5iK7a8ovCN5rAwWhyCbKm1odVuZuZ6jS9GoNaOrs9wHi/VH/S4fiNV/BGC?=
 =?us-ascii?Q?oRGX7mvlQ/dLIf7wGoszuqlag1Xl7Fu7AULhTYQjyWDGACk6q183WFXAGF/e?=
 =?us-ascii?Q?y8mXRf5AfMuuFF0iCjoHzdQCW9NFp29YD6f3UkBjCwzX7RQb9QVvH/+hzseA?=
 =?us-ascii?Q?QQZphr1TrWE6UjdkhSEmNjhs5NL0EjJsEyGmA6O7TCBALYvOnZKDuiSiqirO?=
 =?us-ascii?Q?fFYC655lMHUtXm1N45JDdIsmVWvW1fJZ5YX3rIRNM6icWVRCwZBspOH6HgCF?=
 =?us-ascii?Q?IwGYJVWDtoJVkz4RB6j8AEZT7b+GKD9EGl7QUaVSrSN6/1A3D9nyzRi25klJ?=
 =?us-ascii?Q?U0HYyIB2rVM1sTKa0qVHq3yxNBitltSY+DRES0r+J9YXF4z43WyHvTq8kGVZ?=
 =?us-ascii?Q?HnK29Klnl8qE38iwT9EOC+S9l2ScXdIORGFyHgKM4fV1mU7kQGp3fcmUUDUO?=
 =?us-ascii?Q?qr1N6VjzOzmVxwk6n4G+Gb2vgboINZ+7J3n+bMGLKMcqblfXSLpBODqlJXZF?=
 =?us-ascii?Q?pbSP+FuqnA1m8RnAomnyL4yGv7CHwh63MQhc5gOy4pWJEWsOeayY5XRPHryF?=
 =?us-ascii?Q?by+uqfgK4MZaBkP0ioal8VQE7rnISir+T/+rSqakFk1AXUdKZ9ykvdbliqu8?=
 =?us-ascii?Q?lXoZvAElmkQ7n8BQnjQGaviuPI2vSvW8b2Cepg0mrZbObt/aMqYvgNrW1LSb?=
 =?us-ascii?Q?hANe1P+9hIAi7maHR8abR5AaYqQ8y8YAuGDbjJpFFgtktfmO7RL4TVAweNmN?=
 =?us-ascii?Q?7RnoFP0IMEEOoJpGBi4tfys8WZf8Dv7UcmqObi2tVrB5D9M8KEhS1i/oUjDJ?=
 =?us-ascii?Q?Y4/f77A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GdVm2Sa+vM1kIfvUiRMvvNZND9GEfW5/ch46VUacwzemuy15FxFkyof1Um3j?=
 =?us-ascii?Q?Kp+2Q8zSQe9/Xt44RhB8LHZEFsrRZTf6GvO5/skJCf9kwK4dkzncd8E+sMna?=
 =?us-ascii?Q?Q1oxhksIhlu0QVQZpFa/53b6u5upr95v10OaVTokppjA9VyqdNq4IZcAOxLk?=
 =?us-ascii?Q?a3USv72SVc3+S/UTDicCQ/loIZbPBSSeIHg14nHVnvJwqzjSIqrYatkJE50h?=
 =?us-ascii?Q?4iLBcNOu33+6NKSxtiU8hupy9b02GFMoV5oAExaMmMHpOSp8DQfAzCODvEMx?=
 =?us-ascii?Q?JOf6teO02BfoXQqL+AOUbeKFtmQRQbblWYcXGQCaaGVHoj1KV5QyclfWlopC?=
 =?us-ascii?Q?1OR/pB7+b5ZH0lm9Y/0gv30tqrSblSGy/1UcFoqQFgjt/KFBsELuU4ZARXjk?=
 =?us-ascii?Q?TbyXpbQFi5aKj7XINSCwCPvEQKx8AK822DS0CUMati/4Kx9mfP5wMvP4rKmo?=
 =?us-ascii?Q?cHYHnauUuDdV3BOWoCXS4MI34VUYILnhZYzP8cE35u7tKldp8JyTGUjDoFqm?=
 =?us-ascii?Q?p0YX2iuyF6ZWKQYHTSPFgvhQ1YHMf45hYmc5tiw+JFuOKFYR+itlPM5yNZe8?=
 =?us-ascii?Q?UKp/B2OgCOOwCAshLJy4V9nEjpgCmVpFSzYjf6XnPsTeptSc7NRsYIzUGuc4?=
 =?us-ascii?Q?mpl21POrAsFRsnXJF4pwHDPo7O2Q2joAPRlRX+1tekOmIfEIiNPSctLhIuuc?=
 =?us-ascii?Q?FgnxBoMgsoG7QpxboSKKme2/EZU4bD930hhv0x6lZahusvXqeF0/+KWE2Y9G?=
 =?us-ascii?Q?IQ5cFCS3aijhZHFJJ6d9v3PsEC4wsf8+n+EER217OPwLjnkVtMA9F53uCh20?=
 =?us-ascii?Q?pGJU3+P6ctR05Eg1dLOJVODWigUBFU9+qukB78ta9cW2kE4CdRcVgguXKuh6?=
 =?us-ascii?Q?BwfFgFyQzI1A3c9n/01gzxbQHGVVQDnIWpgaMowVEXGrWskW2l20R1kZjJFt?=
 =?us-ascii?Q?g2HVTOcuclVnUBI9tJisFF8TiI+u9OxLhT5cpTpqfFw77e+ywd1dDCdhhCN/?=
 =?us-ascii?Q?rYud0At7YzgJvIdegC+gUAjuxzImXdu0PuK/FpJnoznNE57s611A29d4t+US?=
 =?us-ascii?Q?oaixhZLxF24tkzXSoWoodtHaS9i0qhg9Cjcm6ns2zyRvxuUWtdAC8gea3JDr?=
 =?us-ascii?Q?izdz8Jl+l5Pa/nV9PCm1nUisIwvASnzG4aybzEKgYz+KLjNke0D2tAKDl2za?=
 =?us-ascii?Q?1JQaEaUuzB5uB6k73nUfVjNDX6H4kAhT0tUoIf1l3MHYROkzcMGa7L2QLye8?=
 =?us-ascii?Q?bAXqv4XxIX2WSB3tIqdHf7QJSl6B2zrwVtk1XU7CE4VVEA01+PbtMvtuddyh?=
 =?us-ascii?Q?Yzbrr+a9j0uOjqV8/tdkRqefKCOCLstNgdeZOSJgbB5iN6XV2oRGyVtEpzK1?=
 =?us-ascii?Q?1RZLLiPZMdIqCGzUcq7BuPhxwe3YuFGsmTWX8mqGYHZ2zj48mlNNFMBlCRU8?=
 =?us-ascii?Q?R8FKHKj8FxVGSZysTYnH95Q9phNl0ykCdVs6roImDRffRBKS0wDNr7LkIDgq?=
 =?us-ascii?Q?oBgv4y1SxlRp6izurTIDZ8xsRxFZC7j6kAf98WifpIQcSV7kigH4K48INKkA?=
 =?us-ascii?Q?nTY8e6pe4U0RH9ZgJ0h35bw/tt5Wga7XEdtD6cjlkfjQXcu1jSCrR6PRP9yY?=
 =?us-ascii?Q?Tw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f57ef2a-c21f-4fd8-85d4-08dd0f7923c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 06:51:52.1763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UpKPuknxFWWuU1WON324bEmP5+q0xEpnXpVFHUW2IMj4TuU9qsiE6/+hwV1w+CDxn9yzEDN1mNLKP1FbD9xDLy7L0CdAMvuREorWzq28EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11574

Hi Conor Dooley,

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 27 November 2024 20:02
> Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMA=
RC SoM and Carrier-II EVK
>=20
> On Wed, Nov 27, 2024 at 05:18:56PM +0000, Biju Das wrote:
> > Hi Conor Dooley,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: 27 November 2024 16:33
> > > Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document
> > > RZ/G3E SMARC SoM and Carrier-II EVK
> > >
> > > On Wed, Nov 27, 2024 at 12:34:42PM +0000, Biju Das wrote:
> > > > Hi Conor Dooley,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > > -----Original Message-----
> > > > > From: Conor Dooley <conor@kernel.org>
> > > > > Sent: 25 November 2024 18:52
> > > > > Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document
> > > > > RZ/G3E SMARC SoM and Carrier-II EVK
> > > > >
> > > > > On Fri, Nov 22, 2024 at 12:45:39PM +0000, Biju Das wrote:
> > > > > > Document the Renesas RZ/G3E SMARC Carrier-II EVK board which
> > > > > > is based on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC
> > > > > > Carrier-II EVK consists of an RZ/G3E SoM module and a SMARC Car=
rier-II carrier board.
> > > > > > The SoM module sits on top of the carrier board.
> > > > > >
> > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/soc/renesas/renesas.yaml |
> > > > > > 4
> > > > > > ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git
> > > > > > a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > > > b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > > > index 7cc2bb97db13..1785142fc8da 100644
> > > > > > ---
> > > > > > a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.ya
> > > > > > +++ ml
> > > > > > @@ -527,6 +527,10 @@ properties:
> > > > > >
> > > > > >        - description: RZ/G3E (R9A09G047)
> > > > > >          items:
> > > > > > +          - enum:
> > > > > > +              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
> > > > > > +          - enum:
> > > > > > +              - renesas,rzg3e-smarcm # RZ/G3E SMARC Module
> > > > > > + (SoM)
> > > > >
> > > > > Why are these enums, when you have a single item in each?
> > > >
> > > > I just followed the style used in [1]
> > > >
> > > > [1]
> > > > https://elixir.bootlin.com/linux/v6.12.1/source/Documentation/devi
> > > > cetr
> > > > ee/bindings/soc/renesas/renesas.yaml#L531
> > >
> > > It ain't the same though, since you additionally have the SoM.
> > >
> > > > Other than that,
> > > >
> > > > In future some vendors can add their RZ/G3E SoM's here
> > >
> > > Only makes sense if their SoM is compatible with the smarc2-evk.
> >
> > All our SMARC Modules and SMARC Carrier boards are SMARC compliant.
>=20
> All of yours might be, but what you said was "some vendors".

FYI, In the past, we have a requirement to validate smarc-evk before RZ/G2L=
 SMARC
SoM available.

So, we just used a SMARC SoM based on RZ/G2N and tested smarc-evk ethernet =
interface(of course with small hw mods)

>=20
> >
> > So, if anyone have a RZ/G3E SMARC SoM, that should work with SMARC2-EVK=
.
> >
> > >
> > > > Or
> > > >
> > > > They can use Renesas RZ/G3E SMARC module and use their custom carri=
er boards.
> > >
> > > But allowing this part does make sense.
> >
> > We already have a use case for this example.
> >
> > Renesas RZ/G3E SoM can work on both Renesas smarc-evk and smarc2-evk.
> >
> > But we only officially support RZ/G3E SoM with SMARC2-EVK as it has mul=
tiple display support.
> >
> > So, can I use const for both SoM and Carrier EVK as at the moment
> > there is only one?
>=20
> That is what I would do.

Geert, Please share your thoughts.

Cheers,
Biju

