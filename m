Return-Path: <linux-renesas-soc+bounces-8999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CCF97C006
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2024 20:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 391621C20DA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2024 18:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B1C1C9DE5;
	Wed, 18 Sep 2024 18:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AeiH97/5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62013A3F2;
	Wed, 18 Sep 2024 18:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726683335; cv=fail; b=CtXzRlKhXnBkIWCGmXDb24qzQTjyGRq5w4ic4axb9A92JxURs3VIwrtp+iVa8BpzbgLgUO2faPTNC9pjG+/TLtIgEHQ7G9o1q1dPOpLLlVrV/1uyr4sEyhkxkKovH8nWoh7R5Mm59NmWI6S9pf6Km0fRMeNzcgNX64vyUZ03ejg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726683335; c=relaxed/simple;
	bh=J2ssANppZajWQfJw+yzz7yYP4lhiHjzasVFKdpAgDHo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i6WxkCtHuGuN6FIAs3JC7I9/maErRAZxFbrsyZmdD5skEBeHiMLW/WRuXj1cBp7swa5FPWtnfUdDTTfg0qg9CFc+V7EG4XndG5IiYVXkN/6b/erN789Bu9xg2FNLZnrR8/3xviXH3FOSgl/VBMAfPSCl03dy9JmaqWWDCkSyj00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AeiH97/5; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7VDHF4GaJXPkGRQv6aWGcbe3sJaaJCZjYcznLJ3Ds/0sSQsgXEy6oIAA0161HPqi0SWqldl9sQ2XbXdp8tfB15ClqNLOuPaOBZRQI5teb36Md3Q/cuhZgLlsncJoxmz27I9ppDMhs8uVF53BtgHc++lbEv/Ezl6eP98M8MSxWxnQlGm1xR+gDKQvil1VkqRPTLs1gfYoHZxhN/FEbspe4TbSQoETLG0sH6FljXUbhuMrHNJDhqQswMOnpJsW+7FaTU5h3r6tseJqQXA0jYbaYB0ZJEukDP5nWbvQeHQuh73gw8YfJsbJ873YDVFwSgRWsamnj76jS0ZE1z38tRRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lq+9fn9bg27xO50teiRzz9IgvKN35d4QaGOHg2mH+EE=;
 b=mfcPGjXPg2Fg/aCUAx/2SLksrDyTfIpYCKdwER0RIv0X1REoR0KyCgdEXauihENOKgANICy+cFvnbf3MzPlCqBXhrk8pBRI/JqaQM86kydU2nTmtowx6JYDrmZtj44lfpvcL3wc5QKs3t9lE0E7im/60eLDRQ/w+uq+KxsTKVMJBYmexxdrzCWuiSmmEniJK+azkOJU5NhFBCqnevqE9ra73Tynn6YbIRPdJFBF9poy429sNBJ/5PthshfH4BUNQ9Qa1dE6YaGyyg4UuvWswgKAVwgKb+qBa5LXM0vi89yvYLNSyyEefH+0qyY5TiOmCE4xNdreE6OzJOU1Cw2WYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lq+9fn9bg27xO50teiRzz9IgvKN35d4QaGOHg2mH+EE=;
 b=AeiH97/53jhCYK5X2pfY3GVxOZrVmjUY5nGdbySOSQ4NkqksGZM18V3p61Yfc0ad3KAjHhAECVHp0Ncaltt+MFuiyD887iwPSPmmmquaQtOcjh/vP5JCgvjeZPWB226Ml2HyEnpTNvADVnB9P6lWt9PAD6Jkv1rN/8gEQ4cuKoY=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS0PR01MB5748.jpnprd01.prod.outlook.com (2603:1096:604:ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 18:15:26 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.7982.018; Wed, 18 Sep 2024
 18:15:18 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/6] dt-bindings: interrupt-controller: Add Renesas
 RZ/V2H(P) Interrupt Controller
