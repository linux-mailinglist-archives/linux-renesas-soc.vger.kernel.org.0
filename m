Return-Path: <linux-renesas-soc+bounces-24910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807AC786CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BA62A35381E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 10:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FC634250F;
	Fri, 21 Nov 2025 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="G9/7FNYi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F22C3431F8;
	Fri, 21 Nov 2025 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719756; cv=fail; b=SBRkmJ2OeUVylcmOHTnvKZyEPyeyuRRFRQGeQGLc+9Ud+dTTHKA5lDUG6b9QEVdOVSucdhqAj9w0mO0lwZVmlpLx2SUMsA3ULbTYeFZQEe1mSjKskonyW2lfFueWlZ67XC+MrQhcDu2GUnuKRF85BfhJnVUSYzfkrpVGWLd5DFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719756; c=relaxed/simple;
	bh=4BMFiGYKwjZBPb3LNtKdYHZIaDKTCWE8XGO183XB9IY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HJBAf08tYlhz6s7xbYPH3UeQTN1dZ7/e5UmI7jfzzhZTtUgVrZBGYH1soKRIybXJubKKR4zaLEJ7iwHTP1D86ttGWsCGmbq2qANq0G4BBC83Roo1UBEl3240ryKXpaUURRBU/CaPpUg2J/NSebDUpRr3OmHmrNz4RgV5vb2xneI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=G9/7FNYi; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XS3zhgcctQoTCTnd8aADU8LqZ8AFcwWFpjQRnt5KVwKQgP2ponMs7HshBFXeW1y69r8w7P9wOiR1Q1D9i/veebskxI2/XBtDaHnWz2qgkFAVs2uqmn6udFP9QDZTPbU0nmYcbZ+uRBKsmcBHtDGX9Vcia2U8HmxHKsD9iTyD9bfOvpIOSw91gqt5GsTZLhBU+93QkQagUP1PRY/Mni60Q+W9qsCMDypz1f4qjLb5w8RRbVfO6ou3u+8W/yv3L8mGPGPKdw3UMbSpjsJF/M4yXPj86B+E3lW5wG78W9pUHr2+czCxQUHOhkNnHAWjtuiL7W4ltm8hWEhxgNFy1Hs3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GUWCwpkF4YXebiSkLE1BICfun1aFQ3kM8AsNWr+RqM=;
 b=DXDPsPOUgs2F0GNKE3ef226vK9nFbV4cyxFljbn1FLZQaDNH7+SduNf/KX05YaeJ9Fs8uPO20l9iwkPMhLjl6XzW7Rit7C0L0P4XHFrp7XxDWbTzD+9/wj3y7z/0KPZl8Rog41dumvMh6qGfbaJHXrkKhGFutYZaxWTz0bzJOPIXvbjZEd+nMxMVaDJ2PW9rr7+CsuEucpPw9R4MvERS11J3pdAai+tGc9CrCpNwMzs8kzndbleThB9SEa1jfuF+8sPPOsLM8BYZW9/F9hOhhMhTZ41UhIxSx0Qhvzah5xlEfwWuyw7iwNyN2ZCBdZfvlVQ7itoYkJOvImKTJ64HZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GUWCwpkF4YXebiSkLE1BICfun1aFQ3kM8AsNWr+RqM=;
 b=G9/7FNYiYS4cvSG6nfEos5H1zs6xis+mqgINrMD048xXJz3IkvLkqHMshuY+XhK9uGU2/rFhb1Ys1S1GAu8UeQX78ITOOVV/gCJtuwPnbE2hu33EmvJCP4hCNsrmqH061JHijQnmsNBTMz/e7WE5/Kj2yCByeOe4SXPC2K2e1ik=
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com (2603:1096:405:1a6::6)
 by TYYPR01MB6619.jpnprd01.prod.outlook.com (2603:1096:400:e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:09:07 +0000
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29]) by TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29%7]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 10:09:03 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Cosmin-Gabriel
 Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: rzt2h/rzn2h-evk: add note about SD1
 1.8V modes
Thread-Topic: [PATCH] arm64: dts: renesas: rzt2h/rzn2h-evk: add note about SD1
 1.8V modes
