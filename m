Return-Path: <linux-renesas-soc+bounces-33823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yWM/CQ9fKWpdVwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 14:56:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAF66697B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 14:56:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=mkh8VAhL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E494307B58F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FF4406804;
	Wed, 10 Jun 2026 12:53:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724611CAF;
	Wed, 10 Jun 2026 12:53:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095984; cv=fail; b=WJn9UdoTjq9xWcGAcTVQMZZ63if0Ny12s1nzYvOiv/PJTzEdcGf0QW0W8BkAkoePXprA335fWgHxGzFt9tQhG42jfM4B4Ou+GT8wJx8RhI0thYyBzQfujYHsHwUrKMP1mm+IDWTmSw2pi5cd/cSgmH21d002gv+tGVC8a4tMbKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095984; c=relaxed/simple;
	bh=JXca3Wl7iKkZkA3mNHFOHZ3QbPiWuJEIqtO+NM2iO5Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bviRULbRINceReISiHQVM6mnKm4RZLFABI9Pv080cXFREoQUNZ+EvOKd5Z9gLa/C0H+M7IjpXLEiAq0wJkAJGL+vGJCI2INdlTBUCJx0dAgRU4/fb1gBL8SLM3xx/mK5QA4JqdwkdW5UzQ7S8sE3q9LyX5dQ481gpLoKrZi2O20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mkh8VAhL; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jixq7dsfojy3ERdtsTYOsfSMox56WuBeoLBkXQoIAr9WZPqaR+yacqIQsJc1DaDzDiF6vXRPf3xcdDt70+m+Su6nd38f6G9vAaZP4UHj2pnLaPLmHB6e2cJ/yMddtM917kj/9g/Y5wYMEk8y78yQAMAFxk+YkrJdVKc0qRdnlSfG/Zxt8upN9CsUCR4pdCQQ0wF6+/wEmcjdIdbUPhjmI7TTIawNBlChWrO5h6TjOphZK9KOIWDNhpQIjzOZt+q5SvkZ2L8tqenNimoHnxiBSUJ6JjbG0Mr0UeM/v04glk/+YqADXbTaNN++Mihr/KagMXtRr7KnnZK6yg07y24V6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXca3Wl7iKkZkA3mNHFOHZ3QbPiWuJEIqtO+NM2iO5Q=;
 b=c3TvragfLGR6ET29+LS/IK/3xuNeY6GfDXwel5MYLmA4VroJjiucAw7PdoOOJ9UF2kXk6T5TI1y+IuP+imQRbaF6pncE9Q7H5xwY1WS09JvP+5T4vz2enVyaPZrKBp1W1WYCLW9IOvr7sj7ClVP+GxQww4Qir/KxYzH5/wGDVjQBvR0Y2EWV31Tmt4vKZPQfEUhG8Wwpn1k2h+TlFJ+xZhrsJ7hDUo0C+fPDvAUdjg2kHZiJ5ZxkTJp8FPtofmFuIqXi0fYg8dhpx/css1nXMig/JPAVzHy/HtvfFPNngnV2cOjlNxwcYoE3PHsLYzM6FGnT1EcI5NvGAP3dVnDcRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXca3Wl7iKkZkA3mNHFOHZ3QbPiWuJEIqtO+NM2iO5Q=;
 b=mkh8VAhLo8pA+SDXjNgtY3uLTlVXm930J1JPA/dBQFdNNWtFfqyphBnf7LX8fDi4LclSn9JLioPYcdyO2OJdgL2cM9jfhbVftIbcI00Bq8UX80qgtaLQoQve9NJhG+V8oC2atKuGmjXYdc2ScGRvl+qSU/C+zfaeUI5pte/mSjs=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OSOPR01MB12393.jpnprd01.prod.outlook.com (2603:1096:604:2db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:52:58 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:52:58 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Felix Gu <ustc.gu@gmail.com>, Mark Brown <broonie@kernel.org>, geert
	<geert@linux-m68k.org>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] spi: rzv2h-rspi: Fix SPDR read access width for 16-bit
 RX
Thread-Topic: [PATCH v2] spi: rzv2h-rspi: Fix SPDR read access width for
 16-bit RX
Thread-Index: AQHc+NHXhRVDnALNwkWN/o2lsY1aKrY3vlDQ
Date: Wed, 10 Jun 2026 12:52:58 +0000
Message-ID:
 <TYCPR01MB1209351E71DA2E97A07665A1FC21A2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260610-rzv2h-rspi-v2-1-40c80b4a2c90@gmail.com>
