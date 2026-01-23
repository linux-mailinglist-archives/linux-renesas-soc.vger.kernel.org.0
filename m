Return-Path: <linux-renesas-soc+bounces-27360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAGOHuiQc2l0xAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 16:16:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CF177A8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 16:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A15733004C5C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E0D2848A7;
	Fri, 23 Jan 2026 15:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aYcEePf1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D76325A2A2;
	Fri, 23 Jan 2026 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181377; cv=fail; b=ABVWdbo3LHpscKyWkIKmwga3qs383UZ9RV7VbpPJksbHsi0TMd/UX4HyWYK6tJQcxSNCq1PqaRtTpNVnzObxJPuugNAs7uUNvHBpnTOv/dYc5BNjphkigIxPzm75K66apJzeY2m6BM2PU8u3lWeEvQ2M7xzj+wMfqu6GDGbGdac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181377; c=relaxed/simple;
	bh=Q11XcX3bOq2fDxeUifQNWrEqHlDoRMdeq8+cZPwa5E4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dh9lZ4GUzyDimqiWnj1wRZxHqX6/1ITLutKMY6ymipixelQWWSCe3jKJtHJg6wre+8KY+JVhHqQWZ0Av84V8B0CjTWnlypJgtw2cpiaLqLeoaZGQ2GhhNebhtqOSItcBw59No418q+h3qDES2w4NkHufc4fQfHsfbPYkgoTopt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aYcEePf1; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoeboTBHPOZSBqKEUEgK1+2FABYgBpYUdWPjKMZ5dy6bbnjjcZ2So+HIU0G5vw6+e5xitCF3DSlYMdOobM8gpy9rL7Rqw7+/3aEaZIFQTfB4Wp0VLT60iVPl7w4WkIvOhrDSlYQ95JGBgeX2WzayOFZCZ4bEt1zboYJsLaRrJYvWMXEeV7wy9dklkwqrH5aI28XvxOXU5zOIdTKwthFl/oePCEf1SLjRZPwTcWV/wlCWoTL/9WArkJx5y/E9niHfzTzB9r6qoyxb+vclPNZzaVX8cWdxm83wG4HNTn5jVnFZH2sXPT9bIUr/IgR4b+Hh1j7Foi3xeimK5yKBbyoq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw9m1a1JYvAcHFz5P/XWMobp6tPVT9TegQvTxRZsm1Y=;
 b=M9/glGUf3yZYjN8Tqspw/LUPjOhJiQIil/DcBxUp7ihfX9Yv7IYH0fEK1m6JsLF35xQlni70LNjrPY440jiITcVmSQXUMdh26mztoNyrN7aZel6mH+dcA+sBQGSLON6VVOKwB47JsdJGB7142HAKsDAPCuWUsOJB+ebLfUYhA6ytZ6p5mk15LHWNeCZ6vOtcEQHatOUZ30T/3/RkHRCJolv6yNhpf7O6+55mzzAKp9wWfoX8zNxv35w2j3TjHyZhuBUdSWZgtPsSOalydxoGkKRUJeTysTjtm43Jf9Aaqn15FF8JTbHQmrMWZLRfa48PI63kA1OL3tFhYTWD5DzNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vw9m1a1JYvAcHFz5P/XWMobp6tPVT9TegQvTxRZsm1Y=;
 b=aYcEePf11hksCUpO5yLv1hsmj3e8XKT7eOLHk9QtkBGZ4AYfPj5GRsVp24JBy6FORmhAcDvyrjy9S4VF/S1ENopBFcya7oTzhGXBGmD3BiomAdqQh11O2SXqtKZ05lCiuWqFnBIdWPe1lIhAyWJpQYFhZS2bswA4CtcLsviqIJ8=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB6663.jpnprd01.prod.outlook.com (2603:1096:604:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:16:09 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 15:16:09 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Topic: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Index: AQHcjHDWKVQGsQL56EK3j19qoXP9lbVfzogAgAAKPnA=
Date: Fri, 23 Jan 2026 15:16:09 +0000
Message-ID:
 <TY6PR01MB173774E93FD05B161257894A4FF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
 <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB1134621DA412AD95C7373B4AB8694A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134621DA412AD95C7373B4AB8694A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OSZPR01MB6663:EE_
x-ms-office365-filtering-correlation-id: 8d25b9b0-e86d-4b6a-c304-08de5a925659
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IbPsI52Y49GHOPpUCeJKlIDOn5VOQj2nwsAq7HSuKSh6U7gjXsuPyRYbAcho?=
 =?us-ascii?Q?9hLEE+rqMA6Rgfn7USFNSdIB/TjB0cOs2ZDNlatU6rZ3N7Ui6CIbhhCRoRRn?=
 =?us-ascii?Q?wgdA7qbBxl/ehBu1mVffjw5tiLKQhBvGWzkGZEgw99OKPXDU3c5eKCjAV+xW?=
 =?us-ascii?Q?6v6FfUTcOs8H+Qcop3Euxc/QjRlmYAbJ+JeJ1DDCzNbRRkpVplqjwEGsHt2O?=
 =?us-ascii?Q?f8q7VIgbp/StBq0Waq5rWzs1W35IwHhOBRuQUk+KWTaHFPePAn5p46ed9+l7?=
 =?us-ascii?Q?HLXgGd0rZebRfOjEAIgMIfjXNAvm91tE2IPcwugr5XkKBM23EWumnl4iRVST?=
 =?us-ascii?Q?xkgUjFJPCa0dRxvuyg4pxgcIZtaeAvPxHMgGCu4DBQFAc7B3z7sjZduSsCaX?=
 =?us-ascii?Q?TwJJEDtFgJLp/ed5e35bb0YIZNNsxxDnqNtYaNp1Hsw9zLLGfJqm2qirb53H?=
 =?us-ascii?Q?ttSt5ANmSnR2ibGRHpkGEMUp5EewJTiQjgOF7fdSmGezYZKGfn5PjM1EhnTf?=
 =?us-ascii?Q?coNcw0LkBdq5hfuRIwpSkUn2PX+vjnvUGuuavSyG1Fh8UQvel8jfvBLIp+6i?=
 =?us-ascii?Q?DrD3IiqJFIrcPOK0HCrAR/knMMT0A17B52Wnz6dESTk+vvhu0uU8/oj2QTE3?=
 =?us-ascii?Q?iy2j1qhRN4AEQ2MSEqss/gkzVtTMKAD40zkmwrjIoceKChg/MtOtjEy9sEHo?=
 =?us-ascii?Q?mLuqyGa88/gaJXAXhkVSGm8qBMlHbdD7q/cnSM7x8vJcfzTiRoBK9o/9httZ?=
 =?us-ascii?Q?AhDj625eopIDxMxjfPqFMH9Q0tZUIJcNSyTX7qEuvfGO4/2oBY/UBdBcOgyF?=
 =?us-ascii?Q?Aa3rk7DuiSHYdLePYJjwIIQFs2Tq/RGlEl8G3aBrvp5g42DFJfQ9MgRLvyI5?=
 =?us-ascii?Q?qSdpyCDLR2mmNj9IkNSGBoFgckXNHMU6YZZPOjXnFpoyOkquGHbQONNPhyuQ?=
 =?us-ascii?Q?i56MUsTyUSHZg0ePJmwvBX3Pe5gQIpJe8Gx924WQkeP0/WG/9Z1GFhkUKvgb?=
 =?us-ascii?Q?VlqJ3QFh8mOmVAt6RBO63ahldFAlvWhyzTOK1LvGXIdZDkWEUwCduNQWYmWZ?=
 =?us-ascii?Q?Gm7aUje5rOMbXb52nk444QoZH4GP/IAlVQ4UrXpDU/R3KrVpAy7I/TPDMk/y?=
 =?us-ascii?Q?ov00+w/HBb+pMUUgVFd9UfUYrEFUZgRWiwFs1DfOE7oaK+/vY51TYcoM2dGg?=
 =?us-ascii?Q?0g3k1RJHq5dnrylrSYcLqx63y11I3KpJzuiIpv8BHXwKKeMEpZyv3zHvePG2?=
 =?us-ascii?Q?+NPTQXBRM0rx5t9pYqb9/ZxrAASzpTvj7C+BwpQNc85havsNhKs4SL/vcuDd?=
 =?us-ascii?Q?6lBFflUSNzObPvPzzlY3fKTnGNRH9LLNgwS3bZQD3D8ssmqb3sNOtrq3CKF5?=
 =?us-ascii?Q?+qJU0m295f+U9Y0g0OlGaLuzB7E5w/jkAMajeK3eGaXjbmL7U5/6Onb9v/9t?=
 =?us-ascii?Q?MKDriNByJK76vpbzwlF4jVrbPnba+EUvFwb0ensURkPDjwocYdJuRAbey9IZ?=
 =?us-ascii?Q?QA3AsjATHmcNze1K9G3lM5TNdqz55pRwTW0B3Ldv+74I55+TimxzHpPsfNep?=
 =?us-ascii?Q?j+fnfpEw+xC1S217+BUlz7Kz8u9QkSYqnBtF9C9tQRmyr89NO2n2TKu1ijKp?=
 =?us-ascii?Q?gWD9Z54BCW5OYsT+uj/kQDY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yDePiuFYfqbHcgJFtZCKxyMhTIpADQbODBljRgEparFUPs11YhXbRYiO2bwD?=
 =?us-ascii?Q?QvEUZnpCtjQZIzhrT5Y3/WYhTSgfG24eHPOqXKlxMXATNpp83io1KepTsdEW?=
 =?us-ascii?Q?FybTQk6vWNQdjIMzkQyDadwdiGernPkcedMt0d3QgBY+Vdd37u4g8yLeHeg9?=
 =?us-ascii?Q?DRFQ0fk1WEIok5a7x5Sn15+6/CLNDF90or8xPNEcWENxXlRDMtGIlRZR7Cc0?=
 =?us-ascii?Q?NcMd6LqAql9W5j+XhqyheALhzbgWXkc2VuHWmQ34JinqD/ypL173c6H9ubDm?=
 =?us-ascii?Q?s8V/q3R2KGFPj2mZ5v3OgBYK/enSse/mx4PH3YggfnviqUTfazcBg1hMbEXu?=
 =?us-ascii?Q?ApHURyjnEJzBwDLKUOHVxhKNNTIQtaOIk82k0uDKQ6wz8zfAzHpamxMgqzeW?=
 =?us-ascii?Q?wqG2BiDDNUPYI5DTRTiiqgMqViXEl4PIuN+EcjQ+se9v2hdsWSAHvjkU5rJC?=
 =?us-ascii?Q?xIck60FwTx1X9JqYoEsKe3ivLVgEkgRwgcG3OKP3uBfeqD8JAyue+aqxdabO?=
 =?us-ascii?Q?Db3r1qW3ZkQL4xMZlIgvQRQNexHCmUWUNWXNxrBEas04gv3BwAEGOVO88I1v?=
 =?us-ascii?Q?JH7Fx3rm5qOUvA3pfY/TE5LVbU+JvCXM9vz/6dh0MxWixeX6QkPjOX1OCe9G?=
 =?us-ascii?Q?FaIgwkpJ6NnKbGLAkYwnuQkkqmSOG1i/V2ihxvuJKxOaxbTuMF182iG9S7Q/?=
 =?us-ascii?Q?NTqaolIsIBxZ6uZUK8T21yzlGYK9wX21QzCdVwQfKC591kxhriKUv84FKEpI?=
 =?us-ascii?Q?s+4d1MAisU8VLAyePLvZoDed+Vc2iKkVnpnaUJDBwTPoqeMb3S392idcso5A?=
 =?us-ascii?Q?0Eu+JY1TBYxO/CIIpSlE73Ob6T+z9johLGzzLeiR9+33u2KREYpGPMM3w8qr?=
 =?us-ascii?Q?ia88Xk/ueZHSVFf7h4H9DKubAOZLL4ADpZ9MDJx/2y2J5AULcdWkVEhul754?=
 =?us-ascii?Q?/xiYk/+LBhhX+P3TASBGTwX+PtmNEOOpFwWCgZcS0/hPXOR1cZzwab9SUzpx?=
 =?us-ascii?Q?12pFHdvYWUq/Xn8Bz7J8eMkCFbnCRkCWoUL0Nq5AQKITiSzdEogBVVikhmTY?=
 =?us-ascii?Q?VQg5Xo9qhsiBRtcCgFaxmtXaM0PVpUiV36HY1x+7vyXYc3XS54Gmn8iQXViD?=
 =?us-ascii?Q?ouDgJnJ/KQi5mbSzO1yQ13howDPSgY5janVtHngkSHiLbeydDNphA1nQPhYq?=
 =?us-ascii?Q?dFqpV2I1vnGglnYUbRhhW7VVsuhhrTGqjbhykQPG7E1mknND89FQmY1jS3YD?=
 =?us-ascii?Q?aT0+1FpfDZ4xttQ1c2ugjUhdU3Mav11lmdy0mRwN0Lt2ObX+Pjay/EUi3CFn?=
 =?us-ascii?Q?DI4gUIJOJfCNjLWWdC4bsvT+F+oFOJZH28/6jZssnD/euzOb+do7rm8wJcpo?=
 =?us-ascii?Q?VQg486gevSZbrbZGk0YsFADLeIVH3GAPnKCFJ8efOXskRZrYW7aczAJUy3V3?=
 =?us-ascii?Q?zTlaBJHH3I7D0tEPAQOPkmtO43KQabeOwR9jc8IJ+6/Z8RZfE+eW3TKcq9JE?=
 =?us-ascii?Q?6sc/+edW9uiHmbiurAgnP8ooKwJMgwg9HzlUbz1uIJ8OKts9irZ4yyxxzU1Y?=
 =?us-ascii?Q?PVciBJtwbBfPzze5iW8TaN+gV1TUPbWIx/7heRKsfq19p6yhLO9noBJAhv7K?=
 =?us-ascii?Q?DQQ7YJjbfmvatK5SVtk4ngRoB/OCgQZgifiXZgov6W+F8/x0JIiSukXYJaui?=
 =?us-ascii?Q?TFvwN/F2whQdqzTEqrP3TdYHidbzYmzSNUSFRXVodF4IR+3FVwI2BFu2JjAj?=
 =?us-ascii?Q?jMGM8bgblvYtdngU+awTCzQwX2FpHZY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d25b9b0-e86d-4b6a-c304-08de5a925659
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 15:16:09.3276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQC8e9X5aX8/HXVeyDxhUPFiF5sRzPUeDdlj4WBHfFkX6zESNTR+IIKTBLfkLITF5+7nxrZzSlwVwF85eQUCUv5xWJooC5kGBJ8QVZdQOnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6663
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27360-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.994];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: 57CF177A8F
X-Rspamd-Action: no action

