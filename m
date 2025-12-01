Return-Path: <linux-renesas-soc+bounces-25448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 30894C9775A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 14:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC6114E1A97
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 13:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD69E30FC16;
	Mon,  1 Dec 2025 13:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DPSHTN/p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065A30FC22;
	Mon,  1 Dec 2025 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594181; cv=fail; b=t+k973GO2zbjCIi17m3UAtKPuWHNvXeP60wQVAHqfxKsw/rS06tOGM9M1QmQxSXuugXc0JuENhJACYB/2SQ8XsQalWbue/lXEGALOzIZn+00Jk5aaIli8frGqj65/c0eB5JoMuqAhGC2LcseOJA6WABJVhsoxXZifNzwpZSsM2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594181; c=relaxed/simple;
	bh=3aInHxrvjufs/1D45+BR7yzKrtiL0poSqXSSpb5qymk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HWWAKRfcff3uWBjawPidz/6ArRCKDm22HYWqJ9E/PaOtYqcw/37J92MkmPuz+9eGW7AFAV/rMnMfgiuTla0VUmQtwunX4X+GuhwBo5fK72r2makB+azmK4QR+wiiMgK1v3oVkl6S6ggJcmZueffFNjn96xumqwcNJPA4i+bTEt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DPSHTN/p; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGrzCzZpEZKtKtSbAGX6+dPzpc0Y6S5nH6Amtd6uSys2GCtRV9+AHFhmommvrc7SaPoHejVRTpVs+DSFR2RNU0cDCr6eHYIncZui+WN9KqSDSHlof4a7j7kqSWvkWwLykqFQ7WYSl/zQq61p90zUpO4sYbMtXdXN4WDziYVmaslqAHst7+tjNEm86RdxfQImjqgBmjzJSuUGFNuIqy/+Pk+pUJBWGpeij5Gg35ucTzV15/S6Rd+D4P6hQhKyUUbIKW2Gxt37g+znjjdACzOE2jCPrl9DMNKod2sUYJiJpTvun0nSjnfktmo719oxVvepLZoE31VliOGj9aHC4Fcd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aInHxrvjufs/1D45+BR7yzKrtiL0poSqXSSpb5qymk=;
 b=DhPajS4DyB58sdUg8Mik7N+0Gb08RnwsBYqEJEdacWC0ZRCBNHOTWlFUdFQm/Ecw38Rwub4+42Vf4uzwJI2zZXKnVMbD1tjedHTz8CO9ALp80TwGJvf8qP0CaERJgmSEkSa1N60YvV/ATIkDw4LasOXrNwyyN1aAKIRflItvjnI2iM9ImRnClZZbRdtLL7fzjSg98JCGFkZPl4mQuoYK4KWD+d1E1hhJqM5Ob1xqpsPlpqKS4I4xjv0NPAVvZQqSeE8toyEbA9ndMgro3TYAr/4Fh7H6//CxC94n1hEELrAVewmrz8SQRCiS7N8uC31gppoRwqrtUb/uUKEo6XmPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aInHxrvjufs/1D45+BR7yzKrtiL0poSqXSSpb5qymk=;
 b=DPSHTN/pved63wOwI/K949d/CBwH2hpoG8eA/Rj+O7iTY5QukFlvjY2Y5YCxsQz1zqfYvyJlMy5D0LCsR9VEUGGtAUbnHhrWlD/5Lk+EIEtjITBTOzrBZuZt8mHs4Ap3KPVtZs4Q+841g41y+btOhpnguAu84u1B5g/c5R3SKFY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8897.jpnprd01.prod.outlook.com (2603:1096:400:18b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 1 Dec
 2025 13:02:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.003; Mon, 1 Dec 2025
 13:02:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Josua Mayer <josua@solid-run.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Topic: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Index: AQHcYr6fMjaP0/3KT0Wqx+rUGWyUpLUMuQqg
Date: Mon, 1 Dec 2025 13:02:52 +0000
Message-ID:
 <TY3PR01MB113465581E5F8BD6C45FB7DCB86DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <20251201-rz-sdio-mux-v2-1-bcb581b88dd7@solid-run.com>
In-Reply-To: <20251201-rz-sdio-mux-v2-1-bcb581b88dd7@solid-run.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8897:EE_
x-ms-office365-filtering-correlation-id: f088beff-cd1d-4a3f-617f-08de30d9efd2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZndrV1VXNXZZQWhOdllVckpTczk2WlJza2Y5RzVMdFNLbFA0dWVCcDNvZGd5?=
 =?utf-8?B?d0c0ZXY2TXV4aEZhYVl4NTF4a1V6V1paZ0pzbUNtWkJtNms2M1FSNVM0Mjh1?=
 =?utf-8?B?ajNpUktjZGdTbE8rdlRPVGxiVUVtYlZJcVp4VmdYWGcvSjZKNStieTNvc1lr?=
 =?utf-8?B?a0tTeGM2MVJOTWlvVXpCQVBlNEViNjZaYjY0clJybEVOSWlSZU1OYU5VRThG?=
 =?utf-8?B?UTZYTjA0K0xMekt5RWxBNGVMVDNZaHp0Yi8vNUc3ZkxEczJTR3hFWllGTnFh?=
 =?utf-8?B?ekUxWm45MldjQXdPamZhOU9HT2d5YnhUT3dVVmROVmFEUWZZMEJBT2JCVy8x?=
 =?utf-8?B?L3FhK0ZnUkZJRVZvUmd1NkFyd2JLbmNma21lVVBpeFNvaGtKYTBTQWJvM0Rm?=
 =?utf-8?B?WHJjZ05CdDRoajB1VEU1V25aNHRmMWR4WFZubkdPdUYzSGNzRjFQdy8vUnpF?=
 =?utf-8?B?ZVZFb1pvOUljam4vRXpITkZ3ODh1Q3pVaUxIajFFd3hmL3dwT2xIUEx6SFNW?=
 =?utf-8?B?Wi9yNDJDR1k3elhWWnlVNEVtTTB0RHhOMmwvU3pIVlgyRXErSS96R3JQa21w?=
 =?utf-8?B?QTI0M203T09kMnhFbmdjNk1vSVQ0bVZsVTM0RXRjbll3eElpTG1ubDlEWm5Q?=
 =?utf-8?B?NnZDbXBNSUFaOXY1NCtMTzBRNDdYbGtrL1RIb0VqRXNnamRUYkpuU1pqTmVR?=
 =?utf-8?B?UXYwbFFuTDRoZVpDNU1ESlNlVnVMSDFCalNPQVBySTJaVmhXWGlvYm5TSVkw?=
 =?utf-8?B?VUo1SXhZcFlQekxRNDFtRFQ1T0VQOEdZUHNlcW5nQmYxTzhMODBPc2pvWjQ2?=
 =?utf-8?B?T0pHN1lieFk3ZEg3MW45UFVjaWR0amhHelRoMXVMN0EzTUpDZ084NVNjaDUw?=
 =?utf-8?B?d1VIdHlHaVZ0Ukdnb2RyZVg5S3ZOV1NtbXFFQVl4YUFaclc2b0tXMHpVVFFT?=
 =?utf-8?B?cTV4Y3Jza2gzamJSdFc1cTFGK05ELzR4R0g5bkQrOFAwWmw2bVl6RUJMQ2FG?=
 =?utf-8?B?WTlqTmoxd0llQmJoR3NrR1BTSjZOKzJZMDMvcURLczJKSEZpUGY4aXZYMlpF?=
 =?utf-8?B?bGU4S29VK1lObDRqbjdPdHlwNmxBdDNGUXNtQ0g3WXlrRW8vQVg0WWVLOWZL?=
 =?utf-8?B?SW5sMFdkLzJSdUpyTndTVTFDWFVDcGliY2FPNVJkVVo3UkZPbG5MSmFCWWRu?=
 =?utf-8?B?UXMxTENMQUN5cGF6c2pHb3EzWmcyOG14TUFGeTZSbHZTYlJ2K2hwUVhKK0hY?=
 =?utf-8?B?TkJ6TU14c3RqUHRnUzcrYzlvVE1Pc2NoYXIxQWtrelpFL1RPMS9icjAzSEFy?=
 =?utf-8?B?RDRBVGl2andpTWVGeTVhSHpvTytBUCtseitYRGhUMXZGZkZoYVRWZnZCSnhY?=
 =?utf-8?B?ODRjdkhWbVFaMTJ6bmloUTlFN2tPOElMeUNnZHdrZDIyK3RRSEQvVzBQdSty?=
 =?utf-8?B?VzR0bE1NTFpsSzNpZWJ0TXhVZ1dsV2JicldmajkrWXZFbWRGa3JRUDZaRFBJ?=
 =?utf-8?B?ay8zdEt5ck0yc1NlV2N5UGN2SndUeUV0NHdTbGVFMUlKY1Q0SWNrV1U2TWFE?=
 =?utf-8?B?MXIzczlEMlJaK2tEMGxSenNYR2hXZlh5L0V1UUhsa0xMM1ZOa0RTWFRCZnIv?=
 =?utf-8?B?bGVkcTVPdC93S2E1ZmF1MjdrSWZRVVBZKzlnMkhCY1gzamJiSjVLZFFadzdP?=
 =?utf-8?B?eWhpaWpQSEE5V2x2WEFGS3dRVFN3Qld2K3hhT3pHRnhNd0tyS3B1aDdhQkZX?=
 =?utf-8?B?alpBNm9OUnJuNU5NdWxMUEdGa2duZnE1UTJDMUIwVGdkM2NOMUIvckpRcEp3?=
 =?utf-8?B?b1k1NlJ4SFhvQmVaeWxUdFdqeFVOOW5PQjRTYll6K2R5Q1NtOU82N1Q0SDky?=
 =?utf-8?B?Y2M0TGlCSEgveGlOMGlFbHhnZS9WVmNjVS9rTGRUMXhzVWdqQUxQcHZhRHUr?=
 =?utf-8?B?LzFMT0RUZ3ByL3RUalJTWmlJcDF5eEIrU0F2RjZlWVNRL0tOdXJxMGVqMkFO?=
 =?utf-8?B?RG1Bdk1IR0FYSzRlaFdIcUFwNmE5OUZVNlRHRHhjb2VYbjhaR1JiR1NLNzBG?=
 =?utf-8?Q?Jhyxlz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Uy85ejg1L05SckNUbk42RXc2RllpOWtaVjdVaXh5MENZNkRialN6YkNvNkVK?=
 =?utf-8?B?UDZ2cnNkbkRDOG5PU3ZZV2tsUVVieTZCdm9TUmhaYnFIVDhRTGFsNHhmV3pk?=
 =?utf-8?B?L0pMVXpZeUxjUkpMWktGSUtGVml3cVdQcHVtN2NpWXpVMWJPaUJlUFVkQkdj?=
 =?utf-8?B?ZTByaFRWVkgxR2JuUUZvaEw1MnhaMisxbGpnZ1BSQUppSXcvQTdPMEZFRVRI?=
 =?utf-8?B?eURyY1VFcDJvQy9aMUZrMjNBMTN2OXlsMXdFVmdGaVRvYU5ZckZwbTBmUG1j?=
 =?utf-8?B?K2NCR0gwd29mdlh1aVB6c3Eya0RjaHFnWC9udlJzbFlyRGlvRStLOW10OHRy?=
 =?utf-8?B?M3ArZnRXbXd4ZTdTemZRc0NFWmFpNGgybUtQWjZUa05MWEw0bmlwOVlMV0Ft?=
 =?utf-8?B?NzhLSXBPYmhUQ1gvU1luTGtmTU0yL1g0KzZtcjNjSVpvYkh4RGVCZy9neWR1?=
 =?utf-8?B?aFBjN3EyWEtNRWNjWVZ4T1FTdUZzS0kzN203NC9hay9qdkxFWEFqaUIraUdj?=
 =?utf-8?B?Q1ByaDhFU0l6dFRLQ1V4S1hVd1pZUFVvR253a0c5RTdnaFZYYzBtMEhDc0Q2?=
 =?utf-8?B?RzFFd0I3KzlaMWg0U1pHeUd6a2YvYVhubXVZRHFpNFE0bitxTVo4TmZoRDky?=
 =?utf-8?B?a0oyVkRob3BlSkpQN21jQzdFYllWRFFzR2xGWURmMEs4UE53WWVUL0hRSmdJ?=
 =?utf-8?B?bUphbytLYVFGSFhMTThRcGl4ZUptZHBPRFhrckVSNm80ODFRaTE1T21aejJT?=
 =?utf-8?B?TTVHa1dTcWhpbFhhZGsxTHNzVEF1cWNyK3EvTENxTlgwaTNDTDVMbFA0eUxT?=
 =?utf-8?B?bWZ2bjNtMVlGYTNrUzBGaHo3bDhNcDN4TDhEemdIWXBsRGdLUVRmcWJyZWlK?=
 =?utf-8?B?TWdkZFMzaDF0TTJrbytlalhSdWd2dEY5TTRHK2NtMlNFQmpGTXFyZzZLUTZN?=
 =?utf-8?B?RlBhS3p3VlVhU3Z5bFZ4Znl3YWVFT1RzUVBtbGhPelZGSU9OT1lkZ0JjSyty?=
 =?utf-8?B?Uy9OVkEwWjR6dTdDUXlPWS92RHhWMzZNQzFHOVNwYzBKY09aU2NKK3RpT1pI?=
 =?utf-8?B?SThEZjJBNGRDWk5yWnRlSHdoYjJnR1c2VWdQd3Y2RGszbEFIenJ4Qk90Y3RF?=
 =?utf-8?B?UzREMzNSdDZaa0NocjNiSGt4NmxlV2lnTC9nWFRIY2RubHhwOTNybTlMS0FY?=
 =?utf-8?B?MTE1UFhvejlxRmo4V0J4aTR6WTg3S0RZdUdocHZlUy9IcGlBM2dLc0VSc0R0?=
 =?utf-8?B?cnViQytXZlR4bGRVMTloT3loc0VQZ3ZBTzV6NE51VTNaZjlxVzFqNjhhZ283?=
 =?utf-8?B?ZHQ1YkI3QW9ZbE55Yjl3aXErdno4QW5oamZLZTBEWWJWYWxEVWlLQVVzZnll?=
 =?utf-8?B?M2JuRk42R051RndjbkZpT1I0Mm85U1FzT0pwMFpLbG9uc2FwOGdkN3ovK3R5?=
 =?utf-8?B?anZIWE55a1F6R016Smx5UGZhMVZLbXBkYnpwcmZzdG1KazY0QzFaYS8wWlYz?=
 =?utf-8?B?VVhQbzBDWmxzYWtqTjdteHhNT1dMakhqU0Y3TCs4ZXdLN2pyeHk1MW1xYStx?=
 =?utf-8?B?akVJNlhxRjVZZE1lalBwb1ZwQXJheWVWcEVFaUQrVjgxaUdEVE54VlBuUm1Y?=
 =?utf-8?B?RWJOZ1hHVVY3OG9pQnA5aFM0amppT1ZIMkNJR3F4VFhuVk9tWmdyRTJPdVB4?=
 =?utf-8?B?TU1yTzBjMUMrSGMyR28yZTVhRmdBaGpPdkg1VFVjNzlpSkhaNGZuYVRGc2lv?=
 =?utf-8?B?dTJCMndmSmJQTkdnS2xrZXBjY0pyU0crT3RaTndQdWZYSzVHWklOWjBvaWNG?=
 =?utf-8?B?TFN4T2xyU3A3NkdlVmI0dERkZVRCc3FORjNnajBpZlN6aVVKOWgyVng4WTNM?=
 =?utf-8?B?ZkJGbnBTL0xLYTRtVWg3MlQwcjlzbCtoVkhsWjYxRDhXaW5QSXE2bEt6dGFL?=
 =?utf-8?B?ekNkWkZiRS9HSXRyZkRTeDZJYUgrdEtwYzFMQm51UURLWFVVV080ejR1SVI2?=
 =?utf-8?B?ZTMyb2FkT00wWkJONHV3WWZHN1QwV0c3Y09XK3dYRVRDZWFKdzBneloya3N4?=
 =?utf-8?B?RTFLZ1A2R3VVekZ6RE12UmUxcVdqaVozU1BXNnBNK0EvSk1QTU90Z2xVRHBs?=
 =?utf-8?B?aG5lQmF3ajNQeVhadTRBeEFrdWhRZ0hEN3U1OGxLUDhPSE5tTGJ0ay9mN0pF?=
 =?utf-8?B?MUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f088beff-cd1d-4a3f-617f-08de30d9efd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:02:52.2285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QPpVY9Nrk4bK2xkctOz9V3GLcV9DJS7T1EFnTFHPWRo/pyKR3sGNgsL2PsmHJN2vy32KBh4BUZUwQxISwWAu+F3XrkHiUQLrXvjhJGti2tM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8897

SGkgSm9zdWEgTWF5ZXIsDQoNCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5j
b20+DQo+IFNlbnQ6IDAxIERlY2VtYmVyIDIwMjUgMTI6MzENCj4gU3ViamVjdDogW1BBVENIIHYy
IDEvMl0gZHQtYmluZGluZ3M6IG1tYzogcmVuZXNhcyxzZGhpOiBBZGQgbXV4LXN0YXRlcyBwcm9w
ZXJ0eQ0KPiANCj4gQWRkIG11eCBjb250cm9sbGVyIHN1cHBvcnQgZm9yIHdoZW4gc2RpbyBsaW5l
cyBhcmUgbXV4ZWQgYmV0d2VlbiBhIGhvc3QgYW5kIG11bHRpcGxlIGNhcmRzLg0KPiANCj4gVGhl
cmUgYXJlIHNldmVyYWwgZGV2aWNlcyBzdXBwb3J0aW5nIGEgY2hvaWNlIG9mIGVNTUMgb3IgU0Qg
b24gYSBzaW5nbGUgYm9hcmQgYnkgYm90aCBkaXAgc3dpdGNoIGFuZA0KPiBncGlvLCBlLmcuIFJl
bmVzYXMgUlovRzJMIFNNQVJDIFNvTSBhbmQgU29saWRSdW4gUlovRzJMIFNvTS4NCj4gDQo+IElu
LXRyZWUgZHRzIGZvciB0aGUgUmVuZXNhcyBib2FyZHMgY3VycmVudGx5IHJlbHkgb24gcHJlcHJv
Y2Vzc29yIG1hY3JvcyB0byBob2cgZ3Bpb3MgYW5kIGRlZmluZSB0aGUNCj4gY2FyZC4NCj4gDQo+
IEJ5IGFkZGluZyBtdXgtc3RhdGVzIHByb3BlcnR5IHRvIHNkaW8gY29udHJvbGxlciBkZXNjcmlw
dGlvbiwgYm9hcmRzIGNhbiBjb3JyZWN0bHkgZGVzY3JpYmUgdGhlIG11eA0KPiB0aGF0IGFscmVh
ZHkgZXhpc3RzIGluIGhhcmR3YXJlIC0gYW5kIGRyaXZlcnMgY2FuIGNvb3JkaW5hdGUgYmV0d2Vl
biBtdXggc2VsZWN0aW9uIGFuZCBwcm9iaW5nIGZvcg0KPiBjYXJkcy4NCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+IC0tLQ0KPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5lc2FzLHNkaGkueWFtbCB8IDYg
KysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5lc2FzLHNkaGku
eWFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvcmVuZXNhcyxz
ZGhpLnlhbWwNCj4gaW5kZXggYzc1NGVhNzFmNTFmNy4uNzU0Y2NiMWMzMGVmYiAxMDA2NDQNCj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5lc2FzLHNkaGku
eWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3JlbmVz
YXMsc2RoaS55YW1sDQo+IEBAIC0xMDYsNiArMTA2LDExIEBAIHByb3BlcnRpZXM6DQo+ICAgIGlv
bW11czoNCj4gICAgICBtYXhJdGVtczogMQ0KPiANCj4gKyAgbXV4LXN0YXRlczoNCj4gKyAgICBk
ZXNjcmlwdGlvbjoNCj4gKyAgICAgIG11eCBjb250cm9sbGVyIG5vZGUgdG8gcm91dGUgdGhlIFNE
SU8gc2lnbmFscyBmcm9tIFNvQyB0byBjYXJkcy4NCg0KTWF5YmUgZGVzY3JpYmUgMCAtIHN0YXRl
IGZvciBTRCBhbmQgMSAtIHN0YXRlIGZvciBlTU1DID8/DQoNCg0KPiArICAgIG1heEl0ZW1zOiAx
DQoNCj4gKw0KPiAgICBwb3dlci1kb21haW5zOg0KPiAgICAgIG1heEl0ZW1zOiAxDQo+IA0KPiBA
QCAtMjc1LDYgKzI4MCw3IEBAIGV4YW1wbGVzOg0KPiAgICAgICAgICBtYXgtZnJlcXVlbmN5ID0g
PDE5NTAwMDAwMD47DQo+ICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5MF9Q
RF9BTFdBWVNfT04+Ow0KPiAgICAgICAgICByZXNldHMgPSA8JmNwZyAzMTQ+Ow0KPiArICAgICAg
ICBtdXgtc3RhdGVzID0gPCZtdXggMD47DQoNCk9uIFItQ2FyIG1tYy9zZCBtdXggYXZhaWxhYmxl
IG9ubHkgb24gU0QyL1NEMywgc28gSSBndWVzcyB5b3UgcGlja2VkIHdyb25nIG5vZGUgU0QwPz8N
Cg0Kb3IgDQoNCkFkZCBzZXBhcmF0ZSBleGFtcGxlIHdpdGggUlovRzJMLCBhcyB0aGUgYm9hcmRz
KFJaL0cyTCBTTUFSQyBFVkspDQp1c2UgZ3Bpby9zd2l0Y2ggKFhPUiBmdW5jdGlvbikgdG8gc2Vs
ZWN0IHRoZSBlTU1DIG9yIFNEIHNpZ25hbHM/Pw0KDQpDaGVlcnMsDQpCaWp1DQoNCg==

