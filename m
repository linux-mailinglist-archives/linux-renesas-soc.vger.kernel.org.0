Return-Path: <linux-renesas-soc+bounces-11333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 134E49F1C96
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 05:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A84D162802
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 04:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC5541C92;
	Sat, 14 Dec 2024 04:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rlPocQLi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFDF18622;
	Sat, 14 Dec 2024 04:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734151804; cv=fail; b=hqXp2gnjZaYHG+CphKh/nuvwLg3seaDA7LxkY5ahIn915e931TSV5nCCIISfvjKA7mQZMfPF0lui0CGkgwsQjoZl0K20QrZecEqSarW9fJcVanyC6n307VrqrBJGEamg7Lnnr6Tz1VBY6Ue4L2sINaqG0JOxtcvuPKTo+f7AcgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734151804; c=relaxed/simple;
	bh=v3m52P6vPZDs1KyQr4edUrFsuPi8TYe06yNIWkoYGhw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UxgDr7w4S7gyFXq+LN8vrz9Qrt5+ewLmajz9cWxZ9QySxp10lPclGDi2lR1CMZpHP9n13Fcad4y4ybGayT6Wmi/KRL78jBCBxzBZW57cCF/Gl5wWYT+yR8d0xqY9qNv4gq8WGBV6Z7VvneuGHFp8MpVoQR/Kdep/he8sGumQOdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rlPocQLi; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cev5m6VmSWDTDSTwyQAQTkytSd4d/nxQ1MQ3YJm42bGDEjn+0AqXCFU5tJeMLrgCvb3SFz7RxIzHCgH1TE54JWxpgHxpz7x8tcL/+UNeHv7TGYmtz6JQ30j1jr0ntiq2i49h5UsXSsGGmAcVZjSReWZKmBUr0tUxDkrGI8s1zsGFlFogl73lCxR3vZUdWcGC1ZeZPOzsSs0vo6i4Zsp8DPTGu9P0q7Wk4qnY3nugZB4d63uC56VFj2p7uec/VEdBGy4atODH981EzBv8EadM7b3vrTYHTvxKUet28kN6OLWTuhUttOkbp7ORkmzioO7Jty6UVg0jwJjqLT3AyqHvpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3m52P6vPZDs1KyQr4edUrFsuPi8TYe06yNIWkoYGhw=;
 b=CxrJ4+dP++qTBgfYfM6oIYcsGQI75v98QvIHiag3Xl29z7qwmXMWmdpf9T1zJt00NJcs9tVrS/TiAtp1GpanhCI5tN2ksmPafknGnLBIdhuP5R0XB6SPqnwCVvsaDhTAhklkwAm1piBpD6zJQkBxq9b8tbQTj+s1FZmf2omsChkhYYtK3Tk+JeUT776oDUuqAlHlRe6APMZmSbx1PRYr906o7HCYnjYQWwS1tSmJZg6gnAUbzcXddFrE9TfIX50iUC8Pb21zA3kX9FP2+NnTUv4uxSVVsXSpdz4QIssAUhKTX3Wk7h6PhjUp4WMKoSyiaU5bSPLnZ51mXPzvvRXjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3m52P6vPZDs1KyQr4edUrFsuPi8TYe06yNIWkoYGhw=;
 b=rlPocQLirl9WxYAN3zFjguSBKil7OulmEFf0Mkqdyfaxo+9XyyUXKDOqVT+Jw6lqhhcaTXYhbVWcG8t5UBWWkqxYttZaw9tyuubs4+j24jrXpRZTRhrGQtaurhEmKdfAqeEOogNZBAkMevKhZuML+v17Vb9vFEVltynhza8B4yg=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by TYRPR01MB12398.jpnprd01.prod.outlook.com (2603:1096:405:101::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Sat, 14 Dec
 2024 04:49:58 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%4]) with mapi id 15.20.8251.015; Sat, 14 Dec 2024
 04:49:57 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH 0/5] soc: renesas: Add system controller support for
 RZ/G3E SoC
Thread-Topic: [PATCH 0/5] soc: renesas: Add system controller support for
 RZ/G3E SoC
