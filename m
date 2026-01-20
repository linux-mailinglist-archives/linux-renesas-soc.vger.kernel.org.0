Return-Path: <linux-renesas-soc+bounces-27133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJVMDrvab2n8RwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:42:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6324AA77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 60C9A78DF4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9F63E8C68;
	Tue, 20 Jan 2026 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FsMNEHS3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE73BC4D2;
	Tue, 20 Jan 2026 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929807; cv=fail; b=lUBT0fNHkAmqTl8TMqc065g+JZGR1WZAgLB1KbhMIKZvsYCIMVcLL3Xpz4W+iPAgcUo7yxI+HYCMGchl3DLsVK/QWfdAjIVAl2GWUjHnHSbhDQDv+f94UsKambcHyJCGi753Kp4j++e0xdXKpZmKxIBHETzDr5BYX54IXv/TCn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929807; c=relaxed/simple;
	bh=4QjpyFmhiCxKea0yGSsjOiYvxnP4PjMOl2xjjYMzzpI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=emiEslHdtYFjUwlmgUcLagkXa5VEiiGNLlythL7HCBhJ9m+BWWyXvm9izDkjNcuAAXMjC4f5ymGbTrSaJeJ4czLapdzsyI32E75lgYgz4lyUkeXYnoGOJo+CSiANdXHqVg50BYQRzEm+Q6fCdsY18Gso1MNNj4D4q/WFfChL8r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FsMNEHS3; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWs23LYFEh18+CjjpoOXAuIWtpoS8DqIPbS7nmF7MxJ38VHQvUW1cU3xsYh/h5Cb6ISVZtx/CcU8BHcILlAvc3Bw7VfXwhESLh416b2Ksrwz0GTgas+u4dx0KSPzObmTt3LBARAwHIQGSFKJiLBMJoME0Z3bAQJ4XrXBn9QzbxAJBvdtSO0a9fzmXgHnJqUaQH5W/WxHjPYbaCXYTRerc/9jCi2ibHuit1PFr46N4boGFwTlVgMi8PqErVJAuER5jK7d5rIyXM258IJheqmRCIpc+F650nIqfMfhgO+p8eky95bmiyRg7Yq/3Q7d68yFNQ9kEWzX3MmU3wYuAHdzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPeb0ujRR9oL5HEs3JWm58EMvfJRD15BHQyf70SMIRQ=;
 b=LnXem5pB5HSwhX/y9slxMQN5fhfdCNoHwk9UhdS/lbSPDVmyW9RHBjBOlAUNGzAuGKFM5awuRmSVDYJaI++BRuscVJYochU/e2+Ap1avHBFMKXZ8UheCfr7rPin22NgIt2UWws8WURTO0ymrEMnm91X3kud/WyHXr6gh8ywKMPIULsL30fI6S7uMs217NqRGJfGiggJt7QeTHqnESFcDnAaS+s6S+UseLTa/1i7tecKOlqK84oHgQuNeKUEBawjQOMBXVZtQkeVl8G9zoYpn/Swkw9hSIbT064gAtwNJM2UbdvfZeD3JhFFLGH/4by/OkcDU18SvziPGeA7b+ssZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPeb0ujRR9oL5HEs3JWm58EMvfJRD15BHQyf70SMIRQ=;
 b=FsMNEHS3Q12CBuFwV6nLS48aaCryHoQ5U1+Rhw5jEpObkI9RWGh4AxTHHMlTPz99rT0RiWj+DsRXRq5Zf2kCPMQs7GKlU7NzJVfGTF+dQjZwWneaDWle0usE9S8tZvhCts7b+aAjJ8VoFZqZC2pbNtKz3yuSYTBI/m9mFnzmQfo=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB12140.jpnprd01.prod.outlook.com (2603:1096:405:104::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:23:22 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:23:22 +0000
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
Subject: RE: [PATCH v2 3/5] clk: versaclock3: Add freerunning 32.768kHz clock
 support
Thread-Topic: [PATCH v2 3/5] clk: versaclock3: Add freerunning 32.768kHz clock
 support
Thread-Index: AQHcih5b82bJ+45qdEe0zF4VtdWSjbVbTqfw
Date: Tue, 20 Jan 2026 17:23:22 +0000
Message-ID:
 <TYCPR01MB12093A737BC3CD4DCC22A6F10C289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260120150606.7356-4-ovidiu.panait.rb@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB12140:EE_
x-ms-office365-filtering-correlation-id: ff7f1ddb-fcd3-47f2-a99c-08de58489cab
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HaeuV0vnXBRetOPtx+fpJj+8y4LezACxFdfpRUCfX6OBDqbZyXQBcdjSM0Qs?=
 =?us-ascii?Q?WTrhwpZbw+CrlTlICmUQnFgNU6wpzx0z3N7j1Gc3G1hQjc630QmWCyF1gQK7?=
 =?us-ascii?Q?B3SV/PpMg7fN6ci98Tutdc3U5HtvpORRS7ImFeBWweVq3b4WShZk+/a7afQv?=
 =?us-ascii?Q?krlZCTMvfPMrMiyGvMCdi6CKC+vFSpzAbYVKbAp/5h1o8RXIt4Wh/LyfEq4C?=
 =?us-ascii?Q?FibvJfWop8C6pxxABcneVcRjQV1Ev/gpRMd7wwknpZoM9s2raoQ6Cutl/5ra?=
 =?us-ascii?Q?J+hMPoz+2ZI0wnZznYOsRMORmf8TWtBAYHQrAn4XiT+PRnUM+2gkpp1b2/xd?=
 =?us-ascii?Q?YstOiNTWtmJzLbJcbzftnrxQs1Qc4i51D1V4ilQScKI2GLrUTgkprwvO5Vk5?=
 =?us-ascii?Q?8y2ozXTgwNChAmu8xGd8Xj2Mpaay4eyzCQp+QX0vyDeyUvMaJ4sK4jweV/6X?=
 =?us-ascii?Q?ypIPpyBWqgb8Bbqn8M0clVJst86Gr+a5/zGfxbEUD3ZQzGKEadXZA32hrQ9i?=
 =?us-ascii?Q?Lbvx6APR+e1W3nRW6ix5xHGDhwta0IkfcwrHH6jJp30fRyZXGgSSBmyAdfhE?=
 =?us-ascii?Q?2MAb6OAT8AIkhXK5p5dQlDJfvrqiAaGQO8Y11bHSQ0jbprRGTDVrdKCVOiMY?=
 =?us-ascii?Q?vJpiwV7ZOeHatHHkZhv7i+ezxBvECy88UTnGt7QkyrRF94VzmlRQ/JgKuZJQ?=
 =?us-ascii?Q?b4PClXcTEs2bNict7aXcSKw8w7q2pOUmimX83ysWAki7LRnsEJmgW4+c/4tb?=
 =?us-ascii?Q?xcHr5jE+wZFwkGmasb/jr7kzDr0GkkjR3JcBGubwMtKZ5P5qM0gQKWwupfAz?=
 =?us-ascii?Q?sX0HN00cN8nHNMFcI7oojnW2o2CcFBRjOrRf5tGTwNch1Mj7Z1Ix2Nk56cX8?=
 =?us-ascii?Q?MrUD28t9IAJyN9CyIZuKFX/2dMZ+L/ejOJ9e/mjiwrXk7WLX5qbC0wV94bTb?=
 =?us-ascii?Q?71RWV5Jf3hrV2p3wsIKPUS6y8C33Gf7bVRigU6KimF0cBOm8ajknjWwBRav8?=
 =?us-ascii?Q?y0+rzzPPfpoRhlvGygVEybrL8FLlYyNTSjwkdlIkbOlOF8YLSIl5P+49b/4X?=
 =?us-ascii?Q?y8M6OZTfaOtRWUerEGct7qowmfg1tTDmngjBxX8dOS7V9ZDGkRSa8NiieWd8?=
 =?us-ascii?Q?FAay/H/EWjw1vHvMumBdShw5zh+geFfyvOelJ+qZKkIU+DiBhbkVe2SDEwUE?=
 =?us-ascii?Q?JY04di+5o0yCQmbGiF/zkTWLCGSuUuo/p37bN75tI7NEh9STyylEQ5DYAQMT?=
 =?us-ascii?Q?O498LGBhL7M6/fTgsbbW8JfNky4XOZ39VfnuKiY7rk3OQgFC77bzV9a5Grmw?=
 =?us-ascii?Q?dzecqomnGKd4ddgaH+CdR5u9GzFrjpYs9z1bYmbUra2/uDeafDeIj8tpdRKV?=
 =?us-ascii?Q?MZIGJGsUTkr7TRVt4fwosvxS0HBYQyGV0bPEpw6q2EQtrvNGHzjCtD5rEMhi?=
 =?us-ascii?Q?EH9qc+S14Mhf61a2Kf+VGNHB4TMDFkJfQCi8QmqXE6DZwtGqm0rRc+L91J01?=
 =?us-ascii?Q?RxZ8unIlHuF+wKQpVA7QsAKuGqf62DXmjT9Mf9QaJvWwHHlLv+4Kv7CA3t1d?=
 =?us-ascii?Q?E3brp8W51ZfRC7LczcMz5QLP+RDykbbDT7WhNBPWNPKp5ZSWPpSBvbimnxEu?=
 =?us-ascii?Q?WCyvTEZmLbd0h39BWJg+hjo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y5nRgHF8ESvlCJ0l8PssDUh5YRbRSHeh+TPyHIVFxT3FB+HWlpTvt/8dEYUA?=
 =?us-ascii?Q?ppnYxTaR6diFE3b/ViyrQyy1VmsKPxgJNYJrvHtjeaitmSkNHqupuAWA6vu5?=
 =?us-ascii?Q?dVIbJMI9VguXTTcSforBZR+VLURrPTUfDFlij1cv4/eDvdrkXvXDZPa0Ub2h?=
 =?us-ascii?Q?EfMC6MBpsY02qPtRCiUHuBUnaUAfhVdS2scBK2yOqHrh0XVwDNQEWsrdgADF?=
 =?us-ascii?Q?Bu+BpXfeFR8TpC6s968CAYYWNT6wSUoOaBDvCF+WzDXBPZUYMFIPtRLejNjF?=
 =?us-ascii?Q?57hiKGglpphIcTQiRe35Bp2r05m03BEuEmVzhs0S6zygxU3o1znULarHNTjS?=
 =?us-ascii?Q?ivmW3YLGxTovoDYVHSWuI1lkXWllUORogjzQjVt9QJxhVwp2l+5IstQv9YFA?=
 =?us-ascii?Q?aeL8DJ2ZVxrsH0SpmHqM6HuUKgYbFeBiSaGjB7bhkesbKQyP6XEFhwU/KELg?=
 =?us-ascii?Q?tfoklGNzF62Zp50lAdnIPlCfaVZiHZwe942cd7DYAOSISY1msVhc/Cs74W7y?=
 =?us-ascii?Q?57/QKol7CERphjM/EunGpNNayfndyUQ+GgcU2qq7PAipMUegKMAlXliSbWY/?=
 =?us-ascii?Q?8/EDc1+GObDEj/nPqwVmKZuLwHl4r8Ha/jIzkCHOiSgPpC82KIV30RJrjaZ3?=
 =?us-ascii?Q?PM/HsjCMPqNZDG70R1mo0JGrBTMewJ9Ga2XLoMuvTQK5QlpWudTtpKtgTGZd?=
 =?us-ascii?Q?2IzoUf5tPNB9SI5niHmFuW67vNjNIpFqrXiApo0436Gg6535jNLxMGwUVGwA?=
 =?us-ascii?Q?W15MaUoLkCAXl693qPlpNfYzCEFDSi1E6gB92fLFxnL3Sq5R9q4e52tRCO9P?=
 =?us-ascii?Q?OzBI/sadExUYCvhmG6Lu/laON6E6YW4oZ3Qm8IsMgWtHMFRlCQ/CdgtNmn88?=
 =?us-ascii?Q?MkWzmAEy4Ha+8r02qbygnmNDFnO08YUT4gxN6JcJqakWIjisS+dE///EYMJI?=
 =?us-ascii?Q?haieNggjFw3clZRypwwj6H+aN6vK8RTf4PYzUSt2FwFR3DtuVejsomnxHTmV?=
 =?us-ascii?Q?VLbCzPx7TRX9GpqSs99l1bgwrr67VXvpg5QFnZgRCLHOJMeAp7JFuD7HDIc3?=
 =?us-ascii?Q?DKoP2+uoLYJcpH9YIBRyhf9PYlbL2NNZZAhhktGfdDGYZysATFEpt+SxBH8W?=
 =?us-ascii?Q?vZW9dsgO4W9MU9mUGBHk9lV319x9VIB6dRFTGmBapBYefCZGSUzozlFR82Tl?=
 =?us-ascii?Q?C7Zlv462BSFZjqAdzpvobYAOP0CGQNrJXo1GRhDIYtQvSKbJMs4NELHArWgY?=
 =?us-ascii?Q?UFarwT7gV/whte2EiDH02dNWPJqQIFM2C6R4Ce0jKYuFH4ApXEedp9TZX0i6?=
 =?us-ascii?Q?V0UwdcsqefmrujMIFKvDqOHjwSiRvcwZLBt7QWge/fuxu4iUcnd/Vl9uKSX+?=
 =?us-ascii?Q?CXnhHZL/F3AGxnJ5HOlQM5ZsjFLNOftp6/JMipW0jO743b986sU7e1kAefv+?=
 =?us-ascii?Q?phXO4KcVYr3VRBhDEKpuak1LaAffCkTExJHgMFCrWjFPeHyVJE6MbGGqdyxh?=
 =?us-ascii?Q?ercu5gWvPpWHtslvXVXFdKWabFRRnhkRHsRb86yx0YccT2L/ymbQ9PLOOc/v?=
 =?us-ascii?Q?YhocRO144pUNkks8yHZdxda2cBgB4ckM4yWjA4CrVjD7tcCfJipdNS65gyhD?=
 =?us-ascii?Q?9e3eUQpu07QfEakVcyQ+ghLFedaGDgattOXzYHKu33iXx/n8CK9TJeNDMKcl?=
 =?us-ascii?Q?nmtd6jG+SWGfFotW5n2P54iiLiiz+Rla9FLofxdfm1wkkGEIouYkFMv0n+7+?=
 =?us-ascii?Q?Wtsw71o107DM4Vo9WFjoGuONWk2xh4s=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7f1ddb-fcd3-47f2-a99c-08de58489cab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:23:22.2250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wEfBudaRgVPv62tixmeiAafUDw9NUF/zpvbd4gYP7iOZweyYY6h/jyH/W5Xfd9B6fqTJzkJFHmJVwLddHDQjvWF08bmdSmFK3KHG2pV2xuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12140
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27133-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TYCPR01MB12093.jpnprd01.prod.outlook.com:mid,glider.be:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,baylibre.com:email]
X-Rspamd-Queue-Id: DF6324AA77
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
> Subject: [PATCH v2 3/5] clk: versaclock3: Add freerunning 32.768kHz clock=
 support
