Return-Path: <linux-renesas-soc+bounces-23801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06117C16A52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 20:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 441E5188572F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 19:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA6634FF69;
	Tue, 28 Oct 2025 19:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aDYnsDa4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F6819DF62;
	Tue, 28 Oct 2025 19:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761680499; cv=fail; b=RElCF2H5r1EyZuHlmYISOaCDHO+MVEmk+oEjZB6+AAIWPBGm+QzBO1YIiIOh3ITxB52wU9/rrsQMs9iCC9yq/GWTdm1+9qNLsOKSjr5/CWwgioJcyIyaT9YzSjJBb8nBciSENbuC5C4XkBTkuMuKK2fYwk2aM1t1ZgKyNSuXbiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761680499; c=relaxed/simple;
	bh=pIrXAr899heY2QxrEmkeje3bQn1N30+9V/2amCLDgHw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EGzcmQvlsdQZTGEid93yNtrHYIFOqZEObxmzjYW1OjJ3e8eem3Fg5ohhOYIs0wcrS8GRKIcvUNUq8nR3BHXp8aUiUevZ9jbe1jYtAFNuSrsyX9beR5+C2qRFVE9iGjxsHYvdcqdFJ69n8yMUoRxvsw+Csvj3JSjVOXglIcdkcPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aDYnsDa4; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyccHqCiQNq0rCtv7PJVFOhnTsKx+mgb15WU4WHrSnSVRHF82jOZ8iqIw9jEC8lSWwE+SEKIp3xyCMNzjXzdNVaRrkPt68NoPPMj6aD7aivqSQrTc0+nxZIum19KzSl7faq2FTgTiwUNqkOkGBsXMD0qX9LW2SnYoYpGfvY39DSxrsd3YF3pkHEXNI+Ka/eGekzkiHxg8ioPQYMF6svKKXUZKSG8AunWuESA1LaxkngHQG1K5nrJ06J6vlE/IbBiXEPNy28+vEsTD/E0xrGDnycGhS1bBMTcPwFv67wZhgYqwhtTQm8DLW1P1qaVw++t1LahzWQ6O3a6/hGVHnE+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzkFqbNgtMjWumP6oc3B07PWJju8Su90URV6Jc6rpw4=;
 b=S6YkMn1ImwtXzxjTU+uHcPeX6sk+tgeKaJrsuHH1c019RmF0+A/cydk579Lte17P14lchBcbq7uIV/DrVI98B4kum6vDY31Z7W+3Q7KAIwe6637Wmkh5DYvQcao4hBd9z69laB8h+/VI89UIr63/hjcbxNV5GSkRLFaHnKKMfaJy6iehTk83aG2yOH5tS9ykCafkebvFGiZs5+etwJfp2KdbKr+2NHfh201YB+8QVSv4d9u91HTPaUyExj9uveTE52TQSI1SeSVWaCHU/q7VZkCj9cKcFWDsqG3SLldeR6wMbW/UcO8NmATFGao5Uog0n6OoM4JTd5UaqeBmj75bAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzkFqbNgtMjWumP6oc3B07PWJju8Su90URV6Jc6rpw4=;
 b=aDYnsDa4MQFvakPE+2Dr+PFLdqfwJMkLNgJf56KkjI9CuE3rIDC59nopIf6NHMsRwmWmd+YOlX7rsX/B3pqfQfAxWX/WXuSGdGrYo0u2fy6zLj7WEtyOn6xTJ9BdEldWwYiBRczrb6aiLA5HHjDrIlJs2Ox9PhBb6uRrR3Vx+Rw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11904.jpnprd01.prod.outlook.com (2603:1096:400:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 19:41:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 19:41:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ/G3E
 support
Thread-Topic: [PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ/G3E
 support
Thread-Index: AQHcR1jilRQDAuP9rUOvjTY54KaBVrTX9BSAgAACcpA=
Date: Tue, 28 Oct 2025 19:41:33 +0000
Message-ID:
 <TY3PR01MB11346372AB6D191D30B4F058B86FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-4-biju.das.jz@bp.renesas.com>
 <20251028-mower-mundane-316cdd6b48b6@spud>
In-Reply-To: <20251028-mower-mundane-316cdd6b48b6@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11904:EE_
x-ms-office365-filtering-correlation-id: 287fd0ad-aad9-45e1-555a-08de1659ffcd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ge+Rg5IRI7S99IZS9IOuaRaugDqx6HqWgIOw21gCYsc5TcCmYJsdPkB1buH5?=
 =?us-ascii?Q?6SOCrfbmhFCcpq/u5xke44r0sFm485LFrUQiEEMZ3VHRiw5/OQAYwFYJG8Fs?=
 =?us-ascii?Q?OGdgxraOZUDjawN3ePWScsgARiwP9tZYpv2aXLVeCmeJwySJHfYPQCxa8gXv?=
 =?us-ascii?Q?QRZdYL4z2JeI6kJsIKrJyCSp7a5DwGeEcdA0akSiTWPz/8pCcolkzjOX11Dr?=
 =?us-ascii?Q?fDlWYJyC81OINMwsJ0FZmeLB1/jZZLMa3+piifFHrGPndeqbLv6GeHNBy/0R?=
 =?us-ascii?Q?lEyNhNUH9GNLRmJKMsUXNGX4A0C/1pt1LNXkYEWUGEHZfd/T+QR41ItCKLaJ?=
 =?us-ascii?Q?xHSeoY3Lnx2xMh0D+qwCktl2rk6RKWwR+nAiS13po0mrCX5Lqn7iouy7vDNs?=
 =?us-ascii?Q?xrJxTBLtI2HrAb9dzRs97bZ8bD+xQFivgDpCPWb55Lddj5g5wzIoN4CPu/Cl?=
 =?us-ascii?Q?xRjDlRd9mGqni+5cuqo795PQtqrkTUvuwaV+8WfJv7vSiIsAOz2YjRBxTFAB?=
 =?us-ascii?Q?A+aPyZQEV842S17hpKR9leGhR8lKstwvmEsEU9ade1ELowhe0IjVkHhjYBQQ?=
 =?us-ascii?Q?T1RN3iuNpCcuPEfJ6lrThLwDv3o0u0ovXwcPncBT2OEASJFYK3VmRxdZNmR9?=
 =?us-ascii?Q?XEp6m2+n8MMU9CH8Xfs3+BYyD+L+XEBeCbjL9yMRbryCFWQb3Tlt8KqSSOHh?=
 =?us-ascii?Q?HV1GbZ5E1vF/SwdBg1TU+KQw/LbgBAP7Vj2JfKZ5q+w3siDlI7f7TpyMYhLg?=
 =?us-ascii?Q?e42UiJAXfSIkhB6a1bOAjsp942aXb4yNeRqn5PYC5cdJ9sipOSA2pj3tI6nN?=
 =?us-ascii?Q?/YklSomxevyTVawdv6QjElmcd2Phe2vP/UX6/hJt5DxjODWqDtuh8dj4UHb5?=
 =?us-ascii?Q?UYf/6M1cGIBgmgPekMWgKAIA8HIZwTqM24Ulkpx9932X7H2g0hdaBNMWg2zB?=
 =?us-ascii?Q?j2gcWI2Eq0ZzXlinkUPKhGf33AGTw4FRb/G1qxYs/SOJaVuPdQjD3AeNk4cW?=
 =?us-ascii?Q?t7ke4Z9UUHMaGiJz+OtVxyQRMCt7gwEfm9vc7rxSXwIkWRugAmf78cUZXWZ8?=
 =?us-ascii?Q?hxa18NoRvKrsMuT6UyhLx/dkOY8jfsgRFgF3cf9AiBFc9FvJ4LSA/TqttV/3?=
 =?us-ascii?Q?IqkKkVrLffK49m4g4Hev5zYO9svyS0bJor8/K64xdP0OJxVI5bBh2IIOaTmh?=
 =?us-ascii?Q?2KBvoHl1B6sKKViuJH0D/D2ToR5a7mAEs4Wr0n5E47Ze1tWF1A0GUqX04RqU?=
 =?us-ascii?Q?RLPx9r9QJ3UsviSLCij2g2W5eAUDsyA/yhHZ+6Bbq/4hD3nkljtFbqJODjgh?=
 =?us-ascii?Q?Ytaplcb2sJydX+itnhhvEDnUxOrtz+L9U/aprANQ3jHejR7Df8UN185+gLfH?=
 =?us-ascii?Q?uChDDPqKDt9vG05gc8xoxFKSADP4+Otnke0GJf4lzxMtW5qz8Aiu3vUfvz5a?=
 =?us-ascii?Q?D37CNhQAhBqM7Gw/W60HigWbTjz8Pug70DJmC+qJfWutvQoXURbiW3kMhuSB?=
 =?us-ascii?Q?8H1IJkUH07K0bdM+kwaA+G+WL8RWDqngM1QU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fB1vxeg/TylYV6bK01Ym8yHb2cQJTj4V5igtxc2mNPTN/Fkle8uEPoWQugIu?=
 =?us-ascii?Q?pi2gcxCFKwSuC9e7ob9cbNazFXWBE/3fySm+5rPrkpzaWRkoI4T/VyDA6Leg?=
 =?us-ascii?Q?CWIq1w0b815rLPfOu8NOyhJs1X2i3ICnW8FsRFA8GKYdoadfd0D/PcZZPjS+?=
 =?us-ascii?Q?LnA1S80u4V/wPnOx3ySPAgyipCXEvDb1sLja8i0TwkTbobr1hXnhhjYwH9D+?=
 =?us-ascii?Q?sWXie8k53MpqMxN97HwY8/LB4oiCKbl6RBZyy783eEC0GnPl8DBMopYpFJsu?=
 =?us-ascii?Q?2Z1J6mA/nKsr675FYTiML1InhXyKtvaU+o5ovpa216Xe18N0njlslUAyMbMy?=
 =?us-ascii?Q?/YKifGzh8WhDfmJ1W1ltSucIg4jf/o+0yoABKtO5mj2sVSBM/fFuoQRVk+FF?=
 =?us-ascii?Q?TfBG9GbT8UGYG0XOF34/7iITo/ilnRHET0jokVHmRLE510H6VNz5hSrl3L7S?=
 =?us-ascii?Q?mtp4twR1ZEu1QyORblcnds7ShkAQYlqrs5vbReU5BNZYj1LGxdEhyjlfy+oL?=
 =?us-ascii?Q?EJ+r+6Pv8qF62cFAaucmN6UDVQA/3Zy4M3pvLp/sveIYaJAVTrPYT3FBw2CL?=
 =?us-ascii?Q?jHP5zaXFvBvm4VwK20VyQfUtpv++yowxa1dgNq+GtM58IfaGRfZLVwYl9l7v?=
 =?us-ascii?Q?BAXTQBRqnXdL/aE2EtshGwJevFPCArIUHdHg1nAoDkMyul4Nc1oUuvqbH1xt?=
 =?us-ascii?Q?tKOeviIVoWkW9Yyj8V9w1BQmuOYlUT+G21Y6+BaHbEiZeDfFyu3OSEse2yFn?=
 =?us-ascii?Q?e+2LuQbgU3OD6UOPTGpCcJNyjg2HL8cASCu2iYlB9AD99ulzL5aENe0VHSDe?=
 =?us-ascii?Q?eBTBHXnXjA4g6s/vxCXggSHHVCgIT4A3wQQgJVNj7zwqFX/qd7ld+zGkPDUK?=
 =?us-ascii?Q?IBGeipOWgDsHqQbcHPBv1FLUiTQoxpsxXr60IBbpM0c9wTG+uoESp183zvMs?=
 =?us-ascii?Q?a33kx7iVh6/cPQJOPFowJ1MGleYtYuyq8NfVYqz7UP31Fgs+ducsWkn81EX7?=
 =?us-ascii?Q?bepyE5YFb8AX6GLDbldoSzrRQucIMhL/OszeARtmngZdHm/lo93bjjMjga9i?=
 =?us-ascii?Q?EvzTr4coXQCWu0wX2nvXOw0FFfsDhEMadOGb6smx4ULq6ZcPyJUpiNuKCz0S?=
 =?us-ascii?Q?Sg47cLQMMDmTdHcUCiXJ7DFuGZN2nSam8BBt6s8TI1bnKg4RcnCNsmHXV15U?=
 =?us-ascii?Q?XqGmH8Kf+Uu9+2aEao4fh0+x17V53BgA954eXxclvu1gIgMHx5MMu00yqgfr?=
 =?us-ascii?Q?wt/pbfiUooa4SrRTwL0RieDI6eslmZe8eViZ2ojTMgzzmfq6MJgXH0A1vW8l?=
 =?us-ascii?Q?X4wDGH1WpmBNaR73FdVxi8cElp7ENM7Uj1mqRyImCXszaYO5KNH3RuNpc/B6?=
 =?us-ascii?Q?76Ka1ophZiP7eqo9nLwfzICMRbc+8rAlWLoVy7UMm4A2NLvbx1Qw+qtEpf6A?=
 =?us-ascii?Q?pdqVJLqa2++OFPuGUc6cPnLBONhygGyY7LtnNWfuxxF6J307Jgz2V6NYF15A?=
 =?us-ascii?Q?fDdmw7+CYo1K+CvIxbVE9D09ZCYYQvTGFn7PFfeuG3Mh8HfIjNx0ti63OX5k?=
 =?us-ascii?Q?FZeIsuapIIie/LnE9/4suge8PDci8VxbaTTfwQTL/PoYQUkTGquu+L6MV14i?=
 =?us-ascii?Q?Kg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 287fd0ad-aad9-45e1-555a-08de1659ffcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 19:41:33.2213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWMAz7/2bipLgkpHSbahNvOzqKhFtkVnVdleYpiYzqsDZngmm7IIgFpvncTH6EObA+7UGRRcVHZLGUNKVMLfDIKACSj3dhPTZcnMkWez0YQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11904

Hi Conor Dooley,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 28 October 2025 19:31
> Subject: Re: [PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ=
/G3E support
>=20
> On Mon, Oct 27, 2025 at 03:45:50PM +0000, Biju Das wrote:
> > Add documentation for the serial communication interface (RSCI) found
> > on the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is
> > identical to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage
> > FIFO compared to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode
> > operation. RZ/G3E has 6 clocks compared to 3 on RZ/T2H, and it has mult=
iple resets.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/serial/renesas,rsci.yaml         | 82 ++++++++++++++++---
> >  1 file changed, 71 insertions(+), 11 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > index 6b1f827a335b..7cf6348e2b5b 100644
> > --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > @@ -10,17 +10,16 @@ maintainers:
> >    - Geert Uytterhoeven <geert+renesas@glider.be>
> >    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > -allOf:
> > -  - $ref: serial.yaml#
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> > -      - items:
> > -          - const: renesas,r9a09g087-rsci # RZ/N2H
> > -          - const: renesas,r9a09g077-rsci # RZ/T2H
> > +      - enum:
> > +          - renesas,r9a09g047-rsci # RZ/G3E non FIFO mode
> > +          - renesas,r9a09g047-rscif # RZ/G3E FIFO mode
> > +          - renesas,r9a09g077-rsci # RZ/T2H
> >
> >        - items:
> > +          - const: renesas,r9a09g087-rsci # RZ/N2H
> >            - const: renesas,r9a09g077-rsci # RZ/T2H
> >
> >    reg:
> > @@ -42,14 +41,40 @@ properties:
> >
> >    clocks:
> >      minItems: 2
> > -    maxItems: 3
> > +    maxItems: 6
> >
> >    clock-names:
> > -    minItems: 2
> > +    oneOf:
> > +      - items:
> > +          - const: operation
> > +          - const: bus
> > +      - items:
> > +          - const: operation
> > +          - const: bus
> > +          - const: sck # optional external clock input
> > +      - items:
> > +          - const: bus
> > +          - const: tclk
> > +          - const: tclk_div64
> > +          - const: tclk_div16
> > +          - const: tclk_div4
> > +      - items:
> > +          - const: bus
> > +          - const: tclk
> > +          - const: tclk_div64
> > +          - const: tclk_div16
> > +          - const: tclk_div4
> > +          - const: sck # optional external clock input
> > +
> > +  resets:
> > +    items:
> > +      - description: Input for resetting the APB clock
> > +      - description: Input for resetting TCLK
> > +
> > +  reset-names:
> >      items:
> > -      - const: operation
> > -      - const: bus
> > -      - const: sck # optional external clock input
> > +      - const: presetn
> > +      - const: tresetn
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -62,6 +87,41 @@ required:
> >    - clock-names
> >    - power-domains
> >
> > +allOf:
> > +  - $ref: serial.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g077-rsci
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 3
> > +
> > +        clock-names:
> > +          maxItems: 3
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,r9a09g047-rsci
> > +              - renesas,r9a09g047-rscif
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 5
> > +
> > +        clock-names:
> > +          minItems: 5
> > +
> > +      required:
> > +        - resets
> > +        - reset-names
>=20
> Does this need an "else: properties: resets: false"? Or do other devices =
actually have resets too?

It is not required as resets are optional for RZ/T2H and RZ/N2H. RZ/T2H and=
 N2H does not have
Resets.

Cheers,
Biju

>=20
> > +
> >  unevaluatedProperties: false
> >
> >  examples:
> > --
> > 2.43.0
> >

