Return-Path: <linux-renesas-soc+bounces-32851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEFpKl1vDWp9xQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:22:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352B589AA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C07E3069B47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 08:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021CA3B52F4;
	Wed, 20 May 2026 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GEYuL1oa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA213B52EF;
	Wed, 20 May 2026 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264942; cv=fail; b=RaMZ64dVg2RBMIpIZcUDL2xxcmYoc3lk9K1+I1Ul+QJQ/cRWYZXC23cx/N4E0NXHmotaBcqK6N6cpYNCXOFsZK89Dh8ahUGABa2UXqd1sIue2rQQoWMY8uNcTpBHdaxyk1UVqNQuYQ72AM5crpXItMkNVJJb7ddier+cMWNjIpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264942; c=relaxed/simple;
	bh=MXTQb1EB4xkKk3bJTLWEFM6QtZkscOqVyAY9XgxivLU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d+EurUeJvDE+8G6oALduDkijuSW14FGNTQuwMmqRVaDxmR19NRb1E3rsr5OpvBpNH20zGAk+hTbkHgpIsbmHBhq7ev8spTjS3LY3LlbQ3qpQv5qz+zWHXRDw0c/ays9DX/Kt0HSo4PXiV2PHBXenGxxyrOl2mQTmVnXxobEDpyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GEYuL1oa; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZErUcYlaZYGy4Vg1Lxvgpo12zLlXZsWT/nJ/u2uHY8mq4PQtX1QxG8YLDq1RAcrpz9pztry7OsTlUXjrbNbe6A3oXV/iOKrKbW7RQ/WzMOCUWLEJbK32neSrbslp3JYyvWIX5DOPD/a2mu1LYrPwDp2zJF8AhuNeRcYXp6OsGvm4j2hXUM4EQAqpLOlsuZAHpB9O224rIYkxBWuB/2eC8PimV9id6ycbdZGeY5pM9sVCcHOPd3N+gOkCC9g6grzw/AZCU76jcS1mBGzmoYITXbqQrBR5CGtwT5+yn/4CIv0mM6K3KfZs9q+ct3sHYMUwHZEhKczdd6UgT7hGc8BnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXTQb1EB4xkKk3bJTLWEFM6QtZkscOqVyAY9XgxivLU=;
 b=hxPSRYXs2uj9/drruE9emBdRwiGZXct64+y7pcxR9rpxDsRVPgk0Tu6+IJcAymo0RG+8HesgtHgG6vsM4e4cPxMgncJIWYAp48KMgF74TgxjnYhEyw3HxDxX/RsBuVo0dZi5kaIOCI7032kISMDeI413jh2enGDEqdZz02Eo7cJCx9cBaOO//8Im7IwUTPWeF1wZm4wJGMI0FrGtXgUbT5/WdQn3iFt01QBBbbaIhYHghVuljY/eAxbHiMUa/4w5GPmhmDT5P3HuP2J+Gor7152toV153tZzqObid56jkgBZvBLKw6WfIdVLHnLTowSgkcFtrr6/whSkADHIcytsfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXTQb1EB4xkKk3bJTLWEFM6QtZkscOqVyAY9XgxivLU=;
 b=GEYuL1oaG7Rt1rrZoXBMvsHeWyZU79VXQ12h8YQkyARog3SLb0fPsmdUi+a4YwsisgdVtQM5zZ+fMCOIAjTFMnNWxqeeXc6aS44k83sTAGL4g3wsA/hjQhzCqQpVqjQ/80DJNAbzFzV+C2/aOGqTkJcA9NJLlatMDMuqKFQ5YLo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13519.jpnprd01.prod.outlook.com (2603:1096:604:32e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 08:15:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 08:15:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-SoC clock limits
Thread-Topic: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-SoC clock limits
Thread-Index: AQHc56nK9BJ9tFiG1kiCI4Ue74glYbYWZP+AgAAs2YCAAABF4A==
Date: Wed, 20 May 2026 08:15:37 +0000
Message-ID:
 <TY3PR01MB11346028C0876AA344758AABA86012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260519160825.4082566-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346AD5B7CDBB72EC8FEA16686012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8uReGLazx5xPfCG+EfSeT_zDy-xfq8Et2pEkmgOKT+8QA@mail.gmail.com>
In-Reply-To:
 <CA+V-a8uReGLazx5xPfCG+EfSeT_zDy-xfq8Et2pEkmgOKT+8QA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13519:EE_
x-ms-office365-filtering-correlation-id: 676c3cc2-356c-4db3-24d7-08deb647f967
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|4143699003|22082099003|18002099003|38070700021|3023799007|11063799006|56012099003|5023799004;
x-microsoft-antispam-message-info:
 WOjmq4repdUTcE2D+2rCBJap/DJCQTGmw99Mq+D0MYEfa1+p5aSXIJla7bUN4YGcEpgx56sTC0XrfY3CNWxkIvSsC2nY0PBs/3xpx/499fWDvZIJX3Nse0DsSNLmhqHGYhJN3oyVFtpSnvtm+Yvxm2/z81nZkjpB0NWYF2cWNeYS/mKRGzM/CQEA+u6c39FJLw405Qo286fYs5QQ+pIF9BXiseFJD8LkMWR0/f+42ldfWIPFT8w16qvrRG3Co4aCcyEn1mCS51Ad0QF6HrVMF33QGhSVgdp/k4Mik4i64wO1+9CV6M9CMkCbxEv3TZuBOTcpMMWNhxXL8mrwogFUdmw9hr3cR0sE7mOXRWeu8AAVj8P1yhJS9XOD7rbN8hNztDKEDRI/imyfNO2wMootsecvCUHtqIl30JdnfLmONy2L2VcFswjBvQkKbYETaDky3lLLVnxFZu/xftypf8PP96atcXgcIMmMmVEWZJyaJOXV/+aY601iiSdYjcOgZOiMSREBX5098kyh4GSUtPR2vPZYhvHgq0IQ1+YRfSMI/CrWudqJqc2fFSqK1UcFO0cpwgUAE3fdNNPJGA5VLdqOMQu8YD7mzJHPsu1sNsH5/SATR3ReECaKxitbdxcAn7XRnSgRhRq7/wXTWHdjCYUiNSOyWV1isJzFhBNiW6s/TvWxysrSTiqlYnwQQu6n9qqVRwzq01u5/3Q4m79PhHvaBBY9yU76UTYOPZzEsOXYUdyLG8n/O4HfQcjeLdGkXHiF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(4143699003)(22082099003)(18002099003)(38070700021)(3023799007)(11063799006)(56012099003)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azRqVzF0bHJ2cGp1UkJwSFNRN3FiM1l0bmpyRWxsdHNwYzA4OEZ0QlNidnIv?=
 =?utf-8?B?ditNcWo5MjhaZ0tkQncwN1JJajdGYWVGTXFob3E2UEM2NVBtS1dzZC8wNVdZ?=
 =?utf-8?B?TTFZL2p3aEtONlV3VERIdTFQMXhhWXBySktmR2RDdkc2SlllNkh3TXdUZ2Iy?=
 =?utf-8?B?bjU0d00zbkdWNXQvdHltMWZaeGlpL0dLT3p2b3ZrS0NiR0dRZHEyNU5BMERp?=
 =?utf-8?B?OFovbVlobWx4ZlZQdVgrUWl6RzVyUjZxZ2t0dlNEcS9xZEJIZGZjeWdodCtS?=
 =?utf-8?B?bTF2TmFHcHd4dWN0YytnU2xoeXEzemt3Q0NYRW9DQkRVT3R5M0VvcVdpR2Zw?=
 =?utf-8?B?N09NbkQ0YjRGQ09nYllxc1dzT0Nvc0dKWDg1cEIvMTNpaVFCN3hVN1RKbFhR?=
 =?utf-8?B?aFdRUjNEbHNXUmxWSnlLUkRJVU5palpIbWFqYS80K3JBUWtIaURUc1oyNFdt?=
 =?utf-8?B?V2xQY1JVQnhuK0tPZ08vbC9FZldramgyaTRhMDRORmZ1bW5ubmRVWlphaGhv?=
 =?utf-8?B?ZHN6Q3BSUWRQang2bDdrU0laNitvVThPRFpscDR0V3V5T3FvN1VmaDM2MVNn?=
 =?utf-8?B?Ly9QbFcyZGtUcFYzK25jM3JWU0lxZWY0YWphMmY4d0dub2VXR21MZ0xwZkxq?=
 =?utf-8?B?WnUvR1ZDYjlGS1JxaWNYVEtucmNYVmgxcVJ1bUVtNFJWVHpQWWVoNmREdXF6?=
 =?utf-8?B?OHgyYW8rSHFWK3MzWW1zc1hsK1d2ZjN1MnhGV3dha3l5YnB5M3R3aGRiTGpY?=
 =?utf-8?B?eXBJL1lTWWpnOGRzVUtLM1M2dkJ5QjFVM0tRSXBBcXJtaDg4WTFiYTNQbjJB?=
 =?utf-8?B?U0NmcTZxSVhPZU4zdUhnZjhHMElJaFBaN3JNSEVGT1JxRWlkRUlyZ3ZFYVY0?=
 =?utf-8?B?ZnBaVHZCWWpwMDJZZEhFanpIZ0I4WDZvMkxncms0TmV3Z3QvUkVtSVE5cFJh?=
 =?utf-8?B?OHlpRDZUSGp6Qngra2pESDNPT3BFZlJRdUcyQStYeHFmREh5RUxTQW5CbExR?=
 =?utf-8?B?NlZ1TjVGMEd5dkhZN0dHVHlCc0xMY2ZnZHdZeW5Tc1JPdGtyVTRpcTNTY0lm?=
 =?utf-8?B?U2J2aHNxV0lkTkFYUWVFZFlvN0FETEZ4NHBVR1NtdzNUSGFDMWg0ek5Va3dl?=
 =?utf-8?B?dnRzRXRTenZGMDN6Uko2d2ovKy8vMkJiajB1TzBlT0trMUhzVkUwWEVnQ01E?=
 =?utf-8?B?MEpwTFRpVUp5N3Vza2JqK0x2TUluL1NCdysxNFhXa01YVGtSYVF5VUFwaXda?=
 =?utf-8?B?cEp2QXVJS0FuTHhISXJkcFVJdlladkcvTkxmRFhELzhVNDQwTCsyRG1EaytK?=
 =?utf-8?B?K1l4M3QvdGF4dVRnaHhkS3pna0ZKdzlzNkJxRW9PZWZYY2I1d1EvRkRFRzNM?=
 =?utf-8?B?OXBxRm5qa0sreHVwbmlOZWVQSWJCNmNxZlQ5dVhsZkhUYzlrVjdHZG1aUFox?=
 =?utf-8?B?aVBsZ0krbzl4MXhiOXpzZFd5eVZWLys3U1RYdSs2MFJWQiswenh2STVOQllx?=
 =?utf-8?B?T3N0MGdZTU15b1RJOVlUL2ozL0MyV2tVL3FXSldCTGRWVDhYQTVpNHZjSno5?=
 =?utf-8?B?UnlPa3ZGMVVBMldyNjF3TWNGUHJmRUJPOW41bi9HQm0xbkplMFFlNW9Lc0Jw?=
 =?utf-8?B?T2V4c2ZmRElYdmc3RlAwcHQrQ3dwR3BZeWVySGNHOFp4NnFKMTVnb3NNS3dx?=
 =?utf-8?B?cktQWDYwdjNWQSs3TnZ5dzhhRHhNZzVqWjZ2VTNRY29MVHQ4djRPd01TUnB6?=
 =?utf-8?B?S1VGazFJek5yTjNVRWJTSVZ5VS9KVkFuQ3NLckxQRnZzNU5ZdFF1OVhyUHV0?=
 =?utf-8?B?NXo3TVYwdnRma1lVT3JoZ1lvUFFUL2tiWWFrdWFWdi9VdnFIS2dRTXlkaFF4?=
 =?utf-8?B?ZEkreGQ2S0JaekJNWkZFMnNnbXdvdzBYM2ZwUHc2M0N1OFR5SE1UUzU2b3By?=
 =?utf-8?B?MUZMM0IrdEp1SUdnQmRwcVM1ZG53d1B3V1ZMS1lrNnZ3SHpUTWJ4SnhhU2Nk?=
 =?utf-8?B?eEZINFltRDZnT0hhNlpJTVVhdHI4QmJMcHdMQW1sMFB4VWM2THMxdk8xRldG?=
 =?utf-8?B?YWIvY3FpSnNadHNtanVFeXhNL0FWS3JGTnRNRERjcjNKM2IxbllHeitUU0tN?=
 =?utf-8?B?MVhLckRQbUoxaWd5bDRwN0V4cWo3K3FGc0JGc00wL3Iyb2wrSnRqUk5qQmlF?=
 =?utf-8?B?aEk4M0tEUGhsTVlwRjdndXBkWk1xTWJ1UmVWNHc3aS80WG5yenRIeHRRTXFk?=
 =?utf-8?B?bnZqQkppRVcxRHhUMU9ibTk4N2tDTXRYb0Y4blRZODVxZzdMRWx0WElwTXFX?=
 =?utf-8?B?UHJoZlZ4enJWc3VVSTl2MXNxRmlZQWpxT3RsUjNJSE5Zd0V0bWdLUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 676c3cc2-356c-4db3-24d7-08deb647f967
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 08:15:37.6236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vMvG3udDioeUcupqXFPitB9Q4WRbnUgxx4u069KeBLRaFcQwm1ufJjjiGPz4H1eNQXzJHnOonQkNMTf1zW5sjiczfr7VkLwSIFdbnFzNyU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13519
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32851-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6352B589AA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMjAgTWF5
IDIwMjYgMDk6MTQNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA0LzVdIGRybTogcmVuZXNhczog
cnotZHU6IE1vdmUgbW9kZV92YWxpZCBsb2dpYyB0byBwZXItU29DIGNsb2NrIGxpbWl0cw0KPiAN
Cj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCj4gDQo+IE9uIFdl
ZCwgTWF5IDIwLCAyMDI2IGF0IDY6MzbigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgUHJhYmhha2FyLA0KPiA+DQo+ID4gVGhhbmtz
IGZvciB0aGUgcGF0Y2guDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+ID4g
U2VudDogMTkgTWF5IDIwMjYgMTc6MDgNCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2NCA0LzVdIGRy
bTogcmVuZXNhczogcnotZHU6IE1vdmUgbW9kZV92YWxpZCBsb2dpYw0KPiA+ID4gdG8gcGVyLVNv
QyBjbG9jayBsaW1pdHMNCj4gPiA+DQo+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFr
YXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gTW92ZSBwaXhl
bCBjbG9jayB2YWxpZGF0aW9uIGZyb20gYSBmaXhlZCBlbmNvZGVyIGNoZWNrIHRvIHBlciBTb0MN
Cj4gPiA+IGNvbnN0cmFpbnRzIHN0b3JlZCBpbiByemcybF9kdV9kZXZpY2VfaW5mby4NCj4gPiA+
DQo+ID4gPiBQaXhlbCBjbG9jayBsaW1pdHMgZGlmZmVyIGFjcm9zcyBTb0NzIGluIHRoZSBSWiBE
VSBmYW1pbHkgYW5kIGNhbm5vdA0KPiA+ID4gYmUgZXhwcmVzc2VkIGJ5IGEgc2luZ2xlIHNoYXJl
ZCBydWxlLiBGb3IgZXhhbXBsZSwgUlovRzJVTCBhbmQNCj4gPiA+IFJaL0cyTCBsaW1pdCB0aGUg
RFBBRDAgcGl4ZWwgY2xvY2sgdG8gYSBuYXJyb3cgd2luZG93LCB3aGlsZSBvdGhlciBTb0NzIHN1
Y2ggYXMgUlovVDJIIHJlcXVpcmUgYQ0KPiB3aWRlciBvcGVyYXRpbmcgcmFuZ2UuDQo+ID4gPg0K
PiA+ID4gQWRkIG1vZGVfY2xvY2tfbWluIGFuZCBtb2RlX2Nsb2NrX21heCBmaWVsZHMgdG8gcnpn
MmxfZHVfZGV2aWNlX2luZm8NCj4gPiA+IHRvIGRlc2NyaWJlIHRoZSBzdXBwb3J0ZWQgcGl4ZWwg
Y2xvY2sgcmFuZ2UgZm9yIGVhY2ggU29DLiBVcGRhdGUNCj4gPiA+IHJ6ZzJsX2R1X2VuY29kZXJf
bW9kZV92YWxpZCgpIHRvIGNoZWNrIHRoZXNlIGJvdW5kcyB3aGVuIGV2YWx1YXRpbmcNCj4gPiA+
IERQQUQwIG91dHB1dHMsIHJldHVybmluZyBNT0RFX0NMT0NLX0xPVyB3aGVuIHRoZSBwaXhlbCBj
bG9jayBmYWxscw0KPiA+ID4gYmVsb3cgbW9kZV9jbG9ja19taW4gYW5kIE1PREVfQ0xPQ0tfSElH
SCB3aGVuIGl0IGV4Y2VlZHMgbW9kZV9jbG9ja19tYXguDQo+ID4gPg0KPiA+ID4gUG9wdWxhdGUg
dGhlIHBpeGVsIGNsb2NrIGxpbWl0cyBmb3IgYm90aCB0aGUgUlovRzJVTCAoUjlBMDdHMDQzVSkN
Cj4gPiA+IGFuZCBSWi9HMkwgKFI5QTA3RzA0NCkgdmFyaWFudHMgdG8gYSBtaW5pbXVtIG9mIDIw
ODc1IGtIeiBhbmQgYQ0KPiA+ID4gbWF4aW11bSBvZg0KPiA+ID4gODM1MDAga0h6Lg0KPiA+ID4N
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXINCj4gPiA+IDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IHYzLT52NDoNCj4g
PiA+IC0gRHJvcHBlZCBwZXIgcGFkIGxpbWl0cw0KPiA+ID4gLSBVcGRhdGVkIGNvbW1pdCBtZXNz
YWdlIHRvIHJlZmxlY3QgdGhlIGNoYW5nZSBpbiBhcHByb2FjaC4NCj4gPiA+DQo+ID4gPiB2Mi0+
djM6DQo+ID4gPiAtIE1vdmVkIGNsb2NrIGxpbWl0cyBmcm9tIGRldmljZV9pbmZvIHRvIG91dHB1
dF9yb3V0aW5nIHRvIGFsbG93DQo+ID4gPiAgIHBlci1vdXRwdXQgY29uc3RyYWludHMuDQo+ID4g
PiAtIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UgdG8gcmVmbGVjdCB0aGUgY2hhbmdlIGluIGFwcHJv
YWNoLg0KPiA+ID4NCj4gPiA+IHYxLT52MjoNCj4gPiA+IC0gRHJvcHBlZCBzdG9yaW5nIGluZm8g
cG9pbnRlciBpbiBzdHJ1Y3QgcnpnMmxfZHVfZW5jb2RlciBhcyBpdCdzIG5vdCBuZWVkZWQuDQo+
ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9k
cnYuYyAgICAgfCA2ICsrKysrLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1
L3J6ZzJsX2R1X2Rydi5oICAgICB8IDQgKysrKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3J6LWR1L3J6ZzJsX2R1X2VuY29kZXIuYyB8IDkgKysrKysrKystDQo+ID4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9kcnYu
Yw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei0gZHUvcnpnMmxfZHVfZHJ2LmMg
aW5kZXgNCj4gPiA+IDBmZWYzM2E1YTA4OS4uMWU0YjlmMzhjNTViIDEwMDY0NA0KPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZHJ2LmMNCj4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5jDQo+ID4gPiBA
QCAtMzUsNiArMzUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJsX2R1X2RldmljZV9pbmZv
IHJ6ZzJsX2R1X3I5YTA3ZzA0M3VfaW5mbyA9IHsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAucG9ydCA9IDAsDQo+ID4gPiAgICAgICAgICAgICAgIH0sDQo+ID4gPiAgICAgICB9LA0KPiA+
ID4gKyAgICAgLm1vZGVfY2xvY2tfbWluID0gMjA4NzUsDQo+ID4gPiArICAgICAubW9kZV9jbG9j
a19tYXggPSA4MzUwMCwNCj4gPiA+ICB9Ow0KPiA+ID4NCj4gPiA+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHJ6ZzJsX2R1X2RldmljZV9pbmZvIHJ6ZzJsX2R1X3I5YTA3ZzA0NF9pbmZvID0NCj4gPiA+
IHsgQEAgLTQ4LDcgKzUwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9kdV9kZXZpY2Vf
aW5mbyByemcybF9kdV9yOWEwN2cwNDRfaW5mbyA9IHsNCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAucG9zc2libGVfb3V0cHV0cyA9IEJJVCgwKSwNCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAucG9ydCA9IDEsDQo+ID4gPiAgICAgICAgICAgICAgIH0NCj4gPiA+IC0gICAgIH0NCj4g
PiA+ICsgICAgIH0sDQo+ID4gPiArICAgICAubW9kZV9jbG9ja19taW4gPSAyMDg3NSwNCj4gPiA+
ICsgICAgIC5tb2RlX2Nsb2NrX21heCA9IDgzNTAwLA0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnpnMmxfZHVfZGV2aWNlX2luZm8gcnpnMmxfZHVfcjlhMDln
MDU3X2luZm8gPQ0KPiA+ID4geyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMv
cnotZHUvcnpnMmxfZHVfZHJ2LmgNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnot
ZHUvcnpnMmxfZHVfZHJ2LmgNCj4gPiA+IGluZGV4IDU4ODA2YzJhOGYyYi4uODg1NTU4ZWI5NTQ3
IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxf
ZHVfZHJ2LmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJs
X2R1X2Rydi5oDQo+ID4gPiBAQCAtNDQsMTAgKzQ0LDE0IEBAIHN0cnVjdCByemcybF9kdV9vdXRw
dXRfcm91dGluZyB7DQo+ID4gPiAgICogc3RydWN0IHJ6ZzJsX2R1X2RldmljZV9pbmZvIC0gRFUg
bW9kZWwtc3BlY2lmaWMgaW5mb3JtYXRpb24NCj4gPiA+ICAgKiBAY2hhbm5lbHNfbWFzazogYml0
IG1hc2sgb2YgYXZhaWxhYmxlIERVIGNoYW5uZWxzDQo+ID4gPiAgICogQHJvdXRlczogYXJyYXkg
b2YgQ1JUQyB0byBvdXRwdXQgcm91dGVzLCBpbmRleGVkIGJ5IG91dHB1dA0KPiA+ID4gKFJaRzJM
X0RVX09VVFBVVF8qKQ0KPiA+ID4gKyAqIEBtb2RlX2Nsb2NrX21pbjogbWluaW11bSBwaXhlbCBj
bG9jayBpbiBrSHoNCj4gPiA+ICsgKiBAbW9kZV9jbG9ja19tYXg6IG1heGltdW0gcGl4ZWwgY2xv
Y2sgaW4ga0h6DQo+ID4gPiAgICovDQo+ID4gPiAgc3RydWN0IHJ6ZzJsX2R1X2RldmljZV9pbmZv
IHsNCj4gPiA+ICAgICAgIHVuc2lnbmVkIGludCBjaGFubmVsc19tYXNrOw0KPiA+ID4gICAgICAg
c3RydWN0IHJ6ZzJsX2R1X291dHB1dF9yb3V0aW5nIHJvdXRlc1tSWkcyTF9EVV9PVVRQVVRfTUFY
XTsNCj4gPiA+ICsgICAgIHUzMiBtb2RlX2Nsb2NrX21pbjsNCj4gPiA+ICsgICAgIHUzMiBtb2Rl
X2Nsb2NrX21heDsNCj4gPiA+ICB9Ow0KPiA+ID4NCj4gPiA+ICAjZGVmaW5lIFJaRzJMX0RVX01B
WF9DUlRDUyAgICAgICAgICAgMQ0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
ZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2VuY29kZXIuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
cmVuZXNhcy9yei0gZHUvcnpnMmxfZHVfZW5jb2Rlci5jIGluZGV4DQo+ID4gPiAwZTU2N2I1N2E0
MDguLjU2MjIwMTM5YTE0OSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3J6LWR1L3J6ZzJsX2R1X2VuY29kZXIuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZW5jb2Rlci5jDQo+ID4gPiBAQCAtNTAsOCArNTAsMTUg
QEAgcnpnMmxfZHVfZW5jb2Rlcl9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rl
ciwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKm1vZGUpICB7DQo+ID4gPiAgICAgICBzdHJ1Y3QgcnpnMmxfZHVfZW5jb2RlciAq
cmVuYyA9IHRvX3J6ZzJsX2VuY29kZXIoZW5jb2Rlcik7DQo+ID4gPiArICAgICBzdHJ1Y3Qgcnpn
MmxfZHVfZGV2aWNlICpyY2R1ID0gdG9fcnpnMmxfZHVfZGV2aWNlKHJlbmMtPmJhc2UuZGV2KTsN
Cj4gPiA+ICsgICAgIGNvbnN0IHN0cnVjdCByemcybF9kdV9kZXZpY2VfaW5mbyAqaW5mbyA9IHJj
ZHUtPmluZm87DQo+ID4gPg0KPiA+ID4gLSAgICAgaWYgKHJlbmMtPm91dHB1dCA9PSBSWkcyTF9E
VV9PVVRQVVRfRFBBRDAgJiYgbW9kZS0+Y2xvY2sgPiA4MzUwMCkNCj4gPiA+ICsgICAgIGlmIChy
ZW5jLT5vdXRwdXQgIT0gUlpHMkxfRFVfT1VUUFVUX0RQQUQwKQ0KPiA+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gTU9ERV9PSzsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIGlmIChpbmZvLT5tb2RlX2Ns
b2NrX21pbiAmJiBtb2RlLT5jbG9jayA8DQo+ID4gPiArIGluZm8tPm1vZGVfY2xvY2tfbWluKQ0K
PiA+DQo+ID4gSSB3aWxsIGF2b2lkIGNoZWNraW5nIHRoZSBmaXJzdCBwYXJ0IGFzIGl0IGlzIG1h
bmRhdG9yeSBmb3IgU29DcyB3aXRoDQo+ID4gRFBJIHN1cHBvcnQgYW5kIERQSSBjaGVjayBhYm92
ZSBtYWtlIHN1cmUgdGhhdCB0aGlzIHBhcnQgb2YgdGhlIGNvZGUNCj4gPiBpcyByZWFjaGFibGUg
b25seSBmb3IgRFBJIG91dHB1dC4NCj4gPg0KPiBXaWxsIHlvdSBmaXggdXAgd2hpbGUgYXBwbHlp
bmcgb3Igc2hhbGwgSSBzZW5kIGEgbmV3IHZlcnNpb24/DQoNCkkgY2FuIHRha2UgY2FyZSBvZiB0
aGlzIGlmIHRoZXJlIGFyZSBubyBvdGhlciBjb21tZW50cy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IA0KPiBDaGVlcnMsDQo+IFByYWJoYWthcg0KPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gTU9E
RV9DTE9DS19MT1c7DQo+ID4gPiArICAgICBpZiAoaW5mby0+bW9kZV9jbG9ja19tYXggJiYgbW9k
ZS0+Y2xvY2sgPg0KPiA+ID4gKyBpbmZvLT5tb2RlX2Nsb2NrX21heCkNCj4gPg0KPiA+IFNhbWUg
aGVyZS4NCj4gPg0KPiA+IENoZWVycywNCj4gPiBCaWp1DQo+ID4NCj4gPiA+ICAgICAgICAgICAg
ICAgcmV0dXJuIE1PREVfQ0xPQ0tfSElHSDsNCj4gPiA+DQo+ID4gPiAgICAgICByZXR1cm4gTU9E
RV9PSzsNCj4gPiA+IC0tDQo+ID4gPiAyLjU0LjANCj4gPg0K

