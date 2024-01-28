Return-Path: <linux-renesas-soc+bounces-1900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9004C83F4C5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Jan 2024 10:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE06D1C210D5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Jan 2024 09:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB31D53E;
	Sun, 28 Jan 2024 09:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kaDvZAyo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F904DDD2;
	Sun, 28 Jan 2024 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706433686; cv=fail; b=Q4Ci/ce2PUr/7O4cgvX8vQzetb5uNS/NAPDcifFCwrpUic3KducuBQOs9TJyRRsQo5/hZgA6ZO8YM1CQj4pi73/fi4nhzhgh2thvRA/Ur6G7zTATmFmmuywNojX1enN5RuV86fivj1e6idlubiC1t5ZAK/dTX2N3Vx+c77bblr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706433686; c=relaxed/simple;
	bh=ySXWbsUp9+7gte539ryMVD6SZHGiQLmvCohhDi1eDdI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p4Wgn0+nAcqNrMiQrRLc8xbtNzXNivONR8UF0qRhuAYX4Op1f3LQfLU6pjShLTwsk3NC4BieEtkd2ESpkpks/VUNA6fUgvPXbCaQtJJS1BudUhvxZrWO1JL2jfvNChpzuIDFeNhQeyg/HvBS0G9NXNsIJRXU+SmepV41s4HJLVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kaDvZAyo; arc=fail smtp.client-ip=40.107.113.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7qOUl6FUNbeSqg9mnXZsX7aqcn2eaHORkcMZgdPF468LwMxxfgsq3T5o/Lcj7kGWgSDwzZSMxkUAxILXa6CL7vytmuDAgjD1RwmWhpgCQ7mkQa0hnBMdewSubDuvehY5GLhvClNntyN8d50TS3sG0goSwkrqLBnRHNdIGlqoiTzbIKsF9ztCvUGGPV9VZWwR34qUe1BG+j0ktfZOTvyMjXvgfo6xn/GcpywJgRUEXlvEuTHE1iiVyk3/UDF7THuz1jDwrvvspGnYscqacS4Q+N9bzyrl0L+qnnBVIYG5z/jeMun0XMuwjOvP0d2r52lahJY6eUZV8cGhxL9M4UGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySXWbsUp9+7gte539ryMVD6SZHGiQLmvCohhDi1eDdI=;
 b=Wjl2QlL7Oa4cBpmx2h9CWt9uvaArnQsNROPTlRDX5+9XpvF1kbTjPWSKLIktsfJgeVF2Us+eYw+fmnumGZFncdL9aaweq0tjkoDTs8sXg5KKr2UOoorNAoPpoUFoxDZzrnLvaEmU78XCf4UspWuy8f+IcA9XH9Y1VMaYEJhqSoK/VPwYo64EXiPNJr56Y9Owi+zSuI3veWVMc0e7exAvJTef7k/7oZcB7gy+ddLZaxm7slnvlzmz61ysJx36/pG+dcN6hoNPe1DUumSDZmjJNTnmjNGpZTuMewzwoOjbuSqFokbGdGuZBMdAzCqXw02azvVXZC5p/fUHQsUrM20TEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySXWbsUp9+7gte539ryMVD6SZHGiQLmvCohhDi1eDdI=;
 b=kaDvZAyokxKxmwZtp/EyygZplSG1SNjEQzeWqbBK0nW61Ff/tDUfBgp3VS23oYKJC7zgPfiFRYk/KlLwgj5mIfAkMVwnAiPhAKrMYaf4VQ2WUXs1mWxbLw+JOILabMAzB1ymhTCPxhxurHsW+HnuOPYCm6lnibxLDyDvIauqj/Y=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB5852.jpnprd01.prod.outlook.com
 (2603:1096:404:8053::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.19; Sun, 28 Jan
 2024 09:21:19 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.017; Sun, 28 Jan 2024
 09:21:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH net-next v2 2/2] ravb: Add Tx checksum offload support
Thread-Topic: [PATCH net-next v2 2/2] ravb: Add Tx checksum offload support
Thread-Index: AQHaTq8cpFyINyyFUkytdvMhaLjU9bDsl/kAgAJehIA=
Date: Sun, 28 Jan 2024 09:21:18 +0000
Message-ID:
 <TYCPR01MB11269682F2BDDC6A4F324A697867F2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
 <20240124102115.132154-3-biju.das.jz@bp.renesas.com>
 <fb8302e3-8491-09d0-3f94-1599bbe42743@omp.ru>