In-Reply-To: <20260610-rzv2h-rspi-v2-1-40c80b4a2c90@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OSOPR01MB12393:EE_
x-ms-office365-filtering-correlation-id: 3610ceff-c3ae-4c77-869d-08dec6ef3302
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 9jNofH98TGoKY9qFg9qRh0jiXdw+tTBaYMN4t9bYBMXfcgPwl8+GfIGcZAqZDE7Gq9Glt6Yc63lP96IIBSOpDnCDtKJGBqRtTV+yqqEgM0HxQWUW3c3oqg6baXTIcvyojW5tJNIWMWIe7bDUxPgBRWyAEZM41b4H7MZ7m7ZhYGC0pkMWXJO/fu+iORr1HFU2Bk1N+Y7ShrKN58lw93OeOeFzC2m3E8aVV31Ww4choLtEy0hQXubemrhJBusTNuqY0I4gWz90JiBhYgTD07woQkm0uLxr1hitkQmg+ZX/7WVmA8MCl/zmzaJUF3sfJnij6CterQEjZSLEtdSl/t1pJj5RdmbctuuziZ/S+XW1U0oOy9YUXyDc8JmTmk9ydvrJDLSi0FBLRLsB0GLA4pfgoU08s7oKxtpVVKCJk9qdsDXjr7B1RzhHui79xizRtN357eUmUC6M2sfCuEA7B6r5dxLwnXOlkWxF+AAYHrG5KOWAOw1kGtESJX8IWr3mNDbVrtJ/MVpdUao0XyXzU1fhaTGjHHGOXtKj1Sqs8UBBI/RRtJWIOr9CNeF/Q7hZtzyv9qpvSEWRRgn5fYJStJROFH1bRaZIrPEjS0PiUitNfYGTyGr1t6CgQMyfZvqoQbx80vtWLfj/t/v89YbYRer/HRRCaEjqaKJO3DuFZ7oNaA2fS6NMAOTxLsWSey78pFhRSBNMbqYbkW6mPFdP1ATqYQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UngveXZjQ0hUNXRjeGtubVpIQmJqSGsyaE9VVkIrTEowSWJ5YStWeUUvMXEw?=
 =?utf-8?B?cXk4U3UxQURiTDQ3OUthTU4vOWhQVkhUUjlOSGRKUUhFRWZKVUZuczdVb1k5?=
 =?utf-8?B?bWFUOFRtRDkxb0RZd2F5cnkvZ0Jib2ZIdE5vcVBrVXAzS3F6ajhMemhoZi9l?=
 =?utf-8?B?dVlKUnhNcnBiQ05mVUdHajNkd1NIVnZVVnUvR1h3THc4ZW1Bdk5tTkYwczY2?=
 =?utf-8?B?OXI2S3laWmx4bEcwTWlVR2NKanVlN3ZTbjlYSW5ya0xxVG8wN0RiSUcvQkpF?=
 =?utf-8?B?SHlrbktLb2FVeTJOUm8xWTVNMXpVZ1RpTTVITjN4R1RrS1JIMi9uc0pSanpO?=
 =?utf-8?B?bUhMQldLZ1VhVWpnVTRRODgyNm1VNXQzWXJXV0g2OEJlazF4WUlzTzhzbEJO?=
 =?utf-8?B?SENGUmJoKzJvMVFwbnpadGVlWXIvWFI3aUtDQ08yL2xvVVVRWThKbHZGZnpz?=
 =?utf-8?B?aHhLSUlnYnhkTTNTSjJsbmV3TGtiZmduc3pFdFJQQTZNRjJVOEdDNFo5SjVo?=
 =?utf-8?B?SjEyZUVtNEtpWGh6eTVXcitaZzlwSFpxYVBnMEdueVRwcHBiU3BFVk1qUGZ0?=
 =?utf-8?B?ZmxaNXhkVlBscWQrUERqdlY4bnVoYUdRMjJ4S2tsYzRxL0NTOWxvTFJGMGNU?=
 =?utf-8?B?b2tRVFlQWDc5OUJTT2djaGcxK01lTm1QekhDa2VNWUVoQldXSmpKZW5BMjFs?=
 =?utf-8?B?OFowYnBWVGFaYWdvUUVJU2tCblZjanNCVjN0U0YzQ2JoUWxOMDkwdVVrY1E1?=
 =?utf-8?B?SW5hN0MvaHQ1RHBhQUJaVHRtTld3d3RzSHNpQTJmdFFyc1V3SUtESUhUbkty?=
 =?utf-8?B?U2dPaktRZ0pIbW1oRmMrM3VkcTF0NkN0M2ZVb0RXRnBSOGxzbGxpamJDN01n?=
 =?utf-8?B?dU5ROG1MOWpETTE4Y3FacHBuaU9lTXA0SElqVTNkOHVZaVFWZTZEbWthdWRL?=
 =?utf-8?B?dnEwQXpWbUFPRFFhMmJVZFBnZmRGQ1poa0RUNnZpamdtV0JEcUFxdUZmWHdJ?=
 =?utf-8?B?M093aHVUWlJlaFFGeEtlZWc0dHZSVjVLSWhIUjdCMlMvVEU1cjhWL0JsVVBD?=
 =?utf-8?B?U0xiR1MxenNBTFdMZnh6MENENjZFUTlRdm0rZFFZSDR0aWhiNnRDU2tabzM5?=
 =?utf-8?B?YnYxY3kzaEFDODJVeXk5Vmk3dU5KbWxQL25FYk0zVkpTdThUV3FUanhkdWFL?=
 =?utf-8?B?bzJ1MUxEeTNsY085eFBiZHgvUVA3UndsZStBVmc0bGJiL3V3YWxlUW1JTEFK?=
 =?utf-8?B?elpwcVd1azJyR1pmckkvVjhWNGJ5aVY1WXRiOXpYK29HMGFzYnU1Qmp2alhI?=
 =?utf-8?B?ZVpvMVZaNlErT09peDFZeVV5bUNiYkYrQjdITjg2RGpIbXRVR3AvZ05BbmpF?=
 =?utf-8?B?Q0tIUksrTXNYMWFGaFFxZEZIR0x0WVVmVlg2ZjZmcnBlVUJuVHNZVmF4UTJL?=
 =?utf-8?B?YlV6S1hsa0ZDNkx4ditZUXF5OTl1ampIS2NHWUNySk85OFRVZHkyZy9wZnQ0?=
 =?utf-8?B?RVdMNUJyZTFqbkRTdnhHOHVsd0pWbnh4ZGdKc3FhRWFCZDBUZkQ0RGRnckdX?=
 =?utf-8?B?dE8vbFliZ2svVjE1M05ZOUVVWTRCKzRQQnhJdUVqOWdHZklYOWNZbTRTZjhE?=
 =?utf-8?B?QVNRbThsYlFMS0U4dTNRYjB6RUVjYUljcjdoY0ZBNUZ2SmtCRmlFMGZmak9s?=
 =?utf-8?B?L0p4UnFlUjdkZEl3YTRYSCszUmtUc1p6cmp1SXJ3emI0NGtLRGlzaTJFbkZR?=
 =?utf-8?B?N2FyUDFOWitjNTdoQmdlNEhLSkp3NVFIUjJqKzdSMko2SHFaZDI3M3pSczN2?=
 =?utf-8?B?RzNmOURQZGNHVGRiNW13Mm8yVjVKOHRmUG5CT1M0ckVDbWFvRGg3c3AwelIx?=
 =?utf-8?B?NzlWWndMVVI5Nm5QVXZtNng4YmIwNkFXclVreDBrMjVseG9GaDBGN1o5clVD?=
 =?utf-8?B?aXEyU0ZOQWpZMmw0ZHRCUmtuTE0vNklvTlA5MTM3YjBEVW5NMUxVZlViUVkw?=
 =?utf-8?B?YW1uMUE5ZmpYb2lZckNveHFBSzMweC9GOHZzcTNqc0EvVG02QUE3cDdTdWRZ?=
 =?utf-8?B?Q3lBU0tHU1FzbVlTOHY3ZjlVMzE4Yzd4Z05SUUcwTkNZME9ja1JrajMzSjRy?=
 =?utf-8?B?YnV4T3AybWYwcStZR1lwTHd6UzQxeElodjBUbWw4VmhuYzhWNlp0OURIbGpq?=
 =?utf-8?B?MHoxTzJUcVhvUFZld0d3OUhYWmNsZFU2NlhCamdDQ0wxcTJ2RWFxQW5paFQ1?=
 =?utf-8?B?SHp0OFRVTGx4QWNEeFQ3WllFODdzcDNOZmFtTHk4eEh4N0JubmUrVDcyeFdS?=
 =?utf-8?B?Vmw1aEd3d0o0aG1nVURQYjJPYTJFTndSWU5JLzRMcDJnZVFrSkFHbFlwVGlz?=
 =?utf-8?Q?xXTmun9rydBPQU9E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3610ceff-c3ae-4c77-869d-08dec6ef3302
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 12:52:58.7902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OtVmG5nEcK3BJBB5tKDSOE5HkOjXh0YKc3cap1LQ4o7hMO8+hBSpbRg+RKAh0WEFeKA4Ar/EZqTnpSNWwTzRHwp+sItZ1iAMOFIuTA68D2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12393
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:broonie@kernel.org,m:geert@linux-m68k.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux-m68k.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33823-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,msgid.link:url,renesas.com:dkim,renesas.com:email,renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FAF66697B4

