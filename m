Return-Path: <linux-renesas-soc+bounces-13596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE4A42840
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 17:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 409AD16E231
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 16:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E83C262D2C;
	Mon, 24 Feb 2025 16:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sRgqLoIf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011067.outbound.protection.outlook.com [52.101.125.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ABA263F3E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740415683; cv=fail; b=gaa+D2AIpYqpAz+BWVZDe0E4i2JaENoC3X4BDrqyOmAGWcUvwB08pxNd0m7LaEDSsbtAqUpc85z7kxi4QrRs8prS8bObd/E3a5R+UEv53a6ELH0pjoD7JWbXUY/SWU+EEvmeU9rhYqtWzNMcwoaT6+hp/Z7IJilTTwB3iPWThUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740415683; c=relaxed/simple;
	bh=/7qpNoXA34mie/ZfWmdaCms3AgKLdtsFtVzSa3f/N5Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FfgiBA8hsUlaib+AAl4F5WJQKN8iDJNlJffyyk5TynIQQCRS7i6XZ79/4Ze3XtgyYT4pzi8rCEYG9LenHUDohKcT8sjc5yO9dXhXbqB0E6b4AbdUEJqgaktv7euvL7C0CYVftLmHYpGD6eTtPAgJZ6ojOeCnIhCX2NQZjXureVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sRgqLoIf; arc=fail smtp.client-ip=52.101.125.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntKjctSLCvF8RWY5GlOPTKail+I0PytfEW+8d5HqALaomvESgQuHtyhgN0wkqfx4K1zgFtHG+Uh5NaPofpEYfxIzIIsNavQ1qbN3DaeDE6pYbu0Qa5k5+6DUGXdj3z5LNLT2ylHwpc3/qDxuzBaFbbUYmqok3xVp/eRyqFA5CHEf5qb9b+TEx4+3x0IdBMiGBdJPo6YSJtpaCiWHsLsZ8uGJn9W+D0tqj3mrEQM/IXHlW8Ph/HYwfTuv/9Q3Cw7X6z5dcnlUCEh4It0o7uDAnDFEDn143uOd8FHqmlP69F/yoJDdBDCpUIWAxOOeHrwDj7rQlIXvrtaCdWp277y5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7qpNoXA34mie/ZfWmdaCms3AgKLdtsFtVzSa3f/N5Q=;
 b=HFkUyeqMOJhnS0bDJY079+4XKoPpkoytc/3hECGT4uecxIAXdEt3DkZNF+X91XWcSFtua3+B+D5EdSgINko3plVjOY1DXKx0ZnFoKPYcZftR/JmtPwddN6CudjiR9rW75F0cgk+RVsuoVGYBF0EqoGGWZ6IjHbJn6KqXr2QlPGgsOkUl3TssfuBVoszb/JiPQPwc3GSUDf/qBEMWp+qgvFsr8zBgz+hp8c08s4R4ZDxNCIEX5GiCEj1EznsooNjYpOAOYWWVCbuiazt87f8W1kU3gknYSaOz5Ys9s1LKSRZfG7Ss1e7bcDtAqiUpPK9yjYYgEqpZVsePIf3WFJ70jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7qpNoXA34mie/ZfWmdaCms3AgKLdtsFtVzSa3f/N5Q=;
 b=sRgqLoIfIJK5zbpJwIPiNmWEbw3HkLQjOZrmKgVGdXl5JJJGM9eB/37MV2ST21VYgF0l7nWLKXGMG2ZM9cpE3ZQfUzk8jqgC3n0rXNnexYiR8SqE4RidAcF7Szfsh/cHu+o5kRnz9felOYIuQwRqG6o/+fMRM7DCPfr9EVEgGLI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14938.jpnprd01.prod.outlook.com (2603:1096:405:257::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 16:47:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 16:47:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 10/12] irqchip/renesas-rzv2h: Update TSSR_TIEN macro
Thread-Topic: [PATCH v6 10/12] irqchip/renesas-rzv2h: Update TSSR_TIEN macro
Thread-Index: AQHbhr3mKf/axI9JzU+q5frv4/ALZbNWd1YAgAAyGUA=
Date: Mon, 24 Feb 2025 16:47:55 +0000
Message-ID:
 <TY3PR01MB11346A7EF75FC8BCDDE761C6086C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
 <20250224131253.134199-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdU84BqccQpVUv22raWtqwe1F5Pfxw620V54nxEPN0ioxg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU84BqccQpVUv22raWtqwe1F5Pfxw620V54nxEPN0ioxg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14938:EE_
x-ms-office365-filtering-correlation-id: ce01b760-7d35-4c5e-881e-08dd54f2fcb2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dHZBOXR3Tkw2c2daRDhRVmNnbXRJamNJcXlyMDQzQzhvQVZweWFJcWpNVXJn?=
 =?utf-8?B?N094SFUwbGd1K1BmTGgwYytBc1NWZmkvOENrdUdHaHlhSWZmbEpsdUoyTFcy?=
 =?utf-8?B?UGFoTFNaUHdqM0R2UEVOR1FlZEhUYUxOOWFKdXRUR1M1R2tyQnM5S0psNDZu?=
 =?utf-8?B?N0dMaU45U2hySmNkU1hjRHlxRTRiWUx2REVLWnFTK3R6QS9HcHIrVWdVYWNk?=
 =?utf-8?B?ZGdqYXNRQlN3d2xwRXNvaVFEcVJWQW1CNDY5UU9IdkF1ZFkyWUJYR3NSTHhK?=
 =?utf-8?B?alVTeWpvVE4zVllKQmFtWGwwV3FGUERwdktYU0ZBS3JEeFc0Szlra1N6MGZ2?=
 =?utf-8?B?WSs4eG8rQitHSUlJT3BSeFI3Q1JvSXFwTWl2SXZVaGZ5NEoyUHNraCsrMlJv?=
 =?utf-8?B?NHZFSzkzMEtoQ0d3YW85NUtRSENNWGZqcEJrd25kdVFzbVNEaTlYbVNQSVAr?=
 =?utf-8?B?WjhhMjRTZ2hYUnlPTGlXN3IyQnk3VUpmQ2JHeXEweG1majRYTUZuY0RQTFhj?=
 =?utf-8?B?amRjQk05Y1JPakhIb2xiZDY0ZG9GVlpyakpzU3JGWW15WlV5VVNjNWdCQnNL?=
 =?utf-8?B?bVhsMkhhelFXV2FXNUxaOTliV0NZU1dBbUw3S2V1WGVSSHZ3NjJtTkJYN2ZD?=
 =?utf-8?B?Skp6bnVSbitBSDlpQlBNWHU4ekE0N2MyZE9FT01pOXozYUJhcXlPcWw3UmJl?=
 =?utf-8?B?NmxoVksyemRDdXhEVWRsNEtDdUxSZk9qWVFuQ1dGd2xDZEJNUUI1MllOaDNT?=
 =?utf-8?B?TnozMlhvajE4Q1hqRUdWcUVNTkxqcHBqdlJ6TkZDNFpkZGdtRGNDNmJRdktp?=
 =?utf-8?B?T3J1WWdpVkNGc3JxalluRzRkdmRYSmpPZnFGSnJJL2M1b1hiRG9Hbkx6Zi9o?=
 =?utf-8?B?d0ovMlRGZU53RzRqdElNRExsa0M3Kzd1RDVmd1hzL2d0SDRObGxEL2N2cllZ?=
 =?utf-8?B?dVY3TnZIeklNbTdVZ28zYnFoaUdMelRmNCtCMWFsWVkxWmtnNTNyVTFuaVlJ?=
 =?utf-8?B?dmVXaVZXNTRjUTRSR2pmdGYyWUFrU3hoek5nZkJLS2JqOGovcWhnL2N6aUxq?=
 =?utf-8?B?K3pTTUJGdHZEcWxBalQ4VkNqeklOWmNOTWEwTWRod05iNHBISi95RTFKa1Zm?=
 =?utf-8?B?VUlIYjR0amJ0V2tQQUl2UVlqYXF3N1ErMDhhUDM3N28vZ3RSbHlQUGw1Tnpn?=
 =?utf-8?B?aEp1SUVscEJtMG1wYnN4WTdEaDdubTVEbXFlZnlmY01Bb2dTV3ZOR0pCeEJN?=
 =?utf-8?B?N2d2VHBneHR2ZmRkbXREVml4VG9ObzlIT3BxamhiY0crWHdNbWpkT3Y4dW42?=
 =?utf-8?B?ZndHak1uZ3RxU21PSGN6eUdHeHlGdEdxdm1KaS9sbWtSVWdHSTJkRXNOSUVV?=
 =?utf-8?B?ZmlCWFZzNzQ2clJYSHhJUndXbHozaTlwRVpPcWREN1MwdDJ5VS91Ry83TUdN?=
 =?utf-8?B?blpBcS81dEtmbWJNdGd3ZXJmc3N0MEgvUG05QUpzN3NxVHhZUDY2aCsrdU40?=
 =?utf-8?B?eEp0cGZzdVhEZmdNV0J0dTJ1Wng4bS9nTHFBVnBlNElnYkpKZHFDZnI3MWgz?=
 =?utf-8?B?NzR1SWxBQ3dCWlpjZzErVDE1UGJaeVdKMmtIVk9UeTUvM3lyazdndHgvWmpE?=
 =?utf-8?B?WWRrVlUxSTJtQ0o5L0JkL2FaTnBtS3JnTVB2MFF3dCtaU3VZamVvTmhmb00v?=
 =?utf-8?B?YUptNmNnYXRMZy80NTNqVmtrWUhaWGNGWHhIbm4vT0lvaU16UFZUcmZmcXNZ?=
 =?utf-8?B?Tk1oOVBSQVZ2SGdtTTdsSGx2QnVLSEJRZHd1QUZkSUdCaHhjT2ZzOGxwRjdC?=
 =?utf-8?B?Qk94MnB3WnN0UGR6NTZ6TlNUb1FXakhCeDE3R2lhbEdGUUl6MGdWQnNNaTh6?=
 =?utf-8?B?RVF0K00wWDBURDZDZzBjL2YyRDF2bVUrVVZvU1dWbzRTZjhGMFpkYVM1dmtB?=
 =?utf-8?Q?vXPXhDwiv2Z0qfyNioUH7xUJr52OiRVY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cm5PdFNaN0lxMmI3UHNRREJyUHliOW9BbENUby9RSXdtS0g1OUVzVGJnZkdr?=
 =?utf-8?B?TW1KdzRWZ3dwU09HQWI0UENKN25POEFIZElYNTA2LzV0N3A4MURuTkNqQlph?=
 =?utf-8?B?bFFiZUhrbjUyNHZPSUJ4WXMrc0VBSHExWVZNMFh2WHhKUGUraS90L1VNcENG?=
 =?utf-8?B?WTNTaytHSWdJK3pyZlVjSGxCSXRGR21HeDZ5c05PSkxLcEJITEM4dlZmM1Ez?=
 =?utf-8?B?cjR3Mmd5dE8yM0VBN2VKUjN2Q2dwTlVQakIxY2RESkxENWpCem1sZ0tqbWpC?=
 =?utf-8?B?K1hacDc0WCt1UjdyajZZaVZZamt2UUZ1Z2FPMVRCRnpYZXZkR0VmOUxTUzRj?=
 =?utf-8?B?d3ZEZ3VLR3dld3h3TWxEakVIQXJJbWQxaE5FMUE3NFovRTNEckJTREt4Z0U4?=
 =?utf-8?B?Q2k2TEpQS2UwQkt5QXFqbDFrVkhvRjAwODZaRWlzd3B0QTIwOTJvMWVvUitp?=
 =?utf-8?B?bWFOUWIxTXAzeHRRWU5oN3ZmSFBybjlmeCtKemQwdVBqZWlRKzk3Y3Y2b3c4?=
 =?utf-8?B?VTRNc0F6T2Y5TnhXM3hjVzFWVk9ZbDdxcE5RQW1BR2ZOYytGeDN2ZXN0MHB2?=
 =?utf-8?B?dk1EZnA5OFgyTGEyY2R2bEtOU1BhdnBZaGZYK1hGS0pISlM3NkVDN1hERHFC?=
 =?utf-8?B?eStpM3pMZW1kaHNmeG13YXlpbVJ3ZlBXZXlYMHFvMlY1YmhWd2I1c0RRYWFC?=
 =?utf-8?B?c3pwUE1hZjRIb0M1YUdqYXNqTHUyTC9xMDQ5Y2E0MzhrM3RacGVWRjMwcStt?=
 =?utf-8?B?ZEViMk5sc0g4MEQyeEF5ZWFJKytnMlFGVU5TaUp2eHRjZThzdGx5VWVoVzhx?=
 =?utf-8?B?ZFh1b2J3ZjU4RU84bmVDM0lPYVNFQXF6b0daQlpSRkhudjAvc2VUUkorNDFH?=
 =?utf-8?B?TTNkQjlYa3M0VFk0Rmd1NURJQmwyL3U0VytXUEVIVzN3d2p2bkQ3MmtmY3Zo?=
 =?utf-8?B?akd0Njd1eGJxV1IwSUxsUWRReWdYbGd3Ni8rZXhyNlZiM09vS0J0S3JPQmhn?=
 =?utf-8?B?UkpzdXlYNTdzWGFERnZsWU03WFZDSzlOUjJPaWhRVThKbkQ5VWFBdHJLNFd3?=
 =?utf-8?B?QnpOZVJkOUZMMFlBMXF0dG1STmp4TkQzMFptMkFCZGVQMG9yd3Z6ajhqb29t?=
 =?utf-8?B?ei9taTA0dzRzc1pVN3hjQXFselpEeFRibkQ1TFBkU2VscFRPSnFWdUgrR0tK?=
 =?utf-8?B?RGEzczlJR2cyM3duT1FWNS9FUTdyb0JKWTcvMEUxemxXUXp3S1l6cVJETnZj?=
 =?utf-8?B?NUZ6VjJzTnZ3ZHVuamR4d25tYTNKRTJhUy9vaVBsd1dvNy9sQkpxUElHdzVR?=
 =?utf-8?B?YmRWQzU0ZDlMYk1MbGRTdkNqLzhoN3pxNk50azc0STY4cW9aZy8wdUhDNWl6?=
 =?utf-8?B?c2FmR25KVEQya2dla2JJOFkxM1pVS1ZJcHJ3OGRTQjdBWFhiazR1SGYyVEto?=
 =?utf-8?B?VlpwV3BEK1Zzdm9WaXpLc25QeUQ2ZmxodmExZDB2Zm9ZdytTVUpiZUs1THMw?=
 =?utf-8?B?VXdzZzhMNW9kUlNuV1hwZmNMOFltWmZ1V2VDaEI0dHorN1BLa2I1d0dyU2JW?=
 =?utf-8?B?UUVqUnRMUXpPb0NaeE5VS3BlTmFpbGx6RnJuU3ZlTjE1bWVBRHJkTDBmSVIv?=
 =?utf-8?B?cFFkYlc4WjVqMC9oZENaaEFrdTRKcGMvWERBYUhWN3hQTGlHZVBOR2VzdlV5?=
 =?utf-8?B?ZnpwemhlaFJzMnVsWkRSSnhwb1lnSXBCYUlEWnd0SUNCWFEvSmhOTis2OTJv?=
 =?utf-8?B?enVaYVNXT0dwZjhWRWNuTFh3TVo3cnZiSFhzRjFWdk9QUWRaRndSS3N6UmEy?=
 =?utf-8?B?L1ZBWnA3VldNNXRhd1g2NjQ1YWYrMm1Sa3haU1huL2pzcDlMTmhlWjk4ZGsr?=
 =?utf-8?B?dlczZzVUY0MzUnNYTXZQcjRHU3JOUEhCS3Y3YXg3ZnM1b3RnZUpWWEFpQm92?=
 =?utf-8?B?a2ZCNmFSQlJyc1FaMnV0OEZLZlBFQ011SG9WMlBCa2xuVkFjYm92MEhxbkJr?=
 =?utf-8?B?a0ZoOTBqMmwrMzRjeDBVa0dCMUJaYllBbml1VGJUZWhJVkZnNU95RFRpck5K?=
 =?utf-8?B?ZnVjYURPNTNMQ01hS3N4YVRFbXJnNE1HandoYkNjb2FZMUxmM1g5RTRKTy9I?=
 =?utf-8?B?UmtNYW52SURlY08yeDhkWnBiM3VxaUU5cWZEcWVqSnNqUlBFUnJVMXg4K0ZH?=
 =?utf-8?B?Z3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ce01b760-7d35-4c5e-881e-08dd54f2fcb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 16:47:55.4789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XU2tSnKi3y1VqRj/iBQkzjNprHULnsrjsl36i2GaxyEGYujMpY467+nrcgakbaEqjK5rx09cJSB/h3MvLZ1IRY2MuNSatKBReQ0Gct0aX2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14938

SGkgVGhvbWFzLA0KDQpTZW5kaW5nIHRoZSBwYXRjaCB3aXRoIGJvdGggY29tbWl0IGRlc2NyaXB0
aW9uIGFuZCBJQ1VfVFNTUl9USUVOICBtYWNybyB1cGRhdGVkDQp3aXRoIF9maWVsZF93aWR0aC0+
ZmllbGRfd2lkdGguDQoNCkNoZWVycywNCkJpanUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0K
PiBTZW50OiAyNCBGZWJydWFyeSAyMDI1IDEzOjQ2DQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMTAvMTJdIGlycWNo
aXAvcmVuZXNhcy1yenYyaDogVXBkYXRlIFRTU1JfVElFTiBtYWNybw0KPiANCj4gT24gTW9uLCAy
NCBGZWIgMjAyNSBhdCAxNDoxMywgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
PiB3cm90ZToNCj4gPiBPbiBSWi9HM0UsIFRJRU4gYml0IHBvc2l0aW9uIGlzIGF0IDE1IGNvbXBh
cmVkIHRvIDcgb24gUlovVjJILiBSZXBsYWNlDQo+ID4gdGhlIG1hY3JvIElDVV9UU1NSX1RJRU4o
biktPklDVV9UU1NSX1RJRU4obiwgZmllbGRfd2lkdGgpIGZvcg0KPiA+IHN1cHBvcnRpbmcgYm90
aCB0aGVzZSBTb0NzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHY1LT52NjoNCj4gPiAgKiBSZXRhaW5l
ZCB0aGUgbWFjcm8gSUNVX1RTU1JfVElFTiBieSBhZGRpbmcgX2ZpZWxkX3dpZHRoIHBhcmFtZXRl
ci4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlPg0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6
djJoLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnp2MmguYw0KaW5kZXggOThhNmE3
Y2QzNjExLi44ZDBiZDRkNjlkZTIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJl
bmVzYXMtcnp2MmguYw0KKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMN
CkBAIC02Niw3ICs2NiwxMSBAQA0KIA0KICNkZWZpbmUgSUNVX1RTU1JfVFNTRUxfUFJFUCh0c3Nl
bCwgbikJCSgodHNzZWwpIDw8ICgobikgKiA4KSkNCiAjZGVmaW5lIElDVV9UU1NSX1RTU0VMX01B
U0sobikJCQlJQ1VfVFNTUl9UU1NFTF9QUkVQKDB4N0YsIG4pDQotI2RlZmluZSBJQ1VfVFNTUl9U
SUVOKG4pCQkJKEJJVCg3KSA8PCAoKG4pICogOCkpDQorI2RlZmluZSBJQ1VfVFNTUl9USUVOKG4s
IGZpZWxkX3dpZHRoKQlcDQorKHtcDQorCQl0eXBlb2YoZmllbGRfd2lkdGgpIChfZmllbGRfd2lk
dGgpID0gKGZpZWxkX3dpZHRoKTsgXA0KKwkJQklUKChfZmllbGRfd2lkdGgpIC0gMSkgPDwgKChu
KSAqIChfZmllbGRfd2lkdGgpKTsgXA0KK30pDQogDQogI2RlZmluZSBJQ1VfVElUU1JfSyh0aW50
X25yKQkJCSgodGludF9ucikgLyAxNikNCiAjZGVmaW5lIElDVV9USVRTUl9USVRTRUxfTih0aW50
X25yKQkJKCh0aW50X25yKSAlIDE2KQ0KQEAgLTE1Myw5ICsxNTcsOSBAQCBzdGF0aWMgdm9pZCBy
enYyaF90aW50X2lycV9lbmRpc2FibGUoc3RydWN0IGlycV9kYXRhICpkLCBib29sIGVuYWJsZSkN
CiAJZ3VhcmQocmF3X3NwaW5sb2NrKSgmcHJpdi0+bG9jayk7DQogCXRzc3IgPSByZWFkbF9yZWxh
eGVkKHByaXYtPmJhc2UgKyBwcml2LT5pbmZvLT50X29mZnMgKyBJQ1VfVFNTUihrKSk7DQogCWlm
IChlbmFibGUpDQotCQl0c3NyIHw9IElDVV9UU1NSX1RJRU4odHNzZWxfbik7DQorCQl0c3NyIHw9
IElDVV9UU1NSX1RJRU4odHNzZWxfbiwgcHJpdi0+aW5mby0+ZmllbGRfd2lkdGgpOw0KIAllbHNl
DQotCQl0c3NyICY9IH5JQ1VfVFNTUl9USUVOKHRzc2VsX24pOw0KKwkJdHNzciAmPSB+SUNVX1RT
U1JfVElFTih0c3NlbF9uLCBwcml2LT5pbmZvLT5maWVsZF93aWR0aCk7DQogCXdyaXRlbF9yZWxh
eGVkKHRzc3IsIHByaXYtPmJhc2UgKyBwcml2LT5pbmZvLT50X29mZnMgKyBJQ1VfVFNTUihrKSk7
DQogfQ0KIA0KQEAgLTMxNCw3ICszMTgsNyBAQCBzdGF0aWMgaW50IHJ6djJoX3RpbnRfc2V0X3R5
cGUoc3RydWN0IGlycV9kYXRhICpkLCB1bnNpZ25lZCBpbnQgdHlwZSkNCiAJbnJfdGludCA9IDMy
IC8gcHJpdi0+aW5mby0+ZmllbGRfd2lkdGg7DQogCXRzc3JfayA9IHRpbnRfbnIgLyBucl90aW50
Ow0KIAl0c3NlbF9uID0gdGludF9uciAlIG5yX3RpbnQ7DQotCXRpZW4gPSBJQ1VfVFNTUl9USUVO
KHRzc2VsX24pOw0KKwl0aWVuID0gSUNVX1RTU1JfVElFTih0c3NlbF9uLCBwcml2LT5pbmZvLT5m
aWVsZF93aWR0aCk7DQogDQogCXRpdHNyX2sgPSBJQ1VfVElUU1JfSyh0aW50X25yKTsNCiAJdGl0
c2VsX24gPSBJQ1VfVElUU1JfVElUU0VMX04odGludF9ucik7DQotLSANCjIuNDMuMA0K

