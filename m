Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F8219DDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 15:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbfEJNK5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 09:10:57 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:55648
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727465AbfEJNK5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 09:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6tbqA8Lgo5JUP9GeHJ2L6lcjwN5n3yX3WNOWHQrHK4=;
 b=lrjeP5lbtK/kyGZMnNISFRmkUxfp6H2SlnNwNR2bLX9FWCVn9pr0NgSDG7U8ztQY1/B3GtflWjq0MebLSJvi7hqDHiTeQDNvWkjXetCJDe5HFe1hcQBM/WQv/9lE4juysw9y/JY8PKuQ0iUI8M/soaI7ITT0j/OvTwqdb17TNFc=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1545.jpnprd01.prod.outlook.com (52.133.161.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 10 May 2019 13:10:52 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 13:10:52 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Topic: [PATCH v2 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Index: AQHVBqPALgaZA5gQ3UyQXy3OztR526ZjmQYAgAC8dKA=
Date:   Fri, 10 May 2019 13:10:51 +0000
Message-ID: <TY1PR01MB15620169FA7D402A0E33D1528A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
         <20190509201142.10543-12-chris.brandt@renesas.com>
 <1557453204.10179.275.camel@mhfsdcap03>
In-Reply-To: <1557453204.10179.275.camel@mhfsdcap03>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cbef884-87d7-4f1f-e880-08d6d548ed97
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1545;
x-ms-traffictypediagnostic: TY1PR01MB1545:
x-microsoft-antispam-prvs: <TY1PR01MB15453595942542B993157C538A0C0@TY1PR01MB1545.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(376002)(346002)(136003)(366004)(189003)(199004)(102836004)(6506007)(476003)(6246003)(53936002)(4326008)(55016002)(446003)(5660300002)(26005)(11346002)(558084003)(7416002)(66066001)(25786009)(54906003)(486006)(186003)(6436002)(14454004)(2906002)(71190400001)(71200400001)(6916009)(229853002)(6116002)(72206003)(3846002)(478600001)(256004)(9686003)(33656002)(81166006)(81156014)(68736007)(66556008)(305945005)(8936002)(7736002)(66446008)(66946007)(64756008)(76116006)(8676002)(66476007)(73956011)(76176011)(316002)(74316002)(86362001)(52536014)(7696005)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1545;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sACLxXRdxQzpnwrijPJeKfzdtGB7sy6gm8Jbvmyj9/Aoka+tzuWy72IV1NtSncwy7KOFR/7I0t8k0UsOaE+7CNCBRUh7BgHpeOMvgwDuNSJw4McLgpfWKWNkKoRgz0i8UU2+uCJv0GfzIQ9HlVQtmaUCUsv5maHns2ydnFdB1rhWTo9ysam/IXn5H8z29IoY2m5hOMVzBJtjhK4t4cyllzt9gelbwTnfhDs+IYil5wF5F/VRE2Ogf+zKAJTQ+CzHtMHu+NOx51moBOTqRfV8ZB3tKzd1HNKkbhzk2xTe0jBjFVNGaywTrnYp/ybDudKAQd29V2kTT85QAHJiz6fZmZJ4v5filCWfutw6NPxpj+fp5xOZTGr9mQloJOzsJIX2D/poVMzU5xtUSwRcfPbTHyJqU0f22IUEidgtUU/FA4s=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cbef884-87d7-4f1f-e880-08d6d548ed97
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 13:10:51.8970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1545
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gVGh1LCBNYXkgMDksIDIwMTksIENodW5mZW5nIFl1biB3cm90ZToNCj4gPiArCWlmIChJU19F
TkFCTEVEKENPTkZJR19HRU5FUklDX1BIWSkpIHsNCj4gbm8gbmVlZCBjaGVjayBpdCwgaWYgaXQn
cyBub3QgZW5hYmxlZCwgcGh5X2dldCgpIHdpbGwgcmV0dXJuIGFuIGVycm9yDQo+IG51bWJlci4N
Cg0KR29vZCBwb2ludC4NClRoYW5rIHlvdS4NCg0KQ2hyaXMNCg==
