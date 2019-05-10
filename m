Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6FBD19DFC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 15:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbfEJNRq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 09:17:46 -0400
Received: from mail-eopbgr1400120.outbound.protection.outlook.com ([40.107.140.120]:51815
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727446AbfEJNRq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 09:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJKfg6EBhHtdnhnPW5GpqDCU3D0l2L87obgGQL6dcVE=;
 b=XMKw2g23EVDqVUGuDoOqEKJWa+y/f9VFOPgN5WnZUmXv4wxLDGTjlF8WENd7/H1uhI2g+ZrhezSskkpUXBLva5xOKS64bfYgtzz2IJy/DlFIwEu1/1llpzL1cJTAVwIHnNxzhVqgxm6VE9stCgNKHBVNrZ2kXHd4OTbSZKJz56s=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1498.jpnprd01.prod.outlook.com (52.133.161.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 10 May 2019 13:17:43 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 13:17:43 +0000
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
Subject: RE: [PATCH v2 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1
 clock
Thread-Topic: [PATCH v2 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1
 clock
Thread-Index: AQHVBqOSuXhbAXzGc0O5ptRUADQCsaZjmg8AgAC9qvA=
Date:   Fri, 10 May 2019 13:17:42 +0000
Message-ID: <TY1PR01MB1562B69695378551F93D71BF8A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
         <20190509201142.10543-4-chris.brandt@renesas.com>
 <1557453426.10179.278.camel@mhfsdcap03>
In-Reply-To: <1557453426.10179.278.camel@mhfsdcap03>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a018f1a6-43e8-4831-9bfe-08d6d549e2b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1498;
x-ms-traffictypediagnostic: TY1PR01MB1498:
x-microsoft-antispam-prvs: <TY1PR01MB149866DC0C44136C0BAC5BEC8A0C0@TY1PR01MB1498.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(366004)(39860400002)(396003)(346002)(199004)(189003)(66446008)(66476007)(64756008)(66556008)(6246003)(73956011)(66946007)(53936002)(52536014)(76116006)(256004)(558084003)(102836004)(6916009)(186003)(11346002)(446003)(476003)(486006)(6506007)(229853002)(54906003)(86362001)(26005)(316002)(5660300002)(8936002)(3846002)(6116002)(2906002)(25786009)(81156014)(81166006)(4326008)(7416002)(7696005)(305945005)(7736002)(6436002)(76176011)(71190400001)(71200400001)(55016002)(68736007)(9686003)(99286004)(478600001)(72206003)(8676002)(14454004)(66066001)(74316002)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1498;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z5JMh8fXxruQAVSRyKkH01D19OQWlU5xrNsvIKIM8tYopv5Meym9O7CH4hM1lLP32zIZs8JekaplSWp0NJwN4kfipRdnhnyV+OJMTFr3R1ojMbKaFXyyZtadN2j2SSnZmLhiZjoZVIBgQ8GJTCCVxZ3QJirz7zsmzVJzyx14nI26ihrZjiz6baxm+kKE7fqoVH4litRp50UaspK7Illf3GxCM5lC1t1c7bC8fUXeGJFAyQ/tqgnkq67LYw3GovzCTTKYp9o4UzVpf1FcgO08p3jifopt925DRbMesGsT1L4TGekNe+wr37CYkblyjnIKXhiPoC02nLanb6rS6HL1rWtqgB5o+0f8niCrU64a02XVZz+gURzdpyt3KW8UGXnXzzG4Cq8+NDC6nWG8C7MDxTj261vFtbZ/M0gLrWfhCjI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a018f1a6-43e8-4831-9bfe-08d6d549e2b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 13:17:43.1322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1498
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gVGh1LCBNYXkgMDksIDIwMTksIENodW5mZW5nIFl1biB3cm90ZToNCj4gPiArCWlmIChjaGFu
bmVsLT51c2VzX3VzYl94MSkNCj4gPiArCQl3cml0ZWwoMHgwMDAwMDAwMSwgdXNiMl9iYXNlICsg
VVNCMl9QSFlDTEtfQ1RSTCk7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eIGF2b2lk
IG1hZ2ljIG51bWJlcj8NCg0KT0suDQoNCkNocmlzDQoNCg==
