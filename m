Return-Path: <linux-renesas-soc+bounces-9388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5569902D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 14:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C3BEB2178A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 12:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9E4156861;
	Fri,  4 Oct 2024 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BmI2KmuZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEA02747B;
	Fri,  4 Oct 2024 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728044455; cv=fail; b=mplIA8jB7mU1CXAhcM6uxcspwpEn03Nk4FZOGdh1+rEjs25adIThBRNhW7b98VPjcAu0AYIKR5SFAqfRLe71HvA+KQhbYSqo7YOTB+XC7Cx0lE6s9n682acP9S+Z8zoAoh9FiZ+WPM9uwsXn5knF3vNzGohqzReKpdDDrllo0UQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728044455; c=relaxed/simple;
	bh=C2+A4tYEFNHHMb0/WHHxHnOCE2YOIheETxnqjnmwNdk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YC4J2hgFGze43+pMYfVKH9fCYu2QXW9vGW4mGfx4Ov1s21KZm6qOTY5YKv0HJnriZE05YLzr6pHdO1tteSWmmFtO28SYxC46OTudNzqxFNr+tMLhwxl6b0H4kDXB8A+Fk36HKq4+0p4XRcwuyKraXYA8mqlouzKesxfJPi2FNqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BmI2KmuZ; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEodfuGaoeOUMa3t5rQ5NZtNGYqamhDh5qD/sCjcLvbHFLlpc3e64+XBw5QjyD6kGHoCdeGlI5FtqxVCl6y/C0Qjnsq7T+662yj3QkrPvFefWZMdNEYEGtseXAw9F4RuP7Cpzuon9dUE+qrzweIxl10O2dJh55hkb1UyGL0Vwv1fHaKtxjxQ1i6VEfdopKjrKuQVYRuUIGLw0DtwR9KlbvsKcUw6+J0LDywURxB3xE+jA1qWHmCfKisAsdN/RCRH+rHZS1A5v0ZiOznVHbr5w1PpWVhYeflpiSClDZhMicUMpzfW8d5ZI+du8iIMKU3Hb8CE8MUjmg2DFzfzRc0KpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2+A4tYEFNHHMb0/WHHxHnOCE2YOIheETxnqjnmwNdk=;
 b=YDr6mxYgvJ5YK+BB4r/OfhBCVVxXQ3anQVVb3vBatfnFVpBLzJxKScNM05h9bX1jcyS8/XIR9513MhHBtiWTG0Ws0Tp0EEef3c1wExj+bp9vZJ7XdUxFN7W3oK6pOBW1t0XsxQLL/C1PLmy5z/EbORb5giCUPFsxjXsj6wEjwhE7bHYqcHDIdEwOkOjUmtxtH69kyQv2qUL2XtQCb2i3wSwAnbMoN5MoWogIIN5aBC4DFuD/bLgztS35upc69sFdedW1FUNj21hpXvbRXS3XgN5lY4WUPtaqmLY5qoGWgo7yphb9BBexefdxC8pxxinKHUmzcZKlVT6HNq3+139vXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2+A4tYEFNHHMb0/WHHxHnOCE2YOIheETxnqjnmwNdk=;
 b=BmI2KmuZAzN2KCUHsmK3nLXxergOCnnsN6KMHwKRtRzsIgFX1PlmQMJaYbylgBhaF0Z8XgvIfxha8hU+hjQVq/B5/lhiGHM+kwt4FaD05avuDaoSSgjLc+gS7gubrF/vP/iDgoLJjs63XhwXkafumvzYsSoKM8dCFXjR5ZQH2EY=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS3PR01MB8018.jpnprd01.prod.outlook.com (2603:1096:604:163::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 12:20:50 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 12:20:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 2/2] arm64: dts: renesas: rz{g2l,g2lc}-smarc-som:
 Update partition table for spi-nor flash
Thread-Topic: [PATCH v4 2/2] arm64: dts: renesas: rz{g2l,g2lc}-smarc-som:
 Update partition table for spi-nor flash
