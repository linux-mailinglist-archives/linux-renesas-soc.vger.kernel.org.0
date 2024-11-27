Return-Path: <linux-renesas-soc+bounces-10740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C7A9DAC4A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 18:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AF61B20BDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 17:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239C4200B88;
	Wed, 27 Nov 2024 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AuoV7KyR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D3225D6;
	Wed, 27 Nov 2024 17:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732727944; cv=fail; b=Pfsk5gESYCUhLtXjRz5qnsHasg0fiDBa8ao1+A9fXhwNOn6lyPSh+oppYquxY6yX4KmzRDJI7SRQtnG9UBa3Z0IwzXmAKdXief3fDbAcJaxSAgxzt2AfFtMtZqVI2HZCmnnJ0keiBqxrYtQCGAILVwO/96+75Xm9rjdPAqVK6vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732727944; c=relaxed/simple;
	bh=k7+h4mUsnWTr9x37pV7VbX4ku8iN3k6E0o0jmH1YYfU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UT3kmW6WR5u9czlE6l5mvW68sZ3lkei1ghzIMaoVjqzgRzTHbsDoSIPCXv3iZWt3WObuJjPQ/0mB3f8I2qZ3KJXrRQjVEgjOth7hHjPvRnsLP5A9fORzbKspF7d0PaT4QpLLd+TBQJrinnHFFc+pFK0nrCv+fpGtscWNTTotFqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AuoV7KyR; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYN8ixiX0JN7grezxBf1trqGaa5poOylRvii40ECb8hyDlZ6r6yv22pY7Y4fGyc8WNx+JWCTIWpbYQVIG2CknZvGJmt2RfC5818+BysrVAFDwOrbkybcgarJVqk2JJYqSGOCz9i4/ihGBupb7Z2FbXnR1wDsI6bRowNQFwF+I8c29jO90Y3sagAKGEvWS2gx4RrdIbveZU+YB7h1XeIFILQRtpk6RsBX2TIUFdQ+ll8JZjyyA5NGEjLOEZQ+Y7TIeQVq94PR7a7YYyktabJPo7oTLh7zBz1Hznsspx1PnEG2vwZLxu/a+BfINCRyDR9zo2iJx/DQLWG9JtIr8+H+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Piww8UOttB60gnpfzwDC7wBULiQi1yWBbpgu9SUiMEk=;
 b=Zr2YB/+usOSDkqFBU/u992rPqsemEnMJ4h+Dh+WXCPldk/8egJqfCfLsQwhMnkeTa0CCw8WaFpOecF8HglMypGWYT6BpnI5mbbwcGntWmt9DNgUkxWGv1w/K4jbobc5FxF+KbLkfnDdyfiw0i2wa6rTIrq34SLJ2GTEB0Iz+zDw/OIMXXoaKlU0DbWeBRg+F/rJ+0VepT45Yb5MhpAIBW7mGWZkWq4dtoSFfRAPZSveg+a6DvbVEj2bYh2Ua/Ek7vbKlLP+9jdIN63l33nT1YK797KtJOzeydmXurLJLQhb+VKRV6ulq9PdapaPN1oSL+LXa1wJ4vVM1qEEZQN1Pjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Piww8UOttB60gnpfzwDC7wBULiQi1yWBbpgu9SUiMEk=;
 b=AuoV7KyRcUMmJ4AAuhAkj6HzkVB5pt1QvRPkzG5tf4XnTYecEyLThSgGCXmv4ibsfRWlti/BDcddafo0OI4e5OwiqCfQ8ZVtxKfX4eFHE3p/WYINysKyUse3eI3IArhajSYDnOGhyheACHd/3eXXctphwLQmK5JaeC+0siAYCqg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8278.jpnprd01.prod.outlook.com (2603:1096:400:15a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 17:18:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 17:18:56 +0000
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
Thread-Index: AQHbPNyO/NJTh1WC/0KM88VRnUTf9bLIXIKAgAK487CAAETkAIAABnnQ
Date: Wed, 27 Nov 2024 17:18:56 +0000
Message-ID:
 <TY3PR01MB11346A0C7A4DAD6A250A6B55386282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-4-biju.das.jz@bp.renesas.com>
 <20241125-straw-oozy-f95e18e4704f@spud>
 <TY3PR01MB11346BC7FA5C81C108B4E7A7786282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20241127-epidural-violin-651fd0ee2526@spud>
In-Reply-To: <20241127-epidural-violin-651fd0ee2526@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8278:EE_
x-ms-office365-filtering-correlation-id: f2ed7ad2-f399-4653-8089-08dd0f07934a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8YSMFrsHlFzkdqcEr/bFvnKs+PaP2nDS7Pqq2GN43qc5bY+cc9xLaHZiTWlF?=
 =?us-ascii?Q?4mo/AW31Ha08+Yt3hWuv0x9kY3AJ5+CPPNAa/8vh5BrJaOWPbXNK5iaJOL+Q?=
 =?us-ascii?Q?mWPjnGGj68IkzbWvgVG2/nH3YLPAnBUlXVl4zQo20S08yTwuGq9gECW0qlCa?=
 =?us-ascii?Q?6zQyzgYNN09//mg0miHLk07aJhAkUpl5EjA5nqOqAcmJrW30ApuZm5kC3kiB?=
 =?us-ascii?Q?kMSOqexvddI8E9H4rHc/1CZr/qkUSewBMYTWBnouzjHTUr+MKhE/jRuGiE9f?=
 =?us-ascii?Q?Nj/9XPA9qw5EwWqcC1+1fTL21Ma1mVw8UKJfiURzWVZJZ7QhdnsKH8OaQk7Z?=
 =?us-ascii?Q?XH/Ugkfhq0SHVcqcj5iANMvT0XWYeOY5AGkMsUGapGODTLtcHJkYaGeAHxtx?=
 =?us-ascii?Q?WmQIXzneaZp7ttE4FB1DrUCkzFK6EJh133COX5EFQVIcarPGETaYOOEFyTAy?=
 =?us-ascii?Q?KcN5w1nVGCEEVp3IUNA8EhrQ3SCrR0Lyv4HrlCE0kvWkDQS3Ousy4oXzkWIN?=
 =?us-ascii?Q?WV5bFOp9+gBDkdN3XU+c+sxodlKzD2MUUs4eLAeGHbgDrgR7HtYLUB8gq9P0?=
 =?us-ascii?Q?VDCVy6GA9KnAnVu9eUnTPfVqaS+5bOU5VH9xqkf0gkOmhj6DYG9Dx712tDpc?=
 =?us-ascii?Q?K8NJqGQtSYkm2u4SFx2n/nN8NbSoXrkFnOCbrFSb81E7+cu8XVu5f2bshSIs?=
 =?us-ascii?Q?U6gZY3MGB1JquQnfV36doezAm2RJPt2tGRIGKY6L4j/4RQtccUwmClHtrf+u?=
 =?us-ascii?Q?BQZUMKQdqjlXe0BzXODM5NAwJ+UPsDJ3H7pbXipBEeiZClOrZPzxC8uTJsR/?=
 =?us-ascii?Q?ERJnfHT6tZJl3BxJ3pXzJLoTVKyLdYlLeJ9ihliKrKnDLjqkSDlg5t3lkSOx?=
 =?us-ascii?Q?oAi30n64BISwoG6wxpYolCHK2SbTBhVrvei3Tb0gSg+O/2n/oA1T+jqAAou5?=
 =?us-ascii?Q?EylGeYUvmzd2ISUNt5uoP0Nrt35crpQysT/kvwCdnEJpMd7C+UBaeqCRbSJW?=
 =?us-ascii?Q?5taVo4V0N+wFIKFK8h6X81pPBZ3q1x95Qupij0hr7XX68dGPKPWXX31Xr2g7?=
 =?us-ascii?Q?s4gsooYl4b1nbgKSCmcFjB7yL39uCduiGYsZItQsgjsUheKA3vVkH0PmIeO6?=
 =?us-ascii?Q?m7eKBIfE66Z+LTv3SRH1XzRfKQbnmvOZrCev4x11b5JD+Xf2qGh5Usa8J5eN?=
 =?us-ascii?Q?TzPWeaPxmbYTXD1kozc6YWk6Efv66LXHfiUbQq49crK77pPmzZPMuCBzyU3B?=
 =?us-ascii?Q?L26RhOX3kdrA5SJ5E4WtZBwXyaovHB5DfJivGMvK48LkRn6oa8m+DAF2Crtr?=
 =?us-ascii?Q?pvnU9bOecG9FzU7hCKb6Cwk5GRPBGM2xdjWgkfdi5SVk9/Yz7nNb8mrgmjHv?=
 =?us-ascii?Q?AqV9bPs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oou0RJvjlWYdn2dK9ACX9Wkg6bDFKEiCbwGA3zd8GlidR6dyuF2wlSK9/MSp?=
 =?us-ascii?Q?l0uqDMIDGUbBUgCfOXT5lYALrCf2oxO0nKgqBAMsnBz3guhJNXfp+7BxIhvo?=
 =?us-ascii?Q?hWdbK3jEQfR7/ngCr0a9ptvJKBdweWm8YZSFQsF2c6o6Ue3hdI7lgujZmzrV?=
 =?us-ascii?Q?bMXfkK9tauSlfbXhGfdwaCG2oN0wC/gtZSuU9paAX9UkD1YxleKFsT9j1veP?=
 =?us-ascii?Q?dXAlZ0ZA/JBySLL9JWbcXVphDwDRWWz3q0SjsbAQyslwyHvGL9vBbG01OmKq?=
 =?us-ascii?Q?LGXbX6coZf2rvnTdLVH5+sRhcWEfColurp11UclGuFulO+g9j14pxPBxUqgA?=
 =?us-ascii?Q?+wWlt71GAnXFr3ry1nS0fXLO6yFwZsCgZ9jrjuPSp6bu04+uUWT2E8KVVVD4?=
 =?us-ascii?Q?NJmJ/HMCnuh5VcuCWcpljAxHVUeQTkFbfl2TIDtafmLx2Vn7He6H3JVIBIM6?=
 =?us-ascii?Q?9yaYjRoSjQnyf991kRD3kQ5KQPPLBEV6iQ7BSsNLy2ZleFP5/jueGuwrx/Zn?=
 =?us-ascii?Q?R74/Mcdd/e2ROGZzXw1q7QH7+NA0sbqdIwaiXkvyi0pUvI9TOt2qVpgeEXPD?=
 =?us-ascii?Q?cmkkycVeUriNW8wGdP75oXU+vaxXOA4DBugigfNLALt1jJDW+8mjhaP7mUAg?=
 =?us-ascii?Q?ryy6wDX55Dmk3jb/wUORBRx0QGogNNjdtE/dcz/zxet2gjMVh4WxuzT7n0XO?=
 =?us-ascii?Q?6yrIv2S5urHjo9P9QBg/wghtt2jI5ZjrczePkcSPgoS9+HulZb6FrDgak2f7?=
 =?us-ascii?Q?KeCEUfMhj76INUqit/U6e+EqRwd76POOSGgYUiaR5i5eip8tqKFlLRdyIo81?=
 =?us-ascii?Q?55V4QH4uyUFfknkoERmkXfpwRpRRBDUjabo/Ov+oIaacKWe9LQcCkwuE8PGu?=
 =?us-ascii?Q?Ej/k8Gjm9JOERw05rGGYs4icam6bvaodGOy3577oFH9m4acUTNWCocSduevS?=
 =?us-ascii?Q?r0l4KJcpOMwLf5DfsP2D8RUSyLGx5FkMkza5QMI1Y0D5mgiGkXJtO/xYoYBR?=
 =?us-ascii?Q?1lU4xfb4XJsVwxVizP0DrCXKJAJkVY6+SV+J2NUT5u3toBFQVLv3K/6kY+Of?=
 =?us-ascii?Q?FYrXtzJBJbRSDi8swrVm1HJWVfXlMuZnDSuc8BYeXFer4n4qt8FPqwiS3EqS?=
 =?us-ascii?Q?j7UnJxwzrqu7gtpAuyMguLTb8IjS0UeUdYqw2jy8BSeYBRRWtHnrVTIEfCvD?=
 =?us-ascii?Q?OO68gHqBoKDVDgyjw2V8c3Obb/s4m4RtWGzoa5zPSXWav58o1Q3K5YpqwD41?=
 =?us-ascii?Q?/QQTsl9+vNFuoM4B94Uu0ORYjA0MEIH2Ictiod8cHgeAWTO5R97cmtrkcJ+B?=
 =?us-ascii?Q?I49m8GruARyw/mgPn62Y9pVycSSA41R3LYYLD/1Tpj26oJjGabuJrQ5HGdty?=
 =?us-ascii?Q?1Zn9SWTwpIDC6rGLewBJGn8QW+tBLEkfpxUw95PPxtOpmlUzI0cpH9mX60Bg?=
 =?us-ascii?Q?Hax23UJKh0Qogek45NYbmv7A1sPKec9ttbWdMC+o8AlaQe+hLIoPPuOw2xky?=
 =?us-ascii?Q?SHQ6lvjlhgVgDZJ/8eZ3mE7RNWSH46+ikS0rzCdrKLj1QVJfqVJs7CTjSINc?=
 =?us-ascii?Q?zAnwMeFojDxFDOjuLy3WKQejiohQ8efFV+yg8bWMBfN7HRH61Iw3zsXBNsey?=
 =?us-ascii?Q?ZQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ed7ad2-f399-4653-8089-08dd0f07934a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 17:18:56.6668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/4QRaxWqULeapnRstLNocBRxeku1VYqJCWy2kyXAvJhIUuSQFYV7udRYOKJ5XswBgjRkto8eLc0KJq21r8mGqaB0ArBeyEobt6V7X/qfVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8278

Hi Conor Dooley,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 27 November 2024 16:33
> Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMA=
RC SoM and Carrier-II EVK
>=20
> On Wed, Nov 27, 2024 at 12:34:42PM +0000, Biju Das wrote:
> > Hi Conor Dooley,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: 25 November 2024 18:52
> > > Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document
> > > RZ/G3E SMARC SoM and Carrier-II EVK
> > >
> > > On Fri, Nov 22, 2024 at 12:45:39PM +0000, Biju Das wrote:
> > > > Document the Renesas RZ/G3E SMARC Carrier-II EVK board which is
> > > > based on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC Carrier-II
> > > > EVK consists of an RZ/G3E SoM module and a SMARC Carrier-II carrier=
 board.
> > > > The SoM module sits on top of the carrier board.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4
> > > > ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > index 7cc2bb97db13..1785142fc8da 100644
> > > > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > @@ -527,6 +527,10 @@ properties:
> > > >
> > > >        - description: RZ/G3E (R9A09G047)
> > > >          items:
> > > > +          - enum:
> > > > +              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
> > > > +          - enum:
> > > > +              - renesas,rzg3e-smarcm # RZ/G3E SMARC Module (SoM)
> > >
> > > Why are these enums, when you have a single item in each?
> >
> > I just followed the style used in [1]
> >
> > [1]
> > https://elixir.bootlin.com/linux/v6.12.1/source/Documentation/devicetr
> > ee/bindings/soc/renesas/renesas.yaml#L531
>=20
> It ain't the same though, since you additionally have the SoM.
>=20
> > Other than that,
> >
> > In future some vendors can add their RZ/G3E SoM's here
>=20
> Only makes sense if their SoM is compatible with the smarc2-evk.

All our SMARC Modules and SMARC Carrier boards are SMARC compliant.

So, if anyone have a RZ/G3E SMARC SoM, that should work with SMARC2-EVK.

>=20
> > Or
> >
> > They can use Renesas RZ/G3E SMARC module and use their custom carrier b=
oards.
>=20
> But allowing this part does make sense.

We already have a use case for this example.

Renesas RZ/G3E SoM can work on both Renesas smarc-evk and smarc2-evk.

But we only officially support RZ/G3E SoM with SMARC2-EVK as it has multipl=
e display support.

So, can I use const for both SoM and Carrier EVK as at the moment there is =
only
one?

Cheers,
Biju

