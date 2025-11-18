Return-Path: <linux-renesas-soc+bounces-24736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A85CC6A5D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 16:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA05F362DC3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D9F326D74;
	Tue, 18 Nov 2025 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OZduzgbV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B18265606;
	Tue, 18 Nov 2025 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480475; cv=fail; b=kC+NC36K/6sxKS4QxEzA6tUgJMIM892SWZXNGonqPKCv0N4go8k4lYM5PMXsasyNaolGaR53Dz7ntr9M3n83qJR/IUlTBTjysaQviS6Yn2m6yBiBQ2UduhWW8aSg4jg9WQngJLUAtjU2S8kBr3PA4ugROu5846OvEVUV5DKPbfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480475; c=relaxed/simple;
	bh=KqhT2lPycDAOoQhqelLpMhjQhTRrDF3qvaSExQ/CDUM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bom0vxEgiwGui83fqiFe2zkhu1egbbhIv2KzWYnCZ8aX4BywSMR+BNB4HNr8MRVEnezNIrgac5xYdGpmX56avHvJGFqp6SAGTdkH82nQhhSWIEvNrtaWQi33yKq1TSo/udsvRn/IouLClVuzpz9Og84mNUKK3bguYnGsqEJKY8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OZduzgbV; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=te2n8gFvkMVHprb/0um+5j9h9FnsS6nsqRGA1ebOR2lMpKtFF2FFqKErnmoIw6WXkowyDNsULrsgIUXwL+wXzyPwAfwDMIzEo6fuqvNZX8GjBLCrVxBy2ByXBQIfvPfwSZFhRMonAnFbICvdtdc6GTJyK781BlxC1FdbWJUduW+4k1RMoMjPA6c0A3UgqOsXB47lc3ksMA0ulIs0+NLqHY22lBc5TZQk/CEhymqXSgAsJWd5kgd8kGiQq5y4/Cv10HPU+zB9ESHwGLLjZRA3NZtDEFKUP5Rigz5L6Q1RqZ2RkkEUnzeTrbaka1BAil4BWxoAyRHlmaWFsoxzmStTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbGOmhSOX8/L44rtiCdKsrGGuQT+1tlF3f1ePhqGvTA=;
 b=rNBwQ1ChAymo0Rq9zgr5G5+dg5gkdRC2s4EIXrkvFA6q00nhQteatcUR7CkM7o3V+wAdRUfPDwCgrVNHsDULI1MaXj9lBEOg+HQnYxa2fUsINJdcosM3r5MQh+fHeTzUOaZDqCJMJqx0Y2hnGXbDHvuEVCoCBgtPZtoNzKz70hFDsNYZqN09oVd/Xe2o/1/QOLF2W9aVjWXamoV1RgEC5sWmZ+WjdmEEhpeJI1OcXuC6s0AptmNnzMkRuQnfLCNj4s96W45g8ilz01Fs82tKxRqnUbHuyKicfqRcPwHB1d9fFH3k99YcJpD8zXGd/oTOVzjKd+pBw5qscd3IfBKkKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbGOmhSOX8/L44rtiCdKsrGGuQT+1tlF3f1ePhqGvTA=;
 b=OZduzgbVjy76+DH1wr9EwGih+ZGUf8kfeG82oeAtUWGEgiUxOlbS8WMnvL09EuOyGuAzwqn1XnvkHARFsvfqu9i4CiWmpMdnpg1qEV4xG5zSYtZfOJOHhLDMTd/VLp0BF6Z5HEXuIEz9vBoNOpHsWlEt/gmPQmJ5V6L9toCrD7w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB17414.jpnprd01.prod.outlook.com (2603:1096:604:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 15:41:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 15:41:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 0/2] Add Renesas RZ/G3E USB3.0 PHY driver
