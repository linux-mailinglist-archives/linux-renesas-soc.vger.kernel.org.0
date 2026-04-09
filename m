Return-Path: <linux-renesas-soc+bounces-31055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHtlKztY12kFMggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 09:41:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 174543C7276
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 09:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BEBB3004605
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 07:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB26137B407;
	Thu,  9 Apr 2026 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZQnVgmyg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B9534C815;
	Thu,  9 Apr 2026 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720408; cv=fail; b=BSB2kteDujXbuj3AuKwcY4lVodFI8qko9712pPpAkUuiUSRSuJm6dhFeDMH9vKI94/DSL3O429XueW4MYUO+mCDzdjwOVBublQ1i7EmY0t8qE5eDEntIE1xEQJGy5Z0674O/Qg1I7iaK268SRJHzVs39whnjT+8cjt10W7K+qXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720408; c=relaxed/simple;
	bh=tet9q6Pt96uAMkvvc5+GMccXeZdHli9smUjKfCutJoo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KuvY/s8V8AWKzi+rxyjjpvzv1n0OQGb8nvvctDFABPItEzJpZ0i5nv3YLCiorMh3iD+/vHizrFFwL9hCBHdopU3H32EYrQzDCwhhEa50E2jefd5LVzQn3R4543SQopA5zugNQtUvHaeUo4+kT06OfatnHvSvRWIL6c0qD3U0cvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZQnVgmyg; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/xZ+ST5XuKJ9SzpLLQCPC1H/URhjtFmi2r/cxkz5j4Glye3+9g0DQ3qpD2bRZPEoHXMKChNm4KpHL4Q1n9WHa17mY8o/G45TyVJGpGdFhlCY/kXYLiu1MJv/SSIjP4SXklbOROUcSJjznzWkScg7Xfhxa3ZUIcqS4389Xn7kJWtj7gEGlL1D1dCJutCt+e/s38LMYlkZoTLi8YHvopUj7TxAC1d+hGsKT2S7idgViSi7wbzdgVwiGZA80VFRt40f4Otn3Vao7FZZbA8zUNRVSuamNmaTVgL/UoMqwIAlykP+NlM4nlg2TBI29ZgGzczNG0inmDXerqlErQGmwICMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tet9q6Pt96uAMkvvc5+GMccXeZdHli9smUjKfCutJoo=;
 b=ojn7QGDQjFknQeo4Hw94uszs6GaMBMzrYq5219pzLnOUPQ8E1NfPSm8ca1UR4ImmOG4UF596vn5D5EFgbqkTojdcJ1YI1ibXWda/chTFQGVrIHTAhKxjB1riyfNp6SGW3TAx6a+7lfIYi/X5P/fWGXe8QhW04VK68E7XZm2TT38Yo3MK1IRgHr1gDh/HlIv+XECMsTL5rlUlmYz6TqbEjS9/jH+32e2Gs2Yto1Kjyf5BQAE5la3ieseGW0SOpbYuKdcAdu3SOQv0h38B3hIG6ttGuBCTVJ8a2ddolU7zyH+DH8AMwEu4ZO6OMwmps0rFDmIJm+KOOiB/V5622lafbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tet9q6Pt96uAMkvvc5+GMccXeZdHli9smUjKfCutJoo=;
 b=ZQnVgmygBVCM3+G9loJTBVwHVghAfc3f5sjVBf9hlUGXvwK/kuqy/dOQcfQqGgta/Il9QI2ylMHokesu1pa9W/g2r9vSh7MmE6Ya2l5pi50GK6q7bGz2OsucpZYGCFo0L4z54yNpTULHagy6k95xMMz5BUPhvxGDLKMoQiw/2NI=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY6PR01MB17314.jpnprd01.prod.outlook.com (2603:1096:405:35a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 07:40:03 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Thu, 9 Apr 2026
 07:40:03 +0000
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
 AQHcx2L1WxU/Wbm0ZkuvgJVMedankLXVW0yAgAAAwXCAAAUgAIAAAHbQgAAW4oCAAAuMoIAA1Okw
Date: Thu, 9 Apr 2026 07:40:02 +0000
Message-ID:
 <TYCPR01MB113322203884106612468FB4286582@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
	<20260408142105.310210-2-biju.das.jz@bp.renesas.com>
	<20260408123039.922a75327fd7672df3bd61da@hugovil.com>
	<TYCPR01MB11332B594964DDF0763499184865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
	<20260408125142.24cd94f094ba3ca512e7f346@hugovil.com>
	<TYCPR01MB11332859E901171C91C543061865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <20260408141515.fc210b4b3c86f7a61f680dd1@hugovil.com>
 <TYCPR01MB113326DDA1FC854689CE34A6C865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB113326DDA1FC854689CE34A6C865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY6PR01MB17314:EE_
x-ms-office365-filtering-correlation-id: 6fd49626-206f-4aa7-dc4b-08de960b361a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 zU3FmdDXpV0QK+UuQjiu2zYhaEenOvHri0dUe18XPbqj0axj3SbX8vrfY4hSt7+QS2rJIQlXmHjv1IUxkjtMm3pm5wySBsBsYl2Lvn7imWyexy97YeY7FqBk+sIGX/+tnbz9ayiQSbyAOFTPbZYLmWQB01F8CLYXgOPJDGmUddLC1DyVJkrUGIer13vdJeFyHTA863m4KJl8a7CALauIiYRCpKz5LxZNfP93ON9vqEVsjPmXpFvA7b383rkf3cHyuTt9xHD9hf1kdlEynL0P1Te1gPz76XbwtpyHnetfObjgbvm2RfaX4Uhjd7J/Y9byK868wwPeQRVG5JfFnN/CjPGrOvq/Gf42r7j+6d98YvUKjIm+y/45xjoieMTVJd6zqofLDz0aqnNPLnI5TKwZDuW6Fv4NourgGwhT2fSwmCbtkgd9H41DBGLKMSlJr7fWORhKlHTPzYg0IKm8EXUdJvTnCpolsPRquKiya5P8u2/sSjuxT7vPmdioArwn/TmZISCUkVT6fhYhg/TmzPlPvIKnDmidSkG7GjMSCGC0rd6wID4kIprgGZIAuKWY8efq837BIqbEPMa0OHuarIIk7JdKD2bd/LAbuQG/o4QfY7bK8qKo7MiA6j/QrD3mcu5vLSFQ8XpZOVejOwsnsKCBcL8ulLimDQzuftRglfkx0dlHQUdWOekim+4PU8rQ2aSG5WCUOwUaRS+cfzcBvoxfJI7FBsOCSSFwrMJSn4aJTZxxFm24NbDYCg2CPCUREqqz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlNIV0NvbkxkU3hRSkNaQThQZU4rdU4xMVlycEU5OFg0eXdCL2l2cHVhbHEx?=
 =?utf-8?B?c3k3NG1yaTdKMGRLVFI3bzZRRGgrQzZmTXRHQk14WGxGRFBKOFMrTVptRTlo?=
 =?utf-8?B?Rm5lNUQ2amZuRG5MMG0rZGh5SnZ1WHNPYkgwTnlmNXJKc1RHNVZIUDFLNWlW?=
 =?utf-8?B?WWVIZkE4RTdoaGxqckwvdnJxMCs2bDU0NFAwQkZnOW5xWS9kMWxYS2JWdnNS?=
 =?utf-8?B?T1NtSHI0bGNJZTRPTFV0TjhmVXNLeFkzUHVFbW1DcWhhQ1ROWWhZRk92SDVB?=
 =?utf-8?B?WTg0RFpJcHIrNTJWQ0g0dUh0U1dUMk1FdGhWaEkzL2d2TWJqNDZuTjM5dzla?=
 =?utf-8?B?L1UwUGRuQlBkdEQ0NTg4NTdWUSt2cU0rYUROSFhLUHh4MTlhNHpRT01YU282?=
 =?utf-8?B?QjNlUnBvcjJKUkFpTzlENmJIaGFheXlUaHFCZWo5Z2xNNGtXbmN2RkNhSS93?=
 =?utf-8?B?Q1AwOUxKR3hVb2RKNUxJRTlMZzNQRVFUQTFwd2x5cjNzbDdUb1RvcTlxcEFY?=
 =?utf-8?B?N3VhOGtONjh3QWZxeXkxd0t3UGZmVzJMVDFnYUlTUFZ2TW00dkdRVkJRZ2U3?=
 =?utf-8?B?ZEdLN01CTVR6Q1lMVFdKWndWRWVxaGxydjFMcTREMVR2RGxqaW1EaUNmVXVo?=
 =?utf-8?B?RFdmYnRWRDBkdGxXVWI5cVlRQjBEOXYyOWswMzhMMkg1SlNSZzVEK1RFbjB1?=
 =?utf-8?B?eUxyUGFzMVBPdFk4aUxKQi83dEtWbGFLZElUN3Ira2dDb1Q3cWVlcFpVVk9y?=
 =?utf-8?B?RUU0U0dQL0FSdHNlOXlyYWh1RlJISTB0bDBrUzJEZGlmU2hHM1B2ZVd6bmYz?=
 =?utf-8?B?QjBpUjdSUmFUbC9TU0JJUjlSMG1YSysyc25sNWVvbkJlSXR4cHZhZFcwcTNs?=
 =?utf-8?B?aVk3eGhNVVpTZkp0WnhYT0dDajlrM01Jbk9meDMxV0VnWGtzYlRhdHNqQnFM?=
 =?utf-8?B?OGRzTkdsczBhazlxOC9aM3FHdytVeGwyQTFsVlhtLzFad0lXdDd1WHdHRnpP?=
 =?utf-8?B?ZE9zaEV4UExrVUZicktOTjkwOVdURml2NU1JTFNDT0U0S2pvRVhLSG50Y2Iz?=
 =?utf-8?B?MTYvV0poenc4WjhtRDNZMHFNVFdSZmtSci9NakJkclNQTExBZWFlZlVyS0Fr?=
 =?utf-8?B?Nkp0OGxWNFhYRmliNHFickhiaVB3bWx6RnRieGMrNm9XZUZGYllkRUlFZHVX?=
 =?utf-8?B?Z0E1Nit0YkJUWlVxMWprVXBreUtEZmJrdjBrc2xydTRUT0krRStDTS9EWXNP?=
 =?utf-8?B?Rmc5YWxtSHlXajVRMEY3dU5VNWVEbWZZdnRnQmdHVitnMEIvVFVaeS9kR0lO?=
 =?utf-8?B?cGZxZlhCb29tR2lqdWhqVXdsTUxSSGVMWjVLWjdDTzRYeG5SZGFuQzVXc2pE?=
 =?utf-8?B?N0h2R0g4OE02ZGZqK1FNL29OdW1FdWpEaGZWU2UzMlpFak82akZhTFM5SW9w?=
 =?utf-8?B?YnM2SER3QW9FdjdqbFhEcmowZmdKOUUrNWNBQjVkOGlqQjNhbXZXVTA2QTI2?=
 =?utf-8?B?aHBScVZCVzBhZVU2bjlXb3g5VWh2eFhhckhhVldwSjAxUHlieFdZdGFTcGJq?=
 =?utf-8?B?TWszT0xFcVBwODRHODc1WU40a0s1UFM1WjZqWkZLUjA2NDBiVkY5eDlkWm93?=
 =?utf-8?B?MUxSdGNuRWdFY2hUWDJIQ3RHMlFWMGJRNjVIM29lcGxjbkpQem8yb3cvT3hB?=
 =?utf-8?B?LzZyVUJJdVhNOUEwNDFHSURSZXF6cW13VEtEOFpVcWlPcGt0eW1QdkJ6L0tw?=
 =?utf-8?B?MUhyTEdjZW9qaGFYeUxtT2hGc0RUMXU5UE1pMWxrTER6ZXFvdUpDVmlEQ2xY?=
 =?utf-8?B?SU5TQ2FQZ25yWms4ZllmeU5aTW0zeGxnNlNSWmtuQ0xiKzFqMU5IRVNMMUNL?=
 =?utf-8?B?ekFLcVdKYVh4TS9KUU5VZGhZclA4dTBTU1YvcmxmZzBwaFRaWVpIanFNMU8x?=
 =?utf-8?B?ekZtNTRETENjY3J5a2JucTFjc1hKbTkxUkNyQ0lERWJoMmlJRVpwVHRVeU1D?=
 =?utf-8?B?MDV5UDBpT2lTTlRCRUNwbE5qbFNKMG5LVFBKcDdydDRXUE9YNmVBMi91Z0Fk?=
 =?utf-8?B?NVBtb0FiNVhSQ2FhSWc3VXRNeEM1U3h4MkhMR1BpNWY1Y0tFYUFUWFZpRFNL?=
 =?utf-8?B?R3hsR3d5djByQlVEcXlVY2RTZ0NxQzdieGxvYkFmMjZ4Z1hQM0hiaUVEdGxV?=
 =?utf-8?B?WWp3bW5ZbndpalMycTlEZThobVo4RUxXQSsveE5lQkphQlVHWkM3TTFHTlFW?=
 =?utf-8?B?U2FzcmZhM2ZEOVIvVzAvK1AzekNEdFdYeThHV09OV0xzOVl2MUd5WXNqR0dD?=
 =?utf-8?B?U0ltSk52TVU4Vlc5dmlDUzRQTVIyWUsyMk05TjZRUC9vOWJNdWtHQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd49626-206f-4aa7-dc4b-08de960b361a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 07:40:02.9299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zbr2O12BSCcWAOEPTto76l5ooIreDHbPdG52IX3X4OUDhOgEWzgq7AW0P2QcdwNW8MOG7vVxCC6XHLfk8Psx0G7HjoG98ep/txCH0g+w0WA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17314
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,glider.be,bp.renesas.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31055-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,linuxfoundation.org:email,sang-engineering.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 174543C7276
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMNCj4gU2Vu
dDogMDggQXByaWwgMjAyNiAyMDowMg0KPiBUbzogSHVnbyBWaWxsZW5ldXZlIDxodWdvQGh1Z292
aWwuY29tPg0KPiBDYzogYmlqdS5kYXMuYXUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT47IEdyZWcg
S3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBKaXJpIFNsYWJ5DQo+
IDxqaXJpc2xhYnlAa2VybmVsLm9yZz47IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+OyBUaGllcnJ5IEJ1bHRlbA0KPiA8dGhpZXJyeS5idWx0ZWwueWhAYnAucmVu
ZXNhcy5jb20+OyB3c2ErcmVuZXNhcyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+
OyBQcmFiaGFrYXIgTWFoYWRldg0KPiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBzZXJp
YWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4g
U3ViamVjdDogUkU6IFtQQVRDSCB2MiAxLzJdIHNlcmlhbDogc2gtc2NpOiBBdm9pZCBkaXZpZGUt
YnktemVybyBmYXVsdA0KPiANCj4gSGkgSHVnbywNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiBGcm9tOiBIdWdvIFZpbGxlbmV1dmUgPGh1Z29AaHVnb3ZpbC5jb20+DQo+
ID4gU2VudDogMDggQXByaWwgMjAyNiAxOToxNQ0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MS8yXSBzZXJpYWw6IHNoLXNjaTogQXZvaWQgZGl2aWRlLWJ5LXplcm8gZmF1bHQNCj4gPg0KPiA+
IEhpIEJpanUsDQo+ID4NCj4gPiBPbiBXZWQsIDggQXByIDIwMjYgMTc6MjU6MTkgKzAwMDANCj4g
PiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4g
PiBIaSBIdWdvLA0KPiA+ID4NCj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiA+ID4gRnJvbTogSHVnbyBWaWxsZW5ldXZlIDxodWdvQGh1Z292aWwuY29tPg0KPiA+ID4gPiBT
ZW50OiAwOCBBcHJpbCAyMDI2IDE3OjUyDQo+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MS8yXSBzZXJpYWw6IHNoLXNjaTogQXZvaWQgZGl2aWRlLWJ5LXplcm8NCj4gPiA+ID4gZmF1bHQN
Cj4gPiA+ID4NCj4gPiA+ID4gSGkgQmlqdSwNCj4gPiA+ID4NCj4gPiA+ID4gT24gV2VkLCA4IEFw
ciAyMDI2IDE2OjM1OjQ0ICswMDAwDQo+ID4gPiA+IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+ID4gSGkgSHVnbywNCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+ID4gRnJvbTogSHVnbyBW
aWxsZW5ldXZlIDxodWdvQGh1Z292aWwuY29tPg0KPiA+ID4gPiA+ID4gU2VudDogMDggQXByaWwg
MjAyNiAxNzozMQ0KPiA+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzJdIHNlcmlh
bDogc2gtc2NpOiBBdm9pZA0KPiA+ID4gPiA+ID4gZGl2aWRlLWJ5LXplcm8gZmF1bHQNCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBIaSBCaWp1LA0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IE9u
IFdlZCwgIDggQXByIDIwMjYgMTU6MjA6NTggKzAxMDAgQmlqdQ0KPiA+ID4gPiA+ID4gPGJpanUu
ZGFzLmF1QGdtYWlsLmNvbT4NCj4gPiA+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiB1YXJ0X3VwZGF0ZV90aW1lb3V0KCkgY29tcHV0ZXMg
YSB0aW1lb3V0IHZhbHVlIGJ5IGRpdmlkaW5nDQo+ID4gPiA+ID4gPiA+IGJ5IHRoZSBiYXVkIHJh
dGUuIElmIGJhdWQgaXMgemVybyDigJQgd2hpY2ggY2FuIG9jY3VyIHdoZW4gdGhlDQo+ID4gPiA+
ID4gPiA+IGhhcmR3YXJlIHJldHVybnMgYW4gdW5zdXBwb3J0ZWQgb3IgaW52YWxpZCByYXRlIOKA
lCB0aGlzIHJlc3VsdHMgaW4gYSBkaXZpZGUtYnktemVybyBmYXVsdC4NCj4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiBiYXVkIGlzIHJldHVybmVkIGJ5IHVhcnRfZ2V0X2JhdWRfcmF0ZSgpLCBzbyB0
aGlzIGlzIG5vdCByZXR1cm5lZCBieSB0aGUgaGFyZHdhcmU/DQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBZb3UgYXJlIHRpZ2h0LCBXaWxsIHVwZGF0ZSBjb21taXQgZGVzY3JpcHRpb24uDQo+ID4gPiA+
DQo+ID4gPiA+IEhvdyBjYW4gdWFydF9nZXRfYmF1ZF9yYXRlKCkgcmV0dXJuIGEgemVybyB2YWx1
ZT8gSWYgSSBhbSBub3QNCj4gPiA+ID4gbWlzdGFrZW4gZXZlbiBmb3IgdGhlIEIwIGNhc2UsIGl0
IHdpbGwgcmV0dXJuIDk2MDA/DQo+ID4gPg0KPiA+ID4gQXMgcGVyIHRoZSBjb21tZW50IGFuZCBj
b2RlLCB0aGlzIEFQSSBjYW4gcmV0dXJuIDAuDQo+ID4gPg0KPiA+ID4gKiBJZiB0aGUgbmV3IGJh
dWQgcmF0ZSBpcyBpbnZhbGlkLCB0cnkgdGhlIEBvbGQgdGVybWlvcyBzZXR0aW5nLiBJZg0KPiA+
ID4gaXQncyBzdGlsbA0KPiA+ID4gKiBpbnZhbGlkLCB3ZSB0cnkgOTYwMCBiYXVkLiBJZiB0aGF0
IGlzIGFsc28gaW52YWxpZCAwIGlzIHJldHVybmVkLg0KPiA+ID4NCj4gPiA+IEluIGRyaXZlcy90
dHkgY3VycmVudGx5IG9ubHkgMSBkcml2ZXIgaXMgY2hlY2tpbmcgdGhlIHJldHVybiB2YWx1ZQ0K
PiA+ID4gYW5kIGl0IGNhbGxzIHBhbmljDQo+ID4gPg0KPiA+ID4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjcuMC1yYzcvc291cmNlL2RyaXZlcnMvdHR5L3NlcmlhbC8NCj4gPiA+
IGFwDQo+ID4gPiBidWFydC5jI0wyMTQNCj4gPg0KPiA+IEhtbW0sIG1vcmUgdGhhbiAxOg0KPiAN
Cj4gPg0KPiA+IGljb20uYzoNCj4gPiAgICAgaWYgKCFiYXVkKQ0KPiA+ICAgICAgICAgIGJhdWQg
PSA5NjAwOyAgICAvKiBCMCB0cmFuc2l0aW9uIGhhbmRsZWQgaW4gcnNfc2V0X3Rlcm1pb3MgKi8N
Cj4gDQo+IEEgemVybyByZXR1cm4gZnJvbSB1YXJ0X2dldF9iYXVkX3JhdGUoKSBpcyBhIG5vcm1h
bCwgcmVjb3ZlcmFibGUgY29uZGl0aW9uICh1bnN1cHBvcnRlZCByYXRlIHJlcXVlc3RlZA0KPiBi
eSB1c2Vyc3BhY2UpIGFuZCBtdXN0IG5vdCBjcmFzaCB0aGUga2VybmVsLg0KPiANCj4gT3IgZHJv
cCB0aGUgY2hlY2sgbGlrZSBvdGhlciB0dHkgZHJpdmVycywgYXMgU0NJRi9SU0NJIElQIHN1cHBv
cnQgOTYwMCBiYXVkIHJhdGUuDQoNCk1heSBiZSBzZXR0aW5nIGEgYnVhZHJhdGUgMTE1MjAwIGlz
IHNhZmUgaW4gdGhpcyBjYXMgbGlrZSBlYXJseXByaW50az8/DQpJIHdpbGwgc2VuZCBuZXh0IHZl
cnNpb24gc2V0dGluZyBidWFkID0gMTE1MjAwLCBpZiB1YXJ0X2dldF9iYXVkX3JhdGUoKSByZXR1
cm5zIDAuDQoNCkNoZWVycywNCkJpanUNCg==

