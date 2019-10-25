Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E45DFE4121
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 03:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388267AbfJYBmH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 21:42:07 -0400
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:32671
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726841AbfJYBmH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 21:42:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FO+bUdWldQKa5GSW5t3h3V/mVqnVp7+lF32KkPcLyZHG9jbG07LnPmK94heIkGkBgwfQ2W5W+/fFfVAhrWcMOtY/RfIDose6PcsXv+7gns5UavgUBrpXwq9SQdBJEqUPr/53Nf/n5z5YOtWoiuePkTCR8RssEe4sGSQGruwfaLYZV0cZfdm8KtNB6awf0TKAbAl1xBgZ93j1J2htJjSZKi+rv30Y6gQ8WtHk4vUZFuMmKREzECp5UTDLK+Nf2ZPYQ7tAmfeds8vRbWuQFGQJURSPXCiCNmmAvJvIax6OEHJ5RG4i9XBSQNLd0BvRLhwiO6rmsXaVk12Mkd95FY0Erw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOZ5ftY3nm/SNU6FrlqQsuShqSsL6Bz/UwLI+P0Yh9k=;
 b=ml9gO5gb0bT0Kdw1PuaLHavX/ePuKQO8eQEgjwG7k5AWMlYWTju247MA4WvpXtt0VjB8LmEvWTICs39FsI9YU3jeXwqmXH/YY+rU+06skLPhgQKcwxf0MSkgXPg6yM4Gz/wdH4x8jnsJv1pBMTbjPyBK72Mqsi7ikbHZC9oowUZL8uEY/yl31+zmoNrxIBab9WaYxihOLQJiOCmG8fDEVepV3QdtaY9BNXgtO4bRmdBy0ag0EkXbZVCSaVHoihwgPHToivyASUXOnco0R9uik7SUYb8pCqYyU3297WfwdIqsAqcmNVmdwWjcJ78Sncya3YdEfIveLTGzs706brh80Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOZ5ftY3nm/SNU6FrlqQsuShqSsL6Bz/UwLI+P0Yh9k=;
 b=eSDUhKoHwNqqencPyq99385vEXXXHGqdjpEq8MAAsoEeWav2A4tD2RSMEyhXiR0H10TQATylEYS70ZLXTbTJYXd+M8TxUCiJSRf+f/7ZjaMd1yOH3KvxhnCm/eAsHRJxv2vhuhEQ5eht4Huo0GKpEcPlYUoSj1T2wcDOXMxSVPM=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4781.jpnprd01.prod.outlook.com (20.179.175.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Fri, 25 Oct 2019 01:42:03 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 01:42:03 +0000
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
Thread-Index: AQHVilyPYEjRQuYiBUGesOeD75lglqdppwmAgADtdJA=
Date:   Fri, 25 Oct 2019 01:42:03 +0000
Message-ID: <TYAPR01MB4544AA3E636D8CCF46623B23D8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXuD4trBjqjgvZ3bimtDEHj4VNeG5-5NHFXkrOvYPd4=w@mail.gmail.com>
In-Reply-To: <CAMuHMdXuD4trBjqjgvZ3bimtDEHj4VNeG5-5NHFXkrOvYPd4=w@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b1c53ea3-d3bd-46e7-be53-08d758ec8970
x-ms-traffictypediagnostic: TYAPR01MB4781:
x-microsoft-antispam-prvs: <TYAPR01MB47814A4F6013A8E46139B545D8650@TYAPR01MB4781.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(199004)(189003)(229853002)(6916009)(71190400001)(54906003)(316002)(74316002)(71200400001)(3846002)(4326008)(6116002)(8936002)(81156014)(6436002)(81166006)(2906002)(7736002)(256004)(305945005)(55016002)(8676002)(6246003)(9686003)(478600001)(33656002)(26005)(186003)(446003)(11346002)(476003)(102836004)(486006)(25786009)(6506007)(66946007)(52536014)(66476007)(66556008)(64756008)(66446008)(4744005)(99286004)(76176011)(14454004)(7696005)(76116006)(66066001)(5660300002)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4781;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GWc9eLI3GFXycSK0f3LFNHYXOwv2G0hJF3eQAmOs0waFuO4SlnayHbNgAZ3pW7A4bdRFCh80w5TtkOHRM8bOIt8noiCVqn/AZTlWnSn7Fo9yPrx+MbIKz/r1GiormmggcAkvbvGk/EmvgRoCyP3aONDc0JsBCWV9gjo0VUbIbhMcn/ZaAlbYS2wvVkVSYE8pw5v1auKb7bCmgXorE96f/1tDQI8ZUvLo+F1laVGNnNztXAV5ciQsfnxaPjzrngJfl0yDJ0EUVfvUG7jALHWMcgaCn/YXoDS8wJFuiZ7egeLK1ZGHlIj/MshrM2QmdIZYkJvy5K2VFBo2Ve+E4KH+koFMlaMHRDWRccjkGOU6493xTCdl215vOP5pv42lj+yMzy5x4mqfTWRy9AaxDd8xHN2yCRGBgzdzge2NFC78Pzp0Dy2X8JV1GZee9dRrEyQk
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c53ea3-d3bd-46e7-be53-08d758ec8970
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 01:42:03.6418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DiOO0NeaOvD8ZBIip6ZFgBLCPb356i42nwzByyQCXe2WiswuLZtfvUicw3r7PoB6BAPlVbUg0IiI5RlY3klgCSAXmKUBVRoc1FkOpUlwiITiwsodHLlFp1Q6uu1FTjbz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4781
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMhDQoNCj4gRnJvbTog
R2VlcnQgVXl0dGVyaG9ldmVuLCBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyNCwgMjAxOSA4OjI2
IFBNDQo8c25pcD4NCj4gPiBUaGlzIGhhcmR3YXJlIG5lZWRzIHRvIGRlYXNzZXJ0IHJlc2V0cyBv
ZiBib3RoIGhvc3QgYW5kIHBlcmlwaGVyYWwuDQo+ID4gU28sIHRoaXMgcGF0Y2ggYWRkcyByZXNl
dCBjb250cm9sLg0KPiANCj4gSWYgdGhlIGhhcmR3YXJlIG5lZWRzIGl0LCBwcm9iYWJseSB5b3Ug
d2FudCB0byBtYWtlIENMS19SQ0FSX1VTQjJfQ0xPQ0tfU0VMDQo+IHNlbGVjdCBSRVNFVF9DT05U
Uk9MTEVSPw0KDQpZb3UncmUgY29ycmVjdC4gSSdsbCBmaXggaXQuDQoNCj4gPiBTaWduZWQtb2Zm
LWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
DQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcmNhci11c2IyLWNsb2NrLXNlbC5j
DQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yY2FyLXVzYjItY2xvY2stc2VsLmMNCj4g
DQo+ID4gQEAgLTE2NCw2ICsxNzIsMTAgQEAgc3RhdGljIGludCByY2FyX3VzYjJfY2xvY2tfc2Vs
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAgICAgICBpZiAoSVNf
RVJSKHByaXYtPmNsa3NbQ0xLX0lOREVYX0hTX1VTQl0pKQ0KPiA+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gUFRSX0VSUihwcml2LT5jbGtzW0NMS19JTkRFWF9IU19VU0JdKTsNCj4gPg0KPiA+ICsg
ICAgICAgcHJpdi0+cnN0cyA9IGRldm1fcmVzZXRfY29udHJvbF9hcnJheV9nZXRfb3B0aW9uYWxf
c2hhcmVkKCZwZGV2LT5kZXYpOw0KPiANCj4gSWYgdGhlIHJlc2V0IGlzIHJlYWxseSBuZWVkZWQs
IHlvdSBzaG91bGQgbm90IHVzZSB0aGUgb3B0aW9uYWwgQVBJLg0KDQpUaGF0J3MgdHJ1ZS4gU28s
IEknbGwgdXNlIGRldm1fcmVzZXRfY29udHJvbF9hcnJheV9nZXQoJnBkZXYtPmRldiwgdHJ1ZSwg
ZmFsc2UpDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
