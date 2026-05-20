Return-Path: <linux-renesas-soc+bounces-32869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IVCMIyyDWo82AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:09:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A1E58E83B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDEED303A9AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327543E1689;
	Wed, 20 May 2026 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Uz7BSPuf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E536AB5A;
	Wed, 20 May 2026 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282427; cv=fail; b=XkVm0yIAF1jw0Jg9QrQpb16dLKUWxCgL52XXYN1mGCxcLEG0czedrKk3DJ09Kl4cYlGOi6utBEK7n+lCeGASdQ2Ho/6zF41xYe1vJ/i4HMW93tEmHu+f5+nTF1WTg6TAa0HFNgJjPYJJ5KD5NE3B7DiUXkfsWis+P953Cj2rkbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282427; c=relaxed/simple;
	bh=563r6RZChDKkiKO4Yieys7MPk0svjfbLeH+XEjSiccw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bL6sZlaehp+Bgf/NulTXYh1Q9YteRmbPNCTQ5Rf42NOLIxWfI7ViHHuhf/qv4ehUp/M+Z8yQ94Pl+XbhOtEefKJdUmMcOWQjGLX+fe8tJV6NyEqVJ6k2vGypePWRUVnCUt5v146VLJDf/wxqYoKVuD419AssAhKhPB8m7xwuLzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Uz7BSPuf; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XD4d6ebrxvM66/mmZ/NWXJW0M/f40GM5/kuQwt3EpVaeosxm/WJ0U7VolRzJe3B9lA6/4iOjnBz05FjrlS46c3quMC0MCAaRQ7kPRLwcyGWcOGPHB91q/8zvOblQE8o8Mj36LqcaumD5V6WW8WsHpEHK+sVOyIrYflabvvv0bWHq6x5FlDIyZsYRibcEmerz5FzOQl4COjjGQH0NQWg8ifiFZhATEe9jeSLVyuARpqZb83jgfb6PX2tZwSgVphw4wckuWFxPk/gmQGrwTN0NWV9gEHm1eEvjAI5ZROr8PMugWwXYVGCSA9yA5h4tHDVHd8vLIbACYlhC0vsLFr95jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=563r6RZChDKkiKO4Yieys7MPk0svjfbLeH+XEjSiccw=;
 b=AksJfq7an2iJz3m2SxQItveySuKZBOTpIAponrOzAGL0agRbHBHfjsa540TOr51PU6UKrBJNr5UI64AvAHWHG4iDn94SFOXfI8c/IUqko2VrQbumIs2SGu/xSbzcib+UfbKxR+n1IGWE6K7mvjjAd2rhr6Z9kYz1VKs/SBLsTfUfYQz1M+xwwsuPw8psRGGJ0fhxN4/zVgozlQO8joLGROMw47B08NuqhZ/cGU/5n0w3cht3OiPAi13oMJ6y9zqUaPdAEZDpe1/2dL9GK9DyAfZGjlA9Gb5Jzc65RyNcdnj6VdU4mrBAtCh3BWfv8QEtUAfZm3mhJkL/L+9BNWQoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=563r6RZChDKkiKO4Yieys7MPk0svjfbLeH+XEjSiccw=;
 b=Uz7BSPuffylhwbIZ4z4Nurz5IMCi4LgFFcmeGIQdEJSFsZuhIh8xScPkF3xPSovaVIugsRz/pt5IgDHXHC+z+vT37Fl/sV6fn7saYY9g289++PVw/sR9fVo5xtmCKc1WU8O/6A6lPhaYUWVq0/VJJD61XeFCtG3VGeDBUZkygnc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB13856.jpnprd01.prod.outlook.com (2603:1096:405:201::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 13:07:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 13:07:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 0/3] arm64: dts: renesas: Add max-frequency to SDHI nodes
