Return-Path: <linux-renesas-soc+bounces-12902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826BA2A6FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 12:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA65C169695
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 11:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65C522DFAD;
	Thu,  6 Feb 2025 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WKAhhKN4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67017228C84;
	Thu,  6 Feb 2025 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840128; cv=fail; b=Wdn4FAtBDEgNEOgrRAYhry/viwh7R43tXwWjQhaOKEGAetv7D7GD2f9yX6Mcm2vYgEamwX8cUCJ5E/QARBemYURq8Q3nCgSoOlCAKd4fsl5Woz6YyvniJ+nbIyaruGQL8xCYvE3+xJP9qVJNdyQ82mTjOqDV3goQKlKqjGWw6MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840128; c=relaxed/simple;
	bh=1n8D0W5ylHwRuFF+1hh11jR2IVM6rcavTFeG7YaZSoE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cgfur1364soLaL8YRD15rqtEgYUE+vV2IZuF4Vg/snATlLIKvt0aufXTSiFa1ORiNWLLfsG3FeqOEocr3bxYlQkKok7Dsu0BgBn/otISBnU1fhkx260+TdhWX4ZQ27bUnEXNH8Uh8VFpwc6J8muoDTSbzJaKSCsuPFnBrMItFfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WKAhhKN4; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgaH/s0enKLLBzJcxnJ++QrggoX3Wzof4n36z/J9QfIZydA+o/ascFPT4T73vay64o5N8/iHR53bOandxl2PEqwslf3uCNeEu0/jGxyvsmp6J7tIxPDbhwb0sxpNVkRw5UBGPQoytDD0Fuxa2xpmxNQ2Ylj/QvZmB9jc0ijpKsQyyMUTYFLfDC/pE0ao7+ExlVw146Xz8Y4sATt9fuw2xiTYwfY0Zq+sXbqq978MTZG6+0k9IWZCWlcc3WNbR3gmkqTxm2NCIQkOLxU8+7bieaIE6VgvuqIjIJMdJv0GWk9ZYYgZF/pFn234mWVpQiZ+zwr043/fH42Iwe3wS2/11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1n8D0W5ylHwRuFF+1hh11jR2IVM6rcavTFeG7YaZSoE=;
 b=QbC9yA7UrnPPJTuzmex54PYJ6OSekaDfl3o2VSqGUNUpzbHPY2zCeTe2WrDeC+5Y2GXwci1rincp02HfF0vmbZovVPgYiN1ueBsqRi1V8WtScQ42y15aAfSwVKojs2/QRg8bV+fcCDcU8gWN2fJslnLs2A8iKObFXq+Z8aaYlAv8YNH1CDoMwkFdwrOk4Qx1/svLFDoukS0/hNnFh3TDnRCjxuutjFdFZ9POVbNzrtpxkLTOjxBG58qQ6uKjzOhgzWprcNn4fo/b0aqHRQIn5MQoZCxkFwK6q08wvOZpk37x7tUIbQurMXZ89tpxwTelD9xof8FJ2U0DCWP8/ldeIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1n8D0W5ylHwRuFF+1hh11jR2IVM6rcavTFeG7YaZSoE=;
 b=WKAhhKN4ktSqdD00jHjRZqAHTw4B4n2fhX1QkWe4eHfw6yp6IADM+E0WTtUWw3rNaGZsgKBgZg7yViIXSPPOHl3jJ2AkS+sjvllYej6lqFCdB9B+QqToDElF9Xx8ANZ9qlHwI+alYExoskTvj2dPRI65+bb7gg+jCHc9LscVX6s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12998.jpnprd01.prod.outlook.com (2603:1096:405:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 11:08:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 11:08:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 8/8] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 SDHI1
Thread-Topic: [PATCH v2 8/8] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 SDHI1
Thread-Index: AQHbc9LFqTGthFRtvkuOeh8gOe6CBrM6FVqAgAARySA=
Date: Thu, 6 Feb 2025 11:08:43 +0000
Message-ID:
 <TY3PR01MB113465E11FC6C5588883BF6B686F62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
 <20250131112429.119882-9-biju.das.jz@bp.renesas.com>
 <CAMuHMdUph6o0GNX2+YvO8yRn_cW-1MXpvFYKS-jBs2YajEX-sQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUph6o0GNX2+YvO8yRn_cW-1MXpvFYKS-jBs2YajEX-sQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12998:EE_
