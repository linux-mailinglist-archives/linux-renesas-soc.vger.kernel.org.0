Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFEC3BF58E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 17:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfIZPLo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 11:11:44 -0400
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:6126
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726175AbfIZPLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 11:11:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6yz8KLL+5bh+o1CNWi9Z+I5E0HQt213TEOVnqp74YI1CudL388uQVDrBMCFOcB+F3IRdqgEsTGEjfLtil0evvCuDRohqOxYCAyimfnuvglYJIh4hwe8MUGZWMuEDXq8IBpxYV/k1X6GOdqj6mLoFY0pgnLiKvxxeHkuEXqw3Y9FYPUwFzszDhhuzE8gh8zxYzR79alchiL185XB4RFjPVIBYkr2OUjZrP6/dLohTcc30dQfKW7v/wyziPJPjgWZvVN9N0hT8xjZCntZJiU3b6G46liSYwtjS6RWTsGKqd3ulOnPQ/VEcObvcXY/hfcqeeJD2z/QszrzjT1IvyVzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nu4Y+WRtEi9/h/CGKrEs1xf4pwhOasu7I0nPXA6S86s=;
 b=DLBzYGPtVPZwSATf6o0JGS3Jopq1UQKS63x33q2dwrlSbP52HYWPjHK7kDQBuv/XPSoxKAO5+IdiH/Kx3u0StzpaVLRXaMtYRWvi+5dtc7/J3pdOZNft+ywOiJl+7hQdFDnwxdR1PiJuXzGXLroyDAM4XAW1Q5helSMQZuzB5PzKoD594VkS9HK8nmspisDSWIzO6zonuEmYc4m9BV+pWiEhcu1CzNuuPnfiDJf0j+SQzJ3OeX6R5c7k/4WG22Z/B/Esn2gK4xRO/JBZhi0h/FdR7fGGw8qzFzWDxHbhdo0+fHwcH6clNGB014A4T1o2aTsIzDK1T3lkcBYLSAFpPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nu4Y+WRtEi9/h/CGKrEs1xf4pwhOasu7I0nPXA6S86s=;
 b=hYTChg/urvhXe5bI30bYAJQdeVYBpkVmX02ike+Nqb4/LQiV7DbO099Tf0UBrQK88cgrv7jX0wLAi8hXC9l16D/1wGUgJax9Wz9COF2Kh2+3e3ZClwuMN06Uv1Hyl1kPKBpQI1Tkt5XF9aTeTR3BXL8GBHgLx/fDC/mCKR3J+XY=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1736.jpnprd01.prod.outlook.com (52.134.227.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 15:11:38 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb%5]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 15:11:38 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Topic: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Index: AQHVcqQwVUdoU56Bi06ox7Sw0gSDmqc+BhQAgAAM8rA=
