Return-Path: <linux-renesas-soc+bounces-31488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIuoJpF56GlCKwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:32:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D50442F44
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C65A301CCF5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 07:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D3936C9ED;
	Wed, 22 Apr 2026 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Td9lh23O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844DD1A6815;
	Wed, 22 Apr 2026 07:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842809; cv=fail; b=T1wpHCLRXDg/EbnGfXVQKIiEKzYF2oty8Yc/ZUZdSIJjsEGJc7mdPoACZXAEU33zjr2B1E6mKuZV3aKYIK/+3H44lI3aUuixVLHhPNOaL0NT/UxyUwDYH98pDpQNA3DHrHASt/2JPzU3//HAWHJ+jFNJVBkCRmsR4iZxooZ4o78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842809; c=relaxed/simple;
	bh=gVO7tFZT7mBnwHXTbFY6ShiVwqLXAUvUNfZG1DjSLBE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ej5JTFecQQCaf7Ooa6CeYcDny3Oq8AMAmPccPBN810R3u+tWe7C5D5ybJ6sPpOyV6zGbqwjVOT59tNgin5DiZvHhyCt96WATu2C6iNs0eWRExD3ZxrJseODeKDpdyREm13BQ51C2d+AzB7i2HFvfAoWCE8vZR/Yn26SnTvfQw7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Td9lh23O; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vc0R0mCPGJ4hpF4kV1jY4Crv1jWJdrEunEZHNQGXFgfQiWqbZSnR8fq1x8sMJRDE9zd/m9fJryCP0bJnZ7+Mi4zleCi6o74Ww9QDUEvZTp5UZbXUBIlWqf9+cFVKxrTY/+rO3J7FRrOSH1leP1dJjyTdUVK6l4Z+6tGlwJM+txOm8iHhh3TO85BYc4m83tCUI6Z/yfKeHwDfrFr7HQaagInLbH0KT7b1c8nGv44AErV83m7117sdrdZ2i3hXrALs20xSQK28iEwWo49PKUmGVrmLSMoev+Ts87BVq+Z0RaqrlDetMfzr7EIr2eFwG0pb4YJVwYNBNHzVdjC8otk1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVO7tFZT7mBnwHXTbFY6ShiVwqLXAUvUNfZG1DjSLBE=;
 b=pMHEI1MYxIUBUgY/5Co7gLnOg1TnTJq4gy7B2BNYhGqPiXVPXS1cWP1B4aU6ip4kAQS+kJTXMh9gIVMOGM+fhbqCU0k4WEB9kRRb3ABAE2PcxHtAKlAFFmPhLcpFuBMw+HEpaH3RIBwewGRPstfFoZeDDJa6PLhRYezC/5TQPVdspz5Coj8UoXwCNyyqx5+i4ByZREVprJZxgGxFZr3MBTYjdpZyumRjflafXGN6sAOQLCDEmQOo3kdvef4EcYddNG3AulqD7ZkhkuTG5CtmuN+pXbL19X7XryDPu5S1SXEMf7SLlyLBtT03uny2oFLe7Jz/kOT+ND51cf8E2muqsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVO7tFZT7mBnwHXTbFY6ShiVwqLXAUvUNfZG1DjSLBE=;
 b=Td9lh23OyKt2e9Zbsnn8pmNpA1pgpbkGBxPuAqYoxoaYMQcYIoyYZxDmdi0Qhxz235kJRhlUL1+iNQOqYC1v1hDqrWdlUXPRPWMrcINSJzEKKLhKaeOfwO5f4bLO8gY8y7CqQhfVyN4y4PRrz5HrZ+Rc9euhwj24mh6QFPk5kQU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13360.jpnprd01.prod.outlook.com (2603:1096:604:330::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 07:26:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 07:26:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Bultel
	<thierry.bultel.yh@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] serial: sh-sci: Drop check for zero baud rate from
 uart_get_baud_rate()
Thread-Topic: [PATCH v3 2/3] serial: sh-sci: Drop check for zero baud rate
 from uart_get_baud_rate()
Thread-Index: AQHc0M6emgAftl0/YUmB2vCn062HwLXqqv0AgAADXqA=
Date: Wed, 22 Apr 2026 07:26:42 +0000
Message-ID:
 <TY3PR01MB113464AE43A23A0B69BCC5675862D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260420140426.237865-1-biju.das.jz@bp.renesas.com>
 <20260420140426.237865-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXQi7eSZg71=01dYjpmgHRXS+L9hXZMN_dR-mtM6sLKNw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXQi7eSZg71=01dYjpmgHRXS+L9hXZMN_dR-mtM6sLKNw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13360:EE_
