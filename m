Return-Path: <linux-renesas-soc+bounces-8467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D27A0962E15
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 19:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 103671C20F05
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 17:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCD413D24E;
	Wed, 28 Aug 2024 17:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="G48Zp4ja"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97141768FC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 17:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724864531; cv=fail; b=WV7mUZk0ojc3aHsZUbufkyJPwpq7dbyYOoXXC2kUxI8SwjnbHKEI3rKzbgfOqz3BQFj/9/elOZWcjmeph/B5TgyOEz1g81GXrORZxh09nCa5stMjadRJ+2euAuGWR9yR0COPn7Yw7SB3rEp9nXhL+EOatiDA3EhBduCDiZel5tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724864531; c=relaxed/simple;
	bh=K+SP4prjW3/Fk/wzd/XNSti2Chi0w1vplWTQOy3Ol+E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VHI2viXJMhBumb95OhznTKPECI5GN2R/uM9HdUgEqy04I5VdR27C7/vjzKhMLaWbsL3Z+M/REV6a9FoXQfskT9mzA9og3yLidbEXMvYVON5rtoJ9q9wBCkNQFjpShNl3ztaq81RP6DOjJ6EcnIa/DRakFzOmLLRK6ZDzreQvjqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=G48Zp4ja; arc=fail smtp.client-ip=52.101.125.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akzWRSCIYZiTjY7XjYKUxDWPZ8oulKgNaYnmaweXl/ATmefA7sUB/LMsGM3P46dLUwkR3BzKfIsGKUFs7Q3wJnKbRNKaGEC2XcAFfrj25MeGmmP7plj8ap30+zd6RvBOwxOTpB2YRXKjhD1tT7xKoqG/tdaFRlvIJ/f5WpcYVrQN1dwPU/1zQ3qbxJp1EoQKhU3aBqByI6Rpk4thiBYqawP99GNoaVQC3CNb+x7wQkZAEXyi8XpxBj9wP4tcxx/5EDd1j/FUcuEmGfiHkaaxZa4TlMLQ+EIbGOZ/sEYHN/kQqKTH5affBBxWG+R7pK5vZb+6NeHQqeL2djKlKx5qyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7jXht+MuL//IwyQjI9nQzEoFL+k9JBcagmVndfYrcY=;
 b=PdMhQX8kDY4UJJ+jKkueaBdGEpACPuvIVd8hlxQagwMGlQdj1YCWhffqpRSmPmRsB0Bd2XidXEeG4c1vuyyIONVpdQFpw0zKlYU/gFnRvTRgGPvYMF6WdN34frL7XJDznsrI3grq48oBEbrCv/4RyzN7TBKBuBd+67BkDK/8b05sYZPtkNiuf+FQEQB2zZUBuCpfE51Dfj6ZDxBmNd7yV+Ty1Ti3QZF+BoRTg2mgMZKnDhsIXAI3WeKSMW/rbz63U4LYlVA1mAcV3r3MV738p3gz+U8a9EVZmtJwvO4l3EuyvlrTk28u4drR48R982rBMB2t3MVNkc9lw4nP45ysAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7jXht+MuL//IwyQjI9nQzEoFL+k9JBcagmVndfYrcY=;
 b=G48Zp4jaNcVmTTDh+/v8JhmweLpcdxzlDqfqlsFXXdNwZv3rF/eQO8GlNx7I8HTgmJNGOXa8fcLktMLEv76UFPoGfAkYkYEH2yk8ngPTrP9QMv4ZBNU//6avqqSY9k1SBrEy2V3Pmzt7h/CNsL0nDYFJtiykwzAS5XJQ22NVHn8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11095.jpnprd01.prod.outlook.com (2603:1096:400:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 17:02:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 17:02:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Walle <michael@walle.cc>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/3] memory: renesas-rpc-if: Use Hi-Z state as the default
 setting for IOVF pins
Thread-Topic: [PATCH 1/3] memory: renesas-rpc-if: Use Hi-Z state as the
 default setting for IOVF pins
