Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14BC33D3D29
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jul 2021 18:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhGWP1l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jul 2021 11:27:41 -0400
Received: from mail-eopbgr1400122.outbound.protection.outlook.com ([40.107.140.122]:56449
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230301AbhGWP1k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jul 2021 11:27:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go0mT+mObcNsrOcwgy9LXDCBD9O44Y/5qFpcOE/Drg/UCl6AfOGseCAYoS26YbTuaceAgglbWzcoMcLl0mPEJV+YbVQ1v+ulJXR41pGpzVT/po4voZ5DNgsCmQoc7jFYsXbfQl2pBLx45S7QDcV9ru9ANgpSMLJnWeqK454UtPK+JrW5CKMvzbN9OQjFhtXl0VhPEbFx+GoQnjKrFBOlErtk96k+Jidf0T8lCEdgLKv617RkqcWzL6aEkpYJ3/KE8ArWr8SbUgYpoeKQTCcU0vQByS6TD+xLcmhTzZu3NAMwhsgdoZKDYx+AwCXy5GE36fQTcXe4ZbOhwMr36JEtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wWp9sPNxF/Y4t1Wg/nkfdb9xwaKKyF9A4CfHunoEKk=;
 b=NTdtR+9UtEje8NZdOf4iKq4BiA9czwNkHhwJLbZ8Ln4NH9xUDJcZLU3wE/GIIonm8G58hbjD6xymFwqNT+0orqz5ghDA898LpTa6aFT7I6LkXWL1wjXxkriq4PAB6M3mSMV/2DN+5rJTlzEFl2+SwC47qk/7qbayrh6Ffnw+xXrp7cw3Kbzf83xH3so7Kykmq61s4npKZMc4WCRcG4R1Mu1rwj2V7He1zbq0/LpS+0OZMsFKKVI3x4l+tEVXMharMLd5wB1nP8/YFMjZqlx5ElJhePPNss5B87C4UhbrmiT+6rOGHeE6/i8OlSOlFLannu42OI8qBprd9ro8S9mFhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wWp9sPNxF/Y4t1Wg/nkfdb9xwaKKyF9A4CfHunoEKk=;
 b=Gr9E4LiBaKw7LdRorFFlvYJVMMpUp3ga8U8Z+3Ps05A5XQwHtCnNCF1xzzvn5LGOZVR65+uMVeLXRW0LCWfX6iSefTno6pWiBlhirtIWVs18MFyfHvEu3CiOaiFeXwwKnwt6ykKBjWitha2u06sjmJwdHBbvsqhQ6i8eTTA4LhI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6209.jpnprd01.prod.outlook.com (2603:1096:604:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 16:08:10 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 16:08:10 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: rzg2: Add internal rx delay
Thread-Topic: [PATCH] arm64: dts: renesas: rzg2: Add internal rx delay
Thread-Index: AQHXflsnYeOcD3IFRkSiTTv4CyKaCqtQsGYAgAAEDSCAAAaVgIAAAI0A
Date:   Fri, 23 Jul 2021 16:08:09 +0000
Message-ID: <OS0PR01MB5922733763F62FE77D25CA9F86E59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210721180632.15080-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWMB8o=GuvOtzBg6w6m3C030wu7-btT+FJ-dAZgNK3xsQ@mail.gmail.com>
 <OS0PR01MB592299E2554B073C582F29BE86E59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVD41xHG+4msRm1F8FScLraJJ7EFaadczvx3nXKtq3XVg@mail.gmail.com>
In-Reply-To: <CAMuHMdVD41xHG+4msRm1F8FScLraJJ7EFaadczvx3nXKtq3XVg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39e429aa-3f9f-46d6-887f-08d94df410f5
x-ms-traffictypediagnostic: OS3PR01MB6209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB6209482285ACFB6C0A20226B86E59@OS3PR01MB6209.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mmeWHBrZUORT7kq0z67chvEsVYkgJ8JHOVBBJZRoH7rNeN/K1564eNJgTv1ISKFTM11EAYkqXtvSm2fneqbBAHQdden0GJHuxtSi6SQHYkk9w8J7JORDX5LXhN++F4oGM4VG7xyKoLhcyEv3KoascHVrQbKBh8iDodnORe98OKaC3leKfYPkP9J7nT3gAuVSa6QLhph/swbMo/im/ZzaaJkob7XtUKBox8IpeBOitFDSzN4W9eFG6n4LLSgCoAnf4S8TYFCMg7TTZB5G/pLmRoPHLIu6f/2HbI56y+0Xq/EoZTVncuHmdFaLHvVrkHhZsI6N6NDlTh7EykCAB3aT1XaQSl0c0A7tRvvU9umtaPaxr3YFRjzUdaeGAhSrNb1btJha+x4Q+vkC8evKx8qhfVRM6MM3WEVJOfcvsOizV+IjibnyIIOdqPpvE+PnKTewcR+YwaSXiTPWmH9JhG5YMW8hrzMMnRjxaCjcGurzAq2SC7mQWmGSDHGv9B77osaJ9IZbTnFyjVt8SxlRqSMgNLrn0my+bvnKa68oNf9EtSzhnZbfqDq0M7gbQpTSs/TohuQDsB4YUICIo/nhJvSXwvlRpYMpmDPdPSr4XUcvnb9cobiQ5Ak+SAVyoD6sH/HjCtrGJT1qi5BA8Onr2UKZUc9brulw+bx7UxEW91zlGdbZ/uNaYBxbWzGEmDCC6k7TPgkPobEMTabZkeb7hsUkug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(39850400004)(376002)(136003)(76116006)(66946007)(66446008)(83380400001)(66476007)(122000001)(86362001)(66556008)(64756008)(33656002)(107886003)(4326008)(6506007)(7696005)(38100700002)(9686003)(53546011)(52536014)(54906003)(71200400001)(316002)(5660300002)(2906002)(6916009)(8936002)(8676002)(186003)(55016002)(26005)(478600001)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bURxWnRuUXhTcmk2N1IvbmxDbVRFMC9pNTFaYTBLNkhJUXNlcG9CZVZBaWRT?=
 =?utf-8?B?Rlp0dVBjTkxvdTZnNHpKS1BpNHFYYkFvY1VQTmFyWDVrcVIrangzcXZ3dU8x?=
 =?utf-8?B?ZlV4T0FqcFducG5JM2ZjK0pHSmpyU09LMHRzSlhzZFhwc1hhbjlQWDJBL1pk?=
 =?utf-8?B?K1RUdTd2Z05WR1FqdkR2SmxKZnIrd3lUZndOamhoM0xMWjVXTlFhOEpPVjh0?=
 =?utf-8?B?dWtxNWx0VG5aZUF2TlFHVnZrbFJLNVlBVHV6djI5aktMRXpMbDh0WWEzTmxL?=
 =?utf-8?B?M2hXbTNvTFB1dDgzcnVPakgrNmN6OGJOOGI4SjlkQUErOGtUTHlKeWNFYitI?=
 =?utf-8?B?eEJicUR0UklNMTYyK1lVQ1dXcG13Y0ZSeWoxbi94S1ZJaVJ5bm9SOVhObDRk?=
 =?utf-8?B?N1FKbmZPZzcrZHRNWlNMdFlFWk1yMWREUzBxcVlsamVVdnFqRUY2OVNibGJy?=
 =?utf-8?B?YWdvSURVcGdHb3hoWUhlOGVPZHFiVk9haU5ocVRwTzFKUitSckQ0eFNtWk1W?=
 =?utf-8?B?YXlaaE9iVlBVWXE1YVBJV0FReFNsemkvWTBYaTg3bWVIZnhVMlJYZ3lDZjNa?=
 =?utf-8?B?TmQrSjNPUnhWNFVicnlNODkyWHJHeVovc0JtcEp6dTZ6cy8rMjdxU2w1VEhp?=
 =?utf-8?B?K3V0NXM3ejhpang0d1RlY0JXNGNKd3NZdC9JYzNmQllBbTc0RXc1VFF6MEdM?=
 =?utf-8?B?Nzg2aWxwcmw5NzQ2K0hPcE5kV1k3Yk56TUtTOVJHb1BuZ3A3UEdRRWw5QUtW?=
 =?utf-8?B?T0Q1blZiclkzT21NMHJ5K3RXSEIzM2ViZUdHK3pQeTZYUnAzY0N0MlBFSlUx?=
 =?utf-8?B?YmNHSTZsTUpuOWJZRnZTK3I2bkswTklxTXJROUoremRrVUJzcDhTSXBQMEFG?=
 =?utf-8?B?QXdkUUVQVVBlTUFpMGdIRTU4a2FOSDAyZXVLVjZXV3d2ZnNoTytIRm1ZeUpB?=
 =?utf-8?B?YWZzS0pDSjh5S2ZLN25vdkNGOHVieFRsZUt1U05vOVBIZnVVMW0vODJ6TE4y?=
 =?utf-8?B?YzVkZzJJcWt0cSttYjZqcmFOYTI0Ynpmc3V3d1JvYU5taUJBckJYSU9kdmRU?=
 =?utf-8?B?RmxkVkUwWjNwbWpNbnRIc3QzMHpGR2hNWlJ4MTBHVGN0SXF1b0s5Wk16bk0z?=
 =?utf-8?B?b1ZIK3d6bGVSYXBhaFR6Q1gyVDAvMC9DdnNDZU9zOTI4MHJsVTBuWHFMQTZZ?=
 =?utf-8?B?UHZqOEJBTkNMQ3hJcHhxR0JhbVNNRHI4WFh4MmdVZUtZN044L2hrSDlyNWJ5?=
 =?utf-8?B?clJiVmY3SlF5M2FHQnJ1NXk4bjlxRmFsZXp1SlBuU2o0ZGVlL3gzRFR5bHph?=
 =?utf-8?B?aXU0RmdMRjg0S2MvU1dIcm5yMnllUEM2RVRyRlF6WTliYmFrY252aUFGZXY3?=
 =?utf-8?B?dm9QWERDblc0ZFQxUjJBcXRibjZyL2REN3B3Tm1TdUo4VnFRWjd3NDBVUFlk?=
 =?utf-8?B?WloxbGJ5bFRqRy95cTZKM3NJZ0M0NmYxVXJISVVBRFNqTmpmVjJHOGtIU0NX?=
 =?utf-8?B?NmE1Q01qUkhHcWY4NVNVWEg2SndXU3dWWmtOUVphL3REUXRPZUtlVXhOb1Zh?=
 =?utf-8?B?QzhGc0M2K1VjSDFmSnVLQWFDSHA1ZCtZbHl4dGlHQ0xSMHU4VUtGWXlxaCtP?=
 =?utf-8?B?Um1QWDZJWVhpKzBveU9CRE9iSUV3a2lOdld0YjViQkRBZGRKcTZ2Ny84QldZ?=
 =?utf-8?B?R2kxMXVpQzZReFNzcGFOMGNsMEFJU0dOVUtpeExNR09kRTVtQXdtZGFoZTZX?=
 =?utf-8?Q?+RvT29dGkI+T+A+OUwje2S+IqQcofE7EmpnRLn/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e429aa-3f9f-46d6-887f-08d94df410f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 16:08:09.9590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AeQtiKIGJZkHOY8xpJTE0RTNS40ARRJriw8pr/u/zs1XNeIhjB9U5mC/rKBvdqm1YBEtLJh7OMOaGm5Ai7kioQx397kaxkRg2asq8dS2RfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6209
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjMgSnVseSAyMDIx
IDE3OjAxDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENj
OiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWFnbnVzIERhbW0gPG1hZ251cy5k
YW1tQGdtYWlsLmNvbT47DQo+IExpbnV4LVJlbmVzYXMgPGxpbnV4LXJlbmVzYXMtc29jQHZnZXIu
a2VybmVsLm9yZz47IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFDQo+IEFORCBGTEFUVEVORUQgREVW
SUNFIFRSRUUgQklORElOR1MgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgQ2hyaXMNCj4g
UGF0ZXJzb24gPENocmlzLlBhdGVyc29uMkByZW5lc2FzLmNvbT47IFByYWJoYWthciBNYWhhZGV2
IExhZA0KPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcyOiBBZGQgaW50ZXJuYWwg
cnggZGVsYXkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIEp1bCAyMywgMjAyMSBhdCA1
OjUyIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+
ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcyOiBBZGQg
aW50ZXJuYWwgcngNCj4gPiA+IGRlbGF5IE9uIFdlZCwgSnVsIDIxLCAyMDIxIGF0IDg6MDYgUE0g
QmlqdSBEYXMNCj4gPiA+IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3Rl
Og0KPiA+ID4gPiBIaWhvcGUgYm9hcmRzIHVzZSBSZWFsdGVrIFBIWS4gRnJvbSB0aGUgdmVyeSBi
ZWdpbm5pbmcgaXQgdXNlIG9ubHkNCj4gPiA+ID4gdHggZGVsYXlzLiBIb3dldmVyIHRoZSBwaHkg
ZHJpdmVyIGNvbW1pdCBiYmM0ZDcxZDYzNTQ5YmNkMDAzDQo+ID4gPiA+ICgibmV0OiBwaHk6IHJl
YWx0ZWs6IGZpeCBydGw4MjExZSByeC90eCBkZWxheSBjb25maWciKSBpbnRyb2R1Y2VkDQo+ID4g
PiA+IE5GUyBtb3VudCBmYWlsdXJlLiBOb3cgaXQgbmVlZHMgcnggZGVsYXkgaW5hZGRpdGlvbiB0
byB0eCBkZWxheQ0KPiA+ID4gPiBmb3IgTkZTIG1vdW50IHRvIHdvcmsuIFRoaXMgcGF0Y2ggZml4
ZXMgTkZTIG1vdW50IGZhaWx1cmUgaXNzdWUgYnkNCj4gPiA+ID4gYWRkaW5nIE1BQyBpbnRlcm5h
bCByeCBkZWxheS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IFJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiBpLmUuIHdpbGwNCj4gPiA+
IHF1ZXVlIGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY1LjE1Lg0KPiA+ID4NCj4gPiA+IERvIHlvdSB3
YW50IGEgRml4ZXM6IHRhZz8NCj4gPg0KPiA+IEl0IGlzIGEgdHJpY2t5IHNpdHVhdGlvbi4gVGhl
IHBoeSBwYXRjaCBpcyBpbnRyb2R1Y2VkIGluIDUuOSBhbmQgaXMNCj4gYmFja3BvcnRlZCB0byA1
LjguDQo+ID4gQnV0IHdlIGRvbid0IGhhdmUgTWFDIGludGVybmFsIGRlbGF5cyBvbiB0aG9zZSBr
ZXJuZWxzLiBTbyBGaXhlcyBmb3INCj4gPiA1LjEwKyB3aWxsIGJlIG9rIEkgZ3Vlc3MsIFNvIHRo
YXQgYXQgbGVhc3QgdGhpcyBmaXggd2lsbCBsYW5kIG9uIGNpcA0KPiA1LjEwIGtlcm5lbC4NCj4g
DQo+IEZpeGVzOiBiYmM0ZDcxZDYzNTQ5YmNkICgibmV0OiBwaHk6IHJlYWx0ZWs6IGZpeCBydGw4
MjExZSByeC90eCBkZWxheQ0KPiBjb25maWciKQ0KPiANCj4gVGhlbiB0aGUgc3RhYmxlIHBlb3Bs
ZSBhcmUgYXQgbGVhc3QgYXdhcmUgdGhhdCBiYWNrcG9ydGluZyB0aGUgUEhZIGNvbW1pdA0KPiBj
YW4gY2F1c2UgaXNzdWVzLg0KDQpPSy4NCg0KPiBTbyBhZnRlciBpdCBoYXMgaGl0IHVwc3RyZWFt
LCB5b3UgY2FuIHNlbmQgdGhlIHBhdGNoIHRvIHN0YWJsZSB3aXRoIHRoZQ0KPiBmb2xsb3dpbmcg
YWRkZWQ6DQo+IA0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIDUuMTAueDogYTZmNTFm
MmVmYTc0MmRmMCByYXZiOiBBZGQgc3VwcG9ydA0KPiBmb3IgZXhwbGljaXQgaW50ZXJuYWwgY2xv
Y2sgZGVsYXkgY29uZmlndXJhdGlvbg0KPiANCj4gSSBob3BlIEkgZ290IHRoZSBzeW50YXggcmln
aHQuIEFuZCB0aGVyZSBtYXkgYmUgZGVwZW5kZW5jaWVzIHRvIGJhY2twb3J0LA0KPiB0b28uDQo+
IA0KPiBBcyB0aGlzIGRvZXNuJ3QgZml4IGFuIGlzc3VlIGludHJvZHVjZWQgaW4gdjUuMTMgb3Ig
djUuMTQtcmMxLCBJJ2xsIHF1ZXVlDQo+IHRoaXMgZm9yIHY1LjE1LiBDSVAgY2FuIHN0aWxsIHRh
a2UgaXQuDQoNClRoYW5rIHlvdS4gV2lsbCBwb3N0IHRoZSBwYXRjaCB0byBzdGFibGUgb25jZSBp
dCBoaXQgbWFpbmxpbmUuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+IEdye29ldGplLGVldGlu
Z31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcw0K
