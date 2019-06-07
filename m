Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 829DD386AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 11:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbfFGJAb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 05:00:31 -0400
Received: from mail-eopbgr1410134.outbound.protection.outlook.com ([40.107.141.134]:22372
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726531AbfFGJAb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 05:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ug4D4bWQLFod8L4mR0B6ztjM+TriGDmUg1GSORIW8KU=;
 b=nqigpFQheTOG8f1y384EapSPxIHch9Wze/EnmNOy/uk+JnGUJCGZ7wf3X5Z+/KynmX52HlJt3a6qvf7jsGg4UoTMkqrIhq/e6Xg+W5Z7lzbH5UOblsUeKsXCuqy/MjNkhwl/cg9jyK9no5xaQ4h78Gyjvj/282Xgqjh1jNOoZGA=
Received: from TYAPR01MB3102.jpnprd01.prod.outlook.com (20.177.103.73) by
 TYAPR01MB3198.jpnprd01.prod.outlook.com (20.177.103.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Fri, 7 Jun 2019 09:00:26 +0000
Received: from TYAPR01MB3102.jpnprd01.prod.outlook.com
 ([fe80::4c13:4e4f:c7ac:9f6e]) by TYAPR01MB3102.jpnprd01.prod.outlook.com
 ([fe80::4c13:4e4f:c7ac:9f6e%3]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 09:00:26 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: rcar-gen3-usb2: fix imbalance powered flag
Thread-Topic: [PATCH] phy: renesas: rcar-gen3-usb2: fix imbalance powered flag
Thread-Index: AQHVG1qxx9ucB2mLPUSYOHggZ3+zpqaMymmAgAAt5MCAABBwAIAC2Ysg
Date:   Fri, 7 Jun 2019 09:00:26 +0000
Message-ID: <TYAPR01MB3102B60943E7A677B5C17570D8100@TYAPR01MB3102.jpnprd01.prod.outlook.com>
References: <1559710142-29161-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUqajM2yR72AYE5ppp-RJumfoG2+YArEzLiJvt55_1k4g@mail.gmail.com>
 <OSAPR01MB30897161EF40942B1E561232D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <CAMuHMdVHpOULpusZeOJvRs8OMoC2JopOqrK9Q8KeCxtyEbz0qA@mail.gmail.com>
In-Reply-To: <CAMuHMdVHpOULpusZeOJvRs8OMoC2JopOqrK9Q8KeCxtyEbz0qA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bd4f110-aaa3-41d7-c552-08d6eb269519
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3198;
x-ms-traffictypediagnostic: TYAPR01MB3198:
x-microsoft-antispam-prvs: <TYAPR01MB319808883645C635B2EF5FABD8100@TYAPR01MB3198.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(136003)(366004)(376002)(346002)(199004)(189003)(74316002)(2906002)(9686003)(6506007)(102836004)(55016002)(3846002)(76176011)(6116002)(316002)(6436002)(486006)(25786009)(5660300002)(68736007)(7696005)(53936002)(305945005)(99286004)(66476007)(14454004)(6916009)(229853002)(6246003)(66066001)(71200400001)(54906003)(7736002)(11346002)(186003)(446003)(71190400001)(26005)(8936002)(81166006)(64756008)(66556008)(86362001)(8676002)(73956011)(5024004)(14444005)(66946007)(76116006)(476003)(66446008)(256004)(52536014)(81156014)(478600001)(4326008)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3198;H:TYAPR01MB3102.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5ZihYdyfTpxebksGpT2/FgVUv0SqzqX5DJ2r1EYRcVuAeXdcL2FqyeOleWXgwUdnlBG56iuw38DBN2mhjRz/YJb10eW+wAYIs/9n2i3/89bq3mjwplt1aWVJlOY5lJDwKyRvC3q0Y4dXU/fguuxMwF9ecNHq53tigmRpjJzkJpf7qSfNRWFxhimdDrLRi10RJVf1I5FzxO7y2+ypx5ZahCQ8zxGiwmkgi1k8un5vXMrYx6Dx5BnJ+8G3iqDMuh/ycYO9y77QQMbLhbC87kzFOf/IcmycBOLevppFZj0iLKlNcJUMMeghtjmy/zUC9UxCSenJeK42NpZImEVFg/EGne2SEr+MpPs1r0w832SM0mS/PoaXNDJWojTlZ28GJJNu44TEfxkWv7BJXrQ5T0NFpZW/OBXw/vl3TzWZJG03MWs=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd4f110-aaa3-41d7-c552-08d6eb269519
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 09:00:26.1183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3198
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBKdW5lIDUsIDIwMTkgMTA6MDggUE0NCjxzbmlwPg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0
dGVyaG9ldmVuLCBTZW50OiBXZWRuZXNkYXksIEp1bmUgNSwgMjAxOSA2OjI1IFBNDQo+ID4gPHNu
aXA+DQo+ID4gPiBUaGFuayB5b3UsIHRoaXMgc2VlbXMgdG8gZml4IHRoZSB3YXJuaW5nLCBzbw0K
PiA+ID4gVGVzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPg0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciB0aGUgdGVzdGluZyENCj4gPg0KPiA+ID4gSG93
ZXZlciwgdGhlIG90aGVyIGltYmFsYW5jZSAocGh5LWVlMDgwMjAwLnVzYi1waHkuNiBlbmFibGlu
ZyBpdHMNCj4gPiA+IHJlZ3VsYXRvciBkdXJpbmcgZWFjaCBzeXN0ZW0gcmVzdW1lIHBoYXNlLCBi
dXQgbmV2ZXIgdG91Y2hpbmcgaXQNCj4gPiA+IG90aGVyd2lzZSkgaXMgc3RpbGwgcHJlc2VudC4N
Cj4gPg0KPiA+IFVtbSwgc2luY2UgSSdkIGxpa2UgdG8gaW52ZXN0aWdhdGUgdGhpcywNCj4gPiB3
b3VsZCB5b3Ugc2hhcmUgeW91ciBkZWJ1ZyBwcmludCBwYXRjaD8NCj4gDQo+IEF0dGFjaGVkLg0K
DQpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guIEZpbmFsbHksIEkgZm91bmQgdGhlIG90aGVyIGlt
YmFsYW5jZSBpcyBjYXVzZWQgYnkNCnJjYXJfZ2VuM19waHlfdXNiMl9wb3dlcl9vbigpLiByY2Fy
X2dlbjNfcGh5X3VzYjJfcG93ZXJfb24oKSBzaG91bGQgaGF2ZQ0Kb3duIG11dGV4IGxvY2sgdG8g
YXZvaWQgYSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIGNhbGxzIHJjYXJfZ2VuM19hcmVfYWxsX3Jw
aHlzX3Bvd2VyX29mZigpDQphbmQgYXNzaWduIHRoZSAtPnBvd2VyZWQuIFNvLCBJJ2xsIHN1Ym1p
dCB2MiBwYXRjaCBsYXRlci4NCg0KTm90ZXM6DQogLSBFdmVuIGlmIHRoZSBkcml2ZXIgaGFzIHN1
Y2ggYW4gb3duIG11dGV4LCBzb21ldGltZXMgdGhlIGRpZmZlcmVudCBwaHkgbnVtYmVyDQogICBl
bmFibGVzIHRoZSByZWd1bGF0b3IuIEJ1dCB0aGUgaW1iYWxhbmNlIGVuYWJsaW5nIHRoZSByZWd1
bGF0b3IgaXNzdWUgZGlzYXBwZWFycy4NCg0KIC0gT25lIG9mIHRoZSBwaHkgY2hhbm5lbCBoYXMg
NCBwaHkgZGV2aWNlcy4gQW5kIHRoZSBwaHkgY2hhbm5lbCBoYXMgYSByZWd1bGF0b3INCiAgIHNv
IHRoYXQgZW5hYmxpbmcgdGhlIHJlZ3VsYXRvciBieSBvbmUgb2YgdGhlIHBoeSBkZXZpY2VzIGlz
IGVub3VnaC4NCg0KLS0tIEV4YW1wbGUgKHY1LjItcmMzIG9uIFItQ2FyIEgzKSAtLS0NCiMgbHMg
L3N5cy9jbGFzcy9waHkvDQpwaHktZTY1ZWUwMDAudXNiLXBoeS4xMiAgcGh5LWVlMGEwMjAwLnVz
Yi1waHkuMCAgcGh5LWVlMGMwMjAwLnVzYi1waHkuNQ0KcGh5LWVlMDgwMjAwLnVzYi1waHkuMTAg
IHBoeS1lZTBhMDIwMC51c2ItcGh5LjEgIHBoeS1lZTBjMDIwMC51c2ItcGh5LjYNCnBoeS1lZTA4
MDIwMC51c2ItcGh5LjExICBwaHktZWUwYTAyMDAudXNiLXBoeS4yICBwaHktZWUwYzAyMDAudXNi
LXBoeS43DQpwaHktZWUwODAyMDAudXNiLXBoeS44ICAgcGh5LWVlMGEwMjAwLnVzYi1waHkuMw0K
cGh5LWVlMDgwMjAwLnVzYi1waHkuOSAgIHBoeS1lZTBjMDIwMC51c2ItcGh5LjQNCg0KLSBwaHkt
ZWUwODAyMDAudXNiLXBoeSBpcyBvbmUgb2YgdGhlIHBoeSBjaGFubmVsLg0KLS0gQW5kIHRoZSAi
cGh5LWVlMDgwMjAwLnVzYi1waHkiIHBoeSBjaGFubmVsIGhhcyBhIHJlZ3VsYXRvci4NCi0tIE90
aGVyIHBoeSBjaGFubmVscyAocGh5LWVlMFthY10wMjAwLnVzYi1waHkpIGRvbid0IGhhdmUgdGhl
aXIgcmVndWxhdG9ycy4NCg0KLSBwaHktZWUwODAyMDAudXNiLXBoeS57OCw5LDEwLDExfSBhcmUg
cGh5IGRldmljZXMuDQotLS0tDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoN
Cg==
