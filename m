Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F05B7E4109
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 03:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388945AbfJYB34 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 21:29:56 -0400
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:61520
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388881AbfJYB3z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 21:29:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibq4p6DZ5ESwaKUlDOEmKs5SosTA0hbDSNowLS7CNzTQFs176oLXFJp8LwpieT1XIKEP+H+EGaE6Jd+vMqEWam11XvkEyjvWm2oRfYvp8kE1OlHXR/tmMoN0LI2fTB5kHVk6lP9I4kH5yAIHzvjh+fAu09osZu/3hQuD8bLI3fkNbuvr0RaYlbwv118ylgMetu/L2ZGgGe8ElpVrdfb/WHeJhVzMm7brUtgs+tQVZ8k7iqQPHdEhvg23Sf5ZBaNiw0PI8mU8y+FJi4cb7bI1b3iYiVGU4kIVoM/DhZRtz8fRZoypSxPCCcByfy//fRuiqz0nHdCl3f6QCQGnU4bvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoNU7jwv2G1ZNVNEp08LRhh4KBX8h+vTesL04UCpAro=;
 b=Faj89MHMoW0i1DQYb7xcisNjbkG9lrQHsUPbAzKH2A9GQ1b9gT+D5sRCJNjWLFK+k+SnrlKoY76txWc4WI7/p71IIyOoXh774ADkhHzOcarbQdzZrzY1dHDk1jdk/ykQMgE6tyWXBqx/EsgmFOs4taaNfMgFclk8TcXWQyQihcypyA3Az7+EjuAWSLB4M+QO34a4APw2NFGRROmc0H1SYD92LCHVqJ6lSqAL3ePDNDhvi6CIDiFRsTda3+Ljk/31BKoAUhsgx1zjBSHJD+O//p6AaAm7flNVeIxZGm3G/mss9SQXNDFiSQUW+BH7CTYdsDWRMnwXJXqacQ7x6dotgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoNU7jwv2G1ZNVNEp08LRhh4KBX8h+vTesL04UCpAro=;
 b=eufwKNmcR4sYYSL9lsKWg/wBpGBMZvF4/mWfAauiHgo/KY3ZMSvvviSeDlkobDAd7CR3Rir64Pbaxl2YjhKZl528pqhGgPdRGE8DP5RlyDGLRMf2HVlNP3icljJLvugqNozFzY/r/maj5GexuUHiyVWAWxnghQ2NVbOFSNpjFm8=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3280.jpnprd01.prod.outlook.com (20.177.102.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 25 Oct 2019 01:29:51 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 01:29:51 +0000
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
Subject: RE: [PATCH 1/3] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix
 clock[-name]s properties
Thread-Topic: [PATCH 1/3] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Fix clock[-name]s properties
Thread-Index: AQHVilyPrLUPc48BEU+bBbmYwzJ4ladprGuAgADlZrA=
Date:   Fri, 25 Oct 2019 01:29:51 +0000
Message-ID: <TYAPR01MB45447511CC1DE9D16E031927D8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXLOh3j-CFb3008DkXVAmq2MWCSW0SqzPoBBeq5v1qwoA@mail.gmail.com>
In-Reply-To: <CAMuHMdXLOh3j-CFb3008DkXVAmq2MWCSW0SqzPoBBeq5v1qwoA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9860839e-494a-4df7-5fc6-08d758ead519
x-ms-traffictypediagnostic: TYAPR01MB3280:
x-microsoft-antispam-prvs: <TYAPR01MB328079368C5321FE9D57F636D8650@TYAPR01MB3280.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(199004)(189003)(6436002)(8936002)(305945005)(76176011)(76116006)(186003)(476003)(11346002)(6916009)(446003)(66946007)(33656002)(5660300002)(25786009)(7736002)(99286004)(486006)(316002)(54906003)(6246003)(26005)(86362001)(2906002)(102836004)(229853002)(256004)(478600001)(66066001)(6506007)(9686003)(4326008)(71200400001)(71190400001)(55016002)(53546011)(14454004)(3846002)(7696005)(74316002)(66556008)(66476007)(6116002)(66446008)(81156014)(64756008)(8676002)(52536014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3280;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oIhOvpkRIcI1p9Ajzu4JBpfbxgjOrCpkBS9oSxanB39ycT3cwIgxpOp9psifhpQvYroWxI0UHjMbLBQzu6lL7DJ1tlYCRec3J/DOFqHjY4Oqz88i0Xx5+C3xNm2U9FAd68QoP6WDmGcps63wzAUMufxdc9VXNXUURu4mIwdq4IW0MXE+1RnHfBMWvmzUoE8MtaJPsWqo15+GQSOB0/Mz3ySddTPmkQk4RifijZjdbOLBxFOF1krB1gPARhABWhWjA8NhJK7DRVdtum3aSqAdbLZPN1xaIVJ4rqv82DvlHPltzqPL4FaffaRWjqdzKm7PAq3skVyS2pygSaCnpf74VbLNz9NZrcTlHY1kkJ5oI0wWjl9eOPsMxFwj1Gs0st0nRP+HeCZjxkoiDDFJTyXd7y4pHuYSQknpmb09KvE+Zt8jaGl8YNynRQ0a61+IirkU
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9860839e-494a-4df7-5fc6-08d758ead519
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 01:29:51.4887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /y8DizuZy4CkEK02gYKutmQqgl4jufGLHg+LO34a0rh4+5tcFu8nQzACFTtI87BnbIKx4NQ4eHDdjmzqSDHpuI90zGvJTFtnavlQIvTjpCu2Beoos0m6j744HONTp4rx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3280
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIE9jdG9iZXIgMjQsIDIwMTkgODo0NiBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBPbiBUaHUsIE9jdCAyNCwgMjAxOSBhdCAxOjE3IFBNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gU2luY2UgdGhlIGhh
cmR3YXJlIHJlcXVpcmVzIHRvIGVuYWJsZSBib3RoIFVTQiAyLjAgaG9zdCBhbmQgcGVyaXBoZXJh
bA0KPiA+IGZ1bmN0aW9uYWwgY2xvY2ssIHRoaXMgcGF0Y2ggZml4ZXMgdGhlIGRvY3VtZW50YXRp
b24uDQo+ID4gRm9ydHVuYXRlbHksIG5vIG9uZSBoYXMgdGhpcyBkZXZpY2Ugbm9kZSBmb3Igbm93
LCBzbyB0aGF0IHdlIGRvbid0DQo+ID4gbmVlZCB0byB0aGluayBvZiBiYWNrd2FyZCBjb21wYXRp
YmlsaXR5Lg0KPiA+DQo+ID4gRml4ZXM6IDMxMWFjY2I2NDU3MCAoImNsazogcmVuZXNhczogcmNh
ci11c2IyLWNsb2NrLXNlbDogQWRkIFItQ2FyIFVTQiAyLjAgY2xvY2sgc2VsZWN0b3IgUEhZIikN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEu
dWhAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm91ciB5b3VyIHBhdGNoIQ0KPiANCj4gTG9v
a3MgZ29vZCB0byBtZSwgc28NCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+DQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCj4g
SSdtIGp1c3Qgd29uZGVyaW5nIGFib3V0IHRoZSBpbmNvbnNpc3RlbnQgdXNlIG9mICJfIiBhbmQg
Ii0iIGluIGNsb2NrDQo+IG5hbWVzLCBidXQgSSBkb24ndCBoYXZlIGEgYmV0dGVyIHN1Z2dlc3Rp
b24gKCJocy11c2ItaWYiLCAidXNiX2V4dGFsIiwNCj4gYW5kICJ1c2JfeHRhbCIgZG8gbWF0Y2gg
dGhlIGRhdGFzaGVldCksIHNvIGxldCdzIGlnbm9yZSBteSBPQ0QgOy0pDQoNCkkgaW50ZW5kZWQg
dG8gbWF0Y2ggdGhlIG5hbWVzIHdpdGggdGhlIGRhdGFzaGVldCwgYnV0ICJlaGNpX29oY2kiIGRv
ZXNuJ3QgbWF0Y2ggdGhvdWdoLi4uDQpTbywgc2hvdWxkIEkgY2hhbmdlIHRoZSAiZWhjaV9vaGNp
IiB0byAiZWhjaS9vaGNpIj8NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2Fz
LHJjYXItdXNiMi1jbG9jay1zZWwudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nsb2NrL3JlbmVzYXMscmNhci11c2IyLWNsb2NrLXNlbC50eHQNCj4gPiBA
QCAtMzgsNyArMzgsOCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICAtIHJlZzogb2Zmc2V0
IGFuZCBsZW5ndGggb2YgdGhlIFVTQiAyLjAgY2xvY2sgc2VsZWN0b3IgcmVnaXN0ZXIgYmxvY2su
DQo+ID4gIC0gY2xvY2tzOiBBIGxpc3Qgb2YgcGhhbmRsZXMgYW5kIHNwZWNpZmllciBwYWlycy4N
Cj4gPiAgLSBjbG9jay1uYW1lczogTmFtZSBvZiB0aGUgY2xvY2tzLg0KPiA+IC0gLSBUaGUgZnVu
Y3Rpb25hbCBjbG9jayBtdXN0IGJlICJlaGNpX29oY2kiDQo+ID4gKyAtIFRoZSBmdW5jdGlvbmFs
IGNsb2NrIG9mIFVTQiAyLjAgaG9zdCBzaWRlIG11c3QgYmUgImVoY2lfb2hjaSINCj4gDQo+ICJf
IiBtZWFucyAiYW5kIi4NCj4gDQo+ID4gKyAtIFRoZSBmdW5jdGlvbmFsIGNsb2NrIG9mIEhTLVVT
QiBzaWRlIG11c3QgYmUgImhzLXVzYi1pZiINCj4gDQo+ICItIiBtZWFucyBjb25jYXRlbmF0aW9u
IG9mIHRlcm1zLg0KPiANCj4gPiAgIC0gVGhlIFVTQl9FWFRBTCBjbG9jayBwaW4gbXVzdCBiZSAi
dXNiX2V4dGFsIg0KPiA+ICAgLSBUaGUgVVNCX1hUQUwgY2xvY2sgcGluIG11c3QgYmUgInVzYl94
dGFsIg0KPiANCj4gIl8iIG1lYW5zIGNvbmNhdGVuYXRpb24gb2YgdGVybXMuDQo+IA0KPiBHcntv
ZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0K
PiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0
DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