x-ms-office365-filtering-correlation-id: c3b80a67-a048-451c-a13e-08dea0408092
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 2kcbQNB5cz9xDibjfsjZI81M+t0TvC6IHrVTq8S+yaRU39AiQfvI91E6wExgPyCUsv7g8U2uNTDZLFEq52UENcC9YqFUbvSPJwH7oGHit5s6iAkl65n3ZUxOVzVp5izlpoPAo0H5SQsI1v1DJq690MwIWtBaN7oKhdYDmAiN1gUafxzvBfY+bXx4da35Y0resHmFOguvLETBPpsixyYo3M20/SUgzxz60QRyW9f+K/y6Q006e8Vny4EDzPfktKHZfQfyEaeGRqlxnh5GwbHvkjtD+djCwyA1qCPSKLvi8fyqnuNXo+0XDyIwsGE0PjyshYXLrtVAN6GbxC/hUIwkBJUjT4W0r4yBEsD9ZDd9RP+2nL138oHdwJJW4visj9dKOUG47qlVUMYIUdmvZFdiAxV2MWO1alhK6zGpvwvJtXoMZVcKENq2S/z8AZX/RqK7OC7GgvVnc39BoR/ab0nSt0aZCxeCfJWHZZ+jWN7J266gDGnRzqPsFa8ydI2gBSaTojBvWtL0UzpFbn3S0gRdW26BWdqgaZ3U1yNHQubAXEDSKVMUno22vr7K1XXEb8RSt7m1ucdI4GRJ2jP4pyoOzLYmABTco/HzZQ+XYYj27BoDSl0EKU0Y1QKykIjzbigcwjU3F8cwmCI2Z15zAkq9/uaKkLqm9N3SIJ9Ygm5Ko+WwS14xJdxcz8Jw69aXDqJ7hMJaz1L5vIEYM5quaRT9q0OkLj6XP4lRXJW/KBIcwIzOdB50OiaUfp27h/qzhCGRsodoa4daQ+WwQDQYPuVSOjRVNFt5JGp7udJ8fuU+ojM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3ljRzhCOVhUMm5vcWdCUlVZWFVhZVA4d3BQejRCbGhXSkRBenFkWXE5emFy?=
 =?utf-8?B?SStrR2FONVpiRFZYUldpMmxmUVpmRGdpTm1xTFE4OW0veXdKekg1WS94enpw?=
 =?utf-8?B?OU1KUlFoZGJXamFKUzFYdDBIVmQ4cEtsYS9PQ3JJaUVVWjhPSHlqYXBBSHB1?=
 =?utf-8?B?U0ZxSmoxK3UxQ3lseVZlUjBYbnE4R3JvZTJiSUR4eUF4UEttRU4rN0dTWVZ1?=
 =?utf-8?B?aVhDcm1wN3VLYm9vTmhReDViZGMwcXdnQ3k3T0dQRmhVQ3V5UnNrZE0xNXdh?=
 =?utf-8?B?ai9kaGxIL2ZEOTUrOTUzZlMzbENySWVxdHhuQzZmRHgvUWg1eW1vTXgrQTFP?=
 =?utf-8?B?L2xBWjUrbm9mSm5GQXlsN2RKRXYvSzRIYnl3a0paSjc1MW9TVkhFdThvaFRZ?=
 =?utf-8?B?WWNTWlRvV1ZQOWR6S2N3Vy9JRUhkcURpUloxT2NKVUUwdEd2SHNkcWZPY0o5?=
 =?utf-8?B?Nmh5WEdVeHBnYnFNOEFNTzFTejZ2K29NUjd0ZTRBWUkzQllwa3VKZlBWUHdt?=
 =?utf-8?B?QXhrNE5waVJiR3Rtb3NibWgrYjVucWhUbElYU2ZjeCsyMWpkaTRJZnNocHlL?=
 =?utf-8?B?VFVkcUptbngxKy81QVc2Nk1sSlpWMXhVeE1Bbk9SRjVwL1QwNXhvQ055TEJt?=
 =?utf-8?B?T0ZaVlI1VndlZzJYVzlYUXFuY3MvYmVuS0NhM0VQa1pzNlFUUzdUbFNWVGlx?=
 =?utf-8?B?QVFmUlA4cXpKL1AySFkzVnppK1IweDZneGFnOXd4dlBoNGVkTlBZd1AxeURX?=
 =?utf-8?B?cGNSSFdxY2pUWEFLV2w3MU80WTdjcXBnM1Y5L1BNUXNLUG9IR1hJd282TWpn?=
 =?utf-8?B?YjZxd0l4R2hVWUhXdll2OGd2SlVvZC9TNU9IMXVKVzlnanVwSmw4QWg2bXNJ?=
 =?utf-8?B?N0hwVVRGV0RTcnhlc29XSkUxaXZVZHhUaWJTUDFtTyt1RGMxUlBQaU1UVHJH?=
 =?utf-8?B?WjBhWk9IQm5TaW1mQVBHcVRoTmZRSFJzVVVYbGhEWWFrRVFWWmpNUXdGVG1M?=
 =?utf-8?B?RDk5cWt0ZlJJVENWY2pKL3VoSWxYZUQ3ZFBFaUNNR0IwcWl0RHhjMVpjbnhI?=
 =?utf-8?B?RGdGeXh6QXpwTUhnSlFKUHNVRTFyekFFcUN5UWNlNzB3ZHdnSURGM1BPL0FV?=
 =?utf-8?B?aEEvZUhVaGxTVW9lVEF6MzNoRkZ4akR1ZUxHNmtoek9LZGM4MENFTEgxRGVU?=
 =?utf-8?B?ZjlTNThuQ3p5YnR4d1JBUUVld2syZHRpdzA5NER0dThlN2dJQXNFaWwzaFJp?=
 =?utf-8?B?M3J4a0RIS3p0bFR4aTdYaXE2VkdoeEJEMGlGbnFrL3I3VXhkU1d3SDd4SnZt?=
 =?utf-8?B?SHorWmUwT2l5T05JcytIaCt6WVFjWk5VRWl2OEFUMmcwd1dGU1FRWXpYWFM1?=
 =?utf-8?B?NUpmV2NBOVprOW5oUmNiZ0lTT2lPcG9DK0pSWlFNU1FrTnNXUFlUTEgyVnNT?=
 =?utf-8?B?bTRqYk1nenpPcmJBOXJ2OGk2RkE1WmEybEJtaVdlSVIyODFJMy8vTGlXa05G?=
 =?utf-8?B?amRvQUp6RHI2VEpVbm8vT2lkN3YvOVVWNndob1RKd3JHcDdSbkRxOWt2bUVV?=
 =?utf-8?B?VDUrY0hPL3NraG9vTWYwZm9RVzZ2UjV2ZWpoVzg0ekt1WVgreWpOamNWKzBm?=
 =?utf-8?B?RkFuL1Z1Vk9PUk5kcU9NaVVEUHZ0TzdDR2VHSnZFdWlHY3VjSmZMdDRHcXRG?=
 =?utf-8?B?cHdFZ2dVZ2RvUjRrT0k3TWE2QnBLMG5CVVZxbHpSc1ZaUXJ4NVI4RHUxTlhR?=
 =?utf-8?B?aXZlN2xreklwNmFEQ1BWOEY4NENHMFpnazhhbGhsZU56b1RzdDI0VEIrYmRG?=
 =?utf-8?B?VVNGb1FWZW9vSVpCbk9RWE10b1VzVkJJVExHUmc5NXYxR0JyKy95UGIzM3pD?=
 =?utf-8?B?NlVwMmFPUG0vMEpBbm4zY0lIT1JHSGRVNEdJVENlY05pNEs4cWNyaTlHbUxV?=
 =?utf-8?B?TXBHME9XT0NQd1hzcWhrNkZpRUdkUDZWS0lRY3N1Z0MxZThvWmVrRm1lQy9E?=
 =?utf-8?B?eXNmTXg3RldWRENOWUFSc2t4VmJ6Y3d1MjlvcjNxUW0wZjlUZ2tSbFYvSFRz?=
 =?utf-8?B?Si9wbFVReDN6VnVsbDRmM255UTBhMEFra29Lc01EQXAxbkNCZEpQYWhyVThh?=
 =?utf-8?B?QnBxZ2M0RHR0UjkvMC9reHZWZHBpcU1wSEpFNFZIVW9XOHpwc2JHczFKREhM?=
 =?utf-8?B?bGZENWxEdU5WdmxSZWZlb1M5b3ptcmxJMEJoSDNHTkplcEJmYm9aK0RXRVdl?=
 =?utf-8?B?QzFSZjEvU0NmaU1VeGdpbjdybU5oRFZEYmJmN29MaGJvSXFpV0RJTzgrWEFF?=
 =?utf-8?B?TkRHNTc5N3hZb0kvcXJSb3d4SVhubWtESDVNdmEyMUI4ZjJ4WEptUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b80a67-a048-451c-a13e-08dea0408092
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 07:26:42.8235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXAuI3sudUQzFdDIA5OqMAYPgufa6LnFJYAMKuae5wBrHO64h2gwLNqrefig1Ma1vlpEmLVElMMuhHrEXLsMxxrhkrwZ+5TIuI//c6/do3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13360
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31488-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: E5D50442F44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIyIEFwcmlsIDIwMjYgMDg6MDUNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAyLzNdIHNlcmlhbDogc2gtc2NpOiBEcm9wIGNoZWNrIGZvciB6ZXJvIGJhdWQgcmF0ZSBm
cm9tIHVhcnRfZ2V0X2JhdWRfcmF0ZSgpDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCAy
MCBBcHIgMjAyNiBhdCAxNjowNCwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToN
Cj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4g
PiBPbiBEVCBzeXN0ZW1zLCBhIHplcm8gYmF1ZCByYXRlIGZyb20gdWFydF9nZXRfYmF1ZF9yYXRl
KCkgaXMgbm90DQo+ID4gcG9zc2libGUgZXZlbiBlYXJseWNvbiBkZXJpdmVzIGl0cyBiaXQgcmF0
ZSBmcm9tIGNob3Nlbi9zdGRvdXQtcGF0aC4NCj4gPiBUaGUgemVybyBiYXVkIGd1YXJkIGFuZCBp
dHMgYXNzb2NpYXRlZCBkb25lIGxhYmVsIGFyZSB0aGVyZWZvcmUgZGVhZCBjb2RlLiBTbyByZW1v
dmUgaXQuDQo+ID4NCj4gPiBBbHNvIGRyb3AgdGhlIHVudXNlZCBkb25lIGxhYmVsIGZyb20gcnNj
aV9zZXRfdGVybWlvcygpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiAN
Cj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4gPiArKysgYi9kcml2ZXJz
L3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4gPiBAQCAtMjcxOSw4ICsyNzE5LDYgQEAgc3RhdGljIHZv
aWQgc2NpX3NldF90ZXJtaW9zKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIHN0cnVjdCBrdGVybWlv
cyAqdGVybWlvcywNCj4gPiAgICAgICAgICAgICAgICAgbWF4X2ZyZXEgPSBtYXgobWF4X2ZyZXEs
IHMtPmNsa19yYXRlc1tpXSk7DQo+ID4NCj4gPiAgICAgICAgIGJhdWQgPSB1YXJ0X2dldF9iYXVk
X3JhdGUocG9ydCwgdGVybWlvcywgb2xkLCAwLCBtYXhfZnJlcSAvIG1pbl9zcihzKSk7DQo+ID4g
LSAgICAgICBpZiAoIWJhdWQpDQo+ID4gLSAgICAgICAgICAgICAgIGdvdG8gZG9uZTsNCj4gPg0K
PiA+ICAgICAgICAgLyoNCj4gPiAgICAgICAgICAqIFRoZXJlIGNhbiBiZSBtdWx0aXBsZSBzb3Vy
Y2VzIGZvciB0aGUgc2FtcGxpbmcgY2xvY2suICBGaW5kDQo+ID4gdGhlIG9uZQ0KPiANCj4gSSBh
bSBhZnJhaWQgeW91IGFyZSBtaXNzaW5nIHRoYXQgc2gtc2NpIGlzIGFsc28gdXNlZCBvbiBTSCwg
d2l0aG91dCBEVD8NCg0KT2ssIHBsZWFzZSBzaGFyZSB5b3VyIHRob3VnaHRzIHRvIGhhbmRsZSBk
aXZpZGVfYnlfemVybyBmYXVsdCBmb3INClNIIHBsYXRmb3JtcyBvbiB0aGUgY29kZSBwYXRoIGFm
dGVyIGRvbmUgbGFiZWw/Pw0KDQpFZzogDQoxKSB1YXJ0X3VwZGF0ZV90aW1lb3V0KHBvcnQsIHRl
cm1pb3MtPmNfY2ZsYWcsIGJhdWQpOw0KMikgcy0+cnhfZnJhbWUgPSAoMTAwMDAgKiBiaXRzKSAv
IChiYXVkIC8gMTAwKTsNCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg==

