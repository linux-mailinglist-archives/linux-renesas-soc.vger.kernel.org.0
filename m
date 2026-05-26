Return-Path: <linux-renesas-soc+bounces-33170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKwEEZuOFWrUWQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 14:14:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AD15D55EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 14:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4672B300D4FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 12:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452E53F5BF1;
	Tue, 26 May 2026 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ADIgraS5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44E3A963B;
	Tue, 26 May 2026 12:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797657; cv=fail; b=cjIwwtPDnucX1UN5AQR5X6RCeV5zHoMd4bkZ+qXGLgVAZ2sQxOQgsjH45OrbIBGqakgsICFBH286i/WlxTBJ0dAmTV3W6joQimbTPj5oDzrnTFxZ1gALmhPSzGlualtpD5e4tbtr7eFHNZD1DDcd0FUNmBAifI4bsYfs8PlZdIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797657; c=relaxed/simple;
	bh=h0UeDejlYlfi05NXFilsLpLdlh5BPMWjJhLSjaHUvmU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ag+jx3N2ChzOr8+MYhIqlfFQhXstHlieW9Vt9fGAbpMGz58nl0VvaCj4MEhs1aCNoxLf4E8fGpr6jcSX8l6fbheRzO+DrodNiXo+pl76wDrWZ14Drr2hr0i8y6+jcb1fa+TEOEABadLj7vhooLHx+yVBYARGHWfYap7TRzOaDK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ADIgraS5; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEArw7qY5Rl+osECxevs+vi+AY73DGORY7aD17AeXnN3U/0Tg7hOctzvKefNpvwwUDe6ruzlc/4Ga0rxMenWMYZ/DVfLkKz/77a7NKiPFhRCykfprV06FOqpVQcSt131ComoVKsY/XlWQE7T50eQsVT9S61AGzpoCwhrzM105cy9czpghU/Tgw8S5ZRNiCvG8Ho8d/ckKBaLuDnInBwW6vEn2h1j0qUrSbqvvgkKzxHMExOBiDu/R3mcnnK36HZFzGDMnFYLyOfvfJ9oRhkg6xfg0gH/+AHLDliQXRCsQ6trL0w6rHHq74YKu2Cu4mSeBciV4CPdM7Yai7OCJqnGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0UeDejlYlfi05NXFilsLpLdlh5BPMWjJhLSjaHUvmU=;
 b=m6Gba6dyIQOvr4llTjQu5rxWbin4Mm6TJEJrNXYojCLejTE7VoCuZ1pFUJ7sc4yLDMkJ4/HB1TRzmHdJgOFhOmDkYw4HkYAPlri+Vi0E34Z6hDOYvCdNYAKaGe9KOAGeFTkzXzPjlBvY+NAepVvYVV6UKlB0XdjtlIszEAsvNterPM2/TYPdIVgyhc12zIm+N7n6bxBu5AeBMQS8Jb6IVfVY5K4GauYHcPkbDGXVXN0/SGcGPWHHawplW7h23OZ1TXVeN+o6yFNdeDd4+/Cfj8FBFHmznMQpszkJh41fjtkfbyxAQkyMfZGokOJgyvJkWG9kYCjl1lLIPFMXQHWSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0UeDejlYlfi05NXFilsLpLdlh5BPMWjJhLSjaHUvmU=;
 b=ADIgraS5Hz3PsJmtho1ED4kX93Vj7u20FRAR7EgEftYIoPtK2pTUgVfQ/1FuF/zIQ5uWhy31UgbFfOfM6a3H5LMZWBhNwiwV400jzXnFZrlRJKs1xNBGPF+vnjKXfRjgHNq6v3F9BFiuQenGRvLgZ+G5LOKHeCNRT79MrP7oJvw=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYRPR01MB13279.jpnprd01.prod.outlook.com (2603:1096:405:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 12:14:10 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:14:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Danilo Krummrich <dakr@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] Revert "driver core: Use mod_delayed_work to prevent lost
 deferred probe work"
Thread-Topic: [PATCH] Revert "driver core: Use mod_delayed_work to prevent
 lost deferred probe work"
Thread-Index: AQHc7QekGTh0BasDZkutedNdylYYt7YgNwYAgAAAIeA=
Date: Tue, 26 May 2026 12:14:09 +0000
Message-ID:
 <TYCPR01MB11332849E0B017D12AA14085A860B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260526120306.184283-1-biju.das.jz@bp.renesas.com>
 <0e71f527-db39-4ad2-84d9-897464f74316@kernel.org>
