Return-Path: <linux-renesas-soc+bounces-12391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BD0A1A42D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 13:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186001887EA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 12:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDE820E71E;
	Thu, 23 Jan 2025 12:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZpT6ZEBV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09D320E715;
	Thu, 23 Jan 2025 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737635249; cv=fail; b=q6x4JLWjPFifFrkHfK/WxYoGCbkbvc0dywo08LHr91OuG+i9207lAdbR6BowBsL6A0knt/jd0BKkloDNEdoRwUwYowfkN2hoietOGF2zzJZaCnliWSekRoEBg7URc9EgAEB6TPFzPvfVtHzJ1SXC1gNTagZJ0YxQRkhMR/naT2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737635249; c=relaxed/simple;
	bh=eeOtsoIG91wifJm0P3PkpcS5t5+/QTZH1FiU+PNY5qg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SpbbXVwQVKF79wNH17WlrOnLTB90jxkhNpN65+83dqM7qSryhEteBRlWmUAzBsaa2xc56RnlX4mEOkX0gIR2c+/Jy+8+zsThT4piqVA8AOS0Z3D6EUWklZAXb0FVVcwlZmrzTvX+wWJw7E57muudgeXI7H1eypIYjBENw7XzoK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZpT6ZEBV; arc=fail smtp.client-ip=40.107.74.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZW3pNScVWlmKZhnsJ8t0q9/PoOdLcEAPescVJ1ipvSX7tACeV3tuW+ta5/QNX+ZsfpuJJqqtgILtnt+Qcx/5gGWMxKFbpfYcP3PI1QhX5+rVq+2LPtAW8/lY1n5MMjAgHF7kX8CDWRIHaLED+EVIt9hHX7GHBji+BPIrkx/xoF2uloAG02rKWrCAIdM+NAIDiryHamXVfM51WFNIUJrD2x99mcLM3tjErauvg8xqcZPzu0QTP4dpVBPxrm/VC6OWygjO7a6a+lLM1xnt1hIovdF3zzwOoB58cHBkE1AV58tEK0d2R+ECQGkvcfRj9OW2yO7cp2OSbsv+1L8m9WjMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l96cT7kYtkMwaf+W1pNsNp7ONT2K4ZNUHaYE6ke+tHk=;
 b=iAXB5SEF5wMYe9vUSzgaAc6mS05PjBwudT0PW5URjCmm4FRHBaXK+izCvxjfowT1CvEbnfK9aOIplkDs2doHBlsZ5To2W+eqZV1ypxG6DWPHmyxazO8C8jjfpJtqmmFfSmzxtjiMWxpDK2M+mIkMvHJTYWf9FOSXFcBr8qeSCLJ938TZ8d0QzCcoFgkw2H7iBUNzvOfp8kuWtyYbGus8UqHsw4OfQHyQ7NOCCiv06vkOdy6+qmGq+1O7veRDx1rafu0fFGyzn0i79XU3J2U35CO11aT/3utoW7khBryUhmssDj9nE2ykuG+SNT008FO/N5ShF8PPb+VElMYMe/ANtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l96cT7kYtkMwaf+W1pNsNp7ONT2K4ZNUHaYE6ke+tHk=;
 b=ZpT6ZEBVx9UF/WSL8hUOwLSQqc69PioF2xv82250Q0wpv1waF3odJ6paeQk+283kqG+eU3RFOnbafN1qTvzFzo/PIV9A3IzXDASoJI8M71iOzVAZYgssfubYQ+aUDXNDglkQ2xAn4WRHuubidYu6FBFF13lac48zl6fZUxsRhQg=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by OS3PR01MB8413.jpnprd01.prod.outlook.com (2603:1096:604:191::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 12:27:22 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%5]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 12:27:15 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "geert+renesas@glider.be" <geert+renesas@glider.be>, "robh@kernel.org"
	<robh@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>
Subject: RE: [PATCH v3 2/9] dt-bindings: soc: renesas: Add RZ/G3E variant SYS
 binding
Thread-Topic: [PATCH v3 2/9] dt-bindings: soc: renesas: Add RZ/G3E variant SYS
 binding
Thread-Index: AQHbbLn+0pXUz1uua0SSeZP5IZihULMj/AuAgABFDjA=
Date: Thu, 23 Jan 2025 12:27:15 +0000
Message-ID:
 <OSBPR01MB2775A037F15E614EDCFB0640FFE02@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
 <20250122103911.517484-3-john.madieu.xa@bp.renesas.com>
 <20250123-conscious-resolute-dog-b3dda7@krzk-bin>
