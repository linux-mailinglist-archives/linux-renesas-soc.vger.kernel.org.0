Return-Path: <linux-renesas-soc+bounces-9690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7199A88F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 18:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FCA3284345
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 16:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D961219753F;
	Fri, 11 Oct 2024 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W3zNoAMN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D3A196D9D;
	Fri, 11 Oct 2024 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728662561; cv=fail; b=AFmfWbUd1Z4sVyFqXZaBtdvE4x6lTFLzrotyBJnZ1wlNTtCvQmXaBu7dtdXyREwNCuSjHS8Kqov0T2CXm5evW34T7ofFRPRFNkj9ZJ7SQ8rFB1q+S2Ava7lp7H+ge8Qa3l6nHA1ZNPePBMDAwmAKce44Hd6JzWkpSkPgTr4AFWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728662561; c=relaxed/simple;
	bh=dJ0vWP0hXMWHkTx5TYmuaVxWEqocQRLL8xoZVCl7BPE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tIw7O8gNRr9qlb57y/uyQR72XGZSz73gLwRBQUs5L64WYIpJGWWrBjJbjP7liSWPp3+309xtW7X6IAF8+l0QVoaEGvcgi5T9kSazCLZhhW1P+2QAtJZ1VLIUxh4kC1NSpyOOXhwg38UagIKmrAHucKn4Hv+fBrwl9+wSuzPICjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W3zNoAMN; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPZUtjkhPPj5mf22J/h/fccuFMQjHCYyzUl8Co2jfLhuyCxVAJXIZbuDtTv7bfBftjIfaiPQCuUja46iYiPWY9TbU1eV1l1fKLri7Clkks5bYZ1r2LSs/IVvQnOpSyodQGEhe0fK/caTR//oPV046tUNUFzbyk2gLAugTKAMbb0lIts9+Ivl7XlPHfWn3UBd6NrgPfhYZmh47VJtfYbOef+U8UjvVupQkt1ST85VSIRcDNWUWTeploUMlm/GIWXVsENhJ8xk7C0V8K8jD4EysBk/HH2d5iknmTndFnnTqaYC6BIoZ0DnEU9MpLeIU7QRtPmXahNpt8ZLsKfMCuyCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ0vWP0hXMWHkTx5TYmuaVxWEqocQRLL8xoZVCl7BPE=;
 b=CGUVm7hDHI6eUe4rZel/+MZoMeAf6Xd2kIhJ8k0SxEaUapzxpwvUAQc4VQ32ddcPJWBuJJnlMGVgBGmZ811CptqMNTassrNgPp0QCFT0kxioN4iI11UICc2GotgcfquSBt6/YaNbu0HNbWuFI9rFTqSrZ2RRK9rq8oMHxr0dTKOeWFHq6tq9RANf/8iIojATeR7jVXuv8Yq0TsezdJGoul9DXzHaubPqqdkSRtRGvpCc6PFwPFnxdOMbouSI5pXYhLE78uCfa/rwScxu6XhfIHGGXYCXrEVPIMq4J74CcIKOnlAT7Gw+hQHbcjc8WUlH2zAMY1frNYFqMvud9jq3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ0vWP0hXMWHkTx5TYmuaVxWEqocQRLL8xoZVCl7BPE=;
 b=W3zNoAMNfVFz9bchdt/zl1BfaCG89MuoAt9tXY+0c5/k68keYlxNb1FZ9dRi5TErQYW6r14SEbXgTZ/QA4mMYEDyi6A5CPvutbFr/Z+yb7eP/hIVOqa5fVDAnwUrGZWRW6IuB16aqiY+GD8o664XjtA1jUm3zSX/i/j5FQAmQ04=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10168.jpnprd01.prod.outlook.com (2603:1096:604:1e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 16:02:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 16:02:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Hien Huynh <hien.huynh.px@renesas.com>
Subject: RE: [PATCH] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Topic: [PATCH] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Index: AQHbGlP1JSqXVIRQrEqRK61FrWL9trKBmSGAgAAfr7A=
Date: Fri, 11 Oct 2024 16:02:32 +0000
Message-ID:
 <TY3PR01MB11346A43AAD1DE1537780E73A86792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241009140251.135085-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXqZYqGnNZqNu=8mMbfidCH-+E1Nn1Fr=tjNReqw5gLZw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXqZYqGnNZqNu=8mMbfidCH-+E1Nn1Fr=tjNReqw5gLZw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10168:EE_
x-ms-office365-filtering-correlation-id: 9a5154aa-5045-440b-14cf-08dcea0e1d9f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QWxETGx6YnpQRFpCS3VmRDVtR2daUnRHbzdDMzZCcHlsZXYyVy9GWDN1Zk1D?=
 =?utf-8?B?dzFPWmE3NkdPZzQvelpNTUNaRHMxcWxmVGNzTVlDQjJWY2YvWm0rV1p5OHg1?=
 =?utf-8?B?eGlvNklVa0tFanFCNDBTMWJybmZIUXAyL0NtTHNyVkg0R2hVQzVHU1FmOXZ3?=
 =?utf-8?B?TGczQmY3MUp5Rm8yVjN1Y1hsUDQxNnVEcTYrWHlQaEdFL0ZpK1NONFJFL2Np?=
 =?utf-8?B?S3lSREo4ZisvUUxyeEFZL3RZUk80alc0YW5QVXBLUlY2MlA3WldBbHRId21S?=
 =?utf-8?B?RVR6U1F3Y2dpZDZKRUozdkFiRkRBQnR2ZWprZC9lRGdwNVpua2dyV0h0YkJU?=
 =?utf-8?B?ekxwbFJadXNzazM2UXdyVW1xSmZTc3gyVWNKM1huOHZreGZlMHZLN3VSOEcv?=
 =?utf-8?B?bWZNZGRVTkhncnJsMitGZWRwN1NXK2ZMWnZIVEVTaWxwcTdLTTQvbVd6c3A3?=
 =?utf-8?B?QkJjN3craWlJOHkwejRNOFpNaFNnU20vNjA0ODBRaFd1aVB6TERIUFIrOEJQ?=
 =?utf-8?B?TDUydEtnOXJ2b1V4cW8rMm1JaitmVkYxY0E3dURWYXc4K2lDdHEyd0UrV1dO?=
 =?utf-8?B?SzFVUnkrSk5IT3NjVjQwVFVITkQ5NVFTa2xMdVUySzlnZENrcEkwNkVkQ2ky?=
 =?utf-8?B?OC93RGRMWms5MHdicERublRUNjA1Y09iNGpqZFNKQUh2cXlBeGZLSTA4WFFl?=
 =?utf-8?B?ZitucWcvalVzR09NblVKMEU3VEpxQUZWTElRV2Q4eG5rS0NMNjZnRFViU2Ns?=
 =?utf-8?B?L3hyK0h0bitYM2o5am1qU2YxWS9yWWV1UDFnL25aTUhQeFR5aFFVdnlqRE14?=
 =?utf-8?B?K3lDVExqR2dDTDlZYzFnUkJWdnNydEhpa1cyTUJpQUVNc2xDN1NMOTJHR3dt?=
 =?utf-8?B?aC9EUnEzYmR0dld1UXBuUUJSYmt6MUt6b1djTkdKaTk0a05tdzQzTUhZTkpX?=
 =?utf-8?B?WXJHamRaMHliT2dxNmpoWDZNVXRMQnZ0c0k2QkhMMGlaQnV0N0Rla2h5K210?=
 =?utf-8?B?c20wSHFnMGFoVEQzQVBKcldaZTVhbXcySWY3NlNyODRnYlBlRlowcEZDM0dW?=
 =?utf-8?B?VzFtVVN1clVwVklUQ3BYU0R1WWJtTzNWMmcvY2lPckdtYTcxTWRsZHhjNEIv?=
 =?utf-8?B?NnMxWW0zTncydHl6c1JIZ1dPMHB2V2RwL05kT3RmUnAwbkZIcjVJZEtVVHZp?=
 =?utf-8?B?NXdkN1RzR09aTFRidFdCanRYajBVMDV2U0N0ZWJWclRINXFpK3JuSC9kd1ZS?=
 =?utf-8?B?OFJzNDdhelpxQjFlY3BUV1g1bmFla1JMWHhzTElERm56TzBiOTNXQmJLeklJ?=
 =?utf-8?B?TjVnblZ6L296My9PSVVrL3RHZEdTK2tNOWsvMjNCeUczelZOeUlOVXUrK04w?=
 =?utf-8?B?TjVOcFJDL1ZNTDJJMFVWUzBKZ3BRZXFMbXdGMDIvWklTRE4zS2FMb0tzL2tN?=
 =?utf-8?B?OEREdXhoTDBkVDdhNTJoeWc2bVQ4dnFtZzJRZE1CdFN5R1dEZ05TeFJUMklo?=
 =?utf-8?B?cUhPbWwrSWlKSG1jNmpNWGV3SVVzWGU5NEV0WVBIOHlvUEdjK2dzTElPbGNU?=
 =?utf-8?B?VmR5d1pMZnpoNzcwSGtsR01pNDJ5djNDMHRUL25SOE90VFBjcjZPZnZCclB2?=
 =?utf-8?B?SmRiTEhURDNFZmkwZWhNL2EwNDNRVjlOaklXYnZNdEl1SDRoVTlRb00rVXZp?=
 =?utf-8?B?QTdEdFU5ajJGTDZZMWQzdDNacnhTU0krMkZHYTRmdzJaL0FSanQxNEt4dWpj?=
 =?utf-8?B?MUtXNDgxWXlNVytaR3JCZXprU1lHa3l1MisxeEIyaXNUK1A0Ukg4bDhoaGMv?=
 =?utf-8?B?VnpXNDcvRWszcDFlcitoUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmUyalVmamtqTWpJa2FNaGNqNUw4N3FSSUJMM3lQU01BTEZ0Wk54ZmtwRzE1?=
 =?utf-8?B?L2d1Q2Rpd2F0WFFaRTJZWlJuUkpLR3NlSjQveDZuanc0eTNiVzhpM0dVOGdl?=
 =?utf-8?B?cTVkU0FEVGdSRXI5MDdmS05kcUVZWCtIY2Z3SVNXbWlmZkNMV0Q5c2hhWER4?=
 =?utf-8?B?TmZkUnZHcmxzYkVXSjlENDZIUFRzUHZVR0tYc1Z6VCs2eEdVV3owRDBhOGlJ?=
 =?utf-8?B?ajQ5dlBXeW1YMTNSc0o4d3ROdGI5cndjRWNZSUllYkRuOGFQNmRuem95K3Rn?=
 =?utf-8?B?ZUwxWUFHQ2E2SVhQR2xsVGg3eVJvRm03eFdDTHkwSVpLSm1wdWhPcnhPQ1Bw?=
 =?utf-8?B?RENFUzVqYms3VmVvNVhLbDcvdCtwVDZ3aEZkOC9RUFdEd1ZybVZQWkxtelhS?=
 =?utf-8?B?cDIvcnJXb0hUYlpoM3ZiaWRlcURMQ3o1ZkhpUkhkV0ZPQks2Z28vUW1KWk1U?=
 =?utf-8?B?ZG9RS3NYTUxCVDlRenFueVgzT0pBR2ZYQjZadGRyMlJ6WGdaVWVEY29XYWNT?=
 =?utf-8?B?SVZIYlFMMzZ6amNMZ2swK21yd3pYT05PWUpXYXE3cExmNTJlNlpZMGZYVkxI?=
 =?utf-8?B?TTRmNDhDTzArN1IwR1FYc1pkY2VLbFF4SitGeEF4Y0FhcndqUWdHVTczdTM2?=
 =?utf-8?B?Q0JqTjB0NUdhbnYzSGVPWFg2ZVhSOW9haUNydk1rTG1iZXJNTEZGQWNYWnZv?=
 =?utf-8?B?QnJMRTRiQ0dsSUJsRFVqaFM5eUR3TWRnQTRLV1VJa25KYnNPTllFRzJVWVhD?=
 =?utf-8?B?OXFJVjZTcVJpaWZQUWRwMlJ0akJnWExwVHRqcHdmakN4YzAzbHFXSmJRMlRU?=
 =?utf-8?B?SWI1RzBMUi9DbU5IL0dHUGJYell0dnFLTUxOSTdKTWhDeC8vZlBIVEZERWlV?=
 =?utf-8?B?RW13SjY2Y1BqL0U0QnpyaFdwanlHOGhQMk5laE1KeUREeVRBTDYwb1ovVkpr?=
 =?utf-8?B?clcwNy9ub0hwSVJKU2h4MG0vV0dNdXZIMmJyRDFCUTlwV0FRdkNXT2o0Ykp5?=
 =?utf-8?B?cXJxamFMQk44RWRNRXZEQng0TnQzbmU5cUROdEpjL1dLOGhVWEpoVDNWbEFE?=
 =?utf-8?B?VXZCMVRGaUtSQmR1c2c4WVNZNUlkK3d1Wm92dG56bzY1N0loL1E4QzlwL2dR?=
 =?utf-8?B?Y0VUUWNBSmNqZjVHQjZLSGNFUTJ4Sk5aS09abloydElPMmNMNUI1Z2RWUGRY?=
 =?utf-8?B?TkhMd0ZRZ0RGNVloeUM3VkVUM3FJcU9vblh1MDZhOGxNYTlYL2VqSFZzbzAw?=
 =?utf-8?B?RVV6bTRVc0xQU1BKSURMeDBRSE9yYkNRSm92MG45VjJnQW5UZTNIdWY3TWRw?=
 =?utf-8?B?S1RoQURJakpiWWhtRkM2dWFkQnBWUG1lWURvck1NVFVLZWJPbHM2WWZWaWUr?=
 =?utf-8?B?TGFsQkY4MDd5WVh1OENPN2I0V2FGZWQyUzA3YmpLZzdUUzJ2Y2t3TzNzaWVL?=
 =?utf-8?B?UHI4SVh2WDRBNWJ5b2hxbTRWd1RqbVdGU3h4anpmdWluRGFnbHMxb0dpc3F1?=
 =?utf-8?B?cG0xdWFiRXdETUo4OHo3aFBIcjFxMXpnSmJIRkdOTEIvYXE3MW85WUU3TjRh?=
 =?utf-8?B?ZDJNdXVRNUwvUkl3RjdaS0E0cldFazEvREZtcmdPaUpEbW1RNnJka0lRUGhv?=
 =?utf-8?B?Ukp6WHpoUXNWcVJYbEFaclZZQk9YS0h1WGw5R3VWeVgrV1JKcGVxMDBpeHdZ?=
 =?utf-8?B?dUJQTlZldGNNRTZESUdiMVZlS2pWSEpoVk9sd2xmTVBINXZJRWxtcUJ4ZGNo?=
 =?utf-8?B?bnl5Q2xHek1CdXYxU0Z4bk02Yk1KMi9Sdm5wdVpFRDhMT2hDS2pWb0I5WFZj?=
 =?utf-8?B?UGpwdXVxSWEvbUc5bVVPWkpISW9ZSzBrU1owbjdNd09QR0M1NnJKYnV0YStj?=
 =?utf-8?B?OERET284cGZqRC9EN1VaamtJYm1qY0s4R0s1TTcweStWenFKNGxkK2p3Rmsy?=
 =?utf-8?B?RElLQzlhSkxQY1ZzUkp6SS96azFSbG53ZkVZUDUwdUI3bnQ0aFB0ZGtVVG1T?=
 =?utf-8?B?VCsxQlRUaVdZTlk0M3BvR3d4MUFLcFlicVAxczFqWDNhR1l0TUV3VzBXSm1Z?=
 =?utf-8?B?ajY1R3Fld25oT2g5dVRudHQrWUNXWHUxMXVQbUFTYmVxcnk0a09kUUtJM0x5?=
 =?utf-8?B?K0ZQNGlObFhOejFGbThjVmgyU3JGb0pSRjl1OXl3QkwvQlVBeXJEWnNhOTVx?=
 =?utf-8?B?U3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5154aa-5045-440b-14cf-08dcea0e1d9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 16:02:32.6870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mK5FILD1nsj/hWVWostOJLHXfLIusubaukcCtSg6SmBFweZIGI2DcTYD9tDl2HKdPe2tAnK1IFC6XbvKdDp6mxj/Fil66eNQJYRcgnygqIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10168

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxMSwgMjAyNCAzOjA3IFBNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGNsazogcmVuZXNhczogcnpnMmw6IEZpeCBGT1VUUE9TVERJViBjbGsN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIE9jdCA5LCAyMDI0IGF0IDQ6MDPigK9QTSBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFdoaWxlIGNv
bXB1dGluZyBmb3V0cG9zdGRpdl9yYXRlLCB0aGUgdmFsdWUgb2YgcGFyYW1zLT5wbDVfZnJhY2lu
IGlzDQo+ID4gZGlzY2FyZGVkLCB3aGljaCByZXN1bHRzIGluIHRoZSB3cm9uZyByZWZyZXNoIHJh
dGUuIEZpeCB0aGUgZm9ybXVsYQ0KPiA+IGZvciBjb21wdXRpbmcgZm91dHBvc3RkaXZfcmF0ZS4N
Cj4gPg0KPiA+IEZpeGVzOiAxNTYxMzgwZWU3MmYgKCJjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQg
Rk9VVFBPU1RESVYgY2xrDQo+ID4gc3VwcG9ydCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogSGllbiBI
dXluaCA8aGllbi5odXluaC5weEByZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4g
PiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4gQEAgLTU0OCw3ICs1
NDgsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZw0KPiA+IHJ6ZzJsX2NwZ19nZXRfZm91dHBvc3Rk
aXZfcmF0ZShzdHJ1Y3QgcnpnMmxfcGxsNV9wYXJhbSAqcGFyYW1zLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHJhdGUpICB7DQo+ID4gLSAgICAgICB1
bnNpZ25lZCBsb25nIGZvdXRwb3N0ZGl2X3JhdGU7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBsb25n
IGZvdXRwb3N0ZGl2X3JhdGUsIGZvdXR2Y29fcmF0ZTsNCj4gPg0KPiA+ICAgICAgICAgcGFyYW1z
LT5wbDVfaW50aW4gPSByYXRlIC8gTUVHQTsNCj4gPiAgICAgICAgIHBhcmFtcy0+cGw1X2ZyYWNp
biA9IGRpdl91NjQoKCh1NjQpcmF0ZSAlIE1FR0EpIDw8IDI0LCBNRUdBKTsNCj4gPiBAQCAtNTU3
LDEwICs1NTcsMTIgQEAgcnpnMmxfY3BnX2dldF9mb3V0cG9zdGRpdl9yYXRlKHN0cnVjdCByemcy
bF9wbGw1X3BhcmFtICpwYXJhbXMsDQo+ID4gICAgICAgICBwYXJhbXMtPnBsNV9wb3N0ZGl2MiA9
IDE7DQo+ID4gICAgICAgICBwYXJhbXMtPnBsNV9zcHJlYWQgPSAweDE2Ow0KPiA+DQo+ID4gLSAg
ICAgICBmb3V0cG9zdGRpdl9yYXRlID0NCj4gPiAtICAgICAgICAgICAgICAgRVhUQUxfRlJFUV9J
Tl9NRUdBX0haICogTUVHQSAvIHBhcmFtcy0+cGw1X3JlZmRpdiAqDQo+ID4gLSAgICAgICAgICAg
ICAgICgoKChwYXJhbXMtPnBsNV9pbnRpbiA8PCAyNCkgKyBwYXJhbXMtPnBsNV9mcmFjaW4pKSA+
PiAyNCkgLw0KPiA+IC0gICAgICAgICAgICAgICAocGFyYW1zLT5wbDVfcG9zdGRpdjEgKiBwYXJh
bXMtPnBsNV9wb3N0ZGl2Mik7DQo+ID4gKyAgICAgICBmb3V0dmNvX3JhdGUgPSBFWFRBTF9GUkVR
X0lOX01FR0FfSFogKiBNRUdBIC8gcGFyYW1zLT5wbDVfcmVmZGl2Ow0KPiA+ICsgICAgICAgZm91
dHZjb19yYXRlID0gbXVsX3U2NF91MzJfc2hyKGZvdXR2Y29fcmF0ZSwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocGFyYW1zLT5wbDVfaW50aW4gPDwgMjQpICsg
cGFyYW1zLT5wbDVfZnJhY2luLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDI0KTsNCj4gDQo+IFRoZSBmaXJzdCBwYXJhbWV0ZXIgaXMgbm90IHU2NCwgYnV0IHVu
c2lnbmVkIGxvbmcsIGFuZCBpdHMgdmFsdWUgYWx3YXlzIGZpdHMgaW4gdTMyLCBzbw0KPiAibXVs
X3UzMl91MzIoLi4uLCAuLi4pID4+IDI0IiBzaG91bGQgZG8/DQo+IA0KPiBIb3dldmVyLCBpZiB5
b3UgY2FyZSBhYm91dCBwcmVjaXNpb24sIHRoZSBkaXZpc2lvbiBieSBwYXJhbXMtPnBsNV9yZWZk
aXYgc2hvdWxkIGJlIGRvbmUgYWZ0ZXIgYWxsDQo+IG11bHRpcGxpY2F0aW9uLCB0b28uDQoNCkkg
ZG8gY2FyZSBhYm91dCBwcmVjaXNpb24uIEkgd2lsbGxpa2UgYmVsb3cgaW4gbmV4dCB2ZXJzaW9u
Lg0KDQorCWZvdXR2Y29fcmF0ZSA9DQorCQkoRVhUQUxfRlJFUV9JTl9NRUdBX0haICogTUVHQSAq
DQorCQkoKHBhcmFtcy0+cGw1X2ludGluIDw8IDI0KSArIHBhcmFtcy0+cGw1X2ZyYWNpbikgLw0K
KwkJcGFyYW1zLT5wbDVfcmVmZGl2KSA+PiAyNDsNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+
ICsgICAgICAgZm91dHBvc3RkaXZfcmF0ZSA9IERJVl9ST1VORF9DTE9TRVNUX1VMTChmb3V0dmNv
X3JhdGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhcmFtcy0+cGw1X3Bvc3RkaXYxDQo+ID4gKyAqIHBhcmFtcy0+cGw1X3Bvc3RkaXYyKTsN
Cj4gPg0KPiA+ICAgICAgICAgcmV0dXJuIGZvdXRwb3N0ZGl2X3JhdGU7DQo+ID4gIH0NCj4gDQo+
IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQN
Cj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

