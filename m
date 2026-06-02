Return-Path: <linux-renesas-soc+bounces-33423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GHyMFBHGHmrbUwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 14:01:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DE462DCA6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 14:01:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=R6ayvFiy;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49316308A5FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 11:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CCC367B8A;
	Tue,  2 Jun 2026 11:55:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447983A1CD;
	Tue,  2 Jun 2026 11:55:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401321; cv=fail; b=tdz8+ObsxyQeIhxkyw25gfCDKoJTZnRTEV7Z3Xc8voRzgHGBcbevRANJqflUuIoxQhTpoIyLPF5YfGh4AyO6ZjTac86OyCzVwiHKYDqblJy5UA1Cvxw+KKGhDF55BbZ6vzfxzSgO/ZNHvbXW+vgCW18w+09wT3eMWbDD915b2y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401321; c=relaxed/simple;
	bh=1HvC5QJrrO6yYhAr7YV6I9UTfzMkUCBSa7g7X2ditwI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EfiOasqy/rd3nO0av3i55EEvhm4qsnyHm7Q04jpqCkg+Nidr0Witf/9SVRmY7l22epYL1RBmCfRUdCiz3d6CmszSSu0kx+wxobeoVLV2bi4zzZqePL8S75CqKILFjXR/NNTDillNXWpfLG9f3AqSe1gsmnN/UYQu9EZ8D7z7hC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R6ayvFiy; arc=fail smtp.client-ip=52.101.229.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PB3SMhhEOb3J8a4WsWHjEW60DiF9hyHQmbFgSvShWlH16gdgOXvWMAF9v0vy6xp8Hm5IptmWYjNGGcvRuBJYrUizO+kkBZO8QQQxrWBSSNj18lKVaTc5nww8zT0WDosd4cyH7lqk5jDOnfIRAAwJigE2S2Yr0IBl06mCygXZRVDHmkAEwP7TtMV+d5KRSZFiifMlW0/+ncrcIbx8+b7X6GpP6+zo1xGL3VfwVputrF75us4TRu9cdYbhCttJ+njOOKYjcw8zkK0Zkb3sIsqvq648WxJI7PijMyTlygrJsSYpLaarOwPjQ3kdJxaB02bxpE7Y5EUTyR/sVIdHiNg9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HvC5QJrrO6yYhAr7YV6I9UTfzMkUCBSa7g7X2ditwI=;
 b=C1A1GcL7ZJVUbtl2mc69JHVJKL44amflTrETVchsIAF2NqnTpa9YEQWqZ3H2vmiagjkAKjXIFG9lr5OkVTyMtCpmqwTtKLkDvziojk4csNop37JB28lMq387HoSZGwMm9lzF8O8jmtMa5THp6Wqf6fX2lVBF44NDflHo7BxF2h4vjXobl3SU0PMVWEOI/YV1VpzgcfP3ZYJx2qrAkSj/7ski/TKoJ5UDvHGjZyPU6VB/D5nKDPmKouErUhG6KkE5GGFv//zsFrZijrllwA3ZRSgyIFEJ9bqbwMOfjjqmc6eJ7i5mNQD2bzdzzOhTgs0COrL3MJ8U9hEd+tANIEe+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HvC5QJrrO6yYhAr7YV6I9UTfzMkUCBSa7g7X2ditwI=;
 b=R6ayvFiyQq819hi10TJ4MkYoqDWpNgv29bznM0PUrjgrsuOwYJaosG/U7L8PVCpZ+DYrRIjUuUMoqHGiAAkXvsgN1jIaC9fQBAwR4S9J9InOG+RrZGgpWTkkQuHuaMLJhgSl+FuoiLEeaZ/EZibvr1sC/jjWL0kvvE6n6Xg9h6o=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15621.jpnprd01.prod.outlook.com (2603:1096:604:3bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 11:55:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 11:55:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 0/2] Enable RSPI support on RZ/G3L SMARC EVK
Thread-Topic: [PATCH 0/2] Enable RSPI support on RZ/G3L SMARC EVK
Thread-Index: AQHc54Fx80PElU5BYUqMiFfoYcohALYrMOiAgAALSBA=
Date: Tue, 2 Jun 2026 11:55:16 +0000
Message-ID:
 <TY3PR01MB11346B016AA3E50961867AB7786122@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUYxOu5fpyGMRACsBQtAMwJrxt9nPiEN-9UhPVY1h3vwQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUYxOu5fpyGMRACsBQtAMwJrxt9nPiEN-9UhPVY1h3vwQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15621:EE_
