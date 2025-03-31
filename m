Return-Path: <linux-renesas-soc+bounces-15167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98BA76654
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50F9188788B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FE82101B3;
	Mon, 31 Mar 2025 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ApYLotk5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4344121018F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425411; cv=fail; b=cMTekm1QXUSu4FdHuT6mj1F0aHf5ullUk0V+Ez4Kk0kzsQTR6PX4F2qdfcK2WOWDOWgW7aKPKkauDyhCW2r8B8OHkIvKA/MGNdZm028Df7zzgS+GfoC/bomg2rqLb11ec0GmMGLgaRT9e0ABew8FNEPzoXpuMPu0C5mys3uZHio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425411; c=relaxed/simple;
	bh=FD6og/YsAB5rOHK8rebnHodsrfRMIFxHrBeYp2MUaHE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CHkQCDWTZ7tDW2WfiUbkTnrfu+Ui2i6BqXAC55tv2AH6/StklL1EAhovWKNRNhMdDtmbW6Kl40wTr0UTSiZ/o/YSndqURRt2xjYEO4Krfx6W3m//5gKgZwC0eONgseHh87+l5Iu4USclvGxMY/k63Yar2HrU7u44jLMjNOUmPiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ApYLotk5; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JerZ2XyjhP7x1PislYtxSVxuR2b/05XUH5JExB79w789utVLLnvfytps8c+hQLAM4znEzci0eBNRraQ8mUJIk0t0T+ul0StDQBJ08R8JZm9hak3q3K8RMsmw2PgEYuAkqmCHeCAnMwEPpnW4gxOQ9u0Q9nYBzUh6i3hCJ9BM1a53RWXowvG8BuwYFErnZJdxm24kmZOQIB/YN5bWbWuUX0LmSNOa1AJ/vBc7vBMNaQvAO2Xtkb6UhR2QKSZpEwJk+fhIhkFjNsHHZO/yNrt8OCncOcOptBuhW4KWTMSSLMy9WEcCuWcsmX1kSMfjdVM1PNw7UloCZX/N0obvExwEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD6og/YsAB5rOHK8rebnHodsrfRMIFxHrBeYp2MUaHE=;
 b=NCAADu4DB+hDq4gDCy9TwvN1N49JAZ7gOKAIvXQtIPZEb2PKNdStIgMdfXdNEEhE8u1CyJ+2ifGBSLFTT35wij3LsdycGhRsbigzygtbybBZxcgG29WrzJJuSEqXtAQ5X9VcNuASaQlnxgSfMZC5L+scgSKi3sZVnCxWc2ex+YNxYr20bNkYO1OljS3MaQ2JJqLuxVBZpB37MNdXh2vpt0k8rpwePnBiE5B4WndQVRdk16O/kHTMtW3hIEwbc5ToUErGL3/XLLAsXBQnWJt3GU4M4g+RUUbS4u5g5h28EZmYj3lv3H/BzTaf3lMLJ/RkCPcVtjFOgSPm1Psg3CQZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FD6og/YsAB5rOHK8rebnHodsrfRMIFxHrBeYp2MUaHE=;
 b=ApYLotk5pIXKz584eUw0Jq7CA/lUhzJyZcvIxUS3kAyJReaCOANOkClUs34Jvu77jG7NMvz8Qhlb5xKF+HcPdqgq6bRI9bgTf79OjsTfuNDrHB8Z7RLtdlQOZxAjh1tiqaiUb0JMzAWEweQ5Od0VNw/rn5UAamSB9gpdip3q5ss=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12175.jpnprd01.prod.outlook.com (2603:1096:405:105::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.33; Mon, 31 Mar
 2025 12:50:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.036; Mon, 31 Mar 2025
 12:50:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 7/9] memory: renesas-rpc-if: Add wrapper functions
Thread-Topic: [PATCH v3 7/9] memory: renesas-rpc-if: Add wrapper functions
Thread-Index: AQHbknnhH9N1A13Y9Ue23p0yOrzrV7ONTdwAgAACrYCAAABxUA==
Date: Mon, 31 Mar 2025 12:50:05 +0000
Message-ID:
 <TY3PR01MB1134646707925886C675F7EAC86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdWEAVfQ0_Ffbw0eexhTnDDZFu2mDwx3zvL4s66XsBN6fA@mail.gmail.com>
 <CAMuHMdVpY0xo-h8gSz0uq9YttZg8kBB1z1MnobhTe0dfwOqzhg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVpY0xo-h8gSz0uq9YttZg8kBB1z1MnobhTe0dfwOqzhg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12175:EE_
