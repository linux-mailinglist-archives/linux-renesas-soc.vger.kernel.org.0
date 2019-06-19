Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1C674B3CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 10:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731242AbfFSIQt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 04:16:49 -0400
Received: from mail-eopbgr1410113.outbound.protection.outlook.com ([40.107.141.113]:30537
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731064AbfFSIQs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 04:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85vsaUX0fABWpRB1uYMR3oB43Lmi5SxraSqZBgitBi8=;
 b=CV8cLGferXkSIkLnQmxXgR4TGLVQl3BnnMMYBYJhFX5unWYsHCMkJ4UrPxMIwkcHJbbkpAhuoYMCyehYn4shEAocUf1N4U2jSEMVBIVO5keNpbvrvKmF/k7pS0PkDJlmp4ygrp/KF1ilVn6hyHYI4wToKIE1dOp+d07CUNBRj5o=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1596.jpnprd01.prod.outlook.com (52.133.162.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 08:16:43 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 08:16:43 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: RE: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Thread-Topic: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Thread-Index: AQHVIrOD4fCNYWErgUiYJbbykExq36ahinuAgAAEL9CAAQ6hgIAACwaA
Date:   Wed, 19 Jun 2019 08:16:43 +0000
Message-ID: <TY1PR01MB1770F9972F006B57917A0731C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdU8oag+1oNa_jS=v99W05=8SRLhdoZdCusmeVf1VZbarQ@mail.gmail.com>
 <TY1PR01MB17707C3C979FB60611FB34A7C0EA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVb+sc0vdvbsAE0fkEY6wFS7KsbtqLmtB03ghVeuiHe1w@mail.gmail.com>
In-Reply-To: <CAMuHMdVb+sc0vdvbsAE0fkEY6wFS7KsbtqLmtB03ghVeuiHe1w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e7f4117-fc39-4bb6-54d0-08d6f48e76e4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1596;
x-ms-traffictypediagnostic: TY1PR01MB1596:
x-microsoft-antispam-prvs: <TY1PR01MB159621C7F131FA586C67FEDDC0E50@TY1PR01MB1596.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(366004)(136003)(376002)(396003)(189003)(199004)(37524003)(76176011)(26005)(66946007)(66446008)(66556008)(186003)(6116002)(66066001)(44832011)(66476007)(4326008)(3846002)(305945005)(7736002)(2906002)(76116006)(64756008)(25786009)(73956011)(446003)(53936002)(486006)(74316002)(6246003)(476003)(316002)(11346002)(33656002)(86362001)(71200400001)(110136005)(54906003)(53546011)(6506007)(55016002)(478600001)(229853002)(71190400001)(6436002)(102836004)(9686003)(14454004)(256004)(7696005)(99286004)(68736007)(81156014)(81166006)(8936002)(8676002)(52536014)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1596;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uIdNjBuISLSlPUEBatQg8pMJhCEkPPXV1JNWFam0Fgnmeg2rCJBFiV1lOP+lN+b1yszYzH2eqFeAO+Ri6EajEuuHwUx/EoFgjWOo6qh8hXfEHAg92W/K5vj6hX54AdN8o1xgkCBGWmwt5o+ZM+i0Nf0jJ821IuETBEFb+/12yyyABP5Zz0zJH9cQkdBhO63rDgv8rqY/+gEWJkPSFh/FP9bEv8AQ4/FMjH7WE2E1jWloDNbeUymFWvaFTpEtqn+Mi0JasPdoI/wKpY4DjedYzWolKs5/uIPwS6wz4buqdMc5GYvIB8aYapiUYN2vT7HO07vuVFpIHBajTSmmNf8dGHI3j1xb+m4OGGEVFH5QvEJUKpYQ7sk34MIW4kGhdw8lG+i8MfUGXX31TnexttCa3IT04Ws4SU4SaFb/d5QfqDI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7f4117-fc39-4bb6-54d0-08d6f48e76e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 08:16:43.0556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1596
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjaw0KDQo+IEZyb206IGxp
bnV4LXJlbmVzYXMtc29jLW93bmVyQHZnZXIua2VybmVsLm9yZyA8bGludXgtcmVuZXNhcy1zb2Mt
b3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgR2VlcnQgVXl0dGVyaG9ldmVuDQo+
IFNlbnQ6IDE5IEp1bmUgMjAxOSAwODozNA0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDog
ZHRzOiByZW5lc2FzOiBoaWhvcGUtY29tbW9uOiBBZGQgTEVEcyBzdXBwb3J0DQo+IA0KPiBIaSBG
YWJyaXppbywNCj4gDQo+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDU6NTYgUE0gRmFicml6aW8g
Q2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4g
RnJvbTogbGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC1yZW5l
c2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFsZiBPZiBHZWVydCBVeXR0ZXJo
b2V2ZW4NCj4gPiA+IFNlbnQ6IDE4IEp1bmUgMjAxOSAxNjoxMA0KPiA+ID4gU3ViamVjdDogUmU6
IFtQQVRDSF0gYXJtNjQ6IGR0czogcmVuZXNhczogaGlob3BlLWNvbW1vbjogQWRkIExFRHMgc3Vw
cG9ydA0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0IDM6MTcgUE0gRmFicml6
aW8gQ2FzdHJvDQo+ID4gPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToN
Cj4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIExFRHMgc3VwcG9ydCB0byB0aGUgSGlIb3BlIFJaL0cy
W01OXSBNYWluIEJvYXJkDQo+ID4gPiA+IGNvbW1vbiBkZXZpY2UgdHJlZS4NCj4gPiA+ID4NCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAu
cmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4N
Cj4gPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL2hpaG9wZS1jb21tb24u
ZHRzaQ0KPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLWNv
bW1vbi5kdHNpDQo+ID4gPiA+IEBAIC0xNyw2ICsxNywzMCBAQA0KPiA+ID4gPiAgICAgICAgICAg
ICAgICAgc3Rkb3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7DQo+ID4gPiA+ICAgICAgICAg
fTsNCj4gPiA+ID4NCj4gPiA+ID4gKyAgICAgICBsZWRzIHsNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgbGVkMCB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGdwaW9zID0g
PCZncGlvNiAxMSBHUElPX0FDVElWRV9ISUdIPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgbGFiZWwgPSAiTEVEMCI7DQo+ID4gPg0KPiA+ID4gVGhlcmUncyBubyBuZWVkIGZvciBh
IGxhYmVsIHByb3BlcnR5LCBpZiBpdCBtYXRjaGVzIHRoZSBub2RlIG5hbWUNCj4gPiA+IChhcHBs
aWVzIHRvIGFsbCBmb3VyIExFRHMpLg0KPiA+DQo+ID4gSSBjb3VsZCBoYXZlIHVzZWQgdGhlIGFj
dHVhbCBuYW1lcyBvbiB0aGUgc2NoZW1hdGljLCBidXQgdGhlbiBJIHJlYWxpc2VkIHRoYXQNCj4g
PiB3b3VsZCBub3QgaGF2ZSBiZWVuIHRvbyBoZWxwZnVsIGR1ZSB0byB0aGUgY29ycmVzcG9uZGlu
ZyBzd2l0Y2ggbmFtZXM6DQo+ID4gTEVEMCAtIEdQNl8xMSAtIFNXMjIwMiAtIExFRDIyMDENCj4g
PiBMRUQxIC0gR1A2XzEyIC0gU1cyMjAxIC0gTEVEMjIwMg0KPiA+IExFRDIgLSBHUDZfMTMgLSBT
VzIyMDMgLSBMRUQyMjAzDQo+ID4gTEVEMyAtIEdQMF8wMCAtIE4vQSAtIExFRDI0MDINCj4gPiBU
aGUgZmlyc3QgMyBMRURzIGFyZSBmb3VuZCBuZXh0IHRvIHRoZSBtaWNybyBVU0IgY29ubmVjdG9y
IGZvciB0aGUgZGVidWcgY29uc29sZSwNCj4gPiB0aGUgZm9ydGggTEVEIGlzIGZvdW5kIG5leHQg
dG8gdGhlIFdpRmkgYW5kIEJUIExFRHMuDQo+ID4NCj4gPiBJIHRob3VnaHQgdGhhdCB1c2luZyAi
TEVEbiIgYXMgbGFiZWxzIHdvdWxkIHB1dCBhIHJlbWFyayBvbiB0aGUNCj4gPiAiZGVzaXJlZCBv
cmRlcmluZyIgb2YgdGhlIExFRHMgKGV2ZW4gdGhvdWdoIHRoZXJlIGlzIG5vIGFjdHVhbA0KPiA+
IHJlcXVpcmVtZW50IGZvciB0aGF0KSwgYnV0IGFzIHlvdSBwb2ludGVkIG91dCBpdCdzIHByb2Jh
Ymx5IGEgYml0DQo+ID4gY29uZnVzaW5nPyBEbyB5b3UgdGhpbmsgSSBzaG91bGQgdGFrZSB0aGUg
bGFiZWwgb3V0Pw0KPiANCj4gSWYgdGhlIExFRHMgZG9uJ3QgaGF2ZSBuaWNlIGxhYmVscyBvbiB0
aGUgUENCLCBJIHdvdWxkIGRyb3AgdGhlIGxhYmVsDQo+IHByb3BlcnRpZXMuDQoNCldpbGwgZG8u
IFNpbW9uLCBkbyB5b3Ugd2FudCBtZSB0byBzZW5kIGFuIGluY3JlbWVudGFsIHBhdGNoIGZvciB0
aGlzICh0aGlzIHBhdGNoDQppcyBvbiBkZXZlbCBicmFuY2ggYWxyZWFkeSkgb3Igd291bGQgeW91
IHJhdGhlciBJIHNlbnQgYSB2Mj8NCg0KVGhhbmtzLA0KRmFiDQoNCj4gDQo+ID4gPiBOb3RlIHRo
YXQgdGhpcyBHUElPIGlzIHNoYXJlZCB3aXRoIGEgc3dpdGNoLCBsaWtlIG9uIFNhbHZhdG9yLVgo
UykgYW5kDQo+ID4gPiBVTENCLiAgQXMgY3VycmVudGx5IExpbnV4IGNhbm5vdCBoYW5kbGUgYm90
aCwgZGVzY3JpYmluZyB0aGUgTEVEDQo+ID4gPiBwcmVjbHVkZXMgYWRkaW5nIHRoZSBzd2l0Y2gg
bGF0ZXIuDQo+ID4gPiAoYXBwbGllcyB0byB0aGUgZmlyc3QgMyBMRURzKS4NCj4gPg0KPiA+IFRo
YW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIFRoYXQncyBkZXNpcmVkIGJlaGF2aW91ciBp
biB0aGlzIGNhc2UuDQo+IA0KPiBPSy4NCj4gDQo+ID4gPiA+ICsgICAgICAgICAgICAgICBsZWQz
IHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ3Bpb3MgPSA8JmdwaW8wICAwIEdQ
SU9fQUNUSVZFX0hJR0g+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9
ICJMRUQzIjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gPg0KPiA+ID4gSSBjYW5u
b3QgZmluZCBMRUQzLiBBY2NvcmRpbmcgdG8gdGhlIHNjaGVtYXRpY3MgR1AwXzAgPT0gQ1MwbiBp
cyB1c2VkDQo+ID4gPiBhcyB0aGUgY2hpcHNlbGVjdCBmb3IgdGhlIExWRFMgc3dpdGNoPw0KPiA+
DQo+ID4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IENTMG4gaXMgb24gR1AxXzIwLCBjb3VsZCB5
b3UgcGxlYXNlIGRvdWJsZQ0KPiA+IGNoZWNrPw0KPiA+IChwaW4gbmFtZTogQUo0KSBHUDBfMDAg
PT0gRDAgPT0gRXhEMCBvbiB0aGUgc2NoZW1hdGljIEkgaGF2ZSwgSSB0aG91Z2h0DQo+ID4geW91
IG1heSBoYXZlIGJlZW4gbG9va2luZyBhdCBhbiBvbGRlciB2ZXJzaW9uIG9mIHRoZSBzY2hlbWF0
aWMsIGJ1dCBhZnRlcg0KPiA+IGdvaW5nIHRocm91Z2ggdGhlIGhpc3RvcnkgaXQgc2VlbXMgbGlr
ZSB0aGF0IGxpbmUgaGFzIGFsd2F5cyBiZWVuIHRoZXJlLg0KPiANCj4gU29ycnksIG15IG1pc3Rh
a2UuICBBcyB0aGVyZSBpcyBubyBHUDBfMCBpbiB0aGUgc2NoZW1hdGljLCBJIGxvb2tlZCB1cA0K
PiB0aGUgcGluIG51bWJlciBpbiB0aGUgZG9jcywgYnV0IGVuZGVkIHVwIHVzaW5nIHRoZSBSLUNh
ciBNMy1XIFNpUCBwaW4NCj4gbnVtYmVyLCBpbnN0ZWFkIG9mIHRoZSBSWi9HMk0gRkNCR0EgU29D
IHBpbiBudW1iZXIgOi0oDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
DQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
