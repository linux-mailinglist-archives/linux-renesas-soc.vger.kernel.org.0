Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D5035692
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 08:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfFEGFP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 02:05:15 -0400
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:63216
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726050AbfFEGFO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 02:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0B/BAjdEDBmqY3U3JhUerrPH5zHzEJhXE2U2YBDvKp8=;
 b=Lfe54q4+0ofdoIUIrHVJ5sDn81RUw34C6mttGgs9SMUDOWvkCznCcUX4lzRaXXOB6/85kxUQrqqhD5jnARw1WPKnGNQbnMBdNIIuOoHv8NjBcRPFi3oHgQaYFER55cx0Q0N+B01nDAFnn9AXUAHCSPSWY1HrqRPywCnkgn6VHtE=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3138.jpnprd01.prod.outlook.com (52.134.248.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 06:05:12 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 06:05:12 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 1/2] usb: renesas_usbhs: remove sudmac support
Thread-Topic: [PATCH 1/2] usb: renesas_usbhs: remove sudmac support
Thread-Index: AQHVGowEtJizqdLgRESljRAXIeVX4KaLI7MAgAFwTjA=
Date:   Wed, 5 Jun 2019 06:05:11 +0000
Message-ID: <OSAPR01MB30894416C80DA27D4836537FD8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559621375-5436-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <c5ef1e44-10a9-a736-8578-05f45f34a598@cogentembedded.com>
In-Reply-To: <c5ef1e44-10a9-a736-8578-05f45f34a598@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dde2e7a2-9792-4fd9-15fe-08d6e97bc584
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3138;
x-ms-traffictypediagnostic: OSAPR01MB3138:
x-microsoft-antispam-prvs: <OSAPR01MB3138607B6BC138174332F8B8D8160@OSAPR01MB3138.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(366004)(136003)(376002)(39860400002)(199004)(189003)(8936002)(99286004)(26005)(25786009)(476003)(66946007)(73956011)(3846002)(6116002)(486006)(55016002)(86362001)(11346002)(71190400001)(7696005)(305945005)(76116006)(558084003)(478600001)(52536014)(6246003)(446003)(6916009)(66476007)(66066001)(64756008)(66556008)(76176011)(74316002)(53936002)(81156014)(66446008)(7736002)(4326008)(6436002)(102836004)(71200400001)(81166006)(2906002)(8676002)(9686003)(316002)(6506007)(53546011)(229853002)(68736007)(54906003)(186003)(5660300002)(33656002)(256004)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3138;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xWatSTbpdFMuHDLz3fUEbVpFYnFH0YSxqJLHbeVkmHBOObsOmdmUrObhwkcY2Kxt0FmkjEKAJyz0YVrNh0KjGos183CsYEyVP1DtKanlQER/3vOXljwDUIIkK95/GzaIfGteJBCsqQJxnCqw5s8qDjdAuf0LPaEByt2B1oDaFgt7gdGzlRA2AyEs0UsUw8CZ0cyzsJLUQg5fqisnORrAKgzbfMU03WBxYPrxcWZrKqkgOYvsWyLxQuuANVlrtksOCfW14fYYqlA0WNeA9oHHqdgB2nfOnwTOpv+71yhpUTfDLzDJY4IjKgeXyFH73c8zfBfAPLZw0uQ2K42tASJSc0QMSXM2GdHRB3DZ/zb0kFZyXhRDoiL9DiEMpOqS6vhm2DRhFSqT4d05pE3lYpWCE6BYF3taa2Miq33T3+PN7WM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde2e7a2-9792-4fd9-15fe-08d6e97bc584
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 06:05:12.1572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3138
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8hDQoNCj4gRnJvbTogU2VyZ2VpIFNodHlseW92LCBTZW50OiBUdWVzZGF5LCBKdW5lIDQs
IDIwMTkgNTowNiBQTQ0KPiANCj4gSGVsbG8hDQo+IA0KPiBPbiAwNC4wNi4yMDE5IDc6MDksIFlv
c2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiANCj4gPiBTVURNQUMgZmVhdHVyZXIgd2FzIHN1cHBv
cnRlZCBpbiB2My4xMCwgYnV0IHdhcyBuZXZlciB1c2VkIGJ5DQo+IA0KPiAgICAgRmVhdHVyZT8N
Cg0KT29wcyEgSSdsbCByZXZpc2UgaXQgb24gdjIuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGly
byBTaGltb2RhDQoNCg==
