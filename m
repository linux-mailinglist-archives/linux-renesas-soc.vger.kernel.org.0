Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5871F5B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 15:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfEONiv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 09:38:51 -0400
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:32169
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726635AbfEONiv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 09:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arqU6Lvr5Sf26j9WAvt51gRgxm6iQ07EzJ2VtoyC/wU=;
 b=gzXE6cCDY4X7cKH/qyJGoO32qdZ62Ulfx/WG1IwwhWxW3YyzQo1iSpdNGLKUOvKpc78OgY0CyOF1nrdgV21xVudmUOtIvf68F8L6RZoFYn8ebfNE1XPt80P7jLuV62D+TtTTR2UUfgaDYk7D++7ApjU3+sISHpN0OGfwCSAWVJA=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1485.jpnprd01.prod.outlook.com (52.133.165.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 13:38:46 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045%7]) with mapi id 15.20.1900.010; Wed, 15 May 2019
 13:38:46 +0000
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
Subject: RE: [PATCH v3 13/15] ARM: dts: r7s9210: Add USB Host support
Thread-Topic: [PATCH v3 13/15] ARM: dts: r7s9210: Add USB Host support
Thread-Index: AQHVCmV5GV5gsTt0ME28rd2ixcAosqZr02QAgABcqCA=
Date:   Wed, 15 May 2019 13:38:46 +0000
Message-ID: <TYXPR01MB1568E1D79AFDB6FF4F5329568A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-14-chris.brandt@renesas.com>
 <CAMuHMdUU3EBFXHpvw8y_yYf3L1qNNH6HJw+RHP_ioSFwJcd3Vg@mail.gmail.com>
In-Reply-To: <CAMuHMdUU3EBFXHpvw8y_yYf3L1qNNH6HJw+RHP_ioSFwJcd3Vg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bfea68c-3133-4fdf-1405-08d6d93aa7b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYXPR01MB1485;
x-ms-traffictypediagnostic: TYXPR01MB1485:
x-microsoft-antispam-prvs: <TYXPR01MB14858D5C930DD82BB6185D968A090@TYXPR01MB1485.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(346002)(376002)(366004)(136003)(189003)(199004)(8936002)(316002)(8676002)(81166006)(81156014)(68736007)(4326008)(25786009)(86362001)(52536014)(446003)(11346002)(476003)(55016002)(9686003)(478600001)(2906002)(486006)(14454004)(3846002)(66066001)(6116002)(256004)(72206003)(5660300002)(26005)(71200400001)(54906003)(71190400001)(186003)(229853002)(305945005)(7736002)(6506007)(76176011)(7696005)(102836004)(7416002)(6246003)(99286004)(66946007)(76116006)(73956011)(66476007)(66556008)(64756008)(33656002)(66446008)(53936002)(558084003)(74316002)(6436002)(6916009);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1485;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dTW7m6QCxsp/HUUwxQTgdeUu3E4PRB3f+qYQw+EdiHfr2o/mpc75AObdJ+yzxYWYyJBK02sxYtdd/BxVYeGYvZIsjpVq1VZUKy1TPVoLR2kaP3KcgTWFlCRwhekyYBH+hFKLQ8f6tb1sstxmpdfQ4JHuegeozKiKJtQP9+lfaYSbdozBexoawGVkADmQjwPmQ3V4lSIHmQKrkTCr+vLgP7T5xqxkQpSZQZiCPPyOjPwLkTr7mOlhHaRFHy3KCt6u2mIGUpIS9qk1IwM6kt/GokfqptLjJpYK3Ym6bpmBeL8Rd+6iZzARcoiDqzhDCvmM7AoI6pHtOXhx2OCAyctDMSmsPRFAIYZ53J2dgA8DFkqlnI/MDOIS83AGpDyJIHLLS9lOhKSt6+OzGHBo/Vc8g8/v6lAOKfK2yPMegeMbtOM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfea68c-3133-4fdf-1405-08d6d93aa7b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 13:38:46.3813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1485
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFdlZCwgTWF5IDE1LCAyMDE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHhlODIxODIwMCAweDEw
PjsNCj4gDQo+IFdoYXQgYWJvdXQgdGhlIG90aGVyIHJlZ2lzdGVycz8NCj4gT24gUi1DYXIgR2Vu
Mywgc2l6ZSBpcyAweDcwMC4NCj4gU2FtZSBmb3IgdXNiMl9waHkxLg0KDQpBaGhoLCBnb29kIGNh
dGNoLg0KDQpDaHJpcw0KDQo=
