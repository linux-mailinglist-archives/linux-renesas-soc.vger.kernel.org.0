Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4916319962
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 10:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfEJIQG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 04:16:06 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:57216
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727003AbfEJIQG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 04:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9v+qU4uitj7zj7k7p06clXXft/UVyNvRI+qZnkudmI=;
 b=f+hFn5vhFmdIEnVrMN0W0YJ79gpskRTuI/gmmUaykI3lDvWWRJJfJwgJJT2ZnnLI5nmVi3P71Ji5Lg/YPs5TUcAEMjdRwxZM31LoWBsKavAYq7WRjsZWXvMn7EJNdJtyPsJiz04qkeK8hkazfmbds81YGZXjniu3wt553HatdFE=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2406.jpnprd01.prod.outlook.com (52.134.253.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 08:16:01 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 08:16:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Topic: [PATCH v2 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Index: AQHVBqPAmD3IBsdkTkW6RcwYeB06RKZj8K2AgAASkhA=
Date:   Fri, 10 May 2019 08:16:00 +0000
Message-ID: <OSBPR01MB3174FA32BADD2B97A6003ADCD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-12-chris.brandt@renesas.com>
 <CAMuHMdV7aQd-g1t_t27d8ge69e3VZnG7nQ7Lzre=qrJ1UrUuuA@mail.gmail.com>
In-Reply-To: <CAMuHMdV7aQd-g1t_t27d8ge69e3VZnG7nQ7Lzre=qrJ1UrUuuA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f24738f5-4c6a-486b-b14e-08d6d51fbd05
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2406;
x-ms-traffictypediagnostic: OSBPR01MB2406:
x-microsoft-antispam-prvs: <OSBPR01MB24062FD8BF014C4B8D915690D80C0@OSBPR01MB2406.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(39860400002)(376002)(366004)(189003)(199004)(4744005)(54906003)(229853002)(110136005)(9686003)(76176011)(478600001)(7696005)(55016002)(6636002)(8936002)(486006)(6436002)(6506007)(14454004)(53546011)(4326008)(102836004)(33656002)(25786009)(52536014)(66476007)(66556008)(64756008)(66446008)(476003)(186003)(2906002)(26005)(66946007)(73956011)(316002)(81166006)(11346002)(66066001)(81156014)(68736007)(8676002)(6246003)(446003)(71200400001)(5660300002)(71190400001)(6116002)(99286004)(256004)(86362001)(7736002)(305945005)(53936002)(3846002)(74316002)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2406;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VejQ3gAbL4O6UJ5YkOCUGeZ2Q2dhfOT5gVrwQkv5c5fG96gHUaGpCPgbsrusU5kbNXLBkeLqdTXxJ8vioPENDS/yM6c3d5K2YEU6g94hKPj9zSNHO+S3UU7xYnZLbZaj/d/wcTvjBp0ppEqUr9ST1ywGGhcGEze8FS6VM+8sF3KIiSunJQeiIcr8zooHxbfHSa+EqCz+QxMbEZ6Fv36HXBVMEf324p/BpjrjYdk+Lhv0mvvigG5pzZtwJgHAj3RQ5qVCxzyPc3/BleDf8sE0ynCyLJR1Mch4beO5NgUnZ2sIPY9NpCW44HtL3jpedGnQZqB0ZxvSeFBB65k6ngkIKyJveawdfo0W29JYr/ri/dEGSw10ag62IuhXVGwITPuNbpvKRNZzbXaCWPgsTIOFn+ncS2iaIsApMWLVE+i1YRA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f24738f5-4c6a-486b-b14e-08d6d51fbd05
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 08:16:00.9374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2406
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBNYXkgMTAsIDIwMTkgNDowNyBQTQ0KPiANCj4gSGkgQ2hyaXMsDQo+IA0KPiBPbiBUaHUsIE1h
eSA5LCAyMDE5IGF0IDEwOjE0IFBNIENocmlzIEJyYW5kdCA8Y2hyaXMuYnJhbmR0QHJlbmVzYXMu
Y29tPiB3cm90ZToNCjxzbmlwPg0KPiBCVFcsIHRoaXMgZHJpdmVyIHVzZXMgYSBtaXggb2YgZmVh
dHVyZSBjaGVja2luZyB1c2luZyBVU0JIU19UWVBFXyoNCj4gZW51bXMsIGFuZCBhIHBhcmFtZXRl
ciBibG9jay9jYWxsYmFjayBzdHJ1Y3QNCj4gKHJlbmVzYXNfdXNiaHNfcGxhdGZvcm1fY2FsbGJh
Y2spLiAgUGVyaGFwcyB0aGUgZmVhdHVyZSBmbGFncyBjYW4ganVzdA0KPiBiZSBtb3ZlZCB0byB0
aGUgc3RydWN0LCBhbmQgdGhlIHZhcmlvdXMgc3RydWN0cyByZWZlcmVuY2VkIGZyb20NCj4gb2Zf
ZGV2aWNlX2lkLmRhdGE/DQoNClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50ISBJIHRoaW5rIHNv
LiBTbywgSSdsbCBtYWtlIHN1Y2ggYSBwYXRjaCBsYXRlci4NCg0KQmVzdCByZWdhcmRzLA0KWW9z
aGloaXJvIFNoaW1vZGENCg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+
IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
