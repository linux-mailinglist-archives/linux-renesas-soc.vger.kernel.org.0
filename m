Return-Path: <linux-renesas-soc+bounces-12317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA43A18F89
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 901FB3A222E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5978318CBFE;
	Wed, 22 Jan 2025 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kZEnsjT2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598B8145FE0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jan 2025 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737541042; cv=fail; b=H89mOLBIHKQhKUQZmL47WDIerfcWCsCqiAsRiBfU6MtGsh9J8nDVoPKak4zQVz/AtOWJbg+4nP3IjsiIc7gsO7AY2sp5rEAyIb2Ykq9gcBHurOwISudKLeHhsZ2mCyU1fsYokNoHRTVQ0QtzM9F0xJaWHINkLOnPwk5TSfccdDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737541042; c=relaxed/simple;
	bh=GOaKbu3eCpMhzqDL1vg5jz2ajs8tOp3Qe2Qxgio4130=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pVdEHPMHeQqAwkgUJa7INQ7nsR3pobIPU9tAqPuDVx6lqmG+kT/Iw5HxcWMQ5vipwY6inBkb08NJ1qg1C/W/Kfq2U3PUMBi+Kp7G3j+l4072m6FEEWRqDv71QkeKRPqoZke+tiMuBBSoTLcPX5ME55K27u5X/Yd3y0891hw7KHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kZEnsjT2; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCnmhIP46J4F1/NWd3wrKk9nWL0lLK+clCk/Zs1D/cgPHsDp8/Rs86kVchOE6SECnpi+5yPlgFthlIWc2HqHD+cQfhInnSE/hVCUD2WZDLrkeg6Hrlkyyiv6Kt0ws/h3eLgnRfobAe/uLTHaJbtcLNudxBErSn8RzNS6XwzBvDWRmZLne3bX3Ag7bUoCHIt48NdbgotwZSC7q7kx6gdU9k7xcR3rITlxfNoFc01Evds/LQyKuZwV3vCVtG/lETr6N2tVexvvRmeV1fjGISZiT60xQ+yR0zFQaP12dbgvu6gEQnNc1pOPhrJraXZf/doOrkdL1uMopineI5ENFz2jKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOaKbu3eCpMhzqDL1vg5jz2ajs8tOp3Qe2Qxgio4130=;
 b=XE90EUrPlOVF0XjQi69xWOXGphw/XwlxCwYw2uvji7vAXEgnsta9Q5NUR/zuyg2khON75T7nx+aEXEYmpNAGlUQ16y3pWu7adlGMidEnOhICPpQM9HQJ3N+W/ua7PZee37+huQTfIFnAO2mg6bu+ZNBEHH83S8Z3rSJpFNmsald9ZbYbpUIJRVft0tkVlq38t2CFhrr0taVP6J8KbIf7KG7BuAIrJV515mHhEWCfM3IObIR5VyH+IZbhZNH7CeR+KGH1BJAJLNKN+d5CogHoH5UGWwjOeLf3IGDNvvUjQWZGujFZErDEGycGTyCMKmQByWfiRed9JdFKg6dOXFLqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOaKbu3eCpMhzqDL1vg5jz2ajs8tOp3Qe2Qxgio4130=;
 b=kZEnsjT23ZMTIgy7PyOPyn4fWZPjqLpyC+UW0Eh9c3FSC9KhhPxXC+eTbqQdFDrgPLhM9+pohgF4AAiElhDa6yYe7qIv576hvyMYE97WpAtyVCNLTIg69WN9LeMwmHneIDJ/5mSeL+SG31uNXvoa7D8jtVVCJWg/ellEakWk4hU=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS3PR01MB6533.jpnprd01.prod.outlook.com (2603:1096:604:100::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 10:17:13 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 10:17:13 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 05/11] irqchip/renesas-rzv2h: Add struct rzv2h_hw_info
 with t_offs variable
Thread-Topic: [PATCH 05/11] irqchip/renesas-rzv2h: Add struct rzv2h_hw_info
 with t_offs variable
Thread-Index: AQHbayBfALgRqVEqdkqxYKeD6bVHPbMilviQ
Date: Wed, 22 Jan 2025 10:17:13 +0000
Message-ID:
 <TYCPR01MB12093DB42DA9206185A3BEBBBC2E12@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250120094715.25802-6-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS3PR01MB6533:EE_