Hi Biju,

Thanks for your feedback.

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Friday, January 23, 2026 3:23 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>; Claudiu Beznea
> <claudiu.beznea.uj@bp.renesas.com>; lpieralisi@kernel.org;
> kwilczynski@kernel.org; mani@kernel.org; geert+renesas@glider.be;
> krzk+dt@kernel.org
> Subject: RE: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie=
:
> Document RZ/G3E SoC
>=20
> Hi John,
>=20
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 23 January 2026 14:00
> > Subject: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
> > Document RZ/G3E SoC
> >
> > Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> > controller to include support for the RZ/G3E
> > (renesas,r9a09g047e57-pcie) PCIe controller. The RZ/G3E PCIe
> > controller is similar to RZ/G3S but has some key
> > differences:
> >
> >  - Uses a different device ID
> >  - Supports PCIe Gen3 (8.0 GT/s) link speeds
> >  - Uses a different clock naming (clkpmu vs clkl1pm)
> >  - Has a different set of interrupts, interrupt ordering, and reset
> > signals
> >
> > Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >
> > Changes:
> >
> > v2: Reuse G3S names
> >
> >  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 127
> > +++++++++++++-----
> >  1 file changed, 96 insertions(+), 31 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > index df30f729d4b3..9565f1774720 100644
> > ---
> > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yam
> > +++ l
> > @@ -10,17 +10,21 @@ maintainers:
> >    - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> >  description:
> > -  Renesas RZ/G3S PCIe host controller complies with PCIe Base
> > Specification
> > -  4.0 and supports up to 5 GT/s (Gen2).
> > +  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe  Base
> > + Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and  up
> > + to 8 GT/s (Gen3) for RZ/G3E.
> >
> >  properties:
> >    compatible:
> > -    const: renesas,r9a08g045-pcie # RZ/G3S
> > +    enum:
> > +      - renesas,r9a08g045-pcie # RZ/G3S
> > +      - renesas,r9a09g047-pcie # RZ/G3E
> >
> >    reg:
> >      maxItems: 1
> >
> >    interrupts:
> > +    minItems: 16
> >      items:
> >        - description: System error interrupt
> >        - description: System error on correctable error interrupt @@ -
> 38,39 +42,54 @@ properties:
> >        - description: PCIe event interrupt
> >        - description: Message interrupt
> >        - description: All interrupts
> > +      - description: Link equalization request interrupt
> > +      - description: Turn off event interrupt
> > +      - description: PMU power off interrupt
> > +      - description: D3 event function 0 interrupt
> > +      - description: D3 event function 1 interrupt
> > +      - description: Configuration PMCSR write clear function 0
> interrupt
> > +      - description: Configuration PMCSR write clear function 1
> > + interrupt
> >
> >    interrupt-names:
> > +    minItems: 16
> >      items:
> > -      - description: serr
> > -      - description: serr_cor
> > -      - description: serr_nonfatal
> > -      - description: serr_fatal
> > -      - description: axi_err
> > -      - description: inta
> > -      - description: intb
> > -      - description: intc
> > -      - description: intd
> > -      - description: msi
> > -      - description: link_bandwidth
> > -      - description: pm_pme
> > -      - description: dma
> > -      - description: pcie_evt
> > -      - description: msg
> > -      - description: all
> > +      - const: serr
> > +      - const: serr_cor
> > +      - const: serr_nonfatal
> > +      - const: serr_fatal
> > +      - const: axi_err
> > +      - const: inta
> > +      - const: intb
> > +      - const: intc
> > +      - const: intd
> > +      - const: msi
> > +      - const: link_bandwidth
> > +      - const: pm_pme
> > +      - const: dma
> > +      - const: pcie_evt
> > +      - const: msg
> > +      - const: all
> > +      - const: link_equalization_request
> > +      - const: turn_off_event
> > +      - const: pmu_poweroff
> > +      - const: d3_event_f0
> > +      - const: d3_event_f1
> > +      - const: cfg_pmcsr_writeclear_f0
> > +      - const: cfg_pmcsr_writeclear_f1
> >
> >    interrupt-controller: true
> >
> >    clocks:
> > +    minItems: 2
> >      items:
> >        - description: System clock
> >        - description: PM control clock
> > +      - description: PMU clock
> >
> > -  clock-names:
> > -    items:
> > -      - description: aclk
> > -      - description: pm
> > +  clock-names: true
> >
> >    resets:
> > +    minItems: 1
> >      items:
> >        - description: AXI2PCIe Bridge reset
> >        - description: Data link layer/transaction layer reset @@ -81,14
> +100,16 @@ properties:
> >        - description: Configuration register reset
> >
> >    reset-names:
> > +    minItems: 1
> > +    maxItems: 7
>=20
> Not sure maxItems is required here as Items has 7?
>=20
Indeed. Was not used with other resources. I'll remove in v3.