Thread-Index: AQHa/J2c1+KoWKhUeUaLXkNo45IukLJ2Yn8AgABTTkA=
Date: Fri, 4 Oct 2024 12:20:50 +0000
Message-ID:
 <TYCPR01MB11332370F4EA4508357BBFCEB86722@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240901183422.31600-1-biju.das.jz@bp.renesas.com>
 <20240901183422.31600-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVWHr6zxpPHWxLe2sgBpTsyk6RTEvwFQHisU+xXq42VWQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVWHr6zxpPHWxLe2sgBpTsyk6RTEvwFQHisU+xXq42VWQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS3PR01MB8018:EE_
x-ms-office365-filtering-correlation-id: 7e0c12aa-7ab0-4f4e-a2e5-08dce46efc06
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXl0ZEdWVHFYQWF0NlAvTVgrZlNPUUcyMlNqWm1kUWlWOC8rZnk4S084UGhP?=
 =?utf-8?B?RC9wTkJUZmtZUVVLVldLRnB3Q1dyeWRlS01TUDZLQ3BaeS9YZFRzZFE5RDcv?=
 =?utf-8?B?WXdDWFJHd21DNFlDRlNONEtXV3NGRFBvLzBPSHgyQ3dtdkY0Q01tK2Nock1F?=
 =?utf-8?B?NTVsLysxSkFMOXp5TFlXS2J4UEhVNU9xdW1iWGNETmZMd3BLUHQwY1N0MFBG?=
 =?utf-8?B?c01BTEJTZmZ4eFJaeEJVUmNid0xDeXZEdVA0QnF2aWlkVnhveVB1M283U3Rn?=
 =?utf-8?B?QjdGczYwY01senBicE5iT3Zub2NpM1FxODR5SE90bkZCK2pOQVhHMzhJTElK?=
 =?utf-8?B?Yy9nSGtwbFpEd284MlVGNUNZS1NEbXE5WWdRQjI2RU9nN2FnYlZySWtWWndh?=
 =?utf-8?B?cDl6aGhhd1hCdi9iQ2x5QW9xRnFYWXlLSURTMXRRS0x2MGh2V0I2Ukp0Mi9E?=
 =?utf-8?B?Q0haajlhM3NVT3ZDOVV5UnF2WlE0UzVDdm4wam9ZeEM4RVpHbS9uWm54cWtL?=
 =?utf-8?B?Mm1xZWRkYWJ3Y3RnNEVkL1JJU213bStYVjIvUWVhcXM4SWdiTnlIVTErT3k5?=
 =?utf-8?B?QXNmYy9CcUh0ZXliZWRFeGc0T09lQUY4dlV6ZVYzbWdsQ3hxaU1nMm9uNEVu?=
 =?utf-8?B?S3FEMnpvMmgvVmx4cFFpNTJ4cTFCRDFMbjdhUkZmemJrNys5bXhqclVxNDFW?=
 =?utf-8?B?RzZjczZPNDMwM2w0Ym5tcGhGemVISGwyaCtLQ2d5eEVrcWFnQkowelRTUjIw?=
 =?utf-8?B?OXJHbUJxa1k2WWxIV0RLdHJ6K2FvS2hVZDFoRGFwNUhoVll0SXNOd2ZJaTFp?=
 =?utf-8?B?NWV1WnJyZUt1cTFmVFUwMENNWWhZcUQ3bWVoUnI5QWdoV2p6dVUwNXpncVQ0?=
 =?utf-8?B?TnQ2YnJ2WWF6RHdPNE1tVjZOYXRqUmpJWUliMnFBSkxZeVFhNWtka1RuQkRU?=
 =?utf-8?B?RGE3K1oxcGVjRzVIdEpHWVo3a0RnVVRFOUw1bkhRdkx1S1hDWHJVaUdQWEE3?=
 =?utf-8?B?aFNXeVVKNW1zUHJvQXgvRU05QkZUYXB3SVNCWDR2TkV0VW5qWE1GbkdkUmds?=
 =?utf-8?B?OUlSWnRLOTBEaXVLbGY4djJvRitlWFFJWnlwRHZsNDc2YUhSclZqVVFxU2lS?=
 =?utf-8?B?cE91VTVRNTBIczhWbEkweDNDdGU2a0tUR04xd3d4b1k1MUVkZFNLLzBZTFF0?=
 =?utf-8?B?NGJKNzJrL2tKMjVVV29ER0dncVpKMXluLzlCVXR6eGdNMExDVVg5dHJWbFNq?=
 =?utf-8?B?a3NLSmRRSDk3cnZqZHZSZGtmaDNGM0FHSHAzNDVwZHF2VXhKbUZzL1c0bzRv?=
 =?utf-8?B?aysvNFJmU09NZ1hyRCtIbFpSeHRoMGN3aXU3VFpOMHhUVlhiVktUVmp2Yzhy?=
 =?utf-8?B?WDFWV2dIMzhwRnZTVFVvU0tPbVlkclNlNTBhY3U3eVBlOHBtdWUvdXY0Q3Q4?=
 =?utf-8?B?Y1I3K0pzUFFKTHYzYlBmRisxMVF4eWptQm80V2xPandvdElWMXEvaWNRUkVy?=
 =?utf-8?B?bk5jcGRZZGxRZk9qSUczRWxiWG9vVDlzRklRY3RyQzA5dm5TUW1uV1lCTjBp?=
 =?utf-8?B?Z2JiRTV6dUVHY0V0d0hhRHlQaFU5bXFmUHZvNHh0aXcvZ2k3N0dPUVVWSHZ6?=
 =?utf-8?B?b1RKcHU5MHBkSm5iYXIrSjhjTllVVUx4dk95UFVSdytZbXR6TFFUdG1HaCsr?=
 =?utf-8?B?U3EvL2FXV3orcnBsbjdRcThXaWhHdGd2ZWRxMXFXd1lwc0dWcmUzdDhCbXhH?=
 =?utf-8?B?WnNVNTJ6L1ViTVhzRWpoOTZCU1hFSDBlU0lOWlZzU3dnakJCVFVhYi9PY3lP?=
 =?utf-8?B?ZzdWT0xuTkRXVllxMnJqdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UXM1S2djb21ZZXloM21CUnpOanRUSkJOWGFyVHlGUWdaQ1BCU2RsM2U0VWF3?=
 =?utf-8?B?eWNEN2J0b25XNjM5N0M5c1VxWkFqQVREQUptQk5waXdGdzhZQ1RhZENLajhj?=
 =?utf-8?B?a05mWEhBNjR5UzBKMkNxUlNzOUcvSFkwQ250eGUwZ09YQlpydzNSSU9mc0lZ?=
 =?utf-8?B?cGsvakNPd2EwR00rM1EzWFVmNDFDVHUwYzBXeW5aWCt1dlNXYVgvSVBZTCt1?=
 =?utf-8?B?UXBnS1dOaWFtOEpmS1JjdnpJYWM2TTVtdHh4eVRwZ2dyMlc5N0ZrdS9FbjNi?=
 =?utf-8?B?WVVOdnUwMnZXNnpmS2NvUmgwaW9VeWIrTEZWN1o3NGp1Z3hGU3hUVTV5V2xk?=
 =?utf-8?B?cXVIRCtWR3dNbGt6cGVmLzB1SEZKOGs1RlhEMU1oVExaUG00d3hUVkp1bllQ?=
 =?utf-8?B?VDY0OVliSjQ0NkVQbnZlM0p4MHo3NUZTOG5CRVUwU3ZNVHVQbHc3cG5La08w?=
 =?utf-8?B?R3BwUzFZbmJjeXZqTUdMb0NYejhBenJ5cWwrWkpzWG05RlVORnJyMW55bm1s?=
 =?utf-8?B?R0pSVWFEdkxEM0xVZTVVYWlET3B6Y3NxVHpaSkNCZUNZZmNMbXpyQ3NtSzJV?=
 =?utf-8?B?Y0ZtK29QS3pjS3huaVN3REpnQnVrLzAzNDE2aEloaXg2UVQ0RWpiUE9vTUVj?=
 =?utf-8?B?THI4bGtWOXJCdGpJSU1HamViMFI4YWxLdEFXbStnMjZpNXpLaVpzWVB4aDNF?=
 =?utf-8?B?NXFGd1RCU0Z6UGk5SlJZRGEzK0o3aEpYQmZGQWdVbFZ3L2FObTNmV2R4ay9k?=
 =?utf-8?B?U1JYeFZOUG5vL05sSEYzTHg1WDJMTWZSWWJ3UFk5bWJrcGtrbEI3WDRzQTVo?=
 =?utf-8?B?UFppaEtuYXZTelJRTUcwb0M1cnd4MkRSS1F1RXQ4YUJWdGg2RW5SSE9Xa2xW?=
 =?utf-8?B?eVh0elFIeGFGNTFJdC9BUVp6MGRnUDBwd28zUTB5QndWVXc2ZUp2T09RNXhU?=
 =?utf-8?B?TkRaOFpLWlA2aWFWbVdWNEVkWS9CMEw2MjJkYXo0elB6OU5tcVRpTmV0ODhW?=
 =?utf-8?B?bnNQYXpHQWlvWEVRelk1OFRhdDJReFpTaHN0VmtJQmxtWVh2VXgxS01xQzRo?=
 =?utf-8?B?Q1dsVVJ6T2dOWmx3Q3NYcnBZY3JPMkRFVU52QTIzUGpIRHhNNGYwL3k5TVp5?=
 =?utf-8?B?WG45bEtiWitDMWtrWWI5SHdBaFhONWlDMll0eXNPNUlpRDd2Y1lQbnB4dEtJ?=
 =?utf-8?B?MlV4ZUJ1a3BSejJ1WDdEUkpTbUtLL1NFS3dEZTZmTGtGMFl0enlYdy9GN2VK?=
 =?utf-8?B?MGN6U2dwUEFyZkRxWWJuUkZ4VmlVanlVL2F0emIxMWRHd0hielEweXdJWWNJ?=
 =?utf-8?B?MzNVM3NtMzhDdEErT0JDVFczeGJnNjZRK1BFUVgzVmNQcllXWXk1Ym82K2sx?=
 =?utf-8?B?WEVaU1pjUVdYblRXYUlEbUttWVEvdFhyL2pPTmpTRUxCRXlnZzAydVdMVTlN?=
 =?utf-8?B?cFBkRVozc09wVU5FSGdiWEhodXpoVWQreHBOMFh3QkxzT2xZRGQ1eWZjb1RG?=
 =?utf-8?B?Z0tZallYMW1OMTJ5b3BqWUlGZEhDU0h5dUNWLzdXVmFRdURuNEVXcXMvUVdu?=
 =?utf-8?B?ZUREa0YrY2ZqWVVUcjMyaXdmK2Y4Uzc4QWZFYU5TcVhZbm9rcFp1YVc4MDY3?=
 =?utf-8?B?cHYrMElmck5HNkdUdzZJeE02Lzc3NW1qU1R1L01ndnJERHcrM1ZJYkhoMGl0?=
 =?utf-8?B?MUtnRUZHK1JmYVJpbEoreG9IMjAxZnpySmtxVEQ4dFpLaE1JM2Y1ampkT0Nr?=
 =?utf-8?B?ZVl5QjhranlhM3pRdHVqVDZKT1RiMkJEdXhuVFR1Q1J2VFF3ZmNNR3ZlNkxr?=
 =?utf-8?B?R2xJb1pmb2xNVmdRQ2UydnkrY0dPSVNJNEFpMmtRYUs4QkV6ek96TllvY2tz?=
 =?utf-8?B?VFAxZlU0MmtwdmprZFZaZDhkV1R2ckdCekczUUxZMUxQczQ1YkNzZS85SUJo?=
 =?utf-8?B?eXNWZDRMWHRFRGFNQVNuaVU1SXVLMi9zVWNmd0RYaWVCZzRNbDRkOU9ZaXJv?=
 =?utf-8?B?OHRxb1BlUkw5Q0Njcm1oNGF3OEZnb0pEVEduZDNvSk9QUDN3NHptd0NhZmJi?=
 =?utf-8?B?MXNZRFEvZFBiOEpTa0FRcG9WUy8rYUxPQmhmVU5iTEd5bWtMZDQvWmQra2pl?=
 =?utf-8?B?T2U3K29ieUV0OVdGRWcwaDhCVXFueHI1MURRdU4xZ3VvZlBlRkI0VlMxUXNs?=
 =?utf-8?B?ZFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0c12aa-7ab0-4f4e-a2e5-08dce46efc06
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 12:20:50.5380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JVBIIt8k/eMtiwMCuTJ6gB3LCgJFAlbE6BOuTtHNRuh/1D3FjXGp0st+Vz+Q6Bp2yGgTy86H31qTw7DqGW0lO6CD1P6NlWUd0FjScAA0wFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8018

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciA0LCAyMDI0IDg6MjAgQU0NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NCAyLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6e2cybCxnMmxjfS1z
bWFyYy1zb206IFVwZGF0ZSBwYXJ0aXRpb24gdGFibGUgZm9yDQo+IHNwaS1ub3IgZmxhc2gNCj4g
DQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTdW4sIFNlcCAxLCAyMDI0IGF0IDg6MzTigK9QTSBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFVwZGF0ZSBwYXJ0
aXRpb24gdGFibGUgZm9yIHNwaS1ub3IgZmxhc2gsIHNvIHRoYXQgd2UgY2FuIGZsYXNoDQo+ID4g
Ym9vdGxvYWRlcnMgaW4gTGludXggYnkgZXhlY3V0aW5nIHRoZSBiZWxvdyBjb21tYW5kczoNCj4g
PiBmbGFzaF9lcmFzZSAvZGV2L210ZDAgIDAgMA0KPiA+IGZsYXNoX2VyYXNlIC9kZXYvbXRkMSAg
MCAwDQo+ID4gbXRkX2RlYnVnIHdyaXRlIC9kZXYvbXRkMCAwICR7QkwyX0ZJTEVfU0laRX0gJHtC
TDJfSU1BR0V9IG10ZF9kZWJ1Zw0KPiA+IHdyaXRlIC9kZXYvbXRkMSA1MTIgJHtGSVBfRklMRV9T
SVpFfSAke0ZJUF9JTUFHRX0NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2NDoNCj4gPiAgKiBOZXcgcGF0
Y2guDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFyYy1zb20uZHRzaQ0KPiA+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFyYy1zb20uZHRzaQ0KPiA+IEBAIC0zNDEs
MTEgKzM0MSwxOCBAQCBwYXJ0aXRpb25zIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAj
YWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwxPjsNCj4gPg0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGJvb3RAMCB7DQo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAweDIw
MDAwMDA+Ow0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVhZC1vbmx5Ow0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBhcnRpdGlvbkAwIHsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gImJsMiI7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAweDAwMDFjMDAwPjsNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHVzZXJA
MjAwMDAwMCB7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBhcnRpdGlvbkAx
ZDAwMCB7IC8qIGZpcCBpcyBhdCBvZmZzZXQgMHgyMDAgKi8NCj4gDQo+IElzIHRoaXMgNCBLaUIg
Z2FwIGJldHdlZW4gdGhlIHR3byBwYXJ0aXRpb25zIGludGVudGlvbmFsPw0KTm8uIEkgd2lsbCB1
cGRhdGUgYmwyIHNpemUgYXMgMHgwMDAxZDAwMA0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gSWYgeWVz
LCBJIHRoaW5rIGl0IGRlc2VydmVzIGEgY29tbWVudC4NCj4gU2FtZSBjb21tZW50IGZvciByemcy
bGMtc21hcmMtc29tLmR0c2kuDQo+IA0KPiBUaGUgcmVzdCBMR1RNLg0KPiANCj4gR3J7b2V0amUs
ZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0N
Cj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVu
IEknbSB0YWxraW5nIHRvDQo+IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMNCg==

