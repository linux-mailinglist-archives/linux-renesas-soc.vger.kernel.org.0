Return-Path: <linux-renesas-soc+bounces-27456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD1VO83Td2mFlwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 21:51:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C68D4CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 21:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44A963013D52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 20:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35942D839D;
	Mon, 26 Jan 2026 20:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HgcbBpmv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F182472AE;
	Mon, 26 Jan 2026 20:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769460500; cv=fail; b=YRVm3TSHsc1dhHL0lu/waS65sAZdbC+1TGvG923SG9fB4hiKD7wM5bf7Y+4x/EPx1xs+SSRlUwHvyWMVhJJsTfBZQ4UIg76qA4VaO2Gl4ufL7JEDLH+ggZIzUGm32Dkb1g+WpvqKsQWrCIaK29VDiKfuINIj2XKfd9mFR6uoOgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769460500; c=relaxed/simple;
	bh=XsuPbkTqlzyO3FVYVv5yzsSe5EiYpR8vTlvP6P9swR4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eepMw7aghViLB3nG31VgOykKA0sSMpNSeS0SXUBmo2pmJS/icIP+1gRc+GfId4vpFy4gJvSZc4xKlTXNwNcTCdEDI4c2zerZz54i4ojyC5EwVPQILEweiJZsqqsO0c6hDhI7cp86T70BHxqij+rHfUUlf1bCCfMn/XaN4mDj1gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HgcbBpmv; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxLEAo1cEffntVKySNAC+6RfW3zfHuPunWl9K8uQyiCMvlrlUItKS+aBHEeTdPefeun2JcxHS1/jflkxuJNafM7oW4NoJI6rpp0+yTP38IiJTuEgPSIlUbE/cw1ZVbyvDZ2e1o4KbNxDd1wnZ8Y0yByLdTroVXDl+qgVoKaOBcu1CM+feWg1yXbRy0Yu4V6ZYNAf8XUOY0GpYqbl21UD5gOdHws+/9Bl8pFwnux++heb9gs4raxSpofS3ccz6DkuKbSJZnHganrqI25nTI8kHgJ0NsejyNF1G+CHnzDoYn3jxBkUZWIrDxm1wIg5moM1hvh9DXIYAVmN/YIEV5VaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHZv3fx00OiUBGcXtfrhyuUYWvW/PgHCi9fsiw9wpF4=;
 b=D4Etq8pL+Yp1RB8XOA4oCzqSIj0n5rjhAa/0zzqLigWSd/1TWGpfNO0YDoNvFh3c3vgZD2CAsojj4P0gRu1kMOZdabcVfQelP3NFhu/WvLXvS7mTYetxYNAxxBASI06U0lXimobWKzKARvZrnnHyNhZ0hZnbB0mL9WmRty7yVhdjHe3ZNGxBqOzgMofFHvNL7+4anhu/coxOSRE3GNt+JvrlJ2GNpfEUielIxOt2izwVz+GxCdVkGgKu/7MlsfFRwbjIvcx+x9hfnkpnDRPt0uCQSSDd0WyOKJN4Ci9iJ7P+R41itOOvDzDRpPSlJXBDqYQx9pN5K92k7MLk0Qm3dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHZv3fx00OiUBGcXtfrhyuUYWvW/PgHCi9fsiw9wpF4=;
 b=HgcbBpmvokrH/VpWL4DxbaX45auRg1XGOhZpOWj9cfW2XU0gc3HqfzjHoR9VgaYzT/2Zhut9e2w5jxdROqXGw6gu4XOPNY0+ms/8KIjROi8NLBM0LqzQOKr5J9ZZM4YejPv2sA1xyt+Crd46ZnLZb8cPqKuHOXtQwkp18AfNlDU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6588.jpnprd01.prod.outlook.com (2603:1096:400:e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 20:48:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 20:48:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 12/12] arm64: dts: renesas: Add initial device tree for
 RZ/G3L SMARC EVK board
Thread-Topic: [PATCH 12/12] arm64: dts: renesas: Add initial device tree for
 RZ/G3L SMARC EVK board
Thread-Index: AQHcigutbfR6HwEZCkKIhdHmpyCanbVk5hoA
Date: Mon, 26 Jan 2026 20:48:13 +0000
Message-ID:
 <TY3PR01MB11346054A682D32AFBA0E62EE8693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260120125232.349708-13-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6588:EE_
