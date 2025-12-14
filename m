Return-Path: <linux-renesas-soc+bounces-25737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D7ACBB72B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Dec 2025 08:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC9673004CB4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Dec 2025 07:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EDC1DF751;
	Sun, 14 Dec 2025 07:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H5pIuCWQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0EDF6C;
	Sun, 14 Dec 2025 07:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765695843; cv=fail; b=u5ZjsbMZ1KtxsPpK7uFyYhp+zqX0E6dZNuCgjX/aI93wJ6uDla4P7qbncnR/QsMHt6yhFZA0O2Jzi/mwIYY3MZyr52eElMtFOyt2YBsiNsm8stZIeibXdVrkw0XrI73b2GGAFAj8Q2+0h8x34DI+WukZWKLZRXW7W+y/yXSaT/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765695843; c=relaxed/simple;
	bh=7Kvgk0pGTqLT32TMYi/W395ooknprdPC6Q14RIUYbb8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CpWglOuRD77PF4JsdnBSrbGIJ7tYA08MjmsWp2gz90QEl+IWVnb/P7YECmDYuLPUmR3Rkg0xNrRsZ9VEfXjd/sDk0aXYuKxBhBhD9jKaCNWNqXC/hNqteBi5iAW7RgDtVvQoNS1ONRjI/Sl9kc6MMwq+uBuM2pUUThqK0MR4qYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H5pIuCWQ; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDdWHtJvlolru1tIj05YLUdU6L0nazZVtUIEVPEUd4btoSv4yQw6lIm3E32hKbI3vSWjJbDZpSM8pijIK11Oja2pxS3txKlZWL2+YMVFeRJ6XdZuYrl0NVFqYtPn50uCRQppl413nE8VdG+tajcdwRlCCtZNLejL2aNpCK3OuY8Z4/9xe0J5xAG+ycMolOQEI4ozS3SDrW//MNI21SXw4dNbXsQ1C2xOd2G7iiIEv7gq3DwnpVVf1eS7btZWc7vI/mpHcQeHX/zz0YZoQc+/PNey73wXNX9tZ/cWcuYpHZ7j0KVXzo8iMBhOWSpLDSrFTNbbLCdIRaLtbwiBUxyVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np69Y/mwi718zGv/64IgK7ZpNUW0se2zx6bTByriTAk=;
 b=LEYMq/2avUSrKXtdJ2QiVJ4QBvMv1gN1I5W29yRdbPaSPrKOrRn3GhGesjio5LZTmtg28ElTAZ2mlqJazdmrRkYieVY9+t+YGKidm08dvUR8uGoVou+OwJurfObimVvTkSF5m86J3nPFRmdX0v4sssdMUlyqEGCDu1eNhJRmnR6p25sHCM3pPt+hYaMt8g9pX2lVjsjL/iVjGVphruvjpXBKvqkWhAif2sPMAIKP1qYDR6ioLBZyzji+R5EKwiiJK8IWgtU15D5+ycf2B21o25bIybKKHi77G8Iu1VRJTXYZcor/5Ny9WJgdigmvV9iTfYGuw3G36942Y1kDr7fgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=np69Y/mwi718zGv/64IgK7ZpNUW0se2zx6bTByriTAk=;
 b=H5pIuCWQaQQJWINRwagESH9LfSKD7KuE8rSwm7+YR1b6tfg5ZYxpr05Hp5VUQVIddrSD592uMDHhQVj8FGp2Au8ult1piU/rsKxmClVpFvm/UmxvQi8ROX43APxkk9ICDdOi7ime+P557d0G5g5YdUJiG2XL+jmdis0/z8uPbhg=
