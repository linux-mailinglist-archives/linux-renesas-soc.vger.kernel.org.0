Return-Path: <linux-renesas-soc+bounces-31450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB1uDFtC52no5QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 11:24:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB9C438C99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 11:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 324D93001A54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 09:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2156384225;
	Tue, 21 Apr 2026 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FPxN0eME"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3A227BB9;
	Tue, 21 Apr 2026 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776763477; cv=fail; b=AiMvVXLQFoJGUi9nykoMmw4bLZJSOYKVBgeH4NNUx3KVOF/NfGHsYPIq79XR98oaKXPt2hPvOwP/ulygepYT+Wmn8qGeh9U2wrgAEoE1hjIkSWmvUV01pY7zo2Qc/MlX3PSkf9RAF2sQutVi4R6lNGUenPS+Yto3t2j1Z1bpYbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776763477; c=relaxed/simple;
	bh=3lcF0TwjqgLN+fuNhPQOyA+3L5HHwp03hMzvqvsAYYs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ho3JZdvcJLEkwoo2H0LIgM5SoBhPYs4g9jT02WzexoLlPKRNtOORr8AfOt6oITwMttGwaojcvwc7jQ2GvAfHUqzqKzMC93ffNGS7EOK+oR95vNyOql1ST8jCvO7PD8mYeVdQ6T/Pm4WcyHEXk+br+ayZBHYAshctM7yVjjas1hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FPxN0eME; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjAjNijpcZW3U/OBRGFEs6w0UCMysiEk7zBvdpsjwfTSNBvkO5jhNGSX0ueY3wdYuIkAiaumLsUcmF3iF2Qmh/i5cb353XamC77KHTm26RfdC1r2DQAfRFNayZw4w2bXhRW4K86d3IGuAhGWCbzgYZvb24YkNHSL0n07hp4NR4IiwNtCRHSUh/8CMT+zs7MjZ+XbMiDBwEQCdv3yKIuytgaQO4BMl71zua+a1HzVxKAem9ABRxGkZ0LFhGxGcjL2GrWDNrJOdmuMdQRcbKBbBydwGat6kwtw849AAqMo54r6quLqKttqDyftvPZXFcWWatHE5C9l5SZtubAXptPq9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lcF0TwjqgLN+fuNhPQOyA+3L5HHwp03hMzvqvsAYYs=;
 b=h6aerXkcOXd2TVft0bvVzgoOBjUgJA3gyVXn6E6u4x7lOjoIaE1fbIJregm09QxeaQ+/4c6iM2ZdRAh5VtSwGFKJGQe1d1tw3auJqnsb4THWLUk4wxa+IAtS6xt3QPF99dbkKJ1C/275F8N0RZriCdB0ybqigYVyFzPaFkb2JMsl7ciNFEcdqJP+huEguYNZxCPNekz6aR3G8GNCXwE6J+2tKA9NV88e+V0XAmOly8MdqP8Wny9F/jwmHiYGPJQrXOoeVZPc575Nr/1A7xICAHnGJuwsWmNFmZilLlHvXvcamz2NIYuNK3gd1HhC6INcUOcOl3zDGvcsreURQxeZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lcF0TwjqgLN+fuNhPQOyA+3L5HHwp03hMzvqvsAYYs=;
 b=FPxN0eMEc/GiziEcaY2L+u3Ysbn+2BUgQp/8c90ClNQquNCZiJKlafaAqfEOGQmbUgH0U/xtLKVVuOY0289iVUZt0u74Z3VzryGo3g01ugbTIQpBsNizPZ9dKb6BNna6tjyFARo2LYn5N1Ci+WeueI0+sZavfK9yJXz0MAlB3lE=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB10820.jpnprd01.prod.outlook.com (2603:1096:400:2a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 09:24:29 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 09:24:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, biju.das.au <biju.das.au@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
Thread-Topic: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
Thread-Index:
 AQHczXsqgxiifiqLaUe75nBbRjmUw7XixUyAgABLaICABC59AIAANRzwgAFsNQCAAE5DcA==
Date: Tue, 21 Apr 2026 09:24:20 +0000
Message-ID:
 <TYCPR01MB11332C7C4BA2180F36F22D2CB862C2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260416082928.169347-1-biju.das.jz@bp.renesas.com>
 <00e2f34a-c488-4a61-bb87-0f0431990c3f@nxp.com>
 <TY3PR01MB11346B5C92803F6A3D174ACCF86202@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <d6dcdce0-6ff9-433a-963c-5f0ea9f2a9fa@nxp.com>
 <TY3PR01MB11346D957ED7C6A2BFD1EF79B862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <4c6e3f5c-a568-46c8-b9ea-69a2fff4b744@nxp.com>
In-Reply-To: <4c6e3f5c-a568-46c8-b9ea-69a2fff4b744@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB10820:EE_
x-ms-office365-filtering-correlation-id: 5aa3a430-fae7-43db-5e88-08de9f87c50f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|921020|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 I49HgLTaeWtt6mt2+nqUsciFqCpzCOGqaszD4tRG8dwYOahaLwi9J+UAf9XkY4mjyz7RdwxJMjiKs1DhG+R40ILKyw7XSRZapDBy8f6IHUsA1drNVO7j83lBS99yfNNcAoBiUoCLvgogChYS7d4HJhaDD5DcJ60bWvq2GuGfHCjbfjKv4ach/CqvGzANqpUrFg+e9RNb65X5zo7heiWG9nr64XBdftf4nehsRgD0/+/mfE7y/P1skXqwjO0kPlTR73+wuH9iPn6PV6OfhWq86tzz0XQ2IBHma7vMfsT8947ZWDI54uYcYN7uuRbQrdOGq73xpFjUiYrXeV2o5s5rFAPsJsRvM7OmHynPmkkIJ9L35z23mkT95cNz9WCF3OQLbxmOE9skfvNBkOpdj2uGGX5LpJw4ZINqCPVyA0EaimJa4Q714XJpLFEsy1NQ6fIzcNVFisdhS69Nh7uznTolKfTVjiZ4wqzv7htUrmRQx6Uy2GfH64vVSq6A8HCjt2caXvHCEx6KcqIyD5A24bhkxmgKFagYAYN41w/bneBqToUG0Of/6idbrHzth/oHEabzaVuVnglN0CN+AesEDwOqqDrg4vipoDb9BQ4IleUtPDuWbPImY9043ihqzVfMMVuosz98cIL2t0qHlppQosXu8ypqfAb4VslJ8z4VQBfA4XyeJhb+9Qyv4vM9FD2nvGAGIwvdcacZf/xwH5jiEsQtbqsSJqsWWNibPdutjN5HrarnRQxGPFW7+Gkf/fHcG4cmV5rQYTQjnJsKMK1TSqtgITP/lJSIQMsaRBgceoyzPoSPXoK8VT0srwcrcGnk4jdo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ang0UW5FNDBBLzU0b2E4WWVNK2prRlRnNVJqZmU3YXk2elpYOXJ4UG5QMzVG?=
 =?utf-8?B?L0JPU3hZcGs4SllPNE8vS082M3AxTG9BMGZSS3JoTTh0ekRFM1Z4YitJRFl6?=
 =?utf-8?B?T3dnd2ZsVGc1K1J4TDVmQXRCanRuSTVHSVBldHkzblJJV3hnMVh4MWgwWjVp?=
 =?utf-8?B?ZUxtd0x0YjhnOXZsYmFybjRpdEw3VEVSNlhubzV2OVM4RVErSVlCVkgvT3hZ?=
 =?utf-8?B?MUVJVUI5WW9yVHowck5EeUJrMEZOQXJyeEo2L2U0WUNReU1IdEMwU0xCNjJn?=
 =?utf-8?B?SkhFNEIrOFRJTy9lRVJXdEgvL1RjdWxCWWttWGpReEFQSEgxSW9icG1WYytM?=
 =?utf-8?B?SmJUK05ycW8rcy9Pa2tJZUNpQkVkQTMyZ2gzd1dOd3ZvNys3UDJLbW1CK3U3?=
 =?utf-8?B?ZVoxZFBOUXNlRXdiS1doeHFvZENyQ1R3TTJqT003RkhlNi9XZHdNSHBBRUlP?=
 =?utf-8?B?Wk1KRmtGalR4T1ZrQVl4QWY4MG1CQlhUMkUrc2pXUVFpaGt4RmRmTlpWdmhl?=
 =?utf-8?B?LzlLYXBNZGdtcjl1dCt0OVl1b3llQmlDTGY4c3lRYUdzSkZCcVM3OXhXQVNu?=
 =?utf-8?B?YnNpZmh6SEJHYkc3Vzl4MEdwaGl1cGJlQTlyc3hDL0hEdzdpYzZ5Vzc3akhO?=
 =?utf-8?B?K21TQ0l2cTlTSG9vdENpaWxuc1RBeGFKc1hnTDlHdFhFdk81dWFtQnJhcFYx?=
 =?utf-8?B?OXdTZVMrT0tUdktuRGY2SVNHZHlvL1J4K3JMWmJkeHRid3NKdEFVZWduLytz?=
 =?utf-8?B?Q3dNWlNEbHBtdnRmaTBNVmZTaFhYdzA4dVZXVE5YV1FObEdqNmhtYVlQbWVV?=
 =?utf-8?B?MXMrKzdUQ2JpZW9nTEI1NS9Ddy90eXBDb2ZEd0Nla1U3Y3dZUGdVdGpJNXZT?=
 =?utf-8?B?SVBPblJTQ2V5WjBkRTVzMGtSeVFhUjRSS01ONHo1VEVoZVRHTnEwY3M5TXhL?=
 =?utf-8?B?NEREeWVUd3lJK0phMG42dDhrbUFpWVN2RjRqSUhNOHZkSjJQeEtiSE1TN2dE?=
 =?utf-8?B?S2JGcll2aytSZzlrUituYi95dWJsQzlMK2xKcVFnQVVnc0pzSWsxTm9TQld4?=
 =?utf-8?B?OTA1VGVYVlFsMThxWVY2Wkd0UzRlcnVORlhDd2FuZ0xrNm54UlBYM3dMNURK?=
 =?utf-8?B?bXJoQXRBUnhUVFdoT051SjhjajBGUEh2WmpyRG0wZ2FSckJ5NGx4Vkk2cHk5?=
 =?utf-8?B?c201cGNZV3RETUd0R1FiSGFGVC96a0s0RWRLRWsrYnFXNUVqb2JzNlJzK3Zn?=
 =?utf-8?B?aW5WcW1ocS9Jb295Y2UzdEh5dDdJb0pCNHQ3K0J3eXdLZnNqZ1dkdUk5RUZX?=
 =?utf-8?B?TlcvM3Y1UERmTCtTazJnZ2luQis1UHdQN2dpa2RURWE3eVdHN2cwa0lxUk9U?=
 =?utf-8?B?UXU0S0txczUwN0lGcmJCOVpVdzRDcVlkMXg2cGxybVFqOXRpMFlPS3Y3YXBC?=
 =?utf-8?B?Q0tsTUl6OVdSU2tsTFFCZ0pJaFFhWERxdER5aDcrRFp6c2psdUd1aDBZT3RX?=
 =?utf-8?B?d0pjYU9iZURqalFUdDh5TjNqdy92eDFlT3VoL1BIT2xEYk5BTmJvbUM5TFJv?=
 =?utf-8?B?NDRUbG9DSVBzMDY1bVVvUHV2K3hkMEk1YjN6UzdaZk5BSVhrc2lhLzFCREo4?=
 =?utf-8?B?d1VMczVWbnB2M2ttWEJDNXMrVTdwRmtyb1hoZjZmdlBrcDNZZWVIS3JPMXVn?=
 =?utf-8?B?amtLSlVtNmk0VmlxeEZMdi9kbWgzNkkvMWVtUWE0bDZqRnpTZUlaaDAxNkNF?=
 =?utf-8?B?ODBNZXJ5QTZLZlg3QlhUajBIVmhEUEVXOHA0Rkt6Q3gyRjBIbm8reTRCZWZu?=
 =?utf-8?B?d0lMNjNkdXFSZ01nN3kzQ2VTYW5kVGJ0Y3J2QzVCWG93NkhvOER6SzJZRkRV?=
 =?utf-8?B?YTZCdUdTcDZCMEVGL1k5ajRvdXROTWkzMWg2NlRoRkdkS3FqbUhIVUNKTFda?=
 =?utf-8?B?ckdrSkdJTjNGR0FuNGorVEEvRUFnZk5qZm1Bbll3ZFZmOUY4S2Y1dUJuQmpm?=
 =?utf-8?B?VE4wenFvVHd4TWNPQzdlQloyNmt3dlVYdFNaRXYxaHJWaFFrZ3FWZDlUSmh0?=
 =?utf-8?B?QWVhVFhyT3ZvaHN3M0NNMnFnUFhaTzhrcHE5T3lYVi96WXZUb2NHREJqOTMz?=
 =?utf-8?B?dGlyczZUSTZSQmY1OTQwR3M5MDlyR0ZmbnNoSVh6TW9uY1MwOU1uRDNnakVn?=
 =?utf-8?B?N01iUTVWSld1cEZzbzhsU29NdXBQRG9kd0VQdnZ2Q2NlRTdWTXphUHc4QlFw?=
 =?utf-8?B?TmZTampTYzFZUUFJbkE1TFNSb1NpODc4VTZCckwveklrK1B2RmxjZXJnb3FE?=
 =?utf-8?B?OE1yeXZDTGFKNDB0TjRpMEI2VThJMmdmRmVwY2lYcXJGNlJsbEdlUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa3a430-fae7-43db-5e88-08de9f87c50f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 09:24:20.8210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mju5NDVgo3LrGKBUBhgpyD6kxg2/NuZnMinwokgXJRyqcT49+E8u3kQpVW9QPVqp0ZX+UxgdMy9S0UGUrF9X9gMLvWzGe9YzRX+y+SvEzTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10820
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31450-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 2AB9C438C99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl1
IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gU2VudDogMjEgQXByaWwgMjAyNiAwNDoyMA0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkcm0vYnJpZGdlOiBpdGUtaXQ2MjYzOiBBZGQgc3Vz
cGVuZC9yZXN1bWUgc3VwcG9ydA0KPiANCj4gT24gTW9uLCBBcHIgMjAsIDIwMjYgYXQgMDY6MTU6
NDZBTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgTGl1IFlpbmcsDQo+IA0KPiBIaSBC
aWp1LA0KPiANCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9t
OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPg0KPiA+PiBTZW50OiAyMCBBcHJpbCAyMDI2
IDAzOjI2DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybS9icmlkZ2U6IGl0ZS1pdDYy
NjM6IEFkZCBzdXNwZW5kL3Jlc3VtZQ0KPiA+PiBzdXBwb3J0DQo+ID4+DQo+ID4+IE9uIEZyaSwg
QXByIDE3LCAyMDI2IGF0IDEwOjQ5OjM1QU0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4g
SGkgTGl1IFlpbmcsDQo+ID4+Pg0KPiA+Pj4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4+
Pg0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206
IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4+Pj4gU2VudDogMTcgQXByaWwgMjAy
NiAwNzowNQ0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybS9icmlkZ2U6IGl0ZS1p
dDYyNjM6IEFkZCBzdXNwZW5kL3Jlc3VtZQ0KPiA+Pj4+IHN1cHBvcnQNCj4gPj4+Pg0KPiA+Pj4+
IEhpIEJpanUsDQo+ID4+Pj4NCj4gPj4+PiBPbiBUaHUsIEFwciAxNiwgMjAyNiBhdCAwOToyOToy
NUFNICswMTAwLCBCaWp1IHdyb3RlOg0KPiA+Pj4+PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFp
bCBmcm9tIGJpanUuZGFzLmF1QGdtYWlsLmNvbS4gTGVhcm4gd2h5DQo+ID4+Pj4+IHRoaXMgaXMg
aW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlv
bg0KPiA+Pj4+PiBdDQo+ID4+Pj4+DQo+ID4+Pj4+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gPj4+Pj4NCj4gPj4+Pj4gT24gdGhlIFJaL0czTCBTTUFSQyBF
VksgdXNpbmcgUFNDSSwgc3VzcGVuZCB0byBSQU0gcG93ZXJzIGRvd24gdGhlDQo+ID4+Pj4+IElU
RQ0KPiA+Pj4+PiBJVDYyNjMgY2hpcC4gVGhlIGRpc3BsYXkgY29udHJvbGxlciBkcml2ZXIncyBz
eXN0ZW0gUE0gY2FsbGJhY2tzDQo+ID4+Pj4+IGludm9rZSBkcm1fbW9kZV9jb25maWdfaGVscGVy
X3tzdXNwZW5kLHJlc3VtZX0sIHdoaWNoIGluIHR1cm4gY2FsbA0KPiA+Pj4+PiB0aGUgYnJpZGdl
J3MgYXRvbWljX3tkaXNhYmxlLGVuYWJsZX0gY2FsbGJhY2tzIGNhbiBoYW5kbGUNCj4gPj4+Pj4g
c3VzcGVuZC9yZXN1bWUgZm9yIHRoZSBicmlkZ2Ugd2l0aG91dCBkZWRpY2F0ZWQgUE0gb3BzLg0K
PiA+Pj4+Pg0KPiA+Pj4+PiBJbnRyb2R1Y2UgaXQ2MjYzX2JyaWRnZV9pbml0KCkgYW5kIGl0NjI2
M19icmlkZ2VfdW5pbml0KCkgaGVscGVycw0KPiA+Pj4+PiB0byBjb25zb2xpZGF0ZSBwb3dlciBz
ZXF1ZW5jaW5nLCBoYXJkd2FyZSByZXNldCwgSTJDIGFkZHJlc3MNCj4gPj4+Pj4gc2V0dXAsIGFu
ZCBMVkRTL0hETUkgY29uZmlndXJhdGlvbi4gVGhlc2UgcmVwbGFjZSB0aGUgb3Blbi1jb2RlZA0K
PiA+Pj4+PiBpbml0IHNlcXVlbmNlIGluDQo+ID4+Pj4+IHByb2JlKCkgYW5kIGFyZSBob29rZWQg
aW50byBhdG9taWNfZW5hYmxlL2F0b21pY19kaXNhYmxlDQo+ID4+Pj4+IHJlc3BlY3RpdmVseSwg
Z3VhcmRlZCBieSBhIHBvd2VyZWQgZmxhZyB0byBhdm9pZCByZWR1bmRhbnQgcmUtaW5pdGlhbGlz
YXRpb24uDQo+ID4+Pj4+DQo+ID4+Pj4+IFN3aXRjaCBmcm9tIGRldm1fcmVndWxhdG9yX2J1bGtf
Z2V0X2VuYWJsZSgpIHRvDQo+ID4+Pj4+IGRldm1fcmVndWxhdG9yX2J1bGtfZ2V0KCkgc28gdGhh
dCByZWd1bGF0b3JzIGNhbiBiZSBleHBsaWNpdGx5DQo+ID4+Pj4+IGVuYWJsZWQgYW5kIGRpc2Fi
bGVkIGFjcm9zcyBwb3dlciBjeWNsZXMuIE1vdmUgcmVzZXRfZ3BpbyBhbmQNCj4gPj4+Pj4gcmVn
dWxhdG9yIHN0YXRlIGludG8gdGhlIGl0NjI2MyBzdHJ1Y3Qgc28gdGhleSBhcmUgYWNjZXNzaWJs
ZSBiZXlvbmQgcHJvYmUgdGltZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gQWRkIGEgcmVtb3ZlKCkgY2Fs
bGJhY2sgdG8gY2xlYW5seSBwb3dlciBkb3duIHRoZSBicmlkZ2Ugb24gZHJpdmVyDQo+ID4+Pj4+
IHVuYmluZCB2aWEgaXQ2MjYzX2JyaWRnZV91bmluaXQoKS4NCj4gPj4+Pj4NCj4gPj4+Pj4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4+
PiAtLS0NCj4gPj4+Pj4gdjEtPnYyOg0KPiA+Pj4+PiAgKiBEcm9wcGVkIHN5c3RlbSBQTSBjYWxs
YmFja3MgaW5zdGVhZCB1c2luZyBicmlkZ2Uncw0KPiA+Pj4+PiAgICBhdG9taWNfe2Rpc2FibGUs
ZW5hYmxlfSBjYWxsYmFja3MgdG8gaGFuZGxlIHN1c3BlbmQvcmVzdW1lLg0KPiA+Pj4+PiAtLS0N
Cj4gPj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjI2My5jIHwgODgNCj4gPj4+
Pj4gKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gPj4+Pj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3MyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gWy4uLl0NCj4g
Pj4NCj4gPj4+Pj4gK3N0YXRpYyBpbnQgaXQ2MjYzX2JyaWRnZV9pbml0KHN0cnVjdCBpdDYyNjMg
Kml0KSB7DQo+ID4+Pj4+ICsgICAgICAgaW50IHJldDsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArICAg
ICAgIHJldCA9IHJlZ3VsYXRvcl9idWxrX2VuYWJsZShpdC0+bnVtX3N1cHBsaWVzLCBpdC0+c3Vw
cGxpZXMpOw0KPiA+Pj4+PiArICAgICAgIGlmIChyZXQpIHsNCj4gPj4+Pj4gKyAgICAgICAgICAg
ICAgIGRldl9lcnIoaXQtPmRldiwgImZhaWxlZCB0byBlbmFibGUgcG93ZXIgc3VwcGxpZXNcbiIp
Ow0KPiA+Pj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPj4+Pj4gKyAgICAgICB9
DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgICAgICBpdDYyNjNfaHdfcmVzZXQoaXQtPnJlc2V0X2dw
aW8pOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgICAgcmV0ID0gaXQ2MjYzX2x2ZHNfc2V0X2ky
Y19hZGRyKGl0KTsNCj4gPj4+Pj4gKyAgICAgICBpZiAocmV0KSB7DQo+ID4+Pj4+ICsgICAgICAg
ICAgICAgICBkZXZfZXJyKGl0LT5kZXYsICJmYWlsZWQgdG8gc2V0IEkyQyBhZGRyXG4iKTsNCj4g
Pj4+Pj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvcl9idWxrX2Rpc2FibGUoaXQtPm51bV9zdXBw
bGllcywNCj4gPj4+Pj4gKyBpdC0+c3VwcGxpZXMpOw0KPiA+Pj4+DQo+ID4+Pj4gSSBrbm93IHRo
YXQgeW91IGNhbGwgaXQ2MjYzX2JyaWRnZV9pbml0KCkgaW4gcHJvYmUsIHByb2JhYmx5DQo+ID4+
Pj4gYmVjYXVzZSB5b3Ugd2FudCB0byBlbmFibGUgdGhlIHJlZ3VsYXRvcnMgZm9yIGhvdHBsdWcg
ZGV0ZWN0IGFmdGVyDQo+ID4+Pj4gcHJvYmUoaXQ2MjYzX2RldGVjdCgpIHJlYWRzIHJlZ2lzdGVy
DQo+ID4+IEhETUlfUkVHX1NZU19TVEFUVVMgdG8gZG8gdGhlIGRldGVjdGlvbikuDQo+ID4+Pj4g
SG93ZXZlciwgYW4gaWRlYVsxXSBpcyB0byB3cmFwIHRoZSByZWdpc3RlciByZWFkIG9wZXJhdGlv
biB3aXRoDQo+ID4+Pj4gcmVndWxhdG9yX2J1bGtfZW5hYmxlKCkgYW5kDQo+ID4+Pj4gcmVndWxh
dG9yX2J1bGtfZGlzYWJsZSgpIGluIGl0NjI2M19kZXRlY3QoKSBzbyB0aGF0IHlvdSBtYXkgZHJv
cA0KPiA+Pj4+IGl0NjI2M19icmlkZ2VfaW5pdCgpIGZyb20gcHJvYmUuICBXaXRoIHRoYXQsICBp
dDYyNjNfYnJpZGdlX2luaXQoKQ0KPiA+Pj4+IGlzIG5vdyBvbmx5IGNhbGxlZCBmcm9tIGF0b21p
Y19lbmFibGUsIHdoaWNoIG1lYW5zIHRoYXQgdGhlDQo+ID4+Pj4gaW5pdGlhbGl6YXRpb24gY29k
ZSBjYW4gYmUgb3Blbi1jb2RlZCBhbmQgdGhlIGluaXRpYWxpemF0aW9uIGlzDQo+ID4+Pj4gc3Vw
cG9zZWQgdG8gYmUgc3VjY2Vzc2Z1bChkdWUgdG8gdGhlICJhdG9taWMiIG5hdHVyZSkgaGVuY2Ug
bm8gbmVlZA0KPiA+Pj4+IHRvIGRvIHRoZSByZWd1bGF0b3IgZGlzYWJsZW1lbnQNCj4gPj4gYmFp
bG91dChlcnJvciBtZXNzYWdlIGluIGRtZXNnIGlzIHN1ZmZpY2llbnQpLg0KPiA+Pj4NCj4gPj4+
IGl0NjI2M19kZXRlY3QoKSBzdGlsbCB3b3JrcyB3aXRoIHJlZ3VsYXRvcl9kaXNhYmxlKCksIHNl
ZSB0aGUgbG9ncyBiZWxvdy4NCj4gPj4NCj4gPj4gSSBndWVzcyB0aGF0IGl0IHdvcmtzIGZvciB5
b3Ugb24gUlovRzNMIFNNQVJDIEVWSyBiZWNhdXNlIHJlZ3VsYXRvcnMNCj4gPj4gYXJlIGFscmVh
ZHkgZW5hYmxlZCBieSBQU0NJIGJlZm9yZSB0aGlzIGRyaXZlcidzIHByb2JlLg0KPiA+DQo+ID4g
UFNDSSBkb2VzIG5vdCBlbmFibGUgaXQuIFRoZSBzdXBwbHkgdG8gdGhlIHJhaWxzIHByb3ZpZGVk
IGJ5IFBNSUMNCj4gPiByZWd1bGF0b3IgZHVyaW5nIHN5c3RlbSByZXN1bWUgYW5kIGl0IGlzIGFs
d2F5cyBvbi4NCj4gDQo+IFRoZW4gdGhlIFBTQ0kgdGVybSBpbiBjb21taXQgbWVzc2FnZSBkb2Vz
bid0IHByb3ZpZGUgYW55IHVzZWZ1bCBpbmZvcm1hdGlvbiwgc28gY291bGQgYmUgZHJvcHBlZC4N
Cg0KT0sgd2lsbCBkcm9wICd1c2luZyBQU0NJJy4NCg0KPiANCj4gU2luY2UgaXQncyBhbHdheXMg
b24sIGNhbiB5b3Uga2VlcCB1c2luZyBkZXZtX3JlZ3VsYXRvcl9idWxrX2dldF9lbmFibGUoKSBp
biBwcm9iZSBhbmQganVzdCBtb3ZlDQo+IGl0NjI2M19od19yZXNldCgpLCBpdDYyNjNfbHZkc19z
ZXRfaTJjX2FkZHIoKSwNCj4gaXQ2MjYzX2x2ZHNfY29uZmlnKCkgYW5kIGl0NjI2M19oZG1pX2Nv
bmZpZygpIGZyb20gcHJvYmUgdG8gYXRvbWljX2VuYWJsZT8NCg0KQWdyZWVkLg0KDQo+IA0KPiA+
DQo+ID4+IEJ1dCB0aGVyZSBjb3VsZCBiZSBwbGF0Zm9ybXMgd2hpY2ggdXNlIGRlZGljYXRlZCBy
ZWd1bGF0b3JzKGxpa2UNCj4gPj4gZGlzY3JldGUgUE1JQ3MpIGZvciBJVDYyNjMsIHdoaWNoIG1l
YW5zIHRoZSByZWd1bGF0b3JzIGFyZSBub3QgeWV0IGVuYWJsZWQgYmVmb3JlIHByb2JlLg0KPiA+
DQo+ID4gRG8geW91IGtub3cgYW55IHBsYXRmb3JtIHRoYXQgZG9lcyBub3Qgd29yayB0aGUgZGV0
ZWN0aW9uIGFmdGVyIHJlZ3VsYXRvciBkaXNhYmxlKCk/DQo+IA0KPiBOby4gIEJ1dCBpZiByZWd1
bGF0b3JzIGFyZSBub3QgZW5hYmxlZCwgZGV0ZWN0aW9uIGRvZXNuJ3Qgd29yayBmb3Igc3VyZS4N
Cj4gDQo+ID4NCj4gPiBDdXJyZW50bHkgd2UgZG9uJ3QgaGF2ZSBhbnkgcGxhdGZvcm1zIHRvIHRl
c3QgdGhpcy4gSWYgYW55IHBsYXRmb3Jtcw0KPiA+IHRoYXQgaGFzIGNvbnRyb2xsZWQgcmVndWxh
dG9yIHdlIGNhbiB1cGRhdGUgdGhlIGNvZGUgYmFzZWQgb24gdGVzdGluZy4NCj4gDQo+IElmIHdl
IGVuZCB1cCB3aXRoIGNhbGxpbmcgcmVndWxhdG9yX2J1bGtfZW5hYmxlKCkgaW4gYXRvbWljX2Vu
YWJsZSBhbmQgY2FsbGluZyByZWd1bGF0b3JfYnVsa19kaXNhYmxlDQo+IGluIGF0b21pY19kaXNh
YmxlLCBJJ2QgcHJlZmVyIHRvIGVuYWJsZS9kaXNhYmxlIHJlZ3VsYXRvcnMgaW4gZGV0ZWN0IGFu
ZCBlZGlkX3JlYWQgaW5zdGVhZCBvZiBkb2luZw0KPiBub3RoaW5nLCBiZWNhdXNlIGRldGVjdCBh
bmQgZWRpZF9yZWFkIHdvdWxkIG5vdCB3b3JrIGZvciBzdXJlIHdpdGhvdXQgcG93ZXIgb24gdGhv
c2UgcGxhdGZvcm1zIHdpdGgNCj4gY29udHJvbGxlZCByZWd1bGF0b3JzLiAgSWYgdGhlcmUgaXMg
YW55IGJ1Zywgd2UgY2FuIGZpeCB0aGF0Lg0KDQpQbGFuIGlzIHRvIGRvIHJlZ3VsYXRvcl9lbmFi
bGUoKSBpbiBwcm9iZS4gSSB3aWxsIHNlbmQgbmV4dCB2ZXJzaW9uIGJhc2VkIG9uIHRoZSBhYm92
ZSBkaXNjdXNzaW9uLg0KDQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4+Pj4gIHN0YXRpYyB2b2lkIGl0
NjI2M19icmlkZ2VfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4g
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJt
X2F0b21pY19zdGF0ZQ0KPiA+Pj4+PiAqc3RhdGUpICB7IEBAIC01ODcsNiArNjI2LDggQEAgc3Rh
dGljIHZvaWQNCj4gPj4+Pj4gaXQ2MjYzX2JyaWRnZV9hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJt
X2JyaWRnZSAqYnJpZGdlLA0KPiA+Pj4+PiAgICAgICAgIHJlZ21hcF93cml0ZShpdC0+aGRtaV9y
ZWdtYXAsIEhETUlfUkVHX1BLVF9HRU5FUkFMX0NUUkwsIDApOw0KPiA+Pj4+PiAgICAgICAgIHJl
Z21hcF93cml0ZShpdC0+aGRtaV9yZWdtYXAsIEhETUlfUkVHX0FGRV9EUlZfQ1RSTCwNCj4gPj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgQUZFX0RSVl9SU1QgfCBBRkVfRFJWX1BXRCk7DQo+ID4+
Pj4+ICsNCj4gPj4+Pj4gKyAgICAgICBpdDYyNjNfYnJpZGdlX3VuaW5pdChpdCk7DQo+ID4+Pj4N
Cj4gPj4+PiBXZWxsLCB0aGlzIGNvdWxkIGVmZmVjdGl2ZWx5IGRpc2FibGUgdGhlIHJlZ3VsYXRv
cnMgYW5kIGhvdHBsdWcgZGV0ZWN0aW9uDQo+ID4+Pj4gd29uJ3Qgd29yayB0aGVuLiAgIFNvLCBh
Z2FpbiwgdGhlIGFib3ZlIGlkZWFbMV0gaGVscHMuDQo+ID4+Pg0KPiA+Pj4gSXMgaXQgbm90IHdv
cmtpbmcgb24geW91ciBzZXR1cD8gSXQgd29ya3MgZm9yIG1lLg0KPiA+Pg0KPiA+PiBNeSBzZXR1
cCB1c2VzIGFsd2F5cy1vbiByZWd1bGF0b3JzLCBzbyBkZXRlY3Qgd29ya3MgZm9yIG1lIGFzIHdl
bGwNCj4gPj4gZXZlbiBpZiByZWd1bGF0b3JzIGFyZSBub3QgZXhwbGljaXRseSBlbmFibGVkL2Rp
c2FibGVkIGluIGRldGVjdA0KPiA+PiBjYWxsYmFjay4gIEJ1dCwgYXMgSSBtZW50aW9uZWQgYWJv
dmUsIHdlIG5lZWQgdG8gZW5hYmxlL2Rpc2FibGUNCj4gPj4gcmVndWxhdG9ycyBpbiBkZXRlY3Qg
Y2FsbGJhY2sgKGFsc28gaW4gZWRpZF9yZWFkIGNhbGxiYWNrKSBhZnRlciBhdG9taWNfZGlzYWJs
ZSBpcyBkb25lIGZvciB0aG9zZQ0KPiBwbGF0Zm9ybXMgd2hpY2ggdXNlIGRlZGljYXRlZCByZWd1
bGF0b3JzLg0KPiA+DQo+ID4gT24gYXRvbWljX2Rpc2FibGUoKSwgd2UgYXJlIGRpc2FibGluZyB0
aGUgcmVndWxhdG9yLiBTbyBvbiwNCj4gPiByZWd1bGF0b3ItZ3BpbyBwbGF0Zm9ybXMsIHRoZSBk
ZXRlY3Rpb24oKSB3b24ndCB3b3JrIGFmdGVyIHRoYXQuIEluDQo+ID4gdGhhdCBjYXNlLCB3ZSBu
ZWVkIHRvIG1vdmUgc3VzcGVuZC9yZXN1bWUgY2FsbHMgZnJvbSBhdG9taWNfe2VuYWJsZSxkaXNh
YmxlfSB0byBQTSBjYWxsYmFja3MuDQo+ID4NCj4gPiBEbyB5b3UgYWdyZWU/DQo+IA0KPiBJZiB5
b3UgbWVhbiBzeXN0ZW0gUE0gY2FsbGJhY2tzLCBhcmUgeW91IHN1cmUgdGhhdCB0aGlzIGRyaXZl
cidzIHJlc3VtZSBjYWxsYmFjayBpcyBleGVjdXRlZCBwcmlvciB0byBhDQo+IGRpc3BsYXkgY29u
dHJvbGxlciBkcml2ZXIncyByZXN1bWUgY2FsbGJhY2sgKGVzc2VudGlhbGx5IGRybV9tb2RlX2Nv
bmZpZ19oZWxwZXJfcmVzdW1lKCkgd291bGQgYmUNCj4gY2FsbGVkIHRvIGVuYWJsZSBJVDYyNjMn
cyB2aWRlbyBvdXRwdXQgaWYgaXQncyB0aGUgc3RhdHVzIHdoZW4gc3VzcGVuZGVkKSB0byBlbmFi
bGUgcmVndWxhdG9ycyBmaXJzdD8NCg0KTWF5YmUgcmVnaXN0ZXIgUE0gQ2FsbGJhY2sgTEFURV9T
WVNURU1fU0xFRVBfUE1fT1BTIG9yIE5PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMgZm9yIHRoaXMg
ZHJpdmVyDQp3aGVuIHdlIGhhdmUgYSB1c2UgY2FzZSByZWxhdGVkIHRvIGNvbnRyb2xsZWQgcmVn
dWxhdG9yLiBUaGlzIGFsc28gZGVwZW5kcyBvbiBpMmMvcGluY3RybCBkcml2ZXIgUE0gY2FsbGJh
Y2sNCmFzIHdlbGwodGhleSBuZWVkIHRvIGJlIE5PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMpLg0K
DQo+IEkgZG9uJ3QgdGhpbmsgdGhlIG9yZGVyIGlzIGZpeGVkIGFjcm9zcyBhbGwgcGxhdGZvcm1z
LCBiZWNhdXNlIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgZGV2aWNlIGNhbiBzaXQNCj4gYmVmb3Jl
IG9yIGFmdGVyIHRoZSBJVDYyNjMgZGV2aWNlIG9uIHRoZSBkcG1fbGlzdC4NCj4gU28sIEkgZG9u
J3Qgd2FudCB0byBpbXBsZW1lbnQgc3lzdGVtIFBNIGZvciB0aGlzIGRyaXZlciwgYXQgbGVhc3Qg
Zm9yIG5vdy4NCg0KT0suDQoNCkNoZWVycywNCkJpanUNCg0KDQo=