Thread-Topic: [PATCH 3/6] dt-bindings: interrupt-controller: Add Renesas
 RZ/V2H(P) Interrupt Controller
Thread-Index: AQHbCSe1auB4kIFR/0yrte1v28WXh7JdzfyAgAALcTA=
Date: Wed, 18 Sep 2024 18:15:18 +0000
Message-ID:
 <TYCPR01MB1209324DA2100B5E86B8D544CC2622@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
 <20240917173249.158920-4-fabrizio.castro.jz@renesas.com>
 <20240918172817.GA1823473-robh@kernel.org>
In-Reply-To: <20240918172817.GA1823473-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS0PR01MB5748:EE_
x-ms-office365-filtering-correlation-id: 4064a581-1a14-499b-044e-08dcd80dda38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?V2nrZbLCzTcAwXOZunbp88QgYLsu88HaZmCizwyDuwTYawGcVbAazqmz+tBu?=
 =?us-ascii?Q?FbMNnYkruTaA/TAhnRWvQXpE+VNqJbt8CPeUmERgkdHMBjK+MIDQ0i2wddLJ?=
 =?us-ascii?Q?JuInoBF4+YAkumrLHdMCWzO/kXuSl+7CrM5pGqCJ32g/T8ZYQIwBZH4egIez?=
 =?us-ascii?Q?58xVPTr5C8OilWUonCfT+yNKsODV4k6A81rXZCdIDHkt4s44gJikaVQnHEbQ?=
 =?us-ascii?Q?wClvkRUShdegVD1oOH0SmmRX/iB14ridQFLziLQCg+f1U5IrYFSLazaenmxw?=
 =?us-ascii?Q?5WaVRgP8g58KlPKSK5fH99HkCyQxloZA9m17IzcRLagYlrPkViwmfB1nhTFb?=
 =?us-ascii?Q?ucBJDcBEyGhQfmZdrOUmqBjjglooEVAGLEskF96ENXvK1iLUdN7QnTwHQxo4?=
 =?us-ascii?Q?sE08TloewoEycZ6nTvENiqw31gK5+WePgcfsA313ctIFGNWY9GALu10SXLkF?=
 =?us-ascii?Q?BYMQiNhDDxyExHCvyu8aGwmIIYtgNYkZdU6aTmvwh03x/Vu2wC22IeJVmT4w?=
 =?us-ascii?Q?H7qJ/5cjJqCd20P3TPNaloNYTMFf1aOk80h2/8Izfvnkye8Z3sJyg+5aRPNT?=
 =?us-ascii?Q?aIN95/0PPCZd7dSN8IW1zj4YcxunKKxyi08JA46JDOVSSx2P0HHyXvbNjN9h?=
 =?us-ascii?Q?Mul3N6CCxmJe71GrEWe2MJ0tvlbAC8pfLfjq1b4P1zPJZGPLuD8RJfXEFObp?=
 =?us-ascii?Q?4p1KeGTZKv2UR4/SAEs1iNjcV/t/bTL3vaL3r36KtTjc0QarVZhufY1KyRXq?=
 =?us-ascii?Q?OtCX1hLtkD6J2gk8Rt4We2kesiSR/f2hoj2UtGoMG6YprsU5yeK4w5ucaSiU?=
 =?us-ascii?Q?2g9w/4RY+Ze5TayhhjLhJJhtjr5fQ0D/wtB6Vkld8af2/CA6x1oR8AMV+u+J?=
 =?us-ascii?Q?9hE+lcnN/mWH8zuv+Tt/xqykVwyCTX+4wXy6YgMPwNLO+PF7o97aXTMv42Lk?=
 =?us-ascii?Q?QRIOZCD8VZWgs3rL5osae3sKA6tSHhh2dmWi/hjCNDKb3STTwFKEl2m7h/AW?=
 =?us-ascii?Q?5OrCrHZfbPL3EiRCHANPMYi50b11TMd1ntzXYYGW/VwJSvmf+tcxvCCZephV?=
 =?us-ascii?Q?0L3IGhew0QnRLXKp1Fj4Bg2oP2pWoJX9IWfmdZ45psp7hTXFyrl43tQpAMOe?=
 =?us-ascii?Q?0Q4h8jEI4PuYuVaUWfsq4WulBYfIAo1vLGRzBmu2IPB9KKIZu/oHCEz54en1?=
 =?us-ascii?Q?qw4A55HKvgh91IOIQeXIeUC65DHJnijtAbE0cyeQLaK0h0V1xJyYEjm6stiv?=
 =?us-ascii?Q?lpcCw71B4I1RoykeQoGWDgkgufv/bWxYIKs7wgHUfUpwIfkly0rAdWkxG3Qr?=
 =?us-ascii?Q?Ib2/ff1DKepEpPviGqaSbnAbGcRpg0jXCAQkSpz47dVNMy5ABcbY8AYJWBDY?=
 =?us-ascii?Q?QY4a8us=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3nAyVAKUuooYXUbN1blxFr+Jnz+Y0vB6IQIYToNpTJDbqGMa7+BVxUjIehoo?=
 =?us-ascii?Q?jXhRp0zWjJMipFbNU2Gah/VfEOozKGP7PvAohh9l+hiqErJ3GB88zDwS4S08?=
 =?us-ascii?Q?I48JI7bp2Mvr8qrovN8iAAtuMQqfWE+W8QKeSfc4uJFY14DP8zmlpLZVHKm/?=
 =?us-ascii?Q?NNaE0SwUQvQYbSY7BunFoYFUGSycUVzXLwFr+ULDMJ/vMdJnBb6d3PVaprqr?=
 =?us-ascii?Q?w4EAlWOeoi25m8iHPqHo7UuCBu4LWiskKFB77d940twBo/ImD7i7XAJ0tAC5?=
 =?us-ascii?Q?hlC9xI/9QnscKqc/ohkZmOrL5PpQRV4ZlMKr61hziiYQ7yQR21UeAl/lCIGT?=
 =?us-ascii?Q?xwTtR2t7CxRJN41XBEc2LsxOIprrcpZc4CJbVsiF6gLsMJ0WFd7Zs+ReW1bX?=
 =?us-ascii?Q?bI7GO02YmLPeIFnj4tjez7fl5RAvarrl850oYxknJhMADm/lxpFojFGl/BeJ?=
 =?us-ascii?Q?UDQv/ZkxKeRAGMvjQ6yfFgQYRQB/EOUn0iCCHnv38kGM2q4dyWwFTOTk7LAW?=
 =?us-ascii?Q?M9taigL0QPldYF4mzD9AIXt8rmbFXngohvX/ZwHT2lBVMOFvDlv3eaE+Q/+H?=
 =?us-ascii?Q?ekcTj91LEYrw/UpBimZnLFsYe3sN+Jk0CFFvJMNNwtx2AS8WiReZLbUijUnU?=
 =?us-ascii?Q?vPwqxCjLoD9cm2prmA6EhYOxXPo7WE0N17krqSmnHIyqoYtstrsPdVHcCP0R?=
 =?us-ascii?Q?czWb6hg0mBDegs0swqW1k+bcdcIN4nux77qNkBKgfP8a3z6KKnJ8Jqs5ihv9?=
 =?us-ascii?Q?KU+Ke6vrmPKED7Jb1zVG/eEQIwzUocH/mgAHM5N6gJv3wsHx7NxWIuqtAjWN?=
 =?us-ascii?Q?9rVbKe4hfXP/u+Azv6Sf9tYzVCSyKXZ9LdPJ+87YQY9Ef+eVptR+OIh3wmBk?=
 =?us-ascii?Q?nahQqnTUrzLJMviB3sO6K0bJGiWmUTuuBgkl2HP8DNW8uSJu4KIdbfDsy0qC?=
 =?us-ascii?Q?DD21rgo6M7jHJXWyoA7vmS17zH3lkiyxadeD8dy2XlCpNPMGT4u9zByWGzyL?=
 =?us-ascii?Q?BERtYCZE7njDnPwya6XV+eayJ1ExyoT9wV8bKG5L44MC5xYT7kcfNTjI/EKN?=
 =?us-ascii?Q?WOOyJzrFQ9Gt+hMU093dMZgnwu1zjaJ5rYaU7S8uF0lWvivwU2MAMZeAA2q1?=
 =?us-ascii?Q?/xXEQ/WBukDhC96MzD9g14LiH/Tuq1vIwy9fJ7KxlsNpF4+xwFALtFIxbg+G?=
 =?us-ascii?Q?ndwbWE+vReMRuW6sZxNiveoLxyyZZRaELM4WnrMPbpUxFaBIMgwYd0uaEFPI?=
 =?us-ascii?Q?Y55nOEFqLHnxrg5JamhvhcPBtyh14cING4tXjl2se3bBH9IZsUlgEV2r8gAP?=
 =?us-ascii?Q?q/fW6f43htgZ7CTjTNLAFjsRABA+gg5fnFw8RYvvS/qEJIeRXhfctageqvva?=
 =?us-ascii?Q?Vvpi9l3226vjYtbns5+L6n12Vm42iMaWH3c64kdcxW+a0e/KNdj22kPP75Cz?=
 =?us-ascii?Q?VIUM5sELmjgp/PQ9MI8W+0V7ntG4DjSyAOvkIbz6ddoov0Wj9iqjarBBEzmE?=
 =?us-ascii?Q?fA2ADukPSEV/Y4Rau2HwFWFbT58JAUbpAz0l0qWZctZ40DksofT37pALmiSL?=
 =?us-ascii?Q?HzUgn/2rICmA7kyvPRzA/EZg1h9f689Xb1pVCHcndVwnPlSRY0m6zIY1jVrK?=
 =?us-ascii?Q?Nw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4064a581-1a14-499b-044e-08dcd80dda38
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 18:15:18.6981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: myI+BwsGHPac4n78D5ioPmUC2tmM3YVJS9ZlbwGnN+ZJbnsCKL2NGFOjmRNP7q75MWmNNAHmyiHc4oVjt0QGMhMCKtK62wC8KbGJeG1ebng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5748

