Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59AD220825
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 11:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730475AbgGOJE4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 05:04:56 -0400
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:38303
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730070AbgGOJEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 05:04:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNRbOKlAC1AxBvcYlTG+2v6LkAm2Wa1WC1T1oW21AjhSGGgeFYt1zhdYT5DKrSd/QOgusbZ5u6RZ0YnZJcnjFMKSdKV9VcbjG9qZor5lTEfA7tBci8Arv5mezdrpU5K8vcux4nJ5feIigPBleR0hTLLaPxwOHL46du3v+Rb2ucKfUBfNGZh0K6Dmr1ANzRPEjLut5FnvFzmYbD0hiMFDWthejYGE0EpRoFgNpq555GBivsMM8F36McqB4P6/kLvoGg/y+4/GIWMOQa9JqO9Jxa4nFjDGTb5FPPetuhz46gbbmOr9Uea3lmosrVxbXft6Tv5ziQXBa4gBwBF0OY0XaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFrNx6yvH6gFGTYk13fEo/bSEe1fFI6L+gJYHVEPdMk=;
 b=WnRIWuTHOpDACr9b0bml231IBjEnVO1Zj36Fy4oxTP1jI5hk50mjgIIY4TkNJXHm+KKpsjd6OW689Te1vg9le4LgDZkShoCveAjy7fvQU78JOKNi7abwCZvXK78Lnak81Kkyuif3Zs9SwXzu+XGuAsvP6CD7DdKZyHBgCxNgL/1njlDuCLVodlTTnj6mWdKXABiRQt9kSGTWVsCnEfHBqkfnHu5A3++A1pxLNHqyjoCDUOCupQGNtdz6nV3dYTMHHVeSZIgkVpa12GvE0Jfe95/fsSX6sGX1IpvzOvoJhur3EBR6cXB/snNvJTiYZgXC1HgqZcBp7yfNU6mrxy2kgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFrNx6yvH6gFGTYk13fEo/bSEe1fFI6L+gJYHVEPdMk=;
 b=FS0PNCS43rXTilrCOYz1cY6mA9WYe48IlWA6ZQBr7UFs2P0nranCCeYXm/ST6gJY4cUNVR86STITmtX3A4MroghYn8Cek6WBKqc3ogK7XlGk68DlicaYZA6nhEvFWxyAThb7qHuVQtb3dWfZ6Z+blWi0DGVvhLZltDMxj5ZeLtk=
Received: from OSAPR01MB1748.jpnprd01.prod.outlook.com (2603:1096:603:32::19)
 by OSBPR01MB2439.jpnprd01.prod.outlook.com (2603:1096:604:11::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 15 Jul
 2020 09:04:49 +0000
Received: from OSAPR01MB1748.jpnprd01.prod.outlook.com
 ([fe80::8902:d50b:a2a:9f0a]) by OSAPR01MB1748.jpnprd01.prod.outlook.com
 ([fe80::8902:d50b:a2a:9f0a%2]) with mapi id 15.20.3195.017; Wed, 15 Jul 2020
 09:04:49 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RESEND v7 1/3] dt-bindings: usb: hd3ss3220 device tree
 binding document
Thread-Topic: [PATCH RESEND v7 1/3] dt-bindings: usb: hd3ss3220 device tree
 binding document
Thread-Index: AQHWWoQQHSaG8cTLpUGjfVTWSFNQ3KkIWJGA
Date:   Wed, 15 Jul 2020 09:04:49 +0000
Message-ID: <OSAPR01MB174830C8011B08B89350BB5DAA7E0@OSAPR01MB1748.jpnprd01.prod.outlook.com>
References: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
 <1567584941-13690-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVZkjGDFmeQ9XkOqq-ogfSZz99hd0=N-OYLai4UEzKwAQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVZkjGDFmeQ9XkOqq-ogfSZz99hd0=N-OYLai4UEzKwAQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9a26dc08-eef2-4c9a-21fa-08d8289e2103
