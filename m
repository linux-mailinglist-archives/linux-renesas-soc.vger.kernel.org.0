Return-Path: <linux-renesas-soc+bounces-27134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNYFOmTMb2mgMQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:41:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 476B649A4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ABB2356DE48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33513F0754;
	Tue, 20 Jan 2026 17:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JgOabS7t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B8C243968;
	Tue, 20 Jan 2026 17:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929840; cv=fail; b=BqiXJ3ocgXfNMOFDUbJzRgXiU4rCK3YDk6FjodeDHu9wNA29xpW9bOHz8wCbsOfL0zj8ETUda9wuAgXafEu2teaZIqu1Jut4nLG8wpYqOhRHy3W6MgQTSp20vMfLYkpMn4wzwSo0kop6rBy/06B4ufMI+W9iIR+LG4OevOq4TRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929840; c=relaxed/simple;
	bh=LfzauN6hQFGbqQopYKmyAA3tgEukFaMLr16YD4XmN08=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eWni3keucbGNW+5BnvvKVLLvf/EyhRNl4KYSMSasYtTGD0hlDZiRDv1VfxFpbG6TE+AkkQjzPi+FXp3pts827B0Z4ey81c0+bkE7azQswdnkLs2s1S1/G5+Nnz7D3LhXHFahK4VJvdIpM8i50lvq/6Xwn4w5stGlYs/VfurVmHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JgOabS7t; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lc8NqSbSzK3f1NxhqZY7U3f0jFvMBLVImTN+KwoYfDqJr81AbQudwZMKBmVEAAV2rG+myvLlZl0HYaMwqM2p4hBn4kzvmsRs8AJI+idkYr9pRg3tEjUJjgZHe+ylgn5KHh1823YhWp4IHIE8w+GpHXzR7S3BKvOEbgf+ksE2RPRaw6pNXrK8EguBB78dqxEbRuE0v3Vxa4IgSMEclwRvCT5JSKTk1O4+Yz4ktCXzUnCyKZ6/hfD9B2+AKKKGNUKP22YF42A8DCqL8sxNmQD3Qkf3hKQ1uVyJNHQFijUjwXaigzL+FTtoXc6e+09OhG/5tp7+sZaxK3FSFjXWZgB1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPGtLwM3eS4IXxODqmDNuB+qhCladCqyzyGEGI7nvZ8=;
 b=pCfBxZvv5Fbw5h3+sbaI3hEpKYyuE1RnE7kCfBe9Die/ABbJSMG8WQU0sAvCX4xkbgSgam0j6JrnqJwqvHX6MPC4bgnqAVMgF5gBy8q1I2XFWuW5qQTXbc6DRO1ZI1nX/WSCn3OuUQjqNE11txHBO+mqbOrJPywDOViTgfZCzgjhuSpqfLrl3LuSqqzLZoJ4NtXPJ6eJCnyw1MF8fXVcnZBTSL9eHupEcLGgl0XxOKtwj6KcyJ4fLsxSC3c8TS1n0oS63+DaT5hncguMANXEuy/YE7DjkdcOg0WwhQwfQuNvVx/qfVAFhbVeQUxLig+jNvVAif/em/pRqDpKLweH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPGtLwM3eS4IXxODqmDNuB+qhCladCqyzyGEGI7nvZ8=;
 b=JgOabS7t6HCrUKvKHIQs0ElSRaU2CaMojQRVvtYLnss1kAVDB15kilnCiT/s6TppCYu3rBpAT0jAWJxOZfDwxFEJhnlZKVCENYOPyucX8DA8QiMQjtNltHT988y8f58Hx9F04bYAJ6GggwpzzIGY+1mH7PPX3lD7a59MXHEy/lU=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB12140.jpnprd01.prod.outlook.com (2603:1096:405:104::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:23:56 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:23:56 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
Thread-Topic: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
Thread-Index: AQHcih5d2aBtSpVCZ0CNQ/H/tjeqdrVbTtCQ
Date: Tue, 20 Jan 2026 17:23:56 +0000
Message-ID:
 <TYCPR01MB12093C5413ACF724B91F34B83C289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-5-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260120150606.7356-5-ovidiu.panait.rb@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB12140:EE_
x-ms-office365-filtering-correlation-id: 8268d41d-3be7-4672-10f5-08de5848b0f2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?liGAfhHaQVRYyc8Ctby8RUPac8EA+kGmXS6/U+iJ3o4yDNBJ4YHm7J355iDL?=
 =?us-ascii?Q?XiwKxMz2+R672V/kSTZ6PW8cWHuhvWVXmpCMNzAlDS/dP37VwHacdjcu7aZi?=
 =?us-ascii?Q?HNSHNldd/cHSxUzIb4JlTwIxOYZUfFSPM2vgQY4lUHjLx73+2kmMHjFDzXEK?=
 =?us-ascii?Q?MvpXRu19sLAEh/AxU1EB6wid31UhjYrJoUbVigxiULhma9ctzmckNsI8cT68?=
 =?us-ascii?Q?BDo6b15VFFbIXCE1NcTg9LAmeHt4rEKQEhbzLnADz+5bVuEwOhDBDHJOdIU3?=
 =?us-ascii?Q?oZXqbMv+xEj12dDiWK4B8eNnQUrg+dHoWVFCLpiXqNaZh3KuxFhiUfDi2eRl?=
 =?us-ascii?Q?/4AdFVLh92fg0MN/avm7tUJvEVqgqoTbwdEmy2kgYYE1LejfJ7MOhKSuioTz?=
 =?us-ascii?Q?Qlq1r77dPXpi+61W8JcMgZ2iBTT7Ca505bd6tUNn2+IxkvuwT5jU7q59DeGM?=
 =?us-ascii?Q?ywQO8bRguAyUNUyAn3q1fJeYlJ3SMGMiaPorDmUIu8V6OrFLphsAHREnATHE?=
 =?us-ascii?Q?jZi10Qra83PulFtUva32Wdj3JWERbXJuW4PZGYpbJLio6aIlHN6KlrWcatUQ?=
 =?us-ascii?Q?ko/m4W5lCC+nnsy4lh1tgOxGMsuC4liBfHAB/KFik/2NR+WInzBr99ZTecRd?=
 =?us-ascii?Q?C1+B9DSf2OMFicLatAl3FoiPwHCd8uJmdEg6F2AK5FvAOws6/N8tvC3cJudS?=
 =?us-ascii?Q?OR1WM0nbqAv8ZN1+CvKlkEsSbiphN3d9YmqZi31wJEy/kYikIAaTZZz8dMiB?=
 =?us-ascii?Q?uM5WrD0Saupizu8tR3yHuV7zwZxU+VDDRjRNBDpmQFnOse5Jof//K/BPrkhJ?=
 =?us-ascii?Q?QoU4R+CVk9InwSSuQnUh2vjGDsnOwQulo5ygIyumWJHi9ftWtxMZ3PfjSbCX?=
 =?us-ascii?Q?Td9XrXoHXeGsy4TRP34qahVJF1DVrpnK3uivc5iteFXaCT7uPFdR197CYAmC?=
 =?us-ascii?Q?H/29pxHXtddCwl2PUhiH/tFTPbs5XmxcRQG1Y1xQ3T4D7gQJD4IkBvQFZqPN?=
 =?us-ascii?Q?8Q9lI0mFOcN63Py1fzrSO3KhLfVMSn+mIBDLycEyoNZQn0F9RQAAKMeVvAJS?=
 =?us-ascii?Q?uDCGgRcp1Tf4mgz/K052c6JmGVexF2rqKAmLfEu7rnHDm1qoefvx67h6hN1O?=
 =?us-ascii?Q?S43bYIK2cRhL8Jgc2DGj4sKRh2sB5elCqHIaH43+wOm/XEtfmSGRfHzVIvrT?=
 =?us-ascii?Q?dZk8Z6FU2T6Uqq7VHdMs7wck4P9/A0Gcuu1hCB95OR2z8LMEJi1Yz8ifFJ02?=
 =?us-ascii?Q?IfW2rSiS7oSCeE2PTKpPqV6Ik1t2dhIB609bf0CTzZvs6/TIS/AClsced008?=
 =?us-ascii?Q?uUqC2GoonNyq1XNOlvjxdP4MtDuJySiQQCRit5+r99f5NjEp5mVq0pVPWOep?=
 =?us-ascii?Q?/BeFKVCzEQSmcmZ0sbE3v/a7pjQxKMNZ74Dg5n+t9GSHcAyes1ns/DQhU+J0?=
 =?us-ascii?Q?gmVB83WPmDylhddkgajOKzkdVacOIVW8V1GGiYXI+2AQ6Dr3F662f7vYRguP?=
 =?us-ascii?Q?uUeVUckahVIp6kSVspt+mcr3rk6GJD8RrEJ1Le7wlsOG6kOEozUd/Tiu7oIM?=
 =?us-ascii?Q?SVVHpA2jc7HGvDSjYGeI9heJEycBOUs2aDmJm94/x5I0XhWzlotcqdyyht50?=
 =?us-ascii?Q?bN9O4AuqNOkWaKjvyVNWViw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7N06VmwJuLWx1yjfppO32mHB4sHTuFzfUwBCQRLWAUz2k2cW6wUnZopn4IWl?=
 =?us-ascii?Q?h1U3551P9dEpsBjr4Zw3La8mqrnrk7XjDU+cbL83EFwaO2agsw2PgdgaRWI7?=
 =?us-ascii?Q?H2m/hD48sTKSKxtdumDQ+m9jDo8GzI7sNz/k9FijxkciQjZpYRBhXXpVknqb?=
 =?us-ascii?Q?oMbOvAhM1xvQeS6B1zJYjeUQ1LjQQfpvi/1pEJG6Dt9bD2i07S9/GimcHO9B?=
 =?us-ascii?Q?I4VF6ElNtqgGKxBYSbs1YTjKIBmZhCfkweT6RFm1vamzGUYOK2Xa7qYXrukz?=
 =?us-ascii?Q?T74p2HYjdnq6U91kO8v1yeq5GeiaqNf2RGualYfo2dxmoi1JzVts3N95gSqc?=
 =?us-ascii?Q?iO4jyKXZJWcHtNwnhBVxTTr1Fd+S0hnqhH5U/Zk+KVQNHTRyWpVtgMDCwAMx?=
 =?us-ascii?Q?wDq61oO+w9tCeGCT/turwrl4AFErz+droN7M3cLmFN3pjGxFcEVfWMi8EKqi?=
 =?us-ascii?Q?N31BAMMdgJETP81ss60swRR99oy8ZJs+aRlYAZCd5YZv8jS1XBDc/X9yFDhU?=
 =?us-ascii?Q?DSXaDcbwwDYnylNPUC666emSR0r+gAwJ0yeGmNWGsV4mxIEu2AiwGMBthBMY?=
 =?us-ascii?Q?x21keCEFBDZ7SlsvLJejIKRAQxouK+WEXZjZ21s5WBJs1BnMAMbXi8eT+1cI?=
 =?us-ascii?Q?rkOzd3iqVCEfKir5DkDf8uiyznNDzkz0TR0I3Jo2Cr4P5sWm/VGlfoTogNN2?=
 =?us-ascii?Q?QXWg+en/V5WlqAmrQbl9mYQxLAf/+mlbYxkrk9YrBX6mQlkAYFRoAJ/V4gTN?=
 =?us-ascii?Q?oe1DyBRaVzoimbC9EyfEZ6nWkrOpiu46nrHMbWdcoc4BM1UeJvkLHIVwG5vX?=
 =?us-ascii?Q?mQQLNO1MaDNcjXZgmrX3nmNEe2LlOsVkcCeoF0fKkrQ9RoTlJaLK+hwoNN7f?=
 =?us-ascii?Q?HYmgsiEn/4zzqeMiPHKwpS7uHXTy38eKToMxyXKsyFoB+v3NPIkfGN6+oHqf?=
 =?us-ascii?Q?TrKpUe9HDlImdbKiJKXtVWyqH8nqSg4jf2LwsHdulAIKZ1gaN8qTy8tBmP4t?=
 =?us-ascii?Q?XKxmIcRUNhVuge+Ix2F3Cy91HMO221KPTQvepgTc98AwRqT5dp+xIXz7MViA?=
 =?us-ascii?Q?Ks0xf5imBigjftJszMnxmtpZo6TozOsYB9gXmvk4e3UoJN5C/oGU4fBa6uzr?=
 =?us-ascii?Q?2jTR5LoLMO5Zdx78SKRximyvQXJgcd5/+ot9eQbDonX8SqFe8OLfvb2ShvFY?=
 =?us-ascii?Q?sqt773ogfBgz/3yywJAVTKOS6NjS8RdcM5dgbpYvdK+Q+yHmmk24LoVzZb5M?=
 =?us-ascii?Q?KlUtsz6hu7Vaw9axAvwQroMTEgY+sdMcxckeBJA2nWoDtPRVuS32W9fFkdK0?=
 =?us-ascii?Q?6NuhiNWmfhf5Dls89Dq32oG8k4iEHBJi3kEUzEl5gChfU/unD40BnRLAYTU8?=
 =?us-ascii?Q?zphVoPYX2IH9hvjaTDsbkDL1xOjdu8V+Hn5GrKz2h6m2ucm6BM0dxaGcVdAx?=
 =?us-ascii?Q?sVnMlAMEm+TT71Offeb5utuwQoI/drrd0f5WVmjM5/yvpxn7AL5phinqz5rt?=
 =?us-ascii?Q?mYZ+dNp1w/+XPH8VdryuaS/YGS2pWxq8RudaiMpWo5fD98sebGp3bfwzBkuv?=
 =?us-ascii?Q?pSG/QPgiSPL8dgkF4s4E6ctJ0wePyDYr4ykn1oNN6lnVXWNxOEXbppwYDYgs?=
 =?us-ascii?Q?L40/Qe1jjRxyWzvk7IJp3ByNXQvZ+GG2zPViNfUyittcc3rj6kJKRZeJosFu?=
 =?us-ascii?Q?wX9u/P0uCJHk128RLfIs6pP+JYliQjUC2KrWM/dnuppBrLMKIcLu/DpfO5A/?=
 =?us-ascii?Q?kC71UVQv1vmpm4rmZT21ucLArg2E6oc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8268d41d-3be7-4672-10f5-08de5848b0f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:23:56.2298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjxNk0PouB+4VfOumX9zgW4/9hKnIpFKBt8rfr2AjLgm95+jIFzwlGKnX4JNZim/5uEZnR2SUuhfXKaRPNUeoxIfCAqlxjcchXxGQogsWHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12140
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27134-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 476B649A4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 20 January 2026 15:06
> To: geert+renesas@glider.be; magnus.damm <magnus.damm@gmail.com>; robh@ke=
rnel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; mturquette@baylibre.com; sboyd@kernel.org; Biju Das =
<biju.das.jz@bp.renesas.com>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-=
kernel@vger.kernel.org; linux-
> clk@vger.kernel.org
> Subject: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add =
versa3 clock generator node
>=20
> Add versa3 clock generator node. It provides clocks for the RTC, PCIe
> and audio devices.
>=20
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
> v2 changes: None.
>=20
>  .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index dc4577ebf2e9..4a70e0707b38 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -108,6 +108,12 @@ vqmmc_sdhi1: regulator-vccq-sdhi1 {
>  		states =3D <3300000 0>, <1800000 1>;
>  	};
>=20
> +	x1: x1-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <24000000>;
> +	};
> +
>  	/* 32.768kHz crystal */
>  	x6: x6-clock {
>  		compatible =3D "fixed-clock";
> @@ -277,6 +283,25 @@ raa215300: pmic@12 {
>  		clocks =3D <&x6>;
>  		clock-names =3D "xin";
>  	};
> +
> +	versa3: clock-generator@69 {
> +		compatible =3D "renesas,5l35023";
> +		reg =3D <0x69>;
> +		clocks =3D <&x1>;
> +		#clock-cells =3D <1>;
> +		assigned-clocks =3D <&versa3 0>,
> +				  <&versa3 1>,
> +				  <&versa3 2>,
> +				  <&versa3 3>,
> +				  <&versa3 4>,
> +				  <&versa3 5>;
> +		assigned-clock-rates =3D <24000000>,
> +				       <24576000>,
> +				       <32768>,
> +				       <22579200>,
> +				       <100000000>,
> +				       <100000000>;
> +	};
>  };
>=20
>  &mdio0 {
> --
> 2.51.0


