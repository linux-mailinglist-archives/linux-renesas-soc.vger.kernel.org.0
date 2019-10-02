Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00EF9C8C55
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 17:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbfJBPIk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 11:08:40 -0400
Received: from mail-eopbgr1400139.outbound.protection.outlook.com ([40.107.140.139]:50315
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725766AbfJBPIk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 11:08:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU/4tMEIPXhVhcBx2ZDBFJieoHPj12osz6mHY/OBCtktSwAwiY+4aLn6ZSJI2N0wup5p48BzkjWGF6werVA8AJLdBSFPGKzsNnRFliH97DML4jvrmmGKEv+RM6osxy8RGcezg8KDGHUKEx2tW+4THZ49Kxhdn8gX9lB8mhzy1+0bsxU41Yzo0XaaqyDKHUaaVz/7ekFit21Uvq1ex6oHY1IxYsote84OuMaKkgRvVE9kHGhoJUdQcalW0wrWnAbnGPWFl53WF7Lk0CSN8wtl47Gf0RGulq2FhX2LA3Pv6YXJnldSbXDvxZ5kglEr9hJT3oQZarzv1x9tkAVkqUXKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAVfbTIoSgj4jUtuoPtMlH9a9QP6AWu11KyJOApdnJo=;
 b=FojRorhzsqbL96dAt8Uj1xGBq1cYILcNJTSFrW6ByEnlOxgfFh4wP8yHMxIfUlOWKKGiV0BXrMgGJ7WTa5zWzzGkFwpwnib1bsCqkBgV4GWy8O431ayzm+5Gj/2bMMvBtv6h4tViS94FVyqkeYQFpig8UrrFKh9SHq9hWOFKw/sA+VSW/XpWet3I842Hf8qjLd9C0qf2P55FCVpShJVcgRa75qCCBEcESTo7AwfGRhONXas/eBl8Umed52wSpY2lRZfj0q2FCnDrL6XSSeqCFI6NnXauq07AeS/9FzRACK1QSMDOmORaSRZWWQeqV5t01JG/eoj89oFLvn/8J2cHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAVfbTIoSgj4jUtuoPtMlH9a9QP6AWu11KyJOApdnJo=;
 b=p5C9ss07XqhTFWEm7M7gq7A3fnrSmlM7nf2pP6axJ5n7Hvz5fYEwGIi1kQ6mQWBsNKVmcniMpTCb2Wy5/Uy0k1nTS0mcIQYIj4a1McZvWR/P/t+ilpp4ahgmuF6O8XcSqMciKxSGJHfmL6RXoZdMHwJTGJ0f/XWJCMUpA1e8WL0=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2486.jpnprd01.prod.outlook.com (52.134.253.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.16; Wed, 2 Oct 2019 15:07:56 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 15:07:56 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2 8/9] arm64: dts: renesas: hihope-rzg2-ex: Add LVDS
 support
Thread-Topic: [PATCH v2 8/9] arm64: dts: renesas: hihope-rzg2-ex: Add LVDS
 support
Thread-Index: AQHVeQl0WLNxS+iN6kSmpiTP88TVWKdHaRqAgAAK3XA=
Date:   Wed, 2 Oct 2019 15:07:55 +0000
Message-ID: <OSBPR01MB210306FA9DE030C960850321B89C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1570010906-47486-1-git-send-email-biju.das@bp.renesas.com>
 <1570010906-47486-9-git-send-email-biju.das@bp.renesas.com>
 <20191002142759.GD5262@pendragon.ideasonboard.com>
In-Reply-To: <20191002142759.GD5262@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 945b1cf6-0e97-4e49-eafd-08d7474a4e31
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB2486:|OSBPR01MB2486:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB248619B4CCB3FADB4C458423B89C0@OSBPR01MB2486.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(189003)(199004)(51914003)(54906003)(4326008)(3846002)(6116002)(8936002)(25786009)(316002)(229853002)(33656002)(81166006)(81156014)(2906002)(8676002)(107886003)(7736002)(256004)(6246003)(476003)(486006)(478600001)(44832011)(74316002)(11346002)(14454004)(305945005)(71190400001)(71200400001)(6506007)(76176011)(6916009)(86362001)(102836004)(52536014)(76116006)(446003)(66946007)(99286004)(6436002)(66066001)(66556008)(64756008)(66446008)(7696005)(55016002)(66476007)(9686003)(5660300002)(186003)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2486;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hwHDr4twizGVX5WpbAvi+j/+d67MoAitq17PfsoketVXmPflcf8xbrprWmakEqYzf8SN+/KCarJ4tq2/0qPAsGGx2RKs62eB551/lJ7VfPN4lCL8IYr3Gw3NA07nTTTPvvUwySGpkpS6CapVlJ75Tpv0/CcLyZobVPOPU0Y+sXPmuHwgFejtfYHuLLPw/82PPzQqjW529xLsoF9sk9xm8KmY+FSvSLBvcehEItvR9sAWFxiHCWym+zJ045NyjIsYZQKq8+bm0//VCCBEs8K5rmzNQaDpP9+NGhi4FIKk9hmaKSYD4kvB8DboxuCQ1AgD4Ko3luEMVVJqv1qaTfblTqr/XnBwUEmZIOUNe2XndaBqWcczZB2i9JCd2FJNijbcZSHe+x3/1JPVDM+UDJy3OHBeGjgE3n5hhyTVA8lQTEA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945b1cf6-0e97-4e49-eafd-08d7474a4e31
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 15:07:56.0001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pRlh19QtJqnZga8wY4awrPJmjfcXJDPlnWl0i0fzrMnZWaSBGCpgAn2DgHfuvGHX6kQT8CKDZZn8OFx8HmgYmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2486
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiA4LzldIGFybTY0OiBkdHM6IHJlbmVzYXM6IGhpaG9wZS1yemcyLWV4OiBBZGQg
TFZEUw0KPiBzdXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUg
cGF0Y2guDQo+IA0KPiBPbiBXZWQsIE9jdCAwMiwgMjAxOSBhdCAxMTowODoyNUFNICswMTAwLCBC
aWp1IERhcyB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgTFZEUyBzdXBwb3J0IGZvciBSWi9H
MltNTl0gYm9hcmRzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFz
QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBWMS0tPlYyDQo+ID4gICAgKiBJbmNvcnBv
cmF0ZWQgTGF1cmVudCdzIHJldmlldyBjb21tZW50cw0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLXJ6ZzItZXguZHRzaSB8IDI5DQo+ICsrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLXJ6
ZzItZXguZHRzaQ0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtcnpnMi1l
eC5kdHNpDQo+ID4gaW5kZXggNzBmOWEyYS4uMWM3ZWY2OSAxMDA2NDQNCj4gPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLXJ6ZzItZXguZHRzaQ0KPiA+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtcnpnMi1leC5kdHNpDQo+ID4gQEAgLTUx
LDYgKzUxLDM0IEBADQo+ID4gIAlzdGF0dXMgPSAib2theSI7DQo+ID4gIH07DQo+ID4NCj4gPiAr
JmdwaW8xIHsNCj4gPiArCS8qDQo+ID4gKwkgKiBXaGVuIEdQMV8yMCBpcyBMT1cgTFZEUzAgaXMg
Y29ubmVjdGVkIHRvIHRoZSBMVkRTIGNvbm5lY3Rvcg0KPiA+ICsJICogV2hlbiBHUDFfMjAgaXMg
SElHSCBMVkRTMCBpcyBjb25uZWN0ZWQgdG8gdGhlIExUODkxOEwNCj4gPiArCSAqLw0KPiA+ICsJ
bHZkcy1jb25uZWN0b3ItZW4tZ3BpbyB7DQo+ID4gKwkJZ3Bpby1ob2c7DQo+ID4gKwkJZ3Bpb3Mg
PSA8MjAgR1BJT19BQ1RJVkVfSElHSD47DQo+ID4gKwkJb3V0cHV0LWxvdzsNCj4gPiArCQlsaW5l
LW5hbWUgPSAibHZkcy1jb25uZWN0b3ItZW4tZ3BpbyI7DQo+ID4gKwl9Ow0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArJmx2ZHMwIHsNCj4gPiArCS8qIFBsZWFzZSBpbmNsdWRlIHRoZSBsdmRzIHBhbmVs
IGR0c2kgZmlsZSBhbmQgdW5jb21tZW50IHRoZSBiZWxvdw0KPiBsaW5lDQo+IA0KPiAvKiBzaG91
bGQgYmUgb24gYSBsaW5lIG9mIGl0cyBvd24uDQo+IA0KPiA+ICsJICogdG8gZW5hYmxlIGx2ZHMg
cGFuZWwgY29ubmVjdGVkIHRvIFJaL0cyW01OXSBib2FyZHMuDQo+IA0KPiBNYXliZSBzL2x2ZHMv
TFZEUy8gYW5kIHMvZHRzaS8uZHRzaS8gPyBVcCB0byB5b3UuDQoNCk9LLiBXaWxsIGNoYW5nZSB0
aGlzLg0KDQo+ID4gKwkgKi8NCj4gPiArDQo+ID4gKwkvKiBzdGF0dXMgPSAib2theSI7ICovDQo+
ID4gKw0KPiA+ICsJcG9ydHMgew0KPiA+ICsJCXBvcnRAMSB7DQo+ID4gKwkJCWx2ZHNfY29ubmVj
dG9yOiBlbmRwb2ludCB7DQo+ID4gKwkJCX07DQo+ID4gKwkJfTsNCj4gPiArCX07DQo+ID4gK307
DQo+ID4gKw0KPiA+ICAmcGNpZWMwIHsNCj4gPiAgCXN0YXR1cyA9ICJva2F5IjsNCj4gPiAgfTsN
Cj4gPiBAQCAtMTAzLDMgKzEzMSw0IEBADQo+ID4NCj4gPiAgCXN0YXR1cyA9ICJva2F5IjsNCj4g
PiAgfTsNCj4gPiArDQoNCkl0IGlzIGEgbWlzdGFrZS4gIFdpbGwgdGFrZSBvdXQuDQoNCj4gQW5k
IHRoaXMgc2VlbXMgdW5yZWxhdGVkLiBXaXRoIHRob3NlIGxpdHRsZSBpc3N1ZXMgZml4ZWQsDQo+
IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hh
cnQNCg==
