Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA23013BAD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 09:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgAOI1C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 03:27:02 -0500
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:10693
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726088AbgAOI1B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 03:27:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvLwt2ZDv5fryoPIxzdnC2n4g/Kq5a9G75oCKimgwjrAhvO6Fx23sVl1liyEM0LEhWCXCxVAuo7666K0q3cCFCIn2WiQjLupfMIV6nOe7l+wnRVC2qzAKTA13yufy9ZzvzspjDCNkmHPv4bVkjKJgqxLF3EGEgOxAloUAXto6LR8CwExXD7fT7Ep3FP5qLZ72XlTLJNIhfDUJuAh0A0oJGEb37qohbPQqIN0YEyzWmrIx7uqbavKlrB4dc5p6+LXSn20lXSOKkZKLzkZX6Ww+RV/4g1jIV9tK8BDO+HwbwXSAW32CfmzK3eXADGDjLbAZOfvt+55jIBY3vnXoPLdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4ggkxuH90BH7ernD9UTNrOxT5gpeUaiM/XB16t/iws=;
 b=WRSU34bexFfc+Zcs2h+KmXwi0uKQOGb+h3Fx9oXVpE/DbHMmbUjOKSJ+TGMYvG2no2p3t4sZOuqvnGRNLTk71Hj5SAHlQIRtbQCWEi1HWu3kPCKJz0RpP2QRc5o8wVWG39d7NIwkD2r7oM6uPjyS7ttWsnQemdMBeHpURpPqwUr96juUIUrlZnWHFIg+8X0Tdqhjl14ezCpopMJe91KhDmKeBhvDdUqFwZ86fgEE3HxS5Hkw0pyhkYvDYGihec1655w/D6EvyFR9mci7USr5xVS2qLgYZiXpl0H+L1TGND34fbxVh4CjfdbwFVqLqq1J0bfyiHeMWS3HKs7jamGrRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4ggkxuH90BH7ernD9UTNrOxT5gpeUaiM/XB16t/iws=;
 b=irL+GeVF75glpZ8GPg8Qkos10QDNf5blglKIFa9kXeQ2RFne7nCw2KOg2/YBXgHpbQoGqqi+dMGMb9RmE45Q8RNu5EEaZSJ7prPoPRcsrO+SPzfDRmYPvODaAZznF6HOAIijBmabOYSmecVMXG1BK4to5l4z6Jp1xVPLegzBXfU=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB4608.jpnprd01.prod.outlook.com (20.179.174.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.12; Wed, 15 Jan 2020 08:26:58 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::1045:4879:77ed:8a70]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::1045:4879:77ed:8a70%7]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 08:26:58 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC][PATCH] ARM: dts: renesas: Add missing ethernet PHY reset
 GPIO on Gen2 reference boards
Thread-Topic: [RFC][PATCH] ARM: dts: renesas: Add missing ethernet PHY reset
 GPIO on Gen2 reference boards
Thread-Index: AQHVyXxkFFYTNkuPVU6v1pLjBoMSJqfoTD+AgALmFQCAACiKAIAADCNw
Date:   Wed, 15 Jan 2020 08:26:58 +0000
Message-ID: <TYAPR01MB228521B36B1B1DC67F187663B7370@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <20200112191315.118831-1-marek.vasut@gmail.com>
 <CAMuHMdWc97=-9yBF0CJDZpWH9ZGX9uoDY_t6E6TQNc4MO93W_w@mail.gmail.com>
 <cfb752e0-46b5-1936-c3f1-8c6d781bebb5@gmail.com>
 <CAMuHMdWeo3awiD7iAfWFXc01isnmsBc6CuQ6X4s3CO7pNXjfJA@mail.gmail.com>
