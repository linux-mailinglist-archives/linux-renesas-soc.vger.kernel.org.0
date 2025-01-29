Return-Path: <linux-renesas-soc+bounces-12693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CFBA21F79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 507D03A1BFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 14:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A587199B8;
	Wed, 29 Jan 2025 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GIKXu9zn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511ABDDCD;
	Wed, 29 Jan 2025 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738161931; cv=fail; b=Scoe7oXrD05gSQQCCvLe+iBOujeDFk59AdaqkhTff34OKcWJn9lbIBoUKuPt4Df78y29ZNBRo7E++81dP3/1BzyuJPcmfiQjgnkDoU6SSvI8rys134ZXJXnM+RZqkYPJBgv0bt2BYyrbY4lvpCs6eX20H/u8KlBGnQGggsWvRyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738161931; c=relaxed/simple;
	bh=qkgS3GVS9jeWmXrpWwHLc6gczqVBsuowH229s4VCWbY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JNiItAEUYy25ou+ZBB0ca79Tx7W6WxHgF3xlHihq6j92yxNJvxq+eOeeQAPwI6Gd2g7WTaj3KNykgVrJp1cKeKtIxYpXdwzJ/iuyjbK4KPjwlZoIUIXNJcIsfgAGPXpePuNuBe4jzFtKwbirO4DkyF0V1cnysn7RBs3pR6Ui4hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GIKXu9zn; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAVP0UgYGPyr9Q+OQtd2msRingSQNCGr+6tToSGUSjgtyFlOwAuYDudiuxttG5CLGA5MuD112Ja0bSoL3Ab1gcAlv9XoO9ZoQSfsNMHjJUcx7mG//gzNBjlOE9TIjGZezxDnAqIyBqC6zf6BGmW6PNUc26mJgUWIg+dJ5X/sOqD808afnEnnnSTIKqJA/MqbfUU4gFW/JWUPYLk9HIuGQdeTri5SKcwpww71cndsmywrqmXHi1G6+1yHvv3M8+EHwZ6MEfNxNyI3qNTCLim1wj02y3WgQlzMO2/Hy4YYBvcxVKCSoZxX0+UF/FCpUAbXkO1DCim9058tIKdCPqQ3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkgS3GVS9jeWmXrpWwHLc6gczqVBsuowH229s4VCWbY=;
 b=tj9a06D9mF6pj0ZsUJjf9/4prGwMGipllEBaBNJNuNOOgatI4YSXQeP7Cqh8Ap95k8qd0EePHBNBMaztllbcAjzBc+1poPuekhQcYpTLRhtH5o/B9Ssil1XkeTdnN5qYHSsrMvfg4fzOz32nEAOqQJem3XiUv8xYUtgw8/N4yDEzUshhAHN1sJbG+HeKB9FtZ0HWm3tshblPLMiRwlsQDuJq77KgOr1bDh+PZD3bgo2EjzW9g1ZZXAQzrO/7s1GULyOeCKxb6cw4Yp/2LzEF+0/I9Jua6LhiQFOBWU/OKu8i3SDZmrmIOwfxL+uD5PwOoKuAHslAWIF5M3DfVT8etA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkgS3GVS9jeWmXrpWwHLc6gczqVBsuowH229s4VCWbY=;
 b=GIKXu9zndReJIagKynhLeDIzRe86VHkTzYxDXWl16QV+x6Z/IuSAY3MCkksMNLSCMgT9vn85EzsQbGBtXmyUsIHSnuD3ZGnFA76ptbBpMD5mDTyrXB6QVi5xNNdAoF9yL1PLhnQPNNHrlP39Sa4+hyDDIFIrHkcewC59FOkfpPo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6389.jpnprd01.prod.outlook.com (2603:1096:604:e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 14:45:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 14:45:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 4/7] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Topic: [PATCH 4/7] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Index: AQHbb/jEZGuIIdhuZkOjIsue2ByHV7MsMhuAgAAAU6CAAaU2AA==
Date: Wed, 29 Jan 2025 14:45:14 +0000
Message-ID:
 <TY3PR01MB11346522AAB2956C00FC5BB1A86EE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdXfxSRsaBQ-wRq0C6j5znQUQPSzhPigLyvU+DTOHyckfA@mail.gmail.com>
 <TY3PR01MB11346ADB42D7CC3736A70BD4D86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346ADB42D7CC3736A70BD4D86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6389:EE_
