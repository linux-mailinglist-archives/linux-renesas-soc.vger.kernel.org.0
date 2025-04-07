Return-Path: <linux-renesas-soc+bounces-15424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BCDA7D455
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 08:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AAE416E414
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 06:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A97221DAB;
	Mon,  7 Apr 2025 06:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Y2QwMhs3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF897FBD6
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 06:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008043; cv=fail; b=osRysyZPbS3kKcBroBbGBCYJCLoW6UawYagofTy+wvJawf59lxNRS5cijnzIReQMmw//xfqJYiF2Tytjs+Ri8C+IqWsICZcu4cUOlI/nAnt1Fn4rSrTGjB2NgCdGvqL3JAuOIpliFEjmutDol2rYepgh3EBH+LkzFnAulOJLpFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008043; c=relaxed/simple;
	bh=N74zMAbgLWBPNx7khhjBugbSkyDaHilc9+OZNC+84bg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bvXTaxeVrnk5cyCF/iaoBjEbsuISww0opKi9WJXw4I0IF2j3BaSnNhS8QpfGnAJ/y4p32+bDdiRGbb9Is3Pgp5CRup+/ztw8Iia0vuvE71QmpK+gJ+6EBNdK/9FJC8IhXAfi0nHdJg0fEUuQ7fZKmC6gIx2xr9MdMC5tYBsIiRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Y2QwMhs3; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUzIIQPxL2YydETOXG9ZVYv9e4PorVs+uXxUIYOl4G6zZ9V5Qw5RkfrNZdnfcWjPdjAcAQaDfPGW9Oche0XHqANNtCiKUpgC/51RK7Vl7evOyygW7lgfoLUTD5jlMslVn3soZnIfOoDNJnyPS+EPAtA562DEOBlqMhpghiqcYrP5FXCqAGOPrEtXiYngGBmQrVNyxuBOdLsQat++cE5VC4RMcrCa/8u5y7pd8eaGRzZhwRaw7DxEQbFtZGPhmp1tNVqzqNn2Srw/hD32gbcNxgPgaOqwigezctI54fJUgovNE7rglThZ2MKle25auz6FW1VlOTc6gko3YSareYoKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N74zMAbgLWBPNx7khhjBugbSkyDaHilc9+OZNC+84bg=;
 b=QsRkcZiyiZbAbeWkssqjnOoRU8ABM0qj3ZM95nYwFjsmNNmpiW5MLiazb4F/ZK216rQoG4QvAoFd2H56L27S95h5Hn/BvX7RIWXNjrQblTbQ2v9Ezaa+xV3Fj8zNzF4pc3z2iyBU5iEZ964wVnSZyy4YggtV3vyEJ4ucSCy7gItVezAcK+/xj7ysJ7IbyqsNx3AWkwN3scYk8RrRgdUct7sAxvevXM6X31/2HZocc0NXHEKOf5gUUvfh6aQ0K8DbRB1SuD8CdXTlORqeFjoWJdaY7h6c+6BkKw2MiyIEuI1gr+QU6fos1gCin20/sJRfSGS2NgP3zKdkQigVL0oXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N74zMAbgLWBPNx7khhjBugbSkyDaHilc9+OZNC+84bg=;
 b=Y2QwMhs3eHTsT/UaJSmJYSiyFaxmPNAtxQ1+NIGZ3ThxmdQ4MRsprcpy9F/v3AlZDqDd50ZOXBaKH9jH9la9pSSlht/667Ka72J4PCyZvz9kEXpZTbCB+EcC1ytHo66UxaHR37H4L8rM48fKfEOfE6lpLZMpkfPMIcQQKyVL+Y0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10869.jpnprd01.prod.outlook.com (2603:1096:400:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.28; Mon, 7 Apr
 2025 06:40:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 06:40:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 2/2] drm: renesas: Extend RZ/G2L supported KMS formats
Thread-Topic: [PATCH v2 2/2] drm: renesas: Extend RZ/G2L supported KMS formats
Thread-Index: AQHboV3iTLCKOyQxQ0O1Pm1hZ3vTJLOXzLPw
Date: Mon, 7 Apr 2025 06:40:33 +0000
Message-ID:
 <TY3PR01MB11346E983D37201657FFA252D86AA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250330102357.56010-1-biju.das.jz@bp.renesas.com>
 <20250330102357.56010-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250330102357.56010-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10869:EE_