Thread-Index: AQHcQyX84xHzvpnWlk2sQjKBPkzPUbT9Ffjw
Date: Fri, 21 Nov 2025 10:09:02 +0000
Message-ID:
 <TYYPR01MB13955C3E9A7B48C7704EA3C8D85D5A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
References: <20251022073141.1989762-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251022073141.1989762-1-cosmin-gabriel.tanislav.xa@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13955:EE_|TYYPR01MB6619:EE_
x-ms-office365-filtering-correlation-id: c65111a4-41e3-465f-6bfd-08de28e5ff4d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xxDZ3pe3K2lQV7h3N9RLG5urN8mhOolxUnb1PNQAyT9EB10wXQjZjKnBEmKS?=
 =?us-ascii?Q?cs4QMaIbGjfvAmA4KNPiDgmhBQVwyu5x0It/sLQmB301Zb33GwuhFyvN3oG2?=
 =?us-ascii?Q?r2IXq/FSC05a8VF2Dn8L+Hzyc+kdfSai4ZaODY8/rZbJgf+0O7BxCMhSGp6k?=
 =?us-ascii?Q?9jxsudsY55JdPCOx+/VyCh6aIC8vThA7bUw6k1cEKoO0aT6RwCJYKRn8s0sD?=
 =?us-ascii?Q?ZPZNJ3AUvWJ7dBAu/StsonP048n2cPxdf9DN+Gp4kF+Flr2XDpj/0XfhmPeX?=
 =?us-ascii?Q?766dw3wQFsDJ6CsiTG2F3yD6gsvrDaa1C/DJruYbu2+VDpaEq9xRwaSpiZtV?=
 =?us-ascii?Q?Y+qU6tA/5hgGhGqcdH2rev9u2bz8fIzf26lixmaE/xHNvYbJ/0nUH0D1yChV?=
 =?us-ascii?Q?YuQUB4fO7l4AEXeQHpeD2dvKoJwYkDgWF70SGGI2LmpxowoBGGuttqJ4Q7Nj?=
 =?us-ascii?Q?JCNo9hBBjK9+bnn5P+Na296UAIPYpdJmd0M07/sqy3vrv95LNdCf/iGc1DFD?=
 =?us-ascii?Q?6kwGId08yIA+VrH2VMLjhug1uKfYpBGezO7abyBUhIIXIZtGBGY0iL1+k8TE?=
 =?us-ascii?Q?Os7Y4NPkdSMP2Vr8rKHfV1V40CBQSS1eFUqLvJdKLP0z87/lTe0UPrzm6rtS?=
 =?us-ascii?Q?q1CclzANiK5GULNnKp7y6BcPDUDCz9UmbsHlrbI/B6X6MbJCekewFUutzGns?=
 =?us-ascii?Q?0jlUbo6Kpqsf0bINtBoI3c2LZgwr+mQOv4ugh4Yq7RsOo5a4ZyNlREZ905OG?=
 =?us-ascii?Q?FsjTK56TxQPDVGDof9/Hiwbl/WKWQ+u0iIoaFpngkOIVwcnWEnHl/hfWutSQ?=
 =?us-ascii?Q?Ef4csRqT9hKfPHENUq8TWwpR6G1d+jTOyvOnBqLCGuWcoEtu1AhhmqK0SU8n?=
 =?us-ascii?Q?uBG3hDIO5S9gYHVFguQRKMllOIKUnyIMdsNkX7g+9ZEb6FjM9AjK2cSbpej9?=
 =?us-ascii?Q?MaWKoLDPuZjV1CAERgLpvUrPzJka4H0QjmA0pZPaU/Hijw48xs5CyG2HH93C?=
 =?us-ascii?Q?nwt/pKAkibmAmNBmwJ6KlSXUcpeQDrASCLs6xUaFYMMYP2VIxSrzifjcyXF2?=
 =?us-ascii?Q?WxqeamXS3TDlvbveZ/1FI2SoqL2vU1rztpViz0OmyUqK2R9rOcdguTSw8UKY?=
 =?us-ascii?Q?9Spr5nVVSGFazuaWbOd9kAGsik1o00dNIA33CPTrN+40DudRnSmJmkSkg2hc?=
 =?us-ascii?Q?AA0mikb3bgA5K8leroBhWZn8gpccflZDxILlWG9APAKr6BhKhaKZvWBLDLGS?=
 =?us-ascii?Q?OkbVifBjF9LftVexsGmZYNInz0661dyoibt9UK5us2PYB1rzQxTs+8XVGNIG?=
 =?us-ascii?Q?noWYljxWBOu0svImq6YqpfLg9Ds4IxuQ3JITuObk5RPbTuc8Powm4QI9efDo?=
 =?us-ascii?Q?SE4Hl4OXj7+HJTD08vtXk9YOMXAQwxw1GHALUd50IRiz0Z6qzzgzR6yPlkPz?=
 =?us-ascii?Q?gKDoRrflgwWkhetYHBtuaBESj+5iy1xLRcT/ysugD3DG59B7GDn/7xdcaN76?=
 =?us-ascii?Q?aaaayPXg8UcQjF5DSQjHTqosRLMewl4oyEkD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13955.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YDJnSaQx9qlKviSHO6QuZk29AYYlCnV/myh22/Ewmr4GP7dt/WilXoJ8riVp?=
 =?us-ascii?Q?oEakV++b9UzCVeUF2zHMGXY2LCVRPi7ESlt/VQYKccEf7RyUDYHeNNIimEYf?=
 =?us-ascii?Q?WKnooS+r4grTSKS4MDGklNBjj9d4LbGFLXoINfI/GBEbCYsfYaSqLwdvXOJr?=
 =?us-ascii?Q?izahzbeaOTS1rPe0wE+T7ImTh+yWQdp7XClDzbP1rf7s7PmRBoQed+D4OAbO?=
 =?us-ascii?Q?lqBmKz02F2MfHJDxmjNhnjbAP0sqLfxVCLfM9z0hE6Kg1/kMmUkZggPcmQ2Z?=
 =?us-ascii?Q?KL3HUVJnPbFKJs58er0Pae0BoStS2S70ICp8EBsOJEDXHXAJJX3a1bbIhjbg?=
 =?us-ascii?Q?1KKZ/zVWM1dlSzucXZAvhcNHYeYh7RtD4yjygmRd0rKxOgzhX9jYMaVeuZla?=
 =?us-ascii?Q?cSrwWaXGwlny5PAMS/NOoN4Fjkugo0BYakQ/ZUrOhP3WVq0ApVqCb4Ucwwjd?=
 =?us-ascii?Q?Hmomzwe/qYfzAhfcNMrRJeZo/2KNvJN0UfpO10P9nF5Rj/K4lmHo/ZLGlRIh?=
 =?us-ascii?Q?2EnZTJh6cF96gfHanrzdeYbZS8GGzFQoF0KjM+28qAmicqMa1KeVSi3MqDRJ?=
 =?us-ascii?Q?gc4b81Ace11SVDGkDeQhmcO8vdx9Yt8tjebgQtiXO4eQaKkOs06DvMRlj/u+?=
 =?us-ascii?Q?HOf3SpxfBn4nKnRD9JQ5qY19yX7BJaJu+yULF5pXm43vlr+ZbF93aJRaSX/T?=
 =?us-ascii?Q?tfSRTh3OmqiwaanwT69BLRX9+Z73m2C7n0nYUMkSdnnqlvglxs4gBMVFtw0F?=
 =?us-ascii?Q?vHrAVSRRR7ssMDghZfpnZ42pGpYkfeflAkgRRPcas2vFSrMRAulyfHoURTLT?=
 =?us-ascii?Q?y7mJY1FHC2k1Kab3R17x16xg4UPUyAEpd1dUxZHsqu16jUpNlTkERi6OsBpZ?=
 =?us-ascii?Q?VFDth6QOvtFGBV0TlGphGsn3SMf7l6ph1nG+3hM8BfOvKpmBIe4J2X9XQ4xO?=
 =?us-ascii?Q?quzQbeXagf40SB5bQ9dE14Urc/RvWAAtKcqvjEZdBOCGb4GS6mSNxgMpm5iC?=
 =?us-ascii?Q?TIjsCKIQUDWrk2hkrTfw1YrIgy3VIqEaYDAglAku8FH/wb3MwTqFTVhdmMyg?=
 =?us-ascii?Q?fEvVLVkpqPWMKd1VppBXe1eXXLp1tLoF4mdV95YYk1hbFo1gmWaQxhvdL298?=
 =?us-ascii?Q?GF2yls5Cd13A3L+vGzwG1ayrdwq4y73W52hdOnWs1k0XRAA7x7goVDnybIFi?=
 =?us-ascii?Q?M6jcmM1M5EW6L17MUsZSazES1I1YqE+UqxOx5XbvGghhMr7wLyGdCy7CmIA8?=
 =?us-ascii?Q?KkjhzwXtyjrEiScGT+h3Zm/vF8qKgYsSgpk+owmwwXKooNV0S46hdQ/I/o/L?=
 =?us-ascii?Q?ipBugD8MJeC+Bxhy4T/0eeLUWtYDEknhMKiNqGlgRL57Sk5HCuRVo5xOoMOZ?=
 =?us-ascii?Q?P2yWVRvzYWP1+VjW1QlmfjQaA4gABcQb+rN0VkHq9MyS1FD21Qd5cO4faRZl?=
 =?us-ascii?Q?a9WCeeoxS87LO5OMRbcLxiq48EcgQBNfEKMeonB4QYpEghDXpFmsEPFNA2TR?=
 =?us-ascii?Q?hQaQvFOPTB38BdoaqggZ3lqA64zMe3PwOdj3eckC4sLaBlfspl7VwBl8nZOm?=
 =?us-ascii?Q?TipM2imGT2LXnAxCFkXIUkmd6wmIsqa5S6QNtSsaLxxDZuh2ssT3eZeNh5O4?=
 =?us-ascii?Q?tmqCKTnsqUJ2OOyBxEe50UQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13955.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65111a4-41e3-465f-6bfd-08de28e5ff4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 10:09:02.8884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7aiwfDTBjgNEHrMWl8pQPgai13Y5qOpxBROhA1w/XkPOEkXq53ZQ7JBS/W9Ym/m1Q158HdR/ss9Z7oDGXt5Wht0B4B1TI8A6IymKMAztCUm+/8PZoaVR96psBY54bkJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6619

