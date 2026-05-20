Return-Path: <linux-renesas-soc+bounces-32858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIrRIxeCDWrUyQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:42:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D80658AFDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB8303084BAD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29C63CA4BD;
	Wed, 20 May 2026 09:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cFf31Dve"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA03B27DE;
	Wed, 20 May 2026 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269937; cv=fail; b=VWTLFGoPuWOLblT8qsCCHR/c8m976zAdW9C39o8iCDMErJqkoMieQd57P+eN73HexKlSGI8QvU6pXEQDXU80N33g7Rw7xhmAa8GK136ML4QwbpjcozklmDjboPh8O2VX3AhHPaT2wSapBdnpUC0W2wDZc5QbnxUL24ryHpLwkJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269937; c=relaxed/simple;
	bh=2MgFXro+jk3vpHPRNpvGa2A9OEjhWUGLQ7c85rMMDJ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=njWPyObqX+IxvsXTVHK5S633oqmOP/zJbCje/B2jnlRaIfdzvnWr1GfXq4l+s9D9EafRrB1uPFVcAkCIndtEbrCDeBIByDiGNh9tx8HPxRtoCgMTvQPyWJ/PlME5bZ4PqbVjP1aUz7J5bjkw3QnrNeiK+2yfsIGFSeVYKUhpQRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cFf31Dve; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhmVTNZ9zL0xZvGcGF0xsK9VsPZUd+NgjRcGz5xk7YE4x9meQUvTPRuftVAUOing+HELT+T4YMJgdCpWXNoMB61WroWJJjA4faJZz5qQEU81+3qFRn4Tg+a3DY8WubPvH4XkCrIt6hV+YUyGxTfra3m838uHyP4Q22ERCASzd88RLpIaaGm0i46tvQCXgySF34PpmGZqXi6oxb+ThrvExMBH7GJ89B6FOCCxE9B/VOWl9rXpSWSSrmV4/l6Hep9+r5yZdgtLm/k+kUNLu+c8ooOrqpJ6KkFmO90Dlucu3olnNTRsm9rLnOXi/yNmMRYa8MLgS2k2ixv/a4rGZfughg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MgFXro+jk3vpHPRNpvGa2A9OEjhWUGLQ7c85rMMDJ0=;
 b=DAgORHReS6trA3T5LSLo/RKYLEmujIcxNIVY5GY/KWf0ZarLVqhL5V9/htd6tShzyBXlncEpF6nyVVNXVZi3PD5u7DHy9N8JOzpBfYw/a9VcuYX0c6dqoEvmNNlvh+3tLtuIh35/Y16ftKTkZcSW1c1/VNhnvE6mMA5leqp5eG825DrK/ox9IOY/SuRCUAE18Uj87859FiaQuXISO8XxNjAfax3y7wvelDBPDEOcZG48Lvhzh04bagrCRTpgMZEwOGP7nXxBROx73XiDU69s9R6v0zlELYPwxENktv1KVADsvL91atODi9wxKBU6XqyeZQFc1zTCDXfAQ4fxRU6LKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MgFXro+jk3vpHPRNpvGa2A9OEjhWUGLQ7c85rMMDJ0=;
 b=cFf31Dve00GDqrYiB29p0QWXg9/slNrs2VOd2PZwkZuzO1tBX1n3lWxyjhUoYV1wAp3Zz7Kx1L9l7vjhVCTEJZBfSJHLlQpvfjPBRAXhbnAQHBw0y64yCHZSMR7jamxk+InS22AC0GZMFIMQp4JvjDaevpIz6r7c9zUDzuqUxGI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB14671.jpnprd01.prod.outlook.com (2603:1096:405:21f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 09:38:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 09:38:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Prabhakar <prabhakar.csengg@gmail.com>
CC: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui
	<rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] thermal: renesas: rzg3e: Drop stale syscon documentation
