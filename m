Return-Path: <linux-renesas-soc+bounces-15132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 417A1A76406
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 023AC7A513B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A341DF75B;
	Mon, 31 Mar 2025 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="O+Ba5Ca+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461AA27726;
	Mon, 31 Mar 2025 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743416279; cv=fail; b=oprQzNgeyxH7cM045fo/GxCLzyR7HIUeWACozmLxeftHp8f8AwA4iK4E2tAhheR1QdI3E3/XK0tDJVAd7inTO63J1r5eDkXAKXhod8Nzk9d6KD3LWiOH+ejLyeIb1/jxzGLIxpP0VCAOw7cStWRD+azCSaZFgAQB5+B8Rlj//Cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743416279; c=relaxed/simple;
	bh=KDmu2FuQeql485VRbXneFQthUv7kIK66NuDGNXnDvco=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YXNAWaW9NarHsdrscTAQzNOOkhuwsnds11ifL7w4TUzJJ10/oseV1dLWPUJz37tCnkYCgNm891mLMHj8DylDDkPCJnib18nHjn6zxRi/KLY5r5Ef/J7ocw733p1AY5ljP810cYhdtx0FBK8XcvJElpSL4IkegpXAOi8rA+M6g38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=O+Ba5Ca+; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Js/fgzYIZeXFr6omZ+0zMeri5Oz1VD1bdse/gyumSaTzNjVeKogFj8JDMWscB+UtIGimOg1qynW/X9GWh3jfQcwWCzqBZz6kjVSmxIcZWAVjSPbGbAWOGRS6P0crgiOnQLKdxFp3lMKmEGw3dNe8A6zngpjFcNDtcbTkWAdKclnQDmeo7vo9l5Wbrp/gbggef3a4eQl3A1HYhUZgD7dD+wHO7zpd2GDQqi0ABjExZg1mLpZmDZIjKWoVCMb73X4ktgjVpwFXgXTpnbPTkgI3/JwHxalKZyxbIMdHHp/u91DHjjBwZtuBgjgoLNsFdgYSth1YSY49vwVvWmHy8lbykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDmu2FuQeql485VRbXneFQthUv7kIK66NuDGNXnDvco=;
 b=cJCVshMjAYJ5lGdE78fXkJKlaps7fQfF2gJf0oNPqojGOWkPzRtJfUxSkoFn4y/St8vNZekprv04Qdc4djldRN/VJkFJaRxZEJ3xvz5WO5qCdh+RhU7CZtKoyCc4lb+ZMVpGYaGZgkE/pBYKuDKZqAKGeUczhOVYzAHDPhvIPN2IjZi1y9FhLZ8GqZbHp/D0jLHDInDHPsQ0CuD5aJBQMToPJ7E1P5ECyhMFxTv9HHn5JOonCT1X08SYWZMOdF87jRH3T7HmIN3DqMz5YVCUOGqOnba0tBPVVtVEbP/HBSnTuOdLtAQ4Q4+NAiX1Amfu5yulcIPV4QO5KlmhRhCrug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDmu2FuQeql485VRbXneFQthUv7kIK66NuDGNXnDvco=;
 b=O+Ba5Ca+UWeMzq/jYOZ+XHqRmku8ZGJCj0Vw7W7rJHExKdG7cq2R2loxcP9Pd58CMnd5hXMMSN3plmf2jvib+t7YVjDlGcgXTmUYmUV76IdTEM/RogMn1nmmVbsXWdvFDzLiEWDv5qXrqAmogxkcO63E2H/pvJ79Aw1AthUxg3c=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by OS3PR01MB8458.jpnprd01.prod.outlook.com (2603:1096:604:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 10:17:54 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%3]) with mapi id 15.20.8583.033; Mon, 31 Mar 2025
 10:17:54 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Paul Barker
	<paul.barker.ct@bp.renesas.com>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Thread-Topic: [PATCH v5 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Thread-Index: AQHbnaBL5ysiirG6XEybCeBGfdsN4rOFDBWAgAAsKoCAAAEfAIAH1wOQ
Date: Mon, 31 Mar 2025 10:17:54 +0000
Message-ID:
 <TYCPR01MB1149218A2B60BA0EB8E8A1A5C8AAD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
 <20250325160904.2688858-3-thierry.bultel.yh@bp.renesas.com>
 <20250326-enigmatic-cuscus-of-enhancement-410130@krzk-bin>
 <d2d09918-5555-47a7-8b82-f88e9ff022d7@bp.renesas.com>
 <69bb8311-c0f7-4940-8c69-8b6de4f7c30e@kernel.org>
In-Reply-To: <69bb8311-c0f7-4940-8c69-8b6de4f7c30e@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|OS3PR01MB8458:EE_
x-ms-office365-filtering-correlation-id: 79676594-dbe1-4298-e8c5-08dd703d4ced
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bzExSkJpS0FXdGphdVNSLzk2dEVwaEd4RG5ldklJaFltN0M2UXpYSDRMSmJ5?=
 =?utf-8?B?R1gzNW5uWUd2aXlvYmhMRXpKa1ZYRDQ4MjBmdTlSclNKakNRYlVZeHVrcjdt?=
 =?utf-8?B?NnYvVlVQaXQ2OHZCOUFBRVhmOVQzK0pmYlAwd1M0VU1SUVY0akJEWERvTnBk?=
 =?utf-8?B?WGFMZThTYUZiYjQ5RUpyNEhxK3hRaWhoUzNEVHV5UW5ZeXdYV282b1psSnFk?=
 =?utf-8?B?OGVtSWk1cEZFM0pGRGExR29EMEFmYi9IcUNWbnR6RG4wSlRIQ2Y3dVdWaEhN?=
 =?utf-8?B?NGdMSjZhSmNwSWhQMWN3S25UUFVnWUhQWmhVbzlJS1RvaHVxcUFpaEcycG1Y?=
 =?utf-8?B?YjlVZG9seWREUjNVQUFFVDY0cnVvVWhybkE2SnlKcU1WQVhuTnk5RDdtcEti?=
 =?utf-8?B?NEN3ZHh1S01QeE54NFpVWjFHQ2tFU0JoVTRGUTY3OFAyb0VjOEROdFRZYVk3?=
 =?utf-8?B?b1lGOUs4bDBCRHBTR0UzSXFla000N1U0c08vWFRyTlNiRHVPV2hHZndjT0Zy?=
 =?utf-8?B?MkZaSFN5TGJvYTdQaWc4R1RTSDk0bE1MRnY5MWxMWDZjQ2hVNWQ1RmdsYndr?=
 =?utf-8?B?dHlwWnVudkM5WEppb2xyTHVzbzg1c2xabTJ2OGg3Y3FNRzhhUjFKOWlPVXBJ?=
 =?utf-8?B?a0c1UTJrY2dpTHduc2MwclVyQThQS0tIOGZoS1Y2bGpMUm9pUGVGSXU1U1hO?=
 =?utf-8?B?YXZCdVgyYVZ6QlV0OGtMbGJ6ODFJS01ybEUxNFNPc0NJcTNZanh3OFVuT2s1?=
 =?utf-8?B?N1N3ZWI5QkhmWnZBWFZtdTBRdlk2LzFXL1pEOVVvWk1EclJpVDVSS2orY0FQ?=
 =?utf-8?B?SWlXcWxOajJ0YWpxWU55djlpbmxaa09ZRnZOL2RsTEQ3SWdQcW1Md2tBMzQw?=
 =?utf-8?B?eUsvTWRZaE1aZUg2ODFTWWxCeGMwQkZSOWliclBzRHAyRXkzazFwcWNKeTJx?=
 =?utf-8?B?MnIyamhWR1BkcUZtdW1tVlpwL3ZJSEQ5T0t6WFgwRmNkK1FqTkM3TkNNTDYw?=
 =?utf-8?B?UWwvNUpSZ1lWTWd2UWZzbUY3SWlsQTNEMnZibm5qWlpab1krVEVWSlN0TTFE?=
 =?utf-8?B?L1MrNkdZbno3MW1XejhEcytVMmdoYjZYbHRoNVB2Q0huQ1k3cUtDZGNqTEVq?=
 =?utf-8?B?eWdibnRZSUUxVlVjTjNPYnYrYVRSME5PQk5UeEZLRmZXYTZOVW1oa21Qcjdt?=
 =?utf-8?B?Z1lqSG5JcFJzUG1xMkdRMUhVM3BiZUtGV2lYM0VJN2hJNlFvSEk1OEYvNnNa?=
 =?utf-8?B?RUdGNTVUUkt1Zlk4bmpBbnhFWk51MUV1dzkxUGlKdllocVJhTDhEMS84M041?=
 =?utf-8?B?NDMzTE9BOG5YQkNMT0pNaVV4blJsNUZpSko1NmRSMzJJTDdwQ0NncnBGZ29u?=
 =?utf-8?B?NFkyT2NVUGZMU0tvd1FIeXdQUDBnMnpTNEVuZ0g0TW85TlpUUWJ1dEtLelds?=
 =?utf-8?B?Sk1lN2JEdTBxb3lLMTIvOWtWZVpRYlY1ejB2eVJYWlRvcEZFUjhpbGwzamtx?=
 =?utf-8?B?ZjZiZUpEWXFmSzRyM1dtK21vRjBpM2JvdGVBclJYRERUNTIzd004M0ZqQ2ZZ?=
 =?utf-8?B?RldBdVRLRmFwRE1yQTlSWDRKWU9jZk4vTVZNVU05WkJIZTlSNUhJblpVZkwr?=
 =?utf-8?B?QU9XME1NZEg4b09BWkRxUGltNHdTdlFmOWVDSnloOVZDTGI2NnUwWEwwbjdp?=
 =?utf-8?B?RkJZNDc4SnAxTTNQWmp5WkQ4anBwN2VvMGpZZlhGMnBOOUxNeGkrWjNkRmxC?=
 =?utf-8?B?QUJPUVRMWk9MWHZlTFNTcTZzRlc4YWFFNVhmaE5UMHZDT3YxWGVIZmkydjZQ?=
 =?utf-8?B?dG42V2tlcExRSWR1bUY2NXpQVkNHRmV6dGozWGZKeDdpbUJidDZMckErZlVY?=
 =?utf-8?B?VmNjSldwTW5MZndua0FmckRqVHdLd2RjZEpSY1U1ZU44cEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aUFNS1ZNR2VYekh4RGlkdGNUTHQ5Mm5RbS9wQXQralZRYzRxbGZORlpHZnZP?=
 =?utf-8?B?bVIxcGdoU2JqMkgxSDluRjQ0K29hMjJTVzQ2cytMcFgraXVnNnVUc1ZJcUhV?=
 =?utf-8?B?Qk04eVl2cjFmWnJmRDFwU1lMOUEzREFacTBuTTF1TFlGUUlIQnJjRXBvNzh4?=
 =?utf-8?B?ZDN2RDdCNGx0ODd6SHZYKzhqOUJwY3VVanJjUXkwMGZEV0M2dDNqcEQzeVVC?=
 =?utf-8?B?R0RLNXFZTHhCOFZoQXEwbGVqQlRmWnZPcE5seXl4R3RnZ1VWYmhITG9BUlcv?=
 =?utf-8?B?VDZJVkM2WHhtV3JNRGZwb3QwTEcvTGRaUytRb2hlOENTVFpxeldkUFV5OFlB?=
 =?utf-8?B?aEsybVlnd1ZSY1Z2MFltOUhVNzA5WDJwM2Nsd1AyeVc2M1hpbmJkRjF3RldQ?=
 =?utf-8?B?RHhBMVFFaUNRblA1djdYM3FWTmJZQndIcGlYc0xYc1h5bkQxR295OHZoRExo?=
 =?utf-8?B?NTkzOWVYYWtxTE1oeWZRd2JXZWdBcUJkMUhBcjZBSkdzSlpqY29xVnc5S0Vo?=
 =?utf-8?B?TE5BVDI0YzVjMDZmNFVpRVpsY2dUdFNXUG80amtUTjh1UmZ5MmcrclAvRnY3?=
 =?utf-8?B?dTU3NjF2SlhWTk0wZi8xYThTLy9vSGJuTUJEU2RlN3NpaGRxc2kzMXhTT1M4?=
 =?utf-8?B?STl0NWJuVGU1b1JLRGViY25wNkFkS1JlMDdaT1d6TXZMa3djbllCV003VDJB?=
 =?utf-8?B?U1FLYVgxRmdzUTdwREhMelRNY3ZEU3k1bWdkaG5zamxBZ0pOR0xmVkxvdm9I?=
 =?utf-8?B?QkRoRDdTb01Ia1RnLzYvenNhY0dFa1FDRmZDc0NLRHpVQVpRMGptcjBlNDEy?=
 =?utf-8?B?MTduaGhtT3FneHl1SGVjb2dFU0RBeGRRVHhabm9FNnFaa3ZKbGlUYkEvN0Zz?=
 =?utf-8?B?SEt6YmIraFRFOGVOQStwdlVUVERGM0JqdlZWZFBRL0dHSUszT0g5VmtNbU52?=
 =?utf-8?B?VEdhZVRiMVVSdUhxcjlWNDdlOE92Y1V3Y0lodk9zZ200Z1NCeGE4TjZaS1dB?=
 =?utf-8?B?SU55cVpOd3RUdEMwZXNReWl3Z2VUaE84a1BXNkQwenREZkZTMDJxZTZ4eE9O?=
 =?utf-8?B?bWQzZXFiS2c3ZUFFVWZMVnFBRTRUSStXYjJkaGwwd2VjbUhqcjlGY3BiUWZR?=
 =?utf-8?B?V3ZFd1NtckxDNWIzdXM3THo2RkFyNTZ4cURZRDNaMHkrU0VQZ29BMVZpb1lB?=
 =?utf-8?B?am5tbnIrSUhKSUlkWE9ZejlCa0ZCNHVvWFlkWVdPSzFVRjlQMWVxLzNPRHRI?=
 =?utf-8?B?bHNQU3BXUkRYOWZWTDBMRE5tb25QZndNWDNrY2p6azJNak9PZHplUnl3Vkth?=
 =?utf-8?B?SGN2ZUFrcjdickh3V2Fwd2hPdUZvTXVEb0lSV0tpQVZKREQvd2VQVm9zL25S?=
 =?utf-8?B?NVYwZUI5eTBNSGJyMGNpZnl0VGJyUlYyaU9MSVozMldZRW8wUUt0Y09hUE5Y?=
 =?utf-8?B?ZzJOOW1Sb3piYXJzVFEvUmY2RVVDakVWWHVUV1lSenJjcDlKYUJmOUdJWDYr?=
 =?utf-8?B?TTA2QWV6OG1IbSswUm5IRXErZVMvM0dORXV0NTlYTDZlZ0FHeWs4bDU4dm5L?=
 =?utf-8?B?TXNEWndTaWtBanE1OWlWa041SHQ3UGFsWVEyTmZ3TXpYYVJINFYzNEJtTWE4?=
 =?utf-8?B?cUllREtKK05Gc1ZqMm8rQk9XWEdEUVZLekpuQnVGYjEvbzllRnpkaVd2Q054?=
 =?utf-8?B?cHlDcmpuYUpoUk44YTFnTmxsTlkydGUvT3k3UVJZbkRQdWU5Rkxzenc3aTg2?=
 =?utf-8?B?WnJ4QiswVWN1YmI3OFU4bWMyMU96NFBCMitFTkxCaG11WUYyOHN4eWdrQ3Jv?=
 =?utf-8?B?WXZIZzlmbHA1ZjdKTWwydmJ2N0RmV1ZqRzY5MUxQUDNKajJPcVJTei80V0Vl?=
 =?utf-8?B?NUs4TnpLSWl6a25GbmlwQW9JM3NWa0ZDZTdycFdEdzAvVWZITTRIK1BjZU1q?=
 =?utf-8?B?UC8zbi9HYjFuWTlERnVHZS9CZHpoOEdtRFF0cWlIZ1phK3FVbzdSV2drd3lK?=
 =?utf-8?B?T0FMdWZuazJCUExHTjBQY0lBd0x2aXNTNG9hN1oxQ3kzUjIrMk1Ocms1ZTc2?=
 =?utf-8?B?cU1lTTQ1YVZGYTJqUE93OVRWbFNaY01FMjF0WlBjNXU0bHFRZ3hYY2lPa3ZQ?=
 =?utf-8?B?RGpLTVowS0d4UmNmcXkyVDF6ZlhFUi8rRUtVMFNpWnc3Tkozc0VDWGZUdUVq?=
 =?utf-8?B?MHc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79676594-dbe1-4298-e8c5-08dd703d4ced
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 10:17:54.2082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VtnTHrtiJ63tdLeG6bE1hxy2ODgf+6MTOML8mSuBGhNkPG2ZAIGEK2V+TbS1D0vqZZwKYmiuUs892b9TCyrvTrhXOmLhNGVkzWz7yZx4tJ8wtkvzNOjcBfq0c1hEWwtV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8458

SGkgS3J6eXN6dG9mLA0KDQpGWUksIHRoZSBjb21pbmcgdjYgcGF0Y2ggc2VyaWVzIHdpbGwgYmUg
YmFzZWQgb24gbmV4dC0yMDI1MDMzMS4NCg0KQmVzdCByZWdhcmRzDQpUaGllcnJ5DQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPg0KPiBTZW50OiBtZXJjcmVkaSAyNiBtYXJzIDIwMjUgMTE6MzINCj4gVG86
IFBhdWwgQmFya2VyIDxwYXVsLmJhcmtlci5jdEBicC5yZW5lc2FzLmNvbT47IFRoaWVycnkgQnVs
dGVsDQo+IDx0aGllcnJ5LmJ1bHRlbC55aEBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IHRoaWVycnku
YnVsdGVsQGxpbmF0c2VhLmZyOyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+
IGdlZXJ0QGxpbnV4LW02OGsub3JnOyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlPjsgbGludXgtDQo+IGNsa0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY1IDAyLzEzXSBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBjcGcgZm9yIHRo
ZSBSZW5lc2FzDQo+IFJaL1QySCBTb0MNCj4gDQo+IE9uIDI2LzAzLzIwMjUgMTE6MjgsIFBhdWwg
QmFya2VyIHdyb3RlOg0KPiA+IE9uIDI2LzAzLzIwMjUgMDc6NDksIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6DQo+ID4+IE9uIFR1ZSwgTWFyIDI1LCAyMDI1IGF0IDA1OjA4OjUwUE0gKzAxMDAs
IFRoaWVycnkgQnVsdGVsIHdyb3RlOg0KPiA+Pj4gRG9jdW1lbnQgUlovVDJIIChhLmsuYSByOWEw
OWcwNzcpIGNwZy1tc3NyIChDbG9jayBQdWxzZSBHZW5lcmF0b3IpDQo+IGJpbmRpbmcuDQo+ID4+
Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBCdWx0ZWwgPHRoaWVycnkuYnVsdGVsLnlo
QGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiBDaGFuZ2VzIHY0LT52NToNCj4gPj4+
ICAgLSBTZXQgcmVnIG1pbkl0ZW1zIGFuZCBtYXhJdGVtcyBkZWZhdWx0cyBhdCB0b3AgbGV2ZWwg
Q2hhbmdlcw0KPiA+Pj4gdjMtPnY0Og0KPiA+Pj4gICAtIEhhbmRsZSBtYXhJdGVtcyBhbmQgY2xv
Y2tzIG5hbWVzIHByb3Blcmx5IGluIHNjaGVtYS4NCj4gPj4NCj4gPj4NCj4gPj4gQ2FuIHlvdSBz
dGFydCB1c2luZyBiNCBvciBzZW5kIHBhdGNoc2V0cyBpbiBzdGFuZGFyZCB3YXk/IE5vIGxpbmtz
IHRvDQo+ID4+IHByZXZpb3VzIHZlcnNpb25zIGluIGNoYW5nZWxvZyBhbmQgYjQgZGlmZiBkb2Vz
IG5vdCB3b3JrOg0KPiA+Pg0KPiA+PiBiNCBkaWZmICcyMDI1MDMyNTE2MDkwNC4yNjg4ODU4LTEt
dGhpZXJyeS5idWx0ZWwueWhAYnAucmVuZXNhcy5jb20nDQo+ID4+IEdyYWJiaW5nIHRocmVhZCBm
cm9tDQo+ID4+IGxvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAzMjUxNjA5MDQuMjY4ODg1OC0xLXRo
aWVycnkuYnVsdGVsLnloQGJwLnJlbg0KPiA+PiBlc2FzLmNvbS90Lm1ib3guZ3oNCj4gPj4gQ2hl
Y2tpbmcgZm9yIG9sZGVyIHJldmlzaW9ucw0KPiA+PiBHcmFiYmluZyBzZWFyY2ggcmVzdWx0cyBm
cm9tIGxvcmUua2VybmVsLm9yZw0KPiA+PiAgIEFkZGVkIGZyb20gdjQ6IDE0IHBhdGNoZXMNCj4g
Pj4gLS0tDQo+ID4+IEFuYWx5emluZyAxNDAgbWVzc2FnZXMgaW4gdGhlIHRocmVhZA0KPiA+PiBQ
cmVwYXJpbmcgZmFrZS1hbSBmb3IgdjQ6IGR0LWJpbmRpbmdzOiBzb2M6IEFkZCBSZW5lc2FzIFJa
L1QySA0KPiA+PiAoUjlBMDlHMDc3KSBTb0MNCj4gPj4gRVJST1I6IENvdWxkIG5vdCBmYWtlLWFt
IHZlcnNpb24gdjQNCj4gPj4gLS0tDQo+ID4+IENvdWxkIG5vdCBjcmVhdGUgZmFrZS1hbSByYW5n
ZSBmb3IgbG93ZXIgc2VyaWVzIHY0DQo+ID4NCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4NCj4gPiBU
aGUgYWJvdmUgYjQgY29tbWFuZCB3b3JrcyBmb3IgbWUuIFdoaWNoIGI0IHZlcnNpb24gYXJlIHlv
dSB1c2luZyBhbmQNCj4gPiB3aGljaCBiYXNlIHRyZWUgZG8geW91IGhhdmUgY2hlY2tlZCBvdXQ/
DQo+ID4NCj4gPiBGWUksIHRoaXMgc2VyaWVzIG5vdyBhcHBsaWVzIGNsZWFubHkgb24gdG9wIG9m
IHR0eS1uZXh0IGFzIEdlZXJ0J3MNCj4gPiBwYXRjaCBbMV0gaGFzIGJlZW4gaW50ZWdyYXRlZC4N
Cj4gPg0KPiA+IFsxXToNCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW5lc2Fz
LXNvYy8xMWMyZWFiNDVkNDgyMTFlNzVkOGI4MjAyY2NlDQo+ID4gNjA0MDA4ODBmZTU1LjE3NDEx
MTQ5ODkuZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlL1QvI3UNCj4gTGF0ZXN0IGI0IGFuZCBs
YXRlc3QgbmV4dCAobmV4dC0yMDI1MDMyMSkuIEkgdHJpZWQgbmV4dC0yMDI1MDMxNyBhcyB3ZWxs
Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