Hi Rob,

thank you for your reply.

> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, September 18, 2024 6:28 PM
> To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Subject: Re: [PATCH 3/6] dt-bindings: interrupt-controller: Add Renesas R=
Z/V2H(P) Interrupt Controller
>=20
> On Tue, Sep 17, 2024 at 06:32:46PM +0100, Fabrizio Castro wrote:
> > Add DT bindings for the Renesas RZ/V2H(P) Interrupt Controller.
> >
> > Also add macros for the NMI and IRQ0-15 interrupts which map the
> > SPI0-16 interrupts on the RZ/V2H(P) SoC so that they can be used in
> > the first cell of the interrupt specifiers.
> >
> > For the second cell of the interrupt specifier, since NMI, IRQn and
> > TINTn support different types of interrupts between themselves, add
> > helper macros to make it easier for the user to work out what's
> > available.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > ---
> >  .../renesas,rzv2h-icu.yaml                    | 278 ++++++++++++++++++
> >  .../interrupt-controller/icu-rzv2h.h          |  48 +++
> >  2 files changed, 326 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-i
> > cu.yaml  create mode 100644
> > include/dt-bindings/interrupt-controller/icu-rzv2h.h
> >
> > diff --git
> > a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h
> > -icu.yaml
> > b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h
> > -icu.yaml
> > new file mode 100644
> > index 000000000000..28f5b2f30c31
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,r
> > +++ zv2h-icu.yaml
> > @@ -0,0 +1,278 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/interrupt-controller/renesas,rzv2h-icu.
> > +yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/V2H(P) Interrupt Control Unit
> > +
> > +maintainers:
> > +  - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +description: |
>=20
> Don't need '|' if no formatting.

