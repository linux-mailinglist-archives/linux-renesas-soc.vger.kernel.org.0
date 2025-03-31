Return-Path: <linux-renesas-soc+bounces-15217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61251A76D87
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 21:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848821889419
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 19:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453831DE4E3;
	Mon, 31 Mar 2025 19:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="j8gPXM62"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAEA40BF5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743450036; cv=fail; b=SZxNSGUPI+cjR96bdCBfwxNiig5o/dS3qugG0dlcPj6bhMhYdyvrnK5g4mr5KW9AIkszID5nW8MkZfU2N+c3H9IPZZdNkWl1YkwUvQ6bsz612mf043q99+R9rObvbHfRrO3JLUEP3+mIYkqxu8O1P9vaS3x5S1PAeDEa1kHwOF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743450036; c=relaxed/simple;
	bh=34boYnoBlQy+mQEQFiffsPboPx1u45/4LL7QDTjIotg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B7EeePjoZ5aNZbrkivYpVxe6k1CPoFZH21X/Szy+H6M2eVEkssolxwaNeOIjq9PYVTqMXdqg+zcXuHiQvT/OO64QzYkuO94koQJ/epR4BIdQ00srd1z7uazHgCb2uj8mPFSuF04RAF7+zilmJfr/QebhMzDHvKwprs3ugH+SKdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=j8gPXM62; arc=fail smtp.client-ip=52.101.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWDFFk+AW2aDqK83AOZpeuzhefXT4nfodQkr7JDe8zBiAd/zjRphqAFlPU0cTbtdy5SGo+LQZhy9P60jaHpxaKoQSmN0MF6dVUqRPXQAbmVfq8Z2LIt8i755c8DPA4SWXYD0EKhC6M3zCSUaQ9+0OQc2jE6B6PxxNe0Z1kYMwmApfBsA1ISVUP3v5841ng/MQrfp25IWiR7O/qv6oUkhpmTk6S3KM3Ea3PZrBc0dbtYlapuKxAYg3q3aU6mcxWBiVV3SoiM6R58gvBZ6JaL1hqTMKJUe0xLe0EGw1Aff959NDsgmPkuHsKnDHTMrx1XbO8FssvU67II6L5Z8I+y1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34boYnoBlQy+mQEQFiffsPboPx1u45/4LL7QDTjIotg=;
 b=DQ/v/QXXgtEsNxMhKy1e57eZIGIqwUOh0U4GPFrP+O8dHuXXcNtDMyvNb+QYP+AHxpZCI09mh9JotTk3c/vwO9y6+gwdDeTYVhyYMf9CpYCwt2qQ57hEmNpp3C8QvywAFqDjkQ03jzEpgRO0Tc/7WWgYhgzztegMJ+sdrOF6C9P0JK8w22F39zq+CvL92u+nqEx0fE5DJEp7SKg/nvmHr8pT8jW2RS6rd5o6JCcB4qdQ796Q+1XNJKU90/WLuDEsksybbQDQQukbKn3quKyZJm+0/ruRpFO1B8zfsIj+bMPdksV7HcwbBeWFL8S8EmeM1As6jVRbiaVm4ESsJSeH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34boYnoBlQy+mQEQFiffsPboPx1u45/4LL7QDTjIotg=;
 b=j8gPXM62Xlki7nYL89NFKDDCHOr8kYk2WmTFoEuE7+Pqgu+QA8GPAsm6LMtyychAchPef6+V832PZurIOc3h0XmuXo0p+J05doev6FbCd/sTJWYVlZBps5DyBGzAulYV3Rre6EPqMAnw2XRwcaW/eBJSGi3+Zhbw4RVIxOhqc2U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15939.jpnprd01.prod.outlook.com (2603:1096:405:2c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.26; Mon, 31 Mar
 2025 19:40:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 19:40:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 7/9] memory: renesas-rpc-if: Add wrapper functions
