Return-Path: <linux-renesas-soc+bounces-25628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A05CCCAA391
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 06 Dec 2025 10:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2FBA30EC08D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Dec 2025 09:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4AB2ECD3E;
	Sat,  6 Dec 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NqtY/47d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010035.outbound.protection.outlook.com [52.101.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3792EC558;
	Sat,  6 Dec 2025 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765014266; cv=fail; b=OkbANG+6N91/SUrvNseB761B8jSx4X3fgcySqlcXGC/3xUptr621ab05/RVseBPw4S56iEBJlrXrq5vL8+uR40eOfIv9PSjbhwbJ2hR8bw8ahTu1TWIhCAatsKFNUtAd624ZMDxioQVONBdEkBLP1vDU3wMV2/3hs+dIA3aILhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765014266; c=relaxed/simple;
	bh=fYdcMRiFLvbt07PToIANJNUurLU7yh7ApRs9K2P+80A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L/VJJl+/6DD6Mtu5XbfJi3XeYmTq5tuWRe6fHIsm50r9IIfDj8+EsXMcJ2wTqTqc6RGphtotn75+TtW65x4+M6FsDCb0Hh0zVx6yglIQNFoAHbxr/vrc8HZENdVk+SUxA5L9FY/1yzGKqag5hbnaKw1lJPQ0UShDsSt1hIrV+X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NqtY/47d; arc=fail smtp.client-ip=52.101.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPU2Y80xrIijV27YNTQj2cfXR2IoWL+y2Qvj3V+7W2pQmL5as0Bmok2Wh8eUBd8coe6TxXRevonTmuUjMrJNB5zNd2A8eaF0wJyEx0FmPckMKLdQ+sxBdlwXYjQ7cIw+ugZe6doPK24yV1fsMm5ytS2mHA8wPy+rIywOprqPVlhHZk6XZneD94HVVNtK4ttvLt1kxNmiWAU9gcybu8i/+K+4FwDSbS2HUvI1GnapKh9iCldrA6GAX1dST1VJOZShWYqR0f4AZx/Oyp9sAAEsK9HgRF1INo5b4XGKkyc2V2lTYJvSIkjCVwlRGECyjj99lpjng02Kt7C/wSO3N4RufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYdcMRiFLvbt07PToIANJNUurLU7yh7ApRs9K2P+80A=;
 b=Ib/Z8d4bHopnVpJQKjCPf1ht/YLDEHlO9NOPiFjEnciuHR2EqyqyWWJCK5zTmf0xb1Kk1xM8ORb0RDxJ+lH5fnV1RNIdLGkKaFDrjuEdBWPdJEtMB3GUkYgSUl+ddSSA1tX557zxVZj8X94K5ZT2FF/YfLuhSyOA0r8qmSmBo9NwjUeQvNoONpDw1LkAokqveDDC3kI7OOCBk9weLJ30RcY1dRMpY6tQIJBb9mDvLNEd7W3xattQXc9H/JgWpmCLWDdcr1eQUZT5RIFswTWGbWl/kzMonvbdoZiSy1/17fjN1eZcYz5dhfZgejTe5nJeq3RUEict1u5Pte2bxDFGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYdcMRiFLvbt07PToIANJNUurLU7yh7ApRs9K2P+80A=;
 b=NqtY/47dD3VHkU5qiDE8oShWA+qnrtnMzdcjIf0+Q6Dx6BPSR77DDK91gP0FUVG+t1+0Kc9eyx6GZGK7SDZDIgAH4grHbEvbjBk1/DDMkEj/FYwHQvP2Fc5LRQ6yckZXKOxfhuC0rTaj3VNYaCfQ+cNfCD54CvJ+JEH59U2FLU0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB12457.jpnprd01.prod.outlook.com (2603:1096:604:2df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.3; Sat, 6 Dec
 2025 09:44:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9412.003; Sat, 6 Dec 2025
 09:44:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Topic: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Index:
 AQHcUkXayA+E33hY1EmsX/GuWX+dybUR8j8AgADxDfCAABPzgIAAA2hggAAJoQCAAABcgIAAEgTwgAAbNYCAAAHegIAAByGAgAFJGsA=
Date: Sat, 6 Dec 2025 09:44:10 +0000
Message-ID:
 <TY3PR01MB11346B6994E9671CEDAB0BCDE86A4A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
 <TY3PR01MB11346625CD598704CC36C63AE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <da64005a-e6fb-4bbb-a97c-e6c3ada8aff1@tuxon.dev>
 <TY3PR01MB11346820489C604B63A315E8486A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346E629B11BC5F812D32E0086A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <52bf094a-a656-4bef-bb22-f903578ecf9b@tuxon.dev>
 <TY3PR01MB11346C5EDDE82E779C69566BB86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <562eda90-6ca2-40b5-b1f8-fcc4034dd122@tuxon.dev>
In-Reply-To: <562eda90-6ca2-40b5-b1f8-fcc4034dd122@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB12457:EE_
x-ms-office365-filtering-correlation-id: da045ccc-da81-46b9-469c-08de34ac0243
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDBIWDBCWm5kNUx0UHdNeVluOCtKYjVmYjJLVE9lNHIvUXhSdm95RWRpb0pF?=
 =?utf-8?B?RWJ0M0oySk1xZWI3VFhjdUg4cUs1QkNRY0dpMmpDRG5zM2tzQXAxZWFxMjZj?=
 =?utf-8?B?WW9MSWxTREdtd1B1MDE4RDJILy9mbmZxUm5XQ3VlSzMvU2dvZ1FkWmYxQXZR?=
 =?utf-8?B?ZkoyWDRLbDNoSjZaQ1ZuR0FmckUxVGFobVE2ejRSMUFLcjlsRWViNUVyMmJ0?=
 =?utf-8?B?YitjQjVFQ2V1NUxWT1NheWx1M0V4Z2s0WXI4NUhxeUttY1BTOEU3dVBEQ0cw?=
 =?utf-8?B?dVZBVWUzUllaNkI5UnlxbWJ3b053M1g0ajRQNmpJVlArUG4yWmJpMng2eHhq?=
 =?utf-8?B?RFhoeUZKalAwMWh5ZE13MkNDODVkazlNTjRpOXFaUDlPaWJnTElMVjZqWU0v?=
 =?utf-8?B?ajhuSEczSHljVmxkZkFYV3lISkZyZVhkL2FqVTJ3QkZoVFBFUDkyY1J5M01K?=
 =?utf-8?B?ZDNkTk5JazNKd2ZVN1p3dUxaMjV0TmRwdG1BbFIrbHl3L042aDVRemkrakxr?=
 =?utf-8?B?c2NVb2hoL0pVYXZ1ZUVRNDFjRTJ1amJNSk1WZnV5U1FiYjBpV3B1c0Z1S09U?=
 =?utf-8?B?T0dLem5Qa0MrOXRTODN4UUhLeHBtdys0NnhrKzFkei9PMk9oRGRmMVFiMTBQ?=
 =?utf-8?B?VEFrQnIxNjhyM1UyNmJFYldBYnlxRDhOOXZyalBHcHpYa0ZPdC80SHAyU1B6?=
 =?utf-8?B?bktuYzBtQU5xbmtyc2JyejltcmxPeVhhcWk4VXNSbU9QNDdNbjNjMExpRVNQ?=
 =?utf-8?B?dE9WNS81R2pMbVREMmFpSmpSeDBxazE3QUlDbGRoQkNSckg5OUdIWklpRmti?=
 =?utf-8?B?UzBOeXlsMXZQd1FHbjU2OUU1NHphVkJIOURKU3Q5TjJOTlZNeHhMY2d1Syta?=
 =?utf-8?B?bk5JZ2ozd0dNNlVha3VtTFYyQjIzS28vQ1VxdWszVHpaci9WYkFaMkJmZVVP?=
 =?utf-8?B?dHlPLzdPcHVISXhEOUkybnJ2U053UjVyVXYxT0VQcVZlSjlMN1dnYThsVXJ1?=
 =?utf-8?B?RytucFRoRytOcnhmZDZnNmN1Q1AvdVNpQ1docEw3ZlJQcGhobjFvTkVFaE81?=
 =?utf-8?B?aFRkMjdjdjE1dmU4NmNhVVV0ZG5xZWc0TzdsQWRFZ0tkMlJ0Z1BoMVJXZUVP?=
 =?utf-8?B?UytBV1UyenVvNmdEM0d1NVVrdlA2NzhjUXN0RW1yRGdIVUlDcWdVckNTZEha?=
 =?utf-8?B?YkN6WXFVYnkzT094eTd6emFWbnFoY01iMzF5MUhQWWZjS29NSElsb05ia2xF?=
 =?utf-8?B?bWRNTEtFK2NTdE02MHBqOWtsMnltSklUQkZEeDlKM1FHdkFaMWFlMTJ5dmo5?=
 =?utf-8?B?Wm5ncEpvZU5jdThDN2F3SUQ0T0ZROFBrc3FCem40cGxHMlJ5b0xVamkwVGFY?=
 =?utf-8?B?RG5lV1N0STFmODBLcmNrWkZVQ0lmdGVKcW90UVpoOGdWMkJPT0x5Zm9iOWN0?=
 =?utf-8?B?VVFKQ2ZoVEMrUG1rdzM1RU14WTdEVXQ2NzAxQVV4dzlPUDlrVjdTOHQ3STM1?=
 =?utf-8?B?M3JJMUkvMWd4MVZaTXdEVGxsaUdieWErNHZOaTVRNnY0WmMzVTJ3cUNvTTVo?=
 =?utf-8?B?d3R4T1dZUWhFRlc5U21XaDNnQnpYZzJOTTlPWUdCYWVzN3BtN292QVFzYU1G?=
 =?utf-8?B?MFNrbUt2QUk2bm52N091SkdsQzV3Y1c0RlNQZ0szVVhJaXQ5eHRBaEpqeTVJ?=
 =?utf-8?B?cmlRTmhveUlPU08zdm1NUEw4djdQQ1VxZGxHTHpFZEV5ZGFOaUs4eVJGbm16?=
 =?utf-8?B?UFJKQzZKaDBiM2F4ZndrbVNWZEdoYlNrQXFwbEVCMmFRRXU1bEJCNnRrb1A3?=
 =?utf-8?B?RFh6NFFTb3pVRFZiRzlMWXVOVmVZTDJJeTNMMmh3UjcrT203Sm5kRHFSTFFr?=
 =?utf-8?B?R2U2ODVnZkpBWnlYWGV6K0dQTXhubjdMbkUzZTFLamh4c1RtRitnV1JybWx6?=
 =?utf-8?B?UUxTSExYaDZtbXE1U3E5ejZUNXFLeDhJSkovZHVTMEg4ckwybjIzRDJxK2pu?=
 =?utf-8?B?M1hMV08xelA0NkNQNDZ0bUFHb2ZnV0hhdGFLbDU4ODVhVXltS0xaUlk1NGdU?=
 =?utf-8?Q?3KmSig?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXEvV3dxeWxEN0U2Um5rNjRTb0VqQ014ZkFuVjdNNkh1SnNOdUVSU0s0Z2JK?=
 =?utf-8?B?d0NHa0ZvNzdOaXZ2SUZkR1JEdTQxaFUrWGpkclBFemR5TGpEQlJ0U2hvTXFa?=
 =?utf-8?B?OHBlcG13UVkwQzFSV1dhTmVveUJ5R0R1L0hjMi9KN2pJc1pVTlZvNnNtV21n?=
 =?utf-8?B?UG5ENUdZejdPWnVZVVVnRGdpa0MvMnozTHlWbzNOY0ZKZEF2OFI3bEZyQTZK?=
 =?utf-8?B?eDArdDlPVGN1cU15c1RYVTZkNERGTGdUVmI4Y2FKbnJLMng0VXduZjJqOWwx?=
 =?utf-8?B?Mi9HV2trNFBWTHY0Z1BRelRVOXVFaFVmZFN0MlFNc2xQWi9OWDNrcGtCcmVQ?=
 =?utf-8?B?cUkwbmpOcmlRN0FZb0w4dGh1WWFZQ2c1R1hQWDQ0N1c3NEx2TmJFT0MyblM5?=
 =?utf-8?B?QnM1Qk5xTVMxc0dEd0h3dFB4REh3SUlmRzRjbVBxR2J4TGFQL2daeFMvd3ZB?=
 =?utf-8?B?Rjd0K25CUWxGSmhndW1NcEJMRjIyTGVVamlQZGJSWFVzQUtkNzU3WXIyU3lM?=
 =?utf-8?B?cXZzYThqMDFsdThvK0Y5a0hWWWIwY243ZmZ4c2N4bTZXNnZSTkswYzFpUjNO?=
 =?utf-8?B?aEpjK0FQL3k5NnB2TEJqNlVQeUloMXZlbnZxdDBuRDNEQjduWldNazI5T0Vr?=
 =?utf-8?B?QysyVnBhZmhMSk5aQ1VQVEJacjl0emFEMUozNDZheXBHb2o0TmYyQ1NaR0lq?=
 =?utf-8?B?UHN6aTRjM1hqUGh3Zks5cXY3anUwbDg0bll2Wk1VVWRMeU0wU0JwcUVpWDlq?=
 =?utf-8?B?OVBnY05Od2RkZUFJak5lWHAwaWZUQ0lCMVFNOGlPcXNCakFvZ0FOWXdjSE1o?=
 =?utf-8?B?aU9JcnFTS2huZW5ZekVOaDdDUmFqcmRLRjlPaUVMMm5pMTNqSnVPbUFXcDdi?=
 =?utf-8?B?Skc1djlWYkJTWHZJcXl3TXJtbFMxREVnVXdvNkI0UklKY1ZmNGl2cHkyUThN?=
 =?utf-8?B?TmxCbjQycU53ZFdUdjVFUW5vOFBFSUp1Y2F6bENVMjUxUzV3SXZIaFkzQjZq?=
 =?utf-8?B?YzhXNWNjQzBLNGNaVXhMbUNHdFRRdytWZXdCWXpUa21WQk9ydkJxSFZXSlNm?=
 =?utf-8?B?aHlGMWxzTSsyL3dHZVVmVUJlcXhuT1c5em11UGRiUDNtclovSWg3ZklXaVVy?=
 =?utf-8?B?d05UTjZ2OUJNNndWUWNVMDFCQm1UdzNtc1Q4WDFCdHk3TVB0cE1iaExFdFR3?=
 =?utf-8?B?Tkp5QlliUHpTOUNNUXhRWXNabDFRZU9YMWI3STNJc0p2ekFqc3BHcXdRUm9T?=
 =?utf-8?B?SFIwcU15ZWprNnU5TUF3UnEvL29wMXdXT2laRGVPaXUwdVVqQnVDSEJLTTNE?=
 =?utf-8?B?TzdwVEYvaVdTK2Q4dWxQQ0lXWFZBZ0Vvc28zMllrVXBOb0J6OFN1ZStsSTRN?=
 =?utf-8?B?eko4NUVCc3NkZUN6a1piWXpHL3RNay8rY3JPZlhjTjkyT3d2VGNhSUxkRlRv?=
 =?utf-8?B?T1pZWnBaT3VkSVBmL04zNTdNWjFDTkVqZGorTWhqYnVjd0VIRDM4SmdnRXBp?=
 =?utf-8?B?OUlJT0xVejlGTWxtZy9hOEFtRGhIT1N4SnNMaXc0ZWNqNjJ1MUVXRWxzazh0?=
 =?utf-8?B?cG5XU3F4bHp6VjV0ajdRZW5LdGhRZDFXM2dpSmhsV2VQczZpUUtpSGFIYjk5?=
 =?utf-8?B?TzZOY2syalRuRTZuTWJoK0ZQZVN0RGFTQ0NtejNwbFpHeXloV000VWIrcUVx?=
 =?utf-8?B?UlBxd000T2NsUFo1UFFoVEU5Vm9QVXpEYWx2T09TM1FTQ1hUa1gyRnp3Ky93?=
 =?utf-8?B?YStBaTdWVmRLMGpBVWFUSDdxTVdGZi9sUExZS05MYm1HQnZJZ0VUejljc1Ix?=
 =?utf-8?B?MXZuUTFGbDFlN1BqRGhuMnpnNEN4L2ZoYWhEUEVYVlo5Y0Y5bHYycFgxNGtO?=
 =?utf-8?B?TlhlMyt5aFB1ckhBZk53YTdaQ01ZNVNsNHNobkJMNDNZV1BBN2lHekd0K3o0?=
 =?utf-8?B?QWFXNUM1c0RocktvYnRUNC9pUWlIZ0g1cGx5azBuT0lrL0NDUlVDZG9ZREJp?=
 =?utf-8?B?TFNsUGxGNmNqNytFbG52cnNucDJTdHk3alZCOVoyQUhlTWlkOGpPY1NLK0FI?=
 =?utf-8?B?Ulk5ZmhXc0RaelB0blIrcWI0U1M3Ujk1VUtQOUtOMnJINjlldExvcnk2RWdZ?=
 =?utf-8?B?ZXpONVRmVGh6a1VHNUYvbVR0amg3d1RRWnNOZ3hWSW5iKzh1Zkg2RXdaSzRM?=
 =?utf-8?B?eFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: da045ccc-da81-46b9-469c-08de34ac0243
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2025 09:44:10.9933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SY3suxoV1H01/FHzgL65D4/eEaK/CLC14exkRqj2vpEab1EpRZJltqYEPDVMe+A/vfeP1XAS/CI0uz4MPxVWL9/9VAZIRpmIS1nihU9t7pY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12457

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogMDUgRGVjZW1iZXIgMjAyNSAxNDow
Mg0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgcC56YWJlbEBw
ZW5ndXRyb25peC5kZQ0KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgt
cmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBDbGF1ZGl1IEJlem5lYQ0KPiA8Y2xhdWRpdS5i
ZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8yXSBy
ZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kIHRvIFJBTSBzdXBwb3J0DQo+IA0K
PiANCj4gDQo+IE9uIDEyLzUvMjUgMTU6NDUsIEJpanUgRGFzIHdyb3RlOg0KPiA+DQo+ID4NCj4g
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4gU2VudDogMDUgRGVjZW1iZXIgMjAyNSAx
MzozMA0KPiA+PiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgcC56
YWJlbEBwZW5ndXRyb25peC5kZQ0KPiA+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBDbGF1ZGl1IEJlem5l
YSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMC8yXSByZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kIHRvDQo+
ID4+IFJBTSBzdXBwb3J0DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+IE9uIDEyLzUvMjUgMTM6NTUs
IEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4gSGkgQ2xhdWRpdSwNCj4gPj4+DQo+ID4+Pj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBCaWp1IERhcw0KPiA+Pj4+IFNlbnQ6
IDA1IERlY2VtYmVyIDIwMjUgMTA6NTcNCj4gPj4+PiBTdWJqZWN0OiBSRTogW1BBVENIIHYyIDAv
Ml0gcmVzZXQ6IHJ6ZzJsLXVzYnBoeS1jdHJsOiBBZGQgc3VzcGVuZA0KPiA+Pj4+IHRvIFJBTSBz
dXBwb3J0DQo+ID4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IEhpIENsYXVkaXUsDQo+ID4+Pj4NCj4gPj4+
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpu
ZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+Pj4gU2VudDogMDUgRGVjZW1iZXIg
MjAyNSAxMDo0Nw0KPiA+Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gcmVzZXQ6IHJ6
ZzJsLXVzYnBoeS1jdHJsOiBBZGQgc3VzcGVuZA0KPiA+Pj4+PiB0byBSQU0gc3VwcG9ydA0KPiA+
Pj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+PiBPbiAxMi81LzI1IDEyOjE3LCBCaWp1IERh
cyB3cm90ZToNCj4gPj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+Pj4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVh
QHR1eG9uLmRldj4NCj4gPj4+Pj4+PiBTZW50OiAwNSBEZWNlbWJlciAyMDI1IDEwOjAwDQo+ID4+
Pj4+Pj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47DQo+ID4+Pj4+
Pj4gcC56YWJlbEBwZW5ndXRyb25peC5kZQ0KPiA+Pj4+Pj4+IENjOiBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOw0KPiA+Pj4+Pj4+IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9y
ZzsNCj4gPj4+Pj4+PiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNh
cy5jb20+DQo+ID4+Pj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJdIHJlc2V0OiByemcy
bC11c2JwaHktY3RybDogQWRkDQo+ID4+Pj4+Pj4gc3VzcGVuZCB0byBSQU0gc3VwcG9ydA0KPiA+
Pj4+Pj4+DQo+ID4+Pj4+Pj4gSGksIEJpanUsDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBPbiAxMi81
LzI1IDEwOjUzLCBCaWp1IERhcyB3cm90ZToNCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4gSGkgQ2xhdWRpdSwNCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+Pj4+Pj4+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5i
ZXpuZWFAdHV4b24uZGV2Pg0KPiA+Pj4+Pj4+Pj4gU2VudDogMDQgRGVjZW1iZXIgMjAyNSAxODoy
Ng0KPiA+Pj4+Pj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJdIHJlc2V0OiByemcybC11
c2JwaHktY3RybDogQWRkDQo+ID4+Pj4+Pj4+PiBzdXNwZW5kIHRvIFJBTSBzdXBwb3J0DQo+ID4+
Pj4+Pj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+PiBGcm9tIG15IHByZXZpb3VzIGV4cGVyaWVuY2Ugd2l0
aCBzdXNwZW5kL3Jlc3VtZSBpbXBsZW1lbnRhdGlvbnMsIEkNCj4gPj4+Pj4gY2FuIHNheSByZXN0
b3JpbmcgdGhlIHN5c3RlbSBpbiBmYWlsdXJlIGNhc2VzIGluIHN1c3BlbmQvcmVzdW1lIG9yDQo+
ID4+Pj4+IG5vdCwgaXMgdXAgdG8gdGhlIHN1YnN5c3RlbSBtYWludGFpbmVyLiBTbywgSSdsbCBs
ZXQgUGhpbGlwcCB0bw0KPiA+Pj4+PiBkZWNpZGUgaG93IGhlIHdhbnRzIHRvIGdvIHdpdGggaXQg
aW4gdGhpcw0KPiA+Pj4+IGRyaXZlci4NCj4gPj4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IEFncmVlZC4N
Cj4gPj4+Pg0KPiA+Pj4+PiBUaGV5IGFyZSBzdGlsbCBzdXBwb3J0aW5nIHN1c3BlbmQgdG8gaWRs
ZSwgd2hlcmUgcG93ZXIgaXMNCj4gPj4+Pj4gbWFpbnRhaW5lZCwgcmlnaHQ/IFNob3VsZG4ndCB3
ZSBjb3ZlciB0aGlzIGNhc2U/DQo+ID4+Pj4NCj4gPj4+PiBZZXMsIEkgYWdyZWUuIFByb2JhYmx5
IGJlc3QgdGhpbmcgaXMgemVybyBmYWlsdXJlcywgaWYgdGhlcmUgaXMgYQ0KPiA+Pj4+IGZhaWx1
cmUgaW4gc3VzcGVuZCBwYXRoLCB0aGUgc2FtZSBkZXZpY2Ugd2lsbCBmYWlsIGluIHNpbWlsYXIN
Cj4gPj4+PiBmYXNoaW9uLCBhbmQgdGhlIHN5c3RlbSBuZXZlciBlbnRlcnMNCj4gPj4gc3VzcGVu
ZCBzdGF0ZS4NCj4gPj4+Pg0KPiA+Pj4+IFNvLCByZXBvcnQgdGhlIGZhaWx1cmUgYW5kIGRlYnVn
IGFuZCBmaXggdGhlIGlzc3VlLg0KPiA+Pj4NCj4gPj4+IEZZSSwgT24geW91ciByZXN1bWUgcGF0
aCwgaWYgdGhlIGJlbG93IGNhbGwgZmFpbHMsIHRoZW4gdGhlcmUgaXMgYSBwbSBpbWJhbGFuY2Ug
Zm9yIG5leHQNCj4gc3VzcGVuZCgpLg0KPiA+Pj4NCj4gPj4+IHJldCA9IHBtX3J1bnRpbWVfcmVz
dW1lX2FuZF9nZXQoZGV2KTsNCj4gPj4+DQo+ID4+PiBTaW1pbGFybHksIGlmIHJlc2V0X2Fzc2Vy
dCgpIGZhaWxzIGZvciBhIHNoYXJlZCByZXNldC4NCj4gPj4NCj4gPj4gV291bGRuJ3QgYmUgdGhl
IHNhbWUgaWYgdGhlcmUgd2lsbCBiZSBubyBmYWlsdXJlIHBhdGggY29kZT8NCj4gDQo+IENvdWxk
IHlvdSBwbGVhc2UgcmVwbHkgdG8gdGhpcyBxdWVzdGlvbiBhcyBJIG1heSBiZSB3cm9uZz8NCj4g
DQo+ID4NCj4gPg0KPiA+IEVnOg0KPiA+IHJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocHJp
di0+cnN0Yyk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8gcHdycmR5X29mZjsNCj4gPg0K
PiA+IEhlcmUgeW91IGFyZSBza2lwcGluZyBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCksIFRo
ZSBzdWJzZXF1ZW50DQo+ID4gc3VzcGVuZCgpIFdpbGwgbGVhZCB0byBwbSB1bmRlcmZsb3cgZXJy
b3IuDQo+ID4NCj4gPiBTaW1pbGFybHksIG9uIHN1c3BlbmQoKSB5b3UgYXJlIGNoZWNraW5nIHRo
ZSBlcnJvciBjb2RlIG9mDQo+ID4gcmVzZXRfYXNzZXJ0KCksIElmIGl0IGZhaWxzLCB5b3UgZGVh
c3NlcnQgaXQuIFN1cnByaXNpbmdseSwgdGhlcmUgaXMNCj4gPiBubyBkZWFzc2VydCBvcGVyYXRp
b24gT24gcmVzdW1lKCkuDQo+IENvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgaG93IHdvdWxkIHlvdSBs
aWtlIHRvIGxvb2sgdGhlc2UgZnVuY3Rpb25zPyBJdCBsb29rcyB0byBtZSB0aGF0IHlvdSB3YW50
IHRvDQo+IGlnbm9yZSBhbnkgb3BlcmF0aW9uIHRoYXQgbWlnaHQgZmFpbCAoYXMgeW91IHByb3Bv
c2VkIGluIHRoZSBjYXNlIG9mIHJlc3VtZSBmcm9tIHBvd2VyIG9mZikgYW5kIGp1c3QNCj4gcmUt
ZW5hYmxlIGV2ZXJ5dGhpbmcsIHVuY29uZGl0aW9uYWxseS4gSWYgdGhhdCdzIHRoZSBjYXNlIGl0
IHdvdWxkbid0IGNvdmVyIGFsbCB0aGUgY2FzZXMsIGVpdGhlci4NCj4gRS5nLiwgaWYgcmVzdW1l
IGxvb2tzIGxpa2UgdGhpczoNCj4gDQo+IHN0YXRpYyBpbnQgcnpnMmxfdXNicGh5X2N0cmxfcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikgew0KPiAJc3RydWN0IHJ6ZzJsX3VzYnBoeV9jdHJsX3By
aXYgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gDQo+IAlyemcybF91c2JwaHlfY3Ry
bF9zZXRfcHdycmR5KHByaXYtPnB3cnJkeSwgdHJ1ZSk7DQo+IAlyZXNldF9jb250cm9sX2RlYXNz
ZXJ0KHByaXYtPnJzdGMpOw0KPiAJcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KPiAJ
cnpnMmxfdXNicGh5X2N0cmxfaW5pdChwcml2KTsNCj4gDQo+IAlyZXR1cm4gMDsNCj4gfQ0KDQpN
YXliZSBpdCBpcyBzZW5zaWJsZSB0byBwdXQgdGhlIGRldmljZSBpbnRvIGNsayBvZmYsDQpyZXNl
dF9hc3NlcnQsIHBvd2VyIG9mZiBvZiB0aGUgZGV2aWNlLCBpZiBhbnkgb2YgdGhlIGNhbGxzIGZh
aWxzIGR1cmluZyByZXN1bWUoKQ0Kd2hpY2ggc2F2ZXMgdGhlIHBvd2VyIGZvciBmYWlsZWQgZGV2
aWNlLg0KDQpXaXRoIHJldHVybiBlcnJvciBjb2RlLCBjYWxsZXIga25vd3MgcmVzZXQgZmFpbGVk
IGFuZCBjYWxsZXIgd29uJ3QgdHJ5DQphbnkgZnVydGhlciBvcGVyYXRpb24gd2l0aCBmYWlsZWQg
ZGV2aWNlLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg==

