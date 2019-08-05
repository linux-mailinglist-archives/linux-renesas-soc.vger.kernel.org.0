Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D36C815C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 11:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHEJoe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 05:44:34 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:19088
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726454AbfHEJod (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 05:44:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/1igTPRrrf0RxeGxcgC9YFZCcuz5xhEblkytYjXCZJybHDDKUPpfQS71LcrIYstzWsBEyN62QHYHTDxf8LbGE9+0OzSbNhf3uXu3pzxPKacztYbbVXqQ2DmSGOpJ+9ibf0FKrKwqVUm4yDpSR84u27xcLB2cQJIoV3lszX+76rodCBKMpiDeCI8icW0YsNpLaVGXC68HLHTsukhui/Z2N4q5l5NIF/ejExY58uCaAIqPCwJN0a4dYFe7IqAjjPrKXV/mxT1Rgt25roj2g6Ih1SqtQPGu6nfAU/PEIfIFfVio/agvIjO+DdkZ3vctd4NYrrz35fIzWEwJ1qYgQHEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE2v0d0efAkhRnwTVYEQuTL+Pj20+GJFXOgrlKVIN/A=;
 b=Yu5XRVjDNM6BZva/x7Obuwk1MZNEYRq4+cAPudk3jp58dHSlxGoSlgY0dkY3ohXRcnUx0slUVLcuZoZnNXeGO7lTNxMDHR/fzWhOtC6LaP3WdADm5J3XItyzMACwyzPwAbA6SxsGJwpUPh4MXA2w2FRn4lFtgpWmmEc1BCZe/B07Smyg+DR9CSK9aMvFKUWuRFB0xYzrDAWdNc0USMLkGBRBUbqodWfEkxKG/ARcmIOtKYcEw/PMTJz31nct+vQ3I+cnCMcYyPHSdF4jVOy2n9hk1uqxHOBH52nWijScLmyQOZIPpGVhJXuQ1D/FFC7XeFypWIIFb1cHNM8ckjPLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE2v0d0efAkhRnwTVYEQuTL+Pj20+GJFXOgrlKVIN/A=;
 b=mKlytNe9Jn2eTqrqHebfA8e8oejTEKvUeOOTfkyDuFxJyRZkjXXy2w0HYzmOu+O5XrVmLWw5Vwa6iP2ph/LWDiIi3GWKkKlqiOwubBe+OgXf/6vs1AU4+kYfByxSaKExKXQFKSJVyWNG9i51ujR6uG+kt/S0gsBZ75nO/DeLcNs=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1611.jpnprd01.prod.outlook.com (52.133.164.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 09:44:28 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 09:44:28 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH/RFC 12/12] arm64: dts: renesas: Add EK874 board with
 idk-2121wr display support
Thread-Topic: [PATCH/RFC 12/12] arm64: dts: renesas: Add EK874 board with
 idk-2121wr display support
Thread-Index: AQHVSQTeO7aqmQdlekuuD/lMa5esK6bnkm+AgAS+mLA=
Date:   Mon, 5 Aug 2019 09:44:28 +0000
Message-ID: <TY1PR01MB177038CF1D966CB84534A9CDC0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-13-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVRg_N3S1OPVyy_Wj13XUHnTdWPY3iaOTuogah5oZCUWw@mail.gmail.com>
In-Reply-To: <CAMuHMdVRg_N3S1OPVyy_Wj13XUHnTdWPY3iaOTuogah5oZCUWw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67de40b9-8042-4284-e6c2-08d71989823e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1611;
x-ms-traffictypediagnostic: TY1PR01MB1611:
x-microsoft-antispam-prvs: <TY1PR01MB1611AD4EB2BFF2E930CDEAACC0DA0@TY1PR01MB1611.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(189003)(199004)(76116006)(66556008)(64756008)(66446008)(26005)(25786009)(66476007)(6116002)(3846002)(33656002)(71190400001)(71200400001)(54906003)(68736007)(186003)(66946007)(6246003)(305945005)(74316002)(7696005)(478600001)(316002)(7736002)(8936002)(81156014)(99286004)(81166006)(53546011)(76176011)(102836004)(256004)(2906002)(14454004)(66066001)(5660300002)(6506007)(8676002)(52536014)(53936002)(229853002)(476003)(55016002)(44832011)(6436002)(6916009)(486006)(11346002)(86362001)(7416002)(4326008)(9686003)(446003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1611;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EQ9e5s/b8ZLDic1rbCVl5UHE8LoQBNaIOaXbCyr8OwRsPoVlzrzbFr8+90cgMb5ZWPCqRCVmAOQbvW8u9afWd8zwuOne7U5yQaQGPz0BMqY+A+H3zCZ3y1uWiRWg/2gTi8ebWN+n/S6l/Q+4R5g7tg/6mwUBBgdNkaqq2Afkc6q7pXM0pPwwVMN3VFPjItcIv1J1tbNwPnhIItdPAIn/P5uEvJV/MLVrFhifnDKNBKiZWIMH0IHSAAwU3w51Pzy/9kSc4TZsnSlBrEfd1ybNDmSaIVIou7Rth8qhGhVoijZ9Pg62cmgeJoU5NPhHJdpJyvZy5md4XdffVDfFDRvOUrkQb19CEYHjlLRUAPoGl0kvz5UJ68oPdz+Gv2LwOjYNEgorZOSYzQhwv+Ux2rc7ju8p/KGd3WBYvBENSwjALhQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67de40b9-8042-4284-e6c2-08d71989823e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:44:28.0680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1611
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAwMiBBdWd1c3Qg
MjAxOSAxMDoxMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIL1JGQyAxMi8xMl0gYXJtNjQ6IGR0czog
cmVuZXNhczogQWRkIEVLODc0IGJvYXJkIHdpdGggaWRrLTIxMjF3ciBkaXNwbGF5IHN1cHBvcnQN
Cj4gDQo+IEhpIEZhYnJpemlvLA0KPiANCj4gT24gRnJpLCBBdWcgMiwgMjAxOSBhdCA5OjM1IEFN
IEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90
ZToNCj4gPiBUaGUgRUs4NzQgaXMgYWR2ZXJ0aXNlZCBhcyBjb21wYXRpYmxlIHdpdGggcGFuZWwg
SURLLTIxMjFXUiBmcm9tDQo+ID4gQWR2YW50ZWNoLCBob3dldmVyIHRoZSBwYW5lbCBpc24ndCBz
b2xkIGFsb25nc2lkZSB0aGUgYm9hcmQuDQo+ID4gQSBuZXcgZHRzLCBhZGRpbmcgZXZlcnl0aGlu
ZyB0aGF0J3MgcmVxdWlyZWQgdG8gZ2V0IHRoZSBwYW5lbCB0bw0KPiA+IHRvIHdvcmsgd2l0aCB0
aGUgRUs4NzQsIGlzIHRoZSBtb3N0IGNvbnZlbmllbnQgd2F5IHRvIHN1cHBvcnQgdGhlDQo+ID4g
RUs4NzQgd2hlbiBpdCdzIGNvbm5lY3RlZCB0byB0aGUgSURLLTIxMjFXUi4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMu
Y29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGMwLWVrODc0LWlk
ay0yMTIxd3IuZHRzDQo+ID4gQEAgLTAsMCArMSwxMTIgQEANCj4gDQo+IFsuLi5dDQo+IA0KPiA+
ICsgICAgICAgcGFuZWwtbHZkcyB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
YWR2YW50ZWNoLGlkay0yMTIxd3IiLCAicGFuZWwtbHZkcyI7DQo+ID4gKw0KPiA+ICsgICAgICAg
ICAgICAgICB3aWR0aC1tbSA9IDw0NzY+Ow0KPiA+ICsgICAgICAgICAgICAgICBoZWlnaHQtbW0g
PSA8MjY4PjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGRhdGEtbWFwcGluZyA9ICJ2ZXNh
LTI0IjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHBhbmVsLXRpbWluZyB7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDE0ODUwMDAwMD47DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgaGFjdGl2ZSA9IDwxOTIwPjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICB2YWN0aXZlID0gPDEwODA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGhzeW5jLWxlbiA9IDw0ND47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaGZyb250
LXBvcmNoID0gPDg4PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBoYmFjay1wb3JjaCA9
IDwxNDg+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZmcm9udC1wb3JjaCA9IDw0PjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB2YmFjay1wb3JjaCA9IDwzNj47DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgdnN5bmMtbGVuID0gPDU+Ow0KPiA+ICsgICAgICAgICAgICAg
ICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgcG9ydHMgew0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBwb3J0QDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbHZkczBfcGFuZWxfaW46
IGVuZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMF9vdXQ+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBwb3J0QDEgew0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbHZkczFfcGFuZWxfaW46IGVuZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMV9vdXQ+Ow0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgfTsNCj4gPiAr
fTsNCj4gDQo+IFsuLi5dDQo+IA0KPiA+ICsmbHZkczAgew0KPiA+ICsgICAgICAgcmVuZXNhcyxz
d2FwLWRhdGE7DQo+ID4gKw0KPiA+ICsgICAgICAgcG9ydHMgew0KPiA+ICsgICAgICAgICAgICAg
ICBwb3J0QDEgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGx2ZHMwX291dDogZW5kcG9p
bnQgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50
ID0gPCZsdmRzMF9wYW5lbF9pbj47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4g
PiArICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgIH07DQo+ID4gK307DQo+ID4gKw0KPiA+
ICsmbHZkczEgew0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICsNCj4gPiArICAg
ICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzI3PiwgPCZ4MTNfY2xrPiwgPCZleHRhbF9jbGs+
Ow0KPiA+ICsgICAgICAgY2xvY2stbmFtZXMgPSAiZmNrIiwgImRjbGtpbi4wIiwgImV4dGFsIjsN
Cj4gPiArDQo+ID4gKyAgICAgICBwb3J0cyB7DQo+ID4gKyAgICAgICAgICAgICAgIHBvcnRAMSB7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbHZkczFfb3V0OiBlbmRwb2ludCB7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHMx
X3BhbmVsX2luPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAg
ICAgICAgICB9Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArfTsNCj4gDQo+IFNob3VsZG4ndCB0aGUg
YWN0dWFsIHBhbmVsIGRlZmluaXRpb24sIGFuZCB0aGUgbHZkcyByZW1vdGUtZW5kcG9pbnQgc2V0
dXAsDQo+IGJlIGV4dHJhY3RlZCBpbnRvIGEgc2VwYXJhdGUgLmR0c2ksIHRvIGJlIGluY2x1ZGVk
IGhlcmU/DQo+IA0KPiBDZnIuIGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3eHgtYWExMDR4ZDEyLXBh
bmVsLmR0c2kgYW5kDQo+IGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3eHgtYWExMjF0ZDAxLXBhbmVs
LmR0c2kuDQoNCkl0IGxvb2tzIGxpa2UgdGhvc2UgZGlzcGxheXMgYXJlIGNvbW1vbmx5IHVzZWQg
d2l0aCBNYXJ6ZW4sIExhZ2VyLCBhbmQgS29lbHNjaA0KYm9hcmRzLCBJIGFtIG5vdCBhd2FyZSBv
ZiBhbnkgcGxhbnMgZm9yIHJldXNpbmcgdGhpcyBwYXJ0aWN1bGFyIHBhbmVsLg0KUGVyaGFwcyB3
ZSBzaG91bGQgc3RpbGwgbWFrZSB0aGlzIG1vcmUgZ2VuZXJpYyBhbmQgY3JlYXRlIGEgLmR0c2k/
DQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4N
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