Received: from OSZPR01MB8123.jpnprd01.prod.outlook.com (2603:1096:604:165::7)
 by OS9PR01MB17534.jpnprd01.prod.outlook.com (2603:1096:604:450::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Sun, 14 Dec
 2025 07:03:54 +0000
Received: from OSZPR01MB8123.jpnprd01.prod.outlook.com
 ([fe80::f2ff:7635:979f:c31a]) by OSZPR01MB8123.jpnprd01.prod.outlook.com
 ([fe80::f2ff:7635:979f:c31a%4]) with mapi id 15.20.9434.001; Sun, 14 Dec 2025
 07:03:49 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm/arm64: dts: renesas: Drop unused .dtsi
Thread-Topic: [PATCH] arm/arm64: dts: renesas: Drop unused .dtsi
Thread-Index: AQHca6aDP7YytD0wq0uDSfpWtBMgJrUgtVkQ
Date: Sun, 14 Dec 2025 07:03:49 +0000
Message-ID:
 <OSZPR01MB81234597C5AA9B5C17264990B7ACA@OSZPR01MB8123.jpnprd01.prod.outlook.com>
References: <20251212203226.458694-1-robh@kernel.org>
In-Reply-To: <20251212203226.458694-1-robh@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8123:EE_|OS9PR01MB17534:EE_
x-ms-office365-filtering-correlation-id: c8b402d4-d819-4e1e-c012-08de3adeeed2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?WwnO6UJps46zPpjCx7egRxk30bso8HWVijNuad1WZoo8LEuac11ilXPr?=
 =?Windows-1252?Q?QTxSxUtkqbNdKVUfhYD+Pqcwk2hsZEz0N8rNsWfIJoifxpf4Mt9N8rOE?=
 =?Windows-1252?Q?Nup0kJ5SwrgKQPO2r51IsZKLeSeLSF+JoRzZrnAQsc1lkQ5mUMl6OHm5?=
 =?Windows-1252?Q?UqEu4gji+IWvNfc01NAd1pQ8jffO7ndzERtSM45kOopc1SkGu8cANI0O?=
 =?Windows-1252?Q?OLiEBbhE9afiXv6tfmJvDx3SDsfarHSL/g+h7vjJ5hyS6vL4sbx5EaHA?=
 =?Windows-1252?Q?OQrX5/B4gWKt+6SlArZDBgGnxiw+wbnpKkZnnlQfGmrojHpUvlho6FKg?=
 =?Windows-1252?Q?rOY6mXu0A+nXfmCDD6ka1N9r94IO4135kp+bF85ZAI5gLvgiw7GUOnF3?=
 =?Windows-1252?Q?id/nxSbARyOv+mn4tG7+Q0pjNPmTo5Ce70viRcVYQAYsrxTEyEpBAjJE?=
 =?Windows-1252?Q?u3hcxqxX194iLmwVSfNe82jGmkfD2wUpFZcK4brZ87NuWqlVGIlT/E1J?=
 =?Windows-1252?Q?gj9HIUnVkVpQp0LSA3hstDyOaxg6wZ4rBoBFn1HlH6Eh8GupasY193Ni?=
 =?Windows-1252?Q?di/NG+/QDWm2c40WxAuhiiicn0MHe+6dEZVB7KNYgr80qo1RRPXwYQeB?=
 =?Windows-1252?Q?SXdNV10ZRsYkb5QNulv5t1AQLZq+THA70rSXyOnFpBRRw8F4rUWlPYxF?=
 =?Windows-1252?Q?g/rq2/9+m7LqODIjf/3qAWCrjdH5ZNsNIqV/htDk6mYgfACZZP8a7j3c?=
 =?Windows-1252?Q?9bQcQDsWEOqGKMp+ByzLdh/bjdYwYJpvXYlCtZ73NuPZNKf1nyS2LYrt?=
 =?Windows-1252?Q?cGv2Hq/5EB9k/knRqZXdX24De+nhDBs8chCwIe33A/XRe+ynY1bGINDW?=
 =?Windows-1252?Q?i9WNpbuCk1ltKqrhHCXUQnvHbPtoaJF04x8q4lkC3sL8nrha4VBfO+Pi?=
 =?Windows-1252?Q?ITZPOiq0hG/71/ZYzJfUUvyqDwKcvUzoL0f1se9PgWlJYTzFXSm3NHex?=
 =?Windows-1252?Q?EamgfKXwakrmpmpP9evpGl79GpbN6oPavJm5jB49aEgdffrZ4hfMK8TR?=
 =?Windows-1252?Q?bodfsh+HbUJ16kBsMjFuRubN+ML02lp24CmUnZUbbQqW4VtbwvnN10YL?=
 =?Windows-1252?Q?rMXCo4Z6UbjUZrLBqwp5euEt2382McwkbSnvQqrtAULm1Rmd6h04Ple1?=
 =?Windows-1252?Q?KXe/jv5CaiaA1LTKEjl7lXGWz9/nfZOg8+xnarLdu6Sjaox9Xcerfv6Z?=
 =?Windows-1252?Q?28F9qGRDQmJ0xIekGrpIJ0RbWslHS+yaNbnwUfCxhBul8c9IQcXAlMRe?=
 =?Windows-1252?Q?Ix/nyZO2lzQqiN47yPNeCn+mvSxYrlLK21MIOUAT1YYGiiOqzGj5Et/g?=
 =?Windows-1252?Q?fT/Sd4skV+vp79XzTIhc7inE+9LhSO2QUzBy6vUa4yZkzbhN4cHlNVNU?=
 =?Windows-1252?Q?YJekbL6ShbysXyQD6gl7T4CVqNZnffwwf+VgpahCLJ8RqOcSqMB4cpdm?=
 =?Windows-1252?Q?+6uybdKKy2le3bCIUVPNwCq1UarFZT8TBtPPwqYWsu4M/Ekei4yf2wai?=
 =?Windows-1252?Q?aVn61y9+WFf32qXLw/sMxcQQivpNdXcnwdrRGrwVTgGjrfO+pV9JKQf9?=
 =?Windows-1252?Q?B5Litd0xE2UxyM5uHiQnC2vr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8123.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?XKs8NRWKNxhIzdp12Rn/LJoCkIWOyyvdMvedu7GD2OWWT5wmGrrwevBu?=
 =?Windows-1252?Q?asMc2nvLTs/UdqijtpFc/XxcjmPDCje5MyCoazXT00pvPT0eaaxpQFxp?=
 =?Windows-1252?Q?je/j/2/G5e1s0GgF1fYImeF59A9jKVlPRxXAWh7CFlm04w+zymmWGOxR?=
 =?Windows-1252?Q?9KREIoxyFCSIv0w+0cug20vr2pbXQOlVekEYI2GxyVQzit6r47PuOZUL?=
 =?Windows-1252?Q?8Y47CfKbC4C6DIziX5uFzSHjKglEJ3VmKrA32+Cr7L+PvuqPom0fsGs/?=
 =?Windows-1252?Q?ywzU7iNp/U/0drKuEvmhpbfS0TjMbY1I5PTgN/BKwjBE1F1BIVBmJzOC?=
 =?Windows-1252?Q?kGvVj2cgzi1dMqj5FWziZqkoxj6mXy+apomHKBSst5HFi8YigbwkNUh3?=
 =?Windows-1252?Q?qovlw9GuxupWPrvjaXNBR2IBXE0waqZlPm4JDhWW2Hhqz+fyjMV8urd9?=
 =?Windows-1252?Q?uU1VF8+d6q7rQPDVu4oNPb29ZfxQhy/PCigENzn/szoimRjEtU/4pb30?=
 =?Windows-1252?Q?lqufKS9GRQO1dDefNbcXnL1RYCObk5xtTT9jsu2jwd7qSZeSuRHs17Ka?=
 =?Windows-1252?Q?n7Vajfrp7jfrjnFxQcgh0IuQqQ1bL01h/B3cOWLHbG4D9mn9fse50aEk?=
 =?Windows-1252?Q?+ELAlUdXJLibdypTr8Ukb8CLBk9WCA3EM0XSqf7jOAJFgdmw2dn9pmm9?=
 =?Windows-1252?Q?9xFwcgyP6X9z5SbXKfTF/VwCpp9aFpzFAJKLIYBoQw8VRYRrI6iVBV+F?=
 =?Windows-1252?Q?op3uPqs/zs9HQ4H/tbAS7Xl7e5J5vyvMwdLeCrSSdq9CxEBiz0mbj9Zy?=
 =?Windows-1252?Q?sTUB7NZZm/c/2eN1subyhy8jmIDYn72q3hWS3hC1oHsU8ajB4EpGJ+pZ?=
 =?Windows-1252?Q?Mp6NgelwzRZc2qJx+OtBsMK8pc8kWCr8PzglauJ0F2kKPNOt/WBJr1cB?=
 =?Windows-1252?Q?Mt/cGelT20T4gzyn/fhtrw2Fq6cFoQk821e4bKkCsXsLCh1HUVYs7+s4?=
 =?Windows-1252?Q?VIYmoR03FHazL/+ctpsymLo/3jrjqBdglz+Q6JGzmMueFAXk5t3qM/II?=
 =?Windows-1252?Q?KxTKzC2NPrinNxv2egT0yAd+GkdjIrV9En6j2m4RmMn9ISMYFumWrw9/?=
 =?Windows-1252?Q?+Pt139FeSJ5h25BXnXYJMQiDIyguRvNvGufAXuSKtkZwdPw30j3QYqjX?=
 =?Windows-1252?Q?uXggvdACJ1YzdHEP0BDNsnx1RbqYh1UU0jNc+trs7Cc1B6qe6BcA5KxV?=
 =?Windows-1252?Q?pgHhF+3KofrCSOir/FQx/Cb5j+/3t6abgVzeixkndt5BfzYuUTFhDaaM?=
 =?Windows-1252?Q?z000+/fLixV14On+1Dd5XHbXURcIXLXk/9XPh4cqFmk/Dtj01w9XZRe9?=
 =?Windows-1252?Q?hpHGsCei0LDaZWUVzD6B9mkZf5MbLKQDMSH/PBRaI8Jzvgfpli0MmHS3?=
 =?Windows-1252?Q?fQCL4HNWOt37XyH/nAozj8MHJMLO6fqgGKWvtb43nMJKEZe1XGNx/nXw?=
 =?Windows-1252?Q?veYv/xA4bO+Z/l8aj0BbAXzn9FW+4wWkLJWDljG+eNDRkGizq94PM2o/?=
 =?Windows-1252?Q?w1lNgm1aBn7M095kZL9QxO8Ud7Sr1ne0kp1yDOtTWvZtXLJPhCDu1l+E?=
 =?Windows-1252?Q?EEAQBPTPnIYSlTqEm6btGE3MSoKBBMPrTZCm00fsH4RIy/++eo6+dwaJ?=
 =?Windows-1252?Q?x1XbZuSdCOw1aQLbNb9xvLsliwv8d/iEsYw9sN+jZrQpgeb82d5+/g?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8123.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b402d4-d819-4e1e-c012-08de3adeeed2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2025 07:03:49.7069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PXNs/HzFnwSUYnudbmHwZPbdsUWGX5+tV/LORKZh/HvGyPeZL6o/pVrVwivaU5ItQl5aae+jnqCAsYGT5GZLCQiI5MZUNHPLL6SKimRP85U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17534

Hi Rob,

> From: Rob Herring (Arm) <robh@kernel.org>
> Sent: 13 December 2025 05:32
>=20
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../renesas/gr-peach-audiocamerashield.dtsi   |  75 ----
>  .../dts/renesas/r8a77xx-aa121td01-panel.dtsi  |  39 --
>  arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi | 332 ------------------
>  arch/arm64/boot/dts/renesas/r8a779m0.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r8a779m2.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r8a779m4.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r8a779m6.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r8a779m7.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r8a779m8.dtsi     |  17 -
>  arch/arm64/boot/dts/renesas/r8a779mb.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi  |  25 --
>  arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  18 -
>  arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi  |  18 -
>  arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi |  18 -
>  14 files changed, 614 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/renesas/gr-peach-
> audiocamerashield.dtsi
>  delete mode 100644 arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dts=
i
>  delete mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m0.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m2.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m6.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m7.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m8.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779mb.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi

The lot of the above are for SoCs that exist and there could well be users =
using them who haven't upstreamed a dts.
I'd convert them to overlays but they all make use of /delete-node/ which a=
s far as I understand isn't supported in overlays.

Is there another option rather than removing these dtsi files?

Kind regards, Chris

>=20
> diff --git a/arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi
> b/arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi
> deleted file mode 100644
> index 8d77579807ec..000000000000
> --- a/arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Device Tree Source for the GR-Peach audiocamera shield expansion boar=
d
> - *
> - * Copyright (C) 2017 Jacopo Mondi <jacopo+renesas@jmondi.org>
> - */
> -
> -#include "r7s72100.dtsi"
> -#include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
> -
> -/ {
> -	/* On-board camera clock. */
> -	camera_clk: camera_clk {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <27000000>;
> -	};
> -};
> -
> -&pinctrl {
> -	i2c1_pins: i2c1 {
> -		/* P1_2 as SCL; P1_3 as SDA */
> -		pinmux =3D <RZA1_PINMUX(1, 2, 1)>, <RZA1_PINMUX(1, 3, 1)>;
> -	};
> -
> -	vio_pins: vio {
> -		/* CEU pins: VIO_D[0-10], VIO_VD, VIO_HD, VIO_CLK */
> -		pinmux =3D <RZA1_PINMUX(1, 0, 5)>, /* VIO_VD */
> -			 <RZA1_PINMUX(1, 1, 5)>, /* VIO_HD */
> -			 <RZA1_PINMUX(2, 0, 7)>, /* VIO_D0 */
> -			 <RZA1_PINMUX(2, 1, 7)>, /* VIO_D1 */
> -			 <RZA1_PINMUX(2, 2, 7)>, /* VIO_D2 */
> -			 <RZA1_PINMUX(2, 3, 7)>, /* VIO_D3 */
> -			 <RZA1_PINMUX(2, 4, 7)>, /* VIO_D4 */
> -			 <RZA1_PINMUX(2, 5, 7)>, /* VIO_D5 */
> -			 <RZA1_PINMUX(2, 6, 7)>, /* VIO_D6 */
> -			 <RZA1_PINMUX(2, 7, 7)>, /* VIO_D7 */
> -			 <RZA1_PINMUX(10, 0, 6)>; /* VIO_CLK */
> -	};
> -};
> -
> -&i2c1 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&i2c1_pins>;
> -
> -	status =3D "okay";
> -	clock-frequency =3D <100000>;
> -
> -	camera@48 {
> -		compatible =3D "aptina,mt9v111";
> -		reg =3D <0x48>;
> -
> -		clocks =3D <&camera_clk>;
> -
> -		port {
> -			mt9v111_out: endpoint {
> -				remote-endpoint =3D <&ceu_in>;
> -			};
> -		};
> -	};
> -};
> -
> -&ceu {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&vio_pins>;
> -
> -	status =3D "okay";
> -
> -	port {
> -		ceu_in: endpoint {
> -			remote-endpoint =3D <&mt9v111_out>;
> -		};
> -	};
> -};
> diff --git a/arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi
> b/arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi
> deleted file mode 100644
> index 6e7589ea7562..000000000000
> --- a/arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Common file for the AA121TD01 panel connected to Renesas R-Car boards
> - *
> - * Copyright (C) 2015 Renesas Electronics Corp.
> - */
> -
> -/ {
> -	panel {
> -		compatible =3D "mitsubishi,aa121td01", "panel-lvds";
> -
> -		width-mm =3D <261>;
> -		height-mm =3D <163>;
> -		data-mapping =3D "jeida-18";
> -
> -		panel-timing {
> -			/* 1280x800 @60Hz */
> -			clock-frequency =3D <71000000>;
> -			hactive =3D <1280>;
> -			vactive =3D <800>;
> -			hsync-len =3D <70>;
> -			hfront-porch =3D <20>;
> -			hback-porch =3D <70>;
> -			vsync-len =3D <5>;
> -			vfront-porch =3D <3>;
> -			vback-porch =3D <15>;
> -		};
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint =3D <&lvds_connector>;
> -			};
> -		};
> -	};
> -};
> -
> -&lvds_connector {
> -	remote-endpoint =3D <&panel_in>;
> -};
> diff --git a/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
> b/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
> deleted file mode 100644
> index e0930d1ba3aa..000000000000
> --- a/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
> +++ /dev/null
> @@ -1,332 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * Copyright (C) 2017 Ideas on Board <kieran.bingham@ideasonboard.com>
> - * Copyright (C) 2021 Jacopo Mondi <jacopo+renesas@jmondi.org>
> - *
> - * Device Tree Source (overlay) that describes GMSL camera connected to
> - * Fakra connectors for the Eagle V3M and Condor V3H (and compatible)
> boards.
> - *
> - * The following cameras are currently supported: RDACM20 and RDACM21.
> - *
> - * The board .dts file that include this has to select which cameras are
> in use
> - * by specifying the camera model with:
> - *
> - * #define GMSL_CAMERA_RDACM20
> - * or
> - * #define GMSL_CAMERA_RDACM21
> - *
> - * And which cameras are connected to the board by defining:
> - * for GMSL channel 0:
> - *	   #define GMSL_CAMERA_0
> - *	   #define GMSL_CAMERA_1
> - *	   #define GMSL_CAMERA_2
> - *	   #define GMSL_CAMERA_3
> - *
> - * for GMSL channel 1:
> - *	   #define GMSL_CAMERA_4
> - *	   #define GMSL_CAMERA_5
> - *	   #define GMSL_CAMERA_6
> - *	   #define GMSL_CAMERA_7
> - */
> -
> -#include <dt-bindings/gpio/gpio.h>
> -
> -/* Validate the board file settings. */
> -#if !defined(GMSL_CAMERA_RDACM20) && !defined(GMSL_CAMERA_RDACM21)
> -#error "Camera model should be defined by the board file"
> -#endif
> -
> -#if defined(GMSL_CAMERA_RDACM20) && defined(GMSL_CAMERA_RDACM21)
> -#error "A single camera model should be selected"
> -#endif
> -
> -#if !defined(GMSL_CAMERA_0) && !defined(GMSL_CAMERA_1) && \
> -    !defined(GMSL_CAMERA_2) && !defined(GMSL_CAMERA_3) && \
> -    !defined(GMSL_CAMERA_4) && !defined(GMSL_CAMERA_5) && \
> -    !defined(GMSL_CAMERA_6) && !defined(GMSL_CAMERA_7)
> -#error "At least one camera should be selected"
> -#endif
> -
> -/* Deduce from the enabled cameras which GMSL channels are active. */
> -#if defined(GMSL_CAMERA_0) || defined(GMSL_CAMERA_1) || \
> -    defined(GMSL_CAMERA_2) || defined(GMSL_CAMERA_3)
> -#define GMSL_0
> -#endif
> -
> -#if defined(GMSL_CAMERA_4) || defined(GMSL_CAMERA_5) || \
> -    defined(GMSL_CAMERA_6) || defined(GMSL_CAMERA_7)
> -#define GMSL_1
> -#endif
> -
> -/* Deduce the camera model compatible string. */
> -#if defined(GMSL_CAMERA_RDACM20)
> -#define GMSL_CAMERA_MODEL "imi,rdacm20"
> -#elif defined(GMSL_CAMERA_RDACM21)
> -#define GMSL_CAMERA_MODEL "imi,rdacm21"
> -#endif
> -
> -#ifdef GMSL_0
> -&vin0 {
> -	status =3D "okay";
> -};
> -
> -&vin1 {
> -	status =3D "okay";
> -};
> -
> -&vin2 {
> -	status =3D "okay";
> -};
> -
> -&vin3 {
> -	status =3D "okay";
> -};
> -
> -&gmsl0 {
> -	status =3D "okay";
> -
> -#if defined(GMSL_CAMERA_RDACM21)
> -	maxim,reverse-channel-microvolt =3D <100000>;
> -#endif
> -
> -	ports {
> -#ifdef GMSL_CAMERA_0
> -		port@0 {
> -			max9286_in0: endpoint {
> -				remote-endpoint =3D <&fakra_con0>;
> -			};
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_1
> -		port@1 {
> -			max9286_in1: endpoint {
> -				remote-endpoint =3D <&fakra_con1>;
> -			};
> -
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_2
> -		port@2 {
> -			max9286_in2: endpoint {
> -				remote-endpoint =3D <&fakra_con2>;
> -			};
> -
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_3
> -		port@3 {
> -			max9286_in3: endpoint {
> -				remote-endpoint =3D <&fakra_con3>;
> -			};
> -
> -		};
> -#endif
> -	};
> -
> -	i2c-mux {
> -#ifdef GMSL_CAMERA_0
> -		i2c@0 {
> -			status =3D "okay";
> -
> -			camera@51 {
> -				compatible =3D GMSL_CAMERA_MODEL;
> -				reg =3D <0x51>, <0x61>;
> -
> -				port {
> -					fakra_con0: endpoint {
> -						remote-endpoint =3D <&max9286_in0>;
> -					};
> -				};
> -			};
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_1
> -		i2c@1 {
> -			status =3D "okay";
> -
> -			camera@52 {
> -				compatible =3D GMSL_CAMERA_MODEL;
> -				reg =3D <0x52>, <0x62>;
> -
> -				port {
> -					fakra_con1: endpoint {
> -						remote-endpoint =3D <&max9286_in1>;
> -					};
> -				};
> -			};
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_2
> -		i2c@2 {
> -			status =3D "okay";
> -
> -			camera@53 {
> -				compatible =3D GMSL_CAMERA_MODEL;
> -				reg =3D <0x53>, <0x63>;
> -
> -				port {
> -					fakra_con2: endpoint {
> -						remote-endpoint =3D <&max9286_in2>;
> -					};
> -				};
> -			};
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_3
> -		i2c@3 {
> -			status =3D "okay";
> -
> -			camera@54 {
> -				compatible =3D GMSL_CAMERA_MODEL;
> -				reg =3D <0x54>, <0x64>;
> -
> -				port {
> -					fakra_con3: endpoint {
> -						remote-endpoint =3D <&max9286_in3>;
> -					};
> -				};
> -			};
> -		};
> -#endif
> -	};
> -};
> -#endif /* ifdef GMSL_0 */
> -
> -#ifdef GMSL_1
> -&vin4 {
> -	status =3D "okay";
> -};
> -
> -&vin5 {
> -	status =3D "okay";
> -};
> -
> -&vin6 {
> -	status =3D "okay";
> -};
> -
> -&vin7 {
> -	status =3D "okay";
> -};
> -
> -&gmsl1 {
> -	status =3D "okay";
> -
> -#if defined(GMSL_CAMERA_RDACM21)
> -	maxim,reverse-channel-microvolt =3D <100000>;
> -#endif
> -
> -	ports {
> -#ifdef GMSL_CAMERA_4
> -		port@0 {
> -			max9286_in4: endpoint {
> -				remote-endpoint =3D <&fakra_con4>;
> -			};
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_5
> -		port@1 {
> -			max9286_in5: endpoint {
> -				remote-endpoint =3D <&fakra_con5>;
> -			};
> -
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_6
> -		port@2 {
> -			max9286_in6: endpoint {
> -				remote-endpoint =3D <&fakra_con6>;
> -			};
> -
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_7
> -		port@3 {
> -			max9286_in7: endpoint {
> -				remote-endpoint =3D <&fakra_con7>;
> -			};
> -
> -		};
> -#endif
> -	};
> -
> -	i2c-mux {
> -#ifdef GMSL_CAMERA_4
> -		i2c@0 {
> -			status =3D "okay";
> -
> -			camera@55 {
> -				compatible =3D GMSL_CAMERA_MODEL;
> -				reg =3D <0x55>, <0x65>;
> -
> -				port {
> -					fakra_con4: endpoint {
> -						remote-endpoint =3D <&max9286_in4>;
> -					};
> -				};
> -			};
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_5
> -		i2c@1 {
> -			status =3D "okay";
> -
> -			camera@56 {
> -				compatible =3D GMSL_CAMERA_MODEL;
> -				reg =3D <0x56>, <0x66>;
> -
> -				port {
> -					fakra_con5: endpoint {
> -						remote-endpoint =3D <&max9286_in5>;
> -					};
> -				};
> -			};
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_6
> -		i2c@2 {
> -			status =3D "okay";
> -
> -			camera@57 {
> -				compatible =3D GMSL_CAMERA_MODEL;
> -				reg =3D <0x57>, <0x67>;
> -
> -				port {
> -					fakra_con6: endpoint {
> -						remote-endpoint =3D <&max9286_in6>;
> -					};
> -				};
> -			};
> -		};
> -#endif
> -
> -#ifdef GMSL_CAMERA_7
> -		i2c@3 {
> -			status =3D "okay";
> -
> -			camera@58 {
> -				compatible =3D GMSL_CAMERA_MODEL;
> -				reg =3D <0x58>, <0x68>;
> -
> -				port {
> -					fakra_con7: endpoint {
> -						remote-endpoint =3D <&max9286_in7>;
> -					};
> -				};
> -			};
> -		};
> -#endif
> -	};
> -};
> -#endif /* ifdef GMSL_1 */
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m0.dtsi
> b/arch/arm64/boot/dts/renesas/r8a779m0.dtsi
> deleted file mode 100644
> index 38978360e722..000000000000
> --- a/arch/arm64/boot/dts/renesas/r8a779m0.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Device Tree Source for the R-Car H3e (R8A779M0) SoC
> - *
> - * Copyright (C) 2021 Glider bv
> - */
> -
> -#include "r8a77951.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r8a779m0", "renesas,r8a7795";
> -};
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m2.dtsi
> b/arch/arm64/boot/dts/renesas/r8a779m2.dtsi
> deleted file mode 100644
> index bced12764c69..000000000000
> --- a/arch/arm64/boot/dts/renesas/r8a779m2.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Device Tree Source for the R-Car M3e (R8A779M2) SoC
> - *
> - * Copyright (C) 2021 Glider bv
> - */
> -
> -#include "r8a77961.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r8a779m2", "renesas,r8a77961";
> -};
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m4.dtsi
> b/arch/arm64/boot/dts/renesas/r8a779m4.dtsi
> deleted file mode 100644
> index ae8486056962..000000000000
> --- a/arch/arm64/boot/dts/renesas/r8a779m4.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Device Tree Source for the R-Car M3Ne (R8A779M4) SoC
> - *
> - * Copyright (C) 2021 Glider bv
> - */
> -
> -#include "r8a77965.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r8a779m4", "renesas,r8a77965";
> -};
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m6.dtsi
> b/arch/arm64/boot/dts/renesas/r8a779m6.dtsi
> deleted file mode 100644
> index 94d6a6cf503e..000000000000
> --- a/arch/arm64/boot/dts/renesas/r8a779m6.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Device Tree Source for the R-Car E3e (R8A779M6) SoC
> - *
> - * Copyright (C) 2021 Glider bv
> - */
> -
> -#include "r8a77990.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r8a779m6", "renesas,r8a77990";
> -};
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m7.dtsi
> b/arch/arm64/boot/dts/renesas/r8a779m7.dtsi
> deleted file mode 100644
> index 0580fa614034..000000000000
> --- a/arch/arm64/boot/dts/renesas/r8a779m7.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Device Tree Source for the R-Car D3e (R8A779M7) SoC
> - *
> - * Copyright (C) 2021 Glider bv
> - */
> -
> -#include "r8a77995.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r8a779m7", "renesas,r8a77995";
> -};
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m8.dtsi
> b/arch/arm64/boot/dts/renesas/r8a779m8.dtsi
> deleted file mode 100644
> index dfccc080fb3e..000000000000
> --- a/arch/arm64/boot/dts/renesas/r8a779m8.dtsi
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Device Tree Source for the R-Car H3Ne (R8A779M8) SoC
> - *
> - * Copyright (C) 2021 Glider bv
> - */
> -
> -#include "r8a77951.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r8a779m8", "renesas,r8a7795";
> -};
> -
> -&cluster0_opp {
> -	/delete-node/ opp-1600000000;
> -	/delete-node/ opp-1700000000;
> -};
> diff --git a/arch/arm64/boot/dts/renesas/r8a779mb.dtsi
> b/arch/arm64/boot/dts/renesas/r8a779mb.dtsi
> deleted file mode 100644
> index 181b737c91cd..000000000000
> --- a/arch/arm64/boot/dts/renesas/r8a779mb.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Device Tree Source for the R-Car H3Ne-1.7G (R8A779MB) SoC
> - *
> - * Copyright (C) 2022 Glider bv
> - */
> -
> -#include "r8a77951.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r8a779mb", "renesas,r8a7795";
> -};
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
> b/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
> deleted file mode 100644
> index 56a979e82c4f..000000000000
> --- a/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -/*
> - * Device Tree Source for the RZ/G2LC R9A07G044C1 SoC specific parts
> - *
> - * Copyright (C) 2021 Renesas Electronics Corp.
> - */
> -
> -/dts-v1/;
> -#include "r9a07g044.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r9a07g044c1", "renesas,r9a07g044";
> -
> -	cpus {
> -		/delete-node/ cpu-map;
> -		/delete-node/ cpu@100;
> -	};
> -};
> -
> -&soc {
> -	/delete-node/ ssi@1004a800;
> -	/delete-node/ serial@1004c800;
> -	/delete-node/ adc@10059000;
> -	/delete-node/ ethernet@11c30000;
> -};
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> deleted file mode 100644
> index 9cf27ca9f1d2..000000000000
> --- a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -/*
> - * Device Tree Source for the RZ/G2L R9A07G044L1 SoC specific parts
> - *
> - * Copyright (C) 2021 Renesas Electronics Corp.
> - */
> -
> -/dts-v1/;
> -#include "r9a07g044.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r9a07g044l1", "renesas,r9a07g044";
> -
> -	cpus {
> -		/delete-node/ cpu-map;
> -		/delete-node/ cpu@100;
> -	};
> -};
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> b/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> deleted file mode 100644
> index d85a6ac0f024..000000000000
> --- a/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -/*
> - * Device Tree Source for the RZ/V2L R9A07G054L1 SoC specific parts
> - *
> - * Copyright (C) 2021 Renesas Electronics Corp.
> - */
> -
> -/dts-v1/;
> -#include "r9a07g054.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r9a07g054l1", "renesas,r9a07g054";
> -
> -	cpus {
> -		/delete-node/ cpu-map;
> -		/delete-node/ cpu@100;
> -	};
> -};
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
> b/arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
> deleted file mode 100644
> index e50d9159e832..000000000000
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -/*
> - * Device Tree Source for the RZ/G3E R9A09G047E37 SoC specific parts
> - *
> - * Copyright (C) 2024 Renesas Electronics Corp.
> - */
> -
> -/dts-v1/;
> -#include "r9a09g047.dtsi"
> -
> -/ {
> -	compatible =3D "renesas,r9a09g047e37", "renesas,r9a09g047";
> -
> -	cpus {
> -		/delete-node/ cpu@200;
> -		/delete-node/ cpu@300;
> -	};
> -};
> --
> 2.51.0
>=20


