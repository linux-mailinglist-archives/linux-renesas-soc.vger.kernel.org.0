Return-Path: <linux-renesas-soc+bounces-12747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2FFA22C62
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 12:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BD20163D48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 11:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7768E19ABAC;
	Thu, 30 Jan 2025 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vHZmLvrK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA712AE9A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235758; cv=fail; b=IX9y/DHdAqIhkEJnK4ZDL9vzXiUwlafjOOZhNGoo2P66GAMcR9oiUr3TsgmA4ZdvTsbhGYOROzHqlUkZImOkrXPH/70op/USb9F7zmAdZznSxK9rI5ojqUTyrkBhQ0K9jSYLKCZQQ1bwTqB+NkkReaQZK7XD+qdFlr1YlPEi4s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235758; c=relaxed/simple;
	bh=4hv73WEs3KPJtJNigbSgvEdzzuQHaLsR7AWanx4BtXc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j95Dv4wx1CrhHP3Q62HyVZfGpGc3AuoB03oHt+f5XkwKPhg2rCWpbzncpLQsx93PoIOkX5BbHz7C17B5EHkHivvGgzGoxlaEUSpjsGNIP6F3dPb4bRuGu0TckGObMY7kw9gepZ07jIne2vgHkbfNH7xHqfO0m4OoY/5QVuH304E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vHZmLvrK; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBi0L36RssS8jCa8rnEJsV3CZi4pf9cJM3QuguRfYaHsY0XXszJYx/Evw9s/msX80ckn7G97ShFLvDl1nbyNkGQuAmDURugkkg/6DNfVumgHiahEiam5Fs5aIKoLWKGTu/mWLsO/oLNSPZ3ancRFbEEA6/JW4mG0ROrbDrzGE4U5m006kQeO4Ikk4hnOsPnHkTh0GZ3BZtSXRUD4kz2nJYdFLpaUWScAT0h/JXp2zx5p4uKUIGpxex1msEGi1mj8XPE8SJIZED7zIhgjqwRcmIaO3CZIvjEQ+ii8NCaMDk3vJlXI/M6WWPaXtwvjN2NNfNIoRzbsw2k9dMgjxTh8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hv73WEs3KPJtJNigbSgvEdzzuQHaLsR7AWanx4BtXc=;
 b=BKNNz4IFucFB68BymGzmECd1Y735u7XdiQzzQIdAFDaD7e4O6qpe1S0inV7Ay1mO3w3psHDe/Tr6d2u1yeoDewTEZtskDE2w7IIae07eXgpTUWND2ZWnobYZoiNAVr5I9OF2cJZUYtsKNz4NG/ZIoylq23NolWVX+SmrMHb9nvUsqNv9wFIyCOTt4ZtzAte+DewTOV9S1F6KshGkFtE+xIOldgXLFY7taOGaJoA2HaCGRB3jPl/emXySOoh1rKh9zDDVkQCunsRpCcwQ7t2JjNGySyz9xbjN8NJO9wT2r+VN5R9VqDAAgV/M0yodyRqTfXKjIrbGpyFQcYZyrlSrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hv73WEs3KPJtJNigbSgvEdzzuQHaLsR7AWanx4BtXc=;
 b=vHZmLvrKDWf0tSaj5SniY39Wlo5L5q6bDUdXASFy2J+74Zt2NpQ4IJcB7TqWawMl3NEH/sRdUwracMU0TfN624gJtluQvR8rQWMl3DNMNfdS5iauH0Dxl7/7KRyHi5fR4GplAnJWk5C7TLA3L/TO3ko200zhvuXfyi5aB3vaSWM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB14228.jpnprd01.prod.outlook.com (2603:1096:405:213::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 11:15:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 11:15:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH v3 08/13] irqchip/renesas-rzv2h: Add max_tssel variable to
 struct rzv2h_hw_info
Thread-Topic: [PATCH v3 08/13] irqchip/renesas-rzv2h: Add max_tssel variable
 to struct rzv2h_hw_info
