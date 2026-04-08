Return-Path: <linux-renesas-soc+bounces-31051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULfwAqim1ml9GwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 21:04:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 767503C24EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 21:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D12F3043D1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 19:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF103D9DBC;
	Wed,  8 Apr 2026 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FBlMWN/x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24432692B;
	Wed,  8 Apr 2026 19:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775674938; cv=fail; b=HR5T4huZ1WA5s7P+43v1YIGxWlODySVWCq0chOyMluwB8scKOQa3KSZRhEaijWl/zp55D82XMmJcXDOYPdrOdkKzdwD6ucvFvfAqzloZmIwIM11fBaUwsx8JtJntGSrR/GaGGPG+c2X1+zgTO1TthaSFV/zNdGGM3pqELPokASI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775674938; c=relaxed/simple;
	bh=ej4IOpldpVwP+LcLzVwP8ldIOBh8W6UqYhxK/tM6o00=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HcGWP0gcibuuQrboDLJJnsF0TR2d4822gPStFx0eYtNgsNZV5wCfodluNqQ9gvpsjT1BuTzio4LX9I9iYZp11O2m5sOtY3jV81MqilLu5jhVwfe8h8dcK6uHVctXsV9JSn/hm2enaahuaGQ1ZwB93pwIS2j1SoVjdCv2dBKxpuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FBlMWN/x; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGS6NE5YzCU/pQovldJEWxnYbNMiuSd9RbDJ+rCrVi+G3HpOUMK9xdip/NExrwNnwLBDSqnrwMr0GhSOP8iSO8eXUIrsErzfBbU9A9NsnKwWGnjxqIJME4WZfKZLNkDapGTfDnkas/r7tUtHGUEd1TNogTKJgEpHbu06L8v0q7Za3rywda27/svdyuNY3mC0l/To8rtfYGAw+X22cm6wWkwbLEMcd3LW9dzGd+CVWy0N6MIqIEFlglrPwKW1J3baqBMb2bMj2pPcCOh5uz8zpKfBTMt1+nyIsagn9CceM00yCf4mChhMAlc86a2rQsuhYyeAjfd4Oqri8Ljwlzt4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ej4IOpldpVwP+LcLzVwP8ldIOBh8W6UqYhxK/tM6o00=;
 b=Lzbrh2Fx4WoowyMxi4bj+4SsNcvjHZdy75QhrtlA8WlhYCAoH2cNwxm+XWg6PbVYC7i90BxKPNLAVJTTdmBg0euH8Fjxt5ywiJ9hkN8QBxlVdSgiIEOuP5J8OfB2ECIrtyCzA7yDld0m3EAZOoOu/ylqr6Mdxz7xeRkCEFOF1xBvPFS1cjX+E116I9dMAgGWFsdREmYnWSEgErmIk57jyOLNkqDt2DwYbJdxRaR6/Nt1Pc8+TP7tY3eWip+jo4kftPb/r41ZNV1P5l4+dck84ha2v1KfzvBs7rwKxC7G7G0VFX2VbDiY4ZtqtIiUI4QN7Bgsq6zIpReS4giIHs6cEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej4IOpldpVwP+LcLzVwP8ldIOBh8W6UqYhxK/tM6o00=;
 b=FBlMWN/x8NpEiyQ3aDxnQE2x0ZxOB0sQRLcV+8t/uKSxYXX3QB4q5CPRRpuA0R4USbF2OprPTVYddTGIvcX+85kVKelKlMPW4k1XKscvYhR1AQv3jmGmZwV96Wh0UyUDrkUasiGMCOIANXDN5xOvpCYgTWBTXjBTbzfIXT7VqLo=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB11216.jpnprd01.prod.outlook.com (2603:1096:400:3f0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 19:02:13 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 19:02:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Thierry Bultel
	<thierry.bultel.yh@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Thread-Topic: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Thread-Index:
 AQHcx2L1WxU/Wbm0ZkuvgJVMedankLXVW0yAgAAAwXCAAAUgAIAAAHbQgAAW4oCAAAuMoA==
Date: Wed, 8 Apr 2026 19:02:13 +0000
Message-ID:
 <TYCPR01MB113326DDA1FC854689CE34A6C865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
	<20260408142105.310210-2-biju.das.jz@bp.renesas.com>
	<20260408123039.922a75327fd7672df3bd61da@hugovil.com>
	<TYCPR01MB11332B594964DDF0763499184865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
	<20260408125142.24cd94f094ba3ca512e7f346@hugovil.com>
	<TYCPR01MB11332859E901171C91C543061865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <20260408141515.fc210b4b3c86f7a61f680dd1@hugovil.com>
In-Reply-To: <20260408141515.fc210b4b3c86f7a61f680dd1@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB11216:EE_
x-ms-office365-filtering-correlation-id: 2524fa83-daff-480a-6531-08de95a15836
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 WEKFQwLNbl12GwKU6/p1Ccx6ZJkH0q6NfWw3zQFg9xV90bzjF4N71azJUJm8gLGav195ZbuVe9MjzqKllwEK4Vp40TNKBRlI0PZdxGbuQsb7nwmv1Ktk+zTs0JAI4AQgVadSb7CFIDBRFAQ16Wqh6QY7PuiUQGWJ6mpjRo2oha3lt5lOUqfO3vPZ5xeVYAwRTH3rU56w9Gkr4o3c4x7ro9iNq/nrwF4P5UbTYcFXGUvi9U6KLTY/PQS6S4CGgLLhf+chgl4FkLLGvMLjFCPC5QqYMLyut71CBDi7996s8oZdJUcqxBeEGJBs8hPkhkHMpE0errimPtZprxF0rDRYVKB1ROkjYkhzFSEE8CSogo179DtMXqcv5B4OEUzTwxm7l7DURUpFJXJqRiDqlH0oGlav6S51pMy9vBlVoGesAKQGZaTx4nsDGqGBjZDQJX310/u5ZbF2HcoTa4UYqCacGF9Aa7fIiM/YlQ7Qu+lzTuqrcAK9Ma7t+ALW7PYMYvkTcFj8gQvcR4/MMsOjLQ4/au6qbw/ZIQ9hy32AhCq1GA9D+anOcFOHn8G7/QgMZr5U9NwujZt1xkYN55okO6wFvNvWYqJCVCtjicRaY9Z8mDE2j36XvsLTwfikJo5sj6daZeSqAm/73VnWKYgE4AIYGOswnzSi0X2qcfVwPOIhh29xa3XWBkycnfOedH9lhV79xeXKNej/7Aklk7T+bGK1NTM4+WYinn8+in4mJjgp26M+nFK4sghldpzwaYc1b/yN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmFjTy8xTUoyTVl3eXBpSDJYMDBRZm5oNUwyOW5GUnJPby9JNHo2K3pnRmo4?=
 =?utf-8?B?aFYzanJxVTM1QTZ0R2w1QUZUZFMwQWN6Ly9lSnVhbkMrL3k1ek1iTkQ5K0pX?=
 =?utf-8?B?cXg1cUwycDhWRzdwS1pIaFNsTWdhM0RyZEZhWm90UkNkUkFidmZhWVJDRHRO?=
 =?utf-8?B?WXhOY3ozTkl3YURqOW81UVgyTkQ0ckgvMGpFMm5hUVZicExDS1FMb2tIaDM2?=
 =?utf-8?B?V1BmcG4yRFdNVmRtQjd1OFhsT1E0dUtkTllJUlo2QTlaSGJOcXBBM1Q1WGR0?=
 =?utf-8?B?dlRISmxWUTNJbjJWYW9PSG12Z09RM21vc0dXcWEvUFAwbEJFYmlRNHQ0eElX?=
 =?utf-8?B?QzVrMU1uRjg1NUZXdW9kTTRETjlMTjk4ajF1dC9ZUExDWVZuOHNVWFZtTytU?=
 =?utf-8?B?MDJnQ3JFbWxaTkh4dk01cndLdGJHci9YL1hLRWVlNWFmdzRMNitaN1lFbFJK?=
 =?utf-8?B?U0ZrQlBvUHZhak1qdkR3SDFKdFNHSGkxWVZFTnM2WWhYMmRyZ3VLU1NjTEtF?=
 =?utf-8?B?OWtKK2xwNjI4K09ucUMwcnFaYTZSd1dsOGlMQTYrMU9Hc3QzQUszZmtka3c3?=
 =?utf-8?B?V3JTeE54NnJwQm1CTXRQTnFrcWxWMG5kRlJrOXV1Ky9sYituLzFEVlFMR3VV?=
 =?utf-8?B?QWJXR0hZUHloYUZGbWE1czlheDhuc3JwMDB2REtCOXdEa1EwVWNZeXd4dWFG?=
 =?utf-8?B?V2orYUppS2JFOEQwT0wvRG83U3Q1UjlOVFQ1YkkvWGJLRHRRcm5XTHY5TTJk?=
 =?utf-8?B?cWlwWnYyUGY5QUhuZnRqb3BsSTVCbDAzeWludDA2WUVrRVRBMlJVSTdzNlhl?=
 =?utf-8?B?Z3paY0o4bzhwUjFaa2k4MXdtRk5vZkkrL1ZBOWl4SEt0bCsvYkZxUzc0Y2NN?=
 =?utf-8?B?Ulo4RTFrM2NGcktKdHdZMlhtWm5ndHQxMEpTbFJzOU5SWmVzVDBTa2JVL1FE?=
 =?utf-8?B?bis0NDBKYytrbTUyTGJaa012RWhXRzRsM2VtLzRYdzhWSVorYUNFbi96Rzgw?=
 =?utf-8?B?NzFPWGx6VWFraHpIOC9LajkxdjdjS1RrWlhoM3ZkVE5OQjB5YlZkcTgxcHJh?=
 =?utf-8?B?M1EyZ0JGeUwxTGdBUkRRdnA2RjBqUFJTZ3dONlgvdGxMeE0vYkFpN3B6bnll?=
 =?utf-8?B?QW5GS0dIaGR0S25ZZGFwY0ordU40TDEvRDRZVHpvOC9jZGRMQ01NVUdDR3Rn?=
 =?utf-8?B?L1dQeVA1THFSRVVzaDVFQXFwSmJoaGRvYUdnaVpwWE85UE1oZ1NWeFBtYk5v?=
 =?utf-8?B?OVJLWjlDSThGbUZjRysxUmZFQnZYS3ZOaDNabE1PSHZxelZRVmd2UnpRSVZl?=
 =?utf-8?B?M0M2ZXZhVXEzTjRnbFdBTWZLSVFWaFpxYTlHZnFRZGhxWk5yM1RIZ05xMjNn?=
 =?utf-8?B?bC8vNU5GWHRQTFJXR3dEemMyUVRjUUp2Y3hyNkVoMmg3SnY5cTNhMVJFL3Rm?=
 =?utf-8?B?UjJWbzdoNXN0a2NxaVV1TXNFK3ErdTJwaFAyc2IvRUNrTzZyeTlLZFo2bUJ0?=
 =?utf-8?B?R0piOVNJOE1QeitsRGtRSXRXaDhkenZqL3RKa2IvWVU1K3N6NHBucUxZOVIr?=
 =?utf-8?B?VzdSVGxLVEEyTlFxTzhxbkMybmUwZ3ZmUnc3TlZ6TDdpcjFoVEFDc3ppYkhL?=
 =?utf-8?B?OVBXV1JTRVVleGNaLys1QXZGb09pQ1NORlF2VmRnYVVaMVEvSkxHcCs2U3pr?=
 =?utf-8?B?WlVzUCtFRkk3TmxYTXZtQ28xaTE0aE1ZcUhnREZpdzRYTHZ3Z1I3OXFCbEd4?=
 =?utf-8?B?WFVTVHFhY0xveUNhaWNBcThEdDVXdllZYWJkaE5XZXJGbHExTWtqZG9LdEJm?=
 =?utf-8?B?Wml1M2tCdU1yZkZZb2NVNjc4S1dDdnZ2elVxTytGc2tMdENURUxRZkV1Vk5Z?=
 =?utf-8?B?YXdtL0xKbXhscDNkY0NXTGxzRk1DeVU2MCtQQzZkZ2FyaXRTUXphQTVGaDFQ?=
 =?utf-8?B?TFJYdXlFUHIxVmtRUVlpd2F4NTFqRkFwbWU5R0E1bVlNLytJNVM0U3Q5bFND?=
 =?utf-8?B?M3ptamNDK2hLc0ptL3ovMTNBcXQ2aW42Sm1OZVQ0VjNZSnd1amFibW1GemhW?=
 =?utf-8?B?WENPeG9hTjFRUGVpSzlQWEwzVTN0QUZMTzQyZVdRRVhEcFdWdURoSkMwVWl2?=
 =?utf-8?B?N3Y0UU5mOTBNS1NRLzh4bG5NZmN3WVZxaDFTb3hNYkxQT3BHbGZFZ1VCbjhF?=
 =?utf-8?B?cmxSMk56RlFidnZzb2IwbVA2YUtTdlZXdDVMZU9HREVRU1VYUDFzTTlKZ0hR?=
 =?utf-8?B?M2RyU1FOdEQwcG0wT0ZMY3dLME9ydG5XSFZMcDRLYm5xUVJMdGsxdEZiMHJu?=
 =?utf-8?B?N25UVytibUQxQUczdVczU0NsNW0zZEUxWVhsNTJSb0wwczFJQXpZUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2524fa83-daff-480a-6531-08de95a15836
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 19:02:13.5052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 33sZyO/Vhbpwj1PgtXuwRbkRvJbSQONJBznoz/BN69fVyVb9rXCYp6dEfJxNDneXxjNhwhPM0IGbIJb8xZoix9LrFnvdzI9fBSUsOueaWUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11216
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,glider.be,bp.renesas.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31051-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,hugovil.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url,bp.renesas.com:dkim,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 767503C24EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSHVnbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIdWdvIFZp
bGxlbmV1dmUgPGh1Z29AaHVnb3ZpbC5jb20+DQo+IFNlbnQ6IDA4IEFwcmlsIDIwMjYgMTk6MTUN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzJdIHNlcmlhbDogc2gtc2NpOiBBdm9pZCBkaXZp
ZGUtYnktemVybyBmYXVsdA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgOCBBcHIgMjAy
NiAxNzoyNToxOSArMDAwMA0KPiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiANCj4gPiBIaSBIdWdvLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogSHVnbyBWaWxsZW5ldXZlIDxodWdvQGh1Z292aWwuY29tPg0K
PiA+ID4gU2VudDogMDggQXByaWwgMjAyNiAxNzo1Mg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAxLzJdIHNlcmlhbDogc2gtc2NpOiBBdm9pZCBkaXZpZGUtYnktemVybw0KPiA+ID4gZmF1
bHQNCj4gPiA+DQo+ID4gPiBIaSBCaWp1LA0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgOCBBcHIgMjAy
NiAxNjozNTo0NCArMDAwMA0KPiA+ID4gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiA+IEhpIEh1Z28sDQo+ID4gPiA+DQo+ID4gPiA+IFRo
YW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+ID4gPg0KPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJvbTogSHVnbyBWaWxsZW5ldXZlIDxodWdvQGh1Z292
aWwuY29tPg0KPiA+ID4gPiA+IFNlbnQ6IDA4IEFwcmlsIDIwMjYgMTc6MzENCj4gPiA+ID4gPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMl0gc2VyaWFsOiBzaC1zY2k6IEF2b2lkIGRpdmlkZS1i
eS16ZXJvDQo+ID4gPiA+ID4gZmF1bHQNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEhpIEJpanUsDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBXZWQsICA4IEFwciAyMDI2IDE1OjIwOjU4ICswMTAwIEJp
anUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4NCj4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IHVhcnRfdXBkYXRlX3RpbWVvdXQoKSBjb21wdXRlcyBh
IHRpbWVvdXQgdmFsdWUgYnkgZGl2aWRpbmcgYnkNCj4gPiA+ID4gPiA+IHRoZSBiYXVkIHJhdGUu
IElmIGJhdWQgaXMgemVybyDigJQgd2hpY2ggY2FuIG9jY3VyIHdoZW4gdGhlDQo+ID4gPiA+ID4g
PiBoYXJkd2FyZSByZXR1cm5zIGFuIHVuc3VwcG9ydGVkIG9yIGludmFsaWQgcmF0ZSDigJQgdGhp
cyByZXN1bHRzIGluIGEgZGl2aWRlLWJ5LXplcm8gZmF1bHQuDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBiYXVkIGlzIHJldHVybmVkIGJ5IHVhcnRfZ2V0X2JhdWRfcmF0ZSgpLCBzbyB0aGlzIGlzIG5v
dCByZXR1cm5lZCBieSB0aGUgaGFyZHdhcmU/DQo+ID4gPiA+DQo+ID4gPiA+IFlvdSBhcmUgdGln
aHQsIFdpbGwgdXBkYXRlIGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gPiA+DQo+ID4gPiBIb3cgY2Fu
IHVhcnRfZ2V0X2JhdWRfcmF0ZSgpIHJldHVybiBhIHplcm8gdmFsdWU/IElmIEkgYW0gbm90DQo+
ID4gPiBtaXN0YWtlbiBldmVuIGZvciB0aGUgQjAgY2FzZSwgaXQgd2lsbCByZXR1cm4gOTYwMD8N
Cj4gPg0KPiA+IEFzIHBlciB0aGUgY29tbWVudCBhbmQgY29kZSwgdGhpcyBBUEkgY2FuIHJldHVy
biAwLg0KPiA+DQo+ID4gKiBJZiB0aGUgbmV3IGJhdWQgcmF0ZSBpcyBpbnZhbGlkLCB0cnkgdGhl
IEBvbGQgdGVybWlvcyBzZXR0aW5nLiBJZg0KPiA+IGl0J3Mgc3RpbGwNCj4gPiAqIGludmFsaWQs
IHdlIHRyeSA5NjAwIGJhdWQuIElmIHRoYXQgaXMgYWxzbyBpbnZhbGlkIDAgaXMgcmV0dXJuZWQu
DQo+ID4NCj4gPiBJbiBkcml2ZXMvdHR5IGN1cnJlbnRseSBvbmx5IDEgZHJpdmVyIGlzIGNoZWNr
aW5nIHRoZSByZXR1cm4gdmFsdWUgYW5kDQo+ID4gaXQgY2FsbHMgcGFuaWMNCj4gPg0KPiA+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjAtcmM3L3NvdXJjZS9kcml2ZXJzL3R0
eS9zZXJpYWwvYXANCj4gPiBidWFydC5jI0wyMTQNCj4gDQo+IEhtbW0sIG1vcmUgdGhhbiAxOg0K
DQo+IA0KPiBpY29tLmM6DQo+ICAgICBpZiAoIWJhdWQpDQo+ICAgICAgICAgIGJhdWQgPSA5NjAw
OyAgICAvKiBCMCB0cmFuc2l0aW9uIGhhbmRsZWQgaW4gcnNfc2V0X3Rlcm1pb3MgKi8NCg0KQSB6
ZXJvIHJldHVybiBmcm9tIHVhcnRfZ2V0X2JhdWRfcmF0ZSgpIGlzIGEgbm9ybWFsLCByZWNvdmVy
YWJsZSBjb25kaXRpb24NCih1bnN1cHBvcnRlZCByYXRlIHJlcXVlc3RlZCBieSB1c2Vyc3BhY2Up
IGFuZCBtdXN0IG5vdCBjcmFzaCB0aGUga2VybmVsLg0KDQpPciBkcm9wIHRoZSBjaGVjayBsaWtl
IG90aGVyIHR0eSBkcml2ZXJzLCBhcyBTQ0lGL1JTQ0kgSVAgc3VwcG9ydCA5NjAwIGJhdWQgcmF0
ZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K

