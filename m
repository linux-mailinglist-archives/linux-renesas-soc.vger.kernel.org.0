Return-Path: <linux-renesas-soc+bounces-25579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F105CA4B10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 18:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EB8F3019E0C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 17:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416AA2ED871;
	Thu,  4 Dec 2025 17:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wTPhCPV/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECDB29ACF7;
	Thu,  4 Dec 2025 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764868193; cv=fail; b=PmyGmUUSaYQovSofAn3GGxyTS0H0dTYfxcr2x1stURzHBJEksYgU9m1RQdrUBXkPhdh+7y4asRRvd+RTjOkQcfJDCybwGVBQoktItu/ye5gtP9jgrQUveehvo1Sf7oehR8s2NVKZrRHCObtlTMpITANjIEnr26/YL5xZONgz004=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764868193; c=relaxed/simple;
	bh=BNby82cHgswh6T8dGBoqQPhB0IVMW2Km9p/7LyiSpwE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KFvjBh2lj+kHgSCUUXB8hoUvihpJ72oxFnAu2mtsf2Mb++3SHNrPrhTk+FHZ0QnvXJIYUt8u2u883DQM5rKOjgvSI2pehnHbNA5haHJgbM/MrSkskMangspSFU2ZL58e4TAD4d6Pu4JjAzpVyFVosj9dLMZ9hIUDZweYEhLGa10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wTPhCPV/; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCaKxPQ3jDhqGTUyzE+7PbRcVjvgy6a1t4qFJik0Udt7ugFNLJNKNOBscfnBFNkh7kI9wyk8qZMa+F6jN6ZZHezrznW2m9q09v8l3WLk9EbnF28WHPfulDy7yQPfnhs6k13ZAk4h25YUl7mJSptCNaHqr9eGFzdMDjCoYQJvOaX7V2EJ/lXGKM3c2GVPgxNsDtRwwintPEaH1Lib5sG939F+o5iNw2yO8n6FIbgUw6GknSOG+P6YQz9dJRwhYsCY7M0z4zfnb15Pzh4qv2+P+3NKsEiCWplc13RMjxw6umWE5/vpnUMCfVHgvdfzaWnwynTErHP1wPfX1Mk5vwIZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ez4HLaLPLIFGCKcTF2mIundOobauRTH8TgvkzqRCQQ=;
 b=NlSEC41ATUzksLhtTPE6w125b3jObQp+n+7H5X9IzicAbH7/c/SzgZmMRdHFeJkakNJYCBCsxOInQ8/pY5GeLYRllvg0EmzGed92ywU14B4vs8lf1w4XcSHwCq4oHpqDiLYREhyGoy8i8ohz/ci+DZTt9CgO7S80DVq18M2u2weO298zGq2aZmXFnS7zbrUKccTZ4SHxJ4kwQ4dVhzNU/muOkyRFI1YMXVtWUs8RtxzGRROSeCIYzqnYLKV4OvwW5c/t98S+cBxIAmJsPWbbqPdGkWLiLUh+CydDaepz7EWQ9A84Xpfi3UKJdCmimVv5fNTmkml3jTBbajQsSWOWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ez4HLaLPLIFGCKcTF2mIundOobauRTH8TgvkzqRCQQ=;
 b=wTPhCPV/5P+hDVpzrVgvE/ZXzFC+aY7CgAC0axoXUyORbow+K+wthMiUwpfoFlHT8m7Us19ffWt+CAxQV4Cveal6NzaamTPmbhGjY5ebY/jh3gKQnM8J/OGjh8BA5Ny6aO8tSpWKEiPGtk5LZuzpNi4NjXsZc123R87wa14mPK8=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB10854.jpnprd01.prod.outlook.com (2603:1096:400:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 17:09:45 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 17:09:45 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	magnus.damm <magnus.damm@gmail.com>, "mcoquelin.stm32@gmail.com"
	<mcoquelin.stm32@gmail.com>, "alexandre.torgue@foss.st.com"
	<alexandre.torgue@foss.st.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH net-next 0/3]  net: stmmac: add physical port
 identification support
Thread-Topic: [PATCH net-next 0/3]  net: stmmac: add physical port
 identification support
Thread-Index: AQHcZTxoNBT/kBKkqkycpyuc1vFSCrURtlUAgAAAO0A=
Date: Thu, 4 Dec 2025 17:09:45 +0000
Message-ID:
 <TY6PR01MB173770CE83ECEF70064C078D8FFA6A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20251204163729.3036329-1-john.madieu.xa@bp.renesas.com>
 <aTG_tJGs7-p5kJzD@shell.armlinux.org.uk>
