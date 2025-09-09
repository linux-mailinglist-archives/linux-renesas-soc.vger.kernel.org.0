Return-Path: <linux-renesas-soc+bounces-21639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A7B4AD07
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 13:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17EEC1BC1999
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 11:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FD6322767;
	Tue,  9 Sep 2025 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DorfkjwZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E412522B6;
	Tue,  9 Sep 2025 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419121; cv=fail; b=E+bE7wNgcJ7IzrrQw0UlrgjgkPZh1fQNANgdQN2Nszi+8/YbtyyV6GwQLrpK8dznr6YOmg8WgqtyO1vKG905J3y4ocD/rGk0aXXC/CoBi+FHhUaGhMewnRLDHrYK+63rDMr1lH3cWAN0uSjmbFkHPIp/bWoiv56C0UpN5YrLRSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419121; c=relaxed/simple;
	bh=dqKop1HPg4lzdpdKvYfJ7n9PNydFmMwUR7MP9kXht2w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kkZUeKtCMktex067GZ5HgsbCAFEko/LVTa4IogltArWj7jRv04ghAYNZx6LKVIOjKs3LPnNSvW5FwElluWkuvhK4o0TkVbJxN1ECwtA1otxHV8TK59fvMGgObuT0WWWxYAWoXqwWU85VxTs+93qUhCCLFkKsjrLqWJo3SsenWjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DorfkjwZ; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSO1M1bs+1+rP5b3+pabcJk/IYed9uwYpGDF4DbXPqklEbWd9Z6auYMRVPkhoVj2MAYCpnlKBzONmPe8Qf1QOn17PxjAwDsB7AvPoE8qmNdzOFdOHgV3wVKuFNe4+r7U/4CYsAFib2yHM2Xt37edSrVvtphryqUsaTtbWTeJBg0QWRuTHM97kMzvoSJp7aO4uk6AMv/iPf+96sgRlbyS/+TC4l8Uqe6lb7Go8QzfYjFCOwtG4d6FmjY8Ezy/Mf3fILh6e6WQI+VOZ2n31Uos2TR6Tt9h72jjclJY3OfPBaocBuyAfzgrsDXmt8ZnQZUHyKCd4Cp+c4B2Z7RPL3qnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqKop1HPg4lzdpdKvYfJ7n9PNydFmMwUR7MP9kXht2w=;
 b=XplYMI3foJF4+Dipj04I0tan8+x0gNqdh1kMkRAITdBTWkdPurk0HBH0lHN+UqeFms5umAaNowld0xFnKwDfC+rePJxpWzaky/WnDKfEZpTVFu/Oxnap6ice4CnyCxxJOcJ5O2isrkntiIPPffz3g/5wgTA5WWcO0DiplMAinCSJbjzRBrNnmMQq6Z6uIsGRA/FdB+A40iO+5sCfXm+vUKR0N3RozgL0ke6IBuCQ1SvHiOEYuztpEQRMgU0M657q71z+nKIikRVlKVNlzEDepI4/8l0pPpnMi1CwtVd0YcpUStgVFKdiBOu57rexY3VmRpU8KdhP4AAKCw1Wo9r5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqKop1HPg4lzdpdKvYfJ7n9PNydFmMwUR7MP9kXht2w=;
 b=DorfkjwZoEpFqjD0StS1Kfg3dmKlyKDijm8Mrb5qqdFo4fjOjXbbl1pwmupwinjNf/JpUyBXJ5ziZQct96H3UYP/SWAsnvVdMG8Xr9FhbRRWu4ChINTD9jhHsYxTIcfXaeuSgsrNX0+0jaET68eCwfcsaIc+l8Cwr0azuJd28+s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7027.jpnprd01.prod.outlook.com (2603:1096:400:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 11:58:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 11:58:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 02/11] clk: renesas: r9a09g047: Add USB3.0 clocks/resets
Thread-Topic: [PATCH 02/11] clk: renesas: r9a09g047: Add USB3.0 clocks/resets
Thread-Index: AQHcEfZtUYCADz4sVUSMNBdnoYdizbR/9q4AgArnFvA=
Date: Tue, 9 Sep 2025 11:58:34 +0000
Message-ID:
 <TY3PR01MB11346F68D3D1B5E82937E63F7860FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUmi=pp10=_WNTwbuH-PYknbFyP9iBcQDB+tNKVEXgLpA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUmi=pp10=_WNTwbuH-PYknbFyP9iBcQDB+tNKVEXgLpA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7027:EE_
