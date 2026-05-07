Return-Path: <linux-renesas-soc+bounces-32206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOf7L31c/GlPOwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:33:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FDF4E6006
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BD343044A63
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9975C3BED46;
	Thu,  7 May 2026 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LRxTPH5f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F1939B4A1;
	Thu,  7 May 2026 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145901; cv=fail; b=s+hqeBJK0Hx0eFuaqsC4NZorSjKrrK02uoHOR3eisgDs56VkcDeY9cA65uDS8ztWeDIZFtb1Ml9Npm4L5Ox0mxGdrnLc1yGcQINokWXYvJoYmrgGHDy39qGNVRxlcxvVkc411gzLq10nrooreO/fCSGOpdomxXzYocjKs53imKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145901; c=relaxed/simple;
	bh=o4kGUHKSqtpds61IswhziF/0q6uJwmUGYVYSYwq6tGc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YLORdB/pZxSo6hr/6Z5yhLHK0CdxR4a0SFxCrnCnScs+zGlLnzYcENHotgxPn8Vi82GL/t6mTIkkqy5eEoGPSr+oDv2A/knrkfcqT/DB44h0Mpn3yv2815mZmWymEThZTBG7G+Pk2TMmA4QAB1Ejl33T37oqFYThwEX6mwUndIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LRxTPH5f; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3g5+HjnLqiw8tVbTwmnS9EqtWfkeoKiiSvzOAKHV+bvREctFN3a5aqEXAOQuADD6J4tV/MX1jVRzNBTGIRtALd85o7HyzNP/tSxa79NAuhSLSiTIHA/gpP+dJl1qrq5Nlu7fa8jLhdonOYUp18XyTZfaCAQRMRd5ZUY4xI9FlHtSBrYoX4IhfSa3m0EgHq00bp3spTwe21zf3vBeBM/dB4G/10VlvV2jSlugImG4CzM7famg7jqBeQ3rxxoP9Bb+sJhX7yCu3YYMFLbMy2uUBdARY161p8yuyWq6wnUnQhQsVd/XS85QoOL+SjkrdIy8pE33zAoWoam2uxab3j4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4kGUHKSqtpds61IswhziF/0q6uJwmUGYVYSYwq6tGc=;
 b=mlDOtgBfO+8eINkJyv6WDe6LC93te/oHMEiBr3IKr5vCZTJSZqSDwn2RNxW6OeEK33glUaE2cOtjKaZsARvnoIz1YPrWao3gRizejPOdf55paFXV4SVac2+0P8hudoL6HNqiAyr9xIBIyHjgjKJXXtv1Reei9ArwQ9g5hZp9+VrOimWrR3142rzDrk1LHnPpRd2n2NAE2yYjJhwEPxqlc0yHLhMPTB+B9x+7gtUZf/zX2K1UDoVabpGg0VpDTSY1FLMqnSq69TN1+AvBo+flzr/aHbvySA7oXUovhcAFTz4KBn/Lb7Cs+KIljy+tVPuVWT6v7z0s26nr2fuCRBa0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4kGUHKSqtpds61IswhziF/0q6uJwmUGYVYSYwq6tGc=;
 b=LRxTPH5fZ29Yfpf49wVW/OMRHJjsAEOQVpozEjrYSnGjx0q0TD/Ov4r4cTlnIzdtzouRe323D6ZZGrM8Nw/RmzMfHP79BkfPDhg73x2mygb5AA+VtxeOXspqxpDqDHtTk8L6ClCTkCUw1P8K/rviC3eRxaY9s34g5qz2RYy798k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB10749.jpnprd01.prod.outlook.com (2603:1096:400:2ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:24:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:24:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
Thread-Topic: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
Thread-Index: AQHc1/mtecx7Isor8EikWNsNrvFvcbYBcxoAgAACXYCAAOBrMA==
Date: Thu, 7 May 2026 09:24:48 +0000
Message-ID:
 <TY3PR01MB1134676FA7479724BDCE40649863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260506195002.GA1778786@killaraus.ideasonboard.com>
 <CA+V-a8u8=mfR0zDJRNMEjnjrzFVAkOrqtro05Zgd1JFqGRByKw@mail.gmail.com>
In-Reply-To:
 <CA+V-a8u8=mfR0zDJRNMEjnjrzFVAkOrqtro05Zgd1JFqGRByKw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB10749:EE_
x-ms-office365-filtering-correlation-id: 448b199e-71d9-4cd7-56dd-08deac1a7bf6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003|3023799003|38070700021;
x-microsoft-antispam-message-info:
 gs3nYhCIyE3YNWPVq7UcvO2f9yRHKMXnAEucu/G+VB4hL1PXZdoWNZZePSYLc2hzX2CSxr/4u9Fpt9nz9AsTSqPuKihLP1gPpM2S2uIFIYZvtVcHiFCfv17ABr+sAzM4xEmyS8VTG+KdfImEqkoS25MO+DYhxFHT9gGHZxXPaKNQlAH2tUlaoig2ysCyH+gyTEH5sPYZARr21Cp+ygZaLkEY2ql5FUJlmmQDWxOafwC+CAOittU9zx/9MrXle6KQrpV8XDtEhgoZDnxTG0cl3to+qJU2Mkl9dlk7oObVrP9gPrDX7ozf7zg93yvHEoHfBaPT8//I5RBKlMZQv2NI+ZZBS6OmbGYL6rFGsrdIqBqKnWSJSYB6RJAZPTVsgcx+T1AiLiolkoorSErrjkwCMjE76IQhmI/t7KKS99Eh6Vli7RYDPkdj5SqrOFRZJbA85t8ZbMORmhNJ0nX2Vb5BPMWDgw/KVYdJtAV+lptGwOTPXXBchMyZAn/Tw2hDP5gMwEkol75mWJpWDEYKTY9UiMCs6lZ0xT4zgIBcfh9jaLgjYLM3+7YtXamJMLc5ZJ4oifUOt8gnSRW0tT94EVXfYkxNupWBbyb7P4lSdDBd3Tp6B3PiT94B8o5V518qUNv6+kFysMElBVhQCrSgiZV95KWW+Vye+5h/FDU4vfO+lVfz6rPOLw6Ox792S+D40j6mlg2Fbk3W6HJ1YNtINE4mpqE5RiILHbMKzrFVhraWtxxOWGvNHRUCGrLJTlBb+PHz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(3023799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTA1SjZONTJra1JJY3Y3Z25QNzVPZ1h3UVlBN094M20wVVVPM09FUmk2b25s?=
 =?utf-8?B?MUVkbHJLZGFPNmRybURqenU0dWFIL21EZmMxTUx5Z3NSZTRDZTJDWSswTm9o?=
 =?utf-8?B?K2hwV0U2TWxsZjFkeUdDWVZ2VlMxSDBjL2RKWU9xRWFUaWU0NDJBUkdDclpF?=
 =?utf-8?B?UjN1SEdQV1RCeWdjcVo0TGluMWZxZjA1QnlBZHVLQzJuSEtKZnlrQnJza2E2?=
 =?utf-8?B?UTBTTitCazc0RDJYQy9UdTRlUWNzR1lhRVMyYlJCSDMzM2kwUUdDMVNCVDNH?=
 =?utf-8?B?VG8vbEdjVEpzUmRZMXBOZmFFbUhjd1lBaUFzRmhHN2dJYU9UUitkQk96VWRx?=
 =?utf-8?B?K1VVa3l1UWk3Q29xV2dBY3NuaFlXOFZmKy9xVG9WT1ZteHR5RjFtcDlvMzlY?=
 =?utf-8?B?UktqZENjcTIrTU93Rk8xcTdYMm9zMk5NV3VKcmVWb0dURTJzWTZ4TXdlQ1A5?=
 =?utf-8?B?TDJNS3pzMGVxMGE1amhQUVZUVGwwK0R5WWJ6VkxTdUk2aHV5NnlXUHVuY1hy?=
 =?utf-8?B?anhzaEpIUE1MVWhyMXNLMmNBUVFqK0RwTlVTQnR4Q3dGcTJWMlY2M1ZxZnZN?=
 =?utf-8?B?emNRcHpJLzRjaFYzNHBXc244c0dpWWJCTFFIeGNSN1BFMUlESFZ3Sm9VODZS?=
 =?utf-8?B?SW1qNHJzaG41ZVRkVFJhTjhwd3NiM04ydVVrM21uRzZ5K0VRc0dBSmV4bUVZ?=
 =?utf-8?B?cGlvbExNV3ZGODhmN2x2QjlLUmdBZGNveUxidEF3cGNwR2J2OXoyRGNpeTYw?=
 =?utf-8?B?ZHV6bks0VFVoVmRqTllsSldDbVRlL0E1M2plK2NDUWtZOW5pWjh4M1Jpc253?=
 =?utf-8?B?UWRiUTYyWVVpbG1OMUFEd3hkSFBGU3BuYmZOOHh4eGFTRHhHdlQ4VkhieUJU?=
 =?utf-8?B?Ry9zQ2tFbDNpRnVKZzl6VUZNWWhxd3Bnek95aldVcFQ3SCtnckVES2xCZDV4?=
 =?utf-8?B?Q1VrRnk0akdha0tVaUk4UDJmbFRiYWwwVldMTS9xL09uWlIzVkxXMzlCaTlQ?=
 =?utf-8?B?aHF1YkhzUzRFdUduTkdoL1NsdkVyeXNRS3ZVTGZ0Vng4UlR2UGlrd01JZWNY?=
 =?utf-8?B?RHN6Z1RTdm5QMFh5ZVhsdEJqeG94UzIyVUp4WjlyR2Z0Q2MwOC9JZEpuQnor?=
 =?utf-8?B?T0V3U3I2aHo2d0RJU1ZpT3VETXIzOUZBY2o4TDR3b1NsZTJmQ0FOMmJlZlFj?=
 =?utf-8?B?WWxHZzZibmlnNkhlSTBNNXlWbFVTam1RSkpaWmc3OG9VTDFLMmpHZ1BSa0Zk?=
 =?utf-8?B?KzVnRzFoaFBWSDQ0ZUN5ekxtQzM2T2lXdnpaS2lvSXYzRC84bDlCTHYxeWx3?=
 =?utf-8?B?SjNiT2FuZmJZNWpoRlpDM0YzUlJiYi9FdFVwbXIxVXBNUzVkbVMrRWY0R1hj?=
 =?utf-8?B?LzI2eWZwdTlzN2hmR012aFdYOUZRL0ZSQU5vMDRIWWRYbU8rOXI5aEkxQy9R?=
 =?utf-8?B?YmZUTEJkRGxVLytjdjdrTXZMVnVSczBaa0thZnd4L2x3alRyaFhsUk53MVZH?=
 =?utf-8?B?NG92MjUvQ1RHS3g5QlpuMmNzYkJuSUtsSTBsVGY0UkszV0lMeXRENmlIZURL?=
 =?utf-8?B?SDBkZ3IwaWlPWGdmbWcrK2E2ZlQwTzJ4Mm5ZR25JaWQ5bnk2bGlnMDJpUjFU?=
 =?utf-8?B?MUVEcWlGeU5POVdoKzlFbHN5a1FieE5Ld280ckhmSG5pbXRVUHRXS054NjBC?=
 =?utf-8?B?ZkJVc0Z1STZjUlJ0TE5jcThROHJ1R0VQeGdydjg3MzEvRFFoYkRpMmZWTTZT?=
 =?utf-8?B?VWluRnozT2ZSeU51VnhLaWh5eFpiNHVwTjNPMXVBS0V6T0RXZ1FtdThuc0Nq?=
 =?utf-8?B?OE1TcWE0STBveXpnYXRBdVRrZnVYWXRUazZTVXBlc0hGQXVRTjVDcTlrY3pZ?=
 =?utf-8?B?T3ZPRVRCZ0cwMzRkaDgxUDBZTS9VaGJqQWt1MmVWNXlRYWVJMWJJUzE3RWx0?=
 =?utf-8?B?a0hNblBtWitNVU1SQ21LSHltWE9USWhvREZkSTJpVjVXY29oWWdZT0lKcjdn?=
 =?utf-8?B?bmt1aWFLQktVRjlUT0NVaGRXeHpyU3BkZUEvMFdabHh3SmVybldLMjdSY05H?=
 =?utf-8?B?WGZPWnh3YnE0Wm5vcWQ5QnQ3MHhGNkxWVzN2ME5rTGFYYnhOeS9sRnQyTGJ3?=
 =?utf-8?B?QnV2MXJ0dGZOVDFYRDV4TnVuTEtiS01PVDh0MnlZY0tka3J5QzEvRFJDWmlt?=
 =?utf-8?B?ckNjMWFoWStORWcrbjVsQm1NN1l2YUxSd0hJQUozNDhDZnRBaFpFMjlKM1U4?=
 =?utf-8?B?M3M5ZUwyUlNLc1FvU01YOTE4T3dKMnBOZ1dac2Q0RTFRMXEwZUVzdm9NYnhL?=
 =?utf-8?B?QVlPTHJYWFlHdXRRL0Y3NnJZQjlZeUVPRzcxSXFyQWdzZlZBMHl1Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 448b199e-71d9-4cd7-56dd-08deac1a7bf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 09:24:48.1500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F5aJBsRYcra1Y0L0g337KLcNeICQtGTCMRXh29oFKPFQOV9O9bJ3OwonFGjuOecqfjlywALQr0e6P5jKm4XKobmVrOD+jKZkr+SOYrH6mzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10749
X-Rspamd-Queue-Id: 65FDF4E6006
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32206-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,ideasonboard.com:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

SGkgTGF1cmVudC9QcmFiaGFrYXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50
OiAwNiBNYXkgMjAyNiAyMDo1OA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNF0gZHQtYmluZGlu
Z3M6IGRpc3BsYXk6IHJlbmVzYXMscnpnMmwtZHU6IEFkZCBSWi9UMkggYW5kIFJaL04ySCBzdXBw
b3J0DQo+IA0KPiBIaSBMYXVyZW50LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0K
PiANCj4gT24gV2VkLCBNYXkgNiwgMjAyNiBhdCA4OjUw4oCvUE0gTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIFBy
YWJoYWthciwNCj4gPg0KPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4gT24g
V2VkLCBBcHIgMjksIDIwMjYgYXQgMDY6MDA6MDlQTSArMDEwMCwgUHJhYmhha2FyIHdyb3RlOg0K
PiA+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IERvY3VtZW50IHRoZSBEaXNwbGF5IFVuaXQgKERVKSBz
dXBwb3J0IGZvciB0aGUgUlovVDJIIGFuZCBSWi9OMkggU29Dcy4NCj4gPiA+DQo+ID4gPiBUaGUg
RFUgYmxvY2sgb24gUlovVDJIIGlzIGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50IHRvIHRoZSBSWi9H
MlVMIERVDQo+ID4gPiBhbmQgc3VwcG9ydHMgdGhlIERQSSBpbnRlcmZhY2UsIGJ1dCBpbmNsdWRl
cyBTb0Mtc3BlY2lmaWMgcmVnaXN0ZXIgZGlmZmVyZW5jZXMuDQo+ID4gPiBBZGQgYSBkZWRpY2F0
ZWQgY29tcGF0aWJsZSBzdHJpbmcgdG8gcmVwcmVzZW50IHRoaXMgdmFyaWFudC4NCj4gPiA+DQo+
ID4gPiBBcyB0aGUgRFUgaW1wbGVtZW50YXRpb24gb24gUlovTjJIIG1hdGNoZXMgUlovVDJILCBk
ZXNjcmliZSBpdCB1c2luZw0KPiA+ID4gYW4gUlovTjJIIHNwZWNpZmljIGNvbXBhdGlibGUgc3Ry
aW5nIHdpdGggdGhlIFJaL1QySCBjb21wYXRpYmxlIGFzIGZhbGxiYWNrLg0KPiA+ID4NCj4gPiA+
IFVubGlrZSBvdGhlciBEVSB2YXJpYW50cyB3aGljaCB1c2UgYSBtdWx0aS1wb3J0IG1vZGVsLCB0
aGUgUlovVDJIDQo+ID4gPiBhbmQgUlovTjJIIERVIGhhcyBhIHNpbmdsZSBvdXRwdXQgYW5kIGlz
IG1vZGVsbGVkIHVzaW5nIGEgc2luZ2xlDQo+ID4gPiBwb3J0IG5vZGUgd2l0aCBvbmUgZW5kcG9p
bnQuIEFkZCBhIHBvcnQgcHJvcGVydHkgdG8gc3VwcG9ydCB0aGlzIGFuZA0KPiA+ID4gdXBkYXRl
IHRoZSBhbGxPZiBjb25zdHJhaW50cyBhY2NvcmRpbmdseS4NCj4gPg0KPiA+IFdvdWxkbid0IGl0
IGJlIHNpbXBsZXIgdG8gYWx3YXlzIGhhdmUgYSAicG9ydHMiIG5vZGUsIGV2ZW4gZm9yDQo+ID4g
dmFyaWFudHMgd2l0aCBhIHNpbmdsZSBwb3J0ID8NCj4gPg0KPiBJIGFncmVlIHRoYXQsIGZyb20g
YSBiaW5kaW5nIHBlcnNwZWN0aXZlLCBhbHdheXMgaGF2aW5nIGEgInBvcnRzIiBub2RlIGtlZXBz
IHRoaW5ncyBzaW1wbGVyIGFuZA0KPiBjb25zaXN0ZW50LiBCaWp1IHN1Z2dlc3RlZCB0aGlzIGNo
YW5nZSBiYXNlZCBvbiBlYXJsaWVyIGZlZWRiYWNrIGZvciB0aGUgUlovRzNFIHNlcmllcy4NCg0K
RnJvbSBHM0UgZmVlZGJhY2ssIEkgZ290IHRoZSBpbXByZXNzaW9uIHRoYXQgZ29pbmcgZm9yd2Fy
ZCBhbGwgZnV0dXJlIFNvQ3MgbmVlZHMgdG8gaGF2ZQ0Kc2luZ2xlIHBvcnQgYW5kIG11bHRpcGxl
IGVuZHBvaW50cy4gVGhhdCBpcyB0aGUgcmVhc29uIGZvciBzdWdnZXN0aW5nIHBvcnQgZm9yIG5l
dyBTb0NzLg0KDQpDaGVlcnMsDQpCaWp1DQo=

