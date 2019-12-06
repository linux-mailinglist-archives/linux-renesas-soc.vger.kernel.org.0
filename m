Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28C361153F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 16:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfLFPLs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 10:11:48 -0500
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:38707
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726251AbfLFPLs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 10:11:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGwquUIllgTipFcb5Rb30Rs7IDh1A/VKzr9XV/OcNqb7GyZRz/lR1k3bLru9Wz/gbacO80YlBAmcACiy0Zv+d4SGcAvJE5xF0xE4ddixbIQqATDsNIqjjdxp857ROnImplz3VoN1/zxhbRGIWtUmcTU3fFZgZ2fQLPv9CARO4+85JMbO9MQt1KLWcNOfpWMFYx0zEZMtUeOFBMCATp1Pjsv3ymNJVcrVcWI5cZslR49GPFP3Xppxh/U3N7Ixc6gFr5tXa0fl0nU7fAVIoppMXmvbuQXEsBvH7bQTRahxTnftVdM9YSqQmFHo+ksogrRP3ENEqUO8cTZu+uiHFnyPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY0fRcNtjuEiroV4pcQGzu4lQlswE2OEyAcoZg0XzgM=;
 b=JJtkQiNJKshcCbUQL+i8eSYa91MWVq8q7hIVk77vg3PybNVCogAhi/z10oSFrhTMyGGdor4Oqh7YTaPC/3lFJ5HNBpqy6vyOZI7d5HuuGPRSa5vsNa6lg1JrAJNxANoKy92RFYNPLnXYWIGVwt2nLGSDEJQAg7/hm4XkVK+a5QJMfdKLkjmjRMzkWvfq6FGppxKgCCLTX0WzafjaxBeayKNivKhywnNwibcAX10rvbgEZziUQbUzJg+pxdLV8beopWctTDYwg2Y7ML4eHkbTVEy7xqfc6+Zawyi7Mn7WD00GAd54lGtLaseg2IXOXhHJV253SkGI+5KBuCAKzg/T7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY0fRcNtjuEiroV4pcQGzu4lQlswE2OEyAcoZg0XzgM=;
 b=fzMevp8Mw4BeIkfzWv9DcaV3nshUd6sUF/twhwPJ14EFXUJHzOcN9xYz+ereTTCRLTNshX39JXS9zEKytjJcoRC5XlfD8Xhhoe6nxVacgBv71Mw4XkXgtFIW49ZmCIKDnGgdNAJjEkD5G8gNeGCvH83u+L0EjrN3hW7oeSrl94A=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1546.jpnprd01.prod.outlook.com (52.133.162.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Fri, 6 Dec 2019 15:11:44 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2495.014; Fri, 6 Dec 2019
 15:11:44 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
Thread-Topic: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
Thread-Index: AQHVXc+S57mj9oC72Eeu0P6rCOw/zacSKVsAgAAGgdCAbj8QgIAtZCkw
Date:   Fri, 6 Dec 2019 15:11:44 +0000
Message-ID: <TY1PR01MB177044501C5362662DB2ED2EC05F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqKWWCpEeBd4UFaqBVffS-OxUNAHfvtJKcGsLDR+f=Uytg@mail.gmail.com>
 <TY1PR01MB177060B843107361FEF44022C0A20@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20191107180043.GA24231@pendragon.ideasonboard.com>
In-Reply-To: <20191107180043.GA24231@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0805c9c7-7b70-48e3-f122-08d77a5e9b4f
x-ms-traffictypediagnostic: TY1PR01MB1546:|TY1PR01MB1546:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1546B1EC2E4016D905560274C05F0@TY1PR01MB1546.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(189003)(199004)(4326008)(9686003)(26005)(71190400001)(81166006)(2906002)(55016002)(6916009)(8676002)(8936002)(966005)(71200400001)(86362001)(478600001)(186003)(7696005)(316002)(74316002)(7416002)(76176011)(33656002)(305945005)(102836004)(66446008)(54906003)(229853002)(76116006)(53546011)(99286004)(5660300002)(66946007)(44832011)(6506007)(52536014)(66476007)(64756008)(81156014)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1546;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UyaOsSqKIB8+O2VQGO8SJf3zsZRjK2DKjaDg9lX2PdoDbjRnDM0AUnPmpzvLzu5NY0MQdVph3wPs0RU8+YlKIBn7ZsDo4tNZ/I8gKqxClyBwZV6fr6lwi2vAKzhJTggJwZcPzRT3C9uHOd76R1lBBqmw2mQjk3U8ks8pTsbgy6q+CrbdI+I5hxL5X43bGlfvkwL2fi+ho1hqd9I6Cnvod6eVFNtGO4GwCHJlXRKNmhLvBv6KZaKf43o4QuSVAsYKbb9/e95Xaw4oJpomYnaD/YlG1RjbShlj8ChojLUtJFKCbEWNeCoP0WDZqlF0XMSeYWh7aIIzCloF0tWuYKK9ia/fO6yo1fziOKU0dhhWh7bvuWIeWvXRZj2Q8lwjRxllbY4tMdj+/Ur2egTRNlmw/1q8MFd+QX3RX2xR/mOh8HaQsCU3flfAfA8S/lpXe8kRXcgg2Sjw/yE/i5o6BDrk8aSIZeeOORIqzPztjVLvhNw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0805c9c7-7b70-48e3-f122-08d77a5e9b4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 15:11:44.5557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/CZaexGnLsFx3X4d4wMqquBZgXyE9cmyPgR4QdT2uMgR2WG1jWdxm89KfsDHGlC1xLuYkx/lph1esiAJjwIxreDo/n0uJTDC3XYTxbZj1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1546
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IGRl
dmljZXRyZWUtb3duZXJAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlLW93bmVyQHZnZXIua2Vy
bmVsLm9yZz4gT24gQmVoYWxmIE9mIExhdXJlbnQgUGluY2hhcnQNCj4gU2VudDogMDcgTm92ZW1i
ZXIgMjAxOSAxODowMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvOF0gZHQtYmluZGluZ3M6
IGRpc3BsYXk6IEFkZCBiaW5kaW5ncyBmb3IgTFZEUyBidXMtdGltaW5ncw0KPiANCj4gSGVsbG8g
RmFicml6aW8sDQo+IA0KPiBPbiBUaHUsIEF1ZyAyOSwgMjAxOSBhdCAwMjozODowNlBNICswMDAw
LCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+ID4gT24gMjkgQXVndXN0IDIwMTkgMTU6MDMgUm9i
IEhlcnJpbmcgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIEF1ZyAyOCwgMjAxOSBhdCAxOjM2IFBNIEZh
YnJpemlvIENhc3RybyB3cm90ZToNCj4gPiA+Pg0KPiA+ID4+IER1YWwtTFZEUyBjb25uZWN0aW9u
cyBuZWVkIG1hcmtlcnMgaW4gdGhlIERULCB0aGlzIHBhdGNoIGFkZHMNCj4gPiA+PiBzb21lIGNv
bW1vbiBkb2N1bWVudGF0aW9uIHRvIGJlIHJlZmVyZW5jZWQgYnkgYm90aCBwYW5lbHMgYW5kDQo+
ID4gPj4gYnJpZGdlcy4NCj4gPiA+Pg0KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENh
c3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4+DQo+ID4gPj4gLS0t
DQo+ID4gPj4gdjItPnYzOg0KPiA+ID4+ICogbmV3IHBhdGNoDQo+ID4gPj4gLS0tDQo+ID4gPj4g
IC4uLi9iaW5kaW5ncy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbCAgICAgICAgIHwgMzgg
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0
aW9ucygrKQ0KPiA+ID4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnVzLXRpbWluZ3MvbHZkcy55YW1sDQo+ID4gPj4NCj4gPiA+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnVzLXRpbWluZ3MvbHZkcy55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnVzLXRpbWluZ3MvbHZkcy55YW1sDQo+ID4gPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gPiA+PiBpbmRleCAwMDAwMDAwLi5mMzViNTVhDQo+ID4gPj4gLS0tIC9kZXYvbnVs
bA0KPiA+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2J1cy10aW1pbmdzL2x2ZHMueWFtbA0KPiA+ID4+IEBAIC0wLDAgKzEsMzggQEANCj4gPiA+PiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ID4NCj4gPiA+IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKSBpcyBwcmVmZXJyZWQgZm9yIG5ldyBiaW5kaW5ncy4NCj4g
PiA+DQo+ID4gPj4gKyVZQU1MIDEuMg0KPiA+ID4+ICstLS0NCj4gPiA+PiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbCMNCj4g
PiA+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjDQo+ID4gPj4gKw0KPiA+ID4+ICt0aXRsZTogQ29tbW9uIFByb3BlcnRpZXMgZm9yIGJ1cyB0
aW1pbmdzIG9mIExWRFMgaW50ZXJmYWNlcw0KPiA+ID4+ICsNCj4gPiA+PiArbWFpbnRhaW5lcnM6
DQo+ID4gPj4gKyAgLSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPg0K
PiA+ID4+ICsgIC0gRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5j
b20+DQo+ID4gPj4gKw0KPiA+ID4+ICtkZXNjcmlwdGlvbjogfA0KPiA+ID4+ICsgIFRoaXMgZG9j
dW1lbnQgZGVmaW5lcyBkZXZpY2UgdHJlZSBwcm9wZXJ0aWVzIGNvbW1vbiB0byBMVkRTIGFuZCBk
dWFsLUxWRFMNCj4gPiA+PiArICBpbnRlcmZhY2VzLCB3aGVyZSBhIGR1YWwtTFZEUyBpbnRlcmZh
Y2UgaXMgYSBkdWFsLWxpbmsgY29ubmVjdGlvbiB3aXRoIGV2ZW4NCj4gPiA+PiArICBwaXhlbHMg
dHJhdmVsaW5nIG9uIG9uZSBjb25uZWN0aW9uLCBhbmQgd2l0aCBvZGQgcGl4ZWxzIHRyYXZlbGlu
ZyBvbiB0aGUgb3RoZXINCj4gPiA+PiArICBjb25uZWN0aW9uLg0KPiANCj4gQXMgeW91IGRlZmlu
ZSBhIGR1YWwtTFZEUyBpbnRlcmZhY2UgYXMgImEgZHVhbC1saW5rIGNvbm5lY3Rpb24iLCBzaG91
bGQNCj4gdGhpcyBiZSAiZXZlbiBwaXhlbHMgdHJhdmVsaW5nIG9uIG9uZSBsaW5rLCBhbmQgd2l0
aCBvZGQgcGl4ZWxzDQo+IHRyYXZlbGluZyBvbiB0aGUgb3RoZXIgbGluayIgPw0KDQpXaWxsIGNo
YW5nZS4NCg0KVGhhbmtzLA0KRmFiDQoNCj4gDQo+ID4gPj4gKyAgVGhpcyBkb2N1bWVudCBkb2Vz
bid0IGNvbnN0aXR1ZSBhIGRldmljZSB0cmVlIGJpbmRpbmcgc3BlY2lmaWNhdGlvbiBieSBpdHNl
bGYNCj4gPiA+DQo+ID4gPiB0eXBvOiBjb25zdGl0dXRlDQo+ID4NCj4gPiBXZWxsIHNwb3R0ZWQh
DQo+ID4NCj4gPiA+PiArICBidXQgaXMgbWVhbnQgdG8gYmUgcmVmZXJlbmNlZCBieSBkZXZpY2Ug
dHJlZSBiaW5kaW5ncy4NCj4gPiA+PiArICBXaGVuIHJlZmVyZW5jZWQgZnJvbSBwYW5lbCBvciBi
cmlkZ2UgZGV2aWNlIHRyZWUgYmluZGluZ3MsIHRoZSBwcm9wZXJ0aWVzDQo+ID4gPj4gKyAgZGVm
aW5lZCBpbiB0aGlzIGRvY3VtZW50IGFyZSBkZWZpbmVkIGFzIGZvbGxvd3MuIFRoZSBwYW5lbCBh
bmQgYnJpZGdlIGRldmljZQ0KPiA+ID4+ICsgIHRyZWUgYmluZGluZ3MgYXJlIHJlc3BvbnNpYmxl
IGZvciBkZWZpbmluZyB3aGV0aGVyIGVhY2ggcHJvcGVydHkgaXMgcmVxdWlyZWQNCj4gPiA+PiAr
ICBvciBvcHRpb25hbC4NCj4gPiA+PiArDQo+ID4gPj4gK3Byb3BlcnRpZXM6DQo+ID4gPj4gKyAg
ZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzOg0KPiA+ID4+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+ID4+
ICsgICAgZGVzY3JpcHRpb246DQo+ID4gPj4gKyAgICAgIFRoaXMgcHJvcGVydHkgaXMgc3BlY2lm
aWMgdG8gYW4gaW5wdXQgcG9ydCBvZiBhIHNpbmsgZGV2aWNlLiBXaGVuDQo+ID4gPg0KPiA+ID4g
VGhlIHNjaGVtYSBzaG91bGQgZGVmaW5lIHdoYXQgbm9kZXMgdGhlc2UgZ28gaW4uIFRoZSBkZXNj
cmlwdGlvbiBzZWVtcw0KPiA+ID4gdG8gaW5kaWNhdGUgaW4gJ3BvcnQnIG5vZGVzIChvciBlbmRw
b2ludD8pLCBidXQgeW91ciB1c2UgaW4gdGhlIHBhbmVsDQo+ID4gPiBiaW5kaW5nIHB1dHMgdGhl
bSBpbiB0aGUgcGFyZW50Lg0KPiA+DQo+ID4gRGlkIHlvdSBtYW5hZ2UgdG8gcmVhZCB0aGlzPw0K
PiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExMTk2MDcvDQo+ID4NCj4g
PiBDb3VsZCB5b3UgcGxlYXNlIGFkdmljZSBvbiBob3cgdG8gZG8gdGhpcyBwcm9wZXJseT8NCj4g
Pg0KPiA+ID4+ICsgICAgICBzcGVjaWZpZWQsIGl0IG1hcmtzIHRoZSBwb3J0IGFzIHJlY2lwaWVu
dCBvZiBldmVuLXBpeGVscy4NCj4gPiA+PiArDQo+ID4gPj4gKyAgZHVhbC1sdmRzLW9kZC1waXhl
bHM6DQo+ID4gPj4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gPj4gKyAgICBkZXNjcmlwdGlvbjoN
Cj4gPiA+PiArICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBzcGVjaWZpYyB0byBhbiBpbnB1dCBwb3J0
IG9mIGEgc2luayBkZXZpY2UuIFdoZW4NCj4gPiA+PiArICAgICAgc3BlY2lmaWVkLCBpdCBtYXJr
cyB0aGUgcG9ydCBhcyByZWNpcGllbnQgb2Ygb2RkLXBpeGVscy4NCj4gPiA+DQo+ID4gPiBIb3dl
dmVyLCBJIGRvbid0IHRoaW5rIHlvdSBldmVuIG5lZWQgdGhlc2UuIEEgcGFuZWwncyBwb3J0IG51
bWJlcnMgYXJlDQo+ID4gPiBmaXhlZCBjYW4gaW1wbHkgZXZlbiBvciBvZGQuIEZvciBleGFtcGxl
IHBvcnRAMCBjYW4gYmUgZXZlbiBhbmQgcG9ydEAxDQo+ID4gPiBjYW4gYmUgb2RkLiBUaGUgcG9y
dCBudW1iZXJpbmcgaXMgdHlwaWNhbGx5IHBhbmVsIHNwZWNpZmljLCBidXQgd2UgbWF5DQo+ID4g
PiBiZSBhYmxlIHRvIGRlZmluZSB0aGUgbnVtYmVyaW5nIGdlbmVyaWNhbGx5IGlmIHdlIGRvbid0
IGFscmVhZHkgaGF2ZQ0KPiA+ID4gcGFuZWxzIHdpdGggbXVsdGlwbGUgcG9ydHMuDQo+ID4gPg0K
PiA+ID4gQWxzbywgYXJlbid0IHRoZXJlIGR1YWwgbGluayBEU0kgcGFuZWxzPw0KPiA+DQo+ID4g
VGhpcyBpcyB0aGUgcmVzdWx0IG9mIGEgZGlzY3Vzc2lvbiBvbiBoZXJlOg0KPiA+IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEwOTU1NDcvDQo+ID4NCj4gPiBIYXZlIHlvdSBj
b21lIGFjcm9zcyBpdD8NCj4gDQo+IExldCBtZSByZXBlYXQgbXkgY29tbWVudHMgZnJvbSB0aGF0
IHRocmVhZCBmb3IgUm9iIGluIG9yZGVyIHRvDQo+IGNlbnRyYWxpemUgdGhlIGRpc2N1c3Npb24g
aGVyZS4NCj4gDQo+ID4gVGFraW5nIG9uZSBzdGVwIGJhY2sgdG8gbG9vayBhdCB0aGUgYmlnIHBp
Y3R1cmUsIHdoYXQgd2UgbmVlZCBpcyBmb3IgdGhlDQo+ID4gc291cmNlIHRvIGtub3cgd2hhdCBw
aXhlbCAob2RkIG9yIGV2ZW4pIHRvIHNlbmQgb24gZWFjaCBMVkRTIG91dHB1dC4gRm9yDQo+ID4g
dGhhdCBpdCBuZWVkcyB0byBrbm93IHdoYXQgcGl4ZWwgaXMgZXhwZWN0ZWQgYnkgdGhlIHNpbmsg
dGhlIHRoZSBpbnB1dHMNCj4gPiBjb25uZWN0ZWQgdG8gdGhlIHNvdXJjZSdzIG91dHB1dHMuIEZy
b20gZWFjaCBzb3VyY2Ugb3V0cHV0IHdlIGNhbiBlYXNpbHkNCj4gPiBsb2NhdGUgdGhlIERUIG5v
ZGVzIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGNvbm5lY3RlZCBzaW5rJ3MgaW5wdXQgcG9ydHMsDQo+
ID4gYnV0IHRoYXQgZG9lc24ndCBnaXZlIHVzIGVub3VnaCBpbmZvcm1hdGlvbi4gRnJvbSB0aGVy
ZSwgd2UgY291bGQNCj4gPg0KPiA+IC0gSW5mZXIgdGhlIG9kZC9ldmVuIHBpeGVsIGV4cGVjdGVk
IGJ5IHRoZSBzb3VyY2UgYmFzZWQgb24gdGhlIHBvcnQNCj4gPiAgIG51bWJlcnMuIFRoaXMgd291
bGQgcmVxdWlyZSBjb21tb24gRFQgYmluZGluZ3MgZm9yIGFsbCBkdWFsLWxpbmsgTFZEUw0KPiA+
ICAgc2lua3MgdGhhdCBzcGVjaWZ5IHRoZSBwb3J0IG9yZGVyaW5nIChmb3IgaW5zdGFuY2UgdGhl
IGJpbmRpbmdzIGNvdWxkDQo+ID4gICBtYW5kYXRlIHRoYXQgbG93ZXN0IG51bWJlcmVkIHBvcnQg
Y29ycmVzcG9uZCB0byBldmVuIHBpeGVscykuDQo+ID4NCj4gPiAtIFJlYWQgdGhlIG9kZC9ldmVu
IHBpeGVsIGV4cGVjdGVkIGJ5IHRoZSBzb3VyY2UgZnJvbSBhbiBleHBsaWNpdCBEVA0KPiA+ICAg
cHJvcGVydHksIGFzIHByb3Bvc2VkIGFib3ZlLiBUaGlzIHdvdWxkIGFsc28gcmVxdWlyZSBjb21t
b24gRFQNCj4gPiAgIGJpbmRpbmdzIGZvciBhbGwgZHVhbC1saW5rIExWRFMgc2lua3MgdGhhdCBk
ZWZpbmUgdGhlc2UgbmV3DQo+ID4gICBwcm9wZXJ0aWVzLiBUaGlzIHdvdWxkIEkgdGhpbmsgYmUg
YmV0dGVyIHRoYW4gaW1wbGljaXRseSBpbmZlcmluZyBpdA0KPiA+ICAgZnJvbSBEVCBwb3J0IG51
bWJlcnMuDQo+ID4NCj4gPiAtIFJldHJpZXZlIHRoZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBzaW5r
IGRybV9icmlkZ2UgYXQgcnVudGltZS4gVGhpcw0KPiA+ICAgd291bGQgcmVxdWlyZSBhIHdheSB0
byBxdWVyeSB0aGUgYnJpZGdlIGZvciB0aGUgbWFwcGluZyBmcm9tIHBvcnQNCj4gPiAgIG51bWJl
ciB0byBvZGQvZXZlbiBwaXhlbC4gVGhlIERSTV9MSU5LX0RVQUxfTFZEU19PRERfRVZFTiBmbGFn
IGNvdWxkDQo+ID4gICBiZSB1c2VkIGZvciB0aGF0LCBhbmQgd291bGQgdGhlbiBiZSBkZWZpbmVk
IGFzICJ0aGUgbG93ZXN0IG51bWJlcmVkDQo+ID4gICBwb3J0IGNvcnJlc3BvbmRzIHRvIG9kZCBw
aXhlbHMgYW5kIHRoZSBoaWdoZXN0IG51bWJlcmVkIHBvcnQNCj4gPiAgIGNvcnJlc3BvbmRzIHRv
IGV2ZW4gcGl4ZWxzIi4NCj4gPg0KPiA+IFRoZSBzZWNvbmQgYW5kIHRoaXJkIG9wdGlvbnMgd291
bGQgYm90aCB3b3JrIEkgdGhpbmsuIFRoZSB0aGlyZCBvbmUgaXMNCj4gPiByb3VnaGx5IHdoYXQg
eW91J3ZlIGltcGxlbWVudGVkLCBleGNlcHQgdGhhdCBJIHRoaW5rIHRoZSBmbGFnDQo+ID4gZGVz
Y3JpcHRpb24gc2hvdWxkIGJlIGNsYXJpZmllZC4NCj4gDQo+IFJvYiwgd2hhdCdzIHlvdXIgb3Bp
bmlvbiA/IFdlIGNvdWxkIGNlcnRhaW5seSwgaW4gdGhlIGNvbnRleHQgb2YgYQ0KPiBwYW5lbCwg
ZGVjaWRlIG9mIGEgZml4ZWQgbWFwcGluZyBvZiBwb3J0IG51bWJlcnMgdG8gb2RkL2V2ZW4gcGl4
ZWxzLCBidXQNCj4gdGhlIGlzc3VlIGlzIHRoYXQgc291cmNlcyBuZWVkIHRvIGtub3cgd2hpY2gg
cGl4ZWxzIHRvIHNlbmQgb24gd2hpY2gNCj4gbGluayAoYXNzdW1pbmcgb2YgY291cnNlIHRoYXQg
dGhpcyBjYW4gYmUgY29uZmlndXJlZCBvbiB0aGUgc291cmNlDQo+IHNpZGUpLiBXZSB0aHVzIG5l
ZWQgYSB3YXkgZm9yIHRoZSBzb3VyY2UgdG8gYW5zd2VyLCBhdCBydW50aW1lLCB0aGUNCj4gcXVl
c3Rpb24gIndoaWNoIG9mIHBvcnRzIEEgYW5kIEIgb2YgdGhlIHNpbmsgY29ycmVzcG9uZCB0byBl
dmVuIGFuZCBvZGQNCj4gcGl4ZWxzID8iLiBUaGlzIGNhbid0IGJlIGluZmVycmVkIGJ5IHRoZSBz
b3VyY2UgZnJvbSB0aGUgc2luayBwb3J0DQo+IG51bWJlcnMsIGFzIHRoZSBtYXBwaW5nIGJldHdl
ZW4gcG9ydCBudW1iZXIgYW5kIG9kZC9ldmVuIHBpeGVscyBpcw0KPiBzcGVjaWZpYyB0byBlYWNo
IHNpbmsuIFdlIHRodXMgbmVlZCB0byBlaXRoZXIgc3RvcmUgdGhhdCBwcm9wZXJ0eSBpbiB0aGUN
Cj4gRFQgbm9kZSBvZiB0aGUgc2luayAob3B0aW9uIDIpIG9yIHF1ZXJ5IGl0IGF0IHJ1bnRpbWUg
ZnJvbSB0aGUgc2luaw0KPiAob3B0aW9uIDMpLg0KPiANCj4gSSBsaWtlIG9wdGlvbiAyIGFzIGl0
J3MgbW9yZSBleHBsaWNpdCwgYnV0IG9wdGlvbiAzIG1pbmltaXplcyB0aGUNCj4gcmVxdWlyZWQg
cHJvcGVydGllcyBpbiBEVCwgd2hpY2ggaXMgYWx3YXlzIGdvb2QuIFBhdGNoIDMvOCBpbnRyb2R1
Y2VzIGENCj4gaGVscGVyIHRoYXQgYWJzdHJhY3RzIHRoaXMgZnJvbSBhIHNpbmsgcG9pbnQgb2Yg
dmlldyAod2hpY2ggSSB0aGluayBpcyBhDQo+IHZlcnkgZ29vZCBpZGVhKSwgc28gb25jZSB3ZSBk
ZWNpZGUgd2hpY2ggb3B0aW9uIHRvIHVzZSwgb25seSAzLzggbWF5DQo+IG5lZWQgdG8gYmUgYWRh
cHRlZCwgdGhlIG90aGVyIHBhdGNoZXMgc2hvdWxkIGhvcGVmdWxseSBub3QgcmVxdWlyZQ0KPiBy
ZXdvcmsuDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
