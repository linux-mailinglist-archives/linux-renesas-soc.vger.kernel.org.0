Return-Path: <linux-renesas-soc+bounces-33064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LapGiUMFGr6JAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 10:45:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C385C7F77
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 10:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F8523045E07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 08:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381113E3DA1;
	Mon, 25 May 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="K32hxZYr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F103E3C7C;
	Mon, 25 May 2026 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698536; cv=fail; b=bcdtBXX8uZSD4Mfqxonda+Xin1kw+F/UyzyphEb011ZDpJUQdeOx72VLkdnTQ06EP9jYlX9NVtkjicHi+SpB6Bo9yniJ/503uOTjC0CMni7oBfbF03YqP9bVcYlsKvcEVeIxqcvcX42jzGgCHXEDQ53Ya6yzGygnjcJZep+FeTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698536; c=relaxed/simple;
	bh=jmIR0OsRWp7Ej3TOe448DHe5N9Z5RN8Ixzh8cB1RPJg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eKxyBp420bibJxa+lcfaK2k0zKUCVJIdyejm6tOW7FYMCBlf+aVvqhzpk/fQK7vDDmWjFacQqMIok0fMQxKnh5NdmoBIJhXP5Nl2zn12CzbsLDYKjBaNlUHdKQd8VyIVyDXsz8AEjvAV9pLUF/aUtks4xonN0ZEAqNkvgEjhU0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=K32hxZYr; arc=fail smtp.client-ip=40.107.74.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVhqDR/wBGqkJO+W6vf6nZWIHRNm5uX7HV3vV/RTbyJtQ/v+ZOFNvI/dLB0a3jEd3eOsk51Iim8GmChmcNH3JDQ8wqecPcO6jRKgAcC4KriAWslq7Wlg3EyJY/fuI+OkYmIBEbDGlKM/mG/NRHky3ZQj8P6nUekdo3FtXj61FeYnmV7jM/cUY+PJK3dy48E4wnXgWvWd8OPkvforgA0YD3ZfcdY/WuCcIrk8rm+fQ0qgdaoAQoOV+sHzyiwZ9P6lTTCJcg2xB/M3QgM/89CdLnaRlI4UwucGuOcUNxcGqjSTBPLlq9ZZrEl9D2W/4SdgZEVHpV9R05uEPCYXgz2nZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN1FHlI2l17HP1IyY7cD9mYd60lZbIeJ/eF0bonNyIU=;
 b=OLOv0ZvN0x4JNVCBCM2oe73p9mVEEegwBxGlNCDw6Ozvrpw76iPr0L+q3Nq3QFF2+AGR36R7BdYqhkvA9zGX/Wok3FcPwMpLM2NPP3zUnPbaORkbQKusxSmxyFbvXtn/FYDDu2PT3dEh7W/7zvAiKZF3w4EE6gyG5AVy6UNo3LUUS0efsxWuU54TnsUkydmAwjseAey3Z+pbY7wqOW1KMUVBO9gQ7cCnw3E8J7e+xS1ykJ1/wQ6HOHMDuFtvHeUy9SYlvQj32PuRQEMcAVQnmeR2/PEJXwG8mwPf2spHjtR/BASYOwsSGPJOHkn0+8KdCIhTOBMCoseh8nN8TjwYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN1FHlI2l17HP1IyY7cD9mYd60lZbIeJ/eF0bonNyIU=;
 b=K32hxZYrKh8y8YmvhI5MzwpDxde6hwYaiZNQpInXeI2o1+uS3RKnw4k5D16Uis2jKfBonYUST5P5p9kVhE7WbYx7l2Sw18JJeuBa84Fz+Rg+Fvl8/cQm9QPi7k1dupXCRdS8R3ASbc0VSl/IzOyVmZW+/eKpJN2qD2nTq8sNz78=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8620.jpnprd01.prod.outlook.com (2603:1096:604:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 08:42:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 08:42:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Manikandan Muralidharan
	<manikandan.m@microchip.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] drm/bridge: adv7511: Clear HPD IRQ during
 atomic_enable()
Thread-Topic: [PATCH v2] drm/bridge: adv7511: Clear HPD IRQ during
 atomic_enable()
Thread-Index: AQHc0lGnqkHmHOuI6UOwxKbFb3EqF7Yen9rw
Date: Mon, 25 May 2026 08:42:09 +0000
Message-ID:
 <TY3PR01MB1134642ADD917B1BBF998A034860A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260422121457.166780-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260422121457.166780-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8620:EE_
