Return-Path: <linux-renesas-soc+bounces-12659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D354A20AAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 13:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 679923A48C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1721A2393;
	Tue, 28 Jan 2025 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fLLt+MO8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5BE2F29;
	Tue, 28 Jan 2025 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738068119; cv=fail; b=pqq/BNulx6B4tRlVNZU5sMQk0HGUk3ZptfDyRb1S63iSLoFJqWsFQE38DSuRV0D8frGJ95rDnsp1PcjwgOXfbzgdWeima9tlBLmq9nOW5ENpZV8GYsySeONJUu9wJc61tHU4yCoRxzt9BpXuRfJBtV2cYI5GK/Wp5JHOxGgZ8/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738068119; c=relaxed/simple;
	bh=CRseEaO2yA0CdyBSnUVQssBlynIvraWBvITes+kgBMs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jSJ+Y1WnrbhVhFKopWqfUYovoAI9HCtyFezAT52Bfd0VFA22XaAE4+qfmCQNJqzg761mBvYFAIMEbpWGD1GGtHH3+Ls7aGLBPxawC9Dp+WyXKgPUzc25BWRjpvkASvPxN4CNOchvhdC+zp6JGkv4pFvtxfrmBQr4gZdf1mPf/7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fLLt+MO8; arc=fail smtp.client-ip=52.101.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHxIm2O71K2wMaUGq2ABV/KWGR4dzfGNR/TS+Npw+m3GnZjNQsOza7yVZJnLZQG5hI733DLVYj0lYLdYLIPVBCYI43GZ07vKY25cF+sC/SpBvuzrzBPYlVLj+nNBQYRtH13qIu3QSNETTZyfE4AKk8csgWc9da6d7TiWRS0QgWv6B6OyWzMJcx37msp2NPmnvyo7bO0IwEFf14KmeR1FD1sgbpOwDAdISQNDenANucrUXDj8XvbC+4inldOpsdPhLBSCcohxtXA3GvKTGbrERTjkyOFOhOrobnwcp3AHDfpmmG3qnfCyYOvpXQy4EpBtuSQ0nPvPoZ3yHOPKR5GfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRseEaO2yA0CdyBSnUVQssBlynIvraWBvITes+kgBMs=;
 b=ov7t2zBHCK1pyuXYP1kr4v7INGSba/kzpnH1pRETCQ9nMyKfOmRfNlZxP1ht8mO8hpOoTIJOzK362LyjzUQG2LPbpOkQtuorCXyHRhV0DGAsnH8POfLA2M+isqAWMHbKL9N9UAUVJn1/r+WhhptVllUVl1weK3GwmkP3Rq95qg64o8/O26JRR0ceeBGl0rlbJGcXJdZKgYa8VM6LfPP6DujDvnWmiCl9jKRAVwKX1qyMiDgqMHhDd3/0C8HMSIXxUnv22jYhhR1nkhJL3x5k3RmLBseTErdhm8JvnJYfn8AgNnv4j0ep8EXCGYtesQWF3kR/2wvj017laTKbj0fo4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRseEaO2yA0CdyBSnUVQssBlynIvraWBvITes+kgBMs=;
 b=fLLt+MO8bYMsuYuX7VKQHahg6cXGRxPT91jYWjud2YOpbCstCP4UjcLvN0u6Fxhmge2oRwrRSzmOcDoSJwusJ+1fiZhhRFZRsQkcP+7TvlRTavqfeeJy4qWePachOtHw/ILstldXHF+RgGb21T/+sEbCr0dM2pibAH4iJVRh3Bk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12673.jpnprd01.prod.outlook.com (2603:1096:604:338::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Tue, 28 Jan
 2025 12:41:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 12:41:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 1/7] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E
 support
Thread-Topic: [PATCH 1/7] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E
 support
