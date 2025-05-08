Return-Path: <linux-renesas-soc+bounces-16824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7BAAB02F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 20:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99FA71C04558
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 18:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A65286D68;
	Thu,  8 May 2025 18:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="V2DqD4r0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94C2286D50;
	Thu,  8 May 2025 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729446; cv=fail; b=SnXeZ/ryaRY5WBiG9vLaoEYttbjkJunG9lhSThP6bH5SawOFzDyiLjCj1Ox5g04muNAhRsSaakYdb5HInIUC51PnwaPb21gFTIUhwdydhbu4AYk/fpgpdw9HBstzttYZrKronRPy21AxM0qBQw5h9bTayr4G6Y7jq0Oau8eyhbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729446; c=relaxed/simple;
	bh=Kr+ONos0cETirGxvpETJtVXnFQBSmubmgkKbAo9JoiU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kse6cPmJIE/enTuShe9LBbEq+/exZ85jYTsZ2oNY3k0ZQfZEc3aDyvRQMnpyGvDp8A36ilGdO0L4vmaW1EHj/1lwHvQ9u4bumld+ojdUFd0KpmUB3KDMdbCSyCYVu7PQrlRUO0r0TzV9mjmq9TuWHQVhhplLv8phw9DLpOhXMiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=V2DqD4r0; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8NjASYFiz0jxFJ/TfIv3J3DT/H/facrwf9VDRw4gq7e00y6Sc5VLCQs4Yd/OLYSQCQxgKBX8/nva01lyaJ9LEDeMXGTKbofOD3+73NiQ3W8f13PxVZ0s6lz3xHsECIhuM9U6CYSXB2YwgML6cPJToBN++bYh6LL4shX2oux4UwtMsDHTPoXsgqcQNcEDSnAgyxOEcmUg3tTAYW989KPIglyjMDiWggEw4xDT3qugcpG9dC3ktbGBscj3PMC84/rOkhcYjLCgN/iggC1KkpGLfdkF3aDCXqOVNKp8zPv2rreUhQOvTjOXmExvYaCV5+KmbndtxQgnP6UXcKN9bhfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcBR1bleaHn+Avh4AK9qPFGxiTuxZ840uSEyYNwMvFE=;
 b=c3P48+1FdrDzNAVeQZ9nbcBD95cya3oUKQD2+TramypuP/HRv36AI35f+p8E7dtIR6z5EEV6Pq6BSu5hJLofXmbx/EYptn7FV/9UtYwvceeoj6osfcNQr0WXb+i5U44NyhzY7BBkmfOcl0ekEvoEUOBBAOkGwtB7+EXuVlYRyUVyZXk8smcRqfa/Vn3bDJZPglQtJvhJXE98kRgL2SDKKN7vUy2/PvYkujftqTHaVwoBhghn5kqy/p+9QvjRfh8D95XHF2G5QYrH21vOBBkwoTD3M6gcuYo+lpMgadBqJl+Xi/eNUPx9O1Spo3vxNOv4w6lvw21LfYsF+04BQN0DpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcBR1bleaHn+Avh4AK9qPFGxiTuxZ840uSEyYNwMvFE=;
 b=V2DqD4r0z6IwcZXjBq4Fc1QcBS+Z+IVMSqE+1RSoY+Oip7rXkviFVEK/vuwsZKHLPzkGpKIdYUzUepb9nDlAeT837MzAI3BqiHJN3r66rDFdf9zRNaCbxQdMqfaWiyFSMD37iauJMhkvmoDR04/EFedZUwJUsqDJAcq+bnVLHus=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB11327.jpnprd01.prod.outlook.com (2603:1096:400:3f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 18:37:18 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 18:37:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 0/2] Enable serial NOR flash on RZ/G3E SMARC EVK
Thread-Topic: [PATCH 0/2] Enable serial NOR flash on RZ/G3E SMARC EVK
Thread-Index: AQHbwEdihybpQC6/aE6vOCwB+lzHlLPJD2sQ
Date: Thu, 8 May 2025 18:37:18 +0000
Message-ID:
 <TYCPR01MB11332F1B085511F64E299AAF8868BA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250508183109.137721-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250508183109.137721-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB11327:EE_