x-ms-office365-filtering-correlation-id: bc7993f2-8988-44c8-575a-08dd70528f99
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bG13cTNzSXd5alJTNGNlN0pCTjFDTTNXMlFRQVhKdnByQmhQbDNGbFN6QkVS?=
 =?utf-8?B?QzBMMVJJR0lYQmpmOFBCdGU2U0Rsc2dtT1FObmJiemRLdGlkSDJDZEI4UWJ1?=
 =?utf-8?B?RDBzSDFOd1A4N0RxSmhZcE16a2RiZUl3MFJ2ZWRwN1pSbDJveEJwRFk4VDZw?=
 =?utf-8?B?YTBJWVFFNDZDeHZJUHUxTWJTcC9qOUhYSC9RMkNKVDl4SXhEZnRkdWxTMDVm?=
 =?utf-8?B?b2R5TUx1OGE4MGZXVWxGcnlGR2hScGkrTXIrS0JXbWVmQ0tyTC9QK1pDK1Ru?=
 =?utf-8?B?azZBQmhqZG5ZaUljTWJTNWczZEVlTHJUWE43bml2dDBGL0IwRURjRmgwb3Qy?=
 =?utf-8?B?Q1RKN0Y1UDVzSVhUSDFWbFNRVFYwdzBsL0N2T2Z3TXpuSU5WbEgvWnlIUDRy?=
 =?utf-8?B?SGVjREsrMndsYURkeGZORVd4NlE0eG1lTWtJVkdBNElXKy9qWXY2VkdDNG9U?=
 =?utf-8?B?Tkc3djNxUjd0RFVOOU1pOFNmS2NjeWJubjhJVGNXOTcrMGoxOG5iNEg5WElR?=
 =?utf-8?B?a25ZMCtRLy9MNHlGSWd6OEhUaTVNZktVVG1ZTmd5bVcwaWs0RllVajFhdnE1?=
 =?utf-8?B?SWFPU3BJVDhNd1RjMEVIYlJjY2NpUEpNckdjQ012Zm1EcFhYMWVNV3RudHVs?=
 =?utf-8?B?dFlCem5GTERxMHpEa2Q0enRpT0owZElUaTNmajlIZWxlUXlMbFZ3VGh6M1Bt?=
 =?utf-8?B?YlZGSjNSSjRCYjIyU0dNVXdDeUZpZmdzUkZONlhCS01ETHl0ZXZEMkNIQ0tj?=
 =?utf-8?B?TExDZDcvalJ3QU5PVGpkWEJWYmJLdnMvTERrcGxnZzU0QlF3Zk5iU01XRnlF?=
 =?utf-8?B?ZDQwVG1hZHEybHpDZTZoanlxb3lZQUFzVkZJT2VWVHJaaGF4c01EOHZsQ0J0?=
 =?utf-8?B?QmRtWGRxd2JBUVBqYldvQjV2QlVIeWc1NkxkTWg2S0RBenZMK040UUluVVlE?=
 =?utf-8?B?U3hSZkpGaWI3NmZQYXE3WHhBV2NQL2lvVDFZc0JNeFJkd2NhdStBMnZpR2FW?=
 =?utf-8?B?SnBlc3Iwa0JSbnJ0UUs5YjdBQnBnZ2ZhNnVLbFhnbmhYNHMzUlVCL0RuNWFE?=
 =?utf-8?B?eDJiTFNUdVE0cmZuSERsdmFqV2UrWkQvSG4wQzE3Z2txNEJTMWlIZUpoSjIw?=
 =?utf-8?B?VENyVitkVURYaUVJa1k2cmw3QVY1eEpKRVl4NUtXdjA4MThoNzhuYTlZR0J4?=
 =?utf-8?B?cWRlNHN1aTZxMkhIbzFmSG5pdTBMYWU4RVo0dzRmcVJDTkY0eWJFSFJhTzE4?=
 =?utf-8?B?Wm1xaWpTQjdUbTVYQVJVRlhXNzZOMHoxK0ZwOFpUNGFNUmNtdVFrQ3pUcEsr?=
 =?utf-8?B?Y3hVbm9nalprWWZMZEl5b0FLcCttNlFhd1ZZUWlMOUtoMitzTDJSR2JVbFNj?=
 =?utf-8?B?ZU55NU5ncnRMMFdkWkMxcjdobnVsT3FUTEJuSE1TZUhRcS9uNTNmMXZRc1I4?=
 =?utf-8?B?WklRcjEwcHdMaDAwbUVGOElqTm9TUXgrUUZRbzYveVV3UzlHLzEyZ0lOKytr?=
 =?utf-8?B?WVJMWEZLZlp1UmR1NzhvUDY4RURYeis4QmZad0gwck5PdEhyLzlFZWQ3V3NM?=
 =?utf-8?B?UE5nR3YwRm1EeHRiZm9iZXJwampISmdmL3hLSFpYZWxlUHd0ai9wek1QS0dE?=
 =?utf-8?B?c0tCdGtsNUpmeC9tRS9wYWw0L0RpelovQzVUZnd0bHBzOTRRMzRvTjdyRUli?=
 =?utf-8?B?YS9Wd3FWSGtmRVlRR1FJeUhxZmFKVldWb1JiWWsydGRKNXZKUm91RHFNOFJE?=
 =?utf-8?B?TFRHTTF2NUw0U0RRcGMybzRjdzBXM3FUYlFBWENObHBnK1JsMlY2UnVCdXov?=
 =?utf-8?B?WFJlT1hIR05KSXgxMjJQa3Ztd1ZDdEdzeU5kYVlpVnBvODZON3lXMzhjbzky?=
 =?utf-8?B?YUg0NXpKT1BBczB5MG5QNFNxZHRLLzFDRFNlN1hDM2VtOGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFFQM3pUZmNxL3M1U0NTOHk3MnVMQUtTSENKWWdiUVQzNTVpZzBGbUp0dTM3?=
 =?utf-8?B?R1ZNcExVQzNrZVdZQ1ludDVMTm5jbHFDT1l0MTNoR3BaL2FINERBSWQwTzNp?=
 =?utf-8?B?TGd4VExJaGxKQzZyY2FaREUyb2pKc3NhMzFtUlFmZFlMNlMrWnBodmwyU3BU?=
 =?utf-8?B?cWtkdmFRc0IybE1qLzIzWjd6dE9jQTJzSlJOY0RoeVNkb3BSV3A1K3FOWGtp?=
 =?utf-8?B?eWRHd0lxSTNCU1pjQ3FGRDUzTGk1Uy85MmE0N2ZjTUx0ODlOWWEzbnB2MWIv?=
 =?utf-8?B?Ujh0RXlHZUJnREtJYStNdGQvRnVLdERTbGsyQ1A5V1pJeU1WeGo5OGF0T2VY?=
 =?utf-8?B?VEFCOTRzU3FXSCtnZlNVOU9LN1JKLzVCZHJzSmkwbStqN3k5OGhLT3Z3K29h?=
 =?utf-8?B?S0JRVFpHeTZmU0Z1WEdYZmdBUTcwYnpUOW1BaUxiL3JXSlpLY0RBenJnaWVr?=
 =?utf-8?B?RHhWQ1U1ZTlOK0M2UW1sQzlhSkxtbUxkMkhtQ2k0QlQvUXo4L2FGeWRPZlkx?=
 =?utf-8?B?QmZmdlNjTVV0VHFYZWlPYlp3b1F4R1RoYStKdktXUjlrMXBvYmY3N2ZST21t?=
 =?utf-8?B?MEV4UnpPZXdVWU8vUzJIUXhJN0NldVpsV0s4a1FBTGxYeTJXMkY2MmtIc1Nr?=
 =?utf-8?B?T3FDMlF4T3pPVWd6TVZscGtxenAyS0F0N1VzdU5Kd0VwQ2pwYzdrWWZycVd4?=
 =?utf-8?B?aDlRU2F0Qm11UFBWTGtENS93d0dpMmlrZzRSNjdmaUJBTW1KeXZzdXBiYW1W?=
 =?utf-8?B?OVluaHc5bHkwTTRVdTZNdEFhTy9zTXY0NlY0NUVaWHBIWjN0UUhyYUczamFZ?=
 =?utf-8?B?VFRYR1lBa29mRG9nU0Q5aGdpd1hLVzNBeGlXY3k0cWVZcjhNcElQY09WVlZB?=
 =?utf-8?B?TExPaHNSY05pUlRtWmxSSkU5S1p6Qk81ZzRTVUhRVEc0UzJWeVpXSlA2NHVp?=
 =?utf-8?B?WXYzcS9jM3FkMU1hSm5yU1RFbGt5SUVTUkJFNXFPZGd4aVR5Mi9YY0EzQWlJ?=
 =?utf-8?B?WWdXeDhQTlhENXpKZlFneFRSU2JTbTZoRUh6YmtyaHd4NXRtaEk5d2Jkd0Vu?=
 =?utf-8?B?d002WmplM05xU3JhR2U2ZVQ0STFTUEVmM2pYWWI4bkl2Uko1L3NONVc0Wkg2?=
 =?utf-8?B?WFBkK2hCZ1JrcklHeE1ueS9ZYktrV1g2eHUrUzRrMFQ3QTZaUXordjh1aHkw?=
 =?utf-8?B?NDVJdlQ2em9ZUUkrMUd2K3ZNMndkV05LMUxwbmxBUGdUTGJsNHZwdldBT0Z4?=
 =?utf-8?B?V2QremtPMjVMaUlGZzlyMkxKekdQc2ZsMXl1OTYzZVFPdnh0UlZ0Vk94clBv?=
 =?utf-8?B?VjdERjVDazhHQUVIQlJYNU9kcEk4R1Q4NmMxNjdtV2RDbitYQVVkR2Q5Qmpq?=
 =?utf-8?B?Mys5aXlISWl3L3hjbUwzTjV0anpQYXp0OWdqOFNuQTl3TVgzWkwvVUsyYmtE?=
 =?utf-8?B?cVE4NHFOdStKQTRFL3hZT1ZPcXcxVEJObnhNUEZaOXZFcW5IWWhwdGQxS0NX?=
 =?utf-8?B?b2FNMjFEN3FBZVQ5czVHR1hTeGUyRkN4ckoxVzdJUDZmb3N0MEZMN3IzY2R6?=
 =?utf-8?B?VU1FSFdZVnFHclFXckRvdldGb0JlNE81bk00TnMxcmRlVlpjQnRzbVNiNU9C?=
 =?utf-8?B?Zmd3RTZEKzgzeVZ3a3V5Y29INnRjUTVDQ1VYZTRhOFJkbk1TSjlscUlZR2x0?=
 =?utf-8?B?VHpsTllZQUtjK2lLMGpmU2t0b3czY0tNVTZUODJOekdGY0ZUeEJjRVVZUUZh?=
 =?utf-8?B?UHZyQ2dEbENEaHp0NGZJU1laa05CV0xkNFFpUlVJZ2dWeS9qUSswWG12TXZ3?=
 =?utf-8?B?Nnc4bXFVdGducGtsS2lQVXFkR2VXYjM0L01wcnQrNmZXS21EWVFxdTNuZ1o5?=
 =?utf-8?B?citSWFh2Mk1RVHpYK1J0RGJqN3hYajRETy9sSlN0Z3pUV3Fac2hjVHUrVENY?=
 =?utf-8?B?dFpkNnM5NWkyZjEyL3FRbE1uSVF1RkdkR1c4WlZGam05YnJvcUZmSnpKaVhq?=
 =?utf-8?B?SXhrTkd4TnB4OXo5MGo2U3lvRDkrcEVRbUtWNUEzd2MvRG00a0ZnbWUzd2FW?=
 =?utf-8?B?aWpUWHVXZ014bmVhSnMzR2lCS2dqNnBKR1FpaFZDeWJldUZSc2VpamFjOENG?=
 =?utf-8?B?aTJ5djFFdDU5SmVvQXlRYTQ1WHAxY1k5MlJqSWdnR0dlME9LV2lHdHZBM25G?=
 =?utf-8?B?dXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7993f2-8988-44c8-575a-08dd70528f99
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 12:50:05.4889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpCjNXWkHhCq3lTDSv98Hvtq05VMYPQ+ILuyvI9nDuRpHRhIboVbUgyW2iIYI6ZI4kn8ZTVe7XBy2RAQost/3ue5buioYVkgC96Jknpp/as=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12175

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDMxIE1hcmNoIDIwMjUgMTM6NDUNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyA3LzldIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IEFkZCB3cmFwcGVyIGZ1bmN0aW9ucw0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgMzEgTWFyIDIwMjUgYXQgMTQ6MzUsIEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPiA+IE9uIFR1ZSwg
MTEgTWFyIDIwMjUgYXQgMTI6MzYsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4gd3JvdGU6DQo+ID4gPiBFdmVuIHRob3VnaCBYU1BJIGFuZCBSUENJRiBoYXMgZGlmZmVyZW50
IHJlZ2lzdGVyIGxheW91dCwgcmV1c2UgdGhlDQo+ID4gPiBjb2RlIGJ5IGFkZGluZyB3cmFwcGVy
IGZ1bmN0aW9ucyB0byBzdXBwb3J0IGJvdGggWFNQSSBhbmQgUlBDLUlGLg0KPiA+ID4NCj4gPiA+
IFdoaWxlIGF0IGl0LCByZXBsYWNlIGVycm9yIGNoZWNrIGZvciBwbV9ydW50aW1lX3Jlc3VtZV9h
bmRfZ2V0KCkgYXMNCj4gPiA+IGl0IGNhbiByZXR1cm4gcG9zaXRpdmUgdmFsdWUgYXMgd2VsbC4N
Cj4gPg0KPiA+IFdoaWxlIHRoZSBjaGFuZ2UgaXMgZmluZSBmb3IgbWUsIHRoZSBmdW5jdGlvbiBj
YW5ub3QgcmV0dXJuIHN0cmljdA0KPiA+IHBvc2l0aXZlIHZhbHVlczoNCj4gPiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMy43L3NvdXJjZS9pbmNsdWRlL2xpbnV4L3BtX3J1
bnRpDQo+ID4gbWUuaCNMNDE4DQo+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+ID4gLS0tIGEvZHJpdmVycy9tZW1v
cnkvcmVuZXNhcy1ycGMtaWYuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9tZW1vcnkvcmVuZXNhcy1y
cGMtaWYuYw0KPiA+DQo+ID4gPiBAQCAtNTE5LDIwICs1NDMsMTUgQEAgc3RhdGljIHZvaWQgbWVt
Y3B5X2Zyb21pb19yZWFkdyh2b2lkICp0bywNCj4gPiA+ICAgICAgICAgfQ0KPiA+ID4gIH0NCj4g
PiA+DQo+ID4gPiAtc3NpemVfdCBycGNpZl9kaXJtYXBfcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHU2NCBvZmZzLCBzaXplX3QgbGVuLA0KPiA+ID4gdm9pZCAqYnVmKQ0KPiA+ID4gK3N0YXRpYyBz
c2l6ZV90IHJwY2lmX2Rpcm1hcF9yZWFkX2hlbHBlcihzdHJ1Y3QgcnBjaWZfcHJpdiAqcnBjLCB1
NjQgb2ZmcywNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
aXplX3QgbGVuLCB2b2lkICpidWYpDQo+IA0KPiBTZWVpbmcgaG93IG5vbmUgb2YgdGhlc2UgaGVs
cGVyIGZ1bmN0aW9ucyBhcmUgcmV1c2VkIGZvciB4U1BJIGluIHRoZSBuZXh0IHBhdGNoLCBJIHRo
aW5rIHRoZXkgc2hvdWxkDQo+IGJlIG5hbWVkIGRpZmZlcmVudGx5LiBQZXJoYXBzICpfaW1wbCgp
Pw0KDQpZb3UgbWVhbiwgcnBjaWZfZGlybWFwX3JlYWRfaW1wbCgpIGFuZCB4c3BpX2Rpcm1hcF9y
ZWFkX2ltcGwoKT8NCg0KT3INCg0KX19ycGNpZl9kaXJtYXBfcmVhZCgpIGFuZCB4c3BpX2Rpcm1h
cF9yZWFkKCkNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=