In-Reply-To: <fb8302e3-8491-09d0-3f94-1599bbe42743@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB5852:EE_
x-ms-office365-filtering-correlation-id: 96ea3f14-b08f-428d-3c5a-08dc1fe27c60
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Gtyz9ectKj4JhSAtKMUZ2C9jPyCFkZrWQ5ACFwftpFftnuB2j2q4YeoiPsIlnpVkK11dhE3DPNeWsr5+J9mlWqwhqJA047S/5libECMEvX6t8NS8CPZ077rY9sdldfiGq39j8tN6Txo+K8/ya2x+5QpSQAWVDvADZMAfP3mFoIvKH3+nb0OgL3eDb+oiuEz79vCdhGOu5y4V5L4SzaGLRKYp2HaAmqWl+fpi+CVoK6zW0YxdnabDt6XNMafIU5Xce+85oWgxkHSHe4D3uiBCHtybkqz62bPTZnVHt7Cgd3FAC7j1yYV3RP+AxX3laQ9sx/g3Wq1bLEYx30C5CUs3RNp3kotAmXs8sx10tul6xzIX7LcWKLPd2yyoNtCeWqrboka9skVYQfW/p59UHosrCIRAPGYt6t0wSQkJS7hgYUErheSL18Llor692pl9bej/kAC8dEw4x2sYpsgUVy/EDQuUY/4XiTm5kpbA3kv5EDUmVn6evPD1uxOLHC+5yZ3d65rWd1lGfoojJiNC/0k8Q3nInchpnU76kdU13MrXHtNa8kR7oMoRd1vkWGrGNdxy4YUw4SOMFW3Y5C5orOH0M8mtGqno+/SjdxnB00z5rhXb6D0qKzyYpNutWXWLOlnx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(39860400002)(396003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66556008)(52536014)(8936002)(8676002)(4326008)(33656002)(2906002)(7416002)(5660300002)(86362001)(110136005)(76116006)(66946007)(66476007)(64756008)(54906003)(316002)(38070700009)(66446008)(38100700002)(122000001)(53546011)(7696005)(6506007)(9686003)(478600001)(71200400001)(83380400001)(26005)(41300700001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnZjMFlneEp6SDBUZ0k2UHp5NkhYMkl3TlNuNnFkbldqTFNMSXBUV2lPaWh2?=
 =?utf-8?B?ZXhITUV2OXhUR0V4SzlLbEE3aFhXeDR3ckhJc1VTdU53bEc4TGg5ZHJtNmN0?=
 =?utf-8?B?dml2YWVZckJLZStoaTNoc25uMVQ0ZDcxb1FmanRoMWdSeWRjbkh0VjEzMHFh?=
 =?utf-8?B?SVJxdEtuSEpNc3RHa1J1UkUvMDd0RzZUUHFQMzlBVEcxNlVvdzBnNjQySnhr?=
 =?utf-8?B?R0pxcGhma1RjOCtScFowS1ZacG54NEtSejhidFFOM0dtWEU2TkpwNDhveWpk?=
 =?utf-8?B?U0lQUTI3cWUyY1hsTjBIZFdxMFNlZVgrUXRDZ2E1K0Zvb2tBRGQ1MndLUmt6?=
 =?utf-8?B?YWNZcFh6dVpidmRhWStmOG54TzFoTCtxTzFGelFibjA2cUVBaytHeGVlV0hZ?=
 =?utf-8?B?UkZkUDVHZkErQjExdzZjUlFWTFUvYmJUeTlncWpRL0Y0NWVDOWtkRXVJbnpn?=
 =?utf-8?B?M3F2bjd1cHQ5ZFZaYmJYQWFnTDdjY0VuZFFZU0hhOU9SQklBdnlYbzhBaXE4?=
 =?utf-8?B?bFZwY3B0MjZ0NUxDL1paWWh6WWRjR1lWaDY4U3J6TVJSdDVvbEp5MTRSY1RC?=
 =?utf-8?B?Z2VPZFk5ckZOTHlJNndFMndtTDhrRkRqdGIzTythWHdwNTdqR2F6R05QSzFG?=
 =?utf-8?B?TkdBdVhJRkhNV3o5azNzSHpXT0FWUHlLZ2FyelN4eXkvRVd6TWxqUmcvSVQy?=
 =?utf-8?B?RldnQ09YOExoZXd3SDVjMVI0bVB4MUNTbFNOQ0t5OTFzaXp6K00rUWMzdzFx?=
 =?utf-8?B?bkNJeXFBZjIwa2M2Y0dpNXNhcVhPaVZYa3FLNjVVK2c3ZTFaRHR1TDV5dGV4?=
 =?utf-8?B?RjVPRjd6ZUE3RUpEbVFMVzN0R2RrcFBHUWF2VmxyNlpEVUdvYUhHRzJmQjJG?=
 =?utf-8?B?bllNd0h6WTZtZHR0c2VpeEZuSk1MdWRhSTRWMTBaSzFJN3FMcWo5czJMNmtU?=
 =?utf-8?B?MHlZdVJxUnptQmJQa1dQZXdiT2ZkalltbWFSRUgxSzVBT3gwU1hvOXJNbXNQ?=
 =?utf-8?B?QnBMaEhxeFJVR2d5RUtTMjRXMlZjVjJoSTNFaWFBa052SlN3WjV3WjdmY3BF?=
 =?utf-8?B?alp5ZzJ0ZlZUbzhoZW9ibWd3SmdFaThxbFJNMGk4dFN5UGZrd1Zwa01TYXdV?=
 =?utf-8?B?YjdUNDQzSTlGRlRiRGlUdVY3ckNESXRZMmRucGEyT0tEejlhM2ViU0x2c0tp?=
 =?utf-8?B?akNZUHlGS0pJUUVQcFQ3NFFidE05ek9wRnIrMml0KytiMWJyV3FpSmczQWtT?=
 =?utf-8?B?cG14cDZqVGZDMjZwQ0MrMHM3YVlmcXYyN2EzdTg5WmFvMy9CN3p0a3NCaDln?=
 =?utf-8?B?UVAvS2RrMlBzajBKNmFHcGNkdnBpQTY2T3pidEVuT2xtY1MyN0ovemRIdURQ?=
 =?utf-8?B?TEpLVHFYeUNLZWwvaW1RWXJMeFFoQUFWK3Y4dURsTzJUVW5weFVUVEUzOFF6?=
 =?utf-8?B?Q0FiSUhxZTIyc3FrSVA3R010cjJFOUNrZjNKT3ViaUx1YWRqNGtnL1BoTnhG?=
 =?utf-8?B?NW05NTFLSUsvanVTR0p6YnN3RGhGRmVjaFJzR0FLRFFQbFNKS2NCZksrU0Mv?=
 =?utf-8?B?dnhjR0haSEpTMXRtV2pzS2EwUUkwSml6aWpzdjJBcGQ4TEJBL010T0VlN0FB?=
 =?utf-8?B?c3ZXOGJvLzVmMU5GVjl5bnpMbmhoeDNIbnBHb0pzdGtNY1VDVHBqOW5paks0?=
 =?utf-8?B?SDU1R0xuSytUY2l2UjUyZ1N1d0xXMW1kdmZ1elVlaFU2L2Mwd0xEc0pEZGcw?=
 =?utf-8?B?eUdhL2ZoVEJKM2lqaFNUYzg5ckRMUFZ1Qis1N3V5eVFRZThxdS9rYzlEVzdO?=
 =?utf-8?B?VDVZR0ZWR0Erd3NhR05rSGZaQ1AvOWZ6QmpjSWFEdFEwMDdOaUFKSmRLMXR6?=
 =?utf-8?B?cGY0bDRVYkduTnZNQ09qS2p2dUhDV0JlTml2eVhhRXVPUHhqdjE5MU1RdGlu?=
 =?utf-8?B?UWFZa2toNzNwRERqZ3NxbDRyWGZCWkpOOEZINE1nOE8wZG5PRC93bXVUVVBI?=
 =?utf-8?B?d2tORlBKTFI0L1JKbDFlMXNkb2JYeml6VEpDZm5HQU1MNFlvUDhNR2h4eDA4?=
 =?utf-8?B?eXNjNUJ5b0toNGJKL2xaUFFKNWtqR3RQR0xaMUc5cThEcXVIZjhaZFRXRmtH?=
 =?utf-8?B?eEVXRmJWVnlzZnZKaHg0T0Vmb25tNFo4ajBkQ2JQTXRUZC9UcWpXMEN0S1Bs?=
 =?utf-8?B?alE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ea3f14-b08f-428d-3c5a-08dc1fe27c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2024 09:21:18.8936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5N+u6xz1JYYWN5ag3UU9wOkwDNfrt+Udex/2asF25hA9Yu2a8WKVfJlRo/dVG/dtlhS8BNYk2+C1Dm9Sw5UVh4eNuXXNqV934TTHuUQ1+00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5852

SGkgU2VyZ2V5IFNodHlseW92LA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5
b3ZAb21wLnJ1Pg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMjYsIDIwMjQgOTowMCBQTQ0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIG5ldC1uZXh0IHYyIDIvMl0gcmF2YjogQWRkIFR4IGNoZWNrc3Vt
IG9mZmxvYWQgc3VwcG9ydA0KPiANCj4gT24gMS8yNC8yNCAxOjIxIFBNLCBCaWp1IERhcyB3cm90
ZToNCj4gDQo+ID4gVE9FIGhhcyBodyBzdXBwb3J0IGZvciBjYWxjdWxhdGluZyBJUCBoZWFkZXIg
YW5kIFRDUC9VRFAvSUNNUCBjaGVja3N1bQ0KPiA+IGZvcg0KPiANCj4gICAgcy9ody9oYXJkd2Fy
ZS8sIHBsZWFzZS4uLg0KDQpBZ3JlZWQuDQoNCj4gDQo+ID4gYm90aCBJUFY0IGFuZCBJUFY2Lg0K
PiA+DQo+ID4gQWRkIFR4IGNoZWNrc3VtIG9mZmxvYWQgc3VwcG9ydGVkIGJ5IFRPRSBmb3IgSVB2
NCBhbmQgVENQL1VEUC4NCj4gPg0KPiA+IEZvciBUeCwgdGhlIHJlc3VsdCBvZiBjaGVja3N1bSBj
YWxjdWxhdGlvbiBpcyBzZXQgdG8gdGhlIGNoZWNrc3VtDQo+ID4gZmllbGQgb2YgZWFjaCBJUHY0
IEhlYWRlci9UQ1AvVURQL0lDTVAgb2YgZXRoZXJuZXQgZnJhbWVzLiBGb3IgdGhlDQo+ID4gdW5z
dXBwb3J0ZWQgZnJhbWVzLCB0aG9zZSBmaWVsZHMgYXJlIG5vdCBjaGFuZ2VkLiBJZiBhIHRyYW5z
bWlzc2lvbg0KPiA+IGZyYW1lIGlzIGFuIFVEUCBmcmFtZSBvZiBJUHY0IGFuZCBpdHMgY2hlY2tz
dW0gdmFsdWUgaW4gdGhlIFVEUCBoZWFkZXINCj4gPiBmaWVsZCBpcyBI4oCZMDAwMCwgVE9FIGRv
ZXMgbm90IGNhbGN1bGF0ZSBjaGVja3N1bSBmb3IgVURQIHBhcnQgb2YgdGhpcw0KPiA+IGZyYW1l
IGFzIGl0IGlzIG9wdGlvbmFsIGZ1bmN0aW9uIGFzIHBlciBzdGFuZGFyZHMuDQo+ID4NCj4gPiBX
ZSBjYW4gdGVzdCB0aGlzIGZ1bmN0aW9uYWxpdHkgYnkgdGhlIGJlbG93IGNvbW1hbmRzDQo+ID4N
Cj4gPiBldGh0b29sIC1LIGV0aDAgdHggb24gLS0+IHRvIHR1cm4gb24gVHggY2hlY2tzdW0gb2Zm
bG9hZCBldGh0b29sIC1LDQo+ID4gZXRoMCB0eCBvZmYgLS0+IHRvIHR1cm4gb2ZmIFR4IGNoZWNr
c3VtIG9mZmxvYWQNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gWy4uLl0NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gPiBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gPiBpbmRleCA1OWM3YmVkYWNlZjYuLjNjNzQ4YTU0
ZmFlMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJf
bWFpbi5jDQo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4u
Yw0KPiA+IEBAIC0yOSw2ICsyOSw3IEBADQo+ID4gICNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5o
Pg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L21h
dGg2NC5oPg0KPiA+ICsjaW5jbHVkZSA8bmV0L2lwLmg+DQo+IA0KPiAgICBXaGF0IGRvIHlvdSBu
ZWVkIGZyb20gdGhhdCBoZWFkZXIsIEJUVz8NCg0KSXQgaXMgZ2l2aW5nIGNvbXBpbGF0aW9uIGVy
cm9yIGZvciBpcF9oZHIoKSBhbmQgdWRwX2hkcigpLg0KDQo+IA0KPiBbLi4uXQ0KPiA+IEBAIC0x
OTkwLDYgKzIwMDEsMzkgQEAgc3RhdGljIHZvaWQgcmF2Yl90eF90aW1lb3V0X3dvcmsoc3RydWN0
DQo+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ICAJcnRubF91bmxvY2soKTsNCj4gPiAgfQ0KPiA+
DQo+ID4gK3N0YXRpYyBib29sIHJhdmJfaXNfdHhfY2hlY2tzdW1fb2ZmbG9hZF9nYmV0aF9wb3Nz
aWJsZShzdHJ1Y3Qgc2tfYnVmZg0KPiA+ICsqc2tiKQ0KPiANCj4gICAgSSdkIHN1Z2dlc3Qgcy90
aCBzaG9ydGVyIGFuZCBtb3JlIGNvbnNpc3RlbnQgd2l0aCB0aGUgdXNlZCBuYW1pbmcsIGxpa2UN
Cj4gcmF2Yl90eF9jc3VtX3Bvc3NpYmxlX2diZXRoKCkuLi4NCg0KT0suDQoNCj4gDQo+ID4gK3sN
Cj4gPiArCXN0cnVjdCBpcGhkciAqaXAgPSBpcF9oZHIoc2tiKTsNCj4gPiArDQo+ID4gKwkvKiBU
T0RPOiBOZWVkIHRvIGFkZCBzdXBwb3J0IGZvciBWTEFOIHRhZyA4MDIuMVEgKi8NCj4gPiArCWlm
IChza2Jfdmxhbl90YWdfcHJlc2VudChza2IpKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiAr
DQo+ID4gKwkvKiBUT0RPOiBOZWVkIHRvIGFkZCBIVyBjaGVja3N1bSBmb3IgSVBWNiAqLw0KPiA+
ICsJaWYgKHNrYi0+cHJvdG9jb2wgIT0gaHRvbnMoRVRIX1BfSVApKQ0KPiA+ICsJCXJldHVybiBm
YWxzZTsNCj4gDQo+ICAgIFNvIG1heWJlIHdlIG5lZWQgdG8gcmVwb3J0IGp1c3QgTkVUSUZfRl9J
UF9DU1VNLCBub3QgTkVUSUZfRl9IV19DU1VNDQo+IEFUTT8NCg0KSSBhZ3JlZSwgYXQgdGhlIG1v
bWVudCB3ZSBhcmUgc3VwcG9ydGluZyBvbmx5IElQdjQgQ2hlY2tzdW0gb2ZmbG9hZC4NCkxhdGVy
IHdoZW4gd2UgY2FuIHJlaW50cm9kdWNlIE5FVElGX0ZfSFdfQ1NVTSB3aGVuIHdlIGFkZCBzdXBw
b3J0IGZvciBJUHY2Lg0KDQo+IA0KPiA+ICsNCj4gPiArCXN3aXRjaCAoaXAtPnByb3RvY29sKSB7
DQo+ID4gKwljYXNlIElQUFJPVE9fVENQOg0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSBJUFBS
T1RPX1VEUDoNCj4gPiArCQkvKiBJZiB0aGUgY2hlY2tzdW0gdmFsdWUgaW4gdGhlIFVEUCBoZWFk
ZXIgZmllbGQgaXMg4oCcSOKAmTAwMDDigJ0sDQo+IA0KPiAgICBVc2UgMHgwMDAwIG9yIGp1c3Qg
MCwgcGxlYXNlLiBJIGRvbid0IGtub3cgd2hlcmUgUmVuZXNhcyBmb3VuZCB0aGlzDQo+IHdlaXJk
IGhleCBub3RhdGlvbi4uLg0KDQpPSy4NCg0KPiANCj4gWy4uLl0NCj4gPiBAQCAtMjAwNSw2ICsy
MDQ5LDExIEBAIHN0YXRpYyBuZXRkZXZfdHhfdCByYXZiX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1
ZmYNCj4gKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYpDQo+ID4gIAl1MzIgZW50cnk7DQo+
ID4gIAl1MzIgbGVuOw0KPiA+DQo+ID4gKwlpZiAoc2tiLT5pcF9zdW1tZWQgPT0gQ0hFQ0tTVU1f
UEFSVElBTCkgew0KPiA+ICsJCWlmICghcmF2Yl9pc190eF9jaGVja3N1bV9vZmZsb2FkX2diZXRo
X3Bvc3NpYmxlKHNrYikpDQo+IA0KPiAgICBJJ2QgY29sbGFwc2UgdGhvc2UgMiAqaWYqIHN0YXRl
bWVudHMuLi4NCg0KQWdyZWVkDQoNCkNoZWVycywNCkJpanUNCg==