Thread-Index: AQHazVmLhgheZUDUAkmjmnC+TVu0p7I9O9tA
Date: Wed, 28 Aug 2024 17:02:02 +0000
Message-ID:
 <TY3PR01MB11346E69DB7142AE991ED461F86952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240703145851.204306-1-biju.das.jz@bp.renesas.com>
 <20240703145851.204306-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240703145851.204306-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11095:EE_
x-ms-office365-filtering-correlation-id: 0e34b9c1-40bc-4c24-3c16-08dcc7832380
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ziiawcPNFch0BYWQGXoKlDnuchtmXIK2KL4gB83NKDvWrvcmXF5d84NN6qpg?=
 =?us-ascii?Q?bg+0Ch9rFUiVmXGVtzXE7hmKkcEvqaLw2AAHsWZafYD1A06MlxqSMDUUvZMy?=
 =?us-ascii?Q?p3mwoESNP7hni4LMi2cunxP+svkWgJgDbBQGKU4wHXYMmhtIQ0j/Q1bWa4eP?=
 =?us-ascii?Q?CBVKgKH4GuvIzXFXBqyhsoetZZetiVkwZ9UXPvvtgkdp9n2krh+KQJrtWh5d?=
 =?us-ascii?Q?FgAEbcitI70bNceuYj3YHYEi8fVSNum/6tpb/lVzPShtR+LTjG5W3hLCz9RU?=
 =?us-ascii?Q?Is1627pp7ylUzMFFU+gJuUfF//l3YoCT8JqPkGV7QlJePw65m2+tlh5zweMH?=
 =?us-ascii?Q?q0PorqWOnbfam4hMFS/AaPfAUog/UPQCYsymIBZ+SQVxIr2tOrYeUf0bSLH3?=
 =?us-ascii?Q?vyxNYgD5fiWPbMtxRpbgxg/CiphmTKoj1agi9kRfIHXWddhQdWPuGy3L0pyK?=
 =?us-ascii?Q?tJujAO0raOMuMQzXmAWcKeT7RJpRLsviAKX9qZvzU/vlltOXnOwTxgExiqoS?=
 =?us-ascii?Q?GRrli3tnQTrTYh+j5cY1FBH9yDVKCaxoTBWciaHaL4sr+wVF5N/6HNQ+Knml?=
 =?us-ascii?Q?WDj6bePJRi+j00JDEtkQ7v54iikXAmGytRuWn5FaTaMRkWfa4MGM+smTzkfz?=
 =?us-ascii?Q?U8B4H1mlmNOpJVpgXJew+QqN5FBkOu6rIcpYP5CIXjbU6JRkk8Shbm7frCKe?=
 =?us-ascii?Q?PkC3BrReTsScAJPrcpq6G0z+BoXjezUZNwqYKWuo/hWjJeMBer9EDRh+9rQm?=
 =?us-ascii?Q?ibyCyavTguYZjmjClnc6j5bLtIJrnOg1qPluiLUNbrG51lmYrscAAy1ZFhMb?=
 =?us-ascii?Q?tcWzQswyAfQx5G0oUdpzrP8aJw7Y4QnpH2hmLIPwW3YklMxGMJEKQ35+q0Up?=
 =?us-ascii?Q?CKfCQuQ9FLdmKsot446rQN7YRjSQP0MRrZNgkoIieXJHTY7985dqAUHwo0lO?=
 =?us-ascii?Q?hbMc6rMrOTvGmMIlbzN4eszMHCuYdEojKWhGyyHqqSTulfhIyw7LnystLSS0?=
 =?us-ascii?Q?XHnwu+GywZ6n9FkdZOJ3mfcD07bgqm8471h8dc7NG7JSkEDfeVVHk6Wd5GRp?=
 =?us-ascii?Q?b7yBy1CYlmaFikkO5Q1jAJ8MNuJOQYbWqGEXGM2r2do9kjkT5R6SLRwlIel2?=
 =?us-ascii?Q?1FeWayQKLe2YCZUXTq6JmWKVCyXj+W++WNQZDMZrCldiqxkE6MlnK68RwAgI?=
 =?us-ascii?Q?AZLLcanD+ou0tQg4pf+OBt1FLvJ+Foae8JiH0vPWNLDabHdKfHCOh06OfB81?=
 =?us-ascii?Q?mPK/7GdTWanH7I15JocMyn5nGLh3i80XcUOnTJSLyRIYOjt2NrEPF+v39qla?=
 =?us-ascii?Q?WU8rhZBgJ5QkRSJ2er7ImnyZdOBwH8AyVyrdZj0eYdAt5Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SPsyOc3xJke2xRkpP1c/WZ/wNOA746N/xF7/HJbOOyQ/mML/HzVy6vSekTqI?=
 =?us-ascii?Q?f/7xPGN2dMwFUbLTrMb8umQxE1dr/6aZpWXc2GKLKRMH1aoUrRIk6mTY+xEX?=
 =?us-ascii?Q?7sJ3s9U0mjGvp0GPHWMd4YdTEmpn23xXC5s7mznmOiFh3Q3eecFlSR6Aa/7n?=
 =?us-ascii?Q?lHIY51YXIxPLajNycr2mjbT5JgA7zpgyBcoIiaY73riMVr9PPnMUO4OJCenx?=
 =?us-ascii?Q?0pKfSZMiQB2i+mpDVPKSs8bRZDln0uATbhLx25lLELd82/mK3ucp4aphWQmY?=
 =?us-ascii?Q?TrVB/RWT2LlUpReG5eB26hwQNHT/bkbdZTN+8zsrx6h32hDoZvQhU8gksB8l?=
 =?us-ascii?Q?VRs7+ivWPUTvpx84qk0L4mobUz9ZXhQboSCkQuAJRUm+XCvfc3y13VZ+FY47?=
 =?us-ascii?Q?RLEPpJTRezh+vvkYmsiwuHMKEy8iNrlhX58JRkcCBhldLVpBFcoxPE63fwwX?=
 =?us-ascii?Q?ywvQLytR+5XkouFZdvhDSqXkCTYaP1MnJ6tWnr2hhnR+q2DGJbXGhsWE8VoL?=
 =?us-ascii?Q?+ScL9Tkv6ZlD1htTa32k6T2DFd/+JgN+OP/+laTbCrzDGvW+sQPKTYWuujB/?=
 =?us-ascii?Q?kXLuZcYMhosieXcZSiwB3U3IDcvL7RJwcvCCrO960AKMQ8wi23ofBVHHWhs1?=
 =?us-ascii?Q?gGEXgsuPC5NNM4T38lH0pWrpzxVjFVd4ZxXnfXaeX4b0JBQBjmBDEVbomRl8?=
 =?us-ascii?Q?loGbNui9B1biN+7ZRj/7gn6FzOaa7kLWVCQXXFp6eQiNKe4Ty6qLSqqbNqCy?=
 =?us-ascii?Q?WwpFDVQL59ZamD8+ogMU7UQ8cjAI1g5vbrLRpYGHyLbpXmZYlEQRyNkRAaYO?=
 =?us-ascii?Q?8KSmehm8RldRUW8cWc2V3MI+JLIiC74SNmzDmP7JJtmfCg3++IqVjLtGigUu?=
 =?us-ascii?Q?UemTobvCKlcWvgL8bwQCMGiHsJw6rJOU67Y/lcr/UDBp3onaSssfDaC3dGDq?=
 =?us-ascii?Q?540pESl0i9AcS3KOke+0yiZ+w5XjaM3J1XU0grTvljS95NK5Q/yjnZOTNu83?=
 =?us-ascii?Q?80M61NVAX3OKp39gJMylLJEdAGbgzyk57GoSoENBnT+E9bdkxoIiWMPW39aR?=
 =?us-ascii?Q?dII/CxT6HAz9MMX0md2cF9ilNhUws23bA2T54AyIPwA/YjnRkGHAiZibTj/Q?=
 =?us-ascii?Q?1RsQp5tr020/MwIqFV/m9zrAg+32WF74EOiukSsf5flILXilRsRlg9xczG4p?=
 =?us-ascii?Q?gia/R4bO3ezXHvOCwfL9FB2wZBXcfbrz3TiCJ900+dsjySvS004XH3nDG6+M?=
 =?us-ascii?Q?las96YSzNFBAEEaAGmyS3qAajmpTSqxpjv/uXmbVxc7hncqrKiEEv8/WjjU+?=
 =?us-ascii?Q?4afcuMAAi8kp54XVOSymUIuoWDdwGZYfwPUU9rZO+lQIIu/KKIobHEMEPFo8?=
 =?us-ascii?Q?hKcYKgORW2zlvmDXmn4uXWcdWULIO0PWZR6/yGxE8pzuIhv0zKl2M5GYtW7f?=
 =?us-ascii?Q?0PCOjMsaITivcNfh7hFmigqUDyoFz/DrYniED1pvrEb4d7ctwMlJngw7U84e?=
 =?us-ascii?Q?e7SsK50SJDaJoE076152pmSjkd9Z9vF6fgCK66CioLqCCCAqQEnCIrZzbWGD?=
 =?us-ascii?Q?45wKZonHBw+MZtfkD1Y5Pn/mAJsA2bjvAdGZmmZ9IhY9HCHQh1QngW15qQto?=
 =?us-ascii?Q?Qg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e34b9c1-40bc-4c24-3c16-08dcc7832380
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 17:02:02.9437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2yZ8iSnfC7eAO897xj4oH5r2e2KOQO1KoDdcZwze8I8L/AGjeHYv5iAFz00EooayxZsyL5hipUhpPcCZrUYJqVTRbXbqRDo8Bis/BXUPAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11095