In-Reply-To: <CAMuHMdWeo3awiD7iAfWFXc01isnmsBc6CuQ6X4s3CO7pNXjfJA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4a9853ed-8531-45da-67fe-08d79994b024
x-ms-traffictypediagnostic: TYAPR01MB4608:
x-microsoft-antispam-prvs: <TYAPR01MB4608943D6EC037396980AF00B7370@TYAPR01MB4608.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(189003)(199004)(53546011)(66476007)(2906002)(186003)(54906003)(71200400001)(7696005)(316002)(86362001)(110136005)(26005)(6506007)(8936002)(55016002)(4326008)(8676002)(81156014)(9686003)(81166006)(33656002)(64756008)(76116006)(5660300002)(66946007)(66556008)(52536014)(478600001)(66446008);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4608;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IdaB9o2ruqjcvCokJ8GhgwIAurg3SPwF6PPzxml8eYghGoPcEkm11wT7gAA5lOfeAsfXJLAoz5gwDY76eLgKLGATYFI/WIAqrYxAu4zuL60gqpWx+/U/FtAudo2wpQjKxS+ZNItG0L9jlubdDSGi2Ivw4ThUGCU8mp7KctTJmKwocvyK1+aFL0Z4tmhPi434eJ9InrwdKQ5tLGV1Y4JJlEugpQPOdQXiN6bh/Ubf3+Tdwh+CP/2+xhgus+ZzjSK4DY9U5fpLtwINECx0pTl72OF+fm3hWebM7ClWViGv9UKOhmK3L2MF/JhC4+lhELe67Vxv2+20ZBSaF3ET7Wk0c8a6gvZA9IkX9g0JJ2Pfuh8dSjvdYVZL9Whq7Q2Q/BXZsYqshFxZprdbe7xfaKWBVtY5RVd/+ta63vUkvwfEV2cLTwhzZGtGsVVtw4R0xm/2
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9853ed-8531-45da-67fe-08d79994b024
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 08:26:58.3950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B029531AnpcxvB7IM51x1nQPoBElwxR/+UL9IREDUnb5tCnGv1MxxU4OLLRdc3RbnQntLIRLlJz8aZDIzrR6qfCPRtkKlaaFXB36dEBFKh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4608
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50
OiAxNSBKYW51YXJ5IDIwMjAgMDc6NDANCj4gDQo+IEhpIE1hcmVrLA0KPiANCj4gT24gV2VkLCBK
YW4gMTUsIDIwMjAgYXQgNjoxNCBBTSBNYXJlayBWYXN1dCA8bWFyZWsudmFzdXRAZ21haWwuY29t
Pg0KPiB3cm90ZToNCj4gPiBPbiAxLzEzLzIwIDk6NTggQU0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4gPiA+PiAgYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc5MC1sYWdlci5kdHMgICB8IDEg
Kw0KPiA+ID4+ICBhcmNoL2FybS9ib290L2R0cy9yOGE3NzkwLXN0b3V0LmR0cyAgIHwgMSArDQo+
ID4gPj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3OTEta29lbHNjaC5kdHMgfCAxICsNCj4gPiA+
PiAgYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc5MS1wb3J0ZXIuZHRzICB8IDEgKw0KPiA+ID4+ICBh
cmNoL2FybS9ib290L2R0cy9yOGE3NzkzLWdvc2UuZHRzICAgIHwgMSArDQo+ID4gPj4gIGFyY2gv
YXJtL2Jvb3QvZHRzL3I4YTc3OTQtYWx0LmR0cyAgICAgfCAxICsNCj4gPiA+PiAgYXJjaC9hcm0v
Ym9vdC9kdHMvcjhhNzc5NC1zaWxrLmR0cyAgICB8IDEgKw0KPiA+ID4NCj4gPiA+IEkgYmVsaWV2
ZSBhbGwgb2YgdGhlIGFib3ZlIChleGNlcHQgZm9yIHN0b3V0KSBhcmUgYXZhaWxhYmxlIGluIE1h
Z251cycgZmFybS4uLg0KPiA+ID4NCj4gPiA+IHI4YTc3NDMtc2stcnpnMW0uZHRzIGFuZCByOGE3
NzQ1LXNrLXJ6ZzFlLmR0cyBuZWVkIHNpbWlsYXIgY2hhbmdlcyBhcw0KPiA+ID4gcjhhNzc5MS1w
b3J0ZXIuZHRzIHJlc3AuIHI4YTc3OTQtc2lsay5kdHMuDQo+ID4NCj4gPiBEbyB5b3UgaGF2ZSB0
aG9zZSB0d28gYm9hcmRzIC8gY2FuIHlvdSBwcmVwYXJlIGFuZCB0ZXN0IGEgcGF0Y2ggPw0KPiAN
Cj4gSSBkb24ndCBoYXZlIHRob3NlIGJvYXJkcywgYW5kIHRodXMgY2FuJ3QgdGVzdCB0aGVtLg0K
DQpTb3JyeSwgSSBkb27igJl0IGVpdGhlci4gUGVyaGFwcyBTZXJnZWk/DQoNCkNocmlzDQoNCj4g
DQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