x-ms-office365-filtering-correlation-id: c26aadb1-841b-44b4-b77c-08dec09dd04a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099006|11063799006|3023799007|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 xfDYPl5nczzp6nLJ2HUaAVx9L4q80Pnnad9+lC7yZFjF+MV0t/nz250QNnVkpdYqGla/0UqXyZcrCPzEkoWs2Wm1Wh3f2bE3knWbHKQgNXZhDPEe/h3CViGbqK7ddQFWxeDvYW0YJUlaX6eH9Mom0tGnfRfi14MUWAsNLBMvVICBifgY2rzifQ3TO7evAq0NuSdS1OivX2Y9rj1XJwXRfUdYJst1i8yUdJ8KRWuX3mECsdUYKOn3Cqeu07hPzQuKQcXseaZ4REgA+VL3Ml+el6AnFqHldPZBIDuK3NK3EBbmCWH61hXECimm2fCMmBXC0Quugm9UOjmyb9SI84VLDJxfdxRWcdDrJ3YcyqKS9klBwh5fyi8PEosKJ/dUE6qJGh4Vclrz8NquvwkC8uoyglQv6Eg0tcj24g4V735EIhNbMoVmsBt/TdIQyP0hFTaEC7B5vvmfaQ0YLgV4XBN2KkMyn9WYqBgPGFjUPJhrGGqJ/BVnVzCbdf/TCOxHB3yeGPdEBHiovaGPq7+/9g4IhFW2YX8oX1QsDWsCfmMhI3hZ9MdsJ/vS4grPjhj5NwdgeHGlTo/QPmP+ibfelDLxMpA1J2rozDdlAm0dLnzUAGqXqpL6clCHNaQmIugOoFsoLcw828JfcjUZaKYro97RdpCfbueR4qByxU4od3Rs3Vy1PxpsfyOQJXyZOUfkXNnUCq2vWhgS/e2Jv1/+IJfUSxmq0NA69uBwsOdoDuz9DpOR76loVsflSq85MqtS9brY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(3023799007)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFZXWDQvRkd3aXhib2U2eEJ4SDc1YXdvbUNFbjh3cWlqbStLU2pES1paZFdr?=
 =?utf-8?B?MGt2dHJuK20xalNyclVpOHlCL1ZXU2ZRQ252ZDFzaFV1QkVaRVVsV1dQbnUx?=
 =?utf-8?B?cjFWOFUrTWNtODZWOWFWZFNBeWVpM29SU2R5VVlRd0tiWDc2MGQ4U095TFFT?=
 =?utf-8?B?aWhtM1NtWTVtemQvVmh5Mk5VU1N4Zm1BMFk4Q0RpbEc5U2had3BBa0l5c0tH?=
 =?utf-8?B?endsWVI4L2hpUUZTS2svVGs5M1pOZlpsQlk0S3JicXpwWTBjYWVJM0hER0Zq?=
 =?utf-8?B?VWFQOUhBb0Z0blhqNFlVNTB6MUJxNDIxdzE5R29yRGdLa3gyR1NWS2QyR0RV?=
 =?utf-8?B?NjlxaEZwUzhtTk1LZ3lxWE5sNHIvRDdSSkRHSjlQM3lqT0tncWcyakdrRThj?=
 =?utf-8?B?dm9wUmtaLy83MFJaQnRJRTNFL2RhS0FCQjMrNDVZblJNOVRsYngzVmxpaHQ2?=
 =?utf-8?B?eDU4VXVjNnZoTnowYXJOOWV6S2luS1hWdXo1cDF6eVJ4UlYza25VSEs4Y05H?=
 =?utf-8?B?OHdubUxZYi8raUc5Y0VDY2Q4SEhDeDFzY2luMnNjcGZjYTlBQWIzcnhBbkdC?=
 =?utf-8?B?QzZ1UWpjVWcwWEFhZ01ReFVJSkpkbTRNbGhMUzZ1MDA5bExqSkVuNWoyZ1hm?=
 =?utf-8?B?cjhIZzhYTGFWdm1OUkdlc1ZSMHdyK2xCdTc4MFpFcjZFREIzRFFIQ0NsRGxH?=
 =?utf-8?B?NXc0YmpWSnhsQU1hZ3UxOU9sS2wreHgvL0NFMkIzV1NNa2hoUGhOZUVGR3Vh?=
 =?utf-8?B?ZU5rUzlhYTFZQWlMWGM5cDRqVGt3SEhkVzJubmpwWlVIQ3EzS0hEWmE5cEpO?=
 =?utf-8?B?NStaQis5SEdmeGhGMlpWWUJnRllOQko1Yk9SVzFrYnJHODgrcUlQckZNOEEz?=
 =?utf-8?B?b1BOYXFRQUVkVlhhZnE5REpoRFU5K2JBTVp3OXp1R1JzeVlXVWFLckpkSEdn?=
 =?utf-8?B?QUlYNEpoQ3U1MWlOeUJPblZmaE8xc0JCTFRpSHU4b0R0cnFxbERRNStsazZN?=
 =?utf-8?B?VGRab25oS0tXL2Q4dUQ2eUsrVW1KakVVc05Hdkh2cVhndm5iUTJXaEVzdVpv?=
 =?utf-8?B?NC9qSWlNb2JpYTBVdlhHMmt2STVab0Y0YkdKUCtYc0RSWkRWRm1MQWdoY0Vm?=
 =?utf-8?B?YUZBUUF5b2xOL3lNcEk3UGhIUytVNVVhSkl2TGkrbTYwL0xNbytGTWtVK2J4?=
 =?utf-8?B?Sll0TW9XQnh1QWFHMkRkeTgxeFFrYmIwbVkyL1I3dDU3MnhRTkU0cmN3WWYx?=
 =?utf-8?B?bnVrbWpCbGJzQVV3OU1RU29hRUlKK3NqaG9Zb2d0a0FvMnVpRkhTQk5DRnZa?=
 =?utf-8?B?ZUxuUjNLTnJYUFQrSUUrMk1BeFJFYnlLV2RMZ3BrMlVLaklVWFlydHpZV01Q?=
 =?utf-8?B?NEc5VHYyWWdVLy9BVHVTb2hJY1VKUVZWemtOc2phUVBDTXhjWGtBSS93a1pk?=
 =?utf-8?B?dnUydTVHY0laZ05MZlBMTityY0svZlczYTRJSjFKZVpMbEVrVTl3dDl2bGx4?=
 =?utf-8?B?VVRVNnJOS2ljOVpkbmlWc3hTdlA5MFlwblFVUkdKelFIV09KM2hraWRPVVVE?=
 =?utf-8?B?RW95RzVTM1BuSFNob0VLajNud04yT0hSMjRKbFp2U1Vad01TVlRlYndQUTYx?=
 =?utf-8?B?N1pHWTRsQkpud1c4ZitHN1NpTkppaGhjc2tYWmszVnc3RmxMaHhSRk1iVURP?=
 =?utf-8?B?VXFpcThCRWtKNVk2NG1wanpvUDNHMTh5UCtIdlgzbkhodnNIZGhOSWFQVnN1?=
 =?utf-8?B?a25Ka3QwQzJUb3NPdHJEczVrbm91SzY4b0ozNDdVemMxamdBTFpkM0gwOE8x?=
 =?utf-8?B?UUs3RUpycmtpcUdwa3EzR1pMV2tUbGRNcHdBaVUzZHZBRkxlTlpJSTVXblBO?=
 =?utf-8?B?UVp1ZWJkSVlNbnk0TmJ5cmNCK0VhWktDQnJqMERHd3Zvd0lYbDB4QjlGbFRC?=
 =?utf-8?B?byt4N1p3QThPZnB5WmIwWVdVenZZNHdBOUdZdE1CNEZLNlUwbDdaWGlGU0Qz?=
 =?utf-8?B?VmllRnRoQ0F1TUpqU0JDcXBDUHRZeUF6ODVneFNnUDlockhrbzI1SmVFWVJi?=
 =?utf-8?B?SWhLVHBISGlBQVZWQTNoODJxek8wNUhqSFY5Zm4yRTQyUlpwU0xqMmo0a2g0?=
 =?utf-8?B?dkRGa3dUS1daZjNmQjI1NU9iSk9pMEpTdm5OcHZYSkk4dFdIbmJ0bnYzcmdN?=
 =?utf-8?B?Q3BUNWZ5YjFydHh1TWczQkhpaDgwbFBBc1JlZ1JIMk53ejJ3UUNSOGh1M2Jr?=
 =?utf-8?B?VFJkdm9lUDhLMTZvNEw5UXBHVDRXbWlCRHFjOXZ4YjMzNEFlYWEzbGdPUUQ3?=
 =?utf-8?B?a3BxWExURVpQeWxmL0R1cEdzZXVMa2F3NE1BL2lMR1FkdVlUZUtDQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c26aadb1-841b-44b4-b77c-08dec09dd04a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 11:55:16.8254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xoi8QyKm3Hz31PeWsZz/fdYM3FxmHGJGbfYISRdWxGJSaeM1LsCMioTAcA3gc6TZgkzWCHEbetf/2q0bQg9eFs1/eAp+kVNLEQk7KuouNLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15621
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33423-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:biju.das.au@gmail.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8DE462DCA6

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDIgSnVuZSAyMDI2
IDEyOjA3DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC8yXSBFbmFibGUgUlNQSSBzdXBwb3J0IG9u
IFJaL0czTCBTTUFSQyBFVksNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDE5IE1heSAy
MDI2IGF0IDEzOjIwLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IFRo
ZXJlIGlzIGFuIGludGVybmFsIGRpc2N1c3Npb24gYWJvdXQgZHJvcHBpbmcgcGF0Y2gjMiwgYXMg
UlNQSSBpcw0KPiA+IHVzZWxlc3Mgd2l0aG91dCBhIGRldmljZSBjb25uZWN0ZWQgdG8gdGhhdCBp
bnRlcmZhY2UuIEhvd2V2ZXIsIGFzIHBlcg0KPiA+IHRoZSBzY2hlbWF0aWMsIFJTUEkgc2lnbmFs
cyBhcmUgd2lyZWQgdXAgdG8gdGhlIFBNT0QgY29ubmVjdG9yLg0KPiA+IEN1cnJlbnRseSwgaXQg
aXMgZW5hYmxlZCBvbiBSWi9HMkwgYW5kIFJaL0czRS4gUGxlYXNlIHNoYXJlIHlvdXIgdGhvdWdo
dHMgb24gdGhpcy4NCj4gDQo+IFNvcnJ5LCBJIGhhZCBtaXNzZWQgdGhpcyBxdWVzdGlvbiBiZWZv
cmUuDQo+IFJaL0czRSBTTUFSQyBFVksgKHdoaWNoIHNoYXJlcyB0aGUgc2FtZSBjYXJyaWVyIGJv
YXJkKSBoYXMgaXQgZW5hYmxlZCwgdG9vLCBhcyB0aGUgY29ubmVjdG9yIGlzDQo+IGxhYmVsbGVk
ICJUeXBlLTJBIiwgaS5lLiBtZWFudCBmb3IgZXhwYW5kZWQgU1BJLiAgT2J2aW91c2x5IGl0IHJl
YWxseSBkZXBlbmRzIG9uIHRoZSB1c2UgY2FzZTogb25lDQo+IG1pZ2h0IHdhbnQgdG8gdXNlIHRo
ZSBwaW5zIGFzIEdQSU9zPyAgV2UgY2FuIHJldmlzaXQgdGhpcyB3aGVuIHdlIGdldCByZWFsIGNv
bm5lY3RvciBzdXBwb3J0Lg0KDQpPSywgdGhhdCBtYWtlcyBzZW5zZS4NCg0KQ2hlZXJzLA0KQmlq
dQ0KDQo+IA0KPiA+IEJpanUgRGFzICgyKToNCj4gPiAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5
YTA4ZzA0NjogQWRkIFJTUEl7MC4uMn0gbm9kZXMNCj4gPiAgIGFybTY0OiBkdHM6IHJlbmVzYXM6
IHI5YTA4ZzA0Nmw0OC1zbWFyYzogRW5hYmxlIFJTUEkyDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9
cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0IHdoZW4gSSdtIHRh
bGtpbmcgdG8NCj4gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51
cyBUb3J2YWxkcw0K