x-ms-traffictypediagnostic: OSBPR01MB2439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB2439BF29B9E1FFB13129AE5FAA7E0@OSBPR01MB2439.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9L/TXoHlymg2665VtzOlDjeil6Vo7cQ9hysqV+uCsOQ7Q6MUCmijPBMJNz1V9PXi2ig2MLH8l5Oi49WtMsHpXqB9qT4ZYSrkK1aVoD8IkgTlUVoQrTFf0VgTuTp27W8luyewz8PYxjQZxAMuJ6dz4I33Bthzxf0Ry2N5q19F0KOaZ3ijHJJdhqhT+96g72+aXkEWxcTLovzIWIlNlU/KpUVpp2rN1iTDvcynpvmMR0B3InNhi7FTbi7pu2IHy1wIM9BZ8XRH1DkLREkY70pHnJ+T9hdLanDvm14HeaR23Pc6Isn4sWyFZcO2/sArU8TA9Or3IJBEJdo3YtEFLCAopg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1748.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(86362001)(110136005)(54906003)(8676002)(316002)(71200400001)(4326008)(8936002)(478600001)(83380400001)(2906002)(7416002)(52536014)(66556008)(55016002)(66476007)(53546011)(64756008)(66446008)(33656002)(7696005)(76116006)(66946007)(26005)(9686003)(6506007)(186003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: pw6twkV9Z9j7v9lNsZeiotfPUih814mA/Qyme6xGDY78PUs48PsN1z9uiVZlr/SpZI5tOhe2qLmTvufcCV5Ip6ZGAYr3pVaQkViSwgdjFknpvL3VVePm/P0eKQswnGiNmUfh9bh+qz5tLImgW+O/Lh7Lm9s50Jr5blUnavf2z5gCw0pBeEI9buXdBXbTv/jABWiJ+NHOn/okNBaIgiDmPj7ALVXGW7brzBF/5FGTeoFLYN746B8eAecrYYuO7CV/NXJH4XRPNLbT5k1pRGzVgvmQi30XS+ucznrgpA0nKCnJVPLohvGOGm3w0eqOkf0PugC7BY/4tkuG4gYJTKaGoSfs1/W7IrlU4wDo9x6AoFyDxKVE5fcwC9oeYsse5jPU15F+u2fe/LhrBWbMDhbc7Xo8vD5UnpyGuzsTKQmFdsYSoYT++riF/+cWZpz19KnW2LKkiC2sH1uae3McZrCkJl0UnRC1YmFhpN6roXuEySZqKMB0+eC0nzD+S/t60c1H
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1748.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a26dc08-eef2-4c9a-21fa-08d8289e2103
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 09:04:49.4723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JdQSgBH62YIWbEsySHaMumFo4+eWaqCPnuvb6us/EZtuJZ3pFFRtdtqFOi1gCDX5Vz8TQ1qYOUJgPZrBXJMea9HoqsJDH05MNDNoOGw98bAJqb8VJ+Sim0F3sxQpBu6J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2439
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

K0JpanUuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTUgSnVseSAyMDIwIDA5
OjQ0DQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IENjOiBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRA
YXJtLmNvbT47IFlvc2hpaGlybyBTaGltb2RhDQo+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5l
c2FzLmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
OyBIZWlra2kgS3JvZ2VydXMNCj4gPGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb20+OyBG
ZWxpcGUgQmFsYmkgPGJhbGJpQGtlcm5lbC5vcmc+OyBVU0IgbGlzdCA8bGludXgtdXNiQHZnZXIu
a2VybmVsLm9yZz47IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORA0KPiBGTEFUVEVORUQgREVW
SUNFIFRSRUUgQklORElOR1MgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgU2ltb24gSG9y
bWFuIDxob3Jtc0B2ZXJnZS5uZXQuYXU+OyBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPjsgQ2hyaXMgUGF0ZXJzb24gPENocmlzLlBhdGVyc29uMkByZW5lc2Fz
LmNvbT47IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPjsg
TGludXgtDQo+IFJlbmVzYXMgPGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz47IFBy
YWJoYWthciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJFU0VORCB2NyAxLzNdIGR0LWJpbmRpbmdzOiB1
c2I6IGhkM3NzMzIyMCBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50DQo+DQo+IEhpIEJpanUs
DQo+DQo+IE9uIFdlZCwgU2VwIDQsIDIwMTkgYXQgMTA6MjIgQU0gQmlqdSBEYXMgPGJpanUuZGFz
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1
bWVudCBmb3IgVEkgSEQzU1MzMjIwIFR5cGUtQyBEUlAgcG9ydA0KPiA+IGNvbnRyb2xsZXIgZHJp
dmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVz
YXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0K
Pg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL3RpLGhkM3NzMzIyMC50eHQNCj4gPiBAQCAtMCwwICsxLDM4IEBADQo+ID4g
K1RJIEhEM1NTMzIyMCBUeXBlQyBEUlAgUG9ydCBDb250cm9sbGVyLg0KPiA+ICsNCj4gPiArUmVx
dWlyZWQgcHJvcGVydGllczoNCj4gPiArIC0gY29tcGF0aWJsZTogTXVzdCBiZSAidGksaGQzc3Mz
MjIwIi4NCj4gPiArIC0gcmVnOiBJMkMgc2xhdmUgYWRkcmVzcywgbXVzdCBiZSAweDQ3IG9yIDB4
NjcgYmFzZWQgb24gQUREUiBwaW4uDQo+ID4gKyAtIGludGVycnVwdHM6IEFuIGludGVycnVwdCBz
cGVjaWZpZXIuDQo+ID4gKw0KPiA+ICtSZXF1aXJlZCBzdWItbm9kZToNCj4gPiArIC0gY29ubmVj
dG9yOiBUaGUgInVzYi1jLWNvbm5lY3RvciIgYXR0YWNoZWQgdG8gdGhlIGhkM3NzMzIyMCBjaGlw
LiBUaGUNCj4gPiArICAgYmluZGluZ3Mgb2YgdGhlIGNvbm5lY3RvciBub2RlIGFyZSBzcGVjaWZp
ZWQgaW46DQo+ID4gKw0KPiA+ICsgICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9yLnR4dA0KPiA+ICsNCj4gPiArRXhhbXBsZToNCj4g
PiAraGQzc3MzMjIwQDQ3IHsNCj4gPiArICAgICAgIGNvbXBhdGlibGUgPSAidGksaGQzc3MzMjIw
IjsNCj4gPiArICAgICAgIHJlZyA9IDwweDQ3PjsNCj4gPiArICAgICAgIGludGVycnVwdC1wYXJl
bnQgPSA8JmdwaW82PjsNCj4gPiArICAgICAgIGludGVycnVwdHMgPSA8MyBJUlFfVFlQRV9MRVZF
TF9MT1c+Ow0KPiA+ICsNCj4gPiArICAgICAgIGNvbm5lY3RvciB7DQo+ID4gKyAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAidXNiLWMtY29ubmVjdG9yIjsNCj4gPiArICAgICAgICAgICAgICAg
bGFiZWwgPSAiVVNCLUMiOw0KPiA+ICsgICAgICAgICAgICAgICBkYXRhLXJvbGUgPSAiZHVhbCI7
DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBwb3J0cyB7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHBvcnRAMSB7DQo+DQo+IFRoaXMgZG9lcyBub3QgY29tcGx5IHdpdGgNCj4gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWw6DQo+DQo+
ICAgICBjb25uZWN0b3I6IHBvcnRzOiAncG9ydEAwJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5DQo+
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZDNzczMyMjBfZXA6IGVuZHBvaW50IHsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50
ID0gPCZ1c2IzX3JvbGVfc3dpdGNoPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIH07DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAg
ICAgfTsNCj4gPiArICAgICAgIH07DQo+ID4gK307DQo+DQo+IEdye29ldGplLGVldGluZ31zLA0K
Pg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPg0KPiAtLQ0KPiBHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnDQo+DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1ZWhy
ZXIvUHJlc2lkZW50OiBDYXJzdGVuIEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVnaXN0
ZXJlZCBvZmZpY2U6IER1ZXNzZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVlc3Nl
bGRvcmYsIEdlcm1hbnksIEhhbmRlbHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBEdWVz
c2VsZG9yZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46IERFIDEx
OTM1MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
