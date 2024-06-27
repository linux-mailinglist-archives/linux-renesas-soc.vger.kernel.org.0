Return-Path: <linux-renesas-soc+bounces-6823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE81591A335
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 11:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29ACEB23EDD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 09:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8D513B58B;
	Thu, 27 Jun 2024 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Yxb5pavW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2059.outbound.protection.outlook.com [40.107.114.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E6913B285;
	Thu, 27 Jun 2024 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482191; cv=fail; b=Ynmw8wSqvNKgj2GaY1glCROc58fETTjd+5M0KcuDqXCzVAidDf3Bp8AXvaNs8Hh7D8vf5/a6TKg9B3tFm0q2Z9kr0PgC5oWSmA6xjXtiBE1hMBYiek4qLdrDtuPH0HcNVxFTjUwgcPwNtxj6i0dKg6CVPKrN1a2eV10FAbwTJp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482191; c=relaxed/simple;
	bh=D1mHZg1YJijTA8b401b3v5+zm7SalWa+6Qxv32K3uEw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L81QJm/A4S0vZUi3VyX/B36kV0kM1fzDbkHnZT+SxJj8xIC+8S1c6iOOt0smU2jw/sFDCIK1NaAutOK0gOh+Jx1m2byU415iGk9YmyFOb+9sHn0DFFBhtQLQ/qoCvR7zsYEUgLzJWqe4PYlmv8HpSrCtyMqLfP3aEeeS8QD88mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Yxb5pavW; arc=fail smtp.client-ip=40.107.114.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q502ptFzJEk+aCkrQoPYQ5bndQW5aIs8rQpB5o1LuDURrY7USN5s7vhWGO9WBwQBqKLATXDT0uX8XS+wFdmEekOscFeTMW3VcsM0ez6bw2w3NMnsL2StbqESVbxNzmfMV2Wypb5I3I8NY9VVmqWJHMG7CaczD/I0mWfCVv5V3zd+IprcoBKNFfcPNQRtkn4v5zKKxb2mTcjQ+ncebpAomOsgMtwXwrA5BLAqujr1u0BDw0p62x/lXP9E9SOmM/tGzzpF5BBJZpueX0HUmY+ULlYr6j7kWXaHqB6YsWo0GjjO6L11yLnCfrNH4A7wRpQTscmSUDGYG+gGqzi2U12Blw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGo6Vb9WmNRO7sQ8l0fKNG73dS8w7zv3EDC8ji07mnc=;
 b=ULKLkZ+6hIMt3BJrMpAXBCYiSSkS2EzQYqIPD0D9Th2AbeQ51/ON1mkb/IU4DGN1wehseEDhXF6RMktyNaXOAjg5kKDkC0NBWyVQoqLz+Ify2MXsCclXsgZ1V4WcPJsgiSg8dv9oa80LWbvoUFWdbmWWD2sVBrQMWQslYmKxBVjPEluvXlswrBYuqux76nD5dTFT3LzmNizTpd6axyvKjioZI6dIBnm+4OzvtMr/4oHs2CRH0FQVNlgozxRMpjExsI6I18jjaKzqQYFzCqHYmqT0OB3cGJuWzEYyMvX3QkdsNVS9R8bw5jGz2EmvP5/XtZsaEejsMBafXDXZA7SYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGo6Vb9WmNRO7sQ8l0fKNG73dS8w7zv3EDC8ji07mnc=;
 b=Yxb5pavW33XeMYPvFCMD//Un64mn8Jdqbcew51irzhL2oLzrUxdKLkXziTa3c0E0xuy/UDZnfGcYV3OvzXW4Y8DmkaLMBAvxNHd1PNPkFMo+BDMn4T/rhf7l+Wv3965H+aw/5/gW64Kh2igMu3GDh7o1gY3HJzgQS21CdFsJ+Qc=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYCPR01MB6753.jpnprd01.prod.outlook.com (2603:1096:400:b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 09:56:24 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 09:56:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v4 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Thread-Topic: [PATCH v4 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Thread-Index: AQHax84UDZ/X9Vch3E2VKlZN8JU2HrHbXbgA
Date: Thu, 27 Jun 2024 09:56:24 +0000
Message-ID:
 <TYCPR01MB11332F92C1D1987336FA316FD86D72@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626132341.342963-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240626132341.342963-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYCPR01MB6753:EE_
x-ms-office365-filtering-correlation-id: 706726af-ecab-43d6-bff0-08dc968f67fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?//dCfK9BHruV1mM79v1UutZJftZNwUS1J/U5SHIe+803EeofjBM556spONP/?=
 =?us-ascii?Q?ZBj6oxtlUMXbY5zXD3/V3CjhqD2a+LRagiyRGWwvTnUMyTkq0VOzmZFmLjsQ?=
 =?us-ascii?Q?c4xEo6KHAPrlA2XyhBIe7fkJhfNxeJdE/M86iOPgUFwTR9Ao5AKfdV058iqW?=
 =?us-ascii?Q?Ovzr3olcMwG9exNXQphp1hZE8FX5+MFwN7+U256zWGZ3G1GKEXQjbMtf4NBS?=
 =?us-ascii?Q?Uj2RWiJNYuqO/Kp4tpoPfaWeDF/FECp472ZfL2hn82ToU4Z8tEDBJaElk5Uy?=
 =?us-ascii?Q?itcAvw09I1sNQP0hUUqqieWu3fv0DSNY0OW1BWDswqtRmhaAXR3MVnOe/5jo?=
 =?us-ascii?Q?aar3H3lN9K0c+jdZ2Kg0dtKORvUDa3HC/1AGKogMUReyF45TvsfCr7Mo2HGa?=
 =?us-ascii?Q?TmA1jiA24QXbYpN9de99DRfFaNGEpGDarYTncwPkY7B+Yj/Jha7QeMDYvlUO?=
 =?us-ascii?Q?l0RNxolC/TlYGP86FF7udGbSDOag/4+PU0PXeKiumzyK5bDLVpaOjJLWQt88?=
 =?us-ascii?Q?XEX8zL+ok8QRqS0JptW80GX7LXa4i//qczABra4kZPqO/108PZ0mNAEVwOC+?=
 =?us-ascii?Q?ycKkUmwvoK3GpyguAiDSYQP7fAfjmlnCuv+KRRZAxfaIjocZxvxA9ccCDxeR?=
 =?us-ascii?Q?5ntChARJUI0u3q5LqJxlcnGVNbfGnxZiZDEoTQIV+XQ0iKaTwEufnrSSQMeu?=
 =?us-ascii?Q?UhRgOtj04n7GziBniCL69tbwa2fil3UzPRd1JXkyJZNx8C0qV0KPXESq7QlK?=
 =?us-ascii?Q?fEFsT51PSCXILDeOH/PD9B9nWCRksOK0Zk1bXdylDDvTraxK2gvKCW3YU4Ad?=
 =?us-ascii?Q?LoiwOc/hprWH7kOf7ahuy7IuUbWWZ50d4OwRdCQ1NWOFBrdiJnGH4/DsOakZ?=
 =?us-ascii?Q?B1LqPVW+UY78Pi5aWodGlg06yhPhDXtPUeKEI8+K0MY+k6WLegbk9Ri0IJp1?=
 =?us-ascii?Q?6U5ZrWyu7X1cv3vhOwBftThSnCaa7QjI3qaQv8j5qKE8riosdI1hW4Wu4IDG?=
 =?us-ascii?Q?LwspaEEH0UYCMRMftZxr/xbpTq2FTgpc7SXa1UxDodK6lBcM52NVDx+kR/Cd?=
 =?us-ascii?Q?UmWcfESb2bnEUBi2qf15d8xjSZkekiZhs5TNsG0Twv6xU7BtI6+FJjRvlnB2?=
 =?us-ascii?Q?UgS8A6ytq5/BdE1tkBr9J2kfrr183nDATpyCYv8iUx4MzH6sofEzl2pYY2u5?=
 =?us-ascii?Q?thbUUV0Lre20Dpn6jQhN9MhpESnSheRjzF4SUx1iSaZpl4aEMRK83/Dk0n3w?=
 =?us-ascii?Q?yI0D4ydsAYgxbkx09FUnYN/ngsyKwRdN7Pc7OXgGo0OtJLpnYrr6ggo/4q+D?=
 =?us-ascii?Q?b6a4zOb/C+ShSu/xwcMiYSyOFWuXgnUR9q+aBUc5ckEwm+hSPrktGHhjYzPV?=
 =?us-ascii?Q?2SHq/X8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MAF+lAqAQcMPOTEPirFNSXDu3EHa5iT5KTVlGiINILOag1HbIDDIRDO/jY4e?=
 =?us-ascii?Q?Mz/TkW4hRObbfqBHYT6RYL+uVVOl/GYFDoWRiUE8m1G+4VImlRPIP/hiHIhR?=
 =?us-ascii?Q?e6Nl/G1JK321IU1eoTN6aGUefRKAcS3tdNOEClmUZrJ8ePitHC70kuDHm96A?=
 =?us-ascii?Q?YdNoYb62WuQzKq164GWHAalsebhJqzgrlDwgvi7TyJy+BPRtJJJUh75yAafG?=
 =?us-ascii?Q?l6+/I4Lr6Yp0KP+hikfHFX7odd6eOVTJxfczcWeUF2EEGzqmZBzQ5I4xLZy1?=
 =?us-ascii?Q?YQZrD/axtUB2Ohw9UafnmKa+r9GVWBYrLUcXdEDNsG0qtnLvyRCUG8q2Z7Xy?=
 =?us-ascii?Q?r05LtP4cnVVCqIAGh3GVJFyan7U9q7i29T0rAnyxu8bTM4FstpompOXC/FkL?=
 =?us-ascii?Q?SC72STc5xvlubTM7vbc+mAbbVc/Rj9uanIw6KYcgmhHl+fHF7838T1cZEnvR?=
 =?us-ascii?Q?+yg/1ZbIbrTVJJ17oKIB3rPkyPQgTMoVjsl2Drk3WswZtpBxN+FeIT6gjdd1?=
 =?us-ascii?Q?pG9I1ArzAU8lUhjdLbxUxdhDHTr2jAJyEUsv0YPRMkVdZAhQJXc6CVjvVFyV?=
 =?us-ascii?Q?JvBA4uYNm9uZoIkwxy1BdDzv2Oz1ojQiP76d7AADQhEFrCxbpEmmpeRe5OAY?=
 =?us-ascii?Q?UjYLAToHY31kJBKYFYTkBVrRtd/3lhDC79d2yhVax34mVhPiSq71Xj30OvPq?=
 =?us-ascii?Q?VK9ro93bvJFp7rjf3ODIzWLqPcYh0VpdwaOdo3WIv3tMM1Pl20H6zaVs5rl/?=
 =?us-ascii?Q?+OOLcYECgy8fROvNzxLqhXRyQxo9I1xAhTSJE5+nrWUaNT4KsaVIg2hoUI8O?=
 =?us-ascii?Q?C83szrzANgrRLGPbuEUsMmFDEIf1egw2Yn+4DhvjboiwLzrBfnLk8M5GSorS?=
 =?us-ascii?Q?bQ+gBJL+OYc8tdpC2aW55ChdhQK0S56j+j16zdTbZmarA+WHB/lzwi47e0FR?=
 =?us-ascii?Q?nmrnrrzCz7J1VJiQkX/u4fArLk3IF67rUeCwUptDr98LerGUs8IVoXLWo9JK?=
 =?us-ascii?Q?ET50EmfFhjwUaGJNR3dI3UsqMU24/ecjvpkNt8anNShJd4KD57TI0EQZADdN?=
 =?us-ascii?Q?09Z9Fb5bOHo9mUQG2zfpHnZNhkSTV0iBmB8p3e+jjKT7htZWRQ3ETQN4aPXY?=
 =?us-ascii?Q?JOZrAEOmzWmBpfttTe9odwOu0LaC1IZqzdotBN0RsTh9CzRBk/KW59xa6OSg?=
 =?us-ascii?Q?HQhHKHBM9qys/V3EOinBrcupwjlf89imrt+oKJi3do3ADd4XUDDHapVo5ATJ?=
 =?us-ascii?Q?PR+oeDzE8pTJhDGOksy6HLU0MwCO5TDEIBc4RRa9aqxXOhwM9OnzDJlMBAGx?=
 =?us-ascii?Q?lu1pibbdd/cZeUlOeT3TXaXvpZdwImu0WCJqdxzovpjBp0nEVZVTxZglsmio?=
 =?us-ascii?Q?Tu7hoppo1jJXtnJ/DodDTC9B7fTq77FdMUdREOXnZg+tIHWFcBBnkJKYWS1E?=
 =?us-ascii?Q?VY8AXYkZA1Yjs51t/DN/xh8FBp2MLWKFFAt3Ub93Zb3luorsgRpBQhpjtdMf?=
 =?us-ascii?Q?OHrFrYohoYlMEKifAk2miQBCrmP+cKO8LtUfi8odK8VPqNv2dBZRV/liJOOY?=
 =?us-ascii?Q?A+0gw1lz+F724rDS72UA2e1Z4Gw0mdk/h3QEs1iS20Yc/nrEV4F7MwqDUmpr?=
 =?us-ascii?Q?+g=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706726af-ecab-43d6-bff0-08dc968f67fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 09:56:24.8481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qf+WAxzkWaoe719AKSf1rcotQycd6tVQdtu6bpSm91HhTTIrsVN/TqdUY1mCy84tutbjyVDLAMMMTpK5aQWB/BWENVq1+jYVopaPbJnc+Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6753

Hi Wolfram and Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Wednesday, June 26, 2024 2:24 PM
> Subject: [PATCH v4 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
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
> internal regulator support is added to control the voltage levels of SD p=
ins via sd_iovs/sd_pwen
> bits in SD_STATUS register.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
> ---
> v3->v4
> - Dropped using 'renesas,sdhi-use-internal-regulator' property
> - Now using of_device_is_available() to check if regulator is available a=
nd enabled
> - Dropped extra spaces during operations
> - Included tested by tag from Claudiu
> - Rebased patch on top of https://patchwork.kernel.org/project/linux-rene=
sas-
> soc/patch/20240626085015.32171-2-wsa+renesas@sang-engineering.com/
>=20
> v2->v3
> - Moved regulator info to renesas_sdhi_of_data instead of quirks
> - Added support to configure the init state of regulator
> - Added function pointers to configure regulator
> - Added REGULATOR_CHANGE_VOLTAGE mask
>=20
> v1->v2
> - Now controlling PWEN bit get/set_voltage
> ---
>  drivers/mmc/host/renesas_sdhi.h               |  13 ++
>  drivers/mmc/host/renesas_sdhi_core.c          |  98 ++++++++++++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 147 ++++++++++++++++++
>  drivers/mmc/host/tmio_mmc.h                   |   5 +
>  4 files changed, 263 insertions(+)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> f12a87442338..cd509e7142ba 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -11,6 +11,8 @@
>=20
>  #include <linux/dmaengine.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
>  #include <linux/workqueue.h>
>  #include "tmio_mmc.h"
>=20
> @@ -36,6 +38,12 @@ struct renesas_sdhi_of_data {
>  	unsigned int max_blk_count;
>  	unsigned short max_segs;
>  	unsigned long sdhi_flags;
> +	struct regulator_desc *rdesc;
> +	struct regulator_init_data *reg_init_data;
> +	bool regulator_init_state;
> +	unsigned int regulator_init_voltage;
> +	int (*regulator_force_endis)(struct regulator_dev *rdev, bool enable);
> +	int (*regulator_force_voltage)(struct regulator_dev *rdev, unsigned
> +int voltage);
>  };
>=20
>  #define SDHI_CALIB_TABLE_MAX 32
> @@ -95,6 +103,11 @@ struct renesas_sdhi {
>=20
>  	struct reset_control *rstc;
>  	struct tmio_mmc_host *host;
> +
> +	bool use_internal_regulator;
> +	struct regulator_dev *internal_regulator;
> +	int (*regulator_force_endis)(struct regulator_dev *rdev, bool enable);
> +	int (*regulator_force_voltage)(struct regulator_dev *rdev, unsigned
> +int voltage);
>  };
>=20
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 0fc159b52fa9..6f8e745477b5 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -581,12 +581,50 @@ static void renesas_sdhi_reset(struct tmio_mmc_host=
 *host, bool preserve)
>=20
>  	if (!preserve) {
>  		if (priv->rstc) {
> +			bool regulator_enabled;
> +
> +			/* to restore back the internal regulator after reset make a copy of =
it */
> +			if (priv->use_internal_regulator)
> +				regulator_enabled =3D regulator_is_enabled(host->mmc->supply.vqmmc);

On all other SoCs, SD power enable is GPIO and we define this as GPIO hog, =
so that
It always supply Vmmc(3.3V) to the card for Card detection.

In this case, the SoC dedicated pin(PWEN) provides VMMC(3.3V). By reset thi=
s
value is always 1 (3.3V).

So should we implement handling of PWEN bit as part of vqmmc regulator
as it serves different functionality?

If I understand correctly,
VMMC(Always on 3.3V) for card detection -->PWEN pin
Vqmmc(1.8v-3.3V) for UHS operation for voltage switch-->IOVS pin

So according to me to implementing both the stuff in single regulator
is not correct? Like GPIO hog, PWEN bit should always on,
so that it always supply VMMC. What is your thoughts on this?

Please correct me if I am wrong.

Cheers,
Biju