Thread-Topic: [PATCH] thermal: renesas: rzg3e: Drop stale syscon documentation
Thread-Index: AQHc6DllbNZzElrIwkyf+TxB/QG56bYWpFaAgAADj4A=
Date: Wed, 20 May 2026 09:38:49 +0000
Message-ID:
 <TY3PR01MB113460DF331AF8A6FF89FF37186012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260520091638.68370-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXDdS1_69+36h=HRKGvbZQ9j8_ma_sFW=ajXy=sn1M2Cw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXDdS1_69+36h=HRKGvbZQ9j8_ma_sFW=ajXy=sn1M2Cw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB14671:EE_
x-ms-office365-filtering-correlation-id: 600e6dbf-2e17-4718-71ef-08deb65398d7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|4143699003|56012099003|18002099003|22082099003|11063799006;
x-microsoft-antispam-message-info:
 0FiBfxgk1UQZwJ5DXa5hbvubuxzT9pUFkI8l+bB4lojwwAC7O41yRn4sn/HViMuCQqd9PSEo0ixOJzsNkrpeF491afUBtf5inrflB7vaY7hyda/OWcCNOJS+us4gpLRrhJsamXLrXOw4qA7pqagapK/1Mf8/khB+HlwtLyRLbcgNK3WdgqwJP6/GG0GgHO5N3Wd9/3zvm0SuAXhXsSG5nwijxz01K3Lo+oe8XlEbjztxSR1CdRb8Rm6Cy1WluEJ7fBjEWRvtSY4QnqOizMAQ9OEre6rTaJ52B6qcLn63LVEL0xHykfI1fd6nrfYayUiX9dWkBRDguMoCueZCrw5Dc1Cvbi5GvpipdkNXERaScvTdwCBmc6coeI/gBoHPJp82SKpZaXzSQuVNirGMzs7XGVGf9GGUxFNOw1eVDH3sYs97woLR0xCGqyi67TF5PJjPKb7aFUS45DzHDNe0sAyvoN2mEv9THzquhC3+/H3itIOR0TMXbidPpXaVKtiOD+2SJC/6cmpA+zxSc4xVAKfPqVFbqPYZBC0I25YKcfWSIBHlDYbSMdLIz1QEToaNy9E0Zr6OOWc1AA0ujBOXewl3FmZ4R515M6SiR3W8aNxG+OW4r5jadasx0JAi5XcvG5a/Hyg0wfIgEH7/XPxtLrUvHiYzVVuwyHxP9QJVZf5fs0jHU/TKuHgzJo01tOeEtocn4cMzX1rOj4KIsdP+4Ukm1hdJnXJvugN6+Z4mX3ALrNiGyuobwdhJAiCb8ZoqxK45
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(4143699003)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkRxTWsrWUIxVlVBR1hYWWRaaERGZW42ZkVYOTZ3b3BtVWs0UWlBR2w1aGpS?=
 =?utf-8?B?TWp4eSs4V2VDWDYySTRTZkoxMXFENFNhYytSWDY5eTIxdW9pY0Jjb3ZFd1VZ?=
 =?utf-8?B?QXBTT2VGZzE5UGgrZkpHdzhBSHJMRENuQWdBenNZNTcyZU9HNWpCQkMyRWRw?=
 =?utf-8?B?dEd2NzkrOUVtVUlyVy8yNTdxTVZsNkNWVU4vMDQwM3BSZE5SdFJ5b1Yxekl1?=
 =?utf-8?B?K1dWNXJxUWFiOUp1SjlwTnNpL05qVE1lNG15RDA1R1Zxb3N2SS9ZU0ZQNHN0?=
 =?utf-8?B?TEpvQ1FWY3cvV2JUQloxZk9OdnF6cTUrV2hvSVlwZWlFV1BSYllkU2VJZGYz?=
 =?utf-8?B?SHZMUTkwdVJST3NHbmhFZDZucktuZWIxRFBBM0R0M3h2TW1KSHVodUh0bWhs?=
 =?utf-8?B?ZHc1Nmlxak51SVNCczJvRnNLeTVjeCtqekdSQ3JDcURuZDczZFhKdXFIdXlu?=
 =?utf-8?B?ZytUSkRSdmIxZjl6TENWODNSM0hHaVJzOFMwNXYwZ1hCY1g3VlJ3N284S3dR?=
 =?utf-8?B?Q0tPNnBkS2FuWWtPUXQ0cWcwd2dHUUg2aTgyR2NaalJCUnBxMlJWL0FmTVMy?=
 =?utf-8?B?REJ1YXg3ZXNIalZwM2RJdVdlWEw2QTZzZEs5bDU1VmJleXV6enpXVS9yek9J?=
 =?utf-8?B?MUtFbVNWSG5yU3RrT3lJc2Y5c0NJUWhIUXlWelE5MVJudDVUMkErU3hyaUhS?=
 =?utf-8?B?dFdzUEtzTTlLZ1lRSkV1L1dhS0dPMTcrbncrcnlwOEZXWk5yTVp0dTRtbWwr?=
 =?utf-8?B?cTNXdG9kQ3BRc0orQjgyLzVXSGgrM3NkOERNcC9ycDVKWFNrMmd2Y2Z1MW5S?=
 =?utf-8?B?bnBNbWJ5S3RCSnllOEZuYkgwRXRVYzlod253YU5UU2gwV2ZwZUkwU2QyTXl3?=
 =?utf-8?B?QXJzNk5TL0ZkdVJSK2NnYWE5UnNSYUdjL0lSZVVrcGVvekNLZGR3YkRZRUVB?=
 =?utf-8?B?UHNkM2ZDYjRJOGJrZHcxQ0d6T1Y1VVVyVEUzSjlsVlFHNDZXMHhwOFVFMWE1?=
 =?utf-8?B?Q3pXRzF0VkRYLzNnWkpFWHJNMWlLRmhDQmJLM3h2clRiVzlUK293RjgxN21p?=
 =?utf-8?B?SjdONlp1cmtWQm1yYlRNY2hMTTUzT3paV3hpcDRIa1pMdjU0eEh1bW9iVzlF?=
 =?utf-8?B?b01jM2p4Z095ZUpZdXBnYWc2dnJ3L3dIUWUrbmI2SndhVWNlOXgrK3E5VUpN?=
 =?utf-8?B?OTJaU0dlOWFlR1lwemVtNG9DeFNLVTZqazljQ2pvWVJNYTNTdHBTSWlaeUkx?=
 =?utf-8?B?dHVPSUdDNlEvYVVNcDdyRU54TUg5Wis3Z2RCTnNVWEl0RVBMcytabjJVYVR3?=
 =?utf-8?B?OGNRTEpLQnhWMnZLcTZVZEFaNmEvZUFRSkRFdGRMSkxlRk1aMFZkNTVoeHgx?=
 =?utf-8?B?S2YybUpoQ2pEcGR2Y28ycGJobkZqV0ZpWFdxdHc2aE16eWxKMTF3aVVzYUwv?=
 =?utf-8?B?TkhMbXgxaWo5Yys5NUpjdWZvaU5tMHBwSERWWUpyTGZCRmxTNSs3RjVIS0Ra?=
 =?utf-8?B?ZDJTSEVkenhaZVJRdEF4NEFWeHdlRWJkV1BtSnhFQnJEWCtKR0FWTlFQMHFM?=
 =?utf-8?B?cWdBNTBjY3FNWUw4VzBKSGNPQXl2bFBXNUplTnpjQWt6bnRneXl6VFBoUEJq?=
 =?utf-8?B?TlBsNkJxNlZXOTArRS8yL0pDY3EvUlYrWU1rQmc3TUkzZE9zZVdqZjhUeCtl?=
 =?utf-8?B?bUJKeDRkSnBVL2c3ZkNEcGhYNEpNd1FmWm9pRHljMUU3eHpyRU5KdGxka0lS?=
 =?utf-8?B?WHpZYm96eVBvYkhWd1Rmdkl4QzN0SEpkZE5BZ2FSTHFIbnZtYkFsMFdjVTBw?=
 =?utf-8?B?RXN4T1c2RElxMXJEcE5jQm5JcWIxbnJZaFpieTU4UlJkSGF4VTZtR0hXS3Za?=
 =?utf-8?B?SDhEUEpjdHNUdzlkcDNZYUY2ZWVrQ3pIWGVZRmRzS0oyN3lkcWFZb2t3WWRE?=
 =?utf-8?B?RUZaMlkrUzEwQU5pWXU2cFhhZGJDYmpmRWJaTnhPZW1sbmVzQ3d4U2l2Tlpt?=
 =?utf-8?B?ZnJiSHducXJTeE8weFdXQ294UVZPTWFaNUlxSEhxdzZkcmFQUjRNVG56MjZ4?=
 =?utf-8?B?eUxMV2xkVjV0UXI3OEI4a21MRDBYQ0YybENVV1pxSzJsbE9Gd0pieVd3OWhX?=
 =?utf-8?B?OCtLYldUb3QrdGNTdDVWL3E2dElDVjFsQkhneTVsOGVXbjZaWHZjZVZEcHlw?=
 =?utf-8?B?VXlPRFlERjlGck8zTmo0YW5scU5PeHZRQ1F5cDhCRjFlTUx0NEtSYVNUZC9X?=
 =?utf-8?B?VVNIL3BNNjdLNFQ3WklMLzlNRWxJV0U5Wi92cUt5bHY0TDVnNGJZdDRoaGJ5?=
 =?utf-8?B?bjdSK2Z6UnU1V2xBMWwwdzE1NFF2UExqUDB0Mm4zaHo3eFlUckpCQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 600e6dbf-2e17-4718-71ef-08deb65398d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 09:38:49.5329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QWuYLMZDVecWEiHIXMcekc82h+R0AbV6uguAKhkVAacf4fuNDb1mSTbrqOyPbCy0aBN/S+53G/F/IS3uC8S+n6d8FGWyF65zmAYylbBmtSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14671
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32858-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,linux-m68k.org:email,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4D80658AFDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjAgTWF5IDIwMjYg
MTA6MjQNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gdGhlcm1hbDogcmVuZXNhczogcnpnM2U6IERy
b3Agc3RhbGUgc3lzY29uIGRvY3VtZW50YXRpb24NCj4gDQo+IE9uIFdlZCwgMjAgTWF5IDIwMjYg
YXQgMTE6MTYsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOg0K
PiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4NCj4gPg0KPiA+IFJlbW92ZSB0aGUgc3RhbGUga2VybmVsLWRvYyBkZXNjcmlwdGlv
biBsaW5lIGZvciB0aGUgJ3N5c2NvbicgbWVtYmVyDQo+ID4gZnJvbSBzdHJ1Y3QgcnpnM2VfdGhl
cm1hbF9wcml2Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhh
a2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gRml4ZXM6IGMzM2VkZDhm
OTM2Y2NmMmUgKCJ0aGVybWFsOiByZW5lc2FzOiByemczZTogbWFrZSBjYWxpYnJhdGlvbiB2YWx1
ZSByZXRyaWV2YWwgcGVyLWNoaXAiKQ0KPiANCj4gSWYgY29tbWl0IGJmNzQ2ZTJhNDFlZmQ5ODYg
KCJ0aGVybWFsOiByZW5lc2FzOiByemczZTogUmVtb3ZlIHN0YWxlIEB0cmltX29mZnNldCBrZXJu
ZWwtZG9jIGVudHJ5IikNCj4gd291bGQgaGF2ZSBoYWQgdGhhdCBGaXhlcy10YWcsIHBlcmhhcHMg
aXQgd291bGQgaGF2ZSBiZWVuIG5vdGljZWQgdGhhdCB0aGF0IGNvbW1pdCByZW1vdmVkIF90d29f
DQo+IG1lbWJlcnM/DQoNCkkgcG9zdGVkIGEgcGF0Y2ggcmVtb3ZpbmcgYm90aCB0aGUgbWVtYmVy
cywgU29tZWhvdyB0aGF0IHBhdGNoIG1pc3NlZCBmcm9tIHRoZSB0aGVybWFsIHBhdGNod29yayBb
MV0NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDIwODA5Mjg0OC41MzEz
LTEtYmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20vDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4g
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

