Return-Path: <linux-renesas-soc+bounces-31317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CPvLVye4GlKkQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 10:31:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D89240B92C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 10:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BC743058545
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 08:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E64138228C;
	Thu, 16 Apr 2026 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JoaNxzDE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B708438F656;
	Thu, 16 Apr 2026 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327907; cv=fail; b=ovmSDhhpiuqz+AHWoSnjMuybKhm+ciuOFcO6qrjSW7S9j3Y0EUbJFN6wQKdE2oRvsBBkYIp5q5A1YkInSKyj17QMTIxTcijmJ+jKZ5L1JgIyhAhpmGIlE8WbrA/dW+h/DLpmzMMJWVSyVr6t9j+JSd9y6Z/VrKM0x5U+bI+F1mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327907; c=relaxed/simple;
	bh=Dwg8ALX3DCUnOi2jQNHleY7Jlr70J/fMj/aCoJM7Q2M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tdb8cEE77RA6DsrPjSd6swNTwiSpx2JuDKHzWv68KYOxa+hvrvqsGqwBrcZeVj4bu5+FUbyt6tNSIWJ+NBE6FF7nQWg9rqnErxsFEDpToO45bnfbhfZf40PaDZLqTnEaO4uMQFx5UN2uindOS/f7ppr60A4D4h/Z9uOLo0recwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JoaNxzDE; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWS4sS3ITFOiattR9WWjXa25JWFcAdFvue5raj1wH5BSm8ncbAtw0wvHfGorrIvyndjmV9MkAGy5sMava/xbp1NY39p/e49DBQZLPfujDfObbVCLU+JNDiTYI4FGPnO3C08sAl+BroW8nzlCd7at1yWrFGUZpnpSOMFfxi1kKgZfYbDGrnW2otRR89zmh0MlnlY832HrVeIt4q+/6hG+mVIgjAznbp5TjlA6sQ/DM114+OJUSASUyRWEkwFBCpde2vW2JYlk0PQFVNJnAGGYNxvbImqRsy9R18Pqb1hw77SV+cg+LsDyeR4iSI8pX7wlIEX+wb3gfr7VTd6S6ydEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dwg8ALX3DCUnOi2jQNHleY7Jlr70J/fMj/aCoJM7Q2M=;
 b=FudTMzJgS+1A/JyisyG614xrXeTiblO/tAbjW17o5xBAHh+Onqw85CdBgb+9FGgHIeGZJpOYEvRfm8RWqusQFBhDNvlQBDNK+Kg+XVixfw+HM1E0WNChyjdSZBeB7F2l4IhjTHSaJMERrdtL0f6rGQY5PjuYLuNoKtZjq8YuzsZAUFoj4SJzwqHVMcHBkGRWpMG2sl3ce3pWnh3rT2+zg4/AR0hQ/dQ+Kzxguj/ApztoKeFV6G9yhjJWSVqr9ki1Xv71H684gcr+0BgjTF/dOMTMyJvxNmy1ArFpxHK8fAfIjRLMNNA3VFlBE8vBw0roKddKlpnvpyDGdOpZ0n7J0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwg8ALX3DCUnOi2jQNHleY7Jlr70J/fMj/aCoJM7Q2M=;
 b=JoaNxzDEyJsyTbtgTPoginseL9ymSDJ9Jz2C0rx6+8rk/opdx/PVqFwrPZcLLXsctd6cDLl0dpB8Yto2FRvRmivBYlAS2i8OFlZeC3oQRouiD+8O7jBaMxbKyveUKp44zeetIyvtMwhdLrJ2JCPnMWfogweoh3G35mV9ZBzHJns=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB14091.jpnprd01.prod.outlook.com (2603:1096:604:365::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 08:25:01 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 08:25:01 +0000
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
Subject: RE: [PATCH] drm/bridge: ite-it6263: Add basic resume support
Thread-Topic: [PATCH] drm/bridge: ite-it6263: Add basic resume support
Thread-Index: AQHczMyZQlW0fW58u0OZPuZRZOfKtLXhMQaAgAAqDXA=
Date: Thu, 16 Apr 2026 08:25:00 +0000
Message-ID:
 <TYCPR01MB113323633C95FF6A98B66E6F086232@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260415113954.179006-1-biju.das.jz@bp.renesas.com>
 <69e04806-5ad5-46f4-b65b-c88af477fd94@nxp.com>
In-Reply-To: <69e04806-5ad5-46f4-b65b-c88af477fd94@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB14091:EE_
x-ms-office365-filtering-correlation-id: a59e4e77-4331-4df2-9d6a-08de9b91a70a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|921020|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 +XvwgGQqV05pyd+UKEvWzSy/1Ic2zuR02FB6Psh020yYcLvKX9BytbhfD5evquzbeEx5IzqjzWgji+RuJrhU9KY3K7B592wAthDhCbrvFaMTQI2dgXRgg38YTN+ai2WFgFHAxYbtLWWgwXPHVUSZ3s6rLdZXnDgIMTXXpJvFmpdAnLfEt+FqnLSrEtjclPkYv1Mqq9iTHboHOCCMZOUr966uDT4aZ16bZcuG8/kQaWafGztnTRE7cCRjJ7kFhjZ5mVKk+EsX9MRRhWI/UgZuJIfpkHmq3o1oiMuV9xoiWoiWyqpTsRSxm+4rSapqWuWLilNdf/OoNNZ1YrAopz0R5QW+lrrKwG9nu15fGr1z05SeDxRUQ+Nm20shKIqWz/W5nm7j19jlOqDjbxGmQCVYcnq5sZKp52jRCIa6eTiBxlUhAbMeZ5Ai/CdwkkDIN1oZ1/zYSo3t+OrpYDvMHn6J82At8YCm6w/3nfFeSGnsl/+BncHrrbB49kqfSZmKgdUV8QEzDTlNVrefmmTW+0hd8+skw7pUV0927DHEe83Md70Prl4xtfVxgiE8AjAzHbq1pyxYDD4gmUeIpb6zXc3tmBWtVxrHtnbwSWb9b06d4a3br0FFaKZdzZ+aksWzlIhVKH2R/XuN435h2679SsnGq/09C6OvMruNRI2YTWllN6Grz1tnSra5yKvFTOSDY+fylrjOULaw6WndGiIHD+KCbdMvW435w9YrWvzhNpFaZsIIlgGiNwFt2T8/8k9v4QEZ5Vaa/Ozoxojj42Fx6Sw8Qt/T3/v9XtosJaP34ONaRcuG6WlZ2ceolbVpLPcR0hPu
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SkovdHlybGpuWm0zbHNFZzZkSjJ3b0gwYVhlRWRyS1JNR3FoZ3U5c2N4UXY4?=
 =?utf-8?B?N2FUYm55cHRLdUozRXVUZjI4SmU5NU9ObEdtM01VNGRBeGRmMmlqNVBqbDQw?=
 =?utf-8?B?RHVLam9jTVcvZ0FoampJZXBiZk9Yc1kzRkZMQitOKytUMXhEMjV2MDR1b2hM?=
 =?utf-8?B?N2lHVVFXQ1BmK1NmS2d2YTRMV20rK2ZOMU5JeXRiRlBYYmc0Rnh6Qm81OFk1?=
 =?utf-8?B?RlBOU1dvYnFxZjFYR0NnWEl4UHRHQ1JJWW5kZWRhU3hVeGErQ1FBMUdlNm1L?=
 =?utf-8?B?eHF2UEhVN3EweE9xMEhvMWZTRjNjKzVrWWgzMWNzaXBxVlluTWZNd2xRaUJq?=
 =?utf-8?B?RE5zbUQyR0tseEczcStGWkZ4MHF3ZHBMZ010dmJDdzRMUi9wU2xROG51RlZQ?=
 =?utf-8?B?cGd4cExNK2NvV1d1Z3dDQ3NQc2lVSHZzRThBV1FwTTV5bGhmbGhmVXpoN3hj?=
 =?utf-8?B?M3JQcmM3c3pwdjhNZEJ6R3hIN1NuKzRYTDVodlpOZVZmTHBYVndJL3NXT2c3?=
 =?utf-8?B?b0hVUUk3cjh1WUVIcUtwcWpxMTBLOHZhTXRockJneVhOZWJNcVFlcTY3WENX?=
 =?utf-8?B?ZG04dnNqY3d1aDZ0TUs4R1ZBcTRCSzBRYkNLeU5CNHN6WHVyQklhSndiMFoz?=
 =?utf-8?B?OGZqcWRmS2xHUzJVRWNBeUxUUUpnRkVWQmlKUWtIbnBWRzY0d1plYUdUUFpw?=
 =?utf-8?B?eEF1d29pa3hkWmdtcFhxRjhiUFJCdVdHRnA0c1ZMeGMxNlNHblBwZUd2OGpK?=
 =?utf-8?B?bEhCbU9BNzE1c1Y4NUxBUW5MYmpwMHpoemMwemdDbThENTNJVmkwRTE3dmxh?=
 =?utf-8?B?ZjQ5RjJ2ejUrTG1TdHp0cnRVNnFzakRLVXdqQjZXV2NYbWpuRE9Nak9ZNUtM?=
 =?utf-8?B?cGl0YUJtNXpFSFNoUkZQRWpRV2F2aUVSb0RYSmlRMW1VRTMzM2JiY1RDTURM?=
 =?utf-8?B?VThxYlgvb1R5eWZabG9jeXFVU0ppeWhCN1FBd3ZKYzJZOGQxVElKaWJoMWpa?=
 =?utf-8?B?bVNNTnBNR0dURkUvb0RmcGRKbjY1dWVTYmxzcFBNN1lvQllWWkYzeWRvM3l2?=
 =?utf-8?B?ZVIrL0NZWkM3ZExqalZBQ2l1NnQxaCsyTDBTdWxaNER4YytmVGNiYTQrUm1k?=
 =?utf-8?B?elN2QUVJZloyWW1GWlpuelcwcVhuVzUrV0RlWXF3Z3Fmb29KSW1heFpxTTdT?=
 =?utf-8?B?VVloVUFDS01sa20weXRSeWp6N3R0NHo3Mk5xdDEvUzIwRUVzOHc3Z2dPV1lN?=
 =?utf-8?B?dGlMU3FxZ3BFRkxOUXVSR0J4cGRPTUFLUlRlZEdyR3A5cjNkS3IrNkZwTXkw?=
 =?utf-8?B?MjR2eW5SVG1sMGVNWExlWUtnQ3R1NEpXbXlLMW51bUlXVSs4cE4rejc3N3ZN?=
 =?utf-8?B?UHROd29jL2QxOFdKY0VYMXBRcnlQTUtZNDlKQitFSFBBSWp2eGppUEFMdkJR?=
 =?utf-8?B?QlNLdk5MQ0ZCVkNmSG01VzU3UTdmUFM4VUlZY1FwaDVWM2lMc1BGNXZBcEYw?=
 =?utf-8?B?Q3grT2w0SFJIaVZiY1lvRkNpUWZNTWpub2Jjd2FyektWVm5GYmZ5bXhIUjR2?=
 =?utf-8?B?ckJ5THJ5a3lIV2NRa2hQR0phNXVqUHhudTJXeG45VkFRQ01tZUNwbTc5M1lD?=
 =?utf-8?B?aUJlUm93Sm9pN3NNRWNPOERKNjBuZ25PVlJrTC9RMnR5VlZIZi9xbTI1OXJB?=
 =?utf-8?B?OFo5dDJyV2FzMng1c25PU05EREk0K1QvOExUZE9tMTFuQ3lEdFVSVjdLQTRi?=
 =?utf-8?B?MlI3LzdDV3FDQk9LVUN2cmJaYWdJN1NGNkh0UWlWcGdNKzNKUmFabXhpdUtj?=
 =?utf-8?B?K29rL2l0UHhQbDdRdkhlb2RFSVFKclpybkVQMnkwcHY1QVhxZ1REWHlERHM4?=
 =?utf-8?B?Z0hiN1g1TFFHNWR4d25WRW91bEFaYTJFVTZuQVMxdFg1cDljUy8xci9XcWh5?=
 =?utf-8?B?Q0dpejhkMmdsbXVEdW9IalJJSGZVMmVGdDNPTGw1amNlWm5jL255NXlpZ0VV?=
 =?utf-8?B?K25MRHpWTmlZTFRHNWtoNG1ORm5BTFdIVXVNY1c0L1AxY3pBc2ZNRXNkQkZn?=
 =?utf-8?B?UFZsbnpzZWhjSm1ERjNCRHpWQjhoRnk2MEVFSmMxbVFmOGVHNlVLeHlyeTl6?=
 =?utf-8?B?Y0Nqd2I3dWRja20vRFZzWitPdFlHVXIxQW1CS1phOURjWXlmWEd0N3cxYUNW?=
 =?utf-8?B?MC92aGVsTHhKRmNCdEhmS2RCZzdvUTgvQ0owV1dVdzFabFVDR1JGSi9KV1NG?=
 =?utf-8?B?d1dkQ01Rd1JETXNiL1hYTkFRUXBpeEpNTjBLRExPNnNkU3VCZUF2L2RGUHR0?=
 =?utf-8?B?NmtNZ29vbVM0QVIzVUhOMnRTWUtzVkMvSUlFclpoRzl3S3hoekxzQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a59e4e77-4331-4df2-9d6a-08de9b91a70a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 08:25:00.7761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sB7PBq60HTH/VvlogZOivVaCyeepUQHrZi8H3omKZdMvoV6ddJ0YEd0S/zwcbIu2Xy/Zg8XKKXBf8VlpxmUqP+Ox2OwGhk2+9oaRtl8YwLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14091
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31317-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[aka.ms];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 9D89240B92C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTGl1IFlpbmcsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+
IFNlbnQ6IDE2IEFwcmlsIDIwMjYgMDY6NTMNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2Jy
aWRnZTogaXRlLWl0NjI2MzogQWRkIGJhc2ljIHJlc3VtZSBzdXBwb3J0DQo+IA0KPiBIaSBCaWp1
LA0KPiANCj4gT24gV2VkLCBBcHIgMTUsIDIwMjYgYXQgMTI6Mzk6NTJQTSArMDEwMCwgQmlqdSB3
cm90ZToNCj4gPiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGJpanUuZGFzLmF1QGdt
YWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMNCj4gPiBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2Eu
bXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gPg0KPiA+IEZyb206IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFJaL0czTCBTTUFSQyBF
VksgaGFzIGEgc2luZ2xlLWxpbmsgTFZEUyBjb25uZWN0ZWQgdG8gYW4gSVRFIElUNjI2MyBjaGlw
Lg0KPiA+IE9uIHRoZSBSWi9HM0wgU01BUkMgRVZLIHVzaW5nIFBTQ0ksIHMycmFtIHBvd2VycyBk
b3duIHRoZSBJVEUgSVQ2MjYzIGNoaXAuDQo+ID4gQWRkIGEgbWluaW1hbCBzeXN0ZW0gcmVzdW1l
IGNhbGxiYWNrIHRvIHJlc3RvcmUgdGhlIGJyaWRnZSBhZnRlciBzMnJhbS4NCj4gPiBUaGUgaXQ2
MjYzX3Jlc3VtZSgpIGNhbGxiYWNrIHJlLWVzdGFibGlzaGVzIHRoZSBMVkRTIEkyQyBhZGRyZXNz
IGFuZA0KPiA+IHJlY29uZmlndXJlcyB0aGUgTFZEUyBvdXRwdXQuIFdpcmUgaXQgaW50byBhIGRl
dl9wbV9vcHMgc3RydWN0IHVzaW5nDQo+ID4gU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMgd2l0aCBu
byBzdXNwZW5kIGhhbmRsZXIsIGFuZCBhdHRhY2ggaXQgdG8gdGhlDQo+ID4gZHJpdmVyIHZpYSBw
bV9zbGVlcF9wdHIoKS4NCj4gDQo+IGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfe3N1c3BlbmQscmVz
dW1lfSBjYWxsZWQgYnkgYSBkaXNwbGF5IGNvbnRyb2xsZXIgZHJpdmVyJ3Mgc3lzdGVtIFBNIGNh
bGxiYWNrcw0KPiBzaG91bGQgYmUgYWJsZSB0byBraW5kIG9mIHByb3ZpZGUgc3lzdGVtIFBNIGZv
ciB0aGlzIGJyaWRnZSB0aHJvdWdoIHRoaXMgYnJpZGdlIGRyaXZlcidzDQo+IGF0b21pY197ZGlz
YWJsZSxlbmFibGV9IGNhbGxiYWNrcy4gIFRvIGRvIHRoaXMsIHJlZ3VsYXRvciBlbmFibGVtZW50
LCBHUElPIHJlc2V0IGNvbnRyb2wgYW5kIGJyaWRnZQ0KPiBpbml0aWFsaXphdGlvbiBuZWVkIHRv
IGJlIG1vdmVkIGZyb20gcHJvYmUgdG8gYXRvbWljX2VuYWJsZSwgcGx1cyByZWd1bGF0b3IgZGlz
YWJsZW1lbnQgbmVlZHMgdG8gYmUNCj4gYWRkZWQgdG8gYXRvbWljX2Rpc2FibGUuDQo+IFRoZSBi
cmlkZ2UgaW5pdGlhbGl6YXRpb24gaW5jbHVkZXMgaXQ2MjYzX2x2ZHNfc2V0X2kyY19hZGRyKCks
DQo+IGl0NjI2M19sdmRzX2NvbmZpZygpIGFuZCBpdDYyNjNfaGRtaV9jb25maWcoKS4gIE1ha2Ug
c2Vuc2U/DQoNCk9LLCB3aWxsIHNlbmQgdjIgd2l0aCB0aGVzZSBjaGFuZ2VzLg0KDQoNCkNoZWVy
cywNCkJpanUNCg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9pdGUtaXQ2MjYzLmMgfCAxOSArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxOSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9pdGUtaXQ2MjYzLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRl
LWl0NjI2My5jDQo+ID4gaW5kZXggNGYzZWJiN2FmNGQ0Li45NzI3ZWJlZjQ4ZTggMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2MjYzLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDYyNjMuYw0KPiA+IEBAIC05MDYsNiArOTA2LDI0
IEBAIHN0YXRpYyBpbnQgaXQ2MjYzX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+
ID4gICAgICAgICByZXR1cm4gZGV2bV9kcm1fYnJpZGdlX2FkZChkZXYsICZpdC0+YnJpZGdlKTsg
IH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IGl0NjI2M19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgaXQ2MjYzICppdCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
Ow0KPiA+ICsgICAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgICByZXQgPSBpdDYyNjNf
bHZkc19zZXRfaTJjX2FkZHIoaXQpOw0KPiA+ICsgICAgICAgaWYgKHJldCkNCj4gPiArICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKyAgICAgICBpdDYyNjNfbHZkc19jb25m
aWcoaXQpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgaXQ2MjYzX3BtX29wcyA9IHsNCj4gPiAr
ICAgICAgIFNFVF9TWVNURU1fU0xFRVBfUE1fT1BTKE5VTEwsIGl0NjI2M19yZXN1bWUpIH07DQo+
ID4gKw0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBpdDYyNjNfb2ZfbWF0
Y2hbXSA9IHsNCj4gPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAiaXRlLGl0NjI2MyIsIH0sDQo+
ID4gICAgICAgICB7IH0NCj4gPiBAQCAtOTIyLDYgKzk0MCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaTJj
X2RyaXZlciBpdDYyNjNfZHJpdmVyID0gew0KPiA+ICAgICAgICAgLnByb2JlID0gaXQ2MjYzX3By
b2JlLA0KPiA+ICAgICAgICAgLmRyaXZlciA9IHsNCj4gPiAgICAgICAgICAgICAgICAgLm5hbWUg
PSAiaXQ2MjYzIiwNCj4gPiArICAgICAgICAgICAgICAgLnBtID0gcG1fc2xlZXBfcHRyKCZpdDYy
NjNfcG1fb3BzKSwNCj4gPiAgICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gaXQ2MjYz
X29mX21hdGNoLA0KPiA+ICAgICAgICAgfSwNCj4gPiAgICAgICAgIC5pZF90YWJsZSA9IGl0NjI2
M19pMmNfaWRzLA0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMs
DQo+IExpdSBZaW5nDQo=

