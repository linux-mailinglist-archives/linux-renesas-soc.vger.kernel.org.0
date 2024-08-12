Return-Path: <linux-renesas-soc+bounces-7809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81694ECF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 14:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F8411C20C8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 12:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71FB17A59F;
	Mon, 12 Aug 2024 12:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ITgs+g3x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7EB1E488;
	Mon, 12 Aug 2024 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465555; cv=fail; b=JvNi9rHh+pPPU7LzPL2IbWFCyjsi9nIby0tuZTt5RMKUCuzHxpCjU+an96K4evcqft+zGCvq9ZlhLj2VP+avk0tAqCudtL5UE8O1aQSKtjQfP2EOeHcpoHE0nVGKXXszFcv7P4To/TboleB8lQA5L8KOm5hU03F+I6nC7ZxQpWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465555; c=relaxed/simple;
	bh=vlDO+nUZkcN3AALxsPTmLq8n3NjuBdL6AwBfaQDkUbc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oTEDJFE5j94c915FdMOHpHr4sV3q+bhbwITC2DXwidV0+Hc6/fSfcg5Uif9i6z3wbSZ9sk0dQ63ys8gwOgJL4ZgKeSSt6EiJtsc21+Lw2Alax+Vr9JzitnwqUw/Y5hf5yxRP8RY4iQrqoH4T8AUuJLIoW1uNw4iLNZR3lQl34D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ITgs+g3x; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lb21L4MI7i8MpFrcFG747F/dSFee3b9u+2qZlChIocpmtC2gIDeV5b8DllBlTIBBeydGdHXYjor3bxMGvnCzJMBW/QZnkYjza9zv9S2lsZUoAJ/ILJU4VVDT4Ox4d4+dOeY83+RG4/5XC99UuZhKs5BUt+1q+ZIEMK1u/HOA6hnl7Vy/avCcri28Uc2buQ/VWHPoipSEQiobf5U5OLwt7AjwiyTUEJrm8MlG8vUM0zcdKkPVcFN8q7kA60lTAOAh9Dj+Jt+ErQzWtI8n2g2zr0vbdVoYmo4iIW2Sy3tezEwkYpldWH05SYa1qQiUnXOvzlpwB4OO/IkaS1xVm4PhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yS1ZCuJNbCBjZudmChk2C1UGAS3ZmwV1wb2OSiodX0w=;
 b=BBY+hZlc641k8QRuMtdbAjaCBVkG0Ve87x/e1QJMeUjVxSgPBGeHaLlIEez3OopufCawclL6tkfbbb/uGuGkJxtTIXUSEBeN5bWIllwbTgoRxFcLQ/gi0208a4SNqLM0iPArd1CljhYlvCNt6zOPAjSJMyemMD1QfXmqOCnGFwtzqhll6372vfX7jBRHDtu8gd+gkMqESMwoEEQATk1K1OqHfpPJK0Pn10J3wTpsNPDaMFRrbhB/qSYF22oibrGr3XqI90VW4LEO/KKL+riQPIEf8gU908UpmjpheVaLYO24/a1HZqLX7PYMvgEcOqPiJjVNTmH885XguM2CZ45h4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS1ZCuJNbCBjZudmChk2C1UGAS3ZmwV1wb2OSiodX0w=;
 b=ITgs+g3xeKNgPoVBPmT5PG8hOg5jTTbbH4ezcvl8NKBZDfbQ+yWBhYx/lNiyjWhNiER6SKvWTbyN6OZW6ecGA883Fn4kEUOUSo4toCYbgwPuqlZKYkWGpB0r2CO+9vwdz6eVW7yqZOQ5yJBDrdygOEIX+R9Y7h1r/ZDCHd+Debs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB12152.jpnprd01.prod.outlook.com (2603:1096:604:2da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Mon, 12 Aug
 2024 12:25:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 12:25:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3
 nodes
Thread-Topic: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3
 nodes
Thread-Index: AQHa7DAWZaR6TcoD6kuFkcWuXXMxB7IjjJ6g
Date: Mon, 12 Aug 2024 12:25:48 +0000
Message-ID:
 <TY3PR01MB11346E95ED1171818488EFEFA86852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240811204955.270231-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB12152:EE_
x-ms-office365-filtering-correlation-id: fa552607-926d-46b9-e332-08dcbac9e5fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ooKjqzbbCmSsM8KY+5V/KWCBE4TlqiV/JI6mdg7cHJw0bkCBLoPyZDVs8bQD?=
 =?us-ascii?Q?U6JaAtfYcam986jU2xchyyW1kcctIluf8J2+8sEluJxplZT0RDfkl9wYmP4Z?=
 =?us-ascii?Q?Im2CYB8fUKgAO9qnK1vD2i1aanfwq1bMrvYP7Ip5tpNJBTt24VsuH1lBGfjk?=
 =?us-ascii?Q?+nY8YjRTinA9babirZrLGQZa/8jXjlCoWbMdf+hDF6wlUTZgNNwGTvacStDQ?=
 =?us-ascii?Q?cRwTmgQsCtQYfo0Es5QN+nhv3cumzFCbnp4+WiG63rrQm91W7+jwfgtADTjp?=
 =?us-ascii?Q?spunk6UTw3a+uqisB+GLofqpsjEhTCDsK+PlN0TkHZ9LeMS56bnoHXX9splD?=
 =?us-ascii?Q?h2I719/ARTYC39Yux0kbJ5HfZoEukHxBILnIEJzIOpIXD2liKkiBsk+ERXwH?=
 =?us-ascii?Q?rljMZWnn3pRPxK8UIEvEqswjtXmSxv/rKgkM4xpbfCNjZf6ReJi96Z4N1trf?=
 =?us-ascii?Q?zkd3ajkh0LPwVsEu3ZEv0D4N1RyuHtUC8jDuBL/fj48O/ucUz+Go7lMyyhKv?=
 =?us-ascii?Q?0lyePzzX7pey6e7qWKzyd2MrC9c5iLwKW2JrQ8JMreA30814aS/eHxIuyX7x?=
 =?us-ascii?Q?QogfGNfSeOKGwpcYytRV8UdOiiiLJikwTmEdW2in1SDEWYVLAWiHudD/h1fK?=
 =?us-ascii?Q?sx39qEYVXV1rqrhy/bNidK5chYaWpbZw/lcNBsgimnrBCEzQlG3tjhEXHbRM?=
 =?us-ascii?Q?cE3POhNrnUtbPMNqX0dhQFsCh1OWQYdI0JPGCKWrGYnZePR4EDfcEK9ek40C?=
 =?us-ascii?Q?ueID61/UvSa/wKu81SyZzO0+q6z2Ae/B57eAQ8XzgwY+Z60ZRMXfyEoqi1Bx?=
 =?us-ascii?Q?e7enc8PVOE1OsHBnt31CAiEYYwcnB9OCP96mVPqSkIubPR1Qkg7PYnaW9Ilx?=
 =?us-ascii?Q?4kzfz0Ru6pXCU1r+fKQZ20s+n+mejhgpS+TZX/ZOF91zU0OaqIHuNCHIU+ze?=
 =?us-ascii?Q?HiQMlVdXysg6HBGW/wy+Nir1i9dmTQKxcgm3UwQ4qPftsZ87wbScwF9HapQ4?=
 =?us-ascii?Q?Ir1wWqSd0AEeDZnVMPGs9JigDqxxasZ1HyNztEHqr9bs7ETk3hu3aInlrHf3?=
 =?us-ascii?Q?PmnS+3cb71rKccpYCgTDj9tJkI+j2hCWOVm9U6cUzvctn0E9j0ClZa2OJcIP?=
 =?us-ascii?Q?o5V8JvnJyvwmtdthUAl9P74lH7xQB8V3mPj9tW8raWtzoWUYCW127xqU2nID?=
 =?us-ascii?Q?9/ClvT5dAKsjzaKTEXKOHEpxro+sV++3QxJAXkVmTQ+LL/tcCAJ0XYAg/dfy?=
 =?us-ascii?Q?6pWHdQeK652XbH8zaWi6JjBH6GKWTJE7IF7zqF2CAKAzGwHdEd/j7y44qo/N?=
 =?us-ascii?Q?tvh3kX8Kd9xq3YaUuAg9dKsjWpyZeRrNTy+QI4OaNkYrwvZ7rXrsP068UryE?=
 =?us-ascii?Q?zPH9o6xrGgR6a1RtkKgGJPatIm19NkgqCeVPVWLJiCTjq7p4lQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QR7ZpZhIosKK1FCiOTIDd7VRhOhZ4vdgxH+cXExLiWwX9LCE9sGvC01Ktaek?=
 =?us-ascii?Q?DIfExzE/6okCBQl+McH0Asu1/wOmFXY2a/3asgeGI3P+72d8a+NLrcvrEFdC?=
 =?us-ascii?Q?VhQAUkZ68LIcqaOcz5egzzyHDpEHW5/ajbxBwRUiRmIevw8oZHz0MDZMGBJD?=
 =?us-ascii?Q?PsSWWFGq+dX+oFPrmNC92aU/r7CoXdE5r9Ys7Iovb0wlt33bNhKiwYE4ldtj?=
 =?us-ascii?Q?W3eHRim+3SSNPQhZzAwiT8VccTlDEEgYDr20ybikBvoHlu4MANXAyiSIbJw4?=
 =?us-ascii?Q?0ixdd7KIbvGDN6Qpdq+T8FFRGKyav8ZT3b5l/jZVC9dLMvDRIzee1XKFicQK?=
 =?us-ascii?Q?YVduDl/Vze42R3nbFKDf9okNxE2QtJaaV1Vlr4Zt0Im+AotcvXeBmjVGY9HN?=
 =?us-ascii?Q?nAPTx9HNiUk6gXX/+aExShfEPJXkTRHOBIraXp5EeADuo4H53b5SuQrRfYKP?=
 =?us-ascii?Q?rAwrpGu5npD9/HjIryag8R6BE2JoHfDvJmO2GxQ4Wp/9JzeMK2do6l3IFkCi?=
 =?us-ascii?Q?Lbl3tDrmZjjl3HnrnyIea/Q52Upxu0FK6h24VdwU05M5+fOyqnClfF9hxf5R?=
 =?us-ascii?Q?y3dKzhkJCyxVYBhqZhYhfdKc0tjzSHJ1ArZAXFJGxZREvvutjXA5cglYl/hb?=
 =?us-ascii?Q?9ETMps2TmuPVoWuw2Rs9O9MS1sdJrzkMfAoBU86nhgNDbobXA9tkypEq2DI/?=
 =?us-ascii?Q?lOsHFwTlDz7y79Fv6EkjbjofNeX6Nc6vhIaLlJjwoeH9/w88gLny7gvfsnDM?=
 =?us-ascii?Q?NgqFb8jby3Iq5HWYEeT/95KyTdc6hO9Z7I/AXjFGWzKpjM6U6MjPchNlhesp?=
 =?us-ascii?Q?cSaewQ+AA4ZxEpHvX13zz/RwNEFcJCK6lqFBXgLu3RymVq4iqiCBgr0M8K8s?=
 =?us-ascii?Q?Obx5h6DebIKj06LWjJ99SZj/UwNUuqr4qz85BvH9vqB+rYWjzrYqAQcJ9UXn?=
 =?us-ascii?Q?oTjliUKjReWlj1orRYuf1KgJQIAjoJB7yTjvO9n2EBdob1NynPCDtNsdf8R1?=
 =?us-ascii?Q?eGDbjXRJ3acgi06ZKizdR/wVkB2mU2AJxe4NK5aA9jgPoEXoLLp686NGcYsa?=
 =?us-ascii?Q?6RdKD0Ls4cXaeXZyVFkKRHyhvKvYX4lum4bRtHoq/58s5WvMAWHByn2EeEYI?=
 =?us-ascii?Q?vtW4cPVW1ev016jlXaRetqd8loXZPBb9HEmtPqU8s/XRPswuRpn1+gy8D91s?=
 =?us-ascii?Q?rBg+JQVCkKUJ2l3bJr3vG2F3V3iuKOrhIQHP9eQH86yAAS6gPZAMnVNO4Ndb?=
 =?us-ascii?Q?gWtnPQqF8Q2V3N6uIaSJtiHen0+kbR4XlbiPFNR2x9fJHI5kulFdqIYzj8Jx?=
 =?us-ascii?Q?lZweymNivNllP3OfABTWy3xhVR7LT4/gJmywHIb32TxJwfMCMWgNJXD6YZjm?=
 =?us-ascii?Q?rZ4t9I1K3dQsU49xMrBh/9g4JzfQ6UQURIXCsxppJRGxJQQj+43f/OFc0EDf?=
 =?us-ascii?Q?HlAXoaMcQWu6zhFZDe26MULymy6MuuIgBlwkWlsEP8W3Rfyoy2MO7G61RxbF?=
 =?us-ascii?Q?KLNV9Eqat+uWzgz1Gy+LoH+vBIkGxOfyx2j92UsIO6wx4AE6gTL/Svfhm8IC?=
 =?us-ascii?Q?CU4pk9rvYoy8ilHI8ZxTbQRkvebkQA/EMSQLcPfruBdkQCDCMyLIkpDSUxCe?=
 =?us-ascii?Q?Yg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fa552607-926d-46b9-e332-08dcbac9e5fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 12:25:48.9139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aq2/Q7XKbHqXGWt8a764ogDNAGUHQpGTDb+xqBTPFUPibczdDcAxFBcgHnYlNyhvAILM9YrM2B0Qyg8r01NmRy82fzzarCh5O9DOjF7nR6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12152

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Sunday, August 11, 2024 9:50 PM
> Subject: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nod=
es
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add WDT0-WDT3 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - New patch
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g057.dtsi
> index 435b1f4e7d38..7f4e8ad9b0a5 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -184,6 +184,17 @@ scif: serial@11c01400 {
>  			status =3D "disabled";
>  		};
>=20
> +		wdt0: watchdog@11c00400 {
> +			compatible =3D "renesas,r9a09g057-wdt";
> +			reg =3D <0 0x11c00400 0 0x400>;
> +			clocks =3D <&cpg CPG_MOD 75>,
> +				 <&cpg CPG_MOD 76>;
> +			clock-names =3D "pclk", "oscclk";
> +			resets =3D <&cpg 117>;
> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +		};
> +
>  		ostm4: timer@12c00000 {
>  			compatible =3D "renesas,r9a09g057-ostm", "renesas,ostm";
>  			reg =3D <0x0 0x12c00000 0x0 0x1000>;
> @@ -224,6 +235,28 @@ ostm7: timer@12c03000 {
>  			status =3D "disabled";
>  		};
>=20
> +		wdt2: watchdog@13000000 {
> +			compatible =3D "renesas,r9a09g057-wdt";
> +			reg =3D <0 0x13000000 0 0x400>;
> +			clocks =3D <&cpg CPG_MOD 79>,
> +				 <&cpg CPG_MOD 80>;
> +			clock-names =3D "pclk", "oscclk";
> +			resets =3D <&cpg 119>;
> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +		};

I guess same group(all wdt together) arranged together?? Not sure.

Cheers,
Biju

> +
> +		wdt3: watchdog@13000400 {
> +			compatible =3D "renesas,r9a09g057-wdt";
> +			reg =3D <0 0x13000400 0 0x400>;
> +			clocks =3D <&cpg CPG_MOD 81>,
> +				 <&cpg CPG_MOD 82>;
> +			clock-names =3D "pclk", "oscclk";
> +			resets =3D <&cpg 120>;
> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +		};
> +
>  		ostm2: timer@14000000 {
>  			compatible =3D "renesas,r9a09g057-ostm", "renesas,ostm";
>  			reg =3D <0x0 0x14000000 0x0 0x1000>;
> @@ -244,6 +277,17 @@ ostm3: timer@14001000 {
>  			status =3D "disabled";
>  		};
>=20
> +		wdt1: watchdog@14400000 {
> +			compatible =3D "renesas,r9a09g057-wdt";
> +			reg =3D <0 0x14400000 0 0x400>;
> +			clocks =3D <&cpg CPG_MOD 77>,
> +				 <&cpg CPG_MOD 78>;
> +			clock-names =3D "pclk", "oscclk";
> +			resets =3D <&cpg 118>;
> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +		};
> +
>  		i2c0: i2c@14400400 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> --
> 2.34.1


