Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA03F18161B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2020 11:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgCKKtC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Mar 2020 06:49:02 -0400
Received: from mail-eopbgr1400119.outbound.protection.outlook.com ([40.107.140.119]:64288
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726684AbgCKKtC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Mar 2020 06:49:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArbMXksAdMjH71GTkJLU7+cDAsZikNYaWV/R9PJR3Jt9XpuKjFJ8TGrn3O3GFU5TZZ262mk1qzHt9d3i9CnxLugMMTv2zuJNJP392u9MSXKupweZa/wiiKrJNwsyigcfuVkbmN4EVwpfMVq4ziD9m7tl2z4suf8JRCW5Z9gh1KKA30fVjMpbkQNZLFTaxRJjq3/03R2MBPxnT98onx1ONtHOkJonYk24qW9OloMbYpxgGJvYY1rbbbVF8xl+skkgF1Eorc0feZz+5wGMIyu6UEgecoE9A5GTDk3TYaPuCx9Df5O2PmZF7gkBLPR1zpoPBsneSFlUCbqD4qzFv8ZOTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMXbZYQQb8m0Y8Qy8wJLAS0Skd/dIIb09fC0Fvcvt2E=;
 b=j6TRcUhPPvueyuJB+uzvKE5Yqr0XftJTI6s9PzyIqeY/bbw0RdIKujpezqplopugyKHAJVieCz2Mt69Zmn47QfazsNY/yMggCPgOU0hapZp4qqZh/xK3Nn+HzVVmZuylV8A/a66YqhAw4ms7fID3GpahO6pKDcZ417oWaT49xHOqLGRnFWam2GDyrHoB8jOZWUWg1MMo61Zh4FIgmC38aROFY6v1wq0pjiM+9ziqAfIenaOsZ3/8DAZ4S3gErC1UPCwmeGCqikl1Isr+FEtiLHdxuf96tY/pH0OCj1GwKX/uuhTQIp0DsRR76WE4WWD6X0wgcSUT/iaonbSnWi1D/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMXbZYQQb8m0Y8Qy8wJLAS0Skd/dIIb09fC0Fvcvt2E=;
 b=hYgmeJaCTBZFBieHkGniwlXLVw/+wqsDLBsn/nR6S4TLqyR9c9xzJddVP+Cco94SGUl/lfUg9b9bPR289TnpN3ezuIs7uU/44tGqRg0TjMVAuD/d99vYu8zq6GbyPTTGwsB4t5ScFyae8T+3nrU16caIpmxxRZVoEtvOLgA4Bfc=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB3557.jpnprd01.prod.outlook.com (20.178.98.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Wed, 11 Mar 2020 10:48:56 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b%7]) with mapi id 15.20.2793.018; Wed, 11 Mar 2020
 10:48:56 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
