Return-Path: <linux-renesas-soc+bounces-27968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO+gHBaChWnpCgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 06:54:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A86FA7AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 06:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FA753001CD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 05:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0E52E6116;
	Fri,  6 Feb 2026 05:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M78aU44N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08742E54D3;
	Fri,  6 Feb 2026 05:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770357264; cv=fail; b=Klz+adD4QtjDBmHEHNsg4bMSZvcAmC5Gx2TKjtQBqEHzMBB021qy60TSX1YaS2BtsS34yPESh03NPIfnYqjFHUpmS1ZJekf3SamfNUaEW/7mHnmpCek50jFAvOSZHwPnWZSOB9sTpxQXYnrztL1GuPNVXDV9bWcDqU+UvCukCJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770357264; c=relaxed/simple;
	bh=UToKpu/k0hp4RvDA7ARW5axR6ZA2Qkpl1cYv+STKdGY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sn8SDtZqxmrYZ0j2qmuzAgr/05iR4REmaQxj0xl4n0+amULQ0t8msMo56nkycFDQ+BsUPVgbckb/SCtAbqSLHfWfWSWGDo9YsbuXd/Ni4rRqq+ouotKoL+8OyKGD3uslXDedUlAMgTTrbqNn7v3tZX2Chgyenr6SW8PN9ebZZ8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M78aU44N; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZodA9DQK4dU0hRNjvGdZUOQlODc+uHWEShs5GhyvoOW3bm7QdE3rF/52no0rIZOoE5K9TkP9stV8dkolRkhvIbXorhxqAoyeLX5Fj7LZu0IxgcYSW9aG4y/7M+AqVpIPBPyResiVg2ws0QJTgLibYS2RjpQDsByF8d5BqQuZ7F9/YkbFkqxYjkHynlTbULyjYMIPZujMcw4Wd0NUN+bfo382voeu3CzfmDhFo+FA0hj2hbTRlwilk3UE66ns4PCq0Q8I24ubyuk3Ch1JxhnJL3C5tnHL9fw4dCZPFEPKX325cuQ0gdNlysbV1fP1o2x4PeKzAxb9O/cogr6tjMNQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UToKpu/k0hp4RvDA7ARW5axR6ZA2Qkpl1cYv+STKdGY=;
 b=rRtMuxuuNVeVQjDoUA1RwxR8GrpTx1R1fDVrPu4/xmd3Jv1Rs2/Yp8ZXx9y5Y/0ZHFZ/LIscNfpFrDif2gDfGyPUaPxl4L2pxia7zwtOpg3QlUwg9Nj8aWFl1WOxmTx0EIMX7dcle9VMhRDcbFkJMJKVtnXDiSMy9PgQFISUXaMhpIA/DxJiast94LNljqCL6BMQRJV5GXSvWsvFupsEtJb2T5tDXAazobEV0RMQ8dvzDJEdCrJvvfm+b8fjJ6bAsJ/BDzm8rHxzsNRhSmQb7eEu0wH1cTdr33wgFo/X6ITkAvok9uKrpcS8N9T0oqfKL/r6L2+Z7nPczVcJx1TCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UToKpu/k0hp4RvDA7ARW5axR6ZA2Qkpl1cYv+STKdGY=;
 b=M78aU44N93aQy2Tmf3GCfNJ5fcuFa6OiNUpUsJS5EiiHsL/tc6AAMz2/K3vpLrYuQHpTcYp4kFBZp1iS+4X5sN2/uvRd6Dgcgr843yjaupaGBazVysnKS7vSgpqGlmPOJ2roE+dEg9nNvajTANPQ8s7z8kqjg0Yi6tSW1vDD1Ys=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYWPR01MB10612.jpnprd01.prod.outlook.com (2603:1096:400:2a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:54:17 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 05:54:17 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christian
 Mardmoeller <christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>
Subject: RE: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Topic: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Index:
 AQHclm8qD3lunnbaf0uAuh27IRHtALVzunqAgAADMACAAE+JQIAAD2EAgAAA0hCAAARnAIAACY8QgAACvYCAAAZFgIAA9+aA
Date: Fri, 6 Feb 2026 05:54:17 +0000
Message-ID:
 <TY4PR01MB142823B7BBDE92603467F6AE88266A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References:
 <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
 <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
 <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
 <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
 <237bee8b-a7cf-4c14-9946-8bf72dbddde5@cogentembedded.com>
 <TY4PR01MB142829EB0EDDE13B588F949298299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <a4cfeba2-23da-4fdd-870b-6533b5ce267c@cogentembedded.com>
 <ff475397-8894-46e9-858a-78714c5b4bd5@cogentembedded.com>
In-Reply-To: <ff475397-8894-46e9-858a-78714c5b4bd5@cogentembedded.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYWPR01MB10612:EE_
x-ms-office365-filtering-correlation-id: 4e98d4f0-ccbd-4978-21a1-08de65442a4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TTZkWmVSU3BYTDN6dVI5WkI4anhSeS8xRkl3VjlTRTh4b291L3BReTg2NWZa?=
 =?utf-8?B?dE5TQXRnVzdmR1gvVEdPZ3Y0Zy9VZlpkYWtRak1URkdQbnc2Ty92SWlQWmNt?=
 =?utf-8?B?THdWNGhXOU84WW1NN2N0c1dvU1BLMENnS1JwWnBTWkJGTXZKTCsrcjFjSTZn?=
 =?utf-8?B?dG1MTFd0SHRKZVBKd0l6VjcyZ2RBekkwYUtKaHVqQksxMkhYdWFxKzJPM0Yw?=
 =?utf-8?B?VDg5L1NUTTZTVTFiQi90ZmRIMU1HNThZRGltWEJOWFF5N0RRV1RhM0c1TlRi?=
 =?utf-8?B?K2ltNllOV1lGcjVzczJEZ2d2NlV4dWFJTTBEVEFoYXhwd2lBZkZhODltOEov?=
 =?utf-8?B?eURWbWZZYVNaWWkzTFFKUlk4Znc2Z0tWUEVjS0lJQmRxcUtUUDFTZlNCVGta?=
 =?utf-8?B?VzZya3NlL1l4aERSM1o3VWY2aG8wZk16QzE2NCtCNEpadk5DN2pJY2N0THM2?=
 =?utf-8?B?MzBCcE50RTJ5cGtqbWlLU3hWcHRLRnZNOUxjcnI2eUJrWFBydmtWZkZzaHEv?=
 =?utf-8?B?RVA1ZTdUNGU2ampWeTF3b2wzbGlVR1lZUm1xSktUTGdub2wwc0hYS09QSWJ3?=
 =?utf-8?B?dlpCRGM0dG9YMzdGaFIzRWVrWm5VTktqZjZXR0RobzNXS0k3eUhqaWwzWmFD?=
 =?utf-8?B?NENqQnV0bU85bm1wY25PTkZDbklnWW1BUk9rSXN0MlR6NUNucjNXQ3JNZFNz?=
 =?utf-8?B?VFNDSGRCU2NtOUo5ZXp2a1p6ZEdwakRlemdLdlZRMjdmRjdDSVlOYUhjY0Zn?=
 =?utf-8?B?WWU5enVpZWRhbkhJVzBDUWNuNFh5bzRzNEdra015WW83aVFJVWE1QTlXSncw?=
 =?utf-8?B?LzVYMXFoV0NGVXp6WjByNWJLVCtrdEl2V1NVZ2NsYnJESmlRc0Z5c2t4bCtG?=
 =?utf-8?B?T0NUSFhDTDZBY1pnaGpES21iSEZsVzdmTmlaOEVrbWVic09admQyZ1Vpa1By?=
 =?utf-8?B?L1lpeU9qZjR6S2NFaUxhREtEK2g2eG0xSlF3R2psK2hoTGxHWTVyb2QvRDBm?=
 =?utf-8?B?dFlXd3M4NXRFQjhqRjFLdjBPaC9PdWluNlNkaDBBRml6Y3Roa25ZS25peU14?=
 =?utf-8?B?a0NCWTRpM3FhMlV0SERKVjdaaG9paENXYnpBWUlwMEg5Mmx3TkxUMjBSc3BH?=
 =?utf-8?B?Z1lEalRJNEV2b3g2UU9yNEIrMnZjUFZGSVE4L1UzMGMvaXF3SFdXeWFyNzhk?=
 =?utf-8?B?bFpnc1hydnR5aVBabVFLVTBRaUxIVWZyVnBjQWVQbEsrejRIOUJyNFVFZE5j?=
 =?utf-8?B?emN2L1A2eGJmZU9TUlBlUURPbDRKajNmWG1nbG1NNDBkRjFZZjlNdktMU01x?=
 =?utf-8?B?R3pseE43MjBvVUM0SHVjR2FPWUtQK1E3clJhWEdnK3lkdVMra1VyZXE3SEdC?=
 =?utf-8?B?YTVXOGNFUXplSUxiQVhEN1RxYTRDZEhtTzUxcEYvRXozMnpTOVZ1Ukt2UkIy?=
 =?utf-8?B?czVBUXNKZjUrckhidXZDdkJTdmpORFdIUWNhYkZZSTgzYVJUTzZvWitabVJ6?=
 =?utf-8?B?ZkhmL3k2SlN5REdVMjlyMHBkOHdlWkpVRU1zRTAwT29UMGpVV25QdXovMDRq?=
 =?utf-8?B?R285dzdjdkN0Vk1pVC9JRE85QUttUEMyZ0tSbjdhWUR2ZGVTVTkyUkJnTXg5?=
 =?utf-8?B?RUUxREZqcDcrVndvTS91N2RYa3VOWTFSTTFML08zQys1azFvTk8wcW0weU9M?=
 =?utf-8?B?VlZBVVlWUXU5L0lRYlpWSXgvalFXMDRCT0N1R1FKK1JDWVNENFNjb1orZGt1?=
 =?utf-8?B?WlIzb3ArZVpiNGUzSElmZldjU1lSNGV0dUxIcXkzejAvNGErVWgwTmhQcGJ6?=
 =?utf-8?B?NStUeHhDcWtHb25HaFlqOUVEN3A3QnE1UERVR20vSTRKVjNJV0NsR0lWM0JG?=
 =?utf-8?B?cHRRdXYvVGpwME1IeEhtcHhaQjZudjA5VExDbEY1emlwcmtIL2NBbGNHV3hV?=
 =?utf-8?B?d1lib1hoSlh0czFHMTk4SE9UMGgvRVVPWXdZRTQ1U0MxR3pNQ0VaMlQ1SVRE?=
 =?utf-8?B?SHhMSmpkMFdYblJYUjdBTDlGVlVKM1J1L3JpV1B3S0x3OEdraldGYmVlZ3gr?=
 =?utf-8?B?WGpqalhzTndhK1ozWW9rdjg4NWdwdFV2NVZwMDZiMUc2dlF5dE5COFovZTFu?=
 =?utf-8?B?UlZtNG82d1JVSGcwaFdLZ2hrWitXMmxWUEtJYnNNN3NDYTFTVUgwVzU5S04w?=
 =?utf-8?Q?t8eybMxcIZs2DgUEsfNXSgs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHZ1eHh4MHIyMFVic2x3QzZ0aUdpT2poWktJaWQyaW9mZnZEMHhkd3NzVkJm?=
 =?utf-8?B?M0hGVkNHMXpwRmpnS3lHTHZwLzBkRU5DbTBwVllNMWg3bm8vUnRjKzVSQ2FE?=
 =?utf-8?B?QVJiSWM3Vy9KY2lITTNvbVRJRlhZRGZVbU5NNy83dnRnL09DV0hJSS9XNXZZ?=
 =?utf-8?B?VkxRRTVXRlRHd3B1OGFsRlFZUVQxSm84aUpuME1sdVZGdENZdmFldEJSNmRB?=
 =?utf-8?B?R1h6Z3JaU20yakZDemxoSFpOdkx3YmVSRm8yZ0F3SGZLamVRekI4L1hPbnF3?=
 =?utf-8?B?UEdOMGhhejVTdHhkcU5sQVJndmdBQ2s4U29BWURNMWlGbUxuMUVLdFpOUHo5?=
 =?utf-8?B?Y2o5ZVFLZ3VDUUZFa1Z3eHBLY3dheWdaQmM2YksxN2xRa1A1MGZsU3czblNt?=
 =?utf-8?B?cDFiQVlLM1praC9vYjc5anpZb3BQeGJtU0JWZHkrYWJLQ3Uwejd5Q3cxa3FE?=
 =?utf-8?B?RFVJOHBKTkFWdFR2S3lQTWdFWEo4SG5zcmVnR0o2Yzcyb3lSa2pianpNREZu?=
 =?utf-8?B?RFNGeWQvYVdHRjNEcEQ2SzZvYjVuK3VrZVhwenQ1S2dXdjZVenc5aVZLbDlE?=
 =?utf-8?B?SFJVdVQ2VzVJelhRTHdqUnNaZ2tSU0djQUNSRTdsV2h6dU1wT2lCZXI4L3Vl?=
 =?utf-8?B?UExraDdQN3RBY2oza3JmakFLT3pFb1UwUE9naGh1ZWpja0toVUx1cXJ6SzUw?=
 =?utf-8?B?N1doWVB2S1d4WkxnWVRBN1JucUJxWEdzWjFBQlFTOUVXZmd2cjAxTGM3TnBN?=
 =?utf-8?B?TDRza2ZhR0V3YmFxVzNxNGtqRXQyU2M5TUNLZytoTjgyYU9NY0FJRS9mVHJX?=
 =?utf-8?B?WVRXNzhqS2FJNUZ4cVEyR0RJVDBteGhkdlJndThQeTVER1lVK0dDdTZpSEI0?=
 =?utf-8?B?N1NYbGlXZ2FIc3VNL2Vpc1lSREZlci9DNThZK0dUc1ZZR1RwK0kvaThEWElz?=
 =?utf-8?B?ZVV6U0Fkck1UYUJPd2FqTHloV1FCNklMRjFPZlh3OVBjaE51alVaeGFCVS9o?=
 =?utf-8?B?K2tEemZzSHdxL0ZPUFB2amdWTmh3ZkJxK21YS1R6Y3hkdnNFNlF6NE8vUWZz?=
 =?utf-8?B?ZFhDaitjY2ZzQlpkMndGV2FEYjBpalVLV0s3NXFrMDYrMDRhSklRbHYyam9o?=
 =?utf-8?B?aGkyczhGbCtzMTJCR2wyNVFHVHhJSU1EYWdyOE5TVFpqRWVKQUV1Sjh6dGNp?=
 =?utf-8?B?Q1k1dzFZK0NPbDB4bW9JaXNFMHEydDc5c0xvZGtlRjZ3cVhTZ2RnZEs4d1N3?=
 =?utf-8?B?KzVyekhseW0wUTYwWGc4dk5EaFpuV29IWVZrSmJmTnJaTGlUUGduVExpU3A4?=
 =?utf-8?B?N1VzZ3pudndSenpxTWU0cGQrTFExaGhkV0tWYXh1NE9vK3pERW1Pd20zVmE4?=
 =?utf-8?B?Sisya0VFMnl6clFSWjRtNjVyY09sMlk4czVuM3M4TExGSXIxV0QxeEJKKzNO?=
 =?utf-8?B?VVNIRVVkT2doZE9kVmhWdWF4aGx5c0ozcXVMMVZHV1NyQmU4cVNhYjQ0RzJu?=
 =?utf-8?B?bnYrSTdHQjYvam9hNDlvMzNOY2NJclFUNVFjU1ZSZVljMnBjZ3Q0YWVMeDlz?=
 =?utf-8?B?WmxZUXpBUHkzazVkWWplVnFoRFRTeG1FbEJ5K2hsSTdFcndFUFZXVVA3Qk9C?=
 =?utf-8?B?a0dWMVU4bkVZUzZPQzZlZ1NVSFBzNXI2OHFhWUhnSUpxa01RUlJId09BZWY2?=
 =?utf-8?B?TUZDdGNGY20zRFBBZjRrd1IxK1FXZmJVQlpVTktWRU1ZSmhqRDVqamRhR1V3?=
 =?utf-8?B?d0ZJNmM2Q2RWc1R4K21mUnpLbHR6dFNyRHczUjNUTktOd09KMHZOK0Z2QnB2?=
 =?utf-8?B?VjhJRWVGWFZIYXgzU3dhM3g1ZFdqbGgwazliMDIwcmxrQnFscmwwazI4K3hH?=
 =?utf-8?B?c0tsb0hucENVVENadUVhczRaTkVRL21OMGdXSTVhSnZBR0pSLzdUK1hhVy8r?=
 =?utf-8?B?SnFNZCtXanZHVEJqWU84d0NJM290S1dySzNHWFhKTkF0NFVsWXNWWHJ1dWZZ?=
 =?utf-8?B?SE03M3pKTnZxMFBqQmN4NXlmOWNvUXdOT0wwSkR1dS9lb2M0bVZRVDN3NXFF?=
 =?utf-8?B?S3M0VmVQTkZLTElpVEF0QUxUbStRc3Y4aXU0RGN3c0hrZEdkMStSbUZPYjlk?=
 =?utf-8?B?eUxPaGh2dlcxSE1heUZzZTFGRDhiMDZjbTNWZ1FNQnp4RHVHLytZYW9kQ3hU?=
 =?utf-8?B?VkViU3c3bGIwS1hVR2JWTXlNTlNxQ2RDU3MwOVk4RFhXVVZ0REY5VmpLRmlX?=
 =?utf-8?B?QytqZGF2ejF2RDhSWEZjZGo0d0huNUd4SDlhUFMvbDBnTU9BSEhBa0tWUm5Z?=
 =?utf-8?B?ajRvTFVvWmltOXJQcmxPcm9jd1dvSzNJZ2VEMXFsVFhjaWJwV1d1dz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e98d4f0-ccbd-4978-21a1-08de65442a4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 05:54:17.4551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Wzw1fIoXiCQIfrNeLgXpU6n2K8CG7W0lQtuv6wHQk3alMnLTCCqdc5Ghbdz1uCim2xwthV+FB8mfdQtVghsE45kTAmzE/oWuLqCocCednk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10612
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27968-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:dkim,lunn.ch:email,davemloft.net:email]
X-Rspamd-Queue-Id: 98A86FA7AB
X-Rspamd-Action: no action

