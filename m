Return-Path: <linux-renesas-soc+bounces-7299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACB92FBB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A923281677
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E82E16F29A;
	Fri, 12 Jul 2024 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hVU+10Wn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431F02BB15;
	Fri, 12 Jul 2024 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720792036; cv=fail; b=jZQrgFNrq9WHz3vPmSQPvZUhIqbnw6nxocPlRUiWiNyxDgL+BT9Ha7A357p7ESLp7jwYK7pwgP88z6anyB6tA48XO99YFos9q2ou41ArvtORcCFW1MMKhTLr2o7FpggB7n3hsQ3zCtbu+K9evb8sP+bwUmcHGNzZQgjJncVMxSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720792036; c=relaxed/simple;
	bh=2Bvkip9MRba8SvQ9VHPGpqRStDxesl8vna8mbQykv78=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pZYHubGIE8xUdl+0gb8It3IThTOYE3kCrn0mw6b20JP7PMh8C+5MF6VvClf+SU7ZMw1eENOQwtPOgP3sxVpqS0zMxSbcK+KS4OtKVbzmtXqVrcSUHrHX95mdmeLfknU/v1rWwxYOoxdfTVsYLLcfnZV1IPeVgkMGSQrhHYK3HQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hVU+10Wn; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0RHq1TMU34s/f+aF48pLuEzj6tbdXnuiKxGSZ5ugOlt1YB8SB/cmvMqjPjxSdxvCa/iICOzY49hrihDkpId8X7vmBm/+H5lKZGoTcRclnHWL6QhA9MyaE/U5dZHxNnaHLnzYc6S0s6P0Z0e2Z63Ybg2KfN7fQUVuuLTlZVmonhdEDYL6bJ7We5iCQXv3UK03nv7QKMS2G6rGYQjMNpsUb8QSSpBnmlK6Y3i7nCRtPFodJ1FDNhzURMAe3o2QnwLN8znlgwzaDqRlZOZ6RBdrnRBFbJyOd3aHyO7riYc9gNm4JnEsg5+UFIyaMEsN6ZKiJF+JHbHE9r9GSltcOwJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bvkip9MRba8SvQ9VHPGpqRStDxesl8vna8mbQykv78=;
 b=T+hRsueMN0MFrsVc3e/TDZexLF9KvhGgVPQYcA+J0biFGEQR79+olf8SQFcZjs7zT6zIiwI4KPsMgeBwojB54XFNX8q4wAE7i0OmIEcoDdIdY12c0aBz67FXRriXZdzzc9yd2H9B+7+U1WBsh0G+7hgUSsd0qbyZoOUfbAPmysgF0PwmA+Sj1ui2EVH0jpyjdg6fGuP/dfoAKsZjc9/aUP9AdH+T0pqCAvdZ+b2/bCyut3oarnFV+9uQBxqSfGXSRlGgRc0UysXv+sPx4Q9LmD73l/v7p5g+51dheYVTbEJCRxVl+E+Ynbp6XtwccDFvoTwCjqGcDwLqeBLsVr7R7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bvkip9MRba8SvQ9VHPGpqRStDxesl8vna8mbQykv78=;
 b=hVU+10WnfovI9zytm/3+qtvbNWNEZriqYQnoxpxgtHW7OFWSR4pkoXqQ8VYOymvz85FeeGm2ggxr9XW6RbsLR4xzEzN5yNIheBpC7bAz13Nj0GX9/qORINY7hUU9WpRdZwX5NEXr1pRntSOg6SBqEY4qG7Upy1Fk/FInGvEnncI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSYPR01MB5526.jpnprd01.prod.outlook.com (2603:1096:604:90::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 13:47:11 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 13:47:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Conor
 Dooley <conor+dt@kernel.org>, biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH v2 4/9] clk: renesas: r9a07g043: Add LCDC clock and reset
 entries