x-ms-office365-filtering-correlation-id: 88969009-550d-48bb-37ba-08ddef983432
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?US81WjlTQWl1akpVOE5QWTlZOURsMFhiMVcxR3pEalc4WmJXSHhLbWJsK3Fk?=
 =?utf-8?B?MTZqZzNtbzZXeE15Wml2azNWQnpVWTZWV25pNFdNZ3ZzY2M0NkthR1JIRHhs?=
 =?utf-8?B?WGI3Q3BOWjF0SnFCS3RJVHNsVG9aMHlldDlUN2QzeTlYS3RXZkxUYWpwbTl4?=
 =?utf-8?B?UEdYYm9jVDkyK1VZb1lzQ0Q2bFJ1Z1dLZE1OeStEdXFXMFZScXJQaDNSU1Fs?=
 =?utf-8?B?Mk45MmhZT3ErcTF4Yjdpdk9ISFp4M3kwYk91d3NzRjVpM0s3cG1kamlPdEs2?=
 =?utf-8?B?M0Z2akVsdTFtdyt2M1RVOWdaZVhmNDZyWmVHQWllMG5mcldMMVZ0THYxUFgw?=
 =?utf-8?B?cmczdXFtdXVmNDFvbjMzWWFLbCtLa1J0REFmdXdPb0pENE5pT3NRZkhHRlYx?=
 =?utf-8?B?dUNxaWVtdG9sZlpGbG1TMG55dzFhZnY3Q2wzT2lZN2dpRkJYeTVHNE9SU3hX?=
 =?utf-8?B?SlJ4MmZWd1RpaC9ycXlTRVVmQWxmNmNvOHZ4N1VyZmNTMVN5c240VnBZTEJu?=
 =?utf-8?B?d0NTNldmTisyNFhUV1VUY08zb3JUSkhDRFliMnNGVXZkNWNjcE5Ra2JoUzVn?=
 =?utf-8?B?YmNBMFNaODlqdU0vK0l5bXRJZXI4Nk5UREhtdm1vd2gwY3NrellLZWV0aXNU?=
 =?utf-8?B?S0x2MGcrQXhFV3hOajFEd0dqRUhVZHo1NWZVTi90RkNxYXVWSFRQYXczd1dQ?=
 =?utf-8?B?b25HWTFxQnN2NlFSVUhpeWdkdUZOMXlEWG9kTkFZZlZvcEpkR1NGckozQzV3?=
 =?utf-8?B?Z0FzWXk0cm5uMEFndzBVbHE4WklkbWxjaWZ3V2pCSVRHcmwxU1JWZ2RPQ1JJ?=
 =?utf-8?B?OEcyYy94emc4RkMyRDFBWVZzSWhTc3A0NEdaaHp2OW1vWUpza056bENNeDVP?=
 =?utf-8?B?SUczYnRYSTVrdzgvVkdXemIzQVd3QXF1YVo0ZmF2bFpMR0R3NDFqcW5qRnpD?=
 =?utf-8?B?RG9kSXkyd3MySFdxVHVGZFlBVk9QSFVWS0JyVlFmc2ZiaFhRcUx6NDFLa2tV?=
 =?utf-8?B?alJQaHNzTzFyN0hkNGxpeEJodmhQSFNPeE1iaHp3MTl2VFlvSENhbjV2NElX?=
 =?utf-8?B?dXR3THpzMzhnYkFpSUh0MTlTaVZtYjRJZFpLTjJKSEx2S3JhU0t0WENvZmEr?=
 =?utf-8?B?TkFOR2oxTG01bG4vbkkwTFkza2RwdUhKYkdKOHhTZzBObDVNM1J1S1lFUmtX?=
 =?utf-8?B?Q0pJVHFmcVB1VDRVZFBtcnVPcEE1WGhIY0tudkpDRUNVSnMzVm5IQUFqNVEx?=
 =?utf-8?B?V09Md0pSWkt0ZmRGbG5GamRZaHdKa3JWbGEvL0ZyYWZNVjNwbXhoemhnOXVW?=
 =?utf-8?B?UGpOdlQwejVRaGt2alpkSU5CM2EybjJNRVhIQmpoUVdxcDNSU1NPclEvQnhK?=
 =?utf-8?B?SU9aLzRSQ2YwTXp2d1orc2FlSStDYlE0Z21Ga01wOG4wVm9rWE1PWVduLzFI?=
 =?utf-8?B?SFg5NUdxdm9iN0Fqd3NPaDMwYVpTQmhXSStaMkFuT3N6N2l1Z0RyU2dNOWx2?=
 =?utf-8?B?T01Bb1BIcFBXRTZsUkN0ZGNDR1dYUjZDRnU0YXczVUdRbjM0dGdjODVlUGtC?=
 =?utf-8?B?L1hmRkh4OXRTaWs3YVJERW5KcUNwVVBzNzhXZi93QUd2S3htS1Q1bGZhOUZZ?=
 =?utf-8?B?NExWWk1iTkdHRjhjUCtBSndsK1ZEdU9VajhNRW0rdk5zaVQxWDZXY1hOSFJR?=
 =?utf-8?B?Wms5Y1RpamZ3amRjMHdsT2tsRzF1NlF4bVI4bzd5TTkvcEg5cG4zNzZITXdU?=
 =?utf-8?B?d2pZVjZ3RlV6d0lGVVl6L0RBTmlZTEFFODJjNlBuc3o0UW5WY2F4K1FVbklF?=
 =?utf-8?B?bjdtN2QrZS8rUjg5UWZpZGxNeituKy8zaHBabnFWWlBLMG9ZMXljdklORWtE?=
 =?utf-8?B?emZlUjVTMjd6czJZNVJTZWRvQVVINFF2UjBjOFF0V2Y1UXpvbzk4RHk3Q2h1?=
 =?utf-8?B?MFNGbWVzY3YrUEpEelYvRE1uM3VHRjRMVFN2d2pod0ZRZThXN1BCSmtpUUVa?=
 =?utf-8?Q?VmycFI1Fd5z0ds23suovkv102wuKVM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2ZsZHJrTXFvMEVCNTZqMUd2WmpBTTE5TUJsZmJJNEkzTklRRzBpRlF4WFIr?=
 =?utf-8?B?ZDZ2b2F6ZllkM0ZWUVJ1M0pkeHJtNllNbll0UFRqNWlvbXQ5SHFCdGtFRk0w?=
 =?utf-8?B?cEduSXpuSS84V1FIVWg5c012ZnByZjRZc0I2TDBZc01FUXZRYW9ud09UU2Nj?=
 =?utf-8?B?OGJucHBoemFjVEFnMytKTzR1WEpZV1djVTZmU0xIb1JrQmFycXZBVHQ0TTAx?=
 =?utf-8?B?N254elh4ZG81TExpK3BmS29VNFJZNHRvenRpRk9DSElmT2x5STgrR1B5bVhy?=
 =?utf-8?B?UTlMTGxDcmFFRnQ0andsd0I3cGVwc01TOWNIM25idVNuYTYrT3g1V1phc3ky?=
 =?utf-8?B?L1VHa0crQ3B3WEpFY1hFcmJQS1RieDVOcHIzNVlUbjc2U3NGU2U0M1c0SmJI?=
 =?utf-8?B?aHhMN2xrYlMzckE0V0RUUE9FUXFQWkVzcWgvZlpGUnE3WmQ0K0xyWWxvd25V?=
 =?utf-8?B?bDdwVnFyWXlQRFN1YTZEd25naWxqWmlqY2pvcUhvL3hyRXRyVHIxSjlzUXZz?=
 =?utf-8?B?cTFvRUQwT2pVNWk3MURCNTBFbEJwK1BVT203UDduYTZpSkpNeHROcEZtMUk0?=
 =?utf-8?B?d0cwL1NBOFFHSW9KVXUyWUpSTEltM3FVcWpHb0pidXFLQ25VcU1BMno2MjZG?=
 =?utf-8?B?Ri9pMnkrMlE1eVVHTWdKVm9mWWFqV3ZieU8rcUZhTFFMN3d3RE5kQ1EzNjhu?=
 =?utf-8?B?OHRMaXVlejRSSDMxWWN3aythSWJVa1RJL2FpZnRLaVlYY1lOSEZWcnpSYTNH?=
 =?utf-8?B?MDNYMlNkRVAwcjhtQlNmanc2b1ZKa0VYUzQ1T0YxbzlDU0xaaXNSYVgvUnV6?=
 =?utf-8?B?K0w5WnpKMDhUMXU0RENlRTdPRzc0aDFFdWJSN3R1TWdGMU0yMEIwSTVNdTE2?=
 =?utf-8?B?MHhvcUFBc1BIYW5jNDlOaUthdlVYYXU0R3NDemN2TmQxMzFqdC9MYXE0b1d3?=
 =?utf-8?B?S211M1djY2plSUs1SW5rbUJNTEF1UWRtaVRNSzVSKy9xcTltRlgvLzdYeSsz?=
 =?utf-8?B?OXNpZ3ZlaVZvcGM2UWk0OTdDeW5zUjNTcTNNYjZMWmxFcTlaYVk1NEZIQkhp?=
 =?utf-8?B?YUo3YW9na2hMQzNKVGRkdy90cExtSHNmbFR2aTg1M0N1SnFrdGgxUE9WRjRh?=
 =?utf-8?B?WFVHTnVjc2RhbEYvbTlpY1JITUltN0FpcCtDTC9wS0E2RHpjT1M1M3NCaEZ0?=
 =?utf-8?B?QXRGUjExZTFtZHUzdlNGS0lKV2ZoNzBnZGJtK3ZQTkpXVGFubW4rcG9wczVh?=
 =?utf-8?B?ZVA1N04weFJ6Yzc2R3NyNUwzTnA1Y1hkV0NXVkJNZHcrQk11K2pRSm1Eb0kz?=
 =?utf-8?B?QVlVbW9MVWozNWFuKzRENThNNUxCcGlHT0craDdGbmYxR0dESTFHWjM0QmhB?=
 =?utf-8?B?R2djWGhKVVlEWnNWelB2SEZ1RlZZRmFEeG5rQ1JrdGNsTDkrOU1QOWptL1kx?=
 =?utf-8?B?VmgzN2tGRmU0V3hZcHFJaWtINWhBWm5RNlF1dWY2TnpZWWQyWUdVUEJHVkpp?=
 =?utf-8?B?TVBtdWkyeWdoUVBQcVVxMTJWbHdFSXU5SW9ReUpaT3crSEtlYkpMV3RjdDNS?=
 =?utf-8?B?dEQvbmt2NjVXNzNyK2s0aG1WMW1Fak1xdHQvRE5iaHN4MUhYTU9DQUxFbUFG?=
 =?utf-8?B?K0xKSERNNDdSY1phdDFIVVI3MENuL2U3WFJTc1dvTGk4RlJhZzVodzZESFln?=
 =?utf-8?B?K0xBUEdQTk1jcTAzK3dxVE1uMmsxK2dWNjI3KzNwa2FLTnpwVExRZ0NYUVhn?=
 =?utf-8?B?WEVQa3VJOU0zK01FVGVOYXRvRmh0c0dxbVhPMHVRZ0grMVhlQlNHMllEbnVu?=
 =?utf-8?B?QWlWbndyeldQY0FwSm1GYlBLR05DOVFEaENJL1NLOTE3QU5GOXBUd2I3QlFI?=
 =?utf-8?B?dlJPRnEyVzBRWU8xVjNXRFpySmVlK0UxdXdEU3dpWXgzMUxGT2dETklKT0k4?=
 =?utf-8?B?RDJwMFhRL1hKTUlMRU8yaGlCbmNETENzWjlpYktOMHBQYW42NDBNVjlhWmxt?=
 =?utf-8?B?MVd1OHFpK2FWZ3BxRkNoZlFSc2F4UEw3c0JtRHNPY0J4MldIT3ppdE5pbHRM?=
 =?utf-8?B?V0dLa1dOQUxUS1VKQVl4VXFqQy9aTms2elYrRjFTUElCeXV3YllTWXNZcW1R?=
 =?utf-8?B?blV3REI1T3RiSDdGZDFNMkNtZGJRdlVDYnZaUFQxNVMySTNMMUUwNWo1L2g4?=
 =?utf-8?B?UFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 88969009-550d-48bb-37ba-08ddef983432
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 11:58:34.5845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lstq7MY+ZFeaX0x4+97WIiOf5hjGuYOIMMJjvrEGc9zcV1dejikgyfC/RcHot4cVI3Zs3P9CeMDWXIEaZiFE4UPihxnZkvEu2PIU55qHOxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7027

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDI1IDE0OjI3DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMDIvMTFdIGNsazogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQgVVNCMy4wIGNsb2Nrcy9y
ZXNldHMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIDIwIEF1ZyAyMDI1IGF0IDE5OjE4
LCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEFkZCBVU0IzLjAgY2xvY2sg
YW5kIHJlc2V0IGVudHJpZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDlnMDQ3LWNwZy5jDQo+ID4gKysr
IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOWcwNDctY3BnLmMNCj4gPiBAQCAtMTYsNyArMTYs
NyBAQA0KPiA+DQo+ID4gIGVudW0gY2xrX2lkcyB7DQo+ID4gICAgICAgICAvKiBDb3JlIENsb2Nr
IE91dHB1dHMgZXhwb3J0ZWQgdG8gRFQgKi8NCj4gPiAtICAgICAgIExBU1RfRFRfQ09SRV9DTEsg
PSBSOUEwOUcwNDdfR0JFVEhfMV9DTEtfUFRQX1JFRl9JLA0KPiA+ICsgICAgICAgTEFTVF9EVF9D
T1JFX0NMSyA9IFI5QTA5RzA0N19VU0IzXzBfQ0xLQ09SRSwNCj4gPg0KPiA+ICAgICAgICAgLyog
RXh0ZXJuYWwgSW5wdXQgQ2xvY2tzICovDQo+ID4gICAgICAgICBDTEtfQVVESU9fRVhUQUwsDQo+
ID4gQEAgLTE4MSw2ICsxODEsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNwZ19jb3JlX2NsayBy
OWEwOWcwNDdfY29yZV9jbGtzW10gX19pbml0Y29uc3QgPSB7DQo+ID4gICAgICAgICAgICAgICAg
ICAgQ0xLX1BMTEVUSF9ESVZfMTI1X0ZJWCwgMSwgMSksDQo+ID4gICAgICAgICBERUZfRklYRUQo
ImdiZXRoXzFfY2xrX3B0cF9yZWZfaSIsIFI5QTA5RzA0N19HQkVUSF8xX0NMS19QVFBfUkVGX0ks
DQo+ID4gICAgICAgICAgICAgICAgICAgQ0xLX1BMTEVUSF9ESVZfMTI1X0ZJWCwgMSwgMSksDQo+
ID4gKyAgICAgICBERUZfRklYRUQoInVzYjMwX3JlZl9hbHRfY2xrX3AiLCBSOUEwOUcwNDdfVVNC
M18wX1JFRl9BTFRfQ0xLX1AsIENMS19RRVhUQUwsIDEsIDEpLA0KPiA+ICsgICAgICAgREVGX0ZJ
WEVEKCJ1c2IzMF9jb3JlX2NsayIsIFI5QTA5RzA0N19VU0IzXzBfQ0xLQ09SRSwNCj4gPiArIENM
S19RRVhUQUwsIDEsIDEpLA0KPiANCj4gInVzYjNfMF8uLi4iIGZvciBib3RoLCB0byBtYXRjaCB0
aGUgcHVibGljIGRlZmluZSBhbmQgdGhlIGNsb2NrIGRpYWdyYW0uDQoNCkFncmVlZC4NCg0KPiAN
Cj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHJ6djJoX21vZF9jbGsgcjlh
MDlnMDQ3X21vZF9jbGtzW10gX19pbml0Y29uc3QgPQ0KPiA+IHsgQEAgLTI3Niw2ICsyNzgsMTAg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCByenYyaF9tb2RfY2xrIHI5YTA5ZzA0N19tb2RfY2xrc1td
IF9faW5pdGNvbnN0ID0gew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEJVU19NU1RPUCg4LCBCSVQoNCkpKSwNCj4gPiAgICAgICAgIERFRl9NT0Qo
InNkaGlfMl9hY2xrIiwgICAgICAgICAgICAgICAgICBDTEtfUExMRFRZX0FDUFVfRElWNCwgMTAs
IDE0LCA1LCAxNCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBCVVNfTVNUT1AoOCwgQklUKDQpKSksDQo+ID4gKyAgICAgICBERUZfTU9EKCJ1c2Iz
MF9hY2xrIiwgICAgICAgICAgICAgICAgICAgQ0xLX1BMTERUWV9ESVY4LCAxMCwgMTUsIDUsIDE1
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJV
U19NU1RPUCg3LCBCSVQoMTIpKSksDQo+ID4gKyAgICAgICBERUZfTU9EKCJ1c2IzMF9wY2xrX3Vz
YnRzdCIsICAgICAgICAgICAgQ0xLX1BMTERUWV9BQ1BVX0RJVjQsIDExLCAwLCA1LCAxNiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCVVNfTVNU
T1AoNywNCj4gPiArIEJJVCgxNCkpKSwNCj4gDQo+ICJ1c2IzXzBfLi4uIiBmb3IgYm90aC4NCj4g
SSBjYW5ub3QgdmVyaWZ5IHRoZSBhY3R1YWwgY2xvY2sgYml0cywgYnV0IHRoZXkgZG8gbGllIGlu
IHRoZSBlbXB0eSBudW1iZXIgc3BhY2UuIEFuZCBhcHBhcmVudGx5IHRoZQ0KPiBjZW5zb3IgdGVh
bSBmb3Jnb3QgdG8gc2NydWIgdGhlIE1TVE9QIGJpdHMgOy0pDQoNCk9LLg0KDQo+IA0KPiA+ICAg
ICAgICAgREVGX01PRF9NVVhfRVhURVJOQUwoImdiZXRoXzBfY2xrX3R4X2kiLCBDTEtfU01VWDJf
R0JFMF9UWENMSywgMTEsIDgsIDUsIDI0LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEJVU19NU1RPUCg4LCBCSVQoNSkpLCAxKSwNCj4gPiAgICAg
ICAgIERFRl9NT0RfTVVYX0VYVEVSTkFMKCJnYmV0aF8wX2Nsa19yeF9pIiwgQ0xLX1NNVVgyX0dC
RTBfUlhDTEssDQo+ID4gMTEsIDksIDUsIDI1LCBAQCAtMzUyLDYgKzM1OCw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgcnp2MmhfcmVzZXQgcjlhMDlnMDQ3X3Jlc2V0c1tdIF9faW5pdGNvbnN0ID0g
ew0KPiA+ICAgICAgICAgREVGX1JTVCgxMCwgNywgNCwgMjQpLCAgICAgICAgICAvKiBTREhJXzBf
SVhSU1QgKi8NCj4gPiAgICAgICAgIERFRl9SU1QoMTAsIDgsIDQsIDI1KSwgICAgICAgICAgLyog
U0RISV8xX0lYUlNUICovDQo+ID4gICAgICAgICBERUZfUlNUKDEwLCA5LCA0LCAyNiksICAgICAg
ICAgIC8qIFNESElfMl9JWFJTVCAqLw0KPiA+ICsgICAgICAgREVGX1JTVCgxMCwgMTAsIDQsIDI3
KSwgICAgICAgICAvKiBVU0IzMF9BUkVTRVROICovDQo+IA0KPiBJIGNhbm5vdCB2ZXJpZnkgdGhl
IGFjdHVhbCByZXNldCBiaXRzLCBidXQgdGhleSBkbyBsaWUgaW4gdGhlIGVtcHR5IG51bWJlciBz
cGFjZS4NCj4gVVNCM18wX0FSRVNFVE4sIGZvciBjb25zaXN0ZW5jeSB3aXRoIHRoZSBjbG9ja3M/
DQoNCldpbGwgZml4IGl0IGFzIFVTQjNfMF9BUkVTRVROLCBmb3IgY29uc2lzdGVuY3kgd2l0aCB0
aGUgY2xvY2tzLg0KDQpDaGVlcnMsDQpCaWp1DQo=

