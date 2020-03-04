Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3A69178A95
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 07:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgCDG3I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 01:29:08 -0500
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:61024
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725773AbgCDG3I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 01:29:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1Z6aqr6Kwjh2p58vMuK9+vOcnSNeXo5HQhEPVHVEXH+eyEYgC5uPzrRVqfae2QgY2QcUiLzeuXfB9ppeK2rbHj3+T4hJ9awLnhT+lVze3VmRq4+lMvi9TynjtLW+8WXjvMBtxlcrhE3TkTLEAf7oNas+AHeMTd4wxAzzda50AC0KLuYifoliKC1aZIQqDTbSzFdMLlDBgn+oC36nNi2aQ6ww8Y6bxWA+e3wAwauDt/epMasZURAZdJYvpCFTu2V8O6kCf5ez1UvpeD4lPZKH+o9y2eblkg/N+ZnnLgzeH2c1/2Npm9rH8JNzZXI0pDhw+XmUC9Q8/giGDxmaerXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gR2y/5PGEVVKLVy+CvlLKMrZ5MKIeHh3oF0qayzfCGk=;
 b=Pg9t7ECLJ5UsBK8syeKaZ/WSBrl/y1jkdrc7L22bLvASHU5eRS76CW7EhGLVbcDOCIqnHoizOxZDfAx2X1DH7KSlk8vPOrLbHsbMROtdtcFX1BASdt5X8v8+YGFNm07JbB/26WFix62/UE1B4gbZeu9iGR7ZaZHn/yg6NujBfxqdg1ypHM4OuTYZUZVxjXoJA4x0t2KYIjUkQuNabAapKQ6QJen0AFawb3FtCnQ1pJrXNTf3DUai3xiORoHunvdFShQF8ePuq9PekwTLI8Lsp0FcKOIulc1ZTyfXBMfHgLKSvrjkKFSsVkYa6G9ZDbQnppHQk54HsPwGgalmmpMXDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gR2y/5PGEVVKLVy+CvlLKMrZ5MKIeHh3oF0qayzfCGk=;
 b=rLPMD0XEiyk+JOduwG2YR1SofL7HFoLlG92EIAjzOt+urJQjza+nGTk23cj4BDEBcz/8SrqA9BYcVIr3vLoec0rvULSEQfJ+aZizsuse8Fq7i+mNoycCRQPbTY7L2mwYupstHjeIzNzUM/Cghhfe19rzxG3MKkjS6/vX9RGE2Jg=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3374.jpnprd01.prod.outlook.com (20.178.139.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Wed, 4 Mar 2020 06:29:03 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::dccc:154d:a04e:3ee3]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::dccc:154d:a04e:3ee3%3]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 06:29:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Add power-domains and resets properties
