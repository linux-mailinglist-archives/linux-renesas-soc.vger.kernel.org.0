Return-Path: <linux-renesas-soc+bounces-20759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA4DB2DA39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 12:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95D847213DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 10:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E381A2E2DED;
	Wed, 20 Aug 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="B9GPrLtR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A776C2E2DDC;
	Wed, 20 Aug 2025 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755686388; cv=fail; b=aqbH6aAkYJ3SUbpxcszh9TlzQxkNyqar1oS9O7uqG0Ajf/ivcwsVJbzTG4+Jf9vuiNNtmFZn9YbRJFNSOiKTZSCgUDxLlm/kuUpSF3jDuCtx7FZSl+3LSJPwNOrUgl+dSvb+YSp1Z5fm6FrExbcqJH3UoFw0boes8TIG1Al08yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755686388; c=relaxed/simple;
	bh=gXKqgEkSR1w7oKL3XJz827rxHgCYqfbOwYGLK5qzaAg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WqIFkBbslBslStUact3pRq0UFfnuKtXkIWwoA78dhOHlG3z2vCSWlb8QPVhx8vssNofpeiqx1XvPSroXQCKcy6hUHmtxxwFk23pT6Xu75J3EIxnvE6YvEoMA4c1pDAP9odO5e6KYsjpuvBylK+JfMhuqg0TbkJlvELhlC8BwTHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B9GPrLtR; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7nPnRsZASP+rjSVAT9CZ9UPO11lQcVrPth0V+3OLMc78AeuRg/oqp0lyaBugUUd48IpRFjfz3ji9MiyFNH/3Ua8P+6VK3I3Qz/WACFuuUGqfQojivATH2ZAgDn0WHIRD1WMKlQsswcvR+SvkqNbqJcUTT6+QDKzRxevkqDRWp70lXqviGwdAE8kd84S0xgKiKveraToBhmTuO5Fb8Gx6gYstg6TpBrqA98EIK+/k4K8oNBOlenL+46Hv4qz+HQl61vrlqWo3RW9m0cJ9qYqXxMvTbbjU+Z/nAUPnhOcacpJhnriHSp4+G2fzzbPcgXRMWhkIhIbpx1VkL4zGP4OWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXKqgEkSR1w7oKL3XJz827rxHgCYqfbOwYGLK5qzaAg=;
 b=qk0AimCaoJzopSBPNQhhUAfAjG6jvMvkabk4ZX9eKzlKx+g0toHMciSwMOVGt+pXAUPfnBB/NRxIvXSsRoRpHiVUFejSKTzeRN+3BS2wDeK/TtlPZbC8tiJhkhJBoc92Czu2wQHOYbgXweItzk4PjcB9peMZVo06xhOhCWsIFvixsFyV0ni07IY0DyipSRohpaakKxJY8LVgOPr7sqUikLblIAzC5oK4ZtPJ4c/usK8qNnu2gzQTSu9Pt89ETVcXmtXVPUGO4cZYjX2qSuLpF56mjN2QCw+F0ArxwJWbictKIrUaH4gOeoAwjQ5c2fhTtekS5oahvTPVfhEcSZzYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXKqgEkSR1w7oKL3XJz827rxHgCYqfbOwYGLK5qzaAg=;
 b=B9GPrLtRxJfWZlb1d1Hxq3+7PZqWkwqE5mIyp8FjlzEU0oX2S1454RLAmOTNPbtgzFo/QIEn3Ie06O0cIpKENE+B/14eVtv8ArJVDpMU83HDuJoxKkmWslaZ9TaOrNsJ/GPOHYwGp/1cNB1D2uxYb29WRBUim2AvD+Tk2Pyfp/w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9529.jpnprd01.prod.outlook.com (2603:1096:604:1ca::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 10:39:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 10:39:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g047-cpg: Add GPT
 core clocks
Thread-Topic: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g047-cpg: Add GPT
 core clocks
Thread-Index: AQHcDRnDvbXSUN3610SOMGUYL5o4E7Rijt4AgAjUFCA=
Date: Wed, 20 Aug 2025 10:39:41 +0000
Message-ID:
 <TY3PR01MB113460A46416918BE1A261E178633A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
 <20250814124832.76266-4-biju.das.jz@bp.renesas.com>
 <20250814-rehydrate-pamperer-6844756aa66f@spud>
In-Reply-To: <20250814-rehydrate-pamperer-6844756aa66f@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9529:EE_
x-ms-office365-filtering-correlation-id: ae0452e0-c3e8-4408-c4d7-08dddfd5dee6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dj5NeIgzhWwYumqFIbr+Hh+vEc7x+2EBXGTglgthPFxv2A6z80TYn2lvRNJo?=
 =?us-ascii?Q?U5706sE3XppOkQ8ryQ2qG2nASGOIbBVeDeiYu/lGp8LWiOy49gPNBnwDVEiH?=
 =?us-ascii?Q?EPqI+JiVUGMV/Agfp9DglSpb+1rf5tyCcruWpKMKRexJb6/8eqOHAKaOWbjO?=
 =?us-ascii?Q?N0JmLkQY/XMiD/qBjLQQhyhnt1VQlhEnF1KOv72luEXugC7SSbpeWsWcLg26?=
 =?us-ascii?Q?jZy6cQpmCMST448KnoxQJo5+wGtz1YLlPQ11vEmMNTZxfGJU96ySL/VU9U+0?=
 =?us-ascii?Q?8O8o9z+0m9BnRZ4BSAN5N8v8DyQR4aT0PV9D3MdU9QTgTQAYK9+W8H2lzD8U?=
 =?us-ascii?Q?hOXkyyOo3wH6cn9qVY6J1vfQIxPhpb2J8zmv36kvCwt7NK8DG/N73CZGG/wW?=
 =?us-ascii?Q?po5Dax/Xmmm5kjwYjqesXW+8sZ5574frW3HbQopf3zD0HG0o6eJ9jKTW6xE/?=
 =?us-ascii?Q?N1Wi9JCGWCPns2A73whCl8upmsra9YkNGN8TxX98GynM2ZDEArbx8NZ3Ko9x?=
 =?us-ascii?Q?IqzIqIEWm85HrPjsJ2D65KUj4TqrEEVtGb9nmVgWMCigORZXVmBUidvNhToV?=
 =?us-ascii?Q?l+9cSsNcoRc6IGk93OPTspMqQuMBVZsmq3dHh1niskwRM49SyneIai32COpK?=
 =?us-ascii?Q?5vWTyzc8k1qAczhKWZZbnleehOdveX9G3qA7IBFjO+QV9G8onSQIc505x8E1?=
 =?us-ascii?Q?tlJBHwx9/QbOSHsLn1SDMIN0Ru3Pxmuqg9eNz/51Hx6atVW7JPY6JL69yg/R?=
 =?us-ascii?Q?TQxPLCvEnVun9Wa0SbOzG0eHl8fY+K9YtRqscjJXJSpQItgchjd27OqnODsC?=
 =?us-ascii?Q?TLJvNJy71mZWC4tkbhk0KEHXz1fdleK7GCEAyPjV9j2GCSgluzVJgfzgA1m3?=
 =?us-ascii?Q?01sZ4mDrkKoBr4Z+OiYUhKX+AcSsQuu74rU59XbMdIp7RCD5bOCQ2+VHk0ZE?=
 =?us-ascii?Q?qyIHpT1nEdWv4Pzv36CaA+Ifl9wSPz2sk7lxcEscnotY1BDKAYQEkjrDPBTE?=
 =?us-ascii?Q?MtFBaWBkdPQAAivXon49WU/bzDVyBhc/6ge8iDXh3wmymTMDw+XdCbs7gOMt?=
 =?us-ascii?Q?N3954iBB/4qlVOMaVHS+jjpSoogLvEUTdp7rH/ILzorunCNQZxfq4CZA8HlB?=
 =?us-ascii?Q?n2uoQjcfzQx+qzyHg2+ATZrjXX94ifuHfHgmL3EpZQblOgLN3dTHLP8/tbWg?=
 =?us-ascii?Q?2qolzgfU/ybOdH+b2NELEc/UM7ZhCxzZAY8hmhexaBTNLyJ6E4W7B2x1s6WL?=
 =?us-ascii?Q?gFkU4rNRyUKMYIqcmBNB144rmNkPgyGfOft9TuWJJXuiVM657qpeWv/YO9nn?=
 =?us-ascii?Q?9bnDoVVGXPpgY3gQr7EjG4oBA7BH8gPaIGujPfc212GpyYe0ATC7lNXFMQob?=
 =?us-ascii?Q?yGlR91/iE0r89Ko1PXi/xdnhctgQL4KUMw18FEflT72rcaMNGfvHqqM8h99+?=
 =?us-ascii?Q?OPuTBeoQyOhD9BLxsPu/qWjMnmOp2n6jnfXbtE9a53+d1uKJgU7Myw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/MbVgUSD3JxLeQME7E+RyRYKox8w1QouXkbUeEiEoTZJz0EmapmI5gpopsXe?=
 =?us-ascii?Q?VWFhUAi23aRYZaHLvwtxlT1Ddwsal+f8PEjC4DwgBYUplTJ1aY6whA3CNmrx?=
 =?us-ascii?Q?xYFpWxu2QLO1zf7t1GR1M0QzFS49S0WdcPmYllwoq7j+VpJsLXkgSnLvZSK7?=
 =?us-ascii?Q?98h6bmFgyug12+jNjp8i/WJzS35WKxfuBIHkqesfQoQ84DakA5wgu2e09yxX?=
 =?us-ascii?Q?Ajkbkl3reFberAf8HpsIDxi9KB1pPSeI2OcdoY8A4ILXf4m76xIe/615M5uM?=
 =?us-ascii?Q?Ugf7oM5euW3oj5fHHu7ttGHD6nERVUR8WnVdF3C8FIGO7EN5/6gTqsjMRDrh?=
 =?us-ascii?Q?WEMohM+EnAVlmDXHM9mEOL/1SNCN0U7ItNpkWCZtn6fMLnc5IhO4ZTql1N9a?=
 =?us-ascii?Q?fK1iYoxVA0dgqcoSe6Tbq4h1lqthyd69YTunvpGwpx6lHRRof3zPw1c0hx5X?=
 =?us-ascii?Q?o3zvcC3ALqk8rZyEkR9wrj+I4OCqoh2ZmtKxT5euvoXSxhshGZVHWfbuznTY?=
 =?us-ascii?Q?eRpfVp9IRRvxaV0lwwaVVcXAhZj3Xd9CvZ1Z2r78SBvgztQVKTpcbksZIqG3?=
 =?us-ascii?Q?ukmqVqwc9wlT7q7iAoThUjClv7n4D+cVoQtzVMppdJR9iNGLtb5RMF7tgMPf?=
 =?us-ascii?Q?UNNfW9Rdoyq8YP/e7YJs4Q89iysPVEDVxIDciEpldcJq+yXHhroCKldRzrQN?=
 =?us-ascii?Q?GCDV5ZnH8BFvB49ymeCWfmsV2f7rHEoIOCqK9obOF8k8Zt2VEMWRaSSrW3CY?=
 =?us-ascii?Q?C6CgqbeJRVYPJS88W2SG2ieNz3vnCjaLfm1VsYdSVprJgEg1oXKoDL55flPk?=
 =?us-ascii?Q?CX9MczaC9lmfqdoNTPOj9kiIO3oQKsbaDHOlfLSPMg8YGlx8Ld8HochY/5Eb?=
 =?us-ascii?Q?J0C8Fikf+juQoCecNs8PqpUmfWa1Epw4Pjr+AONwN9jHF+Kg470sLsWCK4dz?=
 =?us-ascii?Q?5CLHjARNIICZKMtL58xXKVzYqQdbZ6AxCep0+gYlAhZ21kdRNQYNJsTBT2jW?=
 =?us-ascii?Q?x7OHTmvzUHepE3b0zEsd6MyEfdlpHjb0/y/SecTL85UvjuOcxlNSExeDHhzv?=
 =?us-ascii?Q?+lva5Fb/8BY6vk5DA7D9+cZqBY3IZH2ucgyzXssACMbctnj8wcspqu8+8T8O?=
 =?us-ascii?Q?PKHSu0kl9VTt4mcmp0fw9zMmHK825L9jDuV8ZB77i0JZYKklg18y1K9627cg?=
 =?us-ascii?Q?gvdfy7ZZmdpruCLctWZCgNnaSH+AYUf5jo8HKM16zZ6UeWs+f0UzZ2b9WHLK?=
 =?us-ascii?Q?w6T+rDhfBLjbcbSN+u7rAle5V7cNXiEAMxEPbe8yewma7jizCV32mg0G5DOg?=
 =?us-ascii?Q?BzMDjX4eDByVBNA5urbsJu5iimm6wkQ88IwKUhd4orFwYmw1ut/ean+qxS/q?=
 =?us-ascii?Q?wEK8mvMAEqjzUP0vmLi1p2YO8qC/yUYHIhjoydqK1tyvPwUSrvfm6wyz47dq?=
 =?us-ascii?Q?ZHsTP3FPZmwq7ucq/EEgkFyXd76+lxX5iUt6Zv6GGL2qxj0SvkQtJqDu20+5?=
 =?us-ascii?Q?THy89ODWHdMp47NjzTrdXM7vj89knIeAQIK6N9BLgQf27xcaSouKEAw0tiVw?=
 =?us-ascii?Q?Ha3dU0ftToWJhmtLVdYtHim0tIGEoLAQJUwuS75WHP7MBfHg+F2Lk1Ojih3O?=
 =?us-ascii?Q?Cw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0452e0-c3e8-4408-c4d7-08dddfd5dee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 10:39:41.6648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rz2r7jHl3mwZ4f58xYWbxfqszYNnDKpZxSiWadabQHgCw6siPqNXmC/napIFhYGy7LAqLCCwYV2AcAdTC2rGo6mIU1Ys6OVPqB9wqLhjCpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9529

Hi Conor,

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 14 August 2025 20:49
> Subject: Re: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g047-cpg: Add G=
PT core clocks
>=20
> On Thu, Aug 14, 2025 at 01:48:26PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add definitions for GPT core clocks in the R9A09G047 CPG DT bindings
> > header file.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

I am dropping this patch based on [1]
[1] https://lore.kernel.org/all/TY3PR01MB113467CB44FFF5F65038153EA8633A@TY3=
PR01MB11346.jpnprd01.prod.outlook.com/

Cheers,
Biju

