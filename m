Return-Path: <linux-renesas-soc+bounces-33227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BkeBroXF2px3wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:11:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565C5E7840
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8FCF3060CA1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C583EAC83;
	Wed, 27 May 2026 16:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="H90eB2cY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD23DFC78;
	Wed, 27 May 2026 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897829; cv=fail; b=EJ6JbOqxFdYsIz9Zr+nJ33c5R1MvyINCuM4fYCmuehQaOoDcu9A874X5+gGxuqH+W+hodJMWzrTsGpIBTPE5iHjOnATgMtu1Ywz8WwrA94GDEmErx8PuozWWdf8sj7K6UcgygcUj1Bf5Qx1tvN0BFoPAFHPR6cytrs4NNxK/RNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897829; c=relaxed/simple;
	bh=cWIOUefoiOepyKLvEC+sAXHTn7xm/Sgf6A6FiwNlCEc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C8klzaDfzVI1mRvfVzhNIXqBzWzfFCLYshUen316KzbMKhJxphvqRA+Nsybl/8zWeGdEgyQSiQ1rZiNuEw2QvENuKjD1GBwTlCdVI/fpmcUM57QZA+oMBOHvgTuWq7FmWKtR9x4KmL3idbQtJxgqmvWkJNyKvU5Y//qbt6l/B2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=H90eB2cY; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwM403vnzgXRhkfzZ2jSkKeZ5bwICmgZ7gBP4gnRq/RxtDHxKAixkkKGKUy9usD4pd+09QrZParOz5sq38LZvsXMrmFwvkq4ZTln5S7Lv3oSaHGfN4Q25bwUkjKDDggzhHALpaDbXQDkxLsWXZYisG7MHJXo9VztOLeSXMvZu1LqpFZ+MNksggHcEIEOn80Bwe7IMPcOVKZyHEbtKRSm+YmJRhRi/QbqXmQW/Xr9LQYUF3trkAtRPeOoPqT4Vdo1mwH0yvDaC3XemvdKLEmUuFBMpUYymKBCgd8NRUFQawn+CDl52slFwffAcDrrYm1HPXH/aS5bn7Ip39rnr5nN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWIOUefoiOepyKLvEC+sAXHTn7xm/Sgf6A6FiwNlCEc=;
 b=Fc/MNSdvjSKyZm6vviW7LJmXfbdk8L1n78zMSf8NdNlYEPgE4zd2iDiItRFxUVM2xddBATQZ+J8TELkXpL/7fwMYkFCYBwfEObYvng22v0RYtOTjQUa8dbMp3ugSAjl7pz206j87KTdZF0GaCCnNJ/EW3y1oT4HtDPvN8/vOFMS5EPmCbFTz/KkxRQsyn0LoAMIDGqIdlWvbDliXbqjk3C2AogQcQxQ12DmGk84I5Jn45P66dy244lwLjrbArr7+E6qPfmwU5+/PgUQwDr/TG48mQmcRvLWozHBsTXfdPQwUI3lbcJplWy6dGoD04DwnRwlihd7WlBdt4+MgZPgOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWIOUefoiOepyKLvEC+sAXHTn7xm/Sgf6A6FiwNlCEc=;
 b=H90eB2cYfyx5ahzz8v8M3UiktLNgwKCewF4bo4kxFZ9KAxWsN6feBWDbN2s2bykjXo7GZISTJLAHOv2lWkFIJw44xrHtV/Vl02qCXJ160rojLSCakIW9CWfVbecKAQeOD6zH98o2r6cZLYIRCVYNJElqv+NxUbv9vetunWmh1Ek=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8471.jpnprd01.prod.outlook.com (2603:1096:400:15d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Wed, 27 May
 2026 16:03:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 16:03:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/4] arm64: dts: renesas: r9a08g046: Add scif{1..5} device
 nodes
Thread-Topic: [PATCH 1/4] arm64: dts: renesas: r9a08g046: Add scif{1..5}
 device nodes
