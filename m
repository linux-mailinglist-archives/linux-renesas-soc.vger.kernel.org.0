Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA3E16303
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 13:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfEGLpI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 07:45:08 -0400
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:45664
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725859AbfEGLpI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 07:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKqeSS0GluXOv71G3LAm6YEFWzUueL6NboLE9ADue84=;
 b=L0HNKINqh+HfsIDPftcgVwuXaBokJDW3ZflSA2hiAYrM9/BjCXKq1J1bTUHhlnwgRx9egOrMp6AAKmCWumOK3inUNKwK6/YGaoLWXPoCGtWWzL4MVfWitLErYO9YvDuT5OeAsFU5Npufszb+qbeyiNaYS346b9jVxLtfSh7M9zI=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1577.jpnprd01.prod.outlook.com (52.133.162.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 11:45:04 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 11:45:04 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
Thread-Topic: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
Thread-Index: AQHVBGYbvpIQ5ioroEGpDalH9Ovnd6ZfhsEAgAAEBrA=
Date:   Tue, 7 May 2019 11:45:04 +0000
Message-ID: <TY1PR01MB1562550164C7977D28C90F128A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
 <17bcc673-5fed-ce4f-3d61-af34bfa5d769@cogentembedded.com>
In-Reply-To: <17bcc673-5fed-ce4f-3d61-af34bfa5d769@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 496594e5-7082-4b6b-55b5-08d6d2e17258
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1577;
x-ms-traffictypediagnostic: TY1PR01MB1577:
x-microsoft-antispam-prvs: <TY1PR01MB1577035F7D1D9E577531B35C8A310@TY1PR01MB1577.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(136003)(396003)(376002)(39860400002)(199004)(189003)(256004)(4744005)(86362001)(186003)(6506007)(73956011)(66446008)(7736002)(6116002)(64756008)(66946007)(66556008)(66476007)(14454004)(76116006)(99286004)(55016002)(476003)(71190400001)(26005)(76176011)(7696005)(446003)(102836004)(71200400001)(11346002)(66066001)(9686003)(486006)(72206003)(25786009)(33656002)(6246003)(54906003)(110136005)(6436002)(478600001)(68736007)(2906002)(4326008)(316002)(74316002)(229853002)(305945005)(3846002)(53936002)(81156014)(81166006)(8936002)(52536014)(8676002)(6636002)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1577;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WgF3bYDr3rSQUvVUJ2hqGVvD5dBeEGUrdvgrcD+HYdSyHXn4t8VNNZGZMLQkIvlNuBtwBibEkPkkqyadDgxtt00Rqh6lDrPadorj5QiEvdUJPN/KxT/y5je0NuU+4fNsBYS0GSoqzviUbOw597u0NN5mFyhWfEyKkap5tmgG9TrqyHfFiWHWWFPFevRWDA+1bRBuQeDy6tYyJ8G3bhMopTry2fPYadhf0d5Y3IPbm3VvTFyTIvjpqum01FUpnVVRMxI6MWsxFvOsM+oqIRAZoE2AJiBzplPZ/7Bw804sga0JJqP6akqHhafLPN/Rsz81buemW5TGqc2gF6ynXd7JAgBouIUm4k3JbEqV5DVnuAa0/AKrYOL5RK7Pvvl5OTGOaQpuvHMytVIv6CcsSxbPZa24DU9LBGhvl/GEd0LYAq8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496594e5-7082-4b6b-55b5-08d6d2e17258
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 11:45:04.4087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1577
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gVHVlLCBNYXkgMDcsIDIwMTksIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToNCj4gPiAtLS0gYS9k
cml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdlbjMtdXNiMi5jDQo+ID4gKysrIGIvZHJpdmVy
cy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYw0KPiA+IEBAIC00MDgsNyArNDA4LDEy
IEBAIHN0YXRpYyBpbnQgcmNhcl9nZW4zX3BoeV91c2IyX2luaXQoc3RydWN0IHBoeSAqcCkNCj4g
PiAgCQlpZiAocmNhcl9nZW4zX25lZWRzX2luaXRfb3RnKGNoYW5uZWwpKQ0KPiA+ICAJCQlyY2Fy
X2dlbjNfaW5pdF9vdGcoY2hhbm5lbCk7DQo+ID4gIAkJcnBoeS0+b3RnX2luaXRpYWxpemVkID0g
dHJ1ZTsNCj4gPiAtCX0NCj4gPiArCX0gZWxzZQ0KPiANCj4gICAgV2FpdCwgZG9uJ3Qgd2UgbmVl
ZWQge30gaGVyZT8NCj4gDQo+ID4gKwkJLyogTm90IE9URywgc28gZHJfbW9kZSBzaG91bGQgYmUg
c2V0IGluIFBIWSBub2RlICovDQo+ID4gKwkJaWYgKHVzYl9nZXRfZHJfbW9kZShjaGFubmVsLT5k
ZXYpID09IFVTQl9EUl9NT0RFX1BFUklQSEVSQUwpDQo+ID4gKwkJCXdyaXRlbCgweDgwMDAwMDAw
LCB1c2IyX2Jhc2UgKyBVU0IyX0NPTU1DVFJMKTsNCj4gPiArCQllbHNlDQo+ID4gKwkJCXdyaXRl
bCgweDAwMDAwMDAwLCB1c2IyX2Jhc2UgKyBVU0IyX0NPTU1DVFJMKTsNCg0KVGVjaG5pY2FsbHkg
dGhlcmUgaXMgb25seSAxIHN0YXRlbWVudCBhZnRlciB0aGUgZWxzZSAodGhlICdpZicgd2hpY2gg
DQp3aWxsIGFsc28gaW5jbHVkZSB0aGUgJ2Vsc2UnKSBzdGF0ZW1lbnQuIFRoZSBjb2RpbmcgcnVs
ZXMgc2F5IG5vdCB0byB1c2UNCnsgfSBpZiB0aGVyZSBpcyBvbmx5IDEgc3RhdGVtZW50Lg0KDQoN
CkNocmlzDQo=
