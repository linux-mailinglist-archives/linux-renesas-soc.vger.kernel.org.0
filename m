Return-Path: <linux-renesas-soc+bounces-23290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34431BEEB1F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Oct 2025 20:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EEC03E3B82
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Oct 2025 18:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A740721578D;
	Sun, 19 Oct 2025 18:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MSUAErVl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33215B971;
	Sun, 19 Oct 2025 18:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760897230; cv=fail; b=nr6tmdFg9JjAv0S2Q2OgmXekDel4+WlYLQd3z3p682zD24FjH6krwA8+4/jnXv3uAPkDguozb9h7p82Ikq6M8583JHVE02kiIfQ3ynnquaLb8Z9YxN6J5qer6IYkWbIgm4jCas+aZfIxLc5/lTRL1XfAG8JKNlcXCYtJ5gLka9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760897230; c=relaxed/simple;
	bh=Rt8f56Fl8Jq/Sr4Uc2xdhzfN+i1vYx8+o8TxSpafkvI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rSbNS2Tb1La5L/fABKWw4W2lEvv3S1vm4ToIxfmvk7i55PJ2ZkeBDCQviVIL0yCf24RqBcuN1R+sMcRS5BbI0f3MTF8lFPHWPOntitm4iiA8bWkTl3c1lGYl4zWSGnJWyyRk+CY+vRBiMio2Mi+bmTsblRpYEVwAgBGlJoJanwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MSUAErVl; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsUHIAf6qKNN+L7EZI7AUCw7CnpTTNe4oul0qr5PaEgAwYX/X3JHYPQscOEJi8w8Hi0MS5WGxzJNkSfs3xpY4EBEmVzP9uDJWSNxPnkgkm2bmvS4eGsi6UNOPtJWlT0dshqSAZHuQsIAHzR8XnGevJ1/UPGlncQhW8iF6X3BP2nrHTxJl4WOPeg+Lb93diS1lOrdKmyz9a0CxhctaktcJYNdVhGt/yyDWhObbj2EJ2xz1d0JIWetreqyI73YH2ZdAPZkQJqiEB691Ioq9zgHff/Ms/usSMae8DzQjHFLNhUGNhJ/QSOyAVS1g4jRb3dT6NCZM+y+lf7hxgvwT6cJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt8f56Fl8Jq/Sr4Uc2xdhzfN+i1vYx8+o8TxSpafkvI=;
 b=gniww28Qdja8w+AX7Qo2Ivkg93mFGGmVQlh+MRZicgtvMrnjjuQXWoPyStwOirsqJhlTUzg2AEsBbXoNqxWSGdunyHnjKHPZzeUQUe/alMC1+KxRf9zlgs17o7C+o7C+sJsXFYelnLcL94M3w+k2A5XExyeAEQgF3SXmJamYrw0MkImLZggGOkhv37DFviUadjvXw68+Lb2tlnvN8vhWEkZJJ1wi5cuviSjxTfco+e4m7wzu2KFCkjHUcVtM00xFT8ZZBOuua5BBb3DukmliRgxnu/LBO18H9R5T4lumUSQ3oFg73Z2icr4drf9wCkEFSrpoF+/oVdNKuYrENjJQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt8f56Fl8Jq/Sr4Uc2xdhzfN+i1vYx8+o8TxSpafkvI=;
 b=MSUAErVlgqakcgyHgOB0RHMSEwtRSa7j5HJbCvg/YjHY5m6DMGJdbaMtlvf6NBZyXHJJ0yhfRC6hwG82U5qeGcP8uZ80KGtM0TyPwjd9c1/DpCVGLMdCjG6DoxdR82rSUQhLHHRjRssW6+4cgGOrsLoJXjhqcv++pPtkiX7wy2I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB8021.jpnprd01.prod.outlook.com (2603:1096:400:ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.10; Sun, 19 Oct
 2025 18:07:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9253.010; Sun, 19 Oct 2025
 18:06:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] memory: renesas-rpc-if: Add suspend/resume support
Thread-Topic: [PATCH v2] memory: renesas-rpc-if: Add suspend/resume support
Thread-Index: AQHcLJzK9gOeDUhsUkWvrXv2iDUut7S6x5QAgA8fomA=
Date: Sun, 19 Oct 2025 18:06:56 +0000
Message-ID:
 <TY3PR01MB113469022C1D422A8E2F5E33A86F4A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250923151437.287721-1-biju.das.jz@bp.renesas.com>
 <4f490516-20d8-485f-8e1a-a1fb8c23e526@kernel.org>