Thread-Topic: [PATCH v3 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
Thread-Index: AQHV9xxgNgWVqJ/znkuQrjrqPZBb+6hDK7qAgAAJnFA=
Date:   Wed, 11 Mar 2020 10:48:56 +0000
Message-ID: <OSBPR01MB35902F7A2B38C875C731318EAAFC0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1583872919-7757-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583872919-7757-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVqwLEavjnPgZaevFqjTytAPMmT042yRrcDw9YpkjE3bg@mail.gmail.com>
In-Reply-To: <CAMuHMdVqwLEavjnPgZaevFqjTytAPMmT042yRrcDw9YpkjE3bg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7efc6479-6174-4517-2725-08d7c5a9cc78
x-ms-traffictypediagnostic: OSBPR01MB3557:
x-microsoft-antispam-prvs: <OSBPR01MB355702F7351648482A66DFF7AAFC0@OSBPR01MB3557.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(6029001)(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(199004)(26005)(52536014)(66476007)(64756008)(66446008)(186003)(76116006)(66946007)(66556008)(316002)(8676002)(81156014)(81166006)(2906002)(478600001)(86362001)(8936002)(54906003)(5660300002)(53546011)(6506007)(7416002)(71200400001)(6916009)(7696005)(9686003)(55016002)(4326008)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3557;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p9nBI6v7XTdg1g7q3GbQGfM0EY+ToUOXbJHVlTpv9nUR7VNq4/G/LL+UBy2h6rOguzMBNMiEcL2ljdrjATSr5olDBMBdSWxhaHv8E1oPlrthsOQHOcM+3YEDNvnzaPYPj0KLuwzdYc2MrsT3lEp5907HPJPs2B6aE0N1nwgWBpTZTSiljnqFbW88qZSswKUMdzoxzSUQvd2dQq8xo8AWd1F40hJizwcrZ2Hl9N/nHdtJ/bQlt6CcjWrqUK8wUmkAhfPiJpL0lBCQSfdYVx8R98Itit18O60P7P3tRsVLoxGixorS4DGJXB82sBecepA6P766Nbh4+jCUFvUtSy6V3WDKJ3BCUessbE0ofm1a8I1QLtVQyGmlHZRG931PrkbrLNZtGPAxb3NCQK+StMVwyfUGvzafiOGSFXKQiafpctCzw39fYvlOjmp4oWNoGRVe
x-ms-exchange-antispam-messagedata: gLZTFtqWpXW27+I6+AQXm1xQgi27FbfgKF+/Owxtt3bGm8c3bgNb1birDBdFF9oQsRx1b4a6FJhux7I0YK3WCZRmvkH5hQt9HbqU26uP/fWYy4j1vXUKsV0fRD6A2yjCdXuuxX1j5CmbxvZJ8oZcog==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efc6479-6174-4517-2725-08d7c5a9cc78
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 10:48:56.4746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mRpIrd/mv/jZ3geNd+9N7zPa69WG90pjelK6yNYrsGVDTbiyX4yl+lL812O1KVjLsEMc27RI0jdzyTItDmUdbaKp4q6DO6WB1EaD9OoTpQFbdB0JOwMYXY/giY+KW3I8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3557
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPg0KPiBTZW50OiAxMSBNYXJjaCAyMDIwIDEwOjA4DQo+IFRvOiBQcmFiaGFrYXIgTWFo
YWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6
IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+OyBTYW0gUmF2bmJvcmcN
Cj4gPHNhbUByYXZuYm9yZy5vcmc+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBE
YW5pZWwgVmV0dGVyDQo+IDxkYW5pZWxAZmZ3bGwuY2g+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBr
ZXJuZWwub3JnPjsgTWFyayBSdXRsYW5kDQo+IDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47IE1hZ251
cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+Ow0KPiBEUkkgRGV2ZWxvcG1lbnQgPGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBvcGVuIGxpc3Q6T1BFTg0KPiBGSVJNV0FSRSBB
TkQgRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTDQo+IDxkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LQ0KPiBrZXJuZWxAdmdl
ci5rZXJuZWwub3JnPjsgTGludXgtUmVuZXNhcyA8bGludXgtcmVuZXNhcy0NCj4gc29jQHZnZXIu
a2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzJdIGFybTY0OiBkdHM6IHJl
bmVzYXM6IEFkZCBIaUhvcGUgUlovRzJNIGJvYXJkDQo+IHdpdGggaWRrLTExMTB3ciBkaXNwbGF5
DQo+DQo+IEhpIExhZCwNCj4NCj4gT24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgOTo0MiBQTSBMYWQg
UHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi0NCj4gbGFkLnJqQGJwLnJlbmVzYXMuY29tPiB3
cm90ZToNCj4gPiBGcm9tOiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5l
c2FzLmNvbT4NCj4gPg0KPiA+IFRoZSBIaUhvcGUgUlovRzJNIGlzIGFkdmVydGlzZWQgYXMgY29t
cGF0aWJsZSB3aXRoIHBhbmVsIGlkay0xMTEwd3INCj4gPiBmcm9tIEFkdmFudGVjaCwgaG93ZXZl
ciB0aGUgcGFuZWwgaXNuJ3Qgc29sZCBhbG9uZ3NpZGUgdGhlIGJvYXJkLg0KPiA+IEEgbmV3IGR0
cywgYWRkaW5nIGV2ZXJ5dGhpbmcgdGhhdCdzIHJlcXVpcmVkIHRvIGdldCB0aGUgcGFuZWwgdG8g
d29yaw0KPiA+IHRoZSBIaUhvcGUgUlovRzJNLCBpcyB0aGUgbW9zdCBjb252ZW5pZW50IHdheSB0
byBzdXBwb3J0IHRoZSBIaUhvcGUNCj4gPiBSWi9HMk0gd2hlbiBpdCdzIGNvbm5lY3RlZCB0byB0
aGUgaWRrLTExMTB3ci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8
ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+IEFja2VkLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtDQo+IGxhZC5yakBicC5yZW5l
c2FzLmNvbT4NCj4NCj4gVGhhbmtzIGZvciBwaWNraW5nIHVwIHRoaXMgcGF0Y2ghDQo+DQo+ID4g
LS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3
NzRhMS1oaWhvcGUtcnpnMm0tZXgtaWRrLQ0KPiAxMTEwd3IuDQo+ID4gKysrIGR0cw0KPiA+IEBA
IC0wLDAgKzEsODYgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAN
Cj4gPiArLyoNCj4gPiArICogRGV2aWNlIFRyZWUgU291cmNlIGZvciB0aGUgSGlIb3BlIFJaL0cy
TSBzdWIgYm9hcmQgY29ubmVjdGVkIHRvIGFuDQo+ID4gKyAqIEFkdmFudGVjaCBJREstMTExMFdS
IDEwLjEiIExWRFMgcGFuZWwNCj4gPiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIwIFJl
bmVzYXMgRWxlY3Ryb25pY3MgQ29ycC4NCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAi
cjhhNzc0YTEtaGlob3BlLXJ6ZzJtLWV4LmR0cyINCj4gPiArDQo+ID4gKy8gew0KPiA+ICsgICAg
ICAgYmFja2xpZ2h0IHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJwd20tYmFj
a2xpZ2h0IjsNCj4gPiArICAgICAgICAgICAgICAgcHdtcyA9IDwmcHdtMCAwIDUwMDAwPjsNCj4g
PiArDQo+ID4gKyAgICAgICAgICAgICAgIGJyaWdodG5lc3MtbGV2ZWxzID0gPDAgMiA4IDE2IDMy
IDY0IDEyOCAyNTU+Ow0KPiA+ICsgICAgICAgICAgICAgICBkZWZhdWx0LWJyaWdodG5lc3MtbGV2
ZWwgPSA8Nj47DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgIHBhbmVsLWx2ZHMg
ew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFkdmFudGVjaCxpZGstMTExMHdy
IiwgInBhbmVsLWx2ZHMiOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgd2lkdGgtbW0gPSA8
MjIzPjsNCj4gPiArICAgICAgICAgICAgICAgaGVpZ2h0LW1tID0gPDEyNT47DQo+ID4gKw0KPiA+
ICsgICAgICAgICAgICAgICBkYXRhLW1hcHBpbmcgPSAiamVpZGEtMjQiOw0KPiA+ICsNCj4gPiAr
ICAgICAgICAgICAgICAgcGFuZWwtdGltaW5nIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAvKiAxMDI0eDYwMCBANjBIeiAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2Nr
LWZyZXF1ZW5jeSA9IDw1MTIwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaGFj
dGl2ZSA9IDwxMDI0PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB2YWN0aXZlID0gPDYw
MD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaHN5bmMtbGVuID0gPDI0MD47DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgaGZyb250LXBvcmNoID0gPDQwPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBoYmFjay1wb3JjaCA9IDw0MD47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgdmZyb250LXBvcmNoID0gPDE1PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICB2YmFjay1wb3JjaCA9IDwxMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdnN5bmMt
bGVuID0gPDEwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAg
ICAgICAgIHBvcnQgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBhbmVsX2luOiBlbmRw
b2ludCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9p
bnQgPSA8Jmx2ZHMwX291dD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiAr
ICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgIH07DQo+DQo+IEkgYmVsaWV2ZSB0aGUgcGxh
biB3YXMgdG8gaW5jbHVkZSB0aGUgZXhpc3RpbmcgcnpnMi1hZHZhbnRlY2gtaWRrLTExMTB3ci0N
Cj4gcGFuZWwuZHRzaSBpbnN0ZWFkLCB0byBwcm92aWRlIHRoZSBwYW5lbC1sdmRzIG5vZGUuLi4N
Cj4NCkFoaGEgbWlzc2VkIGl0LCBJJ2xsIHF1aWNrbHkgcmVzcGluIHRoZSBzZXJpZXMgZml4aW5n
IGl0Lg0KDQo+ID4gK307DQo+ID4gKw0KPiA+ICsmZ3BpbzEgew0KPiA+ICsgICAgICAgLyoNCj4g
PiArICAgICAgICAqIFdoZW4gR1AxXzIwIGlzIExPVyBMVkRTMCBpcyBjb25uZWN0ZWQgdG8gdGhl
IExWRFMgY29ubmVjdG9yDQo+ID4gKyAgICAgICAgKiBXaGVuIEdQMV8yMCBpcyBISUdIIExWRFMw
IGlzIGNvbm5lY3RlZCB0byB0aGUgTFQ4OTE4TA0KPiA+ICsgICAgICAgICovDQo+ID4gKyAgICAg
ICBsdmRzLWNvbm5lY3Rvci1lbi1ncGlvIHsNCj4gPiArICAgICAgICAgICAgICAgZ3Bpby1ob2c7
DQo+ID4gKyAgICAgICAgICAgICAgIGdwaW9zID0gPDIwIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+
ICsgICAgICAgICAgICAgICBvdXRwdXQtbG93Ow0KPiA+ICsgICAgICAgICAgICAgICBsaW5lLW5h
bWUgPSAibHZkcy1jb25uZWN0b3ItZW4tZ3BpbyI7DQo+ID4gKyAgICAgICB9Ow0KPiA+ICt9Ow0K
PiA+ICsNCj4gPiArJmx2ZHMwIHsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiAr
DQo+ID4gKyAgICAgICBwb3J0cyB7DQo+ID4gKyAgICAgICAgICAgICAgIHBvcnRAMSB7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgbHZkczBfb3V0OiBlbmRwb2ludCB7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX2luPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0K
PiA+ICsgICAgICAgfTsNCj4gPiArfTsNCj4NCj4gLi4uIGFuZCB0aGUgbHZkc19jb25uZWN0b3Ig
ZW5kcG9pbnQgY29uZmlndXJhdGlvbi4NCj4NCkFncmVlZC4NCg0KQ2hlZXJzLA0KLS1QcmFiaGFr
YXINCg0KPiBUaGUgcmVzdCBsb29rcyBnb29kIHRvIG1lLg0KPg0KPiBHcntvZXRqZSxlZXRpbmd9
cywNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4gLS0NCj4gR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC0NCj4gbTY4ay5vcmcNCj4NCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBHbWJILCBHZXNjaGFl
ZnRzZnVlaHJlci9QcmVzaWRlbnQ6IENhcnN0ZW4gSmF1Y2gsIFNpdHogZGVyIEdlc2VsbHNjaGFm
dC9SZWdpc3RlcmVkIG9mZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFzdHJhc3NlIDEwLCA0MDQ3
MiBEdWVzc2VsZG9yZiwgR2VybWFueSwgSGFuZGVsc3JlZ2lzdGVyL0NvbW1lcmNpYWwgUmVnaXN0
ZXI6IER1ZXNzZWxkb3JmLCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlkZW50aWZpY2F0aW9uIG5v
LjogREUgMTE5MzUzNDA2IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5vLjogREUgMTQ5Nzg2NDcN
Cg==
