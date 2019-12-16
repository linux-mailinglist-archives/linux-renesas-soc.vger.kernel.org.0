Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE23412178E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 19:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbfLPSg4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 13:36:56 -0500
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:42928
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728015AbfLPSgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 13:36:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHVJlysE86zlQ5JVg7pMdOHQUctj+unFr9rZ+ri+/CMZf0ZWv5H3QSxAhgN9fKSKR/ipi8fyXcN1ExS0zE/KNOFSDTxCT6nhJ4z+GmHMHox41w/SvTTg+wKVAuT0qRLWiaTOUsYHWotJkkENnWY2oERcCMScrGbEzHEOL1mXqSuluQR0pYIIcbNvv+MMj0Ni9MPy6AeUwnTpKCUP9FOFn5RcBu5+AZ0kaM0Nje1Svsui1pWP7UGrA60u+fOv9hffmcear4/MPCBviFYDLtGjqALGNSwLemxygpSZtqwnReBe+acR5QIpZeqgQ1PmOgqxuN9l6lHmI1gK/1tWEc+aRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vilVCzEWW8PMIvXzecbIYJGRTZXZ9Q/7/lEniltajSw=;
 b=MRuTql1r5eP0sFFcwjMxPWIFiD/me68ElL6YnBfW+WTNbNOzaDJDBlsgZGg3S93xHewH8UXJU1lB5+iGWmMocobjGhQMgeOnv4Z4C5fs0bFB5Hvo6za2EDBe9QUsCu2XfwqrtTV/RbES4AWOkTICocMjVrmHraRpqkhXDbaKqia9fOJiiDMckOWlesd2tH3eOZKlIX1qy2pK2xYVC98BQQU3fS74v1R93sXXoiS0kdFAuZwTzlZCSUIUNl3mX5JAsCifnp6OA9LWwUkk1kB9tzB/93RkDGLxkZAtm1q86B0QgLJmpO5zl/XVsThiGh1kv7mIQYhu5zu0cBQmKux1lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vilVCzEWW8PMIvXzecbIYJGRTZXZ9Q/7/lEniltajSw=;
 b=oRCP7Yvfg83AVEBYiWdy5VIhqA3oeXLeO4vpJ7mrqolvpnrFdkUt4owuLaYaqOpI4WRv7r5wcSiWNHi6tlSE6Og8K7FWC5TcPE0Rdymfz7cRn8XWepZhOYvaYWFHAsEGYCN1uCPBHuMg7VclmgAIP1Cuz5GJ/YeGUqd0iKgn9HU=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1786.jpnprd01.prod.outlook.com (52.133.163.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.20; Mon, 16 Dec 2019 18:36:51 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 18:36:50 +0000
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
Subject: RE: [PATCH v4 4/7] drm: rcar-du: lvds: Allow for even and odd pixels
 swap
Thread-Topic: [PATCH v4 4/7] drm: rcar-du: lvds: Allow for even and odd pixels
 swap
Thread-Index: AQHVrFLkVuXzzsoGLUiqLLtwh/qf5ae4o1SAgAR9UUA=
Date:   Mon, 16 Dec 2019 18:36:50 +0000
Message-ID: <TY1PR01MB1770E8AC6980F36FDD1A5BEEC0510@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213214050.GO4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213214050.GO4860@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0f7c1cef-ac39-49c0-17b2-08d78256ea87
x-ms-traffictypediagnostic: TY1PR01MB1786:|TY1PR01MB1786:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1786772FBC47EE3AFCE41B05C0510@TY1PR01MB1786.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(189003)(199004)(478600001)(7416002)(55016002)(9686003)(6916009)(2906002)(66476007)(5660300002)(44832011)(76116006)(71200400001)(86362001)(33656002)(8936002)(54906003)(66556008)(66446008)(64756008)(186003)(53546011)(316002)(7696005)(66946007)(26005)(52536014)(4326008)(81166006)(8676002)(81156014)(6506007);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1786;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0aWWeCCGmJj9dQ5vxeO28ixvE+QOiDs1v+nGxKX96BbNJ3cuhKHXs7HYS2JxNaQ/1aI4dInqgu2UQSurT1uDbLeQmwbakwzLn/b7Xn6uAZ5cAKug7105XUpee2hUT65E3glFlhJlvTcROBrYfBsooH1ogV+gAUpxBBRBm0W3pbsn9JqoYiaDCCbtTLH7rOFaPfvPOPrs+kfrpY/aVRaQkUpIWT83MxDMXX8I8rY4EIL7Mh82zfFBxqUPcPjfIMIqQ13gWhl2hNAGcBttHfUW4vNRa/u1BIpTeUNZp6Iav4oJ+8AI2vzBxQhSNmF8mGiL/mFADyNS3Y9kX0Iabd+aTENKypbqqx/+OfedaOHgVpXZ0hRfjzIj2ogRu4GTJpMOli4aVykFFEWy3K4byFRtp0662BjF5sqIkbUvCGrWd6kedXkwV+jwHw9+gnpak4Ly
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7c1cef-ac39-49c0-17b2-08d78256ea87
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:36:50.6746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QVIPCoc54mx4vDXzDJjsEW1zT4RK50TIURRPPy+txz1zRTXbfGayh5T9VYdBC4wJRnUkeAVUYFNSAO5UNeaHpEjjEnu1B1hZPfNIz13jY+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1786
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IGRl
dmljZXRyZWUtb3duZXJAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlLW93bmVyQHZnZXIua2Vy
bmVsLm9yZz4gT24gQmVoYWxmIE9mIExhdXJlbnQgUGluY2hhcnQNCj4gU2VudDogMTMgRGVjZW1i
ZXIgMjAxOSAyMTo0MQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDQvN10gZHJtOiByY2FyLWR1
OiBsdmRzOiBBbGxvdyBmb3IgZXZlbiBhbmQgb2RkIHBpeGVscyBzd2FwDQo+IA0KPiBIaSBGYWJy
aXppbywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gRnJpLCBEZWMg
MDYsIDIwMTkgYXQgMDQ6MzI6NTFQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+
IERUIHByb3BlcnRpZXMgZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzIGFuZCBkdWFsLWx2ZHMtb2RkLXBp
eGVscw0KPiA+IGNhbiBiZSB1c2VkIHRvIHdvcmsgb3V0IGlmIHRoZSBkcml2ZXIgbmVlZHMgdG8g
c3dhcCBldmVuDQo+ID4gYW5kIG9kZCBwaXhlbHMgYXJvdW5kLg0KPiA+DQo+ID4gVGhpcyBwYXRj
aCBtYWtlcyB1c2Ugb2YgdGhlIHJldHVybiB2YWx1ZSBmcm9tIGZ1bmN0aW9uDQo+ID4gZHJtX29m
X2x2ZHNfZ2V0X2R1YWxfbGlua19waXhlbF9vcmRlciB0byBkZXRlcm1pbmUgaWYgd2UNCj4gPiBu
ZWVkIHRvIHN3YXAgb2RkIGFuZCBldmVuIHBpeGVscyBhcm91bmQgZm9yIHRoaW5ncyB0byB3b3Jr
DQo+ID4gcHJvcGVybHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IHYzLT52
NDoNCj4gPiAqIE5ldyBwYXRjaCBleHRyYWN0ZWQgZnJvbSBwYXRjaDoNCj4gPiAgICJkcm06IHJj
YXItZHU6IGx2ZHM6IEFkZCBkdWFsLUxWRFMgcGFuZWxzIHN1cHBvcnQiDQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgNDYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZk
cy5jDQo+ID4gaW5kZXggNmMxZjE3MS4uY2IyMTQ3YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfbHZkcy5jDQo+ID4gQEAgLTcxLDYgKzcxLDcgQEAgc3RydWN0IHJjYXJfbHZk
cyB7DQo+ID4NCj4gPiAgCXN0cnVjdCBkcm1fYnJpZGdlICpjb21wYW5pb247DQo+ID4gIAlib29s
IGR1YWxfbGluazsNCj4gPiArCWJvb2wgc3RyaXBlX3N3YXBfZGF0YTsNCj4gDQo+IFNob3VsZCB3
ZSBtZXJnZSB0aG9zZSB0d28gZmllbGRzIGluIGFuIGludCBkdWFsX2xpbmsgdGhhdCB3b3VsZCBi
ZSBzZXQNCj4gdG8gRFJNX0xWRFNfRFVBTF9MSU5LX0VWRU5fT0REX1BJWEVMUywNCj4gRFJNX0xW
RFNfRFVBTF9MSU5LX09ERF9FVkVOX1BJWEVMUyBvciBhIG5lZ2F0aXZlIHZhbHVlIChvciBtYXli
ZSB3ZSB0aGUNCj4gdmFsdWUgb2YgZW51bSBkcm1fbHZkc19kdWFsX2xpbmtfcGl4ZWxzIGNvdWxk
IGJlIG1vZGlmaWVkIHNvIHRoYXQgMA0KPiBjb3VsZCBtZWFuIHNpbmdsZSBsaW5rKSA/DQoNCkkg
c2VlIHlvdXIgcG9pbnQsIGFuZCBJIHRoaW5rIHRoZXJlIGlzIGEgdGhpcmQgb3B0aW9uLCB1c2lu
ZyBkZWZpbml0aW9ucyBsb2NhbCB0byB0aGUNClJDQVIgTFZEUyBkcml2ZXIgKHZpYSBhbiBlbnVt
PykuDQpUaGUgcmVhc29uIGZvciB0aGlua2luZyBhYm91dCBhIHRoaXJkIG9wdGlvbiBpcyB0aGF0
IG9wdGlvbiAxIGNvdWxkIGJlIGEgYml0IGVycm9yIHByb25lLA0KYXMgbmVnYXRpdmUgdmFsdWVz
IHVzdWFsbHkgaGF2ZSBzcGVjaWFsIG1lYW5pbmcuIEkgbGlrZSBvcHRpb24gMiwgSSBmaW5kIGl0
IG5lYXQsIGJ1dCBpZg0KSSBkaWQgdGhhdCB0aGVuIHdlIHdvdWxkIG5lZWQgdG8gYWdyZWUgYWdh
aW4gb24gbmFtZXMsIGRlZmluaXRpb25zLCBpbnRlcmZhY2VzLCBldGMuLA0KYXMgdGhlIG1lYW5p
bmcgb2YgdGhpbmdzIHdpbGwgY2hhbmdlIHNsaWdodGx5LiBBbHNvLCB3ZSB3aWxsIHByb2JhYmx5
IGJlIGZpbmUgd2l0aCB0aGUNCmhlbHBlciBhbmQgZGVmaW5pdGlvbnMgd2UgYWxyZWFkeSBhZ3Jl
ZWQgb24uDQoNCkkgdGhpbmsgb3B0aW9uIDMgd2lsbCBvZmZlciBhIGxpdHRsZSBiaXQgb2YgZGVj
b3VwbGluZyBiZXR3ZWVuIHRoZSBoZWxwZXIgYW5kIHRoZSBkcml2ZXIsDQphbmQgc2hvdWxkIGhh
dmUgYSBsaW1pdGVkIGVmZmVjdCBvbiBwcmV2aW91cyB1c2VzIG9mIGR1YWxfbGluay4NCg0KSSds
bCBtYWtlIG9wdGlvbiAzIHJlbGF0ZWQgY2hhbmdlcyBpbiB2NSwgaWYgeW91IGRvbid0IGxpa2Ug
dGhlbSB0aGVuIEkgdGhpbmsgd2Ugc2hvdWxkDQp0cnkgb3B0aW9uIDIuDQoNCj4gDQo+ID4gIH07
DQo+ID4NCj4gPiAgI2RlZmluZSBicmlkZ2VfdG9fcmNhcl9sdmRzKGIpIFwNCj4gPiBAQCAtNDQx
LDEyICs0NDIsMjAgQEAgc3RhdGljIHZvaWQgcmNhcl9sdmRzX2VuYWJsZShzdHJ1Y3QgZHJtX2Jy
aWRnZSAqYnJpZGdlKQ0KPiA+ICAJcmNhcl9sdmRzX3dyaXRlKGx2ZHMsIExWRENIQ1IsIGx2ZGhj
cik7DQo+ID4NCj4gPiAgCWlmIChsdmRzLT5pbmZvLT5xdWlya3MgJiBSQ0FSX0xWRFNfUVVJUktf
RFVBTF9MSU5LKSB7DQo+ID4gLQkJLyoNCj4gPiAtCQkgKiBDb25maWd1cmUgdmVydGljYWwgc3Ry
aXBlIGJhc2VkIG9uIHRoZSBtb2RlIG9mIG9wZXJhdGlvbiBvZg0KPiA+IC0JCSAqIHRoZSBjb25u
ZWN0ZWQgZGV2aWNlLg0KPiA+IC0JCSAqLw0KPiA+IC0JCXJjYXJfbHZkc193cml0ZShsdmRzLCBM
VkRTVFJJUEUsDQo+ID4gLQkJCQlsdmRzLT5kdWFsX2xpbmsgPyBMVkRTVFJJUEVfU1RfT04gOiAw
KTsNCj4gPiArCQl1MzIgbHZkc3RyaXBlID0gMDsNCj4gPiArDQo+ID4gKwkJaWYgKGx2ZHMtPmR1
YWxfbGluaykNCj4gPiArCQkJLyoNCj4gPiArCQkJICogQ29uZmlndXJlIHZlcnRpY2FsIHN0cmlw
ZSBiYXNlZCBvbiB0aGUgbW9kZSBvZg0KPiA+ICsJCQkgKiBvcGVyYXRpb24gb2YgdGhlIGNvbm5l
Y3RlZCBkZXZpY2UuDQo+ID4gKwkJCSAqDQo+ID4gKwkJCSAqIFNUX1NXQVAgZnJvbSBMVkQxU1RS
SVBFIGlzIHJlc2VydmVkLCBkbyBub3Qgc2V0DQo+ID4gKwkJCSAqIGluIHRoZSBjb21wYW5pb24g
TFZEUw0KPiANCj4gTWF5YmUgIlNUX1NXQVAgaXMgcmVzZXJ2ZWQgZm9yIHRoZSBjb21wYW5pb24g
ZW5jb2Rlciwgb25seSBzZXQgaXQgaW4gdGhlDQo+IHByaW1hcnkgZW5jb2Rlci4iID8NCg0Kc3Vy
ZQ0KDQo+IA0KPiA+ICsJCQkgKi8NCj4gPiArCQkJbHZkc3RyaXBlID0gTFZEU1RSSVBFX1NUX09O
IHwNCj4gPiArCQkJCShsdmRzLT5jb21wYW5pb24gJiYgbHZkcy0+c3RyaXBlX3N3YXBfZGF0YSA/
DQo+ID4gKwkJCQkgTFZEU1RSSVBFX1NUX1NXQVAgOiAwKTsNCj4gDQo+IFRvIG1hdGNoIHRoZSBj
b2Rpbmcgc3R5bGUgb2YgdGhlIHJlc3Qgb2YgdGhlIGRyaXZlciwNCg0Kb2sNCg0KPiANCj4gCQkJ
bHZkc3RyaXBlID0gTFZEU1RSSVBFX1NUX09ODQo+IAkJCQkgIHwgKGx2ZHMtPmNvbXBhbmlvbiAm
JiBsdmRzLT5zdHJpcGVfc3dhcF9kYXRhID8NCj4gCQkJCSAgICAgTFZEU1RSSVBFX1NUX1NXQVAg
OiAwKTsNCj4gDQo+IEV2ZW4gdGhvdWdoIG5vdCBzdHJpY3RseSByZXF1aXJlZCwgY291bGQgeW91
IHN1cnJvdW5kIHRoaXMgc3RhdGVtZW50DQo+IHdpdGggeyB9IGFzIGl0IHNwYW5zIHF1aXRlIGEg
ZmV3IGxpbmVzIHdpdGggdGhlIGNvbW1lbnQgPw0KDQpXaWxsIHJld29yayB0aGlzIHNsaWdodGx5
IGFueXdheSB0byBtYWtlIHJvb20gZm9yIG9wdGlvbiAzLg0KDQo+IA0KPiA+ICsJCXJjYXJfbHZk
c193cml0ZShsdmRzLCBMVkRTVFJJUEUsIGx2ZHN0cmlwZSk7DQo+ID4gIAl9DQo+ID4NCj4gPiAg
CS8qDQo+ID4gQEAgLTcwMiwxNyArNzExLDMzIEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNl
X2R0X2NvbXBhbmlvbihzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQ0KPiA+ICAJZHVhbF9saW5rID0g
ZHJtX29mX2x2ZHNfZ2V0X2R1YWxfbGlua19waXhlbF9vcmRlcihwMCwgcDEpOw0KPiA+ICAJb2Zf
bm9kZV9wdXQocDApOw0KPiA+ICAJb2Zfbm9kZV9wdXQocDEpOw0KPiA+IC0JaWYgKGR1YWxfbGlu
ayA+PSBEUk1fTFZEU19EVUFMX0xJTktfRVZFTl9PRERfUElYRUxTKSB7DQo+ID4gKw0KPiA+ICsJ
c3dpdGNoIChkdWFsX2xpbmspIHsNCj4gPiArCWNhc2UgRFJNX0xWRFNfRFVBTF9MSU5LX09ERF9F
VkVOX1BJWEVMUzoNCj4gPiArCQkvKg0KPiA+ICsJCSAqIEJ5IGRlZmF1bHQgd2UgZ2VuZXJhdGUg
ZXZlbiBwaXhlbHMgZnJvbSB0aGlzIGVuY29kZXIgYW5kIG9kZA0KPiA+ICsJCSAqIHBpeGVscyBm
cm9tIHRoZSBjb21wYW5pb24gZW5jb2RlciwgYnV0IHNpbmNlIHAwIGlzIGNvbm5lY3RlZA0KPiA+
ICsJCSAqIHRvIHRoZSBwb3J0IGV4cGVjdGluZyBvb2QgcGl4ZWxzLCBhbmQgcDEgaXMgY29ubmVj
dGVkIHRvIHRoZQ0KPiA+ICsJCSAqIHBvcnQgZXhwZWN0aW5nIGV2ZW4gcGl4ZWxzLCB3ZSBuZWVk
IHRvIHN3YXAgZXZlbiBhbmQgb2RkDQo+ID4gKwkJICogcGl4ZWxzIGFyb3VuZC4NCj4gPiArCQkg
Ki8NCj4gPiArCQlsdmRzLT5zdHJpcGVfc3dhcF9kYXRhID0gdHJ1ZTsNCj4gPiArCQlsdmRzLT5k
dWFsX2xpbmsgPSB0cnVlOw0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSBEUk1fTFZEU19EVUFM
X0xJTktfRVZFTl9PRERfUElYRUxTOg0KPiA+ICAJCWx2ZHMtPmR1YWxfbGluayA9IHRydWU7DQo+
ID4gLQl9IGVsc2UgaWYgKGx2ZHMtPm5leHRfYnJpZGdlICYmIGx2ZHMtPm5leHRfYnJpZGdlLT50
aW1pbmdzKSB7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICAJCS8qDQo+ID4g
IAkJICogRWFybHkgZHVhbC1saW5rIGJyaWRnZSBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbnMgcG9w
dWxhdGUgdGhlDQo+ID4gIAkJICogdGltaW5ncyBmaWVsZCBvZiBkcm1fYnJpZGdlLCByZWFkIHRo
ZSBkdWFsX2xpbmsgZmxhZyBvZmYgdGhlDQo+ID4gIAkJICogYnJpZGdlIGRpcmVjdGx5IGZvciBi
YWNrd2FyZCBjb21wYXRpYmlsaXR5Lg0KPiA+ICAJCSAqLw0KPiA+IC0JCWx2ZHMtPmR1YWxfbGlu
ayA9IGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzLT5kdWFsX2xpbms7DQo+ID4gKwkJaWYgKGx2
ZHMtPm5leHRfYnJpZGdlICYmIGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzKQ0KPiA+ICsJCQls
dmRzLT5kdWFsX2xpbmsgPSBsdmRzLT5uZXh0X2JyaWRnZS0+dGltaW5ncy0+ZHVhbF9saW5rOw0K
PiA+ICAJfQ0KPiA+DQo+ID4gKw0KPiANCj4gQSBzaW5nbGUgYmxhbmsgbGluZSBpcyBlbm91Z2gu
DQoNCk9vcHMNCg0KVGhhbmtzLA0KRmFiDQoNCj4gDQo+ID4gIAlpZiAoIWx2ZHMtPmR1YWxfbGlu
aykgew0KPiA+ICAJCWRldl9kYmcoZGV2LCAiU2luZ2xlLWxpbmsgY29uZmlndXJhdGlvbiBkZXRl
Y3RlZFxuIik7DQo+ID4gIAkJZ290byBkb25lOw0KPiA+IEBAIC03MjgsNiArNzUzLDkgQEAgc3Rh
dGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHRfY29tcGFuaW9uKHN0cnVjdCByY2FyX2x2ZHMgKmx2
ZHMpDQo+ID4gIAkJIkR1YWwtbGluayBjb25maWd1cmF0aW9uIGRldGVjdGVkIChjb21wYW5pb24g
ZW5jb2RlciAlcE9GKVxuIiwNCj4gPiAgCQljb21wYW5pb24pOw0KPiA+DQo+ID4gKwlpZiAobHZk
cy0+c3RyaXBlX3N3YXBfZGF0YSkNCj4gPiArCQlkZXZfZGJnKGRldiwgIkRhdGEgc3dhcHBpbmcg
cmVxdWlyZWRcbiIpOw0KPiA+ICsNCj4gPiAgCWNvbXBhbmlvbl9sdmRzID0gYnJpZGdlX3RvX3Jj
YXJfbHZkcyhsdmRzLT5jb21wYW5pb24pOw0KPiA+DQo+ID4gIAkvKg0KPiANCj4gLS0NCj4gUmVn
YXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
