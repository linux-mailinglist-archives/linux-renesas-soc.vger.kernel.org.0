Return-Path: <linux-renesas-soc+bounces-24762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AADC6D11A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 08:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F334E34B5B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 07:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C35A30BF6A;
	Wed, 19 Nov 2025 07:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CC5H2h3q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3971E5205;
	Wed, 19 Nov 2025 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536634; cv=fail; b=YElOOTOAM5SPpchJWjOwRI7KDofytb+GRb8t2ai1brNGLMM7excCmQM5tEFLFAsw44/mtnpK43YCsO95ooisNOskwkeecJRs3YjS3wUfAGuHTsQdAUTvpqo2C7Pg0SQPCOc+vE5GTG35w01RHpOHf30c7QytB7V8Nt/eCoj+On8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536634; c=relaxed/simple;
	bh=+sW31F+G4DJMLVX52IZnnPJ7iEUH6Qzl2O1wS+SSdjU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hfrLP5iVIJeAlDd+Q5L5nppNgJviCj9QGY7OhOlkvYOLhiKvB1QCGJE51B2tWGbRE1udPu1tSXidsHVCH4vdtXXauqOS8IPnDoNzIEPcy8Uv0k4V4QX9O5tYQiDV2YKeb0keje9o0DcDtr2b6D/5JLI4IKnwQzXojArweWydtaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CC5H2h3q; arc=fail smtp.client-ip=52.101.229.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBSu6/OPB15KX0uk9HpKrGAfXW3f2VAehML9ed0DU7KezP+6uPF0lVnI33/4vVZGxQq9bzfTYAuMg/qo2TaOFxuQnFxXqPTlIZEXdmOGvBIc2sL1mk8e837nGEuKyse2w42FgQho2sjsG8wUlJ0JoNQey29o+4ANx37duVDmTU2wNswxEo8v0PRU75+SXC8zt+bt2+qg5LflQdBIlLSx+N0HTZOlFsfGsHpxwz/u7CelYNab4GaBrJa7Pnpxys/cepU+hdGSiVcB+Fx6LDdhBaxIAtGP9DefWv4DQjO5FTYxKrBvY5P2KV8L9gp6LOG5+qEFDpD8ML/rW9QDoWuIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sW31F+G4DJMLVX52IZnnPJ7iEUH6Qzl2O1wS+SSdjU=;
 b=CR+G+W2ZI/coRQ136O+bLyru3SimfyopRwxqFwkslP2Qwip0uS/3qpqvJW1RKYPnMY5Cdn945ZFoGInshPm2shAs4S4upWeJV9lZ2MXZZAKFq4UmFZQL9Um2bxXTvN/BAf8SZNUVlW4sUl4bO5AFQm0aObTBDMw870dr18fyGvX5jNQdDYp82zgaZpbjATsHEmlZ9MpfVROHkDRIPu4AOLl1bcZk/H/9GiAkfFIT8HSIimyQj7PY1nK0ubd7qHb7Jh6J/wOat6oXkbg90gJfRjata4CwVVDZQFZLYRaQ+4a8IBaS9runIqvVSA7jXdXf9waey5Z7SYcRf9zNeuh+Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sW31F+G4DJMLVX52IZnnPJ7iEUH6Qzl2O1wS+SSdjU=;
 b=CC5H2h3qdk4WX+dvZ9wQF4gY2Koea9BbAy3gzW2C7kj/xjBKkPOp2lR1THxzepH/nD5IewiGqdlu6JTUH81FM868a4Y+4DQTE2W9P/MoZAH55y4bFzqeu03KR7RfS958Bem3YEnEbC8gObkYVzz8sIsiTy1fgbRwVRa2EU5uD7g=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6844.jpnprd01.prod.outlook.com (2603:1096:400:d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:17:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:17:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Add overlay
 for P3T1085UK-ARD
Thread-Topic: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Add overlay
 for P3T1085UK-ARD
Thread-Index: AQHcWKqFpuAYyL2rv0yF3Cw2HQchp7T5BAQAgACBvgCAABA/AA==
Date: Wed, 19 Nov 2025 07:17:05 +0000
Message-ID:
 <TY3PR01MB11346F52C1E32C9960436561A86D7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <0babc991d3b2163200bc083ef80563931d4b639a.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <aRyiQJsu6gob3Gf9@shikoro> <aRzzEgeetDFlE3YC@tom-desktop>
 <aR1f6PMbG0N_9oAo@shikoro>
In-Reply-To: <aR1f6PMbG0N_9oAo@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6844:EE_
x-ms-office365-filtering-correlation-id: f9b19f7b-f8e0-45da-c4c0-08de273ba4e6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?24U5GnKwsFYnTNJEI0flD3TFqtoENqqePdfF4/b0n+vpbDtUc6lsxJgzp2?=
 =?iso-8859-1?Q?aKdZEcVT+aR62CFCW6pyyUCsw5NJquJ0GcaFzG6D1bkxBerfkIUcRnOdhP?=
 =?iso-8859-1?Q?LaY12vY7LUCl5s4mjrDYaTHS7D8d5xhlIRzyX/60WIfuaC3gsfLnhMVtlG?=
 =?iso-8859-1?Q?y+qsUsxL9AXO1LoQLuozXYkYRGX5ot0MAeEX6hbMn5FQIf5+F+DP8HvmId?=
 =?iso-8859-1?Q?ciElkH6mxYl4CaP3jERF1eRvDvwS/qPhdb0ydv+YGvbjhk0U9xstLTX3Me?=
 =?iso-8859-1?Q?80KVhN9dGOTm09s5hI5K4BY3seXOVMk4VzLncn9JLWyDSv8kwSl+Du0wRL?=
 =?iso-8859-1?Q?Kg46NRdJJD8rstiAJfRq6W4ut1cgtn/QNA/tHCGaunhwa+s6wTJMlzUsno?=
 =?iso-8859-1?Q?zow7VqEDo75Hz142TzQeh/AeMJJcIojDeU5DA8F2jz4O0a3hKAcl1oapE9?=
 =?iso-8859-1?Q?wkAEi6die/rXZx4V1NRBka0EDlr9Hdomd5xZvokrD7L6E/J1iq/5gHg5zt?=
 =?iso-8859-1?Q?3n+lL6E0ipxBG1Hg4xalGxiK13AuTnnmlmUMGozkAexOf0TOgiqQQa9Cjg?=
 =?iso-8859-1?Q?6jVGsAtTV2Q3F/nRQtqaBPtewkLpb8aw0BMhLgbBE87SizvWYnO2rZ7pU0?=
 =?iso-8859-1?Q?J4DptGfUdfHFl7WkyPXg2DoX7E4zSKNEFAaEF8iCQzCAN6EEzGNF8/Ef1t?=
 =?iso-8859-1?Q?vP9HA05HOV8/JaB7VJk4hbHasPnQozeU95FJi+jPi76r6ENQrmQpbgQl3G?=
 =?iso-8859-1?Q?jBERQuU/s3++yGw0okQNdLHR/TV1i5WxlZ30VtpSm+mJGKluatzj0RaIjG?=
 =?iso-8859-1?Q?3Rd+SCE2NLseHo3E9KE+4HPSeWIu6m1RRQEBoPvikGwRcMDNlSSCoC2G0X?=
 =?iso-8859-1?Q?24LKqT0VqWkdARKBLjq1q49RCSLDvb3NUaZzExrEdv+9otmX4KoeY/00SX?=
 =?iso-8859-1?Q?yxKeMpR6l36yEfOQ/u7vpdpmkFHhQ2S4ZqKN1OUtNnU++VWdDMKEpjs9CB?=
 =?iso-8859-1?Q?Ybbyr56jALivRkfgF9gLfq9bqsFoXUjc4MYNWsUU4uJ98btVCBNAj6eTPm?=
 =?iso-8859-1?Q?klQNAc9oT0WwMt0Twt7J7jeHuDCu1Mfp/vPHcSsgu3ecYamWjFepQK0gEm?=
 =?iso-8859-1?Q?+sX6qUmZGGy3qF7BiqLzV/ZwrUi6tA40/caFkVo0FBPLExBP7rGBIwxno7?=
 =?iso-8859-1?Q?/RLENoTdBCbpfFMssNC1gYJqeDdphpdgkHE0C2hh4oPUFccRHvRXnXOpWD?=
 =?iso-8859-1?Q?kG7A9mLH7EfFGD/vQ6iK5MjTXd54Jxu3QjWYLiw3cskk1c/rD+vtDAPIY2?=
 =?iso-8859-1?Q?EHS0TWloVqeAk5GjDgzc8TCOY2HfRtlPymexqbaA/F/wsW4nUXWCq6sToQ?=
 =?iso-8859-1?Q?oXyEwT2Non9arhjmRaEkQaFBA533/Q1F+DxbAECb6i0+LjRnpyGoeaiRNk?=
 =?iso-8859-1?Q?dO4SH9uk3u5SRFN0YD3Theho2A9H1O3mvla8lha4k3vDwNxU9h1Adh3idG?=
 =?iso-8859-1?Q?L4/0eO3Jf50thj5zpHMwBKj3Zkf6o2VWsarA6s2XQ3BbtSlKF+PG61DPM7?=
 =?iso-8859-1?Q?MbN8r3xTHg9QOPn5X239d5kF7jCC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7ENBYG2TkzxjEeN8jcJMX4HYPJkVvIRz5v1kNBo8EUHwbEthx4ZLQyz1sS?=
 =?iso-8859-1?Q?gbonVSGB4625sdqJFR1jtxgIOWV8yIqQdwEtM3a4/BCPSSNJrPeOJbfZOF?=
 =?iso-8859-1?Q?dlOUiWNgn1sZKU2+XdiZhLvAgpDvtzyJVD+On7OiQvh0ZqHrV5AzzSBOxL?=
 =?iso-8859-1?Q?+DvjiWy84ei6pK7syJUt38/ZZquCUKm5q1+FmNAWytYVHF5ih9vCAIESbY?=
 =?iso-8859-1?Q?u8h8DzsGh/rZuDzOT50F7cqnIR5fd9VI3aHETuP0Ifbvxm+GkyjnNoWsDp?=
 =?iso-8859-1?Q?2H1QN/NXYis1zm3qt7+XSQY70h7rzt4G9FuGPHEleLQX8kGeahmvWJY2eb?=
 =?iso-8859-1?Q?wrWY7QEb1XDwgK6thKrkFpsAa6iWmET5CKRmpzjFajI2i1IaYr7mfHp2Mn?=
 =?iso-8859-1?Q?IsWhODPzTtjABv4fMFNjt3y5d9p8XM/OJHMy76POd2sDmiWFP7oFMTLaeV?=
 =?iso-8859-1?Q?mmwUFn+kq+ek8J/ioZ/x6SJdGCUtkAivjuu7E47nH0cK7tZ7gg6VdrHI1X?=
 =?iso-8859-1?Q?kQh0dM4XDpQLMMngWpyQ73gb+b03L1rKFglwx+C2WGi+/se6/Oj8PX1sl4?=
 =?iso-8859-1?Q?eBTIfIblX/BVx9Q/UHWau67quCY2IwuqY5UOFyLDo1+JlFLVT2QlxceUHo?=
 =?iso-8859-1?Q?EZevnjYSzEemefF+Rz5fLrN7xNk92NZvCTLPGN/EgwKJCLUyVjg3gKqyVN?=
 =?iso-8859-1?Q?0I/3WU6mBl57fcsA757W2+X0t/TRrj/WHlM8xYMNxOHDlGANqdLwgsEQvo?=
 =?iso-8859-1?Q?0FAriHSCq+jgc93TRuegxFLhN8/r+9A5JeHdhb1E48VWM0mo6OUXU92z9d?=
 =?iso-8859-1?Q?TIlQtoW6Q4OeldpJlCHmH3S+Zr1heKm82CRHFrGB53kvSWEbWiZNnzGZ26?=
 =?iso-8859-1?Q?gt3jxi7boR3Xl3Ci7R+F3CalzKn2zp4j63bJHZrL2o/I8l4BZE18/2VT4P?=
 =?iso-8859-1?Q?gMI+aVzUBkkXtW6FZ7OtTwmqh8R5ESJcctgcCgUroxccVZDAfC7h+c27RC?=
 =?iso-8859-1?Q?S5eoXMxsZ/24tbJdIaOYtJw8HbncYkvxO9Mm96EZld6h/TVPKD20EpYuG7?=
 =?iso-8859-1?Q?j0SqyMwCX+08veUnXfIn1rXwcEh9WV1LB1Ja1Jrlw0tNQPze52KGkFcQjL?=
 =?iso-8859-1?Q?6Etmnva2mASmWgTnpk6ZrzyTK+GMrwMgY90ak/UfS+3QApFvBo/NIK22/f?=
 =?iso-8859-1?Q?1pJF/D54yMuTiLSwdZMcUkRyNg3ffhLn8Pgso0asfmSN3hPmtcQJp7s1ws?=
 =?iso-8859-1?Q?gJFRwBCYen76pLv0XeDmWQfcvqw4WT6aoxVugwDAxj55YiEF8P4lwQ1to3?=
 =?iso-8859-1?Q?ohJw3GcORafZ68aPgmoFhTFP5Hz5kekedJaV3NbFnsngjNxQxe3PBWCUoS?=
 =?iso-8859-1?Q?rUc4Yy6E8j5MkVXD0SWEnrmsvK+tZlWW91ZQmWgFB2c7vF/GImyggdsOpk?=
 =?iso-8859-1?Q?S9PFrFUuyQLAKn6lgTpqt8xpALtbl8Ydp5IQmzQjXDqDhPmtwqIYH8DSMP?=
 =?iso-8859-1?Q?sDd9+GEdAh3Z4EfLDS7APivaCZfy86o7hrCYN0H8Bvs7xJg+74o9wVL7Er?=
 =?iso-8859-1?Q?sYfJ/R2Sl5ysEK1Qts+S7JecEgoSINWA3Vyxequpg7ptjdSBP5gX9InzT5?=
 =?iso-8859-1?Q?tkop8Ey/djKervqgxrZnq2cJfDDUard1chKtLIgC51lRmUFK0vfdcFeQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b19f7b-f8e0-45da-c4c0-08de273ba4e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 07:17:05.5795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xeFKLB/IiDGv+bfMUCD84xkq9r4LXZoQrVeWwPsfnsqGh9XN9ekbJ+JbmF36M7jcbEvqoNaWcmc55a3/DWofzd8brDwgDWplt7frfQZzu+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6844

Hi Wolfram Sang, Tommasso,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 19 November 2025 06:13
> Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Add ove=
rlay for P3T1085UK-ARD
>=20
>=20
> > Your suggestion is to keep only Patch 1/2 dropping alias line right?
>=20
> Yes.


When using I3C in I=B2C-compatible mode, my understanding is that on Linux =
you need to
select different drivers via the device tree. However, from an application =
perspective,
an I=B2C-based Linux application should interact in the same way whether it=
's controlling
I3C in I=B2C mode or RIIC. Is that correct?

The whole idea of the Linux HAL is to provide a unified interface for I=B2C=
 communication=20
to ensure software portability. If that is the case, if we are using i3c as=
 i2c which
alias it will be assigned? The next unused one. It will change if we define=
 another
alias for normal i2c.


For eg: we have 9 i2c channels and board dts at the moment
defines only 2.

i2c0 =3D &i2c0;
i2c2 =3D &i2c2;

Cheers,
Biju