Thread-Topic: [PATCH v4 0/2] Add Renesas RZ/G3E USB3.0 PHY driver
Thread-Index: AQHcSK+4Btzqj2Ln4kycXzTyYZLkS7T4sfaw
Date: Tue, 18 Nov 2025 15:41:08 +0000
Message-ID:
 <TY3PR01MB1134671902D8E0B6C612B6D9D86D6A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251029084037.108610-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251029084037.108610-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB17414:EE_
x-ms-office365-filtering-correlation-id: 722a6408-de3f-4bf8-5cee-08de26b8e4b5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jgDxLbLgaetHXJwokpgg13LjlWl4FJ5vjZaXzsaBwpp574rZjoe6KDbLe425?=
 =?us-ascii?Q?fKN9HbiigNzXOiHrxYB2JolN5CBwSgEpnu+1Es6YSKpiySFGNCkKJvKcskrg?=
 =?us-ascii?Q?+L/q/f1fTrrUPnt/XAKy9+3ZQD5MXqwuRoPmolDIAQSeodjEAI8S8PBIk2Ft?=
 =?us-ascii?Q?sjfOETlwMZm2Je5RyK9o7o2a8BXfMlMQ03+0yinZ8eOCHiyr4fp9+0zNGijg?=
 =?us-ascii?Q?3iKmzQyVLnVvpI/5/zXoi2HyoYluhN/qmxOqrBxwNTO37ptC4fRgfhvSZYKv?=
 =?us-ascii?Q?jT0q7FUUzjIsCVGiNcZ2eDih0lCASFxkf2xzNP290Ry+a28spb5dwEkM6G8M?=
 =?us-ascii?Q?jTEZuMEd68m9EGmT84x9y+JNWA3a+Ed99S2VLma2DVrn5Kvy+ssSmt++pBH6?=
 =?us-ascii?Q?Dk+V98672AqQFwBqMo5kZuT7vNhMy8I9dOxqcmAtUyfSxM7fmX8U/UjNbX5k?=
 =?us-ascii?Q?CJtxfXCrJlU9qh9UoxhPZJx42gzqasNlX0mH5YgSHMtDqjqoXBVGJ2xt3JA5?=
 =?us-ascii?Q?hVYVTGJV6fvmdbd0Dbd2AOaDSr2bKQoKRPBG51ENja6BE73FBxplNPv8jJFv?=
 =?us-ascii?Q?0ImqY6hvYKFeB/UVYXBUihXmgTAHKf5t3P4N9GvHxPfU1tVbMPsHgg8I2pYi?=
 =?us-ascii?Q?zz/3+oj+6ssHUEd5zTq7d6TzBS0QR6FBIgzg5gV4grTmKPgQvXi5inCqegak?=
 =?us-ascii?Q?+aEbFrMQCHayCKgiMBNNE75JwC6pUcdau022xlZ4LPgk9+LEuRed4MK7rAoN?=
 =?us-ascii?Q?v+W0NsfWunIFLRwjouJbsncW9EnY3DdZNsv9XCXf8+paeDkC1hHGXAmUKkKw?=
 =?us-ascii?Q?G0HNDar5tqkIB83a1/47sOd/+aTzntNLiyA5FXL+HGwta/5Qg4Si0JoG5wBr?=
 =?us-ascii?Q?iOf3zWsxm5e7CFzHmwUOZi4hh6cV0PSbP/2585VW/p+9OrHNYhj+hU20Pi2R?=
 =?us-ascii?Q?X8RP6WL09J7fYGUNUd5Xd/vjAV2updFHU/7Rg2U87UEcuUx/KHxQYWLUgvzn?=
 =?us-ascii?Q?DJ0Vh0Ha6do6SLLVQPSk6x2SeJQLMMpdoaP8dotV3G0sKmdp6jniSXAh94d+?=
 =?us-ascii?Q?ojPoLC0PdejYIrXVPGxjrinpy7SSularBn8vvdLnYhTlaQevpOcyf3JouGP+?=
 =?us-ascii?Q?tBbvRn7xo/pEyb5Twgu3OUNQtpyqpy1LJbY263pMi7MO4x26m4ixpcaWhxdk?=
 =?us-ascii?Q?koqSiZpffM8wE1kZOlmvUN1TCrX5SjowT3Sm9Fn4h1H7r0SerQJHa4USvm/+?=
 =?us-ascii?Q?Ihqh39yhI7pikAzWDHIqh+aS+sCGxZmezijKnleGgTP2+LHqBLMSp7as0AFn?=
 =?us-ascii?Q?s4/nOUbSvYjEDFpGI318X6luIN2ny/53Eg3GCf4ymX4ExdBabt9m1jIi3yjF?=
 =?us-ascii?Q?AGL8zWB1txMpyZRMlIfplw1YwO6GDkCb+pesylITla4TVPjyxwO+mN9lUkxA?=
 =?us-ascii?Q?3a4Z/7tae9LizxEjRWuBuL5gGuyIjjYJwPshgEdRYuYbX8sUOBITFdmUobyW?=
 =?us-ascii?Q?XVqSONM117eS6MYXBWXdC9PfTfkIFpZaYCYi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?31dDMjn8u0sBcz8TsOJs6IOxp2zZnFwhgQpGVjmUauzlxOkZSH81Ru7IFNzL?=
 =?us-ascii?Q?b/sEvkV9nzaaWsNT48HhnDofVLw9eNrmh777YOenHdT8t+j6Rji21ajuaMYI?=
 =?us-ascii?Q?PEQ4uG7yW31tlwMlF5rvIvegY9MblBT10wckRXTeG2Tby/P+o+Ift47zyBIk?=
 =?us-ascii?Q?+bZunaHlr2IQcfEVQTrrT/BrxO+2Wyg+bM63kaO30kkKMd2tNovqowBQ5O/q?=
 =?us-ascii?Q?VpZkwhVbEdmF2MDrKwZ7fC38tv0enXS+pneoh+knr7pZkVxUnIU1kH5fRtBZ?=
 =?us-ascii?Q?zV+jkF3Ghllp7PXy9E0Ix2ZC3SQcT5BR5Uy7N7OgWYzmBoCXfs/cdJ9ArJlB?=
 =?us-ascii?Q?4Ox48W/ko7Rpm09CuEtRAvYAmiLXNwZfhVUuxtB3rKsaRVuZHKJbRcw2aD1K?=
 =?us-ascii?Q?Vep08XvsrTtrFnbEcrP76dMV28A2CtQt6ogQOtNIdiqeRHh5zkOC24r3dj1f?=
 =?us-ascii?Q?syDGDODv66nEQL5/7uTGAMWyjnjjqzHecAwjczi5kEYKPp7x/cnq5SL+Yg7X?=
 =?us-ascii?Q?cdMGypwHnNLWdTv8whEnakW15A6p5HMlaJPuiQL5oBJdj4I9SDtCJUP7YOVI?=
 =?us-ascii?Q?Z3yLuDNRQwTG/BqLrAvB5Ce8jRqW5dqaJLhgHdG26UHWbHF6Roi31fmtaaTP?=
 =?us-ascii?Q?SJpOFjCA7WWkfMNZ5aIhqbhdoSUZNe5E8OClA1LL2ZtLZV853VJCCqWEb+3/?=
 =?us-ascii?Q?iXX26i0H/CK/DAF8mvGSSr7eOPXh+jyN5ORVvS6uLq/uqKCZYwa+3ycOcz79?=
 =?us-ascii?Q?bs74F1tJD5rPufpyEPxEPpim4EIGPRmhJX7Xa76vdpCmLH9QrmzR1NvoIjrV?=
 =?us-ascii?Q?9FIs1O8mZXdJrzua0YuU2dH053NfrgFk19JgVfaeffoNrvSyVE2HyRCbYKsS?=
 =?us-ascii?Q?d+TvTbNZlCBuKfTvBhRsMpUYixB64a25E7rfU7tBPXcalJTS8VOuwQMKBxzW?=
 =?us-ascii?Q?B65kMoy2qDuY5XMTTJvC1qEnNMVx6x7hPuF0w+Fwn1le7H5lkUvZpidiWiEW?=
 =?us-ascii?Q?xSC6UsJtfYNi3Bq0fYY79dax/9kWFMhmFKdSEt7iA8tVL4yiWVOUMiw/+obz?=
 =?us-ascii?Q?TNw9y4jW0xvdIVQLuFcovPMxC2R92+UCuWBBGVxd13JcAdSpm46J/dqynCUR?=
 =?us-ascii?Q?amOg85LjjD/YA0SIg8csiQ5+GWdFxOAHKlUYpRWyoKd4/o7+PucMvYCR7CkJ?=
 =?us-ascii?Q?MqIUgMhfwv44x+QMh/nO7CFI1ouy/ddS2zia4gmrWZtl2PL57reOpzq67Jr6?=
 =?us-ascii?Q?52d/Red5RjzZjnj+U9YZT4Yq655dgNmilP/2FmlYXUEWWMf2tg4xgo4CqHuk?=
 =?us-ascii?Q?TUCo2AmCaqOT5EJ83ItC11qMrc2lY3BxL7Xx/MK7rS+OfPmYIdL/DZazIza0?=
 =?us-ascii?Q?wVrGqTl8kH1LFwtOzXXCUfcML+OaFeP3+FTqfgikN4/UnwM5uV+m7G4sM/06?=
 =?us-ascii?Q?yIJHs2nuqAfbMDfTVo9r5ijDnXiU2Qn+hAqux479woG10xhW/1rtt6ExThEF?=
 =?us-ascii?Q?frMfiWJ0s64BPHt00Uk6hoCNWsfPkCci+qSWRidm2KnufjxMGRrdp5lGGgPE?=
 =?us-ascii?Q?Pj378ImHiyJCUe9PMfjWLSgc1HwkUMSNjm88wPl+v6vyrEmVWxyC8qEJlkR4?=
 =?us-ascii?Q?Pw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 722a6408-de3f-4bf8-5cee-08de26b8e4b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 15:41:08.5516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZG1BoVH1dnTCvpG0wdKHwF+jQYGUbY4LczsiBm4tzoeVuX6/57Hp4fXAivhMxky3wULYMw2qe280/GBTlKui6N6LQJOyViP4maJ+jKzC8zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17414

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 29 October 2025 08:41
> Subject: [PATCH v4 0/2] Add Renesas RZ/G3E USB3.0 PHY driver
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> This patch series aims to add Renesas RZ/G3E USB3.0 PHY driver support.
> This module is connected between USB3 Host and PHY module. The main funct=
ions of this module are:
>  1) Reset control
>  2) Control of PHY input pins
>  3) Monitoring of PHY output pins
>=20
> v3->v4:
>  * This patch series split from[1] as this series can be merged
>    without any issues.
>  * Collected tag from Geert.
>=20
> [1] https://lore.kernel.org/all/20250916150255.4231-1-biju.das.jz@bp.rene=
sas.com/
>=20
> Biju Das (2):
>   dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
>   phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver
>=20
>  .../bindings/phy/renesas,rzg3e-usb3-phy.yaml  |  63 +++++
>  drivers/phy/renesas/Kconfig                   |   7 +
>  drivers/phy/renesas/Makefile                  |   1 +
>  drivers/phy/renesas/phy-rzg3e-usb3.c          | 259 ++++++++++++++++++
>  4 files changed, 330 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg3e-u=
sb3-phy.yaml
>  create mode 100644 drivers/phy/renesas/phy-rzg3e-usb3.c
>=20
> --
> 2.43.0

Gentle ping.

Cheers,
Biju


