Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E973F35C5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 14:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbfFEMML (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 08:12:11 -0400
Received: from mail-eopbgr1410123.outbound.protection.outlook.com ([40.107.141.123]:5024
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727343AbfFEMML (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 08:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0n5lmzdb+ILPEV62bCBwyWy9NnxFf3sF89ZpPDV5zU=;
 b=ATatBIiBLhOZ7l4GzuIijkyFdt+1fPG/TBdQrxrPMNro2hjuaDkXL9y+OOyyYu+LMQ55FA55CmX7BNgagIqe3Z/g8SjWFXONeyZy5nIfr7+ke0FVAtv40QLsAiTyrN8LXdlPphvFCbPYrMI9A8d2nmGoFwb4ZGM56sYSFp6AWsQ=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB1683.jpnprd01.prod.outlook.com (52.134.232.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 12:12:08 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 12:12:08 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: rcar-gen3-usb2: fix imbalance powered flag
Thread-Topic: [PATCH] phy: renesas: rcar-gen3-usb2: fix imbalance powered flag
Thread-Index: AQHVG1qxx9ucB2mLPUSYOHggZ3+zpqaMymmAgAAt5MA=
Date:   Wed, 5 Jun 2019 12:12:07 +0000
Message-ID: <OSAPR01MB30897161EF40942B1E561232D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559710142-29161-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUqajM2yR72AYE5ppp-RJumfoG2+YArEzLiJvt55_1k4g@mail.gmail.com>
In-Reply-To: <CAMuHMdUqajM2yR72AYE5ppp-RJumfoG2+YArEzLiJvt55_1k4g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df842f99-7a47-4de6-616a-08d6e9af07f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB1683;
x-ms-traffictypediagnostic: OSAPR01MB1683:
x-microsoft-antispam-prvs: <OSAPR01MB1683B170B5E945A57142EBC5D8160@OSAPR01MB1683.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(376002)(396003)(39860400002)(136003)(189003)(199004)(102836004)(86362001)(53936002)(26005)(74316002)(5660300002)(6506007)(66946007)(71200400001)(71190400001)(6916009)(9686003)(52536014)(476003)(66556008)(73956011)(66476007)(64756008)(66446008)(6436002)(305945005)(7736002)(99286004)(486006)(478600001)(76116006)(7696005)(446003)(256004)(14444005)(76176011)(11346002)(55016002)(186003)(68736007)(14454004)(4326008)(4744005)(3846002)(54906003)(66066001)(6116002)(6246003)(81166006)(81156014)(8676002)(8936002)(229853002)(25786009)(33656002)(2906002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB1683;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LsjFjOahFp796PF8TsgMhAyBu9zp5Ff/ZBEEWKN5qjEfISXFqKgQ1gBY/KHHHGk7Q7XEmimvq414OQKESNUBf7RDYtawZaV3xtsV18DPU/an7a1gn+qKEl5XecREDGI/ZJNxp/aA+hXGVTxQ4XieupZiLoIXIcyNs42EPZMFGbmWkz0+kOqFdKG7261vkFtk0LiYzBr1ieZ0IPsylAARrUw36Q4d+06dNoXPqTYYKCkCcjnAIHnJn6fzsrNNC1mnBLqIBzI2E26NCJGtU53GYSTVg2ceYtIaTBWlCldw90TyMZmVKzKI+IiwTjATXoUl7zIFIMmiRXRvtAc7AbGeG1IQAA67ckkWGZgsJ5Tib9YrmW+nj6DbAuG8pcYudu/uK0lJoo8i6NsiNQeqFvYUaGpz+rzKXg2bsMtHhio+PpI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df842f99-7a47-4de6-616a-08d6e9af07f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 12:12:07.9942
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
ZGF5LCBKdW5lIDUsIDIwMTkgNjoyNSBQTQ0KPHNuaXA+DQo+IFRoYW5rIHlvdSwgdGhpcyBzZWVt
cyB0byBmaXggdGhlIHdhcm5pbmcsIHNvDQo+IFRlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCg0KVGhhbmsgeW91IGZvciB0aGUgdGVzdGluZyEN
Cg0KPiBIb3dldmVyLCB0aGUgb3RoZXIgaW1iYWxhbmNlIChwaHktZWUwODAyMDAudXNiLXBoeS42
IGVuYWJsaW5nIGl0cw0KPiByZWd1bGF0b3IgZHVyaW5nIGVhY2ggc3lzdGVtIHJlc3VtZSBwaGFz
ZSwgYnV0IG5ldmVyIHRvdWNoaW5nIGl0DQo+IG90aGVyd2lzZSkgaXMgc3RpbGwgcHJlc2VudC4N
Cg0KVW1tLCBzaW5jZSBJJ2QgbGlrZSB0byBpbnZlc3RpZ2F0ZSB0aGlzLA0Kd291bGQgeW91IHNo
YXJlIHlvdXIgZGVidWcgcHJpbnQgcGF0Y2g/DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBT
aGltb2RhDQoNCg==
