Return-Path: <linux-renesas-soc+bounces-15982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B19A8989F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 11:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0A63188F938
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 09:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918DF27F728;
	Tue, 15 Apr 2025 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="X9ZRbPAP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A131F3B90
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Apr 2025 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710646; cv=fail; b=VgslA7I1OWxGFzZnaCNT0gVBSfbbxAXTZdkgpL7OaW5IQVEF42HzFcsAO9RqZslgwi6GPMULMeEC/DIhrYYZcOfxEvByAonjBs7EilxoSq0Z6+a+laFGMnCLyzZ5irq5A4HX9Q7ryLivubjPAlfW/fz9A2wM/Y6ywenXuvtHyno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710646; c=relaxed/simple;
	bh=pkTD3AsKoUetjadmxCsIgeptM1oLbZpx6KM2UX1wGWU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hEbY2ruYkY3EEiJ3wVqUz74TU+2JmlUPs40xECVQ4Vpbq8TkHUrcm94NPZegyqYUA6sr6FNAUxGxlKi25qP5blpxyQO6jCAgqiTSOjJvvEFvRzZx3YSgXM511o3mSYR1m2CP8wdAmfHeYygWRCxZnakKz8ST8jMV7vtlxmkLl6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=X9ZRbPAP; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pym1VjAAyQpQ+p0HBSkU9RA//jrNi0MOx48Eu20cweOWu/PMiYUd1BAuQPsFARyOooUvdKRY3R2EAtyeF2G6fUKlvO3kyZ95F4VgmFlKD/knGcZ/NLY/1Fq1VHcerhDbUQgqOK0qr2tV2RKFJwg7D+yidWLyjLsOp0gC4K+cvYAb9MS7id307ko/OrnTNNekrL6UUkDgFex/+uTsp/rfOKBaO83n84tIy02U1PEhuuNdMyF7MelPRNyQfcQcI0HnHJx8kmiJzl3jRKN7mtHcG4FAsf6tHfzZrIAouVF9MdZ21vBrR0nhnWZU/dlGl7Xbh8Z1elOXUXuvxWgRZaDyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkTD3AsKoUetjadmxCsIgeptM1oLbZpx6KM2UX1wGWU=;
 b=v8YOH21OOtkowJ0NsaeXJp3V9C4nE60Mjev2p51ZMtVz+Wq9vVp4NgQt7hnxiwh915KVN4w1zbXSCZZFPvvRctAf5W0SIxqYx0uv/ADmukZwZc+CF0aLotxnyhE+eBsWI3mJ9V1kZSCAhzXLkRs3wtCeuHq/x34b5n4xQ7IjlfOTG0r2WLfiKxWBlhPPok9uoV+A4KHPH5m2DedXodJDd6DMIoWCrIKyQlV21wttzUaFlEI8YzABi5JwW3HPn403txeRYwufgcCJ0odEWOqUnWtHXIBoF8U5055r7sXfLPDZcJ9M6npyCav72znfJnw+pUAX4gM+/t9YVOuYyHSC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkTD3AsKoUetjadmxCsIgeptM1oLbZpx6KM2UX1wGWU=;
 b=X9ZRbPAPQfA0OYafv26P/tiS8tt/GW4d6APD8+2DSYzA2Af8vNE5m1Q9cnW2yoKcwkYuI2ApsWMDjneigv/grwzCbTO6LQ9kQrsiQ8vjwHKdMwxD/6sPe34KB6++q6Eya4nqsRgyLsTGz3Ve496sCXJCSFcK3YK5Qj9mQrwPQdI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB12410.jpnprd01.prod.outlook.com (2603:1096:604:2d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 09:50:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 09:50:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown
	<broonie@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 8/9] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Thread-Topic: [PATCH v4 8/9] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Thread-Index: AQHboxNq+vOBM26H0kW0upLY2qpCg7OkVcsAgAAhXECAABeJAIAAAEqQ
Date: Tue, 15 Apr 2025 09:50:33 +0000
Message-ID:
 <TY3PR01MB11346D7EB984862D8CDC323C486B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
 <20250401143537.224047-9-biju.das.jz@bp.renesas.com>
 <2e8723a1-ec3f-4a0e-9c9a-9657b025799e@kernel.org>
 <TY3PR01MB11346B9A3EEDA10AC78E372FE86B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <d7f8b7da-45b0-4d93-b3c3-3e8f82e645fd@kernel.org>