Hi Krzysztof Kozlowski, Michael,

Gentle ping. Are you happy with this patch? or do you have different opinio=
n?

This patch is based on RFC discussion [1]

[1] RFC: https://lore.kernel.org/all/c9b0cffbb1566a7d38f2251ac7c8883a@walle=
.cc/

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Wednesday, July 3, 2024 3:59 PM
> To: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven <geert+rene=
sas@glider.be>; Michael Walle
> <michael@walle.cc>; Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.re=
nesas.com>; biju.das.au
> <biju.das.au@gmail.com>; linux-renesas-soc@vger.kernel.org
> Subject: [PATCH 1/3] memory: renesas-rpc-if: Use Hi-Z state as the defaul=
t setting for IOVF pins
>=20
> The RZ/{G2L,G2LC,V2L} SMARC EVK uses Micron MT25QU412A flash and RZ/G2UL =
SMARC EVK uses Renesas
> AT25QL128A flash. With current pin setting for IOVF pin, 4-bit flash writ=
e fails for AT25QL128A flash.
> Use Hi-Z state as the default for IOVF pin, so that spi controller driver=
 in linux will be independent
> of flash type.
>=20
> To support this, during board production, the bit 4 of the NV config regi=
ster must be cleared by the
> bootloader for Micron flash.
>=20
> Output from u-boot after clearing bit4 of NVCR register.
> =3D> renesas_micron_flash_nvcr
> SF: Detected mt25qu512a with page size 256 Bytes, erase size 64 KiB, tota=
l 64 MiB NVCR=3D0xef
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> RFC->v1:
>  * New patch.
> ---
>  drivers/memory/renesas-rpc-if.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc=
-if.c index
> 3167826b236a..7fbd36fa1a1b 100644
> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
> @@ -367,7 +367,7 @@ int rpcif_hw_init(struct device *dev, bool hyperflash=
)
>  		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
>  				   RPCIF_CMNCR_MOIIO(3) | RPCIF_CMNCR_IOFV(3) |
>  				   RPCIF_CMNCR_BSZ(3),
> -				   RPCIF_CMNCR_MOIIO(1) | RPCIF_CMNCR_IOFV(2) |
> +				   RPCIF_CMNCR_MOIIO(1) | RPCIF_CMNCR_IOFV(3) |
>  				   RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
>  	else
>  		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
> --
> 2.43.0


