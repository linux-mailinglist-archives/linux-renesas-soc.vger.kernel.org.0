Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F52819EA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 16:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfEJOBB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 10:01:01 -0400
Received: from mail-eopbgr1410120.outbound.protection.outlook.com ([40.107.141.120]:61360
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727521AbfEJOBB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 10:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAlPZxg7mCUWWg1Ih1GqjcIvgwcYZC7y/rEBr8c8Hs0=;
 b=nq5yeInHd2e8KW+CaQy+2KfzhwqQ2gJa4dlbgkujCfLgI0b903Gvx8S2rGd8HZRlD5xVSp++KcUm+riOj3xdCyEtPPkK4h9i6iiyNc3gao5slhBJnjC9rfxMjcUqCKDGpxbsnZikw28fzpmwdB1FELwxHcVGsBJUZXs1vQIhmI4=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 10 May 2019 14:00:55 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 14:00:55 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 08/15] usb: renesas_usbhs: move flags macros
Thread-Topic: [PATCH v2 08/15] usb: renesas_usbhs: move flags macros
Thread-Index: AQHVBqOvDXw3Q+SxjUSuWVNuzWBgUaZkCxUAgABYyDA=
Date:   Fri, 10 May 2019 14:00:55 +0000
Message-ID: <TY1PR01MB156247F77F157DDB495A41EB8A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-9-chris.brandt@renesas.com>
 <c57f8a55-ef94-5b28-9345-88805de52ed1@cogentembedded.com>
In-Reply-To: <c57f8a55-ef94-5b28-9345-88805de52ed1@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1b7f757-f32f-44e6-e3f3-08d6d54fec08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1770;
x-ms-traffictypediagnostic: TY1PR01MB1770:
x-microsoft-antispam-prvs: <TY1PR01MB1770FD80C9D60010864B26458A0C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39860400002)(346002)(136003)(376002)(189003)(199004)(86362001)(74316002)(52536014)(76116006)(2906002)(76176011)(66946007)(8936002)(66556008)(73956011)(66476007)(66446008)(5660300002)(99286004)(64756008)(71200400001)(71190400001)(256004)(305945005)(6636002)(9686003)(7736002)(68736007)(53936002)(6246003)(446003)(11346002)(476003)(33656002)(486006)(229853002)(26005)(8676002)(6116002)(6506007)(186003)(4744005)(81156014)(81166006)(14454004)(102836004)(4326008)(66066001)(3846002)(7696005)(316002)(54906003)(478600001)(110136005)(6436002)(55016002)(72206003)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1770;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 06YpGCys0Escrka4roq0qYYpT+7bCNmFJPa5HgeSlfvuArq/Wjph3gkaOMnFLWGfsvH/N8W0SA4Hlg/cf6i5DQLYyGqkwbKFuK4p/Vml7A/++zpDrP7Zqq8z/899Kdxgpb83xrahrUdODaMXcHgI9Le7iswMNJ30oJyDOORCmumO/z59uyXz9H1QpdaOyDwiMKcSFvM2ztSwHCUTzMiAzRY/CQeA4TLbCsI/6WG9t1uETRsYjJ+1yHn3+RisLDhRe/yKuQut4sXFkfQCzxIidenaoXwFiVovtxotM0/GZHphiKnHEkYdu9RFExV3WcnQgoM6hLX9QedR7RPBEe2IG0sxykCKu9mACeFh1LjMyjv1vnwSpynFqMXZ6JvlP22ZBGwQQkH7XuPF+Knx0i7G+sTZ8s9CMFePE9O0CN1iyxk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b7f757-f32f-44e6-e3f3-08d6d54fec08
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 14:00:55.6200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1770
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gRnJpLCBNYXkgMTAsIDIwMTksIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToNCj4gPiAtI2RlZmlu
ZSBVU0JIU0ZfUlVOVElNRV9QV0NUUkwJKDEgPDwgMCkNCj4gPiAtDQo+ID4gLS8qIHN0YXR1cyAq
Lw0KPiA+IC0jZGVmaW5lIHVzYmhzY19mbGFnc19pbml0KHApICAgZG8geyhwKS0+ZmxhZ3MgPSAw
OyB9IHdoaWxlICgwKQ0KPiA+IC0jZGVmaW5lIHVzYmhzY19mbGFnc19zZXQocCwgYikgKChwKS0+
ZmxhZ3MgfD0gIChiKSkNCj4gPiAtI2RlZmluZSB1c2Joc2NfZmxhZ3NfY2xyKHAsIGIpICgocCkt
PmZsYWdzICY9IH4oYikpDQo+ID4gLSNkZWZpbmUgdXNiaHNjX2ZsYWdzX2hhcyhwLCBiKSAoKHAp
LT5mbGFncyAmICAgKGIpKQ0KPiA+DQo+IA0KPiAgICAgV2h5IGxlYXZlIDMgZW1wdHkgbGluZXM/
DQoNCk9LLCBJJ2xsIGdldCByaWQgb2YgMiBvZiB0aGVtLg0KDQpDaHJpcw0K
