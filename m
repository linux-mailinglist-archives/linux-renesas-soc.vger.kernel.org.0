Return-Path: <linux-renesas-soc+bounces-8146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A963E95CC7A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 14:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE99A1C22163
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34E3185947;
	Fri, 23 Aug 2024 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rqwqE8+y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2D0566A;
	Fri, 23 Aug 2024 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724416769; cv=fail; b=l48ODmA5kD3O0+RE8oPLMmrt4iPJaAFYiGIpbhKVBmR1jj9dJZ1I5LGKK/LDpj15TMsf8ZIBoSlt00MhpQByMqhwD6UdwxJ+5SVN3qATnX0tR28ezBBst03CkpWdmfo15ZE39tTof3nG/ogtUTxwJLQM8EAYYaMwiMCn/1oyJzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724416769; c=relaxed/simple;
	bh=YBLNm5fsHkHlWaT+Lf6sexTDvpZcud4A/aGAyTVABak=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IkWWzz3JeN3wnexRnpx+3YtaTtd45VlQ+sEVPLnT+9WuW4nh9jOTvzWIexadYLQLUrS4SI2awf3YCoMxPkV4p3VhXPP9gSDr7RlksRe/EjbOQRMY1PSsiguC6Xn6TQulpRRqXMPWx8RPL/AN9316VavjvLOLjZzAI9BWMKrCw/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rqwqE8+y; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nri0Nd5H6l3OsfqqJxdm68YSIjjUba/hSUKMyyUMZMZTdrF6c1qZYkn6nA9Pw/IQy4i+O4jt0ItxuPpFgnAbIcg7m/GSgOu3iwvwsIQ+Rl+n3oo/Ha0LulALEW+mulOjntbPsAhTe+pDexltBb7WDbY3QOhxMZMaSip5MDQ36DdgSTFaI8TYC5tIeAKKt5w8yWu/hqDam7j5qcq1OCuid/N4nn3vDsLVUz6ggN11AH+a8JkYd//0quXYClflepBB7o5a5tNGwWqGspGOlg0TdnhpT8y7feUftoFuc1PfHDc2ls15sLbZr4xQhrAC9qh0c44KPQO5vF7NTOX/+3ED1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBLNm5fsHkHlWaT+Lf6sexTDvpZcud4A/aGAyTVABak=;
 b=GgBYLYTwwrRu6ME2PsFQwDSYYn0SypHQMhy4Ehm/rpyQ62POujO6p3y0S1VEsuMfOLzUrv7+k5XcZyNkPE1dry6v+eTm98cCtmWXn6URttj1Rvwp/g2BeKiEQh5dAJd4a+e/8BKeekBovzm6H1TvnniC+b545hzfQe2zr6L4Z/PhYeBfF9vILCtar8h4Yy8e1B9Ot9q1yR5U7cb6nC0em81Q7MPSjDP/Yr60CZyeXVPhNGsg9r0TCBo5zlKrtZx3hsH+6Y1jOT6RyngNanIXe6atFr9BMtVKKFM9Vq4jV95C0NxTvG0XeE8KIjihqA6M9tFYw/9byQWcE2GwwCFEmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBLNm5fsHkHlWaT+Lf6sexTDvpZcud4A/aGAyTVABak=;
 b=rqwqE8+yWX3lsLHo/CDKWbeq/btV3q5vYKHX/Ms+Bo8Fbvom7znuNLcMzpmQ/YvbVV9v7s3lCtBqgA391dbMrlDwwgvAJ0OeM2RhUN2FyH9oUjtNxemobSciwr0W+HmxSaT7VWMOHS7clx4BPnCGc58zMVHSBWq8AbP4Jj1g6Mk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8145.jpnprd01.prod.outlook.com (2603:1096:604:173::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Fri, 23 Aug
 2024 12:39:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Fri, 23 Aug 2024
 12:39:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 4/4] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
Thread-Topic: [PATCH v4 4/4] arm64: dts: renesas: r9a07g043u11-smarc: Enable
 DU