PiBGcm9tOiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+DQo+IFNlbnQ6IDEwIEp1bmUgMjAy
NiAxMzowOA0KPiBUbzogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNh
cy5jb20+OyBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+OyBnZWVydA0KPiA8Z2VlcnRA
bGludXgtbTY4ay5vcmc+DQo+IENjOiBsaW51eC1zcGlAdmdlci5rZXJuZWwub3JnOyBsaW51eC1y
ZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IEZlbGl4DQo+IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyXSBz
cGk6IHJ6djJoLXJzcGk6IEZpeCBTUERSIHJlYWQgYWNjZXNzIHdpZHRoIGZvciAxNi1iaXQgUlgN
Cj4gDQo+IFRoZSBSWi9WMkggaGFyZHdhcmUgbWFudWFsIChzZWN0aW9uIDcuNS4yLjIuMSkgc3Bl
Y2lmaWVzIHRoYXQgcmVhZCBhY2Nlc3MNCj4gc2l6ZSBmb3IgdGhlIFNQSSBEYXRhIFJlZ2lzdGVy
IChTUERSKSBhcmUgZml4ZWQgYXQgMzIgYml0cy4gVGhlDQo+IFJaVjJIX1JTUElfUlggbWFjcm8g
Zm9yIHRoZSAxNi1iaXQgZGF0YSBwYXRoIHVzZWQgcmVhZHcoKSwgdmlvbGF0aW5nDQo+IHRoaXMg
cmVxdWlyZW1lbnQuDQo+IA0KPiBTd2l0Y2ggdG8gcmVhZGwoKSBmb3IgdGhlIDE2LWJpdCBSWCBw
YXRoIHRvIGNvbmZvcm0gdG8gdGhlIGhhcmR3YXJlDQo+IHNwZWNpZmljYXRpb24uDQo+IA0KPiBG
aXhlczogOGI2MWM4OTE5ZGZmICgic3BpOiBBZGQgZHJpdmVyIGZvciB0aGUgUlovVjJIKFApIFJT
UEkgSVAiKQ0KPiBTdWdnZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVz
YXMuY29tPg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIEZpeCBjb21tZW50cyBmcm9t
IEdlZXJ0Lg0KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDYw
NS1yenYyaC1yc3BpLXYxLTEtYzFkNWVkNTYyMjQ5QGdtYWlsLmNvbQ0KPiANCj4gVG86IEZhYnJp
emlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiBUbzogTWFyayBC
cm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiBDYzogbGludXgtc3BpQHZnZXIua2VybmVsLm9y
Zw0KPiBDYzogbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgZHJpdmVycy9zcGkvc3BpLXJ6djJoLXJz
cGkuYyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXJ6djJoLXJzcGkuYyBi
L2RyaXZlcnMvc3BpL3NwaS1yenYyaC1yc3BpLmMNCj4gaW5kZXggMTY1NWVmZGE3ZDIwLi42ZWQz
ZmFkODczYjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1yenYyaC1yc3BpLmMNCj4g
KysrIGIvZHJpdmVycy9zcGkvc3BpLXJ6djJoLXJzcGkuYw0KPiBAQCAtMTM1LDggKzEzNSw5IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCByenYyaF9yc3BpX3J4XyMjdHlwZShzdHJ1Y3Qgcnp2MmhfcnNw
aV9wcml2ICpyc3BpLAlcDQo+ICBSWlYySF9SU1BJX1RYKHdyaXRlbCwgdTMyKQ0KPiAgUlpWMkhf
UlNQSV9UWCh3cml0ZXcsIHUxNikNCj4gIFJaVjJIX1JTUElfVFgod3JpdGViLCB1OCkNCj4gKy8q
IFRoZSByZWFkIGFjY2VzcyBzaXplIGZvciBSU1BJX1NQRFIgaXMgZml4ZWQgYXQgMzIgYml0cyAq
Lw0KPiAgUlpWMkhfUlNQSV9SWChyZWFkbCwgdTMyKQ0KPiAtUlpWMkhfUlNQSV9SWChyZWFkdywg
dTE2KQ0KPiArUlpWMkhfUlNQSV9SWChyZWFkbCwgdTE2KQ0KPiAgUlpWMkhfUlNQSV9SWChyZWFk
bCwgdTgpDQo+IA0KPiAgc3RhdGljIHZvaWQgcnp2MmhfcnNwaV9yZWdfcm13KGNvbnN0IHN0cnVj
dCByenYyaF9yc3BpX3ByaXYgKnJzcGksDQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IGEyMjVj
YWFjYzM2NTQ2YTA5NTg2ZTNlY2UzNmMwMzEzMTQ2ZTdkYTkNCj4gY2hhbmdlLWlkOiAyMDI2MDYw
NS1yenYyaC1yc3BpLTNjOGRkMTY4ZmI3Mg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBG
ZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+DQoNCg==