In-Reply-To: <aTG_tJGs7-p5kJzD@shell.armlinux.org.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYWPR01MB10854:EE_
x-ms-office365-filtering-correlation-id: 2d1d7a03-586d-4c8e-9710-08de3357ec3b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bKlijtjph04UK1m/yaxdmvHbJAhPMZrvPLkSzpCKWmnc1Jb8M7VARZNpyMEx?=
 =?us-ascii?Q?1Ys/aZ4aXNJlK0VJBTm+DLdgqGARLJ+NpryjC9XYGecaLV4VxFT7HbrmeIvm?=
 =?us-ascii?Q?GXA4Jvgqt7G+EVBnWm07W8EdZo7ONmZz7qHX3n846Dgbqv45CCHF+qDYYb3a?=
 =?us-ascii?Q?H5muyjw6ZZvwrZwLGwRoNitqQ8vYA71xP8wV9yZfju65KF0K8OMS9oRkc5ND?=
 =?us-ascii?Q?YflmPxbRajtbjefeWtyWumK4ctqaEeti0Ez6U2sUWY1SmIIDn4GpExGdYhc9?=
 =?us-ascii?Q?9JBJBcvTLRE8/BgpmHNJcQeKJCmpkbfAqPPwthOb4e3+8VufH2s629hX7Rjd?=
 =?us-ascii?Q?My9eF8guM5Gqy3OTbWMrJjliO3t3rBBOXTFs7+mUwowRLZowxbhD7M+WIY/2?=
 =?us-ascii?Q?yphQhSg3dclQ6UxpIPjr6BQM9ImPEDje5usKJtMKvYMXW2rMwZG1yDhP7KGn?=
 =?us-ascii?Q?C82l1mPIKzvVVFJn2eoeExFKaHACAq/EssyE8/XoCM00YiJnR3CPvPEoLCVI?=
 =?us-ascii?Q?JyN3XclxdS62C1xD+JP/v6dyUAO3DODYtq5wx4VKADY0uAmmJPfjKxrSs7m5?=
 =?us-ascii?Q?aXdzTkM2JIK+m4Du4o4et7t8PbF2hhMaKMlOFHUbzLNmqK/9pqWOo0eLCXNH?=
 =?us-ascii?Q?n1KPQ2JrYTsi6yLkW91NXA0/CPXs2x/whrmpPxNFzuWrQU+3ORY05xNCsOJ2?=
 =?us-ascii?Q?FKXY7milebKa/GYypWb7Hb2+CJdpNX41cli4bleVucBP5L3rHVcmI8XDbK7C?=
 =?us-ascii?Q?lpVK+s+mtR3m9bcuxA5eN1NEa/ewobDEjnu8bh8//MshaIZKCuLMnf4sE+Yq?=
 =?us-ascii?Q?Q8eNPIqksh1EGbhn2xFd8EaaANL3sr0UIweHdtnTQ4rT9NAFKd7nXr1jOnFy?=
 =?us-ascii?Q?+HcxJ3Eml01eG1Ix2zTkHbGMFlr6mtJoATEp9SU2NW+yYfYPjrWKgcQQOar5?=
 =?us-ascii?Q?9VqF1Ge5zOU/+VWEtAy+T3pDf3/QbVVBsHttfwd+Zi0F7CdkOOAjQwFT/WOg?=
 =?us-ascii?Q?FRBQnMzaFZBkhvU064bm3HbM9XLIkm+rIOQWDtR3K7WgIzpiUaTmEU6sPhQc?=
 =?us-ascii?Q?v+xxxxd1buD2yQ+oVEeFPQeAWgu1o1nzsCe6mOx0IU7A5hOFIBmHS7mG4/Q1?=
 =?us-ascii?Q?gDszo7dS0RSvasllGm7mm5n+SS77YS2xzRFs/DoBihK8Bw/SOvH5t0LaTbTe?=
 =?us-ascii?Q?efy4OG8dQ5QxjBGw6CZjKnHVGzsUCTqI6Rcgi0yy+QNAkV8YEen7SHvESA4G?=
 =?us-ascii?Q?0tDjk9eTE7EkzuBMRJsICxYaaGRdAUGYH0pO1ylIt6Ji2N9Ph7GxOGDw466Q?=
 =?us-ascii?Q?BoukSqnnveLtXy8puMGd4ep52PSA8JWZQgo6L8aM4KpdX8XtmHK2584UzSJE?=
 =?us-ascii?Q?NThQu+UIzM/lihPk61yJ6oN7Q0BYxQtVrhi3RNonOv/6SpZtBXUQpyUcOfat?=
 =?us-ascii?Q?efetvOBw03wNg5gIo0xQaZVzY8uqX7XvImaQdDqJo5JKEYPrkJEf90jlErQO?=
 =?us-ascii?Q?YOmvhPua+d5Y2kK4VstrehZYE882HbtBqHtz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Mu6t/FdFmoo7beJL/CjhL0xlbmRXfQtkwLsp+KPtzLoddqDY2pYa5dccM24G?=
 =?us-ascii?Q?v1xXinEISJ8FiAd04wdUKjcg+ubA/kKONciZG8GKa5N166rUVL6lGRf4wTsG?=
 =?us-ascii?Q?osapzpU+O/UjZXA3x8bI8p70krU61uoMUTpZ8Rc/t1brcIYpVWLj4vlGrxIF?=
 =?us-ascii?Q?1MY+syNZQd3W16xUGAa5PgbrA42TbLucjse3mhzhxEpZtBL0H1iMQdFu1a4t?=
 =?us-ascii?Q?3SVx1tHEDsJ+1XIxGtCztMaY1k9xovFocsSurWZOm+mTQyVGMGHwVBEt0I6a?=
 =?us-ascii?Q?V7ekNprv4HtZyEzsyGTIJsjS5byWLDadRvGgNRBkfP+hTcIj/54OpZwoROat?=
 =?us-ascii?Q?NZryjN2HxAjy4yTwKVD8P5677ynFzmmy6jtzTUCZI7eUx8f6Rk0Pp3H4hoCB?=
 =?us-ascii?Q?Y7n4nszOb806trAxHs3vDx2rLLR4BSZbr1ZKH79VgT33BcmP6juOMMoowOsR?=
 =?us-ascii?Q?aN6N6Ue3wV6hrwjVOxpbrCPs1/AmPyPGkU+fRi5xbuTiX0RGDeSPb3NpeX4h?=
 =?us-ascii?Q?Nr4qYQxcgVw65DltxbHLTxi/CdBp0vIAI/UC9aSXC0yf5AKcAsIWgbSejMG/?=
 =?us-ascii?Q?GV/++ZgfkKOmoLvvKNQIBEUAxR1b4nk0BY4OJoZ19UIsOsrn2puh42IFK+cL?=
 =?us-ascii?Q?wwkoy4+fZZtp35Et5SjKOtBFrRtMNRfeyz1K0R3Pu1Jyi7l9EHUSSS1Lriqi?=
 =?us-ascii?Q?P+QCb/1RGWun7jij3YmPlkIjWKz1XFw96xj9ikPBvvwSCWob3b8GyNcSg35t?=
 =?us-ascii?Q?+xLmBA6Aywub6HWHX9ZvY1cZrm2O/ChMTy0w7Bhm/itvjTdRvbjlDC4RH4Bz?=
 =?us-ascii?Q?albtbiODnXGYrZpKDcokauTDNqv/3nUs6zaufWjrDq8E1JZuO5au1hf6LQ/e?=
 =?us-ascii?Q?P0wxDVIFdlt/HhkKVciiKfjDRUqDGP4OHJvsA4eRFbDScEyi6j97WHXZa08n?=
 =?us-ascii?Q?2vz3HkYHY6Z6cFxD4FS6Rqg/AKJrVw97Q679w8wx/HPY/VUY8wv4v5QdmMib?=
 =?us-ascii?Q?e5DaeA1iASHV7VNKo9F/u7if1Ga/Apg6/OuVJaoMg8aF8thG7vzlC8NTcEsZ?=
 =?us-ascii?Q?izcK9vnK1TJHzNmWJWp/Ig2+1eAHnrzlXmqYXH8VsGDIYmMlemQh22I4Ijep?=
 =?us-ascii?Q?zLUNqHer5FkVMKj4dukNLJ3JP50ap+O0IbsVIJMl6Poo/R+0Cyq1jmFM/JJp?=
 =?us-ascii?Q?xVnJDIYHw5Kwisrr+cES5DKH7R0G20RZksNGccyl/MGqR2tLrdGNsnCxM6N3?=
 =?us-ascii?Q?cM7AUPBnT1Fcq70U0QK8+3nnE+nYQmCl0qUZqXAKhMkoEJTPQ9ZQrvT/0r25?=
 =?us-ascii?Q?kA9mlLJDwRJ14fXy/YrTV0042oziOi6NVbxdnx+ocASrIhq6cvg/yktrGITX?=
 =?us-ascii?Q?os+0Yez9MkxtP0+JD5mDNQ0HF8Vd2aAXuWaDcZ+6hvPfSjeLiKDkEjNuCqte?=
 =?us-ascii?Q?cBt4IZPiiV+ga9sz/aVYzpbnFMBsa248TJwe8Px/MNwcVTFPCO0YBwxhrFgv?=
 =?us-ascii?Q?1RJbK6e0JmMZdg/JRCtHWZ/WVzUIqP2zBx0FXLrP837zTAGEp5JyUMhK0QSG?=
 =?us-ascii?Q?XqU80uu0MSaC1c3ZWKOdvJrqMGvd2OrTjbl64wqVDGH/ZgbcbgnF/gbp6HXr?=
 =?us-ascii?Q?qg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1d7a03-586d-4c8e-9710-08de3357ec3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 17:09:45.1337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXfI6fwY2WiXtvMTBYmozcQgP9XX/Tlbx5YcQAg5stkyH32xbb+4TTZ0iODgzIuJAMLNqAIQnWc+vGm9ei2IfCZy5rnoHdUXPb++LMIomZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10854

