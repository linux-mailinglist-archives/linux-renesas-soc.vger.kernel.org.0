Return-Path: <linux-renesas-soc+bounces-10627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A89D3706
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52AABB21850
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234891662FA;
	Wed, 20 Nov 2024 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PCTfzxt4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7596158535;
	Wed, 20 Nov 2024 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094664; cv=fail; b=UCVi99ROmlOVLv1Sxm9tiLmzwhXLDF8R3ZPUarY1xn1W6BiPqj0zk88lthCdeg+ZmpxfUq84heBd1egYEVczqYJG62B1l0XuYOCM1jO+PeR22VxbobsyP0fYpNcTNQu2RQJWsWsvbVXPTE2//S/TYjuxnVxU0/eXkoiwexUUiuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094664; c=relaxed/simple;
	bh=61ypMFV5AkO74vBi/z1RX827jJV3f9Maew6kewELTeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fvTRnF6hIm9HqzL19CrrooC1HP0RRN7Zilm4Z8BkwGphlV5lbrX5DnDq2WzzMXuGfFaB7beORHq2ZvItarPYfKxIRdMkhKPkmj9DIxpBiM+G54UUDON78V0cxX6QyYdRf8Yg8mmz4B85wxIqpje9krKnBzVP3t216zsYXAzIITY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PCTfzxt4; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wf6MvQlmIi6iPTzj8D3gQtyhcadMxxzU+7vK2Y6GgJhzoLRATkuQZhSi5UKpWPtnYc3/FJzpxx2bV/vQDkwH+UQpPAJR6MyHurhwzzw6pNY9+aGHqaqm1cJSoFbbFZJ7oxBprnv2r7wrAjo+Mhf5T0IcsklKCLM6oTHY+G/0vl2Hq0VPGAMWWCfU/xK4tiqk+t6L43O3z+719MKmVrJtHo+bOrGKbYfPBnUbXxJ+vek5tirydTb0ZIU1NBiH6W0MZNlAWn11tYRJWDTUYGWJmjqoJ64rRAZ7dTS0g2Q25fJw0t9lQQPl6x3zkaf/IuVWGpIe004ZUaJjmPe9MGJGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61ypMFV5AkO74vBi/z1RX827jJV3f9Maew6kewELTeU=;
 b=Bgf5/MDVrivKYMJjbtwCMfT2o6s7vFuyNSBcx26hHovq/ef8RXzu4Ws6xrMo4ruyVZwExPzThiNrWy95TGTQYjoykZ3jk6RIsjtWtoiSm6jTinVeh8IgDUar6zhN3ngabQo6Z5xZHvABcw+t0WSTHtCHR6rzhxeNeixa3kUPoO1kzh4RhNMKf9ExRIzqKHBTNPH0YTPssGXqXd9LcxbhkyJpgRlOlmtzzxd9b+8Fcb43CWNcwqQDeoCfxZPv5+yHq0z3u6PF2sG4G3CSzyh6yB2iwVWHetP+DK4TZJW8f5moIP5/1FkoxLa7pfi5/3D5YAcIo12cXbOlLaddTR+Jtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61ypMFV5AkO74vBi/z1RX827jJV3f9Maew6kewELTeU=;
 b=PCTfzxt4N7/xzH7JO7MU6b1fZrhOAKCyZY+Kl07FgC1mebZTaX0JHqDS4tt000Z6Fi1VG+CdYfCIdwDfIBMerb36mn7Ii3hiv2pBmxrzoixxY3mDreXwqOrURoZ5TWFm6hsPujwV87/Ri6XJ+yyQlX6CBYbW65HQChu8W2VNy48=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13171.jpnprd01.prod.outlook.com (2603:1096:604:34b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Wed, 20 Nov
 2024 09:24:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8182.014; Wed, 20 Nov 2024
 09:24:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and
 connected power monitor
Thread-Topic: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and
 connected power monitor
Thread-Index: AQHbOynE5I/7Ggv7pUOLkDSF2escDLK/4UAAgAABaoCAAABBgA==
Date: Wed, 20 Nov 2024 09:24:15 +0000
Message-ID:
 <TY3PR01MB113462456AA6E23FE1BA0187C86212@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241120085345.24638-2-wsa+renesas@sang-engineering.com>
 <TY3PR01MB11346DB1A6D857AFD968DA9FB86212@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Zz2oR521sac6zUVO@shikoro>
In-Reply-To: <Zz2oR521sac6zUVO@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13171:EE_
x-ms-office365-filtering-correlation-id: 8a7e2df8-2c44-4688-0591-08dd09451a6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Hk1KJAf/tYIVPejplAsHNmFWQavqTz/RSriORo0JYyGbh4G2xye23Iwy+jJr?=
 =?us-ascii?Q?YWNa+UCe/5n9KfZeVwcf9YH12CNSax561ONu7/7BfSEczYkMpy+G4Lc4WZdD?=
 =?us-ascii?Q?/y5YEu8OgFhWaQwlDuTDrm8mOjqw5zI9FD7M2sYwPybuTwERzcMuAZe76amP?=
 =?us-ascii?Q?1ExBgngsKwN21WejUqfYWHrKEWtwEOPdnuHgmEn531NLZcqGhxZ1mWaB5M16?=
 =?us-ascii?Q?czjDR81PmI/1LqhsXrYX/nH3VE4kNFKj3iOgw5TsKKd6Qlod+Uuw15/H8gSr?=
 =?us-ascii?Q?KXRVaPRcS5v1Y5MjqIxqwTLjUHvDczVGhJvGZvnaZHkwD575U70VcnbXE9qH?=
 =?us-ascii?Q?srNCV9by4pdp1Cf8bB7PzUwIr5x5Cg7/CJ1shCG3TZ3OXMmCMLidXGBfLtny?=
 =?us-ascii?Q?DpAPinINa/KXeaHzuPP+A9l0ylu5i/x7qbYtwC34WI43fTSjnnNl5Rv8LiYa?=
 =?us-ascii?Q?1GChk/lG4pd7tW7Ja4KWaZWDv0dnkou3LPL4NaC3MC/hPc8T010Df9MxEd6H?=
 =?us-ascii?Q?HtSDlCxRp/tNujy8fB9zRy7zgHSVOt6T8xN/L7A69WAqE8JicluEFk1J8Ck0?=
 =?us-ascii?Q?Yu2tUVUiC1S76GzSvYB5TzueTYLCT/rqqa7eg30C9cStMqedsOxgr46syDSP?=
 =?us-ascii?Q?Bea96oCzZ140o6r8M8beXUw5vP72+gcOZyyAZQX36ePrCAKwU6vS0Ph/isNz?=
 =?us-ascii?Q?miTyzuix87I8mHahRUfIAC4nDVJa8/2vIgInIvr7s7D4z7g6DWbGiuR6CNY5?=
 =?us-ascii?Q?OrF2o/VhSN75ZS2NRgIojzeJv8ntgT87q1NQ2XrKw87lSnFAfJBfdCkOLG24?=
 =?us-ascii?Q?d74PGPbeGDmnN3BIjfUn9cT9XVvaFR9DP5OWpx3e5vWGcXbGCwzZ1L5sSLCI?=
 =?us-ascii?Q?BEy3lGVd44xamCTCAZj8T34lkbNZ9JaeJWP1U2U8rsXWXCHptCvhFVY2WinU?=
 =?us-ascii?Q?nJkiEBqWW3Cq8wtqVNVCVKB2YAXM6JfTTQE6d6NESnBkIzwktO6esrId7DU4?=
 =?us-ascii?Q?FYLogVIVIX/ZXhxWuwj+na1PlKIqJmxnlFBcEOwI1F1T/cNDCImSkFvv1+U5?=
 =?us-ascii?Q?uo4kTKLXpVSfiRbU3q7UJW+JKbhx6iWL2G/lcptz8i6CYIHUUMw337jCBjDI?=
 =?us-ascii?Q?bqBKNhSt56Z8ooHbDhveE3d8PsMUMEkCvTLmETCfscnuWJHt31dT1cD+nDH4?=
 =?us-ascii?Q?PtCw6ebiXnHKNVzOCp09up1TpV+5Ly2tLmH3Ep5CBRvIiyJE0IiYoHdYCm+/?=
 =?us-ascii?Q?xjhatIxiD/nB4/lEhI8VyVTs40X27kPWHaTdCRh5xJXP2honrCo1wF9ZEQhm?=
 =?us-ascii?Q?ddpFQwNaNT7RLb8y3D6vQusLQfStRhxmKHUPJth3bn5N5FKxEiPT06QHI6OM?=
 =?us-ascii?Q?1w2pVOk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?U6M4DdMwHv2kiEUZrIEhAmD/y10zxhv3ViqzdklJut8YK6DS5bdQro/2SGZ5?=
 =?us-ascii?Q?VB6MsNICUV+xtfPpJ3mEtlSEOr/dUR5TxGGK/aJqeyD0G2A4WSTjE1t1xcmm?=
 =?us-ascii?Q?V8c9Am9RQT6Po+soFk4Xkf35MFek2LPDx9KuS8chBnfrlqgctfBv3h16PV7y?=
 =?us-ascii?Q?wHJu0ZAeJLL7fSNMQ8DKeQuxFLKaTu0gNLXRzrUjIp83pTEFg47IZFt8Z3uh?=
 =?us-ascii?Q?5dniN+Sf7d0nRLw3R9lUEKfsI2eU2jr1jcCIi8JJ2IAT8IWwRZ5onWNiy/DH?=
 =?us-ascii?Q?GzFinsuqxQTmrA2WhDNG/eZkgt3V2P/iQCgx5jCMTM7ikiklRq+1Fvmmzcl1?=
 =?us-ascii?Q?4gEo1P7+wjAT/i6TqYh+hlhbvXCItbNn7BFnBBJ3Q2fX4U8Eo1fAEIN21+uq?=
 =?us-ascii?Q?42icmEJxunx1Zxdl+x71AfIcPtqpFzYvbwvX/JuYRcI5HVxQJBL+ubAg2lfx?=
 =?us-ascii?Q?h5ctVvQOXMzAgfKFyAcZO3tPUVMo2lKNXGhvWYkJjUM2Dh5dO2cKjDCT1diU?=
 =?us-ascii?Q?dUIWPQrrBqDUNpKVxXerSyjlaMb7GRDZkJaz1ACyVTmZfZtV7GJ2inJSBWDR?=
 =?us-ascii?Q?CxTHEq0FBLdK34YKt2ArXRnNWdjE16j6qlN2i5vLVObGJAEleoWTfHzUqTjd?=
 =?us-ascii?Q?m8hSRHGgrRhMhNHhcLquaTPEXcG028B3T+wEQY7oOfrdeMxXNfSsfXs6DlhB?=
 =?us-ascii?Q?eOhgICO1ngWd+O8hKlixgZ6sPqp5eVizkE5oOdDNuoaYjXc+sfWtzAKmFrol?=
 =?us-ascii?Q?5KdoNt8lanwaWuCEWlpunO3+g3Bg7qQy7xxcyAUKxN5yeXjj1SDoXtbBL5+j?=
 =?us-ascii?Q?hwpq113Kc328lS6ZW/gTJSjQzcYr63/PzoZnbZ+CgiXYmuwx0lg0Uhi5VfKj?=
 =?us-ascii?Q?FXPs0UB4ZwzQgHacQAtUTgjek7WbPg9djsCBSWL22tBeacHHhivE/oSdwOwH?=
 =?us-ascii?Q?fY8IHIuOCyOuwAKbV01IPTjhDrwfTsjhwyc/dRHem3Un5K3rpZKxgODJgTHc?=
 =?us-ascii?Q?fpQ2H/vIDBwRFBfYSemnAhTkRdQVBonoMNBFL12Jx60vSARyd/jiybz3U2yj?=
 =?us-ascii?Q?3MWF+ZRtYVge2wA2thR1BwP+pPF9S0v7EPu6VnB1zGmorM6HdrIUc8PtZHqv?=
 =?us-ascii?Q?1hoBse32zhEn45RXgzmHbTpHSL2ljwN+h6KH68QD2Rh8eXi7+n09z4qGHoBg?=
 =?us-ascii?Q?BjpArDv853lBcrYpaRayryGGYr7u0n35ZXVp1O+LTH4Hm2F2TpV/azJ5bOpX?=
 =?us-ascii?Q?SJaCipz9t4St+2lgVdmK6nufFfkxdqRBPYc56GL+niA3W4j6il3Nge8pkAro?=
 =?us-ascii?Q?W229+nnQfz91rOc1yxCTwCx8oqeJB/iyuDClwivFRtfNAhhc6bA4IyyRxYhO?=
 =?us-ascii?Q?o/RXUZEzL7r7tV4HiKxOuTwQzOZywmiYMesC8JEYIgWUDlMzB/Vj7B3TFPEr?=
 =?us-ascii?Q?Gww5bDaxO9YjgX6ryYWpf13jLpS7bMW4CY5ZYWTKUO+H9JHgH4A0Qd3RQB2K?=
 =?us-ascii?Q?StP0VxomXmUwNiUmojHRo0rL95uQJ8R7PtzwGpmHcxKSaX0lzSJpkIjVa+YD?=
 =?us-ascii?Q?9hC7yf6SJ93cYcf+XmuDKSeTlXYOu4zoohbtOWg+EttQvFBprsCXOM/QZcuo?=
 =?us-ascii?Q?hA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7e2df8-2c44-4688-0591-08dd09451a6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 09:24:15.6695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PeaPvjnQQvdhxxvbFvHxz6ip8m6vnL0jpP7rBzzo+7xhA9Sz3+pbjP8IxxPXQQ3BWwHyzLH5CmI3ybFtjdUL5avtf0Oapgkb0mpTATBDzvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13171

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 20 November 2024 09:14
> Subject: Re: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and co=
nnected power monitor
>=20
>=20
> > How do we test this interface in linux? So far we use windows app to mo=
nitor the current.
>=20
> BTW, the driver is in Linus' tree only as of today.

Thanks for letting me know.

Currently, over USB we display the current monitor values to see the sensor=
 is working.
Now, we could use sysfs instead to check.

Cheers,
Biju.