x-ms-office365-filtering-correlation-id: f18618d7-9740-4854-d25d-08dd3acdf0ad
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkQwK1dISGcrbnlZeUtMV3NyQjBsc1RacW5YK2VxQWJtRysvUzJvMU9UeVYz?=
 =?utf-8?B?M3B3cGZOUUVEd0gzU2g2a1NwR2Nub1ArZmI3L1ZYTVk5bHdWUm9RYlN2V0ZO?=
 =?utf-8?B?dEM1QnZpbEljVU5rQVRNV1BFbWxTamFiaVNlV3NyRzAzcFpKVVpVOXZIaTU1?=
 =?utf-8?B?RG5lTDFERlFZNVo1RTcxWGUrbzVtNVBOL0V5Wi9POGtvS2tRcDh6V2tYamdH?=
 =?utf-8?B?eUltc0piSWdGUnpEd1hyL2ZJOW1iKzlKU2pISkQ2TlpUK0ljYXJ5SWVlUkkx?=
 =?utf-8?B?Z1lhejdZRUFlYUsrbHh4R3JoZ1MwMEFwTnkwQlJMbGVQVGdEQms1K1FBM3pw?=
 =?utf-8?B?MlFEdFlNbVFlbmMyTm91eFQ3Q3cxR1BkZGVmVUxrVzFHbG1jQlhZY081TVZu?=
 =?utf-8?B?UC80bmZ5MzNHYlJMaUNlUFA2eEdjdk8zbVR6c1ZVRHRrRVJKYkFNY29rWnNs?=
 =?utf-8?B?YUhZMFJOL0N2YVRjMGZOZm1DSmJtdHNoMlBTY2djQTdna3g5N0RoUUdGOEdv?=
 =?utf-8?B?QnNMaThCcEVvWVVJaTIrdmJIT1ZlYW4zOWttT3FhbThQcU9jYVkzL1VyZTVU?=
 =?utf-8?B?b01tUERjSmhBaWpjZkhCcjI0OXZ5LzNIcE40STVXdTNZZnRXeHA2RWtvakdl?=
 =?utf-8?B?U3I1UkpsR01DSlRVWnQ3cm1CUGFLck51eGp2UHprRm5xOHlFaCtkMndoNHR2?=
 =?utf-8?B?VityV0s1NXREbzFXaU85Y0R5WGIwV0oxcnlSR01Pa3FhMTZpY0dYdkJhZVJM?=
 =?utf-8?B?enhwR0JYUlpEWXNyYVdjSnpRRy95dm9LWTdZbXhtMlFHbng3SGMwRlRFWVk3?=
 =?utf-8?B?ZUlkV3dJS1FoVXgyN1YzQmlDeTVIRXMzYWJuOEVRQldNTnFLSlhhc2lrYmdF?=
 =?utf-8?B?L0NRUUdjWGpNUkwwTUlOVjFBM3JUSURicUZadHlNRmgwNW5HVkNUR285UDhQ?=
 =?utf-8?B?d1JUd3licXlqOTRUb1RBSk5WRTNuS1kyNGxnVlZLY0dnRUExRlE5TDhZenFr?=
 =?utf-8?B?R3BSNUt1UmR3dHpaSVFRTEY5NFVNb2Y0bENtS2M3d1ZPdE9lL3RtUUZiTDZw?=
 =?utf-8?B?ZTFJNEhWUXdZZzMzWUM0SEFyVVVPbEVvVjExRDlCaFpJc0F3dVV4S00xRHk1?=
 =?utf-8?B?Njl1ejRDUjJTWkU5OXc2QUZrVUI1Z3NGNzRVbGZobjZJWlBjUlBuc1ZHL3FD?=
 =?utf-8?B?TFBJUlhBT2xaME0vUmJidUN3Q0ovWFlLaXNRYlZ4bURiWlVSSlhnMUFNOWJ4?=
 =?utf-8?B?NmZkbUlBZ2hlV0lPVERRVkt1cVJmT3ZFNVNPSDJWZ0ZjWEtSa0trUFRXdG8z?=
 =?utf-8?B?QUFCWXZ1cUhHZ1I0bGN0ZW1hS1FSRjJMV0tsWDBVclU4aHU4Ry9NVW1MLzJL?=
 =?utf-8?B?MGxxWFJSYVpabXZIOEx3ZUFXVy93a3JWMHc2d1ByUCthNGI4bnQzZVRJT3Nj?=
 =?utf-8?B?S3NoNUVZbElZNTY4VkRtSEMza3hxb3UvZWFxQnRWSGFpZGxMalJnV1p4NUFS?=
 =?utf-8?B?ZVNZZDI5NzV3QjFtc0NEOXpKcGQ1bFpNTGxJaWtDcGR3TGdVU3RGcVlNaWhQ?=
 =?utf-8?B?UG1GaGlaVy9qcjRueUZCeUJENnQ0bTFhUEJBaDBicU5IY1FuRW8vQ2pvTitV?=
 =?utf-8?B?UjRVeHFxTWprM1J0ZFljdm1SVUZldDNCT2lVbUdqVEx6N0pRWDFrMG0rUDQ1?=
 =?utf-8?B?VVV0Y2E3K2FIUVQ3NkkwNjBkak1vQTkvbEROMUlSUkxIV2FWQ2VqN0Q0R0pT?=
 =?utf-8?B?SFo0djFmMGJVSGNZRlJxMzdzSTNwRitlZ3Y5TVdJTXJ3a2o3S3ZqY1RwY3Vk?=
 =?utf-8?B?ZmhYOHBOMHR5ejNBb0FWYVcvdDNGdklUb091WWIrQjhtdHF5YjdXb25keW5v?=
 =?utf-8?B?UlQxeE1sZ1VsaGh4Y09FTG5LU0tpcVBhSUM3VVY0NmhxbnRydnlQbGwwVjdL?=
 =?utf-8?Q?I15z+/CnyGSb7k1qUxpO33nAIPWGNqS6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWVRN25BcWN6MkwyemlXWEVJWXcwR0hGczRCWkJJcWV4eTVja2RFVWptR1BQ?=
 =?utf-8?B?cExJWUk1YTVPNW94QmhaWW9KbFR0WVoxbFVwZS9KMXlGUEdoK3h5c05nSkpp?=
 =?utf-8?B?bk9yaWxYYXVZdW1MaEdudXppOFZ1T1VHZC9Kb2xSclZ2ZGJyeURJcFd5cGJC?=
 =?utf-8?B?OEluQ3RrQmZPMWpxZGdRbHJKeEF1bG5oakZlUk1jU1hxeEN0Q1RzVDZVb203?=
 =?utf-8?B?dVptZVNkNmI1YS9QUDRmUjlmdzYyT3hsS0cxWmJnMUd0d1E5ZkVHQ0JKUWNW?=
 =?utf-8?B?eHdncGhZdThVZDBMS0lzUUR5UnNjTE9taldLVjhnbEYrUkZsM012eGZaU294?=
 =?utf-8?B?L2F1RUd0MTdQQWVGUnVua0FWZ1I4d3hVUjRiT1l1bnRrcDNsU3JVTFNZYVF1?=
 =?utf-8?B?TWswbXdjTld1VFZWQVZpOUNPSDN0R1RQMG9IUThUNDFQNkZFN0QyWTJ0emZw?=
 =?utf-8?B?VEphN1J6dExTanFrT0Q4M1VoME54T3hTTVBOT0VEVVdVSTk0ZFZ0dXFWc2Uz?=
 =?utf-8?B?cjhoY29XZUNGZjFkeER6bVJMTGw3Szc2Y2xnYzNYNFYvNndTcG5aV3RHR3Zr?=
 =?utf-8?B?V0JRQ1ludlA1U0JZVStoRytmY3BLM09HaExYbit6NTJwQlpuYnVKSkJPbjVB?=
 =?utf-8?B?blQ5NXM2cC8xcDV2VnkxS1hzbGlaOXU1MWc0WTVnTkNoUjlISUhMRERSUXYx?=
 =?utf-8?B?V0VBa2hSK3ZtWldvdUJid3AzdXhXcTl0ODV2SHMxWkRPVUpMY1VWSFJqSmpx?=
 =?utf-8?B?NkxrMXJjSEk0cW1UOXNWZHpUdmx2Wm1IL3cyMVIyTDBWWGRUVTVYL2ljbis1?=
 =?utf-8?B?KzR5d3VWeG1FMFZNTmtuU3BQWGllTkJDbllQdUt4TFFKaHg2NndHTGlHdmli?=
 =?utf-8?B?eWFmSTFvNng1bE5saEtXRmIzMkpZeXlRenR0Y3RTNy9ZSXE3OTdxbSt6MGxU?=
 =?utf-8?B?dXdpRHE2T3REU0hCNzkzbDczSlRsb3VFN0lWcEROZHlJT0VZMHZJaTVtN09w?=
 =?utf-8?B?Tm9jaEF2YlFocXFOTEdSSUROWHltKzN3bTB5UHVXNjBpalhsVzJwOFQ1aEJD?=
 =?utf-8?B?STJBVW1wS0lITkxYRzJlSForQ0xaRTNzMHBlWVpOWDJncVR3SUkwUmJGYSti?=
 =?utf-8?B?c2ZpOFIvb0RoK0FmOFVWd0VzUGZ2bWk5RmxuVm9OdU9Fb1JVZ04zMFdOL1JI?=
 =?utf-8?B?VzlBam42ZFNzbE1nMFJHWTJoYnFVaUdHUlNTSCtkbFFKeWpHb1pBZVlzZS9l?=
 =?utf-8?B?UjhUWkxnYVBYejRKdzRXOUovUHptUnhZWGRmUU5QRlA0bHk0d3VBSVNHeVpI?=
 =?utf-8?B?U2FWL0c0cy9pZzdDbnJsUkdFT1NOV2JQY0RJeGhEZFRIZHlkTkhScitxZ1dm?=
 =?utf-8?B?dDBwbjBsczRyNjRrOVA5NXViOXRDbzRIODR2dEVsZGN3eHcxS2Mwc0w0SFh4?=
 =?utf-8?B?QXI2Y2thcnB6WThpQUlPdmtIaU15VVAwaVNxYVJDOXZUaExhaWxEeU1jeS9h?=
 =?utf-8?B?b3lTZGxXOVY1dGw5Sm5oY2VNN281V0VybVhkODVKQ0I5cVVXeW5wbXFmbVBu?=
 =?utf-8?B?SEEyQVhKcXprbHo0ZVJZMzFxdGQ5MmNIOUpDTUwzQmhVOWIzWGErVERveVpq?=
 =?utf-8?B?RFEvT3kwNGMybk1EcnRzd3FWWmRGQnVienl2VUFacVRwSlpkalpmTllHNTVi?=
 =?utf-8?B?ajF4L0IxMDQ4WWJZV2h4Qy9PSjBwbEtEUG1nVG1pNy9IZDQ0SXV0dmVlR0Fw?=
 =?utf-8?B?czhrbWVORHZUU2pWekYzTWIyd1I0bEJObDFsWiszM2h5Q2Q5RStwV2czTlJN?=
 =?utf-8?B?a24weWs0aW53bkRReWNNa1BJTnJPclJrQmNQOTJ4QTNWOGZldkpZTWFQTCto?=
 =?utf-8?B?UTZEMFFkZ3JkOXFWYWpMcnp5Q2tTc1hoZ2VGTEtIZVNITGpSaURGbi9JQVpw?=
 =?utf-8?B?Q2NtcEhKN21XbnZ5V3U0K21Lbi9uWTNLT1ltWnhaVlh1Q0pjN2xQWVIyNVFZ?=
 =?utf-8?B?TjNXNWE5bVhBOVVVVDR6elhUT3puZFlGdkswK3luRlhDTHF0bjRUSjZQL2VL?=
 =?utf-8?B?bEMrV0daMmx2RzA0Z1d6QjgraktBWmM4Vzl2bE80RXJiVTR4VHgvNUt5Q2lz?=
 =?utf-8?B?dlB0S2dqQ0pZSklsMGtjQTYvc1Q5d1pra2tQaHY1Tyt1cnIrWTVaRzU1WGlj?=
 =?utf-8?B?cWc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18618d7-9740-4854-d25d-08dd3acdf0ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 10:17:13.6931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjsdJTlV8RDa+0Hs495ryVop3XZROnwdQ8rGOVIehW8Hgszhsw49Zvka7VqIHdh5BAi+tnEpAFgFH8BCguOJzqAGJiArJSJY/iHF6341N8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6533