Thread-Topic: [PATCH v3 2/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Add power-domains and resets properties
Thread-Index: AQHVkIJtop9MoIEzKU2qXNmIENVbf6eQ0D0AgKfq1pA=
Date:   Wed, 4 Mar 2020 06:29:03 +0000
Message-ID: <TYAPR01MB4544BFFE2491F5A942C45277D8E50@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1572591791-11280-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1572591791-11280-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWbcDUThotTriK3mCB90FYODPpqPA0Ns50gQ0y8D7JdKw@mail.gmail.com>
In-Reply-To: <CAMuHMdWbcDUThotTriK3mCB90FYODPpqPA0Ns50gQ0y8D7JdKw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 83c1464e-bbcf-41fb-09f8-08d7c0055571
x-ms-traffictypediagnostic: TYAPR01MB3374:
x-microsoft-antispam-prvs: <TYAPR01MB33740395D2147B6337C5A632D8E50@TYAPR01MB3374.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(189003)(199004)(54906003)(71200400001)(52536014)(26005)(186003)(33656002)(81156014)(66556008)(64756008)(5660300002)(81166006)(66446008)(2906002)(76116006)(66476007)(66946007)(478600001)(55236004)(8676002)(6916009)(53546011)(9686003)(4326008)(7696005)(316002)(6506007)(55016002)(86362001)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3374;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hXH3N3aL+j/FE8uV88w1kpubMs7kya/1guLzXdU5KxRAcd67Q0sbMkROAEEUzEqBSn1+DkI8gmwB+69lkS8Z7TM0H1WYJLt7XdinGjqY0frlNzBpyna5gjvOWw9ys/RENnRLRBNCgELx82Pa0hPeGUkXEZEQI/qPGFguBtvbGKHhDTQdtI18rvknFahwTVoVdrlpA1XTnxm4Mjq6YDaxUHXPV6Y1mr8HzE8wrONocYEXEsVUZDyIc/bH2A1Wm05djbJTkOd41t9HlT1fnC6m0oqflCqRuRHOqaBPLJLy4JLz7GoxGGPOaQKOeTwhTjWIdPLSMH/87gd644lIjifXv//cwRfk/aUtwb5G9CeqeAdZVAJeK1Pl0dhHDzAm2hVPaQ1O39ijHw1BpCofu3blia0NpMN52NbkK8YiznK01Knb0JiaAGgVR/08xEusI3CV
x-ms-exchange-antispam-messagedata: ksyEF9EXS0j2xonYEt91Z6H4qhz3W6TE+f6IOnIph5Sa8uKkexRixblDQhwJAt4q3f7OqBZsJ6DRF4XEgO8lXAFhVg0KB/dlim1g4+0xI7S+3TI16ki1d0eMSg6bW1Lp+OHjQgazbm11jln9XuOKfw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c1464e-bbcf-41fb-09f8-08d7c0055571
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 06:29:03.5026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HeBaCECLx1gPt4Ec4FgafmekW4KyvVVoipOUPY26CD3f5mysl08uccKlksRq1RsYJI07KI4O5TRKFfbfkW2O14Xhp3NDammme1WBaA5kR7sZUC8k1NpYRAcwfEzmueaB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3374
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IGFuZCBJIGNvbXBsZXRl
bHkgb3Zlcmxvb2tlZCB0aGlzIGVtYWlsLi4uDQoNCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVu
LCBTZW50OiBNb25kYXksIE5vdmVtYmVyIDE4LCAyMDE5IDc6MTIgUE0NCj4gDQo+IEhpIFNoaW1v
ZGEtc2FuLA0KPiANCj4gT24gRnJpLCBOb3YgMSwgMjAxOSBhdCA4OjAzIEFNIFlvc2hpaGlybyBT
aGltb2RhDQo+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4g
VGhpcyBwYXRjaCBhZGRzIG1pc3NpbmcgcmVxdWlyZWQgcHJvcGVydGllcyBvZiBwb3dlci1kb21h
aW5zIGFuZCByZXNldHMuDQo+ID4gRm9ydHVuYXRlbHksIG5vIG9uZSBoYXMgdGhpcyBkZXZpY2Ug
bm9kZSBmb3Igbm93LCBzbyB0aGF0IHdlIGRvbid0DQo+ID4gbmVlZCB0byB0aGluayBvZiBiYWNr
d2FyZCBjb21wYXRpYmlsaXR5Lg0KPiA+DQo+ID4gRml4ZXM6IDMxMWFjY2I2NDU3MCAoImNsazog
cmVuZXNhczogcmNhci11c2IyLWNsb2NrLXNlbDogQWRkIFItQ2FyIFVTQiAyLjAgY2xvY2sgc2Vs
ZWN0b3IgUEhZIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHJj
YXItdXNiMi1jbG9jay1zZWwudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL3JlbmVzYXMscmNhci11c2IyLWNsb2NrLXNlbC50eHQNCj4gPiBAQCAt
NDMsNiArNDMsOSBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICAgLSBUaGUgVVNCX0VYVEFM
IGNsb2NrIHBpbiBtdXN0IGJlICJ1c2JfZXh0YWwiDQo+ID4gICAtIFRoZSBVU0JfWFRBTCBjbG9j
ayBwaW4gbXVzdCBiZSAidXNiX3h0YWwiDQo+ID4gIC0gI2Nsb2NrLWNlbGxzOiBNdXN0IGJlIDAN
Cj4gPiArLSBwb3dlci1kb21haW5zOiBBIHBoYW5kbGUgYW5kIHN5bWJvbGljIFBNIGRvbWFpbiBz
cGVjaWZpZXIuDQo+ID4gKyAgICAgICAgICAgICAgICAgU2VlIHBvd2VyL3JlbmVzYXMscmNhci1z
eXNjLnR4dC4NCj4gPiArLSByZXNldHM6IEEgbGlzdCBvZiBwaGFuZGxlcyBhbmQgc3BlY2lmaWVy
IHBhaXJzLg0KPiANCj4gU2luY2UgdGhlcmUgaXMgbW9yZSB0aGFuIG9uZSwgSSB0aGluayBpdCB3
b3VsZCBiZSBnb29kIHRvIHNwZWNpZnkNCj4gcmVzZXQtbmFtZXMsIHRvbyAoImVoY2lfb2hjaSIg
YW5kICJocy11c2ItaWYiKS4NCg0KSSBnb3QgaXQuIEknbGwgYWRkIHJlc2V0LW5hbWVzLg0KDQpC
ZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IFRoZSByZXN0IGxvb2tzIGdvb2Qg
dG8gbWUuDQo+IA0KPiA+ICBFeGFtcGxlIChSLUNhciBIMyk6DQo+ID4NCj4gPiBAQCAtNTQsNCAr
NTcsNiBAQCBFeGFtcGxlIChSLUNhciBIMyk6DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
IDwmdXNiX2V4dGFsPiwgPCZ1c2JfeHRhbD47DQo+ID4gICAgICAgICAgICAgICAgIGNsb2NrLW5h
bWVzID0gImVoY2lfb2hjaSIsICJocy11c2ItaWYiLCAidXNiX2V4dGFsIiwgInVzYl94dGFsIjsN
Cj4gPiAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiA+ICsgICAgICAgICAg
ICAgICBwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTVfUERfQUxXQVlTX09OPjsNCj4gPiAr
ICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcgNzAzPiwgPCZjcGcgNzA0PjsNCj4gPiAgICAg
ICAgIH07DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJ
biBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15
c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