Regards,
John


> Cheers,
> Biju
> >      items:
> > -      - description: aresetn
> > -      - description: rst_b
> > -      - description: rst_gp_b
> > -      - description: rst_ps_b
> > -      - description: rst_rsm_b
> > -      - description: rst_cfg_b
> > -      - description: rst_load_b
> > +      - const: aresetn
> > +      - const: rst_b
> > +      - const: rst_gp_b
> > +      - const: rst_ps_b
> > +      - const: rst_rsm_b
> > +      - const: rst_cfg_b
> > +      - const: rst_load_b
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -128,7 +149,9 @@ patternProperties:
> >          const: 0x1912
> >
> >        device-id:
> > -        const: 0x0033
> > +        enum:
> > +          - 0x0033
> > +          - 0x0039
> >
> >        clocks:
> >          items:
> > @@ -167,6 +190,48 @@ required:
> >
> >  allOf:
> >    - $ref: /schemas/pci/pci-host-bridge.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a08g045-pcie
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 16
> > +        interrupt-names:
> > +          maxItems: 16
> > +        clocks:
> > +          maxItems: 2
> > +        clock-names:
> > +          items:
> > +            - const: aclk
> > +            - const: pm
> > +        resets:
> > +          minItems: 7
> > +        reset-names:
> > +          minItems: 7
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g047-pcie
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 23
> > +        interrupt-names:
> > +          minItems: 23
> > +        clocks:
> > +          maxItems: 2
> > +        clock-names:
> > +          items:
> > +            - const: aclk
> > +            - const: pmu
> > +        resets:
> > +          maxItems: 1
> > +        reset-names:
> > +          maxItems: 1
> >
> >  unevaluatedProperties: false
> >
> > --
> > 2.25.1


