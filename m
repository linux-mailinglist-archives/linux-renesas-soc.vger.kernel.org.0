Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26BB2E4606
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 10:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407557AbfJYIoc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 04:44:32 -0400
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:52480
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2407543AbfJYIob (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 04:44:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtnxewD1a3rZhbq+s2/4B/nuAYgMtqj0JJseviym8ojIYLXjI07VKRiw6rrGYHDi6yzrQZdWhD9cI9zr2QohPFrnscdxt6u+Fq7Yl0agxG6hPmK/A+4xorXyp+prYI+ZdKMiFHKNIfpnTvrQxo6r+qXpu3IEq+bCGWmm8r30KGTMvqFxQq0aU8AAtfHYlGAT6b9szz4Mjw3a3pepK1XKCEAAFQ5g41OiAIrsXxOEPn/stPezD3yefUxy76/xpwB1LcjvQ7NAg6gwUxjO26m6lMPKPSrs5lDUR8WG72sBWnTYXXt/2pC4GDjOi+MrmxUdTlYLYsLGoqjYGh3rOBgTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvczxZVS/IerpwtnVNKen+oTU9UXjoTmuJwI1cBXcM4=;
 b=H/yO+p+dBtWYGjsd4wRqsZBLlPyumGYvl1dzlaXVr5imrxcvKnVOAounNgIASo87jrfrRz6FNLTLpq6L7y+Fd2FNsDhToP547XuPDbyd/qFE21IXVlGNhRPibUEXK+yMx5j6UT+gA10vDEo08CBzMqnBOKElMgiyTGHpZThgaSPRS3DbRB28CoOvMpniXh1ktOgCoSt0g4qBldbSA2hzygdi/VM60qonWAZHGoyJfYahEIAmMmEWLOBUKj1q+k5E8rk5fOLEyCAR1aJNTdqoEwumrU8O+SbyxYP3SAJRHFuEQqfCGGA2SP/40z4Otc+MPg03DZ0CsyhNJfv1kSQkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvczxZVS/IerpwtnVNKen+oTU9UXjoTmuJwI1cBXcM4=;
 b=ifutjFRPLHhaePnooze6lPyrrNpv7jHf2Sy8hKXAloFxH8Nv9aNguy4d73BKg02PMeg8ZVsNIt8VUJu8l/5YmipNRsa2/rWYmsYdP7HxLmMlYf3umyGEOzNKSaFmigH2Ku5N11Xx+HgaKUxTOfNfMdd9zLntFl9ZYwWfSx+YWEs=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5215.jpnprd01.prod.outlook.com (20.179.173.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 08:44:28 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 08:44:28 +0000
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
Subject: RE: [PATCH 2/3] clk: renesas: rcar-usb2-clock-sel: Add multiple
 clocks management
Thread-Topic: [PATCH 2/3] clk: renesas: rcar-usb2-clock-sel: Add multiple
 clocks management
Thread-Index: AQHVilyQBno/7qP88EeW+nLHX4y1PKdpqV2AgADp/1CAAGizAIAADsUw
Date:   Fri, 25 Oct 2019 08:44:28 +0000
Message-ID: <TYAPR01MB4544D173479B25DB73CBFF3CD8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU=58w=4A0WcqytFfyV_Q11BgYaDNsMsA8Z15mnm--ang@mail.gmail.com>
 <TYAPR01MB4544D5F2A77FBBA7B0AF7EBDD8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <CAMuHMdV7upJi78CymxVYKzDdFWb-qHrnohfnULbNfXjF-QXKRA@mail.gmail.com>
In-Reply-To: <CAMuHMdV7upJi78CymxVYKzDdFWb-qHrnohfnULbNfXjF-QXKRA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fb3eac74-545d-4015-522c-08d759278c44
x-ms-traffictypediagnostic: TYAPR01MB5215:
x-microsoft-antispam-prvs: <TYAPR01MB5215737B798E87EA7B29A09ED8650@TYAPR01MB5215.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(199004)(189003)(5660300002)(316002)(99286004)(86362001)(33656002)(54906003)(66446008)(71190400001)(71200400001)(476003)(64756008)(66476007)(2906002)(11346002)(76116006)(66946007)(256004)(81166006)(81156014)(446003)(66556008)(14454004)(7696005)(76176011)(305945005)(6506007)(7736002)(186003)(8936002)(6436002)(26005)(8676002)(53546011)(74316002)(102836004)(52536014)(486006)(66066001)(9686003)(25786009)(55016002)(6916009)(229853002)(478600001)(6116002)(6246003)(3846002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5215;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wMiwK8EbxTxxOWpr4bJPo6joQSvYzIlOHhtrKp3oWj9kCqiPSEQ8Es8yjYFJbtGFB8J9yQ8WNHslzRGpedrrP35P5AJX7K+1AOSWteU6rRdepF0EmkCKrQeAFGU9P6EYPuIicaYEn7YXNTt/GYvyv/2VHYYqyn+L0Hr2WYoP+a8x4nkkkUqC/sp3rJMh0E02rZyjCcbxHky+MAWgcOVyO38Law9W8hoxeNBeGDmJ0aNe88eAeajxsftVOj4BCxiNYB91QxEUl498kYBWGeHmtFYsIBQKbHIC3mDjvBhtRvILGPIuLRaNrLEMSRdJRd5j/BMvFRiaBsCfDU1S9qdf9z6N3znnYOfEnhM1TMAj3842AuqFkOF1NuDoIyaf6Xn0EJGJbbR8knVnduLeXTeyJBeZ3PAIIkoL6aW63S1/GiyR4WbDNuKoT3yJm2AttlBX
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3eac74-545d-4015-522c-08d759278c44
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 08:44:28.6619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z++z13Kfwbzb89MbATovq7LN8EECKuIJiCyQynhC7J+VgZhk027t/8F7uuRQ8R61B77xc6OhcdjWiFkkJqrTDs9+cEFO1ZbUQLIQDXEjBszDFD+C0/msENAJ/q+dii0M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5215
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBPY3RvYmVyIDI1LCAyMDE5IDQ6NDcgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMzozNiBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuLCBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyNCwgMjAxOSA4OjM1IFBNDQo+
ID4gPHNuaXA+DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcmNhci11c2IyLWNs
b2NrLXNlbC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcmNhci11c2IyLWNs
b2NrLXNlbC5jDQo+IA0KPiA+ID4gPiBAQCAtMTMxLDYgKzE1NiwxNCBAQCBzdGF0aWMgaW50IHJj
YXJfdXNiMl9jbG9ja19zZWxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
PiA+ID4gICAgICAgICBwbV9ydW50aW1lX2VuYWJsZShkZXYpOw0KPiA+ID4gPiAgICAgICAgIHBt
X3J1bnRpbWVfZ2V0X3N5bmMoZGV2KTsNCj4gPiA+DQo+ID4gPiBwbV9ydW50aW1lX2dldF9zeW5j
KCkgd2lsbCBoYXZlIGFscmVhZHkgZW5hYmxlZCB0aGUgZmlyc3QgbW9kdWxlIGNsb2NrIGxpc3Rl
ZCBpbg0KPiA+ID4gdGhlIERUICJjbG9ja3MiIHByb3BlcnR5Lg0KPiA+ID4NCj4gPiA+IElmIHlv
dSB3YW50IHRoZSBkcml2ZXIgdG8gbWFuYWdlIGFsbCBjbG9ja3MgaXRzZWxmLCBwZXJoYXBzIHRo
ZSBQTSBSdW50aW1lDQo+ID4gPiBjYWxscyBzaG91bGQgYmUgZHJvcHBlZD8NCj4gPg0KPiA+IEkn
bSB0aGlua2luZyBQTSBSdW50aW1lIGNhbGxzIGFyZSByZWxhdGVkIHRvIHBvd2VyIGRvbWFpbiBj
b250cm9sIHNvIHRoYXQgd2UgY2Fubm90DQo+ID4gZHJvcCBpdC4gT3IsIHNpbmNlIHRoZSBoYXJk
d2FyZSBpcyB0aGUgQWx3YXlzLW9uIGRvbWFpbiwgY2FuIHdlIGRyb3AgaXQgYW55d2F5Pw0KPiAN
Cj4gVGhhdCdzIHJpZ2h0OiBpZiB0aGUgaGFyZHdhcmUgYmxvY2sgZXZlciBlbmRzIHVwIGluIGEg
bm9uLWFsd2F5cy1vbg0KPiBwb3dlciBkb21haW4sDQo+IHlvdSB3b24ndCBoYXZlIGEgY2hvaWNl
IGJ1dCB0byB1c2UgUE0gUnVudGltZS4NCg0KU28sIHNob3VsZCBJIGtlZXAgdGhlIFBNIFJ1bnRp
bWUgY2FsbHM/DQojIEluIHN1Y2ggdGhlIGNhc2UsIEkgc2hvdWxkIGFkZCB0byBkZXNjcmliZSBw
b3dlci1kb21haW5zIHByb3BlcnR5IGludG8NCiMgdGhlIGR0LWJpbmRpbmcgZG9jIHRob3VnaCA6
KQ0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
