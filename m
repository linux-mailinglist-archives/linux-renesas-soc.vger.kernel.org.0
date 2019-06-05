Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9709F35C51
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 14:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfFEMJO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 08:09:14 -0400
Received: from mail-eopbgr1410127.outbound.protection.outlook.com ([40.107.141.127]:27472
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726305AbfFEMJO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 08:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z04kfF10zxZdWzkt2V/e/SFELaUpasJPu/wRWdJJIpg=;
 b=E3Ss5OAs9rT4c4bYVlkvTATj53uE8Hsh+DTmmAE9G3kmAb0k6YN60hmScyEJ2A+uHnAH3IiOzh9gTIVqzVRIv8NxrcDjmYPO8Fug1sstQMcs8i1MIVyRrysh41PEQvCounhEDTdomULAxh8QAFQ4LFX3jVSkjlhztxzH7UBDMrk=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB1683.jpnprd01.prod.outlook.com (52.134.232.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 12:09:10 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 12:09:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: rcar_gen3_phy_usb2: unbalanced disables for USB20_VBUS0
Thread-Topic: rcar_gen3_phy_usb2: unbalanced disables for USB20_VBUS0
Thread-Index: AQHVGwA/6yZMGZVP4EW1AZzw0OBf96aMbWQggAA2D4CAAFUo0A==
Date:   Wed, 5 Jun 2019 12:09:10 +0000
Message-ID: <OSAPR01MB30895B18E4874231396BFEBED8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <CAMuHMdUObtKUVDohLT501TarPRC6eDnxBqqB5Tj_Tb+-4fwbkw@mail.gmail.com>
 <OSAPR01MB30890E4B76F9605F3726C676D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <CAMuHMdXWsNfj1UYXDyh4ZJ0E2Z0jobug4jJ4uTpUa1X4d+Hocw@mail.gmail.com>
In-Reply-To: <CAMuHMdXWsNfj1UYXDyh4ZJ0E2Z0jobug4jJ4uTpUa1X4d+Hocw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0404256c-d93a-4aaf-c1e7-08d6e9ae9e21
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB1683;
x-ms-traffictypediagnostic: OSAPR01MB1683:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSAPR01MB16831065A7320FFA716DBA71D8160@OSAPR01MB1683.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(376002)(396003)(39860400002)(136003)(189003)(199004)(102836004)(86362001)(53936002)(26005)(74316002)(53546011)(5660300002)(6506007)(66946007)(71200400001)(71190400001)(6916009)(9686003)(52536014)(476003)(66556008)(73956011)(66476007)(64756008)(66446008)(6436002)(305945005)(7736002)(99286004)(486006)(478600001)(76116006)(7696005)(446003)(256004)(14444005)(6306002)(76176011)(966005)(11346002)(55016002)(186003)(68736007)(14454004)(4326008)(3846002)(54906003)(66066001)(6116002)(6246003)(81166006)(81156014)(8676002)(8936002)(229853002)(25786009)(33656002)(2906002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB1683;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7dOCbNDgYqLQacF9KeqSQuLqcFAioDrMplazg9qo0RfFOD4ocHlgyGIkJb6lMC3h2ohcdX1aXiE43jxGLE+w99TZKlxF7JTHIDd97totQvYjJ449+5xl9kTpZL0DxHT2Ttp9UTfpawq5cHZxmAVb3vENZeMKI+/iaDG1MZC57UupkjbA/VxviiY5kQzJWX4LwUQRSjU8JniBRqJF7p0REhzZXrAl8i4GA4oEhN+3ubxBDPsD4xK4/xZ9N3YXjXboTG1a6/Z6vxe9P1+TW3qRbJicVX9Z5HHF710innOQl3ceh0Y2lMVG4j45jVy6UdkE1UmTnVP3//p2CG5kMOuep+WTgpQ+TcWBgBhkoDqvvgRUj5fRbzQYWWNPGvjfyDZ9SYbpEbfNKB/jeQR2sVcZP4ljvEGZ0SQVS/iOL0WDEUI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0404256c-d93a-4aaf-c1e7-08d6e9ae9e21
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 12:09:10.4768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1683
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBKdW5lIDUsIDIwMTkgNDowMyBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0KPiBP
biBXZWQsIEp1biA1LCAyMDE5IGF0IDY6MDYgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hp
aGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5
dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBKdW5lIDUsIDIwMTkgMzowNiBBTQ0KPiA+ID4g
VXNpbmcgYSB0cmVlIGJhc2VkIG9uIHJlbmVzYXMtZHJpdmVycy0yMDE5LTA2LTA0LXY1LjItcmMz
LCBJIHN0YXJ0ZWQgc2VlaW5nDQo+ID4gPiB0aGUgZm9sbG93aW5nIHdhcm5pbmcgZHVyaW5nIGEg
c2Vjb25kIHN5c3RlbSBzdXNwZW5kIChzMmlkbGUpOg0KPiA+IDxzbmlwPg0KPiA+ID4gU28gZmFy
IEkndmUgc2VlbiB0aGlzIG9uIFNhbHZhdG9yLVggd2l0aCBSLUNhciBIMyBFUzEuMCBvciBNMy1X
LCBhbmQNCj4gPiA+IG9uIFNhbHZhdG9yLVhTIHdpdGggUi1DYXIgTTMtTiwgYnV0IG5vdCAoeWV0
Pykgb24gSDMgRVMyLjAuDQo+ID4NCj4gPiBJIGNvdWxkIHJlcHJvZHVjZSB0aGlzIGlzc3VlIG9u
IFItQ2FyIEgzIEVTMy4wIHdpdGggU3VzcGVuZC10by1SQU0uDQo+ID4gIyBJJ20gc2lsbHkgYnV0
IEkgY291bGQgbm90IHVzZSBzMmlkbGUgdGhhdCBkaWRuJ3Qgd2FrZSB1cCBieSByYXZiLg0KPiA+
ICMgaHR0cHM6Ly9lbGludXgub3JnL1ItQ2FyL0JvYXJkcy9TYWx2YXRvci1YI1N1c3BlbmQtdG8t
SWRsZQ0KPiANCj4gV2l0aCBDT05GSUdfUE1fREVCVUc9eSBhbmQgQ09ORklHX1BNX1RFU1RfU1VT
UEVORD15LCB5b3UgY2FuIHVzZQ0KPiANCj4gICAgICBlY2hvIHBsYXRmb3JtID4gL3N5cy9wb3dl
ci9wbV90ZXN0DQo+IA0KPiB0byBjb25maWd1cmUgdGhlIHN5c3RlbSB0byB3YWtlIHVwIGZyb20g
czJpZGxlIGFmdGVyIDUgc2Vjb25kcy4NCj4gVGhpcyBhbGxvd3MgdG8gbG9vcCBzMmlkbGUgd2l0
aG91dCB1c2VyIGludGVydmVudGlvbi4NCg0KVGhhbmsgeW91IGZvciBleHBsYW5hdGlvbiEgSSBj
b3VsZCB1c2UgaXQgb24gbXkgZW52aXJvbm1lbnQuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGly
byBTaGltb2RhDQoNCg==
