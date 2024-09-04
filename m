Return-Path: <linux-renesas-soc+bounces-8681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8211596ADC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 03:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EA4F1F24DEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 01:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED779646;
	Wed,  4 Sep 2024 01:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nd159Dsa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A910663C;
	Wed,  4 Sep 2024 01:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725413006; cv=fail; b=DzUnkyXtJ7cHCWZdoKFajC9tqP2n70AUPl2jo/D1C63ihZB0OHXLT2fDx/VV6voigSVX92Dh3eYkz7LzMRLM8rF1+3e+YsYZJlHCrfc3pMA2yE0uzd3XhBuEeSSnyXyPYbYGzr5IICDA4EzX4LsbOtvXmtgEEwPSUEFmukBHR8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725413006; c=relaxed/simple;
	bh=TP6kqOj+caeQIRQ7KVvLSNrepPo3lhi064Cj7YHfPIU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eqfP7ziIOcVnhrjfCXHVCmG0IjyQ9kSgoPIYAOJ8XIhwDud9e1syDcdu7yCMj/AWM0YX6j+wjG7QWwltHqAs93yY5Lhqz39GTLkJoPVV0uxzdrWzfSGkYh53nJi2JyoQSaEl4jGJXkLsiQsh3vm/IkDjjM1J0HfzTqWuZb8wHh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nd159Dsa; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RW+5d6YAOLRGe2i7I6NG/Wm0BWYzDJv/z4klh4dsvFuOhw8oRGpUUm8T44B6orMuwzoeW/uIg7pXZh8/q0yBAbNPmvyRnaqmcXWb2kRUN/JPng80KvUhxwyBqJEJBAScodg1z30mWpmri4xrci5D0AvAu9siIPgwSRmh5w+iYHR68+MxoOuMHOlPj17SotcnFNJUZnR/Q6GYX4+wVZvvGzV5KwA2x79qA03IdaI5XWUb9FJdSHxgNXL++9X/mgOLSVkA1bsE9snrf0//+w9wgSC0i5ZcUExboyxYvx/1q4LQ//4D+n0wO/HfcaEoQ9QlBTpazo9l973FqgeevMFqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TP6kqOj+caeQIRQ7KVvLSNrepPo3lhi064Cj7YHfPIU=;
 b=RBnaxdPnleRm1MhLRzVt95prMRoyWdDEOZUVxrCTL5lobXkKc6oIp32+knO3CiWFE8aVuT/SF+Fq4yOKgEx211VAdvfJ7wL7o12HoAHxKCB5ocElAa0sYvOK8v9UAPARlyRdC8l94/omrGIcnL2fYXyte7HkIgPEj1/jNS+ET2Kksizchh6dbMD8iPlAQYPqPsqv4ygQisawQE9mrYyCC8hNMRamHpHvoDmlWKEy57qpyncrEkSCKPIGeAZazkRy9E0uThIsGL4eYLJziuIfaDFNo4fMTuaindXSMnOimRnbXg7bnO9ORiykNhjueEzmeDCfD1zw7lgBV5BhWumFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TP6kqOj+caeQIRQ7KVvLSNrepPo3lhi064Cj7YHfPIU=;
 b=nd159DsabfVK97ehLDGFZwQw32+b7SMFPO1sQNffjRFZbn46epzLUfqePTwe2GLqiihU8F+IQ1IAZoWJOe1vFpMh20+qADB4bLJn6fpHCi27y4pbTUHWPBuPoPOqSfSEMsQC1ppqtH/zJ194N9+uHod9UxEHqNhjWvW79vEalOo=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYCPR01MB9291.jpnprd01.prod.outlook.com (2603:1096:400:193::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 01:23:21 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 01:23:20 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
	<niklas.soderlund+renesas@ragnatech.se>, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [net-next] net: phy: Check for read errors in SIOCGMIIREG
Thread-Topic: [net-next] net: phy: Check for read errors in SIOCGMIIREG
Thread-Index: AQHa/iUQ6jARf6LttUypDFj3B2EY27JG1Ukg
Date: Wed, 4 Sep 2024 01:23:20 +0000
Message-ID:
 <TYCPR01MB11040278586F8843CA9A36B80D89C2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20240903171536.628930-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240903171536.628930-1-niklas.soderlund+renesas@ragnatech.se>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYCPR01MB9291:EE_
x-ms-office365-filtering-correlation-id: f29dcaaf-804c-48ff-013b-08dccc8029d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a1lENkxMeUhmTFkzeDZhUVYwOHQ5L0RuZnp3Q0dlak44bUhUWHdsY3NyL3Jk?=
 =?utf-8?B?anA4NmFHcXlyUTBqYWt2SXU3M3hCZHZsM0szbm1zMk53ZDNic2k2UEhhSm0y?=
 =?utf-8?B?c0htaXhteGkrNks2TmpyRStPYlVrWkZhOVJVZWsrMCsrL3VWQmF1L2ZoY3By?=
 =?utf-8?B?UmpKV2RBcmY3Zm5FeWhJR2ZLdDlQR2FPUU5VUlVUN3F3M2lHM2dxKysvc25M?=
 =?utf-8?B?MU81T2Nyb3ZJMFJNcFA4cUVGR1pSUUxSdjlSOGpXTlVtd25RbHRrQWFIQWtQ?=
 =?utf-8?B?UzY0QXpyWDBCcFFiMzlPQjlEdmZMVFQyYlNhL0ZOeFVDbGtnUzlCb0Z4eTU2?=
 =?utf-8?B?bFpJSkJKNHlUbS9SUU9zS2hZYXNHcFltUUd5LzNwL0RyVXdzSXZPaWQxdVRD?=
 =?utf-8?B?SWllamE3bVJDOEUxYk1vRzBIV3pRVUxiaWVvZFl5MjE0L1dOQWJ0M25uY29r?=
 =?utf-8?B?aHZWVTljMlBSbjlTWmhsUzdlTk5rek5abUlqRW1EaFQwT0Z6VUFWaFFmTG5D?=
 =?utf-8?B?bVJYdUluWlNJbjV2U1htWnhQeTNGb3F1LzhHcEIvbFpYbm15MklLU082OVo4?=
 =?utf-8?B?TkdGU0V2aWc4ZndpTDF4WVljcDN1eTlUU3RLclNyczltYVVHS2RpczA5bzRy?=
 =?utf-8?B?NnQxOHRPNmVTZnNJNkRIeDVSZEJ0NE5nelE0RVZqTm00MG9QU0syL2FqZktQ?=
 =?utf-8?B?VFBiTlMwWHRqZWFZdXQrbmlhdmUrNkVvSFFxd1dIT0VKZmxUeW5tOHQ1TTQr?=
 =?utf-8?B?dkdFLy9sZnIxY29PTG44SjU3bUtON0pic2Vqc0MxRjBjN3VaV1NISmdDTDlw?=
 =?utf-8?B?YkhmL1lHQTdYdm5EZTVkODg5LzR3SWJoTkQzenpXOHBEMEEvejZOM1FyWmQz?=
 =?utf-8?B?U1R3cjBCb1dwWnFpMHVDV1dwUzRjUmNSOEpYSUE0SEVpaE9EQUNWNXI1cjVn?=
 =?utf-8?B?Z2NQb250R014MjZKNDZuZnhEVHY3S3BHeEhkMXBxd3Y0enNnaklNTzh5aUJm?=
 =?utf-8?B?dTI4YmFLQUo3UGd4U2RFT2UyNUUwV2s2eEFDbDJhZ3BvaTlXZXhadzFBdC9S?=
 =?utf-8?B?ZU01Ykh4N1dYc0FiQ1VGOW8vZCtCTFIwQjhaNmUvM3NOZG1aMG9sa0FXcFEz?=
 =?utf-8?B?NGkxbjdMOU15WkxrVVVvaE02emRiVmRDeEZBaVlOM2NvWmJPV2JiOEVYSUk1?=
 =?utf-8?B?bEljOVRKQWVPN25lOGxtTTZwbXlVL2dDOFRKMWJ0Y1crSi9RdXJKTG4xK3lK?=
 =?utf-8?B?bCs1U29sOE10SVNxUTc0eVFweDFqQzFWTFBhOWhpUnhyamlWQ3EzU0lVZ1pL?=
 =?utf-8?B?ZFVlYWM1UFV6SGNYZW1BVjA2YW9rR3hWSDNNRnlyWnVZYVRXVTllUGdJWXl2?=
 =?utf-8?B?WFJJTnBuUlN6VnlPclBURzJaTzNqYXlMNVd5K09PVDNaSEFjTk15U0NUZFBG?=
 =?utf-8?B?dTVGQnRPVlpaNkVoRlRZT1E4bTUwRGFZT21wNFd4SitGdHVyTy84MUwrTG12?=
 =?utf-8?B?RzE5OFAvTDVWb2l2UEs5Y294MXRlL1J5SHY1dk1vR2ZaQ0FGbVZhcWt4R25Z?=
 =?utf-8?B?Sm11S1F1RDBJR3JKRFV4SE9wZVBOWlc3T09TTHAwb3czSXZLaTZBaXErcHdl?=
 =?utf-8?B?ZWxUZ3JYUm80NjQyU1pmLzJZelBSakRRSWk0andjN0U4b1c5ZjJ6VFdwVnpD?=
 =?utf-8?B?bWxaOGRKRzdyaHk0OER0dFpmU1BvcWZYbEd2TS8vRHBTYm83cHRNWmRzRzZG?=
 =?utf-8?B?YkJhbkxUWklOWE9pN3ArM25ZRk1kTVNjK0V4czZwcGZheDZoc09OWGpmVG40?=
 =?utf-8?B?RnN1KzY3NzV2bzVXdCtQcWZGWW0vOEV6K05HdnlSWjlweHVtNk95ZjN3YTl6?=
 =?utf-8?B?TzduLzFkNGN6TkVycTNXeFlIVXVNSlBrYkF1dEMwSWJFeEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzFUV004TkExQnJxT2JCdWtZM0pDMzhjcmNYRGZLYWRrMVp1QzhEY2NqMDZU?=
 =?utf-8?B?akFMWWRoMllVQzFQMkhqd01Cb0JtN2NqY1RyQ3pFRVB2UDNDT3ZsVEhiK0dp?=
 =?utf-8?B?WHlNZHVsVFpoRW1DK1dMMEJkWmFHT2dwUWRGaXJvTFlNY3VsV0cyVmdodlJa?=
 =?utf-8?B?NzdFZ0QxYklUTE9yaUdHVWdMMXlXZEJ6eHhIcUpMVnNxWWNpNzlYSUdFVllY?=
 =?utf-8?B?YW5HSE9NRTUzaGd6T1I1SkNjaHJSWHo5dWlkdVY3T2plZWhHTnNqZFo3dWRm?=
 =?utf-8?B?RS9aR0N4OFFkRUliUWJ2QWF3YUFaTnQ2d2ovZGlrS1g3QkZaRTMzWGhBSzkv?=
 =?utf-8?B?VWN1WWNQUkIzN0VmclFGak0vQkpwZjlja2gySnBzeFlWanRxbzFMQ01kUXBm?=
 =?utf-8?B?VkdtTnpYWWFSU1RXTHhPQzB4d1R6d3d2M3dxV0Z5Z1diSDl5b25BUHIxUUhT?=
 =?utf-8?B?SUhQRTVpalNJS1FSK2oraE1tVkFsek9UbGZCZnRubkl4TUYvdW5IdzdIazZr?=
 =?utf-8?B?ZnBadzlCMHd5QU9IaldUZjUyMm1UT2t6MXlKZTljWDdFT05aZjhpM1pTQVZq?=
 =?utf-8?B?cjBLVlkzTGNCeWxqVERWZGJuVzJ2NVpMU3FQWTRiYVNqMkJPTWowVUFicXZE?=
 =?utf-8?B?SEM5cVA5VVBwTW5Lc3gxRDM3KzlEOUljUlQxd25DL3pZanhpZXViVWJyaEdS?=
 =?utf-8?B?WnJTUngyL0swekhlQU9wK0xVQkdKSGRCUUJ1Y3JHdEJCSU5LcHhJakFOQUNz?=
 =?utf-8?B?V3dWK1VxZVF4Vll3OFNOYmJzSTVLbzRNTlp4czcxWlc2bitjRkp4NzhDajhW?=
 =?utf-8?B?SlkwZVFEc094UEdDNi9nUDB0aWxIZU4rY2ZrT3FySkZZYTErdWRsU3p0amYy?=
 =?utf-8?B?bGV5bk9lZ2VLTVVmWXhiMEQvWVBtdFAxaU8rMWNVMWMwZ1FWM2J1ejJtZG9G?=
 =?utf-8?B?VEF0dEVVSVVvRlJReWFhUmR4UEJYNWxWTm5GUkh1clhWV3VncTBpSlJGNVdu?=
 =?utf-8?B?ZEhzaEp4ZXJxQUFHOVVMYWtQY2txSkhFT013VkROb3N1RlBMSGdadnphdnor?=
 =?utf-8?B?NTlKdXJvYTQ1VC9CRkMwS3k1N3hmbzZJWnhwL3VPV2V5aFJEQTNoNEI3M2pL?=
 =?utf-8?B?SFBIeUJ3L3AySzBWMkY4MHFOQlNFK01zOC9PZmhGcUdCYzlmUkFhVHhVa1E0?=
 =?utf-8?B?UEtMdmdaVW1rc0VZcUhFVys3L0pqYnFaV1A2RER6c21hbi8rV3dhNFMxNlFF?=
 =?utf-8?B?R2hqNnl3MzhWZEZDSE1rdmFlSzBVZFQxcEpxMVdqZEpXZ211dkh2SGg3NWQv?=
 =?utf-8?B?Y3NwWlVNSmpnRjVoUmpxcXcvNGJtYmhuWkEvVEN3U1dLK1dhOFlKR0N3K1Q3?=
 =?utf-8?B?N1VGUktLQkVBbXBQOGlEK0tPQ0EwVEtiM0Z1STJIVjBJZ0h0Mm4yenNZV3Mx?=
 =?utf-8?B?RjFZSjBCTHFnMndZM0ZGY1RlRDNCcWV2dUk5b3k5cWxxZ2hMbHo5dU9MdUs3?=
 =?utf-8?B?RGg1NmprazZvQU8valhKZUY5cnE5dW5xVnRDdUhnY0J3RDM5eE9wRHlKRkZh?=
 =?utf-8?B?VlJUUG1xVEdpc042a0lCQ1BOUEVidm0wVGdzZFQvZXNKOGRkQVBBa0tML3Fm?=
 =?utf-8?B?MjZJYjV3Mmt0bGJCZmUyYXBMdlJVSUVkRWJYK1E3eHU3UzB0a055ZTlpRjVM?=
 =?utf-8?B?YTJCMzFJODgyWkJ0MStYc1FQTEg5ZUgrUklia3BzZ3NMS0pDYm5zbGhsQzRY?=
 =?utf-8?B?ams3WlhETC96VzVuWFVUbTk3Zk9DRWZnRTJaSXBMVjJQYW5vZTZNQ0hRbDhv?=
 =?utf-8?B?ekI0US9YRzQzY2V2aUJERWFBeTQ5R2FJOWIzOVJDVEJTRHQ1c2tka3V3MFYz?=
 =?utf-8?B?eFh3ZzRvcm1yaFhGbUp3Q2QzeHFDZFdoWXlvRGpjOW5TazkrZnhSN3RVT1Aw?=
 =?utf-8?B?RWRKV3ZhQ3pYWHZhQ3U0Nmg4TmJ1VWxNaUoydDBWU01sc2VQbi9nRmc2SFVR?=
 =?utf-8?B?OVpxclpoamlOUndnNEl2MTRmd2NJTExFMkxaT3lLWnpvaUwySjRnekR3cjBw?=
 =?utf-8?B?S0c0VmRJaUpJWVdRR0w4UXRjOFJWSGlhRm1qN2FBWTQ1cWlyZHdxL3NFWWN6?=
 =?utf-8?B?WlhUNVpwdjRCMUNHODdYbVQvMytMSThIQVM3b1hlVEVaTVM3Nyt4VThSVERm?=
 =?utf-8?B?VGF1cG5BYy9xNEhvU3hhRmJZWGlrQ1IvbVNhOG90MEtJWkNXS0ZyRmdRQlQx?=
 =?utf-8?B?VDJPeTdrQ0J6QlNDS3ptZHkvaER3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29dcaaf-804c-48ff-013b-08dccc8029d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 01:23:20.8725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJO3gX7qtOSSSfgyVW33FJYQd8YpkE0ecfOtTQiwTODap2qrepN93mZCnP3ssm1NgNZMemI5Q03iUhOw4Q+rTd+wMQrCUhxL4GHCHoDWvHE3+9WDNcJ4+WS/zvFwDJOY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9291

SGVsbG8gTmlrbGFzLXNhbiwNCg0KPiBGcm9tOiBOaWtsYXMgU8O2ZGVybHVuZCwgU2VudDogV2Vk
bmVzZGF5LCBTZXB0ZW1iZXIgNCwgMjAyNCAyOjE2IEFNDQo+IA0KPiBXaGVuIHJlYWRpbmcgcmVn
aXN0ZXJzIGZyb20gdGhlIFBIWSB1c2luZyB0aGUgU0lPQ0dNSUlSRUcgSU9DVEwgYW55DQo+IGVy
cm9ycyByZXR1cm5lZCBmcm9tIGVpdGhlciBtZGlvYnVzX3JlYWQoKSBvciBtZGlvYnVzX2M0NV9y
ZWFkKCkgYXJlDQo+IGlnbm9yZWQsIGFuZCBwYXJ0cyBvZiB0aGUgcmV0dXJuZWQgZXJyb3IgaXMg
cGFzc2VkIGFzIHRoZSByZWdpc3RlciB2YWx1ZQ0KPiBiYWNrIHRvIHVzZXItc3BhY2UuDQo+IA0K
PiBGb3IgZXhhbXBsZSwgaWYgbWRpb2J1c19jNDVfcmVhZCgpIGlzIHVzZWQgd2l0aCBhIGJ1cyB0
aGF0IGRvIG5vdA0KPiBpbXBsZW1lbnQgdGhlIHJlYWRfYzQ1KCkgY2FsbGJhY2sgLUVPUE5PVFNV
UFAgaXMgcmV0dXJuZWQuIFRoaXMgaXMNCj4gaG93ZXZlciBkaXJlY3RseSBzdG9yZWQgaW4gbWlp
X2RhdGEtPnZhbF9vdXQgYW5kIHJldHVybmVkIGFzIHRoZQ0KPiByZWdpc3RlcnMgY29udGVudC4g
QXMgdmFsX291dCBpcyBhIHUxNiB0aGUgZXJyb3IgY29kZSBpcyB0cnVuY2F0ZWQgYW5kDQo+IHJl
dHVybmVkIGFzIGEgcGxhdXNpYmxlIHJlZ2lzdGVyIHZhbHVlLg0KPiANCj4gRml4IHRoaXMgYnkg
Zmlyc3QgY2hlY2tpbmcgdGhlIHJldHVybiB2YWx1ZSBmb3IgZXJyb3JzIGJlZm9yZSByZXR1cm5p
bmcNCj4gaXQgYXMgdGhlIHJlZ2lzdGVyIGNvbnRlbnQuDQo+IA0KPiBCZWZvcmUgdGhpcyBwYXRj
aCwNCj4gDQo+ICAgICAjIHBoeXRvb2wgcmVhZCBldGgwLzA6MS8wDQo+ICAgICAweGZmYTENCj4g
DQo+IEFmdGVyIHRoaXMgY2hhbmdlLA0KPiANCj4gICAgICQgcGh5dG9vbCByZWFkIGV0aDAvMDox
LzANCj4gICAgIGVycm9yOiBwaHlfcmVhZCAoLTk1KQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlr
bGFzIFPDtmRlcmx1bmQgPG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+DQoN
ClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoIQ0KDQpSZXZpZXdlZC1ieTogWW9zaGloaXJvIFNoaW1v
ZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KDQpBbmQsIEkgdGVzdGVkIG9u
IG15IGVudmlyb25tZW50IChSLUNhciBWNEggd2l0aCBSVFNOIGRyaXZlciksIGFuZCBpdCB3b3Jr
cy4gU28sDQoNClRlc3RlZC1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2Rh
LnVoQHJlbmVzYXMuY29tPg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+
IC0tLQ0KPiAgZHJpdmVycy9uZXQvcGh5L3BoeS5jIHwgMTcgKysrKysrKysrKystLS0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3BoeS9waHkuYyBiL2RyaXZlcnMvbmV0L3BoeS9waHku
Yw0KPiBpbmRleCBjYmEzYWY5MjY0MjkuLjRmM2U3NDI5MDdjYiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9uZXQvcGh5L3BoeS5jDQo+ICsrKyBiL2RyaXZlcnMvbmV0L3BoeS9waHkuYw0KPiBAQCAt
MzQyLDE0ICszNDIsMTkgQEAgaW50IHBoeV9taWlfaW9jdGwoc3RydWN0IHBoeV9kZXZpY2UgKnBo
eWRldiwgc3RydWN0IGlmcmVxICppZnIsIGludCBjbWQpDQo+ICAJCWlmIChtZGlvX3BoeV9pZF9p
c19jNDUobWlpX2RhdGEtPnBoeV9pZCkpIHsNCj4gIAkJCXBydGFkID0gbWRpb19waHlfaWRfcHJ0
YWQobWlpX2RhdGEtPnBoeV9pZCk7DQo+ICAJCQlkZXZhZCA9IG1kaW9fcGh5X2lkX2RldmFkKG1p
aV9kYXRhLT5waHlfaWQpOw0KPiAtCQkJbWlpX2RhdGEtPnZhbF9vdXQgPSBtZGlvYnVzX2M0NV9y
ZWFkKA0KPiAtCQkJCXBoeWRldi0+bWRpby5idXMsIHBydGFkLCBkZXZhZCwNCj4gLQkJCQltaWlf
ZGF0YS0+cmVnX251bSk7DQo+ICsJCQlyZXQgPSBtZGlvYnVzX2M0NV9yZWFkKHBoeWRldi0+bWRp
by5idXMsIHBydGFkLCBkZXZhZCwNCj4gKwkJCQkJICAgICAgIG1paV9kYXRhLT5yZWdfbnVtKTsN
Cj4gKw0KPiAgCQl9IGVsc2Ugew0KPiAtCQkJbWlpX2RhdGEtPnZhbF9vdXQgPSBtZGlvYnVzX3Jl
YWQoDQo+IC0JCQkJcGh5ZGV2LT5tZGlvLmJ1cywgbWlpX2RhdGEtPnBoeV9pZCwNCj4gLQkJCQlt
aWlfZGF0YS0+cmVnX251bSk7DQo+ICsJCQlyZXQgPSBtZGlvYnVzX3JlYWQocGh5ZGV2LT5tZGlv
LmJ1cywgbWlpX2RhdGEtPnBoeV9pZCwNCj4gKwkJCQkJICAgbWlpX2RhdGEtPnJlZ19udW0pOw0K
PiAgCQl9DQo+ICsNCj4gKwkJaWYgKHJldCA8IDApDQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiArDQo+
ICsJCW1paV9kYXRhLT52YWxfb3V0ID0gcmV0Ow0KPiArDQo+ICAJCXJldHVybiAwOw0KPiANCj4g
IAljYXNlIFNJT0NTTUlJUkVHOg0KPiAtLQ0KPiAyLjQ2LjANCj4gDQoNCg==