x-ms-office365-filtering-correlation-id: 2929ff9e-a4c9-4a35-6690-08dd40738a6e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TndhelhHcUJIU0F6eTk0N0hQd0dXSDhYWU1CV1FzUDBCSU9jVENPQXJjb1hR?=
 =?utf-8?B?YVBxYWNhbkNxcmV5UVZiY1Z4RnlxMmtML0s1cWQybFQ2NitrZzFNWUxKOGUw?=
 =?utf-8?B?OGpqZjNRWlNpZjJINjhhQ3FESVY4Q3RCUVA0TWh4WUVLUi9yd2o3NkM0eDR2?=
 =?utf-8?B?cUtKcHlSbEd6cFMralVIRzlLdlBlYjhNNXMxLzdoYkRmVEYvVEZJSHlrbWtR?=
 =?utf-8?B?MURLWTVTVi90YTd6bFZ3elVyY08zbWJWVGZaTVJ0bGk3c0hwN0todGRDbUsw?=
 =?utf-8?B?K1lURnpmOFJxS0dLeGxQZFF3cmo1blpvT0g2Sm1PQVA5UE5sbms3aXFNNzBj?=
 =?utf-8?B?eENDL0dxb1lkdmdxKzRpWmhpaS9qeEJjQVZnK0d0bDNMZTFwdHFaNFFXRWVL?=
 =?utf-8?B?MzVKR2E1VEVTTlVUZExRQjgyNUh4RHF1d01qTjhuMFlZcGRaZ0kramVFcGpC?=
 =?utf-8?B?NGVoNmFKVElkTWdOVkZldUhabE1US3V6YXNZTnQ0WGVid1I0a1hqMDc4T2Jx?=
 =?utf-8?B?SHpFbWhYNnRQTjRuMDFxODhYS2lINkNiRFB5RlBYRnIxOFRNWWxEaGhHZzlu?=
 =?utf-8?B?N2tuQmc3TVgwVEh3NWNjaUlFNllZNVJKeXE1czFlcmlzZlRZTkY0OFdpdSt1?=
 =?utf-8?B?cmZTa0VxdXlnaDV1ZmdMYWVFN3NadU9oOStPb2xSWjcxUGtZeUxSazB5WjRS?=
 =?utf-8?B?NGpJNVQzUlFhQ0l2MUdUVXQ0bDBybnBNY1RrMndrRVZ0eldMWUhvK0lCek1w?=
 =?utf-8?B?SjQrQnhHaWFKczhOelBYTVBrQXdHalRZdHRLNmtWWE51c1pnL0cxQ0poTFZJ?=
 =?utf-8?B?VDkwTWoxY01UMk9wMW1VNTE5akZ2S1Z0VHF6UEVtWGRDMEFuZzRKcTBFL0Vl?=
 =?utf-8?B?Q05ZRVEzN1ByMDZ3ZW5qbkhZdkRDUFd6VVZpNmNWQmxqUkNITmVscHE4VG1F?=
 =?utf-8?B?WTdFRjkyQnVqcVBrNlhyNVBmVnJIMFNmeTJPWUF0U1N4TnJDd1JsSXNOTHFP?=
 =?utf-8?B?ODdRYjIxWGovK3gxSUpUcnJlTExZSFlKcHhiNDIzZCsycXRhWkNnZ0U3NEI4?=
 =?utf-8?B?Tk9hOXlGdUt6YTBReTNaYUVFRE1pajFEY1pGY1h6WThCRWNqMjJlcm5iRE5U?=
 =?utf-8?B?dGhodmlHTnd1TjBCdFdPRDdFU3dPOEJSTDFTN2pLTkdERnp6bHdadEdtRjBJ?=
 =?utf-8?B?ZE9YVDJNYjlDWld6cWpQM0FNemY4OFJaTGJGSDZiNWNaUjcrbVk1VWpwMXNs?=
 =?utf-8?B?Vy9uN3MvK05zbUNOWVJycDZoUmpzNG9IQktxaWRSaVBVUjBBTlVDUXJ2ZTdY?=
 =?utf-8?B?MVlteGV3aUh4NHFKQVdrOG4zaEJZa3pJNDRHVkVEcUUvS2NzNlQrZVRZaVVB?=
 =?utf-8?B?YVVjVGhuR3FJNUhsT1E0T3p5OTZUd2t2WHV2alRZakpBc0toVng1S3lURGcz?=
 =?utf-8?B?WDRrRlhmZkQ4L2wxaUVSd0NrZnByVWo1VEQ5R1RRc0hZUDdvb1FkbTBsaU5Z?=
 =?utf-8?B?aE1oNXBPZGtiemd3THlOd1laL0ZScjU4YlB4eEtWSTZ6Q0tYNHBRSXlIYjZX?=
 =?utf-8?B?cVQ0WkE2OHpKYkxHT2lHZm13T3VZL2FuZVhyTnArVmxXbVEvcjJuTy9SV0dU?=
 =?utf-8?B?TW5QdXRQdFJBOHErWWxBMGs4b25aeWt0cXloQThoVVhpcTh0WFAvUnpWQ3o2?=
 =?utf-8?B?ei9RT1hENXNkdkl6MnlKeVdKVW9JVlN2NHhnb2NpNFhHZStzQ0xYeHNNOWdR?=
 =?utf-8?B?OEtnMEE1aGNSTktQaVI2cFh1REFWeUNtYlQxK3hKbGp6bkh6ei9lY2ZVWEtx?=
 =?utf-8?B?RlJpcUdGRUpIL0pWaVNvS1Q0bmdkWkFUQnBWc25ZTXVrOXgzZ3c3bGUyeVA2?=
 =?utf-8?Q?llnEOn83JdO6C?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFhkKzludzZzUFhMS1VOVEpyazZVVThhOW9tTXh3OXpZZzZJLzMzRW1Zc1Rk?=
 =?utf-8?B?anN0UVhIcGlqOUlCemNQaUtkazQ3N2h1dWlrbnYvNzZLTnRCS0ZBZXRBTWI0?=
 =?utf-8?B?SWlHOVZJdVNPNmpKYmxWazBaK0R1enNpTlhRY2RBdUJhMGxLYmJjUXBDSzdY?=
 =?utf-8?B?K3orRVhxb1AvOU44RWJ1cEpKNG9iNUNZTmx1S1F3bmlGeFJmcHNMbXJ5OFg0?=
 =?utf-8?B?NTJHTUkxQkh5Z3NFOGUxS2ZpZDRRU1R0VUUxUXQzbVJrUm9iMDNVS1QvZGRJ?=
 =?utf-8?B?cWVVZ0FnVDVUbFZnM0pSZGUra25pS1pVMEhaai8wYVFrQmQ0SHhML21jL2Zs?=
 =?utf-8?B?b3VCYThqZ2FPeVJuTDJrVXg4S1VpdGN0VU5oR0pJNDJKTVdmektXTE5tWXZ5?=
 =?utf-8?B?L3pETEExYVc3cllsUjVZelZXaDd3VjQvUGVYbC9qckdsVDZUQm5XY09Sdkxw?=
 =?utf-8?B?cXdDZ3RLQWtqN21FaE9Tb0xYWE5tQ1FBVTRuQmFNSU54MDd3a2hJYUZWWmtL?=
 =?utf-8?B?WVUyVFVZM1hjR2VIV2JJMmdCTERLYzIzMlFhdTg5NUZiRSs4SWYybU5VUWJB?=
 =?utf-8?B?OUo1UWV6bUtSK3gxWG5kTFZUVnhGbkExS3Nna0VuVUNSQW1scE9xbVpBbk0r?=
 =?utf-8?B?MHA5QkV1MnhoSlZ0VHo3QTc3UG55ZlVqVmVFRnJhck5OWExnYWFXMFZ2cFdq?=
 =?utf-8?B?K21SeStFY3h3TndXbVdmR3ZleDFsSzQ1M3pnTkYrKzEwMCtTR0ZrZndCNWpK?=
 =?utf-8?B?YkdqZUpiY01jaEZRYU02REtjYlJYTkFRdW1JeG1rZ2N3OTVGSFZIRGc3a3p3?=
 =?utf-8?B?aDVMYWw5MGw1MTZTSU9sUnlFK0d2OEgyUkxsQTlxVUhUZDduckdJSkYxdldq?=
 =?utf-8?B?RnFHbWdibUROZC9zZC90bEgzV2UwQlVCSm5lWGtheHpzemwyNm9LRldzalRY?=
 =?utf-8?B?RVk0Kzk4bGZhMnREZTVMSzJ6TS9JcVZrcU5HQlVxbWthV1U4NUlsTXo2NlRD?=
 =?utf-8?B?NFRqU0lLb2s0R1RJRjlhQmEvSEhWOXJXdkdFMGgwS1ZzeWlFWE15bjQ2V2x1?=
 =?utf-8?B?Y2hLcjRLUUIwamJTNDMzL0lRNU0zK05DVUVSaysxZWVJT3dkTUV2VlVrOEtj?=
 =?utf-8?B?VFM0aXpwWFowNDZYYS95dnhpQ0NhcVpMREVOa29wT0FxbERjR2lwSmx0YVhq?=
 =?utf-8?B?UTQ4UFJkQ1A1YkpDdmZJNlBoeFVLT1ZxQ2JFMnZRb1hka3R5UmwxSWI2WDhO?=
 =?utf-8?B?UDNjMWcyMEVUUk4vaHByTlhJa0s3WmlOWE9KS282UWdGUC9LMkhiMmRHeURa?=
 =?utf-8?B?T3JjZml4RlV0MXFyc2RTdTZSTWQzK3g4UFpOaXdmT2JJY0lXTTNvamx2TlJ0?=
 =?utf-8?B?cUswSzRCSWlSM3BseTVrMks1Q1F6enR3dHBUdzZTV3doWjZscTR4UHFMM2xD?=
 =?utf-8?B?c01pKzMrbldERjJOVWhDWkhMWWVMbGxSRzdGQjZJOWJ1bkRrbDVuS0VGcDg1?=
 =?utf-8?B?ZGNQZnRydkh3cnVPK1lWYVFPWlRwemZ6MGVyb0NEMExqRFh6Q3oramRoZ1Nz?=
 =?utf-8?B?d09nLzJ5ZDJZaDQwYnhSK0lLS3hrelNML0NIcjdTZG8za1paTXBCbnF4eVlJ?=
 =?utf-8?B?eGlMTHplMklGNG92aVRuSGlmTVJ6eWx5aXNzRTgzNWJRQzZ3RXNtRldIaDhX?=
 =?utf-8?B?WEt4MjNQb2JEQ1Q0NjZXT1FXSTgwUDdKN0p0cUZ3N29IamxJTnU5eXdteElq?=
 =?utf-8?B?WU1nbVlUVnVqQ3hhdWg3MCs0ZXd2T21wZFRnTjlMaG01azk2eDRGcVVrYzE3?=
 =?utf-8?B?Qmx2dzdoL05ZTjJTWFIxcVdLam5mTXlTSUhib21SdjJKUHNZTzFGKytoVTBS?=
 =?utf-8?B?MWErbkRPWis5c1YrSzE2TUxkblJ6UVpqTTIxUWQzVllyTS9VY3NFUmxXK2FE?=
 =?utf-8?B?N3RNUDErTXhTeElnbEpPQnpQTkZxSTYySitrcUcrbTk4cnZldVlXRzZ5OFlK?=
 =?utf-8?B?SG43SXdRQ0F6dnRnNHVTaHlsV1FBNWkyU0FtcjRyNWtOcGpDQW4xbGo2WHNQ?=
 =?utf-8?B?ZW4xeGhKYjR4RFVVSGZ3cWVRenZBSWxGZTBUMzBQVnloTUM0dFhxYjI5V2FM?=
 =?utf-8?Q?OhNrYGxK99x2H5G4HZwo//rVs?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2929ff9e-a4c9-4a35-6690-08dd40738a6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 14:45:14.3867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7ZEoB68eBHcgJtFRLrzPpTevkk2vjYvzVKFGkvHAo1ahNcUW3pbi3M2JCijxhk9+rK7qz5gXjrtrEspqB1Cno0mSD+e8pocSJTl/MSMjag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6389

