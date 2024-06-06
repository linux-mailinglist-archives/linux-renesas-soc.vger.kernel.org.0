Return-Path: <linux-renesas-soc+bounces-5909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 642F48FE2E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 11:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED2B2282AC0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 09:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0B5154BF9;
	Thu,  6 Jun 2024 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="t8UqvSXc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2088.outbound.protection.outlook.com [40.107.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B013D2A4;
	Thu,  6 Jun 2024 09:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717666341; cv=fail; b=RRnU1VvbjVfYTQoseksABbpLUuZyjaJhxtxmR6IUWodb4nRKx4k7dkPv5dlPrEKGD/mxmfLLkxMwQMH4sWFelDh/EzjdwVBsEDBC1UmZjgq+o9N/mwM6NrM6aEdDRblcvImPpjUETiEaig30IslIkHOSHx8l9wZxjROvJ34BFZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717666341; c=relaxed/simple;
	bh=e5syXrEs7m2Rui0FYpjcdQkXsZECtVyUIFre7RqzAqU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oBkIqxdB9nQMwrLayiutvY1cdnQ4XWpXVviS/7WE9OAFrnTTLt5zX6WVxu1eb1DJGrpcn43e190A9DkdNfgSBQwCPIQC+hty2+yYrVXpW+Wi3vBLBAOWJgDUfVoUhVKgb92tH71B72En3VlWelWl0QPDSSQk/ZWWjobumSn8eAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=t8UqvSXc; arc=fail smtp.client-ip=40.107.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHCe1czJRwG/VjiI9w26pv/VZH+Oivnq8/2ZzsiARck8nsAGGHpwFh+o/r3vAW91OS9Cpjo3i5W6Di6LC7BdRVMs6DX9Lx2SJth264v9XywSFXIoxAnt2QBblGJekEZjYMyNcSU3Nha/12BVn54YzYjaJL0BOnza8UCqekfWbM/jGKuckzvhOMyulWW2BdoQAMoL5pvGLKqRr3pQfr/9dDOUU2MtA2extoPK8QOPY4vEFqA1bKDD8KLKKC2/M2P5BZn/wFhyXYeg8vOVHIPAn7X794efGhkrKUSz1zi4gZX/Yu72RFnZZQ7HrV+CWsHblA82YE9UbCVOsSKhrUBb7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oatn3AIWeEJwMbald1jzpwQmD6CZFwUZmqGHQb1AUxM=;
 b=TXhHS8avc1eXsVJ9oCiR2jl7joUX28GdVXUIv78rcNCxNBB1N1mn0hxKHO8/6b/i2ZeS10UX+TqQujDYhT8jXQgotTaRLfM54lDrWu9TiDmOIE4uUKo1Z5V76tWWRNzTeJmErX+oaLd3AgNZEcYEtpD7yjHsGIhcQ6x7rRyVVbactRNZ1xuP5KbnmTYzu3VLy67SB3jm5UScY6jRBy09iu141p8rhl49zTxK2da3BOLLY5gcI/4EW93fAYuO6hs2XwW45S1bo+alfqGOYwTdUA2EzD1m9Oq+65lz1E+ytJDWKbguPMI4wvdIdyU2JX8kMY5/1E/y8rqpLa6KHmdiyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oatn3AIWeEJwMbald1jzpwQmD6CZFwUZmqGHQb1AUxM=;
 b=t8UqvSXcCBussZzJeAYieImVEPGDK5STDS/iLxC/eNym20vgg3F0ccPY6KAu6YrAlv3yPs4bVX2NcoqWxgqan8aX4JXijVk/++bQCsd79hCmL77eX/oz4bdtjh6ysGVwz8A1ytmI6Gi9IWbU2jgxtbZcxn54yKmqfalID7ez/nA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8897.jpnprd01.prod.outlook.com (2603:1096:400:18b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 09:32:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 09:32:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Magnus Damm
	<magnus.damm@gmail.com>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Thread-Topic: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Thread-Index: AQHatxz0mhzMiwcEyEGyJWqnXXuc/7G6d+ow
Date: Thu, 6 Jun 2024 09:32:12 +0000
Message-ID:
 <TY3PR01MB113464449FACE8364BF667CBB86FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8897:EE_
x-ms-office365-filtering-correlation-id: 097fcd0d-523b-4b83-1476-08dc860b8bdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|7416005|1800799015|366007|38070700009|921011;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1Z8XdAedeMY8iTqanGfqscgaV9hx6cbZjHAO1JQ+eNj2FTf/yF2qJ2xOtJFl?=
 =?us-ascii?Q?NMQZ5yCVRZ+DZt0910KlDiHisvnKxqFR9IoEYB/3ZH7i5uap0Xy+BX6Xdxzk?=
 =?us-ascii?Q?D4YvQbfyXb+1bAELqFR2VoIKptWNnVs8yg6vcnDMaM6ZLNpd7CBsNXbYpu+l?=
 =?us-ascii?Q?GCN/X/3eb1NnfVauyucmLTPteV8s5DzVVGJBOSdu4HmXOH3ZJqOy8mmHq1Pg?=
 =?us-ascii?Q?hYgNg1/ErkhCt0Nov7hOg6x/m5jEJwxPoatn5mbNsBCeqiuNCBFhYUDA3+5r?=
 =?us-ascii?Q?HVIeznboK02PvtmsaTVJKjgTjYm0LoKjpvadpAHNfqbM4MCzJH2N2JMeToSh?=
 =?us-ascii?Q?O5S66wu28IqkIbGVkqpR6aoCAEVyA8HsKCCDZfmVXI5pfxo5jRTuNAS2r4cM?=
 =?us-ascii?Q?MORrn6yMHzcqQFyutPfH/TDs+maFSnrDDHZgXHTpUIA06iKyq4oH3YcXVJ/V?=
 =?us-ascii?Q?+PvNvGJqyCXPyAK3Bj115tpAnuV8ZYWZjwbfjqz1Ot8nbCRlIH8m/A8mc/Qc?=
 =?us-ascii?Q?Nk+mDp8eRTX3IkhlcHN1WbxYOAJlXnTjqWhXaYGiUVnh6UjnTxZUS/Jl6vK/?=
 =?us-ascii?Q?ea9vYk+gLrKXqcDTEz2+qB2fiWAlVshQh+D9Yr+jFqdyj3GiN56UNHb6UX91?=
 =?us-ascii?Q?PI95BZFH/czN+uEqxj6gJrykz+SUX7e+RaS/wlJhOvUe2wL+9G4//jZu8o8X?=
 =?us-ascii?Q?nMLzJnSmWGTNhKFGHbN/45/xC7w4yZvlY1V7azKCR/W4HjJDjf9ehF/gMmZM?=
 =?us-ascii?Q?0QfWC6rLEbzEZOU0If1yB3yULtkO66bRzbkjoI/g8l3WKI71YdOSiXMbateL?=
 =?us-ascii?Q?JJQOIkPYMbIKpmPwDkxOu3C5oa4LS4YQK1gazefwV9rFvFaZ4DxcT6HoIxtM?=
 =?us-ascii?Q?7CYWkFa0VVHNVXaskF+9b0XlKAnEKDK7NtGuG6kIfdgFsaiTQwOSn9ED0IqX?=
 =?us-ascii?Q?ROUlol7+beOO5rbVLG76oXkkd/93TpwAV2pf5CL/occICs1JEZ75PXblhhqI?=
 =?us-ascii?Q?jkni0qyBxq0/G33T1PkaUyBF/7v/ChJ/PxNay2wjqqYM+YI6vD8nO6wL4yRt?=
 =?us-ascii?Q?2vNIbeBtbYRFsS3gsVCtAc0FAN59bv0H7Djcfux0GQW3hFFfUYy9IwQNAZHd?=
 =?us-ascii?Q?d2WUsJNgdlS/GpjUImbOiRVd51G7ivd6r7uT36+deaAVpDjiLOePI5G6nRH8?=
 =?us-ascii?Q?GsbfCTd7xWBObzUhUpopKxguiBRJthezGTd4KwKb8IXqGjCitZhTTAQ2pa5X?=
 =?us-ascii?Q?fTNwohi+DlEmSc0Zb9Ldou1MfoCX7vRogUSL+P3ypIYY2bZjGOUVXPSSSP4t?=
 =?us-ascii?Q?XV0ARVRRf76VOKMf3m+KsoYphvWW1KpfI4FGItONiLH8tsccy8VGZkS7Zztw?=
 =?us-ascii?Q?iVG7j/OXohuTb5IoMR34Hf6DIzDI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tUwmqA1G4xvgHHo+mFJ2UCsQnr+qsI0fDVO+Haso1EHiibiG+BAk1584AxCc?=
 =?us-ascii?Q?3ZDnoBx6jjDDo4Ul1RI9ZLhV6TBITOibwD8jYSHB+pCruyI7t9SaY3ce4PEc?=
 =?us-ascii?Q?K/fWblayrpgjnSex4j8Nkcf83TIHdc7Zerh72V44tqijB0k7uSDKZv63HL7K?=
 =?us-ascii?Q?JTz770DuYU5gutKwiDTfL34XWqmC9DYcBJ/wz4QfbTy0OLUVGowym9BNRT47?=
 =?us-ascii?Q?kXL79+d8JYKXzjVRlbtZUwBkGPAzK96CIkdlBNc8XAo7gLh2h7XaG/wQg7/+?=
 =?us-ascii?Q?jHaBzr3YsQH3OIEYMjEn1zt5GTsUKcN+ZykPyZ1H05dsxh50IhYBkmyLspY6?=
 =?us-ascii?Q?F9wyYEeV9vnF549McMFYDpTMbnSzdamE2TS7sbHHNfOBKdT4WG/g4tdG0P+y?=
 =?us-ascii?Q?oCauWv0SSxD9F6hG3xE/SQgD0LKIghSc3f0DLmvVcB3OGqfpDp8qFt+VW0+b?=
 =?us-ascii?Q?N208dMw3pewZLrrSN7SzNz4E00tKuFgVO/aM2483j8GJTxASh2J6ufRUYIID?=
 =?us-ascii?Q?e7SJOXj+Wzm1ZWJF6PfjxAHkx80LSQi7FChwWqa00oqdKdUcfUwvtpmPZQIM?=
 =?us-ascii?Q?iz7KttQeJlzhCG7kXyVjBuhXH43oNcimMmj2hgfTQPSEyTlitvLsUOu0Kwfx?=
 =?us-ascii?Q?/WcIPZ+x2saUv//AMcjg55SMl2D+c+jnwRFx3LTIbhj4WbEMFDNg40Y4GcQ1?=
 =?us-ascii?Q?uSIMQhePadXIeg8o7Az5TgrpdmX4Pen5LF5jj3US3loDQl+ztlnNAXivZJPY?=
 =?us-ascii?Q?MCcWVyhjFZ2z8qYw9+oLF59KstqLabrkZ0JcW1+xhY8QYa2T8nfYuN0So5g5?=
 =?us-ascii?Q?B7Ef9K1CDWD/JGYXxSWP1KNffMcJlnHLgeHmPR+Q7t5D1C0A0zc2+NN5FPNM?=
 =?us-ascii?Q?vg0lZV2JltMx/uGBsqTeivfhq9BMasfqQHfoguVDKcWvUlCr75M0712UsHy2?=
 =?us-ascii?Q?GOfvUdxatgXS4OrL18MixYX3yWyBj9Z6iHeOxbPa7Wled6eTZ2UVmum8stxu?=
 =?us-ascii?Q?e9bG8SXuWcxYA7ejSU9PyD+dPoKVItt0WY9d/a/DVk9+XJ6WFqJhQhZIkRvX?=
 =?us-ascii?Q?34Qt79SXqBzHYN+7IjSU/GR73xOshc7Pp6Mof5B/PSByji6+5eqPIZN0KCDg?=
 =?us-ascii?Q?s23cFFMRlyAunbxJYsEIZ9nDoz4YcAH0kkaRIKUPmp0bMcPnwFur3srSiDg4?=
 =?us-ascii?Q?dk/hdx02qOeQx+OvTcvENaH/yC23zUjLIoEtwB7bCRm01iY2aqhm8NqZNCsj?=
 =?us-ascii?Q?vjglZveVuHEsOZRt/ilDo1OxlQn+70o1Wu8TG4IBZy84U19wLIpDrfc2fLKX?=
 =?us-ascii?Q?fdzj0zkPuHIveQjn3P5OYeU7pkuK9sHq7eUFXDrA9e0gPi3jxg9lQ6W36z5M?=
 =?us-ascii?Q?XnqHTTSRnruv4PIAoptRGomuhOYy1ce4Ok/En01a1TCo48fwIOojro/jRDhM?=
 =?us-ascii?Q?WsK2vMbdLHVO+RyksAKfmNxnld00l78J+rymjTnt7So4QkDThlLyaBKLxf12?=
 =?us-ascii?Q?FbzQElzHmlEjJPYoK+Mn+jbhagheeaNqgN8CqZD1goludTAKWtBLR9aQy82d?=
 =?us-ascii?Q?KQ2Jja1RdYE88n+Ikcbt0mK2aSrFwoo7gH3Bmqpzd948ItGsXs+vIqhQ13sE?=
 =?us-ascii?Q?2w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 097fcd0d-523b-4b83-1476-08dc860b8bdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 09:32:12.8533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WMHJccunM5SMwO1WGaH/1+0bg0GHVcCvYvcL8+MREoir2Om+mYofRuXtSO5lfAVpyT0ajPLMOOskt+uRE9Jm5IoiIktu+4RrpBs103xYYsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8897

Hi Prabhakar,

Thanks for the feedback.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Wednesday, June 5, 2024 8:50 AM
> Subject: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The SDHI/eMMC IPs found in the RZ/V2H(P) (a.k.a. r9a09g057) are very simi=
lar to those found in R-
> Car Gen3. However, they are not identical, necessitating an SoC-specific =
compatible string for
> fine-tuning driver support.
>=20
> Key features of the RZ/V2H(P) SDHI/eMMC IPs include:
> - Voltage level control via the IOVS bit.
> - PWEN pin support via SD_STATUS register.
> - Lack of HS400 support.
> - Fixed address mode operation.
>=20
> sd_iovs and sd_pwen quirks are introduced for SoCs supporting this bit to=
 handle voltage level
> control and power enable via SD_STATUS register.
>=20
> regulator support is added to control the volatage levels of SD pins via =
sd_iovs bit in SD_STATUS
> register.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/mmc/host/renesas_sdhi.h               |  7 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 67 +++++++++++++++++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 45 +++++++++++++
>  drivers/mmc/host/tmio_mmc.h                   |  4 ++
>  4 files changed, 118 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> 586f94d4dbfd..9ef4fdf44280 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -11,6 +11,8 @@
>=20
>  #include <linux/dmaengine.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
>  #include "tmio_mmc.h"
>=20
>  struct renesas_sdhi_scc {
> @@ -49,6 +51,11 @@ struct renesas_sdhi_quirks {
>  	bool manual_tap_correction;
>  	bool old_info1_layout;
>  	u32 hs400_bad_taps;
> +	bool sd_iovs;
> +	bool sd_pwen;
> +	struct regulator_desc *rdesc;
> +	const struct regmap_config *rdesc_regmap_config;
> +	unsigned int rdesc_offset;
>  	const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
>  };
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 12f4faaaf4ee..2eeea9513a23 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -248,6 +248,19 @@ static int renesas_sdhi_card_busy(struct mmc_host *m=
mc)
>  		 TMIO_STAT_DAT0);
>  }
>=20
> +static void renesas_sdhi_sd_status_pwen(struct tmio_mmc_host *host,
> +bool on) {
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +	if (on)
> +		sd_status |=3D  SD_STATUS_PWEN;
> +	else
> +		sd_status &=3D  ~SD_STATUS_PWEN;
> +
> +	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status); }
> +

