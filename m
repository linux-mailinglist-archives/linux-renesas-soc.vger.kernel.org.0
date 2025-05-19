Return-Path: <linux-renesas-soc+bounces-17187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0ABABB7FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 10:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4E50188863C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 08:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC780269816;
	Mon, 19 May 2025 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZurNQHg9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5437A4B1E76;
	Mon, 19 May 2025 08:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644984; cv=fail; b=Z2rS3+o0u3t46+xeK2yKxTEfseJB9Ys86UnZr1VJEctC2pvj1VAqXWUTffEX9kX6Z7F8sOpu6ZoBrQpCLPzaqzLWNFINVKnKWOl5wtmL9UF2IDm+3CeQF9JjVVSk8mVYMHx/SsdmqeeCMg74dcWD8mAOfOCoUlQZgP5vAitb+bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644984; c=relaxed/simple;
	bh=/lJXniy8S1BuRAXfRnVib0G4xmmj7U68pcul7vIjnms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kmkBI5U9NJ/vb0AOxsw63jWi5EJ4X0g9VeRxGEvxGVMFSoFcN6+x2wp0XHvilKd6uYa624kFEp09WGw/g2tMdbLvqpEdtZRMc/TymJmHE0sw+jCf/F5JtHG0iBuHjipUbgqd1/6hOInOOPyOK/EYi6K/1bMKl+2UHGiRFU3Qm9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZurNQHg9; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zU0Nzjiq02Dr8h/wJi1vrehoXJW9fwlmf3fUNbLZQI+pGX9BsJ1TAX4aO7Qx+41zuczHeP4JOGLQ2j8c3E61bJdCmqydmtICy0PYxW3hnKsnRrjHwe3KtWXCt8w55b5T/F/cGrBlmBPWJtngi8ahuOgAj/LMcF8tnqdySjrqY4ORBHEOKuGoe25d3oQqH53Jp624cqLnwMDDzrzHfDxxrOp7TqaWSXFAQ80CyKJwU7PS7GSiNemzJ1UNa6aiTsXXpOhzkvvxmn+bG/QG7iXP8pCxm7pSJvD4nqmFvAzBQDYaWUQxdR/4qyIHCQWISt6ZTI43biOx9gMHO7b7VfP/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lJXniy8S1BuRAXfRnVib0G4xmmj7U68pcul7vIjnms=;
 b=sm5amLVlSKStHKIdbS7AA/qB8G2iYHNOLLKvPi84I+QFgWutNifXYMthQfusKhvc9DGegTxuZQA+KKXdrGVIuUa3pHzCJ8w6bYPBMxs/Iy5sWWhMmYyT1+CSNx8apoxn7esm4Ft1m12HtMzNoh71KwCt9hLKLlGcSGS/raW0+1+R2MJ9aIbtZMoI9roj8SJg27PZkKeXDQGBA9Pb8SlJepDUngXHPCdy7esTPdTz8U1k5TscY4samwn96y/wxzfoDHIyfD9TpzlFur6R7Z8FDni2w/fqfptWTkNvvFQyX9Hu3496ap/757zoKzCDpZc5o/dnaSoseSrgWn+GIHY3og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lJXniy8S1BuRAXfRnVib0G4xmmj7U68pcul7vIjnms=;
 b=ZurNQHg9YJtZ8TAFM4UOrAx//Jn0TBWFShIWhEG8SDW+K9/Gpcguqn+1A6DIsaVlFl44X3ezVkdhUf5BjJSDoz54ybbStrlMcyTahmoiwgujeMKwSD/EwSDGtu49zxNe/mV40D6Pj/FRNl6GL2fd4Wu3yh4ZCeHSMFi6LPWo7WA=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by TYYPR01MB7134.jpnprd01.prod.outlook.com (2603:1096:400:cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 08:56:17 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 08:56:09 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Reduce I2C2
 clock frequency
Thread-Topic: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Reduce I2C2
 clock frequency
