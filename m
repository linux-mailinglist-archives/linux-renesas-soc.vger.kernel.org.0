Return-Path: <linux-renesas-soc+bounces-10577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F4E9D2251
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 10:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E18AB21B51
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 09:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1144B156F53;
	Tue, 19 Nov 2024 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="boEu9ymp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84A2AF0A;
	Tue, 19 Nov 2024 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732007832; cv=fail; b=BY0PAyey7EF1jrXY0fTEXaadAm5mv0Hb26FJC1jR/HWt6dtnmGkizrDp+LYDTgDiL/y7fzq1xGtv3IMzZEHeYFvwfrCASYgWtgtMCOjnpKvIgLVV+0l+MhPXrx6sM2NBE00dmYf+c+2UvsijNjY39tOhKT//peBHFzReSlcoCc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732007832; c=relaxed/simple;
	bh=ZnYcS5xm2GZUt+F35vB9xdVdmeLgOr/oK48+BjAhMR0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pHpZeYo+NCEE4WuZuQQzxCPzf/zxXfRe1KwAf2hdrH9XC4tYsFzRl5HufctBQdj8Lxw3/p6DGGLDLe3dMgBUIs5mBbyzZ45CBC4L3/WkvUSbYKoZeeiukpr0c1ciFPxTMfLhHz9INQfW9N7ih6OO7GLbzbO6qnWmc3j3DwmbzLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=boEu9ymp; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbM1Cv7pjROImGh0Bqj+1u2NZZrY1qFOVaWR2SWk06H3z24t6ZwLV5ZxBGsp/GHKmUIHSjbwwSydxhfUSCjODVOsmI/Z0xuAeW//glQagC0FVz8OlMUMTRgS7silQ1KRigAg2uWtSve9mAGm8V107kCPVS5WZ9FxmavA4b+tV2Oyuz7rH0yqbbsJrxRiEL5KHbMX9N+gpg3d3jiq+zGoZbDyJnYezF7OQOUDzcWSgDNKW/iNzA3jtOWDV+qkoTMOBS7G7jledbTOmhVPah7yfZV49m5S36cQyH3K9+9AFm6NqceclNMRjdixeJ6uJW1KV31aYdyRDQPR9P3qwOikGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnYcS5xm2GZUt+F35vB9xdVdmeLgOr/oK48+BjAhMR0=;
 b=gsgJKD8sSuAzcrsMnFUTcm/ZP7+Zqr/yCTVnMCgGcW4cHYJE8qViNZMEKWgMwoFoDeQ5Z0yinRkqQJjuR8SweUvCKrbOkF0a/0dA6IZG22h/sKadjHhuu3DSsMrI7X8qPOSBHqIKDj9jsY9j6QM2mhwWTfrKtyfAnqslWLKTo78AoOp6/snSOLZtzz0zwBuwTEyS+kBjV0ApcnsN/UjxsrVq5NWG9ZQW2S3xpDUPMJMAYYOauld86SdaqYTWMlJkOisOmkiPemZ+p567eWAGJ0Cx3jKMe0SloUo59pNJFi23HK23BGyInAeMj972aEGaWAsQVEDyIv2ptaNVx+rHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnYcS5xm2GZUt+F35vB9xdVdmeLgOr/oK48+BjAhMR0=;
 b=boEu9ympPdaDNZj6HshBJN7ilYvfTwf8JcMTjhzBdcwiGK990a6Op4B+B/m4gWw3dZ88fq2D+3/eDxgOWKE3o5vU8G5iB8dX11PBTdYnQL8Qkob0JwklZGKY+1tI9o7So9s5bvMnrFd5TLNtMeFwVTBjX3oAQczI5LxCF0dsTmM=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB8901.jpnprd01.prod.outlook.com (2603:1096:400:17c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Tue, 19 Nov
 2024 09:17:03 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 09:16:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH v4 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Thread-Topic: [PATCH v4 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Thread-Index: AQHbOCaxhp07U2UFAkaKxq9j1V2SSbK6CQeAgARC0mA=
Date: Tue, 19 Nov 2024 09:16:58 +0000
Message-ID:
 <TYCPR01MB113329885D4B9ED8D8616DE1786202@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241116125415.30799-1-biju.das.jz@bp.renesas.com>
 <20241116125415.30799-2-biju.das.jz@bp.renesas.com>
 <20241116153155.GA12409@pendragon.ideasonboard.com>
In-Reply-To: <20241116153155.GA12409@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB8901:EE_
x-ms-office365-filtering-correlation-id: 841f2260-625b-4de2-28ef-08dd087aeb37
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cU84a3V3UnBlT2hWcmlSYi9lS2N6THF2ZnR0aWtsU0tvc1VES3VGcUdlOW96?=
 =?utf-8?B?WC9wYjZ1cGNLdFVxbHhQdnc1d1h6aHY5Vk9rTTY3aHdBL3JDdDY3Wm9kWnlx?=
 =?utf-8?B?ZXRVekh0TlYvTXFhRnpQNW9UcGRabFh3TGhxMDE0TW9MY3pjT0U3OUJDNm5U?=
 =?utf-8?B?U1NlVEhYZWtWQ1E1NlcwYW42d2JkRTdxT1VNNm01M1dFR3F5cVVZZ2lRd2x3?=
 =?utf-8?B?NTlaUGlzSDhxcjR5VEwzRnRkUnk2ZjhHWElNUzJJdFBjbDZTSGs2My9QY2dW?=
 =?utf-8?B?dmZ0NWVONG9rbFV0K3VaQ3EwM1BNcnFRZ2xQdzdKOTVGd1JBYzcxRktqc3RF?=
 =?utf-8?B?Mng2YXJRRzBwM3FiMjNGN2tPZnNrYWx4K2d1Q3B3ekQwZHUwNXZVNkhMT0U1?=
 =?utf-8?B?ZERUU0gzV2JOOHMvakdBbm8xWHZkYUF3Umh4SEZsTGdseUh5eFNkWTAyd0NK?=
 =?utf-8?B?NFNBUHliem1WaVBMY1pFS0tPbmt0cjFwZkVPN0JMckZhLzd2cFJuMDZLZGh4?=
 =?utf-8?B?dTNTWHhmbTd0Q25WMWpMSDJEcFBRRmwvRys1a00rVXVuUzAzbS8vUzhrN21P?=
 =?utf-8?B?d295Yk0wLzlMUEJTNk5PcFE3SjcvYkRaZHphMjNrVmllUUdWSWF6ekJwVXh5?=
 =?utf-8?B?VmVsem9nNXhZaWowUWxYWmVwc0FRTnlFNTlTWU0rbWtpU0tMd2hJbTdCTHAw?=
 =?utf-8?B?TndGTk9uVFlVTUNOc0wreXZrY1dCZTBBRHV4UFFocDB5cGxRVWhZeTRWQzRo?=
 =?utf-8?B?b1RqbE1seHhzc1RERzNsblR6L0ZCN3VwVFI4VFhKTGJjeU92Z08zUUkzYitu?=
 =?utf-8?B?cTZGd2FOWnNFMGM4Tk1qZE9nWlkxTE82bzFRN05abklyYnNYVXVjRmY1ODBJ?=
 =?utf-8?B?VEVYZXAwYVNIS0ordVVXdVZsbktmbEFWUktucS9tQzdPbG9zOFAwU0owU2Nj?=
 =?utf-8?B?ZkUxZ1RhZUxhSEdUQm5STWUwTGNsS1FESnAxV3l2ODFxVmQ1Q0Z5eVVleHhF?=
 =?utf-8?B?NFZnZlFwbXdIS2VnODZ2QXE5cEhaRjhXVVg4MzJmVWY2SEJsVDg5Um5LZ0VM?=
 =?utf-8?B?ZWVwSFErTVRzOXhqR1llVTBRN3daWi9aZ2NMZFhQQVA1WlNiSzlpMkxCcXo1?=
 =?utf-8?B?eTIzcTRuc2Z3Qk9CTXMzNXRPMElFd2l6T05LZHpPNFdyY3hjT0J5a0xIUFNm?=
 =?utf-8?B?S0VEZDMyZWFFQnJwSnN2YXN0Y2VmbjVEL1NMY3pIVjBNeXF1RnVkSWdvRDln?=
 =?utf-8?B?YnVON3JsNjV6Znp2Rk8wL3hyVjRuYUJrblVmM1NqcjJwTVhPUE5aMkwyZTNv?=
 =?utf-8?B?Zmh1VjExcWZWT1NudXU0OXVYN1JTM0tBN3MzVk5XZi9DY2lwOGFHTFBleEtE?=
 =?utf-8?B?NVVYOHAwbXVIbFJNVU9PSnRqWU1ZTFdwU1RZMVU4SWd3R1Q4SmNRU09MQ0d0?=
 =?utf-8?B?ZEN0OUd4WVJtb2hFNktRN0xLUk9tdlY2ekN0SnF6blk1NkFJclZYZXVmVlVE?=
 =?utf-8?B?Z3k4ckYrc3BxblRTUFlqTDZnNkd5TEl0OHNYekZVbHBCdE85REwweXlIcEx1?=
 =?utf-8?B?Zkd3R3VENncwbzZ1b2JCT3JzOGVJZm96TzhnQWFjMy96RHYxbGxkOGRqcHlD?=
 =?utf-8?B?Nm9aUkhoSFJTY0p2S1E2eExDVG1EUDZBcjluNk5Hd01SMmEyczUxa1UwYllh?=
 =?utf-8?B?bnptRDR3ZjgyeTVreDRuQ1hSN2Rkc20xNlBNVGI0clBsNklvZWQ0LzN0dnZX?=
 =?utf-8?B?YnFPamVENHBQSlA5dmxVNlF6Vjl3Yk01YzQ4R2NqVWVIVjFVTFdUNE11VnZq?=
 =?utf-8?Q?ELPUVgxXa4UPahlarpnc/mUFYaGsxDUqQ49og=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTRkaTNCdlRWaEhSaWNvdzRNZVZpUnRwWjRNL2hjZUJMSk1sS1NweUJmZ3RX?=
 =?utf-8?B?Z3FtdjBhUCtEckczNkEvc2xDZjY5VDlBQkhwVVNkT2ZTSlpRRy9tRjlrR3Nm?=
 =?utf-8?B?b1d2Z3E4dkpmb0lPM2xQRDk4S2xNTE5Hb0k4K3pSbVRWb1RnOFlQNko2YWt2?=
 =?utf-8?B?akRKT0lyd1UyTUFPSFZEc1BvRGwvOGFWRlZjb0UvYkJJVFRiSEN1WGtTK2p2?=
 =?utf-8?B?bGxSQU1NdHRiL0NEckJhbmdtVjFJMGFYR0J3c2lTU0Yxa3FzOFNLY29uYkF6?=
 =?utf-8?B?VGNzalJ5RC9SMFo3UnpzZEtWK2JpR3BmYnlNNDJNWEVEZHgzVWNvY1dUMkFa?=
 =?utf-8?B?czhSYkxYc0NuMHgzUGJOZkdnaXVPT0sxRkROZDFhbVZmNVN3UDc4Nm04eVA2?=
 =?utf-8?B?S1FiQ2xmVXVCKzJxMEZNQmdGQmJ0MXFabFVONituYlVvanZVNTZVK0cxSmxm?=
 =?utf-8?B?VE1KeGpybS9iaUlITkRmbnVOdkVoam1YQldWVjZmc3hmMlRuQzZidzVrTGJp?=
 =?utf-8?B?MXNwM0toNVZibTdkajB0TE9Sck5NMnp5aUJCOFlBNVFTK05WQ2k2SWJyZHNo?=
 =?utf-8?B?TTdndzcxMmEycWZUdDkvdFdzcGxaUjdkU2NSV2FkV0Z3L2FZOVJXdEMvdEs1?=
 =?utf-8?B?YU9raWVzc0VtWkRvK2NGaGZ3RFhlWEhkQVA2MjRScGhPNmVmbjh3dk54WWI1?=
 =?utf-8?B?dWZWZit5WWxuMzlWWWxJdGZCeVFpOUVXL2NnL0xXL29qK0hBSmRaVlU2Q0Rx?=
 =?utf-8?B?a0FFWEdWTVNUam1BL3ZmaC9EMUp0Sy96SnMvcWFRZmlMcjRBc0RjdVgwc0cr?=
 =?utf-8?B?UVpXUWwrOUQ0OWNiY1lVODV3T2ZXazg3bjU5Tk5hZnZuMjJTNjdNVGNYaUdP?=
 =?utf-8?B?dVpuNUQvSDRya2duWmVBb2hZdG1EZUdwSzl3THI3VUh0UE1jdXNwY0RaVjBn?=
 =?utf-8?B?bEZKT01kUUQ1a29TQmJveHZTcWpvcGpHdnJROFM0eFZ0RjRQWUhMQnBRMnpY?=
 =?utf-8?B?WEFzVUx2SHFkRlBPSi8zSy9sRVlINnlBN3pGVUVpZHEwQTd6aFNyd2J3Tmlm?=
 =?utf-8?B?clE1SjJRNXZmbzhSVjFtVkZTejRrL2ZBVkhCVVZ0Tzl1YTgvbDF3UlRjRElq?=
 =?utf-8?B?QnpQcisxazJiL244b0ZWb3d3eVBTOGYzVjNCMmh4NTd0aUxOOVlVNUhzMm5x?=
 =?utf-8?B?NlM1U2FlNzJncm8rR08rOFJKNkNSMmpqd3JTU1hIMmNKVzlRNEZaQmFva28z?=
 =?utf-8?B?Q0U4TWNYQUdQQVNyQnJZZkRlSWpuTGpNMUVodjBPTlY3M2VoVGZ4QXhkWTc4?=
 =?utf-8?B?OGdWLzZwK2laU2d2Vk54MmxicFNkL1VEU3dSdUlSNitsWWl6TkxFYkl4eU92?=
 =?utf-8?B?ZENZWGtjZ3Rya2RyYTA4Q1gzVFhoZ1p4SjBSUmVaOVZuNkpYb3BYRmJZb1ZI?=
 =?utf-8?B?US9laXRzbm95T2ZYYzF5eXh5TStxcXB5dWoxN2JNY3lSSkJ3UGlaemhWNy9S?=
 =?utf-8?B?d1llMVU0NkNFMzFXbWZZOXlWbzZ3dmpINFFHeVR5RHZIT1RKdDB6NGhoV1ZE?=
 =?utf-8?B?cG5zWWgzdFAyZlltQTdMTUZ2ZTMydGMwMFdPcW5YYVY3Q3FSUVNRbGdsVVVO?=
 =?utf-8?B?QWdoNkNSZnNKME84ZXhSK2l0dGlHNlZBZDNzMDVqUHJWV3lkMmlzTFY4MVhw?=
 =?utf-8?B?UmJ2SnZPTW1EYVE4akozRUc2TURQUFl5R2kyRk91bXY0SW9tdHdlSU9kK3gy?=
 =?utf-8?B?cWVuNkVRckVUM2tKK202OG4yU3NIdjlEY0FwNUZVWFowd3hoRW5mZEFjNkxX?=
 =?utf-8?B?ejVCdVdTRmRMT2VtSm5qZHZadXQ3WjdxZDJ1UWdSdlNLdjE0ak1ldzdmL1Vj?=
 =?utf-8?B?TzFYN2k2VW1rVzNwY2xrekRrL2lhTWpSU1h6QnJhdDZTdkw2NGxEZXFlc25Q?=
 =?utf-8?B?VWIxdFNBV3hoZ1ovZHorMVgwYnBLNFhlQ1pmbHQ5d0N2RHRtMWJiUzBXWkNU?=
 =?utf-8?B?aVFPdGNHRnQ5L0dFU0hPL1lvVlNJWUp5QWkyVGFNRG1XQmFwZUcyanh5cDNq?=
 =?utf-8?B?dW1PQllxcXJ4NEJJa0R4V0xVMnBFMWNjZXRBMzJydVc3b2RwWGE4K2NDR2sw?=
 =?utf-8?B?S2NFN1BYbnI1T094b2xBN1lJTlpJNlUrRVVpM292T2FEWjVwdnRqUytaZ3hP?=
 =?utf-8?B?QXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 841f2260-625b-4de2-28ef-08dd087aeb37
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 09:16:58.1437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8e2oU7peusXJnYrO5ZSf0gmbAm9MSStEK8BQ3rSRb0f2JX+kHuCDUTzuMWF6ilCP7EImnSfTCnRRP/Q+y+C24EtIfju0ODTS08L/olbBVjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8901

SGkgTGF1cmVudCwNCg0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIExhdXJlbnQgUGluY2hhcnQNCj4gU2Vu
dDogMTYgTm92ZW1iZXIgMjAyNCAxNTozMg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvM10g
ZHJtOiBhZHY3NTExOiBGaXggdXNlLWFmdGVyLWZyZWUgaW4gYWR2NzUzM19hdHRhY2hfZHNpKCkN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9u
IFNhdCwgTm92IDE2LCAyMDI0IGF0IDEyOjU0OjEwUE0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0K
PiA+IFRoZSBob3N0X25vZGUgcG9pbnRlciB3YXMgYXNzaWduZWQgYW5kIGZyZWVkIGluIGFkdjc1
MzNfcGFyc2VfZHQoKSwNCj4gPiBhbmQgbGF0ZXIsIGFkdjc1MzNfYXR0YWNoX2RzaSgpIHVzZWQg
dGhlIHNhbWUuIEZpeCB0aGlzIHVzZS1hZnRlci1mcmVlDQo+ID4gaXNzdWUgd2l0aCB0aGUgYmVs
b3cgY2hhbmdlczoNCj4gPg0KPiA+ICAxLiBEcm9wIGhvc3Rfbm9kZSBmcm9tIHN0cnVjdCBhZHY3
NTExIGFuZCBpbnN0ZWFkIHVzZSBhIGxvY2FsIHBvaW50ZXIgaW4NCj4gPiAgICAgYWR2NzUxMV9w
cm9iZSgpLg0KPiA+ICAyLiBVcGRhdGUgYWR2NzUzM19wYXJzZV9kdCgpIHRvIHJldHVybiB0aGUg
aG9zdF9ub2RlLg0KPiA+ICAzLiBQYXNzIHRoZSBob3N0X25vZGUgYXMgYSBwYXJhbWV0ZXIgdG8g
YWR2NzUzM19hdHRhY2hfZHNpKCkuDQo+ID4gIDQuIENhbGwgb2Zfbm9kZV9wdXQoKSBhZnRlciB1
c2UuDQo+ID4NCj4gPiBGaXhlczogMWU0ZDU4Y2Q3Zjg4ICgiZHJtL2JyaWRnZTogYWR2NzUzMzog
Q3JlYXRlIGEgTUlQSSBEU0kgZGV2aWNlIikNCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zw0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHY0Og0KPiA+ICAtIFVwZGF0ZWQgY29tbWl0IGRl
c2NyaXB0aW9uLg0KPiA+ICAtIERyb3BwZWQgaG9zdF9ub2RlIGZyb20gc3RydWN0IGFkdjc1MTEg
YW5kIGluc3RlYWQgdXNlZCBhIGxvY2FsIHBvaW50ZXINCj4gPiAgICBpbiBwcm9iZSgpLiBBbHNv
IGZyZWVpbmcgb2YgaG9zdF9ub2RlIHBvaW50ZXIgYWZ0ZXIgdXNlIGlzIGRvbmUgaW4NCj4gPiAg
ICBwcm9iZSgpLg0KPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gIC0gUmVwbGFjZSBfX2ZyZWUgY29u
c3RydWN0IHdpdGggcmVhZGFibGUgb2Zfbm9kZV9wdXQoKS4NCj4gPiBDaGFuZ2VzIGluIHYyOg0K
PiA+ICAtIEFkZGVkIHRoZSB0YWcgIkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnIiBpbiB0aGUg
c2lnbi1vZmYgYXJlYS4NCj4gPiAgLSBEcm9wcGVkIEFyY2hpdCBUYW5lamEgaW52YWxpZCBNYWls
IGFkZHJlc3MNCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fk
djc1MTEuaCAgICAgfCAgNiArKystLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3
NTExL2Fkdjc1MTFfZHJ2LmMgfCAyMiArKysrKysrKysrKysrKy0tLS0tLQ0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5jICAgICB8IDIwICsrKysrKysrKy0tLS0t
LS0tLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUx
MS9hZHY3NTExLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTEx
LmgNCj4gPiBpbmRleCBlYzBiN2YzZDg4OWMuLjlmM2ZhZTdjYzU5NyAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+IEBAIC0zODMsNyArMzgz
LDYgQEAgc3RydWN0IGFkdjc1MTEgew0KPiA+ICAJc3RydWN0IHJlZ3VsYXRvcl9idWxrX2RhdGEg
KnN1cHBsaWVzOw0KPiA+DQo+ID4gIAkvKiBBRFY3NTMzIERTSSBSWCByZWxhdGVkIHBhcmFtcyAq
Lw0KPiA+IC0Jc3RydWN0IGRldmljZV9ub2RlICpob3N0X25vZGU7DQo+ID4gIAlzdHJ1Y3QgbWlw
aV9kc2lfZGV2aWNlICpkc2k7DQo+ID4gIAl1OCBudW1fZHNpX2xhbmVzOw0KPiA+ICAJYm9vbCB1
c2VfdGltaW5nX2dlbjsNCj4gPiBAQCAtNDE3LDggKzQxNiw5IEBAIGVudW0gZHJtX21vZGVfc3Rh
dHVzIGFkdjc1MzNfbW9kZV92YWxpZChzdHJ1Y3QgYWR2NzUxMSAqYWR2LA0KPiA+ICAJCQkJCWNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKTsgIGludA0KPiA+IGFkdjc1MzNfcGF0
Y2hfcmVnaXN0ZXJzKHN0cnVjdCBhZHY3NTExICphZHYpOyAgaW50DQo+ID4gYWR2NzUzM19wYXRj
aF9jZWNfcmVnaXN0ZXJzKHN0cnVjdCBhZHY3NTExICphZHYpOyAtaW50DQo+ID4gYWR2NzUzM19h
dHRhY2hfZHNpKHN0cnVjdCBhZHY3NTExICphZHYpOyAtaW50IGFkdjc1MzNfcGFyc2VfZHQoc3Ry
dWN0DQo+ID4gZGV2aWNlX25vZGUgKm5wLCBzdHJ1Y3QgYWR2NzUxMSAqYWR2KTsNCj4gPiAraW50
IGFkdjc1MzNfYXR0YWNoX2RzaShzdHJ1Y3QgYWR2NzUxMSAqYWR2LCBzdHJ1Y3QgZGV2aWNlX25v
ZGUNCj4gPiArKmhvc3Rfbm9kZSk7IHN0cnVjdCBkZXZpY2Vfbm9kZSAqYWR2NzUzM19wYXJzZV9k
dChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0KPiA+ICsJCQkJICAgICBzdHJ1Y3QgYWR2NzUxMSAq
YWR2KTsNCj4gPg0KPiA+ICAjaWZkZWYgQ09ORklHX0RSTV9JMkNfQURWNzUxMV9BVURJTw0KPiA+
ICBpbnQgYWR2NzUxMV9hdWRpb19pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGFkdjc1
MTEgKmFkdjc1MTEpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fk
djc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTEx
L2Fkdjc1MTFfZHJ2LmMNCj4gPiBpbmRleCBlYjU5MTliMzgyNjMuLjNmMWYzMDk3OTFhNSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5j
DQo+ID4gQEAgLTEyMDksNiArMTIwOSw3IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9wYXJzZV9kdChz
dHJ1Y3QgZGV2aWNlX25vZGUNCj4gPiAqbnAsICBzdGF0aWMgaW50IGFkdjc1MTFfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmkyYykgIHsNCj4gPiAgCXN0cnVjdCBhZHY3NTExX2xpbmtfY29uZmln
IGxpbmtfY29uZmlnOw0KPiA+ICsJc3RydWN0IGRldmljZV9ub2RlICpob3N0X25vZGUgPSBOVUxM
Ow0KPiA+ICAJc3RydWN0IGFkdjc1MTEgKmFkdjc1MTE7DQo+ID4gIAlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmaTJjLT5kZXY7DQo+ID4gIAl1bnNpZ25lZCBpbnQgdmFsOw0KPiA+IEBAIC0xMjMzLDEy
ICsxMjM0LDE3IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAq
aTJjKQ0KPiA+ICAJaWYgKHJldCAmJiByZXQgIT0gLUVOT0RFVikNCj4gPiAgCQlyZXR1cm4gcmV0
Ow0KPiA+DQo+ID4gLQlpZiAoYWR2NzUxMS0+aW5mby0+bGlua19jb25maWcpDQo+ID4gKwlpZiAo
YWR2NzUxMS0+aW5mby0+bGlua19jb25maWcpIHsNCj4gPiAgCQlyZXQgPSBhZHY3NTExX3BhcnNl
X2R0KGRldi0+b2Zfbm9kZSwgJmxpbmtfY29uZmlnKTsNCj4gPiAtCWVsc2UNCj4gPiAtCQlyZXQg
PSBhZHY3NTMzX3BhcnNlX2R0KGRldi0+b2Zfbm9kZSwgYWR2NzUxMSk7DQo+ID4gLQlpZiAocmV0
KQ0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gKwkJaWYgKHJldCkNCj4gPiArCQkJcmV0dXJuIHJl
dDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoYWR2NzUxMS0+aW5mby0+aGFzX2RzaSkgew0K
PiA+ICsJCWhvc3Rfbm9kZSA9IGFkdjc1MzNfcGFyc2VfZHQoZGV2LT5vZl9ub2RlLCBhZHY3NTEx
KTsNCj4gPiArCQlpZiAoSVNfRVJSKGhvc3Rfbm9kZSkpDQo+ID4gKwkJCXJldHVybiBQVFJfRVJS
KGhvc3Rfbm9kZSk7DQo+ID4gKwl9DQo+ID4NCj4gPiAgCXJldCA9IGFkdjc1MTFfaW5pdF9yZWd1
bGF0b3JzKGFkdjc1MTEpOw0KPiA+ICAJaWYgKHJldCkNCj4gDQo+IGhvc3Rfbm9kZSBpcyBsZWFr
ZWQgaGVyZS4NCg0KT29wcy4gTWlzc2VkIGl0Lg0KPiANCj4gPiBAQCAtMTM0Myw5ICsxMzQ5LDEx
IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjKQ0KPiA+
ICAJfQ0KPiA+DQo+ID4gIAlpZiAoYWR2NzUxMS0+aW5mby0+aGFzX2RzaSkgew0KPiA+IC0JCXJl
dCA9IGFkdjc1MzNfYXR0YWNoX2RzaShhZHY3NTExKTsNCj4gPiArCQlyZXQgPSBhZHY3NTMzX2F0
dGFjaF9kc2koYWR2NzUxMSwgaG9zdF9ub2RlKTsNCj4gPiAgCQlpZiAocmV0KQ0KPiA+ICAJCQln
b3RvIGVycl91bnJlZ2lzdGVyX2F1ZGlvOw0KPiA+ICsNCj4gPiArCQlvZl9ub2RlX3B1dChob3N0
X25vZGUpOw0KPiA+ICAJfQ0KPiA+DQo+ID4gIAlyZXR1cm4gMDsNCj4gPiBAQCAtMTM2Miw2ICsx
MzcwLDggQEAgc3RhdGljIGludCBhZHY3NTExX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMp
DQo+ID4gIGVycl9pMmNfdW5yZWdpc3Rlcl9lZGlkOg0KPiA+ICAJaTJjX3VucmVnaXN0ZXJfZGV2
aWNlKGFkdjc1MTEtPmkyY19lZGlkKTsNCj4gPiAgdW5pbml0X3JlZ3VsYXRvcnM6DQo+ID4gKwlp
ZiAoaG9zdF9ub2RlKQ0KPiA+ICsJCW9mX25vZGVfcHV0KGhvc3Rfbm9kZSk7DQo+IA0KPiBUaGUg
ZXJyb3IgbGFiZWwgYW5kIHRoZSBlcnJvciBoYW5kbGluZyBjb2RlIGFyZSBub3cgb3V0IG9mIHN5
bmMsIG1ha2luZyB0aGUgY29kZSBoYXJkZXIgdG8gcmVhZCBhbmQNCj4gbW9yZSBlcnJvci1wcm9u
ZS4NCj4gDQo+IEVycm9yIGhhbmRsaW5nIGlzIHdoeSBJIHByb3Bvc2VkIGtlZXBpbmcgb2Zfbm9k
ZSBpbiB0aGUgYWR2NzUxMSBzdHJ1Y3R1cmUsIGFuZCBjYWxsaW5nIG9mX25vZGVfcHV0KCkNCj4g
aW4gYWR2NzUxMV9yZW1vdmUoKSBhbmQgYXQgdGhlIGVuZCBvZiB0aGUgZXJyb3IgaGFuZGxpbmcg
cGF0aCBpbiBhZHY3NTExX3Byb2JlKCkuDQoNCk9LIGdvdCBpdCwgVGhlbiB3aWxsIGtlZXAgdGhl
IG9mX25vZGUgaW4gdGhlIGFkdjc1MTEgc3RydWN0dXJlIHRvIG1ha2UgdGhlIGVycm9yIGxhYmVs
IGFuZCANCmVycm9yIGhhbmRsaW5nIGNvZGUgaW4gc3luYy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IA0KPiA+ICAJYWR2NzUxMV91bmluaXRfcmVndWxhdG9ycyhhZHY3NTExKTsNCj4gPg0KPiA+ICAJ
cmV0dXJuIHJldDsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3
NTExL2Fkdjc1MzMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1
MzMuYw0KPiA+IGluZGV4IDQ0ODE0ODlhYWY1ZS4uNWQwZTU1ZWY0MDI4IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5jDQo+ID4gQEAgLTEzMSw3ICsx
MzEsNyBAQCBpbnQgYWR2NzUzM19wYXRjaF9jZWNfcmVnaXN0ZXJzKHN0cnVjdCBhZHY3NTExICph
ZHYpDQo+ID4gIAkJCQkgICAgQVJSQVlfU0laRShhZHY3NTMzX2NlY19maXhlZF9yZWdpc3RlcnMp
KTsNCj4gPiAgfQ0KPiA+DQo+ID4gLWludCBhZHY3NTMzX2F0dGFjaF9kc2koc3RydWN0IGFkdjc1
MTEgKmFkdikNCj4gPiAraW50IGFkdjc1MzNfYXR0YWNoX2RzaShzdHJ1Y3QgYWR2NzUxMSAqYWR2
LCBzdHJ1Y3QgZGV2aWNlX25vZGUNCj4gPiArKmhvc3Rfbm9kZSkNCj4gPiAgew0KPiA+ICAJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJmFkdi0+aTJjX21haW4tPmRldjsNCj4gPiAgCXN0cnVjdCBtaXBp
X2RzaV9ob3N0ICpob3N0Ow0KPiA+IEBAIC0xNDIsNyArMTQyLDcgQEAgaW50IGFkdjc1MzNfYXR0
YWNoX2RzaShzdHJ1Y3QgYWR2NzUxMSAqYWR2KQ0KPiA+ICAJCQkJCQkgICAubm9kZSA9IE5VTEws
DQo+ID4gIAkJCQkJCSB9Ow0KPiA+DQo+ID4gLQlob3N0ID0gb2ZfZmluZF9taXBpX2RzaV9ob3N0
X2J5X25vZGUoYWR2LT5ob3N0X25vZGUpOw0KPiA+ICsJaG9zdCA9IG9mX2ZpbmRfbWlwaV9kc2lf
aG9zdF9ieV9ub2RlKGhvc3Rfbm9kZSk7DQo+ID4gIAlpZiAoIWhvc3QpDQo+ID4gIAkJcmV0dXJu
IGRldl9lcnJfcHJvYmUoZGV2LCAtRVBST0JFX0RFRkVSLA0KPiA+ICAJCQkJICAgICAiZmFpbGVk
IHRvIGZpbmQgZHNpIGhvc3RcbiIpOyBAQCAtMTY2LDIyICsxNjYsMjIgQEAgaW50DQo+ID4gYWR2
NzUzM19hdHRhY2hfZHNpKHN0cnVjdCBhZHY3NTExICphZHYpDQo+ID4gIAlyZXR1cm4gMDsNCj4g
PiAgfQ0KPiA+DQo+ID4gLWludCBhZHY3NTMzX3BhcnNlX2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAsIHN0cnVjdCBhZHY3NTExICphZHYpDQo+ID4gK3N0cnVjdCBkZXZpY2Vfbm9kZSAqYWR2NzUz
M19wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0KPiA+ICsJCQkJICAgICBzdHJ1Y3Qg
YWR2NzUxMSAqYWR2KQ0KPiA+ICB7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKmhvc3Rfbm9k
ZTsNCj4gPiAgCXUzMiBudW1fbGFuZXM7DQo+ID4NCj4gPiAgCW9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5wLCAiYWRpLGRzaS1sYW5lcyIsICZudW1fbGFuZXMpOw0KPiA+DQo+ID4gIAlpZiAobnVtX2xh
bmVzIDwgMSB8fCBudW1fbGFuZXMgPiA0KQ0KPiA+IC0JCXJldHVybiAtRUlOVkFMOw0KPiA+ICsJ
CXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiA+DQo+ID4gIAlhZHYtPm51bV9kc2lfbGFuZXMg
PSBudW1fbGFuZXM7DQo+ID4NCj4gPiAtCWFkdi0+aG9zdF9ub2RlID0gb2ZfZ3JhcGhfZ2V0X3Jl
bW90ZV9ub2RlKG5wLCAwLCAwKTsNCj4gPiAtCWlmICghYWR2LT5ob3N0X25vZGUpDQo+ID4gLQkJ
cmV0dXJuIC1FTk9ERVY7DQo+ID4gLQ0KPiA+IC0Jb2Zfbm9kZV9wdXQoYWR2LT5ob3N0X25vZGUp
Ow0KPiA+ICsJaG9zdF9ub2RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9ub2RlKG5wLCAwLCAwKTsN
Cj4gPiArCWlmICghaG9zdF9ub2RlKQ0KPiA+ICsJCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOw0K
PiA+DQo+ID4gIAlhZHYtPnVzZV90aW1pbmdfZ2VuID0gIW9mX3Byb3BlcnR5X3JlYWRfYm9vbChu
cCwNCj4gPiAgCQkJCQkJImFkaSxkaXNhYmxlLXRpbWluZy1nZW5lcmF0b3IiKTsgQEAgLTE5MCw1
ICsxOTAsNSBAQCBpbnQNCj4gPiBhZHY3NTMzX3BhcnNlX2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAsIHN0cnVjdCBhZHY3NTExICphZHYpDQo+ID4gIAlhZHYtPnJnYiA9IHRydWU7DQo+ID4gIAlh
ZHYtPmVtYmVkZGVkX3N5bmMgPSBmYWxzZTsNCj4gPg0KPiA+IC0JcmV0dXJuIDA7DQo+ID4gKwly
ZXR1cm4gaG9zdF9ub2RlOw0KPiA+ICB9DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1
cmVudCBQaW5jaGFydA0K