Thread-Topic: [PATCH 0/3] arm64: dts: renesas: Add max-frequency to SDHI nodes
Thread-Index: AQHc6E8MJT4mCkQtN06dZOkUg6ZfU7YW3lEAgAADpJA=
Date: Wed, 20 May 2026 13:07:01 +0000
Message-ID:
 <TY3PR01MB113468518E8A784740D2061E786012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWapgcYT8fOz+1uwWS_apAFvAtCEkqMTxWzM2t49TJptw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWapgcYT8fOz+1uwWS_apAFvAtCEkqMTxWzM2t49TJptw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB13856:EE_
x-ms-office365-filtering-correlation-id: f9daffed-2043-4a6e-a1ed-08deb670aeb1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|38070700021|4143699003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 PGm8mtZ7F50Injw8kwd+x5QUaBwshQUi3VCn82oVbG2UeLkjM4V4bvSoPvLiq+hhytyphTJ4JKDTRLo91zkZ6KFkel+7BaldOR+pfBIjQMMuJYRK9hDoquee60YCeE/6pmPJyQ0BOl9ejl4TRTMxOc2lmNb6uPAtol9gkpxhKMqAl2nPnLrE1MNfKDsJ1ibqEqus9e44pU5Ap7bOag9UlvZY2OrpJhBSEgt7XfHJyVQH4HZ/y8oBoubGNpmk7c0azv7maablYu/YP+J/Hg03nsUB4Yh0BIN2mk3CtlAwMeDhpU5qtsogQKioYhe3By3wmTVx1pMgpr7ZahQO8Of6mmKpVdcUKL6R2mg4jKYaPkcZytEGRGiuDqPebczD64bi5QOmvJyUEgaPtpQFwleBUN43IdpV4QZhSQD/5Cz2gMZTqZ1s/iE5X9jRWDHkBGR4EEpNI3qXsJZrBXNZDiRmA3KT3hkGH8RtSC3I/0kbZ1/h2dC28Bxshvc7Gpi0hHsLAIA3I6f+vjpIV+QV2v8fdGdPK8hu6TySi1bJROXhnMPSi4kAdtmh8bZmn0GtsdOVTE/g1YRDRU64nJrECHuwtUbsrL0AlmjDNgerxDqVKKREvzE/Svh3Nd6yAByfFT2ifbosAJil+Vt6Gph/WvbFG0plbJ5Y9gpHuEmXqK6l23U0WxKZvY4HsXKVDF8hKnP9xNcVzxjckm4CiSne0XTHMz8K4Zq1YoSWDW4I1rjEvCcVCRHOhmRZ0EPYe0AYmYlK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(38070700021)(4143699003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajFYM05oNEM3VjNDcXJHL2RHYmpObE84ejM5VTh2MDRmZ3gyaHorRnB2Q3VI?=
 =?utf-8?B?VEtVUitmYlRoMFNUNTFDYUFhZEtwRHJXUUM5ekdQbGx0YjF5NUJ5dy9BV3M4?=
 =?utf-8?B?UVFXeElhZ2NyL0hNY2FQOHRaVS9xMi93ZE5ZMDQxa1pUMVdCMHFrVUJLNjQy?=
 =?utf-8?B?OERJR2lXUG4yVVhPYlBkam41RlhldThKRGNLcXJvQUUxbk56R0I4VFEySE85?=
 =?utf-8?B?L3VqVnRzNzA4aWQzdHN4b0IrWEpscHB3MVczZGdPK0pJcTRNWnNER0xiUk5C?=
 =?utf-8?B?QVh2UExTV2pmdGFwRGY1aTVGR25ZTDBYKy9sOWsyaXlndDNmWG5GYk5iYndC?=
 =?utf-8?B?ZVAzRFRWVzJyRm1ncmF0bXVRWjZBTG5wS290MkdSQUdFcWY2K2FmeEo5Q1dB?=
 =?utf-8?B?RFFUQkUzQjh6TngrV1NMT1kyR0RuWFhkaFhZZEtNaVpSclNla3cwTTBTN3M3?=
 =?utf-8?B?aFRsdUY4OUdVTHluNmFiSlY1QmUzdk1jR2pncnB3K0dMNVU0Y29TR01ISDdV?=
 =?utf-8?B?bXF2ZDFTQ2JRT1l5MXlQYlVBNUVFb0ZiY25tdTVEREc2UXJwYThRSi9UTCt1?=
 =?utf-8?B?ZHZ3WVdzNmkwR1VXcS9udlhXTnMwTW5qdDJCRnZITnRzakFSd0dOcGc5UEcr?=
 =?utf-8?B?Vzd1N0RCY0pHb3F2ZlJqbmhEcEFSdVRGcDJJMXZybWs5bWtPb1NGZzNVRFRD?=
 =?utf-8?B?c2JZL0JXVG1DbXovR0JSSE5rQWFNYXNGRmNXWjNSQ1o4MWdldnRWa0lNREM3?=
 =?utf-8?B?Rko4VWJvZVN4a0ppaDZkU0hqcFFQNHVsZHhOa0NQclIrUUNXMFVrc01yQStl?=
 =?utf-8?B?a3lCNTQvTWdVSkVwU2pBVytvQklyQmxma2hmY2t4SUFFTTJtc29aemNMM3hY?=
 =?utf-8?B?OXRjblR5amtpUHJEeFd5R0lTTjBJNVJ1ZzNlRmVkQjJJN2xsODVCNHJ6RTcv?=
 =?utf-8?B?Qi9YSVZsbFdnMXJkaWxWdnBUdW80RU5xMEVWWE5rTVlnemwzY0pKSHFMREUv?=
 =?utf-8?B?emk4UHdCSitUdFF6b3dPeXVxRmhRNXZWVThDdFBjL3NkdmlXdXJ4bUpSVWdN?=
 =?utf-8?B?Q2pjdldjc3RoMEh2dWZ5NGxTclRJL2RwRUhXTGNKallUVSs2bXVUTjE0ak5T?=
 =?utf-8?B?K0hvTEZ2NmxzTDV2WnZiR1lSTFZ1THQwaWlSVjlpNEtaK205Q3VnbG5vU2hJ?=
 =?utf-8?B?b2gzcVd0NmRadTB2MjRLaEwyaFhsN09Fbm5PYTc1RTVGTWJKT0lzbVJYY0N3?=
 =?utf-8?B?R2l4QVVxcitLUmxWR2Nla3hhMjUrY1hZSnh2cHpzMzFzdUlBL2JEUC8vTWlV?=
 =?utf-8?B?Und1SGFhQk1PKzJZR1lDRVlVZm9RZlUvQk8rdWlNMzdGVGFzVVVRcWYyV0tW?=
 =?utf-8?B?MW5tVlk5VGNURjYrcE12Tlg5YUVNdm1PQUppNUtqVUpGekMyMXZ0YVNHcVpN?=
 =?utf-8?B?UFBiQ1ZuR2FBeGlSYTh1V284YWNEcWdJa2J4cDlEYStpR0NNNlU0STlyc2FW?=
 =?utf-8?B?N1I2Q2Z6SUtTSFVLVUxyeUgzbmxXaXdvd3AreEorVUlrRXBzMGJCZURyY2c5?=
 =?utf-8?B?VWM4aWowMUxkWXdicEhNLzcvcy9GSFJmcXVjblo0bFptTzZzbldzRG1hQzNW?=
 =?utf-8?B?WGkwbCtUK3FvUENWN2ZZTUtTNU1IMXlLeTArUnZ4MmpmZEUxOWJYbkNRcnc2?=
 =?utf-8?B?aG5Wayt5bUJUdjV5b09BcXE1MkV2QkVLbzRFUXN1TDhFZEJPemx1aU9iZHEz?=
 =?utf-8?B?QUdMY2lVODc0cUh2QjJSZVhMLzZyUlZJb0svcE5HM1BTL2dyMTlMVDBXZnEw?=
 =?utf-8?B?YnlybUZtYVp2T2tDdThQNS9lak1YK3dRVi81THQzS1FxblJRd1VraEF6RW1Y?=
 =?utf-8?B?akRHUTR5bXI1dGFtcXlnb0RkeTNicTZuSjU0a1kwaUhUV0FPb0tGWnZBUm9v?=
 =?utf-8?B?ejRqVnpBb2dnOEFJVDhHY0Z2NlRZSnJGeXBmUnVFUzNQZ0diM1FGV1VnUjJ2?=
 =?utf-8?B?c3FGdFg4elYvdHJwcHhUSmtqUW9ZSEVTVmNBdERGSlQveWtOYzRlcGRKU0sw?=
 =?utf-8?B?UmVDSUkxYmVNYW96bUR3ZEtwVWxEZEdoMjNybW4wYWNZZWgwTXFoWG9nTWlT?=
 =?utf-8?B?RkJRZnQ4aW1ZSWVEZUx6K2cvRm44SEFZd2pIWXVPZER2MklhazJqRmhwdHQw?=
 =?utf-8?B?cGFRenh5dExSdVRWOXB1d3lGT2VvNDV3Nnk0ZkEweWMySGNxRHNVY2Z1TVJq?=
 =?utf-8?B?RThoZnJKb1l2UWVVVzhlN3BNRUlRVEFvcVkweVBKbWgyNnIzdDRvcDRsQ1VP?=
 =?utf-8?B?RmRIY0RSdWZGM0Q4bnB2YjRhOVZ2ZVcrQ045bXZmRlVPdmhtblhpdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f9daffed-2043-4a6e-a1ed-08deb670aeb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 13:07:01.6202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5vBXezrei+Df3kchXFuVvQnkDdNHwbSWkJ/dCvZpoyqUD+f1BU9bp7aRs4H2mrhw2eWqJTLzK0ZZKPIyCt8eZXa7iOGFPm5BCM7CnsHrPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13856
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32869-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux-m68k.org:email]
X-Rspamd-Queue-Id: E3A1E58E83B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjAgTWF5IDIwMjYg
MTM6NTINCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzNdIGFybTY0OiBkdHM6IHJlbmVzYXM6IEFk
ZCBtYXgtZnJlcXVlbmN5IHRvIFNESEkgbm9kZXMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBX
ZWQsIDIwIE1heSAyMDI2IGF0IDEzOjUxLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdy
b3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
Pg0KPiA+IEFkZCB0aGUgbWF4LWZyZXF1ZW5jeSBwcm9wZXJ0eSBzZXQgdG8gMTMzMzMzMzMzIEh6
ICgxMzMuMzMgTUh6KSB0bw0KPiA+IGJvdGgNCj4gPiBTREhJMCBhbmQgU0RISTEgTU1DIGNvbnRy
b2xsZXIgbm9kZXMgaW4gdGhlIFJaL0cye0wsTEMsVUx9L1JaL1YyTA0KPiA+IGRldmljZSB0cmVl
Lg0KPiA+DQo+ID4gVGhpcyBjaGFuZ2UgcmVzdWx0cyBpbiBhcHByb3hpbWF0ZWx5IDMzJSBwZXJm
b3JtYW5jZSBpbXByb3ZlbWVudCBhcyBpdA0KPiA+IHNldHMgdGhlIFNEIGNsayB0byAxMDAgTUh6
IGluc3RlYWQgb2YgdGhlIG1heCAxMzMgTUh6Lg0KPiANCj4gSSBndWVzcyBpdCBpcyB0aGUgb3Ro
ZXIgd2F5IGFyb3VuZD8gOy0pDQoNClllcywgeW91IGFyZSBjb3JyZWN0LiBDdXJyZW50bHkgdGhl
IHNvdXJjZSBzZXRzIHRvIDEwMCBNSHosIHRoaXMgcGF0Y2gNCmNoYW5nZXMgaXQgdG8gMTMzIE1I
eiwgcmVzdWx0cyBpbiAzMyUgcGVyZiBpbXByb3ZlbWVudC4NCg0KQ2hlZXJzLA0KQmlqdQ0K

