Return-Path: <linux-renesas-soc+bounces-29629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMRXHP2CuWmxHAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:36:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4C52AE1A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8526B3011CAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF083E3DAB;
	Tue, 17 Mar 2026 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OIdltp0U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275B22D838C;
	Tue, 17 Mar 2026 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765370; cv=fail; b=Wh7Zc7yC0Jb2vOsDqUJExQzWnfXzStpwXm4g838wlN0ZnoZ6xc+yZxkNGUHYO9QAPJ/PSgEc/leAQFE6J2w4pd1aRXpXUoAW4AlmRZDiZfLevTWJURtG6gYmKvih3KtrkxT5W5uENYfUh3mrKSqeCwx57SL41DfEj6zVBqEzfe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765370; c=relaxed/simple;
	bh=a4vOF4eDgqGQaJCGD1thKZE/uzUJwroiWlj4pAsWvfU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B2npXjfAj6lv+C/1Pg6JEd6zbbzL3CkNGG2AX0EeI0LXd3zjoe+Mz5GMh7bKk25yXc4k571j13ILjSjYNbL+lJ7mpYvXnZec5/HnteNd440HHMFmqwCRGL5wQGwUAzwhkF0Rn/zzTqK7vIu+QoBDGYeZRrCtpvCv4+nkBo0DyPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OIdltp0U; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3SZg7XqFzCq62w7bmPbH3Ick7pc0R+fwZwLwQVMYZGUd1eTXHi0HZLvGkN3Pn9w3ENnSP5O8px9w8pVqngwDP3URxbBDiuseQod0FuZXZns59VbX4lMmiHEX2DWOiCivIp6yBw8TPVGLCJUKdRPSEiejrcABahErsivprnCmrVomHgznlUoElspvQTOvDGRlRx3BzGhEX0b0UnMWWzOebLX7zmiisUi/pNeQLjuwqMUg9QS749jERvWpGL1SAWmHjCJwMsbSyJFS5zKUABpEexs/eNIcJf1KpZuBGpZPLSWY3rpSPQAxy0Zl8hiOllcO2vJsdpcrgJbNKBty/TJOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4vOF4eDgqGQaJCGD1thKZE/uzUJwroiWlj4pAsWvfU=;
 b=qf0InBnjigPXFjCA4d42FzXU1mUdmFw9OlK/JY7gMTz1k8+gf7FTyShMSl1pb8dpay7RZEpPbPi6ldhzrxThTsy1D4+anWY4HgKb+UEyCF8tlaLLXGeZhOxXNfi/vJZs0uHu7a0v4lLfajN8uUHEI/tEhZ0ORP1WPRHrnKxFIkx3UnAqGI7w4L6jB0AmRKlLglDsC89qoCPcFOUdh3jRjNfEmhp0hR++KDMK2RWBk+hSz+rJzRifLhajPqcpD9p1Q74D+FUJXEJePWjn1nNo1xbbsk6HziwZ7dXz3Oaj8ikrn7esmOSOqq/saOjCMUfWSKa1HheBiWRT6iBmHjZJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4vOF4eDgqGQaJCGD1thKZE/uzUJwroiWlj4pAsWvfU=;
 b=OIdltp0UkGjpikuD4YtY6Lt/3ot6raa4+yoiclIbypKc+eUuIN2XnpS+eHOXXKFaxIj812KEymG4FYZzfdpPimWKCYduizI7uQ0x321U29tyylIvLVy/bs74O81QzDT3AJGioFu6+QRN6MZV1XOQacIrcjdXt9qqU8YnmyOinvA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14267.jpnprd01.prod.outlook.com (2603:1096:405:20c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 16:36:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 16:36:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: biju.das.au <biju.das.au@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Chris Brandt
	<Chris.Brandt@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Topic: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Index:
 AQHctgqqun0iZdWPQkGCYHsU3REA1bWy0bQAgAAAR5CAAAU4AIAAAlBAgAAMHwCAAAKV8A==
Date: Tue, 17 Mar 2026 16:36:05 +0000
Message-ID:
 <TY3PR01MB11346B55F3F5C28FE9E763AF48641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
 <20260317123610.329630-3-biju.das.jz@bp.renesas.com>
 <20260317110112.338259354289bb60a57fc259@hugovil.com>
 <TY3PR01MB113462F9E8CEA0506984299768641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260317112052.3dc4b56b42b906381df80e94@hugovil.com>
 <TY3PR01MB1134627E19FCEA40819F8C6578641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260317121232.39b1728e4d53d7243856a403@hugovil.com>
In-Reply-To: <20260317121232.39b1728e4d53d7243856a403@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14267:EE_
x-ms-office365-filtering-correlation-id: 6f3df228-c14a-4714-b39a-08de844348f8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 qdMLayNFmRI8xT6tJGoUttzu1HeHRjaAZL7rmmMr75UUX7ncZpo6KNgkxzUg4OBlopLwmV/94V9l2PATZCyj/lEZ61WI1j7dlXHthEX3rHOEgTyoQJdpu6+/CcgPefHcnp1LyCVq4BN/FuzMxM0WH8Mb3oQrlbQP0iMs7F3NMxHnDFyDZnletLqzr7T84R7S+cgTnyg+g6zBGKxJc27RcNqBGXA9HzzybIPlmxuyEnAMShRDJG6rzmxs7POjw6RHvNTSxXEwhnaynpXdCb5XZ58iMXuAr5TxuJ5wDTq9AVKT3FdSUyRUyKK8IsrogVXf7nU8+RvuOheb3lHmJiqYlKqsy5ZRacrfNQ6T4HbOmcKFwEko50SstHeBeSHZGzBNo4VcwfJ9BTJlX5JEqKrzSSSipZrCagl8TNwluE9mLZN6pvW9e9lM73NlB8MIKqcU1U5pJN1D1ezL6BRNAPLZLmIiuLSXUrqnlP7NzpxFP1zvMjhhPEPzd21JX1anhb9+2CNqNuWaEpsjatJ1cYXCh0DBp/Za3txkytbWfmwX3QNHGSIkWb7Pm1NZXVVb3EA0XNC1xqL/ypD3DfIooZE4kqQ30Qo8hqe1LjnlOOPPXC52KFAKxa2HxJr+SvqCLyfaROyjigpyMtuvyp8SEv+Zn54RJFJmwZBcoUzI1l//vQXe9mF3PZiTnZwD4B0zB0UyA2plCrDq953X26nOQO7R1dFFYI9YIcftyhhY2Kfd1nBK8rO1iw9aLGmb1dtRLKPy0LmfcuTQ1x3WoTd9QS8U4cOybjFK3U+1eGZCFKgUh6M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2h3Rnk1NCtobUd4OFd6cjBBMzA3OHY4OXI5WVA5ajRqWGMrZGJodUtyOG5u?=
 =?utf-8?B?TnRHRTkrQ1VMajdlSWNYdlBNTHA5T3V5TnptSFhTOWhZMjhLY3Vxdld0TmVC?=
 =?utf-8?B?L2ZSK2wxSk1zNlc1RXA5clFpSllkbldDVHY5eG9LOTRFOXY5OEFzNFJVN08z?=
 =?utf-8?B?a0NpSEd1Qi9Qckc2REZzb2JVZDByc1FwNVR5KzkrNVJxazRsQko4ZzE4am9z?=
 =?utf-8?B?MHBwTDhlYmpnMTVpRk5ISzM0ZUQ2RlFCdHFKRkRCUUhlWU84Rm9zZEVpMDYy?=
 =?utf-8?B?dXRVSTlEY3AwL1NvbFhUSDlYSzBVYWZUbzVTMkJqTVNWNWtkYzNJZDRCZ2dw?=
 =?utf-8?B?MjdsQkRVUWRrKzgrNklzY054eENxVldiN0R0bnFJVVhRNzhvOElEZGNsUVZO?=
 =?utf-8?B?ZmZHS1J5bVpuTlY2UHZLd2dGQ2R5ZE9IVjV1OUpGZ1pneG5zOFVFa2pZTktU?=
 =?utf-8?B?SVIxaVM3cTRJZDRKNSswSnJYZjY4UGdYZnNGaUFkVXA4enBLejdpNXFmSlhv?=
 =?utf-8?B?UWJMU0JFeFFxdTRVeWUxTXI2RE9DUkdrdjMzMXgwdW1URjluWm9BQWdtMm0r?=
 =?utf-8?B?RG43bVI3RjIyQ0R3YjNxVFJ1ZkpObGlnazZnNFZlcnIvSlFISEVKUXl6UTU4?=
 =?utf-8?B?eDVNeHkvb0ZJekFXc0ZoT0E1ckZWOEI4OXI3ZkV1THc3Z2xQOWw3TW03eWhK?=
 =?utf-8?B?NC93S0Q3YzZsYVJBUmpCQ1FjWEVtWktwRkxGQU5kcmR6YnhNRGd0QkFtNys4?=
 =?utf-8?B?cGpVTytSZDN5VWdHNW9jaUhoRXAvSDZqbFkwbVhPbUxNQ0pLRUZlOWxlM1g5?=
 =?utf-8?B?VWU4VzloMG5NQ2RLZnc5Rkp2NWxNM1hxZXZrdkxtZzdDOXEzdVZvUU9ORVo3?=
 =?utf-8?B?T1Jqays5Wnk3c1gycXZ2anpaaDNtR2tCOWdCZW1JNEtDaUM5Z29hMUdDbW5R?=
 =?utf-8?B?OTRmWFhCUVhtOUxESzhESnhIeGZSVnowZlVoUFlOM3FxUlRaSWR1RnFMTzZU?=
 =?utf-8?B?WGlwVWt2eG84WmlNMU0yRGQ5bnFiSW1oazRqSi94aFNpZVJOa0tpV3ZhUmNs?=
 =?utf-8?B?bkphTHlKSENCSUhKSVMwc3Q5S0dYOXdJM3pyM0tNaTlvdk9wbnRwcjRXQ2Z3?=
 =?utf-8?B?Z0tkeDc4dCtBaThlN2VBUiswamZRaTBPWlk0dC9wbEJBRVkrTVZxeEZFaGZr?=
 =?utf-8?B?MVVNNGxlSkZrWHR1Y2dXdldHUDNuMlB2RXB3MEVWWE1VSGVMckloUG9pMEc5?=
 =?utf-8?B?L09NNlR1RDZPZHVjSzJVWldwOVJ6N2xBdjZQdGR3T2FZV0Z2WXZPQi9KaC91?=
 =?utf-8?B?NlZub0dJc2xJTWxzalA2QllHTTZuOWdZZ1FkdnI3VVN6ZEdtMHVzK2puUVJs?=
 =?utf-8?B?dEUyWXRtbmtiQWRZbVU4Z0Zra3kvK0lvakt1d0ZIY1REWlEyd0hJK011WUVa?=
 =?utf-8?B?Rktvd3paSzdoWW16eU5Iak4vZ3lvNzQ0NWZlR0N2U0VweGkvZ3Q2bkhjWloy?=
 =?utf-8?B?NW1UL2drSVlxUWs5VUcvSWpNb2JLM0dYMEVhZmlwdzI1eHlZbnVaajFTZjA5?=
 =?utf-8?B?UmVFd3RuSU1yaFBWWmVZczdIemp3RUhBelNoVnk2QmZ1K1UyT09YTVJ5NEpu?=
 =?utf-8?B?ZENFTWtBY2gzaUtlb003aUc4UVAyeTBGdGZ2cUJidnFka2lCWDBpQjcrYW91?=
 =?utf-8?B?cjBJNUFsS3gvNEhEdTlySHhGNVVMRHQzK2V0OFlBTkdRWEIya3ljbnl6T0tF?=
 =?utf-8?B?cHNaL3NBdGlKMW1GUk96S3c2alRZa0prUk42a3Y0OStPMEd2Vlgrd0k2SGZO?=
 =?utf-8?B?MTM5WjN4NlVjbmM4N3o2NXBZamUwSkQwblhTRERDQUhyWU9wcHo4SWJBZTJ0?=
 =?utf-8?B?KzZCejJURjJwR3p6b0FkQk9idzNVOWxha1NLSnRPNFh6ZGJOVGZRTlhSdk4y?=
 =?utf-8?B?dlE5TGFxdHFmQTJUSWtjZkN5V2RjSlF4dkkvUlAzRG4wOGZaZGdWbVMwNC9P?=
 =?utf-8?B?b3JuTWZiYkJGcFhrdVUwRlh4QWNXenFwQ1VjSFBxVUFOMjJtQktKeHlEaUZx?=
 =?utf-8?B?akp6UkRuUWVWTlUzWGpIQlo0cXcrK3V2VzBxdHVZUTkxU05KSG5wSnJ5bm5z?=
 =?utf-8?B?MjUyTW5sRUIvcEM1RzJEanJkYjRrTU91dGRtVXU4YVFKU3hHUDZVdklvVEdu?=
 =?utf-8?B?M2VKUTBxVUxLSXFLWEp2MzRESTBPWEE3dk1JNXBRNjJHNUtxenNMbTd2UEJS?=
 =?utf-8?B?YTVZQzFlOVkvcU02R1RoZCt5elhjL1FUc0tMYURXRDZFT1VFcFhicU5rVE9o?=
 =?utf-8?B?TXZLcjE1UkhzYnA0UlowN2VCdEFsUlZPOEZiRDJDZnU1Y29ySzRxQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3df228-c14a-4714-b39a-08de844348f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 16:36:05.4731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2R+O1ZHrTYupUmZn31fecxJMpLVhwkE2CNgi1BpPXYR3XoFClL2hk7/GD+J3z0MrfJlM0HR3D88VrZkL2AcJwyRiJLgTfAkcKBRUIOT1iXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14267
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29629-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,renesas.com:email,lists.freedesktop.org:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B4C52AE1A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSHVnbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IEh1Z28gVmlsbGVuZXV2ZQ0KPiBTZW50OiAxNyBNYXJjaCAyMDI2IDE2OjEzDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMi8yXSBkcm06IHJlbmVzYXM6IHJ6ZzJsX21pcGlfZHNpOiBGaXggdGhlIHBv
d2VyLW9uIHNlcXVlbmNlDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCAxNyBNYXIgMjAy
NiAxNTo0NToyOSArMDAwMA0KPiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiANCj4gPiBIaSBIdWdvLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZg0KPiA+ID4gT2YgSHVnbyBWaWxsZW5ldXZlDQo+ID4g
PiBTZW50OiAxNyBNYXJjaCAyMDI2IDE1OjIxDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIv
Ml0gZHJtOiByZW5lc2FzOiByemcybF9taXBpX2RzaTogRml4IHRoZQ0KPiA+ID4gcG93ZXItb24g
c2VxdWVuY2UNCj4gPiA+DQo+ID4gPiBIaSBCaWp1LA0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwgMTcg
TWFyIDIwMjYgMTU6MTM6MDcgKzAwMDANCj4gPiA+IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gPiBIaSBIdWdvLA0KPiA+ID4gPg0KPiA+
ID4gPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gPiA+ID4NCj4gPiA+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVs
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbg0KPiA+ID4gPiA+IEJlaGFsZiBPZiBI
dWdvIFZpbGxlbmV1dmUNCj4gPiA+ID4gPiBTZW50OiAxNyBNYXJjaCAyMDI2IDE1OjAxDQo+ID4g
PiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGRybTogcmVuZXNhczogcnpnMmxfbWlwaV9k
c2k6IEZpeCB0aGUNCj4gPiA+ID4gPiBwb3dlci1vbiBzZXF1ZW5jZQ0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gSGkgQmlqdSwNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIFR1ZSwgMTcgTWFyIDIwMjYg
MTI6MzY6MDEgKzAwMDAgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPg0KPiA+ID4gPiA+IHdy
b3RlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gTW92ZSByZXNldF9jb250
cm9sX2RlYXNzZXJ0KCkgYW5kIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KCkgZnJvbQ0KPiA+ID4gPiA+
ID4gcnpnMmxfbWlwaV9kc2lfZHBoeV9pbml0KCkvcnpnMmxfbWlwaV9kc2lfZHBoeV9leGl0KCkg
dG8NCj4gPiA+ID4gPiA+IGF0b21pY19wcmVfZW5hYmxlKCkgYW5kIGF0b21pY19wb3N0X2Rpc2Fi
bGUoKSByZXNwZWN0aXZlbHksDQo+ID4gPiA+ID4gPiBhbmQgbW92ZQ0KPiA+ID4gPiA+ID4gcnpn
MmxfbWlwaV9kc2lfc2V0X2Rpc3BsYXlfdGltaW5nKCkgZnJvbSBhdG9taWNfcHJlX2VuYWJsZSgp
DQo+ID4gPiA+ID4gPiB0byBhdG9taWNfZW5hYmxlKCksIHRvIGFsaWduIHdpdGggdGhlIHBvd2Vy
LW9uIHNlcXVlbmNlDQo+ID4gPiA+ID4gPiBkZXNjcmliZWQgaW4gRmlndXJlIDM0LjUgb2Ygc2Vj
dGlvbiAiMzQuNC4yLjEgUmVzZXQiIG9mIHRoZQ0KPiA+ID4gPiA+ID4gUlovRzJMIGhhcmR3YXJl
IG1hbnVhbA0KPiA+ID4gPiA+ID4gUmV2LjEuNTAgTWF5IDIwMjUuDQo+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gQWNjb3JkaW5nIHRvIHRoZSBoYXJkd2FyZSBtYW51YWwsIExJTksgcmVnaXN0ZXJz
IG11c3QgYmUNCj4gPiA+ID4gPiA+IHdyaXR0ZW4gYmVmb3JlIGRlYXNzZXJ0aW5nIENNTl9SU1RC
LCBhbmQgdGhlIDFtcyBkZWxheSBpcw0KPiA+ID4gPiA+ID4gcmV0YWluZWQgaW4NCj4gPiA+ID4g
PiA+IGF0b21pY19wcmVfZW5hYmxlKCkgYWZ0ZXIgdGhlIGRlYXNzZXJ0Lg0KPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNlZW1zIHRvIG1lIGxpa2UgdGhpcyBzaG91
bGQgYmUgYmFja3BvcnRlZCB0byBzdGFibGUgYnJhbmNoZXMgKG1pc3NpbmcgRml4ZXMgLyBDYzog
c3RhYmxlDQo+IHRhZ3MpPw0KPiA+ID4gPg0KPiA+ID4gPiBPSywgd2lsbCBhZGQgZml4ZXMvc3Rh
YmxlIHRhZ3MuDQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gLS0t
DQo+ID4gPiA+ID4gPiAgLi4uL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9taXBpX2RzaS5j
ICAgIHwgMjcgKysrKysrKysrKystLS0tLS0tLQ0KPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfbWlw
aV9kc2kuYw0KPiA+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcy
bF9taXBpX2RzaS5jDQo+ID4gPiA+ID4gPiBpbmRleCBlNTNiNDhlNGRlNTYuLjkwNTNjZTAzN2I3
NSAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1
L3J6ZzJsX21pcGlfZHNpLmMNCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gPiA+ID4gPiA+IEBAIC00ODQsNyArNDg0LDYg
QEAgc3RhdGljIGludCByemcybF9taXBpX2RzaV9kcGh5X2luaXQoc3RydWN0IHJ6ZzJsX21pcGlf
ZHNpICpkc2ksDQo+ID4gPiA+ID4gPiAgCXUzMiBkcGh5dGltMTsNCj4gPiA+ID4gPiA+ICAJdTMy
IGRwaHl0aW0yOw0KPiA+ID4gPiA+ID4gIAl1MzIgZHBoeXRpbTM7DQo+ID4gPiA+ID4gPiAtCWlu
dCByZXQ7DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gIAkvKiBBbGwgRFNJIGdsb2JhbCBvcGVy
YXRpb24gdGltaW5ncyBhcmUgc2V0IHdpdGggcmVjb21tZW5kZWQgc2V0dGluZyAqLw0KPiA+ID4g
PiA+ID4gIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShyemcybF9taXBpX2RzaV9nbG9iYWxf
dGltaW5ncyk7DQo+ID4gPiA+ID4gPiArK2kpIHsgQEANCj4gPiA+ID4gPiA+IC01MjQsMTIgKzUy
Myw2IEBAIHN0YXRpYyBpbnQgcnpnMmxfbWlwaV9kc2lfZHBoeV9pbml0KHN0cnVjdCByemcybF9t
aXBpX2RzaSAqZHNpLA0KPiA+ID4gPiA+ID4gIAlyemcybF9taXBpX2RzaV9waHlfd3JpdGUoZHNp
LCBEU0lEUEhZVElNMiwgZHBoeXRpbTIpOw0KPiA+ID4gPiA+ID4gIAlyemcybF9taXBpX2RzaV9w
aHlfd3JpdGUoZHNpLCBEU0lEUEhZVElNMywgZHBoeXRpbTMpOw0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+IC0JcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChkc2ktPnJzdGMpOw0KPiA+ID4g
PiA+ID4gLQlpZiAocmV0IDwgMCkNCj4gPiA+ID4gPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gPiA+
ID4gPiAtDQo+ID4gPiA+ID4gPiAtCWZzbGVlcCgxMDAwKTsNCj4gPiA+ID4gPiA+IC0NCj4gPiA+
ID4gPiA+ICAJcmV0dXJuIDA7DQo+ID4gPiA+ID4gPiAgfQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+IEBAIC01NDEsOCArNTM0LDYgQEAgc3RhdGljIHZvaWQNCj4gPiA+ID4gPiA+IHJ6ZzJsX21p
cGlfZHNpX2RwaHlfZXhpdChzdHJ1Y3QgcnpnMmxfbWlwaV9kc2kgKmRzaSkNCj4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiAgCWRwaHljdHJsMCAmPSB+KERTSURQSFlDVFJMMF9FTl9MRE8xMjAwIHwg
RFNJRFBIWUNUUkwwX0VOX0JHUik7DQo+ID4gPiA+ID4gPiAgCXJ6ZzJsX21pcGlfZHNpX3BoeV93
cml0ZShkc2ksIERTSURQSFlDVFJMMCwgZHBoeWN0cmwwKTsNCj4gPiA+ID4gPiA+IC0NCj4gPiA+
ID4gPiA+IC0JcmVzZXRfY29udHJvbF9hc3NlcnQoZHNpLT5yc3RjKTsNCj4gPiA+ID4gPiA+ICB9
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gIHN0YXRpYyBpbnQgcnpnMmxfZHBoeV9jb25mX2Ns
a3Moc3RydWN0IHJ6ZzJsX21pcGlfZHNpICpkc2ksDQo+ID4gPiA+ID4gPiB1bnNpZ25lZCBsb25n
IG1vZGVfZnJlcSwgQEAgLTEwMzAsMjQgKzEwMjEsMzcgQEAgc3RhdGljIHZvaWQNCj4gPiA+ID4g
PiA+IHJ6ZzJsX21pcGlfZHNpX2F0b21pY19wcmVfZW5hYmxlKHN0cnVjdA0KPiA+ID4gPiA+IGRy
bV9icmlkZ2UgKmJyaWRnZSwNCj4gPiA+ID4gPiA+ICAJY29ubmVjdG9yID0gZHJtX2F0b21pY19n
ZXRfbmV3X2Nvbm5lY3Rvcl9mb3JfZW5jb2RlcihzdGF0ZSwgYnJpZGdlLT5lbmNvZGVyKTsNCj4g
PiA+ID4gPiA+ICAJY3J0YyA9IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3Jfc3RhdGUoc3Rh
dGUsIGNvbm5lY3RvciktPmNydGM7DQo+ID4gPiA+ID4gPiAgCW1vZGUgPSAmZHJtX2F0b21pY19n
ZXRfbmV3X2NydGNfc3RhdGUoc3RhdGUsDQo+ID4gPiA+ID4gPiBjcnRjKS0+YWRqdXN0ZWRfbW9k
ZTsNCj4gPiA+ID4gPiA+IC0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgaXMgbm90IHJlbGF0
ZWQgdG8geW91ciBjb21taXQgbWVzc2FnZSAoY29kaW5nIHN0eWxlIGNoYW5nZSkuDQo+ID4gPiA+
DQo+ID4gPiA+IEFjay4gV2lsbCByZXN0b3JlIGl0Lg0KPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ICAJcmV0ID0gcnpnMmxfbWlwaV9kc2lfc3RhcnR1cChkc2ksIG1v
ZGUpOw0KPiA+ID4gPiA+ID4gIAlpZiAocmV0IDwgMCkNCj4gPiA+ID4gPiA+ICAJCXJldHVybjsN
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAtCXJ6ZzJsX21pcGlfZHNpX3NldF9kaXNwbGF5X3Rp
bWluZyhkc2ksIG1vZGUpOw0KPiA+ID4gPiA+ID4gKwlyZXQgPSByZXNldF9jb250cm9sX2RlYXNz
ZXJ0KGRzaS0+cnN0Yyk7DQo+ID4gPiA+ID4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ID4gPiA+ID4g
KwkJcmV0dXJuOw0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKwlpZiAoZHNpLT5yc3RjKQ0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhpcyBzZWVtcyBuZXcgYW5kIG5vdCBkb2N1bWVudGVkIGlu
IHRoZSBjb21taXQgbWVzc2FnZT8gSXMgdGhpcyBhIGZpeD8NCj4gPiA+ID4NCj4gPiA+ID4gUlov
VjJIIGRvZXMgbm90IG5lZWQgdGhpcyBhcyBpdCB1c2VzIGRpZmZlcmVudCBJUC4gUHJldmlvdXNs
eQ0KPiA+ID4gPiBmc2xlZXAoKSBpcyBpbiBSWi9HMkwgc3BlY2lmaWMgZnVuY3Rpb24uIEkgd2ls
bCB1cGRhdGUgY29tbWl0IGRlc2NyaXB0aW9uIGZvciB0aGlzIGNoYW5nZS4NCj4gPiA+DQo+ID4g
PiBTdWdnZXN0aW9uOiBtYXliZSBtb3ZlIHRoaXMgdG8gYSBzZXBhcmF0ZSBwYXRjaCwgdG8gZmFj
aWxpdGF0ZSByZXZpZXcvdW5kZXJzdGFuZGluZy4uLg0KPiA+DQo+ID4gVGhlIG9ubHkgd2F5IGlz
IHRvIGludHJvZHVjZSBhIG5ldyBjYWxsYmFjayB0byBoYW5kbGUgaXQgZm9yIFJaL0cyTCBTb0Mu
DQo+ID4gVGhlbiB3ZSB3b24ndCBiZSBhYmxlIHRvIGFwcGx5IGZpeGVzIHRhZyBhcyBpdCBpcyBu
b3QgZml4aW5nIGFueXRoaW5nLg0KPiANCj4gSSBhbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5
IHRoYXQgY2FsbGJhY2s/IEhvdyBhIGNhbGxiYWNrIGlzIG5lZWRlZCBvbmx5IGlmIHlvdSBzcGxp
dCB0aGUgcGF0Y2g/DQoNCllvdSBjYW5ub3Qgc3BsaXQgdGhlIHBhdGNoLg0KDQpCZWZvcmU6DQog
IGF0b21pY19wcmVfZW5hYmxlKCk6DQogICAgc3RhcnR1cCgpDQogICAgICBkcGh5X2luaXQoKQ0K
ICAgICAgICB3cml0ZSBEU0lEUEhZVElNeCAgICAgICAgIChGKSBQSFkgdGltaW5nIHJlZ3MNCiAg
ICAgICAgcmVzZXRfY29udHJvbF9kZWFzc2VydCgpICAoRykgZGVhc3NlcnQgQ01OX1JTVEINCiAg
ICAgICAgdWRlbGF5KDEpICAgICAgICAgICAgICAgICAoSCkNCgkgIHNldHRpbmcgYmVsb3cgbGlu
ayByZWdpc3RlcnMNCiAgICAgICAg4oiSIFRYU0VUUg0KCSAg4oiSIFVMUFNTRVRSDQogICAgICAg
IOKIkiBEU0lTRVRSDQogICAgICAgIOKIkiBDTFNUUFRTRVRSDQogICAgICAgIOKIkiBMUFRSTlNU
U0VUUg0KDQpDdXJyZW50IHBhdGNoOg0KDQphdG9taWNfcHJlX2VuYWJsZSgpOg0KICAgIHN0YXJ0
dXAoKQ0KICAgICAgZHBoeV9pbml0KCkNCiAgICAgICAgd3JpdGUgRFNJRFBIWVRJTXggICAgICAg
ICAoRikgUEhZIHRpbWluZyByZWdzDQoJc2V0dGluZyBiZWxvdyBsaW5rIHJlZ2lzdGVycw0KICAg
ICAgICDiiJIgVFhTRVRSDQoJICDiiJIgVUxQU1NFVFINCiAgICAgICAg4oiSIERTSVNFVFINCiAg
ICAgICAg4oiSIENMU1RQVFNFVFINCiAgICAgICAg4oiSIExQVFJOU1RTRVRSDQoNCiAgICAgIHJl
c2V0X2NvbnRyb2xfZGVhc3NlcnQoKSAgKEcpIGRlYXNzZXJ0IENNTl9SU1RCDQogICAgICBmc2xl
ZXAoMTAwMCkgICAgICAgICAgICAgIChIKQ0KDQo+IA0KPiBJbiB0aGlzIG9yaWdpbmFsIHBhdGNo
IHlvdSB0ZXN0IGZvciB0aGUgdmFsaWRpdHkgb2YgZHNpLT5yc3RjIHRvIGRldGVybWluZSBpZiB5
b3UgYXBwbHkgdGhlIGRlbGF5IG9yDQo+IG5vdC4gU28gaW4gdGhlIGNhc2Ugb2YgUlovVjJILCBJ
IHVuZGVyc3RhbmQgdGhhdCBpdCBpcyBOVUxMPw0KDQpZZXMsIHRoYXQgaXMgY29ycmVjdC4NCg0K
PiANCj4gPiBDdXJyZW50bHkgdGhpcyBpcyBvcHRpb25hbCByZXNldCwgYW5kIGl0IGlzIG5vLW9w
IGZvciBSWi9WMkguDQo+IA0KPiBEb2VzIHRoaXMgbWVhbnMgdGhhdCB0aGUgY2FsbCB0byByZXNl
dF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cnN0Yykgc2hvdWxkIG5vdCBvY2N1ciBmb3IgUlovVjJI
Pw0KDQpyZXNldF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cnN0Yykgd2lsbCByZXR1cm4gaW1tZWRp
YXRlbHkgYXMgaXQgaXMgbnVsbC4NCg0Kb3INCg0KV2UgY291bGQgYWRkIHRoaXMgY2hlY2sgaW5z
dGVhZA0KDQoJaWYgKGRzaS0+cnN0Yykgew0KCSAgICByZXQgPSByZXNldF9jb250cm9sX2RlYXNz
ZXJ0KGRzaS0+cnN0Yyk7DQoJICAgIGlmIChyZXQgPCAwKQ0KCQlyZXR1cm47DQoNCgkgICAgZnNs
ZWVwKDEwMDApOw0KCX0NCg0KQ2hlZXJzLA0KQmlqdQ0K

