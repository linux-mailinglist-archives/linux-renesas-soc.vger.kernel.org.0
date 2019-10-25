Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19F9E460A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 10:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408417AbfJYIot (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 04:44:49 -0400
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:64736
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2407543AbfJYIot (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 04:44:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FR9Zr7raKyP4BqQ2Rw+Sez0WLoObvE6h7pjFAMy/ZwZ1aPQzk9YUsPTLwTM7yjkw0g1OHcVtUmGZMSyEGerlhx+utPPlj1g/tAPiTc3iPX1lO41rPaYXp2XErTppYNYC/XNVf+x48BELkH3pfKFJxL/TPnx2pi3ryImarl6S+BN4u5omJIqnwdw1pR7gR8ScHnt5SuFMrQyKPavwe4qVO8L69JlSi6hD61RgHtTb+SKTJHetf0UMwTxQW7xCQ0l3AA+bripTXuBwBZL7NYhB87oPbM2xne3wz+6YjpruWdZCxik2hY5Y407yw6Ws9P8zgy7zOuUHtqWVQJiptVFQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tD49ak4oRGz3QM3MNANktY70h5i+m63iXpDmeCfGdE=;
 b=Ugrz+LETfK+seJd8zMl6rye0XQl2dI1UuKIucwXYx3yqiaDFRr5S6T79Aggn93CZg7LO5XnvyWHTruO3HtnqiIkZjLjkgKr3WBuayB9q9X2z/E0/+re1wGsAfXpbZAQnpAX9k5RakiOje3DIE28n333UzXBjYoFa/w3pLHzcihPrnqPQFh+jrlWrbTGP0+Ef5LzMlzbG8+m1JdV5CWtT5Knu7wvd2/vqcWvdxpa/Hifd3iV4/OMR8Y7YGLuLxTaceGWguiyIffTa3ISHBAtXMBPCQx/RUfqg1veS6hiqEiDmRJq1vSbV3D5YGO3JCkcqZKqQnSrbcPIT1/JIkQmFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tD49ak4oRGz3QM3MNANktY70h5i+m63iXpDmeCfGdE=;
 b=K8ljNARWem3a/c3uF6cH6pNh2oljtOI3daMGVexqWbnp/DoXUM0tn1G+o7+Ut5MP8pWCN1OpWmprPyG+sirJeCUVOz7Yxb+yK2MxMn7b6Z7jnZXL+tKrN40EUxKZBclcaOkGXDfiFHua3dCyDnQyWrsMlT28Z3B9j6VfklOpYmo=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5215.jpnprd01.prod.outlook.com (20.179.173.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 08:44:45 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 08:44:45 +0000
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
Subject: RE: [PATCH 3/3] clk: renesas: rcar-usb2-clock-sel: Add reset_control
Thread-Topic: [PATCH 3/3] clk: renesas: rcar-usb2-clock-sel: Add reset_control
Thread-Index: AQHVilyPYEjRQuYiBUGesOeD75lglqdppwmAgADtdJCAAGmPgIAACzRg
Date:   Fri, 25 Oct 2019 08:44:45 +0000
Message-ID: <TYAPR01MB45443AFC3DFF9DC916B33A0DD8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXuD4trBjqjgvZ3bimtDEHj4VNeG5-5NHFXkrOvYPd4=w@mail.gmail.com>
 <TYAPR01MB4544AA3E636D8CCF46623B23D8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <CAMuHMdX1tGGebY7bRwQAzt5CwPSGtqSXXsB=-J_R2N2zCM0J1g@mail.gmail.com>
In-Reply-To: <CAMuHMdX1tGGebY7bRwQAzt5CwPSGtqSXXsB=-J_R2N2zCM0J1g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3edc8790-774f-46ad-63ae-08d759279647
x-ms-traffictypediagnostic: TYAPR01MB5215:
x-microsoft-antispam-prvs: <TYAPR01MB521550A107C51BD45A4A41CCD8650@TYAPR01MB5215.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(199004)(189003)(5660300002)(316002)(99286004)(86362001)(33656002)(54906003)(66446008)(71190400001)(71200400001)(476003)(64756008)(66476007)(2906002)(11346002)(76116006)(66946007)(256004)(81166006)(81156014)(446003)(66556008)(14454004)(7696005)(76176011)(305945005)(6506007)(7736002)(186003)(8936002)(6436002)(26005)(8676002)(53546011)(74316002)(102836004)(52536014)(486006)(66066001)(9686003)(25786009)(55016002)(6916009)(229853002)(478600001)(6116002)(6246003)(3846002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5215;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qxdKcTQitIuAFdgsz/qhnQddQFLIx3fWwJaYG+X4nde3WyfJkso+WuepZJ3Sr8EbQnD+0Y9jnDcM2JFbvilsnTJDH0MBYizMa8FxoOheyet3Q6OR6xCJh3eAJuKIbKJ2e5jaUCIgzaUWUcjnrNZgOKJZhPULW1eyKWPq9IWLnBJODG77NgUKUTP0v41CfN8q5lzGG6QpOR6asK8MqI/KMI5LxMp6YOqAIeWCUV8wAJH183YG95D5yTyHH85OrW5psvVu5/+xuyCoohdISXa6Uy2CTtwfKcw5Eu2kPYhUJdVMdPvBXJfTyWZ6xKvS3/RwxEFkAgeBkMyhbTQ99C/9tmPlQhyDtMOPfkZE8GsDm23Cj2aoXvU6AQJS29Yj+g9ec83DryuebL/LszF1nODZ+qvlPGiC2vWQusqXCSoeoywaY/x3C/ChgP0a7bcl0OIx
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edc8790-774f-46ad-63ae-08d759279647
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 08:44:45.4553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OaMP4pCTR0BBlnqn/drNmwEDcVtKhVOOj9PIJ4/f1lBvgIz3pwKi/t/FbP7o+ABp/551K1pPK7xB0lEGA9sCTaLIAwcoZieY+H92CBKLuniyiprgc/ZeDLNv+901mc0a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5215
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBPY3RvYmVyIDI1LCAyMDE5IDQ6NTQgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMzo0MiBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuLCBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyNCwgMjAxOSA4OjI2IFBNDQo+
ID4gPHNuaXA+DQo+ID4gPiA+IFRoaXMgaGFyZHdhcmUgbmVlZHMgdG8gZGVhc3NlcnQgcmVzZXRz
IG9mIGJvdGggaG9zdCBhbmQgcGVyaXBoZXJhbC4NCj4gPiA+ID4gU28sIHRoaXMgcGF0Y2ggYWRk
cyByZXNldCBjb250cm9sLg0KPiA+ID4NCj4gPiA+IElmIHRoZSBoYXJkd2FyZSBuZWVkcyBpdCwg
cHJvYmFibHkgeW91IHdhbnQgdG8gbWFrZSBDTEtfUkNBUl9VU0IyX0NMT0NLX1NFTA0KPiA+ID4g
c2VsZWN0IFJFU0VUX0NPTlRST0xMRVI/DQo+ID4NCj4gPiBZb3UncmUgY29ycmVjdC4gSSdsbCBm
aXggaXQuDQo+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+ID4gLS0tIGEvZHJp
dmVycy9jbGsvcmVuZXNhcy9yY2FyLXVzYjItY2xvY2stc2VsLmMNCj4gPiA+ID4gKysrIGIvZHJp
dmVycy9jbGsvcmVuZXNhcy9yY2FyLXVzYjItY2xvY2stc2VsLmMNCj4gPiA+DQo+ID4gPiA+IEBA
IC0xNjQsNiArMTcyLDEwIEBAIHN0YXRpYyBpbnQgcmNhcl91c2IyX2Nsb2NrX3NlbF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gPiAgICAgICAgIGlmIChJU19FUlIo
cHJpdi0+Y2xrc1tDTEtfSU5ERVhfSFNfVVNCXSkpDQo+ID4gPiA+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gUFRSX0VSUihwcml2LT5jbGtzW0NMS19JTkRFWF9IU19VU0JdKTsNCj4gPiA+ID4NCj4g
PiA+ID4gKyAgICAgICBwcml2LT5yc3RzID0gZGV2bV9yZXNldF9jb250cm9sX2FycmF5X2dldF9v
cHRpb25hbF9zaGFyZWQoJnBkZXYtPmRldik7DQo+ID4gPg0KPiA+ID4gSWYgdGhlIHJlc2V0IGlz
IHJlYWxseSBuZWVkZWQsIHlvdSBzaG91bGQgbm90IHVzZSB0aGUgb3B0aW9uYWwgQVBJLg0KPiA+
DQo+ID4gVGhhdCdzIHRydWUuIFNvLCBJJ2xsIHVzZSBkZXZtX3Jlc2V0X2NvbnRyb2xfYXJyYXlf
Z2V0KCZwZGV2LT5kZXYsIHRydWUsIGZhbHNlKQ0KPiANCj4gQW55IHJlYXNvbiB5b3UgbmVlZCB0
aGUgYXJyYXkgdmVyc2lvbj8gQXJlIHRoZXJlIG11bHRpcGxlIHJlc2V0cyB0byBiZQ0KPiBzcGVj
aWZpZWQ/DQoNClllcywgdGhlcmUgYXJlIG11bHRpcGxlIHJlc2V0cyAoPCZjcGcgNzAzPiBhbmQg
PCZjcGcgNzA0PikgdG8gYmUgc3BlY2lmaWVkLg0KDQo+IE5vIGxvbmdlciBzaGFyZWQ/DQoNClRo
aXMgaGFyZHdhcmUgc2hhcmVzIHRoZSByZXNldHMgd2l0aCBVU0IgaG9zdCAoRUhDSSBhbmQgT0hD
SSksDQpVU0IgRnVuY3Rpb24gKEhTLVVTQikgYW5kIFVTQjItUEhZLi4uDQoNCj4gV2hpY2ggYnJp
bmdzIHRvIG15IGF0dGVudGlvbiB5b3UgZm9yZ290IHRvIGRvY3VtZW50IHRoZSByZXNldHMgaW4g
dGhlDQo+IERUIGJpbmRpbmdzIDstKQ0KDQpUaGF0J3MgcmlnaHQuIEknbGwgYWRkIHRoZSByZXNl
dHMgcHJvcGVydHkuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQo+IA0KPiBH
cntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+
IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