x-ms-office365-filtering-correlation-id: a31ad8da-b271-456c-6091-08dd8e5f5c85
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?drv3SjyPu9Cs4iDF3p48seR1vybvSmiXPP7e0TuIiprihfiyFID0ZtPAcrmi?=
 =?us-ascii?Q?2DDJHBgoThjASBmyzw4ntQHSSP4SMO6OE8b01RC3R9Xo7JTg2VfG7XqetpE1?=
 =?us-ascii?Q?9jFZW/5SeFEmNk+cyvK5R4/JL0I4Q/I0UPin6amU2xEaASDq/pyIyeVzOXqu?=
 =?us-ascii?Q?uE0PsdSZp+Z5t6ppKP9PjHcyuGj0teGIxYv4EaZfpDJrbBITjskEb9V6af3K?=
 =?us-ascii?Q?cPO1g412zbQMemOZPPuJkdyAxW5lqut1/1w2IKF+hwJAQp9uBWr8w9EBth/5?=
 =?us-ascii?Q?kfwn5yl0/YNVbZOS17gZjx+A9riFarpUIZx/2HW7UqYHCZq6pg44AgOUiGz7?=
 =?us-ascii?Q?q+XJWM/qsPB7kxmoIezuAamtWsRB5nUP+4Z7XsaXykw351jlmXzRVgEbUh7E?=
 =?us-ascii?Q?E4FVVyXSndbt3l8FXXDq195Nj3DkWKYXy80/Rj9ovbZTBlDyP4D6HPpmZTeN?=
 =?us-ascii?Q?e/mvLUU+RKtkjuqbwqOOhnfh928BNIGtrRAnlGl3PUTmm65F7ClYB0W5lFyG?=
 =?us-ascii?Q?Wv3X+cO7yNmWC8vgKHQdagN2Vy0EWhLwGIY775t4iD4CDJtbttfC0rZ40cm9?=
 =?us-ascii?Q?YWE73kVtjSEkdWOSu0W/GvVmILjpF+FwZsWOu7E7+bEbHr4+Ms5NJep3Wy4k?=
 =?us-ascii?Q?cqP709lCnrN6/kd0pB+y57zdXyJBAuepObvvGFdKtNiPF5Pq2CAveooABGj1?=
 =?us-ascii?Q?2Igu/j3mqZIkLFkZzXV9W7V6CnqHWVC8qgYJDdUEdnIj6LRmlsJBMl3bfumk?=
 =?us-ascii?Q?wQNpWib3xaNS1YX6JCbHd33KuEwpB81H7qqLNeaO6Gom+3jJG77GAqx1/8m0?=
 =?us-ascii?Q?VfR2rkgY4ye24u5igcAfZKgkgXKlG8AR5PgUtqyr8soSsKbfTU6peu3Ik/x/?=
 =?us-ascii?Q?wopIlNHs/Abzr/sCflGzJY5TF2NbDIxpbrDFD6i8yrmFuvLViQV//+lnmv1b?=
 =?us-ascii?Q?bXUqLEI7e9obpTYt8AZadW1dGczubunlyojdxjNBfFIdbcP/ufYGeaUHHqHl?=
 =?us-ascii?Q?lvTEOlUE5A9dEijHhpsoNhxu9Ej91FpiqwmS7H0cmHDRgPaApgA6bpmNWPQO?=
 =?us-ascii?Q?kyS65pjQCLHfUHOugLuhRT4Zj4SHkEQoCtSxd4pwBa6hSJFCP2co8lViQxHH?=
 =?us-ascii?Q?StfkvxthPG5Tj6l+SVRi2Drg28wNCTdVfAK/Ik3NhiCZBftdCn/ZiIAFFjHi?=
 =?us-ascii?Q?OdFlsUCAxXQKb6MwjrACnACPpiU2b7QOsET2XoTcDhLnNsx/VoJzp73ljfB5?=
 =?us-ascii?Q?fg/ST1StXUTlulTdyAzlRPkcwLtyn5YXpV7bQBOwbBn9Wg7Ugk4umKlw+vul?=
 =?us-ascii?Q?BXy6O5jYOt82gR+GBoubJ1JskemvIPcXH1Yfimr9QBdUAJ6Upa5GI2mtR/qn?=
 =?us-ascii?Q?PDnq7EdFUhjR1vzl70jyEd/YAaPSWimWbcS+UJmn0ZjDGXO7n1RoCl41dC8b?=
 =?us-ascii?Q?dvdPU3+NZ9OkvlzXL89LdruLN1b+PVnGzM3Mvs58L54TQAEtl+m9aNXuCTWn?=
 =?us-ascii?Q?LD7rALe6zOny524=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?37p5Gj9iYI/HLFx87ML0TsShBvyJiCUOyOFQ8gTPoK1H1dGdjfARFSTk4HPx?=
 =?us-ascii?Q?i+Qa8cEiP/cKdDvMU90aP1ePhmlB4MZAt4jxJjf223Ht6BvnajQwPrWLi9W1?=
 =?us-ascii?Q?YSOzGRgsFycSPRcQdooHbsrmBNFPu08OIFlysETMliuAyUlpbNs3oXJMyyjC?=
 =?us-ascii?Q?lgz6BvpSAR7HVuVmdVLmvmhAlExF18uwXh7hlB3fIBqIzVivaNhdaUurMKQ3?=
 =?us-ascii?Q?U2nhnhDi1RdsA+wIQYAs/rpL4M4zW5YhMcit8BmMJn8Y/8PRbC+CdOWF0eKB?=
 =?us-ascii?Q?B40EOWs+PTsQ3MGi57PFUtoqwdjKwniaWKaWyuFlw6LNpxSQTlOPKeHGFbpx?=
 =?us-ascii?Q?MMbnOFmPyIpGAiCM2hw2APNHK7fcVf4XmUhbOlsq7cFsv8mn5cXaU4frGNZS?=
 =?us-ascii?Q?10KgEeCyD6RNfJQtslTL7IVSfmQQQaFTRYNWNh81EIHYySLd6Y1iqBzfmZ65?=
 =?us-ascii?Q?hzxXTL9AE0DCN223PO8S8ML6TsbKhU2HXVGqDSEWNI5cfYRA9y7Dyv6PZ2ZK?=
 =?us-ascii?Q?G88T5WRpDV75Ky7G5zcS4W98zlQSNrhr1f9ZxJdsk2RGcl31QHMUkWEreTv/?=
 =?us-ascii?Q?BgFewPcMYMUCzCVYhWDRhs39HqRhEiFh6B3H5Cm36BuZ4tHk0r9GtQ6NRla7?=
 =?us-ascii?Q?8YgsK/I7F6SJumJ+49BD5K9HKdRzfwciHbGdU/4/FK1TWFffupuKGiCa5Syo?=
 =?us-ascii?Q?Nr1Vh4GyFYCYPVcp88ahyCegF+C2zc9Pn0VgoKF1zf6c4gTYsBZrrcl7ncLo?=
 =?us-ascii?Q?tsLwKHlEpMhdTZvI9h78KQYrI0V/jy0vbTSc+roABEEc63K4y4aVv/lEYmzj?=
 =?us-ascii?Q?dcgCA9cl76YFkMN9M6TzNZf/TKxS27mODaIUhb2DignFpovYthSw5YkdErVV?=
 =?us-ascii?Q?7obJEHPU2OHCxoYO2j3mb8v8sf5iWmOmZNsmF0uphQxB/ZUenScG19VTPnlE?=
 =?us-ascii?Q?31qGno6+PEYxFGnAglZT7Oo2iIgWow7URsnp2DYC/JGIbposWoTKZBBjXGLx?=
 =?us-ascii?Q?bqqeuA94eiokOAD1FFFg8m6itbeE2wpt18vogDFanPu5Ejw0tjN2PjY5lY85?=
 =?us-ascii?Q?q/op6jnuC0WQDTnWxiNW2y7q454tPM8CbdGR0c1u1uf7ft1YvM0BPMZ7Mbpe?=
 =?us-ascii?Q?xjNjzkYDt8mmbFfNJaxCEX9Fdse1Wnn+a6wY0qD0Gwk5W4iZwUUPbwKgXf55?=
 =?us-ascii?Q?BqV40//Gr4zUDWCSOD63eUACmWLIQMwmS4dw+8jhvan6uCZZg6GdRPdRWQMG?=
 =?us-ascii?Q?dkVCz7PIyRtJY6lHcsP1IGPnAmflC/N96HyiRHlLWtR/khUuHnvdceASUI0g?=
 =?us-ascii?Q?IPR0RkXXvYkNfvRgLNm70Ara9QIcICUTQgSYrX66bhWJnudGs3aheKGkjCBG?=
 =?us-ascii?Q?V4DI2KfLsyxeYb/uIjrGObkKVmRlHKr6lgOuaQHs2O+jsbKIxUHjIlQi3VLw?=
 =?us-ascii?Q?9qXBKPsHhmXytAZsgs9y1J0Zx+36VEMQZR36i44cPXF83sI9hSlEjgA9/4SF?=
 =?us-ascii?Q?gIqQ4tnMhgCGULGq1X2LaB4DS+Vymdycv0YwW59r8hOOvj8MzHDc6w5Y2CmT?=
 =?us-ascii?Q?tW+lTUJF4um+EOmkLq+36zRgufnOxZbPcyxdIP6SRzNrvT42diS89yGdN0eS?=
 =?us-ascii?Q?BA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a31ad8da-b271-456c-6091-08dd8e5f5c85
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 18:37:18.1647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ip9suwd6roqh+eK1ExJiUwQTHvy9KsFF5PPepXJpMZqZnnI7Q3SqWHWABqOWSDUfjRWtVBakFqfTWNJg9oZ2wrxXOpkOuatOjaGBFNxUJ0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11327

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 08 May 2025 19:31
> Subject: [PATCH 0/2] Enable serial NOR flash on RZ/G3E SMARC EVK
>=20
> This patch series aims to enable serial NOR flash on RZ/G3E SMARC EVK.
>=20
> We can flash bootloaders in Linux by executing the below commands:
> flash_erase /dev/mtd0  0 0
> flash_erase /dev/mtd1  0 0
> mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE} mtd_debug write=
 /dev/mtd1 0 ${FIP_FILE_SIZE}
> ${FIP_IMAGE}

This patch has functional dependency on [1]

[1] https://lore.kernel.org/all/20250424090000.136804-8-biju.das.jz@bp.rene=
sas.com/

Cheers,
Biju

>=20
> Biju Das (2):
>   arm64: dts: renesas: r9a09g047: Add XSPI node
>   arm64: dts: renesas: rzg3e-smarc-som: Enable serial nor flash
>=20
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 21 +++++++++
>  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 46 +++++++++++++++++++
>  2 files changed, 67 insertions(+)
>=20
> --
> 2.43.0