x-ms-office365-filtering-correlation-id: fe97cd06-2724-482a-def5-08dd759f18b6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3wzNaVDaNdP3emzUJpH5BEY8HB33R+ohhYC8lDQ47BEvm/HyZ64alhbSQKSJ?=
 =?us-ascii?Q?qwzLV0Ws1DgGJeVwGM+6UuCCUJ8Yp9uuP3ebwq8xtOGOGDFJzC+x/egUAZim?=
 =?us-ascii?Q?TSzVTlZPmC+6DqX2d8YSqY5tnbh/g3uFbv35PNnR95NC3WO/oqxj2i8cSl0Y?=
 =?us-ascii?Q?wUwIh9AIGTcsiuc9hM+ISEd9I5yAobzo3T1YR+Ku0L3GDMyR0g/W5odJjQFF?=
 =?us-ascii?Q?4dP2GfatkDb2nNvJoimr061IB2DVzTEmStQl5pbrugEnNYgoRyOdb3CVqJvM?=
 =?us-ascii?Q?VF4O0LjKI4wNCLYR2ZMS+C6nCMCwKyEyc91aAP0BCqY1E6CAdMxHW8jDAXtB?=
 =?us-ascii?Q?dZMHUaPw2FULqoDt+9sE0pPVh/K33Oss/aacrHixlKx9vqDqLPN42ecw0EEQ?=
 =?us-ascii?Q?3BfaWPu/2GrgKUUz2BoxwVuSwyeYkHGLscIdw0U98BApEPNsRNJLG98l0r5O?=
 =?us-ascii?Q?tLvaatUJzHrIP1duCiu7nnua56OoDWdUr+YLyPut9UnDmt/f3lsIKbP0AY8f?=
 =?us-ascii?Q?uVPB9Q4yctS9JjD70E57ffmfWprt4/ZeOmHi0hP+NWpgIPCaZyJQTjr2UuWZ?=
 =?us-ascii?Q?8mpmOXRnfHZPy1qBZvQ03u+UK/cw1maaCTXhen0aqKABxELZXdMG4s7Ytj67?=
 =?us-ascii?Q?+yUcVTb1SWtDR3VSYxmMP4keVEfQO7EuM4XqfBKDpOYB9nhf89I0rUFo1RoU?=
 =?us-ascii?Q?cvJQoZ5/AZFTeE0OFlc+B1tcRCMeaP/pA3w2IZzWhhaI/Q0+tbU6TqtX2vkk?=
 =?us-ascii?Q?Dv/HnBvuDl5n5zEwWowpCD0WCMt8OXrRJbtDkV+JKNfljB7F5IyaK4JDDs7r?=
 =?us-ascii?Q?eUV77OsEVB9obRr6e8xwJQRFSOgr2S03NJGkW5M2Ke3VqZTHZaKy9wvMD7NY?=
 =?us-ascii?Q?4HzJ74cVC44zsGjwsTgEoqlh598V0pbOgWQYbmYNEOiH1T2FgPPJ+fThpdFV?=
 =?us-ascii?Q?oXE5sDHawd2RcfNiHjOwypduCZH/y4v+3wEZoRZ45Sn1WQw5xMpJf8YgF+ec?=
 =?us-ascii?Q?D/QI8ZrNFFyVEFDRUvAUJFjcWxxH5E27OJCrPnrS/hSLHoIlYiB4l5Cge6bx?=
 =?us-ascii?Q?usZsm13BAH1loQ5ukLewJd+MXVH6zkTx5XXawWCW5z5vWO1ubtXHQ6vUDMF7?=
 =?us-ascii?Q?dL9r7Y33kNvPzFN2nH3MgE6duXrrYqPc39iOPjwf1VlUoDu2JervG7arvFuP?=
 =?us-ascii?Q?nAa4lAVl2+O/Xv1NoTl4plqhRqF3pp7MepSD3kSuLrnwa8PeHbc+OswUeRHT?=
 =?us-ascii?Q?Kh9mP0W7YQ+ol+kEZl77z6W6vYqLnLg+PDj3jjflWBRk51K3DjoVbOYktjG/?=
 =?us-ascii?Q?Bo9+ZCYcNIkTqtuaiMSySLeexoM/e8cowP7wNLhF2VEOlTucg8bd7pG8dn2v?=
 =?us-ascii?Q?9wMysM7OFkOFXLIyK/5uEdQ23rd61PmZN1AwKqogim+zCIk2J38t4xkKnIhr?=
 =?us-ascii?Q?uJkVkN7pzPmTV4YC5FIAf1wT8lQV+KQs?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mBbh1yhjq+A3zrq+MsY2KTqWwjKDgtaJv1Vv5hAO2tHT5EmGqRwenA00ldSz?=
 =?us-ascii?Q?OZh+rlv6qFfyRgMEE9ZNPgaJNWvm/Hu3VcIwnXGk7Q0eQaDYBqExEYH8H+No?=
 =?us-ascii?Q?EQHFzI1ZXlsc7yQAvOP6btvrziU6Z4dLzL1vExCUYrxsNaABnY5gdqo8+oAe?=
 =?us-ascii?Q?w/CkegJnQvuXBSmUkVztc9dt2GMQbvs9+hpjDz+292OEs1iNWNnjQcjFZ38C?=
 =?us-ascii?Q?MLGChMomT1azDW/KysQU6K6F0yPjQuiIZOo06D69YAFZd7lW7yMkEp68hacy?=
 =?us-ascii?Q?hpyFlKzCn3M8DjwgsPXZn2tfDl712PJ/SGFwyRNV1xb8Yi3KTxhJVEcgEPsq?=
 =?us-ascii?Q?Z5/SmzUzDSCizqC3bJlrAO8GFFLqVSECulRbkEBgSEeC5Etv0GrR/TfoOcNI?=
 =?us-ascii?Q?qvRbRKJg1trnVNXZPJGKJ7Zha1n3Ez8SmLAs5YaceUVOGYMW5s6argVbm2Lo?=
 =?us-ascii?Q?f15motVf4t249v1IMkEEfgqVIHLNFWGujV7fTLkmhzIuI0U9DBCPCWkJaM0R?=
 =?us-ascii?Q?HTwg2nWRlQ10fCiWvHm6nKK0WhDpaujc1ag4x+BAnGhlba+B6Tg8aru9ekVo?=
 =?us-ascii?Q?zHshJs1LB8N3c+ZNKieiOsEZNeONb9GXTGpPinI1kiV+mWOJMrNDZLHVLXVc?=
 =?us-ascii?Q?M4+zBBGEZJogLa4FK57GKlcMtuzHci98BJP2M+RKQAZEVtlyFS8pH51oXlH8?=
 =?us-ascii?Q?2ZtQRaW2Bk9w7TNV25uujW9xIh/uNbzREJEZbn+4ICgIusyoQFey3GkSddis?=
 =?us-ascii?Q?qH3dB0X+o7wFJY6ju+5/Ukd0ECVmgYjYcEKrRYiztkudvKqU2kz253pwyn5l?=
 =?us-ascii?Q?aWKHtCPZMtz7kvZconnpApTuVvZhHK5BPwIPlaisCGrlvlZg1w1yId3rMW5v?=
 =?us-ascii?Q?pWB7D7YoQqNc3YmxbvI4Hw+y3M3UYz4HaCe3/Lma3DbvcBvbj2N4lZlRMKiX?=
 =?us-ascii?Q?tJo42z9eWvuQXIi7eSN0fT66av7FwABKUKFoPUB8NQylOMUeX0fdP7fNAGdV?=
 =?us-ascii?Q?BsOe2i6xES/9zGDwFbbnRDu6f337qqGlx8S4IJ1MoFa6AA5ATam6KP13O7RT?=
 =?us-ascii?Q?dkHbzD0U05gy6bgXyeTrWNljIT3C8u9+9lQSujK5C9ToAYsyst0nswRhZdDx?=
 =?us-ascii?Q?KxVHBzPJUgo35aBKv5W13FQFr4M9PCgPRthyolxTTDpkod7+ZDGMTkPQ3Y8b?=
 =?us-ascii?Q?fRkmjkR0eUwhr0w/bJSjL0cuFsIjmlwpmxVkeG3jyVotkbggK6ihteyjyXhn?=
 =?us-ascii?Q?Td6zl//1asspOUeT8ZD8CDPHw1z2nt1nJ6p74xySxtouTfWM/phIFZlwg+l1?=
 =?us-ascii?Q?dlKopiVGtXb5m+zjCJHL/Owvrj5DnTUBQuNyZ2IUhLqC45PrzcsV9uo0IhCJ?=
 =?us-ascii?Q?Z6yaV3QC6/jn/zqyrRk4UjWuHdiBSbeSodzcsnaVjHKG3s6Fc+EaiwDuHHEx?=
 =?us-ascii?Q?8jxZAWaw28GQCe85Jxc0306mFj+Ad+XepeqBKUrZDrQ/Pj8d7BTAOMKE2egL?=
 =?us-ascii?Q?1rdfje5387S+gDAJe77+Bl3nBdGbMWwCvHu1rp/9ITB1klHoWlu1tx/LpECN?=
 =?us-ascii?Q?0uYfzWVKzkBvUmL1CO9OYgSxyluHRjt58Rs7j7NZdh9mvBVbmYMbcYAfTKUN?=
 =?us-ascii?Q?hw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fe97cd06-2724-482a-def5-08dd759f18b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 06:40:33.1062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2mD5gjd4QGNyVnPkCP9lFnM+PLdQ3SyLnI2mrlZFHSOB63vrEw0h1QLdgMyHOw7bjktsCP7/V+aLaDEfCuqkxvboyq2U6Ue3OkZrDCFuQSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10869

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 30 March 2025 11:24
> Subject: [PATCH v2 2/2] drm: renesas: Extend RZ/G2L supported KMS formats
>=20
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The RZ/G2L driver utilises the VSPD to read data from input sources.
>=20
> The rzg2l_du_kms component lists a restricted subset of the capabilities =
of the VSPD which prevents
> additional formats from being used for display planes.
>=20
> The supported display plane formats are mapped in rzg2l_du_vsp_formats[].
>=20
> Extend the rzg2l_du_format_infos[] table with the corresponding mappings =
between the supported DRM
> formats and the formats exposed by the VSP in rzg2l_du_vsp_formats, maint=
aining the same ordering in
> both tables.
>=20
> The RPF module on VSDP supports various format conversion and send the im=
age data to BRS(Blend ROP Sub

Fixed the typo VSDP->VSPD while applying to drm-misc-next.

Cheers,
Biju