I will take it out in v2.

>=20
> > +  The Interrupt Control Unit (ICU) handles external interrupts (NMI,
> > + IRQ, and  TINT), error interrupts, DMAC requests, GPT interrupts,
> > + and internal  interrupts.
> > +  It notifies GIC of the relevant interrupts.
>=20
> If you want paragraphs, then put a blank line in between.
>=20
> What this interrupt controller is attached to is really outside the scope=
 of this binding, so maybe
> just drop it.

I'll drop it.

>=20
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a09g057-icu          # RZ/V2H(P)
> > +
> > +  '#interrupt-cells':
> > +    description: The first cell should contain a macro RZV2H_{NMI,IRQn=
} from
> > +                 file include/dt-bindings/interrupt-controller/icu-rzv=
2h.h,
> > +                 and the second cell is used to specify the flag. Help=
er macros
> > +                 for the second cell can also be found in the same hea=
der file.
>=20
> Ident by 2 more than 'description'.

Will do, and I will amend the description as the header file is most likely=
 going to be dropped.

>=20
> > +    const: 2
> > +
> > +  '#address-cells':
> > +    const: 0
> > +
> > +  interrupt-controller: true
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 58
> > +    items:
> > +      - description: NMI interrupt
> > +      - description: IRQ0 interrupt
> > +      - description: IRQ1 interrupt
> > +      - description: IRQ2 interrupt
> > +      - description: IRQ3 interrupt
> > +      - description: IRQ4 interrupt
> > +      - description: IRQ5 interrupt
> > +      - description: IRQ6 interrupt
> > +      - description: IRQ7 interrupt
> > +      - description: IRQ8 interrupt
> > +      - description: IRQ9 interrupt
> > +      - description: IRQ10 interrupt
> > +      - description: IRQ11 interrupt
> > +      - description: IRQ12 interrupt
> > +      - description: IRQ13 interrupt
> > +      - description: IRQ14 interrupt
> > +      - description: IRQ15 interrupt
> > +      - description: GPIO interrupt, TINT0
> > +      - description: GPIO interrupt, TINT1
> > +      - description: GPIO interrupt, TINT2
> > +      - description: GPIO interrupt, TINT3
> > +      - description: GPIO interrupt, TINT4
> > +      - description: GPIO interrupt, TINT5
> > +      - description: GPIO interrupt, TINT6
> > +      - description: GPIO interrupt, TINT7
> > +      - description: GPIO interrupt, TINT8
> > +      - description: GPIO interrupt, TINT9
> > +      - description: GPIO interrupt, TINT10
> > +      - description: GPIO interrupt, TINT11
> > +      - description: GPIO interrupt, TINT12
> > +      - description: GPIO interrupt, TINT13
> > +      - description: GPIO interrupt, TINT14
> > +      - description: GPIO interrupt, TINT15
> > +      - description: GPIO interrupt, TINT16
> > +      - description: GPIO interrupt, TINT17
> > +      - description: GPIO interrupt, TINT18
> > +      - description: GPIO interrupt, TINT19
> > +      - description: GPIO interrupt, TINT20
> > +      - description: GPIO interrupt, TINT21
> > +      - description: GPIO interrupt, TINT22
> > +      - description: GPIO interrupt, TINT23
> > +      - description: GPIO interrupt, TINT24
> > +      - description: GPIO interrupt, TINT25
> > +      - description: GPIO interrupt, TINT26
> > +      - description: GPIO interrupt, TINT27
> > +      - description: GPIO interrupt, TINT28
> > +      - description: GPIO interrupt, TINT29
> > +      - description: GPIO interrupt, TINT30
> > +      - description: GPIO interrupt, TINT31
> > +      - description: Software interrupt, INTA55_0
> > +      - description: Software interrupt, INTA55_1
> > +      - description: Software interrupt, INTA55_2
> > +      - description: Software interrupt, INTA55_3
> > +      - description: Error interrupt to CA55
> > +      - description: GTCCRA compare match/input capture (U0)
> > +      - description: GTCCRB compare match/input capture (U0)
> > +      - description: GTCCRA compare match/input capture (U1)
> > +      - description: GTCCRB compare match/input capture (U1)
> > +
> > +  interrupt-names:
> > +    minItems: 58
> > +    items:
> > +      - const: nmi
> > +      - const: irq0
> > +      - const: irq1
> > +      - const: irq2
> > +      - const: irq3
> > +      - const: irq4
> > +      - const: irq5
> > +      - const: irq6
> > +      - const: irq7
> > +      - const: irq8
> > +      - const: irq9
> > +      - const: irq10
> > +      - const: irq11
> > +      - const: irq12
> > +      - const: irq13
> > +      - const: irq14
> > +      - const: irq15
> > +      - const: tint0
> > +      - const: tint1
> > +      - const: tint2
> > +      - const: tint3
> > +      - const: tint4
> > +      - const: tint5
> > +      - const: tint6
> > +      - const: tint7
> > +      - const: tint8
> > +      - const: tint9
> > +      - const: tint10
> > +      - const: tint11
> > +      - const: tint12
> > +      - const: tint13
> > +      - const: tint14
> > +      - const: tint15
> > +      - const: tint16
> > +      - const: tint17
> > +      - const: tint18
> > +      - const: tint19
> > +      - const: tint20
> > +      - const: tint21
> > +      - const: tint22
> > +      - const: tint23
> > +      - const: tint24
> > +      - const: tint25
> > +      - const: tint26
> > +      - const: tint27
> > +      - const: tint28
> > +      - const: tint29
> > +      - const: tint30
> > +      - const: tint31
> > +      - const: int-ca55-0
> > +      - const: int-ca55-1
> > +      - const: int-ca55-2
> > +      - const: int-ca55-3
> > +      - const: icu-error-ca55
> > +      - const: gpt-u0-gtciada
> > +      - const: gpt-u0-gtciadb
> > +      - const: gpt-u1-gtciada
> > +      - const: gpt-u1-gtciadb
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#interrupt-cells'
> > +  - '#address-cells'
> > +  - interrupt-controller
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - power-domains
> > +  - resets
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +
> > +    icu: interrupt-controller@10400000 {
> > +        compatible =3D "renesas,r9a09g057-icu";
> > +        reg =3D <0x10400000 0x10000>;
> > +        #interrupt-cells =3D <2>;
> > +        #address-cells =3D <0>;
> > +        interrupt-controller;
> > +        interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
> > +                     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
> > +                     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
> > +                     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
> > +                     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names =3D "nmi",
> > +                          "irq0", "irq1", "irq2", "irq3",
> > +                          "irq4", "irq5", "irq6", "irq7",
> > +                          "irq8", "irq9", "irq10", "irq11",
> > +                          "irq12", "irq13", "irq14", "irq15",
> > +                          "tint0", "tint1", "tint2", "tint3",
> > +                          "tint4", "tint5", "tint6", "tint7",
> > +                          "tint8", "tint9", "tint10", "tint11",
> > +                          "tint12", "tint13", "tint14", "tint15",
> > +                          "tint16", "tint17", "tint18", "tint19",
> > +                          "tint20", "tint21", "tint22", "tint23",
> > +                          "tint24", "tint25", "tint26", "tint27",
> > +                          "tint28", "tint29", "tint30", "tint31",
> > +                          "int-ca55-0", "int-ca55-1",
> > +                          "int-ca55-2", "int-ca55-3",
> > +                          "icu-error-ca55",
> > +                          "gpt-u0-gtciada", "gpt-u0-gtciadb",
> > +                          "gpt-u1-gtciada", "gpt-u1-gtciadb";
> > +        clocks =3D <&cpg CPG_MOD 0x5>;
> > +        power-domains =3D <&cpg>;
> > +        resets =3D <&cpg 0x36>;
> > +    };
> > diff --git a/include/dt-bindings/interrupt-controller/icu-rzv2h.h
> > b/include/dt-bindings/interrupt-controller/icu-rzv2h.h
> > new file mode 100644
> > index 000000000000..5d1e7bb256cd
> > --- /dev/null
> > +++ b/include/dt-bindings/interrupt-controller/icu-rzv2h.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * This header provides constants for Renesas RZ/V2H(P) SoC ICU bindin=
gs.
> > + *
> > + * Copyright (C) 2024 Renesas Electronics Corp.
> > + *
> > + */
> > +
> > +#ifndef __DT_BINDINGS_ICU_RZV2H_H
> > +#define __DT_BINDINGS_ICU_RZV2H_H
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/* NMI maps to SPI0 */
> > +#define RZV2H_NMI	0
> > +
> > +/* IRQ0-15 map to SPI1-16 */
> > +#define RZV2H_IRQ0	1
> > +#define RZV2H_IRQ1	2
> > +#define RZV2H_IRQ2	3
> > +#define RZV2H_IRQ3	4
> > +#define RZV2H_IRQ4	5
> > +#define RZV2H_IRQ5	6
> > +#define RZV2H_IRQ6	7
> > +#define RZV2H_IRQ7	8
> > +#define RZV2H_IRQ8	9
> > +#define RZV2H_IRQ9	10
> > +#define RZV2H_IRQ10	11
> > +#define RZV2H_IRQ11	12
> > +#define RZV2H_IRQ12	13
> > +#define RZV2H_IRQ13	14
> > +#define RZV2H_IRQ14	15
> > +#define RZV2H_IRQ15	16
>=20
> #define FOO_N N (or N+1 in this case) is pretty useless.
>=20
> Also, we generally don't do defines unless we've made up the numbering (l=
ike clock indices). That's
> generally never the case for IRQs because they are defined in SoC referen=
ce manuals. Note the lack of
> headers in this directory.
>=20
> > +
> > +#define RZV2H_NMI_TYPE_EDGE_RISING		IRQ_TYPE_EDGE_RISING
> > +#define RZV2H_NMI_TYPE_EDGE_FALLING		IRQ_TYPE_EDGE_FALLING
> > +
> > +#define RZV2H_IRQ_TYPE_EDGE_RISING		IRQ_TYPE_EDGE_RISING
> > +#define RZV2H_IRQ_TYPE_EDGE_FALLING		IRQ_TYPE_EDGE_FALLING
> > +#define RZV2H_IRQ_TYPE_EDGE_BOTH		IRQ_TYPE_EDGE_BOTH
> > +#define RZV2H_IRQ_TYPE_LEVEL_LOW		IRQ_TYPE_LEVEL_LOW
> > +
> > +#define RZV2H_TINT_TYPE_EDGE_RISING		IRQ_TYPE_EDGE_RISING
> > +#define RZV2H_TINT_TYPE_EDGE_FALLING		IRQ_TYPE_EDGE_FALLING
> > +#define RZV2H_TINT_TYPE_LEVEL_HIGH		IRQ_TYPE_LEVEL_HIGH
> > +#define RZV2H_TINT_TYPE_LEVEL_LOW		IRQ_TYPE_LEVEL_LOW
>=20
> Humm, that's a big no. Use the existing defines directly.

I think I am just going to drop this header file completely in v2.

Thanks for your feedback.

Cheers,
Fab

>=20
> Rob

