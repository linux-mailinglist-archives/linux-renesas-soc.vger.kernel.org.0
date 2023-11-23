Return-Path: <linux-renesas-soc+bounces-189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F57F64AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 18:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AD561C20AD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 17:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB9F3E485;
	Thu, 23 Nov 2023 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GbD/Lhw7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1461A8;
	Thu, 23 Nov 2023 09:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fM+N5V/5YKVRys0VtvX+Vd/pCpLpXeLsrvK9CBMeSooQR/eSCpsZ0itrlxc/inpc+Ub2BEsmuMzIoLbEypzdHXVXyYETA2/twtNfa8JD51iYAhHi1PzRhiyReOCpSI2Xb+DjFAefu49v2My1/aiR+eXOxrYjFbrt0esVtNYnOVFYDUH2Re+I8NUeUwA5JOLKVLonwvy67fIXUpAOIQzMJvu7R0rtTIEgm4LgrBaFf1VWjn3ReeM4/6j9PChVUOPAwihY7oZ4HrBHT8slT3P6eg47Jtgmudm5rxJMMIyP4lKqiKVTzYQXuesUU0AqRvbn7VccSDveSIFhHMmrTe53Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNXE4XPkSoDbU0cDI01zPB1MhsxETSGSBpKoX4DcUkI=;
 b=nJqfQodEEQd4oVkh4iYeMCPNtLAKSTuJ25uoCSoJKeEs0kv87/57ZOuvOWaKryy/6eHLI0g4yXM1VZG60ovia1v1cuoxRjrZEDm4t3bUER8YHfb5AqhzJasvdyDlSPa0aPJrRmOk8LqF28hEwbG+yB+vY6e94Ighi5PTAJzDJRc1wdDNTlk9dafSDLAg/t85uhZgyQhk+Nb70rLMKqvXFCaizYnaZ3agImNxo8YMgOa7sQv3CgS8qGa0KuLxmuhTT7wR04grxyHn55taqK1kZFihOAD8g3WWS1R20vysOjB8ec80tCZFeCsGFh66i0mk2de61lyIH8mKLE4JehPCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNXE4XPkSoDbU0cDI01zPB1MhsxETSGSBpKoX4DcUkI=;
 b=GbD/Lhw7FsDzx4LoskLvNPZMXhxVeu6VPkTYSBiE9gyqQrVyFaZ5DHhhD1gW8SCyxVFLP1GowvpQ1P61V2Nlks1RkuqZbrVJFePvNyFVmxb3RjM8qVMa8TsCu2pWoWXmbR+si9GcsmekMd2mYJRMCvU3JvdsKGHW7JddY6YE8UI=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by TYCPR01MB5934.jpnprd01.prod.outlook.com
 (2603:1096:400:40::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 17:02:51 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310%7]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 17:02:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, Masaru Nagai
	<masaru.nagai.vx@renesas.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH 06/13] net: ravb: Let IP specific receive function to
 interrogate descriptors
Thread-Topic: [PATCH 06/13] net: ravb: Let IP specific receive function to
 interrogate descriptors
Thread-Index: AQHaG44QUS+I6liACEqT0EASDs/QzbCIH5OAgAAC0rCAAAIBgIAAAKew
Date: Thu, 23 Nov 2023 17:02:51 +0000
Message-ID:
 <TYVPR01MB11279EBEB12BC80D1D572249C86B9A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120084606.4083194-7-claudiu.beznea.uj@bp.renesas.com>
 <b626455a-f7a4-2684-725c-c679dd75a515@omp.ru>
 <TYVPR01MB112791203FFACF4484A9EAC4E86B9A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <874ab7c1-19b4-bee1-9473-cfa6e37a8efc@omp.ru>