Thread-Topic: [PATCH v2 4/9] clk: renesas: r9a07g043: Add LCDC clock and reset
 entries
Thread-Index: AQHa0gc7XG5nvqEjcU2D8Gp4gnEMD7HzHxWAgAAAtXA=
Date: Fri, 12 Jul 2024 13:47:11 +0000
Message-ID:
 <TY3PR01MB11346A52B747313489763C52D86A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdVgnSwb5FwdgNZ1O2NtYGiY+9j1oC_2YTTUYq0W8+PoXQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVgnSwb5FwdgNZ1O2NtYGiY+9j1oC_2YTTUYq0W8+PoXQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSYPR01MB5526:EE_
x-ms-office365-filtering-correlation-id: b035d98c-a6e6-4303-bf55-08dca2792188
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dk1OSG15eXR6U3pRVHFZbnJHcmVTTSt2VEhYbnA5MlJmUllPNEY3MG1YbUZE?=
 =?utf-8?B?bUhXcDBxK1VRWDl2RnkrUzl2RW9Vejl0a21uSVRRQUVTbEtTZDR1dFI2alFT?=
 =?utf-8?B?VWRBQUFoa1ZpUGpuN2Z6NnZQdXk0R0NJQWdPTnhrOHFoVU83bzE5T2Yya2dJ?=
 =?utf-8?B?Mmo0MXdhdC9hNTE4dGFkVTJXVlNqd050SnNRUDdkazg1S0Y4YVFramc1SUNY?=
 =?utf-8?B?TCtxQVBtc3FCN3dScFpMeEpST0ptZ2xOMGg1c0hWd1ZQSGhsQ2JTU2lwSytL?=
 =?utf-8?B?UHlmQ3N3YVFxMUEveEJ4cXlsZENJdnp3aHlSWC9PSWJpcitsNmY2czlFbDBR?=
 =?utf-8?B?dHRnL3g2TmtVc2RON3NTTnpwbmphMWVBdlhTK0p3R2VWVTZPTFNxRldMRXRp?=
 =?utf-8?B?WXo0WUNjSWpkSmh5cklkOHorN1VUQjRNeHhQd1ZyZ3p3N3U3cHdzRUowWWlT?=
 =?utf-8?B?NG1SN1NreU5oalV0K3R1NGJIUURuSThhSDZac3liNEZQYzdqRnkwM0hHTkEy?=
 =?utf-8?B?bzlyVEtJREM5S2U3UGJzWStEdGxWSVkwVWxSaVVBM1BIOC9NTDlXR2pIUEpr?=
 =?utf-8?B?Szc4U1I4RjZ2VjFrUWRuVFV4Skg3MEhXVHdOOGJSeDZqcmFTNkk2U2gvcWtk?=
 =?utf-8?B?ZHN0ajFpL0o3RER3bW94dDJoS3ZDN05kR0trd2x4TjR1bTdyS2hFTWI1YnBK?=
 =?utf-8?B?UzBuc1V2Ukp6YnB2MFlLd3NnRllSN0pFSzgwb3FZRjNZeTIrOTFIbm1YM1pn?=
 =?utf-8?B?N1F0dnorNTUvWjd0b2NTUXFTdWlwWWZLNUNyYWRiTDJwMWMydUhoaGxwVG1I?=
 =?utf-8?B?eFozTSttZmdZVUhaekJWSGdjZms0N3Q2cTFUTU56djFHV0JSaW55VXlMcHkz?=
 =?utf-8?B?NTErcTRDaUhZd2xQNDdFUUdOWXFDWXpYM01rTlVuQmRVZmVkUTJXNHZEZzFr?=
 =?utf-8?B?eUw3VFJsMXBqY2pvN29GR2w1M2xNUmZoS3hJbW1jbHpzaEpKbmduRVVUM0Fj?=
 =?utf-8?B?WWNWRy9uaEJjNlM0dWNaaGgxa2ZRUFVUNGpiWGNHdjA4aEZqdzlFSHRjaWhW?=
 =?utf-8?B?Q1hLN2pZcHVMenN4YStucHZCYjlhU1ZHZnpGdU84T0FFeVVKRS9Mbk01bURn?=
 =?utf-8?B?RGo4OEFDVVZLVVVuRjg4WkZrRUtNYkRLZjJyKzF0TUFuTm5nNVk4eVNiTWQ0?=
 =?utf-8?B?ckFkamFrcm1ONXZ3bWdTclk1amVPb3NFQ1Q4cTM4WXg5TUt1d2dJL2hrc0l0?=
 =?utf-8?B?SCtJRDBzQUozZWNTRU1tTzhRZUhHRjFnQXQrWk8vOHhwdyswWW54cUl4WGw1?=
 =?utf-8?B?NUF0QlVuQjh4YmdvakhyN0Q2OEFrSmVNNW5ZZXhCSmgrb3hrWGZ5WGlvTHlL?=
 =?utf-8?B?QjVKQ3hXaXdBSmZhb0Q5L0cxSTBXb2ZHS3plbmNGSEhLTnMydC84MkhGeUM5?=
 =?utf-8?B?MTlkV3dkUEVjTTZkem13MHFkSWRKbXZLMG9YVjJHQmV5NWwxQitwclFVZHRv?=
 =?utf-8?B?Z0QwR1JXRHBDWHpKblExRGJzTlkzZ2ZDN0hrM2crMHMvbC9EejF2VUlyU2d3?=
 =?utf-8?B?RU1qakZXNit5Tmd3aWRDcGdOcFEzTFVvVE9uamtYZWU2eC9CRFUzUC9CZVV0?=
 =?utf-8?B?L1NtbXhrZEdpd1NwbDNFeS95S0t4NDFjR0l2dmJqK05vY2x3TUVLWm16Z0k4?=
 =?utf-8?B?TktnYmx3c3FnVlFMNThKMjJIMHpJWmZrcmNjZEFDZ2pReUxuTkZ3SUIzZHN6?=
 =?utf-8?B?dng5UkdObm1nWTBkU2VlQWtvRjZlekgveWxVRTVNMkhHN2JMTThSK3lBOURz?=
 =?utf-8?B?Sk8rWFQyUTNCdFM3Q3EzMXVDU2JQbW1vZURtMFdxd3huajJJb3dCTGM2eXVl?=
 =?utf-8?B?VUxlWWZhbHFYUHhjVXFET091dnVQbXdjdXZMV096M2s5SVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGxCbkd5Z1FOV3gyT3d5MGNrZG54dDRwUVg4ck5rREpnT2J1VFpVTjRCb0F0?=
 =?utf-8?B?S3pTbVN0ZDl5U2dySVF4RGI0eExBOU5ucmcrVEtQWjN1MVd1VjhmK090c201?=
 =?utf-8?B?N2VJZUhRTUJ0Qmc3czRTT2M0dFR6UlFnL0lZMUtWaHZsNGduYmIxT1N6ekNm?=
 =?utf-8?B?bWE0USt2TmtVaHdzVisyaWwyV3JDTmxUak0xNmY2TlNOVllMbGJLVld5V29q?=
 =?utf-8?B?RGR2VzVRUUVRaTNlbGFYWVVlaUZVelFkK1Y4ZGx1NmFRcnErS0pYcWVjNm1U?=
 =?utf-8?B?dG5raUtQT0pKNGY0UXg5VythaEJ0Z0FoU3NVUU1Dd2pueWxPS0pUd1V2UEcv?=
 =?utf-8?B?MmFJaXdGOXBJVjQ1Yys1Z1VCSlVBejRkTU1FVi8rYlViU1p3RTBETC9pdUk5?=
 =?utf-8?B?SytDSGJFSGdBRXZpQ0c4QUxZVDFnc296bjg1dnhncnI0UTczVW15QlFZK2FR?=
 =?utf-8?B?c3NidCtoclVDcHlhTG85WnNSN2JpUUVjUGtNWllkZm9HbXJXSTNxd3BMbmsx?=
 =?utf-8?B?eUY4V1dVeFB2KzhDUHlTVFE4QnF3TWZ6UmZ0Tk5lMkZqUkx1Sno0N2EzNDMr?=
 =?utf-8?B?V2tib3Via3BVOWxGeUdLbnVpbFpWV0d5UEsyeXRjOHBzaDRQaDY5Z2lwOHVT?=
 =?utf-8?B?S0dRVFNzdGxXSldWYVFBTGxWQzIxRDlCOStlbVRUTjdLaGJQelhQcHRIS1NW?=
 =?utf-8?B?MjNIVS9PV0dxSVYxNnAzQlN5eXNUNGZWOGUvRTZOME1Da2RiZ3p4RUpjdkE1?=
 =?utf-8?B?OHphT3FMMjgxM1Y2WHVmMnJ1VlIxbUNlL2hIV3F0dFdHSURkK2htL3FUOGsr?=
 =?utf-8?B?TVhrMHpiRy9TUDQ0QTVhQjhQd0pSMlVCWExmczludENRb1gzLzNCaVJhN1lr?=
 =?utf-8?B?b0FjVHBmQnNXM3pXeTZ4RWRtcFhCWmpENHV6SEUyd0FWZWs0Zzlibk5WLys5?=
 =?utf-8?B?VlVjZzhGaVR0b3F5N1BTcnpjb3AzY21ISjJtSXZIdW9HbnFNV3hjRlBLYy9X?=
 =?utf-8?B?NWhkcXhZTWRnYzRtQjNWYk4wVUVhUXN2MzBXN0M5Wm5sQjVONWVPMXpqYkU5?=
 =?utf-8?B?SWNjcmVsMnVzZVV0NzlZcDhKbGkzNWhPR0swcnJISmZRaGVMUkpOTy82dDlU?=
 =?utf-8?B?MkYyWkVnMjlsYktQTHVaODlKRjZtT0pqbUJaeUx4STBTY2w1b2tOWnl2M29o?=
 =?utf-8?B?ZW9jTHNnNFBES0RwWUpURWM4Q3JFMXoya0pwTnkvVnYvTnZLN1E5QUZqSlow?=
 =?utf-8?B?TktyR3VpUWJlZi9nSmk5VUlHamhXMFZLMG01bDdib1dKdzdTbSt2NXRNa1RY?=
 =?utf-8?B?azMzdU8yRDVHaDFpdWlLT0lsd1FBa3FHbXBPQU9EWmpweWh6bzg5cEp4OXNm?=
 =?utf-8?B?Sm5JYWsrMDljY1N0L3A2SE5FcC9kSWR1M1ZwK0NKSlVPVm9tajNQdkZKZWlu?=
 =?utf-8?B?MEI2Rnc2MnZqYUhHa0x2VVNlN2R3ZXlzbGVxbElKd3g2UkI2U08xYitJYTU5?=
 =?utf-8?B?UUJyK2pPNDRnZlhrK1pSRkNmQVd0UzIwSDQ4WFVCRnFWRHdQM2RwSm0weW9O?=
 =?utf-8?B?RExSSkhibmVvdk1oa2pkd3JoRmlWTk5QMzg4KzFDY2JBYTR5cmNFYnB1Slda?=
 =?utf-8?B?T0hEWGFPK1I4NlhjM1pzR21PbHRZbWE1amxKOXRIdTdtZmVBVll6YzhMN2sw?=
 =?utf-8?B?M3hqRmV1M083bXJvc3gwMGdyck03aWJnYjBLY01ORi9yc1R6SVNrTVlnanQw?=
 =?utf-8?B?c05vV25Fb2lMdUNqb2NxM0wxcVc1ZlBNQzNSUWJHWUx5cnRBZVl4RGZORG5x?=
 =?utf-8?B?RStrOUpyMVFzTlVUdExJL1VNVlRpS01MWUh3L2hqREtkQnNFVjU1ZWJybFJh?=
 =?utf-8?B?MThVZnNLdEx5dkYzTFZnOHRNVHREbGxOMHROYlRralBDcm42M0ZoSWlObnpK?=
 =?utf-8?B?MDBIS2hFKy9pOU5GK1hTRlJDS25xSDhiaGJoVnl4MXRQQmd0cTcyMU9mdnNx?=
 =?utf-8?B?Q0lNSVQwcXppNi9FWHozWDkxTjBqaTJCV3hid2tKQlhoSmY5Z29jY2twN0Ru?=
 =?utf-8?B?VWRiWXNzekRhNzBlUXJmeW54U2IxdE5Ma2JGVWVYcEo3NVcvU2lkNUU0cnY2?=
 =?utf-8?B?YkNtbTdDVzJ1ZUhvUG45ODVlSjZNa1lpbndYR2E4RElIdllYZ3orc3B1NXZu?=
 =?utf-8?B?T3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b035d98c-a6e6-4303-bf55-08dca2792188
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 13:47:11.6754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KN+Kn5r7MnBPIMS08U3fYjlsbqTqyv1zyqyZNeX8I6ktpF5W4eKA4ebHPzdyjIWDyg9eHmr6eyr/NhIdG+KjoF+fv/zU220hckS3g+EIhhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5526

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKdWx5
IDEyLCAyMDI0IDI6NDQgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzldIGNsazogcmVu
ZXNhczogcjlhMDdnMDQzOiBBZGQgTENEQyBjbG9jayBhbmQgcmVzZXQgZW50cmllcw0KPiANCj4g
T24gVHVlLCBKdWwgOSwgMjAyNCBhdCAzOjUy4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgTENEQyBjbG9jayBhbmQgcmVzZXQgZW50cmll
cyB0byBDUEcgZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2Fz
LWNsayBmb3IgdjYuMTIuDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDdn
MDQzLWNwZy5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwN2cwNDMtY3BnLmMN
Cj4gPiBAQCAtMjA5LDYgKzIxNCwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJsX21vZF9j
bGsgcjlhMDdnMDQzX21vZF9jbGtzW10gPSB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAweDU2NCwgMiksDQo+ID4gICAgICAgICBERUZfTU9EKCJjcnVfYWNsayIsICAgICBS
OUEwN0cwNDNfQ1JVX0FDTEssIFI5QTA3RzA0M19DTEtfTTAsDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDU2NCwgMyksDQo+ID4gKyAgICAgICBERUZfQ09VUExFRCgibGNk
Y19jbGthIiwgUjlBMDdHMDQzX0xDRENfQ0xLX0EsIFI5QTA3RzA0M19DTEtfTTAsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDU2YywgMCksDQo+ID4gKyAgICAgICBERUZf
Q09VUExFRCgibGNkY19jbGtwIiwgUjlBMDdHMDQzX0xDRENfQ0xLX1AsIFI5QTA3RzA0M19DTEtf
WlQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDU2YywgMCksDQo+ID4g
KyAgICAgICBERUZfTU9EKCJsY2RjX2Nsa2QiLCAgICBSOUEwN0cwNDNfTENEQ19DTEtfRCwgUjlB
MDdHMDQzX0NMS19NMywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4NTZj
LCAxKSwNCj4gDQo+IFdpdGggdGhlIGFib3ZlIGNsb2NrIG5hbWVzIGNoYW5nZWQgdG8gImxjZGNf
Y2xrX1thcGRdIiB0byBtYXRjaCB0aGUgY2xvY2sgZGVmaW5pdGlvbnMuDQoNClRoYW5rcyBmb3Ig
Zml4aW5nIGl0Lg0KDQpDaGVlcnMsDQpCaWp1DQo=

