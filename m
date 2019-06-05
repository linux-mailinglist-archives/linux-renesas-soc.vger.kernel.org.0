Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87CFC355BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 06:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfFEEGs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 00:06:48 -0400
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:31440
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725294AbfFEEGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 00:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzRw9pf2OfyvOVRgkWwWnQL0J2UKXOuShxVzeg3UszQ=;
 b=nLxOUTMtQld7edhPgWa+mZtuaquvj13wN8+2k4shuLweNK3nxjJHkzlm48M8BGcP2K5mc1OtLc5KcAoEuDyug4wtgVIivbFgyH/W2VTXb0nZrVrWk4iWqq8MM41XGU27BFgUJ5WuXmY7mIqDsX7rbD+ZSmA9bDPf8DMdH458ZI4=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB4724.jpnprd01.prod.outlook.com (20.179.177.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 04:06:44 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 04:06:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: rcar_gen3_phy_usb2: unbalanced disables for USB20_VBUS0
Thread-Topic: rcar_gen3_phy_usb2: unbalanced disables for USB20_VBUS0
Thread-Index: AQHVGwA/6yZMGZVP4EW1AZzw0OBf96aMbWQg
Date:   Wed, 5 Jun 2019 04:06:44 +0000
Message-ID: <OSAPR01MB30890E4B76F9605F3726C676D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <CAMuHMdUObtKUVDohLT501TarPRC6eDnxBqqB5Tj_Tb+-4fwbkw@mail.gmail.com>
In-Reply-To: <CAMuHMdUObtKUVDohLT501TarPRC6eDnxBqqB5Tj_Tb+-4fwbkw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 928ca3fe-6801-4301-b5af-08d6e96b3903
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB4724;
x-ms-traffictypediagnostic: OSAPR01MB4724:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSAPR01MB47246B1632FCF714AB6CCA4FD8160@OSAPR01MB4724.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(346002)(396003)(366004)(376002)(199004)(189003)(33656002)(74316002)(316002)(8676002)(305945005)(229853002)(6116002)(446003)(486006)(73956011)(66556008)(53936002)(76116006)(76176011)(66476007)(186003)(11346002)(66446008)(64756008)(6436002)(81166006)(66946007)(66066001)(476003)(14454004)(3846002)(966005)(26005)(71190400001)(52536014)(7736002)(2906002)(5660300002)(54906003)(102836004)(6506007)(7696005)(99286004)(25786009)(256004)(81156014)(6306002)(8936002)(71200400001)(9686003)(6916009)(4326008)(478600001)(55016002)(14444005)(6246003)(86362001)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB4724;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WOlcF+FWqtpp+3oZhU8Fmr/lN7NHT0ANSpn2CHjdCmc/+mta+thslkCBvaZ7EOyAv/02lmHiwMWYzShuDBjpcE5I/qe8J4zv2N9JxnLv8KZVs/QEcltpzFRTaUhuUilAQGDP16sorOM+yD49jm8wp2kNCNDoBCjFlm2eDcV9QOVrOVccbWp9fMF66GPdKtM37JrAaJddnhUMt4uEP7FEid/w1Wxbw9kxTCf0ATHHz9ow37UytVbJhOzMmq7CWykz55MKtP16TizrOqrQeNkZNBo9OYB2d/qfk6DbMl8eW0tqy/QUuav0MXyzujnu8p9EObVpT/AIV/PhRemoQi5wDH3UZDRJfZfMEUnuIU4e4YrjyEi5NAYhXdA7C/XggQSaph16elgAIv3ZLgLsrLLPsYaabLNM1N654qiEbdkgLW4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928ca3fe-6801-4301-b5af-08d6e96b3903
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 04:06:44.3562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4724
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJlcG9ydCENCg0K
PiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFdlZG5lc2RheSwgSnVuZSA1LCAyMDE5
IDM6MDYgQU0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4gVXNpbmcgYSB0cmVlIGJhc2Vk
IG9uIHJlbmVzYXMtZHJpdmVycy0yMDE5LTA2LTA0LXY1LjItcmMzLCBJIHN0YXJ0ZWQgc2VlaW5n
DQo+IHRoZSBmb2xsb3dpbmcgd2FybmluZyBkdXJpbmcgYSBzZWNvbmQgc3lzdGVtIHN1c3BlbmQg
KHMyaWRsZSk6DQo8c25pcD4NCj4gU28gZmFyIEkndmUgc2VlbiB0aGlzIG9uIFNhbHZhdG9yLVgg
d2l0aCBSLUNhciBIMyBFUzEuMCBvciBNMy1XLCBhbmQNCj4gb24gU2FsdmF0b3ItWFMgd2l0aCBS
LUNhciBNMy1OLCBidXQgbm90ICh5ZXQ/KSBvbiBIMyBFUzIuMC4NCg0KSSBjb3VsZCByZXByb2R1
Y2UgdGhpcyBpc3N1ZSBvbiBSLUNhciBIMyBFUzMuMCB3aXRoIFN1c3BlbmQtdG8tUkFNLg0KIyBJ
J20gc2lsbHkgYnV0IEkgY291bGQgbm90IHVzZSBzMmlkbGUgdGhhdCBkaWRuJ3Qgd2FrZSB1cCBi
eSByYXZiLg0KIyBodHRwczovL2VsaW51eC5vcmcvUi1DYXIvQm9hcmRzL1NhbHZhdG9yLVgjU3Vz
cGVuZC10by1JZGxlDQoNCj4gVW5mb3J0dW5hdGVseSB0aGUgaXNzdWUgc2VlbXMgdG8gYmUgZmFp
cmx5IHRpbWluZy1zZW5zaXRpdmUsIHNvIEkgZmFpbGVkDQo+IHRvIGJpc2VjdCBpdC4NCj4gDQo+
IEkgaGF2ZSBhZGRlZCBzb21lIGRlYnVnLiAgV2hpbGUgdGhpcyBkaWRuJ3QgaGVscCBtZSBmaW5k
aW5nIHRoZSBjYXVzZQ0KPiBvZiB0aGUgYWJvdmUgd2FybmluZywgaXQgZGlkIGRpc2NvdmVyIGFu
b3RoZXIgaW1iYWxhbmNlOg0KDQpUaGFuayB5b3UgZm9yIHRyeWluZyBpdC4gSSBoYXZlIGludmVz
dGlnYXRlZCB0aGlzIGlzc3VlIGFuZCB0aGVuIEkgZm91bmQgdGhlIHJvb3QgY2F1c2UuDQoNCkFm
dGVyIHRoZSBmb2xsb3dpbmcgcGF0Y2ggd2FzIGFwcGxpZWQsIG11bHRpcGxlIHBoeSBkZXZpY2Vz
IGFyZSBnZW5lcmF0ZWQuDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9nZWVydC9yZW5lc2FzLWRyaXZlcnMuZ2l0L2NvbW1pdC9kcml2ZXJzL3BoeS9yZW5l
c2FzL3BoeS1yY2FyLWdlbjMtdXNiMi5jP2g9cmVuZXNhcy1kcml2ZXJzLTIwMTktMDYtMDQtdjUu
Mi1yYzMmaWQ9NTQ5YjZiNTViMDA1NTgxODNjZWY0YWYyYzJiYjYxZDRmMmZmZTUwOA0KDQpCdXQs
IG9uIHRoZSBwb3dlcl9vbiBmdW5jdGlvbiwgaXQgc2hvdWxkIHNldCB0aGUgInBvd2VyZWQiIGZs
YWcgZm9yIGFueSBvdGhlciBwaHlzIGFueXdheS4NCk90aGVyd2lzZSwgc3VjaCBhIHN0cmFuZ2Ug
aW1iYWxhbmNlIGJlaGF2aW9yIGhhcHBlbmVkLg0KVGhlIHBvd2VyZWQgZmxhZyBpcyBuZWVkZWQg
dG8gYXZvaWQgbXVsdGlwbGUgIlBMTF9SU1QiIHJlZ2lzdGVyIHNldHRpbmcuDQojIEkgdGhpbmsg
cmVndWxhdG9yX3tlbixkaXN9YWJsZSgpIGRvbid0IG5lZWQgc3VjaCBhIGNvbmRpdGlvbiB0aG91
Z2guDQoNCkknbGwgc3VibWl0IGEgYnVnZml4IHBhdGNoIHdpdGggeW91ciBSZXBvcnRlZC1ieSB0
YWcgbGF0ZXIuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
