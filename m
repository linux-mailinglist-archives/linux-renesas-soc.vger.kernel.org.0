Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 000A5122A3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 12:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfLQLhG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 06:37:06 -0500
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:14048
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726560AbfLQLhG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 06:37:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A64P6DZQmKmQnkRn+ItR1S1GGIQmIOltPV1sgf2EtmUuais/jn8afpRhwkLqPsDmWyUTY80sfZCtNoXXt/7SkZ8wqcpUdV462ZyS51mjX5A5E5Z5xbJsSJpGUbn/8oOZ7/mt9fqFawolN66iHRG5qiNXVHCSQHMPOQ9Eq/swTkPjutob9lNb/9X/GPrT5Oh71kVZT7Y0fHQpcDFKLuTCgvqp2PW2Uo0o4ZjWcch5+SFjhP2Dy9rsUJ9RO9Kir7AAFCYp/EaB4TWpoUWI+Ofw3XhpIFMJAoAe7e+ofiONmd/giU4PCLIf+vjW6es99dm2KoIbU4GdAKPCwOr+9vPU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkqT5EK3wgkclV5IboO4mFyeYpOFM/UJZwOc0pGPcvA=;
 b=Kh7ebNk/5D6Tz0PUm2N5Q6LtIv+SFBxY53HFRIngkQXio2dZT/UU/Q0ShYv6sINfWjfuIpmyKLCUFSzmIVK7JzDU//vFI+MTvUkeUunK42PUZOutVvBTk5/Ybu8Ndlz2yvvXOlSpOz11C38HYZN9GseEgirNz5Vp175rHe2umd3EaHQrN48Huyb6TpSZGxdZUdbnwer/fmqaTpDxrOWFdHbZEH8UUZiaYCoz0XGKoCaPuWsalIaL8/bhP8MN8UBdHfMWI6HQzRYiD0DmWXpdg7dZAKHY4PJ6wJlLPB/VlHbkkQuxaDXC98c89GPjG7DCHlHwv0YUtM+WL1HgVhJY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkqT5EK3wgkclV5IboO4mFyeYpOFM/UJZwOc0pGPcvA=;
 b=pHH3/HRypqCwmo6N8FWfLC4WDRkAsyIEH8STOCcNRrBoN7LOOK6/Qzjxaeotwszk8T0oT+tJ1ZvzSLS2RrHyw6DkH2mpU7SbZk7ihMr7hvGislNQxx/Y/0Kbk85poS6BkHmVgsg9SmnTub0mVWPKN8WJSHdJkG5HIbKwWsbgOZc=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1595.jpnprd01.prod.outlook.com (52.133.162.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Tue, 17 Dec 2019 11:37:00 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 11:37:00 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH v5 4/6] drm: rcar-du: lvds: Allow for even and odd pixels
 swap
Thread-Topic: [PATCH v5 4/6] drm: rcar-du: lvds: Allow for even and odd pixels
 swap
