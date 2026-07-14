Return-Path: <linux-renesas-soc+bounces-35211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U5wkArBCVmqG2QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 16:07:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 410BA755842
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 16:07:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=Aj9HRVwJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43C8631A0251
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 14:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D111937106A;
	Tue, 14 Jul 2026 14:02:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7312944160F;
	Tue, 14 Jul 2026 14:02:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037738; cv=fail; b=NvjG1rQkOrRCH9POLKch+V1jB4j/CE5Z/Odyr3WSsYrCzX6GJvFuQlnZ3pPaCPIQ1EOq8D72wGCsvq9gNysFGt3sJuEoJ8bJQc8o95Y7OU7zltvqE3aSZlYHZJswJqH6qcfLgzimASzxdHWlPcpvpyRdkboIUbGoTjgR3VtXNog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037738; c=relaxed/simple;
	bh=3iMjLStQElpzPUB2seu/UHfbYeJsqbXzjl+E3RS+wxc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PbZIh/BokLzPf5TX//4qWSJ5WTOJXEUhEM8ZKRccFCkH1yJk+gCn25DNSDvzyTfdmEoWECwpmmKXbs5AHE9OoFdG4SulZqOyrnbBUZxPYjtKNHzxJtyAH0tifrq/7C4o+JNGB0o2SU4bYrkH8GIv6w3jIkWeihxvvCis+5DrLG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Aj9HRVwJ; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nk2ZureeDWWkdXyXAITFLJKF2ULoOeI1gpOEUq3lel80J2ESGxxfmOBdWiSyqT5zLyssb/YB1wsyGndDGq6JnpWvc5rX/w1lgTXfApWiEiTj93ZbSdjwHQFpW3M+rHRnPn/ctTWA0lHut1LJPZdITFonnqbH37NugswG/3PsrQrHM3pXpDEVchcs/QklmwQoz77ZQwS00/zU2g6maNyonCwBviw5PgK3kSj0lnIxq4qDi3z6pz4rkZ9CWmoA7twDMxEHhWC+85LvXkz924XQj0bhYWHfRxINi3l4m4MAnlmlc/at/IzsRWSh3MISfPPIwX+z2a39pZzL7lmdgr3opw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iMjLStQElpzPUB2seu/UHfbYeJsqbXzjl+E3RS+wxc=;
 b=hPxhPylcYFaAzIW4eG3OxRLKtsY8ydwqtwzcbDtPng4A3ycfjVcYen7GYo8Vee1NspOvmcHY1BtNn9h3kwJXhJLY317m2DgG2mYNfzKHQVg8E+VvEfURZYpmPkln+jNx7l5nDLZIBFUeVnJiQeogIVTCknBVnxQF/JjqCuTQMZKxlDe4aeT5DKg7ARjboWNpBjNYVEVWaJs7W8czJx0Lhm5CGZ5mtAFc0viifE3nAVqjTzCxIdaU62CD0tiV5+B3j/NkoWxHwJFxbXzhAn5go3un0Wb4ofe27O31p8DJeDgUuDSxdCjRVkxZncnDlZBZgFmdhJaDefKYBvhnmW4S2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iMjLStQElpzPUB2seu/UHfbYeJsqbXzjl+E3RS+wxc=;
 b=Aj9HRVwJQAOm2DnvYYcE1I/4HJEb5UaAZXKW6KpHzxmrnGfnpDo1IYtjqAd3PloUKoNYEPKNCjDKRw1vj2MO6bBNOiY51aClkRUE7KU0FdW/AzdT0LozFkUOEERD4d3RYQYm6OJ1YeNJpxp17TpLmdjRbdxtZS292EjH1nYPmX0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8180.jpnprd01.prod.outlook.com (2603:1096:604:176::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 14:02:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 14:02:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, Ulf Hansson
	<ulfh@kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v19 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Thread-Topic: [PATCH v19 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Thread-Index: AQHdD9lE2kvJOhJAN0Wml5dpidvnprZtCj2AgAAIPzA=
Date: Tue, 14 Jul 2026 14:02:05 +0000
Message-ID:
 <TY3PR01MB113463D63232F2CE3B0116BE886F92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
 <20260709192916.630794-9-biju.das.jz@bp.renesas.com>
 <CAMuHMdW00Z-Kj7nQiZ+W6fuj20grD9GUg93K8dCKH0wWh4U7ng@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW00Z-Kj7nQiZ+W6fuj20grD9GUg93K8dCKH0wWh4U7ng@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8180:EE_
x-ms-office365-filtering-correlation-id: 56b59751-9daa-4bef-6532-08dee1b07c89
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|18002099003|22082099003|4143699003|56012099006|11063799006|3023799007;
x-microsoft-antispam-message-info:
 ZDjmg0xGa+MQTdT0SImbXM9bbjtIk5fQ0qfFVH5OWlVwaEEZTTQXyLsroPXWGOjaMZ0WIaIee5+bAQijXmA4SpDWBzzchkX0mSaXRN5I+gjOa3YKuvMVSchKjUxi8brp+4CUSaMJZh9M2TbHbVJcXgxwmUeVwZPCxncM3r6u/X5+DfkKLM1W2PdkLtkRd2ZQicy52OCoaRmk2RcclkrQ6i3LfEM1NOanE3HhEZGchnPLUUSei4TwxUZ3T/HKqHe8iKL8uGCJo3BHvQLse7ysi5YwSaq7xpTYiRVtwSWXdCsYIcNmSlHaB++I/a+1bi67/dgSoUqw2kguosSXgVV8WcVYDiG8m/nfRG85LTzODFDl3M4sk1p0OzFhZx1oDo7VvQ5gHMJAkzNlrkls3aZptaiWWOXsIEkqE5MdeK+yE1HUSJ8MKLzqQiyqi87PyE5qibuGv12ShPTR8E8gvXdGwMMzptHACG/0aSZlbCVAQKlI/Hbr6fN0yHFyZEBk7CuWm/NAulkhYhU5VO8MJjRIHFCrl6FOjtZexjS2w/IeV5moT0I9W+9zPyG/scPGx+fiTazIxaiPqhrQAz3bcobuYkOyVsgNHjlSkhbi3M505FGtceAZn/jhMXLozYoN/r0APyQsxh16Q5h3uDJ+SRGjW1EdGWs7xoVtUHWRoiOLELSUUqJXds5oTPIJXGTYhp8te2Kj9yUnezWwVLoB3gRuAp+mYOJ7w4qoaqS7MOaaYnI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ak9iK2FER0hNR3RZYk01em5QRzZ4M1ZrWVlybXA4R0pwQ3Z6OTMwOGxrWGdz?=
 =?utf-8?B?YmdSREZLKzRmTUVBdjdzWWpTUDJ0aXhVM05vTGF4UThMUVF4R05pVWFiVmZk?=
 =?utf-8?B?cDh2VnVNNnRGYXJaekJzek0wVGRNcDhPUURzd01SR2RpeDY0bG9SaE42ZjYv?=
 =?utf-8?B?K2lZWlNLT0trRVBDVEYyakZsUFZqUUhwRjNmQzJRZkZ6SjYvY3E3YUx2c3JS?=
 =?utf-8?B?eHZIbWEzWHVUaFBOT1hJUnlLVUZnZ3orOE9McVJRV0pjNUt2dWhLN0VBQkcy?=
 =?utf-8?B?WklBM3EzclkzN1RTRGovbGx6MHNENFkzWHloUjllazZrbUovMHpZd2paUk5C?=
 =?utf-8?B?TjVsZWpEczRiYjcyWlN0MFVHdjBEWWUzTmkxR0VHaXBhT01FbnZJRVAzSlZj?=
 =?utf-8?B?ejliWmFHUHNyNGpXU3Rrakc1dTg5dUdYMFNadFhlcHVnamZrUkhrK1NDUTdU?=
 =?utf-8?B?RlkxdVN6MFJHRzBUOWRXZjNPVjNacXRmQmtIUThlVlB4N25nYjQ2UytjRy85?=
 =?utf-8?B?bEQreDJnbUxJdEc3S1JSRkFIbHJMQkE1amF3OGtsdkVpbWhMZWc2K0xYdktJ?=
 =?utf-8?B?eGVMa3R3TXRHQW95eWhZVXJFY2NNcDVUaXdVbE5JWUF2aEM5QVZCc1dmdGRn?=
 =?utf-8?B?VzVhVUs4WVJERFE0Q2NPeUhXdlk5eTRHUVhYSE55d3RFaStGK2Zwa0ZiRkFo?=
 =?utf-8?B?Y2xvRVVyU21OS3Zvc09wOEh6dEpVWTNhRzdyWkJOVzFCOHpxaHY2QzR4MzVI?=
 =?utf-8?B?TDZEUGZGa3Q0WmFrdmYxY2huWUdGQWpzeWI5MklSenZJcXdQbVFaWWxoTyt5?=
 =?utf-8?B?a2dFNmw1YXBuQjM2YUVXWURBb3BmcmRmTytpUmJZdWY5L1BsTE5pOVZUMEdq?=
 =?utf-8?B?SXR3MGlxMlV1WERzNktuOEFJb2hsRXBnZGlzZHc5WThwNDQrOEI5N1k4VURx?=
 =?utf-8?B?L2pKNDF3OUJBcllYYWJFWUxNODBLVUJHbi9OUUtxZVZRa3I0cU9FazNiOXF4?=
 =?utf-8?B?RDhHa2UzSERhdDVROERYRzRJMG1CK05ld1I5ZUhhVUlEUjRLbUVMa0ZJLytL?=
 =?utf-8?B?NytJaklzU2w3UHBnbjlONEgxSG5COXRmU0R0MTRVRklpcm9FTE9nTkxYNCtK?=
 =?utf-8?B?Mm9aTStZVTJXS01sWXA1RUhqOUIxZnZZZTQ1bVlBdTVJbUNqNHA5VHJPSFdH?=
 =?utf-8?B?Yk10aFAyRDB0TENVMWVZNzZFQUp5UWFKOVpnQUJvZW56bUJaQkdkanhaK0VU?=
 =?utf-8?B?enJjbjNoYWltaXhVdEhrWkVoQ1hRV1R4a09UdEJSdnUxZW9rUVlZbm51dmtr?=
 =?utf-8?B?MXl6Wms4VDVzTFBrOExrL0MxS0dOcUNnOTFBQnFYaWwrd0l1WDJGdWx6MXpl?=
 =?utf-8?B?ZVNWbk83RHZwek5QN1AyaHJrTjhQaTlpZUZvaWtrQW9vWCtwSFlxanYwVkM0?=
 =?utf-8?B?dlBqVEtkOGc0OW1nOExrVm5DZXdqb09kWFVwSm1LdVFqRVl3TDQ1Z3U4QllO?=
 =?utf-8?B?SW5zOUZ4djIwa3Z4bUlzbTR2MFhhWWtaS0w3c085MWp0TW1GcnFzZ0lOUk1G?=
 =?utf-8?B?ZGpCcUlSOVFkQUtHTmlxSDkxSTc4bVhlbGZrbUFlMGhQZVcvSDF6V08zdGNO?=
 =?utf-8?B?ejV4U0FqWDAycDg0RVhxa1pGWGJ6TThmNUNiaWlQUXpqdHB5QUZvMmJxLzdt?=
 =?utf-8?B?ZjNjMHU5REsxbWhNVk9WUEVCa0wrYkdtTmVjN2FSRi9ZUlRYcGNMbGFvTnQ5?=
 =?utf-8?B?ckZ3VlFZSUJoRXhmMXc1M0l2eVFLMzVxR2UyOWZEYXMraUVYY1hXdUx6Y251?=
 =?utf-8?B?ZnJPTDlQOGpYZ1dyR0JDazZPYWFZTUcyOHJ6cHVlLzFGRkdaNnZ5R0J3ZHBu?=
 =?utf-8?B?emRnb0RJTHJtMDNOaitDUDRSM0s3emFlM3I0aE1WazBqWkFlSlJLUEZETURL?=
 =?utf-8?B?MmMwSTJZTmFqR3AvcDN2TCtYNzJuZUZJTHp0VUJ1Rm0yY1FWbzFweTF0QVUw?=
 =?utf-8?B?QzdrWnJqMFJNYXB1VkUrT25PeEdFK1g4ZXZBbFlyUlgzQXIxTWMxcEtVbnZH?=
 =?utf-8?B?eVdFaU1zRUloaGc5Q2NkZHhxUHpqKzlBTkZ1WGg3MlZ2QkFBUXRyMzRSRzd6?=
 =?utf-8?B?TVFlMTR0OWE1ZnhWdFFyZlpQNXhobjZ3VzVUZzU0Y1Y5QWxsTldjYzBlejY3?=
 =?utf-8?B?OCs4WVdxWnhYQ3lFRjF4b3RKaFdmQW95LzhuY1MvM2Ftd25PejhkQ0J6eWdr?=
 =?utf-8?B?c25YQUtPNzUrajh6bHQ1ekZybmdKUm9DZGdqSkllRUJSRzFuNWFtc3cxNWNi?=
 =?utf-8?B?dVE3eUlpZ3hjcGpQRGJiWmpUaHNQQzJHalNaaXdIT3BhWmFFWUIwdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b59751-9daa-4bef-6532-08dee1b07c89
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 14:02:05.2901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Io8VPRMjGKh0iLuLYgmYvQILepCugUont3Hy8dyfEo2aEngvYQ0VAS0wQjESyeJNIgldkfg6Tee75wnu2NXHbM7uYk951smCsz7G/u59MrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:biju.das.au@gmail.com,m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35211-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 410BA755842

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE0IEp1bHkgMjAyNiAxNDozMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYxOSAwOC8xMl0gbW1jOiByZW5lc2FzX3NkaGk6IEFkZCBSWi9HM0wgU0RISSBzdXBwb3J0DQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCA5IEp1bCAyMDI2IGF0IDIxOjI5LCBCaWp1IDxi
aWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFRoZSBSWi9HM0wgU29DIChyOWEwOGcwNDYp
IGhhcyBhbiBTREhJIGNvbnRyb2xsZXIgd2l0aCBzZXZlcmFsDQo+ID4gZGlmZmVyZW5jZXMgZnJv
bSBleGlzdGluZyBwbGF0Zm9ybXMsIHJlcXVpcmluZyBkZWRpY2F0ZWQgaGFuZGxpbmcuDQo+ID4N
Cj4gPiBVdGlsaXNlIHRoZSBUTUlPX01NQ19IV0FESiBmbGFnIHRvIGlkZW50aWZ5IGNvbnRyb2xs
ZXJzIHRoYXQgY2FycnkgYQ0KPiA+IHNlY29uZCBoYXJkd2FyZSBhZGp1c3RtZW50IHJlZ2lzdGVy
IChTRG1fU0NDX0hXQURKMiBhdCBvZmZzZXQgMHgwMTApLg0KPiA+IFdoZW4gYm90aCBUTUlPX01N
Q19UVU5JTkdfREVMQVkgYW5kIFRNSU9fTU1DX0hXQURKIGFyZSBzZXQsDQo+ID4gcmVuZXNhc19z
ZGhpX3NldF9od19hZGp1c3RtZW50X2RlbGF5KCkgYWRkaXRpb25hbGx5IHByb2dyYW1zIEhXQURK
Mg0KPiA+IHdpdGggMHgzRkZGIGF0IDMuMyBWIGFuZCAweEZGIGF0IDEuOCBWLiBBIG5ldyBSWkcz
TF9TREhJX1NDQ19IV0FESjQNCj4gPiByZWdpc3RlciAob2Zmc2V0IDB4MDIyKSBpcyBhbHNvIGNs
ZWFyZWQgYXQgdGhlIHN0YXJ0IG9mIHR1bmluZyB3aGVuDQo+ID4gVE1JT19NTUNfSU5URVJOQUxf
RElWSURFUiBpcyBzZXQuDQo+ID4NCj4gPiBBZGQgYSBuZXcgdmVyc2lvbiBjb25zdGFudCBTREhJ
X1ZFUl9SWl9HM0xfU0RNTUMgKDB4Y2UxMCkgYW5kIGV4dGVuZA0KPiA+IHJlbmVzYXNfc2RoaV9z
ZGJ1Zl93aWR0aCgpIHRvIGhhbmRsZSBpdCBhbG9uZ3NpZGUgdGhlIGV4aXN0aW5nIEdlbjMNCj4g
PiB2YXJpYW50cy4NCj4gPg0KPiA+IEludHJvZHVjZSBvZl9kYXRhX3J6ZzNsIHdpdGggUlovRzNM
LXNwZWNpZmljIHBhcmFtZXRlcnM6IGEgd2lkZXINCj4gPiBjbGtfbWFzayBvZiAweDIwMDAwMDIw
MCwgYSBtYXhfZGl2aWRlciBvZiAyMDQ4IChyZWZsZWN0aW5nIHRoZSAxMS1iaXQNCj4gPiBkaXZp
ZGVyKSwgYSBkZWRpY2F0ZWQgcnpnM2xfc2NjX3RhcHMgdGFibGUsIGFuZCBhbGwgcmVsZXZhbnQN
Cj4gPiB0bWlvX2ZsYWdzLCBpbmNsdWRpbmcgVE1JT19NTUNfSU5URVJOQUxfRElWSURFUiBhbmQg
VE1JT19NTUNfSFdBREouDQo+ID4gV2lyZSBpdCB0byBhIG5ldyBvZl9yemczbF9jb21wYXRpYmxl
IGVudHJ5IHVzaW5nIHNkaGlfcXVpcmtzX3J6ZzNsDQo+ID4gKHdoaWNoIHNldHMgZml4ZWRfYWRk
cl9tb2RlKSwgYW5kIHJlZ2lzdGVyIHRoZQ0KPiA+ICJyZW5lc2FzLHNkaGktcjlhMDhnMDQ2IiBj
b21wYXRpYmxlIHN0cmluZyBpbiB0aGUgT0YgbWF0Y2ggdGFibGUuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+
ID4gdjE4LT52MTk6DQo+ID4gICogVXBkYXRlIGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gPiAgKiBV
cGRhdGVkIGhhbmRsaW5nIGZvciBjbGsgZGl2aWRlci4NCj4gPiAgKiBSZW5hbWVkIFRNSU9fTU1D
X0hXQURKMi0+VE1JT19NTUNfSFdBREogdG8gbWFrZSBpdCBnZW5lcmljIGZvcg0KPiA+ICAgIGhh
cmR3YXJlIHR1bmluZyBkZWxheXMNCj4gPiAgKiBEcm9wcGVkIGR1cGxpY2F0ZSBTSF9NT0JJTEVf
U0RISV9TQ0NfVE1QUE9SVDIgbWFjcm8NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4g
DQo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jDQo+ID4gKysr
IGIvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jDQo+IA0KPiA+IEBAIC0yMzQs
NyArMjM2LDE0IEBAIHN0YXRpYyB2b2lkIHJlbmVzYXNfc2RoaV9zZXRfY2xvY2soc3RydWN0IHRt
aW9fbW1jX2hvc3QgKmhvc3QsDQo+ID4gICAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgIGNsb2Nr
ID0gY2xrICYgQ0xLX0NUTF9ESVZfTUFTSzsNCj4gPiAtICAgICAgIGlmIChjbG9jayAhPSBDTEtf
Q1RMX0RJVl9NQVNLKQ0KPiA+ICsgICAgICAgaWYgKGhvc3QtPnBkYXRhLT5tYXhfZGl2aWRlciAh
PSBTREhJX01BWF9ESVZJREVSX0RFRkFVTFQpIHsNCj4gPiArICAgICAgICAgICAgICAgdTY0IHRt
cDsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHRtcCA9IEZJRUxEX0dFVChHRU5NQVNLKDks
IDgpLCBjbGspOw0KPiA+ICsgICAgICAgICAgICAgICBjbG9jayB8PSBGSUVMRF9QUkVQKEdFTk1B
U0soMTcsIDE2KSwgdG1wKTsNCj4gDQo+IFRoaXMgZmFpbHMgdG8gYnVpbGQgb24gUlovRml2ZSwg
ZHVlIHRvIG1pc3NpbmcgI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+Lg0KPiANCj4gT2gsIGZp
eGVkIGluIHYyMC4uLg0KDQpZZXMsIEkgcmVtZW1iZXJlZCB0aGUgYm90IGJ1aWxkIGlzc3VlcyB3
aGVuIEkgd29ya2VkIG9uIHYyMCBhbmQgYWRkZWQgdGhlIG1pc3NpbmcgaGVhZGVyIGZpbGUuDQoN
CkNoZWVycywNCkJpanUgDQo=

