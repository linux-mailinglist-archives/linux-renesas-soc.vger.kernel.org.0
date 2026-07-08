Return-Path: <linux-renesas-soc+bounces-34844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MgSYH/AaTmp6DQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 11:40:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A4723D47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 11:39:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=OM0Zd1+4;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56DA83003BEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 09:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C85E3FC5C5;
	Wed,  8 Jul 2026 09:39:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7D341DEE4;
	Wed,  8 Jul 2026 09:39:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503552; cv=fail; b=tha/+y/W7FU7+smnPyW3SpxFDcqTMiWVJuBqCi11rZts2Z2asEd+YoVRtLXuCi9LA69wODRGEI72cZVEWxNu4GCXzyLp8K0bLMcuVZDkdI5zt4KH1vhVnWJMGWpOgCIV5v33e+iSQdXe+x5PAcm8jXnq4FOMPRTECRViFu59Kk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503552; c=relaxed/simple;
	bh=zrkbDndOARP9cNn74Y967CsW4+OhgABzSL0OSpk7qAk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eGBC1HAWjGn/lC8NieuBPAEefT5+OUVPyRf4WJD5w1aD5Qzxn83FclbY5W8iW/N6MnEjdj+03I4PaO0fe+oJjrjEhHkJWZVwbgD1PsHavLMjWoIpEhgJFi9z+sNTNYSnc0ZuqlX2jtjxYub59P3nr4Ls1iVOOyPEI0AdxKsvIQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OM0Zd1+4; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Us0IILky/otqwzMfj/jGsEBrHDxPSwd0nv3jXOS+QXn+Ygr5VgNUugZm+rclp0oQX7eonQIxB9q7C52fQ1GbCBLLj61giqlY8sVk2R2c0KLE0EYQsJ2o+r4VIKDd95hUofm9px2uhZHC9zcMUWQUoJNNkXWaDrNjSaQxt5g7Ac1uW0jYIdR6rq91jZ5Cg8gxgD3APkXyAYNd3RAei5/aCEZdvSjngyqmG4sR3gWxhAL2iNjqAUdwvGu7SPHu+IG1q7BzkBlEDruD4m4SvSw/M3vMYh/sjAJIBPGN4XhSWDxaPgLecbQg8qfVqqxFDeFhSyBpVx+vRLwtBoJKbPp3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrkbDndOARP9cNn74Y967CsW4+OhgABzSL0OSpk7qAk=;
 b=vozK7rozwrrCAO/DCfOwm/5AihW6Z4P/KJZiOVNuUrj5ReEs48yXmE6lqjGz0yrLpnalEkdl+5xbol3D7TKY4J4a9eaoCJmtr7cG4sEyb/1lpTAk6k2YMdO7ZXSon6dHdLjZll820dFKtsJ8SwQ1lrf08UTzhkSWkW5X+E5MRqn6j7uMvIuKYOk0W4YvTzdZR1VRoLILkDw4ksEEIalQZ1wEcUYRb6rJp5Ygio1fGLN9IQUNt5mzP00Q9isAl4QYsZkgzw1KA5NHv5dKpjvHd/ilvRbvWjx20X/fS+rn1XpfWR/ZJ/jBLsko+tUw1WlS/9FpcKHNMgVmUkHEfhI2qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrkbDndOARP9cNn74Y967CsW4+OhgABzSL0OSpk7qAk=;
 b=OM0Zd1+4zw16jOftDmLSKw1dantu1apNjz8ngHC4uYo7Fd0sIOiG9OEi4v1zMChTDdV/Z05yj5LUDqhLuHtyySSCzHKn5OP7+ButosKeHuOvS07Un8BpxyT6qEKpRTuZJ82x1+iMIISXBiuQSIpdZjMLwPp1lSYS0KLdhg5Ml+Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB16919.jpnprd01.prod.outlook.com (2603:1096:405:32c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 09:39:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 09:39:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 01/16] dt-bindings: display: bridge: renesas,dsi: Document
 RZ/G3L
Thread-Topic: [PATCH 01/16] dt-bindings: display: bridge: renesas,dsi:
 Document RZ/G3L
