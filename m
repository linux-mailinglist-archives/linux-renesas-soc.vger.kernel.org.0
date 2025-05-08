Return-Path: <linux-renesas-soc+bounces-16805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF393AAFA7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 14:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 609833A7905
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 12:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8836A226D1C;
	Thu,  8 May 2025 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TmnRoavJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74364B1E6E;
	Thu,  8 May 2025 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708674; cv=fail; b=PhzqhrwLhhG+lM2ZpVKbxUZ+iOkaOsUZRm0Ndu6MjeUMVmfIl4Z8oLVsHQEUSfkL03ofqkPcneBu5fble8nBHdM1JhL9DoxDtsgieNbRb1P6Q8Nyv51REvvdcnH3WjkW3AENcR/dZ0Q/uCu18fqVr8D5whs9NZtYnOV9J0rjTMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708674; c=relaxed/simple;
	bh=uEvOtbUVSDW/rI0kVuqmUuLEKjHX2Af6Gos/SlHvKQE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t9rFvZjnbJ/tYQndq+suWBObO0yEFuNxeGQuteVHs3BhWvM4QkJJXBgdgyY8aBgpRgogUmVOii5VxlvJYD9SaBNvbLMVrG88cgr2bnZOLo3EQWTz7HCvPWklHuMhe6diPd2fki52isTqIT7ieMdCD6HrUVKajKNSVBtBmNA95Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TmnRoavJ; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gg1bEJYu2aIVRNv49IS30Y2e30E7oLe8mR3G5Cz12WZPRTAstzHjHZLpIc8px5KzDaTNCUSDQkrnF1LPurf13DR4i885zxCrKUqabIRBq3/reokjX9Y4rGxmQW3DEIdCEXO0dIxTRBtXinHEVngnBa+gU895c/eJHDJpPsWsqq0uRgsCH/ij6a00ae3J9IRh6UIrlSf8jqckmCHo+TTSmOgJO0AVGUnne/Rpoj7I+lMiYLbRcHcugSjbw/fUHidpOQDHuTUjALdOivsj9YcgguQw0aRhfK3WB6ZpDQRqhdgW6/Pxv3p84VkBPEvWhqMBmrTxr8FPnc/sFvuysyi0rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kRS24La6Kr3x3sWu/31CLSTICRDZQdFqgVkdJg9yvY=;
 b=x1kVe5ZJyVJDp2KYT3aCHeKTJtFEXzYQeZT1S2v8W9qGwkGOM/5CtpckOolJSvDEBBAiGxr+xwqx5O1NMG9Rc7xLKycrekCd93ypCIh6wHh9FaXjdbFc39NHlcGu0DWh58KtMtQ8o25TrQDYCpBAxv5dU6ybQ6QH7UFszO+pbkZ9z/wkl3jCBgWJo3h8Fyqgg/TghIBrev9iHjbDgMkIfT5yV4MyxtIYBj41miksCi045r4CI+RlH1xBWJIjIdOSL7zZg8wP2rGU+oY6+3rCpw4qFmuJee62YH25VXrk2WfiWAfoUIFp8ZXFXQQMRboPIusNUT80u9C9MHwOLfsgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kRS24La6Kr3x3sWu/31CLSTICRDZQdFqgVkdJg9yvY=;
 b=TmnRoavJmyhNj7/23lV5UrZbjZgJUKujejyaecZgf55kkEMMRV1BinOqrujv+O8ahdBg/LlCX8pzQJv/QKrWfGFuWNajPJu6JUEIjt7q9jd/dAktUz1nGPMp6iv7SMcQ6Kzei4IalOsOeXxpOSnqPKOcZqKaVEzYpZn7J77L6WQ=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS3PR01MB8763.jpnprd01.prod.outlook.com (2603:1096:604:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 12:51:08 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 12:51:07 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Dan Scally <dan.scally@ideasonboard.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>
Subject: RE: [PATCH 1/4] dt-bindings: clock: Add macros for RZ/V2H ISP clocks
Thread-Topic: [PATCH 1/4] dt-bindings: clock: Add macros for RZ/V2H ISP clocks
Thread-Index: AQHbvoBEWH6FWyn/hU+j8+GHquSvf7PFmATwgAMUxYCAAAJiUA==
Date: Thu, 8 May 2025 12:51:06 +0000
Message-ID:
 <TYCPR01MB120936D952DF916B0DFE44B60C28BA@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250506121252.557170-1-dan.scally@ideasonboard.com>
 <20250506121252.557170-2-dan.scally@ideasonboard.com>
 <TY3PR01MB12089DADE623A195D184FD5BAC289A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
 <502e185a-a632-476c-8712-56e845b6ca84@ideasonboard.com>
In-Reply-To: <502e185a-a632-476c-8712-56e845b6ca84@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS3PR01MB8763:EE_
x-ms-office365-filtering-correlation-id: d223d6e7-3570-4c59-014b-08dd8e2effed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1ePiDLo8eQzI33yrhgen6wrAPzZj8UQTI2JoJ1ao0wOsr5s0OVTgBICX2x?=
 =?iso-8859-1?Q?2iIbbGyswXTWLs5v8aaf5K8X9v++YeLvz8pZVgmJbgCW2/GPGlrJKDEWfp?=
 =?iso-8859-1?Q?E8PcxPPHbfNwCTswjHBVdyD9WT0IrfLLy5VgeiPS54uC2GAncmeMmDTObf?=
 =?iso-8859-1?Q?PQiePsAbaVe/XZb3a/OaEfjfUq/iAKy8zrI0vh5W6Lbr+mv/SdlNad5ySZ?=
 =?iso-8859-1?Q?fKRU9yCSFdnUxt5RaSk5ODQGbQZateVZ3bqNW/oCh/25C8t/2ak4m2ZnMe?=
 =?iso-8859-1?Q?3wBbLULksr43BHMgwYHsfV+e77g3cOl4PB0xD/hQzocf8yn4cJLSYBa988?=
 =?iso-8859-1?Q?f0zBWf279K3xqp1EdKjCJAzpH5PlB2Nw6brsnk0eSI1QMf1qCN1BCS7grv?=
 =?iso-8859-1?Q?8t4kaYaS84beWdPTSey25wdwrwMt+A8gqtEaavnP8ClEHU2Vfs7R/4qBAG?=
 =?iso-8859-1?Q?ha0kPu046o9Zm6ghSjYpdr/VHKm4VAS/PD42+ZnyEU5Gmr8Ko5Bb5XARZF?=
 =?iso-8859-1?Q?rzg208euJ7k8kqokpcfFfjDXHzAsAj2UlatLp0KhqHnwVMXd/V0x6F4a3r?=
 =?iso-8859-1?Q?G2TXTaiXPeyQ/0sCZiUU162fx+s/dVwY5dls5y8vCYXRfTlpG3+hjX6ezP?=
 =?iso-8859-1?Q?kgkY8lib9kc6AMshRmkIsjv/JNDWEr6DLoSwbmd4OM44GDUmXVhMdoCmnS?=
 =?iso-8859-1?Q?qCYVRP2g/X6WorOg1uXa/wdsmowFIDr8az6sV7ZDwAAItm08rSS8G/tTm3?=
 =?iso-8859-1?Q?0pcTi/zYfgSB9xwA2u7gZLdy1TvYH1lM3cnbhk2oVGWZEtYCAGEEZR7sbd?=
 =?iso-8859-1?Q?Zil6WrYVfViEMpG4UFw2SRTciUqCSfjUWlEKeXMEKieyFO48x3ZPTS1Qz5?=
 =?iso-8859-1?Q?iSnZylK/0yFkD73bDJcR0ROSe/Io6x1ENogjB8iivpwHNmTTASLFj2bKev?=
 =?iso-8859-1?Q?7rt436+cXkuvKHoL/D1OsAmYRmlFBHuSLdHOZyiatP99IRJ/PI8yP840I3?=
 =?iso-8859-1?Q?IIMUK5ou52ku0GiykcqpGkMDGAYV5ZjIrO4+n5Rgjf0xxW9qrudD0jvBW0?=
 =?iso-8859-1?Q?o49eLpP6T1EJo2aOOtb34V+NgWNFHoE2HblUwY7sHdaZRaQY/aunTxJDNH?=
 =?iso-8859-1?Q?cFSY25i6DrOL9HEODiWKpbbb30DKvW7ZW0LgG9V5XqqzQ8cXjFK3ehSiAB?=
 =?iso-8859-1?Q?6hsrgrMVmoqoLPJj39hHwik7JGI70GbCHZAFNiDVwEqZKSEk52M/VgbxvP?=
 =?iso-8859-1?Q?xa8qeM4+B66pGnLO2J5Sr4wNeqq8ui8HbSjpc1VEEBjn0cwju5KCRBliLm?=
 =?iso-8859-1?Q?lOsEVyQ3KEBqgoV2Yy9zbl/apJ1rVFHCuIaNJ9HIMkQJZY7YYT4eqDgxje?=
 =?iso-8859-1?Q?rsxKFfmAwid7RPNQEC7hYFFt+XUdTXKiKvhsoHepvTovJ5qFhz0msTAtsI?=
 =?iso-8859-1?Q?9ThVJyujoAuXwLhscZ7Cv/LQg4+FDFL8GZ1GJ2IuQ/psfaQydTHX9QWT64?=
 =?iso-8859-1?Q?7dArvsXm3CLyAroaONLYl55fZl02cUgeFcniPdDT3D0VThn3/Kr1bsOPZH?=
 =?iso-8859-1?Q?BaovhKs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?39ru5+dkA9+K/9jleNJXmIsBpbse/0gVrnWZBwvrNvw8nKqm5azztlG01z?=
 =?iso-8859-1?Q?Rr6FtSZcZX8APafRBRVZXrJuq9VRYasNW0vnVSWbTWYcnm1o72p83xwS4s?=
 =?iso-8859-1?Q?GM9kpHAe4gScsJVG0SMbLdTTJXG8BNWrgmsBk00s++uE4+DPkq5yc5QR1c?=
 =?iso-8859-1?Q?OXpWEXUMw/2rY8qDsZbYlkf/7kQszW7V0zMJBSPM5KFtHGk9NFlHmAD5tS?=
 =?iso-8859-1?Q?PAP/vgD9ozyA31lmxb7CWqMzRA9auaHNcTIE3abJEACklideP9W0lBQ4JH?=
 =?iso-8859-1?Q?sJNQoT9UZx8LGqD9MgDv9jh0YHxy89XQPWNeL2HEqsUm4Zr7WX1On4+sJF?=
 =?iso-8859-1?Q?ozBwG7PA5mHnKTBLTWGgh2c+ukMflXjpBfEcW+TfQiOdnRB7M/gq7JZs6V?=
 =?iso-8859-1?Q?5h/07ndfLhGSbyV5xUN/clOAermMstHQ3FggqeQ6djlTqhXIBpFE99+G3j?=
 =?iso-8859-1?Q?s8aZ36E2XSyvarjpBopvoGG0+JUJ9ojqUKJvyaNcx0UZ2uPy7gZAB2uDvl?=
 =?iso-8859-1?Q?INUc6PMOpAPGOFaYCl34ytj316eCv3jbI8c/bb25HedRQAkLA9CVyvdY+V?=
 =?iso-8859-1?Q?TwT2x3N5RK4Qz/2EeNnuummGuEZ5VYWmzDetreWJiGGZOULmS7UT/2fkTI?=
 =?iso-8859-1?Q?3AvjF2pMJpbfMJYuEdby0GnyJ98tT3M5BnVNLTT7g2jUNnGOGdVk+NKlMm?=
 =?iso-8859-1?Q?4y/EaM0PYXWQHOv/bkGxfctGZQOCJBJUbx4GcZIjFhO0Tu1d3icERWU0eg?=
 =?iso-8859-1?Q?VTVHT4tXlJ3h/54qfb9A9LpK9gQ6/XRcIs7t6mbt2Sb+5Qt4H2e0j7h6L4?=
 =?iso-8859-1?Q?UpDK/FeIlJ40Ib6aSqO2IOoO6GQj2UkjGn7HeVo48ujv3UefQtIn7Yozj0?=
 =?iso-8859-1?Q?FbGgW0gEN9IuWDkvXI1i5vAmvW/6yFWTHElSL6f1PgZl5UWKhgy4Zp6/RF?=
 =?iso-8859-1?Q?ZCa4E2V7QxX5zFeCmkXbhO7Jdx3TGhgAcNkQdZhcVOwxyn4RYW9pgyeAG2?=
 =?iso-8859-1?Q?9+HEpcWGKoBVeFvcahciXuYXpFm7zQOyN3MhXsuVh6mzZmjTXgffCsLmLy?=
 =?iso-8859-1?Q?fMjK5RZ+dOWFacmfY7SbI/GPosABZLYpRFJuIIv8l0oJdUL0oc4oQX52ey?=
 =?iso-8859-1?Q?37n62VFA/aGc8tRUR8FLyuD6qDcMK5JkCUznfKpQul2oNSHkFuxIUPEqTl?=
 =?iso-8859-1?Q?BDWhOBDfVVKmf8MO32sb3tKFHf4CRfpmWpRSTPc5qFCQ0+j35tsalB6K6T?=
 =?iso-8859-1?Q?pJYqC3sQkCQ+rSk6X5hg5BusvwyH0EOXOnB25LcjFYu+fkHU0kN6fNce2X?=
 =?iso-8859-1?Q?psAf1oY+QxUbt394eQdUMEdflxJEDgTNPQvdw3MSRepRHmFa9w/wyC1cQ5?=
 =?iso-8859-1?Q?jIyGacCJhFiWVSCXOG3F8ixPQGApatN/2uNHDEOSdu8tmFIxNUNFvqdO+Q?=
 =?iso-8859-1?Q?QdUlV3OoPBlgRt2nFhDh3/CMyImvU2gme8m7f3MyivLYBf4B5PotAN4NP/?=
 =?iso-8859-1?Q?zLHhz9WYgj/ObSdBo3XEq5twgDXuVZAlh5V5A0t+JcO8zcXvlfO9Em54+z?=
 =?iso-8859-1?Q?qIW03R7LEM5I8fiNn41A+6vRk0ZJ0LEWkptr4eZ96A/rggkmeYKr8DJVWM?=
 =?iso-8859-1?Q?jzbCDM8U/wQYKTg/aMPqSph9dp76Vj+yWnNHuU3yYOS4RAwCvHh3DPYQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d223d6e7-3570-4c59-014b-08dd8e2effed
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 12:51:06.9605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3/ULmUZ5KMoQyAuGii5yyqE1towlJpmpF0J0/EM0AtwMKl2Q0CG2E4d11O1GBxkKxGLYgbJ0oLLRM1xBERIVVDfWD7WputdZmsnLR3DdvEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8763

Hi Daniel,

> From: Dan Scally <dan.scally@ideasonboard.com>
> Sent: 08 May 2025 13:30
> Subject: Re: [PATCH 1/4] dt-bindings: clock: Add macros for RZ/V2H ISP cl=
ocks
>=20
> Hi Fabrizio
>=20
> On 06/05/2025 14:27, Fabrizio Castro wrote:
> > Hi Daniel,
> >
> > Thanks for your patch!
> >
> >> From: Daniel Scally <dan.scally@ideasonboard.com>
> >> Sent: 06 May 2025 13:13
> >> Subject: [PATCH 1/4] dt-bindings: clock: Add macros for RZ/V2H ISP clo=
cks
> >>
> >> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> >>
> >> Add macros for the RZ/V2H ISP clocks so that they can be referred to
> >> descriptively in the drivers.
> > I don't think this patch is needed.
>=20
>=20
> Ah, indeed not in this set...I've been using them in the devicetree files=
 (not the drivers as my
> commit message says) for the hardware that consumes the clocks, like so:
>=20
>=20
> isp: isp@16080000 {
>  =A0=A0 =A0compatible =3D "arm,mali-c55";
>  =A0=A0 =A0reg =3D <0 0x16080000 0 0x200000>;
>=20
>  =A0=A0 =A0clocks =3D <&cpg CPG_MOD R9A09G057_ISP0_ACLK>,
>  =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 <&cpg CPG_MOD R9A09G057_ISP0_VIN_ACLK>,
>  =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 <&cpg CPG_MOD R9A09G057_ISP0_SCLK>;
>=20
>  =A0=A0 =A0...
>=20
> }
>=20
>=20
> Do you think they're useful for those? If so I'll move this and the rest =
patch to a later series
> that adds those nodes to r9a09g057.dtsi

As you can see from Documentation/devicetree/bindings/clock/renesas,rzv2h-c=
pg.yaml,
we require numbers in the clock cell for `CPG_MOD` clocks. Therefore, the a=
bove
snipped would become:

clocks =3D <&cpg CPG_MOD 0xe2>,
         <&cpg CPG_MOD 0xe4>,
         <&cpg CPG_MOD 0xe5>;

We only require bindings for `CPG_CORE` clocks, but the above are not `CPG_=
CORE`
clocks.

If you have a quick scan of the SoC specific .dtsi file you realise that th=
is
is consistent what has been upstreamed so far.

Cheers,
Fab


>=20
>=20
> Thanks
>=20
> Dan
>=20
>=20
> >
> > Cheers,
> > Fab
> >
> >> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> >> ---
> >>   include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/inclu=
de/dt-
> >> bindings/clock/renesas,r9a09g057-cpg.h
> >> index 541e6d719bd6..cb2ccd9068db 100644
> >> --- a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
> >> +++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
> >> @@ -17,5 +17,9 @@
> >>   #define R9A09G057_CM33_CLK0			6
> >>   #define R9A09G057_CST_0_SWCLKTCK		7
> >>   #define R9A09G057_IOTOP_0_SHCLK			8
> >> +#define R9A09G057_ISP0_ACLK			226
> >> +#define R9A09G057_ISP0_PCLK			227
> >> +#define R9A09G057_ISP0_VIN_ACLK			228
> >> +#define R9A09G057_ISP0_SCLK			229
> >>
> >>   #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
> >> --
> >> 2.34.1
> >>