Thread-Index: AQHVtE07BUnRYq5ge0iAec2iH9Afuqe9SLGAgADpHdA=
Date:   Tue, 17 Dec 2019 11:37:00 +0000
Message-ID: <TY1PR01MB177069E9FABCAE39A27C6A00C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1576527154-18391-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1576527154-18391-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191216213451.GH4856@pendragon.ideasonboard.com>
In-Reply-To: <20191216213451.GH4856@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3c73ea3a-8566-4d07-73c6-08d782e56e39
x-ms-traffictypediagnostic: TY1PR01MB1595:|TY1PR01MB1595:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1595B86CA345A37F2ADFBE07C0500@TY1PR01MB1595.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(7416002)(52536014)(71200400001)(7696005)(9686003)(2906002)(81166006)(55016002)(966005)(66946007)(6916009)(186003)(4326008)(66556008)(64756008)(66476007)(66446008)(478600001)(54906003)(26005)(316002)(5660300002)(8936002)(76116006)(44832011)(53546011)(81156014)(6506007)(8676002)(86362001)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1595;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +aXcuOvVYVo6CnBXbAoqoYOGvqnVQ0rKZvtYizO3gktz+IX23qJdpFSmDyXcS2hOKq0CuCN5qx7bCVa8XbaHY5TlDKBCI8PH9NMjejQQ3Z8lDxWJ6/FUVnZNOm3QDPkxJoz09OjeQ+mhzBgXG/c/3thX/CszLA5BDntjgAsm1HXl6zanZmL86x+LPjZEHbqMbqcJ9V21B8eNfb0sOUK8XhcQi9tRO1+cHbzVg6ayiqbUbZk+QUP/dNlzXoBmxzicZgN9e/JfZzc6Kol/6Bh+3nxzlym63uIO3bujrVqnyXnvoQ85ECqj0zPy5YZk0i5xcE0pdhJq8wLF16QwGfHo5kgL3gO6/17qWlDd/ZOyBXP2t7DkA9Di3s/KGvkelHjIgN7idaF0YrH8EhRJRH8GvRJriorPpUNk3sn5hZOcLj3s3CNPD7gGT6XN2tUPujYc8mNvuvgjPULGQTFTO4JuSNp5T4//dGjagZOX2p6sex4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c73ea3a-8566-4d07-73c6-08d782e56e39
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 11:37:00.2196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n51coTTOssNJFsBN2BxGA32SNRdsUrwUejVth718wouC3LMI2LwJjXlqU9N5teflKzFcRBP5+WkiJcU04eLPQq04xlhU98OhZGMIfxrZZdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1595
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMTYgRGVjZW1iZXIgMjAxOSAyMTozNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDQvNl0g
ZHJtOiByY2FyLWR1OiBsdmRzOiBBbGxvdyBmb3IgZXZlbiBhbmQgb2RkIHBpeGVscyBzd2FwDQo+
IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4g
T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMDg6MTI6MzJQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJv
IHdyb3RlOg0KPiA+IERUIHByb3BlcnRpZXMgZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzIGFuZCBkdWFs
LWx2ZHMtb2RkLXBpeGVscw0KPiA+IGNhbiBiZSB1c2VkIHRvIHdvcmsgb3V0IGlmIHRoZSBkcml2
ZXIgbmVlZHMgdG8gc3dhcCBldmVuDQo+ID4gYW5kIG9kZCBwaXhlbHMgYXJvdW5kLg0KPiA+DQo+
ID4gVGhpcyBwYXRjaCBtYWtlcyB1c2Ugb2YgdGhlIHJldHVybiB2YWx1ZSBmcm9tIGZ1bmN0aW9u
DQo+ID4gZHJtX29mX2x2ZHNfZ2V0X2R1YWxfbGlua19waXhlbF9vcmRlciB0byBkZXRlcm1pbmUg
aWYgd2UNCj4gPiBuZWVkIHRvIHN3YXAgb2RkIGFuZCBldmVuIHBpeGVscyBhcm91bmQgZm9yIHRo
aW5ncyB0byB3b3JrDQo+ID4gcHJvcGVybHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJy
aXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IC0t
LQ0KPiA+IHY0LT52NToNCj4gPiAqIEFkZHJlc3NlZCBjb21tZW50cyBmcm9tIExhdXJlbnQncyBy
ZXZpZXcNCj4gPg0KPiA+IHYzLT52NDoNCj4gPiAqIE5ldyBwYXRjaCBleHRyYWN0ZWQgZnJvbSBw
YXRjaDoNCj4gPiAgICJkcm06IHJjYXItZHU6IGx2ZHM6IEFkZCBkdWFsLUxWRFMgcGFuZWxzIHN1
cHBvcnQiDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5j
IHwgNjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0KPiA+IGluZGV4IDNlYjIwOGUuLmM2YTM4YzMgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0KPiA+IEBAIC0zNyw2ICsz
NywxMiBAQCBlbnVtIHJjYXJfbHZkc19tb2RlIHsNCj4gPiAgCVJDQVJfTFZEU19NT0RFX1ZFU0Eg
PSA0LA0KPiA+ICB9Ow0KPiA+DQo+ID4gK2VudW0gcmNhcl9sdmRzX2xpbmtfdHlwZSB7DQo+ID4g
KwlSQ0FSX0xWRFNfU0lOR0xFX0xJTksgPSAwLA0KPiA+ICsJUkNBUl9MVkRTX0RVQUxfTElOS19F
VkVOX09ERF9QSVhFTFMgPSAxLA0KPiA+ICsJUkNBUl9MVkRTX0RVQUxfTElOS19PRERfRVZFTl9Q
SVhFTFMgPSAyLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgI2RlZmluZSBSQ0FSX0xWRFNfUVVJUktf
TEFORVMJCUJJVCgwKQkvKiBMVkRTIGxhbmVzIDEgYW5kIDMgaW52ZXJ0ZWQgKi8NCj4gPiAgI2Rl
ZmluZSBSQ0FSX0xWRFNfUVVJUktfR0VOM19MVkVOCUJJVCgxKQkvKiBMVkVOIGJpdCBuZWVkcyB0
byBiZSBzZXQgb24gUjhBNzc5NzAvUjhBNzc5OXggKi8NCj4gPiAgI2RlZmluZSBSQ0FSX0xWRFNf
UVVJUktfUFdECQlCSVQoMikJLyogUFdEIGJpdCBhdmFpbGFibGUgKGFsbCBvZiBHZW4zIGJ1dCBF
MykgKi8NCj4gPiBAQCAtNjcsNyArNzMsNyBAQCBzdHJ1Y3QgcmNhcl9sdmRzIHsNCj4gPiAgCX0g
Y2xvY2tzOw0KPiA+DQo+ID4gIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqY29tcGFuaW9uOw0KPiA+IC0J
Ym9vbCBkdWFsX2xpbms7DQo+ID4gKwllbnVtIHJjYXJfbHZkc19saW5rX3R5cGUgZHVhbF9saW5r
Ow0KPiANCj4gRG8geW91IHRoaW5rIHdlIHNob3VsZCByZW5hbWUgdGhpcyB0byBsaW5rX3R5cGUg
KGFuZCB0ZXN0IGZvcg0KPiBsdmRzLT5saW5rX3R5cGUgIT0gUkNBUl9MVkRTX1NJTkdMRV9MSU5L
KSBpbnN0ZWFkIG9mIGx2ZHMtPmR1YWxfbGluaykgPw0KPiBBcGFydCBmcm9tIHRoYXQsDQoNCkkn
bGwgc2VuZCB2NiB0byBhZGRyZXNzIHRoYXQuIEkgd2lsbCBhbHNvIHJlYmFzZSBvbiB0b3Agb2Y6
DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMjk1OTkxLw0KYW5kIHdpbGwg
dXNlIHRoYXQgYXMgYSBkZXBlbmRlbmN5IGZvciB2Ng0KDQpDaGVlcnMsDQpGYWINCg0KPiANCj4g
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4NCj4gDQo+ID4gIH07DQo+ID4NCj4gPiAgI2RlZmluZSBicmlkZ2VfdG9fcmNhcl9s
dmRzKGIpIFwNCj4gPiBAQCAtNDg0LDEyICs0OTAsMzEgQEAgc3RhdGljIHZvaWQgcmNhcl9sdmRz
X2F0b21pY19lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gPiAgCXJjYXJfbHZk
c193cml0ZShsdmRzLCBMVkRDSENSLCBsdmRoY3IpOw0KPiA+DQo+ID4gIAlpZiAobHZkcy0+aW5m
by0+cXVpcmtzICYgUkNBUl9MVkRTX1FVSVJLX0RVQUxfTElOSykgew0KPiA+IC0JCS8qDQo+ID4g
LQkJICogQ29uZmlndXJlIHZlcnRpY2FsIHN0cmlwZSBiYXNlZCBvbiB0aGUgbW9kZSBvZiBvcGVy
YXRpb24gb2YNCj4gPiAtCQkgKiB0aGUgY29ubmVjdGVkIGRldmljZS4NCj4gPiAtCQkgKi8NCj4g
PiAtCQlyY2FyX2x2ZHNfd3JpdGUobHZkcywgTFZEU1RSSVBFLA0KPiA+IC0JCQkJbHZkcy0+ZHVh
bF9saW5rID8gTFZEU1RSSVBFX1NUX09OIDogMCk7DQo+ID4gKwkJdTMyIGx2ZHN0cmlwZSA9IDA7
DQo+ID4gKw0KPiA+ICsJCWlmIChsdmRzLT5kdWFsX2xpbmspIHsNCj4gPiArCQkJLyoNCj4gPiAr
CQkJICogQnkgZGVmYXVsdCB3ZSBnZW5lcmF0ZSBldmVuIHBpeGVscyBmcm9tIHRoZSBwcmltYXJ5
DQo+ID4gKwkJCSAqIGVuY29kZXIgYW5kIG9kZCBwaXhlbHMgZnJvbSB0aGUgY29tcGFuaW9uIGVu
Y29kZXIuDQo+ID4gKwkJCSAqIFN3YXAgcGl4ZWxzIGFyb3VuZCBpZiB0aGUgc2luayByZXF1aXJl
cyBvZGQgcGl4ZWxzDQo+ID4gKwkJCSAqIGZyb20gdGhlIHByaW1hcnkgZW5jb2RlciBhbmQgZXZl
biBwaXhlbHMgZnJvbSB0aGUNCj4gPiArCQkJICogY29tcGFuaW9uIGVuY29kZXIuDQo+ID4gKwkJ
CSAqLw0KPiA+ICsJCQlib29sIHN3YXBfcGl4ZWxzID0gbHZkcy0+ZHVhbF9saW5rID09DQo+ID4g
KwkJCQlSQ0FSX0xWRFNfRFVBTF9MSU5LX09ERF9FVkVOX1BJWEVMUzsNCj4gPiArDQo+ID4gKwkJ
CS8qDQo+ID4gKwkJCSAqIENvbmZpZ3VyZSB2ZXJ0aWNhbCBzdHJpcGUgc2luY2Ugd2UgYXJlIGRl
YWxpbmcgd2l0aA0KPiA+ICsJCQkgKiBhbiBMVkRTIGR1YWwtbGluayBjb25uZWN0aW9uLg0KPiA+
ICsJCQkgKg0KPiA+ICsJCQkgKiBTVF9TV0FQIGlzIHJlc2VydmVkIGZvciB0aGUgY29tcGFuaW9u
IGVuY29kZXIsIG9ubHkNCj4gPiArCQkJICogc2V0IGl0IGluIHRoZSBwcmltYXJ5IGVuY29kZXIu
DQo+ID4gKwkJCSAqLw0KPiA+ICsJCQlsdmRzdHJpcGUgPSBMVkRTVFJJUEVfU1RfT04NCj4gPiAr
CQkJCSAgfCAobHZkcy0+Y29tcGFuaW9uICYmIHN3YXBfcGl4ZWxzID8NCj4gPiArCQkJCSAgICAg
TFZEU1RSSVBFX1NUX1NXQVAgOiAwKTsNCj4gPiArCQl9DQo+ID4gKwkJcmNhcl9sdmRzX3dyaXRl
KGx2ZHMsIExWRFNUUklQRSwgbHZkc3RyaXBlKTsNCj4gPiAgCX0NCj4gPg0KPiA+ICAJLyoNCj4g
PiBAQCAtNzE2LDE1ICs3NDEsMjYgQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHRfY29t
cGFuaW9uKHN0cnVjdCByY2FyX2x2ZHMgKmx2ZHMpDQo+ID4gIAlvZl9ub2RlX3B1dChwb3J0MCk7
DQo+ID4gIAlvZl9ub2RlX3B1dChwb3J0MSk7DQo+ID4NCj4gPiAtCWlmIChkdWFsX2xpbmsgPj0g
RFJNX0xWRFNfRFVBTF9MSU5LX0VWRU5fT0REX1BJWEVMUykNCj4gPiAtCQlsdmRzLT5kdWFsX2xp
bmsgPSB0cnVlOw0KPiA+IC0JZWxzZSBpZiAobHZkcy0+bmV4dF9icmlkZ2UgJiYgbHZkcy0+bmV4
dF9icmlkZ2UtPnRpbWluZ3MpDQo+ID4gKwlzd2l0Y2ggKGR1YWxfbGluaykgew0KPiA+ICsJY2Fz
ZSBEUk1fTFZEU19EVUFMX0xJTktfT0REX0VWRU5fUElYRUxTOg0KPiA+ICsJCWx2ZHMtPmR1YWxf
bGluayA9IFJDQVJfTFZEU19EVUFMX0xJTktfT0REX0VWRU5fUElYRUxTOw0KPiA+ICsJCWJyZWFr
Ow0KPiA+ICsJY2FzZSBEUk1fTFZEU19EVUFMX0xJTktfRVZFTl9PRERfUElYRUxTOg0KPiA+ICsJ
CWx2ZHMtPmR1YWxfbGluayA9IFJDQVJfTFZEU19EVUFMX0xJTktfRVZFTl9PRERfUElYRUxTOw0K
PiA+ICsJCWJyZWFrOw0KPiA+ICsJZGVmYXVsdDoNCj4gPiAgCQkvKg0KPiA+ICAJCSAqIEVhcmx5
IGR1YWwtbGluayBicmlkZ2Ugc3BlY2lmaWMgaW1wbGVtZW50YXRpb25zIHBvcHVsYXRlIHRoZQ0K
PiA+IC0JCSAqIHRpbWluZ3MgZmllbGQgb2YgZHJtX2JyaWRnZSwgcmVhZCB0aGUgZHVhbF9saW5r
IGZsYWcgb2ZmIHRoZQ0KPiA+IC0JCSAqIGJyaWRnZSBkaXJlY3RseSBmb3IgYmFja3dhcmQgY29t
cGF0aWJpbGl0eS4NCj4gPiArCQkgKiB0aW1pbmdzIGZpZWxkIG9mIGRybV9icmlkZ2UuIElmIHRo
ZSBmbGFnIGlzIHNldCwgd2UgYXNzdW1lDQo+ID4gKwkJICogdGhhdCB3ZSBhcmUgZXhwZWN0ZWQg
dG8gZ2VuZXJhdGUgZXZlbiBwaXhlbHMgZnJvbSB0aGUgcHJpbWFyeQ0KPiA+ICsJCSAqIGVuY29k
ZXIsIGFuZCBvZGQgcGl4ZWxzIGZyb20gdGhlIGNvbXBhbmlvbiBlbmNvZGVyLg0KPiA+ICAJCSAq
Lw0KPiA+IC0JCWx2ZHMtPmR1YWxfbGluayA9IGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzLT5k
dWFsX2xpbms7DQo+ID4gKwkJaWYgKGx2ZHMtPm5leHRfYnJpZGdlICYmIGx2ZHMtPm5leHRfYnJp
ZGdlLT50aW1pbmdzICYmDQo+ID4gKwkJICAgIGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzLT5k
dWFsX2xpbmspDQo+ID4gKwkJCWx2ZHMtPmR1YWxfbGluayA9IFJDQVJfTFZEU19EVUFMX0xJTktf
RVZFTl9PRERfUElYRUxTOw0KPiA+ICsJCWVsc2UNCj4gPiArCQkJbHZkcy0+ZHVhbF9saW5rID0g
UkNBUl9MVkRTX1NJTkdMRV9MSU5LOw0KPiA+ICsJfQ0KPiA+DQo+ID4gIAlpZiAoIWx2ZHMtPmR1
YWxfbGluaykgew0KPiA+ICAJCWRldl9kYmcoZGV2LCAiU2luZ2xlLWxpbmsgY29uZmlndXJhdGlv
biBkZXRlY3RlZFxuIik7DQo+ID4gQEAgLTc0MSw2ICs3NzcsOSBAQCBzdGF0aWMgaW50IHJjYXJf
bHZkc19wYXJzZV9kdF9jb21wYW5pb24oc3RydWN0IHJjYXJfbHZkcyAqbHZkcykNCj4gPiAgCQki
RHVhbC1saW5rIGNvbmZpZ3VyYXRpb24gZGV0ZWN0ZWQgKGNvbXBhbmlvbiBlbmNvZGVyICVwT0Yp
XG4iLA0KPiA+ICAJCWNvbXBhbmlvbik7DQo+ID4NCj4gPiArCWlmIChsdmRzLT5kdWFsX2xpbmsg
PT0gUkNBUl9MVkRTX0RVQUxfTElOS19PRERfRVZFTl9QSVhFTFMpDQo+ID4gKwkJZGV2X2RiZyhk
ZXYsICJEYXRhIHN3YXBwaW5nIHJlcXVpcmVkXG4iKTsNCj4gPiArDQo+ID4gIAkvKg0KPiA+ICAJ
ICogRklYTUU6IFdlIHNob3VsZCBub3QgYmUgbWVzc2luZyB3aXRoIHRoZSBjb21wYW5pb24gZW5j
b2RlciBwcml2YXRlDQo+ID4gIAkgKiBkYXRhIGZyb20gdGhlIHByaW1hcnkgZW5jb2Rlciwgd2Ug
c2hvdWxkIHJhdGhlciBsZXQgdGhlIGNvbXBhbmlvbg0KPiA+IEBAIC03NTEsNyArNzkwLDcgQEAg
c3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHRfY29tcGFuaW9uKHN0cnVjdCByY2FyX2x2ZHMg
Kmx2ZHMpDQo+ID4gIAkgKiBmb3IgdGhlIHRpbWUgYmVpbmcuDQo+ID4gIAkgKi8NCj4gPiAgCWNv
bXBhbmlvbl9sdmRzID0gYnJpZGdlX3RvX3JjYXJfbHZkcyhsdmRzLT5jb21wYW5pb24pOw0KPiA+
IC0JY29tcGFuaW9uX2x2ZHMtPmR1YWxfbGluayA9IHRydWU7DQo+ID4gKwljb21wYW5pb25fbHZk
cy0+ZHVhbF9saW5rID0gbHZkcy0+ZHVhbF9saW5rOw0KPiA+DQo+ID4gIGRvbmU6DQo+ID4gIAlv
Zl9ub2RlX3B1dChjb21wYW5pb24pOw0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJl
bnQgUGluY2hhcnQNCg==