Thread-Index: AQHdC5hXT7Bl3w0M30ul9DikKlntD7ZjUJkAgAAKgnA=
Date: Wed, 8 Jul 2026 09:39:01 +0000
Message-ID:
 <TY3PR01MB11346CB08784610C00EBC870A86FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
 <20260704093433.273672-2-biju.das.jz@bp.renesas.com>
 <20260708-hopping-exotic-baboon-6c5a46@quoll>
In-Reply-To: <20260708-hopping-exotic-baboon-6c5a46@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB16919:EE_
x-ms-office365-filtering-correlation-id: 6901ec45-19c0-4d85-45aa-08dedcd4be26
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|56012099006|22082099003|11063799006|4143699003|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 TMZ/ynYsf5nSguRs8jUb+38/jf4ajO+jf3YthhzGM9EQCxH+NApaSagNbxq/360jjb/O8RfISOmAb7cHD7PR5AcjrmcEMzA3wUS+L7CfUhDqXTZQkerwAM4SiMtme1TUDtVfQryc8aVbzg3RQuRPg7nwTkRwCGfshES+li8RQhNj7IvT3qe8/7BrYOc8qn64uf3Z2J+WDc0xgVqQRZWRokJ1BGT3DZbQp4UEaleNvvlQEvBH+NRw+kd0Dx+GG/MnmrzwCJ0+46vNSv70djIOwKbPmopVPPSbvrsuwvaBqCvFI/ynXaG3tcRD20byu64pMgXnOlEOedaPceVEYQ8FVpPd552p2fVlgppxd8nDz83hSXk0vfMl6SG4ZK+twt8k4ge2aUmzFVJPeYCyfsXCs0MegGGR6lRdDxxCdXxK6cvPHYI05qfCIGq1Ey7dqCdNsL2ypguNhrR16XA0JdgPY6SdtSN5ygZApzAyOtZ5dvNsm8oPJ7vpOH2C642vPnyfLOfDzNOcVCczFFC8dOMJ74Kwh8gKcsP89XPf8njVml0XJ2RGwsvO02lCnN8gKMwAicT18qqK/TfJrP897Zt+/lvGVt9fVXF/0oCPDdji7xtYgT7kelSr3cIEqNmnGBMnG675IFbZ21rGr6ykfymCXvaF1OU+854WLgfu2uYH5zQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(56012099006)(22082099003)(11063799006)(4143699003)(18002099003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEhVQTg2dTNmZTBDalkxL0RRZVVRek9yNmVTVytXb3lqT3hjeWtoRXMyNlky?=
 =?utf-8?B?ZitxaVg5TFNTeUNpSkVtQW9jd2ROSklPRjh5QVRhUmIvWStEZ29LbmVhZ1hX?=
 =?utf-8?B?dDNMNmFzZ1RSZlhkRUlXYmxDenRNazFLR2tqelhBZHcyUVU3ZmgzQ1RGbzRL?=
 =?utf-8?B?a1M5M3RYcmE3NXJYZ2Q2ZHI0dGtNOTFrZ09xUi81WmdlOVI4Q0VrQmVPNmpH?=
 =?utf-8?B?VmpEZC9aYXVWODY4NExJRm9XVU9LbHBDeHp0SDJ1MWNrMDVBQ1hZUjVnbzdY?=
 =?utf-8?B?b0VLdlByVGQ4R0NNanZTM0ZxTkozUkZVTW5MN0M2K3Bjdm9MWEVCT0xJUzhB?=
 =?utf-8?B?ZWhQVkhuWVZCb0FuSytmcWhJQ0VMQTNUcnVKRXZaYVI4dklwZERsQXFLMUhi?=
 =?utf-8?B?M2IrWW56NFNZR25GYm9WRno5akFJby9qMFNvZnpwV1pJTjZjcTR3SS80a204?=
 =?utf-8?B?OURmSm0rTlh5eUREZXp0S3dONy9saU56c252OENZOUtLbjlxZis2dWNEVGd2?=
 =?utf-8?B?ZUNxVklycVdiQW1iMFlJeVZUYUhDVlJLVSs0VDh0djdFalRGa09XWlRMZzVR?=
 =?utf-8?B?OGc4MXdjT0luRWlaN2QwOGZkZEFKalRLUTIxRTRzRWFURnAzbVJ5OVdGRlZ2?=
 =?utf-8?B?ajV0cGpGZkQ2eG82SFpTSEM4WU81UzZ4NjQvMUU1WDZSMjZCSXBpZjJQTEs3?=
 =?utf-8?B?cHNJZ0tVUC9RR3pkbkVQQ2ZNRWF2U25MNmRKN1FDTk9wTE5ZYUFscU0vYUNa?=
 =?utf-8?B?ekpxVlFxbnVBcHVEMVg2aHFkZTVnUkxUWUhGUHZOc2I3VGxNMDJMZUducjRX?=
 =?utf-8?B?VElybWFTcG15ZzZwdW9yRytBdHE4M3dscFR0UkNhNkQ2b1VBZWhGZFBJK3h6?=
 =?utf-8?B?MDFnUkk2N1pBUDdBWDFDcitWaW1ZRktQRDVSUjN4bXp6ZTIzc1F2MWZqeWhG?=
 =?utf-8?B?OVgxUFZRaGVZSmdVMmVQdkVQdU96dWV3WThEMFl0Y1RIU1B5QmZ5eTVYSCtm?=
 =?utf-8?B?ajd3K0NYVFh5U2JqOFM3SndxTmpQazJkTW1sWXJXbGxqOE5jUmF0bHJWQms4?=
 =?utf-8?B?OW5oRk5XelB2aDZMRHhMTUtlbGZEbktMSWFkcEtyL0ZFSktaYTNyTyt3S251?=
 =?utf-8?B?WTl0TGdpYXFQZ3lORGRWaWIvRlRyN0Z6cGp4Qk1vYzBKSHl6MWhJRitHS1FP?=
 =?utf-8?B?RnNrYXd4Y09vQVk2UmJ3dm9pendEaGNZamtYMGNNTWc0QWwyT3RPUGFHZXVx?=
 =?utf-8?B?NU9QbDNQZVN4NjNCbkN0aE9FTTRNOTN6aC9lSHROK1l3WHlLN0tnN2lVcitI?=
 =?utf-8?B?NUlBaSs4MUxsTCt2Qk96WjVCaFVxWCtod2p3eHVhUnV0RC9IeG5KaHFONmln?=
 =?utf-8?B?anN6L2N2SlU3NTJuS2pUQTJtYmdvN1YvN2dLUVVubW5KNWF1V2JxRThEa2hs?=
 =?utf-8?B?UHRrS1pPWmlVU0tEWkVhT09UYXlPTXl3S0hDb2EzMU9GN0xCbXJzK0NOODJT?=
 =?utf-8?B?N2Z2cW1jV28wdHFGdzRTREZuQ2trdzFkOEFSZTgvRzZEUjdKblk1Vk83T0JJ?=
 =?utf-8?B?aVVJVDYwa21TYWw4TTk2RVVFZTFuY2xQQXRJOUtKSEVPLzVya1pxYjNoaW1p?=
 =?utf-8?B?Q2xRY2lWdW1CQ3FCRjFXMXJHSU9PV0JmYWZqZWJCZXNMT3ZDdHJ2cVZYQ2lU?=
 =?utf-8?B?UGk3UDNpL1YyK2YvdHNaYzBaaUlUczRSTStwV05CcktscXpNc0h6MklNZVZG?=
 =?utf-8?B?dDBJWDJWYmxGVW9yMCtFVlIrVE5DR0gwL1NYUEVRaWU2V3J5dXRHZzNsWVI1?=
 =?utf-8?B?TldxWUJrVjhyc0o5dyswa2hXaCs5c2Z0a3NoYmRkN3JXeU9EY0ZrcmhjMnRp?=
 =?utf-8?B?WE0za1lEaytzMG82ZHczRE10UDVjazhQdUJuMnlweE5pTzdhaVd2OXFyc1d4?=
 =?utf-8?B?QXFOZzVBV2FjVFBQbUZ3TTNVRldnZitIMW9jQXF5bTN2VU1yTncrcWpiZG9u?=
 =?utf-8?B?Y1FuZUdhNk9RdkpYUFF1M0ZGZDVwUldLd3MrdEVudkVkM2dDNjRoN3ZIQnFD?=
 =?utf-8?B?TnIxTjJSQ1ZhMUk2Zlk1Yk9lV2l6L281VU02Vk9qaXRWSXVvRGlERENOT3g2?=
 =?utf-8?B?eURyK1hxSVhvaktjUk8vbXEyVXRCQTZidGFtMzVwMWk5NGxSNlB3VkgzUmRC?=
 =?utf-8?B?T2VaUVFpZEtTV3prZ0FFaVBuU25XZzJwMUVhTFVCb2d5aVZ3TXgzTkZQSXFa?=
 =?utf-8?B?czBNRExLQnNiYWc1S0NPOHQxYzA3cU9PWGNzNStnaVZJR2FSNDh6MDFodTZG?=
 =?utf-8?B?ekVmOTg5Q1RySUh2ZHJnQU1qZldRU1F5a0IzRFBrY05sVUZUUlpoUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6901ec45-19c0-4d85-45aa-08dedcd4be26
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 09:39:01.4434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: di7kf4AbIdXanMBYlJ3vb7xV9vYo1cXW12I1cV6ImtWleIEgVae0Wx7u2oquB8pCCjE1m/OJPnN5raktfeTVmFf1gECpiQwKST3/I/rdF5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16919
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34844-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:biju.das.au@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,glider.be,ideasonboard.com,kwiboo.se,bootlin.com,lists.freedesktop.org,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 779A4723D47

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAwOCBKdWx5IDIwMjYgMDk6MzANCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAwMS8xNl0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IGJyaWRnZTogcmVuZXNhcyxk
c2k6IERvY3VtZW50IFJaL0czTA0KPiANCj4gT24gU2F0LCBKdWwgMDQsIDIwMjYgYXQgMTA6MzQ6
MTFBTSArMDEwMCwgQmlqdSB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBUaGUgUlovRzNMIERTSSBJUCBpcyBzaW1pbGFyIHRv
IHRoZSBSWi9HMkwgYnV0IGhhcyBkaWZmZXJlbnQgZ2xvYmFsDQo+ID4gUEhZIHRpbWluZ3MgYW5k
IGFsc28gdGhlIFBMTENMSyBpcyB1bmdhdGVibGUgY2xvY2suIEFkZCB0aGUgY29tcGF0aWJsZQ0K
PiA+IHN0cmluZyAicmVuZXNhcyxyOWEwOGcwNDYtbWlwaS1kc2kiIHRvIGhhbmRsZSB0aGVzZSBk
aWZmZXJlbmNlIGZvciB0aGUNCj4gPiBSZW5lc2FzIFJaL0czTCBTb0MuIFRoZSBwb3dlciB0byBE
U0kgcmVnaW9uIGlzIGNvbnRyb2xsZWQgYnkgU1lTQyBibG9jay4NCj4gPiBEb2N1bWVudCByZW5l
c2FzLHN5c2MtcHdycmR5IHByb3BlcnR5IHRvIGhhbmRsZSB0aGUgcG93ZXIgY29udHJvbC4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHNp
LnlhbWwgICAgICB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHNpLnlhbWwNCj4gPiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2Fz
LGRzaS55YW1sDQo+ID4gaW5kZXggYzIwNjI1Yjg0MjVlLi5iMTE0YWMzYjExMWEgMTAwNjQ0DQo+
ID4gLS0tDQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvcmVuZXNhcyxkc2kueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGRzaS55YW0NCj4gPiArKysgbA0KPiA+
IEBAIC0yOCw2ICsyOCw3IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBy
ZW5lc2FzLHI5YTA5ZzA1Ny1taXBpLWRzaQ0KPiA+DQo+ID4gICAgICAgIC0gZW51bToNCj4gPiAr
ICAgICAgICAgIC0gcmVuZXNhcyxyOWEwOGcwNDYtbWlwaS1kc2kgIyBSWi9HM0wNCj4gPiAgICAg
ICAgICAgIC0gcmVuZXNhcyxyOWEwOWcwNTctbWlwaS1kc2kgIyBSWi9WMkgoUCkNCj4gPg0KPiA+
ICAgIHJlZzoNCj4gPiBAQCAtMTA4LDYgKzEwOSwyMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgIHBv
d2VyLWRvbWFpbnM6DQo+ID4gICAgICBtYXhJdGVtczogMQ0KPiA+DQo+ID4gKyAgcmVuZXNhcyxz
eXNjLXB3cnJkeToNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBUaGUgc3lzdGVt
IGNvbnRyb2xsZXIgUFdSUkRZIGluZGljYXRlcyB0byB0aGUgRFNJIHJlZ2lvbiwgaWYgdGhlIHBv
d2VyDQo+ID4gKyAgICAgIHN1cHBseSBpcyByZWFkeS4gUFdSUkRZIG5lZWRzIHRvIGJlIHNldCBk
dXJpbmcgcG93ZXItb24gYmVmb3JlIGFwcGx5aW5nDQo+ID4gKyAgICAgIGFueSBvdGhlciBzZXR0
aW5ncy4gSXQgYWxzbyBuZWVkcyB0byBiZSBzZXQgYmVmb3JlIHBvd2VyaW5nIG9mZiB0aGUgRFNJ
Lg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRs
ZS1hcnJheQ0KPiANCj4gVGhpcyBmZWVscyBhIGxvdCBsaWtlIGEgcG93ZXIgZG9tYWluLiBQbGVh
c2UgZWxhYm9yYXRlIHdoYXQgaXMgUFdSUkRZIGFuZCB3aHkgcG93ZXItb24vb2ZmIGFuZCBwb3dl
cg0KPiBzdGF0dXMgd2l0aGluIFNvQyAoaW1wb3J0YW50ISkgaXMgbm90IGVuY29kZWQgYXMgcG93
ZXIgZG9tYWluLg0KDQpXZSBhbHJlYWR5IHRyaWVkIG1vZGVsbGluZyBzaWduYWwgYXMgcG93ZXIg
ZG9tYWluIGluIFJaL0czUyBhbmQgZmluYWxseSBVbGYNCmFncmVlZCB0aGF0IGl0IGNhbm5vdCBi
ZSBwb3dlci1kb21haW5bMV0NCg0KIiBTWVNDIHNpZ25hbCBzZWVtcyBiZXN0IHRvIGJlIG1vZGVs
bGVkIGFzIGEgcmVzZXQuDQpBbHRob3VnaCwgaXQgbG9va3MgbGlrZSB0aGUgVVNCIFBNIGRvbWFp
biBwcm92aWRlciBzaG91bGQgcmF0aGVyIGJlDQp0aGUgY29uc3VtZXIgb2YgdGhhdCByZXNldCwg
aW5zdGVhZCBvZiBoYXZpbmcgdGhlIHJlc2V0IGJlaW5nIGNvbnN1bWVkDQpieSB0aGUgY29uc3Vt
ZXJzIG9mIHRoZSBVU0IgUE0gZG9tYWluLiINCg0KVGhlbiBQaGlsbGlwIHByb3Bvc2VkIHBvd2Vy
IHNlcXVlbmNpbmcgZHJpdmVyWzJdIGFuZCBmaW5hbGx5IGhlIGFuZCBSb2Igb2sgZm9yIHRoZSAN
CnNvbHV0aW9uIFszXSANCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQVBEeUtG
cExuUkVyNEM9d1o3bzhMYi1DWmJRYTROcjJWVHVZZFpIWjI2UmNiMU1hc2dAbWFpbC5nbWFpbC5j
b20vIA0KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jN2ZjMzFmMTI0NzMzMjE5NjUx
NjM5NGEyMmY2ZmVlZjk3MzNhMGI0LmNhbWVsQHBlbmd1dHJvbml4LmRlLyN0DQoNClszXSBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5l
eHQuZ2l0L2NvbW1pdC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvcmVu
ZXNhcyxyemcybC11c2JwaHktY3RybC55YW1sP2g9bmV4dC0yMDI2MDcwNyZpZD0yMGVlZTBmNjlj
OTAzNGEwZjYxMzUyOGY4MjlkY2FjYTE5Mjc0MGQ1DQoNCkNoZWVycywNCkJpanUNCg==