SGkgQmlqdSwNCg0KVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KDQo+IEZyb206IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gU2VudDogMjAgSmFudWFyeSAyMDI1IDA5OjQ3
DQo+IFN1YmplY3Q6IFtQQVRDSCAwNS8xMV0gaXJxY2hpcC9yZW5lc2FzLXJ6djJoOiBBZGQgc3Ry
dWN0IHJ6djJoX2h3X2luZm8gd2l0aCB0X29mZnMgdmFyaWFibGUNCj4gDQo+IFRoZSBJQ1UgYmxv
Y2sgb24gdGhlIFJaL0czRSBTb0MgaXMgYWxtb3N0IGlkZW50aWNhbCB0byB0aGUgb25lIGZvdW5k
IG9uDQo+IHRoZSBSWi9WMkggU29DLCB3aXRoIHRoZSBmb2xsb3dpbmcgZGlmZmVyZW5jZXM6DQo+
IMKgLSBUaGUgVElOVCByZWdpc3RlciBvZmZzZXQgc3RhcnRzIGF0IDB4ODMwIGluc3RlYWQgb2Yg
MHgzMC4NCj4gwqAtIFRoZSBudW1iZXIgb2YgR1BJTyBpbnRlcnJ1cHRzIGZvciBUSU5UIHNlbGVj
dGlvbiBpcyAxNDEgaW5zdGVhZCBvZiA4Ni4NCj4gwqAtIFRoZSBwaW4gaW5kZXggYW5kIFRJTlQg
c2VsZWN0aW9uIGluZGV4IGFyZSBub3QgaW4gdGhlIDE6MSBtYXANCj4gwqAtIFRoZSBudW1iZXIg
b2YgVFNTUiByZWdpc3RlcnMgaXMgMTUgaW5zdGVhZCBvZiA4DQo+IMKgLSBFYWNoIFRTU1IgcmVn
aXN0ZXIgY2FuIHByb2dyYW0gMiBUSU5UcyBpbnN0ZWFkIG9mIDQgVElOVHMNCj4gDQo+IEludHJv
ZHVjZSBzdHJ1Y3Qgcnp2MmhfaHdfaW5mbyB0byBoYW5kbGUgdGhlc2UgZGlmZmVyZW5jZXMgYW5k
IGFkZCB0X29mZnMNCj4gdmFyaWFibGUgdG8gdGFrZSBjYXJlIG9mIHRoZcKgVElOVCByZWdpc3Rl
ciBvZmZzZXQgZGlmZmVyZW5jZSBiZXR3ZWVuDQo+IFJaL0czRSBhbmQgUlovVjJILg0KPiANCj4g
UmVmYWN0b3IgdGhlIGNvZGUgYnkgbW92aW5nIHJ6djJoX2ljdV9pbml0KCkgaW50byByenYyaF9p
Y3VfaW5pdF9jb21tb24oKQ0KPiBhbmQgcGFzcyB0aGUgdmFyYWJsZSBjb250YWluaW5nIGh3IGRp
ZmZlcmVuY2UgdG8gc3VwcG9ydCBib3RoIHRoZXNlIFNvQ3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQoNClJldmlld2VkLWJ5OiBG
YWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCg0KQ2hlZXJz
LA0KRmFiDQoNCj4gLS0tDQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnp2MmguYyB8
IDQ2ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzQg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVz
YXMtcnp2MmguYw0KPiBpbmRleCBhMDJkNDc1Mjk1NjQuLjE5NWNlOWM1ZTViNSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gKysrIGIvZHJpdmVy
cy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gQEAgLTgwLDE2ICs4MCwyNiBAQA0KPiAg
I2RlZmluZSBJQ1VfVElOVF9FWFRSQUNUX0dQSU9JTlQoeCkJCUZJRUxEX0dFVChHRU5NQVNLKDMx
LCAxNiksICh4KSkNCj4gICNkZWZpbmUgSUNVX1BCNV9USU5UCQkJCTB4NTUNCj4gDQo+ICsvKioN
Cj4gKyAqIHN0cnVjdCByenYyaF9od19pbmZvIC0gSW50ZXJydXB0IENvbnRyb2wgVW5pdCBjb250
cm9sbGVyIGhhcmR3YXJlIGluZm8gc3RydWN0dXJlLg0KPiArICogQHRfb2ZmczogVElOVCBvZmZz
ZXQNCj4gKyAqLw0KPiArc3RydWN0IHJ6djJoX2h3X2luZm8gew0KPiArCXUxNiB0X29mZnM7DQo+
ICt9Ow0KPiArDQo+ICAvKioNCj4gICAqIHN0cnVjdCByenYyaF9pY3VfcHJpdiAtIEludGVycnVw
dCBDb250cm9sIFVuaXQgY29udHJvbGxlciBwcml2YXRlIGRhdGEgc3RydWN0dXJlLg0KPiAgICog
QGJhc2U6CUNvbnRyb2xsZXIncyBiYXNlIGFkZHJlc3MNCj4gICAqIEBmd3NwZWM6CUlSUSBmaXJt
d2FyZSBzcGVjaWZpYyBkYXRhDQo+ICAgKiBAbG9jazoJTG9jayB0byBzZXJpYWxpemUgYWNjZXNz
IHRvIGhhcmR3YXJlIHJlZ2lzdGVycw0KPiArICogQGluZm86CVBvaW50ZXIgdG8gc3RydWN0IHJ6
djJoX2h3X2luZm8NCj4gICAqLw0KPiAgc3RydWN0IHJ6djJoX2ljdV9wcml2IHsNCj4gIAl2b2lk
IF9faW9tZW0JCQkqYmFzZTsNCj4gIAlzdHJ1Y3QgaXJxX2Z3c3BlYwkJZndzcGVjW0lDVV9OVU1f
SVJRXTsNCj4gIAlyYXdfc3BpbmxvY2tfdAkJCWxvY2s7DQo+ICsJY29uc3Qgc3RydWN0IHJ6djJo
X2h3X2luZm8JKmluZm87DQo+ICB9Ow0KPiANCj4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IHJ6djJo
X2ljdV9wcml2ICppcnFfZGF0YV90b19wcml2KHN0cnVjdCBpcnFfZGF0YSAqZGF0YSkNCj4gQEAg
LTEwOSw3ICsxMTksNyBAQCBzdGF0aWMgdm9pZCByenYyaF9pY3VfZW9pKHN0cnVjdCBpcnFfZGF0
YSAqZCkNCj4gIAkJCXRpbnRpcnFfbnIgPSBod19pcnEgLSBJQ1VfVElOVF9TVEFSVDsNCj4gIAkJ
CWJpdCA9IEJJVCh0aW50aXJxX25yKTsNCj4gIAkJCWlmICghaXJxZF9pc19sZXZlbF90eXBlKGQp
KQ0KPiAtCQkJCXdyaXRlbF9yZWxheGVkKGJpdCwgcHJpdi0+YmFzZSArIElDVV9UU0NMUik7DQo+
ICsJCQkJd3JpdGVsX3JlbGF4ZWQoYml0LCBwcml2LT5iYXNlICsgcHJpdi0+aW5mby0+dF9vZmZz
ICsgSUNVX1RTQ0xSKTsNCj4gIAkJfSBlbHNlIGlmIChod19pcnEgPj0gSUNVX0lSUV9TVEFSVCkg
ew0KPiAgCQkJdGludGlycV9uciA9IGh3X2lycSAtIElDVV9JUlFfU1RBUlQ7DQo+ICAJCQliaXQg
PSBCSVQodGludGlycV9ucik7DQo+IEBAIC0xMzcsMTIgKzE0NywxMiBAQCBzdGF0aWMgdm9pZCBy
enYyaF90aW50X2lycV9lbmRpc2FibGUoc3RydWN0IGlycV9kYXRhICpkLCBib29sIGVuYWJsZSkN
Cj4gIAl0c3NlbF9uID0gSUNVX1RTU1JfVFNTRUxfTih0aW50X25yKTsNCj4gDQo+ICAJZ3VhcmQo
cmF3X3NwaW5sb2NrKSgmcHJpdi0+bG9jayk7DQo+IC0JdHNzciA9IHJlYWRsX3JlbGF4ZWQocHJp
di0+YmFzZSArIElDVV9UU1NSKGspKTsNCj4gKwl0c3NyID0gcmVhZGxfcmVsYXhlZChwcml2LT5i
YXNlICsgcHJpdi0+aW5mby0+dF9vZmZzICsgSUNVX1RTU1IoaykpOw0KPiAgCWlmIChlbmFibGUp
DQo+ICAJCXRzc3IgfD0gSUNVX1RTU1JfVElFTih0c3NlbF9uKTsNCj4gIAllbHNlDQo+ICAJCXRz
c3IgJj0gfklDVV9UU1NSX1RJRU4odHNzZWxfbik7DQo+IC0Jd3JpdGVsX3JlbGF4ZWQodHNzciwg
cHJpdi0+YmFzZSArIElDVV9UU1NSKGspKTsNCj4gKwl3cml0ZWxfcmVsYXhlZCh0c3NyLCBwcml2
LT5iYXNlICsgcHJpdi0+aW5mby0+dF9vZmZzICsgSUNVX1RTU1IoaykpOw0KPiAgfQ0KPiANCj4g
IHN0YXRpYyB2b2lkIHJ6djJoX2ljdV9pcnFfZGlzYWJsZShzdHJ1Y3QgaXJxX2RhdGEgKmQpDQo+
IEBAIC0yNDUsOCArMjU1LDggQEAgc3RhdGljIHZvaWQgcnp2MmhfY2xlYXJfdGludF9pbnQoc3Ry
dWN0IHJ6djJoX2ljdV9wcml2ICpwcml2LCB1bnNpZ25lZCBpbnQgaHdpcnENCj4gIAl1MzIgYml0
ID0gQklUKHRpbnRfbnIpOw0KPiAgCWludCBrID0gdGludF9uciAvIDE2Ow0KPiANCj4gLQl0c2N0
ciA9IHJlYWRsX3JlbGF4ZWQocHJpdi0+YmFzZSArIElDVV9UU0NUUik7DQo+IC0JdGl0c3IgPSBy
ZWFkbF9yZWxheGVkKHByaXYtPmJhc2UgKyBJQ1VfVElUU1IoaykpOw0KPiArCXRzY3RyID0gcmVh
ZGxfcmVsYXhlZChwcml2LT5iYXNlICsgcHJpdi0+aW5mby0+dF9vZmZzICsgSUNVX1RTQ1RSKTsN
Cj4gKwl0aXRzciA9IHJlYWRsX3JlbGF4ZWQocHJpdi0+YmFzZSArIHByaXYtPmluZm8tPnRfb2Zm
cyArIElDVV9USVRTUihrKSk7DQo+ICAJdGl0c2VsID0gSUNVX1RJVFNSX1RJVFNFTF9HRVQodGl0
c3IsIHRpdHNlbF9uKTsNCj4gDQo+ICAJLyoNCj4gQEAgLTI1NSw3ICsyNjUsNyBAQCBzdGF0aWMg
dm9pZCByenYyaF9jbGVhcl90aW50X2ludChzdHJ1Y3Qgcnp2MmhfaWN1X3ByaXYgKnByaXYsIHVu
c2lnbmVkIGludCBod2lycQ0KPiAgCSAqLw0KPiAgCWlmICgodHNjdHIgJiBiaXQpICYmICgodGl0
c2VsID09IElDVV9USU5UX0VER0VfUklTSU5HKSB8fA0KPiAgCQkJICAgICAgKHRpdHNlbCA9PSBJ
Q1VfVElOVF9FREdFX0ZBTExJTkcpKSkNCj4gLQkJd3JpdGVsX3JlbGF4ZWQoYml0LCBwcml2LT5i
YXNlICsgSUNVX1RTQ0xSKTsNCj4gKwkJd3JpdGVsX3JlbGF4ZWQoYml0LCBwcml2LT5iYXNlICsg
cHJpdi0+aW5mby0+dF9vZmZzICsgSUNVX1RTQ0xSKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgaW50
IHJ6djJoX3RpbnRfc2V0X3R5cGUoc3RydWN0IGlycV9kYXRhICpkLCB1bnNpZ25lZCBpbnQgdHlw
ZSkNCj4gQEAgLTMwNiwyMSArMzE2LDIxIEBAIHN0YXRpYyBpbnQgcnp2MmhfdGludF9zZXRfdHlw
ZShzdHJ1Y3QgaXJxX2RhdGEgKmQsIHVuc2lnbmVkIGludCB0eXBlKQ0KPiANCj4gIAlndWFyZChy
YXdfc3BpbmxvY2spKCZwcml2LT5sb2NrKTsNCj4gDQo+IC0JdHNzciA9IHJlYWRsX3JlbGF4ZWQo
cHJpdi0+YmFzZSArIElDVV9UU1NSKHRzc3JfaykpOw0KPiArCXRzc3IgPSByZWFkbF9yZWxheGVk
KHByaXYtPmJhc2UgKyBwcml2LT5pbmZvLT50X29mZnMgKyBJQ1VfVFNTUih0c3NyX2spKTsNCj4g
IAl0c3NyICY9IH4oSUNVX1RTU1JfVFNTRUxfTUFTSyh0c3NlbF9uKSB8IHRpZW4pOw0KPiAgCXRz
c3IgfD0gSUNVX1RTU1JfVFNTRUxfUFJFUCh0aW50LCB0c3NlbF9uKTsNCj4gDQo+IC0Jd3JpdGVs
X3JlbGF4ZWQodHNzciwgcHJpdi0+YmFzZSArIElDVV9UU1NSKHRzc3JfaykpOw0KPiArCXdyaXRl
bF9yZWxheGVkKHRzc3IsIHByaXYtPmJhc2UgKyBwcml2LT5pbmZvLT50X29mZnMgKyBJQ1VfVFNT
Uih0c3NyX2spKTsNCj4gDQo+IC0JdGl0c3IgPSByZWFkbF9yZWxheGVkKHByaXYtPmJhc2UgKyBJ
Q1VfVElUU1IodGl0c3JfaykpOw0KPiArCXRpdHNyID0gcmVhZGxfcmVsYXhlZChwcml2LT5iYXNl
ICsgcHJpdi0+aW5mby0+dF9vZmZzICsgSUNVX1RJVFNSKHRpdHNyX2spKTsNCj4gIAl0aXRzciAm
PSB+SUNVX1RJVFNSX1RJVFNFTF9NQVNLKHRpdHNlbF9uKTsNCj4gIAl0aXRzciB8PSBJQ1VfVElU
U1JfVElUU0VMX1BSRVAoc2Vuc2UsIHRpdHNlbF9uKTsNCj4gDQo+IC0Jd3JpdGVsX3JlbGF4ZWQo
dGl0c3IsIHByaXYtPmJhc2UgKyBJQ1VfVElUU1IodGl0c3JfaykpOw0KPiArCXdyaXRlbF9yZWxh
eGVkKHRpdHNyLCBwcml2LT5iYXNlICsgcHJpdi0+aW5mby0+dF9vZmZzICsgSUNVX1RJVFNSKHRp
dHNyX2spKTsNCj4gDQo+ICAJcnp2MmhfY2xlYXJfdGludF9pbnQocHJpdiwgaHdpcnEpOw0KPiAN
Cj4gLQl3cml0ZWxfcmVsYXhlZCh0c3NyIHwgdGllbiwgcHJpdi0+YmFzZSArIElDVV9UU1NSKHRz
c3JfaykpOw0KPiArCXdyaXRlbF9yZWxheGVkKHRzc3IgfCB0aWVuLCBwcml2LT5iYXNlICsgcHJp
di0+aW5mby0+dF9vZmZzICsgSUNVX1RTU1IodHNzcl9rKSk7DQo+IA0KPiAgCXJldHVybiAwOw0K
PiAgfQ0KPiBAQCAtNDE5LDcgKzQyOSw4IEBAIHN0YXRpYyBpbnQgcnp2MmhfaWN1X3BhcnNlX2lu
dGVycnVwdHMoc3RydWN0IHJ6djJoX2ljdV9wcml2ICpwcml2LCBzdHJ1Y3QgZGV2aWNlDQo+ICAJ
cmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGludCByenYyaF9pY3VfaW5pdChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5vZGUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50KQ0KPiArc3RhdGlj
IGludCByenYyaF9pY3VfaW5pdF9jb21tb24oc3RydWN0IGRldmljZV9ub2RlICpub2RlLCBzdHJ1
Y3QgZGV2aWNlX25vZGUgKnBhcmVudCwNCj4gKwkJCQkgY29uc3Qgc3RydWN0IHJ6djJoX2h3X2lu
Zm8gKmh3X2luZm8pDQo+ICB7DQo+ICAJc3RydWN0IGlycV9kb21haW4gKmlycV9kb21haW4sICpw
YXJlbnRfZG9tYWluOw0KPiAgCXN0cnVjdCByenYyaF9pY3VfcHJpdiAqcnp2MmhfaWN1X2RhdGE7
DQo+IEBAIC00ODUsNiArNDk2LDggQEAgc3RhdGljIGludCByenYyaF9pY3VfaW5pdChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5vZGUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50KQ0KPiAgCQlnb3Rv
IHBtX3B1dDsNCj4gIAl9DQo+IA0KPiArCXJ6djJoX2ljdV9kYXRhLT5pbmZvID0gaHdfaW5mbzsN
Cj4gKw0KPiAgCS8qDQo+ICAJICogY29jY2ljaGVjayBjb21wbGFpbnMgYWJvdXQgYSBtaXNzaW5n
IHB1dF9kZXZpY2UgY2FsbCBiZWZvcmUgcmV0dXJuaW5nLCBidXQgaXQncyBhIGZhbHNlDQo+ICAJ
ICogcG9zaXRpdmUuIFdlIHN0aWxsIG5lZWQgJnBkZXYtPmRldiBhZnRlciBzdWNjZXNzZnVsbHkg
cmV0dXJuaW5nIGZyb20gdGhpcyBmdW5jdGlvbi4NCj4gQEAgLTQ5OSw2ICs1MTIsMTUgQEAgc3Rh
dGljIGludCByenYyaF9pY3VfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqcGFyZW50KQ0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IA0KPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCByenYyaF9od19pbmZvIHJ6djJoX2h3X3BhcmFtcyA9IHsNCj4gKwkudF9v
ZmZzID0gMCwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBpbnQgcnp2MmhfaWN1X2luaXQoc3RydWN0
IGRldmljZV9ub2RlICpub2RlLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudCkNCj4gK3sNCj4g
KwlyZXR1cm4gcnp2MmhfaWN1X2luaXRfY29tbW9uKG5vZGUsIHBhcmVudCwgJnJ6djJoX2h3X3Bh
cmFtcyk7DQo+ICt9DQo+ICsNCj4gIElSUUNISVBfUExBVEZPUk1fRFJJVkVSX0JFR0lOKHJ6djJo
X2ljdSkNCj4gIElSUUNISVBfTUFUQ0goInJlbmVzYXMscjlhMDlnMDU3LWljdSIsIHJ6djJoX2lj
dV9pbml0KQ0KPiAgSVJRQ0hJUF9QTEFURk9STV9EUklWRVJfRU5EKHJ6djJoX2ljdSkNCj4gLS0N
Cj4gMi40My4wDQo+IA0KDQo=