SGVsbG8gTmlraXRhLA0KDQpJIGFtIHNvcnJ5IEkgbWlzc2VkIHRoaXMgbGF0ZXN0IG1lc3NhZ2Ug
b2YgeW91cnMuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlraXRh
IFl1c2hjaGVua28gPG5pa2l0YS55b3VzaEBjb2dlbnRlbWJlZGRlZC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBGZWJydWFyeSA1LCAyMDI2IDQ6MDQgUE0NCj4gVG86IE1pY2hhZWwgRGVnZSA8bWlj
aGFlbC5kZWdlQHJlbmVzYXMuY29tPjsgWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGlt
b2RhLnVoQHJlbmVzYXMuY29tPjsNCj4gQW5kcmV3IEx1bm4gPGFuZHJldytuZXRkZXZAbHVubi5j
aD47IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47IEVyaWMgRHVtYXpldA0K
PiA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT47IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+
OyBQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+DQo+IENjOiBuZXRkZXZAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBuZXRdIG5ldDogcmVuZXNhczog
cnN3aXRjaDogZml4IGZvcndhcmRpbmcgb2ZmbG9hZCBzdGF0ZW1hY2hpbmUNCj4gDQo+ID4+PiBU
aGUgZHJpdmVyIHdhcyBvcmlnaW5hbGx5IGRlc2lnbmVkIHRvIGVuYWJsZSBoYXJkd2FyZSBmb3J3
YXJkaW5nDQo+ID4+PiB3aGVuIG5vdCBsZXNzIHRoYW4gdHdvIHBvcnRzIGFyZSBpbiBmb3J3YXJk
aW5nIHN0YXRlLiBXaGVuIG9ubHkgb25lIHBvcnQgaGFzIGh3IGZvcndhcmRpbmcsIHRoZXJlDQo+
IGlzIG5vIGRlc3RpbmF0aW9uIHRvIGZvcndhcmQuDQo+ID4+Pg0KPiA+Pj4gTmlraXRhDQo+ID4+
Pg0KPiA+Pg0KPiA+PiBUaGUgY3VycmVudCBkcml2ZXIgYWxsb3dzIExpbnV4IHRvIHVzZSB0aGUg
YnJpZGdlIHBvcnQgYXMgbG9jYWwgcG9ydA0KPiA+PiB0byB0aGUgYnJpZGdlLiBUaGUgb2ZmbG9h
ZGluZyBBbHNvIHN1cHBvcnRzIHN3aXRjaGluZyB0cmFmZmljIHRvDQo+ID4+IExpbnV4IHRocm91
Z2ggdGhlIGJyaWRnZSBwb3J0LiBUaGVyZWZvcmUsIHRoZSBvZmZsb2FkaW5nIHNob3VsZG4ndCBC
ZSBkcm9wcGVkIGlmIG9ubHkgb25lIGV4dGVybmFsDQo+IHBvcnQgaXMgdXAgb24gdGhlIGJyaWRn
ZS4NCj4gPg0KPiA+ICJPZmZsb2FkaW5nIiBtZWFucyAtIGZvcndhcmQgYSBmcmFtZSBmcm9tIG9u
ZSBodyBwb3J0IHRvIG90aGVyIGh3IHBvcnQNCj4gPiB3aXRob3V0IGluc2VydGluZyBpdCBpbnRv
IENQVSBxdWV1ZS4gT2ZmbG9hZGVkIGZyYW1lIGlzIG5ldmVyIHZpc2libGUgdG8gc29mdHdhcmUg
YnJpZGdlLg0KPiA+DQo+ID4gVGhlcmUgaXMgY29kZSB0aGF0IGFsbG93cyBvZmZsb2FkIG9ubHkg
aWYgdGhlIGxpbnV4IGJyaWRnZSBkZXZpY2UgdXNlZA0KPiA+IHRvIGNvbm5lY3QgcnN3aXRjaCBw
b3J0cyBkb2VzIG5vdCBoYXZlIGFueXRoaW5nIGVsc2UuwqAgSWYgaXQgaGFzDQo+ID4gc29tZXRo
aW5nIGVsc2UsIG9mZmxvYWRpbmcgaXMgZGlzYWJsZWQgKGJlY2F1c2UgdGhlcmUgaXMgbm8gd2F5
IHRvIGtub3cgd2hlbiBhIGZyYW1lIGNhbiBiZQ0KPiBwcm9jZXNzZWQgd2l0aGluIHJzd2l0Y2gg
aHcgd2l0aG91dCBzZW5kaW5nIGl0IHRvIGNwdSkuDQo+IA0KPiBBaCBJIHNlZSB0aGUgY29kZSB0
aGF0IGV4cGxpY2l0bHkgZW5hYmxlZCBsMiBvZmZsb2FkIG9ubHkgd2hlbiBhdCBsZWFzdCB0d28g
cG9ydHMgYXJlIGFjdGl2ZSBpcyBub3QgaW4NCj4gbWFpbmxpbmUuDQo+IA0KPiBTdGlsbCwgbDIg
b2ZmbG9hZCByZXF1aXJlcyBhdCBsZWFzdCB0d28gcG9ydHMgcGFydGljaXBhdGluZywgYnkgZGVm
aW5pdGlvbi4NCj4gV2hlbiB0aGVyZSBpcyBvbmx5IG9uZSBwb3J0IHdpdGggaHcgZm9yd2FyZGlu
ZyBlbmFibGVkLCBpdCB3aWxsIGdldCBlbXB0eSBhbGxvd2VkIGZvcndhcmQgZGVzdGluYXRpb24N
Cj4gbWFzay4NCg0KWWVzLCB0aGF0IGlzIHJpZ2h0LCBidXQgdGhlcmUgYXJlIHN0aWxsIHR3byBI
VyBwb3J0cyBpbnZvbHZlZCBpbiB0aGUgSFcgZm9yd2FyZGluZy4gVGhlIHJlbWFpbmluZyBUU04g
DQpwb3J0IGFuZCB0aGUgR1dDQSBhcyBpbnRlcm5hbCBwb3J0LiBUaGVyZWZvcmUsIGl0IGlzIE9L
IGZyb20gdGhlIEhXIHZpZXdwb2ludC4NCg0KQmVzdCByZWdhcmRzLA0KDQpNaWNoYWVsDQo=