Thread-Index: AQHc3F0bZpooccbmgk+2oil5b7LirrYiGWuAgAASPGA=
Date: Wed, 27 May 2026 16:03:44 +0000
Message-ID:
 <TY3PR01MB113463838FC120A929F4144C686082@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
 <20260505070206.7932-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUMroQsJpmuA2zD75t88PJkEyc0w1azKjVaK-PsCkiapw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUMroQsJpmuA2zD75t88PJkEyc0w1azKjVaK-PsCkiapw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8471:EE_
x-ms-office365-filtering-correlation-id: c78cd6f5-c54e-4fa3-a881-08debc09878c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|38070700021|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 v29xXtgbFf61sjPnKC+rbWttWE/I5JGRvwavseGkHzvq0+6TgGgDk3EpNwGfBGIhYhnw/t9bF8Iom44EXvOLzbL5iNeUSZqnuRJqFei2AN9nh7tuRz7N/x4Puj4sj8b2q148/7Nj7HYkpZh3BzyLCD0xMfDa4Afd1qAJQZYSk7uwrXaWrC5PE0N88vpO7my1tJhNksMLlHc9SreVO8hqgzxWYFDUJdUfs/mYA84q97RYQz6dxZbgypJLJg/6RjnxzhG8BzR91jAx69CFWdniVAz/w426YXghTPYRwvYlXGm+l+WMbT8+Q6Er4ftQylWWcF5qOfFO6HNw6apI0rbhsv4dSuePSz+SSztAV4ECAQDH96Qrs6CXT1wc7JN1Ml+ZScL7PK/cHQ8wuLqPeTGw6wLTuC02Br9JIAdL6gjpruXkXgjWBwRwBRd6jMfegf7B79NThBSyhO5SogClpTtcvy10ue1e2d/ma0645HYeKEK0+7Q9WAcIGl6n6Gw36+zAKr2PoR++0EB3+625NEJJ+FPLLABfe82MKKDalTg7d4rfGb9uk3WvV9+ZdC0uAoZTwOlsoQklBh2g3mblNgmj06RmlZyOPWNopdSbhPS9mgPmYpF+UPKaGXEaqo1bXsXl17orTOQeqHDv6ld499zyIaalPDGOmBjw+htbAQFZIFynNFmNdLAV5RQJJ9Sgk8QeFD0j0ZxV2FrLSlIZw+g71xu1QbKRmu71BUW+GmYEuiHzkuXbbpERBwYYk45SWjap
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RS9wT3gxMmpab2Z5UE01SXkrRlErSHhQbVFMTFB3NlZremc0eUFndlFFN2E3?=
 =?utf-8?B?RWJHVkcrQ2RlekNlMlZoU2JOWnYwNmJ1b0ZONDMxYlJhbjRFSkZtQ2RTamdj?=
 =?utf-8?B?dTlXT21xR0c3OU8xbFFDT1RIQTlQVVRUTkNMTHdRM3Vkb0pCV3Y3L3M1QkFj?=
 =?utf-8?B?UllxTXRNSlFCSHJhSkVTaUdTZTcxenpwRVgrVHA2dFVmWTAvRFJlcFJVSjRM?=
 =?utf-8?B?enFzbXNLUnBrakVMSnQ3bHVta0ZBa0VmV1h3S2dUSkY3dGdZd2VGeG4vZ0Ex?=
 =?utf-8?B?OVNpNUVkZ2FidC92azR4VForVlFsZFVMWDhxcXp4emwxNjFheHFuZ0ZHa0lp?=
 =?utf-8?B?VkpWc0FpOVZkMWhlcnV1MWRYcWVxYjhkM1B5a2pwc1hnV0hJSnZjdmlqRjV2?=
 =?utf-8?B?VzdVTDMyTjZ0Sm5Ya0dCVXY0WHFYaElEbGtSWlZobWQzNlB6dDYwU01XRit3?=
 =?utf-8?B?dTdJTXkwTWVya3N4bnBsRHdYVk1CL1pCUzdmVTNWQkU5dnBsTUJoNlE0aGVS?=
 =?utf-8?B?VTBHR1UxdVluMGJUZkllenQzVnU2c1lFQXRBSDBDTHVkWlQyaVp5M3BEYjhp?=
 =?utf-8?B?R0JycjN6NFM0ejFQQWVYbDdvK3BzZ3VHN29yMm5JaHVMNHAzZGxpRlFSa0ds?=
 =?utf-8?B?QTgrdk80ZFRiSzVTYkdxK2g0Rk9sTUF0VW5RQ1ltZW9DTXRyZlhOU3B0MkIr?=
 =?utf-8?B?SVA0Yi9qdFRYZnkwUUVuRzI2Qy9sbEt0cUU2RGFOUHpSa0NtckFNbXRHRFo1?=
 =?utf-8?B?TW83R0sxaWVjS1lMeWpTS1RrNVpSbGJEZXY1RzA0UE5wcUFPN015MFV1NWd4?=
 =?utf-8?B?ZFdDcUF5Z1A4S3pBUlp2ZFhsOU1ybms3bXo1UzB1a1ltS2xvZnNueUp2aWkz?=
 =?utf-8?B?eWtOYmVXYlMrUWg5VUJTOHdGd25ieFdGL3dsN2lXSk5GSUVHWHk5YzhiOEto?=
 =?utf-8?B?OUVhMVhuZ3Z6dGlFZXJ6L0piamlJbzB3S3FOazF5dklGd2E5UEowdy9vY0U5?=
 =?utf-8?B?VzY5TDcwSEVrY3pJZERIZkRNSTVxSnZ5ZW9XZnB1d1MrdFFBZ01DTTJvb3J1?=
 =?utf-8?B?a1hFazlZb0FObzlaY0krSXd1UXcvOTNNL1JkQUZOMVh1ajZXZ2JIekd3MHk0?=
 =?utf-8?B?SHRtcEZIakNvN3lPUkRvUEtrMzVkRWZrSE9ZTGt6WDI5Q2szZlRnZHdOZitN?=
 =?utf-8?B?aXRTOCt1RWc2Vm9kc0R3YkRVR3pXQ2tvMFgvWlFrSXJaK1hQZzJuMjZxcnZB?=
 =?utf-8?B?L1plVDU0VGtFQjdrUTRJcTN6Q0tmdkU4WWY0UGFUbEY5REVvVW01SzdzT0Jv?=
 =?utf-8?B?RGEzRnFYbjdNMHRaWUIxRDQ2TXUyWUI4K1gyV2hhK1IyMk1rQUgrOEhadGZB?=
 =?utf-8?B?ajJZUXVYcG5iSlUvUC9ycFdNYUMzQWIyZjBEdjNNaWxRUkoxd29jR2dLWFFF?=
 =?utf-8?B?UUhsOGpHZ3NBNHNkVkJVZjdZaW9mak92aEdYT0ZDcUJ5bm4zZnI0T2sxUm16?=
 =?utf-8?B?ZGJyZUVYRER6K05sNjdGYmhycUZSc0Jzb0ZKWXhUd1hQQ2p1VTFpMjZjTjBq?=
 =?utf-8?B?a0hNbllaK0VOYXRvSVR4U3kzV3B4TWpmenl6RlFFSzVVMTJ3cUc2bnRjQ1lN?=
 =?utf-8?B?RVFTb0QxWU1sam9VYnQyT3RNYlY4TVVhRGpqQ3FYN0FVZmFnZlNtQUNHL3M2?=
 =?utf-8?B?c2xmNU5RY3RrVHdmVENhT1BBT3lVTVUxRThqTEFhRElIaUJoUmVKcS9BTHNk?=
 =?utf-8?B?bHlFeHoxaTNoVVZpcURNVWJ4cHdrbDA1dWZOR3RLVjdxL2hDWHMybW9aRFF2?=
 =?utf-8?B?N1RQczc3eWkvY0NQdXlSZUZCNDJqYVd6R0JsbjFsdUF3RlZsWm4vVXpYbHlY?=
 =?utf-8?B?UUZyWWtZRjkrR1IrQVZINWk1U1l5MW80V1h5bVdFUVRHMlA1WGJOTjk5dlF1?=
 =?utf-8?B?b25nVEN4aDc3bkdQUktEZUcwUkNyRmdneS9HcFRnQ3BYZVhqOS9zUm5GTjh4?=
 =?utf-8?B?RXVBSFB1WDZwMFNrZ1lkUXArdDNmRGcyanU0aCtISkgyOEJhdFJUakQvVVJT?=
 =?utf-8?B?L2xiZmU5eE5sNjJHcW1LTUxwaU93OUg5WS85WDBrZFBRaGlXaklUVW9OQ3pz?=
 =?utf-8?B?clJEczgyM0E2NnZSMEdTa2dYd2RmdjRnbXd5bS9PSnhUU0h6RTVkaFhtY0tu?=
 =?utf-8?B?aEozUVppYzZNdFprd3BnNFUwYmh2R0FWSGZ6c1ZrWVlBOXhWeW1YU1pTdWFV?=
 =?utf-8?B?SXowQmVFa0NGd2VaeHl6dDBNOWVFWW9sVy82ck1DYTlBV3FCS211aHVjb0lD?=
 =?utf-8?B?MGI5OUFYbkZNR2lvczlGQVlKNlRIcDhBREY1TzlGM0diQWszaW5XUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c78cd6f5-c54e-4fa3-a881-08debc09878c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 16:03:44.7574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSd9txOUJ51WXufJuls6pxuBb0PkVhxN5yfnyNN9wdrOMry73ZNGa/vc7loBh6RDrm9n58ccXpSW8ftcYhZyJWY9Qdx+7uYikUg4h+8ClWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8471
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33227-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[1004e000:server fail,renesas.com:server fail,TY3PR01MB11346.jpnprd01.prod.outlook.com:server fail,bp.renesas.com:server fail,linux-m68k.org:server fail,sea.lore.kernel.org:server fail,glider.be:server fail];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,linux-m68k.org:email,bp.renesas.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,1004e000:email]
X-Rspamd-Queue-Id: 6565C5E7840
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjcgTWF5IDIwMjYg
MTU6NTcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzRdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5
YTA4ZzA0NjogQWRkIHNjaWZ7MS4uNX0gZGV2aWNlIG5vZGVzDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gT24gVHVlLCA1IE1heSAyMDI2IGF0IDA5OjAyLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5j
b20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPg0KPiA+IEFkZCBzY2lmezEuLjV9IGRldmljZSBub2RlcyB0byBSWi9HM0wgKCJSOUEw
OEcwNDYiKSBTb0MgRFRTSS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4g
DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Ni5kdHNpDQo+
ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Ni5kdHNpDQo+IA0K
PiA+ICsgICAgICAgICAgICAgICBzY2lmNTogc2VyaWFsQDEwMDRlMDAwIHsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsc2NpZi1yOWEwOGcwNDUiLA0K
PiA+ICsgInJlbmVzYXMsc2NpZi1yOWEwN2cwNDQiOw0KPiANCj4gcmVuZXNhcyxzY2lmLXI5YTA4
ZzA0Ng0KDQpPb3BzLg0KDQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT4gaS5lLiB3aWxsIHF1ZXVlIGluIHJlbmVzYXMtZGV2ZWwg
Zm9yIHY3LjINCj4gd2l0aCB0aGUgYWJvdmUgZml4ZWQuDQoNClRoYW5rcyBmb3IgdGFraW5nIGNh
cmUgdGhpcyBtaXN0YWtlLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IEdye29ldGplLGVldGlu
Z31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20g
dGFsa2luZyB0bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzDQo=

