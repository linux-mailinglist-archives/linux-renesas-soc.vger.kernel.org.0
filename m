Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53BCE21471
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 09:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbfEQHeu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 May 2019 03:34:50 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:59856
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727500AbfEQHeu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 03:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyDGNPBkPj721lexzONB4Ueod9QIvSYzJeAcm2deUvI=;
 b=GUWPUMzOQB03MN6MJWwDNczW8Q84x4QLYjGMBeyGe6if6Sxhxlpfo1Hk0FIL9Qc0rXQPVyyW/rk2FSHJpPQk8RDdCwnWbo6uTc/OB+KbzPFPLoQsxJyrfrIPedsj+SekUcpb/zDUQ1LreGZU6WzPRziH0PojZLEdBmabDj8UK3k=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1865.jpnprd01.prod.outlook.com (52.133.163.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 07:34:44 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::60bb:89e4:1a58:e901]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::60bb:89e4:1a58:e901%2]) with mapi id 15.20.1878.028; Fri, 17 May 2019
 07:34:44 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: Add vendor prefix for HopeRun
Thread-Topic: [PATCH v2 1/2] dt-bindings: Add vendor prefix for HopeRun
Thread-Index: AQHVCzwl7OY4twH50k+HG0lEAy9DtKZumr+AgABUYOA=
Date:   Fri, 17 May 2019 07:34:44 +0000
Message-ID: <TY1PR01MB1770D6A5A20BC7E592BF6DF6C00B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1557938083-25423-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1557938083-25423-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqJtS4R57t+-CQZaDNYQ7HsW+TORUhXLxWLGkf+mkg94HA@mail.gmail.com>
In-Reply-To: <CAL_JsqJtS4R57t+-CQZaDNYQ7HsW+TORUhXLxWLGkf+mkg94HA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 453a420a-9abb-493d-641a-08d6da9a21be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1865;
x-ms-traffictypediagnostic: TY1PR01MB1865:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TY1PR01MB1865A13C2799FAC82D7A524CC00B0@TY1PR01MB1865.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:359;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(136003)(366004)(376002)(396003)(189003)(199004)(25786009)(6436002)(76176011)(7696005)(86362001)(55016002)(4326008)(68736007)(44832011)(66066001)(6246003)(229853002)(66446008)(64756008)(66556008)(66476007)(9686003)(486006)(256004)(476003)(76116006)(186003)(26005)(66946007)(102836004)(316002)(99286004)(446003)(11346002)(6306002)(6506007)(73956011)(53936002)(5660300002)(4744005)(71200400001)(71190400001)(53546011)(52536014)(81166006)(8676002)(966005)(7416002)(6116002)(3846002)(33656002)(2906002)(14454004)(74316002)(54906003)(478600001)(305945005)(7736002)(81156014)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1865;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZAdZNetxB1oyPewMHopGti8OL3TGm03WrMf2OaPZjIJFV2+rM+1BA1w9ViyWjOaU4vrIt2656rLUa1NP2L5nffmUXAfppCrVemjHGIu9S/0ZDCKMZNdDzK0SWLOZnnRvr25EBOjLbfjEYxGBw+aGqdRg52oMqU99vtJIqrXGBzuxh494yi5rgypzC2N+L2KTZxFNkpPe5+oeNNgIJ/JnNXpxEqDzO7ccn4O2jiVgcyWHqL5ZltNmkLKJa0qDgaTrpDvuiSFx3p4gD0L5qZmG9ACcDLEqRR+rMAc4soIgsun/5mZfYcLXES4APls8tRgijVDNNDafHp8Q8WCn9J+r8bZVvQN52JHMIXMrQSc7uifYT7kY+CwztAj3JRTeDWFnqY1MqZoBWMbYqjoCLWYFU2cYy7iI+vBIl8Po/rPYaT0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453a420a-9abb-493d-641a-08d6da9a21be
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 07:34:44.2706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1865
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gUm9iLA0KDQo+IEZyb206IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+DQo+
IFNlbnQ6IDE3IE1heSAyMDE5IDAzOjMxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8yXSBk
dC1iaW5kaW5nczogQWRkIHZlbmRvciBwcmVmaXggZm9yIEhvcGVSdW4NCj4gDQo+IE9uIFdlZCwg
TWF5IDE1LCAyMDE5IGF0IDExOjM1IEFNIEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2Fz
dHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEFkZCAiSmlhbmdzdSBIb3BlUnVu
IFNvZnR3YXJlIENvLiwgTHRkLiIgdG8gdGhlIGxpc3Qgb2YgZGV2aWNldHJlZQ0KPiA+IHZlbmRv
ciBwcmVmaXhlcyBhcyAiaG9wZXJ1biIuDQo+ID4NCj4gPiBXZWJzaXRlOiBodHRwOi8vd3d3Lmhv
cGVydW4uY29tL2VuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZh
YnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQ2hyaXMgUGF0
ZXJzb24gPENocmlzLlBhdGVyc29uMkByZW5lc2FzLmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IHYx
LT52MjoNCj4gPiAqIE5vIGNoYW5nZQ0KPiA+DQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMudHh0IHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KPiANCj4gSSd2ZSBjb252ZXJ0ZWQgdGhpcyBmaWxlIHRvIGpzb24t
c2NoZW1hIGFzIG9mIHY1LjItcmMxLiBTZWUgY29tbWl0DQo+IDgxMjJkZTU0NjAyZS4gU29ycnks
IGJ1dCB5b3Ugd2lsbCBoYXZlIHRvIHJld29yayB0aGlzIHBhdGNoLg0KDQpJIHNlZSwgd2lsbCBz
ZW5kIGEgbmV3IHZlcnNpb24uDQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiANCj4gUm9iDQo=
