Return-Path: <linux-renesas-soc+bounces-12745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 005D8A22C5E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 12:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5E323AB76B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 11:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351381BD4F7;
	Thu, 30 Jan 2025 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NlGrx7XF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8321C07DD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235602; cv=fail; b=pJQSsw7etjYTa/y4waz90aft64VM2kkkjr+0Nu5uvsc4r6EabwuDZpjioJ4Cz+KLE3Nvh+9Yjl2QLjypmT8hS+Aj6ErECcy1qxovthnLRiiT+nmgL9gnEewpUUIdtzfWd1VqJvxoWy3knWfcOv9aVyAZauxYcWLVjyU75cr9KlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235602; c=relaxed/simple;
	bh=DKOpUMat6me7xZNZTbJ/YAkyMHzXPAG3o4BRqxNxjPw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JLoNPVO4YQeqBIhthFYm/PgDUul//FbkhIpb320ppbNyB1jpN/Ej4N9RcxAKIR+37j4W5skjLuyasnsTMcTbNwp13cUVX1IDsgN0ksyjdbLOV5ZBz0GYN6hgi1I6HkP4gIbD48M8AcVK28GbSP0qfHaS2HjoOqAAGuBr55OR+f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NlGrx7XF; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dM1fXbn17/GOtcq0siw9LlQ0osM0hi32J7cvFIuOUtFjK0CV/EWtTXiQBQLu4s5Rc0XTk5HaD9eXc1eXTluokUDrupFkWfmIpDzkipAAc8U05cmCb3uc6fPnjAgLvx+G4YeirKql6wPuQR2fAXSA4+gmi55n//M8HqE2WrowjHHxEsnFQbrLsZ8H5lXsHt+uH/mxc6QGGqqOoFN7C6G2yKbEf+LErr4Wk2EbLoYywzUy9RcZP+8j2kp1JCojsWiGNgraEOAwSEl1KIR2ek6E2ZINw8Fpx3xugCrEDDIaur+elZG1yo/6Bt2BLkurZYdjolHUJuQgh3bVrBFymUKgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKOpUMat6me7xZNZTbJ/YAkyMHzXPAG3o4BRqxNxjPw=;
 b=waikqAdup3Xxb8TYskg99Fthmdj+6/1tkvL5JZhr8jJoilwjMo9OmnmAA2ASpYxLuZ0GrE1aFH4rwqsdwGzHz6gU/9NOotpSv5q5QQOveHtAJsA4F6xw4++c8h7ETrSyHj9uPqp2/HXmpWLhOVIK/1h1nGBeu9620t+JnjA3qwDuK/HQMWo5tiX0uLEFcdYJkpyiukPUnTCSqHhcQOyECx+2FDL4LzLM6Pmy6HIgn0AkxyyycIFU3Oucaaxuiw9JGG+CiZfUqnjmFLns0AB68prXW9tp35I2nn+tMvS3tXTOCiC1bLvqUtLqtyquIWJEBCsMY5Qll158T+DVCaQtng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKOpUMat6me7xZNZTbJ/YAkyMHzXPAG3o4BRqxNxjPw=;
 b=NlGrx7XF6OYNP5tHoD+BitFuoZvOCqKGZYsFSzY05OFMFFiq0RE4tzT0uZ89g+tl+QMveEZbpgldLJebv099iKTarKCOZIMcoPvda4pb84TiJpxiOjnwb+yE5ke6wggyXlrhy3XIqOixNaXCx1T1pyheyaCVaB9kSqoGQ/urAmg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB14228.jpnprd01.prod.outlook.com (2603:1096:405:213::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 11:13:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 11:13:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH v3 07/13] irqchip/renesas-rzv2h: Add struct rzv2h_hw_info
 with t_offs variable
Thread-Topic: [PATCH v3 07/13] irqchip/renesas-rzv2h: Add struct rzv2h_hw_info
 with t_offs variable
Thread-Index: AQHbcXIRxVkOg1QJykCgwgaAuFsG8bMsTRgAgALfoxA=
Date: Thu, 30 Jan 2025 11:13:16 +0000
Message-ID:
 <TY3PR01MB11346577E053DC4AC88CC14D886E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
 <20250128104714.80807-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdW7fQUORYBG=kHK_AHyvkrk-VpLEdvjMU6yubm5A2PV-Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW7fQUORYBG=kHK_AHyvkrk-VpLEdvjMU6yubm5A2PV-Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB14228:EE_