Thread-Index: AQHbb/i6FkLt8ccLmkOXuf2Zcpd28bMsC/WAgAAXVMA=
Date: Tue, 28 Jan 2025 12:41:50 +0000
Message-ID:
 <TY3PR01MB113464454D696A8774D6CD21D86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdX0REPzpb0+ROuUspwfn4nSELk=XdwrKfhSEGzQ2mwi6g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX0REPzpb0+ROuUspwfn4nSELk=XdwrKfhSEGzQ2mwi6g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12673:EE_
x-ms-office365-filtering-correlation-id: 18775995-d3bc-48a6-bd77-08dd3f9922fc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SWh0MENqSDZEM242REtoOG1tdlBnaXFLRXppL2RPWEY1RGJYYkNxaU9qTnc5?=
 =?utf-8?B?UHhCdDJzaWNRSUxka0NiY25Vc2VvbFpTNHoxVE9EdTQvWGJOZU1QNDZMN0JM?=
 =?utf-8?B?cVc3eHBVMVE5K2lZQmRTUng0RjExRDQ4ZitvTlhYNFlpTUkybUZKaWFCdDZx?=
 =?utf-8?B?dWc0V2J0QlNIZ0pVWlQrZUJqV3owSEYzVXNkVjd1cUc2Unh3TjBpTGNKTmlk?=
 =?utf-8?B?WFNpSXBPTzBFR1B1TGdtY1RsM2JGWDRvK3Eyc2Jra0F3SEZpV0xlWGsyblcw?=
 =?utf-8?B?bWR0ekVXcVA4ZWJxYkpQMlNhd2NkSHB6YVFCSVZwaWlVektoem8zMjAwUktL?=
 =?utf-8?B?M2JZWStQUXpSUnE2cWIwNzB2K2hTbkxFdFBiaDlQWkNDS05HdWxvdmdzbWJ0?=
 =?utf-8?B?RnJBcVA3aExKNlpkRWo5NUxpanYvQTNFdS9MdUZkQ0p5WlR4Tmx4SjJqc2l2?=
 =?utf-8?B?aWZjeGdWVGF1MkRDWGJMeDU5WXlZOWJZRnh3c0xWWHNIWVI4MXRvUjFZK2or?=
 =?utf-8?B?cHRZcHZ3clIwaXM0SFMzU0FRbkFRVVAyVFVJYVByT3B1YldPWjlPR1dZMS9T?=
 =?utf-8?B?Q1lUQkdFSFYwTHdKVmhqUURCZlBpSElSc0tIdmRIWXA5LzVqdGE4dmh0d1ZP?=
 =?utf-8?B?MEZ5cjY0dXNMNXhNdWtPZUZzM3lyNzQrQmhOWGxFdTltdnZOY05oSURKN3dB?=
 =?utf-8?B?Zkc3aFA5NklnMWlCU1R5aWpPZkJXbmxsci95c3BqSE41Vk4xUmpxSjdPSFEv?=
 =?utf-8?B?ekZab3ovZHMzUVFwM1Y1b0V3alJnTDRFVXNpTWM4NXlMa0k2NU5zN0o1Sm5w?=
 =?utf-8?B?R2FNYUwxeS96Zkp5cjZPQ0VjbDhGWk44NysyaFhnWmdqaUZjVE16WVh5eGd1?=
 =?utf-8?B?NC9TWXcyZWZCdzR5UkFWZnhjL1FpdlNnbDZYNGZuSG9tQXdsd3kzbjNNN1pP?=
 =?utf-8?B?UEV6aTFJMmIxSlJwME9JaENQRGlXU0p4aVFXL21NL0FpbW15MGRlR0xaa25M?=
 =?utf-8?B?MEVWRWtNb2ZzdTNMeXQ2a1RrOERHWlZhMlpFWmRSZ0d2VXlJOTlDQVZnSitH?=
 =?utf-8?B?dDB3NzRPS1NkM3pzTWdBbkVKYmtTbERNY1RablpZS1dGZGlhOEsxMldUQ0F4?=
 =?utf-8?B?c1hwUHpmMWdUeWViektTZVlBa2lQaVYwZWJvaFU4b1YrZWJvL0JTTFpRMXFS?=
 =?utf-8?B?SlBUaHkzNEhVa1g1bDZlTTc2U1ZrT2wwS1dZQnY4NU5ETkdqMklJNnhDd3dw?=
 =?utf-8?B?Wk80a0ptMWVtTW9HdlFrZnU4SnZ1L2RSQmgxTFpFc210cmUyK3lDazFDaDds?=
 =?utf-8?B?THlKdEV4RHBUUWxTSjd2VG5qb01ZdE1kUzQ1OUVRNEEyd215UFc2aTR0cVZj?=
 =?utf-8?B?b3h3QjZvT0E5SFVSbXhVaVJxK1lGK1FnRGdIcFBnNkFGQUJZeFRKZ0VXL3pW?=
 =?utf-8?B?YjhxdzNYeVlSZVlTTU55elMzMHRuM2R3U1lLVGRiMmVXaVE4bEUzL0c2Nm80?=
 =?utf-8?B?N1A1cWJKczVydkhQZFNUQ05FeWxnVFErZk91Zkp1RWZxUlA3KzV4VXd5TU91?=
 =?utf-8?B?cGZMVFZQT3phTlhDRFQ4U010YU9ZUnVMd3pjSC84ek8xTDZqY3JXaXQ1Z1Rw?=
 =?utf-8?B?WW9oTnpXcU4vbFBkQmxySDZaUmpKRFdsTUZQZGJ3cHEzMjE0U0hPb2crRGE1?=
 =?utf-8?B?ak9TZ3JldEV4a0RxUFpvWlllVHBtVVlGckpic2FiampvU3VveklVRnF4WlpC?=
 =?utf-8?B?eVZabVpJM0M5S2s1WTRueTJ3KzNqa1AvZTh5VTJsRm1HM2lseGdtY3doT0xK?=
 =?utf-8?B?dVdFNU41aHFNOTYwenN0cWh2Y0Evd1dNZGU1dWtEK1BCRlY2cXlmb2lwaFp5?=
 =?utf-8?B?L2FncHFnT0tLZVBWN2dxWFZyR2ZINVZLdkdLZ0x1bHJ1NmxSR1VodmgwaUNa?=
 =?utf-8?Q?AQwPXb3O1GOGwh+CGyX+hirjL41I0xEW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0hINVJPNWJ1c3M5c2I5S3V3a2s2NlpVZkVUenRuTUR4Ym5UajFCSDFqd0pL?=
 =?utf-8?B?UitYMzhsN3VzSVByNHlOTm5wVTExVTFBK2QrWTBJSWpaYklzOXRHN0tuREVp?=
 =?utf-8?B?VndlK1JqRGJqVGJ3OXdvKzkxTlZnLytvRnd1VFNiT2NNMkpDL0R0R1hDSEFv?=
 =?utf-8?B?aUtmY1Y4dGFoNGZLS3NheHVjQ011L1I3ME1EWmRmdmlCd3JHSmVMVEdYTDh5?=
 =?utf-8?B?eVlldXZlc0xZYTZlU0RXdnNUd25KL25DKzlFN1NUb2VxeThMakMrN29jMjll?=
 =?utf-8?B?SzJRRC9EQ3R1WFdyUFY1YzkxR1lrZmEzOTJmdzM3WWo5SXBNRnEzUDJNY3RH?=
 =?utf-8?B?VWFqUVhVKzV3VjJpV3psdnBvTThEUndJMmk4OFVROXdiUU9hSU90ekNTemFi?=
 =?utf-8?B?UFl6dDhESzdyNlVPNUtMTG1yZllPMVdKZkJRQkdRQzdhdXZvWUhlTjd1eGtD?=
 =?utf-8?B?cnpERUJLK1o5THIyNEczQ1p5QTFUQml0TEw2RFlJSHlBWG1JNkpCSjhVSU1Z?=
 =?utf-8?B?UWpONUkyVDYvUnhjdjkwTHRSd29RTkZtcElsWkp1aWJscnhiUjI1VThkUVkx?=
 =?utf-8?B?SEx3TjBDQWFkZTBOMkpudHNhSzdOZ1JqL0VyNnRFRXBOSkVySGVmd0xncUVz?=
 =?utf-8?B?YVdBRk03Si9qWHpiU2Nqc2dtRXJTZGFtZDlOaS9kZnZHWXZFR2t6MHVwaDRy?=
 =?utf-8?B?a1dHa3lBTXQ0bXpmR1NoMWhHQnhjTS9tZ0RMd0M1SmZycmJ4QnNzUjFKaEk1?=
 =?utf-8?B?akJNZXVwVzJWSXdxL2JLZjZoRVduTXdCaG1IRCtFTVdFbjczZ2JQWUMvMlp3?=
 =?utf-8?B?RTMzeFJlTjd6WGhVMmhsenArU2N3cEF2RUlJRElEeUtCM0h6TGZXVWwzdGNn?=
 =?utf-8?B?TDRYWFA4UEZId3pOWFdQWWN2YWFHME9FcnJablhmUFdXMFU5UXBBVU1EcGxU?=
 =?utf-8?B?TkprYUdnSGZ6K1dKdENtSExQQzFXRlY1L2pnVkVaWlhvaWRyWDdSWmtrRnMy?=
 =?utf-8?B?YzN1ekcxZ1JTa1p3QUxlMmcvWW5SWmtQT3NqOFozcnpRTVRTWksrQitXdytY?=
 =?utf-8?B?Nk1DYkZBalplZ3VvMEo2TURxUnV3NTJGZzdvRmF2Qk9zekQwbnFTYW03NWpQ?=
 =?utf-8?B?TlFOZk1HMlVjTFM1MkJla05yWWVZRzRSL1JkckRoV0UvTS8rL3dGNnF1MGZl?=
 =?utf-8?B?RTJ3dGMwOW91U21WV3ZQdzJnU2Y4SWZoeVZ3ZjNOZEU1R3VrMUt1RGRxanhN?=
 =?utf-8?B?cGJtUGt1WTV5K3hVR2E0MEZQQ0pFdUVTeWl2aHkyVFYzMGVKaTZscHh2Nklr?=
 =?utf-8?B?cEwvbndkQVZoMm1VdEZmTnc5SFozejcxS0NCMTJOTDZLQWNNdnNNZjd2TEVQ?=
 =?utf-8?B?MjdPTTRlMnMwd3hlaHI1a3lLZytXaE1QV0MvM2xqaUhjY0dWMkZESnphVzRK?=
 =?utf-8?B?N2xGb3F4c1lSQy9HcjAxQk5YZzRiTXR4dWRHQ3NIaHVzL2hzT0JGTC9rQnFw?=
 =?utf-8?B?M1h4RFlKN3l6aFdxVWhoOG1TODlvb01heHlHd1oyc0RuVFY5SnJmQ2hBendt?=
 =?utf-8?B?emdVTXhBUDJDNGdka0ptUGRvT0VadGFvNjJiekVSZml5Z2dCMmJvSmRLNWY5?=
 =?utf-8?B?LzN0RkJVcW4raFloYmswR0tqYmdOWVhrT2duZ3kwWUF0RVVvMUhSM05rUCtP?=
 =?utf-8?B?MDBHVXNwT2M2Vi9pNmllMkl1aWJJcHhmQWdvRnhrSjFIY0FucXp5SHprTUlC?=
 =?utf-8?B?ZDdGZ2VkVUtUdHg4ZmY5ZC9nZlZrUFc0OUZnUGhEVmE4YW9XZ2NvMi9VRjFs?=
 =?utf-8?B?N0M1RHIwT1NVN0tQcmhwQmdKTmZuTXUrQ0pWQ1orRUdOc2lwdXNjcldFMVNw?=
 =?utf-8?B?bmxXOTczYnVRM3lSU2hVWXdPMXVJSGlvRGxRVDVIYVgxSHN3L2c3c01jU2xR?=
 =?utf-8?B?T0hGS2ZFWVhWMGFuN1FLUTBLeWVuRHJjSTR6K3I2c2JScE9tVkxiUU1CMkVJ?=
 =?utf-8?B?OU1rTVh1VUVMN2ZRNkRRUE90dThjdmJJZjFFRDhScEViTzJwZlArWGREUjR4?=
 =?utf-8?B?Q0VKK3JKUURFYXhISS8rTXdiYm1kNGNaeEQ4UXlwTVNVZk9FTDVtb1JnQWo0?=
 =?utf-8?B?a0EvaDh5KzArWUdnSG5Bd3JSdDIrSis5N3ZRQTZEb3ZJa2xOSS9JQ21vZEZC?=
 =?utf-8?B?ekE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18775995-d3bc-48a6-bd77-08dd3f9922fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 12:41:50.5780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25TcJYeXgCS2ZpB8RP9QNgDU09L+18znern9QGuIfXQbK2GOrC7aEof8WpjbB2HGXEIF4u/ktbOs7TTyYkAIX+0Y/GsXIkSmgI+fGyaXK4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12673

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxMToxNg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvN10gZHQtYmluZGluZ3M6IG1tYzogcmVuZXNhcyxzZGhpOiBEb2N1bWVudCBSWi9HM0Ug
c3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFN1biwgMjYgSmFuIDIwMjUgYXQgMTQ6
NDYsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhl
IFNEL01NQyBibG9jayBvbiB0aGUgUlovRzNFICgiUjlBMDlHMDQ3IikgU29DIGlzIHNpbWlsYXIg
dG8gdGhhdCBvZg0KPiA+IHRoZSBSWi9WMkgsIGJ1dCB0aGUgU0QwIGNoYW5uZWwgaGFzIG9ubHkg
ZGVkaWNhdGVkIHBpbnMsIHNvIHdlIG11c3QNCj4gPiB1c2UgU0RfU1RBVFVTIHJlZ2lzdGVyIHRv
IGNvbnRyb2wgdm9sdGFnZSBhbmQgcG93ZXIgZW5hYmxlIChpbnRlcm5hbA0KPiA+IHJlZ3VsYXRv
cikuDQo+ID4NCj4gPiBGb3IgU0QxIGFuZCBTRDIgY2hhbm5lbCB3ZSBjYW4gZWl0aGVyIHVzZSBn
cGlvIHJlZ3VsYXRvciBvciBpbnRlcm5hbA0KPiA+IHJlZ3VsYXRvciAodXNpbmcgU0RfU1RBVFVT
IHJlZ2lzdGVyKSBmb3Igdm9sdGFnZSBzd2l0Y2hpbmcuDQo+ID4gRG9jdW1lbnQgUlovRzNFIFNE
SEkgSVAgc3VwcG9ydC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+
ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5lc2FzLHNk
aGkueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMv
cmVuZXNhcyxzZGhpLnlhbWwNCj4gPiBAQCAtNjgsNiArNjgsOSBAQCBwcm9wZXJ0aWVzOg0KPiA+
ICAgICAgICAgICAgICAgIC0gcmVuZXNhcyxzZGhpLXI5YTA4ZzA0NSAjIFJaL0czUw0KPiA+ICAg
ICAgICAgICAgICAgIC0gcmVuZXNhcyxzZGhpLXI5YTA5ZzAxMSAjIFJaL1YyTQ0KPiA+ICAgICAg
ICAgICAgLSBjb25zdDogcmVuZXNhcyxyemcybC1zZGhpDQo+ID4gKyAgICAgIC0gaXRlbXM6DQo+
ID4gKyAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHNkaGktcjlhMDlnMDQ3ICMgUlovRzNFDQo+
ID4gKyAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHNkaGktcjlhMDlnMDU3ICMgUlovVjJIKFAp
DQo+IA0KPiBPSy4uLiBidXQuLi4NCj4gDQo+ID4NCj4gPiAgICByZWc6DQo+ID4gICAgICBtYXhJ
dGVtczogMQ0KPiA+IEBAIC0xMjQsNiArMTI3LDcgQEAgYWxsT2Y6DQo+ID4gICAgICAgICAgY29t
cGF0aWJsZToNCj4gPiAgICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICAgICAgICAgICAgICBlbnVt
Og0KPiA+ICsgICAgICAgICAgICAgIC0gcmVuZXNhcyxzZGhpLXI5YTA5ZzA0Nw0KPiA+ICAgICAg
ICAgICAgICAgIC0gcmVuZXNhcyxzZGhpLXI5YTA5ZzA1Nw0KPiA+ICAgICAgICAgICAgICAgIC0g
cmVuZXNhcyxyemcybC1zZGhpDQo+ID4gICAgICB0aGVuOg0KPiA+IEBAIC0yMTEsNiArMjE1LDIy
IEBAIGFsbE9mOg0KPiA+ICAgICAgICAgIHNlY3Rpb25lZCBvZmYgdG8gYmUgcnVuIGJ5IGEgc2Vw
YXJhdGUgc2Vjb25kIGNsb2NrIHNvdXJjZSB0byBhbGxvdw0KPiA+ICAgICAgICAgIHRoZSBtYWlu
IGNvcmUgY2xvY2sgdG8gYmUgdHVybmVkIG9mZiB0byBzYXZlIHBvd2VyLg0KPiA+DQo+ID4gKyAg
LSBpZjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjb21wYXRpYmxlOg0K
PiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4gKyAgICAgICAgICAgIGNvbnN0OiByZW5lc2Fz
LHNkaGktcjlhMDlnMDQ3DQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0K
PiA+ICsgICAgICAgIHZxbW1jLXJlZ3VsYXRvcjoNCj4gPiArICAgICAgICAgIHR5cGU6IG9iamVj
dA0KPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246IFZRTU1DIFNEIHJlZ3VsYXRvcg0KPiA+ICsg
ICAgICAgICAgJHJlZjogL3NjaGVtYXMvcmVndWxhdG9yL3JlZ3VsYXRvci55YW1sIw0KPiA+ICsg
ICAgICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArICAgICAg
cmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgLSB2cW1tYy1yZWd1bGF0b3INCj4gPiArDQo+ID4gIHJl
cXVpcmVkOg0KPiA+ICAgIC0gY29tcGF0aWJsZQ0KPiA+ICAgIC0gcmVnDQo+IA0KPiBHaXZlbiBS
Wi9WMkggY2FuIHVzZSB0aGUgaW50ZXJuYWwgcmVndWxhdG9yIGNvbnRyb2wsIHRvbywgSSB0aGlu
ayBpdCBjYW4gYmUgb3B0aW9uYWwgb24gYm90aC4gIFRoZW4NCj4gcmVuZXNhcyxzZGhpLXI5YTA5
ZzA0NyBjYW4ganVzdCB1c2UNCj4gcmVuZXNhcyxzZGhpLXI5YTA5ZzA1NyBhcyBhIGZhbGxiYWNr
IGNvbXBhdGlibGUuDQoNCkFncmVlZCwgd2lsbCBtYWtlIGludGVybmFsIHJlZ3VsYXRvciBjb250
cm9sLiBvcHRpb25hbCBmb3IgYm90aCBSWi9HMkggYW5kIFJaL0czRQ0KYW5kIGp1c3QgdXNlIHJl
bmVzYXMsc2RoaS1yOWEwOWcwNTcgYXMgYSBmYWxsYmFjayBjb21wYXRpYmxlIGZvciByZW5lc2Fz
LHNkaGktcjlhMDlnMDQ3Lg0KDQpDaGVlcnMsDQpCaWp1DQo=