Hi Russell,

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: Thursday, December 4, 2025 6:07 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com;
> kuba@kernel.org; pabeni@redhat.com; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; geert+renesas@glider.be; Biju Das
> <biju.das.jz@bp.renesas.com>; Claudiu.Beznea <claudiu.beznea@tuxon.dev>;
> magnus.damm <magnus.damm@gmail.com>; mcoquelin.stm32@gmail.com;
> alexandre.torgue@foss.st.com; netdev@vger.kernel.org; linux-renesas-
> soc@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH net-next 0/3] net: stmmac: add physical port
> identification support
>=20
> See comments on the previous posting of this patch series (why it was
> reposted in as little as six minutes apart...)
>=20
> netdev has a rule: allow 24 hours between re-posts.
>=20
> netdev has another rule: don't post new material, except for bug fixes fo=
r
> the net tree, while netdev is closed (in other words, while the merge
> window is open.) If you wish to post new material, mark it RFC.
>=20
> Thanks.
>=20

Sorry for duplicated series. Something went wrong while sending out the ser=
ies.
This won't happen next time.

Regards,
John

> On Thu, Dec 04, 2025 at 04:37:26PM +0000, John Madieu wrote:
> > This series adds physical port identification support to the stmmac
> > driver, enabling userspace to query hardware-stable identifiers for
> > network interfaces via ndo_get_phys_port_id() and
> ndo_get_phys_port_name().
> >
> > On systems with multiple ethernet controllers sharing the same driver,
> > physical port identification provides stable identifiers that persist
> > across reboots and are independent of interface enumeration order.
> > This is particularly useful for predictable network interface naming
> > and for correlating interfaces with physical connectors.
> >
> > The implementation follows a two-tier approach:
> >
> > 1. Generic stmmac support: Default implementations use the permanent MA=
C
> >    address as port ID and bus_id for port naming. This provides
> immediate
> >    benefit for all stmmac-based platforms.
> >
> > 2. Glue driver override: Platform drivers can provide custom callbacks
> >    for hardware-specific identification schemes. The Renesas GBETH
> driver
> >    implements this to support device tree-based port identification,
> >    addressing cases where hardware lacks unique identification
> registers.
> >
> > The Renesas implementation constructs an 8-byte port identifier from:
> > - Permanent MAC address (if available) or Renesas OUI (74:90:50) as
> > fallback
> > - Port index from device tree property or ethernet alias
> >
> >
> > John Madieu (3):
> >   net: stmmac: add physical port identification support
> >   dt-bindings: net: renesas-gbeth: Add port-id property
> >   net: stmmac: dwmac-renesas-gbeth: add physical port identification
> >
> >  .../bindings/net/renesas,rzv2h-gbeth.yaml     | 19 +++++++
> >  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 56 +++++++++++++++++++
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 54 ++++++++++++++++++
> >  include/linux/stmmac.h                        |  5 ++
> >  4 files changed, 134 insertions(+)
> >
> > --
> > 2.25.1
> >
> >
>=20
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