x-ms-office365-filtering-correlation-id: 561c8493-82ab-459a-8409-08de5d1c3930
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3QjgmHV71zVTMyo62rVk9FEOH5qP78Ts0qjMGywMhZXLBWU7lLjNdb+Ls+4D?=
 =?us-ascii?Q?FQ76h8+meLtCQCPKN/MzuLTxjaZ2A6Ho7tNJrd3yRd5Yw75Jtu79JSHJSWxs?=
 =?us-ascii?Q?zNt9qW4ZeYEQFpDtd7vEUw82tDyO6VbDnSJtVhF5xQmLaXqSqGVyY4CMAmAB?=
 =?us-ascii?Q?iGbthxAMit20wyRPF9jK2DzgJu6gOqRh9/4WTZ0Nn1LKROI1KePjA/MVlfv4?=
 =?us-ascii?Q?pNWIg16JhONy2BynxzKac0IHrn5qxff0vRHNZ3g3BLEIYX954RC/83uIRUMN?=
 =?us-ascii?Q?BRKCiuIHLVwBjOV2n3g3FwA3dCIO3SHtboUi53gZrFluLXrI7l15XLAHS1AS?=
 =?us-ascii?Q?4X7yEP94RQjZXvsy0K+5JcfsqXt0YdYSbOAL2eF7BGL72ipxFDENp25yVM8O?=
 =?us-ascii?Q?IPUPKNZ66/9p9nxWVpFcrZJpVgAJLIoepEsn0gipP5/y0ZDkWQqJcIfnmXLA?=
 =?us-ascii?Q?AAY3zMe3Cvokf5U23b4RLFL5/Jf+xxat9fyASEbowU72aiIXxIKIdOQ85WDm?=
 =?us-ascii?Q?acFCVgm70DeLa4sRMfFYvQ4tAFzSub4dXklUUol4QEFDf6tmTkQzZiJqpSm5?=
 =?us-ascii?Q?pA6ERt7eV/DO5jBTf6+M72KeO9xPKDNwfqHPDvGUMRm7921wASsAhiB3xNsT?=
 =?us-ascii?Q?iFU9rLQFFINi7/y6RFT/lN7Yw6u2YNiKj2Rf/auM+/JSsLEWe59KbzZzoutF?=
 =?us-ascii?Q?JZN6Bw1veTrxH6CdwTytetl0otSeCJd+mpcqOmue1GdSIhRJBknkkaEpZFU+?=
 =?us-ascii?Q?iMqbn5nP1G7r1rADPxR1ob9Absh57isqd+gRo7fEqL6Hn167y48MwfQFIFTT?=
 =?us-ascii?Q?A6O2L4bhfwXuhR8hK9+zf+5ksNVVaF1nOCi11zhLv2AIk6f90URE4XYFEp9V?=
 =?us-ascii?Q?UKiXp55UBOGquUpzndMTsMFZut6QXBJnK2w/neRQEwU/JtBEOo1l5lWpGPcB?=
 =?us-ascii?Q?5xxBVLA3sEtiZq2rW2LZ/jtmv8WBN2B9vl7TIwdBZdbFnR3j7NEoLC5Fqa5o?=
 =?us-ascii?Q?EcF3PGDOqwiVOGSwXqVbn3/4CM4lnxQUr7Tw1zTxgV26G02zzILirnxMa6Wa?=
 =?us-ascii?Q?XdGt6trLXBHYS5lVPXb3r3ljj+ANFq5d+g9/Ulual5ZrTkaVEe0lowc++u1n?=
 =?us-ascii?Q?gRTU45bSR6/7ER7cWut3e0HyHeYKr4ER7sC0tLlEHNJVlA9tT+noAdsebDaP?=
 =?us-ascii?Q?UPEBV/s/HeOifeLOga1B8YGuYfBDUygjWpczH+tnS4y7QG3NY6IenkHdkT//?=
 =?us-ascii?Q?kFZSDzeTbgLXYjC2xhzx/OeYCx0CcQOaIycapqRm0yCxTJwMD0aVE29l23YM?=
 =?us-ascii?Q?f0GOpWdGECj21Q5GFJ6ewGjQgID8u/NGfRZkSosZ2SfJGaXeks2rqIwCGw55?=
 =?us-ascii?Q?Ps5dsv7tZUGXNZgpipOTEgae78hcPs8w1g+iuElzumnHTYq9yo5aeJPO9kGt?=
 =?us-ascii?Q?v3nHmUbK1Os0Ha+gw4vEAYaTWHJZggNgaXStZtFq5tUi015cHgtwB7qg5cm4?=
 =?us-ascii?Q?w+Nx36bRlgVKuuYtZkmQgmFmBc/KjoVZIupm3gaKuwOfWEQYQxbROZtfPgbg?=
 =?us-ascii?Q?30Afvs9Cvxep35ymepSvuBgOPir0d4p0MCqsmWzkTEy39uiIUqktLRhZ6rCK?=
 =?us-ascii?Q?j/OIhf5anh9uMNS0t/QG27g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hcd2aLfQwK0l4yTkP8VS3SkL8EtJZ4doUVbsZ+rHO+vHa76P23ONWrMJXSyi?=
 =?us-ascii?Q?t6d9jNonL89GPHeFqr9UeDHnjSCvKqlBrbJjxIFsnyZYPd+4nJKuJBXnfMMy?=
 =?us-ascii?Q?J6z9pyHjvsWYcCTxp78BZX8DYNXGto/mYr4b/02SlySNA+ujWgqqshJB7RK6?=
 =?us-ascii?Q?nVkbrbUrjMwBLCh1KQjjsphTt353n0iIKhkENlYpnS0fiXx/12DILIBogsSu?=
 =?us-ascii?Q?i7HS+/olMBEb3qgwR3nP8MTDXPkNuMZPz1VNJ9zTEs39z2zMNf4sdQ1KVNUY?=
 =?us-ascii?Q?eUOh6fV3F4pTPA929z/rlKjnSgNCiN1W3z1n4TJbfZ9hMZrsVbZQnQ3AMgHw?=
 =?us-ascii?Q?s7D0OfRIiIKWKUNll9HZVbMuzxCP7xlBZcTDVwM00WfKURkec6ys/hO4rUju?=
 =?us-ascii?Q?0q+tUciNjOhNacuXKr2CpvlfAPCJ9po4AGEPWZYhu4D4qNkAO7E2OiD13eO/?=
 =?us-ascii?Q?kVNXBC/2MXqccZ2MdXr3v5FnHoXLKxUSDX0RS7HIvZDEMCVIaXNK08rj52p6?=
 =?us-ascii?Q?S9I0ZvdTDw9waWO8k5v072l5od+r4e3NVC95kUPYDIhMChpWpCsZIyA+hfru?=
 =?us-ascii?Q?3Jf9LQZIqpca+DsHA0aQu7ozW/FE0piS+PRMFPetSWifn+wCfxXoRDpwMEOB?=
 =?us-ascii?Q?cp0ifDgj4NgS1+bJBcRua3U+4VsqsE20rTrX/KX9jzAW4Agv5I+1Q83zTfn5?=
 =?us-ascii?Q?ZIILYlvZE4ln+66Ltq3lkz9So3ZcVq7vSBl0ip1SEEgmV0pRMqVgyxezwHUl?=
 =?us-ascii?Q?8xVeF4p/FyevzXObUaEsYn3EwTM42NSfN08nP3H0oqlXAwB39yuAB9Lhw6z9?=
 =?us-ascii?Q?UUKtXJstPq2Dx4B7MbjEscP3O7SlwEI6f/c4nsNWMskU6EY2ciauEgqjiA/D?=
 =?us-ascii?Q?uhxCiNz2MZtw7bMd6S2y/RAiXAIFUfVxSwtIkoMZN7QkoHtgp8XMrmBPeEMu?=
 =?us-ascii?Q?X/W8TnnxRtFL5Dd0wcWhHaGjZlsiy6ulgX50tr+8puaAQsaRCULJ7RC4rP1d?=
 =?us-ascii?Q?qh8KSMZvdA4BQcwABX9TIhvIvK9unQ1n8a8NmDr7fUgqNwHUcfLm3E476ckb?=
 =?us-ascii?Q?UE7mkcN3DK6Aib9qANIP/qhqOIlVbKGiWSytUj1uwB4dEP2NQyyb8Xh2/n4C?=
 =?us-ascii?Q?a3RGAtaAF1eYItOrVfTO/7EZ4aGfnE13yqy0chPzdNbXpolbG7S5IGb5Llu9?=
 =?us-ascii?Q?VhLT+TVZ6ZjwWUu8Nut++YcTZC5ccVU/lMgsDij4Xrj7l/VNaM0UcXcvaeOi?=
 =?us-ascii?Q?2dS2rI0oS08RuupjOOUQbKM9lUQfdStF5DCz2IEoK6HUMc+tbTfEotx+jLzV?=
 =?us-ascii?Q?nh6drriqVsqkdaFvIvt9YX0ciwhEVuyLs/dT5xeMyFdC1a98gDjeffi4YPxQ?=
 =?us-ascii?Q?ke/Af/sbCO92QU9n7ShZaFY6NnPxww1NypSZjlxOdKBrEAAy4FGiV2JOEQmK?=
 =?us-ascii?Q?ANCSSS+sNucX7vYgSxpedvNiHFoqFR14fty8552mejLHtNOiLPJWPtFPQUG6?=
 =?us-ascii?Q?o0G8t3SecUXBcaZJwD+9bUxuhqrg/DBqWyffVNsknJNGC/2+xPSgd78MQ6lC?=
 =?us-ascii?Q?w9+AHZHqPIZpBNym4z2B+dlLAYxdLKw6diYFYnEl3H/S9yWCUtptS0/jz8ph?=
 =?us-ascii?Q?vu4WQSD/yoSgsd3PCq9PMIMwOjZk7Akt8WyeiiCFOMvhukuyRcD+gfNeC5WT?=
 =?us-ascii?Q?1Zz1XPMZ3bnXS1fHWP7awPNx55hQJj8y5ihTpCCkCJLW6A1ah6pDLXB5sj3D?=
 =?us-ascii?Q?x6k3DWEPcw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 561c8493-82ab-459a-8409-08de5d1c3930
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 20:48:13.2612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8kVUJKe+qQwVIhiCYGb+2gWXIa0KtZvIYr0N27qDBdW0FqZzRXvknaZpVGP7MsHBSG8bMeu9HcEO6YD+WDHt+DVARNWsSLIttlEOXm+IqlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6588
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27456-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 502C68D4CB
X-Rspamd-Action: no action

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 20 January 2026 12:52
> Subject: [PATCH 12/12] arm64: dts: renesas: Add initial device tree for R=
Z/G3L SMARC EVK board
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add the initial device tree for the Renesas RZ/G3L SMARC EVK board.
>=20
> Added placeholders to avoid compilation error with the common code in ren=
esas-smarc2.dtsi.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  2 +
>  .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 41 +++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
>=20
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index 1fab1b50f20e..0153e772c231 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -179,6 +179,8 @@ dtb-$(CONFIG_ARCH_R9A08G045) +=3D r9a08g045s33-smarc-=
pmod1-type-3a.dtbo
>  r9a08g045s33-smarc-pmod1-type-3a-dtbs :=3D r9a08g045s33-smarc.dtb r9a08g=
045s33-smarc-pmod1-type-3a.dtbo
>  dtb-$(CONFIG_ARCH_R9A08G045) +=3D r9a08g045s33-smarc-pmod1-type-3a.dtb
>=20
> +dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc.dtb
> +
>  dtb-$(CONFIG_ARCH_R9A09G011) +=3D r9a09g011-v2mevk2.dtb
>=20
>  dtb-$(CONFIG_ARCH_R9A09G047) +=3D r9a09g047e57-smarc.dtb diff --git
> a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dt=
s/renesas/r9a08g046l48-
> smarc.dts
> new file mode 100644
> index 000000000000..988b1f96228f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G3L SMARC EVK board
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +
> +/* Add place holder to avoid compilation error with renesas-smarc2.dtsi =
*/
> +#define KEY_1_GPIO		1
> +#define KEY_2_GPIO		2
> +#define KEY_3_GPIO		3
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "r9a08g046l48.dtsi"
> +#include "rzg3l-smarc-som.dtsi"
> +#include "renesas-smarc2.dtsi"
> +
> +/ {
> +	model =3D "Renesas SMARC EVK version 2 based on r9a08g046l48";
> +	compatible =3D "renesas,smarc2-evk", "renesas,rzg3l-smarcm",
> +		     "renesas,r9a08g046l48", "renesas,r9a08g046";
> +
> +	aliases {
> +		serial3 =3D &scif0;
> +	};
> +};
> +
> +&keys {
> +	status =3D "disabled";
> +
> +	/delete-node/ key-1;
> +	/delete-node/ key-2;
> +	/delete-node/ key-3;
> +};
> +
> +&scif0 {
> +	status =3D "okay";
> +};

I will drop this node in next version as it is enabled in renesas-smarc.dts=
i

Cheers,
Biju

> --
> 2.43.0


