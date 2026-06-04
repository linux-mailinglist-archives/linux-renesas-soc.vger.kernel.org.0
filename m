Return-Path: <linux-renesas-soc+bounces-33579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f9d0G7xaIWq7EwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 13:00:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D320263F42C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 13:00:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=pqBusjmU;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DE1730C278F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 10:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DDB2F7AD2;
	Thu,  4 Jun 2026 10:52:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBBF2ED848
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 10:52:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570327; cv=fail; b=rS4j813geB3InN69tXCnt2qeADR5ZF+0ewK5MmQLz5q6/fZIi9bQ7AOVGbPjij5R82YN6eqDTowx2oyzIp4GOL3Hu4as861k/SSvGME+d7lA6IPlSK/0oQwHrdzfq+g8US1hNz0a8wrFS9WYDAWAY+10ZOOU9gegCSAid+Jrozo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570327; c=relaxed/simple;
	bh=v35QY78J5xU2dGXohqMGeAmjVsRCDeorkMMtpJDGDPU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=myOkmgN8prhkQBVwIxl88KHOCPv2KmvOq4UTbZ2tlnXcA6cI5kQkM5Tw9akNvICV0u+rRktmei9iVfWy2qYCTqGPPrVirW3dHOC8O6S5227FFZuR5OIYqFrYSl+7vICqmQt3lQ8+T1gWFgD/qZurtrZMnt6q0S0m87UhYxCWL08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pqBusjmU; arc=fail smtp.client-ip=52.101.125.48
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzV7D2Z3wmKshxfB9L8JnumHEok7QgAZS8SGU0NazGC/07wUQ3OwzABCDB0Fy9dk7cCBHjWQG6q8nOgj4FbbluM1G+bqoZW8WfR3uBO5kL4Oq9MYybauOiEtJZ+N4qF5YulD2MmE00YEDxq5OJq9UzwxSCcBYCi0vcPCtoYsiB9wBoxSjd72wCXl+357pSNWi+V4hHq+SFv/9kdPSpBlzKAxsiZHzrWuoXCnjLRmnlfFon4x5vCr4XMHISfjFO5uD66zpHM6ggry7qfjtwMGjzWk3uTHz7hnq/M3qJ8cIoKmWVYJRMsj153z1yq9EY8qh/JX8hXVzyuzUBLrQvu6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v35QY78J5xU2dGXohqMGeAmjVsRCDeorkMMtpJDGDPU=;
 b=AKVk7DP8al182v2z6BLofvlGuW2+DvujzdvqVwUajBuTE0vj0eANow1e5hNSi9FfXgbjb3GiRo7jH6Yx2EyL7rVJ5zgAefs/OTFDd3/4FHTASG0WnN+ZmRAXOEzRfyUE1SIyZuk9BdXBXwk52VWoNu76v0nUSgKXY+vHLydWlkDLXfj7QpQ++At7i6Tdz6hOGQw1EkX8vKMO+0vPXUeEzWz4KyjGNFhRpH+bnd7/fLBV0L2JQ/s5rk4/9a/od9sauk128i3hiPOo5rRpiAPSHfCM1vW+ghWgn0OagSLJFB+XuOTtk/eJSAcmqjIrPr90VYG0GtBScRY+jwbRGwP7AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v35QY78J5xU2dGXohqMGeAmjVsRCDeorkMMtpJDGDPU=;
 b=pqBusjmUqj/21ZjYk2DQXK2HaSiRdUDBvy4af4KfXrPtE22pRFk99nkSXfn5XjdCkSUl3pACRZHKQMr9RXVkXESs6kvrSiM7Mc/2/l593Tr2PDZbsMyNQAZIeQ0k+WdMNKvCyrojEMIKIFm97gYft2lm6mqEzXnA0t6Nbf1S0oo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14909.jpnprd01.prod.outlook.com (2603:1096:405:252::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Thu, 4 Jun 2026
 10:51:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 10:51:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Dmitry Baryshkov <lumag@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 61/76] drm/renesas: rz-du: mipi_dsi: Switch to
 atomic_create_state
Thread-Topic: [PATCH 61/76] drm/renesas: rz-du: mipi_dsi: Switch to
 atomic_create_state
Thread-Index: AQHc8Dz7Ns1yvGbC1k6wAI16RErFcrYuO/eg
Date: Thu, 4 Jun 2026 10:51:58 +0000
Message-ID:
 <TY3PR01MB11346C94ADB2D6EF95EB9375786102@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
 <20260530-drm-no-more-bridge-reset-v1-61-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-61-875d828d31bc@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14909:EE_