SGkgR2VlcnQsDQoNCiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gU2VudDogMjgg
SmFudWFyeSAyMDI1IDEzOjMyDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzddIG1tYzogcmVu
ZXNhc19zZGhpOiBBZGQgc3VwcG9ydCBmb3IgUlovRzNFIFNvQw0KPiA+DQo+ID4gSGkgQmlqdSwN
Cj4gPg0KPiA+IE9uIFN1biwgMjYgSmFuIDIwMjUgYXQgMTQ6NDYsIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBUaGUgU0RISS9lTU1DIElQcyBpbiB0
aGUgUlovRzNFIFNvQyBhcmUgc2ltaWxhciB0byB0aG9zZSBpbiBSLUNhciBHZW4zLg0KPiA+ID4g
SG93ZXZlciwgdGhlIFJaL0czRSBTRDAgY2hhbm5lbCBoYXMgVm9sdGFnZSBsZXZlbCBjb250cm9s
IGFuZCBQV0VODQo+ID4gPiBwaW4gc3VwcG9ydCB2aWEgU0RfU1RBVFVTIHJlZ2lzdGVyLg0KPiA+
ID4NCj4gPiA+IGludGVybmFsIHJlZ3VsYXRvciBzdXBwb3J0IGlzIGFkZGVkIHRvIGNvbnRyb2wg
dGhlIHZvbHRhZ2UgbGV2ZWxzIG9mDQo+ID4gPiB0aGUgU0QgcGlucyB2aWEgc2RfaW92cy9zZF9w
d2VuIGJpdHMgaW4gU0RfU1RBVFVTIHJlZ2lzdGVyIGJ5DQo+ID4gPiBwb3B1bGF0aW5nIHZxbW1j
LXJlZ3VsYXRvciBjaGlsZCBub2RlLg0KPiA+ID4NCj4gPiA+IFNEMSBhbmQgU0QyIGNoYW5uZWxz
IGhhdmUgZ3BpbyByZWd1bGF0b3Igc3VwcG9ydCBhbmQgaW50ZXJuYWwNCj4gPiA+IHJlZ3VsYXRv
ciBzdXBwb3J0LiBTZWxlY3Rpb24gb2YgdGhlIHJlZ3VsYXRvciBpcyBiYXNlZCBvbiB0aGUgcmVn
dWxhdG9yIHBoYW5kbGUuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiA+DQo+ID4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9jb3JlLmMN
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+DQo+
ID4gPiBAQCAtMTA1Myw2ICsxMTY1LDIzIEBAIGludCByZW5lc2FzX3NkaGlfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gPiA+ICAgICAgICAgaWYgKHJldCkNCj4gPiA+ICAg
ICAgICAgICAgICAgICBnb3RvIGVmcmVlOw0KPiA+ID4NCj4gPg0KPiA+ID4gKyAgICAgICBpZiAo
cmNmZy5vZl9ub2RlKSB7DQo+ID4gPiArICAgICAgICAgICAgICAgcmNmZy5kcml2ZXJfZGF0YSA9
IHByaXYtPmhvc3Q7DQo+ID4gPiArDQo+ID4gPiArICAgICAgICAgICAgICAgcmVuZXNhc19zZGhp
X3ZxbW1jX3JlZ3VsYXRvci5uYW1lID0NCj4gPiA+ICsgInNkaGktdnFtbWMtcmVndWxhdG9yIjsN
Cj4gPg0KPiA+IE5hbWUgY29uZmxpY3QgaW4gY2FzZSBvZiBtdWx0aXBsZSBpbnN0YW5jZXM/DQo+
IA0KPiBUaGlzIHJlZ3VsYXRvciBuYW1lIGlzIE92ZXJyaWRlbiBieSBvZl9yZWd1bGF0b3IoKSBh
bmQgaXQgd2lsbCBwaWNrIHRoZSBuYW1lIGZyb20gdGhlcmUuDQo+IFNlZSBiZWxvdy4gQW0gSSBt
aXNzaW5nIGFueXRoaW5nPw0KDQpKdXN0IHRvIGFkZCwgd2l0aG91dCB0aGUgbmFtZSBpdCByZXR1
cm5zIGVycm9yIHNlZSBbMV0sDQoNClJlZ3VsYXRvciBuYW1lIGZyb20gRFQgbm9kZSBpcyBwaWNr
ZWQgYnkgWzJdIGFuZCBbM10uIFNvIHRoZXJlIHdvbid0IGJlIGNvbmZsaWN0IGZvcg0KTXVsdGlw
bGUgaW5zdGFuY2VzLg0KDQpbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYu
MTMtcmM3L3NvdXJjZS9kcml2ZXJzL3JlZ3VsYXRvci9jb3JlLmMjTDU1OTcNCg0KWzJdIGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEzLXJjNy9zb3VyY2UvZHJpdmVycy9yZWd1
bGF0b3IvY29yZS5jI0w1NjU5DQpbM10gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djYuMTMtcmM3L3NvdXJjZS9kcml2ZXJzL3JlZ3VsYXRvci9vZl9yZWd1bGF0b3IuYyNMOTcNCg0K
Q2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiByb290QHNtYXJjLXJ6ZzNlOi9jaXAtdGVzdC1zY3JpcHRz
IyBjYXQgL3N5cy9jbGFzcy9yZWd1bGF0b3IvcmVndWxhdG9yLiovbmFtZQ0KPiByZWd1bGF0b3It
ZHVtbXkNCj4gZml4ZWQtMy4zVg0KPiBmaXhlZC0zLjNWDQo+IFNESEkxIFZjY1ENCj4gU0RISTAt
VlFNTUMNCj4gU0RISTItVlFNTUMNCj4gU0RISTEtVlFNTUMNCj4gDQo+IENoZWVycywNCj4gQmlq
dQ0K