x-ms-office365-filtering-correlation-id: 0a00a777-14b4-4e80-bdba-08dd411f185d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L0RnOFJLUTY3MDdrVTVrcDJsanlQdHlweW4rdkJrODRiZ0ZEd0t1aDJpdlBZ?=
 =?utf-8?B?T2JsWFFsUC9hdHIreGRGTWxJd1BPRDBreEtoK2VFTlNRNVVnc3pVTnVwYStU?=
 =?utf-8?B?M25uRzllblhqb05DRWgvd1pncVp0ZGUydzVRVkwyaTdmTmRrVlBZWVNCeG9L?=
 =?utf-8?B?M2p4Y3BoREFZUmVCMFNrM1ZnUlpyODZoamMwb2ZMQXI5QTE2L2crRWt5UXYy?=
 =?utf-8?B?aGI2UTAvc1VXN2tZV3JrMmhCbnpFbnNJZUhTREVkNWZsMlpwdXNvUm8rOTAy?=
 =?utf-8?B?d0laTnF2Y1FXblU3NE9vOXdpWWJKODd5eEpRTmtSREtic0hCdEFkNVNialh0?=
 =?utf-8?B?dVRvL01TbTRNZ0ovRk9qS0N6UndvUTdhMEgvNkFwOWxkTzd6ZUttSllRZG15?=
 =?utf-8?B?Vm9hYnEybUdLRHhUYnJpaS90TU9xcWdrYUkva2Q0WnVRMUs3dXRXWTNZZ3pP?=
 =?utf-8?B?R0RtN2pQc2hXQ1pEZU9VOTE1V0VvQ1BQU2g3QVM2S2ppUlJ4aGpWOC94anAx?=
 =?utf-8?B?M055VXptcVZqNGhHNkVyYStuY0YxbHArYnplMFdqOXVXZ1NGL2dZdXlTRUg2?=
 =?utf-8?B?Z0FlQjVTbHl5cnZWRmVXMHdZMS9GVXdSRlZNTDFFSWFYcS9JV1RuSlJPMm9E?=
 =?utf-8?B?dkY0bXZ0em9saHdaTkFOenkvUjQ4amFkcXdKbmpya3ZqOVFxS0czNDFJQ2Ju?=
 =?utf-8?B?MVdENE9EWUNTTHBsdEw1Y3Z3eWRyaDlMelZLNmxMN0x1MngxNU1SZFpWOTM5?=
 =?utf-8?B?Mm5HeTc0aFVtMHZlYmhjcGRhaTZRaFpzN1B3akN1Q0dFQU9mQ3hCYmhPVWpn?=
 =?utf-8?B?S1U4QnEzT3ZDMUhRTEJNSWd2MHdWY05tdlA3d0M4U1NsV0d2eGFJeWNnUmI1?=
 =?utf-8?B?VHhNcmpLaWVtY1hIZXZNQkJsbmJMcGY2MkpsaG9HaFdkVzN4K3ROUTJVNXEy?=
 =?utf-8?B?ZlJlUngyMGNBNCs5N05ONTRWeVczeG1Ea3JZemNkRW92MVJsVjd4cFMyTWo2?=
 =?utf-8?B?OE5sOUF6djJKSlA2cFZQelhjZzRabHc1UkhoK2NWSU0yT21uYzl5Rm5PRlBz?=
 =?utf-8?B?a1k4RVZqMlBCaDVDWUhCN2gxWGdYWndJcCtSazBSRTlkWjJRTnVmcjNRZkVY?=
 =?utf-8?B?SUhCZ1RMd0ZHSURMaGEzQTlZWXVuM1JHYXI1K2lNT1VkWmxPR01KRWIxQnMr?=
 =?utf-8?B?V1J6dkNyVnNJNkxuTjlhWkUvdlZmNGdubG8vMXRyNDkrM011OUJTWG5MNzJX?=
 =?utf-8?B?WitLelFSUm9sc1JtL3AyUTc0UEZCbGNkZ3BsVjJrS2ozTzlpell5Y0ZuRG1w?=
 =?utf-8?B?OVRXTzd6M3FDa0JKSzI3OEUvVXMxRFRRL0hobk9keEo3VDA4cXdNclgyQXhT?=
 =?utf-8?B?UjZES1RnamFNWGJRbzhZaG9zZXBUL3J0UnZlek5sdzlTQ3Y2Q3JtbjRaYTk2?=
 =?utf-8?B?ZUNZbVMzekRnSGsvUXZhU2pNWVo3UTlyUmU4dktsSCtJTEorUDNFOWg2RVc3?=
 =?utf-8?B?b1dkRTdoWTNuQStkN3RMUlZtS1gxOVZrMjNxZjlOMXhqYlNIZlJlaExyZEwy?=
 =?utf-8?B?VEc2K2dVR2xCeXpHaWxPQWtuSmtSbk1XY2JLK2hZWVk5K2lkWlhUalRyUkNl?=
 =?utf-8?B?VVk1Qy9VeGRnS0hHYU9SOU5CU0VEa3RHUVo4RjBheG1uVjUwTFpJUU0xcW42?=
 =?utf-8?B?R2p5Wjl0dWNTZzdhUTVqQ0dzMzhkWTBjUmNzMGMvVEsvMThsNWhVUEpFSjNj?=
 =?utf-8?B?OEliT0N5d0xvOGkwZHZSNUVRY3JPZkw5QVI0RjNnYTYramtYL0RtbCsvZmRa?=
 =?utf-8?B?YkI4bTZNYWdKNzdkRXBTTTNKUUVzTVBXMEJaKytlRDM3a2h3QSs3K3ZzVXJ6?=
 =?utf-8?B?MEZWWncvQkt2eTlDcXpUQUg5RGtlV2xsVVMwcjF0aXF6NGZwRXg4UEdQZk1O?=
 =?utf-8?Q?ND1VjQA5M5k5O4QAnfnn9onSn3VwBlpK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVNiS3BseVV0ZHhaSW11cmxRL29yMEswT0E0eWxYNjFEbDQzTThJM05pL2R2?=
 =?utf-8?B?UWpZMU5tci9RL3FEdEFuM1M4VVRkSzRIazh4cEZ3eDdXSWNIbmVuaGlZM3lk?=
 =?utf-8?B?TVpvTExQOStTYURZYWVlZWZRY3QzZWxuMy81K1ArTlVPSGNqTEJEM0dnUkVB?=
 =?utf-8?B?aUMvQkVuUXhNb1UzY21ucXZvNEk5UGRQbDNzOWRwM1dJTTBBNVZ2NWRITWcy?=
 =?utf-8?B?TDdwNHVicWRBOE1UWWhlVk45MjlUWk1sanZnSllOa2syWC9qRm05ZkhqbEdh?=
 =?utf-8?B?UHcyVExvYm0wR2tNYW8zc3I2YVJSeDFndVVobW9YYXE4cVNFVVFpaEFEdlJP?=
 =?utf-8?B?MG9nenhYMEZuNXU2WEZoSTJWYks5V0FSQjNNKzdBWDZrNlZtdnB4dElxNUc2?=
 =?utf-8?B?aWR1YTVBS1piRWZleFR0cDhFK0UreGk2VUFaQithMnZhNHFhNUdsdGJQNUJI?=
 =?utf-8?B?amRDZXdCUWNCZ0lHMjNOM2UwRit2cGZqRHNRaFYwWUNLZSttTElDZFBmRkI2?=
 =?utf-8?B?cFdLK1BOWnFjM3k0d1cvN2xUVHNUUWtTQmlicFM5L1E5UDJBWkx2Sng3Ukta?=
 =?utf-8?B?ZDhYVmVoUWt4b0thdVB6MWg1bnp3N0hlbm5TMGdKMUtxS205K0ZTc2kxaVpM?=
 =?utf-8?B?Z20wUHhQc1daR1BEbDVYS3Q1MzR3NFRvWmNpUEpuUmxnZlZwbUJacjVZNUo0?=
 =?utf-8?B?dTdzSzZBTUFpd2ZPa1VOV2wzNDh3amF6WkN1bksrS1ZnMVBHeUg1aTQ5NjJX?=
 =?utf-8?B?S1d6QjBrR0s5cVdyTzMyb1hma3RlaTg0ajVJcEYvSXphbnFEdm1sNWhiZVFN?=
 =?utf-8?B?RlE0dmY2VFp1L2pFZkZFSnQzQzJiM0VReC8ySzBCRUlOdWd0cEhSVFBkMk5F?=
 =?utf-8?B?WnQwcW1VVDFHQ3VsR3V4WmVnOXovZE0vd3Y1akd1NGFEaWNsMVE0SlhUQlVj?=
 =?utf-8?B?ZmkzeTFxWGxkVW9ISHJpbEx1a0lOZkhtcWtoRWRiRUQ5ZmFMdjNKbDA5OUh6?=
 =?utf-8?B?ZkY4NWZUVmdoeWQ3UVJxZDQ0YndNc29EUjNNNmlmMzJnY1ZqejNud09qM21z?=
 =?utf-8?B?KzV2bTZaYXRKMG9GQXF2Yk5xU3hxZlVHQjB0eWh0Nlk0MlMvM1dwSXZSVzNh?=
 =?utf-8?B?cUhiZnJmejhWTjFMalBsWmY4ZFpxL1JZdnNnWDE1UVFWaXdWRjhiWDBtNHJN?=
 =?utf-8?B?VTdDb3VIekhWMXYrcnZ5eXU5ZkVFZzMvSjBmSGFjVHBJM0dOejgySGdaT3BU?=
 =?utf-8?B?MHg5Tk9LZXVvZmZRdkxYemoxcnZSanR3eEYvbll5NzFIMExzem16Sit1L0Nj?=
 =?utf-8?B?STRMTDJ5UHJUbGsyWksvMTRxRGlGZ2lYNWttV211ZG9mUlBUN0FuK2F3bDJT?=
 =?utf-8?B?ZmVVWWUvby9pc3owWUovTDJYK2haOEtiejVXVFRjaDBVUDNZa1JFRTErOG42?=
 =?utf-8?B?RU04ZDlmMVJDL3EvaGFOZkVXZytDSW1FdmFuL0JVaTBKdEd3VDR3bmdoRUtN?=
 =?utf-8?B?TUNjV0hSeS8yeDJZN0lWYTRNWHUwWEF5eGdhb2g2b1V2cXhmUmZoSDVQN2l4?=
 =?utf-8?B?V0FaeXJ2Tll4bDVGd3ZWdjFkYm9JaEdkZkZRL2kxMU9CckJQNjFpUi9MeUtR?=
 =?utf-8?B?dmorT2ltcHNiNnJPNlNLT0YrVVUrTFFhV3kwZXgwT2N1UXk5RlhYQlpVRk9C?=
 =?utf-8?B?U2tRQkFyVjFtVkhIQVc5c2h4MVBIQ2F2RlZuMXM3VjJ1ZU15Rm4vNFdMa05T?=
 =?utf-8?B?R2U3bjhvMkpqVlRXdzNPMDg2NVBCS1pxdDRVSllaUDRSWGZkOTB1MkFscGFK?=
 =?utf-8?B?ckoyWUl4YW4yUi9CcTFOWi95SjQwdS9NcXUzc0FPcXBVaDN0Wi9Wbk04RExZ?=
 =?utf-8?B?RnEvQjNmQVNIZVhPM05sandnTUZFRStlMm95UWp3RVE5S3lNYjNiL3FpUGIr?=
 =?utf-8?B?bkNzU2hPVEk0ck1YMXFBOWZpN1B0WTkySFNWckRkTWE5ajdJeGVRR3VRd29s?=
 =?utf-8?B?Qk1ISHpQaU9pNWZoMVZqV3ZOMjRlSE1jd1Y3Y0ZyYVg4NjN0MXJZZUYyOENs?=
 =?utf-8?B?ZkVoV0RiLzF3T25EdHhpMTNXeVZ1WXFHOUNWdWkrOTdRVk42UjJYcGIzR3RP?=
 =?utf-8?B?N0UwOG9uR25ZdWptZlprRG9qY1N4VEhqcWZaOFl2dEZ6Z0pHN0kvZHI0ZzE3?=
 =?utf-8?B?M2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a00a777-14b4-4e80-bdba-08dd411f185d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 11:13:16.4864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewbu6RkcFcjZ3coKGKMNQZV6hDZHxIJqGhnjMsaGY4WmkA7bheY3SQAwYbasCUzrlT36nxoWA485IojkOtEWzequ6YcSEx8m1pWpADkpB3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14228

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxNToxOQ0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYzIDA3LzEzXSBpcnFjaGlwL3JlbmVzYXMtcnp2Mmg6IEFkZCBzdHJ1Y3Qgcnp2MmhfaHdf
aW5mbyB3aXRoIHRfb2ZmcyB2YXJpYWJsZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rcyBm
b3IgeW91ciBwYXRjaCENCj4gDQo+IE9uIFR1ZSwgMjggSmFuIDIwMjUgYXQgMTE6NDcsIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhlIElDVSBibG9j
ayBvbiB0aGUgUlovRzNFIFNvQyBpcyBhbG1vc3QgaWRlbnRpY2FsIHRvIHRoZSBvbmUgZm91bmQN
Cj4gPiBvbiB0aGUgUlovVjJIIFNvQywgd2l0aCB0aGUgZm9sbG93aW5nIGRpZmZlcmVuY2VzOg0K
PiA+ICAtIFRoZSBUSU5UIHJlZ2lzdGVyIG9mZnNldCBzdGFydHMgYXQgMHg4MzAgaW5zdGVhZCBv
ZiAweDMwLg0KPiANCj4gVGhlIGZpcnN0IFRJTlQgcmVnaXN0ZXIgaXMgYXQgb2Zmc2V0IDB4ODIw
IHZzLiAweDIwLg0KPiBQZXJoYXBzOg0KPiANCj4gICAgLSBUaGUgVElOVCByZWdpc3RlciBiYXNl
IG9mZnNldCBpcyAweDgwMCBpbnN0ZWFkIG9mIHplcm8uDQo+IA0KPiB3aGljaCBtYXRjaGVzIHdo
YXQgdGhlIGFjdHVhbCBjb2RlIGRvZXMgKC50X29mZnMgPSAwKS4NCg0KQWdyZWVkLg0KDQo+IA0K
PiA+ICAtIFRoZSBudW1iZXIgb2YgR1BJTyBpbnRlcnJ1cHRzIGZvciBUSU5UIHNlbGVjdGlvbiBp
cyAxNDEgaW5zdGVhZCBvZiA4Ni4NCj4gPiAgLSBUaGUgcGluIGluZGV4IGFuZCBUSU5UIHNlbGVj
dGlvbiBpbmRleCBhcmUgbm90IGluIHRoZSAxOjEgbWFwDQo+ID4gIC0gVGhlIG51bWJlciBvZiBU
U1NSIHJlZ2lzdGVycyBpcyAxNSBpbnN0ZWFkIG9mIDgNCj4gDQo+IDE2IChvaCwgYWxzbyBpbiB0
aGUgZmlyc3QgcGF0Y2gpDQoNCk9rLg0KDQo+IA0KPiA+ICAtIEVhY2ggVFNTUiByZWdpc3RlciBj
YW4gcHJvZ3JhbSAyIFRJTlRzIGluc3RlYWQgb2YgNCBUSU5Ucw0KPiA+DQo+ID4gSW50cm9kdWNl
IHN0cnVjdCByenYyaF9od19pbmZvIHRvIGhhbmRsZSB0aGVzZSBkaWZmZXJlbmNlcyBhbmQgYWRk
DQo+ID4gdF9vZmZzIHZhcmlhYmxlIHRvIHRha2UgY2FyZSBvZiB0aGUgVElOVCByZWdpc3RlciBv
ZmZzZXQgZGlmZmVyZW5jZQ0KPiA+IGJldHdlZW4gUlovRzNFIGFuZCBSWi9WMkguDQo+ID4NCj4g
PiBSZWZhY3RvciB0aGUgY29kZSBieSBtb3Zpbmcgcnp2MmhfaWN1X2luaXQoKSBpbnRvDQo+ID4g
cnp2MmhfaWN1X2luaXRfY29tbW9uKCkgYW5kIHBhc3MgdGhlIHZhcmFibGUgY29udGFpbmluZyBo
dyBkaWZmZXJlbmNlIHRvIHN1cHBvcnQgYm90aCB0aGVzZSBTb0NzLg0KPiANCj4gdmFyaWFibGUN
Cg0KV2lsbCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkJpanUNCg==

