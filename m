Return-Path: <linux-renesas-soc+bounces-30961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPA8IlkH1mnbAQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 09:44:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4BB3B87C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 09:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AE69304EB93
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 07:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0F2389108;
	Wed,  8 Apr 2026 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mdRCwieJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16855387571;
	Wed,  8 Apr 2026 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634035; cv=fail; b=Nxu/BBSjngb3B4BS4+C9j8nVYXCnFoqbEPPzsezpypi0iIJq1Q4CJZzggohTwTAr8b5oUhy4hs9OF3k8du+IAjZDmKfR+SaYwO+feCX2g2zauHx5y+qsJQ5AZNvqmeEvIxhdbjS36gPkMVw3PSlfmkBxIoPEAoU/XBLoHeEJqVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634035; c=relaxed/simple;
	bh=FW8Fo5dHTZgPELe9ThecD2y/gesiyQJqJil0r0nqmy4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RErJIkwUDiDRWgjirl68jD6+/CulCKVS840oOo2pQ6z5cLNxzqdA39Ra7Np4lVtiHws7wSmqHzTxCWC8VSV1Zfn82Yl8BwNDiIw8EKl37wvr29mzjdrORSQ2wgfWcLIB5jhHJawZHWNgdULtbhstAPp/c7sq9elFq6PmyRQlazY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mdRCwieJ; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXlNwt+/0lXReOXt2bXsTA4T1Y7nvmFSTgzlL4MIbnjmEUVIgMzzmi1OYpgs1JnD8cExe3S5pnr74W0hxKXiOXW0kejTuZ+TPQ8Lcnn5ymnAJEEZ7IgLgSbqQNvLsUtUp057iqbYPn3uSvZ+Y0gQffjMBKbuemrW4zeLvECrjUnyEkSd75La94jeu8RhHPA3rLHr2Hgi9Si2llzusjmRZUeaYV8AfXWFN2ToZv0TPFwgNxAbpSSOWLb/e+jwgU9+zA52F8/AV5vqAOarEL0LMzPl8r3snnoASWjHNJDrkQ61MKIlIJp+ANyS5IGvYLekjopcRJg4aUsUcgUVGxEWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW8Fo5dHTZgPELe9ThecD2y/gesiyQJqJil0r0nqmy4=;
 b=BXCLWxFS9RE2N835yAqVhSi0dnKkqJCx+QIfPvtgPwDKzJA2Yz+Sv4eg04nef7MSpgLBeci5642CxfBXk0YViK9rvrEadnCuKem5s1p61i8vTwFBG1rxuiWHDamnQVAf4CBDsKpkYc0+EnfXy57NqY5jRVTn/qKpU/8Nse4NGqYlZuqq2xw2trnfIA4NXgzuElHapHKp3V3psyvB+9gE1MdcKBdAKaba+TbkihA2iqCOJT7I7wPctzxISPKBfhKG2wNXyyGhX4F3YPiAjyhdAR1nBE5Cf9d6rLITslcvgrqs/zz1hugYg4JDlkJZJPAhHUL0qS6puyvzlkokj3K8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FW8Fo5dHTZgPELe9ThecD2y/gesiyQJqJil0r0nqmy4=;
 b=mdRCwieJtbykuihQcVIoFBtxXg/dgUCFyVBE0QYHfox566Lnq9oxvUaS+a9SIG00olwoJ3eBxyzeZLHYich1WY8dXvkTTbKdEEAnBYZQM4LNSraMW3yj2sKOUXMiz3Xj8EB5BhgxvrCgbVw5XCfK8lDwB9C2g5C649WLgzGIMZ4=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYYPR01MB7927.jpnprd01.prod.outlook.com (2603:1096:400:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 07:40:30 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 07:40:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Topic: [PATCH v3 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Index: AQHcxp7v8qYARVnV3EeD3BJRy3ZdfLXUxMyAgAADmTA=
Date: Wed, 8 Apr 2026 07:40:30 +0000
Message-ID:
 <TYCPR01MB113326DC31D3713E601A87E05865BA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260407145753.101840-1-biju.das.jz@bp.renesas.com>
 <20260407145753.101840-2-biju.das.jz@bp.renesas.com>
 <20260408-outgoing-provocative-quokka-8dc4a1@quoll>
In-Reply-To: <20260408-outgoing-provocative-quokka-8dc4a1@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYYPR01MB7927:EE_
x-ms-office365-filtering-correlation-id: 10aba01c-d0c3-4366-29f1-08de95421c1f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 0uzRKwTXQHxO7v7wSLXIUqXSVydHS+hjyc+/1jGzRG9PekmIdUWWIP+lv1J5beLPk6uSyyMDRy/MefpCaE8IfVGXbQo1BUubeDxa1rdSlkVV7qu/82xl84FnYaG9lPdMNrwkA1dzmSVfrpyGSBS/gNHOK/0u3P9aekKSz+c4+afkJcOGVEimjmRUExke3k1vqILvvXitlNyr2yWLcoySXegQAegW1HOcOtdKjGGTM6wBCcxmsJx8YfA8yZ/G/GqxNcxwVtL/1aLczEaWb707lsahbwTf2i1jGA/fjNXZljpFnoTsmfYOQMTiKdvZRIHLeFnFmUGdrRAPfKewPI57sAoZ5SRB0pmC/6cCQH7vrkXjOd+07HnI+XnK+WFSAFrdt4Jqw1IaremkYUGQ+fHHEE5kltqUlH4gTDdcYsiJY3w0g2okJxcw4Fu5fBrHkmb2NX/0Fb9J1h6HKV2vKtCrWnVgJmjWbFrxPwVsRTIC+jm4WZCHs+5ebuvzNi5/trbwNXzIGuLAfi84HQsLV4euHVY3rggfrOehSShtzn06R2WirV0uX2PW8f0XNGDQZbN/cgo3L3xFcs98yYPQivVvBV46DBJwFaRTiom87RjC4xv9kQihUwoMP3FYcv5C1601TWZqwqdB/HU7BLzfzuvzNa9FeAWEfNCasAzh/BChotIby4a6Kz/3N6XZDCq0PDVv35W/5AW076yj07OHqSTAzzkxEtDOlvJB43rxrjj/bOoEoOmXacHuL2oiT0f0JWpXUhEZoO+Cihx3cl0+JInIDcU5ivGs/BklKXA3XxHlrg8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OVNCTzJZKzU3NzNZVDZPcXpvSjdhWFk4VTN2OUdGQ25nK3RkMVpSMW03cDlM?=
 =?utf-8?B?Q3ArRVNrZ3pyNk1ad3FZSnF3NzNkZGEyb0duQzlMVnVGZXY4KzFJV2hsdlNH?=
 =?utf-8?B?UFl0MkIxZk02aE9xeEY2NDltWGFKek9yTExGWmx6RGtheG52WkpuWG43ZjVk?=
 =?utf-8?B?ZnZWb2Zkd01NazdnUEV1bjRBNUMwV0FoOEVBNlZOa2o3QnVJZzdOckVHQkpO?=
 =?utf-8?B?ZUcrTXpOekk5anh4Q2NuNGJsVUNJb2U0aEFaRVlpMWFrWWxZcHJXRkEzTGx3?=
 =?utf-8?B?Ry90Sm5aWUNNNWlRZGlDWFVLbjMzenk5ODRtUGI2cEovamZpMmQyRjJBbGJV?=
 =?utf-8?B?Q0xWTlZtZElMcnMzOXVjUzQ1TmR1RkhZdGJBUHFXVHFBcVp4LzBHSWRiRmd1?=
 =?utf-8?B?ajBUSnppaFBZdVQzZm1haGRvMkczL3JOcHVPMmZDMnlnYnlROUF6NUNaMVBi?=
 =?utf-8?B?YkowdmdWRFpYM1ZMemp0QVk0cWJFTVhaSk5CRkdteDFQaDNsMTFJMUUySEt4?=
 =?utf-8?B?UTVLa3dTbC9XaDFuK1VLL3VBMmNHZ2ZiUFVJa1RuNHlrYXNuOUZwMnl2ZHlS?=
 =?utf-8?B?MjVhQm4rN21FMjQ2c3YrZUt1dXBGZFZkalVUY1o1K3FVREpxLzBOV0NDOERO?=
 =?utf-8?B?TEk1SDd4YmJCSzNEUkxGTHBOc1d4WTVSbG93SWRxYUZmcmpMRjdiMTNiT1Bj?=
 =?utf-8?B?NXpnT2dJZGI3ZmRWcXhjbmg3TkZGYnpYNEJEOWlqNXJIWko2QlN2N1RmZzhi?=
 =?utf-8?B?WW9YUTdNeWo3d0V3dnE2aitPNVFtTTZYMEtJY3k4Y0pYcDMxUVc1VGhNYm5E?=
 =?utf-8?B?QjU1dzNmSk1IWEtGRFVZQnNnMVZpMnpnbGhVTWNXay9iQUZlek9WOXRhaGJV?=
 =?utf-8?B?ZHJNZ2dlOFowOTkveXJnVjRralpqRi8xNUZDQ2RjKzhPdEhDTnQ0MlZ4UmIz?=
 =?utf-8?B?QkYrbUdzbE9pNWNOaWZxV0tqRzRYL1VEZ3QwSDRiOU0xNDVDdXhVSy9ZMTgy?=
 =?utf-8?B?dGhFbEcxWG0rSHJUMmFOcVpjbFU4LzdDcjNMMGlqaVpFSzJoWTZjVEdpcWxI?=
 =?utf-8?B?M3ZlWjczUjZUbGlTeVh3dVRqV3M5eWFtdUc3b1ZGQnRnZ2hhcXhybTR5OElY?=
 =?utf-8?B?NDMrVTRmSEorUGhocVM4WkNNaHg0dGZmL0VNc2YrMkJZdjNxaFh4aWFyNVlG?=
 =?utf-8?B?THMxUlBCVlhCem4vcHZkdXEvNXJYSkhVdDdZdndZN0w4M05XbVZ3ZDBhR3pK?=
 =?utf-8?B?eVZGV0ZCQXAxY0l4MjBkSHI2eGlBYmY4S3dySUpqK25lUC9IQWhMQUthejha?=
 =?utf-8?B?aGppRkZYaEViOS94NFh5L2VySUtSZUJUZmVjcHJ1SS9vR2pyUklVL2Y2U1g1?=
 =?utf-8?B?c3hBVTg0cnUvWGxwSkNBbVZyK0dyM1BnZXVramhaemUydkRROTR5ZHBjQmVF?=
 =?utf-8?B?QXg1VEpkaHF1d1pCTk5qeUc0aHZieDFDZnBkMW9oYjNKcjB0aytFejd5N0lJ?=
 =?utf-8?B?QUt4SnVHNmpCNk55ZENtR2ZMRjg5K3p3VXZqWlMxa0VyUFFLeTAzMGJqczNn?=
 =?utf-8?B?SWhuOW9Oby83dzFyUTk4UTdXZkExNjZxdC92WHUwRUtmQ0ZiZnpNTGJpVXMz?=
 =?utf-8?B?OENrMnlEekJXY295Z0JsNkx5V0xDS2lXRWNiRDlOZzg3cnNBR202YjlLTS9u?=
 =?utf-8?B?TFFXeDJkenIrU0VUbGtnTEFsbG5YNVFPU2U4Qk1KQ1krcDkwSzIrWUJoOWVv?=
 =?utf-8?B?djlPU3ZvY0FPak9HU3ordngxRVNsRTRUK0NiM2ZrYlNpOTloWG5URGY4eGpK?=
 =?utf-8?B?bGpoMDhjTzQ1eHc3eU5sdmV5STVnOTdHZTJSaExXSC9LUnZYRndEcGFUaXlj?=
 =?utf-8?B?RzMxNWhDdmVUZ09RTnh1OE1UNzA5bU5va2lNYTBkY2ZRdUdYYzBxSWtpUC82?=
 =?utf-8?B?bzFzQlRpRjVTdnUxQkpHbUpkUllyVHpDYy9CQkxQOWxJZnJTOEF1WXRGRU8w?=
 =?utf-8?B?SjNnWURJZmYzYTBkeGNPTlNVR1B1TlpwalhOS1FJZkx1Mjg2WjZZOE9pUjlB?=
 =?utf-8?B?TjRnZFFmZDZTb0MyS0pFaXFBeDJuclUrUkZveXRFeVdaZG11N3VrZWY2VXk1?=
 =?utf-8?B?NDlzenBqY2hON0FsMEpvTndsa3V5dGdEeVd5NUZQSW43SWV5Wk41WE1LeEpl?=
 =?utf-8?B?VEZJb3VUNlJvN3kwTlBlUHA0a2IzUC9yNFhMV0wrWVhCQjUxdzhIRURCb1Zq?=
 =?utf-8?B?RlcrV1lnNVBJQWhkQ2V2eTd3MTBEbUpET2JqNzVCMWFHYVpsR01Yb2t5ZDM0?=
 =?utf-8?B?UVpnVTRkaWNDSnJPbXdMbVRsS0o0bGtjMjRobENNdVlFakkyV3J6Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 10aba01c-d0c3-4366-29f1-08de95421c1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 07:40:30.4871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7W00M4X2NJhCzDNAYJVDYKq7KqpOf75SHnRWdRAMGWWYrLIY4x76Pd0Otfe1fA926BEFcdzhlODwRJGSo9RPaBpSqODqXuKCF90O4ZRbNqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7927
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-30961-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: EE4BB3B87C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAwOCBBcHJpbCAyMDI2IDA4OjI3DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjMgMS8yXSBkdC1iaW5kaW5nczogc3BpOiByZW5lc2FzLHJ6djJoLXJzcGk6
IERvY3VtZW50IFJaL0czTCBTb0MNCj4gDQo+IE9uIFR1ZSwgQXByIDA3LCAyMDI2IGF0IDAzOjU3
OjUwUE0gKzAxMDAsIEJpanUgd3JvdGU6DQo+ID4gICAgICAgIC0gaXRlbXM6DQo+ID4gQEAgLTkw
LDYgKzkxLDMzIEBAIHJlcXVpcmVkOg0KPiA+DQo+ID4gIGFsbE9mOg0KPiA+ICAgIC0gJHJlZjog
c3BpLWNvbnRyb2xsZXIueWFtbCMNCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVz
Og0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoNCj4g
PiArICAgICAgICAgICAgZW51bToNCj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDhn
MDQ2LXJzcGkNCj4gPiArICAgIHRoZW46DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAg
ICAgICAgY2xvY2tzOg0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDINCj4gPiArDQo+ID4gKyAg
ICAgICAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICAgICAgICBpdGVtczoNCj4gPiArICAgICAgICAg
ICAgLSBjb25zdDogcGNsaw0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiB0Y2xrDQo+IA0KPiBC
bGFuayBsaW5lIGhlcmUsIGJ1dCBubyBuZWVkIHRvIHJlc2VuZCBqdXN0IGZvciB0aGF0Lg0KDQpP
Sywgd2lsbCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkJpanUNCg0KPiAN
Cj4gPiArICAgICAgICBkbWFzOg0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDINCj4gDQo+IFJl
dmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5x
dWFsY29tbS5jb20+DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=