May be use regulator_set_voltage() to set this??

>  static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc=
,
>  						    struct mmc_ios *ios)
>  {
> @@ -587,6 +600,9 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *=
host, bool preserve)
>  					  false, priv->rstc);
>  			/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset */
>  			sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
> +			if (sdhi_has_quirk(priv, sd_pwen))
> +				renesas_sdhi_sd_status_pwen(host, true);
> +
>  			priv->needs_adjust_hs400 =3D false;
>  			renesas_sdhi_set_clock(host, host->clk_cache);
>=20
> @@ -904,6 +920,34 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_=
host *host, bool enable)
>  	renesas_sdhi_sdbuf_width(host, enable ? width : 16);  }
>=20
> +static int renesas_sdhi_internal_dmac_register_regulator(struct platform=
_device *pdev,
> +							 const struct renesas_sdhi_quirks *quirks) {
> +	struct tmio_mmc_host *host =3D platform_get_drvdata(pdev);
> +	struct renesas_sdhi *priv =3D host_to_priv(host);
> +	struct regulator_config rcfg =3D {
> +		.dev =3D &pdev->dev,
> +		.driver_data =3D priv,
> +	};
> +	struct regulator_dev *rdev;
> +	const char *devname;
> +
> +	devname =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-vqmmc-regulator"=
,
> +				 dev_name(&pdev->dev));
> +	if (!devname)
> +		return -ENOMEM;
> +
> +	quirks->rdesc->name =3D devname;
> +	rcfg.regmap =3D devm_regmap_init_mmio(&pdev->dev, host->ctl + quirks->r=
desc_offset,

This is (CTL_SD_STATUS << 2) , so the variable can be dropped from quirks.

Cheers,
Biju

> +					    quirks->rdesc_regmap_config);
> +	if (IS_ERR(rcfg.regmap))
> +		return PTR_ERR(rcfg.regmap);
> +
> +	rdev =3D devm_regulator_register(&pdev->dev, quirks->rdesc, &rcfg);
> +
> +	return PTR_ERR_OR_ZERO(rdev);
> +}
> +
>  int renesas_sdhi_probe(struct platform_device *pdev,
>  		       const struct tmio_mmc_dma_ops *dma_ops,
>  		       const struct renesas_sdhi_of_data *of_data, @@ -1051,6 +1095,15=
 @@ int
> renesas_sdhi_probe(struct platform_device *pdev,
>  	if (ret)
>  		goto efree;
>=20
> +	if (sdhi_has_quirk(priv, sd_iovs)) {
> +		ret =3D renesas_sdhi_internal_dmac_register_regulator(pdev, quirks);
> +		if (ret)
> +			goto efree;
> +	}
> +
> +	if (sdhi_has_quirk(priv, sd_pwen))
> +		renesas_sdhi_sd_status_pwen(host, true);
> +
>  	ver =3D sd_ctrl_read16(host, CTL_VERSION);
>  	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
>  	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX) @@=
 -1110,26 +1163,26 @@
> int renesas_sdhi_probe(struct platform_device *pdev,
>  	num_irqs =3D platform_irq_count(pdev);
>  	if (num_irqs < 0) {
>  		ret =3D num_irqs;
> -		goto eirq;
> +		goto epwen;
>  	}
>=20
>  	/* There must be at least one IRQ source */
>  	if (!num_irqs) {
>  		ret =3D -ENXIO;
> -		goto eirq;
> +		goto epwen;
>  	}
>=20
>  	for (i =3D 0; i < num_irqs; i++) {
>  		irq =3D platform_get_irq(pdev, i);
>  		if (irq < 0) {
>  			ret =3D irq;
> -			goto eirq;
> +			goto epwen;
>  		}
>=20
>  		ret =3D devm_request_irq(&pdev->dev, irq, tmio_mmc_irq, 0,
>  				       dev_name(&pdev->dev), host);
>  		if (ret)
> -			goto eirq;
> +			goto epwen;
>  	}
>=20
>  	ret =3D tmio_mmc_host_probe(host);
> @@ -1141,7 +1194,9 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>=20
>  	return ret;
>=20
> -eirq:
> +epwen:
> +	if (sdhi_has_quirk(priv, sd_pwen))
> +		renesas_sdhi_sd_status_pwen(host, false);
>  	tmio_mmc_host_remove(host);
>  edisclk:
>  	renesas_sdhi_clk_disable(host);
> @@ -1157,6 +1212,8 @@ void renesas_sdhi_remove(struct platform_device *pd=
ev)
>  	struct tmio_mmc_host *host =3D platform_get_drvdata(pdev);
>=20
>  	tmio_mmc_host_remove(host);
> +	if (sdhi_has_quirk(host_to_priv(host), sd_pwen))
> +		renesas_sdhi_sd_status_pwen(host, false);
>  	renesas_sdhi_clk_disable(host);
>  	tmio_mmc_host_free(host);
>  }
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 422fa63a2e99..f824d167bb09 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -215,6 +215,45 @@ static const struct renesas_sdhi_quirks sdhi_quirks_=
rzg2l =3D {
>  	.hs400_disabled =3D true,
>  };
>=20
> +static const unsigned int r9a09g057_vqmmc_voltages[] =3D {
> +	3300000, 1800000,
> +};
> +
> +static const struct regulator_ops r9a09g057_regulator_voltage_ops =3D {
> +	.list_voltage =3D regulator_list_voltage_table,
> +	.map_voltage =3D regulator_map_voltage_descend,
> +	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
> +	.set_voltage_sel =3D regulator_set_voltage_sel_regmap, };
> +
> +static struct regulator_desc r9a09g057_vqmmc_regulator =3D {
> +	.of_match	=3D of_match_ptr("vqmmc-r9a09g057-regulator"),
> +	.owner		=3D THIS_MODULE,
> +	.type		=3D REGULATOR_VOLTAGE,
> +	.ops		=3D &r9a09g057_regulator_voltage_ops,
> +	.volt_table	=3D r9a09g057_vqmmc_voltages,
> +	.n_voltages	=3D ARRAY_SIZE(r9a09g057_vqmmc_voltages),
> +	.vsel_mask	=3D 0x10000,
> +	.vsel_reg	=3D 0,
> +};
> +
> +static const struct regmap_config r9a09g057_vqmmc_regmap_config =3D {
> +	.reg_bits	=3D 32,
> +	.val_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.max_register	=3D 1,
> +};
> +
> +static const struct renesas_sdhi_quirks sdhi_quirks_r9a09g057 =3D {
> +	.fixed_addr_mode =3D true,
> +	.hs400_disabled =3D true,
> +	.sd_iovs =3D true,
> +	.sd_pwen =3D true,
> +	.rdesc =3D &r9a09g057_vqmmc_regulator,
> +	.rdesc_regmap_config =3D &r9a09g057_vqmmc_regmap_config,
> +	.rdesc_offset =3D 0x3C8,
> +};
> +
>  /*
>   * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of=
 now.
>   * So, we want to treat them equally and only have a match for ES1.2 to =
enforce @@ -260,6 +299,11
> @@ static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatib=
le =3D {
>  	.quirks =3D &sdhi_quirks_rzg2l,
>  };
>=20
> +static const struct renesas_sdhi_of_data_with_quirks of_r9a09g057_compat=
ible =3D {
> +	.of_data =3D &of_data_rcar_gen3,
> +	.quirks =3D &sdhi_quirks_r9a09g057,
> +};
> +
>  static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_compat=
ible =3D {
>  	.of_data =3D &of_data_rcar_gen3,
>  };
> @@ -284,6 +328,7 @@ static const struct of_device_id renesas_sdhi_interna=
l_dmac_of_match[] =3D {
>  	{ .compatible =3D "renesas,sdhi-r8a77990", .data =3D &of_r8a77990_compa=
tible, },
>  	{ .compatible =3D "renesas,sdhi-r8a77995", .data =3D &of_rcar_gen3_nohs=
400_compatible, },
>  	{ .compatible =3D "renesas,sdhi-r9a09g011", .data =3D &of_rzg2l_compati=
ble, },
> +	{ .compatible =3D "renesas,sdhi-r9a09g057", .data =3D
> +&of_r9a09g057_compatible, },
>  	{ .compatible =3D "renesas,rzg2l-sdhi", .data =3D &of_rzg2l_compatible,=
 },
>  	{ .compatible =3D "renesas,rcar-gen3-sdhi", .data =3D &of_rcar_gen3_com=
patible, },
>  	{ .compatible =3D "renesas,rcar-gen4-sdhi", .data =3D &of_rcar_gen3_com=
patible, }, diff --git
> a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h index de56e65=
34aea..d03aedf61aa3 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -43,6 +43,7 @@
>  #define CTL_RESET_SD 0xe0
>  #define CTL_VERSION 0xe2
>  #define CTL_SDIF_MODE 0xe6 /* only known on R-Car 2+ */
> +#define CTL_SD_STATUS 0xf2 /* only known on RZ/G2L and RZ/V2H(P) */
>=20
>  /* Definitions for values the CTL_STOP_INTERNAL_ACTION register can take=
 */
>  #define TMIO_STOP_STP		BIT(0)
> @@ -102,6 +103,9 @@
>  /* Definitions for values the CTL_SDIF_MODE register can take */
>  #define SDIF_MODE_HS400		BIT(0) /* only known on R-Car 2+ */
>=20
> +/* Definitions for values the CTL_SD_STATUS register can take */
> +#define SD_STATUS_PWEN		BIT(0) /* only known on RZ/V2H(P) */
> +
>  /* Define some IRQ masks */
>  /* This is the mask used at reset by the chip */
>  #define TMIO_MASK_ALL           0x837f031d
> --
> 2.34.1


