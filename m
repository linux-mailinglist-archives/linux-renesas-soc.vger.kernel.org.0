Return-Path: <linux-renesas-soc+bounces-4036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8786588BF93
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 11:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B83711C3E3AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 10:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF7A4EB37;
	Tue, 26 Mar 2024 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XRv+l10T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C294E1C6;
	Tue, 26 Mar 2024 10:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711449112; cv=fail; b=P8X0tYGmsaDaj8rUCHMI0pgMj765wNRHZnlIBbOMW4JUAqJJj1ZKd1k+hAATm5GBjVAQkImPkfDd+Pl8MuloLJzPLzgEuDR22LJaLRktMVC8kZdaiFmWO2CNQTwgAa15P/7i6uqNZHBBBLbo0UQnJcv00jvW3qsv7eqUZRA8Z6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711449112; c=relaxed/simple;
	bh=jK0Gh8fvta9HMjMP0UGxwvQdau0ZPbcCN7hOUEa/ffw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dzN18ypVpjsfk7encnT6U2xO+JdLu11/Hg5mQqKpEVwoTxu6fPa8x3Kyswxk85pcfMOq2NbgHrhXJxsZVjs6nB8tFBXyy+PTIGbVmCeGgOheX1PrfhFM1L7nGXJjA+SgGeL/5nRHkEj7OroDzJows003uRNyOtHVwGtYHS2LD5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XRv+l10T; arc=fail smtp.client-ip=40.107.114.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KI6ojnru300yIShlGlKE8Nn7B24G41wrNTpb7j8zxDQbWCAaCkj+AICkoEE05cMnIsceh3nqm4VIfgBg8oZIIo4Ca38chR9l04qTUe0iz95kSRBwHC0C09MkRwZi4rD/Ofg4FTmktlX6pDNiFZ3JLIOT0uHwkAhhxdd/ZvKXtqcQdYHe+HwRefgq2qj6i3n1jLKj7HssIwMSfAsXFcNsV6LClVWf/7SOicwV3H6kA8xQSNpxRRFC+14i61zIOTgFHlxl96Y5D4Eht/c/7qVh5X3WrWiRWynRwgWmaijt34iFbohiLEZOh8C6HQqJgGN9n2zQDeiz93dZCZ/LkRbUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jK0Gh8fvta9HMjMP0UGxwvQdau0ZPbcCN7hOUEa/ffw=;
 b=SAxvb22pg9s+/ZIqepWG2IqVhITZ7LvoYU+eqzjylBRWdwV2Btok9VBtrnoT/IRufYk71ggCVHjGhH/pkHtTghkUtHEvdtr2IciL8zUwHXHQMA/9/BQOwJfqVPpsFzHn3MRd9/SphwztTodEnXOygxTQcD6cCLA1uok1nZiNlqNpyFsSLAUoIIzMihibQIdHdodaM7YGTXD173nFoODuaiJLXFspCoudZam5sU86LR0VjAWwY+CdKnZKgv5IBDbPfslPlIIuxDcVwgJd7alx2MbB/E5fv9rYpkmLqaJCmPm1eb8W90ld70qGG+n4QiHqZlmjNPntgu7XYC2MnG2GIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK0Gh8fvta9HMjMP0UGxwvQdau0ZPbcCN7hOUEa/ffw=;
 b=XRv+l10Tb/yVxAcY4XX0yTrBYRwEqslDtI4mYoj0gsDM/4vZvXoCWIMQ8kwJwUMFHR6Hn4MsBGH0PHIN37b0RhWjF6b9w1Z/4tg5M7PDuCzsCu+vFaJctz6p0g1I87tYCBpVzt/1z78q212an0ZPvP8IqINSK2m/gU25zZhb2p4=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYCPR01MB8690.jpnprd01.prod.outlook.com (2603:1096:400:18b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 10:31:43 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::f9d2:106:9dc3:224f]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::f9d2:106:9dc3:224f%3]) with mapi id 15.20.7386.023; Tue, 26 Mar 2024
 10:31:43 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Paolo Abeni <pabeni@redhat.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: RE: [PATCH net] MAINTAINERS: split Renesas Ethernet drivers entry
Thread-Topic: [PATCH net] MAINTAINERS: split Renesas Ethernet drivers entry
Thread-Index: AQHafit/Moro+SRb9UafRVLllCbzirFJxkGAgAAOXfA=
Date: Tue, 26 Mar 2024 10:31:43 +0000
Message-ID:
 <TYCPR01MB1104047852E5031016C101553D8352@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <de0ccc1d-6fc0-583f-4f80-f70e6461d62d@omp.ru>
 <87e9ab7796a647e7ae674ae2301729f50e4e1b2f.camel@redhat.com>
