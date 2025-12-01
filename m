Return-Path: <linux-renesas-soc+bounces-25468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7DCC97D90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 15:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C31AB343872
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 14:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AF3315793;
	Mon,  1 Dec 2025 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jYjDHyiO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F13168E0;
	Mon,  1 Dec 2025 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764599268; cv=fail; b=M01+kSmUSiZ8b54ZROrNg93iVno1dJZ2OgTql/7KbgorZZzK+/knLox75JBNEEiuaE8AEjpNg7+vLaMMjhcV+3q6l0jpMxWqCGbrA0aeRUiUfdOfXRWqFhxnHuxeH1xzxF8UXjPR+Uf6oTJUiG8EflgQ9QHZahutx8FRfPYiGdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764599268; c=relaxed/simple;
	bh=8Z0C/x5V5suP76xpY3gx8KR8BaOLWNT440WHBwLNz3s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hUZ//0B+St1oPzg+fKy5sZCOZhz9rLP3qY2rZpYyf+9Xeg147sYhdNumqj35u4sUpTJYU1UQNmB5UkuGqT0N9VxrHDVk0OKBYHuq5v0dU+AWyIPANLBDyGbxU9/O0U63RAcjLg9eIn9U7rOZpUXJi9NCyyn/FWGNahG6T01V2Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jYjDHyiO; arc=fail smtp.client-ip=52.101.125.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZB4yh0HTfnUDXC4fsR280U/OUo/1hFvFoL9Fq/ZwMMGGUqhm+B/KJ0tX3dN32lOWMmMm3lxCXTAChPnDpHoSkrrcXRPUEn0XINpcc3BEjzVRAiKyZRT0Bhu/dPpSg7nO9Zw21ofwlvjNYTi1Me/ILagYiXAzNavHzQRNXyV+SkdH0pOp0KuayUNEPWyox4k2dM2axB+k3C6oSWGK1fZHvrGhUYW1i5GYj9bXAx7ez1wk2DzbgMaCOXE6ZM4GfHcoukTXyd+N4uFPCyHQMw3boLUBZBwiC8ozyFPGQbQdX8BY5fsy6fCg92ADDpiGLPxkGB+KPSSc9IncLLEOcEnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z0C/x5V5suP76xpY3gx8KR8BaOLWNT440WHBwLNz3s=;
 b=qJOFD1UDeZ9GcSZWSuWTMdmDdyyG2gXZ94VFJx5pDtG3epFer/HkU//dvd4gpiJkhtLg25hljtlrF1pYw2EpdNhgWNX7+8kpM2pAbSdkJvGWvr23odURfG3adQOCq70vf4BcEH1guGUYIaGaA/t84UYU5Bf7LXqrWnXCLBhZkwEDy5rjVmNn6dJa820IrD20oVFGgjDuAfk/1kL/Q23ssp70GYPKBtAKJhtioBgxM85TZ709xM0eTmdLdvHDIlPd5iXGgpSMURkqThvDaaIY/uM+UTJoO+CWvmBR4Vc3HWVH3GfrgEb+2GfW9pPZ9WbnhO+Aup2JV25iyzerY8QmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z0C/x5V5suP76xpY3gx8KR8BaOLWNT440WHBwLNz3s=;
 b=jYjDHyiO9jbdI/qakIg4iwiMA0d9vcevItHmmAnHXWOV6rCf1Q6za119t04ZySB5QdZ/+T5j3hrbIlDLUuou+2uNMgUGElw3mwMVDTx8sdP7m+QOTqijhaMyoyGtaet+D4knNbd0baR8ReWesqVqC1cF3h5Pdxs2m2b98Rqqzic=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB17230.jpnprd01.prod.outlook.com (2603:1096:604:408::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 1 Dec
 2025 14:27:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.003; Mon, 1 Dec 2025
 14:27:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Josua Mayer <josua@solid-run.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Thread-Topic: [PATCH v2 0/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Thread-Index: AQHcYr6LYTcT8lhXR0OypeESa6beirUMwsBwgAATRwCAAAF2UA==
Date: Mon, 1 Dec 2025 14:27:42 +0000
Message-ID:
 <TY3PR01MB1134608AEFD37B1730949C7C886DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <TY3PR01MB11346F6A9485A334E8BAAD0E586DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <af4da0ac-a6f3-4248-9050-537a4ecf7711@solid-run.com>
In-Reply-To: <af4da0ac-a6f3-4248-9050-537a4ecf7711@solid-run.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB17230:EE_
x-ms-office365-filtering-correlation-id: 0652e888-09d9-4e38-06e0-08de30e5c98f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?T2VCcmR5UWE3WHZONzFOcStBQmNobmp2WDdLM0ZWbWl5VjE5YVRMZGE3MTht?=
 =?utf-8?B?bWxQelBWcnNkMnFSd1FKUkJVZVNQdnZDRGpBWVp3WW94ck9zZ2U3Y1J2Vjk5?=
 =?utf-8?B?V05pTFJpK01XRnA4SVF0ZG8xcER0T0xWNFkxVWFiRjQwcTI5VG85d1hjZ29U?=
 =?utf-8?B?WnZDVVdVUkpDMVowNGd2QmRPTWprQkhoUjZCZUlyTkVtODVGQnYyTzJsZHpo?=
 =?utf-8?B?K1VGYmxLZjRRSjl6Wjk1bGh6RS9nRkQ4MlJ4N3AvakErb1hTWko4Y3FObW9O?=
 =?utf-8?B?RjZRVHpraFFKUVZOUFFiaU5QNy9WR3BZc2lHdE5pOVpQdWpjb3hodjl2b0h3?=
 =?utf-8?B?bnptWUxXS2VpSlRtMWFBUGE5ckV6YjhZdjh4czNhMzlFL21BRmxCZWNZSnl2?=
 =?utf-8?B?QW05Q3FIcWZNekVZWXI3cUNDN09ORjVOaVBQeTJYSC9XSjltaU00a0pHMDNl?=
 =?utf-8?B?aHY3Q3dWQzJ1R21DdW5GbS9EZ1lxRmpNZDZON0dWeDN2ZXJLVDliUXV5Um5Y?=
 =?utf-8?B?Skd4bWRvbzVGaFR1UXlnd2drdXRMWEYzZW50UTZ2cXQyZzQxM2YyN2ZwVFpk?=
 =?utf-8?B?OU1CVzI0V01XcEdJbmFmRGdsUS9NS2NXd09KVm5VUEo0V2RoaTN5RGNlTDhm?=
 =?utf-8?B?L2dhdFlMcVg0NWhIQ1l2UmtsTFlYaTM1VXRlc2g1b3lQbzlCMWlhSERqTkEz?=
 =?utf-8?B?UDNQcm5MSEtTQ1U3dFlsN3pWVG9WSlU0Y0ZIS2YwN1NxM2pXOU81d25yZVlv?=
 =?utf-8?B?Nm1Tc3M1Zm5RNzMxOGJtaHVZYjkyc094K2RuaWEzUS91QlEvcCs0MHRITndx?=
 =?utf-8?B?YnJpMVVjTmEyVW8vUi9OL0tLS21idkdaZWg3dEFHNjBLeXhxOGd3cXE1SVMr?=
 =?utf-8?B?Snp4RlErZWZPTElCWWxITU9TTWViOFJsT29BUFIwbVhRRVdWM0xkZ2xteFdt?=
 =?utf-8?B?SllLa1MrbGs0d1Y1YlVxb1M4a2hNZi9WdlJHMHlERU9UdG9INzdWTG4yWVpq?=
 =?utf-8?B?UlkzQmt5TzFrVlNnSCtsbm9lbXZ0bjNoSWtYY1QyMUhxK2h4VW44OXM5ODNX?=
 =?utf-8?B?enphbEVmYnJ1VUEwQ3JOVUI0M0l1OGpqenN4QzhxcHhYVDkvUDNFMWdYajhq?=
 =?utf-8?B?TGFtSWo0ek9DY0NXMVpoMmN2ak9JSHdmc0FZcWx3YWhpTzArNlFkc2JlQUE5?=
 =?utf-8?B?WkhnbnhxY0hLM1VMbnN0ZWZMWEZGNEQ3emdxc3BRUGRRWXRQK1VuRUJENE93?=
 =?utf-8?B?Z1pHc0ZnSVJwNDJEYVN1VWc4VEtLQmkrRFpHeVlFcWcvQnpLNDdVVDh0dlVO?=
 =?utf-8?B?ZkpETlZEL0x5ako4NnZJSHo0cDJXVHhEdTd4dmxBdG8wSE94eHQ3WHlyUmRv?=
 =?utf-8?B?WkErc3pnOVcwWXdUUHRPcU1DY2R3THlEeUcvQ0NUd1B2Y3JicUQ4Wk9vczNx?=
 =?utf-8?B?MStKQ1pSNi8vaHFPM0k3dzRyc2FLNlRya2p5Z3B5SUI2MzQrTWlmUVBTaFNl?=
 =?utf-8?B?VlBzM1dKQ0FCOE84Z1Q4NDM1SkFlWklya08zOGRmVktRVDFnaEdJVGIyajln?=
 =?utf-8?B?eGZCdXR6MC8vbVFOcUZoL3JQdUxMWC9QNE1GOVJkNlJsQ3hwc21GZ2tUNjNs?=
 =?utf-8?B?ZThlSDdGVXhwSmtmQ1phSk1lRktQdjNvbkVuNWpxMnU4OE5MNS93TkswMlJv?=
 =?utf-8?B?aFBscEtyOWRNSThpQkFra3J1YVIwOVpZOFNycVA0ZkZ1dVVzK0ZSZWdKNi9k?=
 =?utf-8?B?NndZWnA5ZDV5OUU1T0V5OXdka3BOZitETUpJSTY4dDQvYS9KR2IxYnlwbFI1?=
 =?utf-8?B?dVgzeGx4cXVLeHR4NVRVcUZuM1FmRnNQUGxrdlVGZlpuMjRScFMrWUE4aU8r?=
 =?utf-8?B?dWtjOVpzL0VFNERYa1I1QStrcFovV3BldUIxUi9nbU5vcW1tTHg5V0FmZ1Rl?=
 =?utf-8?B?eDhwY3NmMlBNSEYrUzZraDc0R0J2OHZqS0w0TncvWmpOaDY4bWQzZWlqbnZh?=
 =?utf-8?B?NW1YNTBpeUg0ZkxoYVhzNWNXeklyNkE3S3REajg1dHcybmt0Yk1hYjRzYkRD?=
 =?utf-8?Q?s9VBRP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEpEZXIybWwvTHA5OEFzK09janhsYUt0UGgveHVHcUUvbVlSQ3VHVnZzcWNE?=
 =?utf-8?B?Z3J2aWhtbytqV3BZcXVtK1YxVW1PS0FoUVRWL3hRRCtWS1RaOGdtckY3eVJu?=
 =?utf-8?B?MXU0VFFYQ0pyZjRib3BrbURaT0x1NkFwUXR3QlBqNXBDWVUxNmZ3TDhxSFRS?=
 =?utf-8?B?RTQ3dGFQUnk2QUxTaTZGdzJBdUdaWjRnNnhxVzZna21XWUFWMWxmcGMvYUNO?=
 =?utf-8?B?MXAzNkc2VksySjVyajU2REd1alVmeGtOWnM4dXRWYnBKOGY3Tyt0dDhBcDJk?=
 =?utf-8?B?cHIzakZGb3lvWTN0MmFLZU5SR1Z2K21zQVR4T0tGaTgvYzFVSHdRY3dlNzZi?=
 =?utf-8?B?emZrazBZY1UwOVFDUTh2SUU0MlJoN0FoeTRXRTdtdDlPazZlQVkrZVRpbEo0?=
 =?utf-8?B?elJEYk1KMUYrakZUb0pGSTRxOU9XOVozU3hqL2c5MHJuN1BzUGs0a1dMYVBE?=
 =?utf-8?B?NGgxcTlzN1V2WkRPcCtqMGZRNDdYSzNHYzZTc0xTamdwS3hIY0JleVFkTlFk?=
 =?utf-8?B?RDM2dXkxanF3cDVpeTkrK2o1ZU9FWGhJSVVqcGNpVHVzVDg3Z3BGbGFpOHFi?=
 =?utf-8?B?L0JqMitzZ0VSeXhYS1R1OGtkeEtQNzdOS3Z3NUxXVEl0czJPMkZ5bFVSR0w0?=
 =?utf-8?B?VnZHKzlLcGFqT1RkdE9hYllhTGtqRHRMT2gwT2lMT0pkMG5oYkVrM2ExUXNC?=
 =?utf-8?B?dW5xcUdmUG5Qdm5wbGZLdll3Y29qOG9XWkhDTUU3N2QxdkxXSjJVcEZUWDZi?=
 =?utf-8?B?UFAxSks5SXFkZHNzQzBHaWNLYWowZWdKYnRMbnhFbWIxVSt2dmtxTnFSTXBC?=
 =?utf-8?B?SUZWeGN5OVFKMTQvUkxralNqTFZxeE5ONVRwRUVVNll1ckgzVjRFck9WM1I1?=
 =?utf-8?B?UFFURkprOUFWcHk5N25GT2FwNStiWndmeTFoZENyZVQxNUJNNGVuMlJRdzBD?=
 =?utf-8?B?dXpZQzZacHNqNXNITkR1QzFTeTUyY3R2S3AyRFNDVWVDaHUvMTdtNGFSc2lV?=
 =?utf-8?B?ZmYzTHBUUVp4d3drYjZXeXBFeUs4S1paem9HaXhwUTBjR1phdUwvZkkxMThr?=
 =?utf-8?B?Y0oydlVRcXI4aUxYOUFib0srVnFBcnc5dk0zOUYzQld6TkE5WXVWcEdmSlp0?=
 =?utf-8?B?TzVLdHBodVh1RVQ0M2FteGpQWTBQemUyaWZ6VnJJUWErM1FBcEl3dVBKaGRJ?=
 =?utf-8?B?WlpRZklaN2t2aG1wWGNFVVVscEFQUTNtdEU1ZTJ3eDBvdmc3aUFZSiszb3Nz?=
 =?utf-8?B?UEljREsxbTQrNThXN3djcVNxMVNTUGV3NnY5czNEMkFTTWNYMW1JZEtHeGtv?=
 =?utf-8?B?d3g5Y29BQ0FaL3pJeitNNi9NSjZDNW9sU0ljYlkrTWZYcURROWt3K2c2Rkg1?=
 =?utf-8?B?MWU0OG1mK0RsbjBhS3FlcXppd0ZYS2JDK2c1dVhJR3JZT1hGUUhLWTZoL3B1?=
 =?utf-8?B?bCtqNUY3MkFXWTlHaklmWWFMT2ZYcjc4N1dWTFpwNUxZUHB3QjQrbW5YdmFP?=
 =?utf-8?B?eU44a0o1U0dmRmx1OEoyYnpMYUFLT3RoRVlZZXorTzRlQlJTdWhMcWs3Zndk?=
 =?utf-8?B?aWxmNXhRV3QzUHU4V2VLWmVmbWZuYVVQUTBtSW8xOTJKaEVPdmIxYUxwUXNJ?=
 =?utf-8?B?Q3gvRUlLeThNVHVUbXdwb1FSc2g2UnFVYTBhcUdjdkhLT2NLWEhBSTBYTm1R?=
 =?utf-8?B?R0xGZk5JMG54L3RBeHN5eUJWdFhFQ3VUN2VSNG1hNUEyOXNLRHRDVzdQSmcx?=
 =?utf-8?B?VEFvWE5PcFVtcXk0RVBoMFAyaFJ5QzU1RGFLaG9rQW1ORkdVMmF1WUtMczBT?=
 =?utf-8?B?SDhEdFd1NkJUbXBiYWdKZmlJSnlqMVBIaHNQRDJNcjZHTzFXU3pVblNOcUZH?=
 =?utf-8?B?eXQ4dUVMSEU3Q21kWDdBMk5EQStUb0ZEcnBxOVV2cExuQXkvVUhxQkoyd3lh?=
 =?utf-8?B?Q3VvVDBWekQ1WU9YekJmZDR3UzM5a2FyL1VVR3FraXRKTWJHdzJ0SE9PZmp4?=
 =?utf-8?B?SGRidERtQVR4UUxNYVR4Um1melZqcUsxUmFIYlI3WllZME9kdTJ3YUhJVUdr?=
 =?utf-8?B?WUM0K0VOd2tJOHNEak03RmdaRUpJc1FxUW1EUFFQbk5SQm9KeFo2TmJ1RTlU?=
 =?utf-8?B?Y2NCZ2FTbmp2cjFsenQzS2pQbm9KbEkrTWZrK1hqd1NZR3gwV3MxMm1HdURo?=
 =?utf-8?B?b1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0652e888-09d9-4e38-06e0-08de30e5c98f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 14:27:42.0278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpoZwr8PvZhfAT/uGnp97U5NP9imUxxT2CP1yss4fWbFWolFjF8Tlv3zNiE+TXJclaTUDwKiWorg+KMSnp/fHvWfJU79qxPI/ZRITBtfZbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17230

SGkgSm9zdWEgTWF5ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
Sm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+IFNlbnQ6IDAxIERlY2VtYmVyIDIw
MjUgMTQ6MjENCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJdIG1tYzogaG9zdDogcmVuZXNh
c19zZGhpX2NvcmU6IHN1cHBvcnQgY29uZmlndXJpbmcgYW4gb3B0aW9uYWwgc2RpbyBtdXgNCj4g
DQo+IEFtIDAxLjEyLjI1IHVtIDE0OjE3IHNjaHJpZWIgQmlqdSBEYXM6DQo+ID4NCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNv
bGlkLXJ1bi5jb20+DQo+ID4+IFNlbnQ6IDAxIERlY2VtYmVyIDIwMjUgMTI6MzENCj4gPj4gU3Vi
amVjdDogW1BBVENIIHYyIDAvMl0gbW1jOiBob3N0OiByZW5lc2FzX3NkaGlfY29yZTogc3VwcG9y
dA0KPiA+PiBjb25maWd1cmluZyBhbiBvcHRpb25hbCBzZGlvIG11eA0KPiA+Pg0KPiA+PiBTb21l
IFJlbmVzYXMgU29DIGJhc2VkIGJvYXJkcyBtdXggU0QgYW5kIGVNTUMgb24gYSBzaW5nbGUgc2Rp
bw0KPiA+PiBjb250cm9sbGVyLCBleHBvc2luZyB1c2VyIGNvbnRyb2wgYnkgZGlwIHN3aXRjaCBh
bmQgc29mdHdhcmUgY29udHJvbCBieSBncGlvLg0KPiA+Pg0KPiA+PiBQdXJwb3NlIGlzIHRvIHNp
bXBsaWZ5IGRldmVsb3BtZW50IGFuZCBwcm92aXNpb25pbmcgYnkgc2VsZWN0aW5nIGJvb3QNCj4g
Pj4gbWVkaWEgYXQgcG93ZXItb24sIGFuZCBhZ2FpbiBiZWZvcmUgc3RhcnRpbmcgbGludXguDQo+
ID4gRG9lcyBpdCBtZWFuLCB5b3UgYm9vdCB3aXRoIGVTRCBtb2RlLCBib290IHRoZSBsaW51eCB3
aXRoIFNEIG1vZGUgYW5kIGZsYXNoIHRoZSBpbWFnZSB0byBlTU1DPz8NCj4gPg0KPiA+IGFuZCB0
aGVuLCBzd2l0Y2ggdG8gZU1NQyBib290IG1vZGUgYW5kIGJvb3QgZXZlcnl0aGluZyBmcm9tIGVN
TUM/Pw0KPiA+DQo+ID4NCj4gPiBPcg0KPiA+DQo+ID4gYm9vdCB3aXRoIGVTRCBtb2RlLCBmbGFz
aCBlbW1jIGltYWdlcyBhdCBpbml0cmFtZnMgbGV2ZWwvdS1ib290IGxldmVsDQo+ID4NCj4gPiBh
bmQgdGhlbiwgc3dpdGNoIHRvIGVNTUMgYm9vdCBtb2RlIGFuZCBib290IGV2ZXJ5dGhpbmcgZnJv
bSBlTU1DPz8NCj4gDQo+IFRoZSBsYXR0ZXIuDQo+IA0KPiBESVAgc3dpdGNoIGRlY2lkZXMgYm9v
dGxvYWRlciBzdGFydGluZyBmcm9tIGVNTUMgb3IgU0QuDQo+IFRoZW4gdS1ib290IGhhcyBjb21w
bGV0ZSBmcmVlZG9tLg0KPiANCj4gRmluYWxseSBVLUJvb3Qgc2hhbGwgbG9hZCAoYW5kIHBhdGNo
KSBEVEIgZm9yIGVpdGhlciBlTU1DIG9yIFNELg0KPiBSZWdhcmRsZXNzIG9mIHdoZXRoZXIgcm9v
dGZzIGlzIGluaXRyYW1mcyBvciBwaHlzaWNhbCBtZWRpYS4NCg0KT0ssIGl0IGlzIGNsZWFyIG5v
dy4NCg0KQ2hlZXJzLA0KQmlqdQ0K

