Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B288121863
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 19:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbfLPSnJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 13:43:09 -0500
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:5988
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728775AbfLPSnJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 13:43:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxPoGbZnykm56aeaicgDV6oai9DEi1Qh2VjUygq9YVrTJQbSS5d0bYhrBcvL2YqM8VeV5lJiBZTL0DvTJLdRCysCqyAiasFTa7+/CUzJf9P1a2Bojspa5TRWPT3HhumSlrvo7yE+vkHqYtlpyX3ZqDAkSDeQ2zmZMUeByf4B9lUlJJtrq7Jim+Iwt5IpeOUF+1S9+PMZUi2W0bMxgH7wWDeon4CvuT0h0B/OwmamRv80qYhF4l5l21srCC5LaogsJ5SkWNvT7bqYID5Ck632U28k3SgHTWOZBY96BLxPPwwamHTRFjWpXm2vFq994ezCUSfTmDaznug7zV5y3vIxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDRfU7yEKpUGLgOzT4AasND8fG68gxUr7EUUIi2aTIo=;
 b=jTwl1COyRUB58U1S2ZaBPBH0oCpNWeE1dyD89xpK3KMYcX0WWd3xRfd3IMHGxCK1ECAiEA6I/hsC0bN5sv9R/uqE5+xoF0GSn8tOCem+T2IKuh/VpqQCEbpVhcfBu5BxTuPMvtzlWhcA0KuYy9R3Uz6zDsED+yuMUiMfr+8Kv2sehtqO/+SR28Wq/a2nvAH/E9pOkdAf3Q5m3B05JtkdSzr+lDAJopjVLeMqm7q2tGHwHYMNakakbUbB0HhP6N+czVDWcoz+2hy2QULBvkz++6upEYPYeaQXBUGafmpP+Oc59YLMKag+EewW+Hj+5w+IJl537VA5pHxApypMOearvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDRfU7yEKpUGLgOzT4AasND8fG68gxUr7EUUIi2aTIo=;
 b=NOxi59jeiigOw83DpwXewWwHZhz0I4k1Z/j78NebfYaGVsgsA8DveRIc2Quimsj1b0TREA/nXHhdzTu3zDE5ecLa2rC+5oONsbvZ8BEicT9i4kpO67DxCj5SBB13A27/49Ky9XZxSaO64f9hwcbvHbFw0lY6PJeiQh5d8uRjhv0=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1786.jpnprd01.prod.outlook.com (52.133.163.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.20; Mon, 16 Dec 2019 18:43:05 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 18:43:05 +0000
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
Subject: RE: [PATCH v4 5/7] drm: rcar-du: lvds: Fix mode for companion encoder
Thread-Topic: [PATCH v4 5/7] drm: rcar-du: lvds: Fix mode for companion
 encoder
Thread-Index: AQHVrFLnUCKj2BNq0EOPdrx0L3Dgfae4o5YAgASEiMA=
Date:   Mon, 16 Dec 2019 18:43:04 +0000
Message-ID: <TY1PR01MB177062A4ED216B58266008D1C0510@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213214146.GP4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213214146.GP4860@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a7f7935c-3ce3-4831-87a2-08d78257c997
x-ms-traffictypediagnostic: TY1PR01MB1786:|TY1PR01MB1786:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB17864616600B0AE85918F8A7C0510@TY1PR01MB1786.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(189003)(199004)(478600001)(7416002)(55016002)(9686003)(6916009)(2906002)(66476007)(5660300002)(44832011)(76116006)(71200400001)(86362001)(33656002)(8936002)(54906003)(66556008)(66446008)(64756008)(186003)(53546011)(316002)(7696005)(66946007)(26005)(52536014)(4326008)(81166006)(8676002)(81156014)(6506007);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1786;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r1dq84szu1Wum9chAHmM5fva9R6HD4jqpl3ZFfTE81I81mU39TkXU0DQJzFdXgbmL/2Q/E4Omy1OVOwJrTyZBGVcMdR9/8No8kfyd1tfbvH5fA8aYCkx7neMuXjExI32qMJkksl1ndNI3u+WbEcLSyoL7U84Ql3nyLW1n1NhVIOiqaQpuXpdxCglG79HUos0nZGVL031zuoPyZkIcRQ06wIV5ocYlrBGVMyJG9EbjRDvUHiGs2tTJwoimua/yoKEV7W/iJWrNC6Ue1ECsiVPPCrIqSxUgiDsxgG7QWoH7+sXXG8R/VrEjxm99GZT3/ZvQelonZUJOKRMkRiLYnujEjSQk2T0IeABENh4vcEPBSiiqSPijBrzgMtVQ6hxVJY5bbtTH5RR82TBzXR9psA2UWGZadKDUGuxXMt0L+KEceFvgtH9utqQ65hJDneL1pCa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f7935c-3ce3-4831-87a2-08d78257c997
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:43:04.9992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDiiDaSnJ8WMKLPBuf+mhajkjvrnVK/7EZnmlty/Wci/Uzd24Y9NoyaLUZ5cwfY4V+uflAE4bY/qdfBjYlMu6J3Rk2Zi0J0vth5mrHSP/30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1786
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IGRl
dmljZXRyZWUtb3duZXJAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlLW93bmVyQHZnZXIua2Vy
bmVsLm9yZz4gT24gQmVoYWxmIE9mIExhdXJlbnQgUGluY2hhcnQNCj4gU2VudDogMTMgRGVjZW1i
ZXIgMjAxOSAyMTo0Mg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDUvN10gZHJtOiByY2FyLWR1
OiBsdmRzOiBGaXggbW9kZSBmb3IgY29tcGFuaW9uIGVuY29kZXINCj4gDQo+IEhpIEZhYnJpemlv
LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBGcmksIERlYyAwNiwg
MjAxOSBhdCAwNDozMjo1MlBNICswMDAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+ID4gUHJp
bWFyeSBhbmQgY29tcGFuaW9uIGVuY29kZXJzIG5lZWQgdG8gc2V0IHRoZSBzYW1lIG1vZGUgZm9y
DQo+ID4gdGhpbmdzIHRvIHdvcmsgcHJvcGVybHkuDQo+ID4NCj4gPiByY2FyX2x2ZHNfbW9kZV9z
ZXQgZ2V0cyBjYWxsZWQgaW50byBmb3IgdGhlIHByaW1hcnkgZW5jb2RlciBvbmx5LA0KPiA+IHRo
ZXJlZm9yZSBpbml0aWFsaXplIHRoZSBjb21wYW5pb24gZW5jb2RlciBtb2RlIHdoaWxlIHNvcnRp
bmcNCj4gPiB0aGUgcHJpbWFyeSBlbmNvZGVyIG1vZGUgb3V0Lg0KPiA+DQo+ID4gRml4ZXM6IGZh
NDQwZDg3MDM1OCAoImRybTogcmNhci1kdTogbHZkczogQWRkIHN1cHBvcnQgZm9yIGR1YWwtbGlu
ayBtb2RlIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNh
c3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFdvdWxkIHlvdSBtaW5kIHJlYmFzaW5nIHRoaXMg
b24gdG9wIG9mICJkcm06IHJjYXItZHU6IGx2ZHM6IEdldCBtb2RlDQo+IGZyb20gc3RhdGUiID8N
Cg0KSXQgbG9va3MgbGlrZSBkcm9wcGluZyB0aGlzIHBhdGNoIGFuZCByZWJhc2luZyBvbiB0b3Ag
b2YgeW91ciB2MiBmb3INCiJkcm06IHJjYXItZHU6IGx2ZHM6IEdldCBtb2RlIGZyb20gc3RhdGUi
IGRvZXMgdGhlIHRyaWNrIG5vdy4NCg0KV2lsbCBwdXQgYSBkZXBlbmRlbmN5IHRvIHlvdXIgcGF0
Y2ggaW4gdjUuDQoNCkNoZWVycywNCkZhYg0KDQo+IA0KPiA+IC0tLQ0KPiA+IHYzLT52NDoNCj4g
PiAqIE5ldyBwYXRjaCBleHRyYWN0ZWQgZnJvbSBwYXRjaDoNCj4gPiAgICJkcm06IHJjYXItZHU6
IGx2ZHM6IEFkZCBkdWFsLUxWRFMgcGFuZWxzIHN1cHBvcnQiDQo+ID4gLS0tDQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgMTIgKysrKysrKysrKysrDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2x2ZHMuYw0KPiA+IGluZGV4IGNiMjE0N2MuLmVlZDU2MTEgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0KPiA+IEBAIC02MTQsNiArNjE0LDE4IEBAIHN0
YXRpYyB2b2lkIHJjYXJfbHZkc19tb2RlX3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0K
PiA+ICAJbHZkcy0+ZGlzcGxheV9tb2RlID0gKmFkanVzdGVkX21vZGU7DQo+ID4NCj4gPiAgCXJj
YXJfbHZkc19nZXRfbHZkc19tb2RlKGx2ZHMpOw0KPiA+ICsJaWYgKGx2ZHMtPmNvbXBhbmlvbikg
ew0KPiA+ICsJCXN0cnVjdCByY2FyX2x2ZHMgKmNvbXBhbmlvbl9sdmRzID0gYnJpZGdlX3RvX3Jj
YXJfbHZkcygNCj4gPiArCQkJCQkJCWx2ZHMtPmNvbXBhbmlvbik7DQo+ID4gKw0KPiA+ICsJCS8q
DQo+ID4gKwkJICogRklYTUU6IFdlIHNob3VsZCBub3QgYmUgbWVzc2luZyB3aXRoIHRoZSBjb21w
YW5pb24gZW5jb2Rlcg0KPiA+ICsJCSAqIHByaXZhdGUgZGF0YSBmcm9tIHRoZSBwcmltYXJ5IGVu
Y29kZXIsIGJ1dCBzaW5jZQ0KPiA+ICsJCSAqIHJjYXJfbHZkc19tb2RlX3NldCBnZXRzIGNhbGxl
ZCBpbnRvIGZvciB0aGUgcHJpbWFyeSBlbmNvZGVyDQo+ID4gKwkJICogb25seSwgd2UgZG9uJ3Qg
aGF2ZSBtdWNoIG9mIGEgY2hvaWNlIGZvciBub3cuDQo+ID4gKwkJICovDQo+ID4gKwkJY29tcGFu
aW9uX2x2ZHMtPm1vZGUgPSBsdmRzLT5tb2RlOw0KPiA+ICsJfQ0KPiA+ICB9DQo+ID4NCj4gPiAg
c3RhdGljIGludCByY2FyX2x2ZHNfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpDQo+
IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
