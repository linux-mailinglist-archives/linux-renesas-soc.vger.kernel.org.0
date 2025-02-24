Return-Path: <linux-renesas-soc+bounces-13593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E6A4223A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 15:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DEEE188AAF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A042571D0;
	Mon, 24 Feb 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YQfhhAe8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF424889A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740405589; cv=fail; b=WqqOQXIb3c++olml7svTuI9vbKD21h7fFb5i9a3ee+UbRoXWjIrMV94fdhRZMBO71HLlxgMWj+vDBFfOdLuShqVCnsl25OQNgK3eajwdOcdwRwa38jjvZ4UzrWMK/n/ZJkVrqxuoj5OghG7zyTFtXZuTixXEqDIF9V+F5Z16erU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740405589; c=relaxed/simple;
	bh=2/4wzdLSXmD/PwB2BgVFTWxzn22b4Aa7AlotMjCV5NU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AOe16F7GRuAXmmt18EcCTI8Xq9mm39oXHLbV99HIjEUBIYf7i9F7m0/+b+aRMv8Ew0KVcWm/92O0THEgaX7DnJM7ngxbqcgKOPHLb/RdKb+2N1h4j1/PJLHFHqBiBX/ebLkZ4lH61S5Bp+T++cGxby+t2iioVeL/Da3YVgkG/5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YQfhhAe8; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfgWQUzwCotB6G3tlCdYYw/wffDAHWvx5P9aaOC5FoeCmNW5mpsAcdQpEhY6Ov2yTN32hU4vdk1qCobx4quKK/QZw+PSJ2130cUu0ebRSFESf3o2i7DSE7BRKlvLoG65fFQQSDHZHjOKjMJ1k5RZY7QwD9KFJ418fI0B7Vm2ziaxN+P2ONIfRhAXLyAtLwwipRf08iuToo8Km+2E3cmvRw3Vk/+7Tg06r7sK9klk75VuTZxxCe8BswNSF0TWHvAnnOMPq4X4PSgin/6rabGc6bvmNE90TSK/WMvLCaQTbJoktVLe5CfRRPYeCbCvzeUaX3AQ2La8NrI03eyiiXxm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/4wzdLSXmD/PwB2BgVFTWxzn22b4Aa7AlotMjCV5NU=;
 b=TP1601BESzzHrTZZM7LhnBm2SoKHQIjp3TKaiQMfZsANBphZq4DVYtWs4qxawggTZM5FI5GOn8u3TERsXEWbv5vD2hP1lgIh1Pd2e1+yaJJ6+peTxrCiVvdVYewm1WoyJaXl9pP0LeIUcs9NZcW9y7/I/AqeHvDrNe3CEsExyQasT9QmP8F++Ya6Kw/Wajo4WRUkbnHOVOWTux4HtXr6RTO92yomwno5k8BGd98wq4PKpZ0Isd0RoFXtjEjsp0cHGQTM9lJ9qXe+0dRt7MiY+St+iI9Ml2PgDv78bL6nkrhvsyGwD5X9xTUUGfKbXFlb/amNBpTPpAXilJXMGe3hAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/4wzdLSXmD/PwB2BgVFTWxzn22b4Aa7AlotMjCV5NU=;
 b=YQfhhAe86Ah+uSzXntHeAeXva7zvCmIBi20VRhr5FV0ci6L+Xts8FD7K3zQCR0pDU9/p2fKxXt6xNKlem/wmRgvc22pTFvEloAUjhfeGGDub/0wepKGFIEgDRDoEPjErvOaTbc3k/XDg+pMl6IVO8ssJr9E/SutP/egEk7eN2PQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11399.jpnprd01.prod.outlook.com (2603:1096:400:400::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 13:59:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 13:59:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros
 ICU_TSSR_TSSEL_{MASK,PREP}
Thread-Topic: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros
 ICU_TSSR_TSSEL_{MASK,PREP}
Thread-Index: AQHbhr3mOj04C0ZTW0Gqyq3ESU+j9rNWeP4AgAAA5IA=
Date: Mon, 24 Feb 2025 13:59:43 +0000
Message-ID:
 <TY3PR01MB11346ECB931169C195A63F49386C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
 <20250224131253.134199-12-biju.das.jz@bp.renesas.com>
 <CAMuHMdWjpdHH-+R5pQ9DJ+_MJQ8Nd06dYcKEqqo2Asd7TLTMTA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWjpdHH-+R5pQ9DJ+_MJQ8Nd06dYcKEqqo2Asd7TLTMTA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11399:EE_
x-ms-office365-filtering-correlation-id: 57e8e8c7-359b-4253-f756-08dd54db7d5f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TEo4b20vaGc0RUNxUzRFVHByb1EwcWVpT0VJS09hV0swc2E3V1pFTkRlUUxY?=
 =?utf-8?B?bUJzZmovNjdYNUs4OXRSTDQ5NGU1eFFJb0RQc2Z2TFZEM3Nsb2VxM05IYS9J?=
 =?utf-8?B?VXlXUmdhU1hyTzVIN0sxMjVHN0pvcEVaR3kwbHBPRkhKSCtuZStqdkowNlF1?=
 =?utf-8?B?cm9KNzllamdaNFhWZDlORDVxcVlmSUxwRmZocm1acFFoTWduYUVvVmU4RHRq?=
 =?utf-8?B?aTY1UGpJM2F2VW5lUjE2aFB4MG1IeWNFcG5oMG5hZEVQRitqckNlVkFQbDV3?=
 =?utf-8?B?RmVQcUN6MEdUa0hTQk1mK0RJSFhPTTJRZnZ0RHVQc1M0ME05ZDhBeTBYYzVm?=
 =?utf-8?B?ZHY0QmRwdnprcisvOXBnTjFiQlFHbmg3ZXcyUWw1dThKYkJ5UEhueW1iTEpI?=
 =?utf-8?B?MHBqUmVXZG1MQ2hiRXpuNGpzbWE5OHRUc0NCckJGaHFlMXNHZ0NxVzdCUlVK?=
 =?utf-8?B?VlJLMlVnUnJaeTgrSnh2SGtFVTFBNEp6QmQvLy9kWFlURlVKRzhWNDdhS09L?=
 =?utf-8?B?S3BCcVRCaHZZdytLT2VBQk5tcVU0YzE5YXF5VDNqQy8ydGpieGhJQVY2bGxO?=
 =?utf-8?B?UEVWT1dqY01YQng0VHE5NUU1TVFEVUpBMDBvUEdheC9LYnZpdnYrQTNjcnpK?=
 =?utf-8?B?aG11M3hjVlR5Q1FyWVdMTjhlclpFcTRrbExuNXZURFVhaTRWL3pVYzZsbzFM?=
 =?utf-8?B?bXl2QitwaFN3WHhscHRac0EvRDZvT3R6bkF6TDdaZXpNUTFEb1pLeUdPN04v?=
 =?utf-8?B?ZTJvY0J6clJVc0lzL2kvM2pac2xQbUFkNmRURS9LNjk1SDloNS9hNmxVRjJ3?=
 =?utf-8?B?STV5UnBOdGI1akdsT0dZRUdNSWk5UlArQVMvL2hFMUg1QUZQdU9hcWt0Q2JQ?=
 =?utf-8?B?TWFqRmpBaTR1cnJPZVhiMDZCcWp5aG11Nk12T3NnUHFCTnlIeU0rdk14aWc3?=
 =?utf-8?B?Qk5ZckwwRTVFemR3OTRqMnp6bG55OXNER005clczU2hKRmpZUk9xWVJBYjhP?=
 =?utf-8?B?UE5nb0V3ZVZsd09xcE9iSUUzcXdqY3dCZ21FRWgrRzZ0eHBnQ1NqOG5YZHZY?=
 =?utf-8?B?ZFFXdUtQelBRVzZqc2s1Y1hxSnYxQmtxdWhjTkJKSjZwZStDeVd5UEZxSTNY?=
 =?utf-8?B?eDhnR29ha3YrMkJ5clBvaVZQUWkwYzhRWW42akxMK0h4T0lxNG5abCsxcDNj?=
 =?utf-8?B?NDNzMG9pVjBMM2xrdkhXSFdwSHdpNkkyQ1RqenA0Zk10a2xKbzRxZzQ1clJy?=
 =?utf-8?B?Z0d2S3VCdVhTQ203aEpsQ0FrUFlOTDZxYjVIdU9qTEhkWU1DTjQ3UXdHQWdQ?=
 =?utf-8?B?dHhjN3BsSW9rNlZsblg1R1h6VXZLbzZpOXpoRXFON2hieHlYUzFYY0FBR2NQ?=
 =?utf-8?B?RnJJZURINHB4SEZrMVpjS05sTkNGRVRNMit4ZmhmeHhXNTNoTVR3TTc5N2ZP?=
 =?utf-8?B?bTFzVytKOG52Y2ZNTVNZdTZLN0RqOC9kRVZrWTVTaUExQWQ1bWMzNHFWOE1H?=
 =?utf-8?B?c0txaXVhL05XV0RuM0laVXB4VTYzMkViVUpxQ0hLUUZlUWFITDVEZXN4M2Zj?=
 =?utf-8?B?cWQxKzNhcFZLcDRLVGdacUJZTlppUkpYaEZSeUFYRTc1Q1Erc21PbHh4RjJR?=
 =?utf-8?B?RTNKUjNMYnFxaVZkREs5SXRuRVhGeFp2bVl0M1hOdWZyQkhWUTdmK3I1TzVj?=
 =?utf-8?B?V3V0T2QxbmFqb1orTDFZaDJ3QmZuQVc2ZlJMRTBnRUFtQU9FODNNNXYvNkJo?=
 =?utf-8?B?NWtLV0hOWlFodmsveVY3UFY4QXdwQU9ZN01sSHA5Q3p6V2tmTlVvMnplNzlZ?=
 =?utf-8?B?dXVHN0VCeHZpa3Z4K1cxWlJhTE1weXRvckZTMFhYMlNTZzk3RmdCenowbE00?=
 =?utf-8?B?TTJZZFMwS1hyb0lqVXZkQmhYcDRKYzZZay9SS1FaTyt4ZGNvalhERzc5TnlE?=
 =?utf-8?Q?SXH6unAX1hXQVkLwRZHBo47NC8SEAEkZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZG5IRjYrM285cUxQMnZkak83cHYvb2gzQUd3VUI1WTdLTTNoWE04ZXZSTTU1?=
 =?utf-8?B?RDVsVEJhUjZTYzI0Z20wc1dWUkk1ZXE3endGTy9MaitCcll4bWpFL20rUnlN?=
 =?utf-8?B?MENQbFhrUjRhRnJRYXBKQ0NPd2hHVEFPcU1CVmVDc1l6OVVGbHFLeHUyMUN6?=
 =?utf-8?B?b25jSGZDRWhKbURxY2MwU0kxNC9BU0hwdGlmZjJCUEdId0R4V2RCcmcvRm9i?=
 =?utf-8?B?NExKeDNCdlExaFkrQTRCd1RteDVDczZKWEU0YS9mR08zN3ZYL0dGdGkvbS9M?=
 =?utf-8?B?SU5lcTRPRExvTXgxMWp0bFpOSWZIRk9qN0dITHRQRXlYWWFPUjRQdHcwRXl5?=
 =?utf-8?B?dzZOSkE1U1lmNWxqQlZaOXBJN2FUb0VNeFlTSjc1UUU5SGtvL0V2YXRhWkJE?=
 =?utf-8?B?ZmNVczMyN1RnQTJNeVhNQ0hhb04xM2FNdFYwTU8xQnYraDZQMGRHUDlhK3RD?=
 =?utf-8?B?dGNLZFkrZmk3c0g1V3BTTGF4bysrSFFIalptUU1CWDcySFJZbGZpbEtYQ0x5?=
 =?utf-8?B?TXZSa1dMdVhpSW5zZ04rcWpMZk0wRjlpTUV5N2pSZmVwSU5XaVFkR3JTNTQz?=
 =?utf-8?B?RHQvR2FtUUJxaDFLNlBUdTNJeWpqQlc4dHEvR2pIRkE2eUQydmZhQjdodHFk?=
 =?utf-8?B?S0Q5dVFEcUQ0SGNCWnVndCt2MVZjOXZrdjk1cW50TEJxclVWakw1bUJ0QVIw?=
 =?utf-8?B?bmhvOXNJVmRjZUs5bVZ6QWZKY3ZLYlpycUZxL2V4Wkd4cnN6dUROUXpvVzF5?=
 =?utf-8?B?eEo5OXZkOE9DTlZMSTR4L3ZEaThXbjAwbE55VHFMWnFqaXBXU2pISUR6Vits?=
 =?utf-8?B?VmY3OXlWTjRmeUtQdmRnRXBlS2RSaGV3RktaQ3p1UHByTmQ0UG1ET3IvVWxM?=
 =?utf-8?B?TmFuMWdvSHF3Mm1LVDJzeUpQNy9IaVJtRVEzK2NsTFJPM05NbFpEWmJyTHVN?=
 =?utf-8?B?Y3U0VkpCcmJ3elE3dDdYNFdORHBxb0l4OEZ3MG1WcWtsRlM2WElpcWxYWnZk?=
 =?utf-8?B?ZGFOQ2JSZDNYamdJbzNGbXhyWGxraWxqZjB2Z2NpZ3NETHcrT0x3TEFiNlpy?=
 =?utf-8?B?cWJ3NmJuVjdkZ25UaCtNUlBVeTJBV1E3Z09TaGU1TWZkcW0rRXJRYis0b2JR?=
 =?utf-8?B?OGhkeEVua0JoZkhTc29BL3ZGWlAxM2poay9nMmh4TFpnR1o5c0sxVnBwMUpa?=
 =?utf-8?B?VmNwdFdET05zdmRXZ2tBb2YyN3VqK01Gd2VXYTBRNkFDQ2pyRlNXczBzK0Np?=
 =?utf-8?B?UzMxRk85RG5DdTJpeWNXK29BYmRyLytGR2ZhODdjcmc4MDlmZFdGelZka3M0?=
 =?utf-8?B?eCsrQkVzSk9JSUVQZTdURTNtNDl5dGpSWUg4Z2R4Sk45emJ5Snd0dm1KaTNr?=
 =?utf-8?B?eDFtOHQ2RndkZ1k2dkZ5UkxwQjBqVU1wWGJaSFNYTnRDcEpnUmI2OGNxK2c2?=
 =?utf-8?B?K01vTFdWVFlHdXVrWjlRblUrOTZDWjBtV2dVb0UrVUVQbVk2MEVHamt2cXQx?=
 =?utf-8?B?bkNHK3NlWDVvc3FBL3MzTXFlZmpiM1UvZnR5aUM4eWxLWFlsYkp1bm4yN2Nw?=
 =?utf-8?B?NVh1eDREclhIMVRiNm5tUDcycUdMWHgvaWJSa3FKMkhjaWoxbmg2aFBuSDNO?=
 =?utf-8?B?WkRMRkNvL3ptelR6QjVzaUVEOW9pUmdteW53ZG80VXplck5jeDF6RWFyamNt?=
 =?utf-8?B?UjhWcXVscUNIWitCOU9aRUpBYTlyQmh4d1lVaDNNejNkME5zZzcvTFpWaEQ3?=
 =?utf-8?B?ZXRiSjFRbE15cWRHR3dMRitsQW5hZGZwdW9xYUhYdjVHUUlMVHlSNjhmSTM1?=
 =?utf-8?B?Y3A0b3dCV2l1WlBrWXY0bDdzdVRpRDAzckZCL01SdDJGTWZhQXVjYkNHaUxS?=
 =?utf-8?B?NGs0Z0pwWDVvbyt1Wlk4YzhHUUFMQ3JlblQzcmY2aC9jUkZVVTZHSWwwL3Q0?=
 =?utf-8?B?YndPSmNxRm00N09nTTZ5bitPTkVMUVh1SzZGaE1nU1Y2NCtzVitHME5UTXor?=
 =?utf-8?B?QUZtdVNqTVE5UnppaVZuL3lVRTBrOXlPMm9uamNRWDQ5VktHeU8rV0RFV2Yr?=
 =?utf-8?B?NkY3bEZtT0lKSThjclF6OTZyV3hkM2xrcnBhYTZ5WXB0dHl6K0JEYmxNK3JX?=
 =?utf-8?B?a2FERG5JWnRjcHVNUjFDYm55SmpnSTB3Vy9zaWFkSVcvUy9xaTdzdC9LbHRT?=
 =?utf-8?B?Ymc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e8e8c7-359b-4253-f756-08dd54db7d5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 13:59:43.4197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EFLjcfMUtVrCWtBzGHBJq//7hyMQh3uCIFLN7rLDzvacTkSR+MORQ0wQ6uvtO0nIluZNKvOrmaSMmx1yTIxeRrHPa7ekl95wSWZxMnjsinU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11399

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI0IEZlYnJ1YXJ5IDIwMjUgMTM6NTINCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NiAxMS8xMl0gaXJxY2hpcC9yZW5lc2FzLXJ6djJoOiBVcGRhdGUgbWFjcm9zIElDVV9U
U1NSX1RTU0VMX3tNQVNLLFBSRVB9DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCAyNCBG
ZWIgMjAyNSBhdCAxNDoxMywgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3
cm90ZToNCj4gPiBPbiBSWi9HM0UsIFRTU0VMIHJlZ2lzdGVyIGZpZWxkIGlzIDggYml0cyB3aWRl
IGNvbXBhcmVkIHRvIDcgb24gUlovVjJILg0KPiA+IEFsc28gYml0cyA4Li4xNCBpcyByZXNlcnZl
ZCBvbiBSWi9HM0UgYW5kIGFueSB3cml0ZXMgb24gdGhlc2UgcmVzZXJ2ZWQNCj4gPiBiaXRzIGlz
IGlnbm9yZWQuIFVzZSB0aGUgYml0bWFzayBHRU5NQVNLKGZpZWxkX3dpZHRoIC0gMiwgMCkgb24g
Ym90aA0KPiA+IFNvQ3MgZm9yIGV4dHJhY3RpbmcgVFNTRUwgYW5kIHRoZW4gdXBkYXRlIHRoZSBt
YWNyb3MNCj4gPiBJQ1VfVFNTUl9UU1NFTF9QUkVQIGFuZCBJQ1VfVFNTUl9UU1NFTF9NQVNLIGZv
ciBzdXBwb3J0aW5nIGJvdGggU29Dcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2NS0+djY6DQo+ID4g
ICogRHJvcHBlZCBSYiB0YWcgZnJvbSBHZWVydCBhcyBpdCByZXRhaW4gbWFjcm9zIGluc3RlYWQg
b2YgZHJvcHBpbmcgaXQuDQo+ID4gICogUmV0YWluZWQgdGhlIG1hY3JvcyAgSUNVX1RTU1JfVFNT
RUxfUFJFUCBhbmQgSUNVX1RTU1JfVFNTRUxfTUFTSyBieQ0KPiA+ICAgIGFkZGluZyBmaWVsZF93
aWR0aCBwYXJhbWV0ZXIuDQo+ID4gdjQtPnY1Og0KPiA+ICAqIFVzZWQgdHNzcl9zaGlmdF9mYWN0
b3IgaW4gcnp2MmhfdGludF9zZXRfdHlwZSB0byBvcHRpbWl6ZSB0aGUNCj4gPiAgICBjYWxjdWxh
dGlvbi4NCj4gPiAgKiBEcm9wcGVkIHVubmVjZXNzYXJ5IHBhcmVudGhlc2lzIGZvciBjYWxjdWxh
dGluZyB0c3NyLg0KPiA+ICAqIEFkZGVkIFJiIHRhZyBmcm9tIEdlZXJ0Lg0KPiANCj4gVGhhbmtz
IGZvciB0aGUgdXBkYXRlcyENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5l
c2FzLXJ6djJoLmMNCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnp2Mmgu
Yw0KPiA+IEBAIC02NCw4ICs2NCwxMyBAQA0KPiA+ICAjZGVmaW5lIElDVV9USU5UX0xFVkVMX0hJ
R0ggICAgICAgICAgICAgICAgICAgIDINCj4gPiAgI2RlZmluZSBJQ1VfVElOVF9MRVZFTF9MT1cg
ICAgICAgICAgICAgICAgICAgICAzDQo+ID4NCj4gPiAtI2RlZmluZSBJQ1VfVFNTUl9UU1NFTF9Q
UkVQKHRzc2VsLCBuKSAgICAgICAgICAoKHRzc2VsKSA8PCAoKG4pICogOCkpDQo+ID4gLSNkZWZp
bmUgSUNVX1RTU1JfVFNTRUxfTUFTSyhuKSAgICAgICAgICAgICAgICAgSUNVX1RTU1JfVFNTRUxf
UFJFUCgweDdGLCBuKQ0KPiA+ICsjZGVmaW5lIElDVV9UU1NSX1RTU0VMX1BSRVAodHNzZWwsIG4s
IGZfd2lkdGgpICgodHNzZWwpIDw8ICgobikgKiAoZl93aWR0aCkpKQ0KPiA+ICsjZGVmaW5lIElD
VV9UU1NSX1RTU0VMX01BU0sobiwgX2ZpZWxkX3dpZHRoKSAgIFwNCj4gDQo+IE5pdDogcGxlYXNl
IHVzZSBmX3dpZHRoIG9yIGZpZWxkX3dpZHRoIGNvbnNpc3RlbnRseS4NCg0KV2l0aCBmaWVsZF93
aWR0aCB0aGVyZSB3YXMgc29tZSBhbGlnbm1lbnQgaXNzdWUsIHRoYXQgaXMNCnRoZSByZWFzb24g
aXQgaXMgc2hvcnRlbmVkIHRvIGZfd2lkdGguDQoNCklmIHRoZXJlIGFyZSBubyBvdGhlciBjb21t
ZW50cyBmb3IgdGhpcyBwYXRjaCwgSSB3aWxsIHN3aXRjaCB1c2luZw0KZmllbGRfd2lkdGggaW4g
dGhlIG5leHQgdmVyc2lvbi4NCg0KDQpDaGVlcnMsDQpCaWp1DQo=

