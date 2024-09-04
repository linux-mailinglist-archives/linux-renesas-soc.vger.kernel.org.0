Return-Path: <linux-renesas-soc+bounces-8682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8350F96AE0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 03:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC1FD1F247DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 01:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F08929A2;
	Wed,  4 Sep 2024 01:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QgStOYIK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B93B3211;
	Wed,  4 Sep 2024 01:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725414499; cv=fail; b=H+eTWA2Hco5+NSMCXldYsNh33g2KGOxr5ccUoZB4+ACliCCzHtqDymZgCq11/QEUG1UQRepIYv9+tL+l2EH4PaJRWo6etUIi1YUkFU3VFVguJK5uunv7GzXLX4N3gF8yaJdQLMJJVno1fu3yQFVTPX3SzkvI1Ye6MYVgyjJHqH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725414499; c=relaxed/simple;
	bh=Bgx5khOGhSZyjT7eksykcDeoTWniHJKS25ZsZp3xRT4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sdzcu4d1VmaG2Ufqyf9GshdXINYeew/XHqXtyMhc6dj1KnDcto4kPI7frPBCpjCYylQfFsMTYSwc5NvP0mPM0+QYiwvfB+rEctllrZhL9U0hA34Ap1pH6fhOYaOAw1EzVGpK6z2x+XGmZhNU3fSOkOkJdGZKW7UEQnL45vPM+Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QgStOYIK; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pok5EhOJnZ8NqVzMl78BolL5b1fHeA9GAj+4tBsbJNAdR2ZgezRRFm+O0hK6JyuZclPazm/ivmG1C3jRhtvX6IKC/xiOFxukGhIpfqh6HY5LgV6bJ7JrrC1JLhaYuQnOX81U9kIZ8a8L4N2MkqHRetsTzpBijb7d1peNnjzUvvIJVeIEAm3rwkBP4Egn158rDFouAbTVrC2uMGByzYRRZX6ZfmYbufRbIsHbZuXcsVrD7p0vbU3K6z0YQDjVQwvT/T8BOn2VFha5ZI6GEX20UTlvXCRz6ePRidmUojYLV9QmAJLgIysxC1ncfoqu/8NuLLtuQ/TfKuoNTVCtlWnb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bgx5khOGhSZyjT7eksykcDeoTWniHJKS25ZsZp3xRT4=;
 b=c9f2Nq44IBqoZdksHjzWltk/SOBMLlDCgEdeCEEu5i2cRg3Nq2lVpfK3ktJcIX4n19NkJZC5atLsC8GpYBhDo3wfDs+gEVCfeR6IFxrLBbMAVlaWc/qUedowDxya9TbNvEWbaNhu672gI4hpbLUBF6164aynwDlnsWifCVcR+TG2rcQsdqc5mSB/kY5ZUuhHlu6UL1LL7/Lh+aazgXoloPw1G4xzNhNPwyXe6DcoG7aHw9ULxHrx5ncDEoesybtpibRTurcMkkjj1VNyxlrVylinz1mFQqEbKcP9ifqImDa4tyRJE7XmvjgmvsES59NVopFrnLe4Wlh0lwARPbgEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bgx5khOGhSZyjT7eksykcDeoTWniHJKS25ZsZp3xRT4=;
 b=QgStOYIK4dJ3CTqwNi1sWIbDN7UfXQsMBZT+0fMmur3JwTWhwgb1dCXNWyIU/J/hqJL9/rsLYDAvbsYKbasnLm730NorEGtjPF33/XU75G9gR2O1OhRtPPBQMidYjXhOBeCoUKV2uvUCoJoWHiu+L1NQcloqJ4GPYas0GoQ60no=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OSZPR01MB6765.jpnprd01.prod.outlook.com (2603:1096:604:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 01:48:13 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 01:48:12 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
	<niklas.soderlund+renesas@ragnatech.se>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [net-next] net: ethernet: rtsn: Add MDIO read/write support for
 C45
Thread-Topic: [net-next] net: ethernet: rtsn: Add MDIO read/write support for
 C45
Thread-Index: AQHa/iVwnCCizQA40kCmKU5vTPSaO7JG3FZQ
Date: Wed, 4 Sep 2024 01:48:12 +0000
Message-ID:
 <TYCPR01MB11040F9D6D5388115E93EDEEFD89C2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20240903171853.631343-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240903171853.631343-1-niklas.soderlund+renesas@ragnatech.se>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OSZPR01MB6765:EE_
x-ms-office365-filtering-correlation-id: 6cf7ce86-9087-405e-03ee-08dccc83a321
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WDJ2eW4yTS90ejQ2VFArcFJSMFlBVGtJZ1ZlbWgzZGErcndHNUNGSi8xWW9U?=
 =?utf-8?B?RFZ6cEoyb3JlV0JrdEw2VlZCVVZZcFhZczdoanE4T1pSZWRjOWcrSEVXcEZO?=
 =?utf-8?B?bzRSdTJPWDhwTkQ4d1B3Z3JKSXFGRklNQnhGczdXUnBvZ001dHRBbEV1WmJX?=
 =?utf-8?B?cWlqYUJ3czZaQmlqZlk4STVING5QMU5HVmhYRXZGd282R04zU1JNeVIrRjNy?=
 =?utf-8?B?cmZUMDRrcVAvMXpBZE5sMVF4VFVtSjhneW9RZkxzZmxiU2g5YnBiQzM4Y1dG?=
 =?utf-8?B?MkNhUEw3cTFtRGhZUFozN2N6UmFwSEx0WDhVV3dYMzQ2WTFoT3ZjTVZubDNt?=
 =?utf-8?B?Y3FFYW03d3BEemtMaGY5cFkyZ3BXSEhLSDNwUEFPaFhrYXZxN0p2ZFM1VjJl?=
 =?utf-8?B?a2J3UkFhQzFwU1FaTzB1T2YxRHI2YnU5UVA2VW5QellJN1dwc1IyeUlOYU1X?=
 =?utf-8?B?WGZndjZYTWFqQ0FWRWRvR2NKSlhSRGxyVkNVcW92QUc0d0lGcmprNkNOVVB0?=
 =?utf-8?B?bnoyWlROaEpjL2hPNU91ZCtENS9tTG9XK0RTeFFndk9wZnk5UEt2RnVycnVB?=
 =?utf-8?B?VlFsVEdCNm05RzJkYi9zVllNM1lISHVDMnY0dStROE9ZRnhwdHE1WXJHbDQv?=
 =?utf-8?B?S2lFZjkxVU1UV0hYZm5JanN0bXJsTnFkY3dVNXVIWmxaTWdqWGhteUQrekdC?=
 =?utf-8?B?bE1mZDMwTnU4NTVZcHpqTTdnZzZ6dFVBSExGcUZBY3oxeFlCRENXUHUvdm9T?=
 =?utf-8?B?a0IxYkZrcCs3L0JVTmpWbEFlVFZUc3h3TU4vRDNnd2ZmdUk5M3BuVWpPMDdS?=
 =?utf-8?B?ckdkRm81c0lvNm5SNm42ME80NUtpN3NLa2I3TjdxMEh3OVNBM21oUElmTTZv?=
 =?utf-8?B?L2VQbG10ajVmM01walV1dGk4bW42L1kzbEJ1UXFhVkl5ckpaVzhHVFdjbVpL?=
 =?utf-8?B?SG0ya2pJdktOWGZMblNibU9lc3A1T0ZYbWFvemVrTWQ1aVlGWHh6RlU3dVBI?=
 =?utf-8?B?SmFTOWtoQzkxR1VCWm1TSnQwTG9aUEtkeFJzeVNSaEFSamludlF3RTJxY0RR?=
 =?utf-8?B?Ri9KQXU3RGxyQ3FIL3V3M2w3U1psMlBuNUpVVlk0SjN6ZUIxT0tGNm95bTY5?=
 =?utf-8?B?Z2M5Q0szVFNweEIvTHZTYlEyck1TTGJKdDFjdkMyNzNqckJGYTdBdGo4ME1x?=
 =?utf-8?B?SlVKSGRNVUhja2dtVmQ5dGU1cCtUSStmRmRvMG1neExXWEVyelpXWHgxM1lt?=
 =?utf-8?B?enplSzNXc0w4SlAxOC9zbVJyNzg5T0pRYnpoWWpLZ1p0WDBYYWRZSER4Q3Ir?=
 =?utf-8?B?YS9tV1g1dFNuYUlQOFFrcmowenM3ZEJ6aUdDNzY1T3k2WUNFME9zTWFaUzZ5?=
 =?utf-8?B?MEswMGZXY2hrS1V3MjE0cnUwRjFoT1BhK2RTeVZjY3o1VUN4YWFOTDczbmww?=
 =?utf-8?B?K3FndkJuQmYvRTBwS0UyaHFYaGlSSWM1bW5LQkhuTmQ2V1drcFNLaWhHSlRF?=
 =?utf-8?B?dytpZmdNTU9GRFA1ZUNCU0RZS3JsOVdIckVlS1NXeXpYZ2hNVXI4WWZZTG5u?=
 =?utf-8?B?S2lOTHJnY3RxWXkwSjFrNnRsbTdyZHMrUVFWTnBOSmYxZVlVQXBFZEh5ZmEy?=
 =?utf-8?B?UXliUTNaUDBZdnc5RTF5ZlpTdFlqTmd0eG9yVE9rTWxleEFFMjNvcnVWdHdk?=
 =?utf-8?B?bEt5MjJaMDFXVUtpeDlVY0tZekxWaXY1a2J2MzIwK0JER29NYjA1bGdudkhq?=
 =?utf-8?B?TUxqNU1YaEdkMXF6NXMwVnBHNTBnQU5Bb1pUV24rK0kvdkdqMXB4aDFxa2NB?=
 =?utf-8?B?SUFTL29rS2VSOUJnMUppaFMwQk9ZU0ZwWEF1S3UxaXpKQ0FlRW5ma1d4RU4z?=
 =?utf-8?B?RnNFbGFpNWNPeDhUR3FadytNSnpLUjBZeWtRSFhBVC9OUHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlRqSEFrbkd1Y3IyR2ZxSTlSSEJTY29IL2VJYUtvZDZBR1B0bUFCbEl5WTlx?=
 =?utf-8?B?MTFrbURCTlExeEtxaDVONHZwYXZENFMyNGhncGFvK2ZqeTFDaEtHVkxBQjhP?=
 =?utf-8?B?dHBjN1N1NmhWMmF5TXJQV1R3NHBxNXBDODAvMFd4YXRSS00xRFlzOER2L3Iy?=
 =?utf-8?B?QjZVK2dFVHZGTWQ0dFpxYmVTRURVQkxtSk9uODFBcCt5L09MRm1tc0dhTm9n?=
 =?utf-8?B?ZDkxNmVLdHNxTDl5WDhmUDh5c3BBR0VadTBpSkU1aVRlVnlSaklpaVJMbHBD?=
 =?utf-8?B?cXh5WG1Dam5Rc041bUhpWkZNaVVmZWJ1Y3R6cGprUTExNVA5enMzeFhzWHlK?=
 =?utf-8?B?Rldvbk1DeU1ubE5tMWhubGYrejVXb28xOWVrZ3hhbzdLSEJFOUlFNXpON2hK?=
 =?utf-8?B?bUtrVGN0T2dibXc3T3NScjlweVhBVlNmWm1wQjNrUko0TGpLU2s2K211NVRp?=
 =?utf-8?B?QzUwWHBoMHZzOG1uT09IS2l1L3BHYmZ4S1FtODYvTUFoOTkrcGp1azhZVU5a?=
 =?utf-8?B?VExjQVM0dWYxTG5vMU0wdGNtNk4ydVJ0dTBvUHozRHJyMXB2L2lNSi9LN2pZ?=
 =?utf-8?B?WmZxQzhlRmtpQlRHdXFVRDJWeTA1MC9TcUllWkZEVkNpSVpxeGhJTHhBVWs1?=
 =?utf-8?B?STdISE1CT0xKQnhpd3FGVTVHWi92bnA4TnU3VUJVV3RjblZsS0dZczhBNWNh?=
 =?utf-8?B?c0k1eDZkR1dVMndQbjZzb3B1NklGN0ZPVWFQcnNQbUFqMlU4UFlnTFh1RWFV?=
 =?utf-8?B?cGpvdTE5b1ZDUUxaT0hRZDBLQ0ZRWWtvRHNvb0NRdUlGb3hYRXZEdW83REV3?=
 =?utf-8?B?VVprdjduRERvZlcvVVlvTGF6VS9QTzZ4RlVKVFlCUTc1emZSeGtiS0N0bFhS?=
 =?utf-8?B?bjU3Rzd2MEVKMzVKWE5RTHNHTjNHVUZHdkgxaFdCelltTjQxaUJhbUlQb3p5?=
 =?utf-8?B?NGU3REJ3UVhmOXJhamJYU3Q0bFJNb2NZbXpsYnpEc21wMmt5bnlwRFZzeVFm?=
 =?utf-8?B?OVpvYm80SlBoTWE3empRTEV1SFRKdkM1S3VzTEdtSXFOUFBhL05mRE9HNXRH?=
 =?utf-8?B?T1B1c1l5L25LMXJUZnBGQ3B2OE03Y25XZnlTTVJpYlZXY2diM2hrSzFXWTlu?=
 =?utf-8?B?eUxrMGZrL3J4SHpZREdLcGlES3RTdEpLNjUzRTIyOTh0UW5RRkhYazVNVU9G?=
 =?utf-8?B?Q015dmkrTk0wVmFCNW1EZDc1Smk4dm44azVjZ1ozNm15RU9rM3pudnFLcjd5?=
 =?utf-8?B?V2hKK2FxNHhQQk5uS3haelp2ODJaL2gvQitHdE1xUlJyUXVTTkVCNUYwbGo2?=
 =?utf-8?B?TlBzWkR0ZmhiRkNSSHFrUFUyL1c4eUs3SkgxQzloeTVUVXVnRWp2TWNkN2dP?=
 =?utf-8?B?LzFHVDVWcU55M0laQzFZUHRnT0hLTUppMkFYdFBWU09SWHJRQ3czeWVwOXJD?=
 =?utf-8?B?ZHpUTnRhL2V5bWJ6UVdOZktLQW5yamI0RkhFb282MkJlRit2SUdodzFoSW1p?=
 =?utf-8?B?STZ5S1BqRHpTWmZCWFQvK0NxTEwwS2tmYUM3eFJJbUpwZWVnR212RnpuWkVC?=
 =?utf-8?B?YndWQUtSb0FPM05Pd1pSNzRhQ09XMzFJVzAyOHRRenNwTlFSVytsRW5YRWZJ?=
 =?utf-8?B?Z3pTVHNZL0R2bkorc2tERWwwSWpMbG0zK3E1NXhmQi9GcGdqbjI2a3Y3OFQ3?=
 =?utf-8?B?Sys1bGRKRlNwYVhGenUzZzBEeW03R1hYNCtkTXRQWWY4Z0ZkU0FLcXBsaVpi?=
 =?utf-8?B?TUp3WG1jZXl1WUgraDlkRFk2ck4rbUdaRHVvWHZOYWN2dUkyWTJ6TmtNdWQw?=
 =?utf-8?B?UUttUjVTV0JkQU5pREtrb2Z4VlJVNWs0WGdhSk1JRHo0NXJNQ1RnY2lQT2di?=
 =?utf-8?B?K21JZ0prQWhCVEJWbCt1eG83bjFrV3Q4YjhWb3FzZTdKaiszbmRRbVIzUitS?=
 =?utf-8?B?YW5hYW03R0lVZUNRblNtNFduNE5HZWZ5U2RpNUluTlJKUjZvU1pqUW51UVh5?=
 =?utf-8?B?c0NRaEtMZXBvZVg3c0tUWDV5UUhqYUdLQjlOSm4vMXkrTENVZXlZd013RXA4?=
 =?utf-8?B?aWdPWURpR2kvNk12S0ZIU0YzSzNKdk1kUmNZR1k4YktPdnVUMENlMU9TRWFR?=
 =?utf-8?B?bWRJOHMwQmhOQ09HeWdoTFRJQndVVjB6ZGZqYVNhYW5tRS9qWFF5TTFKa2E1?=
 =?utf-8?B?alplZjBkNjFub1gzQk0vNHQxdy95QkNxSWhTS1NlY25HQmk1VVNaWENZWGpl?=
 =?utf-8?B?TDFPVnlVTmFoTEdMdlVBd2xZWVdBPT0=?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf7ce86-9087-405e-03ee-08dccc83a321
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 01:48:12.9267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBPnBVyHlvukH3kUvs7zjDFjhkRehP7bMgSbVCKCSE+iIFtyM6CE+WjpXhxONads44+G7pFJeCvCbKTbhqjZPcgecQcriUP9ExpBP/e2VSXzSTp5We8ErDu7tdjLfUbj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6765

SGkgTmlrbGFzLXNhbiwNCg0KPiBGcm9tOiBOaWtsYXMgU8O2ZGVybHVuZCwgU2VudDogV2VkbmVz
ZGF5LCBTZXB0ZW1iZXIgNCwgMjAyNCAyOjE5IEFNDQo+IA0KPiBBZGQgQzQ1IHNwZWNpZmljIHJl
YWQgYW5kIHdyaXRlIGltcGxlbWVudGF0aW9ucyB0byBzdXBwb3J0IEM0NSBQSFkNCj4gYWNjZXNz
IHVzaW5nIFNJT0NHTUlJUkVHIGFuZCBTSU9DU01JSVJFRyBJT0NUTHMuDQo+IA0KPiBXaGlsZSB0
aGUgY29yZSBjYW4gaGFuZGxlIGEgQzQ1IFBIWSB1c2luZyBvbmx5IHRoZSBNRElPIGJ1cyBDMjIg
cmVhZCgpDQo+IGFuZCB3cml0ZSgpIGNhbGxiYWNrcyB0aGVyZSBhcmUgUEhZIGludGVyYWN0aW9u
cyB0aGF0IGFyZSBub3QgcG9zc2libGUNCj4gd2l0aG91dCB0aGVtLiBPbmUgdXNlLWNhc2UgaXMg
YWNjZXNzaW5nIFBIWSByZWdpc3RlcnMgdXNpbmcgdGhlDQo+IFNJT0NHTUlJUkVHIGFuZCBTSU9D
U01JSVJFRyBJT0NUTHMuIFdpdGhvdXQgdGhlc2UgY2FsbGJhY2tzIHRyeWluZyB0bw0KPiBhY2Nl
c3MgQzQ1IFBIWSByZWdpc3RlcnMgdXNpbmcgdGhlc2UgSU9DVExzIHJlc3VsdCBpbiAtRU9QTk9U
U1VQUC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29k
ZXJsdW5kK3JlbmVzYXNAcmFnbmF0ZWNoLnNlPg0KPiAtLS0NCg0KVGhhbmsgeW91IGZvciB0aGUg
cGF0Y2ghDQoNClJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1v
ZGEudWhAcmVuZXNhcy5jb20+DQoNCkFuZCwgSSB0ZXN0ZWQgdGhpcyBvbiBteSBlbnZpcm9ubWVu
dCAoUi1DYXIgVjRIIFdoaXRlIEhhd2sgU2luZ2xlIGJvYXJkKSwNCmFuZCB0aGVuIGl0IHdvcmtl
ZCBjb3JyZWN0bHkuIFNvLA0KDQpUZXN0ZWQtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhp
cm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNo
aW1vZGENCg0KDQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3J0c24uYyB8IDQwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMv
cnRzbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9ydHNuLmMNCj4gaW5kZXggMGU2
Y2VhNDJmMDA3Li44ZDZmZmFhMTNlNWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3JlbmVzYXMvcnRzbi5jDQo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMv
cnRzbi5jDQo+IEBAIC03NzEsNiArNzcxLDMyIEBAIHN0YXRpYyBpbnQgcnRzbl9taWlfYWNjZXNz
KHN0cnVjdCBtaWlfYnVzICpidXMsIGJvb2wgcmVhZCwgaW50IHBoeWFkLA0KPiAgCXJldHVybiBy
ZXQ7DQo+ICB9DQo+IA0KPiArc3RhdGljIGludCBydHNuX21paV9hY2Nlc3NfaW5kaXJlY3Qoc3Ry
dWN0IG1paV9idXMgKmJ1cywgYm9vbCByZWFkLCBpbnQgcGh5YWQsDQo+ICsJCQkJICAgIGludCBk
ZXZudW0sIGludCByZWdudW0sIHUxNiBkYXRhKQ0KPiArew0KPiArCWludCByZXQ7DQo+ICsNCj4g
KwlyZXQgPSBydHNuX21paV9hY2Nlc3MoYnVzLCBmYWxzZSwgcGh5YWQsIE1JSV9NTURfQ1RSTCwg
ZGV2bnVtKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0ID0g
cnRzbl9taWlfYWNjZXNzKGJ1cywgZmFsc2UsIHBoeWFkLCBNSUlfTU1EX0RBVEEsIHJlZ251bSk7
DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldCA9IHJ0c25fbWlp
X2FjY2VzcyhidXMsIGZhbHNlLCBwaHlhZCwgTUlJX01NRF9DVFJMLA0KPiArCQkJICAgICAgZGV2
bnVtIHwgTUlJX01NRF9DVFJMX05PSU5DUik7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJl
dDsNCj4gKw0KPiArCWlmIChyZWFkKQ0KPiArCQlyZXQgPSBydHNuX21paV9hY2Nlc3MoYnVzLCB0
cnVlLCBwaHlhZCwgTUlJX01NRF9EQVRBLCAwKTsNCj4gKwllbHNlDQo+ICsJCXJldCA9IHJ0c25f
bWlpX2FjY2VzcyhidXMsIGZhbHNlLCBwaHlhZCwgTUlJX01NRF9EQVRBLCBkYXRhKTsNCj4gKw0K
PiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQgcnRzbl9taWlfcmVhZChz
dHJ1Y3QgbWlpX2J1cyAqYnVzLCBpbnQgYWRkciwgaW50IHJlZ251bSkNCj4gIHsNCj4gIAlyZXR1
cm4gcnRzbl9taWlfYWNjZXNzKGJ1cywgdHJ1ZSwgYWRkciwgcmVnbnVtLCAwKTsNCj4gQEAgLTc4
MSw2ICs4MDcsMTggQEAgc3RhdGljIGludCBydHNuX21paV93cml0ZShzdHJ1Y3QgbWlpX2J1cyAq
YnVzLCBpbnQgYWRkciwgaW50IHJlZ251bSwgdTE2IHZhbCkNCj4gIAlyZXR1cm4gcnRzbl9taWlf
YWNjZXNzKGJ1cywgZmFsc2UsIGFkZHIsIHJlZ251bSwgdmFsKTsNCj4gIH0NCj4gDQo+ICtzdGF0
aWMgaW50IHJ0c25fbWlpX3JlYWRfYzQ1KHN0cnVjdCBtaWlfYnVzICpidXMsIGludCBhZGRyLCBp
bnQgZGV2bnVtLA0KPiArCQkJICAgICBpbnQgcmVnbnVtKQ0KPiArew0KPiArCXJldHVybiBydHNu
X21paV9hY2Nlc3NfaW5kaXJlY3QoYnVzLCB0cnVlLCBhZGRyLCBkZXZudW0sIHJlZ251bSwgMCk7
DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgcnRzbl9taWlfd3JpdGVfYzQ1KHN0cnVjdCBtaWlf
YnVzICpidXMsIGludCBhZGRyLCBpbnQgZGV2bnVtLA0KPiArCQkJICAgICAgaW50IHJlZ251bSwg
dTE2IHZhbCkNCj4gK3sNCj4gKwlyZXR1cm4gcnRzbl9taWlfYWNjZXNzX2luZGlyZWN0KGJ1cywg
ZmFsc2UsIGFkZHIsIGRldm51bSwgcmVnbnVtLCB2YWwpOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMg
aW50IHJ0c25fbWRpb19hbGxvYyhzdHJ1Y3QgcnRzbl9wcml2YXRlICpwcml2KQ0KPiAgew0KPiAg
CXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSBwcml2LT5wZGV2Ow0KPiBAQCAtODE4LDYg
Kzg1Niw4IEBAIHN0YXRpYyBpbnQgcnRzbl9tZGlvX2FsbG9jKHN0cnVjdCBydHNuX3ByaXZhdGUg
KnByaXYpDQo+ICAJbWlpLT5wcml2ID0gcHJpdjsNCj4gIAltaWktPnJlYWQgPSBydHNuX21paV9y
ZWFkOw0KPiAgCW1paS0+d3JpdGUgPSBydHNuX21paV93cml0ZTsNCj4gKwltaWktPnJlYWRfYzQ1
ID0gcnRzbl9taWlfcmVhZF9jNDU7DQo+ICsJbWlpLT53cml0ZV9jNDUgPSBydHNuX21paV93cml0
ZV9jNDU7DQo+ICAJbWlpLT5wYXJlbnQgPSBkZXY7DQo+IA0KPiAgCXJldCA9IG9mX21kaW9idXNf
cmVnaXN0ZXIobWlpLCBtZGlvX25vZGUpOw0KPiAtLQ0KPiAyLjQ2LjANCj4gDQoNCg==