Thread-Index: AQHbyEFhxlcW+B+DbE++O5l+NkD+rrPZn30AgAAD9XA=
Date: Mon, 19 May 2025 08:56:09 +0000
Message-ID:
 <OSCPR01MB14647796989C230D7E1866C86FF9CA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <20250518220812.1480696-1-john.madieu.xa@bp.renesas.com>
 <CAMuHMdX3tmRsWH=T76UESxPO59uG=8di72FuSsV__hHNsmw_CQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX3tmRsWH=T76UESxPO59uG=8di72FuSsV__hHNsmw_CQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|TYYPR01MB7134:EE_
x-ms-office365-filtering-correlation-id: d5fbe0a8-9d7b-40b6-2302-08dd96b2ffe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cjdZRWJNcW9XVXBueXc5MHlpdnJIVXk0NXFYOXlOaHFTZEczMjduYzhyNTIx?=
 =?utf-8?B?Z0I1aUNjVng3djlCSCt2NUZLaDU4SHhtMmNhbU03TVFMTW1tcjZtK0poR1A2?=
 =?utf-8?B?NllmZlR5TWFxZTlnUUJRQmNvVU5QRXV2c3RxQUVITHVYK2MzRGdvUGRPTkxr?=
 =?utf-8?B?MDNZV0RyZlp3QTJtRlVWSmovbnhuT2lwZjRLdW9GVWtKZWtlRlJSUGhLdEps?=
 =?utf-8?B?UUtnY21OWisrNDcvSUJQWDI2MzRYblVpUzN6UVRnUk15L1phak1leFNUeVRq?=
 =?utf-8?B?YTVMWFFzYkI1bnpNcitYakEwdm8vblYyaUZMVlVTbWMvR0NOelBMMXF5Y1Fu?=
 =?utf-8?B?Ui8vamlicEExRnN5cXZIOTNjUkNUeDIwZEFPc2pMUS9IMVN6TmxWa0VhL25v?=
 =?utf-8?B?NVBNVlFub0RIZ1VwVWpZQmpYVjZKYXdVd1JJMGNlSUJsaHc3QXIraTdnd1VX?=
 =?utf-8?B?MlRVVENQMXZYcldrWjV5ZUdQRFZQLzFZQ0FmU3NQTDBvM1VUVFRQUFU3N3JC?=
 =?utf-8?B?SWVKdkZOSUovaFFSQ2NNbUY0SGZSek5XVzRSUzF0dmdQdk5OUXJDMWF0Wi9l?=
 =?utf-8?B?SVpFZVNMK0lKeFp2ZU5hMHdqK3djTThLMkxQN0tQTUsrMGNQSG1rTlVOREQr?=
 =?utf-8?B?dlZlTmdBRVN2UEk4RXdsSitFQksyT2VJTnowUmFsdHRHR29lazVmUVFJYm9L?=
 =?utf-8?B?OWtXcSt3REVlWkZMSU0yREp4NTAySGhaTS9aVUNKbWYySWhHZGJyc2s4YjlP?=
 =?utf-8?B?emRIM2ZVOWM4Z0FWU0hqUzlKWmhvMCt6VUFOQS9xdEVOZTI0bC85dWRTdFVR?=
 =?utf-8?B?cWsyMnB4S2RwalVpTjRxeVUwNmJraW5NYTFDeWptYzR0WFZWRDVBMUI1b3FJ?=
 =?utf-8?B?OVhKRVF3OU56eWNoK0EyK0UwN2NuTVJGUHlTNHRRVzBmNUtCdmd2eU9hbno0?=
 =?utf-8?B?MnRteFZzdXQraS83dDRuQmNLaXlhdDgxRmtwTzFuOHNNT0lmYnVGdTlKcmNI?=
 =?utf-8?B?ZlRmWkl5SWxkY2VDMmtLblQ1V1BJRHhJb25YKzRWKzNuaGlqN0lDZ2JVaGZl?=
 =?utf-8?B?cWZnekJtbkVaUUV6SlltUEIvT05qU3J0bFZWOWY1YkdhcTEvczYrMGdjNHZi?=
 =?utf-8?B?bTVKWnBGTU9HbDZEb0wraGo5RTZOQXE0V2Q2SDNuamJDdVdBMEJKYTd1ZUNl?=
 =?utf-8?B?K0JydWd6SXdLeVNwRUhmSDF1cnlUTGtoZUdUbVNwanZYdlVibDhMaEpISkxk?=
 =?utf-8?B?K3JOZTBrTThKZGFiWHJZUDFvRlNHQy9LcVZDUlZJNi9vYm93ajV3K0MxWTdx?=
 =?utf-8?B?M2c0dzlQeVJFYWlkNkszNnV5SkxtamJEajRIQnpDd2dQU25LaW94QjBTSDB4?=
 =?utf-8?B?Q0hUOERpditrVzNsZlNCbHQyQ1ExT3pnOThZenhYRUVVV2ptQmtESU5RT3p2?=
 =?utf-8?B?LzhJZTUvSmIxTWN5TmQvQlJsVVQxSW1vcDdtQ3lkejg4bHkwME5SSmU1NVR5?=
 =?utf-8?B?Y3Z0UjBPcXBqRVpSeG16N2pyZFVDL09vME9xZTV0ZWt3aUJYcGVNTGdFc2oz?=
 =?utf-8?B?QUlMOURHUWp5MFVROE1uNkwxVkVoZis5dHJsN0RMY09GNk1uZktVV2xwbDZy?=
 =?utf-8?B?ZlJjdFVpaXNtOWVXWGFwV1ZNZ0JKRzNOTjJ6c1VxV1VUeFlxS3I1a09ydDZC?=
 =?utf-8?B?RDhUK3BFR29wY3VTYkc2SWU5M0hpRytpajBWSi9QUlc1aEg2WEVpbGJod25T?=
 =?utf-8?B?WDBEY1U2NmRLMFZDM1lzME9UNHE1cjFmL0YwazBEUUdzaWwxMngxRlc2Zldi?=
 =?utf-8?B?Y01QSHdsUmdsbC9oQWJDTHlBb2t0VjJON3JmQzViaS95TmtrOGFVUUR0MmNS?=
 =?utf-8?B?WlJIVHd1U2x2Ui9YNHJ2anExNnpENW15TGVrSVZ5WW9mejBIN05ydHNUb1ZQ?=
 =?utf-8?B?Y1VjbG5ZdVNmS01OTUw1aEM2U0JhVWxqa3NJVVNLTXRLSlJTOWJzVDV2dEpx?=
 =?utf-8?Q?ch37LXxzmFNJtOeo+sUxobadad7Lic=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1o5UzJ1eVBRemZEelRGOHB4dW9idmgvNXBaSEcwTHYwUm05MzYwMVJCWGIr?=
 =?utf-8?B?QWNRU2JockNFRDRXQTVwUDZ4bzFLRmJzeEhTYVc4bzlMUWxkbHE4NnlRdGg5?=
 =?utf-8?B?dU52TVVNWWQ1ejg2a01jaFBTWjNaVTJLS084eitxbUt5L0FBdVkybjRrNHAw?=
 =?utf-8?B?VFo5N0lxZEErWEtVR3NaOEtDZ3dLamcwa2MxeFZQNVBVdmpBb2FIYWZqYmhi?=
 =?utf-8?B?Nm11VnVYZEFGcG5lNy9IaFJZdmZ5c05NbzhrSmhhOGI0WHZ6K3lud3cyajVS?=
 =?utf-8?B?eEdsODhoQytvN0ZKNjRxRHh4SloxbzB0ZGtaU1M4d1d1S1IrcW5mRk9udUVz?=
 =?utf-8?B?aGdTcVkxQjNndytubWpnVldPUE1JOHd5SnRxb3ViOUlBQm5VcFVQdyt4V2Fs?=
 =?utf-8?B?TGpFcUNWcFVpa1J2dmlQWTRkS0MxMnhsTGFFTkdobWMzQ2NnQTZXYS96M05q?=
 =?utf-8?B?U0NrdVl2WGJET042K2ZKeHc5YTRIL3RKYzUxN2tHdGI3SVBjZWFSc3JXRzBW?=
 =?utf-8?B?RGtGdUdYUGw1U1h2SGlRWWFJbTRxUmVuUHRHVjMrMWhRcmd2Q3pFTUxpVHA5?=
 =?utf-8?B?K0dXdUF5Nnh1aUxWN2lOYTMxUzN3WEovSHQ0RmdLcEEza2ZFUEc0Q3RKOGJ3?=
 =?utf-8?B?OVhIcWFzQnlKYjRuZmJiTm9HUFRCTm5ua2k4bmRubTY3NEtna2RXMWh6TnRT?=
 =?utf-8?B?SFNQNHlUNzR0Zis0V3dBOVlvbHlzU1lKZ1pwcitxSjE3NWVISjJjVGNUTlk3?=
 =?utf-8?B?ZlhTKzVCWXppdCt2NUJsWnhmY2RRNmFzK1Y5bTdFZmdKVm9heDVDVEF6RmVS?=
 =?utf-8?B?bTU5WTNOclNicG05aHd3cHhGdUR4cklkMlM1Q2YwdmgwWlc5Nmk4SkVoaWFY?=
 =?utf-8?B?WjhpdDdYSzFnODQzemRTNExCWkFrNHR3aldmUkRBQXZrMkp5MlhqSjYyVGVk?=
 =?utf-8?B?VnJreWNiZXVINElDYXpzdk9lTkdFVG9qSEJuOXlobU9sNkNFY0FHK2hLanhw?=
 =?utf-8?B?dHlTUGxtQUtEQ3JQbHZmaWZxNzhnK0M1VFNSOXNJamswK0RWT3BvcmRDWEEv?=
 =?utf-8?B?MUJqWTBsSDA3a2sxZmlEMnZnNFBNZlpCbmZVWnZpUndWbHQ2YUVQZjF6dFFy?=
 =?utf-8?B?NncxMVZITUdHY0xTdy9KQm9JakFnTFJYM2dsbm5BRnhKblF5KzFZM04ya1V1?=
 =?utf-8?B?ZGZqZ0R0SnA1dTgyZG96Mk5qeHVFT0daVUxkZTJ3cWNRSlVickVwNlA4bm5F?=
 =?utf-8?B?RjlYaUZwMEUwMm9lbFgxQkJIdW56ZWdvU3BLMmdEM0hKNzk5VE0rMGo4RGNQ?=
 =?utf-8?B?WTQzVnpYQjBraXVtL0hFQ1NkWm5VMXZoUnM2bjcvbmZ4eWtoWXJXZk5Ga3JD?=
 =?utf-8?B?YmdrRFo1QVE1cTFTRStLZEFNQmUyanEyQTA1RnYvUmtXZHZ1cTkzV2ZDTVZm?=
 =?utf-8?B?WWpkZ2todDNYMFBEdzhzY1N2TWpidVErNGd0M2xpelpEZG5jK2pvTkhBeDFM?=
 =?utf-8?B?a1pvQndTdnRxVDA0MmEzcmxGUktaZGlkaGdDZ0ZTMTdMc0VpV3Z2SHNyang5?=
 =?utf-8?B?QWJtbnhoRVJoVTdsbDRjRy9ibDgxSnIxMHlVR3pNakJYdlVpSUV2K2hpZFh3?=
 =?utf-8?B?MkhsZlNpT0dObmNMQnhOSGd2bllKMnJTNElWNVZkcHVNYmU5MTJNMlQ3MEx6?=
 =?utf-8?B?cU44ZFdyQjlVS1dvR3BCb3RvUUxmWm95QVdQdVR4RzkrMkJocmdRNVA5YmNw?=
 =?utf-8?B?ZFd2VWgwVFhXaWl3UktXTVVvL3FQdFp6VWxkejhEY0Q5THJ5WWU3ZFZWeUpS?=
 =?utf-8?B?ejZpVUpIelRRSjVpQXhhNXRENlpGNWVzVnFibjZ1NUl1RE5nemRyQytEY2ov?=
 =?utf-8?B?dDJ1Q3BHRktBdUtPN1RrR3crOEhwSklXbFVrck90MWx4T1lmVm1RTlJBK05j?=
 =?utf-8?B?a0VhaWFxTVAveHR3K3k2QWNscm44KzFlT2xMQ3ZhNE9mK21kazhWaE8wcmFS?=
 =?utf-8?B?V2ZpeEhNTWNTc2J0K0c0N2VvbzJ0cWc4bjBKelJmMkdITFZMb3VJRno3a09J?=
 =?utf-8?B?ZkpnRTAzNW9FT2cxSkZCUnozMnlVSVRGNG11TTVQSy9aS2U1UTNzd3NmSVdm?=
 =?utf-8?B?WmZ0bVh0cDRsT2lyemZMTXhtUWFqSUxSSlhqUUNja09mYkp1NHp6dGptNkxa?=
 =?utf-8?B?bFE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14647.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fbe0a8-9d7b-40b6-2302-08dd96b2ffe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 08:56:09.8067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /FKnVsV0XdXPN+M2o9QzxHeeLLwEUbYLxebscZp0intMIN3EHLqUiVsByPIOCDC+V/xvS05q2FxsxPinLBvh0cbZTqrAZTTfJDwSLg33Ewg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7134

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBNYXkg
MTksIDIwMjUgMTA6MjkgQU0NCj4gVG86IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5y
ZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gYXJtNjQ6IGR0czogcmVuZXNhczog
cjlhMDlnMDQ3ZTU3LXNtYXJjOiBSZWR1Y2UgSTJDMg0KPiBjbG9jayBmcmVxdWVuY3kNCj4gDQo+
IEhpIEpvaG4sDQo+IA0KPiBPbiBNb24sIDE5IE1heSAyMDI1IGF0IDAwOjA4LCBKb2huIE1hZGll
dSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IExvd2VyIHRo
ZSBJMkMyIGJ1cyBjbG9jayBmcmVxdWVuY3kgb24gdGhlIFJaL0czRSBTTUFSQyBTb00gZnJvbSAx
TUh6DQo+ID4gdG8gNDAwS0h6IHRvIGltcHJvdmUgY29tcGF0aWJpbGl0eSB3aXRoIGEgd2lkZXIg
cmFuZ2Ugb2YgSTJDDQo+ID4gcGVyaXBoZXJhbHMuIFRoZSBwcmV2aW91cyAxTUh6IHNldHRpbmcg
d2FzIHRvbyBhZ2dyZXNzaXZlIGZvciBzb21lDQo+ID4gZGV2aWNlcyBvbiB0aGUgYnVzLCB3aGlj
aCBleHBlcmllbmNlZCB0aW1pbmcgaXNzdWVzIGF0IHN1Y2ggYSBmcmVxdWVuY3kuDQo+ID4NCg0K
VGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3J6ZzNlLXNtYXJjLXNvbS5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3J6ZzNlLXNtYXJjLXNvbS5kdHNpDQo+ID4gQEAgLTg1LDcgKzg1LDcg
QEAgJmdwdSB7DQo+ID4gICZpMmMyIHsNCj4gPiAgICAgICAgIHBpbmN0cmwtMCA9IDwmaTJjMl9w
aW5zPjsNCj4gPiAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gLSAgICAg
ICBjbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwMD47DQo+ID4gKyAgICAgICBjbG9jay1mcmVxdWVu
Y3kgPSA8NDAwMDAwPjsNCj4gPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPg0KPiA+ICAg
ICAgICAgcmFhMjE1MzAwOiBwbWljQDEyIHsNCj4gDQo+IENhbiB5b3UgcGxlYXNlIGNsYXJpZnkg
d2hpY2ggZGV2aWNlcyBvbiB0aGlzIGJ1cyBkbyBub3Qgc3VwcG9ydCAxIE1Iej8NCj4gT3IgcGVy
aGFwcyB0aGlzIGlzIGEgYm9hcmQgbGF5b3V0IGlzc3VlPw0KPiANCg0KVGhpcyBpcyBtYWlubHkg
dGhlIGNhc2UgZm9yIHRoZSBHcmVlblBBSyBkZXZpY2UsIHRoYXQgaXMgcHJvZ3JhbW1lZCB0bw0K
T3BlcmF0ZSBhdCA0MDBLSHouDQoNCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4
ay5vcmcNCj4gDQpSZWdhcmRzLA0KSm9obg0K

