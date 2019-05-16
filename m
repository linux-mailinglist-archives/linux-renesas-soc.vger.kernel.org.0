Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A337C2078E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 15:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbfEPND5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 09:03:57 -0400
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:15392
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726623AbfEPND5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 09:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQJ0mumZwp3bkDOD0To3Pf/auTnRQSxHC6Ub6/weG0Y=;
 b=aM4hNsu3RgprdcTg6DqhLyPOZqXeDQo3NoUQ8v6hzdRF8jg+znrG5R4ck8QI4gBe04tvFGnfvKpJ/M7c4otdsaiQ9TYn7Pz2qHyaGbN6KKHZa8gsLle/odjgLcrsaVK7yqk/QPsK19rKCmFMC6Gv/0CvnJY9V2zzHvhoMoFIVpM=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4808.jpnprd01.prod.outlook.com (20.179.182.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Thu, 16 May 2019 13:03:51 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 13:03:51 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Thread-Topic: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Thread-Index: AQHVCyUpvBbBPGrYP0S5NxoVhRdkraZtsr4AgAAAtVA=
Date:   Thu, 16 May 2019 13:03:51 +0000
Message-ID: <OSBPR01MB21033D45103D667F4EFD7877B80A0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUnMhDyEoFDs05WKU=0PtV2FmAxuGWFhf7ekxfK=Y5gSg@mail.gmail.com>
In-Reply-To: <CAMuHMdUnMhDyEoFDs05WKU=0PtV2FmAxuGWFhf7ekxfK=Y5gSg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a26bebb2-09ab-4177-7ee1-08d6d9fef194
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4808;
x-ms-traffictypediagnostic: OSBPR01MB4808:
x-microsoft-antispam-prvs: <OSBPR01MB4808C52EFBD0103D397506ECB80A0@OSBPR01MB4808.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(366004)(376002)(136003)(346002)(189003)(199004)(51914003)(76116006)(486006)(6436002)(478600001)(68736007)(71190400001)(71200400001)(86362001)(52536014)(446003)(14454004)(99286004)(54906003)(476003)(7696005)(316002)(74316002)(5660300002)(7736002)(55016002)(305945005)(11346002)(66446008)(9686003)(25786009)(66476007)(66556008)(64756008)(6916009)(14444005)(229853002)(73956011)(66946007)(44832011)(256004)(6116002)(2906002)(186003)(81156014)(6246003)(81166006)(3846002)(4326008)(26005)(53936002)(8936002)(8676002)(66066001)(76176011)(6506007)(53546011)(33656002)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4808;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zr1STlDdICoBN7U45JeDPHhMfYMYdDLPWEXPgauiD/UocaXTFWFbZ+LBJ7MItuO/mkrVSj/Y72cdTxgaUn4ng1QThFWPOvT/EqlorXVLQqTm3j4BykFnI9zp8QOS2vTGeyv4JkFGOPQTmtyCNveerXV8H0AeW1RO/SS3+s2mq0BYHR1guCyFadYqA4YuWKvHjrkOn5YVqxojNV/zAQXwb6M0vIynKjnUOCs+ea7APws3rN40172LSy9YMx8Dn4M13vhJYw71TVF4JHUdwJtIeB7Zoa5mgug3y1rm+BRcgxodbyz3pbiDj3ton6veqZijB8EuxMv7OhNThpNfbky8ayHKPMwo9MtXEuiSgS0XbBtOVj14pXpTcr/jTFbjB6wmSXTgMZ9B3hIRQboHv+pqBO7W2Zm6rrx0CmirlLe9RUM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26bebb2-09ab-4177-7ee1-08d6d9fef194
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 13:03:51.5346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4808
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsIA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIXSBwaHk6IHJlbmVzYXM6IHBoeS1yY2FyLWdlbjI6IEZpeCB0aGUgYXJyYXkgb2ZmIGJ5
IG9uZQ0KPiB3YXJuaW5nDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBNYXkgMTUsIDIw
MTkgYXQgMzo1MCBQTSBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IHdyb3Rl
Og0KPiA+IEZpeCB0aGUgYmVsb3cgc21hdGNoIHdhcm5pbmcgYnkgYWRkaW5nIHZhcmlhYmxlIGNo
ZWNrIHJhdGhlciB0aGFuIHRoZQ0KPiA+IGhhcmRjb2RlZCB2YWx1ZS4NCj4gPiB3YXJuOiBhcnJh
eSBvZmYgYnkgb25lPyAnZGF0YS0+c2VsZWN0X3ZhbHVlW2NoYW5uZWxfbnVtXScNCj4gPg0KPiA+
IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0KPiAN
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBXaGlsZSB5b3VyIHBhdGNo
IGlzIGNvcnJlY3QgKHRvIHRoZSBiZXN0IG9mIG15IGtub3dsZWRnZSksIEkgdGhpbmsgdGhlIGNv
ZGUNCj4gY2FuIGJlIG1hZGUgbW9yZSBtYWludGFpbmFibGUgYnkgdXNpbmcgQVJSQVlfU0laRSgp
Lg0KDQpPay4gSSB3aWxsIHNlbmQgVjIuDQoNCj4gPiAtLS0gYS9kcml2ZXJzL3BoeS9yZW5lc2Fz
L3BoeS1yY2FyLWdlbjIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGh5L3JlbmVzYXMvcGh5LXJjYXIt
Z2VuMi5jDQo+ID4gQEAgLTcxLDYgKzcxLDcgQEAgc3RydWN0IHJjYXJfZ2VuMl9waHlfZHJpdmVy
IHsgIHN0cnVjdA0KPiA+IHJjYXJfZ2VuMl9waHlfZGF0YSB7DQo+ID4gICAgICAgICBjb25zdCBz
dHJ1Y3QgcGh5X29wcyAqZ2VuMl9waHlfb3BzOw0KPiA+ICAgICAgICAgY29uc3QgdTMyICgqc2Vs
ZWN0X3ZhbHVlKVtQSFlTX1BFUl9DSEFOTkVMXTsNCj4gPiArICAgICAgIGNvbnN0IHUzMiBsYXN0
X2NoYW5uZWw7DQo+IA0KPiBudW1fY2hhbm5lbHM/ICh3aGljaCBpcyBvbmUgbW9yZSB0aGFuIGxh
c3RfY2hhbm5lbCkNCk9LLg0KDQo+ID4gIH07DQo+ID4NCj4gPiAgc3RhdGljIGludCByY2FyX2dl
bjJfcGh5X2luaXQoc3RydWN0IHBoeSAqcCkgQEAgLTI3MSwxMSArMjcyLDEzIEBADQo+ID4gc3Rh
dGljIGNvbnN0IHUzMiB1c2IyMF9zZWxlY3RfdmFsdWVbXVtQSFlTX1BFUl9DSEFOTkVMXSA9IHsg
IHN0YXRpYw0KPiA+IGNvbnN0IHN0cnVjdCByY2FyX2dlbjJfcGh5X2RhdGEgcmNhcl9nZW4yX3Vz
Yl9waHlfZGF0YSA9IHsNCj4gPiAgICAgICAgIC5nZW4yX3BoeV9vcHMgPSAmcmNhcl9nZW4yX3Bo
eV9vcHMsDQo+ID4gICAgICAgICAuc2VsZWN0X3ZhbHVlID0gcGNpX3NlbGVjdF92YWx1ZSwNCj4g
PiArICAgICAgIC5sYXN0X2NoYW5uZWwgPSAyLA0KPiANCj4gLm51bV9jaGFubmVscyA9IEFSUkFZ
X1NJWkUocGNpX3NlbGVjdF92YWx1ZSkNCk9LLg0KDQo+ID4gIH07DQo+ID4NCj4gPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCByY2FyX2dlbjJfcGh5X2RhdGEgcnpfZzFjX3VzYl9waHlfZGF0YSA9IHsN
Cj4gPiAgICAgICAgIC5nZW4yX3BoeV9vcHMgPSAmcnpfZzFjX3BoeV9vcHMsDQo+ID4gICAgICAg
ICAuc2VsZWN0X3ZhbHVlID0gdXNiMjBfc2VsZWN0X3ZhbHVlLA0KPiA+ICsgICAgICAgLmxhc3Rf
Y2hhbm5lbCA9IDAsDQo+IA0KPiAubnVtX2NoYW5uZWxzID0gQVJSQVlfU0laRSh1c2IyMF9zZWxl
Y3RfdmFsdWUpDQoNCk9LLg0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIHJjYXJfZ2VuMl9waHlfbWF0Y2hfdGFibGVbXSA9IHsgQEANCj4gPiAtMzg5
LDcgKzM5Miw3IEBAIHN0YXRpYyBpbnQgcmNhcl9nZW4yX3BoeV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiA+ICAgICAgICAgICAgICAgICBjaGFubmVsLT5zZWxlY3Rl
ZF9waHkgPSAtMTsNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICBlcnJvciA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKG5wLCAicmVnIiwgJmNoYW5uZWxfbnVtKTsNCj4gPiAtICAgICAgICAgICAgICAg
aWYgKGVycm9yIHx8IGNoYW5uZWxfbnVtID4gMikgew0KPiA+ICsgICAgICAgICAgICAgICBpZiAo
ZXJyb3IgfHwgY2hhbm5lbF9udW0gPiBkYXRhLT5sYXN0X2NoYW5uZWwpIHsNCj4gDQo+ID49IGRh
dGEtPm51bV9jaGFubmVscw0KT0suDQoNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBkZXZf
ZXJyKGRldiwgIkludmFsaWQgXCJyZWdcIiBwcm9wZXJ0eVxuIik7DQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIGVycm9yOw0KPiA+ICAgICAgICAgICAgICAgICB9DQoNClJlZ2Fy
ZHMsDQpCaWp1DQo=