In-Reply-To: <874ab7c1-19b4-bee1-9473-cfa6e37a8efc@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|TYCPR01MB5934:EE_
x-ms-office365-filtering-correlation-id: 68c1a20c-eb8f-4b16-1865-08dbec460749
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FHHpA4D0QJ/6h0q9bZOQZkC4QhPBRI8IbZJNZJXzHPAgYNA27DbnBAPm0b+qry24OvPg76LXpamocppsLZiTfXNp/5k+v7pWYAIl00keG5UKXuKUJ23uu2YdRcWJvYDd92SgwdHqeboqfN4ouW//YJrjzx61gP2NskA70VPMnyKwMJ83FRKwmGPj6VjorGOTigVe1cbrpzZtkoMD1Uc5jBklJdcY0LC5VZ/KTE7/CwqXrD+btLqX+s7TNBaZ8rRV+6hZyBFo6FcgX3W6JJ1z2h3yX45S48R314lORJvl9rTjBVebM6rWJTreqPV+jW4kn9DT4HCAXdSi1FGq0U7G9lUl9e1Mk61FHOywbwzahXFQoSGl/W7ytc0nwsABKff9Zb70yRgV9QKHv2O0m7lIMe37BlwNvalU2k7a9/m4y+naYV0Fr+3LKsBzGhZYnwPS3VikTs6hAocjrBLd7XW29f+F8BkpYJFaS8fBlk+mOdn3R9Y2NUpRpYrwIbREwMEm2mavz04PF4OS7tLq1w1HaD05iFlq7Ki/nm5ua6isQb0PyylydDcpfQ9EJIzckuI8jUNs7huzt5xGo+GJyXVmoHEgMIRkBNiNYam61Pqd5meljUqLCM92LqNla++vwqSwtBCeIC7r+qdbhiBAkbKu/w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(396003)(366004)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(107886003)(53546011)(26005)(7696005)(9686003)(71200400001)(38100700002)(4326008)(8936002)(8676002)(5660300002)(52536014)(41300700001)(6506007)(2906002)(7416002)(478600001)(54906003)(64756008)(316002)(66476007)(110136005)(66446008)(76116006)(66556008)(66946007)(86362001)(33656002)(122000001)(921008)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3ZoVkJlMVlhbk9nYUhXcU5UNXVicDVBdHV6d3NjdFZyREpSWTRjdkN5SVFa?=
 =?utf-8?B?QWxUbzZQV1ZvV2NzdS9sZWdSY0l3WnVKUVpTU3FZQ1E1SThnOCt6WmNmVG1D?=
 =?utf-8?B?K2tQUnF1VHNPbmYweDRNaXo2aVZ1cnQwQXE0d3kzd3BISCs2SnBod3FLeDVP?=
 =?utf-8?B?K0NkTGFPV2tMb1UrWXFXMzZ4UmQ4eUY1bG4xZU92akROc2M0cHgxWW9RN3ZK?=
 =?utf-8?B?Z3dmTVRabHkyelF5M3VmMmltWCtrQmg1cXhLSTQ4WmRTQitUa3VuL3NaMVNv?=
 =?utf-8?B?alJTTEhGSmE2ekpSQUJGQmRMeDc0eVAzSDdIbWhRQ0VzQnNvM2ZxTlNqcElx?=
 =?utf-8?B?djdaMlJPZkNRbjZiL2g3S1VpckRwYzNYUHNyZ0QyeVdtcitoSUFnSG5od3I5?=
 =?utf-8?B?UmtYRWRlYnNKUGU1cjdGa3Z5dDVGNUNpdnBSdUNXbnhORUVFSUpkTkdrelp2?=
 =?utf-8?B?OHhRS1RTMFdNTnNoLzFOdlVVcTRHN2tkNzZhbytKZ1ZRWG1lYzJxanM0cklm?=
 =?utf-8?B?Zzd1cWQ1ZTRrYmFpZEJvUGdoNjVjWTJYY3hyZUcvQXVLbWFla1c4MDUxbm5w?=
 =?utf-8?B?eUhKQS9BNHpsMlJpcjZvS2NJbGFYcCtzMUVBcXRwd3orTjVWUDZiQTZWTlhM?=
 =?utf-8?B?Q09HVVloTUNLTzh2R0RzTStTVi9IVWNNZTBRVFEwSGhWODMzNGlsSWZHZmY2?=
 =?utf-8?B?Y3lMcHJCZG1DM01SaUp4eStJeHBVazFjcU1oZGx6NE5SWEFxMjhiMlQ0dHV6?=
 =?utf-8?B?U08vcWdMdnp6TmRkMVRMckxLc1FzdHFrVjhSSXV2Y0V3TnNJb0drMXpZWExz?=
 =?utf-8?B?a3Y0SDIybTNtZWJlLzBKdkhrcjh2Z09wU3BFcWdxQzRzQ1R3YW4rdFBMMG5x?=
 =?utf-8?B?QVBYR2F5QjRsVUdWZzRpVkkxM3NFTkJJNHNPNndiczNDZzV2RE42ZGxqLzBN?=
 =?utf-8?B?aFpOYnVZcnVPZmx4UzFwaTZKZDFiR1RNMWh3ZW90WDhNemZTVEk5NDJEak04?=
 =?utf-8?B?a0svaVBDWEh1amVmc3lYNzQ2a2J3cG5teTBhRFZVdU8xblA1RkdoYm15d29D?=
 =?utf-8?B?UGFmdGs5VGtzOXpwb3MreWNXbnRWcDVKQThGYytlQXE0TlphM2ZlWFBGa2xG?=
 =?utf-8?B?QXBqZUYrTkFOSFgwcTdNdWpGVytwTHVuZkJzTjdqbkhnSnppSURBZzRndmZ6?=
 =?utf-8?B?SmFpbGhVVC84SU5OeXlhTU4wSm1HYThoUlRFcCtSNUhneXF4K0t5UWQ1OXJl?=
 =?utf-8?B?ODE4Ulk0ODdHZUh2NnVWYjNIc2VZbVV2RU5zVitwWTh0TVkzNExlVUJMM1Iz?=
 =?utf-8?B?dTVZNDBxSnp2aFJOclk3cUtjUFlsTUxVbGJ4WHhNc1h1L0tWZjFUN3FlMy82?=
 =?utf-8?B?bjRlSDRGL05rODREK0ZRa3VzVllKL3pjMFAxNXJRWDU2bmUxR250alYreGM2?=
 =?utf-8?B?TGw5c2dMOGxiSFBsejlFMGVzZ0lVaXkvTUhtLzNDV1NMY29lTkpzRDV6RGFq?=
 =?utf-8?B?Nm5MdjlBakd6b0V2T0xqV21sSWxvNEFtRFowU0k3Ym41SWFlaFJnODQ3bkYv?=
 =?utf-8?B?QjM0bkYvbnhEaFF1VE9zYWxQZmwyWm1KbDB3YUswVlBZZ2IrWGlDa3d1VGFX?=
 =?utf-8?B?QlFWamVFbStGV0VFaVNlenhFQjVhOWIrZEF5eGFXNXdwaGFxUEI0ME5HQ0ta?=
 =?utf-8?B?aitLLzRNb3JUcnNQVU5sN3BDamxINGIzb3g3WUNreUJBQXI0azdUYmR4Vmpo?=
 =?utf-8?B?aVV5UTRqY050bFNBblBGcHA4L3NkNDZoWU0reGZOcWl2eE5iUExBVGF5V1du?=
 =?utf-8?B?K201RVNncjVZbnd2SzdUK3pWdVVSYWRGMU40RDh6QmJRTW0reTRPK1psT3U5?=
 =?utf-8?B?T3o1WmczVmZLRlo1RjZ1S2ZqWjFlbXV5MHl5Rit2SmdWNzViRTQ5QWdySXR5?=
 =?utf-8?B?QW1HVHBTNGZiUC9nN0xIZ3huR0QrU0dTQ05OZGRRaFkyNUxmcEdJc0Y4cmtP?=
 =?utf-8?B?cnlUOVNFUHBVSThsSTNVbHkvaXF0dEhiNnNiNmd0WGtDSldLcWhYbEd6Tm9N?=
 =?utf-8?B?VzkxSElmcmlPQ21ZN0Y0L2FmNE1qRE44TFhsZm1QSGszRHF0VFNPby9ycDhn?=
 =?utf-8?B?akJFNmwrN3JJdUNzOVR2cnZNOEp4aVhFSjd3V294eEIwOEIrNWhndDlRR2ox?=
 =?utf-8?B?VHc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c1a20c-eb8f-4b16-1865-08dbec460749
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 17:02:51.6657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +YqsqF3NyTLBP5yb5nJrYEd45bIvsHeN3HULwrRpb4UI1mAWPWKvK5IJLiJp/LKMJs/H5G9VmzkiOx+IqT4aErY13b5dmh46g7l0I83AXb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5934