Date:   Thu, 26 Sep 2019 15:11:38 +0000
Message-ID: <OSBPR01MB21036B8294382D1A7A50816BB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUsLCciw7KFudSC7pRqfwwaGH5iJSgv906kY342V+6ocQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUsLCciw7KFudSC7pRqfwwaGH5iJSgv906kY342V+6ocQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8482dccd-1c85-4b7c-f20c-08d74293d431
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:OSBPR01MB1736;
x-ms-traffictypediagnostic: OSBPR01MB1736:|OSBPR01MB1736:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1736627E1BDEAAF6B4B67325B8860@OSBPR01MB1736.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(199004)(51914003)(189003)(74316002)(14454004)(316002)(54906003)(7696005)(9686003)(6306002)(55016002)(71200400001)(76176011)(53546011)(6506007)(66066001)(5660300002)(99286004)(8676002)(2906002)(81156014)(8936002)(102836004)(26005)(3846002)(81166006)(71190400001)(6246003)(66946007)(966005)(478600001)(11346002)(44832011)(256004)(64756008)(66476007)(66556008)(186003)(6116002)(6916009)(76116006)(86362001)(6436002)(33656002)(4326008)(229853002)(486006)(66446008)(52536014)(476003)(25786009)(7736002)(446003)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1736;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iDHLhOpUehGXWhi+/epUMqMhzBlj5vtPyAqX84jftWD8mZzu462GzWe/m99oobpZG0EtZl9e62iSiHrvfCNMx5rggSQx30u4w4aAmUCtUhGsFwb3/xwXYo6gtiUF7QYTR20Rf7gUSrGL9b3UHE+XCHnZylkgpZYiA+3Yot4DPoGWgMlTJ7+dqmvJ5mslI+W0seTBCJCeQlS1rMMKPxbGHGvMWHz+n2nxw17+Jq+Kk1ZIxGEw5HdSo41QfXyfxr2m0XdZlwmVaIU00Pc2YUETHMxxSGo+cecuzU9CAitELOMDxTGf8Z1LARaVFy/mXCPvDW7PbsXzJ+DQXyH+wChAYGyWCkl0XTNbxCaXGIVEsFR23YPFBpLIZ8oQuuTc2Fg12rk/w0qKLAdQNRYkzevApgZeKc3q5pRqLU1VE257l/AzI7GY7b6760b9QVnHO8i6e0nbYUx8Xj/QUD92a5pX3g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8482dccd-1c85-4b7c-f20c-08d74293d431
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 15:11:38.0964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VH75d1ivaVGVQsBLvfNDXmo7+Gm4tbM+C9+HTdlC/5m2Bzmpl2jZC+1NXkupvNfiosmEozYjwjgZUoEUfNN1Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1736
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIG1tYzogcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWM6IEFkZCByOGE3NzRiMQ0KPiBz
dXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgODo0
OSBBTSBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoaXMg
cGF0Y2ggYWRkcyBTREhJIHN1cHBvcnQgZm9yIFJaL0cyTiAoUjhBNzc0QjEpIFNvQy4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfaW50ZXJuYWxfZG1hYy5j
IHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWMuYw0K
PiA+IGIvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfaW50ZXJuYWxfZG1hYy5jDQo+ID4g
aW5kZXggNzUxZmU5MS4uN2M2MDIwZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0
L3JlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFjLmMNCj4gPiArKysgYi9kcml2ZXJzL21tYy9ob3N0
L3JlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFjLmMNCj4gPiBAQCAtMzA4LDYgKzMwOCw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc29jX2RldmljZV9hdHRyaWJ1dGUNCj4gc29jX3doaXRlbGlzdFtd
ID0gew0KPiA+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopQklUKFNESElfSU5URVJOQUxfRE1B
Q19PTkVfUlhfT05MWSkgfSwNCj4gPiAgICAgICAgIC8qIGdlbmVyaWMgb25lcyAqLw0KPiA+ICAg
ICAgICAgeyAuc29jX2lkID0gInI4YTc3NGExIiB9LA0KPiA+ICsgICAgICAgeyAuc29jX2lkID0g
InI4YTc3NGIxIiB9LA0KPiA+ICAgICAgICAgeyAuc29jX2lkID0gInI4YTc3NGMwIiB9LA0KPiA+
ICAgICAgICAgeyAuc29jX2lkID0gInI4YTc3NDcwIiB9LA0KPiA+ICAgICAgICAgeyAuc29jX2lk
ID0gInI4YTc3OTUiIH0sDQo+IA0KPiBJcyB0aGlzIHN1ZmZpY2llbnQ/DQo+IERvIHlvdSBuZWVk
IGEgdHVuaW5nIHF1aXJrIGVudHJ5IGluIHNkaGlfcXVpcmtzX21hdGNoW10/DQoNCkRvIHlvdSBt
ZWFuIHRoZSAgInF1aXJrcy0+bWFudWFsX2NhbGlicmF0aW9uIiAgYXMgbWVudGlvbmVkIGluIHRo
ZSBiZWxvdyBwYXRjaCA/IA0KDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEx
MDI0MTMxLw0KDQpyZWdhcmRzLA0KQmlqdQ0K
