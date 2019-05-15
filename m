Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86F3D1F6FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 16:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfEOOyR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 10:54:17 -0400
Received: from mail-eopbgr1410118.outbound.protection.outlook.com ([40.107.141.118]:9440
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726392AbfEOOyQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 10:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BFrdef01VgfyTVRQ/GchLoLBjcJ14VYKb4K+NzL1wQ=;
 b=E5juylMqUPNBNRyWfCZTmrJMiKv+XQW+KQGEO2Nle4vLzAI508AisZmn+kced1afrFqFrVc7jxIWWFtER04/8YRjgdErxIZGchEjM6G54XqjzHVNd4UIHqoBHnPuq8lRmB+ki4qDd2e4bvnqy/VnHRviZZ5KCkAJaxJpxdDSwF4=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1677.jpnprd01.prod.outlook.com (52.133.167.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 14:54:12 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045%7]) with mapi id 15.20.1900.010; Wed, 15 May 2019
 14:54:12 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 15/15] ARM: dts: rza2mevb: Add USB host support
Thread-Topic: [PATCH v3 15/15] ARM: dts: rza2mevb: Add USB host support
Thread-Index: AQHVCmWCnsI2dzmQpU69erLMQyE+h6Zr2ZoAgABbaPCAAAxngIAAAQwA
Date:   Wed, 15 May 2019 14:54:11 +0000
Message-ID: <TYXPR01MB15684FF367D694BD5C203BB68A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-16-chris.brandt@renesas.com>
 <CAMuHMdXx=7v5v3tHwS-01eNnzz6NSfs=M02jU1tNJMdcRbGScg@mail.gmail.com>
 <TYXPR01MB15689E3664801057DFCA09EA8A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAMuHMdWLB-JE=2f=Mq9np_b5Wuj6=nB2ywWquBFheoBVxPaAfQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWLB-JE=2f=Mq9np_b5Wuj6=nB2ywWquBFheoBVxPaAfQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d47543ef-b632-4291-b6d9-08d6d9453133
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYXPR01MB1677;
x-ms-traffictypediagnostic: TYXPR01MB1677:
x-microsoft-antispam-prvs: <TYXPR01MB1677529A852BAF100E4F97008A090@TYXPR01MB1677.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(376002)(366004)(39860400002)(136003)(199004)(189003)(85664002)(66446008)(64756008)(66476007)(66556008)(6116002)(316002)(55016002)(7736002)(305945005)(4326008)(74316002)(3846002)(8936002)(81166006)(7416002)(8676002)(81156014)(14454004)(68736007)(478600001)(2906002)(86362001)(72206003)(66066001)(9686003)(53936002)(6436002)(6246003)(5024004)(14444005)(256004)(7696005)(476003)(446003)(11346002)(52536014)(229853002)(54906003)(6916009)(186003)(102836004)(6506007)(26005)(33656002)(73956011)(66946007)(76116006)(25786009)(71190400001)(71200400001)(5660300002)(76176011)(486006)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1677;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2vNMjUDVzvhqX9gm1CW428vBodV/SmSDczE9dSDZdW2Y6kRn0cfHyJQ1mz9oqQPrTocljX+fKtk33nJzA6ephnS3bghsn1P2QNJx2FXhzXY63CNQruLVtyylrRdgfTK38j5660No/NfLQPTHPwh8ZrEhhVOmEF9q/Yo/tBMhxyoiyMyvLYI5OPxLL47C7FkW+pdb66L5r+wWRXeEm5urkK/BvrlHJzkaj5ropiaqXMQdX/0O1j0Gkwdf0dLTHMEuU9M0wkpjav5qrL7pqGNrP8Au+opQFssVU51crO7zRKuNBY6lLhvAQtQoJ42vGrzmk6mi1WFR2Q4/v5z3QmUFcyVOzChBlqM9V8QzUqrvjMK7ezv94ubU3dyWekAhlTiHOqMNuTSaQDiy9Swg9C2dyZolU3jYdg3ZS6vnQEMo2h8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47543ef-b632-4291-b6d9-08d6d9453133
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 14:54:11.9038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1677
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFdlZCwgTWF5IDE1LCAyMDE5IDEsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4gPiA+IERvZXMgcmVzaXN0b3IgUjc4IG5lZWQgdG8gYmUgbW91bnRlZCwgdG9vPw0K
PiA+DQo+ID4gQnkgZGVmYXVsdCwgUjc4IGFuZCBSNzkgYXJlIG5vdCBwb3B1bGF0ZWQgb24gdGhl
c2UgYm9hcmRzLCBhbmQgYm90aCBIb3N0DQo+ID4gYW5kIEZ1bmN0aW9uIHdvcmsgZmluZSB3aXRo
b3V0IGJvYXJkIG1vZGlmaWNhdGlvbiwgc28gSSB3b3VsZCBzYXkNCj4gPiBwb3B1bGF0aW5nIFI3
OCBpcyBub3QgYSByZXF1aXJlbWVudCBhcyBmYXIgYXMgSSBjYW4gdGVsbC4NCj4gDQo+IEkgYXNr
ZWQgYmVjYXVzZSBhZnRlciByZWFkaW5nIFNlY3Rpb24gMi40IFVTQiBJbnRlcmZhY2UgaW4gdGhl
IFJaL0EyTSBDUFUNCj4gQm9hcmQgIFVzZXIncyBNYW51YWwsIGl0J3Mgbm90IGNsZWFyIHRvIG1l
IHdoZW4gb25lIG5lZWRzIHRvDQo+IHBvcHVsYXRlIG9uZSBvZiB0aGVzZSByZXNpc3RvcnMuIEVz
cGVjaWFsbHkgaW4gcmVsYXRpb24gdG8gSlAzLCB3aGljaA0KPiB0YWxrcyBhYm91dCAyIHBvc3Np
YmxlIG1vZGVzIChob3N0IHZzLiBmdW5jdGlvbiksIHdoaWxlIHRoZSByZXNpc3Rvcg0KPiBwYXJh
Z3JhcGggdGFsa3MgYWJvdXQgMyBwb3NzaWJsZSBtb2RlcyAoZHVhbC1yb2xlIHZzLiBob3N0IHZz
Lg0KPiBmdW5jdGlvbikuDQoNCkhvbmVzdGx5LCBJJ20gbm90IHN1cmUgd2hhdCB0aGV5IHdlcmUg
dGhpbmtpbmcuDQpUaGV5IHB1dCBvbiBhIFVTQi1DIGNvbm5lY3RvciwgYW5kIHB1dCBvbiBjaXJj
dWl0cnkgdG8gZGV0ZWN0IGlmIGEgSG9zdCANCm9yIGRldmljZSB3YXMgYXR0YWNoZWQuLi4uYnV0
IHRoZW4gcHV0IGEgcGh5c2ljYWwganVtcGVyIG9uIHRoZSBib2FyZCB0bw0KY29ubmVjdC9kaXNj
b25uZWN0IFZCVVMgcG93ZXIuDQoNCg0KPiBQZXJoYXBzIEkganVzdCBuZWVkIHRvIGRyaW5rIG1v
cmUgVVNCIEtvb2wtQWlkPw0KPiAobm8gS29vbC1BaWQgc29sZCBpbiBsb2NhbCBzaG9wcywgdGhv
dWdoOyB3ZSBsaXZlIG9uIENva2UgOy0pDQoNCk1heWJlIG5vdCBLb29sLUFpZCBhcyBpdCBzZWVt
IHRoZXkgd2VyZSAnc21va2luZyBzb21ldGhpbmcnIGluc3RlYWQuIDpvDQoNCg0KQ2hyaXMNCg==