Thread-Index: AQHbcXISzK8BQeG+4EWdbTDBL6HIOrMsS7oAgALhkYA=
Date: Thu, 30 Jan 2025 11:15:53 +0000
Message-ID:
 <TY3PR01MB113468B3560808AF6E5790FAA86E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
 <20250128104714.80807-9-biju.das.jz@bp.renesas.com>
 <CAMuHMdVUzu=cduKKvdNOKOBbJFX4n8uGOGm7MZrD9E0j+WAu8A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVUzu=cduKKvdNOKOBbJFX4n8uGOGm7MZrD9E0j+WAu8A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB14228:EE_
x-ms-office365-filtering-correlation-id: ac5f6e41-ce2f-47f4-cd60-08dd411f75eb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ky9Dcm1jWGlmVkhaL0ZHUFplb2p4TDlBMlB0Q2t0L2JjbGlUSTdqYldaVjhk?=
 =?utf-8?B?bjVUYm4wT0hYeHNKTEVJZ2FQbzFKMndqZldvai9CYUVRNy9wWTYyc1l1UVJZ?=
 =?utf-8?B?N2FYeHFSR1JyZDJMRWVERDR3bmYxWlVnZUt3dTNKclA2cmY1a01mQUpUTmZF?=
 =?utf-8?B?WVJ3U2RiRlhLWFBSSGUwMUtEa1pkcHdwZW9CNzBRR1F1QzhBNjFSOEFydHkv?=
 =?utf-8?B?Qll1STRNZC8zdFpKUHRSdGVTWGNzaXUyVHNqcTUrM3pJYmk5VFJ2cTYzcU1y?=
 =?utf-8?B?LzMvQnJ1Z21weG5zUGZCUWVoT24rV3AxOCtXKzdWSFdFQ2xLTTB0TG9EUzdL?=
 =?utf-8?B?V3N3amxKVUMxMkViNWI1V0JtcTR0VEpQbVVnVmlUOFlEdm54Y0dYWEFFSUpQ?=
 =?utf-8?B?WE8yRjliV3YwNWVJaTNJWFVoOVVaU0R2bXBGaWR4OFlZcjU5UEcxVWdscU1U?=
 =?utf-8?B?MVdXZjdGRzFla2s2N3JNbkM3MytuMjRkV0pvNTJ2M1UvdzVQSVpEcGswNVNO?=
 =?utf-8?B?My9wb2dMUXpZNjRsL1hzeUx6YmJJMm1NakdKYnFnbjlQVVlQM3dBU3BzaERp?=
 =?utf-8?B?NEpoVG42djF2Unh6eTVqeVVmN1c4T0ZxcWhsZG5FOUtFRDFzc1RLWDFrbTM3?=
 =?utf-8?B?cDdaMUtNUHB1YnJvNTlnQzZMb2JLZmlhWWVKdWovV3FTT1BDdDBJQzhmbmk4?=
 =?utf-8?B?aElpSlJsbXZ6QXhUZTF0dlNMSGJ6N1VQRS9aMGNoTDVpUnlDVWg5TmpKT3VH?=
 =?utf-8?B?MWxJRXh2QUFtZXNDbUJlcFd6eDVjN0UxK2V1Yy9UdS9lcHlXSUIrUUZzV3ZT?=
 =?utf-8?B?NENyQmJMNWhpbUx1V3cxS3B4L3FRWHJmWTZ1OWFsempMbFd1bmk2aTdNTkl5?=
 =?utf-8?B?Si9zM2lEK2d4ZVZ1ZGhPLzBKSjBiSytQd1RxbXIrdU1wbG1td3hrN0Rtb3I3?=
 =?utf-8?B?MkljcHNoYkUvVkpCMnc5dzZ2TmhMZVIrVFBwWWdYOTQ2MWMyVUVGQlpZTkxh?=
 =?utf-8?B?cUZ4cUlaS0FFbDRZVFlqTDhTckVRRk9QbGo4cEJESGQ5bWNSWG95ekZDdXky?=
 =?utf-8?B?N2c4dUxvMUhZeGg1MTZFSkFBWjhiRHFZSkpPcTFOYUpSVytEa3BRYnFzS3E0?=
 =?utf-8?B?aUlnMFgzaVZCVkJsb2ZUZFc5d2tZSllsWW1pa0tSREJyZGtJMEZPbWRzMWUr?=
 =?utf-8?B?SGJvMDgrcDV6Q0hSV1dTU1FoL2h1QzBqZko3ZUFRQ3dlUG9WUW13YjgzOGdN?=
 =?utf-8?B?M1VRS1haWE1DbWE5NTluVVJRS092TC9TSUhPR1Fmd1M1L0VJLzd6RWdqMnFu?=
 =?utf-8?B?cWtpWHpRemcvYTJ5V1RBWmxZWGZneTdHYk16Wi9OVVFxSHhUYlJkSWN6RHp6?=
 =?utf-8?B?WXViQ0VYL0dWRTlnZlVCVzhNd3JyQ2tMK1djcTNkb2xoT3BEOCtkek1ZMVJF?=
 =?utf-8?B?MWNzUmF3SEdPSnp5cGEvR3ZNbU5OdHdSMklUWHo3LzNMNGMwU1ZGSElOaVVQ?=
 =?utf-8?B?S0dkTGZ6eEpvTlo0bXc0Tk5kalJXSlp2Z0cyeTc0cFF4aVVHdEFPcmhTTWZ5?=
 =?utf-8?B?VFp5TXY1cjczSnRmWm9pak5yUDhBRDMvSzk5M0pwZjRBRGltcjdFOWV1SFVk?=
 =?utf-8?B?ZmRhR3ZqOXpWNXFEMGQ5a25BNHU2ZG1yZTZNc0xmSDBHSlNQVEpmMDltZWRm?=
 =?utf-8?B?SFZvbEsvcDhyNWFlNFNaN3VDbGVUMXY5cE54ck9oTkZBNE5kVGNzTGo5MFQv?=
 =?utf-8?B?UHlWZ3BIMk5yeDhjLzNIWUVTZ1pUN0diWjYrRUVCS3AzTEliTCtjUTQwamtL?=
 =?utf-8?B?NmhDa3pQTFNZZ0pKTmxXcmxIclRVK3prRWlDa210TmpQMmVhNTFneG0wamFH?=
 =?utf-8?B?aG5mbThEK29VS1lVMFFqUTR4QU9zQWo1Y1BmSGxYeHM3LzAvaWRUVVQ3ZlBx?=
 =?utf-8?Q?ka4ilM3n3Awvll9N0NtfLrIX7I141SpP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmRLKzRRSmxJTDFhemlNYjF3RW5HUFNQRFp4YlF5RmRXREVWeWNWSjZRZTZu?=
 =?utf-8?B?ZEczY2dLcU9UdGVabEJpNGJZRWhmZWNianU2MDdhdTFRRmcwb0Rpa0wwc0Zp?=
 =?utf-8?B?cDdMM1l1THo1N0F1aXVHTDJ4SUhBRGJCNkZKMXlqN1d0YUk3Z09tcnJkMzZs?=
 =?utf-8?B?c0dONkZnMVRzS1Zjc0JMUHhhUXhjWTE0bU9lNzhPVWRuNDFiSHllajdJVFh3?=
 =?utf-8?B?UUJVVE1VYlJqQlA4aTFLbHpNSVpGeXg5bkg1M2Z4NE95UkI0SXVzQnFOeDB2?=
 =?utf-8?B?MHhQWlBRcktDMnhuUzlod1RIajJIVHBFVWFnVDRFSXpZbkZsSGhtNGRXVWZz?=
 =?utf-8?B?aUJ0RlpmWGhEOWhuUG80NUdDOVZzNUdBRGNrT3MwMTA3VHNtUGgzZ3pWTUNi?=
 =?utf-8?B?NEVBNlM3Q3hReG52SVc2ekUvbWtNSzRPdXNNR2t6QjZaeTB0V1hMaFRjMzJQ?=
 =?utf-8?B?bDBpNjFhZHF3MjdTQnRBdHMvellndWtFcnhYcVJQODUrVDFiWWJ1b2pKaDRV?=
 =?utf-8?B?Z3BnUFBlQlN1TDVsMjNvQXJhWG5DWldQaFliS1BhUktVb1gxdytnN2t4T1g5?=
 =?utf-8?B?cERLQUhqTEhZMkdncFEvcG80MW1RcGVuNzRjaUdlTU4weEpoTE90VGZvYlc2?=
 =?utf-8?B?eXFxak9rN1VLWTdmZUlybGJDNUJhK09DK3lEYXFtV0d6ZU5oU2MveG1kRFJJ?=
 =?utf-8?B?akN6VUZrT1VsM05PTDB4U3FjdnAzSVhla0hzM2JXbStzMVQrMTR0R1NWdUdk?=
 =?utf-8?B?OHNiVXoxYWMxZEtWS1Y4WWNGeDQvUzVvdmw2em1SbWlJMmlSNWdJZnhnTFdW?=
 =?utf-8?B?RWtGWkdxdVdUbUI1NzFRd1ZzSEoyRkhsd1hPdkNrTkZWc2N4Wm5TN2RzRkdN?=
 =?utf-8?B?UXdWUGRVcUpsbGFwby9mNHA3dVlJenhHcmdVTEVaaHdORW54dmxDNTZqWEJ2?=
 =?utf-8?B?UHU4L0RDd045TnZOQWhkRHk0bkdYZm5lOEN4K0gwaVpYSkdyOEV6R0x2aVJR?=
 =?utf-8?B?cStHZUo4em50anllaHhsakVMV0tSOUh2WWxZcUhMSFp5cXI4ZVdjT3V4WWs0?=
 =?utf-8?B?dHNweld4ZW5pSDgvRk1rUGVFUWFRMkxHWGRGWThaZzdSaUxOdDZSWTNYYW1T?=
 =?utf-8?B?U2NyaDhGZTZMZ0hLM3FjMmd0aGlMc2JZTS9PaHBrRzNTVkhwUVFHV3M0NFZn?=
 =?utf-8?B?c3B3T3hBaW10SVVGNll6WGtjUjErYVBCNG9QZHM1b0gzNzBUdk50cXdMb01P?=
 =?utf-8?B?bHRLaFFONnNrTWluWjdQTVRuOG5GVUhyZWg0QWM3OEhySktXdEIwTFlkb0pC?=
 =?utf-8?B?aU5uZEVES1lQUTk3NytaQTk5eHp3Y0Y0ZUVuQmJ5V3Q0dTZQOEVRVHpyUklL?=
 =?utf-8?B?SWtjcHBhdW1SMXZMSFNXaTZtM1VMc05JS2d2SXZsUHFCTnkyaXJaTGlDS1Uv?=
 =?utf-8?B?SlBURXVPZVFLUm9NdXEyck9PMjJRQW55cmZla2tKcE9IMUlXK0RsaWQxeU9D?=
 =?utf-8?B?SWhjbGZjdUFrRUpaeTNHWms4bldyRzE2bUI2elhFTzRGMVVGa1FhL1VIaTdB?=
 =?utf-8?B?OTBQNmJCdjVJNmpYZXZWclJVVG5rd1U5YzVHeEIxTTZCZGVDZTZSbnZkTWlz?=
 =?utf-8?B?NUQzaG1aMHQ2dk9IdlByZjczYVVwekNwRzdWY0hQdUttanRKTm9sVUZBQW8w?=
 =?utf-8?B?MlpLc0NaMldLZHFzWWlZYlFnT0dCa2lDRkhJSUp6bW1iTkk3NHFmRlcyQnl4?=
 =?utf-8?B?UythcEd3OEd2SUwvS3Yyc1Z5djVRb2lKWSsvT1JOSXpoVzNqM0k3NklnM1l1?=
 =?utf-8?B?TG9RY0NFOWg0SHpMKzVwVzJBQjJJcmdjc2xIbVVsMGhiMzBBdDIyeUdSVDV4?=
 =?utf-8?B?TDhNVWhGNHEyeXdrT2NRbjFTQ3llYmJqMFRlMlFMcUxJMnRuRzBpVWJLb0Zl?=
 =?utf-8?B?ekRWa1FPMUJUcDg4N3Q1ZVVrS3ViZVBZR0pCc2thUDVyZndtdVF0NDRpMDFj?=
 =?utf-8?B?U2hnUjdNQ1pwMFZudURNRHZvY25TaEF0d2laRDRJYWNQTFlvOU80MzhEMEw0?=
 =?utf-8?B?MlhJWXlmMWtTMEcxSGNQMG5lR3gyMDJDSUlUalZsVDFyTHlCMmJBdGc4Y1Ji?=
 =?utf-8?B?UUJSa0RIUVBGR29kVnJMQkV1Z3JOK202aUdoNmxrejNiUmpGZ0VhZGE0cTZU?=
 =?utf-8?B?WVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5f6e41-ce2f-47f4-cd60-08dd411f75eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 11:15:53.4273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpRH1NycZEMuW8LTIiqb2e3XQw99ne011TQMjtu2HAPaVrgB0qV1N1H7SCIffgdM6g9+IsHlylSKYjwSDAlb3IAKr80ScbzOFPvNc963LrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14228

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxNToxNA0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYzIDA4LzEzXSBpcnFjaGlwL3JlbmVzYXMtcnp2Mmg6IEFkZCBtYXhfdHNzZWwgdmFyaWFi
bGUgdG8gc3RydWN0IHJ6djJoX2h3X2luZm8NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUs
IDI4IEphbiAyMDI1IGF0IDExOjQ3LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+IHdyb3RlOg0KPiA+IFRoZSBudW1iZXIgb2YgR1BJTyBpbnRlcnJ1cHRzIG9uIFJaL0czRSBm
b3IgVElOVCBzZWxlY3Rpb24gaXMgMTQxDQo+ID4gY29tcGFyZWQgdG8gODYgb24gUlovVjJILiBS
ZW5hbWUgdGhlIG1hY3JvDQo+ID4gSUNVX1BCNV9USU5ULT5JQ1VfUlpWMkhfVFNTRUxfTUFYX1ZB
TCB0byBob2xkIHRoaXMgZGlmZmVyZW5jZSBmb3IgUlovVjJILg0KPiA+DQo+ID4gQWRkIG1heF90
c3NlbCB2YXJpYWJsZSB0byBzdHJ1Y3Qgcnp2MmhfaHdfaW5mbyB0byBoYW5kbGUgdGhpcyBkaWZm
ZXJlbmNlLg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8u
Y2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBUb21tYXNvIE1lcmNpYWkg
PHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5l
c2FzLXJ6djJoLmMNCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnp2Mmgu
Yw0KPiANCj4gPiBAQCAtNTE3LDYgKzUxOCw3IEBAIHN0YXRpYyBpbnQgcnp2MmhfaWN1X2luaXRf
Y29tbW9uKHN0cnVjdA0KPiA+IGRldmljZV9ub2RlICpub2RlLCBzdHJ1Y3QgZGV2aWNlX25vZGUg
KnANCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHJ6djJoX2h3X2luZm8gcnp2MmhfaHdf
cGFyYW1zID0gew0KPiA+ICAgICAgICAgLnRfb2ZmcyAgICAgICAgID0gMCwNCj4gPiArICAgICAg
IC5tYXhfdHNzZWwgICAgICA9IElDVV9SWlYySF9UU1NFTF9NQVhfVkFMLA0KPiANCj4gSSBhbSBu
b3Qgc3VyZSB1c2luZyB0aGlzIElDVV9SWlYySF9UU1NFTF9NQVhfVkFMIGludGVybWVkaWFyeSBi
cmluZ3MgbXVjaCB2YWx1ZSwgY29tcGFyZWQgdG8gdGhlDQo+IGhhcmRjb2RlZCBjb25zdGFudCwg
YXMgdGhlIGRlZmluaXRpb24gaXMgdXNlZCBvbmx5IG9uY2UuICBCdXQgaXQgbG9va3MgbGlrZSBU
aG9tYXMgcmVxdWVzdGVkIHRoaXMNCj4gZXhwbGljaXRseS4uLg0KDQpZZXMsIEkgaGF2ZSBkb25l
IHRoaXMgY2hhbmdlIGJhc2VkIG9uIHRoZSBjb21tZW50IGZyb20gVGhvbWFzLg0KDQpDaGVlcnMs
DQpCaWp1DQo=

