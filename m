Return-Path: <linux-renesas-soc+bounces-9625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 486779965B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 11:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 094B2283275
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 09:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F3218A92D;
	Wed,  9 Oct 2024 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uT3OYRAL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF04B18A93A;
	Wed,  9 Oct 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728466918; cv=fail; b=PKkECVLpv6PXB7SJ/OobCvFBjpci1oZz5Lq9kgSbgBBf4E3CGKdcHDAEeTib6/8ctk2KO9DhADXc2gpxaKtBRJKhHvdtBXSqrjf4usoIAiEn6Ymu4HQyBwa2TZ9KfiRTICf567WtxVkdWYP5CagR5EPs3hrqOS5olGYuuWQ0dK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728466918; c=relaxed/simple;
	bh=3IbKiZV2PNZ2UKSKeTH7SHNKJSGSVsvMo2bbcFAzg0s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lnKK0b3znZj6wLtdLkzmYER3OVtlRu5D0QuN7ilPbGbD9q8XnACChjBopo5A7puAGzajAErtA0scNPjFOMliehaKYYw6BLrQL0IGXESebEg5KfiLYRuE5NWNjEXfBeyvGxN+q2yEV0u5PZ7FRRaKntN2fPKCIUdEKDiY8B6aPJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uT3OYRAL; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWwwi93wm5u/xnmU5EuP4XdEku4dYfcYbwK0uToKbxQwaNWvmi3huLHvqC/Do377qYMGHpBLHltpN6pbx3Kyd+XXAVSUlaklcn1X+/lL7g6+crD3boZMVKNEGUaqJWurIkEMGlki7lYTPC1scXX7TFCge/zjPE4k1H+Tip2FmfhgaQPkcfhHHIcpMyRe9BJ2GOOXA3c6/1F9BPPbfXTlB8zhckCMXcYJkMZ2CWVl2ennJuTkPK5bAsyV+ilOwFoiZxNdaTwwN5Z02jq58HT0bictjN6bfth3Jo5NW6u2/P0Crf9ZPMYyw0msyE7nRtZ0bwNc2/nWrNPX2Smp/nbLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IbKiZV2PNZ2UKSKeTH7SHNKJSGSVsvMo2bbcFAzg0s=;
 b=lxXAt+NCwEfWhunDIJ8+x91vACaOiP5y2aCzmZwchkGJbgW2tBQk8fO8+fTDQ3B7by8byTxu4KoJ2vhzlI8Ym0IpgmtiDu24sC3lFvymTdZsKNWMtMc82DHlIaN5CxVluP9d7RTAI4UGKjM3Gd/kzaVD+PLmpa4xI0w6INEF3jPLranochHqVywr3yrM94akaqDvmwNCwBXdxo7Amb5jLdq6VbF+fcmPHSgE1p3ojVUiJIbAMwJ7DEFMHddp81JBDJ8X6SlmRQewdc4rBT+IiixJQVVZTYJdqZrefH1VhT414yK+oa/VaeNuKOUVkJvhjv5fuIzYXBe9foVYXA4jSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IbKiZV2PNZ2UKSKeTH7SHNKJSGSVsvMo2bbcFAzg0s=;
 b=uT3OYRALy0XF39Es15o3BtPHDKwTEFlBvwggAspGTWtKZBzRrb07ZNWg2C7tR9cBkIga898/Vc/jks16Uk1utsqWcIoZGmR08eGoHh/RCCCmnABSXHhBlU7smndAQfcSgv6QZiCq3bFJJqG5d7qFaLvo/LUg1myehfrkkT4LT+k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8799.jpnprd01.prod.outlook.com (2603:1096:604:15b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 09:41:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 09:41:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Topic: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Index: AQHbGaIZmx0KhA/2XUiyPZAzZz+L/7J9FRWwgAAGadCAAC1egIAA3vUAgAACHjA=
Date: Wed, 9 Oct 2024 09:41:44 +0000
Message-ID:
 <TY3PR01MB113460ED98BB6EE2575D0CBC7867F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A1726BCE1687C6AFF519867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113469ABB6393E0A6451034A4867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vWpUmq9esgcnjWVcPb-jUaLuKvhJF2VwiWrCx5_nOtww@mail.gmail.com>
 <CAMuHMdULuCWd1V0Az=NWHhSb7voDKbTo9rp3Excntp7qvTbbuQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdULuCWd1V0Az=NWHhSb7voDKbTo9rp3Excntp7qvTbbuQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8799:EE_
x-ms-office365-filtering-correlation-id: 99850d03-87f9-4126-6c3a-08dce8469625
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Snc1aHptbHdWaG9uakU4NTRjOTFMQmp4VjZqVXp4dGNFNWpHclR3bkJuY1px?=
 =?utf-8?B?dXNocUo2alpJSytDTU1Tck52LzhGOHYyMkpobXBrU3BYbFFvbmtMb1VORFNO?=
 =?utf-8?B?bC90VkdLOHloN2ZCMnNlNHBJWjRLSDR0dW93KzNqcFJCSXVPMHlzUGUxUW1F?=
 =?utf-8?B?U3ZQcjAzK0RZYmszQTlqY0dnendtQ3ZnWWRkSFIxa0hYcWZTSzNyZEkzd1BG?=
 =?utf-8?B?QkVuY0pZR3c4LzM0OFlieGxNQy85dXFRQTBBK0NZWEN2RS9yL2o1bEZJSmJH?=
 =?utf-8?B?dEVMSGlLUGRZKzR6NXpSK2diM1VmRTQrbm9SbHY4VG9CNlhmb1FwUlBpai9t?=
 =?utf-8?B?QlBZS0VlZEV6UFhNL2xkKzlpcVZWTFN4REY4ME1uRE5wWkkxa0FpNExZQlFp?=
 =?utf-8?B?NUg5cVBrNEh5eE13QU5ub3ZHZ2Roc2V1WXBUNExkc1JYcXhubW8rOHR4UE4y?=
 =?utf-8?B?TG1xUTlYWFF5ZWRsclFKbDlEejUrakJMMFFqUVFjRTREaktiUEtlNi9hQjJw?=
 =?utf-8?B?RndCVGpkUXJpTUkwNjdoaVpaWmJ3aTh1bnk0bHU0UEpzMmxjWlgyYjdDcnEr?=
 =?utf-8?B?a255M0F5UGdRaVZKVzBPb0VTdmkwd2JGeEN3am1qRHp4WGllUGFUanRiK0dG?=
 =?utf-8?B?T243VzVGdVE5bjZydzYwdzFyTHoveCtxYkxDOUxpS2swdmprV2RrRW1uSGRV?=
 =?utf-8?B?U3p2bHRsWmpVbWl4K0pPVmJONDl4eWVad2V4a1A4SlhDcWRFZ01aYmtBazM3?=
 =?utf-8?B?V0w4eGZOS2MrazNvcTNqenBWV1FhNVlPZGMwSGVIS25QRVRpOXJMMzVyaVFi?=
 =?utf-8?B?dzR2cDh0RWtudWt2YnVPVjJYb1NWMDh3MzhkNStxMFh5OG4ralVla2FzdGFR?=
 =?utf-8?B?L3JNMDcxNFpwNnoybTZkcXBXV21JYko4aDFwYUE1WXhjUTZYL3lCZjlFZFpC?=
 =?utf-8?B?cGFMUUtBalF4dmFjQlR6WDd0YklVL2w2S1hkU090bnhOelpYMDNCNEE1TGhX?=
 =?utf-8?B?NlRiRUYxazZ4cUdyY0tkSk92VEl3b2xYQWVwQXY0SWNXMEZ6d240WUgzcFlO?=
 =?utf-8?B?ODE3TmY4UDE4Y2ErSXZ4ZzlRMWtjTldSUC80OE9ESlRubFVvaCsyay9HTWFs?=
 =?utf-8?B?OStIc0J4dUMyeGtrUkpTM2pmMlJGU2RRWVBMa0lyQ2QrSnJwc3V6ZWJLcWYw?=
 =?utf-8?B?cXRoZkpONzg5U2llKzBncUMyWEl3L2NZTUVIaUw2VjBXQ0htd2VucGt2eGFk?=
 =?utf-8?B?Q3ZZSW1YUWRCMVA0SFV4WHNIMUZKR1d5eCtwMUZqYzM4Q3pTVk45TkRGOWVu?=
 =?utf-8?B?UWJFSktUbTRkYkx5cW8vT2RQc2JBQlV2RkpzMXpyMnVpMVBRK3ZOd1hCVUJR?=
 =?utf-8?B?dXg0STVia3RoV1ZHNjFKbWxoZ2RFY2JBRFdmQXlDUlk4SVB0bmNabVNjenRi?=
 =?utf-8?B?UFh0aktnY0ZKK3p1aDVEWXcwdVRBWHFNbXRNUFJXLzdhNDg2dTJrL255YnZt?=
 =?utf-8?B?MFdBYk9mdEpqWmM3SVVmMTJ6WExEaHlpc1BrVkpKWjlJS3NFRzkxT1BjTVVU?=
 =?utf-8?B?M2doN0t5TmhVMUt5VENJdmpkYXBZMkc5YkhLNDZHeU5UdjdFa3lMY3g1NHo3?=
 =?utf-8?B?NVl5NGRkSE5BejF4NUhRL0JrcUhnSnlWWHBJMUFzdFQ3b25jbm1OYklUa3F5?=
 =?utf-8?B?anNNN3dSUkh0SVlaSkpsbzRCakpnczZOdkNjYkdnR3Z0RUJaRmJFaGNWbFhP?=
 =?utf-8?B?THlaWExnSmEvUFJ5eDB5clRhcVBZbS8zdEFReEU4ZHdFdXdNdFVCTENoaHQz?=
 =?utf-8?B?UTZHejlEME5ibWxYY3psQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Snh4dWxQc3ZQMnhmOGE3V2gvbVJiUkxVdjVjbWNhRFk0VGYySmE0MVVhWlhJ?=
 =?utf-8?B?VTZhQlNCZXBnUmNBWHJGT1NhbWRHV1VndE9kMkhGbkNQNm9POU9hUEZKYUM0?=
 =?utf-8?B?RnZKZVh3UUc2b2c5akIyckhtcGRQb0w3dkZGY0NDQTdWOWlFclVrd01HbzdJ?=
 =?utf-8?B?eFE3ejRpK04vQjMxTFFsbjZBeSsxZ0hQdFZxcGltRHcxN1gyV3BBR01XQU9J?=
 =?utf-8?B?bU9iblB5dUxSQytqM0RiM1NvZ2tDcGdXZmR0dlNPaitKaUk5dXRDcmJhSW83?=
 =?utf-8?B?cytiNytqa2ZTemJNekh2SGVjUVhxR0lwaVhpVFhCa2RrL2MzZ0lIS1RoNVJm?=
 =?utf-8?B?YVB3T0x6SlpEUkF5UXBtL0FuZkczczNTaVJwT1FONERTdXZ2YUlPV1FmVXF1?=
 =?utf-8?B?ZEJRdHROc2MrM2tmcVhUSnB2WnZVendDd1VWSW9lQ2RKNnZWL2pSS01CdTRK?=
 =?utf-8?B?TXJ3YmV2dVJBYTUzNTZiV1g3QlBGbEIyVS9hWk9ZUThTVDNrY3dmYTlHQ3M1?=
 =?utf-8?B?WThUQjFZdjkwdEhyelRzU1YxUlRhbHluWGR2eVRvSXhYbDN0S3FkbW1sRWZk?=
 =?utf-8?B?VElwTmxsVEdzd3Ntdld3Q1c3eGFMalBQdTJIME1oZ0Q4MElsb21rdVpxWTNt?=
 =?utf-8?B?UHdWUTVPK1BBQkRFTEFMYTNyemtCYWk4a3ZFaEJMZ0d5UW5HV0ttT2U1U21S?=
 =?utf-8?B?QU1Hc1ptSWFiNDlkdVNOT3h4VWNvbE4rLzhZYXVKYklRakc1U0tFNE5MRmtu?=
 =?utf-8?B?NzZ5cEsvVm1EbTNybEYxbktkNXFxU2FUS05oSVd5R1BJOThhVW5TbVNGOFU4?=
 =?utf-8?B?NDI2Sm5hcEJPblBZVE1pRW1abnlaeTFjZ1BUcDFYTjZCd1hMMXJVczJDc3Yy?=
 =?utf-8?B?UkJFNmNScDAyaVNBeDcrUEUwbWFvRmtyWUxrTnBobmdzQTlia0tWdm5OZjR0?=
 =?utf-8?B?SitRSTRUUmJnSUM5Z2pZTXlveXFuUldsaWkrUEh2THdBNmtpUjd2dFF5MGQv?=
 =?utf-8?B?Q09QWjFzN0RneERvYk9TMXd2UGs0cWY1T25nOWcwa0U4ZkwxTGNGTSs4cjM4?=
 =?utf-8?B?Y2J5cWlVNWxSSWJ0RXBkazdYTGV1bEVWdFMzaks5Z2VDMFl1cHZNOUw0bkxu?=
 =?utf-8?B?bzNLMEIrb2NkZDJlMzdQMWlJUE0yYkxkTnpLdzNybHI5TXo4bFgwTHVwY0Zj?=
 =?utf-8?B?N1QvaG9FT3VzR2doTHpGVVZyNExCR2dhdjYxK0FueVJmdE9uaC91b0NZT3NW?=
 =?utf-8?B?bG1obUFQek1xeUdSWUdRNDVQN1pHd2w0RVdBNDVaQ3JLSzdvNVJnWndWRkFQ?=
 =?utf-8?B?OThtZy9WNjZPWHFUYnozSmcrWkZGRnVsV2VlWWxwNzYxYm1qS1l1YWxDeUt1?=
 =?utf-8?B?Zm1ad0l6T1ZJM2J1a2pZb1NqVWFQTnBOYWRGbU1FZCtnY2t3RE95a01icnFI?=
 =?utf-8?B?NWU0U0dFdlF3YXhlZTJzelY1R3hMRXAxWGRDdVpNa01Kc2x3VmNmZm8vT2hj?=
 =?utf-8?B?M1NXcWVsMW1Bc2o1V2N5bnR0cC9MQmlUTTZHZHdOUzlVMjF3OWZra3cvZVIr?=
 =?utf-8?B?QjdSb2IvZyt1Ykx0WHpkQVJWMVZTTVRRRkMveDl1NkVQd3NmeDR5RVVCVXkw?=
 =?utf-8?B?Wlp4VkpUSjl0NzJnV1RkRklMSDUvN1BkcnRCK3RQb09MMnpXU09vOENiQy9K?=
 =?utf-8?B?aDVEbkxBM2FQOVJHZUVieTUvd3FneTRsUHJldTk0dnA0U1RORzJLaEVLVVhV?=
 =?utf-8?B?a25vMGhiWU14dkFVMVgyd0dGV2wvZWJJOTdwYmJqSThTOTI2RFRqZEl0WFNi?=
 =?utf-8?B?QmFXZTRNKy90cjJvbVkrYmVqT25JMUpTb25URGZjZWVoSG1kMmZIQ2lPQzRF?=
 =?utf-8?B?clc0VStSL2FOZmhoUWNUMDlZYThLZ0pBZm5tbEhHVkJ4dzFHRm4yUFg4Um5R?=
 =?utf-8?B?bmcyMFhTdk5FYk9jS1UyQmVZbEFZWDJBQnV6NkF0V1dKb0lUMDdOeXJsQUN5?=
 =?utf-8?B?UVNxWGZlRDNvaWZoSWxlamkybndiN3VuLzhhSGpWc21ZOFpINmRmZFBFS3hq?=
 =?utf-8?B?dkJOT0hLTXAzTURmakViMG5tcXBMTkVMTlhnZVJSNkYrQlVML2RqdWVNOUdN?=
 =?utf-8?B?NXdHYzkwRi90d1lBNGkzaXV6NkJyY3h6QXZFYXZhUTdjVThmT1h2SGgyOUFP?=
 =?utf-8?B?Zmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 99850d03-87f9-4126-6c3a-08dce8469625
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 09:41:44.3797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lKnnbBqal8fQ4AuRaK0h7r6nAXcu/5GlLeD2F6torPcQeNFhfRYWr3R/ypeAU5dEJUFYP0Nrk4Q+L+VtsoyOoJIGPd72LUCHgJ1BwF3A3ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8799

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBP
Y3RvYmVyIDksIDIwMjQgMTA6MjggQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gYXJtNjQ6
IGR0czogcmVuZXNhczogcjlhMDlnMDU3OiBBZGQgT1BQIHRhYmxlDQo+IA0KPiBIaSBQcmFiaGFr
YXIsDQo+IA0KPiBPbiBUdWUsIE9jdCA4LCAyMDI0IGF0IDEwOjEw4oCvUE0gTGFkLCBQcmFiaGFr
YXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToNCj4gPiBPbiBUdWUsIE9jdCA4
LCAyMDI0IGF0IDY6MzPigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gPiA+ID4gRnJvbTogUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNv
bT4NCj4gPiA+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQu
cmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBZGQgT1BQIHRhYmxlIGZv
ciBSWi9WMkgoUCkgU29DLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFk
IFByYWJoYWthcg0KPiA+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNh
cy5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gdjEtPnYyDQo+ID4gPiA+ID4gLSBTZXQg
b3BwLW1pY3Jvdm9sdCB0byA4MDAwMDAgZm9yIGZyZXF1ZW5jaWVzIGJlbG93IDEuMUdIeg0KPiA+
ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDln
MDU3LmR0c2kgfCA0MQ0KPiA+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykNCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3LmR0c2kN
Cj4gPiA+ID4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNTcuZHRzaQ0K
PiA+ID4gPiA+IGluZGV4IDFhZDVhMWI2OTE3Zi4uNGJiZTc1YjgxZjU0IDEwMDY0NA0KPiA+ID4g
PiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNTcuZHRzaQ0KPiA+
ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNTcuZHRzaQ0K
PiA+ID4gPiA+IEBAIC0yMCw2ICsyMCwzOSBAQCBhdWRpb19leHRhbF9jbGs6IGF1ZGlvLWNsayB7
DQo+ID4gPiA+ID4gICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDA+Ow0KPiA+ID4gPiA+
ICAgICB9Ow0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gKyAgIC8qDQo+ID4gPiA+ID4gKyAgICAqIFRo
ZSBkZWZhdWx0IGNsdXN0ZXIgdGFibGUgaXMgYmFzZWQgb24gdGhlIGFzc3VtcHRpb24gdGhhdCB0
aGUgUExMQ0E1NSBjbG9jaw0KPiA+ID4gPiA+ICsgICAgKiBmcmVxdWVuY3kgaXMgc2V0IHRvIDEu
N0dIei4gVGhlIFBMTENBNTUgY2xvY2sgZnJlcXVlbmN5IGNhbiBiZSBzZXQgdG8NCj4gPiA+ID4g
PiArICAgICogMS43LzEuNi8xLjUvMS4xIEdIeiBiYXNlZCBvbiB0aGUgQk9PVFBMTENBXzAvMSBw
aW5zIChhbmQgYWRkaXRpb25hbGx5IGNhbiBiZQ0KPiA+ID4gPiA+ICsgICAgKiBjbG9ja2VkIHRv
IDEuOEdIeiBhcyB3ZWxsKS4gVGhlIHRhYmxlIGJlbG93IHNob3VsZCBiZSBvdmVycmlkZGVuIGlu
IHRoZSBib2FyZA0KPiA+ID4gPiA+ICsgICAgKiBEVFMgYmFzZWQgb24gdGhlIFBMTENBNTUgY2xv
Y2sgZnJlcXVlbmN5Lg0KPiA+ID4gPiA+ICsgICAgKi8NCj4gPiA+ID4gPiArICAgY2x1c3RlcjBf
b3BwOiBvcHAtdGFibGUtMCB7DQo+ID4gPiA+ID4gKyAgICAgICAgICAgY29tcGF0aWJsZSA9ICJv
cGVyYXRpbmctcG9pbnRzLXYyIjsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgICAgICAgICAg
b3BwLTE3MDAwMDAwMDAgew0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgb3BwLWh6ID0g
L2JpdHMvIDY0IDwxNzAwMDAwMDAwPjsNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgIG9w
cC1taWNyb3ZvbHQgPSA8OTAwMDAwPjsNCj4gPiA+ID4NCj4gPiA+ID4gTm90IHN1cmUgQ0EtNTUg
Y2FuIGNoYW5nZSB2b2x0YWdlIGZyb20gODAwbVYgdG8gOTAwbVY/Pw0KPiA+ID4gPiBCYXNlZCBv
biBQb3dlciBEb21haW4gQ29udHJvbCwgaXQgbmVlZHMgdG8gYmUgaW4gQVdPIG1vZGUgZm9yIGNo
YW5naW5nIHRoZSBQRF9DQTU1IHZvbHRhZ2UuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBtYW51YWwg
c2F5cyBPRCB2b2x0YWdlIGlzIDAuOVYgYW5kIE5EIHZvbHRhZ2UgaXMgMC44Vi4NCj4gPiA+ID4N
Cj4gPiA+ID4gSXMgMS43R0haIGlzIE5EIG9yIE9EPw0KPiA+ID4NCj4gPiA+IHsxLjcsMS42LDEu
NSBHSHp9IGlzIGVuYWJsZWQgd2hlbiBWREQwOV9DQTU1IGlzIGF0IDAuOSBWIGFuZCBmb3IgMS4x
DQo+ID4gPiBHSHogaXQgaXMgMC44Vi4NCj4gPiA+DQo+ID4gPiBNYXliZSB3aGVuIHlvdSBkbyAv
MiwgLzQsIC84IHVzaW5nIGRpdmlkZXJzLCB0aGUgdm9sdGFnZSBtYXkgYmUNCj4gPiA+IHN0aWxs
IHRoZSBzYW1lPz8NCj4gPiA+DQo+ID4gSSB0aGluayB5b3UgYXJlIHJpZ2h0IHdoZW4gQk9PVFBM
TENBWzE6MF0gcGlucyBhcmUgc2V0IHRvIDEuN0dIeiB0aGUNCj4gPiBWREQwOV9DQTU1IGlzIGF0
IDAuOSBWLCBmdXJ0aGVyIGRpdmlkaW5nIHRoZSBjbG9jayBzaG91bGRudCBhZmZlY3QgdGhlDQo+
ID4gdm9sdGFnZSBsZXZlbHMgYXQgdGhlIFBNSUMgb3V0cHV0Lg0KPiA+DQo+ID4gR2VlcnQsIHBs
ZWFzZSBsZXQgbWUga25vdyBpZiBteSB1bmRlcnN0YW5kaW5nIGlzIGluY29ycmVjdC4NCj4gDQo+
IFRoZSBhY3R1YWwgVkREMDlfQ0E1NSB2b2x0YWdlIGlzIGNvbnRyb2xsZWQgYnkgdGhlIGV4dGVy
bmFsIFBNSUMgKFJBQTIxNTMwMCkuICBJdCBpcyB0aGUNCj4gcmVzcG9uc2liaWxpdHkgb2YgdGhl
IHN5c3RlbSBkZXNpZ25lciB0byBtYWtlIHN1cmUgVkREMDlfQ0E1NSBpcyBhdCAwLjlWIHdoZW4g
Qk9PVFBMTENBWzE6MF0gaXMNCj4gc3RyYXBwZWQgZm9yIE9ELCBhcyBDUFUgY29yZSBjbG9jayBy
YXRlcyBoaWdoZXIgdGhhbiAxLjEgR0h6IG5lZWQgYSBoaWdoZXIgY29yZSB2b2x0YWdlLg0KPiBJ
IGRvbid0IHRoaW5rIGl0IGh1cnRzIHRvIHN1cHBseSB0aGUgaGlnaGVyIGNvcmUgdm9sdGFnZSB3
aGlsZSBydW5uaW5nIHRoZSBDUFUgY29yZSBhdCBsb3cgY29yZQ0KPiBmcmVxdWVuY2llcywgZXhj
ZXB0IGZvciBleHRyYSBwb3dlciBjb25zdW1wdGlvbi4NCj4gDQo+IFRvIGNvbnRyb2wgVkREMDlf
Q0E1NSBkeW5hbWljYWxseSwgdGhlIENQVSBjb3JlcyBzaG91bGQgaGF2ZSBjcHUtc3VwcGx5IHBy
b3BlcnRpZXMgcG9pbnRpbmcgdG8gdGhlDQo+IHJlZ3VsYXRvciBjb250cm9sbGluZyBpdCAocmFh
MjE1MzAwKS4NCg0KVGhpcyBuZWVkcyBhIGJpZyB3b3JrKHNlZTogNC41LjMuMS4zIFBEX0NBNTUg
YXJlYSB2b2x0YWdlIGNoYW5nZSkuDQpDQS01NSBuZWVkcyB0byBzaWduYWwgQ00tMzMgc28gdGhh
dCBpdCBzd2l0Y2hlcyB0byBBV08gbW9kZShPbmx5IENNLTMzIGlzIGFjdGl2ZSkgYW5kIA0KSW4g
QVdPIG1vZGUsIENNMzMgaXMgaW4gY2hhcmdlIG9mIGNoYW5naW5nIENBNTUgdm9sdGFnZSBhbmQg
dGhlbiBzd2l0Y2hlcyB0byBBTEwtT04gbW9kZQ0KDQpDaGVlcnMuDQpCaWp1DQo=