In-Reply-To: <d7f8b7da-45b0-4d93-b3c3-3e8f82e645fd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB12410:EE_
x-ms-office365-filtering-correlation-id: f6686871-d857-4ce5-5595-08dd7c02f71c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dzNURVZSRDZZQjhNaCtBWUREb3ZUN1Jac3QyYjBRTCsvM3ppM1Z3ZThjTm04?=
 =?utf-8?B?SFRWZ3lVUlBXa3doYkJmWENXL3Uzdjh2TkxJK0xxSlJHR3JYNWdMcU9PYTRo?=
 =?utf-8?B?elE1TjJXdUlsQy9OenVaaXM5R2pQZHlpNHNJKy9yUXB2N2JOTWxtTG41cEZQ?=
 =?utf-8?B?c3VWVGNhY1JJcDVaSWhCRlk1UEREaGpzVFRrb0crU1ByS1p2NmVyVkFJSlhp?=
 =?utf-8?B?RldCRU8wVzc1bFkxa0VkMDNlUmVyTzhRVkdITmVja0xYaUxoWHd6a0RRNU5V?=
 =?utf-8?B?ZVphS0VrNmxrOElSOE1mWWtLUUcyUmJhMHU2Q2kveXZEeXlHZjRIUUFhSVRl?=
 =?utf-8?B?N0VYNDVpampqOTZtVnhtS1BtcmVaTkN4bnVHOHJQMStwdWt5RFFhZFVVam9L?=
 =?utf-8?B?cDh2d29HSUcvWGJ0RzU5SjlHQWZxakJ2L2VlWS9xQ1BJdzJmMnVTMmVENjZS?=
 =?utf-8?B?eXpMbjNCdmh4bEtkbzBsT1N2NHdKWXRuMmg5ME5QaVdjQWtmLzdsUXBqOTJz?=
 =?utf-8?B?bnlnaU14M1prc01yOG1xTm5MREFlR003UEkwejl6dWRZcm5EOTBBK0t6VEZr?=
 =?utf-8?B?Mk5HcWJZdWZBNUtGUGozU093Wk80ZEFFL1RHWjJLZFBZdFNWRDA5R2pyU3Fs?=
 =?utf-8?B?NUF1dWd6dzlHSTB0RzBKMGFwMGlra1dueWl3YnJ2MVpTRkQ1RjZSem1GaXgv?=
 =?utf-8?B?ZUhZYTRBUTlkNzRlUjhibUcxMW15bzFNT0QxY2dBTFpkQVlKc3hTMmFZL1hO?=
 =?utf-8?B?ZG1FUFU2eVZNV0tkU3gycjFtdUpSNU82Tjc3dVJpaGJleHUrMUxMZkRlYTFi?=
 =?utf-8?B?NkNRaFRFc0Rkd1Q3emp5a1AyNVhoVmdDL1dTemlXRTlySWdyM080MUFwc2pB?=
 =?utf-8?B?Q3REd3FvU1pMMGwyMVhZUTlHUFlEdlF0RVdpRVBMMEk1enFvdmFYRSthRFEw?=
 =?utf-8?B?TnczZndZYkZ5d0I3YzR4ZFhIVkFOQzRBNWF3c2lMUW9xeUxkRkMwUi9YUEhY?=
 =?utf-8?B?VTdqQjl0L1BNRHhvR21INmtGOGMrNUgyOGtrNy8rcndNdXBBcVdaZkpxanFL?=
 =?utf-8?B?TEFtek9JUjZ6ai95SHFoaEMwUXp5emlHTHltSHFVd0JqbzV4U05PY2FMazJ4?=
 =?utf-8?B?WGpaWW5qckUvZEF4dDZldVZEUDVkUGw0YkE3Wk5kU0ZrMXdKVzlaTk1zaGR6?=
 =?utf-8?B?YXVJd0lsSTVpc3NFRkNSdVBRbS9UeWdMTXU1VFZGU01nNEs3S1FCclg2V0g0?=
 =?utf-8?B?OHBKWTk3NE1UeCtSWithUFJkUUhpSkhLUUQrREtPUE5kTUwrWnhja0xrRkRV?=
 =?utf-8?B?SlpUVUE1MFNDeGgxVEZaS3dMZjQ4Zm9QQjh3elpvU1hwZ3dNZ0t0K2VmdktE?=
 =?utf-8?B?aUY0MGlMTVlwZmlqclZ4ZWF0MTBEQmtxZGJNUnFtSXRKN0dTTnN2UFY0bXpP?=
 =?utf-8?B?ZnpnNXhmak9tVDBuZFBQd3BQNXhocU1zZ3FnYVhhb0J3dDllV1B3UnlCWlhv?=
 =?utf-8?B?OVIrTWZ0elRXUDFGTjNFVER2N0hEejVHTUJlQXZtbDRkMHl2UXdJdm5VNE4v?=
 =?utf-8?B?UEpEaC9qMVg5YVZIUmFxQmxWMjlUOWFSdlJBaGdkaHdmbVpvbUhHUEJ6QjFj?=
 =?utf-8?B?TWNJWkZ2a2xueE5XTFM0d1JIR3BJL0RhZ2N4WHhpck4wejloT2FaQS9zSXQx?=
 =?utf-8?B?eFo4VCtzUjlNeERLQmY5bU83SFZqRVBpREZUcktUQWtZdDRLRnlrOFE0Y2g1?=
 =?utf-8?B?djltcnI0ZHVzSDNzL25VNDNKbTZMSEt4WTUyOGdHVlBlSkRGb2R5SHV5cnNK?=
 =?utf-8?B?OW1EcFNCS2RVeHBpL3ZITUVod25XeXJIdk9HSTFWZjlLbndFc1JvV1FOZ1BS?=
 =?utf-8?B?NE43Q2JFUk0xSUo5RU9iblFVRS9nSWZLN1JBT0oxeHVaR1dJS0UyUE44bVJx?=
 =?utf-8?B?UHRUVE1Ca3RYWWQxWW1TTkNFMTYxRDBrVTg1YjZsOEJlaytMbXBEYUpwK0pW?=
 =?utf-8?B?RGZ3Rk1kMHpBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlR2QWQ1dC9iNTE0Q2IreDBiUHd5cEZSSVNhdU1JRmxwSjU0NFhXUSttYW1R?=
 =?utf-8?B?N2wwaFpSYzlYcVA4RHdRT2tyc1hta0F4aEplL2FqTzFPNklVL2NwNnowRzEz?=
 =?utf-8?B?TXA4cjZLVUoxY2hQNWJUZlY4TXBOMFAzL3BiOWxWM1VsdXRPbzYvZlBKVE5D?=
 =?utf-8?B?MjB1ZDhSWklxczVEZmUrMElOZ0JyTk84Yzc2dk9OZDdLVTB1ZGpHZDBsT0JB?=
 =?utf-8?B?Y1RTTTdycm5EY2F0a0FIMDRYcHNUWTBKTDh6eUJGYk1jQmpFRDVCRldrVmJD?=
 =?utf-8?B?b2RBT3d4YmpqUGl5TURZTFBDUkN0TnJmOFVrK1hFK1l1b0VMWWZiQTBTc3Nh?=
 =?utf-8?B?WjRiMGZWN1FpcWs3MjZCc01VazBsUU9vaEpQWUJ6aFVEaWhtSDZieVVHaHg0?=
 =?utf-8?B?QjZ5UXFicE4zT1ZRVkRVaGtMeWhIYnBkQjR4Q2VnQllSKzA2OCs5VkZDUnFp?=
 =?utf-8?B?WXB2WjFSVFpCV1REZy9aTXphWldBYUhsYWRFRlZSbXgzR2lmRG9lV2tEdlMv?=
 =?utf-8?B?clhlRXdwQkFlTVhma1lDOUE4MmVRcUFUL3dMTTZ5QkpaU2tKblVobmNXNXFN?=
 =?utf-8?B?cm9FTTYzS2NlMFNJRW1Kby9kWXBnU0hoYW5EMXhRRmtxUHkvNWJyUnZ1VHl2?=
 =?utf-8?B?emNrZGx5NkhLVE8xQU5RdVdiWU5CajZzYVIveGlUSlkzQlU4WmdHdExENDlp?=
 =?utf-8?B?SGZURm5pTThDOW52aWNZTUdUcFljRC9PL3QweHNRYjJkV1VsSWY1WXNuMDBV?=
 =?utf-8?B?MmQ0VU1wU0ZteG1GeE94Sm96enZyZ2k5L0JxcUVUS0U1SDB1ZXlhL3ZGc2N3?=
 =?utf-8?B?RExyeVJkanVQVnFWOWE3RFRzdG1qdm9TTGdrd2lhQjFCMjExTkpzMFJRb1BX?=
 =?utf-8?B?WjVGL2d0QXhtanZ2U2s4Q1pPdndTUm5Bd2xseUNwRE5PK281NkdBdlFpU3Q1?=
 =?utf-8?B?aGI4UWt6TzVHaWdrQVZ5K0hNcVBKekIraW1OaHRocGMzUXF3aGVFU2ZBMkRY?=
 =?utf-8?B?b2p6eGZETWRBcVAwZm5kSys0VXcvRFZycldxZ1ZxYVZ1V1lkV09PeGZaMlY5?=
 =?utf-8?B?cklTOHl6Qml5NytWSzFkbElocmJ3eFJjUklpV1hDTFNrSEh2eWlyZE9TZzhS?=
 =?utf-8?B?T1JSa1N5b2FxUnZzMnE5ZkpvVEpUaW5CYTJKQmoraWkzM2VsWFYvZmdKUW04?=
 =?utf-8?B?dHdUc0dKVGRyQmtuaC8zM0oxMGpuMTIvNENjY0ZLSmJZK3Rwbk0vV2h4NlVs?=
 =?utf-8?B?cmU5a1BYVE4yNVZUdC9jNkxydTY2WWowc1ZzWkJTdVdQcXJ6cnVWYWEwUnk5?=
 =?utf-8?B?VUQvUnFkM25mRkRtMTZXQ294N1BSQklZU2lSQWNRNFNkamZDd1RoQ2gvNExD?=
 =?utf-8?B?S29vQTdPaFpjbjBWaStTRW5haUl6Q3dsOE1kYlU2M0NCNzVoYWx3VnF3UkFG?=
 =?utf-8?B?YmF5ZEtkNGM4aVdYZzI4TCtDT1d0VkZkYkx6QXF0K1FKelppR0tsMkg3K2Nm?=
 =?utf-8?B?YnZJelRWenB1cUdmeGtzbCtuSnkxSGpseWhlc0dDMVVQNllxSXRwRGRjbm5O?=
 =?utf-8?B?UEI0cWh3OXZyV2x1cFpUejhOM01ycFViM2J3NnZxeGFTRkdTY0xDa0NpYll0?=
 =?utf-8?B?dUNORWZDL0V0SlFPbGorU0hCYmlXbzVtV3YzV2wwT1d5TGY2QnVGb0VDSUM4?=
 =?utf-8?B?aVFVbHcxVi95SkxzMnMxVEFML0pCK3NWdlR2WU9TQkNQaFVhUTlZcGhTd09m?=
 =?utf-8?B?eDV1TTFHQVZWMzBibHVuWlpxZFdKdmEvQTlwWm4yUHdpNC9DMy9TdmFEczM0?=
 =?utf-8?B?Mnh2c0I5VEl3d1lHaVMxd0tVRDJ2cWw4eVAxT1BZQmpRalpJcU1BNVh0S0pR?=
 =?utf-8?B?UElUTlN4UldZdFZJRyttZVFXbUxlZms5K2V6TDU1RHpNekx6RUdDUm5JOXI0?=
 =?utf-8?B?TE5vWWNRMHJGSWtIQThZL3J4K0xxM3VOTG5yVVRXRnk5djZsdGRJWUpTTlZ6?=
 =?utf-8?B?UFh5ZHE2UXZmNXJBNzhiVHhyWnpDRUNjeE0ySnlWSmNoWlV5TitNY2Y3NHU0?=
 =?utf-8?B?cS9SY1M0VUFTWUMxQ1ZGNHNlbytvTHNVSTVyR1lNTEFXU05hWmJPWHVmUTRp?=
 =?utf-8?B?VTg3aElVQVJKMGRQSmJUdEpQVU5aUXBCS0J5ZzNNaWxnU1JIR2w5RHFuQ2Nt?=
 =?utf-8?B?Unc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f6686871-d857-4ce5-5595-08dd7c02f71c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 09:50:33.3515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxuM27RncIFVSTLyaRHIZzzahn3ZWPDeXtNI8Ha5b886WQRxXcrdQ4d3W2qxOLk8wkdH7y9BYhA4fCuoSN9Uq+67JilT9yKjxr4VtCTT6dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12410

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogMTUgQXByaWwgMjAy
NSAxMDo0MA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDgvOV0gbWVtb3J5OiByZW5lc2FzLXJw
Yy1pZjogQWRkIFJaL0czRSB4U1BJIHN1cHBvcnQNCj4gDQo+IE9uIDE1LzA0LzIwMjUgMTA6MTgs
IEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4NCj4gPiBU
aGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+
ID4+IFNlbnQ6IDE1IEFwcmlsIDIwMjUgMDc6MTcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
NCA4LzldIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IEFkZCBSWi9HM0UgeFNQSQ0KPiA+PiBzdXBw
b3J0DQo+ID4+DQo+ID4+IE9uIDAxLzA0LzIwMjUgMTY6MzUsIEJpanUgRGFzIHdyb3RlOg0KPiA+
Pj4gIGludCBycGNpZl9tYW51YWxfeGZlcihzdHJ1Y3QgZGV2aWNlICpkZXYpICB7DQo+ID4+PiAg
CXN0cnVjdCBycGNpZl9wcml2ICpycGMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsgQEAgLTQ5Myw3
ICs3NjksNyBAQA0KPiA+Pj4gaW50IHJwY2lmX21hbnVhbF94ZmVyKHN0cnVjdCBkZXZpY2UgKmRl
dikNCj4gPj4+ICAJaWYgKHJldCkNCj4gPj4+ICAJCXJldHVybiByZXQ7DQo+ID4+Pg0KPiA+Pj4g
LQlyZXQgPSBycGNpZl9tYW51YWxfeGZlcl9pbXBsKHJwYyk7DQo+ID4+PiArCXJldCA9IHJwYy0+
aW5mby0+aW1wbC0+bWFudWFsX3hmZXIocnBjKTsNCj4gPj4+DQo+ID4+PiAgCXBtX3J1bnRpbWVf
cHV0KGRldik7DQo+ID4+Pg0KPiA+Pj4gQEAgLTU0Myw2ICs4MTksNjEgQEAgc3RhdGljIHZvaWQg
bWVtY3B5X2Zyb21pb19yZWFkdyh2b2lkICp0bywNCj4gPj4+ICAJfQ0KPiA+Pj4gIH0NCj4gPj4+
DQo+ID4+DQo+ID4+IE1pc3Npbmcga2VybmVsZG9jLiBFeHBvcnRlZCBmdW5jdGlvbnMgc2hvdWQg
aGF2ZSBrZXJuZWxkb2MuDQo+ID4NCj4gPiBDdXJyZW50bHkgdGhlcmUgaXMgbm8gZXhwb3J0ZWQg
ZnVuY3Rpb24gaW4gdGhpcyBkcml2ZXIgaGF2ZSBrZXJuZWwgZG9jLg0KPiANCj4gSSBrbm93LiBN
eSBjb21tZW50IHdhcyBhYm91dCBuZXcgY29kZS4NCg0KT0suIFRoZW4gSSB3aWxsIHVwZGF0ZSB0
aGUgcGF0Y2ggZm9yIG5ldyBjb2RlLg0KDQpMYXRlciB3aWxsIGFkZCBmb3IgdGhlIHJlc3Qgb2Yg
dGhlIGZ1bmN0aW9ucy4NCg0KQ2hlZXJzLA0KQmlqdQ0KPiANCj4gPiBJIHdpbGwgYWRkIGEgc2Vw
YXJhdGUgcGF0Y2ggZm9yIGZpeGluZyB0aGF0IGFzIHdlbGwuDQo+IA0KPiANCj4gQmVzdCByZWdh
cmRzLA0KPiBLcnp5c3p0b2YNCg==