In-Reply-To: <0e71f527-db39-4ad2-84d9-897464f74316@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYRPR01MB13279:EE_
x-ms-office365-filtering-correlation-id: deb8da77-9015-4ec4-c2e5-08debb204a9f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|38070700021|11063799006|4143699003;
x-microsoft-antispam-message-info:
 QRLjMN0g+Sn+B334XGfvKdnh79ZO3UmSgjb1egFK/uGxocMBtclqhET4tKvOsRX4B49NSoWnktQ3o+zgwAX/Cp+N6ih0KLCVfibUpYqcxE1VQe3HKP1gvgi61LwCiRsTahuNMaP5pg0bz3+Rjw8XWonjnlBYg4886+wFlnkkbyHSQcf6af5V3WngC4RSttWRTye7+Qia5Q353dJ7cVxFXflnh4+h1/AtotbkiLli4wPNDg+NJgBpfzK/HEChO/8cFnPLOW5kcfvQWhkLPP/GasBUs6zttS8J7y2MJMiBMQiCVPzss+iEZC3W2qs9XQwHiKO/wijkYUePTAKG083pK0ny6c4uQYzVI/Him6RZLcWdyymdByhbEzhOmv40ZTvux7NNJCxIawhqbKN5xKxFNxcGdMtBUmVjtaqQdwMXJLnvXy7C8QfvA9oh+iz3a48M2AWJA46KQuDkTQArOOCNFMYKbEOYbFZoFTl8g4mrOkKQSVfPbBE3LERW2X1WB0S/ictyraP1hgy1DPXYhD4zRkNPYxDb988H3thvCUIYBOGFcJdYGQVCIaDl2XZLSIXMpYDNZhvEvMqIzHJ5XgsWyzj5DoqgdiYDdR18kt2lkMzBBrRUjmn80UkoJB6cMqPQL0jRo2PMQomzjBAWGEkExLV0bR02cI9Qpaqt/6t1TRVaKsOuJ8wbvwbpHQK+3tRjNjO3Mv5po+pBc/Ouq/LHR4Vsnka/86e5EorV6q1Ji6+3OsxDwCN2XQ8EQaNrVlz9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(38070700021)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmRkUnBqcktKNk5hRXBBTFNtV1lGQ3pTcU9lM2ZZdk92L3E5UlhtQWxRTkdp?=
 =?utf-8?B?c2Y2ZWFZbkdTRDZ4cnpwMitFd1Rqa3dvM001aXp3dzRHN2Q4WmZKaDNidGo2?=
 =?utf-8?B?aFY4SU41aEcyWnFjRWhNYmdJZlRuU2RFMGQ0SDMwMStndmdBZDFJbkhYRGxz?=
 =?utf-8?B?dll4ZnZRaEZUaDJBSVpLdUc3RWRMdDcrSzFoYVhSUkMyMGZRekdmamZBd3lB?=
 =?utf-8?B?cklzcmFyQSt3MzBITjQvcStjWThJL0hmSzBPWFErUDdFb0Myck5UL1pHdHNi?=
 =?utf-8?B?NWVXYmgyeS9RdDZzK1k0R1lwMzRtTTA4aVJSbjN2UElKM2pSSXZtUlF6WUNn?=
 =?utf-8?B?bDVuR2pKVXd0cU0wWUpXWEF6MXg2Z0hyUzFCUjlnenVTbEFDOHhWcGpQSUtV?=
 =?utf-8?B?MjZUTmM5NHFwcGdNZzNRUExNVm5WU2ZxT1J2UmZTNVl3OW9wS3ExVUxGR05H?=
 =?utf-8?B?S3pRTlRWaXV6K1M2REpxd0tPNU84ZlBNRlMvQUxtQTJYRVYrejBFMGFmYUxa?=
 =?utf-8?B?ZUFSTkFnMHpqdnY3YjUrL2d6UVNDTnZrYjJvMzhNMnJmYlNXazBVWTVFZTRx?=
 =?utf-8?B?VXVtdkpTOW04ZlNXMVpaTlRHYzh2aHVqOHBGV080ZlozNjZNakdiQVV4S2ZZ?=
 =?utf-8?B?SzFwNkhNUzNYblU3cWVHU1pTMWZZdFJPTmFpYldjVzRpRTNSSDQ0T1RjMzBO?=
 =?utf-8?B?QXZIVURTaHJrdFZ3NnRnK2hSdkgwUzRKci8vS0FNMjIreHBlbVI4M25LdU9T?=
 =?utf-8?B?MDVxaWRvWmpXWGtxbHVtSlVUY3hab0xDa1JwTUE4d3RUdWlwMEsvN1lkQzdT?=
 =?utf-8?B?ZWZvWTRpNWJBeEFVOHZVcTM3ZkJMc2lXRVpPc2ZuaVB4ZWFVQm9xSnNaMFUx?=
 =?utf-8?B?TWNpYkdKcW9YdlJQVmhHZ2Q2TitzQ1dSdlpZblVVVldHcVJHdk5VZjJjcWNr?=
 =?utf-8?B?Wkx4bjVFL1VMK3RYcVh1VE9UZHlSL1ZlWHNqNUVKYWdBcFdGSWJxZklKWFNT?=
 =?utf-8?B?ajBxZSsxNklXWUJ2NnVKeXZLSE9EMHVIRFVHNFpqREpFekhXMS9LZ1cxOE5j?=
 =?utf-8?B?M2haUmVlMUQwQWloU1RzWS9GWUVNTTREdU53OXVTQ2UyaVNDOElGU1NNMjFB?=
 =?utf-8?B?eGdNUFRmcmdhQkFCRnZuNVlFMGMyNjVXTnltVkhkVkdxT2FZWWlaRUcyUHVM?=
 =?utf-8?B?LzFuMWZPamFQWmpXTjNLRXB6V2lmUG94SXJ4VzlnTkZZb1FmSkZVSzZqaW1Q?=
 =?utf-8?B?aU9zdStVamF6UWZKUUhXdUM4L21ZM0UycC9EQ1BWVGFEYjJRNE96eDI4eDRC?=
 =?utf-8?B?aXlQcWpyQlB3VkVrMnpQSGJ2U0Qvb0pDYjhSeDVKT2Vab2wrUmVsc05iMkJ1?=
 =?utf-8?B?SXBGRHJwZDdTOVQyQnExVTl4eUxoRzBTQlJuUTlwcWJFSmJ3dHpBc0Q0bTZx?=
 =?utf-8?B?djdYU1ZOdEFZbXIyaHpsT3MrUTBWLy9rcEFwWHVONjU0cUJKR1J1Q3J6aiti?=
 =?utf-8?B?anArajFzQUpaaExocWVER3o1MTdybXpDcEhJeWlPSWwvM1VkMEMvOVNWc2xr?=
 =?utf-8?B?SDNCRkIvUm9KRlFyRXFSd08wNUV0elJLaEJiK3JqemZwZGRUbVY2V0FLMlpG?=
 =?utf-8?B?UXdUdDRCNXhRYi9QbkYrNE51anVkd1JkTVlXV2FtNXpMSEVFWnZaSXkrcE1V?=
 =?utf-8?B?bnhEKzBIbk5pUk5ZNnhxOUZ0NmJaak5ITWVISjgwQitqL3FaR3hMZ2poeWYx?=
 =?utf-8?B?aXNOcDJhNnh5NklZY1dMYzZTeVB5RGRoeHZ5a1hrRHhhU1lmZ0N3TDhoZ3ZS?=
 =?utf-8?B?T3NOb1BtWXc0MEN2VUNlYjNzWUc3UFU4VVQ4WFNYWVlTT1lvNW5HS3NZaU5H?=
 =?utf-8?B?bXIyWmdlZi9CKzdNdjRwRzF0NTdWM05ZclVaV1pqMFF0cXdWR1NQQnlrUGVh?=
 =?utf-8?B?TFp4bFBoZUxUcHZ4aVltVktsakM3ei8xM1hTcTZnUkkrVVBuMFExbEoyeERP?=
 =?utf-8?B?ZEFEU2tPQ0FzTnl6Q0hra1JDbzhtNGFQdUlsQVU4TDNTclhXb3M5dkdsZUZP?=
 =?utf-8?B?Tkt4VlZaNnZ2VGJycXM3Y2JXakNBcm1IU2R4Qys3Nm1jb1dVakRBYmRDN0NJ?=
 =?utf-8?B?YVpwc2NxMmxCc1k3TGdvSjFxdFVwR2JwcEU1M3BxN0RwZWxra3VFcDQ1aG4z?=
 =?utf-8?B?U0hObENZSXZmVXlnOWxlL2UzYXNjL0FCekk1cUpLSm81RXlWcHFyZXlIVU44?=
 =?utf-8?B?RWhIUHdVUjh4eW0zNnVvMk1jeUVKNyt0MFFIb0FSdDg2L0JFQWwxVDQ4UlM0?=
 =?utf-8?B?TFBqTUR2TXlOT3V1bnpuZWdLcWFRWk9DcCt3TklycExSY3F3YXhNUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: deb8da77-9015-4ec4-c2e5-08debb204a9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 12:14:09.8033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BK9ORf03gl8FjqZYKWgE9n13m/+1P9v4+EH20OPKa1N9J3XiNv2qU8wleUIte/YtMi1oIW2rzIHq9ipiLYHldNRnLz1A0jc5+/JqB7nScWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13279
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33170-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_SPAM(0.00)[0.113];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: D1AD15D55EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgRGFuaWxvIEtydW1tcmljaCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI2IE1heSAy
MDI2IDEzOjEwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFJldmVydCAiZHJpdmVyIGNvcmU6IFVz
ZSBtb2RfZGVsYXllZF93b3JrIHRvIHByZXZlbnQgbG9zdCBkZWZlcnJlZCBwcm9iZSB3b3JrIg0K
PiANCj4gT24gNS8yNi8yNiAyOjAzIFBNLCBCaWp1IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IENvbW1pdCAxMTM3ODM4ODY1
YmYgKCJkcml2ZXIgY29yZTogVXNlIG1vZF9kZWxheWVkX3dvcmsgdG8gcHJldmVudA0KPiA+IGxv
c3QgZGVmZXJyZWQgcHJvYmUgd29yayIpIGludHJvZHVjZWQgYmVsb3cgcmVncmVzc2lvbiBvbiBS
ZW5lc2FzDQo+ID4gU01BUkMgUlovRzJMDQo+ID4gRVZLOg0KPiA+ICBjbGFzc19mb3JfZWFjaF9k
ZXZpY2UgY2FsbGVkIGZvciBjbGFzcyAnZGV2bGluaycgYmVmb3JlIGl0IHdhcw0KPiA+IHJlZ2lz
dGVyZWQNCj4gPiAgV0FSTklORzogZHJpdmVycy9iYXNlL2NsYXNzLmM6NDE1IGF0DQo+ID4gY2xh
c3NfZm9yX2VhY2hfZGV2aWNlKzB4MTJjLzB4MTNjLCBDUFUjMToga3dvcmtlci8xOjEvMjYNCj4g
PiBjbGFzc19mb3JfZWFjaF9kZXZpY2UrMHgxMmMvMHgxM2MgKFApDQo+ID4gIGZ3X2Rldmxpbmtf
cHJvYmluZ19kb25lKzB4NTgvMHhhMA0KPiA+ICBkZWZlcnJlZF9wcm9iZV90aW1lb3V0X3dvcmtf
ZnVuYysweDVjLzB4YjgNCj4gPiAgcHJvY2Vzc19vbmVfd29yaysweDE1MC8weDI5MA0KPiA+ICB3
b3JrZXJfdGhyZWFkKzB4MThjLzB4MzAwDQo+ID4gIGt0aHJlYWQrMHgxMTQvMHgxMjANCj4gPg0K
PiA+IFJldmVydGluZyB0aGUgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZS4NCj4gVGhlcmUncyBhbHJl
YWR5IFsxXSwgd2hpY2ggc2hvdWxkIGFsc28gZml4IHRoZSBpc3N1ZS4NCg0KT0sgdGhhbmtzIGZv
ciB0aGUgZml4LiBJIGFtIGRyb3BwaW5nIHRoaXMgcGF0Y2guDQoNCkkgaGF2ZSB0ZXN0ZWQgeW91
ciBmaXggYW5kIGl0IGxvb2tzIGdvb2Qgb24gUmVuZXNhcw0KUlovZzJMIFNNQVJDIEVWSyBwbGF0
Zm9ybS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBUaGFua3MsDQo+IERhbmlsbw0KPiANCj4g
WzFdDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaXZlci1jb3JlLzIwMjYwNTI1MDEyMzQw
LjM4NjA1ODEtMS1kYWtyQGtlcm5lbC5vcmcvdC8jdQ0K

