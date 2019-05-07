Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E852165F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 16:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbfEGOns (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 10:43:48 -0400
Received: from mail-eopbgr1400139.outbound.protection.outlook.com ([40.107.140.139]:57754
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725859AbfEGOns (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 10:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aM0Nd0hS5cwxiqbVjrIhyckr+/lsIhaa8E7lQbaaI9M=;
 b=BvCwVyEV+OLyE03Fd0hbJF1HR8X55VAiTq+UN24vqef5iq5Nm1zyCNdQGh8z/ZunEp09l/gpXrC0c0LVp7cNzGoyBCeT2fREK9jvtctaDJddwsRvkuXqjXtwMhVXAprDVzblAjM/h0sShKEWQ4/4GMN4O0SW03RTZVV3xtBABIM=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1835.jpnprd01.prod.outlook.com (52.133.163.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 14:43:41 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 14:43:41 +0000
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
Thread-Index: AQHVBGYbvpIQ5ioroEGpDalH9Ovnd6ZfhsEAgAAEBrCAAC6vgIAAAodw
Date:   Tue, 7 May 2019 14:43:41 +0000
Message-ID: <TY1PR01MB1562C153ABE676047F568BBD8A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
 <17bcc673-5fed-ce4f-3d61-af34bfa5d769@cogentembedded.com>
 <TY1PR01MB1562550164C7977D28C90F128A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <34544f59-76aa-710a-a6ec-7d7d7f31a023@cogentembedded.com>
In-Reply-To: <34544f59-76aa-710a-a6ec-7d7d7f31a023@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [24.206.39.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50f26ac9-4f6b-4522-a6ff-08d6d2fa6605
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1835;
x-ms-traffictypediagnostic: TY1PR01MB1835:
x-microsoft-antispam-prvs: <TY1PR01MB183521668A620E1A497A06488A310@TY1PR01MB1835.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(376002)(39860400002)(136003)(366004)(199004)(189003)(102836004)(25786009)(4744005)(186003)(9686003)(6506007)(53936002)(26005)(55016002)(66066001)(52536014)(66946007)(73956011)(99286004)(76116006)(76176011)(5660300002)(64756008)(66446008)(4326008)(6246003)(71200400001)(68736007)(256004)(7696005)(66556008)(71190400001)(66476007)(6116002)(72206003)(74316002)(316002)(3846002)(6636002)(54906003)(86362001)(2906002)(110136005)(229853002)(11346002)(81156014)(446003)(486006)(476003)(33656002)(81166006)(8676002)(478600001)(7736002)(305945005)(14454004)(6436002)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1835;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uPZDp5PeF7+tmUu0T2UI8Phz9EfG3VsbTRbk5xqa3+OFSnGO4FwGKskR81QELEXiLtOAPb/eE7gwxEnV+qgi+dxxvM1yqMFNm/0tz00VKebQZ2YpAPgfg50Ki3yqZAOMpOQrbeO4UrDi64pSP/VegEkmGPtGyMgV+A/mL2kfOuu7KjlnjC9bXADHoAwxK3Yki+gEoqbv9c+JlpPILgYvCDE21FJPf9Kelv483UKlSWV+BGU1iI3AdJNvOxUZa3eOYZBF6bPdHdmXgs0mlgUUq/5oHlToC5pZ6WVuTKUqGFmvMBhP/MkFD/yy30xtct81+B8h4rbsK0qLMwx5xw3bN0DNBl3VKM5RhbuRgNeOFac45N2eorEXBVzpmp23OjZBtnjF/VN1hSpNjo0BSsymQ30MjtJ0XKEH8Mzirs5bsPw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f26ac9-4f6b-4522-a6ff-08d6d2fa6605
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 14:43:41.2545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1835
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gVHVlLCBNYXkgMDcsIDIwMTkgMSwgU2VyZ2VpIFNodHlseW92IHdyb3RlOg0KPiAgICBEb24n
dCB5b3UgcmVtZW1iZXIgYW5vdGhlciBydWxlOiB1c2Uge30gaW4gYWxsIGJyYW5jaGVzIGlmIGF0
IGxlYXN0DQo+IG9uZSBicmFuY2ggdXNlcyB7fT8NCg0KQWgsIEkgc2VlIGl0IG5vdy4NCg0KRG9j
dW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3Q6DQoNClRoaXMgZG9lcyBub3QgYXBw
bHkgaWYgb25seSBvbmUgYnJhbmNoIG9mIGEgY29uZGl0aW9uYWwgc3RhdGVtZW50IGlzIGEgc2lu
Z2xlDQpzdGF0ZW1lbnQ7IGluIHRoZSBsYXR0ZXIgY2FzZSB1c2UgYnJhY2VzIGluIGJvdGggYnJh
bmNoZXM6DQoNCi4uIGNvZGUtYmxvY2s6OiBjDQoNCglpZiAoY29uZGl0aW9uKSB7DQoJCWRvX3Ro
aXMoKTsNCgkJZG9fdGhhdCgpOw0KCX0gZWxzZSB7DQoJCW90aGVyd2lzZSgpOw0KCX0NCg0KDQpJ
IHdpbGwgY2hhbmdlIGl0Lg0KVGhhbmtzIQ0KDQpDaHJpcw0K
