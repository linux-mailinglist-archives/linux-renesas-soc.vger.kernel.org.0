Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B90D41F68
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 10:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbfFLIj0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 04:39:26 -0400
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:34336
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726000AbfFLIj0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 04:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hOYwRqM/FicSljbZK1I1nyHs/UwJuYmc/yFBlesTnQ=;
 b=OA/I989F0CFRB4GDTVzCyHJ7qtEtY+L/1d1QNKc51YvTVVXgNpAbxo7zzOBo8T8VJoIb78YIxWxv/B8nlgu19lQkXW0QNGMb6Ky20uMu1/rF9vcTLrmAz7PqQ1H78lKuELnKMyJI0ImHCkpRgPX8PvWOocNWTDeoCqGSFPGgD+A=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1849.jpnprd01.prod.outlook.com (52.133.161.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 08:39:23 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 08:39:22 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Thread-Topic: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Thread-Index: AQHVHQkEF65BtXynz0KAWAQHwuh89aaXt2YAgAAAWKA=
Date:   Wed, 12 Jun 2019 08:39:22 +0000
Message-ID: <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
In-Reply-To: <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ee377bf-6e0e-4c2c-c084-08d6ef11780a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1849;
x-ms-traffictypediagnostic: TY1PR01MB1849:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TY1PR01MB1849EB63BCA4E0B0AD99769AC0EC0@TY1PR01MB1849.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(5660300002)(3846002)(186003)(9686003)(52536014)(316002)(229853002)(11346002)(26005)(14454004)(256004)(305945005)(86362001)(486006)(476003)(44832011)(74316002)(33656002)(966005)(7736002)(446003)(6116002)(66446008)(8676002)(71190400001)(8936002)(76176011)(6246003)(66476007)(53936002)(64756008)(4326008)(2906002)(66556008)(25786009)(6916009)(6506007)(53546011)(478600001)(102836004)(71200400001)(6436002)(68736007)(66066001)(55016002)(6306002)(54906003)(66946007)(81156014)(81166006)(7696005)(76116006)(73956011)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1849;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DpWPrOshvOnbTfmKX0vjw/kZYUIObZLRYnLZckK6d8cpQOSc6nkDZRKq4JABNf8IM3l+JX5GWp2iQiO+pjccrwSi/Qi3f8RWcQzHsUIYaz3iQnA0/1hPR4BVC3qe+iVz11oeCQfCTj+wZYM/rZfKcBnLQiM7tJ5mz9xVMw1VmsJrH1Or5vtv4BEiJfOzYCCiUZFp7zz3MMO2V6n6fR0K5i7bxRBRaCXo5uFHNuQhtq9FtJtWX4eJDKgB6iohtAAdQTeuIpzlS76Jy30Jd5m+3KsASoqw+maSHmqWqnASDgSpLaWxLYThwDNqZ+YU3yWHl5VDVPdHfdBi9LmPw6dj/YRfJ8st2+kQlVSgZBLQtgFfIWjgzALkWRi+QIkPBLRrs6f6xlJM/XVw7jEk695HwrWwbnioDAiu0bkr/WRNbfo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee377bf-6e0e-4c2c-c084-08d6ef11780a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 08:39:22.6267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1849
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxMiBKdW5l
IDIwMTkgMDk6MjgNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gYXJtNjQ6IGR0czogcmVuZXNhczog
aGlob3BlLWNvbW1vbjogQWRkIHVTRCBhbmQgZU1NQw0KPiANCj4gSGkgRmFicml6aW8sDQo+IA0K
PiBPbiBGcmksIEp1biA3LCAyMDE5IGF0IDEwOjE0IEFNIEZhYnJpemlvIENhc3Rybw0KPiA8ZmFi
cml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMg
dVNEIGFuZCBlTU1DIHN1cHBvcnQgdG8gdGhlIEhpSG9wZSBSWi9HMk0NCj4gPiBib2FyZC4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJw
LnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLWNvbW1vbi5kdHNpDQo+ID4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL2hpaG9wZS1jb21tb24uZHRzaQ0KPiANCj4g
PiArJnNkaGkzIHsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwmc2RoaTNfcGlucz47DQo+ID4g
KyAgICAgICBwaW5jdHJsLTEgPSA8JnNkaGkzX3BpbnM+Ow0KPiA+ICsgICAgICAgcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IiwgInN0YXRlX3VocyI7DQo+ID4gKw0KPiA+ICsgICAgICAgdm1tYy1z
dXBwbHkgPSA8JnJlZ18zcDN2PjsNCj4gPiArICAgICAgIHZxbW1jLXN1cHBseSA9IDwmcmVnXzFw
OHY+Ow0KPiA+ICsgICAgICAgYnVzLXdpZHRoID0gPDg+Ow0KPiA+ICsgICAgICAgbW1jLWhzMjAw
LTFfOHY7DQo+IA0KPiBEb2VzIHRoZSBlTU1DIHN1cHBvcnQgSFM0MDAsIHRvbz8NCg0KVGhlIGVN
TUMgZG9lcyBzdXBwb3J0IEhTNDAwLCBidXQgaWYgSSBsaXN0IGl0IGhlcmUgdGhlIGVNTUMgd29u
J3Qgd29yayBwcm9wZXJseSBhcyB0aGUgU29DIGNhbid0IGRlYWwgd2l0aCBpdC4NCldvbGZyYW0n
cyBwYXRjaCBibGFja2xpc3RzIEhTNDAwIGZvciB0aGUgUlovRzJNIChyZXZpc2lvbnMgIkVTMS5b
MDEyXSIpOg0KaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9saW51eC1yZW5lc2FzLXNvY0B2
Z2VyLmtlcm5lbC5vcmcvbXNnNDA2MzAuaHRtbA0KSSB3YXMgdGhpbmtpbmcgYWJvdXQgc2VuZGlu
ZyBhIGZvbGxvdy11cCBwYXRjaCB0byBsaXN0IGhzNDAwIGhlcmUgYWZ0ZXIgV29sZnJhbSdzIHBh
dGNoIGFwcGVhcnMgaW4gYSBSQywgd291bGQNCnRoYXQgYmUgb2theSB3aXRoIHlvdT8NCg0KVGhh
bmtzLA0KRmFiDQoNCj4gDQo+ID4gKyAgICAgICBub24tcmVtb3ZhYmxlOw0KPiA+ICsgICAgICAg
Zml4ZWQtZW1tYy1kcml2ZXItdHlwZSA9IDwxPjsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5
IjsNCj4gPiArfTsNCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