Thread-Topic: [PATCH v3 7/9] memory: renesas-rpc-if: Add wrapper functions
Thread-Index: AQHbknnhH9N1A13Y9Ue23p0yOrzrV7ONTdwAgAB2QJA=
Date: Mon, 31 Mar 2025 19:40:29 +0000
Message-ID:
 <TY3PR01MB113460C0B69DF005547F0CB0286AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdWEAVfQ0_Ffbw0eexhTnDDZFu2mDwx3zvL4s66XsBN6fA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWEAVfQ0_Ffbw0eexhTnDDZFu2mDwx3zvL4s66XsBN6fA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15939:EE_
x-ms-office365-filtering-correlation-id: 8509bdb6-a5e1-48cc-b9be-08dd708be4a7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q0FIYk1KQVcwc244T1c0M2RabVZXUTcxZjhyZU50VFNtZ1dURVMrM2hrS0Fy?=
 =?utf-8?B?aW50UHJsWU05REtXYklDb2h6VWRzdHFTNmZwRGYzVHJJS3RqaVhEZ0lnL2kr?=
 =?utf-8?B?bHFSaTNaNWNFR2NJOEpvWmorczlxUFlmdjhzbTVFZlhrU3ErdERuWnVoM3BM?=
 =?utf-8?B?b3JnaHRKcmdBc1F6OHlCeXI3SnBHdlg1OWZkd2RxOUtRZ2QwMzhkZjJkOFc0?=
 =?utf-8?B?ektrdTBvcUxsMUNCbVU3c29Kb0pFcjNmUDhJQm1LVjZDZFVITjByM1ZPaUpO?=
 =?utf-8?B?eWxOZk5SMWZJSUFMZUp3dUtSS3N2WUw5aCtOOXJBSGdJWktjVzhzaVQ1TkRZ?=
 =?utf-8?B?UlVoejR4MW1UY1c5V2NhSVp3VEtGaW5KUGpSOHlaUEhHVjg4QTZlNUQ4bUxU?=
 =?utf-8?B?MVBJQ1dqYy9NWVFYdXA5NlJCWmRXbXVQTjdoNnU4L2wrZmx4WEs5dmJBSGh6?=
 =?utf-8?B?dVN4bThWNHdlb25UdFRnSHhKTktHZVZxT3RvUGZsajVQeVJ5UnlFcGJqVDdG?=
 =?utf-8?B?ZEdyL1VuajNWTUVKS0ppMlR5d05rd3puMDVFeGlZbmcwUTRYb3liMmNETi8z?=
 =?utf-8?B?TGdDOEF6Yzh4SzdIcVpLQXAzeTZDWHpDaTFCaFgxU0hualpGWHVHNndVZ1Jr?=
 =?utf-8?B?dkoxWmFFc0xNUzJYb3EvakNQQ1AyOXFkcDZ1WHRRbjhZa1p0UzhDUTdNSE1l?=
 =?utf-8?B?dHM3V0doM1JNSUxYRjFLNGhGcW4vQ2ZEZjc1U2VDdGdDV2VZSk1sbkNUNjA5?=
 =?utf-8?B?cTZZVFNWZTkzN2YvVkkraDdFREdCbmthTzBHWkRvQ0NXVWUvU3E4bVZWdWsx?=
 =?utf-8?B?bUN2ZWV2NkU5RTl6eVhwa1YrTnh2dG13UEQweDd3TC92a0U4NXg0eGhDTHVo?=
 =?utf-8?B?bEpRTUpxZDdGL04yQWNRbnEyNk1iNUdNenVBR21uYURCelRScjN4aXZvcjJ3?=
 =?utf-8?B?SEp1c2tFVTA2YUZHdTBtQ3RNLzBITFhRSTdJWE9PM1ZxZmhzTzhSWHBMb0No?=
 =?utf-8?B?dVNhaEZPekRIaWJDeFNyQnVmdnBHU0wvOStQeVBkWUhXTlBhaHVuMExPc1VH?=
 =?utf-8?B?cVliZHI1d2J5cXJ6UDFZK1BxZUV2c1pMSTZiM3BhSkludEtoMy9DaElMNktQ?=
 =?utf-8?B?bTY3ZHZHb3hKQmdvRm9yMXoyamZkODdWbWNNQlZhUHBvNElvemxFQWJuZXJk?=
 =?utf-8?B?L292cnF0WEZ5QnR6SURuS3BXRUhDeTUrUllsYXpmeVJBODl1U0tkQXBwdmhZ?=
 =?utf-8?B?cUJjMFFXK29TVkhHdm5wVGMyNlNONnFVZWdyUUZEWVhuN24yUnhMYVpZbU5W?=
 =?utf-8?B?eVZ2VmJJZEhPMXdmM3o5bzhnZFdueFdKZnQwRVZnWUgxT3dueHZHbTh5Q3B0?=
 =?utf-8?B?cGNTK29yM2h1ZUdJckIzTXdIVE5FR2lPMzJXMFBNQmt5aXU5NjRsUzNMN1Nz?=
 =?utf-8?B?R3lKVjk5Z05EbVZ0eE5iRjVwdzhJRVBIemh3YmxrMmRhdThVR09DbUpKczVp?=
 =?utf-8?B?NTRGR3V3OENKa0xzTGRzU3JIcXBmQkhjNTVGa0V1UFgzbzlGWDBsYXoyMkt6?=
 =?utf-8?B?S3MxOWRjUlRRcENVVkE0ZTYxK0luM2dxZDN0NW83ZjIwN2pjcms0M1czbEtn?=
 =?utf-8?B?RFhCaEhDWTFHbVRXQW1UZm1ISjhIQ1JNWFlNeXFBU1p1Rm9xc01tcmsrQktK?=
 =?utf-8?B?VkdEQ0llbTFtVnFUQXRSajR4VWw3NkRSdFRrMTh6WmFVYkFITGhNaU5mc2ND?=
 =?utf-8?B?ODI0KzdEaEEwcURQWG4zcnA3UUhEQkxqZzhTM0xBS2Fud3psT1BkRktQVjBU?=
 =?utf-8?B?OGhaSFdWZTVLYWI3SjZVekxDQ2hpZlhYRkduTWZlVlRZYVlSYk01UCtTV2xp?=
 =?utf-8?B?RVpOTEhqL2JJOVVvenVWd2lwVmZTWDF0dFJLSHRvRVR0d1E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnBrWlhENVZONzNoYVU5c2tsdlNTL1hUejdSY3cvdE91ZDRNTHpJelRlYngr?=
 =?utf-8?B?ZXVHcGlWYk5acHZwZmNEZElmSkpORUF1ZUJEcVljcGs3TEszeFJvM3JyeTJx?=
 =?utf-8?B?eWp0RVRJOXFJVzNNN0NsRG9KOXdZNnVHOEZDTEQ5dGxkSjR5UytDUUZJR1JF?=
 =?utf-8?B?anN5N01XWERhQm1KUThNZEFLRFYzSVdvZkFyMjRFeDdjQzhlY0Y3VUxjRHFI?=
 =?utf-8?B?d05LVEFJWUd3SXhXRzVBQTVLVGJJTXhnM1A2Wlg2MnprRzZmdXViMVZlTEVT?=
 =?utf-8?B?cGo1Q1RjTUxFby8ya1JyTUZCS0RMaGFIODdOVmdMRDFoWEJZbm9QZGx3MGFF?=
 =?utf-8?B?WHl2TEpOU3hOWEZtVlYweXIzN09IZENMTlFNRHVFUGRQWWhvQXY3TDlWZWI0?=
 =?utf-8?B?QXpyMm1jSWVDZkVsTUhBVDVYNnNLaGtFVlJxRW1jL0ZEcGMweElHbkthcjZL?=
 =?utf-8?B?c0x6MXVRaFV5RGMzTGU2ODBWMUJsSDQrTUdnRnB5ckw3ZEFHOEpIRU05c2Rh?=
 =?utf-8?B?cmtoT0tucUV0TDF2dGJ6WnJFclFTS2t5b0pUa1RIUWowMmsrRGVKQ2E0RU9o?=
 =?utf-8?B?T0Y2TDJLQXdoWEVML0MvTXZRdk9Jc2FRa3ZLT0hzL09YMmloMUwrd3FmcWJZ?=
 =?utf-8?B?dlg1Y1lrY3A5NW01LzZ3aG5PTFpRU1Q1OUlUMHVUYXE0V0VwbWliVzN2OEcv?=
 =?utf-8?B?NFlHakczbFN2OUJqdmpZbk1ORVV5aFo3MW5PVGViOXIrRTc2bG1GREIzQkN2?=
 =?utf-8?B?U3o5dEdyL21hZ1prUDIyT0Y4SmZTRWRveFpvYm9QVGFpMlh6YStEWmRZelRy?=
 =?utf-8?B?MHNmQjAwbGt5N2RORG11OHE1b255MWRCc2pkbDFUa1VZSDN2M0gzcHNiSDB1?=
 =?utf-8?B?Q3Y1bDh0UlQzS3lZV3o0bGVibEw2TTNFT0NWM3JxOFJYbU5QZll6WUx2Rmww?=
 =?utf-8?B?WVlYNkh5WmtObVk2YTZaU1RCN2NZV3d3UFFYaUhlWnN1QWRSc3BQV3NrcHg4?=
 =?utf-8?B?MzdLbXFzK2FRRG9rRHdsR05FejEyTThyQzZMcmdNdWorZWVUQlY4OE05cDBJ?=
 =?utf-8?B?KzRJb0RoYUJWUkE1Q1R3K1Z4cEtya0tJamwyTnZSNkI0N0xQVmFUemRjTXQ1?=
 =?utf-8?B?c2lRNmxFeXp3L202OTlnUkYxTFRZdHRLamZCdHpabUQvaEs2bFowa1VEYm5I?=
 =?utf-8?B?anQ1TFN2YTNoTlhQQkdscUFLM2ljRDlWR1hOWnV1Z1JWeVRGRVJnOXVIODkw?=
 =?utf-8?B?aXdTdmJSWlFRUzFtMzVTSHBudHk2bDY1UVc5dDZJZU5HMHdhUldwcDlVMGw5?=
 =?utf-8?B?dmd1QmQ3aGtCU2NOd1gyRFlUbEJ3K2F3ZEVyRHlHMmszbVpiWWs2OU9HekVo?=
 =?utf-8?B?bGM5dXQ5WkRmZ1RBS1cxUmpPOGJQWXNXbTBOV09TZUJycm1ZQ2w2bWJTNllo?=
 =?utf-8?B?OXUrUHppUG5aRTRBT1cyelhOQWZ6ZGtYcDF6Ri9Gdjgvckk5aXNObUR3VEV6?=
 =?utf-8?B?QWJxUzRJaGVHVkRGU1VwTU5yMG5sbHNlTzJocU1ibzZCZC9PN2tqS3F5THRs?=
 =?utf-8?B?dVkwZ245RGlQS0MwdStQUGtaNm5aZW52cW5CSkxHSDlnNHNSYnpDQkRhVUhP?=
 =?utf-8?B?VE9oUjM3ck1vOUpITE1hVXduOGFiUG4ra0NoV3FTeEd4Y2ZEcTl0cjUrRmNm?=
 =?utf-8?B?ZnFNL1JwR0JlVDBkbHRreFNVbGtQeGRHT0RabWM4ZG5oT1V0UUZ0cFB0dUJo?=
 =?utf-8?B?aG8wOEpFaW9CSE5jUWs5dWUwRjZlay96TjFBQjBEUmwyK1BrMEpJTElFYmc0?=
 =?utf-8?B?d3owMkQrYzNETkEyQndYUjBUQ1BQT0hnSjFsVURqaUtDT1M2VFNFSTlVbTFn?=
 =?utf-8?B?cnI3TEZQQTRtc2dnam1RWmo1SHgxSTJTRlQ0UW9RVElhdFMrZVZHdERLblll?=
 =?utf-8?B?a2VHbmdQcGhmMkM2OWs3b0tKekIwQ3VCSWxQZUpFWDVvOEhPUHMzMGR4dEpv?=
 =?utf-8?B?ZVk2VUl6WkI3TGpsWElnRHQzMGJPNGMwRklQYnpETHZhREJRQkd0dEU1MDBW?=
 =?utf-8?B?OG4rckpSQlJOSkpNTTgwYURwcGljU0prZFQ5WEVJc0hLWVJIZWlHczNhck93?=
 =?utf-8?B?Mk9CSTg1K3dqUjd6M3k3aW5JbDBiYjlwZ1pUd2pKKzN4N0ZNL1U3RWw3Sjcx?=
 =?utf-8?B?a0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8509bdb6-a5e1-48cc-b9be-08dd708be4a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 19:40:29.5245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zpqeWxzzRMAVAV41E3JzKScW4PsTfaJPWZSFYVZC75s4UXbLSeZp5Bz7YM0jJfA2g8BSHnYl1xSCqnx6OKT1rGXIlfe178WP99IAoKmNk6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15939

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNy85XSBtZW1vcnk6IHJlbmVzYXMtcnBj
LWlmOiBBZGQgd3JhcHBlciBmdW5jdGlvbnMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBPbiBUdWUsIDExIE1hciAyMDI1IGF0IDEyOjM2LCBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEV2ZW4gdGhvdWdo
IFhTUEkgYW5kIFJQQ0lGIGhhcyBkaWZmZXJlbnQgcmVnaXN0ZXIgbGF5b3V0LCByZXVzZSB0aGUN
Cj4gPiBjb2RlIGJ5IGFkZGluZyB3cmFwcGVyIGZ1bmN0aW9ucyB0byBzdXBwb3J0IGJvdGggWFNQ
SSBhbmQgUlBDLUlGLg0KPiA+DQo+ID4gV2hpbGUgYXQgaXQsIHJlcGxhY2UgZXJyb3IgY2hlY2sg
Zm9yIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSBhcyBpdA0KPiA+IGNhbiByZXR1cm4gcG9z
aXRpdmUgdmFsdWUgYXMgd2VsbC4NCj4gDQo+IFdoaWxlIHRoZSBjaGFuZ2UgaXMgZmluZSBmb3Ig
bWUsIHRoZSBmdW5jdGlvbiBjYW5ub3QgcmV0dXJuIHN0cmljdCBwb3NpdGl2ZSB2YWx1ZXM6DQo+
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEzLjcvc291cmNlL2luY2x1ZGUv
bGludXgvcG1fcnVudGltZS5oI0w0MTgNCg0KT0suDQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gPiAtLS0gYS9kcml2
ZXJzL21lbW9yeS9yZW5lc2FzLXJwYy1pZi5jDQo+ID4gKysrIGIvZHJpdmVycy9tZW1vcnkvcmVu
ZXNhcy1ycGMtaWYuYw0KPiANCj4gPiBAQCAtNTE5LDIwICs1NDMsMTUgQEAgc3RhdGljIHZvaWQg
bWVtY3B5X2Zyb21pb19yZWFkdyh2b2lkICp0bywNCj4gPiAgICAgICAgIH0NCj4gPiAgfQ0KPiA+
DQo+ID4gLXNzaXplX3QgcnBjaWZfZGlybWFwX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LCB1NjQg
b2Zmcywgc2l6ZV90IGxlbiwNCj4gPiB2b2lkICpidWYpDQo+ID4gK3N0YXRpYyBzc2l6ZV90IHJw
Y2lmX2Rpcm1hcF9yZWFkX2hlbHBlcihzdHJ1Y3QgcnBjaWZfcHJpdiAqcnBjLCB1NjQgb2ZmcywN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGxlbiwg
dm9pZCAqYnVmKQ0KPiANCj4gTm93IHRoZSBmdW5jdGlvbiBjYW4gbm8gbG9uZ2VyIGZhaWwsIGl0
IGNhbiByZXR1cm4gc2l6ZV90Lg0KDQpPSy4NCg0KPiANCj4gPiAgew0KPiA+IC0gICAgICAgc3Ry
dWN0IHJwY2lmX3ByaXYgKnJwYyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICAgICAgICAg
bG9mZl90IGZyb20gPSBvZmZzICYgKHJwYy0+c2l6ZSAtIDEpOw0KPiA+ICAgICAgICAgc2l6ZV90
IHNpemUgPSBycGMtPnNpemUgLSBmcm9tOw0KPiA+IC0gICAgICAgaW50IHJldDsNCj4gPg0KPiA+
ICAgICAgICAgaWYgKGxlbiA+IHNpemUpDQo+ID4gICAgICAgICAgICAgICAgIGxlbiA9IHNpemU7
DQo+ID4NCj4gPiAtICAgICAgIHJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsN
Cj4gPiAtICAgICAgIGlmIChyZXQgPCAwKQ0KPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0
Ow0KPiA+IC0NCj4gPiAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhycGMtPnJlZ21hcCwgUlBD
SUZfQ01OQ1IsIFJQQ0lGX0NNTkNSX01ELCAwKTsNCj4gPiAgICAgICAgIHJlZ21hcF93cml0ZShy
cGMtPnJlZ21hcCwgUlBDSUZfRFJDUiwgMCk7DQo+ID4gICAgICAgICByZWdtYXBfd3JpdGUocnBj
LT5yZWdtYXAsIFJQQ0lGX0RSQ01SLCBycGMtPmNvbW1hbmQpOyBAQA0KPiA+IC01NDksOSArNTY4
LDI0IEBAIHNzaXplX3QgcnBjaWZfZGlybWFwX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LCB1NjQg
b2Zmcywgc2l6ZV90IGxlbiwgdm9pZCAqYnVmKQ0KPiA+ICAgICAgICAgZWxzZQ0KPiA+ICAgICAg
ICAgICAgICAgICBtZW1jcHlfZnJvbWlvKGJ1ZiwgcnBjLT5kaXJtYXAgKyBmcm9tLCBsZW4pOw0K
PiA+DQo+ID4gKyAgICAgICByZXR1cm4gbGVuOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzc2l6ZV90
IHJwY2lmX2Rpcm1hcF9yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwgdTY0IG9mZnMsIHNpemVfdCBs
ZW4sDQo+ID4gK3ZvaWQgKmJ1Zikgew0KPiA+ICsgICAgICAgc3RydWN0IHJwY2lmX3ByaXYgKnJw
YyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICsgICAgICAgc3NpemVfdCBsZW5ndGg7DQo+
IA0KPiBzaXplX3QgcmVhZD8NCg0KT0suIFdpbGwgZml4IHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0K
DQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiAr
ICAgICAgIHJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsNCj4gPiArICAgICAg
IGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsg
ICAgICAgbGVuZ3RoID0gcnBjaWZfZGlybWFwX3JlYWRfaGVscGVyKHJwYywgb2ZmcywgbGVuLCBi
dWYpOw0KPiA+ICsNCj4gPiAgICAgICAgIHBtX3J1bnRpbWVfcHV0KGRldik7DQo+ID4NCj4gPiAt
ICAgICAgIHJldHVybiBsZW47DQo+ID4gKyAgICAgICByZXR1cm4gbGVuZ3RoOw0KPiA+ICB9DQo+
ID4gIEVYUE9SVF9TWU1CT0wocnBjaWZfZGlybWFwX3JlYWQpOw0KPiANCj4gTm90aGluZyBjcml0
aWNhbCwgc28NCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+
IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

