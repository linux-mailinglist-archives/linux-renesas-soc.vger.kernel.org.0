Return-Path: <linux-renesas-soc+bounces-27689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGJZGInbfGlbOwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:25:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ED8BC822
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED54A300253C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 16:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5C934D382;
	Fri, 30 Jan 2026 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fhee2V76"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BEB303A3B;
	Fri, 30 Jan 2026 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769790339; cv=fail; b=lb1ijJIACFT3gZACT7mHyEIeBGG0jmSMl6gY9DCRo5C3K0jJ69vuYsQHwYqE4rSBYSwgITPig5BSvzAUY+eOrfc+ii5N0JU0BvKOt5Xmi5973TH1U9iEXaa2JKcjMv2UFNg8Hakiu9kpFu0qfX1fdXBLVSWoV9Mr5cfjkK+CWz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769790339; c=relaxed/simple;
	bh=c3P35YduGDhGHyXzicie5MBI4wN5huKJYivXNW3AS5o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H3qM7gDTPHhg1Lu25qNJGNyIFXbQ631NQZbupejSbyD6Kqmxq6Sa2b16n5l8s2MeqXAY5X842B9JQcFJjFaI9bc6p5lxvzFGqaqS/MhLyEGw5kryWv3bLpV+JuQU4yvyL0e5xMS/1LQAsu7jlf4NdPsSKT3J8uzyjQMGNvjR/TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fhee2V76; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzVwU2O0t7JXsbpCmKtj0R0Qm3g6hZrzCaZd5AogyDeAApSdf/VUAoatyXXDkLOaZFjMwYHLI4iEQ67ciPosP1E8TzrTSuXyM2ROp+9uDqfazui5dQvIVw2g+8u1w8+lLKP75qrhbNNIPrYcLVMRgh+MwkYnlNC7CdmQZgw+eYgCv9usuBTyYqsT/USeEMDJ0ue9pvtNlsathLpD+Ge3Lap0ZYT8lojqZrLS7qBoz2WVxsX0yD3wx4Mxs9km/nvzY69woM+GeGHyQRkqkNrCfR/b22b4c0Zbh5UNsQa8jbJtYMu+yK4uGv614SEvuoHH55Clsx0JZzhfKjeoGelI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3P35YduGDhGHyXzicie5MBI4wN5huKJYivXNW3AS5o=;
 b=RlbVJQ8Pr+kmUK13sKxc7Du8qRJsMQuxfWSXwJAYHgCmpSRpqR4G+06E4RrYiDCf4FqwvTXsGM+8NkuNjkJeUkE8Gs5psBLUiphvXCKeBkWgjn3u0PY++HNsAdAvz7icwtatl2PDPhLcNpsZjSl2E7+hMkivcmn5SoNB3aYLs6fLMr58mqgedJNz783sD3S+v0X5MA0xvE394W2PMIR2VRwMlY+P/fyegWgjqsgHlWMnHJjjuRctY591xjeXzjvpE7xF8xO9Q+oRv/2J0HPjJdmOCPAFCVIWh2DM/0WFGr4Uzi+wFMTBDNP7vfeg39uLRgW1+7mWwl2Bi/8QiYOkWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3P35YduGDhGHyXzicie5MBI4wN5huKJYivXNW3AS5o=;
 b=fhee2V76iDwT33eSG0CBOMkaw+hxZkO4tc67CIy+wa2B/7j5xj7stj5yhBjBMgvbWoYR8ZrmoqyLp3Y//J1+WuFCZJ03jG9LANs92bjv47lUUapKEGBPOG/pWDcRKWhCPtpipiMVgRqVgMTpEFXQNHOFObN281SXbC995AYYXOo=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by TYRP301MB1561.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:305::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 16:25:30 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::961:aeb3:eb77:bd7d]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::961:aeb3:eb77:bd7d%4]) with mapi id 15.20.9564.001; Fri, 30 Jan 2026
 16:25:30 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert <geert@linux-m68k.org>
