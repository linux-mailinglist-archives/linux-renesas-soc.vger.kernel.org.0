Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64617E37C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 15:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfD2NOx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 09:14:53 -0400
Received: from mail-eopbgr1410097.outbound.protection.outlook.com ([40.107.141.97]:14467
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725838AbfD2NOw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 09:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QP2n1i19/SsImnJVzVhLTA2L7uBNCx5q3TTJj3POarY=;
 b=TySbTLLQJb5qc+3Jj4oIepBW8Wp+UerfVv3PvgdaAuQWUrbsZmMwd799fvVORxjUKp/CM6mVtH+iZIyWlLima7U1171in+GvwRQuJfrfwYgUKw5c2xzWWp8dYxapbY9ZyYpokNRShz9WrNQNSCHsbC7NavGPBkcH80K0jFXmEt4=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1788.jpnprd01.prod.outlook.com (52.133.160.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 13:14:47 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 13:14:47 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/5] ARM: rskrza1: Add RZ/A1 IRQC and input switches
Thread-Topic: [PATCH 0/5] ARM: rskrza1: Add RZ/A1 IRQC and input switches
Thread-Index: AQHU/m8QhsbWkw/8AEW0pGxxlBRO8aZTCh5ggAAM4gCAAAQO0A==
Date:   Mon, 29 Apr 2019 13:14:46 +0000
Message-ID: <TY1PR01MB156221290E3CF7835CBAEEE28A390@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190429093631.10799-1-geert+renesas@glider.be>
 <TY1PR01MB15620A5958E5A9211518E0C48A390@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdUasEO1VLX1h5ZL8F2VjLXnSbrVOm6KdO6yuzkw9RWAfA@mail.gmail.com>
In-Reply-To: <CAMuHMdUasEO1VLX1h5ZL8F2VjLXnSbrVOm6KdO6yuzkw9RWAfA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7711ceaf-e991-48ff-73d4-08d6cca4a72b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1788;
x-ms-traffictypediagnostic: TY1PR01MB1788:
x-microsoft-antispam-prvs: <TY1PR01MB17884A61B49C549980C36DA78A390@TY1PR01MB1788.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(346002)(366004)(39860400002)(376002)(199004)(189003)(4326008)(3846002)(6246003)(6506007)(25786009)(53936002)(7416002)(74316002)(2906002)(305945005)(7736002)(97736004)(6116002)(52536014)(186003)(6916009)(102836004)(5660300002)(26005)(53546011)(316002)(54906003)(11346002)(446003)(6436002)(476003)(55016002)(229853002)(33656002)(486006)(8676002)(81166006)(81156014)(8936002)(66066001)(9686003)(256004)(71190400001)(66446008)(64756008)(66476007)(66556008)(66946007)(71200400001)(72206003)(73956011)(478600001)(76116006)(86362001)(68736007)(14454004)(7696005)(99286004)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1788;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rE2/bC4apupJ55+sKR45Iy6mnVoYtcnLIq3myggLORAf64htdhrxr5r7vZ4QXB87I8q7uegjVKnwzCJDWH2kEIZtTZfgr48i0YoemurNMvxm9im4v+35QvzX7KNwMfwD7b4HlfjLqHFsGbrabF2w0k+1gVVXovCL/GRfzt8maG0UvvV1awm9EuPWEY2N8V7lra0KStfkftZeF1TEj+7ePGGl0Dgp6wZXPrWPccBA+LzseFq63LE/CvgS7tKk7egsfy/uMmwRkbAV45u694GpO8HyBZ+zFpPamp6HloohiD3+IPco6SMmMi3V8qY5Gr4fZRLoKhHQ42eOHiyXqKKolgWPM94bc2IoxcAU6NkUJQSsgCbrHZARWiqfQ+20Y0HyiFpcez+RMEQCYKqnnpGtNSvIiNLMuIOB1HsVTFx8Gj4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7711ceaf-e991-48ff-73d4-08d6cca4a72b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 13:14:46.9038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1788
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIE1vbiwgQXByIDI5LCAyMDE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDI6MjEgUE0gQ2hyaXMgQnJhbmR0IDxDaHJp
cy5CcmFuZHRAcmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEkndmUgYmVlbiBoYWNraW5nIHRo
aXMgc3VwcG9ydCBpbnRvIHRoZSBzdGFuZGFyZCBHSUMgZHJpdmVyIGluIG91ciBCU1BzDQo+ID4g
Zm9yIHllYXJzIG5vdy4gOm8NCj4gDQo+IFllYWgsIGFuZCBoYXZpbmcgdGhhdCBwYXRjaCBpbiB5
b3VyIHRyZWUgYnJlYWtzIGFsbCBvdGhlciBHSUNzLCBhcw0KPiBJIGZvdW5kIG91dCB0aGUgaGFy
ZCB3YXkgOy0pDQoNCkkgbmV2ZXIgc2FpZCBpdCB3YXMgYSBnb29kIGhhY2sgOikNCg0KDQo+IFNv
IGZvciBSWi9BMiwgSSB0aGluayBpdCdzIGJlc3QgdG8gdXNlDQo+IA0KPiAgICAgY29tcGF0aWJs
ZSA9ICJyZW5lc2FzLHI3czkyMTAtaXJxYyIsICJyZW5lc2FzLHJ6YTEtaXJxYyI7DQo+ICAgICBy
ZW5lc2FzLGdpYy1zcGktYmFzZSA9IDw0PjsNCg0KVGhhdCBzZWVtcyB0byBtYWtlIHNlbnNlLiBJ
dCdzIHNwZWNpZmljIHRvIHI3czkyMTAgKFJaL0EyKSwgYnV0IA0KY29tcGF0aWJsZSB3aXRoIHRo
ZSBvcmlnaW5hbCB2ZXJzaW9uIHdoaWNoIHdhcyBmb3IgcnphMS4gSXQgZXhwbGFpbnMgdGhlDQpo
aXN0b3J5Lg0KDQoNCj4gPiBTaWRlIG5vdGUsIEkndmUgc2VlbiB0aGlzIGludGVycnVwdCBwaW4g
SFcgaW4gc29tZSBvbGRlciBTSDRBIGRldmljZXMNCj4gPiAobGlrZSBTSDc3MjQgYW5kIFNINzc1
NykuIFNvIGl0J3MgYmVlbiBhcm91bmQgZm9yIGEgd2hpbGUuDQo+IA0KPiBSaWdodDoNCj4gDQo+
ICAgICBhcmNoL3NoL2tlcm5lbC9jcHUvc2g0YS9zZXR1cC1zaDczNDMuYzogeyAweGE0MTQwMDI0
LCAwLCA4LCAvKg0KPiBJTlRSRVEwMCAqLw0KPiAgICAgYXJjaC9zaC9rZXJuZWwvY3B1L3NoNGEv
c2V0dXAtc2g3MzY2LmM6IHsgMHhhNDE0MDAyNCwgMCwgOCwgLyoNCj4gSU5UUkVRMDAgKi8NCj4g
ICAgIGFyY2gvc2gva2VybmVsL2NwdS9zaDRhL3NldHVwLXNoNzcyMi5jOiB7IDB4YTQxNDAwMjQs
IDAsIDgsIC8qDQo+IElOVFJFUTAwICovDQo+ICAgICBhcmNoL3NoL2tlcm5lbC9jcHUvc2g0YS9z
ZXR1cC1zaDc3MjMuYzogeyAweGE0MTQwMDI0LCAwLCA4LCAvKg0KPiBJTlRSRVEwMCAqLw0KPiAg
ICAgYXJjaC9zaC9rZXJuZWwvY3B1L3NoNGEvc2V0dXAtc2g3NzI0LmM6IHsgMHhhNDE0MDAyNCwg
MCwgOCwgLyoNCj4gSU5UUkVRMDAgKi8NCj4gDQo+IEhvd2V2ZXIsIGFjY29yZGluZyB0byB0aGUg
c2g3NzI0IGRvY3VtZW50YXRpb24sIHRoZSByZWdpc3RlciBzZXQgaXMNCj4gc2xpZ2h0bHkgZGlm
ZmVyZW50LCBhcyBpcyBpdHMgc2Vuc2UgY29uZmlndXJhdGlvbiAobm8gc3VwcG9ydCBmb3IgYm90
aA0KPiBlZGdlcywgYnV0IHN1cHBvcnQgZm9yIGhpZ2gtbGV2ZWwgaW50ZXJydXB0cykuDQoNCklm
IEkgcmVtZW1iZXIgY29ycmVjdGx5LCBJIHRoaW5rIHRoZSBkZXNpZ24gZW5naW5lZXJzIGNhbiBj
aG9vc2UgdGhlIA0Kc2Vuc2UgYXMgdGhleSB3aXJlIGl0IHVwIGludGVybmFsbHkuIFRoZSBvbmVz
IGluIHRoZSBTSDc3NTcgd2VyZSBjaG9zZW4gDQpiYXNlZCBvbiBhIHNwZWNpZmljIHVzZSBjYXNl
LiBTbyBmYXIsIHRoZSBvbmVzIGNob3NlbiBmb3IgdGhlIFJaL0ExIHNlZW0gdG8NCm1ha2UgZXZl
cnlvbmUgaGFwcHksIHNvIEkgYXNzdW1lIHdlJ2xsIGtlZXAgdGhlbSB0aGF0IHdheS4NCg0KDQpD
aHJpcw0K
