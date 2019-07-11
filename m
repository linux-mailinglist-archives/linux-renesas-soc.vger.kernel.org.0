Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7706C655EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2019 13:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbfGKLtT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Jul 2019 07:49:19 -0400
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:42310
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727956AbfGKLtS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jul 2019 07:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFtnK1uIn8SvBO8v8Yg2GiCRk2O3H1XYMrXJhaYXah4=;
 b=APQ/A4y7WwQkHnEkTNtyYC6iGn6SeFaVjVZuUqbi2ujMsLd3qX5NSj+TjiOhpIYi+U5iYorSNxMJ7nh60a/rYHZO1NttZ+r30oaj9TfPbmjmNMzJlT5xS6mFMS9jjK7jk2DrpSbEkHV68ZWzoKrCXYX2hXVyRzXGlFKxlo5nvyo=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1531.jpnprd01.prod.outlook.com (52.133.163.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Thu, 11 Jul 2019 11:49:03 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::441a:2bf7:e01e:a247]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::441a:2bf7:e01e:a247%7]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 11:49:03 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH rza_u-boot-2017.05 0/2] rza2mevb: Allow using Ethernet
 when SDRAM is enabled
Thread-Topic: [PATCH rza_u-boot-2017.05 0/2] rza2mevb: Allow using Ethernet
 when SDRAM is enabled
Thread-Index: AQHVMn5n9ESgvWNuvEqY4EXyomsghqbEORZQgAECjICAABvUAA==
Date:   Thu, 11 Jul 2019 11:49:03 +0000
Message-ID: <TY1PR01MB1562336D1ECED72EE8B16DC38AF30@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190704153726.10507-1-geert+renesas@glider.be>
 <TY1PR01MB1562B65595974A21F6751D9C8AF00@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWG0w6c7ZF6JHWJ-46U3nYn5i3kg9-AF0jwx+KfvfKd-w@mail.gmail.com>
In-Reply-To: <CAMuHMdWG0w6c7ZF6JHWJ-46U3nYn5i3kg9-AF0jwx+KfvfKd-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctZGYwMjdkZWQtYTNkMS0xMWU5LThkOWMtNWNjNWQ0NjFlNzI0XGFtZS10ZXN0XGRmMDI3ZGVmLWEzZDEtMTFlOS04ZDljLTVjYzVkNDYxZTcyNGJvZHkudHh0IiBzej0iNDQ1IiB0PSIxMzIwNzMxOTM0MDc0MjMxMjEiIGg9ImJKcCtmOCt5NjhoajVINXV5bGFMUWNsa2I3QT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71dec1f7-9ae1-4016-01b4-08d705f5c57b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1531;
x-ms-traffictypediagnostic: TY1PR01MB1531:
x-microsoft-antispam-prvs: <TY1PR01MB153169977CB59ACD7C0705528AF30@TY1PR01MB1531.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(52536014)(54906003)(86362001)(4326008)(68736007)(55016002)(9686003)(5660300002)(25786009)(66556008)(3846002)(6116002)(66476007)(316002)(14454004)(66446008)(64756008)(76116006)(66946007)(99286004)(558084003)(478600001)(7696005)(186003)(11346002)(2906002)(6506007)(66066001)(81156014)(8936002)(305945005)(7736002)(74316002)(8676002)(81166006)(76176011)(446003)(26005)(229853002)(33656002)(102836004)(53936002)(71190400001)(71200400001)(6436002)(6246003)(6916009)(476003)(486006)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1531;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +O0jQ4V/hwmvOxcf+veEhe0c0F3V1BB+MTJFl+QElmOIDhGQ2SSyc+0H+MLpLy5kCU8dxh8xqZiXmAN2ThMmayaMNHk8CX8iJMUCdxtyVS3baahOz+znzALnjNk/Udf61lOiSR2Ynv3rrELKIsfp8NEubej87M45rUOlOTYwgdlaxKTYjhsz+bcIX4gk0uq8miaB/cLBX/YJ8TikYFEhHj+WGuK69hvKuJGWRs4h9oRFKFQAjMRSdBUTrUIw7YD9hJSayoImWw/wZyP7mC6iA1YSyDc8nccZgjTvot4eD0H4cftQXAej0LFVFI/2o0YVJRtuukV4CZrWxmjFxClBTvOd9Qj/OU7icW80Qdbqv7u1qHG0ZgAs1NQdp1362BLuT6Jf9LiHgdKEpf3Lyg+dZ+HVsiLtbpB0vQ3I69baEVw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71dec1f7-9ae1-4016-01b4-08d705f5c57b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 11:49:03.3174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chris.Brandt@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1531
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFRodSwgSnVsIDExLCAyMDE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+ID4gRG9lcyB0aGF0IGZpeCB5b3VyIGlzc3VlPw0KPiANCj4gVGhhbmtzLCB0aGF0IGlt
cHJvdmVzIHRoZSBzaXR1YXRpb24uIE5vdyBpdCBjb250aW51ZXMgdG86DQo+IA0KPiAgICAgVW5j
b21wcmVzc2luZyBMaW51eC4uLiBkb25lLCBib290aW5nIHRoZSBrZXJuZWwuDQo+IA0KPiBhbmQg
dGhlbiBpdCBoYW5ncy4NCg0KT0suDQpJIHdpbGwgdHJ5IGl0IG15c2VsZiB0b2RheSBhbmQgd2ls
bCBzZWUgaWYgSSBjYW4gZ2V0IGl0IHRvIGJvb3QuDQoNCkNocmlzDQoNCg==