CC: magnus.damm <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
Thread-Topic: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
Thread-Index: AQHcjuBr2aBtSpVCZ0CNQ/H/tjeqdrVqvfTwgAAanACAAA084A==
Date: Fri, 30 Jan 2026 16:25:30 +0000
Message-ID:
 <TY7P301MB1984FB85250A9B18B5F981F5D39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-5-ovidiu.panait.rb@renesas.com>
 <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
 <TY7P301MB1984CB3A92C79442592B045DD39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <CAMuHMdUwsC96cnsZqkV63hnG=C86G5ymScY3qnLR9v830D4m4Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUwsC96cnsZqkV63hnG=C86G5ymScY3qnLR9v830D4m4Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|TYRP301MB1561:EE_
x-ms-office365-filtering-correlation-id: a9302fff-13a2-43a3-7246-08de601c2fac
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NndrdnBvUEJnMnF0Z0Q1UURMVmZlbWd6T1JiTUFBNjhxd2lHYW42dXlTQ0F3?=
 =?utf-8?B?WFJzT21NNkdiRkZJcDErbExadjBBN0ZLWlZEbnF2SnZQWFBKOVlXeGYrTHp4?=
 =?utf-8?B?TVI4UEljKzBnNlc0clJTSGs1VDB6R3BnZTY5RW1OSWZGZ0Z2SUZ3SC9PMGJC?=
 =?utf-8?B?K0VBZWhiL0hKRVFTNXFwZWl4VlBESmxKdjI5M0lCRTBnVFEraDdwS0YxRE51?=
 =?utf-8?B?cVhUbkl0WkIwUHlYSlhYWnFFM2JodGN0WlcwbU9JamMvR1piVllrbWp6U0xh?=
 =?utf-8?B?ekIrd1FJaUNNaVhJemZseE5mQ1grMTZiVER0YllzaGMxamtBT2I3RlZjVHhS?=
 =?utf-8?B?SzhOUnd3TnVRNGZLdmhNdDJGQ3Jac29YV3ZLNWJhNlB4OXFUd1gwWmt4c1Az?=
 =?utf-8?B?T0srTm9XVTRyZ0I3NlBGRXBPT1hIL0x0UmxVTlUyUTUrL2FYL0tzTUFXWEtn?=
 =?utf-8?B?VFFoYzhWcFZxVjAvL1N2L3pvRVhYeXF1SjFQUjhsbFdRMWd0VzRnVFJyd0RV?=
 =?utf-8?B?blB4NWsyWE1pdXYwMnhVTkNzNzFBSm10b0hOT2NwbUY1MTc0K3JXYnRYeW9t?=
 =?utf-8?B?ZWZaR0V0QWVUeFpyNkwyUEpoSEFyK3hOdVZodUZudWlyMWk1ZG02VFc1bXd4?=
 =?utf-8?B?VXZkZlRubDVvUW54bTllNG81RHpRY2FwMjQyU1N5Q3lJRlM1UWpOTlhFeVd1?=
 =?utf-8?B?ZVVUcTZ3V3VQZzRkRnFyUGx4SE5vMVlsaUFVb3JLUU0rbDVkUndrNHhIT2Rh?=
 =?utf-8?B?VEQyYUZkRXlxeTFBL0ZZWWhQOStWUFQwbVpQN1ZKVzNacUR4VHk0djNvVlp3?=
 =?utf-8?B?bElhSHk0SzJ5cXZROXRsOU9GQkp1YnNJazdLMzc0SExVaTFLS0NnRndTSmZt?=
 =?utf-8?B?R1pxYUVHTmYrNmpud3ZXRlFEM2pyTnFMajd4YVpIclBqR1B2REhhL0o5ZDBI?=
 =?utf-8?B?NStXZ01UVE1YZ2FnVzRCT3R1Z21WaGN2SHZnWko4d0hreWtUdzlpMHl2eGp3?=
 =?utf-8?B?dVFoTTNsSEFUaXp1WFZSY1QrL3VvYjdlMWNiMzdrZUpham05MmoxYXE4VkEr?=
 =?utf-8?B?YXB2cE41NUFidEVIQU1ocGJ6bkN4SzlDREpEQVE4WUhGWFhOSllLSWJ2Unl3?=
 =?utf-8?B?bjllc1N6MlpZWE15RFdpTDFJR2FzN1JnQi9BM3gyK2RYYUIwclhHTmNnSWdX?=
 =?utf-8?B?aStpcndia1NxdlFuVFJvNkhrVDVHdHUxRG16NWVKRHRkQTBoZDZVSVNZeVFa?=
 =?utf-8?B?eE9zSjcwZWV4RGt2UTAvL3BYMkxxbXd6MEkxTkJuRFlhbFdETmNFYzdqQmxn?=
 =?utf-8?B?QXZranlRRXhmSFZYYnQ5RjByYVRBS043OEhjSFluR0FYaXp6RElxc2dYa2tX?=
 =?utf-8?B?MzFIUjhyQmV2U3ZXb3dTbDFwcHBkRytLd0hmNENQQWZjRHRESTErcVQxR3Zl?=
 =?utf-8?B?RnozZktrRHB3MHZtb05iOTJmN1RBTHNWdU15Si9RN1NPQkdJWWFVQWlxbjY1?=
 =?utf-8?B?YTFBd1VINndnT2tKeGVQSTZxdjdPbGRtVjh5NzZWcmpESkR3d1g0QXovZ2Jn?=
 =?utf-8?B?aDVYY3A5eHpqT1BSMmFyR2c5bUdFREVpWmR4dU1DMWNVejR5U2lXdWE4RnQ4?=
 =?utf-8?B?ZHNUZSs0M3VsekQvRTFHMzBON3NjT1RMMmdxWUQyYk9DSkNIazl0S3BrUHJo?=
 =?utf-8?B?WDJqUDc5TENMei9PY1hGSENEQkVYYjRpbXhPU1dHMGdJOGpSS3BYU0VJVFA2?=
 =?utf-8?B?VHhXdGZTSEtoc3BwV09CdlU4T0M4V0xCN3U0ZWVzancvdkJZcEFYbHBIRGtZ?=
 =?utf-8?B?a05aY0xkUWdWZ3pCaC90TzdQRURGdCt2UHN0SkV1QXVKYi9jZkVqa1M4UmE5?=
 =?utf-8?B?RU95NHppUHRVYUFhUXpLbGVrUmxsQk0rdnphSGVDcXE4ZjhhVTNkcncyV0pE?=
 =?utf-8?B?akJFTGl6L1J6NVBXRDdVUXEzM3BQRjFGdzFTOW1GeFVHNVZqUXAvaExmRURa?=
 =?utf-8?B?ODliTGRLcUlkNHVGRDl6US84UENTN2RhSGNuYU5mdUR6TEZBamVWVUJVdWlo?=
 =?utf-8?B?V3BNeVJZYzZQYTI4YllVMmY4Q2ZEQjhwSXpmWmNzakQ1RXB4UDl5L2NtUTRt?=
 =?utf-8?B?TzlQZUtmN1lrUjd0bDhGYlZqQU9MOW5ZUHpzRVlMeHJxT3R2QURPaGt4Tnho?=
 =?utf-8?Q?CdJXtm3EsAaxcFVbfWQmOEs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a01hTEhJbG1BT1RWeXNjZStHK2ttSUFObVZpYjgzalpYL09PYm1HMW1EOU9Q?=
 =?utf-8?B?ZDdnMkcxRmp6R2ZubDQwSENObkFoNC9FcnFpLzZkdTdlbkQyeVdiOHphNEda?=
 =?utf-8?B?MDdjWFNRam05SVRMTzNGaStwTlIrQWdpVFpiQ1grYnRnSElRNk9kVVpxbFA2?=
 =?utf-8?B?a3Z6M1dxUlZCMFdMTlgvVXN4K25ZaW12ZEtxa0VGdy9wSW5zRWNpS2lKSWhk?=
 =?utf-8?B?WGVUUXJyeU05cmhmZlBZQzNxRC81ZEhiekdCTGJNcG1RRDdlTW5BQ3N1Znd4?=
 =?utf-8?B?Sm43K2R2QWpVYzdnMTJMV3F2TEp5R1kwSmRwbHNycDZXTkprTjU1em5ES0wx?=
 =?utf-8?B?NVdTdEtLVkJsVXFXS3Y5bkdKYkZxNStULzVvNVVvTEhTMmJoMEpMS2tuSXMy?=
 =?utf-8?B?dXRxa0lreVFhOEdwM2lFN1VCWnBwbjh5RFZZajRkVy9DSEV6SGlJQndRMFEr?=
 =?utf-8?B?aU5LaEVCRDNPZmRWMUNVaTFBMExrd1NiMStpdnk2SGFtcTZtYlg5Z1AwWTds?=
 =?utf-8?B?OWFkOTVyUEhwYnJmaWpRUGVjTlgyTFhLb3ZqY2R5a01vREEvd1MxMmc4aUVB?=
 =?utf-8?B?S1dwRlJWUFF2S2h4ank4MDBCSmVBUXlKY1d2ZjNiRXpiZm1VdzNjMktRdXVF?=
 =?utf-8?B?ZER4aXUrNG52SlRNckpWSjZBdWtOdU53OVBDZkdQc1BrQXQ1YVBraHR0WFVH?=
 =?utf-8?B?MU1Ra1dZbXlLN0FOaWY1c1laMTA2UU00ZGZQQldLM0hvYy9GR0J5VStmNVNG?=
 =?utf-8?B?TGc4aUFZM1BMbUZRRmJOUWR4WHRrc1JxQUwxaTlGa1pwQlc4ZDFtajZ0S2Rv?=
 =?utf-8?B?dVk2Y2phTlBrbmxkR1E5VFN1ZzhnN2tSS1J2alEzdThXSkczWTVwbkpCZ0NV?=
 =?utf-8?B?aTBpWXkyZ2k4blRJRTZWUjk1dGE1RCtPcXBVbktFdnlPT29pNHBSeURPUUth?=
 =?utf-8?B?QmhBbTh2M2hTUGprbFJsbHB5cWZnMndZajNZaHlGbTBsbVJpYUZLSFdhZ05X?=
 =?utf-8?B?UnVFVXpiVGs3bGcrempKYllKVUdRSTN0UWlLUmhLZUlaSjRPUDlWeUlrUkFh?=
 =?utf-8?B?cUhkYW1mMWVPM01oZDhUVG00TG5QMk5BV3pUV2Fja3lDaTFpNERXMmxDdTl4?=
 =?utf-8?B?MFhIcUR5SUY2UjY1RVhwM1FWN25uaDRjeXZpV1p5Tzl3eVNUaXBqeXU5Rk5i?=
 =?utf-8?B?dW1TZWR4Q3hrcHRpK0RWZlJQbkhjRXVkZ1V5N0pWSlRYY01iSGIyQk4rOUtF?=
 =?utf-8?B?VjlSUUV6UDJVUmdTSDJiT1VwWmJoV0ZoZHlndjc3c0J4dThsQzQ2a1FHVHJk?=
 =?utf-8?B?cHpNQ3JtVll2cmdVM1lPTlRTWk9SQWl5dklmbkpheUx4QjJLL0d1V2g5cXpN?=
 =?utf-8?B?SlRHUTExa3JhU1pxNVJWWkxKUGpRNStpTnF1MjZac0s0UUtGWUJmZXNRczl2?=
 =?utf-8?B?RmxFQ090R25NVXdmV3JOUDN1ZjNEcHkwNURJNEs3Y2JmSVVXWU9SaHVwcXpV?=
 =?utf-8?B?dS9QYVovRVJZc0c0K2FLSGpxRzFvZXU4bDU5SDl3alVITy9Ec1lMb3A5SDFM?=
 =?utf-8?B?eHVWT1ROdDByQWNuODVSVVZuWE9rUHZ3dkg1VnpXbkE2TUZpelJkYzhmQTE1?=
 =?utf-8?B?N2I0KzhMV2pGS25aczNRamZJaU1tbFUrNGxyTEFCMDZmM1IvVFdiN3hRMHdh?=
 =?utf-8?B?b1B1enN3R0NYV3EvOUxYbDVOdlFjdjQvcHVCWnE5QktUWGtqRzZEblpESk9L?=
 =?utf-8?B?T1h0T1BXczFjcDVmbE02R0xUTVdtelA4c1o3SXQxQ0tpRHRUOWdRL2F2ZHo1?=
 =?utf-8?B?SGwweEE0MkJhaFVCQTlHZCtNZU5CY3F3NVFObXNid21MOGNSNFhHcVdQWS91?=
 =?utf-8?B?SGRCTjVBcjJRRHcyc2NvM0RLZzN5OW5FdGRaeDRwc2ZuL0ZoU29OdWZ6dGd6?=
 =?utf-8?B?b0dZZG1CRGdsb1k0VkFrbUNBdHJWZ1lYWS9yY0tHd2x0bFFHcGtOQjVYbWpi?=
 =?utf-8?B?V1lkM2p1UVpvOWRDM25XYlI5Uk5qald4RDNxWXpQVXBWd1pwQmhDQWpoQXNy?=
 =?utf-8?B?OGhqTGdPYlMzK1BZd0Erd1FIRnBzMENZK3Z4a1JlMGlVTWlET0gvNWYwWEdX?=
 =?utf-8?B?bDg2RWxINHpIL3Y0a2tnczBtRXl3T21ka1RBWmU4bG03SGdNVW5vbmlBVTlG?=
 =?utf-8?B?RU5Jb2kyOXdtbEJVZmVOemRlNzJGS0orRWp6bjJ2Yy9Ca1E1NHJtVDQrZDQ4?=
 =?utf-8?B?VjhEOTBIa2g2TkFsQ21ZeW9BV21iMkd4MGNxcjVpSElkSTgyMGc3TUFHKzZL?=
 =?utf-8?B?WnYvYzZmbjFKQWk5d0FtTmdQb2JpNVVMZ1YvZ0lXWDJwRTZTcWdRYnVMUlpM?=
 =?utf-8?Q?+0Hjhx9y46jbB7u0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a9302fff-13a2-43a3-7246-08de601c2fac
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 16:25:30.7968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WZzchzmPFiR9pM+sLa47oCvHoNj2KEvzkUgQkLYWNdFvKEtLFrFBV3RCS1dw1HA5r9H6DMyCddiQcXXu7Lms7lWOyBj2SWwott9za/CgTTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP301MB1561
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27689-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.69:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.12:email,m68k.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux:email]
X-Rspamd-Queue-Id: D0ED8BC822
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNCj4gDQo+IEhpIE92aWRpdSwNCj4gDQo+IE9uIEZyaSwgMzAgSmFuIDIwMjYg
YXQgMTQ6NDMsIE92aWRpdSBQYW5haXQNCj4gPG92aWRpdS5wYW5haXQucmJAcmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+ID4gT24gVHVlLCAyMCBKYW4gMjAyNiBhdCAxNjowNiwgT3ZpZGl1IFBhbmFp
dA0KPiA+ID4gPG92aWRpdS5wYW5haXQucmJAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiBB
ZGQgdmVyc2EzIGNsb2NrIGdlbmVyYXRvciBub2RlLiBJdCBwcm92aWRlcyBjbG9ja3MgZm9yIHRo
ZSBSVEMsDQo+IFBDSWUNCj4gPiA+ID4gYW5kIGF1ZGlvIGRldmljZXMuDQo+ID4gPiA+DQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IE92aWRpdSBQYW5haXQgPG92aWRpdS5wYW5haXQucmJAcmVuZXNh
cy5jb20+DQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4NCj4gPiA+
ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0NC1yenYyaC1l
dmsuZHRzDQo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcw
NTdoNDQtcnp2MmgtZXZrLmR0cw0KPiA+ID4gPiBAQCAtMTA4LDYgKzEwOCwxMiBAQCB2cW1tY19z
ZGhpMTogcmVndWxhdG9yLXZjY3Etc2RoaTEgew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgc3Rh
dGVzID0gPDMzMDAwMDAgMD4sIDwxODAwMDAwIDE+Ow0KPiA+ID4gPiAgICAgICAgIH07DQo+ID4g
PiA+DQo+ID4gPiA+ICsgICAgICAgeDE6IHgxLWNsb2NrIHsNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiA+ID4gPiArICAgICAgICAgICAgICAg
I2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgY2xvY2stZnJlcXVl
bmN5ID0gPDI0MDAwMDAwPjsNCj4gPiA+ID4gKyAgICAgICB9Ow0KPiA+ID4gPiArDQo+ID4gPiA+
ICAgICAgICAgLyogMzIuNzY4a0h6IGNyeXN0YWwgKi8NCj4gPiA+ID4gICAgICAgICB4NjogeDYt
Y2xvY2sgew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9j
ayI7DQo+ID4gPiA+IEBAIC0yNzcsNiArMjgzLDI1IEBAIHJhYTIxNTMwMDogcG1pY0AxMiB7DQo+
ID4gPiA+ICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8Jng2PjsNCj4gPiA+ID4gICAgICAgICAg
ICAgICAgIGNsb2NrLW5hbWVzID0gInhpbiI7DQo+ID4gPiA+ICAgICAgICAgfTsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArICAgICAgIHZlcnNhMzogY2xvY2stZ2VuZXJhdG9yQDY5IHsNCj4gPiA+ID4g
KyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyw1bDM1MDIzIjsNCj4gPiA+ID4g
KyAgICAgICAgICAgICAgIHJlZyA9IDwweDY5PjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGNs
b2NrcyA9IDwmeDE+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+
Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgYXNzaWduZWQtY2xvY2tzID0gPCZ2ZXJzYTMgMD4s
DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlcnNhMyAxPiwN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmdmVyc2EzIDI+LA0K
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ2ZXJzYTMgMz4sDQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlcnNhMyA0PiwNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmdmVyc2EzIDU+Ow0KPiA+
ID4gPiArICAgICAgICAgICAgICAgYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjQwMDAwMDA+LA0K
PiA+ID4NCj4gPiA+IFNob3VsZG4ndCAoYXQgbGVhc3QpIHFleHRhbF9jbGsgYW5kDQo+ID4gPg0K
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MjQ1NzYwMDA+
LA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MzI3Njg+
LA0KPiA+ID4NCj4gPiA+IHJ0eGluX2NsayBiZSBvdmVycmlkZGVuIHRvIHBvaW50IHRvIHRoZSBj
b3JyZXNwb25kaW5nIHZlcnNhMyBvdXRwdXRzPw0KPiA+ID4gU2FtZSBjb21tZW50IGZvciBbUEFU
Q0ggdjIgNS81XS4NCj4gPiA+DQo+ID4NCj4gPiBJIHRyaWVkIGltcGxlbWVudGluZyB0aGlzIGJ5
IG92ZXJyaWRpbmcgcWV4dGFsX2NsayBhbmQgcnR4aW5fY2xrIHdpdGgNCj4gPiBmaXhlZC1mYWN0
b3ItY2xvY2sgbm9kZXMgdGhhdCByZWZlcmVuY2UgdGhlIHZlcnNhMyBvdXRwdXRzIGFzIHBhcmVu
dHM6DQo+ID4NCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3
aDQ0LXJ6djJoLWV2ay5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cjlhMDlnMDU3aDQ0LXJ6djJoLWV2ay5kdHMNCj4gPiBAQCAtNTA0LDcgKzUwNCwxMSBAQCBpbyB7
DQo+ID4gIH07DQo+ID4gwrcNCj4gPiAgJnFleHRhbF9jbGsgew0KPiA+IC0gICAgICAgY2xvY2st
ZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsNCj4gPiArICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQt
ZmFjdG9yLWNsb2NrIjsNCj4gPiArICAgICAgIGNsb2NrcyA9IDwmdmVyc2EzIDA+Ow0KPiA+ICsg
ICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiA+ICsgICAgICAgY2xvY2stbXVsdCA9IDwxPjsN
Cj4gPiArICAgICAgIGNsb2NrLWRpdiA9IDwxPjsNCj4gPiAgfTsNCj4gPiDCtw0KPiA+ICAmcnRj
IHsNCj4gPiBAQCAtNTEyLDcgKzUxNiwxMSBAQCAmcnRjIHsNCj4gPiAgfTsNCj4gPiDCtw0KPiA+
ICAmcnR4aW5fY2xrIHsNCj4gPiAtICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwzMjc2OD47DQo+
ID4gKyAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWZhY3Rvci1jbG9jayI7DQo+ID4gKyAgICAg
ICBjbG9ja3MgPSA8JnZlcnNhMyAyPjsNCj4gPiArICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsN
Cj4gPiArICAgICAgIGNsb2NrLW11bHQgPSA8MT47DQo+ID4gKyAgICAgICBjbG9jay1kaXYgPSA8
MT47DQo+ID4gIH07DQo+ID4NCj4gPiBIb3dldmVyLCB0aGlzIGJyZWFrcyB0aGUgYm9vdC4gVGhl
IHByb2JsZW0gc2VlbXMgdG8gYmUgcHJvYmUNCj4gPiBvcmRlcmluZzoNCj4gPiAxLiBmaXhlZC1m
YWN0b3ItY2xvY2sgdXNlcyBDTEtfT0ZfREVDTEFSRSwgc28gaXQgcmVnaXN0ZXJzIHZlcnkgZWFy
bHkNCj4gPiAyLiBBdCB0aGF0IHBvaW50LCB2ZXJzYTMgY2xvY2tzIGFyZSBub3QgeWV0IGF2YWls
YWJsZSAoc2luY2UgdmVyc2EzIGlzDQo+ID4gYW4gSTJDIGRldmljZSwgaXQgaXMgcHJvYmVkIG11
Y2ggbGF0ZXIpDQo+ID4gMy4gVGhlIGNsb2NrIGZyYW1ld29yayByZWdpc3RlcnMgdGhlIGZpeGVk
LWZhY3Rvci1jbG9jayB3aXRoIHJhdGUgPSAwDQo+ID4gNC4gQ29uc3VtZXJzIChSVEMsIHRpbWVy
cywgZXRjKSBwcm9iZSBhbmQgc2VlIHJhdGUgPSAwLCBjYXVzaW5nIGZhaWx1cmVzDQo+ID4NCj4g
PiBJJ20gYWxzbyBjb25jZXJuZWQgdGhhdCBpZiBxZXh0YWxfY2xrICh0aGUgbWFpbiBTb0MgY2xv
Y2spIGRlcGVuZHMgb24NCj4gPiB2ZXJzYTMsIG5lYXJseSBldmVyeXRoaW5nIHdvdWxkIG5lZWQg
dG8gZGVmZXIgdW50aWwgdGhlIEkyQyBzdWJzeXN0ZW0NCj4gPiBhbmQgdmVyc2EzIGRyaXZlciBh
cmUgcmVhZHkuDQo+ID4NCj4gPiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgYW55IHN1Z2dlc3Rp
b25zIG9uIGhvdyB0byBoYW5kbGUgdGhpcz8NCj4gDQo+IEkgbWVhbnQgdG8gb3ZlcnJpZGUgdGhl
IHJlZmVyZW5jZXMgdG8gcWV4dGFsX2NsayBhbmQgcnR4aW5fY2xrLCBpLmUuDQo+IA0KPiAgICAg
JmNwZyB7DQo+ICAgICAgICAgICAgIGNsb2NrcyA9IDwmYXVkaW9fZXh0YWxfY2xrPiwgPCZ2ZXJz
YTMgMj4sIDwmdmVyc2EzIDA+Ow0KPiAgICAgfTsNCj4gDQo+IEhvd2V2ZXIsIHRoYXQgY291bGQg
c3RpbGwgZGVsYXkgZXZlcnl0aGluZywgaW4gd2hpY2ggY2FzZSB3ZSBzaG91bGQNCj4ganVzdCBk
b2N1bWVudCB0aGUgcm91dGluZyBpbiB0aGUgRFRTIHVzaW5nIGNvbW1lbnRzLg0KPiANCj4gQ2Fu
IHlvdSBwbGVhc2UgZ2l2ZSBpdCBhIHRyeT8NCg0KV2l0aCB0aGlzIGNoYW5nZSwgdGhlIGJvYXJk
IGRvZXNuJ3QgYm9vdCBhdCBhbGwsIG5vIG91dHB1dCBvbiB0aGUNCnNlcmlhbCBjb25zb2xlLg0K
DQpJIHRoaW5rIHdpdGggdGhpcyB3ZSBhcmUgaW50cm9kdWNpbmcgdGhlIGZvbGxvd2luZyBjaXJj
dWxhciBjbGsNCmRlcGVuZGVuY3kgY2hhaW46DQoNCiAgICBjcGcgLT4gdmVyc2EzIC0+IGkyYyAt
PiBjcGcgLT4gLi4uDQoNClRoYW5rcywNCk92aWRpdQ0KDQo+IFRoYW5rcyENCj4gDQo+IEdye29l
dGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+
IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4N
Cj4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UNCj4gdGhhdC4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