>=20
> The Versa 3 clock generator has an internal 32.768kHz oscillator that can
> be routed to the SE1, SE2 and SE3 outputs. This patch exposes it as a
> fixed-rate clock ("vc3-clk-32k") and makes it available as a parent for
> the SE1/SE2/SE3 muxes.
>=20
> The 32.768kHz clock is only intended to be used when explicitly requested
> (i.e. when a rate of exactly 32768Hz is set). Selecting it as a fallback
> for other rates can cause issues, for example in audio configurations.
>=20
> To enforce this, introduce a new helper function,
> _vc3_clk_mux_determine_rate() which rejects configurations where the
> 32.768kHz parent would otherwise be chosen implicitly.
>=20
> Two new fields are added to struct vc3_clk_data:
>   - clk_32k_bitmsk: bit mask for selecting the 32.768kHz oscillator
>   - clk_32k_index: index of the 32.768kHz clock in the mux parent list
>=20
> They are used by clk_mux callbacks to select the appropriate parent clock=
.
>=20
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
> v2 changes: None.
>=20
>  drivers/clk/clk-versaclock3.c | 85 +++++++++++++++++++++++++++++------
>  1 file changed, 71 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.=
c
> index ebd9d75d7f55..b5df349f497d 100644
> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -61,8 +61,10 @@
>  #define VC3_OUTPUT_CTR_DIV4_SRC_SEL	BIT(3)
>=20
>  #define VC3_SE2_CTRL_REG0		0x1f
> +#define VC3_SE2_CTRL_REG0_SE2_FREERUN_32K	BIT(7)
>=20
>  #define VC3_SE3_DIFF1_CTRL_REG		0x21
> +#define VC3_SE3_DIFF1_CTRL_REG_SE3_FREERUN_32K	BIT(7)
>  #define VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL	BIT(6)
>=20
>  #define VC3_DIFF1_CTRL_REG		0x22
> @@ -72,6 +74,7 @@
>  #define VC3_DIFF2_CTRL_REG_DIFF2_CLK_SEL	BIT(7)
>=20
>  #define VC3_SE1_DIV4_CTRL		0x24
> +#define VC3_SE1_DIV4_CTRL_SE1_FREERUN_32K	BIT(4)
>  #define VC3_SE1_DIV4_CTRL_SE1_CLK_SEL	BIT(3)
>=20
>  #define VC3_PLL1_VCO_MIN		300000000UL
> @@ -83,6 +86,9 @@
>  #define VC3_2_POW_16			(U16_MAX + 1)
>  #define VC3_DIV_MASK(width)		((1 << (width)) - 1)
>=20
> +#define VC3_CLK_32K_NAME		"vc3-clk-32k"
> +#define VC3_CLK_32K_FREQ		32768
> +
>  enum vc3_pfd_mux {
>  	VC3_PFD2_MUX,
>  	VC3_PFD3_MUX,
> @@ -134,6 +140,9 @@ enum vc3_clk_mux {
>  struct vc3_clk_data {
>  	u8 offs;
>  	u8 bitmsk;
> +
> +	u8 clk_32k_bitmsk;
> +	u8 clk_32k_index;
>  };
>=20
>  struct vc3_pfd_data {
> @@ -213,6 +222,7 @@ static const struct clk_div_table div3_divs[] =3D {
>  	{}
>  };
>=20
> +static struct clk_hw *clk_32k;
>  static struct clk_hw *clk_out[6];
>=20
>  static u8 vc3_pfd_mux_get_parent(struct clk_hw *hw)
> @@ -549,19 +559,40 @@ static const struct clk_ops vc3_div_ops =3D {
>  	.set_rate =3D vc3_div_set_rate,
>  };
>=20
> +static int _vc3_clk_mux_determine_rate(struct clk_hw *hw,
> +				       struct clk_rate_request *req)
> +{
> +	bool is_32k_req =3D (req->rate =3D=3D VC3_CLK_32K_FREQ);
> +	struct clk_rate_request tmp_req;
> +	int ret;
> +
> +	clk_hw_init_rate_request(hw, &tmp_req, req->rate);
> +
> +	ret =3D clk_mux_determine_rate_flags(hw, &tmp_req, CLK_SET_RATE_PARENT)=
;
> +	if (ret)
> +		return ret;
> +
> +	/* Select the 32.768 kHz parent only when explicitly requested. */
> +	if ((tmp_req.best_parent_rate =3D=3D VC3_CLK_32K_FREQ) && !is_32k_req)
> +		return -EINVAL;
> +
> +	memcpy(req, &tmp_req, sizeof(*req));
> +
> +	return 0;
> +}
> +
>  static int vc3_clk_mux_determine_rate(struct clk_hw *hw,
>  				      struct clk_rate_request *req)
>  {
>  	int frc;
>=20
> -	if (clk_mux_determine_rate_flags(hw, req, CLK_SET_RATE_PARENT)) {
> +	if (_vc3_clk_mux_determine_rate(hw, req)) {
>  		/* The below check is equivalent to (best_parent_rate/rate) */
>  		if (req->best_parent_rate >=3D req->rate) {
>  			frc =3D DIV_ROUND_CLOSEST_ULL(req->best_parent_rate,
>  						    req->rate);
>  			req->rate *=3D frc;
> -			return clk_mux_determine_rate_flags(hw, req,
> -							    CLK_SET_RATE_PARENT);
> +			return _vc3_clk_mux_determine_rate(hw, req);
>  		}
>  	}
>=20
> @@ -576,6 +607,9 @@ static u8 vc3_clk_mux_get_parent(struct clk_hw *hw)
>=20
>  	regmap_read(vc3->regmap, clk_mux->offs, &val);
>=20
> +	if (clk_mux->clk_32k_bitmsk && !(val & clk_mux->clk_32k_bitmsk))
> +		return clk_mux->clk_32k_index;
> +
>  	return !!(val & clk_mux->bitmsk);
>  }
>=20
> @@ -583,9 +617,15 @@ static int vc3_clk_mux_set_parent(struct clk_hw *hw,=
 u8 index)
>  {
>  	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
>  	const struct vc3_clk_data *clk_mux =3D vc3->data;
> +	unsigned int bitmsk =3D clk_mux->clk_32k_bitmsk;
> +	unsigned int val =3D 0;
> +
> +	if (index !=3D clk_mux->clk_32k_index) {
> +		bitmsk |=3D clk_mux->bitmsk;
> +		val =3D clk_mux->clk_32k_bitmsk | (index ? clk_mux->bitmsk : 0);
> +	}
>=20
> -	return regmap_update_bits(vc3->regmap, clk_mux->offs, clk_mux->bitmsk,
> -				  index ? clk_mux->bitmsk : 0);
> +	return regmap_update_bits(vc3->regmap, clk_mux->offs, bitmsk, val);
>  }
>=20
>  static const struct clk_ops vc3_clk_mux_ops =3D {
> @@ -900,18 +940,21 @@ static struct vc3_hw_data clk_div[] =3D {
>  	}
>  };
>=20
> -static const struct clk_parent_data clk_mux_parent_data[][2] =3D {
> +static const struct clk_parent_data clk_mux_parent_data[][3] =3D {
>  	[VC3_SE1_MUX] =3D {
>  		{ .hw =3D &clk_div[VC3_DIV5].hw },
> -		{ .hw =3D &clk_div[VC3_DIV4].hw }
> +		{ .hw =3D &clk_div[VC3_DIV4].hw },
> +		{ .name =3D VC3_CLK_32K_NAME, .index =3D -1 }
>  	},
>  	[VC3_SE2_MUX] =3D {
>  		{ .hw =3D &clk_div[VC3_DIV5].hw },
> -		{ .hw =3D &clk_div[VC3_DIV4].hw }
> +		{ .hw =3D &clk_div[VC3_DIV4].hw },
> +		{ .name =3D VC3_CLK_32K_NAME, .index =3D -1 }
>  	},
>  	[VC3_SE3_MUX] =3D {
>  		{ .hw =3D &clk_div[VC3_DIV2].hw },
> -		{ .hw =3D &clk_div[VC3_DIV4].hw }
> +		{ .hw =3D &clk_div[VC3_DIV4].hw },
> +		{ .name =3D VC3_CLK_32K_NAME, .index =3D -1 }
>  	},
>  	[VC3_DIFF1_MUX] =3D {
>  		{ .hw =3D &clk_div[VC3_DIV1].hw },
> @@ -927,38 +970,44 @@ static struct vc3_hw_data clk_mux[] =3D {
>  	[VC3_SE1_MUX] =3D {
>  		.data =3D &(struct vc3_clk_data) {
>  			.offs =3D VC3_SE1_DIV4_CTRL,
> -			.bitmsk =3D VC3_SE1_DIV4_CTRL_SE1_CLK_SEL
> +			.bitmsk =3D VC3_SE1_DIV4_CTRL_SE1_CLK_SEL,
> +			.clk_32k_bitmsk =3D VC3_SE1_DIV4_CTRL_SE1_FREERUN_32K,
> +			.clk_32k_index =3D 2
>  		},
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "se1_mux",
>  			.ops =3D &vc3_clk_mux_ops,
>  			.parent_data =3D clk_mux_parent_data[VC3_SE1_MUX],
> -			.num_parents =3D 2,
> +			.num_parents =3D 3,
>  			.flags =3D CLK_SET_RATE_PARENT
>  		}
>  	},
>  	[VC3_SE2_MUX] =3D {
>  		.data =3D &(struct vc3_clk_data) {
>  			.offs =3D VC3_SE2_CTRL_REG0,
> +			.clk_32k_bitmsk =3D VC3_SE2_CTRL_REG0_SE2_FREERUN_32K,
> +			.clk_32k_index =3D 2
>  		},
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "se2_mux",
>  			.ops =3D &vc3_clk_mux_ops,
>  			.parent_data =3D clk_mux_parent_data[VC3_SE2_MUX],
> -			.num_parents =3D 2,
> +			.num_parents =3D 3,
>  			.flags =3D CLK_SET_RATE_PARENT
>  		}
>  	},
>  	[VC3_SE3_MUX] =3D {
>  		.data =3D &(struct vc3_clk_data) {
>  			.offs =3D VC3_SE3_DIFF1_CTRL_REG,
> -			.bitmsk =3D VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL
> +			.bitmsk =3D VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL,
> +			.clk_32k_bitmsk =3D VC3_SE3_DIFF1_CTRL_REG_SE3_FREERUN_32K,
> +			.clk_32k_index =3D 2
>  		},
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "se3_mux",
>  			.ops =3D &vc3_clk_mux_ops,
>  			.parent_data =3D clk_mux_parent_data[VC3_SE3_MUX],
> -			.num_parents =3D 2,
> +			.num_parents =3D 3,
>  			.flags =3D CLK_SET_RATE_PARENT
>  		}
>  	},
> @@ -1038,6 +1087,14 @@ static int vc3_probe(struct i2c_client *client)
>  		return ret;
>  	}
>=20
> +	/* Register fixed 32.768kHz clock */
> +	clk_32k =3D devm_clk_hw_register_fixed_rate(dev, VC3_CLK_32K_NAME, NULL=
,
> +						  0, VC3_CLK_32K_FREQ);
> +	if (IS_ERR(clk_32k))
> +		return dev_err_probe(dev, PTR_ERR(clk_32k),
> +				     "Failed to register %dHz fixed clock\n",
> +				     VC3_CLK_32K_FREQ);
> +
>  	/* Register pfd muxes */
>  	for (i =3D 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
>  		clk_pfd_mux[i].regmap =3D regmap;
> --
> 2.51.0