Thread-Index: AQHbSCV8fU5xOH+8qEGuDDhW+TVSfLLkZvIAgADMY3A=
Date: Sat, 14 Dec 2024 04:49:57 +0000
Message-ID:
 <OSBPR01MB27758CD7CA40C3EBF3B9D6DBFF392@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <CAMuHMdUBWWmtcL98Roz3kaJvTUk_gwLGT0GVZRHqn2=FRhj-Aw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUBWWmtcL98Roz3kaJvTUk_gwLGT0GVZRHqn2=FRhj-Aw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|TYRPR01MB12398:EE_
x-ms-office365-filtering-correlation-id: 088fb59f-63b9-4984-fa1f-08dd1bfac2a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1RoMG9VcE40YjMzSnpGMTFqS3FndHFRdU5pUFcrV3ZyYUV3NzVBYWMvSER6?=
 =?utf-8?B?TGJRbUhrNytJa21uSSs2MTM4a2ZqMWlSRHM1N2NhdGdGdWdQYUZDTEdQUDgz?=
 =?utf-8?B?TkdRK2owUDBNOHl4WjJmZ280S3IyWU1Ucmdua1MwTGl3VFNyVkpWdWxYZmRE?=
 =?utf-8?B?NGdydTl4SXpqMzErb0diU1lsTDNESzNvaWg4M1ptQUNZaUpOQ1ZXVmMyZ2lE?=
 =?utf-8?B?SXJtak9CcFMrNmlyNnNnSTlqL3A4L01LRkZpWlNEZ09WT2YzZUJVQ0M1a2pF?=
 =?utf-8?B?SkRtWitxa2hIL0ttUzkxNEczaGtmTU5hZExwRnYvODMvQ1JuY1dGbzVIaHhr?=
 =?utf-8?B?aDZVN1RPb292NDJaVTZNR3kwUmFZWjR4V0RLOTVnOXhDcEtlTGxmRmZKcFQ5?=
 =?utf-8?B?bU5WeXo1NytGMzhzbU1ieVBNbkdFc1BTbTM5TjN0c3NNNVlZcGdKVC83ZmRs?=
 =?utf-8?B?TGszajZ1SVNtNFI3Rk1USDhwM202RjhxRyt4NGJoMTJMajRpL0ZYdGxWSmQ1?=
 =?utf-8?B?WFlBNGVRTThmWFIrYnBaZjBTUDV0NWlCaU5NV21weGExVGRlaWttQWxnVDlx?=
 =?utf-8?B?aGE4RGZ6M3J0V2E5WnhVdzBLV2loUHBhR2tTVUJXQnZ1SFFNY3NudW1DRlF5?=
 =?utf-8?B?TzlWUHFUck4vdWxCTDV5Q1kvb1hZQ0lueXdZQkRyUkh3WHgrWG96V05wZWts?=
 =?utf-8?B?MHBvNmgvaTBDVHpoL2R5UkhJN0FJb2lMcWNPdmhwVmd1Q0J4cEE0aXI5SmtI?=
 =?utf-8?B?VHEyVXcrQnRSQktjRUtKRWIrcHdTQ25jT2Rxa0hDMUJ6VUlNYWdCSG9uRllW?=
 =?utf-8?B?aDRaaS93VmNhR0JYTWswRjg4YlRTSjZnQmJXOTJleEpCK3RvREk0K0FPTkZB?=
 =?utf-8?B?Slg0OFVqSDJqeTJUV2lhTjNnSVNZTzd0MEozOTlrTFAwSjdUZmdtVm1pRmZj?=
 =?utf-8?B?ZEtYNWdlSE10WmxVM3R5UXhCYzJ0R2dUdkluc0x3MENJQXFRbWNIdmdJQ2xR?=
 =?utf-8?B?SHJ2akxMencvZWhTRzQ5dWgxMVN0SXNYOU1YMkNBTGp0SWtVcCtSMzFSM3pa?=
 =?utf-8?B?cnZ6VmhZbW1rWXIzck5OeCtFNmlvdSt4amNOZDVldy9mcFZvb0N0YlVFSkcz?=
 =?utf-8?B?bmJ4dGt1Y0Z6ZzVQV0srL2FMYUVQTEhGMnZYUUQ5bU5XR0hXMDUwZ3c0Q0FP?=
 =?utf-8?B?NXprNjVUN3B4SVF5azZuZThWMTNhak93VlFpaElobXpBTDAyQllaOWIrcHEy?=
 =?utf-8?B?cW9FTEpXZXlVTGFFQjhscVdiOXlrR1Z4N3piRWJ3cWJ5UUJsMXJyTi9GR1po?=
 =?utf-8?B?azhMUGJBMmxqY0JxejN6enViRG5rcG1kUTl3Ukt0QlMrSW9lVmdCcEo3TXlx?=
 =?utf-8?B?dE9FMzE2S1h3QmhqYzZtZVdPWHA5UGJvNVg5OUZIY1cvSlA0Z0J3ZTdrYmFu?=
 =?utf-8?B?amZBeEU4di9uZitxQWl1V01MemxHNnVsTnBVU0VnZ3hEVjkza0ZWdDRWaWkr?=
 =?utf-8?B?YmE4R3hkSVpHV0JFc1BOcmJwcUFxRVIySTBLVnBIS1pqemI1UWlRdjg1RWth?=
 =?utf-8?B?RXUxcGlBb09CcHI4aXdHMy9oeE9VT0xqU3BkcFhZVUphR01mSTNMRWtPN0dy?=
 =?utf-8?B?QlRJc3F6WkFEU2t5ZUNpOS8xbmdwUUVvaE14anlSZnhFd1NxT2dtSGVWYkx6?=
 =?utf-8?B?MWxObndKUWM2UlErNnR3aFhRUWFkNG10N3plcEQ0TUZ2UkZneXBZeGp1eXBq?=
 =?utf-8?B?TnByVUhKcmt2WnFjZzRvS2x1NzVQYVZSQ3g1RXFROCthaXROemI4MDFVTldx?=
 =?utf-8?B?UVlWTUp1QnVNMFFTVFlEdVhVV3ZVejhmRUpIS3JWQzhUQklkOWladWlaeXJ6?=
 =?utf-8?B?Z3F0VkJUeWg1Zis2NE1iT3dxY1NpVU1nMXRYR0cwdVZMM1E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N010MVdpalN5Z3FLS1hKaW1XaWpBc3l6VzVBUkYwZE5wWlhwb0Eyc3VKYlpi?=
 =?utf-8?B?cm9zSEdRYnYrLyt3Zkh0N2wycnJsQUZGY3NmQXR2ZHE2a1pRVk9yWUFRRGxG?=
 =?utf-8?B?dG9uOU9rYjBuU2FVODN0VjFUMjkzMld1SjV2VzN6WVJlRG5haitLTmxwQm9q?=
 =?utf-8?B?b2N0SVhuOENQNkdLdThxRE1KUDYvdllGNk8vVWdaWFlFdmlmR0ZPNzgvd25q?=
 =?utf-8?B?Z2RhMmNEcjZNdXdzUGdOTGFoazZJbVE2cFZMUWJLMXpkVTJoTnBTcG1aMStD?=
 =?utf-8?B?a0VGb0xlVXF2V2VxVThEMnExeVA0SnpVTlNmczRnc3JTTHVWSVA3WTlVRVd1?=
 =?utf-8?B?cTQrZXZ5M1BydUlPU3VWeGZKZGZwMFRNcXp4Wi9reDB0MThETENvM1dOcHI1?=
 =?utf-8?B?elVmc2xIVHdiUVlYdGpFeUtCY1JpZFM0UW9xL3VNb3JiQmpocmplZUt6R1Mz?=
 =?utf-8?B?TjY4TEMzb0dydlZrakdhN1RjR3J1Y00rUUsyTWpuSzNzZlZyS3lxSlZJNXFQ?=
 =?utf-8?B?YkRBTUlVRzA0VDYwNXI4ZGtQQ2p0NkRBVXkwbDN2TFNnSFhOZVozR1ZnOWdR?=
 =?utf-8?B?OXg0cDdhOHpxdnN5ODlnMCtiWmFFcW02WXI5WEwyUUphbzZrMldwN3I2aFhU?=
 =?utf-8?B?SDJ2dVlReGk3bm1scUJGcGJWMkozUFlzNFRrSWFsTzlxTWdMMGR5L0pTMisx?=
 =?utf-8?B?MEZ1RXE1TllEVWYrNHF6T2ZVNFFzZHhGRG9FWkpsZEV6SVYrbnVmSjRTaFFN?=
 =?utf-8?B?aVg3QVB1TjRQMTlrRC9oeVduSWlyaklUYWtTNHBadlA5UUMwSWVkQjV1L0Jp?=
 =?utf-8?B?eEJ3MXBNR0V1N2d5K0VtdzZRM2o2ZTNlWi8vWkhJaGF3NE9VWEdLUXZ5L3Va?=
 =?utf-8?B?TG93bVA1dlFwcHJnQzl4cHlITHpRUTJmRzliMCtXZmpobnJNSDhUOVRWMVhs?=
 =?utf-8?B?RTl6bFQyS1RpMnRNalpRTEtIZjdmbzZTakFHcVVCNmk5eVd6M29aUklTRm1m?=
 =?utf-8?B?SjdRV0lEZktwNE5YbjRYRVFzd2xQaTZETHdLS3drMk82SXJpOUhoNElrd0FD?=
 =?utf-8?B?RWE4QnNTWlhwOWFBdkVpVGl2Q0UxSktEZWVmYWg0TjE4Q3NBMmhLb25HckUv?=
 =?utf-8?B?SjB4WmJTUDdxQ1dKT0tCNXIzVFpEUXNIeEZ6ZGFIZEt3RnRGQzlDRncwVHBx?=
 =?utf-8?B?Y2tzRFplaEtxSEF3cGRzdGh1Y2hSUVlsSTN3M0lDdzRyTmt6cS9oL3BrS20z?=
 =?utf-8?B?VlZCWTZYdjArcWh4UUtKL2MxNCtzb0pmVlE3YTdHY3loL1A2VTFhKzV1N3M2?=
 =?utf-8?B?ZTBRSGRKSXJHWFZiM2d4NVdCSThSL3hSeDhyczNqdTFVK21NUWhRZFZUVTA3?=
 =?utf-8?B?aytOVUhIellXa0dpWHZVMFdpazBCWW5XUE5ySGkvRzJqQ2JvSzBOSFlHeFF2?=
 =?utf-8?B?YWxtbi9VZkNDaDhhOHFLc1hkc0RybElQaWdxWnVyR0M3OHRjQktmSDI2TXdw?=
 =?utf-8?B?Mk9EOEF5dStaSlZicXVOUGFYY1N5Yy9VMHJsRHkyb25nR3J0cyt4NWlVbjV4?=
 =?utf-8?B?cDRzRjNSdFlUR003dFQxMjkrT3JYclVSeEtVd1Q0VXVWR3ozbFRaRTF6Z3hZ?=
 =?utf-8?B?VzRvNGRKaXpjR3dSL1dyUDR5ZUFLTkxlQzNOTC9zZUtqK2ZjT25EeGhQQW90?=
 =?utf-8?B?dVkyTy96a1hCSjQ1Y3B0cEV0UFRwcStNdTJ1M3VCb0pFamU2T2lxdWpvTjZi?=
 =?utf-8?B?THFQNE5MZENHRDgweGxZRDM4cktOOGNpRlZtdmlwcTg1RHRzaFFmb0w1aDJa?=
 =?utf-8?B?Q2k0TlU2V3hpVEpUa3NpdHVkSzFVVlh0QVZta2pQSnUvcVFUNEFyVWN6ck1P?=
 =?utf-8?B?TDJWUXJlSlVRdlV4Tk85VCs4UitRdzJKU2tkckppa05UNkFqalpuUHhQM1Bj?=
 =?utf-8?B?WVZZeElZQ2IwLzNjcTlEOGpOMyt2cEZhVzdvek4yNEREV2pZd1lvMU1mcHZs?=
 =?utf-8?B?eTlhSHFhMGh3enlma1RqUkpwWm94Q2t0Sndjc3hWK0lhZVJ2Y0xjVWJ2OXli?=
 =?utf-8?B?YVVmazNldVdheFBWaGRKcFR0YlNyVVRRVG5VZXgxNW9vUVZIdzFrbkh6NUR3?=
 =?utf-8?B?WHZlSlgvdE1acXNZR2lFbVg0ZXlucGEyWU9EMk9HL2dqTUhaREZqSHgrTFVS?=
 =?utf-8?B?VUE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088fb59f-63b9-4984-fa1f-08dd1bfac2a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2024 04:49:57.7760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2YnAB99PJWRSwqDlaKEQhAPLmE6kCD7DEpVXCff4fGCL46Tk7gDwBkmd0NOm/nb5jCxNG6XmOLPrPR2XxHRuFMvcUyZH988KA7uKD76qRwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12398

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAxMywg
MjAyNCA1OjI1IFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC81XSBzb2M6IHJlbmVzYXM6IEFk
ZCBzeXN0ZW0gY29udHJvbGxlciBzdXBwb3J0IGZvcg0KPiBSWi9HM0UgU29DDQo+IA0KPiBIaSBK
b2huLA0KDQpIZWxsbyBHZWVydCwNCg0KPiANCj4gT24gRnJpLCBEZWMgNiwgMjAyNCBhdCAxMDoy
NuKAr1BNIEpvaG4gTWFkaWV1DQo+IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgUlovRzNFIHN5
c3RlbSBjb250cm9sbGVyIGFuZA0KPiA+IGV4dGVuZHMgdGhlIGV4aXN0aW5nIFJaL1YySChQKSBz
eXN0ZW0gY29udHJvbGxlciB0byBzdXBwb3J0IHN5c2Nvbi4NCj4gPiBUaGUgUlovRzNFIHN5c3Rl
bSBjb250cm9sbGVyIGFsbG93cyBkZXRlY3RpbmcgdmFyaW91cyBTb0MgZmVhdHVyZXMNCj4gPiBs
aWtlIGNvcmUgY291bnQsIE5QVSBhdmFpbGFiaWxpdHksIGFuZCBDQTU1IFBMTCBjb25maWd1cmF0
aW9uLg0KPiA+DQo+ID4gS2V5IGZlYXR1cmVzOg0KPiA+IC0gU3lzY29uIHN1cHBvcnQgZm9yIGJv
dGggUlovVjJIIGFuZCBSWi9HM0Ugc3lzdGVtIGNvbnRyb2xsZXJzDQo+ID4gLSBEZXRlY3Rpb24g
b2YgcXVhZC9kdWFsIGNvcmUgY29uZmlndXJhdGlvbg0KPiA+IC0gRGV0ZWN0aW9uIG9mIEV0aG9z
LVU1NSBOUFUgcHJlc2VuY2UNCj4gPiAtIFZhbGlkYXRpb24gb2YgQ0E1NSBQTEwgZnJlcXVlbmN5
IHNldHRpbmcNCj4gPiAtIFNvQy1zcGVjaWZpYyBleHRlbmRlZCBpZGVudGlmaWNhdGlvbiB0aHJv
dWdoIGNhbGxiYWNrcw0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHNlcmllcyENCj4gDQo+ID4gVGhp
cyBwYXRjaCBzZXJpZXMgZGVwZW5kcyB1cG9uIFsxXSBhbmQgWzJdLg0KPiA+DQo+ID4gVGVzdGVk
Og0KPiA+IC0gRXhhbXBsZSBvZiBTb0MgZGV0ZWN0aW9uOg0KPiA+IFsgICAgMC4wNjU2MDhdIHJl
bmVzYXMtcnotc3lzYyAxMDQzMDAwMC5zeXN0ZW0tY29udHJvbGxlcjogRGV0ZWN0ZWQNCj4gUmVu
ZXNhcyBRdWFkIENvcmUgUlovRzNFIHI5YTA5ZzA0NyBSZXYgMCAgd2l0aCBFdGhvcy1VNTUNCj4g
PiAtIEV4YW1wbGUgb2YgUExMIG1pc2NvbmZpZ3VyYXRpb24gd2FybmluZzoNCj4gPiAgWyAgICAw
LjA2NTYxNl0gcmVuZXNhcy1yei1zeXNjIDEwNDMwMDAwLnN5c3RlbS1jb250cm9sbGVyOiBDQTU1
IFBMTCBpcw0KPiBub3Qgc2V0IHRvIDEuN0dIeg0KPiA+DQo+IA0KPiBUaGUgbGF0dGVyIHBvaW50
cyB0byBhbiBhbHJlYWR5LWFwcGxpZWQgdW5yZWxhdGVkIHNlcmllcy4gIEkgYXNzdW1lIHlvdQ0K
PiBtZWFudCAiW1BBVENIIHYyIDAwLzE1XSBBZGQgaW5pdGlhbCBVU0Igc3VwcG9ydCBmb3IgdGhl
IFJlbmVzYXMgUlovRzNTDQo+IFNvQyJbM10/DQoNCllvdSBhcmUgcmlnaHQgYWJvdXQgWzNdLCBh
cyBpdCdzIHRoZSBzZXJpZXMgdGhhdCBhZGRzIGluaXRpYWwgc3VwcG9ydCBmb3INCnRoZSBTWVND
IGRyaXZlci4NCg0KPiANCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsu
b3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhh
dC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