x-ms-office365-filtering-correlation-id: c46e3df8-b878-4247-af2d-08dec2274cfe
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|921020|18002099003|56012099006|11063799006|4143699003|22082099003;
x-microsoft-antispam-message-info:
 cqCcGanaqJZUmSIRJpe2qPT+HlM6uE/o94GumuNb9I0fIWUBQfNXDSE87HGvHL/JiznNW7FNDjBFYtQWRf06KgTjuegjHDtMqNuwC9pUAV13S0EOmhWcnVHJOgSVjM179Xz49pzTyjhSAxLmoElEkhFE99Mts3wks7B/1EL4qcnbwWVKPbEM9S9WZ9PYGIEmn6o4r86BJwWKtvhoNLPjkWY0t4fkz7n1IluRsY5bKJKHGcaCFKK6tq7lupQfYN7U2LzQATRpngpQZByRtMu/mDZVv/MA0EeBfAp1L7v8ZC4weUUG1dvCkA2bV9u0TTml0IhXov85RrDH4DXxJxJ9zVqkfV6xGClpR7rHqHWIJB6JTAGDnjflEicmjFzSESBZDRZvobMXX4/gIbjzpvXqL/blLUVdYhA9pr6SypRBfYvg5kBLtu98TZdElsvFroFb+pgUWOssoz0Yx6VWIgfoiynupa7ooTslJc2eECyzOXAUQcich0s8pnHf1t005QoGXJ2q61KktykZJSGCeQn1SHq4nJQOljrR100Flw84ILE9s1h++pbzDzRTHGPhnjFK4qwdVV30HXro7yzZp1E/pQZL0BJ7DsxLG6kdhO4j983Tka9A3Q9J0nLVf9qbda+gJVgtvs0z2HDoGOy1OE7dACtHVRZjFwO38OytnrrGtQxPNejVQpfH4YdUTddHPdqcIK55/GCWw/jyrhh/dVB/IEpgilpgUVy8y9aLI/cqN58IKr8RCNvnRu2KChgBLqOzXCLIRF5BGeKAGgzsW27ffg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(921020)(18002099003)(56012099006)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YjZ0WStxdS95ejBzWmppUHljOWlDWUNGVkk5R0hpSWhaaTBucDM2NjlYQ3ps?=
 =?utf-8?B?c3ZpamtnODExYVpDOXJ1RUdITWhYdG5pbDJIQUIvNWh3S0RvRTR0Y1JrQkgy?=
 =?utf-8?B?YjBCdXBjb0tTNzU3eVI0eGJxUDdlcy8wcVF5YWxUNTNrNWtaQkJmTWJ6RUZt?=
 =?utf-8?B?SXYvd2taTU92anRGdnlMcTZUeFNERFF0S1FnZG9lVVdFd1hlMFJxamg2NTRM?=
 =?utf-8?B?cEN2dHZtRFR4REZBdnRKK01jSzBTaFR4RGxtbzFXUW9iWmU4bkViL3FZTXd3?=
 =?utf-8?B?OFNOQmVhbkFrQWRqOHlOZC9jOXBnQ1RSdnl3SVNzWVQyVEp2eERqZkRGeEt2?=
 =?utf-8?B?a1JobXVjQ0FnYzhJSHpPQ04rS3pWTzJGWkg0MVBiNmcrSk92UHRYQnFpdWRv?=
 =?utf-8?B?MXhZdXozY2lqT1BDNXh3Rkc3SVVuMEtrU1hFY0dkK2xFYk9zL01RT0pmQjNj?=
 =?utf-8?B?bW9tbklCTDhCZ3Y1RWpyUlVXd1I0NmVyaHV5TnZaZ1k2SWFUdmtIU3JUT3ZS?=
 =?utf-8?B?Qk1OR3NOaFN1VGZwTHQ2blQzNGd4dmlXYU92bzF3OGlrcU42cEFRSVpYbXRn?=
 =?utf-8?B?cVNsdDlIQ3BmdUxraFRXbWVueldZY1ZYZjNFcU1MOSsxdmpnN2xzdFJoVDlR?=
 =?utf-8?B?RlZhS0VtY1BqZGo0ckxjeDFCOVlENHdjci8xRlIzZmhZZUlXa080TFUrdEVE?=
 =?utf-8?B?bWZXdnJSYTdackhvMlMrd3NjYjlISENzYjB5V0hCR3hITEZ6SE8zeW9Fd3Vt?=
 =?utf-8?B?a2hKTGc5LzAwckQ0MlJyR2hzdm5sZU01YjVaRzVlaTl4eFczNmRMLzcyNGxt?=
 =?utf-8?B?Qkc2V21vcS8za3U1REpudklCcW9WdEhyRnpBbENMTTVkTEROWXVZTEhVMEdk?=
 =?utf-8?B?bi95QW8wK24zTS96bWl4ZDh2Z0wrQ0ErUTlnT2wxSEVQMlpPRVIzQXdGUysr?=
 =?utf-8?B?YldIREs5VDRyQ3VCWm1UdXhXajFDUFpPL2NiQ0k2SStub0dKdDFUVGhHTHpU?=
 =?utf-8?B?M2htelNCNzJuTUluZjlwY3NmbmU1cW9rYjhYcUlBVkxtSC9Oc3RvOTlBN2lE?=
 =?utf-8?B?TDM2VDk3TkVzOTFCanFDRHloV1VMT2Q3MkdwTUlCZmFzdGR5MnRzRWxGNVdC?=
 =?utf-8?B?dGtsamcrdll6SWpTd2VVY08zRjNvNU1tek0zMFkrSmRnczk1ejdXZWNQT3p3?=
 =?utf-8?B?VHF3VU44ZlRodFdZTXhUdzR3QnRKR2oraENSK1pjNWJ6aHpNRmwwMExnWTIz?=
 =?utf-8?B?SEZISmZNblhSSTkyRmpWU1lnR0pOU1l6Ykt3WDJ4VEZZcGRIVXRKcTB5Y3VW?=
 =?utf-8?B?WVJCekxDd01LNFRSek03Szd5Y2NTYUhMQXVjcDdJWlhRR2tXb3ZsdzNZeWwx?=
 =?utf-8?B?Z05uMUw5d0YvTHFNVVJwQjhKaUVEVlA3RWhIRnhRVWNkY1F4clI2aXJSZUtN?=
 =?utf-8?B?eWV3eFlSSWZmcWhETUZ6WXF5TkdYMTRFNDJmczFMQ1BqWnVveWt5SlVZRkx1?=
 =?utf-8?B?YmQzc2xzUGJ2R0ZlSnpvT2ptem9QeTkzS2dkZ3Z2a2thOTRYRyt5SkxBTnhD?=
 =?utf-8?B?K1RDRXNQQ25yVGk3OVcrS0lETTlyV3B3WURNOWVpcnN3T01WRkdFbXJLWFhv?=
 =?utf-8?B?Q3pidEhZaDBCYlBPbE5RVVNyeGsxWWVMTXl0UHN3S0Q1UnYwRVpqYXhxSTd1?=
 =?utf-8?B?VTNETXhidG1uZzVZT1lyL09uM0h3M2JCZVduLzZmeU5LQWFnRCtCUklhTWZL?=
 =?utf-8?B?MGk0cVZBUG5GalJYOXBCMHpYbFlidldvRHZDVFhVNzA1Wm5tQnlicXFqaHFZ?=
 =?utf-8?B?V21VanBaY2ZtRzlPQzFYQXhhTDFhZFpKU0FDYm1kSGhHRWxkcS80eFNsTEtR?=
 =?utf-8?B?ZUk0cVIxaS9QbFFjL25zSkRFb3M1cXF0dEh2NTAwSWN4YzFUTDZNejEvR1VJ?=
 =?utf-8?B?Vlcxd3NNR0FUY2lsT0N5KzFLaGtnS0dsdzJtL0tTWDBKcFA1MWMyR0JKV0pD?=
 =?utf-8?B?MkNrdEkzSHdBU3FHSU9OTUc4NFZiZGI0cTN6VmpQNHJaYzdpRXBzMTQvbzBB?=
 =?utf-8?B?WmZCZVV5NEY5L2l5Z2JtUitKQVhNdlZnNUU4SUcyR2pjS3pUQzNEakFXMXps?=
 =?utf-8?B?OE9IdlRjVWtRd2FpZ2RDTXg5ZXNaU25TYmg5ek56NmdmOFloMEEvTzUybU9r?=
 =?utf-8?B?WjdWSEcxYnp1ek1SMmlHbG51SjBRV3dlVWpwZiszVk5yOEp6ejBJZHdlaUtn?=
 =?utf-8?B?K2VxMVFCaXlncVYycUdnV0dHeXpBcWZsWTlFbW5GVlNnbjhENzlDL2JIcHZz?=
 =?utf-8?B?YWNMdlNCb2FTd3lmaEFxOVU1cDEwUWJHWENSQ3dRUDVpeDB5aURtUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c46e3df8-b878-4247-af2d-08dec2274cfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 10:51:58.4411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xBhxQl7rEyThKjP3+3dOFT4Hwp7YW1XHfJMF9QIO4Uo/f/pWZ5kgViwzeGIewncSx0vVnU4Y34y6lPFmA/x6F1uPWjrMtDRPIaX6cWn3cfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14909
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33579-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:lumag@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D320263F42C