Thread-Index: AQHa9K+t/PJRSNtMYUehL1ksjCIBc7I0x8wAgAAAvGA=
Date: Fri, 23 Aug 2024 12:39:24 +0000
Message-ID:
 <TY3PR01MB11346F763B72B7D3E790DECD486882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
 <20240822162320.5084-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdU3b29rZaKNiX8ikDfd1OLThnpYVcdeYnaWeVuvyER=6g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU3b29rZaKNiX8ikDfd1OLThnpYVcdeYnaWeVuvyER=6g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8145:EE_
x-ms-office365-filtering-correlation-id: 5e2b7863-763a-4c72-7f22-08dcc3709e6d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TjRIQWpFV3poZzFoNm5HQTFSTmRqSE53RTFFZ3I1d3hUSEUrc0oxNE5kanZL?=
 =?utf-8?B?dG5CZGtBckpkYitQc2xuS05nL01oZStOdG8xZ1Q0SzY5Nld6Z2FuYng3TlQ4?=
 =?utf-8?B?Y0x1SzBnRkppUlA0blU0dllSa0dRQzBVcGUrWVpacjNBOFBaaTh4Z1F0UWI3?=
 =?utf-8?B?Mm8xV3lYNTJKZWZ6elFnQ3doSWJzM0VuMFBQYzFMZ3NKbXRVcjZRbDdpTmpj?=
 =?utf-8?B?SDhDaEhvRkc2WW1BNFFIeWFVQUdNL3lHZ3BoSTFEZE1xZ0ZjQ05EamlNNmFU?=
 =?utf-8?B?SVBwQUFUQW1RVzdNQ29tYUsyVHFSazM1NC9lSGpSTWJ6bzEwekVuZ28vMTJ6?=
 =?utf-8?B?WGlLczA4eGY3TExTMmpMWElxMzcyZWRtc3BaZ0RacFhzSCs5OUJEckNBT1Fv?=
 =?utf-8?B?Ri96eW1EWEc3c0VRSGJjT2xkSnJvcGhTeDNYa216RmhOTEVnb1dmSE8zN2ZE?=
 =?utf-8?B?SlYySVQxd2kwajJNQkQ3ZDZmNkVQZE9VMlJxYm5VRG9OUjFCMTJyQkxJYlBx?=
 =?utf-8?B?SjNxYTBaQUNybU1lZjZ2WUIzYzIvWGgzT2YrSEhsVWhJTzE4U1diMkxiN0Yx?=
 =?utf-8?B?RXlmc1ZWQk9oM0Z5TFdoRHpVSmJlUEV4bkFkNTdmM1RtSENUbi8rOEFpbk9P?=
 =?utf-8?B?QTJLSCtmdWdlNmtJNktNbkJwWG4zZ2FnM01TZjBEbG5UVEhFVW5Ndzd5OTBz?=
 =?utf-8?B?ZFplZjh0MExIai9hKzR1N29FbkxHbGhhUURUWHNWN2ZtOW1hYzZaQm5NQ05n?=
 =?utf-8?B?SElyRWdSL09mcmxQc2kvb21aYXloMHlTU21WNEg5NHVURkYweDF3c3l1dmhJ?=
 =?utf-8?B?TzJrcnNaYTk1N2k2UE04aUtPOXFYOEQzR2NzU2FDU1UxTSt5S1lWaWZjTzl2?=
 =?utf-8?B?bktkL0IxdUVGMEFabGRTQXU0WGphdlpReFowQ1ZZSjY4UHlTVUh6UXorQjNp?=
 =?utf-8?B?NjRTZzU4UmZheUgvSUszQjM1VytPaHJRaTBWMTgwbjhFbmxHbXZMQ1Vib0h6?=
 =?utf-8?B?UFBCNmZmblU4cTBCdld3b1VKdHE1TURMc0JUcDJDcHZFTVRlajF3NDdGV2JF?=
 =?utf-8?B?RXdDbHY5T0VYa0VnRkppYm9NUUFVZUZIVHcrY2dJWTkvWTFtK2VVOEdVNTlB?=
 =?utf-8?B?Wmh4U1BENFBnd0l1dGxDdWZKUE1Mc2RGVjRDZDN3NXVFWEdybXV6UXY1TjV1?=
 =?utf-8?B?YTdRL0cvVFR6dHl4cnhEQVp2ZW5oUVk0YWdEM3JUcldVZ0Rzb2JFZk1tY1J1?=
 =?utf-8?B?YjRqREZNQ0dUZUpkMWwxMUJuZWZ5ZDhZaWtWV0k0OUpJTlRSSXAzUFB2YWlR?=
 =?utf-8?B?N0Y0UnNvN3ZOT2lOaW4vMzlzeFF6ZHBJSU1tbFdwdDNCM1pWTi9pbVZCWGk1?=
 =?utf-8?B?cWZQTElaY0N4VWcxTHdRL3hqeW1vZkF3RFBqNnNJYll3cHl0VEFhMFo0dWhE?=
 =?utf-8?B?QlYzRDdodzE5bXNDMGhtREJLZU02Qnd5NWZxYmZtSUV3b1Aya0s4KzA3MzBM?=
 =?utf-8?B?MnAxWDdPMHFKSVZETkdjb0tsaXpuY0kzV2tTOHRjaXBSeCtmbHlaRXBZTHBG?=
 =?utf-8?B?M0FMZUtLSUdBdTdoa0pVb1h5cmswQkQ0S2NkQkpaSTljUW9FSTBVdU1rYlNm?=
 =?utf-8?B?WnNFSitqeDVVQytPaXMzS1p6TEhMZmdid2ZWNjVraEVqNWxrQ1pDYkJUZisx?=
 =?utf-8?B?aVJCdnVCSHA1YW1rVy9uVFVHeUNFbUwwWEk5dGVvbG5kL1RoQ0pQTnJ4WWoz?=
 =?utf-8?B?c3JpelE1b1RJRGZjc3NMVnptSWI4NXhlZG04dXAxK2JQZVNYTEx0bml2NXJw?=
 =?utf-8?B?ZFErR2UwSEh6YkxUQ3FOckFJdDJNY3pKREFoV0wwNWZxVkVMa0ZHcmQzVzZ1?=
 =?utf-8?B?YnplWFErZTVwVXhQaGVvMFZUWVVZUTRKeC9JYzI5cmZCMEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0tXczZlMktxbTVwTU1RVk0yUWNiRHRDZ1VWM3hDczd5bGxiZmlKcDJvcnFN?=
 =?utf-8?B?WEd4N3loWHRBS2NPN2tQWXhCajBhT1pWc21Tajl2T0k3K1FKWEpIVVdpOFVu?=
 =?utf-8?B?NnVzUjlKTTRlVUlvTnpBQlZVRTBlOE9GUXhsUnFtUDk4ZmlTL3dxRU1BWmxY?=
 =?utf-8?B?WXRDZGJjcHZDbGpSR04vbnREcW51K2k5U0QyYVdjR28renUxNy9jQ2Zkc29n?=
 =?utf-8?B?YXdUWnlOQ1AwOFdTdWJHYVR5VGZWMXlYcXNOR2czbm9GWkpyaE1tYnRoUlIz?=
 =?utf-8?B?emUrWk80bWpnbUovTWdpRXMyRWlMeklrOTEzWHVmbTRDRW9vU1F5bkFTaVJz?=
 =?utf-8?B?NEVaRnpjWENIK25aU3dzdGpsL0FVQi9ES1dxeUJDbEJZdUJVS2t5dXlJazNK?=
 =?utf-8?B?RVpJZS9oSTFzS3lXUnNjclM1UDFXZjVVeWVwWksvK2RGTmcrYUZ3aUcxdWov?=
 =?utf-8?B?Y21WejJJWk9UZ290Y3ZHR05pTkVLRTJjR3l5TUhzdmtoMVhYME5QcFF1OUVt?=
 =?utf-8?B?ajhnS1l0MW5mRTRxSEFsdmZrcitZd3crdDFXZTFYU2hFQjMxYkhGSnNISDY5?=
 =?utf-8?B?VjJJYzdOMU90eWNLa0srRnJSMU5yT2Mvd1B3NjJZR2NrKyt4VjhLRWNXRWcz?=
 =?utf-8?B?YVRHcXdNR1RTNWMzc2pFdlNsaE9WSFRoZ29EOVhidy92T1pXWERVZXVEbmov?=
 =?utf-8?B?cmwyWktnRy9sbTRKVlBEaTBFU2VERHFMV3dreTBvdStlc3JJSGhyeDYwR1k4?=
 =?utf-8?B?ZitxQ054WHZnWFRvUlRnM1hOTUtNNVA5eSsweGJSUlR6NGZtZmY5cFlxRkp2?=
 =?utf-8?B?eklTYVB4bVZYdCtaY0FoUHJwOUJxY0RCVTBaeTNwQ2RCa3lkUFFtcGFKUmFy?=
 =?utf-8?B?TzRGOUVDSUNmQW9kd1FJQkYvajJVRXdYUzNxOXlWNEtYNTJCU3JNeCtuTDBO?=
 =?utf-8?B?c1kvUEFOYW1zUERldVdrUGt1d1ZlblBCdUFYNStFNEpmNE4yWGFpais2YWpJ?=
 =?utf-8?B?bTdKTEdJUmd4K1ZvL29ZSDY5MzhEU2g1Ujc0ZjNEeW9Tc1JBenhiNXBXeXFs?=
 =?utf-8?B?aXRieGxPVE13Snk5TnJqT21KYTkzaThtUWpQTnBXSHVKTU9YSkp2REMzMGVi?=
 =?utf-8?B?MUIyLzNRVEROWG9HZkh2UEhTRUR3bXdaVFhDaFdaQWlTb3BLYVozRTQ2dzBI?=
 =?utf-8?B?UEtqbHJNaXRuRTBYYTZleU5GQmdXVjVtQkZWV211ak1lOWNjeXFvc0V6Y0s2?=
 =?utf-8?B?Ty91RTNWWXFQZ0xPWWl2NFpLazNlOG5IVWl2SGluVDRLRTlzVmNVdUJGci9Z?=
 =?utf-8?B?aWZqUHRjclhLU0srbjVKU1hQRXFHRzBEVWRRemZZbUx6Ni80Sis4M3pNeGlJ?=
 =?utf-8?B?dkpzZVRGV0Z2N1RKWVVlTU8vaHlZTEpRN0JhT3dLeUcwbGlTMWdBeWhsa1dM?=
 =?utf-8?B?R3FRWHhJR2pDU0I1UnhydFFMMXNqMWV6MFdLVDBRZ2w1eURCdDJZbEY5RFRz?=
 =?utf-8?B?MXpyU1JHMXdMcmMra29PQ0o4dk1jU003UGdFWW5Oc0pHSUZJS3ZVeUczSnk4?=
 =?utf-8?B?RWJQK1ZKUlhQVXRqVDA0ZWVBT0h2SXhTWTlRa1FKckxjS1hmYXNGS0RCU2lh?=
 =?utf-8?B?aE5sUlAyTzR4V3BpQ1MrTVVNWVozbTFEdHl1dHZ4a1V0WnIvOGtoYm1hTTJv?=
 =?utf-8?B?TE9KTHkrNUYxbEp3TTZ1eldHc0dDSXFBMzFVeHp3a1BHa1dHR0F4N2UwRE80?=
 =?utf-8?B?K3l3YW9UWFBJTVRnYTB3akVTYVRvbCtEbjJtRFhqL2ZqT2lUNjJvZFNQMmxL?=
 =?utf-8?B?eFdoT2t4a0hGcmttN3R0MFozY2dHVGgxL2F2YkVmeTB4b0R0YndCWGovSTFp?=
 =?utf-8?B?eHJLSCtWNXF4ZzhOR1p0RzhWRWd1R2U5aEdvRDdZSFRjQi9lYk1uSjM3cmc2?=
 =?utf-8?B?Mms1S1N2ejVqOFoxVDFHWFMyMkJRbWtyMXdWelNHcEdIbFNRaEZGN0pTYXE4?=
 =?utf-8?B?V2FsWVoxNys1Y1RLZzNaS285WDBKZTN1MGsySExrZlNReHFBUytDSE5pL1Ri?=
 =?utf-8?B?d0krNnR2UFV5dmp4UjRRSzl3R0JCc1J0VmMvU2xKcjNOY2o2cG94SXM2eEsy?=
 =?utf-8?B?NW9lbXUyMFp1TXI0ejBURWpvT201OGJRR0JtVlJ1aHIyc1BlbHkzeE9GK2pY?=
 =?utf-8?B?c0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2b7863-763a-4c72-7f22-08dcc3709e6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 12:39:24.1172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QIjSmy/pHxrEg2ptzysfSwtbl2jV5Wj5jXxQyKo9efGSExlMT0UBU6iZFX10/d98vfXUG/6V1j0GqULnVQYis2u6NBxBCP56coQ6rqmbrSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8145

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBBdWd1
c3QgMjMsIDIwMjQgMTozMyBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDQvNF0gYXJtNjQ6
IGR0czogcmVuZXNhczogcjlhMDdnMDQzdTExLXNtYXJjOiBFbmFibGUgRFUNCj4gDQo+IEhpIEJp
anUsDQo+IA0KPiBPbiBUaHUsIEF1ZyAyMiwgMjAyNCBhdCA2OjIz4oCvUE0gQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBFbmFibGUgRFUgYW5kIGxpbmsg
d2l0aCB0aGUgSERNSSBhZGQtb24gYm9hcmQgY29ubmVjdGVkIHdpdGggdGhlDQo+ID4gcGFyYWxs
ZWwgY29ubmVjdG9yIG9uIFJaL0cyVUwgU01BUkMgRVZLLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYz
LT52NDoNCj4gPiAgKiBSZXN0b3JlZCBwb3J0cyBwcm9wZXJ0eSBpbiBkdSBub2RlIGFuZCBwb3J0
QDAgZm9yIERQSSBpbnRlcmZhY2UuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0K
PiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDN1MTEtc21hcmMu
ZHRzDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M3UxMS1z
bWFyYy5kdHMNCj4gPiBAQCAtMzUsNCArMzUsMTE1IEBADQo+ID4gIC8gew0KPiA+ICAgICAgICAg
bW9kZWwgPSAiUmVuZXNhcyBTTUFSQyBFVksgYmFzZWQgb24gcjlhMDdnMDQzdTExIjsNCj4gPiAg
ICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxzbWFyYy1ldmsiLCAicmVuZXNhcyxyOWEwN2cw
NDN1MTEiLA0KPiA+ICJyZW5lc2FzLHI5YTA3ZzA0MyI7DQo+ID4gKw0KPiA+ICsgICAgICAgaGRt
aS1vdXQgew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImhkbWktY29ubmVjdG9y
IjsNCj4gDQo+IFsuLi5dDQo+IA0KPiA+ICsmaTJjMSB7DQo+ID4gKyAgICAgICBhZHY3NTEzOiBh
ZHY3NTEzQDM5IHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhZGksYWR2NzUx
MyI7DQo+IA0KPiBUaGUgSERNSSBjb25uZWN0b3IgYW5kIEFEVjc1MTMgYnJpZGdlIGFyZSBub3Qg
cHJlc2VudCBvbiB0aGUgU01BUkMgQ2FycmllciBib2FyZCwgYnV0IG9uIGEgc2VwYXJhdGUNCj4g
Ym9hcmQuICBIZW5jZSBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIG1vdmVkIHRvIGEgc2VwYXJhdGUg
RFQgb3ZlcmxheSAuZHRzbywgd2l0aCBhIHN1aXRhYmxlIE1ha2VmaWxlDQo+IHJ1bGUgdG8gYnVp
bGQgYSBEVFMgZm9yIFNNQVJDIENhcnJpZXIgKyBIRE1JIGFkZC1vbiBib2FyZC4NCg0KT0ssIHdp
bGwgc2VuZCBEVCBvdmVybGF5IGluIHRoZSBuZXh0IHZlcnNpb24uIFRoZSBvbmx5IHJlYXNvbiBm
b3Igc2VuZGluZyBsaWtlIHRoaXMgaXMgVkxQIHBhY2thZ2UgdXNpbmcgY2lwIGtlcm5lbA0Kc3Rp
bGwgZG9uJ3QgdXNlIERUIG92ZXJsYXkuIFNvLCB0aGUgYmFja3BvcnRpbmcgd2lsbCBiZSBzdHJh
aWdodCBmb3J3YXJkIGZvciB0aGUgdXNlcnMgb2YgVkxQIHBhY2thZ2UuDQoNCkNoZWVycywNCkJp
anUNCg0KPiANCj4gVGhlIGFjdHVhbCBEVCBkZXNjcmlwdGlvbiBMR1RNLg0K