In-Reply-To: <4f490516-20d8-485f-8e1a-a1fb8c23e526@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB8021:EE_
x-ms-office365-filtering-correlation-id: 570b1daf-088b-4fe5-d1fe-08de0f3a4ab0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RTgyay9tRkZxNnlCa1k3eGk3WlRHbVd4Mm5HTGltUGJKNWVzdGt4V0ZzdTNY?=
 =?utf-8?B?K2lCY3AwVnBPQm5qTXAwUEM1NUNvK3FoL3U1Z00zK1Examx5YzJyM2greHJX?=
 =?utf-8?B?ajIzbkVlVEFkMVNlN3ZQVlMxcEtMbDRERGx6czhvb3FrZ0kzQ0poNk56aDRw?=
 =?utf-8?B?VzhMZnJla2t4UFVFaHZTOXhyY3JRdXQydG1xZmZqQnFqeFdXRThRME5NOWoy?=
 =?utf-8?B?WEw3TWYzQUVpbUxpdTQxdGk5bkhDanUzTlgzeFYwTk5zSFNYM1Y1ZUw3dFE1?=
 =?utf-8?B?Yk1KaEppeW45Kytmbit2NVhTb1J6dTkxbnNOeTY0S00wb3U3T05aNzZ3V1Yr?=
 =?utf-8?B?dWQxMzhmU25CemZhZDRRcmpFMEFQZG9BQjJHeHE2a1hlcjQzL1FCcmIwdW1L?=
 =?utf-8?B?NjBNS2NESVR0OFp2STRCM3dYWEJFd2orcFRrR0ROSkRyOW9XUDhNVk1YWmJj?=
 =?utf-8?B?bGQ5dTVIVmVOcFZPbWlVdkFVSjV5T2xQSDhLTXltbWVSZUpVWUYwSTRjc3ho?=
 =?utf-8?B?elRhaktkN2ZYQVZwVEw2eU41ZWZ5R3RBOEFZTVJVeVdLZnBBY0gzQnJhRzdG?=
 =?utf-8?B?VloxbWdYYjVrUlR4NVNUZXJsQXJtU2ZPRDVFYVRHeE5qM3BLbEFnLzN0QStY?=
 =?utf-8?B?Qyt4VFhFY3NFSXlyT25nZVg1RFpQRTV3bFZwbkU5L25rdkZxbnNCZFYvMkxC?=
 =?utf-8?B?cFhNWG1LNXVKU0pQK09QNzRKQU8waitUWW5TVFNwTk9vdktEeE0vcSszcG9p?=
 =?utf-8?B?UkFKZW9Id0ZCUHlZMndDdnVXczVxQXFWdGdzaVo5bmc4T1o2b0FwdnR4bnlu?=
 =?utf-8?B?MVU2SGRENmt6NmlYMXJqUWtCa1JjcTNsOVFXZTNUV25OOFVWZkJHOXoxSXB5?=
 =?utf-8?B?REhVbzBtMk04SUFZc3ZyeUF3aEtWVDQxb1ZhbVJvbXY1TkpXRmFuQk0ySVdz?=
 =?utf-8?B?TytTQVhnNTBPNk5GbTRHQnJpeGE2ZGF4bnFTeGlOT0J3TUd1UGZkN3VKSVdY?=
 =?utf-8?B?UEVIeUQ2MmZPYmFvV3pHVGVwbEZ0eEFRZGI4bWNhWklvTHBPVFFTT1Yza1pQ?=
 =?utf-8?B?NmxML0JFTlJTWlZ0b1I2eWVMVTB4b2xJbmRGMFp2cTF6U25TMXBzU3NibVBj?=
 =?utf-8?B?Qm9vTHBJTkZqYjhGcG9sbVVlRDhVQm5mOTgzcjhJQUlCd1g2amJOc2V4YmJT?=
 =?utf-8?B?YlQzVmhQdXFESm1xTW5rcFQvYjdiSVBmdS96SWdPTEtsWlNHcnkzQzhJUmZG?=
 =?utf-8?B?RGEzV2tCNjZjVHNnaVU2Z1ZVci95OGl0SzhHMnRVUllDNEVsdnh5YXdVYVVl?=
 =?utf-8?B?RkpESzFXcHpSMWdYNlI4NUw4YnJrbVR2QjJNcEJENWJkZUZueldmaUtSSDYy?=
 =?utf-8?B?NXU0TkVxTFRTZHQwY2svMURabUlWNk1UU3JGbkNadllnZElWVit2SC9mS1ZK?=
 =?utf-8?B?ekRvbnhqZmM2U2l3MlloWkRxeGlJTCtiUTVLZVIzVHBYRFZLSFlUSkR0Mlp5?=
 =?utf-8?B?S3pMeDJnS0YvdW9hNVFrMmpGaU5aRG5lUHBrWVZWR3FwUXQ5Qklyd3VvMTZq?=
 =?utf-8?B?QkpCdDBVbEMxVzczYzhoUjlCUEhVVGk3dVpORWJLaEJQTUhwRjF5UTNEVDRp?=
 =?utf-8?B?THJzODdZbmVNOUc2OUhBc0tGUi85SDc5aGJGZmFLV1U2R3BFOTAzSFlEckI4?=
 =?utf-8?B?U0J2ellySFlpUDdxaThwMSs3eUhPNGdVaG9INlRsd0d0WmdwK3lCTTdvM1hW?=
 =?utf-8?B?ZGlNY3NTNVRxNEJoUy9UbldzRFdtOW13bEt4Qk1Md09RSm1mV2dxSkpZc0ZH?=
 =?utf-8?B?YkZlT1FDYUFpUkl1MndoTktGVXN6SkRiT3BpRVdMMUs2SlhUd0pSUytFU1pn?=
 =?utf-8?B?TWdQaDZFUkhKMVRTOFFnOWRTRitqWlg0akFVZ3hmT05sRmZZQm5IUXlGQ3d6?=
 =?utf-8?B?WDBpSkJsSEJCM1NYOE9sSHd3cCtBZkI3amlPVnZMTkgrTzY5MzZkWm5jNWgr?=
 =?utf-8?B?RzJDYnBVaDdPYlVJbGZFR0FXbDRZZW9lS1dwWkhYcVBLZXNLcjFJeUVCK0F4?=
 =?utf-8?Q?6MWcIq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?REc4ZGsvazlrSmtLVXRQZEZRbVJRMmlwOXhGMWZNcFlxcEVTcHhtYktheHRt?=
 =?utf-8?B?V3FyR2pwQWN4OEE5RXpjcUw1ME1qZjJiOVcyRXhLenNLVlFlZmRMUUUzRCsv?=
 =?utf-8?B?TzhMSkI1UHIyZWNrTXgzZldaU0lCdDc5NXhXRVRQQnEyV053QW54b2haZnl0?=
 =?utf-8?B?QkRDV1Fxcyt6N1VWY1g0Q3FrZ1c5UnI1RTZDaTVINXBrTk90UytFODk2YU1j?=
 =?utf-8?B?dVNaK3lDN0YvNktOb2czWUJReUozTTJ0UU1pM3p6b3JRZ2U4ZnRDK0J2cGdZ?=
 =?utf-8?B?cmFTajBhUzlhLzMvRFBDcWlhdTZEaHpla0MyWG94eWczdjBORnMvenVjOTNH?=
 =?utf-8?B?R3dCQ0tDdXhIUEpza1dHTzBNQW9jaUdodTZ6bDgyU1ZEVzd1cVZsclZaOTBv?=
 =?utf-8?B?SkVSbC9ueFUzT0FzL2pIdFZqYnpKdmVGalpwbnpzZ0dHM3hiMS94aU5iN1Vj?=
 =?utf-8?B?Sm9kQm5DU0Jvb2NrM29MWjBQYUZXR3VGYXRrV3ZZS28xWVBJSG5FY3hBNm9l?=
 =?utf-8?B?eU9QVlhnZjdOTHNVZW9ySWJiRXVoTHlQd0FKdlMzK2dXRWcxM0pnZWpsZkZE?=
 =?utf-8?B?djlJU3haZy9FRWJFc1lJNXZJdER3dVRvNVRpOG4xVEVZTm9DS2I2MHBsVlRw?=
 =?utf-8?B?V09KZkxhVTA0Zitsc0M2OG1DcVUxdFFGRHlxclhyeUEwQ0JWeGx4enpndnRC?=
 =?utf-8?B?bHhTUlNHSWVSN2pQdjF5ZW1kcmJHcVUrellJV01GUVlaMkVVYmQrN3dwN2k3?=
 =?utf-8?B?aDNlYm5waGRPckdncDdLZ1NrWmtoMEwxM2tNR09OQlZpY20xNHhRSk43RkI5?=
 =?utf-8?B?b2MrMWp3R0FzSXM4M1VYV09UMDNyM2RHdFZObUlKRE42SVl0TE51SVVyTkR5?=
 =?utf-8?B?V2VwUnhwUGxzdG1YWDZ6Q1pDWkVwbUVaT3o1bFh3NGg2d2lEWFNsbHpWZGVw?=
 =?utf-8?B?TEszb2RFeVZkK2RjRWErNTFWVzJmN3ppR21sNS9pV0R1bmRhY1VaWkRuenFF?=
 =?utf-8?B?YzlydlVpUy9CT0lGOG5VQ3pIdGhBeTdiVitmVkw3UThQeDV4ZDd1UFRsanVL?=
 =?utf-8?B?Sm5iYzZLSW1jbFg1QzJVQWtDaUxSVUFFazExRlZEQS9uQnhDbTh3YXRuRitH?=
 =?utf-8?B?Tm1JeEt0c2xRSXNBcFdsQ3RjckhKcWxmTS9JaXJ0VW9xaUZmR2k1RTkreVcy?=
 =?utf-8?B?c2dRU3ZqV1gyRXhZbGYvVFFoM09UbGxDOENGS0xsOW5BNG4vUzNjSkNzR0lI?=
 =?utf-8?B?SkVvRmtxeVlCR09ETWk0SkJVMkthMHFyYWlWZGhGaFFDTUJxQlBML3htYW9E?=
 =?utf-8?B?Yld4L24ycGx3ODZTVjZDVWh3eUlBZitpbU5qSUpnTmI4WmYrODJWRjRmYkMr?=
 =?utf-8?B?NHFGWXE5VmxvcWVVNk5BOVF3b05Ud2pEaHovMFpNS1JhdkpSMEJYbjBlQXN4?=
 =?utf-8?B?K25helZGMmVaZzloNFhmT2N2bE4vK0lVc2hNc1BrSXBaR0hYK2h0L3l1dEE1?=
 =?utf-8?B?cVpta0U5VkN1NDF3RWtXNlN6ank3UDlodExMcXQxTGM5MHJ1Ylh3azFHQ0or?=
 =?utf-8?B?VEtBdE5YajFJWDB4NTlQQ05VT3FkWFR2d1libjYyK2twYU5ZMUJaMjk1ZVFq?=
 =?utf-8?B?Skk3OExIbncramFQVXNQWWxjZFpXRnZwNUpOWkQ3VGpCMXVpR0l4ODlSeUVv?=
 =?utf-8?B?TlVvLy8vMCtUOEcyRFpzWVBpd3VYbGdDYUIwZ3RIcmtra1FYSzdISGtWeHN3?=
 =?utf-8?B?NGVOWU5WVTJmeDI3a3JTU1YvUWFVeVJkQWxnL3ZCaS9XTHlzRjhrQ1JadWdF?=
 =?utf-8?B?VEszTDlKZE8rWUR0U3duN1RDYkZweGhGaUptUldYMnJvYVlTeDN0cG52eWE2?=
 =?utf-8?B?amlabjdERVk5dHd3Y2lWZmhPT3JPdm9nOGJva1NZZHpxcitodFNpMHNBZDBk?=
 =?utf-8?B?SU1TMXh6ZjFyeTJ4ek41OHowV2tWYUt6WDlVUG40Y0I4V0d0SzQ4QjlLbTAx?=
 =?utf-8?B?RlFDeUtnazU4Mi9YbWd6QmtLSDJrcXpTcGgxbHFtSEVwcitJdnJsSjhkTmFr?=
 =?utf-8?B?cGo3dGxSeWx2VmlRQWNwQmJMcmNwdklCWmZTYlF6ZkllS2UvRWYzcDB2TWI3?=
 =?utf-8?B?ZHlvaVFpYmcwSURNWUVpMkl2Z1dwZmovaW02UTc2aytVMktGNnFJUE9YVzJ6?=
 =?utf-8?B?N2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 570b1daf-088b-4fe5-d1fe-08de0f3a4ab0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2025 18:06:56.8563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UjAyKBoiBti5qd82tz5pAbgqapYj/N7DBgLpOYBD4dnIMtidATe3eeZfd5peEYZtSxr6PIG7mf+yEWTTewPd1efk9aYj/S9bv+NrDmImmog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8021

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAxMCBPY3RvYmVyIDIwMjUgMDM6NDkNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2Ml0gbWVtb3J5OiByZW5lc2FzLXJwYy1pZjogQWRkIHN1c3BlbmQvcmVz
dW1lIHN1cHBvcnQNCj4gDQo+IE9uIDIzLzA5LzIwMjUgMTc6MTQsIEJpanUgd3JvdGU6DQo+ID4g
IAlpZiAocnBjLT5pbmZvLT50eXBlID09IFhTUElfUlpfRzNFKSB7DQo+ID4gLQkJc3RydWN0IGNs
ayAqc3BpX2NsazsNCj4gPiAtDQo+ID4gLQkJc3BpX2NsayA9IGRldm1fY2xrX2dldF9lbmFibGVk
KGRldiwgInNwaXgyIik7DQo+ID4gLQkJaWYgKElTX0VSUihzcGlfY2xrKSkNCj4gPiAtCQkJcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHNwaV9jbGspLA0KPiA+ICsJCXJwYy0+c3Bp
eDJfY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoZGV2LCAic3BpeDIiKTsNCj4gPiArCQlpZiAo
SVNfRVJSKHJwYy0+c3BpeDJfY2xrKSkNCj4gPiArCQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBQVFJfRVJSKHJwYy0+c3BpeDJfY2xrKSwNCj4gPiAgCQkJCQkgICAgICJjYW5ub3QgZ2V0IGVu
YWJsZWQgc3BpeDIgY2xrXG4iKTsNCj4gPg0KPiA+IC0JCXNwaV9jbGsgPSBkZXZtX2Nsa19nZXRf
ZW5hYmxlZChkZXYsICJzcGkiKTsNCj4gPiAtCQlpZiAoSVNfRVJSKHNwaV9jbGspKQ0KPiA+IC0J
CQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoc3BpX2NsayksDQo+ID4gKwkJcnBj
LT5zcGlfY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoZGV2LCAic3BpIik7DQo+ID4gKwkJaWYg
KElTX0VSUihycGMtPnNwaV9jbGspKQ0KPiA+ICsJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYs
IFBUUl9FUlIocnBjLT5zcGlfY2xrKSwNCj4gPiAgCQkJCQkgICAgICJjYW5ub3QgZ2V0IGVuYWJs
ZWQgc3BpIGNsa1xuIik7DQo+ID4gIAl9DQo+ID4NCj4gPiBAQCAtMTA2Myw2ICsxMDYzLDQ0IEBA
IHN0YXRpYyB2b2lkIHJwY2lmX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiA+ICAJcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIocnBjLT52ZGV2KTsNCj4gPiAgfQ0KPiA+
DQo+ID4gK3N0YXRpYyBpbnQgcnBjaWZfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpIHsNCj4g
PiArCXN0cnVjdCBycGNpZl9wcml2ICpycGMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiAr
DQo+ID4gKwlpZiAocnBjLT5pbmZvLT50eXBlID09IFhTUElfUlpfRzNFKSB7DQo+IA0KPiBjbGsg
YXJlIG51bGwgaW4gb3RoZXIgY2FzZSwgc28geW91IGNhbiBzaW1wbGlmeSBpdCBieSBkcm9wcGlu
ZyB0aGlzIGlmKCkuDQoNCk9LLCB3aWxsIG1ha2UgdGhlIGNsayBvcHRpb25hbCBhbmQgZHJvcCB0
aGUgaWYoKS4NCg0KPiANCj4gPiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUocnBjLT5zcGlfY2xr
KTsNCj4gPiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUocnBjLT5zcGl4Ml9jbGspOw0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50
IHJwY2lmX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpIHsNCj4gPiArCXN0cnVjdCBycGNpZl9w
cml2ICpycGMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArDQo+ID4gKwlpZiAocnBjLT5p
bmZvLT50eXBlID09IFhTUElfUlpfRzNFKSB7DQo+IA0KPiANCj4gLi4uIHdoaWNoIHdvdWxkIHNh
dmUgeW91IG9uZSBpbmRlbnRhdGlvbiBoZXJlIG1ha2luZyBpdCBhIGJpdCBtb3JlIHJlYWRhYmxl
Lg0KDQpBZ3JlZWQuDQoNCkNoZWVycywNCkJpanUNCg==