In-Reply-To: <20250123-conscious-resolute-dog-b3dda7@krzk-bin>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|OS3PR01MB8413:EE_
x-ms-office365-filtering-correlation-id: f135ac9e-6d3b-4933-4734-08dd3ba94554
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JEeHojnbc3vfxjIbIBRFrFd5DSDjJMGfbG0iGe8t/mHQ1Cl8LhRLzyLW4Um4?=
 =?us-ascii?Q?ivxLJRtIEywr37+KLdXQ/vP+h9fX3eoF1yQbClBz0ogkeY9zxrg4p7nBt1yl?=
 =?us-ascii?Q?V/UffauOwXwlsdjWIGhdzPvBEG/Si5tIA7hfwpXcOR5+M2BuTtIWb0mLejl3?=
 =?us-ascii?Q?g4xrwQF6/4G5/+7xc/WgHGPPPkD9R8RM5/qrtAoSdNnGuGVffI1esEkxeyoj?=
 =?us-ascii?Q?ZzAkrX8BqXRb4ZDZQjSVdN99KANvMdreUI+hv8j2VOiIL/QsiYCRIoNA1Awh?=
 =?us-ascii?Q?izoXfjKeLZ7HCZPVzeyH+obrdC4Ugb4UCr7qKgGg3Hep0Mz6OvQB7JMEeosC?=
 =?us-ascii?Q?Y7Jdseyzus7BA0GZJM8cVtgsjh1PAncEC7QCSK4YHwYO18DYX9PnbIhTbWAh?=
 =?us-ascii?Q?dP23gvv2ODO+IpXrGibLAmeXpCTCx/k4ivoO2ISeKx0r6kjA7phG/k5RsiRL?=
 =?us-ascii?Q?gx1TqUo4gOg/dmM7+2QLOLAGTwxT13YgCxFYDZ2sB+7b6TgVg7LoN+N8gysI?=
 =?us-ascii?Q?pUAqbrnoB39l3DNkDwo2sFIbM0urp7DT3NCVYiKXsWKV6kopCZT48WhkVZdV?=
 =?us-ascii?Q?AUH6ROlMhfFj8Am3AN7925fNwHfHVB3ZNNheO3cAuLsmWsyEt3hoZeUz6Avw?=
 =?us-ascii?Q?0kyC4aMHih3cjUkiXYrFnIVlMqnA2qcahOwQqvx5URgItIRaDs6gI9wLqvOB?=
 =?us-ascii?Q?zB/muYP4BZpHRVRj5vu1zRfu6pz2YNnK9q9vydWs2/H9bvTbwfHcZf0my/za?=
 =?us-ascii?Q?JHAKIFC+MixaEs+cqaLj9t+3I8PAXgiotjGRjOoMbamWDF3br6YrLY2XvHqq?=
 =?us-ascii?Q?PI360ifsqAAqlTJAoBtq4uykVS6HEexKUElKLVXS8kOYSJXLm1Q0CvYPlAgZ?=
 =?us-ascii?Q?MYdi95TYDeLuEyXl9HSB9Gb733mIwZEvFSgcnggcskuTHufDW4GABTHnl2Uu?=
 =?us-ascii?Q?cTQHQKptMMzvXYyph6vS1NhYccqyW8sJSbSMBCLHJ9YF7gUcVfCl6xGrtylw?=
 =?us-ascii?Q?U9oqI3XU/uKu441AS25+BoJcUdj3e4hcJL1WBIzlMGDrvaBQ/VJtjMSvGNqd?=
 =?us-ascii?Q?J7+VtiDqCmkCVl+j1HruV7VuD/CijATR01IKYJn9Rcb01JgSRjPytGkVKXPt?=
 =?us-ascii?Q?pXQLcjjKXV+0DE53ZbZv10GBqbVgu3IKKTZKIf6NeaOY1hLTzQifgrZ7A1pw?=
 =?us-ascii?Q?x+6iyvOQ9A61VPhZxIXTVKBz7f54XJJqeiVQs7rKCRLyAtHBR8rKVTTkl1Gv?=
 =?us-ascii?Q?GUjkMHK2zrGS8ttyw7HwZ21j+ASySpviIRLnu+jqISnGpmth2sxPjwfT7RrY?=
 =?us-ascii?Q?mK0FKUgOOO+D/NRBE9q+WqZUe8gLbS3ACdpA+XhtkICVxVSaoK4L2PPytzaF?=
 =?us-ascii?Q?G2BKc3OhvfUJoLzKRk6+BTAiPdz1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RxgtXxNZJK25sQhrUdx19CySXfNmSAY7B6FkStE6nXZkTNvfXbOcIHeNqHtJ?=
 =?us-ascii?Q?7Z3NDP7YWnxI02EkBR9i8Jmi1RTn+rE9VW+vidfFlbzexVhJbSFwwvfzFtSo?=
 =?us-ascii?Q?nXSm7yzEEdRZFBKcoQargJ8yPfznIvI2zMH3aTGMiu4YwHA0KrYPuhMyZFiT?=
 =?us-ascii?Q?xiMUSCo3g/hBwONmMyEzDNil8FofIqPan8ogHnA1sXTzltIwRgUJ8yaSs3iu?=
 =?us-ascii?Q?tP8iNCp0jCIn/D+3SgTOTxXqgjjbvHHnW3DDh6ESv7iW1S6RBypQB7+5NgWQ?=
 =?us-ascii?Q?mngGOuiAftaUeftdT7MO4/Aw2yvnkOE5h1AjYPRDLjuLxqi1wkuJPd36oq2G?=
 =?us-ascii?Q?iy7WPtSFbeDTXsco1QbRLprpTR5F5R3p0nWJOa3muxJ0DC6vekwcO6OkQzcO?=
 =?us-ascii?Q?DiffbyolYVksz5gCxla5vFVDJkdM2xeRgV0ik1cwikxNLt/KeEuQhxhMQJy3?=
 =?us-ascii?Q?ICSY/QJZADeCYYtNOUk4DlfJrM6izPOVDGTIVD49r/rfxevqdEuIaNmWMuLt?=
 =?us-ascii?Q?lcqmRrfWP0UutYhcr/T+kKQVmB7S0ierv3GNR1IMo4nUaOafeIFUJy19iMzf?=
 =?us-ascii?Q?in9gUkbu7AntTjhHA0i8TkslBpAtIPXOlrOz9d/bFrRxhtwoNe90dAkgiX15?=
 =?us-ascii?Q?x+p1d7EDsIX8k+AGbLuMwGJpEz2uI2sPsVMQSybv7mcsR8WAOGsu+gKpMdj5?=
 =?us-ascii?Q?NsmABcISBXdB/Yt49xBP2+kdnFUTBqCYZUyLjIbVbeIyWl5m7W9p1dWgPR7d?=
 =?us-ascii?Q?q2lTqnnzkEch1PjI//1mZACbNZWOW66OwtdUyV6emidvQZCdvL3litxrhFHJ?=
 =?us-ascii?Q?duoNSTUkUXX5LKsessqcmwpGrnWM8ySIJfmovRAphb4gBh62bdGZdPiVJHt5?=
 =?us-ascii?Q?lFCSir/XGEzh8JkaR1ADL/DJY587KpoSYkrL2BVPw3fKDxB2W4Yy3Fdcntdu?=
 =?us-ascii?Q?R2aTvJCk+cvtZPU9b6xkbYm4QO+9XP63GWWm8uQs7FaJ18xdhHaPxFtl4cDX?=
 =?us-ascii?Q?oVV9t6itS7IdqbaaM9UvZbuRQso0dA8WR8YTHrSK1DonMob5u451hukINo5b?=
 =?us-ascii?Q?JHfWUpsPo16E9et0rfnkYMDmm3gTmN+YllooiswHi8LMSyr6MMcLpdDu8omu?=
 =?us-ascii?Q?CLZDqI8fvSiqgHk5GpO9qp8jYGfBSXC/wzmKC5nfkizG82oHXHLlJvDUHtfB?=
 =?us-ascii?Q?ED8sND8AA8h0vtdfT7a9EYTwBaVkpqzRijhzdZUL7QpCOftoPL3BUuLYR3I9?=
 =?us-ascii?Q?8Y1cS+T00jRbv4FEC/7hyok/cWHXlFTci5ZRosW4E1pubYxG/+jXFm2+kjor?=
 =?us-ascii?Q?XrPI5V9c0KvrWUaeem1qW34oraTdxGQL4hrJz00Yb93dvJZYAZbUSPHWk4rb?=
 =?us-ascii?Q?pux9j4QJJWc1G1aEIofef+ATiijoqvClyGs/4HdMTGOEuvqRhY65zBEV1C++?=
 =?us-ascii?Q?wha3+QWzxJWW3xZIDRDq6mhepc12V+65vmSMFqHYPYJZq7CfHPsPhPkYliDb?=
 =?us-ascii?Q?+JJ5APjFvRF4m4ZB7IXoYJ1yUh49TQlBHK6G7KLsw5Sj9vn0KSwRQ5uAikV0?=
 =?us-ascii?Q?wsNBjqzmS+0LaoKX1Qrcs+O7huNsmJiq61BHlkV+4DT8PkkeJFy79+FCLEvB?=
 =?us-ascii?Q?NA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f135ac9e-6d3b-4933-4734-08dd3ba94554
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 12:27:15.5096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJsInToblwpv+RmWQXg9hjIkbRS/p+fUxV5TWsN1ZWuYUDjm7aXjYUrZJOOed3o61viqXNxYyZvsEONPaJ3U6o8IGqSpdTZYS6Kb4D8WWa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8413

Hi Krzysztof,

Thanks for your feedback.

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, January 23, 2025 8:45 AM
> Subject: Re: [PATCH v3 2/9] dt-bindings: soc: renesas: Add RZ/G3E variant
> SYS binding
>=20
> On Wed, Jan 22, 2025 at 11:39:04AM +0100, John Madieu wrote:
> > Add RZ/G3E (R9A09G047) variant to the existing RZ/V2H System
> > Controller (SYS) binding as both IPs are compatible.
> >
> > They however have different SoC IDs, RZ/G3E has has VSP control
> > Register compared to RZ/V2H SYS IP. Hence a new compatible string
> > renesas,r9a09g047-sys introduced to handle these differences.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >  .../bindings/soc/renesas/renesas,r9a09g057-sys.yaml          | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
>=20
> <form letter>
> This is a friendly reminder during the review process.
>=20
> It looks like you received a tag and forgot to add it.
>=20

Thanks for the link[1].

I forgot to add the Rb tag from Rob and I also updated the commit
description. I Will fix it in v4.

[1] https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/=
submitting-patches.rst#L597

Best regards,
John