In-Reply-To: <87e9ab7796a647e7ae674ae2301729f50e4e1b2f.camel@redhat.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYCPR01MB8690:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 twcwRKOCbsdxVcHTUkXDUrMq9kNJldYKaOFUhy/MAGZaKij4IpIQiKo887EKo3a5evnBIr9OeYR7PkQPwNMV/Vb9lxiSwA1idTghN4OYfujRrWYN0fePRJGarPJ1ZPaMs5UZ7H4w5yHKaxeaL3/OA7NYFypAnonrZMYwPFypxlFcL9pRX3P/abAJ5TW4w3STFsOMPFeVeb2z1pV8zy3SBgi9Ymj3AgWIHH/vb2V9p0iDZEimjPm1bIAIQ/SpQ5QVSaBgmrjWr9SVjpS5Sg7Jpsepsk23VYlGBb2C0mQZvSF/KGkGr99WlSMJkPAf4pfZTwnyNd0pRL1WT3zGD96OrxpQu2jHBwIQxsNn00P3DDuXYRmIdmSCncpF3Ns+Bj80Gu7Kz8PtURLeLa3p5J0WnV9vF+RoJBk1KcDuhkGyDtMa4UwFWTHsVKVJG7WcWk0J82of4NAjrTVyZ+N9I+pjuQCq+mqoP90iJUyKz+VdEjhls3mpMn2dq1XqhnjfopPysNhHRJlhB/wz2R9CLBYEtwgxvCE1x2HGOTx7X9xmERtNt3PE9MK4Vmu6HNTjjNAdOD4fO+6TSHXpAFBNm84vKbz7KOjIdTH2UuPCjOrmnTA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y1ZCNFRzTjMwMzA5b2llR3IzM3QwVDB3TlhOWHlueFRWQTFUQ3VJWkJBN2Uw?=
 =?utf-8?B?Z2RtVVFQamd0TFpFR0RDVVRqOUdJQmVzaGNlVXJYL3BCYmluQnJwQzUydW8y?=
 =?utf-8?B?ME5FdXNKc2VyZGN5VUYvOXVFQlhSRlhOdTExM2xaUDA1L3FCbjR1ZHBnYlNS?=
 =?utf-8?B?V2dFVUszaldBQVRKM3FlbnlPODg4UkpYQTcyUGkxY2VPeHRBUEVwT3hFekkv?=
 =?utf-8?B?bGt2dFJ4SUMybnpTVnkvZytxUkd2YXdDdk1PVk0rblR2M0hzNDRqZHlwZGM1?=
 =?utf-8?B?REdnVnNuOENhcW8vMG9xb0lPdE84TVFHTDVvcXpOQzFtcllqVWVoYnRoUHU4?=
 =?utf-8?B?K1YrRUJDVGt0ZzNKQlhaajc2NVBubHJYOURYTVFDZDIxWENxR2wxRTYvWGhF?=
 =?utf-8?B?d3ZZaWIrdDMvQ29yQTNNYkZCdklkSldCMCtIUGtVZmx6UHg0WWx3cDdxbVdX?=
 =?utf-8?B?bWQzOFJ2dXNBZTZRYXhIeUcxU0NEWDJHZGxZRWM0MkN4UzB6Y0FjeTZYbE5a?=
 =?utf-8?B?MmFqZTYrVWVrM21tRWd6NXk1RDdvRnhUT2xuc2RBclNreFcwVWZISkllbnQ2?=
 =?utf-8?B?Y1VYWUlhQjVsVU13UExUTzVRSHV5d1MzcHdTdU1ieFQrZG1xUkw3cjFRNFln?=
 =?utf-8?B?WU1GSTl5b2FIU2llWmdWVHNQVHdJWjRTbXcwVlA2aWt4cGNZSHlsZ3NCK0Zp?=
 =?utf-8?B?bHRjRTFUVGtpOHZQUldJV2gxR3hzQzFBVGRnK0IvQzdKa0tmQXlqSGYrczhN?=
 =?utf-8?B?VndSeWNITTRZMUxvWjRDWTZrejZsMS9JSDhBRit4eU85UTFETzVYaGRQa0w0?=
 =?utf-8?B?RWVNWHFrWDBsQXNicndUMnJEcEpadHg0RHFUeTNpUXdlN3l1L3JiSkxjMmt1?=
 =?utf-8?B?N09kTmtrWkdQcFk0enFpVnJnb3R5UDhZSEVWRTFweFM3dElhZHBaUXFzekZh?=
 =?utf-8?B?TDd3MElTaTQ3UUZrUUhJZHhvYVNNMHh5eDJacHdSZTZSR1ZCYnNuQWhEOFFV?=
 =?utf-8?B?TXdWVk9uRXpLZExXdE1BaHB6MnB0Nm93UXBTQlZJWVNLcHpUbUlzQWxMOU9o?=
 =?utf-8?B?SkZJSGVLSmRZSEtzRmRtTmtJb0dDbm5hS2ZOVlh3ekpmbHVwNUtOZjZTMjBV?=
 =?utf-8?B?RWd1aEhja3BQSS9hMDNaYXlaazFTcWlpQ0RjR2d4SWFhUkNxM05VMTU2dkht?=
 =?utf-8?B?WW1LWVVGUG1DM1dpckxreE1QdE53Y0ppdk44cG50dnBuZTM4UFB1OFl3LzFC?=
 =?utf-8?B?aTRuenVxWkprWDMvbVNmT3p3WFpzMWlWZE9ISVdmTGhPZ2RSMmVYV3h1VFFa?=
 =?utf-8?B?QkVPaVlSZVd1MFVWc3ozeWVoOGg2cWE0WHNIS1R1M3VGYWJoTXQ4TVNydUxB?=
 =?utf-8?B?YU9YcWM2ZVNSQzBxYjc5OE5UaEszRExWZitiNUsxNWlVcFFjT3p2RHA1cGd4?=
 =?utf-8?B?bmJTUmFLNWt6QkFDaUhnLzQ3UVQwWW11d3MreDNRVnlDZXpxQm80ZkdnWjV4?=
 =?utf-8?B?OWZOWWdsZmdkTTNSc3BLWGZxVXAwRDNTRHFhZldtL054UlVSMUVCUHdzaWk5?=
 =?utf-8?B?dFdyT2pkcUthZHJEYTJYcktIbkR6SmdLWHZ5VC9nbFQ3Mkt2WmVtVUkza20x?=
 =?utf-8?B?MTZlSmpBeW82ZjN0U2o5alVGTXk2aE1uZS9DZ1lHRXBNbDRWMDRkUGVsdVc4?=
 =?utf-8?B?aGlpMU9MVEpoejNWekx0cUVjQjJERllkOHdTRytvQVd2QkJrS0FmL3JOMlE2?=
 =?utf-8?B?cjQ2NDRoTFB4RGxTcURwRTJYRjg1cTZTR3B6dXpFWkZ4Q3FoWE1DY2xVM25s?=
 =?utf-8?B?Skd3UnhDUTVNeCtOd1JvTVUzamFMZUhEYUw0RE9QL09FUDNjSXVTd1VqZWtS?=
 =?utf-8?B?bml6Y0pGS0R0WWF5eENGUHFFaEF3TTBHYWtYUEU3blpSYlphZ05oSWlQZTRZ?=
 =?utf-8?B?azU1RE91T0NGeGNJVktCTllwc09kZUs5ZTd5VWIwMHVYWVB1QmRSNklIbTQv?=
 =?utf-8?B?V21rK0lsc3FNNzJpK01xcWNTV3ZzanFGMzhqN3pleHMxUGFJS2pscWYxNUhY?=
 =?utf-8?B?QW91WDJiOVdqSENXYVFzNitCK0NvNHRjMDU1WDFxdWFYUFpkaGo2RnRYb1Zz?=
 =?utf-8?B?RnU5RVNyM0JhWVJZU1UvWkg5WjJkb0lmQXR1V3l1RUlYWDNsSmgwV0pZZHFh?=
 =?utf-8?B?VXc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8860a8f1-03f8-4012-fc17-08dc4d7fee87
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 10:31:43.7317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAYdBsjDX2mINgOj5p2vLVpKwwxgVnDlskwvPkTr1KXjO1ALLL5SZ0kJmFFvtb3zkBpR0Wcp6g1Z+1zFki3clVed59CdbTfFJcSNr1cvtiJ7aPQlIXStn6IZOp2elFos
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8690

