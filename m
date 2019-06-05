Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD4A35696
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 08:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfFEGGo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 02:06:44 -0400
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:5504
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726086AbfFEGGo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 02:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwFTd46SpNc+rFTVCTUeaHYyBlnGzv8mcXzdNQWi44o=;
 b=fmN2ZVY4fEOefpWC9HPn7r5yssZIBjfDQ/cgTRZuSlMVvv2ZXQHmkje8AZsAEiQRRnJbMhsMSranRMpE9zjvSbY4uHPK1IPKen++WY3QoHSCZjnq+HJVz5FlJhfrRBzytP16mi7O2mT/NYQU6nt1XXPtKWEF6nr46pWonQ28qyU=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB5250.jpnprd01.prod.outlook.com (20.179.179.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 06:06:40 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 06:06:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: renesas_usbhs: remove controlling PWEN/EXTLP
 support
Thread-Topic: [PATCH 2/2] usb: renesas_usbhs: remove controlling PWEN/EXTLP
 support
Thread-Index: AQHVGowDcngDZpKWAUS5vYrz0nzzDKaLNo6AgAFdqQA=
Date:   Wed, 5 Jun 2019 06:06:39 +0000
Message-ID: <OSAPR01MB3089D28B8AEFB8ACBA9864F3D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559621375-5436-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXqYkaAh5ZaNF7GtrCCjd2=GD4PPmrrL5x1pK2H5BkUcg@mail.gmail.com>
In-Reply-To: <CAMuHMdXqYkaAh5ZaNF7GtrCCjd2=GD4PPmrrL5x1pK2H5BkUcg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13294345-177b-4bb0-f8d3-08d6e97bf9d5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB5250;
x-ms-traffictypediagnostic: OSAPR01MB5250:
x-microsoft-antispam-prvs: <OSAPR01MB52507D3E1528575465217758D8160@OSAPR01MB5250.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(376002)(39860400002)(366004)(346002)(189003)(199004)(8676002)(6916009)(478600001)(66066001)(102836004)(68736007)(53936002)(6246003)(7696005)(76116006)(66946007)(33656002)(66446008)(6116002)(81156014)(3846002)(71190400001)(9686003)(99286004)(2906002)(71200400001)(5660300002)(52536014)(86362001)(74316002)(4744005)(66476007)(14454004)(229853002)(446003)(256004)(476003)(73956011)(66556008)(64756008)(486006)(81166006)(4326008)(55016002)(316002)(26005)(54906003)(6436002)(6506007)(8936002)(305945005)(25786009)(186003)(7736002)(53546011)(76176011)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB5250;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YZM4eHnzDDdyfXAKg213hOHQQtVtajNz1gyBPMreedXv37sZzdrXEz7HgS91W2LDtX5xBoXMyxIlSyh3t27IyqYOgYoCHTxPI2QiEIUt+BBxWp5DaqpPfmX32jWIgJkgYm5pybV9LDzIE2IRYeYGddDELJ8MsqdeTULVnyO1/XuUENTKvu9V4cmPiiIFA9lRHLLzwYF/c+ynInypmrWpg5tgV+qgLJOdKJksZWzNCFb/QA2r08luTPmU9PoJP/lW6KCv3tEXoTnLV8zKBxLAzLLc6pZ7tbRg7nsm/8iJv+uUKniJW8UYXn97P41GeAYvfKQE7pjpMYYY2ycbBjbZu0sTQ3A7Dv7BMcJjNQooD2k8sHUsnMM/ejZ4w36DdcTp0U90szo+h1+sbjom6Byz0Og27aL9Us7UcDPuwkDugLI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13294345-177b-4bb0-f8d3-08d6e97bf9d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 06:06:39.9423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5250
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgSnVuZSA0LCAyMDE5IDY6MTQgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4gT24g
VHVlLCBKdW4gNCwgMjAxOSBhdCA2OjE0IEFNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5b3NoaWhp
cm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQ29udHJvbGxpbmcgUFdNRU4v
RVhUTFAgKG5hbWVkIGFzICJoYXNfb3RnIikgd2FzIHN1cHBvcnRlZCBpbiB2My4yLA0KPiA+IGJ1
dCB3YXMgbmV2ZXIgdXNlZCBieSBhbnkgcGxhdGZvcm0uIFNvLCB0aGlzIHBhdGNoIHJlbW92ZSBp
dC4NCj4gDQo+IEFjdHVhbGx5IGl0IHdhcyB1c2VkLCBieSBsZWdhY3kgKHByZS1EVCkgYm9hcmQg
c3VwcG9ydCBmb3Iga3ptOWcgYW5kDQo+IG1hY2tlcmVsLg0KPiBUaGUgbGFzdCB1c2VyIHdhcyBy
ZW1vdmVkIGJ5IGNvbW1pdCAzMGY4OTI1YTU3ZDhhZDQ5ICgiQVJNOiBzaG1vYmlsZToNCj4gUmVt
b3ZlIGxlZ2FjeSBib2FyZCBjb2RlIGZvciBLWk0tQTktR1QiKS4NCg0KVGhhbmsgeW91IGZvciB0
aGUgY29tbWVudC4gSSdsbCByZXZpc2UgdGhlIGNvbW1pdCBsb2cgb24gdjIuDQoNCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyENCg0KQmVzdCByZWdh
cmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMNCg==
