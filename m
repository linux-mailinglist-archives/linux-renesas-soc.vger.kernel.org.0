Return-Path: <linux-renesas-soc+bounces-33391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJraMXZhHWojZwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 12:39:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8761DAF8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 12:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27A0C308F819
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 10:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004E03955CF;
	Mon,  1 Jun 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fIMse6kS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319552EC0B0;
	Mon,  1 Jun 2026 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309288; cv=fail; b=nQws+tpfOE3XD1ZkL3SRdk4161BkflIB/KVLqfXn5e57IdSyaTANN/2FJDprd7KMlvwg+49DRrFghzLbNKROZ7D86EMMppJsisGUKzp/9msUR93rMbcwLZnUSH0tBp6CR0XF4z67+mJeIL0qm69KPATkPOVVir1l0GyAIVeLVmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309288; c=relaxed/simple;
	bh=ipKr2thYYqaub7C8pVOcP7cRxql0g0mFWEGtwAO5NbQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MELIXiSsnhSWTDAlzhrzWn2v4u/QXwlf2MmA05hxRi0fz8wowy2MfQh5oSEda2cl0793WknuA/j5L24UA16EnY3xCEiT9tvJuPw8yl0fgB7sXUhnM8hMT8aZJjuK8ZmnSwSkrVA+Qnu+uuL0C8Xg5o3Y795vj0aFQfk2/ALU7II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fIMse6kS; arc=fail smtp.client-ip=52.101.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSxdduRN55iyM02zoXubcIMUUUQFYMjvyZ+VHy3FhOYb3cDeb7ACdoVLkYMMeK8e75Ibu2IWy4wNuo098tJ0bPzNJAFY4Difz7SuW1QG/kkja9s5QAdY6bs+17ex8PoKMhezWlCr87wV8yWEamYLoTkjFXFGBjJnIsZ37FUlDWIndsXuOXpF2Zt1WrmIcN3+01T2mk39DYXj8IDp440zdAmufpK2KQf53+c3kwA7pG4WmRKsZsgRt+vpHLE6Hae6Ghi4lMBWhMUYuSkcYDPk0UICqPcAxx+aV3o4xvKbnFIl+lzUVypURBGUcywvuoGm6UU6eEoy7/gCWeaOcFyNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipKr2thYYqaub7C8pVOcP7cRxql0g0mFWEGtwAO5NbQ=;
 b=Yliv9r7q2VBxfYnED9iDimg8wjo/PfasWkZv4m26kjNZyLhq4B6n+xJ70fRuq4KEbaCSGGtXN2g1RxvrWD303GQFQERsFPThQqjq3U96RtTHjdi5iiEtua20lQm3ep9BAZGxVvBPeyU/hXUVkKHeFeLpqmF6Ha4qHnBl2FPZ4zt1GehxeRGEDHcQExmpTB24fs5/5xtrVD3LnC91Zw4UylQCB1qycb4TdiBGSeq2WlYsHDASVYlV1VCA+330NMkG/RBxYnEjqQxtHSY+XXw8YLkePY8Ey0iZfrzp6Sd4thz+1/Qbt1iiCht2wfNpDQe8rfGZSSqraTpDc0PgKxMk2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipKr2thYYqaub7C8pVOcP7cRxql0g0mFWEGtwAO5NbQ=;
 b=fIMse6kSf5OYv1F/6KA4BDZVEIGVqQ0NmMJzpZAg041zfvH2rs5pz4hG7qJCRwMrVHeZjgCJ+Ate8Q/MdfDEdrLkE0vGWvWeWCcnL+jckcelp1QJuSHBKmyA/meno5001+2z5+zGhli4qdlYbhdUCKiEgkDLnWRA997rJHPSMnU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13025.jpnprd01.prod.outlook.com (2603:1096:604:32d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 10:21:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 10:21:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Thread-Topic: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Thread-Index: AQHc67XSOXReT+gxn06RqQ9MqkvErbYeXYragAqnGYCAAILzgA==
Date: Mon, 1 Jun 2026 10:21:20 +0000
Message-ID:
 <TY3PR01MB1134611A3BA64F10AAC5375B686152@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260524194457.479681-2-biju.das.jz@bp.renesas.com>
 <20260524195829.960401F000E9@smtp.kernel.org>
 <CADT+UeAYhrwpmApCWaJ9w0gK3zF4eR4LVptTTwegGucvF6mmiA@mail.gmail.com>
 <20260601022619.GA3961324-robh@kernel.org>
In-Reply-To: <20260601022619.GA3961324-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13025:EE_
x-ms-office365-filtering-correlation-id: b345eb5d-1944-44cf-9a5a-08debfc78688
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|4143699003|22082099003|18002099003|3023799007|11063799006|38070700021;
x-microsoft-antispam-message-info:
 KIWEUvhrjJogs2QbOdIvxcmyNcA5R4WduYmshQY8OsUAfrfpOReY8CiS2w0KHDw353+6prYqb4P20zH0EaWZNlbrtOkw21AjoQxQvzTMhs70kuBpBZGDT+dNcWnGq9YJA95nEJzaD5XKro2XJ9hHd3cM0RaSIqozc94jvP9klxhHI8iBIlst0ouBK7rpnnyNV32t/nr5vUpIgIqZagKd1dTvbG9zjt4MWjAcetpg23YfrWz0gXcsid3cT7+QkJLa7g7ZJsmYZhl4uctRGDDN+gU0wFhUY/oY2qTIpX6z8PYkFSJE/oHsTQ+HMF7jgSuTVdoEBzQiVpDjCKQMjb+TO9kEt4qRaPnKof8x4JczNrbOpdFr/S5pn5eQy25d2NNwGHWMDuFox2GaV+JHh+z9L+iD0wKlKkPzQkoD6ANLtCCBt9UnQYmGfkd5o98XWnIJlVFVot7roSqM7THiFFcxRvD7o3eQ4caXaj8DpW0AEZoLZBOw/A5dY6iesXdB7HGaG2q6ui6VmtzcTKZqZ2kJ3LLg63FDVL5Qppko41o9vvKb953UROkjmPucB43B09bNWrAi19Ujo04l3R6w4LiaH6ZHTT930mcHVqlYyrUP069jcWYkA+TmnPm3shb7vjIxuG2gylNvuYygdVoif0G9VvJOS7eMiy6htoSdb8H1h7KbS/gBvg3Ms8D830Y6/s/mZ59U16avL8ndT96r5uUjQJYuN+4Kq0BcFxEk40sAxfUUAq1XqTWWfdw1SxbJdjj9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(4143699003)(22082099003)(18002099003)(3023799007)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3F3aTFVRDVQTnJsWHBrR2tuY0grSkMwQjF0dTQ5dTN1NlJUWFpSOUhzQWpM?=
 =?utf-8?B?bjVkbko2YTNLdEsrcFZ2L3o4RC9yRTIwQ0dxTlFuQytYYk03ZkRIWHlsYjRH?=
 =?utf-8?B?NzJ2c1pPckZsYTBrWWhIdWo5WlZNaTNvd3BPT1hvZXp3VUgxajZFU1huSklp?=
 =?utf-8?B?UG5yMXFWQVFJMjZ2SWFxWWxUQU1Pa3JVaklNTjhvWDZyVFVOWE5uMzJURXdp?=
 =?utf-8?B?a3lwM0puaXNmdzRHWis0VGF2SUZOZ3VpR0dBS05weVRGOFBvK244dHVmYUtN?=
 =?utf-8?B?NVlDL1J3RXNSeTRjcW9GVVkxc1lnM0EwTkNxK2QvTWhhRVlhc3RLUHF5YVdk?=
 =?utf-8?B?bWdEWUgyQjZuWjBKZ0I0YkM5aXh2SUt2MHhhbEE0TTVaLzZYREpuQytaTTdo?=
 =?utf-8?B?RXVWME5MeFl6ZUF5Y2E4cjlJeWxTQ0FrYjd1YmtQWXJ6RUFJcTc2bCtEVEVp?=
 =?utf-8?B?NWlNZE1jcUtJQVBKbW5EaDhuREQ4WGVWRXIxZWtDcTY3SDN1K1l0c2RnRHNz?=
 =?utf-8?B?akpDSVJpRTlCVFVGYXc5cjUxWi8zR0lRR2NsMTRtM2lTS1BDcnhuNURHazlo?=
 =?utf-8?B?Q2xzNTJyK24wdGdEU3BpTmMyS0taTkZscThiMUNReW80UU9PZnJIWGxSREk5?=
 =?utf-8?B?SGR3eDBLemNnYzNYdnVxdElKTWtKWUFzTGdnZ2RtZ3J6YlNyaVd6bURxdlNT?=
 =?utf-8?B?YkdLWjNFMVg5M2FHaW1xeE56dFlPcEN4c0RheGdJa2RhZ3Q5M2p3Q3lCbEt4?=
 =?utf-8?B?Rm9Hb3pxQWw3VE9DT0xiMy9GYnhnSFdtUHN4M0NNVnUxd2Jvdlovb2xHZjdk?=
 =?utf-8?B?TUJSRE9QOElyUnZ1NmlpYjJYY3BhMittWWVBWDNwKzd4RFBMdGNBRGEyY3pZ?=
 =?utf-8?B?TFpCVXEwWEpmemQ3UlRhSVhHOEpRRE10ZkczazY0bkU0T0pVM1M1VjlPSVBI?=
 =?utf-8?B?RVJPNG5lM1NyOWVNaDdFM0t2ZkN0S3oyMHRGV1QydW5zaXhneVZRQnQ0WHRM?=
 =?utf-8?B?NjlVV3FFcTQ5d1hrSWdwS0xPOW03VHJvREx2NTdKK2doMG0vb3QxZDdvUDlh?=
 =?utf-8?B?cmo0aVBQcGE5WnFrM2J2NDhMcmxwdXZjWUhxdkdqQldVVnNqbDFpcnkxYXoy?=
 =?utf-8?B?anppU0ZreVBHdzRaaVBXYzhCaG92Zy9POVFBNFR1d0hZYW1XZW9NOVdacjFK?=
 =?utf-8?B?WjUrRFpVai9TYkFROU5BMjZueUhkR0R3MldwcnFSTFhlTTFSWEl0R2NhMEtv?=
 =?utf-8?B?ZVhES0pLV1U3a01PcjdyYTBTR2hya283ODNsUkU3d05WcC8rcnN4QTJlNmNN?=
 =?utf-8?B?dlBNRHg3Y2h3bEczMEdNM25aRlRZNUo5eU9aSlI3YXBkMXlJVTRJSTlxK3Fa?=
 =?utf-8?B?cjR6VjFLQ1Fya21TSUk0WUFSVkZjR3R6NWlXWlRxVklrMnMxZDkyV3FycTRD?=
 =?utf-8?B?U0ZVZzBmNUNlWSs5cDIrZVdjckhGTmIwb2czOTIyTUhJZi9MTUhDNHcyT2gv?=
 =?utf-8?B?N1hhSndXekFuWkNaVjczeDFnOW9aUEpGWUhQTExVdDllcWlONzhSbTNPRU1U?=
 =?utf-8?B?Zm83NEdJenhzVG56OU5RcXhYcXRrcDB4V010cUJSeU83M1JGMWxBL2VvdTFN?=
 =?utf-8?B?RzNQeUpsNVpFZ2xGNzhrWlV6MDBXRWJ3RGtkR1FPVDZwTE9XNEFrUmEvZXoz?=
 =?utf-8?B?Yy9WQitJZUtacnl4cTQwL01WSU9nL1VGek9JM0xWMC9KWmoxVGxDV29FNWRW?=
 =?utf-8?B?NVhYR3lCV25ISFFoSStQZVF5WjRGbUJ5WURCbjlqUXlBS1QwaVMwczg4OWpR?=
 =?utf-8?B?SlNpcERNNE9qNGthRFdTYkwzUTk5Ri9wa09GQUJpVXpTb01BQW03eElHMEsz?=
 =?utf-8?B?WVpCekVCd0Y2dzRzVnRmQmF3Ukpzb3oySi85RTJwa0IySXREdERIUTBlYk0y?=
 =?utf-8?B?c21XdjkyclYxMkJTU2dWT2crUUJMOW1KSWN4KzdwSC9aZzRRYmF4QXpHcTBw?=
 =?utf-8?B?dVhUbC9GOWFPZy9XUmFsQ0ZBT2cyM0FhdDJmQTNnWnVsS3FIWlFaZnBkMnp3?=
 =?utf-8?B?WG1CTVFQZVEwUTRQRldRb3JvZlZsOU84Zy9TRW8zclp1a2tOdVBGL3p4RUZk?=
 =?utf-8?B?MEFCUUc3SVFJZDlMZitNSFkxOUtOVHo2N2wyYkZiTUtqOXJFcXpiaGZJbU1T?=
 =?utf-8?B?R2ptWEVJWWl4TjlhaTBPNlpGR0svMnRGOHlWY0tHVGN0eENKK3RKUTgzYkIx?=
 =?utf-8?B?clpWeW80ZVlINCtWU1hnU0xSeHh3dExrTGVqUjIvOGN6WnVtVjFxNlpTYlBB?=
 =?utf-8?B?di91OE9qZzh1ZjR0eEowNzFnVWhnMUxPVnpBL2duT0M1ZHRtRDdoUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b345eb5d-1944-44cf-9a5a-08debfc78688
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 10:21:20.9537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cTWotyZEioxEPQ6w/n4wvcEFtsSY9weRkODBLG1TQ11Xp7ThDvLnXXSXB5tDVIaC5ETSIkjnpLMtiJp0Ncp7cyOVe5wLsvd3eUO2+lHqKpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13025
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33391-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 43E8761DAF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBTZW50
OiAwMSBKdW5lIDIwMjYgMDM6MjYNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzJdIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiBicmlkZ2U6IERvY3VtZW50IFJlbmVzYXMgUlovRzNMIExWRFMgZW5j
b2Rlcg0KPiANCj4gT24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMDg6NDU6MDBBTSArMDEwMCwgQmlq
dSBEYXMgd3JvdGU6DQo+ID4gSGkgQm90LA0KPiA+DQo+ID4gT24gU3VuLCBNYXkgMjQsIDIwMjYg
YXQgODo1OOKAr1BNIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPiB3cm90ZToNCj4gPiA+DQo+ID4g
PiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3Vu
ZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gPiA+IC0gW0xvd10gVGhlIGNv
bXBhdGlibGUgc3RyaW5nICdyZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbicgaXMgdXNlZCBpbiB0
aGUgZHQtYmluZGluZyBleGFtcGxlIGJ1dA0KPiBpcyBub3QgZG9jdW1lbnRlZC4NCj4gPiA+IC0g
W0xvd10gVGhlIHBhcmVudCBub2RlICdsdmRzLWNtbicgaW4gdGhlIGV4YW1wbGUgbGFja3MgYSAn
cmFuZ2VzJyBwcm9wZXJ0eSwgYnJlYWtpbmcgYWRkcmVzcw0KPiB0cmFuc2xhdGlvbiBmb3IgaXRz
IGNoaWxkIG5vZGVzLg0KPiA+ID4gLS0NCj4gPiA+DQo+ID4gPiBjb21taXQgYmU1OTVjMGRiMmQ4
NWQ5ZWExMzk2ZjBmMzBhYzdhZDc1ZjQxMDFmZQ0KPiA+ID4gQXV0aG9yOiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gZHQtYmluZGluZ3M6IGRpc3Bs
YXk6IGJyaWRnZTogRG9jdW1lbnQgUmVuZXNhcyBSWi9HM0wgTFZEUyBlbmNvZGVyDQo+ID4gPg0K
PiA+ID4gRG9jdW1lbnRzIHRoZSBMVkRTIGVuY29kZXIgSVAgZm91bmQgb24gdGhlIFJaL0czTCBT
b0MuIEl0IHN1cHBvcnRzDQo+ID4gPiBzaW5nbGUtbGluayBtb2RlIGFuZCBzaGFyZXMgYSBwZXJp
cGhlcmFsIGNsb2NrIGFuZCByZXNldCBzaWduYWwgd2l0aA0KPiA+ID4gdGhlIE1JUEktRFNJIGlu
dGVyZmFjZS4NCj4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxyOWEwOGcwDQo+
ID4gPiA+IDQ2LWx2ZHMueWFtbA0KPiA+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLHI5YTA4ZzANCj4gPiA+ID4gNDYtbHZkcy55
YW1sDQo+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IGluZGV4IDAwMDAwMDAw
MDAwMDAuLmIxZjZkMDIwYWU3YjENCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNh
cyxyOWENCj4gPiA+ID4gKysrIDA4ZzA0Ni1sdmRzLnlhbWwNCj4gPiA+DQo+ID4gPiBbIC4uLiBd
DQo+ID4gPg0KPiA+ID4gPiArZXhhbXBsZXM6DQo+ID4gPiA+ICsgIC0gfA0KPiA+ID4gPiArICAg
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHI5YTA4ZzA0Ni1jcGcuaD4NCj4g
PiA+ID4gKw0KPiA+ID4gPiArICAgIGx2ZHMtY21uQDEwOGEwMDAwIHsNCj4gPiA+ID4gKyAgICAg
ICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbiIsDQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAic2ltcGxlLW1mZCIsICJzeXNjb24iOw0KPiA+ID4NCj4gPiA+
IFtTZXZlcml0eTogTG93XQ0KPiA+ID4gSXMgdGhpcyBjb21wYXRpYmxlIHN0cmluZyBkb2N1bWVu
dGVkIHNvbWV3aGVyZSBlbHNlPyBJdCBsb29rcyBsaWtlDQo+ID4gPiByZW5lc2FzLHI5YTA4ZzA0
Ni1sdmRzLWNtbiBpc24ndCBwcmVzZW50IGluIHRoZSB0cmVlLCB3aGljaCBtaWdodA0KPiA+ID4g
Y2F1c2UgZHRfYmluZGluZ19jaGVjayB0byBmYWlsIHdoZW4gaXQgdmFsaWRhdGVzIHRoZSBleGFt
cGxlLg0KPiA+DQo+ID4gVGhpcyBjb21wYXRpYmxlIGlzIGRvY3VtZW50ZWQgYW5kIGlzIGluIG5l
eHQgWzFdLg0KPiA+DQo+ID4gUTEpIENhbiB5b3UgcGxlYXNlIHJldW4gdGhlIEFJIHJldmlldyB3
aXRoIFsxXSA/DQo+ID4NCj4gPiBbMV0NCj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvDQo+ID4gbW1pdC8/aD1u
ZXh0LTIwMjYwNTIyJmlkPTUxMjg0ZDhiMWRiY2Q3ZmEwMjIwYzQ5ZWVhYjI5YjE0NjE3ZTBkODgN
Cj4gPg0KPiA+ID4NCj4gPiA+ID4gKyAgICAgICAgcmVnID0gPDB4MTA4YTAwMDAgMHgxMDAwMD47
DQo+ID4gPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ID4gPiArICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwxPjsNCj4gPiA+DQo+ID4gPiBbU2V2ZXJpdHk6IExvd10NCj4gPiA+
IERvZXMgdGhpcyBwYXJlbnQgbm9kZSBuZWVkIGEgcmFuZ2VzIHByb3BlcnR5PyBXaXRob3V0IGl0
LCBhZGRyZXNzDQo+ID4gPiB0cmFuc2xhdGlvbiBmb3IgdGhlIGNoaWxkIG5vZGUncyByZWcgPSA8
MHgxMCAweDg+IG1pZ2h0IGZhaWwsIGFuZA0KPiA+ID4gZHRjIG9mdGVuIHdhcm5zIGFib3V0IG1p
c3NpbmcgcmFuZ2VzIGluIHNpbXBsZS1tZmQgbm9kZXMgd2l0aCBjaGlsZHJlbi4NCj4gPg0KPiA+
IEkgZG9uJ3QgZ2V0IGFueSBlcnJvciBvciBkdGMgd2FybmluZ3MuIEhhdmUgeW91IHJhbiBkdC1i
aW5kaW5nIGNoZWNrDQo+ID4gYmVmb3JlIHByb3ZpZGluZyBzdWNoIGNvbW1lbnQ/DQo+IA0KPiBU
aGVyZSBwcm9iYWJseSBpc24ndCBhbnkgd2FybmluZywgYnV0IHNhc2hpa28gaXMgY29ycmVjdCB0
aGF0ICdyYW5nZXMnDQo+IHNob3VsZCBiZSBwcmVzZW50LiBUaGUgc2NoZW1hIGZvciB0aGUgcGFy
ZW50IHNob3VsZCByZXF1aXJlICdyYW5nZXMnLg0KPiBUaGUgJ3NpbXBsZS1tZmQnIGJpbmRpbmcg
ZG9lcyBub3QgYXMgbm90IGFsbCBzaW1wbGUtbWZkJ3MgaGF2ZSBNTUlPIGFkZHJlc2VzcyBpbiB0
aGUgY2hpbGQgbm9kZXMuDQoNCk9LLCBJIHdpbGwgc2VuZCBhIHBhdGNoIGZvciBSWi9HM0wgd2l0
aCBiZWxvdyBjaGFuZ2VzIGFzIGl0IGhhcyBNTUlPIGFkZHJlc3MuDQoNCisgIC0gaWY6DQorICAg
ICAgcHJvcGVydGllczoNCisgICAgICAgIGNvbXBhdGlibGU6DQorICAgICAgICAgIGNvbnRhaW5z
Og0KKyAgICAgICAgICAgIGNvbnN0OiByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KKyAgICB0
aGVuOg0KKyAgICAgIHByb3BlcnRpZXM6DQorICAgICAgICByYW5nZXM6IHRydWUNCisNCisgICAg
ICByZXF1aXJlZDoNCisgICAgICAgIC0gcmFuZ2VzDQoNCg0KQ2hlZXJzLA0KQmlqdQ0K