Hello Geert, could you please review / pick this patch up too?

> -----Original Message-----
> From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Sent: Wednesday, October 22, 2025 10:32 AM
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.dam=
m@gmail.com>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley=
 <conor+dt@kernel.org>; linux-
> renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vge=
r.kernel.org; Cosmin-Gabriel
> Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Subject: [PATCH] arm64: dts: renesas: rzt2h/rzn2h-evk: add note about SD1=
 1.8V modes
>=20
> 1.8V operation of SD1 requires the jumper to be placed on the correct
> pins of a connector on these Evaluation Kits. 1.8V is needed to achieve
> the higher rated speeds like SDR104. Add a note about it to make sure no
> one else spends too much time figuring this out.
>=20
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts | 3 +++
>  arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts | 3 +++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> index e94b84393bd9..7269bca8c8cc 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -26,6 +26,9 @@
>   * P17_4 =3D SD1_CD; SW2[3] =3D ON
>   * P08_5 =3D SD1_PWEN; SW2[3] =3D ON
>   * P08_6 =3D SD1_IOVS; SW2[3] =3D ON; SW5[3] =3D OFF; SW5[4] =3D ON
> + * To enable proper operation in 1.8V modes, CN77 must have pins 2 and 3
> + * connected by the jumper. This connects SD1 power-supply control IC ou=
tput
> + * back to VCC1833_7.
>   */
>  #define SD1_MICRO_SD	1
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> index d27da157c6d6..c87cb6510edc 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> @@ -30,6 +30,9 @@
>  /*
>   * P17_4 =3D SD1_CD; DSW5[3] =3D ON; DSW19[1] =3D OFF; DSW19[2] =3D ON
>   * P08_6 =3D SD1_IOVS; DSW5[3] =3D ON
> + * To enable proper operation in 1.8V modes, JP21 must have pins 2 and 3
> + * connected by the jumper. This connects SD1 power-supply control IC ou=
tput
> + * back to VCC1833_7.
>   */
>  #define SD1_MICRO_SD	1
>=20
> --
> 2.51.1.dirty


