Return-Path: <linux-renesas-soc+bounces-8134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5239895CB20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 13:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C45781F25238
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD79C181B88;
	Fri, 23 Aug 2024 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kM+S39Ps"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE19E149C46;
	Fri, 23 Aug 2024 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724411077; cv=fail; b=QB7oC4aTBO9BQ24v7QUEolyaiYDxRS+nu4u8d7nROHSIyu1wkukolWz9118qO4Ph6jTvHPH9iAfd8ppkwvsBxe3DRX5+poLocGDR5D4JCy28ZRg4J3zWb6Bs6CB/tmyQLmKbqb+w2Z/5hEAJS0OZ48+ablLNpa/zeJx6VgDArbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724411077; c=relaxed/simple;
	bh=IIRI4MGEwSLi8VBI9FqED2iogX5dInCFo6no9RZFDf4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KJqPGm1NWOG9Hb3QJSolHN4uoIEDxEesm9sEBHrtelaNSH+ZbzDlaRgdAqa0WnPetW+JXQWhcX7tQUc+HjxAhjnkUYF1s6fO5xqMcaIZP57qbYBHuhuaFPNTMhq1GIp4VeHvSbVaD99mmltGRKiOnPBP6bsGmZqWOiTx0s2Fq1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kM+S39Ps; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNlEZNtq5ji9tsJSLBI7iVzbpiJLRPOXp1NWvXbLIt6lfYCwAbrswV6MwNvrKHA9KctoXqWu9NT7erKI2mOphauP7wda8EiLLnSyNPKM9TJdxwITslOT3XZ3/ol43vF9Ttk43qjyadgWOam1srXGkrGRptUHmVUYLhTDgWhA2U+Qm0ExsDjjnYunpx44trIOAGGrsS1Lomfndw9YrhxYTxAXlJ08nzPffvhcD/g3L96JzG/ffoKhKrgvj2KdnoWm2hVIvLoXjqSo8/nHmNw3lwPl5Cgs7cvutqKzRLx2THv5DlsFRP3IdP51vQMlD3zfbegLVSqkHD3xwonRRr6eSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIRI4MGEwSLi8VBI9FqED2iogX5dInCFo6no9RZFDf4=;
 b=cyTBXVqloEP0abZxw6jTZic2d+a71mYfCh+E5vw86Ps3zy0ewZEfbaclZiCNESAhUa/f8rlbwdKOqsRh9KcjY05EgibWmfcAkRDeew38sWoB6V6gPhEpU66p6uoNFCMC0YX54bZ+vaEFOuDa+50tlpi3YBHrqPbLFy++CpjowDNxfeScZr0WECGCxn5Wm7upMlZuJUcjj2ZOkS1HhU4HeJc4h4XnWzHEKTxJDgjqscfb4jFkEDraveMd0SUHDZl9XocoF7ka3Eu2+Ok41siKxc6hbGOaF348e/RPlJ3dATn09DNNt266n3zufvafWiV38EA2cJV03E3m+55rzj+jiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIRI4MGEwSLi8VBI9FqED2iogX5dInCFo6no9RZFDf4=;
 b=kM+S39PsxU6L/l0e1xQ17k0IxILIH21BuHnM3zjI55Riy4nLSSFxNRtpKc09hFiD6zMADPq7zdqsNe4NtlmIK3CUTFzIY1gJlKLP5Jw6MfVLjV50v4knoZUggXvqFfXMM71g7mE5I6iWw1hp/eWd5hKrqQLXPHPuILDyVGZ5+O0=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB11860.jpnprd01.prod.outlook.com (2603:1096:400:3fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 11:04:29 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 11:04:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
Thread-Index: AQHa3m8e92YEq2zHb0+2/Goto6PN9rI0yWUAgAAM6sCAAAQ/0A==
Date: Fri, 23 Aug 2024 11:04:29 +0000
Message-ID:
 <TYCPR01MB1133225412819C9A74B476CCF86882@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240725084559.13127-1-biju.das.jz@bp.renesas.com>
 <20240725084559.13127-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUi+++pYU3jDP2pB3o0mH8+UgnczDyrckKQzL59O92E0w@mail.gmail.com>
 <TYCPR01MB11332D1DEA64F992A0B05499286882@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11332D1DEA64F992A0B05499286882@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB11860:EE_
x-ms-office365-filtering-correlation-id: f1d54c62-290a-41e6-46fe-08dcc3635c14
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZjY4QVQ5VHdjOTZqNTk5VFJtU2FQRFlBQzVQZlBsaGFENDY2Y3VSTGNrOTRV?=
 =?utf-8?B?MWIreGFaTkIyTXJFd1J6dk1GSHRJc09IRS85Z0lqR0MyTHZDT1NWUUFOcHpQ?=
 =?utf-8?B?by94ZU4xN3pSSjJSYTR4eUVwWDhGdTRrdVczSVJvRzFZaCtISWxteDdSMDlY?=
 =?utf-8?B?Ym9vNkR2ZmVhWWw5NTV2TGVpRWVkWXVNLzVJNE1jdXRLQWEwNnlGb0JJMjdj?=
 =?utf-8?B?Sis5UDFPSlUrSzJjWlVhT2tIMUtpNGNQQ3AraFRPMk5rYjU5VFNXSVp4VW9Q?=
 =?utf-8?B?eVZxaUVJaWR6VHBNN0s3NzU2N1dTbUdkaFIzRWFHV3NMbFRFZ2ljVVNwTzZa?=
 =?utf-8?B?K2FrUGt4M1p6K2tkMFN5MkdyVUpyY1FJeEhSdXNlM0N0WWdlQllYZWdsSUUr?=
 =?utf-8?B?WWEvaVVXYUlYV3dSYTltYnpWRGZKQUYrYzBiM3BQMnV3TW9xRnRhN1VqNUhr?=
 =?utf-8?B?M0NjbVdvcmp4ai83Ymxpd2VCS1dSTHUvQlVxcVlWRmhVN09JekowMlJCcXVy?=
 =?utf-8?B?RFBSanp2V0pnNVFZcFhGRXQ1MlduUEdJOGMzQUM3eGw3UWo3ZTI2SjBZVlIx?=
 =?utf-8?B?aG9BT01hVlN3bDVBQkxxUHdwVXgxUXFqZ0NqOGJKVmVaa0paalZXc1c0RXk1?=
 =?utf-8?B?TVR3eEc1dkh3YjlWcDlxbWR0YTlZQWtma0VCbW44TWNCSm1pK0dVaVVBcmVn?=
 =?utf-8?B?WVJSaStnUnJrZUE0NEJmSVUreEUxVzZ6cVgvbTcwcmNYWm5vdGd2WmlCNXhV?=
 =?utf-8?B?NVhNRVkvN1VjRUNRL0hDbWRwU1hJTkxjMTVtVFV5ZXlWWkZ1eG1kUWJLSGRF?=
 =?utf-8?B?WTVaZnFpVE9QMGc0ZEdYMWRJdjc3dzBEc3FJZitXS29yY0pndEFPVjU4K2ww?=
 =?utf-8?B?UUNrem9IZWhSUWNocVlMTlpQemNOVCtuYUxMMHAwMk13UzhWV1lKak45Q1NL?=
 =?utf-8?B?V3hyam9EcXFmMDB0ZEg5cjdENUQwMCtqQ3dFRXJxQXZqM21TZ3QyV1BVVnJl?=
 =?utf-8?B?aWovRVZjcnZ3czBKM2tLalphWFJvZWo4cTN0cENHYThSK1QrRWpzUHVVSjlk?=
 =?utf-8?B?Y0d6TFpSblJhUG9oYXRSWXFBSEVoZjF4eUhZK3RaWFZaL2M2VkdUNkJINWg2?=
 =?utf-8?B?NFgwbjFUNU15OWhkVzdpSUlNYjRtcjdJejZaZmwxb3Y3Z2NEYzBmVitFaGp3?=
 =?utf-8?B?azJ4YS8wbUdaL0o5SnNXck1uMEFaaURGSlFBQjhXRTNMNEJCZFZ2TnlRZFZ0?=
 =?utf-8?B?SXUvS05NV0h2b3hIUmxnUHhqTng1VDZiaEJaVEpMWWhrWTB4ekdwV3R4a0dh?=
 =?utf-8?B?V2dlUys3M3h1MlB1WHhlL1V2akVrUURteEFLZkNtN0tVcis0SzBrcVh6SWk2?=
 =?utf-8?B?Q2NyQUFWd1N4L0xHQUhjakU5Q2ZRaFF4QXI0ZnFRMTFmMnNTTGR0STRFUHJw?=
 =?utf-8?B?YXBPYXdoNGg1WUZuUjgzYTZpaVJZRFB1N3paV0krcVJxT3BTbFB6dWJTYlh3?=
 =?utf-8?B?MkErSzJxSnJPQnU4WnVQa0MyQmhuL2IvVC9GcWVuQjBCcGJPd3EyT3A0c29R?=
 =?utf-8?B?S1RSeDJtK3FiaFZiZ1MzVEV5MEtkczNhM0lycWpXQ3k1ZFZPSi8rOUdkMk13?=
 =?utf-8?B?VnIwamhhdXJVK3RpV1R3U0dyOUZ0Y0svWmdKbXErMjVyTW1FeTd5clY3a2xa?=
 =?utf-8?B?cnptdGkzY1BkYk1jUUk4MFhjRlFwQnJRU0pTcVVxSFJjazY5TEM1TmpxdW1p?=
 =?utf-8?B?VFBHdTIvZHNCT1BHMXVZcjkxYlh2Mmh6NnJ6aXdjUzdSd0xtdFRQWVlLUm92?=
 =?utf-8?B?dTEwVExPcHRSUzQwV3cvRUl3Rm8zbTNtTkp3RHc5aUlYVkhGdDV5Sk4vanV1?=
 =?utf-8?B?SUFSbXJyMi91OERlZURUcWdQRWVnTzZTMEIxQXNnVWF5Ync9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjdiUDdRVVppaWRob1pBZDBkWXJseW1RR3RENmJIZmVKYXF2cGhlNXNXcDk2?=
 =?utf-8?B?VjRpVTl5U2xzS01wbGFVc1crSFpKK0JReGNXRi9wdTQ2enR4M0ExMGNROEgz?=
 =?utf-8?B?N3Vjd1hka3JmRWsrVEgybUtGWnRJdHlPYnhTMGdnc3k0WjBrVFdVM3dKTTI5?=
 =?utf-8?B?dTRGL0VLV2VXYzloUHNNQVNaM2FwbkhVdXZBM2l1UEpaWVN6QklHUGNoeGNV?=
 =?utf-8?B?Z25BbThnbGxBWllVNFNYb2JkKzlCTFBSVm1aVmhqeUpzb3R1MkduUWM3M2VR?=
 =?utf-8?B?Zkp2Rzh0enh2a3d3STJrWmU1Ym52QjFDUE5NenlIckxmbEFpV2plT2x5Skd3?=
 =?utf-8?B?WGhCRkViRm1IRjdaMXR6Z3lzM2E2ZmZuSEtXcGM3alpkc253alBrc3dXVnp5?=
 =?utf-8?B?bEhPWUNmQXV1TTUwRXQwbHJMMUkyNEkzTHBSZmlCbktGc3dGbGpqUENvb2Vw?=
 =?utf-8?B?RXN0elVDMHRVSXJKb2ZIaHRCbWZiK2wxM1RSR1lSamJlKzdMS2FpVlQ4UVRO?=
 =?utf-8?B?U1NYelpUaFU2aFFlR3paNGJEWUJRc1VEckFOY2VhYkRXQ053YitIRTRCVTFE?=
 =?utf-8?B?KzFOcnoyZ3RmbUlqTTBJSnhBU0VLa09SN0t0aTBZcHBSSWRucU95elBMRTlC?=
 =?utf-8?B?c0hBUlkyejA2N0NKVnFDZ2JML241em1MRXlBcVQwbTJRQXhvYXBCWTczVUtP?=
 =?utf-8?B?SVMzd2EzNGNmWGZ3Ymp0SVBVdURPdjROMUptSk5IS0NrRVpYVWVnV0UxK0NN?=
 =?utf-8?B?RWE5NkQvaTM3anhpdnhVWS9kdU5WSVRGU1VsYzB0Qk9ReEszd0xHbXRtbFN2?=
 =?utf-8?B?TjI4NVBPQ0Q0Szh3N082U1lVT015ZDZnclRwZHRGMkxMcHFESWNUK29CZ0Zy?=
 =?utf-8?B?dkMxRmtPQUpzN0pDTDBYUFd1OVBzYVZUdDdDZmJIb2pjd21pUTBSZDE5R2o4?=
 =?utf-8?B?N2lGZmVLZTBkV2FsSFVobmFYdE5oRFZpVm1TaGNpNjg2VnBXQU9ZQTdDaWc5?=
 =?utf-8?B?anpXVHViYW5PT21BY2QyR1YxWEx0Ull4b1B6aXFvT1BpYXZaTlRoTU9OYnll?=
 =?utf-8?B?ZmNmRXlhZnA1ZklIeTVma1dSNUhldUgxQ2Z6b1ZkK3VnN0Yzc0FUbHNGdlFJ?=
 =?utf-8?B?NUJxRDdwM2s1enNadWtJbCtIYjJCMkEzQVQyaHVPYjVSV2ZKbGVGTXcxaEtV?=
 =?utf-8?B?L3E0OXpLeGJNeW1vK3ZQQlR3RHF3RzQrWEszVldOcDJYeU9ub3VuRE4vdWFT?=
 =?utf-8?B?RDg3MjFJSnVndUU3dFBXQnJCVFZCWHdqTXV6OXJiZ0NwK1BvM213OTEycDNZ?=
 =?utf-8?B?SGd6b243V08vdVNIWld2Y2xXOXRoWDRUUm9rSzU0STNMWGUwNTYweXBkU2tQ?=
 =?utf-8?B?Y2tLL2EwYm5ZMFVtb3QxeTVORFFyc1VWejcyQ3g1SWFEbjlCa29tV2wrN1lF?=
 =?utf-8?B?SUZ0cjJQYUFRNlNEbmVoVW5BWmdaei9rSVJUSlRPKzhmRmJ2QlYwQjZuaWdL?=
 =?utf-8?B?dlJRb0tkQjFjelIvVlNCOXp2ekx4SU9QWllzZjdqbnlWYXkyTDNycldaczB6?=
 =?utf-8?B?UDZsQmFFMDRQL0hRdjhYMnFKc3RMUzk0NFhYTWd4eUdBcHYzdWo5NzA0RFpv?=
 =?utf-8?B?M2dkbFJMdXZVcWpqTUo0dmF4VmRaMzMxNU5kQjR1U3phRXVsUVJLL3FWYUNN?=
 =?utf-8?B?b09NWm1jcFFIUDN5VlVJdE0wUnFnM25qNnNLeDE3V3d1ZldhYmNwMHdMWllS?=
 =?utf-8?B?bEdVdHdUaUU2RGMwZWxjNjlwNUQrRUI0R3ViRjlvdk1zOXkyVCtWM2xFZjlN?=
 =?utf-8?B?a2Z2c2hmQjBwcWJsUDNRYTJCL0xiMHFOZHN0bnoyN210YkpWd2lvTEU3MWJz?=
 =?utf-8?B?ZXE5dWtCbmRpZjJYT1ZBSy9VaEJpUUJTZWJDSWh3ekVzUmxIdkZZMHlORUtu?=
 =?utf-8?B?OFptZjhFeXdpTlZFRndZU2RqaUwvTUcxOWRNd0hQMzZ5bnhHMHB1bDBKK2hP?=
 =?utf-8?B?K3RYbHlRc2QxTkNiU2Z2UXdyRmxwY3hwUEtSTDBEWFFkNFBvbTZjMTFQN2Nj?=
 =?utf-8?B?SDJzY04zUVkrODRRMjA1SlVOZWx0MkJ1dnNVUjdnYzN3bGNudmZBZlBQd3I0?=
 =?utf-8?B?MVJndktWVTRRU0lITWtTZnNHK2VoQ0t6V0JwZmJFb0tXUytDUFRlbjl5QlV3?=
 =?utf-8?B?eWc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d54c62-290a-41e6-46fe-08dcc3635c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 11:04:29.3202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ARu0G/o1L0ZhaV0H8FN1vzvI1rf1C+aHpWeo1NwkFOUBGg3RM5j4+C7Hls/s1O2bSgAzGY/D2BA5GadZLKQGxm5W3MKVUqapB7FEeRCsKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11860

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAyMywgMjAyNCAx
MTo1MSBBTQ0KPiBUbzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz47
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxr
cnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+DQo+
IENjOiBMaWFtIEdpcmR3b29kIDxsZ2lyZHdvb2RAZ21haWwuY29tPjsgTWFyayBCcm93biA8YnJv
b25pZUBrZXJuZWwub3JnPjsgTWFnbnVzIERhbW0NCj4gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47
IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IFByYWJoYWthciBNYWhhZGV2
IExhZCA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPjsgYmlqdS5kYXMu
YXUNCj4gPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCAyLzNd
IGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJsLXNtYXJjOiBFbmFibGUgSERNSSBhdWRpbw0KPiAN
Cj4gSGkgQWxsLA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gU2VudDogRnJp
ZGF5LCBBdWd1c3QgMjMsIDIwMjQgMTA6NTkgQU0NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIv
M10gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMmwtc21hcmM6IEVuYWJsZSBIRE1JDQo+ID4gYXVk
aW8NCj4gPg0KPiA+IEhpIEJpanUsDQo+ID4NCj4gPiBPbiBUaHUsIEp1bCAyNSwgMjAyNCBhdCAx
MDo0NuKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+
ID4gPiBFbmFibGUgSERNSSBhdWRpbyBvbiBSWi97RzJMLFYyTH0gU01BUkMgRVZLLg0KPiA+ID4N
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gPg0KPiA+ID4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNtYXJjLXBpbmZ1bmN0aW9uLmR0c2kNCj4g
PiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFyYy1waW5mdW5j
dGlvbi5kdHNpDQo+ID4gPiBAQCAtMTQzLDYgKzE0MywxMyBAQCBzc2kwX3BpbnM6IHNzaTAgew0K
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JUX1BJTk1VWCg0NSwgMywg
MSk+OyAvKiBSWEQgKi8NCj4gPiA+ICAgICAgICAgfTsNCj4gPiA+DQo+ID4gPiArICAgICAgIHNz
aTFfcGluczogc3NpMSB7DQo+ID4gPiArICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaRzJMX1BP
UlRfUElOTVVYKDQ2LCAwLCAxKT4sIC8qIEJDSyAqLw0KPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgIDxSWkcyTF9QT1JUX1BJTk1VWCg0NiwgMSwgMSk+LCAvKiBSQ0sgKi8NCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5NVVgoNDYsIDIsIDEpPiwgLyog
VFhEICovDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzJMX1BPUlRfUElOTVVY
KDQ2LCAzLCAxKT47IC8qIFJYRCAqLw0KPiA+DQo+ID4gUlhEL0kyUzJfU0RJTiBpcyBub3Qgd2ly
ZWQgb24gdGhlIGNhcnJpZXIgYm9hcmQuDQo+ID4gT0sgdG8gZHJvcCBpdD8NCj4gPg0KPiA+IFRo
ZSByZXN0IExHVE0gKGJ1dCBJJ20gbm8gYXVkaW8gYmluZGluZ3MgZXhwZXJ0KS4NCj4gDQoNClRo
ZSBiZWxvdyBjb21tZW50IGlzIGZvciBSWi9HMkxDIFNvQywgd2hlcmUgc3dpdGNoIHBvc3Rpb24g
ZGV0ZXJtaW5lcyB3aGV0aGVyIHNzaTAgc2lnbmFsIGlzIGNvbm5lY3RlZCB0bw0KQXVkaW8gY29k
ZWMgb3IgdG8gdGhlIEhETUkgYXVkaW8uDQoNCj4gSXMgZHQgYmluZGluZyBjaGVjayBhbGxvd3Mg
Y29uZGl0aW9uYWwgbWFjcm9zPw0KPiANCj4gQmFzZWQgb24gc3dpdGNoIHBvc2l0aW9uIGF1ZGlv
IHNpZ25hbCBzc2kwIGlzIHJvdXRlZCB0byBBdWRpbyBjb2RlYyBPciByb3V0ZWQgdG8gSERNSSBh
dWRpbw0KPiBwb3J0DQo+IA0KPiBUaGUgZm9ybWVyIG9uZSBkb2VzIG5vdCB1c2UgZ3JhcGggd2hl
cmUgYXMgbGF0dGVyIG9uZSB1c2VzIGF1ZGlvIGdyYXBoIEhvdyBkbyBJIGRlc2NyaWJlIHRoaXMg
aW4NCj4gYmluZGluZ3M/DQo+IA0KPiBsaWtlIGR0cywgc29tZXRoaW5nIGxpa2UgYmVsb3cgc3Vw
cG9ydGVkIGluIGR0IGJpbmRpbmdzPz8NCj4gDQo+ICNpZiBYDQo+IEF1ZGlvIGNvZGVjDQo+ICNl
bHNlDQo+IEhETUkgQXVkaW8NCj4gI2VuZGlmDQo+IA0KPiBDaGVlcnMsDQo+IEJpanUNCg==