SGkgU2VyZ2V5IFNodHlseW92LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDYvMTNdIG5ldDog
cmF2YjogTGV0IElQIHNwZWNpZmljIHJlY2VpdmUgZnVuY3Rpb24gdG8NCj4gaW50ZXJyb2dhdGUg
ZGVzY3JpcHRvcnMNCj4gDQo+IE9uIDExLzIzLzIzIDc6NDggUE0sIEJpanUgRGFzIHdyb3RlOg0K
PiBbLi4uXQ0KPiANCj4gPj4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51
akBicC5yZW5lc2FzLmNvbT4NCj4gPj4+DQo+ID4+PiByYXZiX3BvbGwoKSBpbml0aWFsIGNvZGUg
dXNlZCB0byBpbnRlcnJvZ2F0ZSB0aGUgZmlyc3QgZGVzY3JpcHRvciBvZg0KPiA+Pj4gdGhlIFJY
IHF1ZXVlIGluIGNhc2UgZ3B0cCBpcyBmYWxzZSB0byBrbm93IGlmIHJhdmJfcngoKSBzaG91bGQg
YmUNCj4gPj4gY2FsbGVkLg0KPiA+Pj4gVGhpcyBpcyBkb25lIGZvciBub24gR1BUUCBJUHMuIEZv
ciBHUFRQIElQcyB0aGUgZHJpdmVyIFBUUCBzcGVjaWZpYw0KPiA+Pg0KPiA+PiAgICBJdCdzIGNh
bGxlZCBnUFRQLCBBRkFJSy4NCj4gPj4NCj4gPj4+IGluZm9ybWF0aW9uIHdhcyB1c2VkIHRvIGtu
b3cgaWYgcmVjZWl2ZSBmdW5jdGlvbiBzaG91bGQgYmUgY2FsbGVkLg0KPiA+Pj4gQXMgZXZlcnkg
SVAgaGFzIGl0J3Mgb3duIHJlY2VpdmUgZnVuY3Rpb24gdGhhdCBpbnRlcnJvZ2F0ZXMgdGhlIFJY
DQo+ID4+PiBkZXNjcmlwdG9yDQo+ID4+DQo+ID4+ICAgIEl0cyBvd24uDQo+ID4+DQo+ID4+PiBs
aXN0IGluIHRoZSBzYW1lIHdheSB0aGUgcmF2Yl9wb2xsKCkgd2FzIGRvaW5nIHRoZXJlIGlzIG5v
IG5lZWQgdG8NCj4gPj4+IGRvdWJsZSBjaGVjayB0aGlzIGluIHJhdmJfcG9sbCgpLiBSZW1vdmlu
ZyB0aGUgY29kZSBmb3JtIHJhdmJfcG9sbCgpDQo+ID4+PiBhbmQNCj4gPj4NCj4gPj4gICAgRnJv
bSByYXZiX3BvbGwoKS4NCj4gPj4NCj4gPj4+IGFkanVzdGluZyByYXZiX3J4X2diZXRoKCkgbGVh
ZHMgdG8gYSBjbGVhbmVyIGNvZGUuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRp
dSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4gLS0tDQo+
ID4+PiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYyB8IDE4ICsrKysr
Ky0tLS0tLS0tLS0tLQ0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jDQo+ID4+PiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3Jl
bmVzYXMvcmF2Yl9tYWluLmMNCj4gPj4+IGluZGV4IDU4OGUzYmU2OTJkMy4uMGZjOTgxMGM1ZTc4
IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21h
aW4uYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4u
Yw0KPiA+Pj4gQEAgLTc3MSwxMiArNzcxLDE1IEBAIHN0YXRpYyBib29sIHJhdmJfcnhfZ2JldGgo
c3RydWN0IG5ldF9kZXZpY2UNCj4gPj4+ICpuZGV2LA0KPiA+PiBpbnQgKnF1b3RhLCBpbnQgcSkN
Cj4gPj4+ICAgICBpbnQgbGltaXQ7DQo+ID4+Pg0KPiA+Pj4gICAgIGVudHJ5ID0gcHJpdi0+Y3Vy
X3J4W3FdICUgcHJpdi0+bnVtX3J4X3JpbmdbcV07DQo+ID4+PiArICAgZGVzYyA9ICZwcml2LT5n
YmV0aF9yeF9yaW5nW2VudHJ5XTsNCj4gPj4+ICsgICBpZiAoZGVzYy0+ZGllX2R0ID09IERUX0ZF
TVBUWSkNCj4gPj4+ICsgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPj4+ICsNCj4gPj4NCj4g
Pj4gICAgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgdGhpcyBidXlzIHVzLCB0aGUgZm9sbG93aW5n
ICp3aGlsZSogbG9vcA0KPiA+PiB3aWxsIGJlIHNraXBwZWQgYW55d2F5LCBhbmQgdGhlICpmb3Iq
IGxvb3AgYXMgd2VsbCwgSSB0aGluay4uLiBBbmQNCj4gPj4gcmF2Yl9yeF9yY2FyKCkgZG9lc24n
dCBoYXZlIHRoYXQgYW55d2F5Li4uDQo+ID4+DQo+ID4+PiBAQCAtMTI3OSwyNSArMTI4MiwxNiBA
QCBzdGF0aWMgaW50IHJhdmJfcG9sbChzdHJ1Y3QgbmFwaV9zdHJ1Y3QNCj4gPj4+ICpuYXBpLA0K
PiA+PiBpbnQgYnVkZ2V0KQ0KPiA+Pj4gICAgIHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gbmFw
aS0+ZGV2Ow0KPiA+Pj4gICAgIHN0cnVjdCByYXZiX3ByaXZhdGUgKnByaXYgPSBuZXRkZXZfcHJp
dihuZGV2KTsNCj4gPj4+ICAgICBjb25zdCBzdHJ1Y3QgcmF2Yl9od19pbmZvICppbmZvID0gcHJp
di0+aW5mbzsNCj4gPj4+IC0gICBib29sIGdwdHAgPSBpbmZvLT5ncHRwIHx8IGluZm8tPmNjY19n
YWM7DQo+ID4+PiAtICAgc3RydWN0IHJhdmJfcnhfZGVzYyAqZGVzYzsNCj4gPj4+ICAgICB1bnNp
Z25lZCBsb25nIGZsYWdzOw0KPiA+Pj4gICAgIGludCBxID0gbmFwaSAtIHByaXYtPm5hcGk7DQo+
ID4+PiAgICAgaW50IG1hc2sgPSBCSVQocSk7DQo+ID4+PiAgICAgaW50IHF1b3RhID0gYnVkZ2V0
Ow0KPiA+Pj4gLSAgIHVuc2lnbmVkIGludCBlbnRyeTsNCj4gPj4+DQo+ID4+PiAtICAgaWYgKCFn
cHRwKSB7DQo+ID4+PiAtICAgICAgICAgICBlbnRyeSA9IHByaXYtPmN1cl9yeFtxXSAlIHByaXYt
Pm51bV9yeF9yaW5nW3FdOw0KPiA+Pj4gLSAgICAgICAgICAgZGVzYyA9ICZwcml2LT5nYmV0aF9y
eF9yaW5nW2VudHJ5XTsNCj4gPj4+IC0gICB9DQo+ID4+PiAgICAgLyogUHJvY2Vzc2luZyBSWCBE
ZXNjcmlwdG9yIFJpbmcgKi8NCj4gPj4+ICAgICAvKiBDbGVhciBSWCBpbnRlcnJ1cHQgKi8NCj4g
Pj4+ICAgICByYXZiX3dyaXRlKG5kZXYsIH4obWFzayB8IFJJUzBfUkVTRVJWRUQpLCBSSVMwKTsN
Cj4gPj4+IC0gICBpZiAoZ3B0cCB8fCBkZXNjLT5kaWVfZHQgIT0gRFRfRkVNUFRZKSB7DQo+ID4+
PiAtICAgICAgICAgICBpZiAocmF2Yl9yeChuZGV2LCAmcXVvdGEsIHEpKQ0KPiA+Pj4gLSAgICAg
ICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gPj4+IC0gICB9DQo+ID4+DQo+ID4+ICAgSSBkb24n
dCByZWFsbHkgdW5kZXJzdGFuZCB0aGlzIGNvZGUgKGRlc3BpdGUgSSd2ZSBBS0NlZCBpdCkuLi4N
Cj4gPj4gQmlqdSwgY291bGQgeW91IGV4cGxhaW4gdGhpcyAod2VsbCwgeW91IHRyaWVkIGFscmVh
ZHkgYnV0IEkgZG9uJ3QgYnV5DQo+ID4+IGl0IGFueW1vcmUpPw0KPiA+DQo+ID4gSXQgd2FzIGlu
aXRpYWwgdmVyc2lvbiBvZiB0aGUgZHJpdmVyLiBOb3cgQ2xhdWRpdSBvcHRpbWl6ZWQuDQo+IA0K
PiAgICBJIGZhaWwgdG8gdW5kZXJzdGFuZCB3aHkgeW91IGhhZCAoR0JFdGgtc3BlY2lmaWMpIHBy
ZS1jb25kaXRpb25zIGhlcmUNCj4gdG8gY2FsbCByYXZiX3J4KCkuLi4gYW5kIGludm9sdmluZyBn
UFRQIG9ubHkgZnVydGhlciBjb25mdXNlZCB0aGluZ3MuLi4NCg0KSW5pdGlhbCBkcml2ZXIgaXMg
YmFzZWQgb24gYSByZWZlcmVuY2UgY29kZS9ic3AgZHJpdmVyIGFuZCB0aGF0IGNvZGUgaGFzIHRo
aXMgcHJlY29uZGl0aW9ucy4NCk1heWJlIHRoZXkgaGF2ZSBmYWNlZCBzb21lIHJhY2UgY29uZGl0
aW9uIGluIHJ4IHBhdGggaW52b2x2aW5nIHJpbmcgYnVmZmVyL2Rlc2NyaXB0b3IuDQpCdXQgc28g
ZmFyIHdlIGFyZSBub3QgYWJsZSB0byByZXByb2R1Y2UgYW55IHJhY2UgY29uZGl0aW9uIGhlcmUu
IFNvIGl0IGlzIHNhZmUgdG8gcmVtb3ZlIG5vdy4NCg0KQ2hlZXJzLA0KQmlqdQ0K