x-ms-office365-filtering-correlation-id: fd030102-2e06-4c3f-219e-08dd469e9e68
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NW5rbmd1NGpUcVBQTThQekt3aE9vTG9JaEtFcUFGSWs1ZmtpNk9kZTdBV1ZV?=
 =?utf-8?B?dnI4WjRwUVRwcVNsV0N0RTVYQ0ljdUJOa1ZkVTgxdXpHYm1DbzRJNkV2T1Mz?=
 =?utf-8?B?aGVPM3RUVEZRbkFsblI0MDBSWi9nRVNMRzRoUFRuR2k2VVAraDQ4NmxSdkFr?=
 =?utf-8?B?WEZoem5wcGFWQ21wV2wwb3JyZzZVUjVhQXl3Z1VzWStZMFZWQ2ZoKzFubnpP?=
 =?utf-8?B?Q2RXaDQwRW1zK0xzblY0cXNnQmFEM2M3c0lYc2FYd0tLejEyOUd3aVJFQjVS?=
 =?utf-8?B?Y1IvYTFGWUNnR054NFdsWVRNOUxMcmdzSlRrSW5NajV4UnV2R2gyQmRuTkd1?=
 =?utf-8?B?eFJ2NkIzYWpIejMvVnBHMWI4SjlzLy9NVStuMFE0RTg3cHZpblBHSEkrSWpJ?=
 =?utf-8?B?RWFnTjQ1azBNZ09RRmRQbnRIaytaSEhXMzZVUHBGMysvajhTdlRXbElxeXhP?=
 =?utf-8?B?MGplWnc3MlZUYXJzQ0VpRU9oNmVGS0NlYTQydmNkMEdiQU92NWx1TitaTXpn?=
 =?utf-8?B?bi9ZbjhtREtON2dvcE1KV3VYMEFZMVlVcmQ5RyttZGpqbGFGOGNxZDZKWFVw?=
 =?utf-8?B?UXlUOTA1c3VwMkFoTVNvYyttOUs2SXN3TFZaRkRWNWRqWFd4cllma3FIZjhr?=
 =?utf-8?B?SnROYmJOK25BcnA1eTI2Q0RGSTRWYS9pZXhCS2NxV0orSzJSU0hrYm5FUnox?=
 =?utf-8?B?NTlnZXJWcjdOMFZ3UXJKc1RJUFVrY24zTnMzVjZWdHVXR1h5Y2g4TUtlOHNn?=
 =?utf-8?B?eGFqRjR1NzI0US94UHpqbEpDQlNRdHBOTU5mbGZ2S2p2OVFVbmlYdm9oR3Rl?=
 =?utf-8?B?WU9wVXV3em9yMjFqckZPbmw1cDEvbGdTb29STVhsUWNWdEdpUmR6SitrMHoz?=
 =?utf-8?B?VkU5OElqYjN0WlJGelJtQXZFNmZFRnJzRmUxK2JycUYxWEE3dnppMEE2amt1?=
 =?utf-8?B?dm9LcUgrbnJVanNCT3ZqUURjbmtjRGdwWHVveHQ3M2xEbnE0K2dWbkNOeHJY?=
 =?utf-8?B?M1A0cjdOc1FBVnl0blUwVkdTRml6bnpXYUZFVVJKSGpvVmNTa0dnYW9id3FL?=
 =?utf-8?B?eE92QUh2ZUtSN2JmVmsrR0lqRFQrU0lnR0ozNGhVSmVtTW9Mby95WTQ2czl6?=
 =?utf-8?B?cDh0T0R0RHpIQkFkc3RNUzloL3pmUEp0QlVmeFFxVjhLZjFJQnNNd0p4T2RM?=
 =?utf-8?B?dE5aRVh5c1daUUZjZENZZlMvY0M1Zm02KzZsSmNodk0xWlZHNjk5ZlZSczNX?=
 =?utf-8?B?YlBMWkRxMk85WllzOGJ4SUw1TGMvU2U3VTlGa2V1OGx4YVhXVU94MnZhRnlW?=
 =?utf-8?B?a0ZVUVhLYlFDbjJ1T29lMitZdkZGOVl1WnM5WlBHWllBTmxQMHU0bWY2eTM0?=
 =?utf-8?B?OS83b2VRVUI3Tm14N1JDNzBGaFBPak5MN242cUVudWZmTHY3MW16TEU4VU9T?=
 =?utf-8?B?MFRmcVJYVWtRSGFIekU5Q0VrNkZTUzRCZHl6aTdrT2FvbytxdUVldnJ3UVl2?=
 =?utf-8?B?WlpEcG83U2hOKzU1NkF5YUxsUEsxbytNc0NVS0d2S3V3RDgvdCsrSUxTNVRx?=
 =?utf-8?B?Y3J3d3ZNR3dFQnl1cWRJcUs2RkxxR1VKQkFvdUxMQjNFTVBJVFRKMmdjZHJP?=
 =?utf-8?B?VTZSWEhrcnJFQjloNG5pU2JaWmZqM0ZEdkVuNkFvUUhFTTdOZDhQM3hUdmdx?=
 =?utf-8?B?VlY2WitZdm5IbldBandyNW1HZEJ3Ry9pSUtNRG9QTk02eFhWZDVrbUZvRWpx?=
 =?utf-8?B?QzdkNHFWSFF5SlpySGhielB5aVhsUlh6aS8xMmFLb0VQVE1JaWtXRWxSSHBP?=
 =?utf-8?B?Yml6cnBPWVNEbUZYVDBiMDlKMXY1UVpaTHgwZjdiSlIrOG1CYUpxNUJTYUxS?=
 =?utf-8?B?MjU1ekVNTEMzbkV3ZCtEK3Q0NHBoVU9LQXFLeE9iRFhKSE4zeGpRZXVTNWZq?=
 =?utf-8?Q?UTexMd11GBvw3MffEdRPIw35v9UOulcL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0w2ZE5jMksvTDBHRjVuekNjcWdLYjg5ejVYRXRRZHNVeTl6bjllK0NPcVc3?=
 =?utf-8?B?WDhKNFNodzRDdFpubmJKeWxZUyttZXB0b0N5L3NLZDdreXozV0tZdk5NMVhq?=
 =?utf-8?B?Um5oSS9CQTJjaU8wR2s5V21kS2xKZzhkTVduUDVwVUFqa25zZzF5SlUya3NU?=
 =?utf-8?B?ZmtqejFsVWwrRGdNZlJ0L2p1ZWFBb2hranZoNVlVaDZ1STlCY2lWNk80VW1p?=
 =?utf-8?B?SHlSaHgvdFRZSUdQc3IxRTNGVTd3Si9rSUV3VGFlQVZwd2ZNNGpxWEVwR3Q1?=
 =?utf-8?B?RGhyS2NuT3dhNEFvVC9NUFRZRFdwWENod0ZmRjR2bDhJRkp1VDlQMUQ2K3VS?=
 =?utf-8?B?STR2dk5LZFJ6d0J3T0l6ZTczSDVPcFZJTGRpNDFubmpCLzl4SVVIWE54K1Bl?=
 =?utf-8?B?TVA0bUhqOTUySnpXV25NaExOcWU1MWhuUXpsb2xLeTliTVU0WXh4aFBoSzVD?=
 =?utf-8?B?RW1zTnZoMGYyMUxWaHJXUkQreGpMWVlxZmlBbmVFU2FZZExac2JNbEg5RzRO?=
 =?utf-8?B?OEViTldYVitVZkxoc1kyaDJHenJseEhBMzhYbHJRZTliZ3A0TDA4VTk2ZEpn?=
 =?utf-8?B?SkRyVkcvMmwrOHdweGtOM2RnNGZObEE3REZ6dFVYY21nMGx6MDkzSmFlbnNM?=
 =?utf-8?B?SUxycWdvbGFZSjJrWXZWZmxGV2VZcHFmSEU3UUZsc1k2ckdGYm01cmRGam5U?=
 =?utf-8?B?czQxbU1qM0VkMzk5VnZHLzVYTmwrWUE1M2grNlp0YUlBRS8zVE5JRmNkMThQ?=
 =?utf-8?B?NDFyVmhHUmtJQ1QwS2l0VDBsc0JrZzBUeXdKUDNub1ZwL212OGVqR015dE5k?=
 =?utf-8?B?V2pWcGJtaWNiOVlVVkZlUDhPUnlKVHdyTVRncFdnTE92dFVHbnp6ODh3VlhY?=
 =?utf-8?B?UThEaUpQL1JvVDdaWUkrYk84clIwQ3JEU3JsN0x5UFIxR3JCNmJMVXprVkx6?=
 =?utf-8?B?bGxiYmlkb2dwcGFvb1h4SlhvdXUySG5VMGgvUTMzVDV2cmhhZ3BVeDFMWkVm?=
 =?utf-8?B?ZzdCTmJPK3JZbk94aTJwVkc0VkVVT1JiQmhSbnE5c3dpUVErTlV3NCtQUEdR?=
 =?utf-8?B?SVJPZi9FdEQ3bVhkVW9SbllQMXhyeGxPSlJUSG8wMjBWQlp1OFMxdjNjWTRt?=
 =?utf-8?B?V2lJME1VZjdXcTNyL2FHcFdMSGRucEhVd2JoenZISm11dzVOTHU3N0xiVjM5?=
 =?utf-8?B?TFV6NjdTcDRLb1JHZUY5aWFRUmlWeVdlY0RNbUN1aXVzcGtaTWh0Y2NWZ3BP?=
 =?utf-8?B?MmwvQlo0cXpLZzIyVVZDcGdkQ09JajF3MEJMaXh5T3U0WjFwbEQ1aEpWTGVN?=
 =?utf-8?B?SktiTHZST01mREZXdmJjcS80Wi9QUnNPSzJKWWg2Zkp4dXFEVWVZMkNUMExY?=
 =?utf-8?B?YTZ3L3ZlOWJYNUhvSDQwS2R6SEpVWGZid1RTdERuRnd1NmI4akR3OTVaaTlN?=
 =?utf-8?B?SjdQZmhnZjhOMVBUQWsyb1l0QkE5UXNWM3QxMEEzSjBnd1lGZ3BnU05LVVdP?=
 =?utf-8?B?TXBUQURwa29GMkp4ZGlPRGRPQk1VS090VlQxUWg5eGtSRjkxNk00cXRDNDND?=
 =?utf-8?B?STRXWjVEZ3JGVUEwbENDUEJ0bVRuRnA0VllhRUZOa1dwOERtS2lhRzlST1ZE?=
 =?utf-8?B?VzZBYk54QUZBT214dXVINVo0MDc4aUUrbHNSMk9rWkNRVUt0YStTTktXVHc3?=
 =?utf-8?B?K1V5QkdBbXlsanJaajFaZTZvaTcwUEduMUxrNnNqMFY0d09keUd3SUszdWg5?=
 =?utf-8?B?T2RzaGpJR2RYT2RmR0Zna29rQTZPRTdvVDc5eXdKTDRNeThhdkZGVGN6UHVh?=
 =?utf-8?B?QmEwcERieTVHTXlKS01LUlBteUZob2RtaTd0cjRXOHNZcHc5RGxVTkN3S3Jy?=
 =?utf-8?B?eTN5ZEZQSytyaXpRbFpmVm5rVWNraEY4d2xkUDV3QWJ3dEFOU212YWJFSlFJ?=
 =?utf-8?B?MFlSZk85bGxoTVV2WmpTTlJ3ZWF4T0pEOXZKT0NpbmVZemxoVytjd0FNVWwy?=
 =?utf-8?B?Z203ZTQxeG45ZTYrNXJ2ZVVMcUhabmw0YWYzMjJkbEJ3VDczcDNvU1ZoWC84?=
 =?utf-8?B?c0RDV2hDR0o5R2lXZ2Q2UlBWaUZCdnkyOCtYaGdpeVJuL1piRi8wYU9MNWtO?=
 =?utf-8?B?M094c3dVOS9Hb1lYeXhqaWFEeVdFWmUwN290MDF0VkdTRDFpemdBazh3VHhX?=
 =?utf-8?B?b2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fd030102-2e06-4c3f-219e-08dd469e9e68
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 11:08:43.2665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xtK33WIpuLe+EQyq3fIXato4LqcihPmwI2gSW2WdAd9rQiuCNoaFyIQBa3geltrf7lOrjxBh0gtaxkj7CZeTtZmonBGcpNRoxXT3TKD9q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12998

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IEZlYnJ1YXJ5IDIwMjUgMTA6MDQNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiA4LzhdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA0N2U1Ny1zbWFyYzogRW5h
YmxlIFNESEkxDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCAzMSBKYW4gMjAyNSBhdCAx
MjoyNSwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBF
bmFibGUgU0RISTEgb24gdGhlIFJaL0czRSBTTUFSQyBFVksgcGxhdGZvcm0gdXNpbmcgZ3BpbyBy
ZWd1bGF0b3IgZm9yDQo+ID4gdm9sdGFnZSBzd2l0Y2hpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4g
djEtPnYyOg0KPiA+ICAqIFJlcGxhY2VkIHRoZSByZWd1bGF0b3IgdXNkX3ZkZF8zcDN2LT5yZWdf
M3Azdi4NCj4gPiAgKiBSZW5hbWVkIHRoZSBncGlvLWhvZyBub2RlIHNkMS1wd3ItZW4tPnNkMS1w
d3ItZW4taG9nLg0KPiA+ICAqIFNvcnRlZCBzZDEgcGluIGN0cmwgbm9kZXMuDQo+IA0KPiBUaGFu
a3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOWEwOWcwNDdlNTctc21hcmMuZHRzDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I5YTA5ZzA0N2U1Ny1zbWFyYy5kdHMNCj4gPiBAQCAtOSw2ICs5LDcgQEANCj4g
Pg0KPiA+ICAvKiBTd2l0Y2ggc2VsZWN0aW9uIHNldHRpbmdzICovDQo+ID4gICNkZWZpbmUgU1df
U0QwX0RFVl9TRUwgICAgICAgICAwDQo+ID4gKyNkZWZpbmUgU1dfU0RJT19NMkUgICAgICAgICAg
ICAwDQo+ID4NCj4gPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPg0KPiA+ICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9yZW5lc2FzLHI5YTA5ZzA0Ny1waW5jdHJsLmg+
DQo+ID4gQEAgLTIwLDYgKzIxLDE2IEBAIC8gew0KPiA+ICAgICAgICAgbW9kZWwgPSAiUmVuZXNh
cyBTTUFSQyBFVksgdmVyc2lvbiAyIGJhc2VkIG9uIHI5YTA5ZzA0N2U1NyI7DQo+ID4gICAgICAg
ICBjb21wYXRpYmxlID0gInJlbmVzYXMsc21hcmMyLWV2ayIsICJyZW5lc2FzLHJ6ZzNlLXNtYXJj
bSIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgInJlbmVzYXMscjlhMDlnMDQ3ZTU3IiwgInJl
bmVzYXMscjlhMDlnMDQ3IjsNCj4gPiArDQo+ID4gKyAgICAgICB2cW1tY19zZDFfcHZkZDogcmVn
dWxhdG9yLXZxbW1jLXNkMS1wdmRkIHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJyZWd1bGF0b3ItZ3BpbyI7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0g
IlNEMV9QVkREIjsNCj4gPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQg
PSA8MTgwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0
ID0gPDMzMDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICBncGlvcyA9IDwmcGluY3RybCBSWkcz
RV9HUElPKDEsIDUpIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiANCj4gVGhpcyBpcyB0aGUgcGF0Y2gg
dGhhdCBuZWVkcyB0byBhZGQgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPi4NCg0K
T0suIFdpbGwgbW92ZSBpdCBoZXJlLg0KDQpDaGVlcnMsDQpCaWp1DQo=

