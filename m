Return-Path: <linux-renesas-soc+bounces-31039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMxtAbV91mk0FwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:09:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EA63BEB46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40D7E304464D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 16:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CDB346E7E;
	Wed,  8 Apr 2026 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nS9FIp+P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB0346782;
	Wed,  8 Apr 2026 16:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775664354; cv=fail; b=IyIl06JUQFZ5PDCHi0/fUciF6CpmkP9LtM8b7Q0Vy65sGtLFexbvAHejNaeSwxVo09ObMrQbFBLe05+4H1/CVSsuspJCY4EOf4nyYNYan/YtkKcril3HVNa9hVtf4QxxKw1oQUCFdsoESOyANKQTdmHrlk9yJeZ1BNWa+wb3uIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775664354; c=relaxed/simple;
	bh=DtzK3EQSSA305XaGRgKsWhz02rbbbqiHWcf8VE+Pkbk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KWx2XP7FrI0w9lMfGY7rFURORBaiWLVU5RiK5JkdkNw1n/qg/9x2Z3xSP0loE59JIpCOvhtXGfUejm3u0IzAeRbEQrFCo5Xx0VwfVvDN17Dj8oiLIBYaXUC22zFJaS6kIhIsloBfFGyaU7ilQTQgz+j7N2mrTXHsxuexBcMmtkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nS9FIp+P; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiqrsl453B53rUiVSK5ro6ngg2dcWv4i1BzW2pxlcxyL8zsDpZtq+mQ2I4UwFH28f5gpGqziRpu/4qLlLtM8mxcz4xLY4KJTPkvSuv7M5+aapMC2yPCZMjSiJgAmUiKXgn+iJov5HwktIFqi34PBO4EokkjLvIpNG4JdukH8FCH/GBanhzupIC1G7+VkQz2ema2yfIiA9rrgI6HgCaEG7IaFmq+MVR/PG2bKpr1hxGmyCysCwmD26XxAomTw/0goEkeyXRRoeoylniQz+5uPViNl6YjLXLjsj9/zEU/3fyIPGjOJz/OaKwGTb+6xLEUgaAnf8H4zC/I2lOMe8hQaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtzK3EQSSA305XaGRgKsWhz02rbbbqiHWcf8VE+Pkbk=;
 b=qQ4uwz9TJRVKwdKuTDyiKCqZGQ1ANabvSBO2FyyCQgnb97V1MVuwk36WPAhSc8OcLIo9gxi9YrpxKzgJ2hvLf+VgXNWYrO6lRalzc2+UkpI8uMLvIly1Vp5yVrP5hc+RlXTM6g9zniFcL1P9KfITAAN2c9uzMbCnlMzXN/926DrF8x5GuWxqI8hTnQRe4NF4Df2X8HMUU3xh6KalW9HCVWfwcIqbo4AeMKXxeL23IZGCcml9RIbpB61YTASG7578vGFA7cfdhCSFErQbV9L7Z4ZvC2eAPxpjmGz/Zv/fLTXZGSvvCOJrUiZ53crk6y2XVA0Wga/N2x5AGFNXxCispg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtzK3EQSSA305XaGRgKsWhz02rbbbqiHWcf8VE+Pkbk=;
 b=nS9FIp+P/rYIkNKDWNqCTxdJ4od9avQ0OV7EswM2cHmJJxBOCBXvvi2vtCxb2twG3vtBbxt+35VhwcZ2XAR+N5whd2FHX6Puewp/tZWqvZaQp+1R325DfH8BnCJZdQayR/bmZdeENUTLgK0eX8dMUZVNSuVPJQAEaX1aZd6vO3w=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYRPR01MB15853.jpnprd01.prod.outlook.com (2603:1096:405:2d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 16:05:47 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 16:05:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Thread-Topic: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Thread-Index: AQHcx2L1WxU/Wbm0ZkuvgJVMedankLXVTPoAgAAG7BA=
Date: Wed, 8 Apr 2026 16:05:47 +0000
Message-ID:
 <TYCPR01MB113327667B2BB3B8827A11546865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
 <20260408142105.310210-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdW5_k+iBekmV47W+Qqt5qDLMrLMRWZnnH5wCNP8E30N3A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW5_k+iBekmV47W+Qqt5qDLMrLMRWZnnH5wCNP8E30N3A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYRPR01MB15853:EE_
x-ms-office365-filtering-correlation-id: 354bcf39-f6bd-4249-60e1-08de9588b26c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 YcOnF7RyHDGY/BqLUtopxrW1UcytSVi6jcx0ooD2hNgYsjjlQmj499NEjNfmK1BAy4GodP/zlVKXRqkXUcGpcqXlOSH4sGAY3S8f6Lgf1clJjhTgR/MiAa+KXQ+H4DfPcXWK92sZQ0VtSSXWX4jSSkLESdFMF2xlYT66sMmbD0UUiTC0Dt+/yqlJzxGpjfLpOcrDCUiWALNH1ECBTxj3XJlCOMid6Nw8rSIi+eY/lxOYyq+vtBaYpzU8Z7BQMnHmm/7fVb46z8EAwTSoBDk5qqGWIQ4GzFp7qHkDX6eFxKgZCExobWfNoUYXsIkqfgDJmIs/UioCxyKpbrWV0nP0+M7YTpFMcoHpbEeEhs2acNkv5eSqhrJ0EBsH49A1AN/bpzy18Vx77T4nm63mfodHQwJ9Xy58cv/mmyT20N0pFYEkGWKVhBaMIjlPfXC/RkR0xoX4m/JU/h1U9DgC7IrIIU3pZSmRuWe/G1K9h0/d3KQK1vG6mbWKlldXnoq0F8nRkMZDjYSp1oA0T9c63DfWDErlqbu0viYQwQANynTD4i6OLB26AvD4eT4Bis0XZhL751BbzVoZHN62J33+TWyIDWvPkJzBiTgLYGg1Pc2AP5tq49dolOGyWBIULbZZD0ZIxZCrEuWMhTTLrInpJKCplTyVLyV8R6owlQKPePxZDq97dT8xUyS8qWixZ6i2uorNWKz9rIHzwGdWJS+BpxqlsM+6s9D1eCpwnO8Ef3ZX35FpB5RRz3HITIP7UJBpLEVafIeXEnfdZfuYIeif2ZfjV90yD0xftqLCYB4g6PM130s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFdLMmVSUEZZYUZvRlU2MnowbEVZWlhXN0ZKZ2xNcHN2VmFQQ1IzNk1INFBo?=
 =?utf-8?B?YWRtMW1CNmVhbGlyWkNEdFJiN2ttTzRHekpxWXNkNzZFSDFJclVUbUdMcTJj?=
 =?utf-8?B?UVQ2TVYycUNOSXhjRndMbHBxVXNEdmtOTUVDNDlRelJRVzJOenJLVTlFNlp3?=
 =?utf-8?B?elR3cEtqR2N4ZEl5S3lIODB2R1Q5WVE0a1JoSjlnRnJTN0xMQ0NsamdvUUxx?=
 =?utf-8?B?ZXhKSEhUUVFweG9tMnlEOTN4SUpHRm1XenNRUU1lanJWVExET0NqWCtwWmww?=
 =?utf-8?B?UkJSQWcyWERhOUVWNE5ycE1qK1kzZng5RzBWMGpZWUNqSi8rTlBWYTR4Ry9G?=
 =?utf-8?B?RHE2ZXhzb3RCMmdQUlNLUE5hYTlkRERibFFEbyt1K3NvZUZjRHBDMHg4L2hr?=
 =?utf-8?B?ZGljUlhaL29vbVBHa0FSTHNQSzMrRmZHcGhyczJvZTk1MUlRR2I1R1JJMzlP?=
 =?utf-8?B?bWZyYVRRRFM2YnBtUlNCc1JQemVvdUFvVmhuS0pHM2tWcVgvVGNrbEJRR2ts?=
 =?utf-8?B?VE0rdERYNzQ4b2ZOZ0ZheTQ1ZGxvaXhkZ0hqdEZEcFVCVExtWUExZkk1dStj?=
 =?utf-8?B?cWtJZDhRUlljb2crYmJVSDJoZGtwclRLWndqOENrNzZTWEwwSVNTcHRVVElJ?=
 =?utf-8?B?SVZFazNjUEg4Q3dYblp0NUw3cDNRVzhnU0NGU2E4YWpDY2x4N21uQVp3aWxG?=
 =?utf-8?B?NWpNQ1YySnowMFAvZUt3RVp0SHhzZkhZVlVjMytkQ3AvQkJtREhuY3ZtSGty?=
 =?utf-8?B?UlhGOEhVZUtEMTlsQzBkRk9iYktmZ1dydEE0aXdtVE5LdFA3Uzc1ZmVEUzEw?=
 =?utf-8?B?ZWFLNWpocHk1bk0vSzNKUThJZVF3V20ySWdrNFVSYThoVTc4ZjQvWG1nVTRU?=
 =?utf-8?B?ODBCbWxNRVl1QkFYV0JnbklxTURoUk8zbDYvbkxSb3lHdnBSNERFQlNhbng0?=
 =?utf-8?B?eFJnSTNsam5CS0hOU3h6bGpJQW5nekFaczkrR2dTMnFtNjVvMWM4dmdSUXRB?=
 =?utf-8?B?MDFXVEg4aVRGUyt1VG9aRkZLMEdlbEp2Qk5MQzlTZmlyVUwyTjIyb3JlWnpt?=
 =?utf-8?B?Rmp4OGxwa1JCczFsUmdTdmxzcGNsTUFyS2JHSzRlV1luejI4VWY2Wk1ZSVU5?=
 =?utf-8?B?U2RFalpuNk5QZzIzNTJHeEZURGVxZ1I3c2JocmhpMEc0VHk1RzJjZHdHVFBx?=
 =?utf-8?B?MHV6RlBzeTNNcTBUTmZad2lyWjh0VEZnaWluTXhiNG5Pbk1uaHNFOC92RXRK?=
 =?utf-8?B?Sm9RZUZKdzIvcWZ2d2ovUFVkV1l6cnlaN3ZqTlRCRElKditWVWltUEVFT1I2?=
 =?utf-8?B?VmVIb0VGUFNlUmVhRXh2QmhwMWk4VDY0OXdaMFlBV0Z1YUtCWmtuSGdwMjNG?=
 =?utf-8?B?eEpQZFUxMGIvb3pmcUNLWHUwNkZLNVVGVWxWNEx5OFBhSi9sQjdhNnFzNkx2?=
 =?utf-8?B?VzF0UEdzYXU5elVrZGVwSVlUbXVpZzN5NkZGRGNGUEIyblB2SFhIUUxsdldI?=
 =?utf-8?B?UGVUUFZEWE5wenBiUEhGQzJ1OHVNWTVNTDVwMDdUS1dsVjRRQnV5V1F6Q1dZ?=
 =?utf-8?B?Y0Q3Rm5sZkY2aFNTYlVRcy9HWi82TGlCWWtyV3lCTUF5YTNjWndPSEhUL01m?=
 =?utf-8?B?eTVjZ2ZIUjZhRGVlazhmV0xYSGg5MGNMQmNXem1jRkhXUXkxenMyN1pCMXNG?=
 =?utf-8?B?QjJYYVdQZThucXhNUERXelhYMnRDdDUxQVdnaVVEU3pLSXFsQW9mSFRVL1Jp?=
 =?utf-8?B?MkJ4ODZNemVKUGlNL2JlVkxaWmJTSmN3cGl0YjZES2NoTVAremE3Q0lobnJ2?=
 =?utf-8?B?VE5XMkV2OE4xOUJjRWNvZ1JaOHd5a0dQZFF4VzkvZUNtVUpoanVybjNxLzJB?=
 =?utf-8?B?aDNSYzRUdkdYbXN1WThLVkZBMXppN2w0bm1SdFJXa1Ztb1htdmQrUFNIQ3Zh?=
 =?utf-8?B?TUlkdHZyTnBCUGo2TXdFeVdZTmk0V1MyUGRwdDliazllcDVvVWkwbGNYNjVI?=
 =?utf-8?B?ck5oVUNXS2tOdDQ5d3BQS3JmZW91elhuWktYbG04d2NkT0cyRXlYWTBneGp6?=
 =?utf-8?B?STlZekVqNnhBMVVaZFFobWx0YlM2TDBrN0dlZ0x6MEZmWDY1YVRvby82UVVz?=
 =?utf-8?B?cW1aVnczQkpzZnBMZjVRSUxwTHBscWhMQ3FBTmRLa2xjRGo2K2Y5MXhsRlhv?=
 =?utf-8?B?aHBxOTUxRWJMSWVMS3QwS05NeDJWNy9adDh4NXZEZ2tGUUo5WittNnBSak83?=
 =?utf-8?B?NjhGak1obittQjh2bEc1SDdTdGlHK2FxbkFhRi9VUDNiSEc2V0ROK3IydWhR?=
 =?utf-8?B?NzQwRkpJV01LSExuRGV4T09KN3ovSFhKTWZsaERBY0FxQTJ2M1A2QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 354bcf39-f6bd-4249-60e1-08de9588b26c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 16:05:47.4658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qRor+kWQb/tOvW5vK2OWtfovdFODofoNOgOXxDa3rAlk8s75VVNnqDpHbz0YkqfDZ1ICetIbvCMoBeY8lyEVdcG69JttGW/iYheLuDz9dhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15853
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31039-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 71EA63BEB46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA4IEFwcmlsIDIwMjYgMTY6MzkNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAxLzJdIHNlcmlhbDogc2gtc2NpOiBBdm9pZCBkaXZpZGUtYnktemVybyBmYXVsdA0KPiAN
Cj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgOCBBcHIgMjAyNiBhdCAxNjoyMSwgQmlqdSA8Ymlq
dS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiB1YXJ0X3VwZGF0ZV90aW1lb3V0KCkgY29tcHV0
ZXMgYSB0aW1lb3V0IHZhbHVlIGJ5IGRpdmlkaW5nIGJ5IHRoZSBiYXVkDQo+ID4gcmF0ZS4gSWYg
YmF1ZCBpcyB6ZXJvIOKAlCB3aGljaCBjYW4gb2NjdXIgd2hlbiB0aGUgaGFyZHdhcmUgcmV0dXJu
cyBhbg0KPiA+IHVuc3VwcG9ydGVkIG9yIGludmFsaWQgcmF0ZSDigJQgdGhpcyByZXN1bHRzIGlu
IGEgZGl2aWRlLWJ5LXplcm8gZmF1bHQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9yc2NpLmMNCj4gPiArKysgYi9k
cml2ZXJzL3R0eS9zZXJpYWwvcnNjaS5jDQo+ID4gQEAgLTI4Niw3ICsyODYsOCBAQCBzdGF0aWMg
dm9pZCByc2NpX3NldF90ZXJtaW9zKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIHN0cnVjdCBrdGVy
bWlvcyAqdGVybWlvcywNCj4gPiAgICAgICAgIHNjaV9wb3J0X2VuYWJsZShzKTsNCj4gPiAgICAg
ICAgIHVhcnRfcG9ydF9sb2NrX2lycXNhdmUocG9ydCwgJmZsYWdzKTsNCj4gPg0KPiA+IC0gICAg
ICAgdWFydF91cGRhdGVfdGltZW91dChwb3J0LCB0ZXJtaW9zLT5jX2NmbGFnLCBiYXVkKTsNCj4g
PiArICAgICAgIGlmIChiYXVkKQ0KPiA+ICsgICAgICAgICAgICAgICB1YXJ0X3VwZGF0ZV90aW1l
b3V0KHBvcnQsIHRlcm1pb3MtPmNfY2ZsYWcsIGJhdWQpOw0KPiA+DQo+ID4gICAgICAgICByc2Np
X3NlcmlhbF9vdXQocG9ydCwgQ0NSMCwgY2NyMF92YWwpOw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2ku
Yw0KPiA+IGluZGV4IDZjODE5YjZiMjQyNS4uNDI5ZTg5MTA2ZWUzIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3Nlcmlh
bC9zaC1zY2kuYw0KPiA+IEBAIC0yODA1LDcgKzI4MDUsOCBAQCBzdGF0aWMgdm9pZCBzY2lfc2V0
X3Rlcm1pb3Moc3RydWN0IHVhcnRfcG9ydA0KPiA+ICpwb3J0LCBzdHJ1Y3Qga3Rlcm1pb3MgKnRl
cm1pb3MsDQo+ID4NCj4gPiAgICAgICAgIHNjaV9yZXNldChwb3J0KTsNCj4gPg0KPiA+IC0gICAg
ICAgdWFydF91cGRhdGVfdGltZW91dChwb3J0LCB0ZXJtaW9zLT5jX2NmbGFnLCBiYXVkKTsNCj4g
PiArICAgICAgIGlmIChiYXVkKQ0KPiA+ICsgICAgICAgICAgICAgICB1YXJ0X3VwZGF0ZV90aW1l
b3V0KHBvcnQsIHRlcm1pb3MtPmNfY2ZsYWcsIGJhdWQpOw0KPiANCj4gTmljZSBjYXRjaGVzIQ0K
PiANCj4gPg0KPiA+ICAgICAgICAgLyogYnl0ZSBzaXplIGFuZCBwYXJpdHkgKi8NCj4gPiAgICAg
ICAgIGJpdHMgPSB0dHlfZ2V0X2ZyYW1lX3NpemUodGVybWlvcy0+Y19jZmxhZyk7DQo+IA0KPiBJ
IHRoaW5rIHRoZXJlJ3MgYW5vdGhlciBvbmUgb3V0IG9mIGNvbnRleHQsIHdoaWNoIGNhbiBldmVu
IHRyaWdnZXIgd2l0aCBiYXVkID09IDc1Og0KPiANCg0KV2lsbCBhZGQgYSBjaGVjaywgaWYgKGJh
dWQgPiA5OSkNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+ICAgICAgICAgcy0+cnhfZnJhbWUgPSAoMTAw
MDAgKiBiaXRzKSAvIChiYXVkIC8gMTAwKTsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiAN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0
bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzDQo=