SGkgTWF4aW1lLA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+
IFNlbnQ6IDMwIE1heSAyMDI2IDE1OjAwDQo+IFN1YmplY3Q6IFtQQVRDSCA2MS83Nl0gZHJtL3Jl
bmVzYXM6IHJ6LWR1OiBtaXBpX2RzaTogU3dpdGNoIHRvIGF0b21pY19jcmVhdGVfc3RhdGUNCj4g
DQo+IFRoZSBkcm1fYnJpZGdlX2Z1bmNzLmF0b21pY19yZXNldCBjYWxsYmFjayBhbmQgaXRzDQo+
IGRybV9hdG9taWNfaGVscGVyX2JyaWRnZV9yZXNldCgpIGhlbHBlciBhcmUgZGVwcmVjYXRlZC4N
Cj4gDQo+IFN3aXRjaCB0byB0aGUgYXRvbWljX2NyZWF0ZV9zdGF0ZSBjYWxsYmFjayBhbmQgaXRz
DQo+IGRybV9hdG9taWNfaGVscGVyX2JyaWRnZV9jcmVhdGVfc3RhdGUoKSBjb3VudGVycGFydC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4N
Cg0KUmV2aWV3ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCg0K
Q2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiAtLS0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Q2M6IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMgfCAyICstDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9taXBpX2RzaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JlbmVzYXMvcnotDQo+IGR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gaW5kZXggYTJj
ODY0ODYwMDc1Li4wNTkwYWRlOTZiOTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
ZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jl
bmVzYXMvcnotZHUvcnpnMmxfbWlwaV9kc2kuYw0KPiBAQCAtMTEwNywxMSArMTEwNywxMSBAQCBy
emcybF9taXBpX2RzaV9icmlkZ2VfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
LA0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyByemcybF9taXBp
X2RzaV9icmlkZ2Vfb3BzID0gew0KPiAgCS5hdHRhY2ggPSByemcybF9taXBpX2RzaV9hdHRhY2gs
DQo+ICAJLmF0b21pY19kdXBsaWNhdGVfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9icmlkZ2Vf
ZHVwbGljYXRlX3N0YXRlLA0KPiAgCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNf
aGVscGVyX2JyaWRnZV9kZXN0cm95X3N0YXRlLA0KPiAtCS5hdG9taWNfcmVzZXQgPSBkcm1fYXRv
bWljX2hlbHBlcl9icmlkZ2VfcmVzZXQsDQo+ICsJLmF0b21pY19jcmVhdGVfc3RhdGUgPSBkcm1f
YXRvbWljX2hlbHBlcl9icmlkZ2VfY3JlYXRlX3N0YXRlLA0KPiAgCS5hdG9taWNfcHJlX2VuYWJs
ZSA9IHJ6ZzJsX21pcGlfZHNpX2F0b21pY19wcmVfZW5hYmxlLA0KPiAgCS5hdG9taWNfZW5hYmxl
ID0gcnpnMmxfbWlwaV9kc2lfYXRvbWljX2VuYWJsZSwNCj4gIAkuYXRvbWljX2Rpc2FibGUgPSBy
emcybF9taXBpX2RzaV9hdG9taWNfZGlzYWJsZSwNCj4gIAkuYXRvbWljX3Bvc3RfZGlzYWJsZSA9
IHJ6ZzJsX21pcGlfZHNpX2F0b21pY19wb3N0X2Rpc2FibGUsDQo+ICAJLm1vZGVfdmFsaWQgPSBy
emcybF9taXBpX2RzaV9icmlkZ2VfbW9kZV92YWxpZCwNCj4gDQo+IC0tDQo+IDIuNTQuMA0KDQo=

