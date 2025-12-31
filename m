Return-Path: <linux-renesas-soc+bounces-26222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34532CEB9FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 10:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B87B33031A2E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 09:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9356130FC37;
	Wed, 31 Dec 2025 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wWNxAoyX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5730FC36;
	Wed, 31 Dec 2025 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767171864; cv=fail; b=FkvoADZCtUw+vmZeJ5FgYyXcQcRhg0mktWD+Geomr3sQ9KqpnkWW4672uRZi/qIUdhI4XaCHGzn411YjQUZC1+jNxKV83+sBjk7io2tr1eA/SgGuIHMemVhMuhkAmGl/FBhURV5DquZCiS5Uwv0NLaXYAYq6jKnsV2kALmFKg3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767171864; c=relaxed/simple;
	bh=WhwY49kJE76FL60DVwxg+W1Be/HKmVl6uoar8etSiRM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=htSLg+vG7jR++8yhw5cXGR5UaNsBfygF6+hwpuVtlbzEkJfi+hEH+HH0kIctcvxCFHh25zFNJaYePA2JbXR8FW6ErTEnz4hsClGn4UUgo1k7YwxLZH2MF7itGT7UgedMD0Y0QmxXal6CwtsfeU9BQ3lMG9FK5dkbqNpJE/rRorI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wWNxAoyX; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSlTPbbBM/Kuw0nPSK26bU8CGV/tGNpZi9E7S2I483j6gcwlW9AkckVdbrp+3fqtuLdSA73l342Z9fQ17vFAr3qLr7M5LI6uFh0/ae3UBU/GTDU/i461IsNlxD3OJXGhwko8W32Ra8liwziyhn2A8bOKOfLwIbb3e1i3Jag+pSeeivUevTAScRhz5h9oJFRWUvfhz8rKH05S5gywvXEVJMdnvmPf3+s/1fM3/k+cQn4q11MbWlvui10VGdRzPgN2uLKEx5KJsUqou+27D55arUInMcn1TeuAcEoV+/901IVdmkKGGQjjVNoWFDUVS/D2iv1bSbt0GUzM7AhzO969sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOla/7ccesDnDtV2Ds1c9KTh9zvckSHax6jvmvHlz6w=;
 b=ZQtU8WOCpJhCcgGN/jGp43uOpJIUmsM6Gz8TLleeSEurTqt8/nkxzRNYLRKxpaFPYKX8Dfl342FvFp0NCF8vOP2C2oL+f4w8+bSMy9etrR39oyeILKlAyO7hGvlLyBiwP2GFEm0YCICQzR3Ce/UJ+oXEEqb8tgJrPeGgznDAikCu2nhEzEnINUBvc29b1jD1tsiprbpsy3Ax030G2qT5PWgm1RQX+A5JYBjZM9aIyJt2OVvVRyFhUoEn4Lt9kHCZC36ue78Vz7ZTLTBy6mjC52yO/GV9Uk2fAn79c5/gnFx9+8F+wmhok8e14thrMnc872MHdQgCk3+bY9hDIlNWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOla/7ccesDnDtV2Ds1c9KTh9zvckSHax6jvmvHlz6w=;
 b=wWNxAoyXFJoJrPjpSsm5YWMYKPxfH+jC8wK02v3O238P2W4KaQVMnLfduzbYdlAsb8zrwMafLIXXuX66c4r1f1ljXwQbwICh9p9fA8+H+X0q4sNZRCVtA4GSYBkDihe5xIU0nY9evFxVHTS4AHU+4Z/LYvQ8xrf7ZvhWvLwuZYA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB11261.jpnprd01.prod.outlook.com (2603:1096:400:367::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 09:04:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 09:04:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
Thread-Topic: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
Thread-Index: AQHcei7JxBZxwv/PikKoXTQSaVLoTbU7c6sQ
Date: Wed, 31 Dec 2025 09:04:16 +0000
Message-ID:
 <TY3PR01MB113467FFD21E457C2B06EC8EC86BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <bccb1a911e76d771dc457012bcc1b943a8c1cdf5.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To:
 <bccb1a911e76d771dc457012bcc1b943a8c1cdf5.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB11261:EE_
x-ms-office365-filtering-correlation-id: b4b221ee-0aaa-469c-0973-08de484b93ab
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?obmQuUfToCN/IYqECti1pteQwxPtrxtDLSaUVptS6aoXFQifrjBrjrf/O6j5?=
 =?us-ascii?Q?F+9v1pLhjqd2r8JRFRzhP/F8FnAF63PadQwya4LC0n6dhvQ9IQueMAa0nPJo?=
 =?us-ascii?Q?JT0HyDtrOXkvOKsdNn1vYE4h9Et/ZT9O2B5hpGZWDCzBbzsGZgUc0SuTdjuG?=
 =?us-ascii?Q?2g3NxWg8xh37r5oTDeel+z6stgl877BDzivs0xllemWatOguFo4MG2OE67Yp?=
 =?us-ascii?Q?QUikrRC5ci6IWbEoSmQvaFr10ek1yj15knSOZSawE1hl+ayo0neGTHeWPWYQ?=
 =?us-ascii?Q?ptyLNYuwpkSyf8h7gKGHIWnPTP4NZBNftUtADSfpfdGoEBhZXF6GdBNNgiC8?=
 =?us-ascii?Q?t3/ulgFuxOacvxRQGe/IPSNECdJI723m+RzPo1AlwmQ0PLkqvcEYcl1l9OuP?=
 =?us-ascii?Q?v5RYLZUYlWLJylR7IPMISiUnYGq9mkAsqXs3gz9tUJWx3V2G3cY8BSP+GfBr?=
 =?us-ascii?Q?QFaeYyZlSpuPwe01X3crntPIYIniLr6BC29LKOlGb2clsEOdBsNchT1w3ExM?=
 =?us-ascii?Q?mFE7hzBVEbjv4XeepYjVytuaoU8pvP6v0EMMk9o9oQeDHHqjwZeazF07bW3e?=
 =?us-ascii?Q?BQpylTJ/V2NvemCcAG5k/aITgD3UVIzCf7SdoINQgY5cHnfonLk7SBz6a4Hv?=
 =?us-ascii?Q?eWX4UOljizFCdfY/Z7hjZE9THT8owZ9QJWyAqBp5r1D3GjQ6lfr/YE9wPvYF?=
 =?us-ascii?Q?EOK9GtxH6p2gZDf3P9tIL05Sn2alGwCsQpb2VY3XSkBancbyZsU6PfV6NFiC?=
 =?us-ascii?Q?LDgC8nnGyVCzwI/6wi42TQ5EcS3sP/V4UVPMgewf9rCIPfVUW0UJQibUzgiZ?=
 =?us-ascii?Q?hw58smZ38pJY599CjMk3gCZoSMf0xAYzNzasqEjMs2pVaq0schH/BQiA2JIT?=
 =?us-ascii?Q?HidFsaw3do34hNTQsPOObcw8qym7CPb9eejNBV9T/xViKRyqt/xV+9eRu2RS?=
 =?us-ascii?Q?IDxaMF2uHa48iwoSKFrfN9C7WDM+t/6y4PgZ+ViIjX+HbYuMN67/UPllX9w1?=
 =?us-ascii?Q?NvDhYDtxGD5KpZuQxblVDYCcyEkNPX/wGx8mRryKr3DJmY2loIGHmnuGxNPn?=
 =?us-ascii?Q?E5U3G91bsbU0SmJZp26nvDfrcmeYiw9YLXxuy+Tkg+Lu6xWKzA4x1epHtwIy?=
 =?us-ascii?Q?c0yZGibFNVSqapUxzqYtJ9bpBBZVRhTliqBVv5WaKq5w+cJyAia7wKMDxCt1?=
 =?us-ascii?Q?ncc6NYMmuPrj+H3PirrDFeU3RnJje0Z0rR/SsEC0WtGvQgcPFEFnzznSE8th?=
 =?us-ascii?Q?N2bj2Yyvhu0iyBNxyZXdW8ER7ibXP8JcC6Wqo4vsdeqOIZQY6hB9SvcEihOE?=
 =?us-ascii?Q?u0KvG6bYfWuxcLUMS+GnQ3ZnppsbKu+IgV2vPFB2VKVNkifdUsA1rbUXA7+g?=
 =?us-ascii?Q?cwVfgGwaOr3SCI/UeYbB7KPCJ8Qp1ZCWMgo9ZzhrtEB1qH9LyrHMH+9xJgQC?=
 =?us-ascii?Q?FjfHsUbMzJAQllUzcU4rob4JfZwHHtg2PdUw3hKjM3tr9vL+dCTLMrnx+MB1?=
 =?us-ascii?Q?A5WkeGZT79E5mF5rI9OKsdlT1QUSrhnODe5f?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jcAvdXJcxpnKQPKMo/oqpnGXSBgOxKnHsObqWJAfNFNREq3PTBH3XKLsjCZ2?=
 =?us-ascii?Q?bZcgulzL0VrVoGWbri5o5y/zuu1zCCol2i2IozVzBCi4t2WQiv9GAf3O03j0?=
 =?us-ascii?Q?vIeSHfuUwhQqiNxd6Ai9imf7Rfby5VrGXxt3maDUcE5yjREdO2gfwdadqxKb?=
 =?us-ascii?Q?9RRfXiGZwMm3KNVL1+48c57urz65aTJ9cMlpnGWAnQICjHOEOjpB3UhsxwHY?=
 =?us-ascii?Q?vD0nPMn5pEGoSrbAZxR1SAVD4AoLPrv/dX0QwvNEP+a93id/Bqjd4AGXjlj9?=
 =?us-ascii?Q?eCVqpWGsSwqkFr0RaiHgR8MmE/MjK46NFfYQvlC6ZUp3nApEw6mIvM50rK+H?=
 =?us-ascii?Q?5V4RGVaTiDjPh3FQMkgGmpOIE1QjmLDHZHACjRNiIbmon6Ag4EtDU278lLZc?=
 =?us-ascii?Q?h7kAR6Uapx24CL9zZUu8K8uOHrQYoPDpx+u53rvUrxO5WF7hO9q7jE1sk8cL?=
 =?us-ascii?Q?deTCgYKhaT/gXU0dK7pylRpwnrqWQq1lWqos0v5ksWW0+emOX+DBTKm396bS?=
 =?us-ascii?Q?GYzwwDGxabn6RWOvPjOvqm0tBxTQvA6TEUPCC3eu/iFkIOcGQyqVT+VAAqF1?=
 =?us-ascii?Q?//EdoMKXxwhq5hvDTsZjLrXbOcO1a8nzNfkawvkccfwkbPOYj0xrdooWX2O9?=
 =?us-ascii?Q?e+d4m0yDw8+TIX6N//XO0UTL8gNbddObMRck3ANq+DUW0dis2uxjmFjh+GJm?=
 =?us-ascii?Q?iyd0drccduyTjXT/FE6Gp+JjcBqybJYyYmFitgv42JmvOY/HMsTAAOdpGzrk?=
 =?us-ascii?Q?QgJVxyPyb+gYfrJk6j6NQwyJpFztmO799qwYkfffYvlxZbxug6hDvexh/aCq?=
 =?us-ascii?Q?zygUeoEaQM/XnNj2yYKZJGHf4XEuxZ8Jg6i/vDieL0Wh5WQSMIjyFcCfdA8A?=
 =?us-ascii?Q?1jxJMa9fUaI8A3hVJaCIBf9IqlnL8eRKSpzXuz9kkas+AzaKCpos28C+msoY?=
 =?us-ascii?Q?J94yaFuMrqGM+jwLAD8nStEhmQ51YxUUc/69sIheI1LubaMRVoS4QahijA1w?=
 =?us-ascii?Q?HKi+OxZQG0mH/ubSRfTgsQjeYYNmKfiGHGj/W73vJ2+utGcjkRxgMyIvWAPN?=
 =?us-ascii?Q?yMGrIX46b3SdS9QOtdjjRctmIjdqoewZcL6JzT4PU9Fi/a/ygwjiprP5Ol6i?=
 =?us-ascii?Q?3yi1zb9o/DdcsbtAXuXMl00orks3AGP6wvWtixXPTR8IDDnPMmHs4VsHFbqA?=
 =?us-ascii?Q?YLvWYPkZBbqtbWEEP5Rs0Ehx/umTTwbyr6pHqPmLkHGkh0ygjsTUCgfEs+Qb?=
 =?us-ascii?Q?N6mUCRyM/530/eSCOSFC60RVNXxKfvmuD3T82qi4MV0kw48euikEl/w06MqZ?=
 =?us-ascii?Q?6JitMsrSQplt7j+AvTxk+E2d49AlIACyr9gTpBHPmdrgQ2uHrw06aXRv+OxU?=
 =?us-ascii?Q?1LjbNfSYw3IEg1KzjiThQpnDmHKB4427riidSdz9T+KQwgtNvZeoNqNOf9cJ?=
 =?us-ascii?Q?aXryZ7GMmYImjFcrCpU4hHwyCayQHx5PQ8Z/FwR0nXZdaDoHjVkKr0ztY3LT?=
 =?us-ascii?Q?EocYVsHBxBBWRFg4GFdYQ15qdGuxacF3bdIU2U5tQ2/WGyqkzwBwRhSqUAMQ?=
 =?us-ascii?Q?kIBocSplJMA1WqVF6AkZ8N+Jz7nh08UZbSHv1IMb3o5EmHmIEN1vWTIfbDF0?=
 =?us-ascii?Q?kWl0Zt1nqCFfcvHEf+3Yz5wFZ4LBuTOhnqXBheDeOVflI65drfIMDg5WcugY?=
 =?us-ascii?Q?bDUbtLEXSEhML0F3sSHqBx8muMApXsPijgVhWtbovQuDwJn5kKyvcWSP5WL8?=
 =?us-ascii?Q?JGQZkH20LQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b221ee-0aaa-469c-0973-08de484b93ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 09:04:16.9778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SBMOIOdXGY6r+MnayYRZ+r2SNG8vzJEE2SblDVpmIJGADKNvj9PjtNbPJHiqfLsXyrauvB9mKPsnMs32U0NWs0yaUsxhcs7K+lnSqAVorE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11261



> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 31 December 2025 08:23
> To: Tommaso Merciai <tomm.merciai@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org; Biju Das <biju.das.jz@bp.renesas.c=
om>; Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com>; wsa+renesas <wsa+renesas@sang-engine=
ering.com>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Frank Li <Frank.Li@nxp.com>; Philipp Zab=
el <p.zabel@pengutronix.de>;
> Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.damm@gm=
ail.com>; linux-
> i3c@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
>=20
> The Renesas I3C controller does not retain its register state across syst=
em suspend, requiring the
> driver to explicitly save and restore hardware configuration.
>=20
> Add suspend and resume NOIRQ callbacks to handle system sleep transitions=
.
>=20
> During suspend, save the Device Address Table (DAT) entries, assert reset=
 lines, and disable all
> related clocks to allow the controller to enter a low-power state.
>=20
> On resume, re-enable clocks and reset lines in the proper order. Restore =
the REFCKCTL register, master
> dynamic address, and all DAT entries, then reinitialize the controller.
>=20
> Store the REFCLK divider value, and the master dynamic address to restore=
 timing and addressing
> configuration after resume.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v2->v3:
>  - Fixed error path into renesas_i3c_resume_noirq() and
>    renesas_i3c_suspend_noirq() function.
>  - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() call.
>=20
> v1->v2:
>  - Updated commit as v1 has been split into smaller patches.
>  - Use clock bulk API into renesas_i3c_suspend_noirq() and
>    renesas_i3c_resume_noirq().
>=20
>  drivers/i3c/master/renesas-i3c.c | 89 ++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>=20
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesa=
s-i3c.c
> index b065b8d4b138..e33ff16efdb3 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -256,16 +256,19 @@ struct renesas_i3c {
>  	enum i3c_internal_state internal_state;
>  	u16 maxdevs;
>  	u32 free_pos;
> +	u32 dyn_addr;
>  	u32 i2c_STDBR;
>  	u32 i3c_STDBR;
>  	unsigned long rate;
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
> +	u32 *DATBASn;
>  	struct clk_bulk_data *clks;
>  	u8 num_clks;
>  	struct reset_control *presetn;
>  	struct reset_control *tresetn;
> +	u8 refclk_div;
>  };
>=20
>  struct renesas_i3c_i2c_dev_data {
> @@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master_con=
troller *m)
>  					   EXTBR_EBRHP(pp_high_ticks));
>=20
>  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> +	i3c->refclk_div =3D cks;
>=20
>  	/* I3C hw init*/
>  	renesas_i3c_hw_init(i3c);
> @@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master_con=
troller *m)
>  	if (ret < 0)
>  		return ret;
>=20
> +	i3c->dyn_addr =3D ret;
>  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
>=20
>  	memset(&info, 0, sizeof(info));
> @@ -1362,6 +1367,12 @@ static int renesas_i3c_probe(struct platform_devic=
e *pdev)
>  	i3c->maxdevs =3D RENESAS_I3C_MAX_DEVS;
>  	i3c->free_pos =3D GENMASK(i3c->maxdevs - 1, 0);
>=20
> +	/* Allocate dynamic Device Address Table backup. */
> +	i3c->DATBASn =3D devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
> +				    GFP_KERNEL);
> +	if (!i3c->DATBASn)
> +		return -ENOMEM;
> +
>  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, fa=
lse);  }
>=20
> @@ -1372,6 +1383,83 @@ static void renesas_i3c_remove(struct platform_dev=
ice *pdev)
>  	i3c_master_unregister(&i3c->base);
>  }
>=20
> +static int renesas_i3c_suspend_noirq(struct device *dev) {
> +	struct renesas_i3c *i3c =3D dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> +
> +	/* Store Device Address Table values. */
> +	for (i =3D 0; i < i3c->maxdevs; i++)
> +		i3c->DATBASn[i] =3D renesas_readl(i3c->regs, DATBAS(i));
> +
> +	ret =3D reset_control_assert(i3c->presetn);
> +	if (ret)
> +		goto err_mark_resumed;
> +
> +	ret =3D reset_control_assert(i3c->tresetn);
> +	if (ret)
> +		goto err_presetn;
> +
> +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);