x-ms-office365-filtering-correlation-id: e5064841-8a05-48c5-ca81-08deba39825a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|22082099003|38070700021|5023799004|11063799006|6133799003;
x-microsoft-antispam-message-info:
 KvukzQvP4yx8p3twdYkCmCyaNQCKteAXKczox2q2kTRG39ExbiTLvfMbr3jQVVmPOaU/mJRIiCntY538g36wuUFuSoJtamAjpoDNTygue4GhRfSsbQ+2EWHg+DM1VDuA+5+28CQ4D1z322OKF5bMqPB67K1CnZvEDp40qhCQ8v0BLzFRuNCTbgaUBOzLtejZx8qMS57JjdS51r0eqCmxoO817HbcgCwwWyLRXD0Q0iE+R6woOkquaKN5PYkAxuyVl6U24TFFVlBvrt6G/mn7sC2WFSlpa7n0jMPeu02enUp9mNGmyBh3mINbVRTr4k4wC6schhJ3Jg0ejrAAmYzA1/vrXH176t9EQcbjeLB8Atvn7UygRf7GxslpqvFkeG+F1S1slJG0qjaRhtkb/vsNskfJZ8c0na+xXWIsylEOXsCZn6WKSzDJpSSmmALK/A6tpS3sjQPejYYhZ4McxKcbpqTjwOGMYfEne5BVoWa2ULMZwFnSaKmi1Qy+UZXOeMzBSfJAriZfCNA5jxMxi0SwmkdAcn26qlGVPptVP+MY5Op7RTJSt1JXobaLcst57zZ7KoUbzXTINz6P+zSSuAVVakgIyLDyUJkZoaRgexrAKoaSOolGLdNFvePV3RglPRIas6naAu+GlDdUXpe3HeFqj5kKLzm5MVhvpYr/iqG5Jz470YlTN57axs2uIJCdSgKwvzCNsBjV55QWiVHB29ni0x01cCyQLI0BodOO7JV0w+Xgc3/hGIuFFy9IoggTtD5l
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(22082099003)(38070700021)(5023799004)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VDnenFDrNViV87jHPHsdpNjdkSAaKImi9JagKwHOwri37QU6FKTteR/JYVqc?=
 =?us-ascii?Q?ZnIxg2rqT2akaFzImaWzbW3DcJr16jiw70v3P+HRQFO/D1l2b0uWzJNFjC/J?=
 =?us-ascii?Q?MjZurgccxKivZdjNdY6n877+1I52VoZskKiFkMzXDpUkIL/4XSuN3ZCpOmra?=
 =?us-ascii?Q?I/WmyT3kW13WzLk73oXWwHbbrKTw5NXLHTtjEmESL/1mEKJQfvVLAjdTfURj?=
 =?us-ascii?Q?aL88ISRclGYSGNRxUcT5V5qdMyUV3s9aVcsGTi0L3GEiKh0jmBdxRlmwyzSf?=
 =?us-ascii?Q?WzsZF0li1/lzYI5PsH+hWvBw9MU7GcXMVPUZznBHBJjBIZ27I5f4R+GwIcP+?=
 =?us-ascii?Q?BbG6e5PUJTNF9samkm2ty61Ft/waNPM10R+Iczc+cC6soVVAoD+GJ02M3LqX?=
 =?us-ascii?Q?ggtz6D4+/14ffDxvByVe3bMfOs1gpJUJhAG6ocsSkY282o7sBLDWrzdscyf/?=
 =?us-ascii?Q?Eg56XqNL32oxfBVdOj3A1acWswtFvsO5tUW7UGANAI7o2Ub2hNuDOXXp02Jk?=
 =?us-ascii?Q?S5dHCj6BzlApWM1aN8LUNLJOnYD5pz0jC59+ftmxghw/CmJB0dAicd+WwlfK?=
 =?us-ascii?Q?i/tGjkAniiMhAvmJB1+uorTWoy/tt0szeLo46B0un/8gHWUspRwJjbgY4lWp?=
 =?us-ascii?Q?s7DLrb2015dwO2KkWcCSHKOoikQRivmeIlOV+AxOne/TQoB1d4sKzLQqfIW1?=
 =?us-ascii?Q?e1CY3dAL4UlT3HCfmwFksswBUrYnaADQKOFiLfXuf2WE0vbJb5yCQ7Di2swE?=
 =?us-ascii?Q?7gkfWWBvIonxzTiPWCKpf1PtMeNqrL3ObgN81/r9HuTsJKgC2fj2frQxBSPt?=
 =?us-ascii?Q?tp4oBnZPJ8sYY33wgdE0XWqIxpP0C2CCP0wDJMsTEINAxXGa0i1DHRPWKe3W?=
 =?us-ascii?Q?rdI5K9otEanopb3UBm/vHjMVjbLyDNiwNDaOFAh8F4jCdBSbHatn0P2Wrjvm?=
 =?us-ascii?Q?VxYeNU8AV3eAgeG0hglxknHXJhuapo04fyqRDOrB0WAKeauakBb/GAyLLFTE?=
 =?us-ascii?Q?oRPCrRlTQPxTsTy2hxMiV7fOxY7xY9wPv5Zb41RMow1Ccwlq0JMPGZ01ZF65?=
 =?us-ascii?Q?YqtJOEtXdz67ROSL7lQpmwFbIazi/yAr36YKRt5ejOM6szrhHpvRqg9KPjp6?=
 =?us-ascii?Q?cxbgDlwF+ffz6c9qJcqNs3awx0HXRzcGx7I44QrSG/OK688TNwkDCYBv+T/i?=
 =?us-ascii?Q?zxwRURxfaOObtHga4UoQpRmeBLYZxLqi1+BUnHloQlkrwysaXFLTDKAQXMxD?=
 =?us-ascii?Q?KotkvvZwrwqNAYbMiOJdNO/il0me3QpMpyWiozcBBBAnacotUZWdRi8VjCeA?=
 =?us-ascii?Q?4bP2S8JEou+PLuSjACefRLFZkaq2zCIoF3tW/X5LRaW/A656FRYkHo/iNG7d?=
 =?us-ascii?Q?81BX3GlwHeY8ECuOtiOBk2fMIwm40gEJ32B3Vr4xLDSSDPhxevf09zl7t/IC?=
 =?us-ascii?Q?0GMGdzgMoC4OXJxB7RZBYdVXKQ9M9GriyOnqwp/O/gTMRBIwBhWPP1QCBldg?=
 =?us-ascii?Q?ks/TWO+OQBcXBC/KG4mC2vEx/BZY9G4V25ugFjguhZSELz/tiJHNF6kJupKC?=
 =?us-ascii?Q?51VvhxhyfiBdnFzUMFXftFH/VCpamxRgb2K5bKp2FefNtNXGsiIlo3cLXXlQ?=
 =?us-ascii?Q?WlplnV3uLyDIHj84U5S8F448TszZo0S5ml/Hf4/qVNOS4y12Z5Lb8y2egAsc?=
 =?us-ascii?Q?IH+BdVwgbW7LcQuay9cs5JqBmMA4hPmPtvpH5VnUcMywBrdRAfJVHjcGIJWB?=
 =?us-ascii?Q?qOv7XlGzdw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5064841-8a05-48c5-ca81-08deba39825a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 08:42:09.5877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BO+8EYrzEcnJnXp9ZAWwflPE8sezbQncK/vNwZa25ub4OwIDWodoF8HfBY9oFupG77nYRlcjwhX7wzSuC+hj/wwPDL6v7i8J1xz7HugCG8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8620
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33064-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,oss.qualcomm.com,bp.renesas.com,microchip.com,collabora.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D9C385C7F77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 April 2026 13:15
> Subject: [PATCH v2] drm/bridge: adv7511: Clear HPD IRQ during atomic_enab=
le()
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> On RZ/G3E SMARC EVK, suspend-to-RAM via PSCI powers down the ADV7535 chip=
 entirely, causing the HPD status
