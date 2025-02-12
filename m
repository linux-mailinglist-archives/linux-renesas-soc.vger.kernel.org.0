Return-Path: <linux-renesas-soc+bounces-13060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ADAA32217
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 10:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E2747A1500
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 09:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECED205E2F;
	Wed, 12 Feb 2025 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="B9VRUKBu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338872046A1;
	Wed, 12 Feb 2025 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352412; cv=fail; b=MzZ4rMzx3GqdkTtxhW3Vs7X3wgJVqiW7s9K+6u3eZGWnwPgS1x2XLzqHzFPiUzLt4eBBA+GIabrptD5I1mPHPVZHJAv4CGgOa1IY/qWZP+dYmlDzWkOxmLZNJ6HP1kzC/zU/dCSKw+gQpRamC7b8vRClqK00dnei6LURIn3BC8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352412; c=relaxed/simple;
	bh=so0UiKfq2YnXZlSg/Ba8XE7+I+egwS4AiKYOzRTrtQM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iRQEO2SbXY5/sKtZfXCmkr3se2Fv3rQ0vQ/CYL0J1OAYNnYoBxUP43Cqo8VnPMuWNRca23X0gV2dboRUvgzbXW5n9spmBOdj5KVVe1I74iWHzsq6rcscx4DBBvrzvTHV2Xxe6gGlN1PHZaJqgr+lf5bFXfMZWuiHRKYmVyj5kMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B9VRUKBu; arc=fail smtp.client-ip=52.101.125.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HU+2JRXDEp7rOp/a0FwzEo66MOKRkWnqtjvwqNODk3OnOtRWd1fDneL9EC4WW62c0KYIHQWaHBVSHucJUcfNe8LxJiCMs+F7zZyP/qzM9+62so6KcUXgttmOgQEn5cWgCa3FIWISw4UtzeS0hRlu0y3lQ1ddNxB526sGZpy6Bt4ElS1+YSTp+fV2xqgiroZa/QIVuVs7R3Z8amVXxsx3uc5klvawXKWz/0mH2teb7h3sY/5MFpXkvAYG2j6PGcVq/vv/dhmTHNPIt0Ny7AqMbIzvMSkk5B2KgJe7YbGpunvou+DoVHvOCnuBhQ1Vu4nSeFBYbJmFxb2Ls8Axg4WLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=so0UiKfq2YnXZlSg/Ba8XE7+I+egwS4AiKYOzRTrtQM=;
 b=a1lf5pxl5bTN5MZc/p5BNq7s69IlJRGFp3dG2QWokupZ75kZZKvfyQf4/Cbi4GynT0QGO4gYqozCi6xgDKHhz7AKTUC+dIrg4U2Ixi5fP7j8XZ0/Zkoz0TkoAtu7NaCwjXOdInm5Cmmr5jopxbPPe5/8CKRvxwQLu5CrM/BaEvwLIO74Sluby/kuZFIn2q2Urc/oKpnmUxKB/c4POVr+UscFIcfTGS2gybpSOYPg6IY84FmUNdPPV+hz8TgDvHpdG09VJf/bhqfF9P25PfiRlj3OXPqSxtF0RgENskMs76DLK/8LaZnnJa2TATdbMdvTyFCg7lrlAqdzv4ZJe5ic/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so0UiKfq2YnXZlSg/Ba8XE7+I+egwS4AiKYOzRTrtQM=;
 b=B9VRUKBulp/WWLKh/0bWwImsUulDN8a8Vhc4ptZR0hnsdbAQxyHzsjCTLQfGjX8/uINaiyd6NNkagfjOp+UmX7uSsSEeBZpj+iqZ97AYPa9zNvgGWRS11wfg8OOsEzDDvRdoFnVB9h1oqKHIgA5gyICxt/A0IQr2OW0RAvs0d+M=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB7169.jpnprd01.prod.outlook.com (2603:1096:400:c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 09:26:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 09:26:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>
Subject: RE: [PATCH v4 12/12] arm64: dts: renesas: r9a09g047: Add icu node
Thread-Topic: [PATCH v4 12/12] arm64: dts: renesas: r9a09g047: Add icu node
Thread-Index: AQHbeVSx1ueiWEUfiU2+tZK3H/IVVLNCH5UAgAFN21A=
Date: Wed, 12 Feb 2025 09:26:45 +0000
Message-ID:
 <TY3PR01MB1134679D9057F586B96EFA2ED86FC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
 <20250207113653.21641-13-biju.das.jz@bp.renesas.com>
 <CAMuHMdWvGY8PwWneCcqXvXjjvGSdDq0DkeTRjfH7yWbioN5Z7g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWvGY8PwWneCcqXvXjjvGSdDq0DkeTRjfH7yWbioN5Z7g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB7169:EE_
x-ms-office365-filtering-correlation-id: 7e496b48-5bc2-4144-20ff-08dd4b475e62
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ejdqUHRKd0JzVFVzaE9DWEhvZEx0aGlkc296amNzVUdwK3FsMWJJTVBtd1dM?=
 =?utf-8?B?UjRwQllqeWhyYnhSdTl2Nk1pWjFCMXBSZ3B0ZW5wTjh3VXlFQ3YxRTI1Zzdt?=
 =?utf-8?B?T0x2azdnOUtaKzNxalcvR2VrbXVkcjFrVXc1MGJMTkV6a1VxazdmYkxzYm1N?=
 =?utf-8?B?ck9qZkZJTUNYdy9NZ3IwbHBGK3JsS0pGZ25KSXZadTI0RHA3cjB1Y3dEY09S?=
 =?utf-8?B?MWhhZW1BU3lTMFVHdmRTZ01UWDRWMDRIZkF5RXYvUm9kZ3JsQVJadXRtVk0r?=
 =?utf-8?B?bjJDcUtMZ2ZwbjlaRUpVSzRpWnBhbFM1WTdyU1pINjdsVWF2c2ljRlNMbGF3?=
 =?utf-8?B?NjY0QXFYMEFWRkxwakxCM0xSMGVpUDZOV2E3NHJaVVduZkV0eUZFRGVzUmIv?=
 =?utf-8?B?Z3N6dVg5ZzFWcHUrN1A0WkdaREJEQkZrSDJIaVoySk9yR1gxQytxRXloVnJv?=
 =?utf-8?B?Y3JwN0FBc1VMZGF1b1hhbEhib2VicDJWOTQ5NXZxUno3TUo4WDhkQkYrczdy?=
 =?utf-8?B?bVlUNjl3djR1REt2Rlh0NVA1VVRYdFYyNG1RRGtvNWdaK3graTZRd0tGMlVy?=
 =?utf-8?B?Z240K2ZVeHRiZVhLOWdndTQrcVp3V25TR3FCTXV3ejY2TCs0VHpyaUNjclgy?=
 =?utf-8?B?R2RCSExwbGJ4M0tWamtYN0hyeXIzQ2tHdG9WUy9sdW5lcWxJVmFTQ2J5Z1Z3?=
 =?utf-8?B?cWtCV2t2YWdXRkUvNDhzYnhPZ0gwQ0gyM1BHeUNDejhLVUUrYXp2Sjh4VHMx?=
 =?utf-8?B?Smc1R3NsdkJ5cUoxR0hZemxZdnpWNnJLdE16Vzl1dzkrR3U4cnMzdWRkU3gz?=
 =?utf-8?B?dE9HWWsrdGlHa1Y0cnBNaDcxNURMSjYxbktCL3ZyT3M5ZmR5Z2pseGVXUlh6?=
 =?utf-8?B?N1h3MUQ4QndZWHEyVE1BeDByQUJpVzFrcjJaRWYxMnMra1JWT09Rc2ZZYk1J?=
 =?utf-8?B?Ni8zNXZZcysvU1puMjFOaENpWFI3TFR5aTB3aGdmanVQQUcyVVpYNXZmcDhp?=
 =?utf-8?B?L0h6QVJJS0FFTU5FZ3ErWFRqOEx6QkhCeG9EOFRVSHIrbmVEMzFFUlNIVEZE?=
 =?utf-8?B?akxvR2tXWDdnYTMxUDZCMS9CaDZVUTZxbVB6dGdsSVovTlBxVHprVFJVdUpM?=
 =?utf-8?B?SldFUk9ZWlVudnZEZmsrNkY2WG5HRHlieE8rWk45L201dk53UkJzMXdWcXVK?=
 =?utf-8?B?eThFNDRNVFQyV0lBOUdxYTBxc3hYQWZxcDI4SEpDSUlGbm0yYkJDbFFTSGhC?=
 =?utf-8?B?RlhyRFY3dEpsTHJjdndaSjAxS2xLaTVja0txbFJMQUZzS1J4SWZMV2RvakVn?=
 =?utf-8?B?ZmJ1SHRuenFFTFM5akllY1d3enpJSFRPZmMrcmFYUWpIdDh3RG1QMHdKMEtS?=
 =?utf-8?B?MUI1Slh3RndUNk9mM1d3NHpaNGFSTkVvRjdaRGc1TXFNNTlsaEJDOUlKODV0?=
 =?utf-8?B?WDRDMjVCT083TE9zQ1NDL2V2a1BhT2k5a2d6T3hHRE1wZ2NuNnNXS3B6Q1Ni?=
 =?utf-8?B?ejRvU3dheEZaMzFwc2tLVGRTMlJrQVc3TzNKSUQxNVdoakNZZTJBNWtWU3dY?=
 =?utf-8?B?YlJzVzRtcVhiYkYrYThzK0ZNaGtOazVodFJzRVlNQVpyTjR1czFoUkZCdVM5?=
 =?utf-8?B?djZpVFQvRDd3SlVnMmZPRGFqeTVsM0E4Szk4bVBzeEFiMUxkaGRLWUFJRDVJ?=
 =?utf-8?B?U1dNQllRSW1CTTQvd0FzR0Y1VnVOdUczTUZjZ1lSVXEvRjdXZmlWcFZDT1JP?=
 =?utf-8?B?NE9oVU9PL2FMb3lvc3pzdEU2ZmxuWG1uSHJ4NzhheFZJd0RKMjJiNnZwOXg0?=
 =?utf-8?B?SlFkdUl1ZHZMMk9TS0kyQXdOVC9UM3VpVVBTeXlhYm82VjRhNXpXZ1NxejNy?=
 =?utf-8?B?OE5yUVFLWWRPVWx1dTRxZ0pnYmFJZE5CSHRtZWc2TDd3ZEdNSlBaa2UyVWZm?=
 =?utf-8?Q?U7LHIF8eHRNyto8AUe49AMKUqycYOs0y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGI3azdYRVk2RW5Bc3VRSDgvMC9Eb2pSRlB5UDVKTWVnNWdaYmFLWWRzaHhi?=
 =?utf-8?B?alRxMysrVm43K0pzQisrY0hjQTE4NWNTRmRBOTFJdnJSMllXNGoxV1F6anFN?=
 =?utf-8?B?aEdTeDZ5bEpXdjBRRUR5U09ISGdIYzd5OHRSd1FjY3pCNXdsWFgwUm9DQzAy?=
 =?utf-8?B?MDg5MGUxVlZFTDRLVHFESG5hRG1tZk81V3N0NE9HaXJGSXV5L3hGY1VrMnJR?=
 =?utf-8?B?cDI4dG1FUU5wQ2FxNDVGT3Z3a0ZPbkhnWUtyNUZURHRIRUVYcnZoRFB1NlJ4?=
 =?utf-8?B?K3B6ZTdKQXl4L3VjNjZFQStUeldCSURNWFdSZ1J4bGJmMHh1Qjd1ZXRpazcz?=
 =?utf-8?B?alNxRWlMaFJDdTJVa09LMVQzSlZSVUdvWkJtZ3BGUHZPMVF5RG1jSlMxbzJn?=
 =?utf-8?B?bXZFV2RoeXJjai9HVWY4VHl5UGNDdVFsWHlnOFFiRHd5c0RuVW9hN3gvMUV0?=
 =?utf-8?B?OWU4eEE5QmRFOXhZMkZFV1NSU1k0WnBVaTZ1U2JIV0grWldrenFreTlRV2gz?=
 =?utf-8?B?TzJ5RkE0eWtyemdIODZFUWFxVGNyalBHUGFoT1F2OVFpUFdJcEQ2bjgweHkx?=
 =?utf-8?B?TUtFSzNYWTZoQjM2UkduVVhQMjk4NmJNNDR2YTVGaFdISFFleVU0aXdIM3dk?=
 =?utf-8?B?aU1MSjYrUmhpeDMyWm5NR2xtb2tVdjZudVlQc0cxQzZCRGtQYUlNdkhtNnM1?=
 =?utf-8?B?VCtkNlU0clA5bW02RDJIV01aWVNMenZwYzZKMWMrMDBGRGMwN0ZpOG55d1Ra?=
 =?utf-8?B?RlBBcS9DNjNOcEl1OVQ2WWNJVTNIYnpqbFZnZnpJVEFuMkYxZFlna01qZEk3?=
 =?utf-8?B?b0g0U1Zqd1JBdVlpS1JDdnZ5NmJtbHNCdmRXOFVOay9ibDh3SlpjU0FIeTFH?=
 =?utf-8?B?QThYZkkzMWtZLzBFeWlyQWJ1a0QxREJsWi9TUit0akI3Z1ErNWwrblhlWW51?=
 =?utf-8?B?dG55RkRPZHJVR0ZLVml1Y0ZoTHJ6ZXhYQXNPRlM4VUVnN1Vwcm04bFY2VXdI?=
 =?utf-8?B?YnlKNmNLaXZURzQwVFNNZkZtRXpBQjEzLzQ0ZVFyVThoN0FvVCs0dUxScU5r?=
 =?utf-8?B?REpoMlVSLysybDNRa255UVIzTUZ5MVJBVDNOcVM3Rmtacm40YlRvVndqbE94?=
 =?utf-8?B?SGVlUzZjSktmUnlmc1ErRThnUnZRL3VZMlM4OEZGc250ZEJwQzA0ZU5Nelpu?=
 =?utf-8?B?cXcvZ1c0cnhsQ1VrN0l6VnRCQU05VDJFZDV5Vnp3L3hpQ3lhSWpabWd1bFpC?=
 =?utf-8?B?ZFcwOUVzem9KczBEa1V1c1pvKzBicVF5azRhK1dIa08vTFNMaSs5eGZ3UkIr?=
 =?utf-8?B?a0d1cFAyNTliRFVzNDFacWNvaDVBNTRqR3NkMlZ5UkVUN1VPMklmTk9vWkFU?=
 =?utf-8?B?djZHTjhJdmNVY0VpaXlhK0dpT2ZDVEMxR3l2dmdENHpuMmJMMGh1ckFWZzRk?=
 =?utf-8?B?TDIveUs2YzM0NUxxNE9sT01Wem9kWmJQQjBDN21QVkRmWkxRWlZ2amViNFhP?=
 =?utf-8?B?bjhyb0tCMEg0UFk3T0wyZ0tZamNzZTM5UlRUWXVJeDA4WnZYcGNhdXZ6RmE0?=
 =?utf-8?B?SURFbUI5Z2Yvb2lhL3B3L0d1QUxkOGY5OG01dWtqRS9YUnpGK1dZQ3lrbGFG?=
 =?utf-8?B?bWgxNnlvRGZTVDdiNEtYZHpmMUxNTEUwVTUzSnRZSjBabVpuT3hhTmNtMDNw?=
 =?utf-8?B?OFkvSjNTdHJibE42OElBbXhwNUsxMElDWk95ekFWTnJ1d21mdHNUS0ZGTE9q?=
 =?utf-8?B?alJGUm5JWUs5cUVCSkltMzNKanhzWE85T01tWU5lQTdERmt5R0pjMGZGQi9O?=
 =?utf-8?B?NzZJL08rY2FkZlNqOG1LOUlIa293cDI4UFBBcjlyWGNLczJndVBRRGF3aHdl?=
 =?utf-8?B?ZGlEc2Y3R0xxekVMQ3JzeTlDVGtwMTM2L1Q5NDZvMVdUdDJ3eDR0WlluY2xx?=
 =?utf-8?B?SGFGRUlnUXJWUXpEZVYvbXE1OStFb29pcXdidUxRRm83cHdPMTQwWlorRy9S?=
 =?utf-8?B?d05nYnc4VHJTVmVvMWh1eXhxV2x4M3F6b1ZpMEJ0RHRrb04vbnVXNXNIZDJY?=
 =?utf-8?B?UmMvV2N5Y0JzRXlpSmc1RmdmZ0ZMSzgyM1Z2b0h6N0NmQzRaVFJwMDZzUUpz?=
 =?utf-8?B?NTQzbDVaU2NZQjhFSW5oc3JjQS9OMXBvK01ZVjlla0w2dURCMjNRWndnaHFz?=
 =?utf-8?B?K0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e496b48-5bc2-4144-20ff-08dd4b475e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 09:26:45.4552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h+iHCPufWhiSdHOp90t31GtPSnq7KVJtKfGzoFOjiwQdZZ8uJR+Rg/O4Q+YEItlOrUrw5CcxaBhauQqI8wxKm+9IncL14X3fjn54fLy2c5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7169

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTEgRmVicnVhcnkg
MjAyNSAxMzozMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEyLzEyXSBhcm02NDogZHRzOiBy
ZW5lc2FzOiByOWEwOWcwNDc6IEFkZCBpY3Ugbm9kZQ0KPiANCj4gT24gRnJpLCA3IEZlYiAyMDI1
IGF0IDEyOjM3LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0K
PiA+IEFkZCBpbnRlcnJ1cHQgY29udHJvbCBub2RlIHRvIFJaL0czRSAoIlI5QTA5RzA0NyIpIFNv
QyBEVFNJIGFuZCBhZGQNCj4gPiBpY3UgYXMgaW50ZXJydXB0LXBhcmVudCBvZiBwaW5jb250cm9s
Lg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJv
Lmp6QHJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBUb21tYXNvIE1lcmNpYWkgPHRvbW1h
c28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjMtPnY0Og0KPiA+
ICAqIERyb3BwZWQgUlpHM0VfKiBtYWNyb3MuDQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4gaS5lLiB3aWxsIHF1ZXVlIGluIHJl
bmVzYXMtZGV2ZWwgZm9yIHY2LjE1Lg0KDQpUaGFua3MuIEkgd2lsbCBkcm9wIHRoaXMgcGF0Y2gg
ZnJvbSB0aGUgbmV4dCBkcml2ZXIgc2VyaWVzLg0KDQpDaGVlcnMsDQpCaWp1DQo=