SGkgUGFvbG8sIFNlcmdleSwNCg0KPiBGcm9tOiBQYW9sbyBBYmVuaSwgU2VudDogVHVlc2RheSwg
TWFyY2ggMjYsIDIwMjQgNjozOCBQTQ0KPiANCj4gT24gU3VuLCAyMDI0LTAzLTI0IGF0IDIzOjQw
ICswMzAwLCBTZXJnZXkgU2h0eWx5b3Ygd3JvdGU6DQo+ID4gU2luY2UgdGhlIFJlbmVzYXMgRXRo
ZXJuZXQgU3dpdGNoIGRyaXZlciB3YXMgYWRkZWQgYnkgWW9zaGloaXJvIFNoaW1vZGEsDQo+ID4g
SSBzdGFydGVkIHJlY2VpdmluZyB0aGUgcGF0Y2hlcyB0byByZXZpZXcgZm9yIGl0IC0tIHdoaWNo
IEkgd2FzIHVuYWJsZSB0bw0KPiA+IGRvLCBhcyBJIGRvbid0IGtub3cgdGhpcyBoYXJkd2FyZSBh
bmQgZG9uJ3QgZXZlbiBoYXZlIHRoZSBtYW51YWxzIGZvciBpdC4NCj4gPiBGb3J0dW5hdGVseSwg
U2hpbW9kYS1zYW4gaGFzIHZvbHVudGVlcmVkIHRvIGJlIGEgcmV2aWV3ZXIgZm9yIHRoaXMgbmV3
DQo+ID4gZHJpdmVyLCB0aHVzIGxldCdzIG5vdyBzcGxpdCB0aGUgc2luZ2xlIGVudHJ5IGludG8g
MyBwZXItZHJpdmVyIGVudHJpZXMsDQo+ID4gZWFjaCB3aXRoIGl0cyBvd24gcmV2aWV3ZXIuLi4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBTaHR5bHlvdiA8cy5zaHR5bHlvdkBvbXAu
cnU+DQoNClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoIQ0KDQo+ID4gLS0tDQo+ID4gVGhlIHBhdGNo
IGlzIGFnYWluc3QgdGhlICdtYWluJyBicmFuY2ggb2YgdGhlIE5ldGRldiBHcm91cCdzICduZXQu
Z2l0JyByZXBvLi4uDQo+ID4NCj4gPiAgTUFJTlRBSU5FUlMgfCAgIDI5ICsrKysrKysrKysrKysr
KysrKysrKysrKystLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gSW5kZXg6IG5ldC9NQUlOVEFJTkVSUw0KPiA+ID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0NCj4gPiAtLS0gbmV0Lm9yaWcvTUFJTlRBSU5FUlMNCj4gPiArKysgbmV0L01BSU5UQUlO
RVJTDQo+ID4gQEAgLTE4NzI0LDEzICsxODcyNCwyNCBAQCBTOglTdXBwb3J0ZWQNCj4gPiAgRjoJ
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9yZW5lc2FzLGlpYy1lbWV2Mi55
YW1sDQo+ID4gIEY6CWRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZW1ldjIuYw0KPiA+DQo+ID4gLVJF
TkVTQVMgRVRIRVJORVQgRFJJVkVSUw0KPiA+ICtSRU5FU0FTIEVUSEVSTkVUIEFWQiBEUklWRVIN
Cj4gPiAgUjoJU2VyZ2V5IFNodHlseW92IDxzLnNodHlseW92QG9tcC5ydT4NCj4gPiAgTDoJbmV0
ZGV2QHZnZXIua2VybmVsLm9yZw0KPiA+ICBMOglsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5l
bC5vcmcNCj4gPiAtRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5l
c2FzLCoueWFtbA0KPiA+IC1GOglkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzLw0KPiA+IC1G
OglpbmNsdWRlL2xpbnV4L3NoX2V0aC5oDQo+ID4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxldGhlcmF2Yi55YW1sDQo+ID4gK0Y6CWRyaXZlcnMvbmV0
L2V0aGVybmV0L3JlbmVzYXMvS2NvbmZpZw0KPiA+ICtGOglkcml2ZXJzL25ldC9ldGhlcm5ldC9y
ZW5lc2FzL01ha2VmaWxlDQo+ID4gK0Y6CWRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2
YioNCj4gPiArDQo+ID4gK1JFTkVTQVMgRVRIRVJORVQgU1dJVENIIERSSVZFUg0KPiA+ICtSOglZ
b3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4g
K0w6CW5ldGRldkB2Z2VyLmtlcm5lbC5vcmcNCj4gPiArTDoJbGludXgtcmVuZXNhcy1zb2NAdmdl
ci5rZXJuZWwub3JnDQo+ID4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvcmVuZXNhcywqZXRoZXItc3dpdGNoLnlhbWwNCj4gPiArRjoJZHJpdmVycy9uZXQvZXRoZXJu
ZXQvcmVuZXNhcy9LY29uZmlnDQo+ID4gK0Y6CWRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMv
TWFrZWZpbGUNCj4gPiArRjoJZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yY2FyX2dlbjQq
DQo+ID4gK0Y6CWRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcnN3aXRjaCoNCj4gDQo+IEBT
aGltb2RhLXNhbiwgY291bGQgeW91IHBsZWFzZSBhY2sgdGhlIGFib3ZlPyBXZSBjYW4ndCBhcHBv
aW50IHlvdSB0bw0KPiBzb21ldGhpbmcgd2l0aG91dCB5b3VyIGNvbnNlbnQgOykNCg0KVGhhbmsg
eW91IGZvciB0aGlzIHBpbmcuIFRoaXMgcGF0Y2ggc2VlbXMgZ29vZCB0byBtZS4gU28sDQoNCkFj
a2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5j
b20+DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gVGhhbmtzIQ0KPiAN
Cj4gUGFvbG8NCg0K