> bit to be in a stale state on resume. When the display controller driver'=
s system PM resume callback
> invokes drm_mode_config_helper_resume(), it calls the bridge's atomic_ena=
ble(), but the stale HPD IRQ is
> never cleared, leading to incorrect behaviour.
>=20
> Clear the HPD status bit in adv7511_bridge_atomic_enable() after powering=
 on, so that any HPD interrupt
> latched before or during power-loss is dismissed before normal operation =
resumes.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Tested HPD, s2idle and s2ram on RZ/G3L SMARC EVK connected to ADV7535 on =
both polling and IRQ mode.
> v1->v2:
>  * Dropped PM support instead clearing latched HPD status bit in
>    adv7511_bridge_atomic_enable()
>  * Dropped suspended variable from struct adv7511.
>  * Updated comment in adv7511_bridge_atomic_enable().
>  * Clearing the HPD status bit unconditionally as there is no harm.
>  * Updated commit header and description.
>  * Dropped the tags.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 6bd76c1fb007..7663814b4032 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -792,6 +792,13 @@ static void adv7511_bridge_atomic_enable(struct drm_=
bridge *bridge,
>=20
>  	adv7511_power_on(adv);
>=20
> +	/*
> +	 * Clear the HPD status bit (ADV7511_INT0_HPD), so that any HPD
> +	 * interrupt latched before or during power loss is dismissed before
> +	 * normal operation resumes.
> +	 */
> +	regmap_write(adv->regmap, ADV7511_REG_INT(0), ADV7511_INT0_HPD);
> +
>  	connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge->e=
ncoder);
>  	if (WARN_ON(!connector))
>  		return;
> --
> 2.43.0

Gentle ping.

Cheers,
Biju