Why can't you use unlocked version clk_bulk_disable/enable(num_clks, clks);
for suspend()/resume()?

> +
> +	return 0;
> +
> +err_presetn:
> +	reset_control_deassert(i3c->presetn);
> +err_mark_resumed:
> +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> +
> +	return ret;
> +}
> +
> +static int renesas_i3c_resume_noirq(struct device *dev) {
> +	struct renesas_i3c *i3c =3D dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	ret =3D reset_control_deassert(i3c->presetn);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_deassert(i3c->tresetn);
> +	if (ret)
> +		goto err_presetn;
> +
> +	ret =3D clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);

Same here.

> +	if (ret)
> +		goto err_tresetn;
> +
> +	/* Re-store I3C registers value. */
> +	renesas_writel(i3c->regs, REFCKCTL,
> +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> +		       MSDVAD_MDYAD(i3c->dyn_addr));
> +
> +	/* Restore Device Address Table values. */
> +	for (i =3D 0; i < i3c->maxdevs; i++)
> +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> +
> +	/* I3C hw init. */
> +	renesas_i3c_hw_init(i3c);
> +
> +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> +
> +	return 0;
> +
> +err_tresetn:
> +	reset_control_assert(i3c->tresetn);
> +err_presetn:
> +	reset_control_assert(i3c->presetn);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops renesas_i3c_pm_ops =3D {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> +				  renesas_i3c_resume_noirq)
> +};
> +
>  static const struct of_device_id renesas_i3c_of_ids[] =3D {
>  	{ .compatible =3D "renesas,r9a08g045-i3c" },
>  	{ .compatible =3D "renesas,r9a09g047-i3c" }, @@ -1385,6 +1473,7 @@ stat=
ic struct platform_driver
> renesas_i3c =3D {
>  	.driver =3D {
>  		.name =3D "renesas-i3c",
>  		.of_match_table =3D renesas_i3c_of_ids,
> +		.pm =3D pm_sleep_ptr(&renesas_i3c_pm_ops),
>  	},
>  };
>  module_platform_driver(renesas_i3c);
> --
> 2.43.0


