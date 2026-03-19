Return-Path: <linux-renesas-soc+bounces-29864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAYXE368u2mtmwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 10:06:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF12C8553
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 10:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BFBD303E75C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCEA3B2FD4;
	Thu, 19 Mar 2026 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kJxk8zJT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349533B2FC9;
	Thu, 19 Mar 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911103; cv=fail; b=ESaGPmqD92f7HHsLxrq7kZXRfImKMeX0kEe78goEH9tBaTn9yWhr3sKY+Rn3qjMdatlb+SXd2H9GpSIeILHpdH+cgzF02SNYhSfaEvGpbnBOHWSCTlHav/tPawiUUUjAgESL5bMlNZCdZ8oq/26GsY1+The2KHVA0xmqkKrNvyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911103; c=relaxed/simple;
	bh=DbNUGPJARxxoZc8nSoZh8BErOBkYInIJRGh/22CH9SI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eAne2WXLyMIwICftNbCOOZm9bwvyhLYeKvBg9v7nbH/yMsU+GnZHK/5u8usqA9SawmhJ/BRChPdnC5TCbPcNM5U8bG4iVE3PEGQN59GnO/MOhb+rEgjeQjhfh0hBocAoWq4p5yTkm3fkeIWjuSoDqIWZGsFYvQPVCI0ri9s2zhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kJxk8zJT; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOhNuRwvTzLF8aUxJ2KbR9m00iugNw8mTOmZgpPmFw4JAHlQlvdoCPCGfPViJhev5PleCCaDRyQ68iSy3qeKrgvJa6rWh0I1XSZa8DbT6POULw7YVMYFObaGMeDgfp+Xjx35Mdlpqy802+kSY9EUBrWKDd0X5jYTTdEMFgSXzAH8a3xau6LbFH6dLY6NHeRbyQtR/WJzJuMquB0T6lhBILLtx6YxlLLR3UWSRed2YK79FlQxJfOu+QDjZM5q+h0fEx+rE2CeJ5NY50OEEtv7d4yHXR6zRNIGoph26EHCRiCVAI2QxhtmkqZFhdQ0sNwL7U7C+89KvzbS0AgIa0OTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbNUGPJARxxoZc8nSoZh8BErOBkYInIJRGh/22CH9SI=;
 b=WrXHtUbUZUJG/CC4CJkc0pXgXnaBstrU/neLzRn0gmkUu1zeSqMn1YTkbQyUb/lU+VL07MPBqiVGr3wxPcOvCqXGqSNZYgsEAYPo5iAic3ArmtJ1ppNxvwKJDC99r3ghK/fYqn8goYJ0w0lRhT0H3dgy2aF943/Mls9IM4M5CUDFbiAfZaKL9O72pIwDoUJPZ73ZBYOtxF9TQL/QmPJu0q+6iFUQH0muWcUMN216bfgnIxwgEyfYyR6aKAHKMQYaJAWMVRyrqUprpXcVCm4NrRWGHrGFSkoRMAgt60TD6/oxCOi99b+JxmfRN6BWSPSLZxjwFL5Uiu5xrMiNwFiXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbNUGPJARxxoZc8nSoZh8BErOBkYInIJRGh/22CH9SI=;
 b=kJxk8zJTrBjesQEa9FWcFlick1H3qQubph1RMWiAVw8U6YoWZ6o5oSGrKzrkI4w1L/F0aM2Hj0WILPYLpD/LcbipxdL6cZnrkbCpnCHOCQYlruMdgQ3cYkJ7lwOfaKA2nJz2hcdILiaVTd/SCUR/zcS1MO2hhYg2egbVnIjjv2A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13374.jpnprd01.prod.outlook.com (2603:1096:405:1c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 09:04:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 09:04:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module
 clocks during resume
Thread-Topic: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
Thread-Index: AQHctrMYtlGbS36aJ0+606OUdEOA3bW0YOUAgAADf4CAACCOoIAA9xcAgAATadA=
Date: Thu, 19 Mar 2026 09:04:54 +0000
Message-ID:
 <TY3PR01MB11346F2F1418F5AA184672AA0864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
 <20260318084151.122674-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
 <CAMuHMdU=2i=cDYoYnWztMt2aBRHqfh_66E82LD0gR8baL4XRmQ@mail.gmail.com>
 <TY3PR01MB113462B4D62B13F22516EBDED864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVtsK0wZJENtF4qM2K4zh_J9EtOfds+MMBG4FSw2Y1Bqg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVtsK0wZJENtF4qM2K4zh_J9EtOfds+MMBG4FSw2Y1Bqg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13374:EE_
x-ms-office365-filtering-correlation-id: a0c4574a-705f-4e7e-25e1-08de8596964f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 InC/4uyGZldmBePtr1/PYKxM/dk/0b9Niq53GyDN8XsOXhsUKohdjKeB67Qjb/HCgZX0u0X9TLqQ4ULDVW076DpTh2ICN4flvtmxjPdKc6lwakBQmS6eduP+H3YHzWSmqU4AK6mW5QaT5qMur1p16q1Z2yFoczntQwAl/vsHTkiKnO1VdGF7/1JR/G+gGaezY3NdZ9eQRXkySyLkO/DVObybAOW/B12KyzTKILS8p/rpYSixwPhAOAzDsJMWA7lsbYA0Hd+HwkF8Mk7Yejth9csJ9RjZTv07nsOqK8gaCQw+KWGS1wTRYZl63ba1ShxaxZ9mYQW8Tp0ccN4otD0iniEazC0gQoHI7uHwVjF1GRQ+sKtz0MNDx7xku/k5lVPhaECosD8GAYFHa1p19Q78MoTXk8vGa5R+M2y1zMxgO9/kVo4dqKWD2qDxZ8FdpL8YRjiqxdP9O30QGcd1GTmVRlImQ/cvySNqaLhB7bPX0DuTCdL5Kp+aCXjbWohB7602RqlWvAwIs7pYhqLmQc1dXyFwUeT65K+3BqPRbZBjX0mLwjehXJN45IR+MfnZZXOY1mVJkNjWiVOMBDjNm88ySDEl82Y9tY1fzUS87+jcL0fuNuNA3B/RoCPhr2QFjuwlNuD/zzL75qthvaztBKq25yTUs5AHUJZ/Rpz0RC21wSuJpxw1yIyTwsbGgzXSTa8Wmm8KQ+VG9kaPbR1dFdsw9HSI4J4MNAUBwgkpr4IFtssKl0MKQcujMphhhOyWshC7AyLxKfPXPEMzFF0Ane2uDVwvLBZZcYoA6XENER67hsU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2ExemRoOGJ4dW1yZXYvMzVYU0RjZVhqR0dhSTU0Vnd0NDhYN1dXZWVwSC9D?=
 =?utf-8?B?b0pGQzNQTzQ3eEZzUnN3elVyWTRUczdhS0M4SXFyVFFMVUU1V3gzWDRFS1dm?=
 =?utf-8?B?VzZmWFdpMXptOWtMV3JTbHA5eW9PR2RsVFArUk9zL2RBdmdXUEVMSzZ4M2RU?=
 =?utf-8?B?bDRqUHlpbTRvbzdzZHI0R3gydWdxN3ZEZFJ4ZmFmblJPcTk4TlZ1NGxyMzI4?=
 =?utf-8?B?dmtNMzFBWFgrVW5JV2wyWjRyZ1YzZGp6bFp1VXQ2L2x5N1I4Si9HdE16TTYv?=
 =?utf-8?B?SER3T0xkMlhKZHFyUVZYUVJzVUwrYlBteVQybFpUMUhJSlRTZ0FkODJWSjVr?=
 =?utf-8?B?S0VxQ2NKV2k3NktVM0pEb1pKSTFqTVpkN1QveXIreVBrWXlDOEpXTWg1TDRT?=
 =?utf-8?B?cDZ6ZXBUL1Jrb2l6WjhHUk9DdmJzQ1U3RGx6N3I4OUFJc1FEY3Q0L2FnanRv?=
 =?utf-8?B?NFlxVVlrSWVvQ0lEZGFLK3k3T1NUMVBZM0plVk0zZndOOVNEM25OeEtrZlRn?=
 =?utf-8?B?bk1oT1ZkVzMwYm5uRHhMaHB1bDlUanBzS1lLY0hWMUZMRjE5aTZRNDRhN2N3?=
 =?utf-8?B?UHd1SjZHMkE1WUMrZk1seDVxMXoxWnI3emhUbkdscm81UldsTkMrTFg4byth?=
 =?utf-8?B?S0hNUGd5ZU5UUlZoU3hKZXBvbS9RTUgrc29yUGNYd3V2enFqR3hDQmtHZVYr?=
 =?utf-8?B?Q3o3SlBSdE1Iam5jTHNWWWErSXJpU0V1R3NmMnd1RzUxQm9OOVpSbWc3UGJk?=
 =?utf-8?B?d0pTZlVvaHltNUQrcmErNjVja0NkRnBtOEIzYWtnaks2czk4aEFvSGROc2VE?=
 =?utf-8?B?VS9aZ2NuUFJiYUxLaXVnNTJlSnlDQzlwVFlXbXl1ZTVxT0NvQ3pxWis3azQ2?=
 =?utf-8?B?cUsxRmx3dG1JSjgxSW16UWV4V05Wb3lYaGtqUHZVNm1rdG9ZVFJoYjNsR0FE?=
 =?utf-8?B?OXpZaXY2cnZ4eHp6TWV6S0M3blAwRmowaitETzMrN3VkaVlVL3p0NWdwcmVI?=
 =?utf-8?B?VzB4TXNqZWczREFUcW1DZFBFRlJDU1MzTXVMTEVKdmFWQ0hubGNrb2xxWW1r?=
 =?utf-8?B?WkFxclNURjlBRTlUd0JKNUpPcW51aHdsZnBnL0hrWEJieTlrVmVoN2dkUjEv?=
 =?utf-8?B?TlBJV21Ha3B2cUc3Uk5nK3J2TUdsZVFrSERWbFhHQXB6eGhjeWlhV0dFZEY0?=
 =?utf-8?B?RzdaeXhTQzFBREpUM1FnTGFpQjJ0SWlHVG9UaEp0Q1ZsT1k4RWhJTUpxMVVB?=
 =?utf-8?B?MjJUWFJZa3BEdG5WRTNVR2VKc3Boa1lhS2FPSmwzTDc1NTkwazFTV3NJdjhn?=
 =?utf-8?B?dXpwamRBaDVPMjZNVTNoai9JZ0lZYkwyZEZReSs3a0V2QjA1ZDZXK2RQY3VG?=
 =?utf-8?B?eVpJTS9Gc1VqRkhUNDY1dTE4ZVJTY0Rtc1d5NHFYWndBdlVlbEVWV3Nuc0c1?=
 =?utf-8?B?eG1wbGE4ZnpaM09XVUkvRXdmaC9lb1o2cytFVWhWaVVJU01hTGFiYVN5eFZ5?=
 =?utf-8?B?cmcwbTIzOXdTM0VZTVVhYjJEaituRlp4bENjN0Mra1VBcVJIZXkwckYzNzZT?=
 =?utf-8?B?aGlyVzY5UlpWSHN0UlRudkVUeXFpaDA2MWt4N0VwdnN6UW0rWWNXaUtqdkda?=
 =?utf-8?B?RWZsYytVeW42K2wxT2lMT1VLSmx5eFhBak1PRHFhSjZaVG5kNWhtb1ArQ3la?=
 =?utf-8?B?OEt6S3c0SGQ4MWYrUkFwK1hKRGJXOWVtdjUvY0hrWnB2WTdNMnIvUUR0c1Fv?=
 =?utf-8?B?WTBPQUJoWkloTC9FQWpsWEM1bEdWVkNLRTFINVVIRW1QU1YrSGovY1JJNE5X?=
 =?utf-8?B?SlZ2ZFlwT0Zwc1VoK1RaQUVWQTM5L25YUjZ3YVJOaVRNYU5BQ2p4cDJmSmxL?=
 =?utf-8?B?aDdJV3ByL0luSDVpR0szN2NHclk2ZmhkOFpkVkhMaUplUmVMdkFlbEpoVFhK?=
 =?utf-8?B?NmY2RnhJYW8vaEVwbzQ5YUJRcy8wa3h5aFVBUzJxY2orM2hxY3pQOGFzbkI5?=
 =?utf-8?B?TnNqUEhtbEM3Y20rZkV6UkNOMzdZbTg1VWdDaTFBSHNXQUJNVktIRHNEYVZI?=
 =?utf-8?B?Z3dpVjNlTjZIR0R4VUVRV08wM2hTSGFyOGpTMDdwd2ZINitaQUttWHpxeHFX?=
 =?utf-8?B?OUZZWGZ4bExXRlFoQVF6YXJ6WFJsdHR3SW85YzlSUEVXcWh1b0IrOVZzZjBr?=
 =?utf-8?B?cCtmNDIwNFJHdDZmQVFHTGcvb1N4UXdGZE9PU3V6cG9RS29oMnlvTGU3eGlj?=
 =?utf-8?B?cXZLVjBvSVlqdGtTbzhUbkZucGFtaSt1R3hzZVZDaXZMSUZxVlNtQmt3RzA1?=
 =?utf-8?B?U0cvQ2pBWHpFcDdYQldCUXkreFRoaDJVQWJ4aGNRdVl5Zi9HeFNwQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c4574a-705f-4e7e-25e1-08de8596964f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 09:04:54.6228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQBE8JWQ2jTebjYw1k4pyYkhChX25IgXjiSdApB59XdYsZY8M4XsNbRfk0Nl3jypv4IN4zSj8pmSaq0PJQviSX4JGrX7tNjithWIH0i9gGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13374
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29864-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CEDF12C8553
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE5IE1hcmNoIDIwMjYgMDc6NDgNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSA0LzldIGNsazogcmVuZXNhczogcnpnMmwtY3BnOiBSZS1lbmFibGUgY3JpdGljYWwgbW9k
dWxlIGNsb2NrcyBkdXJpbmcgcmVzdW1lDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCAx
OCBNYXIgMjAyNiBhdCAxODowNiwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
PiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+IE9uIFdlZCwgMTggTWFyIDIwMjYNCj4gPiA+IGF0IDE1OjU0LCBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCAxOCBN
YXIgMjAyNiBhdCAwOTo0MiwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4g
PiA+ID4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBBZnRlciBhIHN1c3BlbmQvcmVzdW1lIGN5Y2xlLCBjcml0aWNhbCBt
b2R1bGUgY2xvY2tzIG1heSBiZSBsZWZ0DQo+ID4gPiA+ID4gZGlzYWJsZWQgYXMgdGhlIGhhcmR3
YXJlIHN0YXRlIGlzIG5vdCBhdXRvbWF0aWNhbGx5IHJlc3RvcmVkLg0KPiA+ID4gPiA+IFVubGlr
ZSByZWd1bGFyIGNsb2NrcyB3aGljaCBhcmUgcmUtZW5hYmxlZCBieSB0aGVpciByZXNwZWN0aXZl
DQo+ID4gPiA+ID4gZHJpdmVycywgY3JpdGljYWwgY2xvY2tzDQo+ID4gPiA+ID4gKENMS19JU19D
UklUSUNBTCkgaGF2ZSBubyBvd25pbmcgZHJpdmVyIHRvIHJlc3RvcmUgdGhlbSwgc28gdGhlDQo+
ID4gPiA+ID4gQ1BHIGRyaXZlciBtdXN0IHRha2UgcmVzcG9uc2liaWxpdHkgZm9yIHJlLWVuYWJs
aW5nIHRoZW0gb24gcmVzdW1lLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSW50cm9kdWNlIHN0cnVj
dCByemcybF9jcml0X2Nsa19odyB0byB0cmFjayBjcml0aWNhbCBtb2R1bGUNCj4gPiA+ID4gPiBj
bG9jayBoYXJkd2FyZSBlbnRyaWVzIGluIGEgc2luZ2x5LWxpbmtlZCBsaXN0IGFuY2hvcmVkIGF0
DQo+ID4gPiA+ID4gY3JpdF9jbGtfaHdfaGVhZCBpbiByemcybF9jcGdfcHJpdi4gUG9wdWxhdGUg
dGhlIGxpc3QgZHVyaW5nDQo+ID4gPiA+ID4gbW9kdWxlIGNsb2NrIHJlZ2lzdHJhdGlvbiBieSBj
aGVja2luZyBmb3IgdGhlIENMS19JU19DUklUSUNBTCBmbGFnIGFmdGVyIGNsa19od19yZWdpc3Rl
cigpDQo+IHN1Y2NlZWRzLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gcmVzdW1lLCB3YWxrIHRo
ZSBsaXN0IGFuZCByZS1lbmFibGUgYW55IGNyaXRpY2FsIG1vZHVsZSBjbG9jaw0KPiA+ID4gPiA+
IHRoYXQgaXMgZm91bmQgdG8gYmUgZGlzYWJsZWQsIGJlZm9yZSBkZWFzc2VydGluZyBjcml0aWNh
bA0KPiA+ID4gPiA+IHJlc2V0cywgZW5zdXJpbmcgdGhlIGNvcnJlY3QgY2xvY2stYmVmb3JlLXJl
c2V0IHJlc3RvcmUgb3JkZXJpbmcuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+DQo+ID4gPiA+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gPiA+ID4NCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVu
ZXNhcy9yemcybC1jcGcuYw0KPiA+ID4gPiA+IEBAIC0xMzAsNiArMTMwLDEyIEBAIHN0cnVjdCBk
aXZfaHdfZGF0YSB7DQo+ID4gPiA+ID4gICAgICAgICB1MzIgd2lkdGg7DQo+ID4gPiA+ID4gIH07
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiArLyogQ3JpdGljYWwgY2xrIGxpc3QgICovDQo+ID4gPiA+
ID4gK3N0cnVjdCByemcybF9jcml0X2Nsa19odyB7DQo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3Qg
Y2xrX2h3ICpodzsNCj4gPiA+ID4gPiArICAgICAgIHN0cnVjdCByemcybF9jcml0X2Nsa19odyAq
bmV4dDsgfTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gICNkZWZpbmUgdG9fZGl2X2h3X2RhdGEo
X2h3KSAgICBjb250YWluZXJfb2YoX2h3LCBzdHJ1Y3QgZGl2X2h3X2RhdGEsIGh3X2RhdGEpDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiAgc3RydWN0IHJ6ZzJsX3BsbDVfcGFyYW0gew0KPiA+ID4gPiA+
IEBAIC0xNjgsNiArMTc0LDcgQEAgc3RydWN0IHJ6ZzJsX3BsbDVfbXV4X2RzaV9kaXZfcGFyYW0g
ew0KPiA+ID4gPiA+ICAgKiBAaW5mbzogUG9pbnRlciB0byBwbGF0Zm9ybSBkYXRhDQo+ID4gPiA+
ID4gICAqIEBnZW5wZDogUE0gZG9tYWluDQo+ID4gPiA+ID4gICAqIEBtdXhfZHNpX2Rpdl9wYXJh
bXM6IHBsbDUgbXV4IGFuZCBkc2kgZGl2IHBhcmFtZXRlcnMNCj4gPiA+ID4gPiArICogQGNyaXRf
Y2xrX2h3X2hlYWQ6IEhlYWQgb2YgdGhlIGxpbmtlZCBsaXN0IGNyaXRpY2FsIGNsaw0KPiA+ID4g
PiA+ICsgZW50cmllcw0KPiA+ID4gPiA+ICAgKi8NCj4gPiA+ID4gPiAgc3RydWN0IHJ6ZzJsX2Nw
Z19wcml2IHsNCj4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiBy
Y2RldjsgQEAgLTE4Niw4ICsxOTMsMjYgQEANCj4gPiA+ID4gPiBzdHJ1Y3QgcnpnMmxfY3BnX3By
aXYgew0KPiA+ID4gPiA+ICAgICAgICAgc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluIGdlbnBkOw0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gICAgICAgICBzdHJ1Y3QgcnpnMmxfcGxsNV9tdXhfZHNpX2Rp
dl9wYXJhbSBtdXhfZHNpX2Rpdl9wYXJhbXM7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgICAg
ICAgc3RydWN0IHJ6ZzJsX2NyaXRfY2xrX2h3ICpjcml0X2Nsa19od19oZWFkOw0KPiA+ID4gPiA+
ICB9Ow0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgcnpnMmxfY3BnX2FkZF9jcml0
X2Nsa19od19lbnRyeShzdHJ1Y3QgcnpnMmxfY3BnX3ByaXYgKnByaXYsDQo+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjbGtfaHcgKmh3
KSB7DQo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcnpnMmxfY3JpdF9jbGtfaHcgKm5vZGU7DQo+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgICAgICAgbm9kZSA9IGRldm1fa3phbGxvYyhwcml2LT5k
ZXYsIHNpemVvZigqbm9kZSksDQo+ID4gPiA+ID4gKyBHRlBfS0VSTkVMKTsNCj4gPiA+ID4NCj4g
PiA+ID4gVGhpcyBlbmRzIHVwIGFsbG9jYXRpbmcgcXVpdGUgc29tZSBtZW1vcnkgdG8gc3RvcmUg
anVzdCBhIHNpbmdsZQ0KPiA+ID4gPiBjbGtfaHcgcG9pbnRlci4gICBBbHRlcm5hdGl2ZWx5LCB5
b3UgY291bGQgdXNlIGFuIGFycmF5IGFuZCBzaXplLA0KPiA+ID4gPiBhbmQgZ3JvdyB0aGF0IHVz
aW5nIGRldm1fa3JlYWxsb2MoKS4NCj4gPiA+DQo+ID4gPiBVcG9uIHNlY29uZCB0aG91Z2h0LCB5
b3UgYWxyZWFkeSBrbm93IGhvdyBtYW55IHRoZXJlIGFyZSB1cGZyb250LA0KPiA+ID4gdGhhbmtz
IHRvIHJ6ZzJsX2NwZ19pbmZvLm51bV9jcml0X21vZF9jbGtzPyBZb3UgZXZlbiBhbHJlYWR5IGhh
dmUgYW4gYXJyYXkgKGJ1dCBpdCdzIF9faW5pdGNvbnN0KS4NCj4gPiA+DQo+ID4gPiA+IEFub3Ro
ZXIgYWx0ZXJuYXRpdmUgd291bGQgYmUgc2F2aW5nIGFuZCByZXN0b3JpbmcgYWxsIGNsb2Nrcw0K
PiA+ID4gPiBkdXJpbmcgc3VzcGVuZC9yZXN1bWUsIGxpa2UgcmVuZXNhcy1jcGctbXNzci5jIGRv
ZXMuDQo+ID4gPg0KPiA+ID4gQW5vdGhlciBhbHRlcm5hdGl2ZTogcnpnMmxfbW9kX2Nsb2NrX2lu
aXRfbXN0b3AoKSBhbHJlYWR5IGl0ZXJhdGVzDQo+ID4gPiBvdmVyIGFsbCBtb2R1bGUgY2xvY2tz
IGR1cmluZyByZXN1bWUsIHNvIGl0IGNvdWxkIGJlIG1vZGlmaWVkIHRvIGFsc28gZm9yY2UtZW5h
YmxlIGFsbCBjcml0aWNhbA0KPiBtb2R1bGUgY2xvY2tzLg0KPiA+DQo+ID4gTG9va3MgdGhpcyBp
cyBzaW1wbGUuIEkgd2lsbCBzZW5kIG5leHQgdmVyc2lvbiBiYXNlZCBvbiB0aGlzDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+IGIvZHJp
dmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYyBpbmRleCBmOWU0YWY3ZjQ5ZDAuLmVlYWZiZmUz
YzcyNQ0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3Bn
LmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4gQEAgLTE2
MDEsOCArMTYwMSwxMSBAQCBzdGF0aWMgdm9pZCByemcybF9tb2RfY2xvY2tfaW5pdF9tc3RvcChz
dHJ1Y3QgcnpnMmxfY3BnX3ByaXYgKnByaXYpDQo+ID4gICAgICAgICAgICAgICAgICAqIG1vZHVs
ZSBpcyBpbiBpbnZhbGlkIEhXIHN0YXRlLg0KPiA+ICAgICAgICAgICAgICAgICAgKi8NCj4gPiAg
ICAgICAgICAgICAgICAgc2NvcGVkX2d1YXJkKHNwaW5sb2NrX2lycXNhdmUsICZwcml2LT5ybXdf
bG9jaykgew0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICghcnpnMmxfbW9kX2Nsb2Nr
X2lzX2VuYWJsZWQoJmNsay0+aHcpKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
cnpnMmxfbW9kX2Nsb2NrX2lzX2VuYWJsZWQoJmNsay0+aHcpKSB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoY2xrX2h3X2dldF9mbGFncygmY2xrLT5odykgJiBDTEtf
SVNfQ1JJVElDQUwpDQo+ID4gKw0KPiA+ICsgcnpnMmxfbW9kX2Nsb2NrX2VuZGlzYWJsZSgmY2xr
LT5odywgdHJ1ZSk7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByemcybF9t
b2RfY2xvY2tfbW9kdWxlX3NldF9zdGF0ZShjbGssDQo+ID4gdHJ1ZSk7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgfQ0KPiA+ICAgICAgICAgICAgICAgICB9DQo+ID4gICAgICAgICB9DQo+
ID4gIH0NCj4gDQo+IExvb2tzIGdvb2QgaW4gcHJpbmNpcGxlLCBidXQgdGhlcmUgYXJlIGEgZmV3
IGdvdHlhczoNCj4gICAxLiByemcybF9tb2RfY2xvY2tfaXNfZW5hYmxlZCgpIGRvZXMgbm90IHJl
dHVybiB0aGUgaGFyZHdhcmUgc3RhdGUNCj4gICAgICBpZiB0aGVyZSBpcyBhIHNpYmxpbmcgKGJ1
dCB0aGF0IG1heSBub3QgYmUgYW4gaXNzdWUsIEkgZGlkbid0IGNoZWNrDQo+ICAgICAgdGhlIGFj
dHVhbCBjcml0aWNhbCBjbG9ja3MpLA0KDQpTbyBmYXIgdGhlcmUgaXMgbm8gY3JpdGljYWwgY2xr
cyB0aGF0IGhhcyBzaWJsaW5nLiBXaWxsIHJldmlzaXQgaWYgdGhlcmUgaXMgYQ0KQ3JpdGljYWwg
Y2xvY2sgdGhhdCBoYXMgc2libGluZy4NCg0KDQo+ICAgMi4gcnpnMmxfbW9kX2Nsb2NrX2VuZGlz
YWJsZSgpIHRha2VzICZwcml2LT5ybXdfbG9jaywgc28geW91IGhhdmUNCj4gICAgICB0byBtb3Zl
IGl0IG91dCBvZiB0aGUgc2NvcGVkX2d1YXJkKCkgdG8gYXZvaWQgZGVhZGxvY2ssDQoNCkdvb2Qg
Y2F0Y2guIFVuZm9ydHVuYXRlbHksIGR1cmluZyB0ZXN0aW5nIHRoZXJlIGlzIG5vIGRlYWRsb2Nr
IGhhcHBlbmVkDQoNClYyTDogczJpZGxlDQpHM0w6IHMycmFtIGFuZCBzMmlkbGUNCg0KDQo+ICAg
My4gWW91IG5lZWQgdG8gbW92ZSB0aGlzIHRvIHRoZSB0b3Agb2YgdGhlIGxvb3AgYW55d2F5LCBl
bHNlIGl0DQo+ICAgICAgZG9lc24ndCB3b3JrIGZvciBjcml0aWNhbCBjbG9ja3Mgd2l0aG91dCBt
c3RvcCwNCg0KT0suDQoNCj4gICA0LiBQcm9iYWJseSB5b3Ugd2FudCB0byByZW5hbWUgdGhlIGZ1
bmN0aW9uLg0KDQpPSyBJIHdpbGwgcmVmYWN0b3IgdGhlIGNvZGUgYXMgaXQgaXMgY2FsbGVkIGZy
b20gcHJvYmUgYW5kIHJlc3VtZSgpDQpSZXN1bWUoKSBuZWVkZWQgZW5hYmxpbmcgY3JpdGljYWwg
Y2xvY2tzLg0KDQpJIHdpbGwgc2VuZCBuZXh0IHZlcnNpb24gZml4aW5nIGFsbCB0aG9zZSBwb2lu
dHMgYWJvdmUuDQoNCkNoZWVycywNCkJpanUNCg0KDQoNCg==

