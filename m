Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE80A4112C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 12:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbhITKRH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 06:17:07 -0400
Received: from mail-eopbgr1410117.outbound.protection.outlook.com ([40.107.141.117]:31840
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230266AbhITKRG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 06:17:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdit/LurdUCo83+R82QBW3hMex2rakbqkHJVLbbuX6Ethwy//swbzp5+dgILq/B1HQ1pe5bK0N47Bec3eOf4+hH6flZwNtlsm6PnHgykbxv4901urwAljnwdQbS9L75Mlv9KTqhaUdNQjLfuE2S8NPQhOb5WqP2AfPH4KgEbDpePni2xNqGg3+Q/oJ6YE0pdxH0x1ap71tJF7376wQB2zctOIMJ2D7ZMaavgl1aKKl6IWUBU1FgUA1NHKTcZbm52i3+Y6WIQJHiYac0UgZCvnOTtakcL8yla61m1EfcASEY5gV7H3zxGby6yj2CrWhdiZ7JWYLfXHUjW4xsv705iXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jxOPkEjz6C+uCzME+Mvq3Y66Jisv9rVvtL9kGTIrAsU=;
 b=aQccjQ4RYjwNCthPMaW0+cFsIRezbetSxmUA46+VDbcJamZRtHK6ZFKc3Au1uz6t4J8MXkt7CmmieNqAcOWHxnKv8lloE84yqXbOZtJmZYqzUhWaLq4SrVQNQqr8xRon8DqYWWvKGgYBU54KH1zft1e/mi/PIHTs/3JHaY6jTTZaMuP4wvGbo7Mi+kxCv4qlkH+psjgW/VYd+QtuUT8ADVd3ovRuIUnlSMW3jgevU8XnSZ/C3c31Akt42A92TlwoZxu1hBhDDh+v534WRzMaUUPOaYc3fgtx+bGlirtcZAV6IezEGn7LkVa15lDqQnN4CCEt6Ny2bDMfmvOO2wX4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxOPkEjz6C+uCzME+Mvq3Y66Jisv9rVvtL9kGTIrAsU=;
 b=DlYVNiMlmXWpCDMWDxh1nFdY8imTuzgRizhyZKBrQh0FPeuA7K3qG1PG3yhQ7Eve5HW783JnKdsHCZPyhtk0OtTYDvAWLE4QFGkEXFvurxFYYFs+Nmyi8fB8ixMbY0dc9OX+pzqvOhY9zjBe41blm+JG8OecMgShmBr94weN4lA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSYPR01MB5432.jpnprd01.prod.outlook.com (2603:1096:604:86::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 10:15:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::6532:19dd:dfa1:4097]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::6532:19dd:dfa1:4097%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 10:15:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] drivers: clk: renesas: rzg2l-cpg: Add SDHI clk mux
 support
Thread-Topic: [PATCH 1/2] drivers: clk: renesas: rzg2l-cpg: Add SDHI clk mux
 support
Thread-Index: AQHXoxSbiHTQK8wM50usahRYsK3aFausykWg
Date:   Mon, 20 Sep 2021 10:15:38 +0000
Message-ID: <OS0PR01MB5922B444BD72604FC96A131386A09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210804180803.29087-1-biju.das.jz@bp.renesas.com>
 <20210804180803.29087-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVSSf6B8k0HeuhSbQ=_SEiRkaBmQbHUm5Jx1ks+a5UQFg@mail.gmail.com>
In-Reply-To: <CAMuHMdVSSf6B8k0HeuhSbQ=_SEiRkaBmQbHUm5Jx1ks+a5UQFg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53211130-1712-4679-703a-08d97c1f97e0
x-ms-traffictypediagnostic: OSYPR01MB5432:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSYPR01MB543234B70AEFABB4F3C5DC3D86A09@OSYPR01MB5432.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kjvCTTQPeIvkS4vEEFtoeQtlGZUaqJnAcc0wzSOM58rzLC+AbnHAu/sLuwb4p0kosuDC7gnBDVFyW4pYoCoCWdJmSCgq/sTXMheopR/j8FC+MqvYBHoy9Egq0V1AdmJN7UpHXgBsp4zVDENaAeq83E8wQD9ILu1cD+9x28PxGmrjwjSYimOjP2MtLBEjxYB83UKAOnBdhjayVrXa36VRo5eiuhpzIn+V7Yu6ZDV/Es1DTxouWEjpA1TWMDQi9V2TqRYzUJ8oVy4blH0DzvsHI7wbEqwE8JpHBgItII6ecA2/16r1MqUPR0rdb0KHt+J+eSaLcgjpuBZJCvIJ0zyttmpvZcmt9k1u3A1dYLj9cg7VNFdR83+f8m2mRuHFwmWlDJALlimn+ZbUjEUbEYr95Ilg8nz3DJ/TxoywCqJ3rFfI0TqV9lYva8mcjLdzRwCFIMm0KVxG4HHi7UxIbPyL2QNKz7U7sZgbGuva5s+Wl94SpQTlkr/t/YtENoKKFA/bSZ7ajnrnUyUmMiaTmbbfhzGxO5JDKvvkh4OjmAsp85qKjb/kK4JS52a+8O/4OvFENRsiqzbjodoy8tvuZdhFZw6bWJORQbLCuukOSNXVDyHHHMKk+pN1UQzwhWBI6ECDzvSy/X5LMS88HPnhNl/cbT3ZwGcJC/YKSEZCVEWZWnWoJa4AVpsxXVozFAinaZQjJKhGo4A8yN+aI+wmcVZidQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(26005)(86362001)(316002)(5660300002)(71200400001)(54906003)(66556008)(6506007)(83380400001)(7696005)(6916009)(2906002)(8936002)(9686003)(186003)(38100700002)(53546011)(38070700005)(64756008)(33656002)(66476007)(55016002)(4326008)(122000001)(508600001)(8676002)(107886003)(66446008)(66946007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnJoZGpVNFZoejBGVlNoR01YSVJ2T2RtaXRCaDNSQm1Sb2cyZVhUaVBhMG1m?=
 =?utf-8?B?ZUtRQkpOWCtKTzNZdW5wZzEvUVp3eUY1eitXckZ4akQzOTVLaXNSSHYzWlUx?=
 =?utf-8?B?bXVwRXJTSHRxZjhYblduMFNCbDlQS1MwTGdKY0h0Y0xLVG9lbjhzck8rT1ZN?=
 =?utf-8?B?M1MvY0ZWZ0V5eGlHTzhhdXVXVjVqai9jZG9ob3RJRjc0TUIxK0lmcVo2RUxp?=
 =?utf-8?B?eDhYQ0FvcUZvdktNc1ljMTU5TGpRcmU2a2JFM1BJMHQwWXF6S2d5Vkptajdm?=
 =?utf-8?B?alMza1JYYVdwWHRoYlFSUFRKUDhMRGxodFVhbW9iV0NJMy9yM1NHTVVhQjkw?=
 =?utf-8?B?enhjakh6bmVGTWMxYWU2clZSS2UzcWRVVG9tNWE2VUR3UG12bFNQSGttUFU1?=
 =?utf-8?B?UjVIZGlsNnh6Z1c1Zy9PdUZ3dlJJdEhWZ1JreXJRaHFjdlA4R08wZ0lteWhJ?=
 =?utf-8?B?UFRyOHo0R1BYaWVqWndlL2REakRwNUV5S3ptL0hnMW0rMmdwdTRVNUhKcVpt?=
 =?utf-8?B?RjFzUUZsOFVrMnNTQnVQNEFUM0Rjc0o5WFdiTTdjN3ZmSTA5Tk02YkZBNWJr?=
 =?utf-8?B?MXI5VTRhL2ZJSlk1dmlUZlZaOFF3MWR2eVVCS2dRZlgzS3g2TkFJMUw1VmNz?=
 =?utf-8?B?M2pscjBURjBtemZPbm1ua0JzbHdoZUZXTEVyLytDbUxvZGZPVVduUFljVjNE?=
 =?utf-8?B?Zm4wRjhoTmYzVFB1MU9wM2cyR3AyQWRmTnFWeGlQQ21sK0RsRHZVbkw1eUp4?=
 =?utf-8?B?YWtGUi9wTHppTGtmWEdwNFlhV0NTMjlUNlZXVG56cy9aRnBybTlBeEZ3NWt2?=
 =?utf-8?B?aWIxY0JRU3pKdDFCQm1zS0FqNmV2bkJWbXZvQnk2dUxFeFNleTlQWE9Kcm01?=
 =?utf-8?B?U05yYUFUZXp5b2o2RUVtRHZOMTFFZThMb0NTMk94WjNYMDc2VTE5dllmR1pj?=
 =?utf-8?B?MjdqZFh4MGVWbmZEc21lT3I3Wmh0SDZlTjFpRElENzBsOElmT2lya2ljVHA0?=
 =?utf-8?B?b0w1VS84c3UySlJHT3gzTU5hTHhpRGdacnorNkZRajJQNEpML3NXN2lEbEdO?=
 =?utf-8?B?U2Y5Q2poWUNNZEJBSk11amczKzFCMFRNUHFKa2FUaFFVcXNDMHZpSUIwUGZH?=
 =?utf-8?B?bzVQRklsMGI2dmNIRnViM29oaU0zMmpFZFlRNXQzUkI3QTYwdXp0VVpONHBt?=
 =?utf-8?B?Y0xZTHo2a0VmelFDejBuVHNFdGVRRXB6emk1V2h3SEhxZllpaUxvVmpDYnJm?=
 =?utf-8?B?OFlWaVhYOTg4ZnRwOUlUbjVQRFVWS3A2UnorVUFUUGFDYTJjSTFQZERHaEpZ?=
 =?utf-8?B?c21CMzQwbm1OK1gxSDI0T0lMUGpUUGM4ZDdzVjY5VDdiYndiRndCTDRRRllY?=
 =?utf-8?B?SWJiZXN6Z2l5SG11Ni9ZTjVGaGMra2laUlhJeWk4ZnpFN2RRZ1Q2MWFMR09H?=
 =?utf-8?B?OGhyY0R5aFZhMlFkQkRpY0RpT3dIOWJpQkIwQlFKRVJzVXd2ZjE3elBpRUpZ?=
 =?utf-8?B?K2VwZnI4OUljN3BYd1BiZ1ZYbnZ6aTg0UTRvS0ZEaHdKVlQ5d2hyay81QXRr?=
 =?utf-8?B?WVcza3FYTjdIcVI4WXhac2JiUjhybUxUQnAzWlNzSCszNlVjUTU4NmQ2V0lB?=
 =?utf-8?B?YzVoWmtRMkZOUmpoU3YxWnRuemQxa3JxbXRvVUlGVGlyQmlJbnNjYmRYZHMv?=
 =?utf-8?B?VEE5SkMrZEhXWjZwZGozTXFhWm1od2lEdGNYek14UklwNHA5N1VIZ0hnMEZM?=
 =?utf-8?Q?Zf0ghug9js5GCJcDyVshLf1aU/n+WTt6BsxyDSD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53211130-1712-4679-703a-08d97c1f97e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 10:15:38.1682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4+o8SlPqPbeA9Z30KeQkfovlpwqPaj+ZMSXg0K1Ja33D5Z6r3HwRYbemAZvhDp5NgSqSgRqgkrOQ24zlYg4Ff8lipKo2VQNbz1xHas5maaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5432
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8yXSBkcml2ZXJzOiBjbGs6IHJlbmVzYXM6IHJ6ZzJsLWNwZzogQWRkIFNESEkgY2xr
DQo+IG11eCBzdXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBBdWcgNCwgMjAy
MSBhdCA4OjA4IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3Jv
dGU6DQo+ID4gQWRkIFNESEkgY2xrIG11eCBzdXBwb3J0IHRvIHNlbGVjdCBTREhJIGNsb2NrIGZy
b20gZGlmZmVyZW50IGNsb2NrDQo+ID4gc291cmNlcy4NCj4gPg0KPiA+IEFzIHBlciBIVyBtYW51
YWwsIGRpcmVjdCBjbG9jayBzd2l0Y2hpbmcgZnJvbSA1MzNNSHogdG8gNDAwTUh6IGFuZA0KPiA+
IHZpY2UgdmVyc2EgaXMgbm90IHJlY29tbWVuZGVkLiBTbyBhZGRlZCBzdXBwb3J0IGZvciBoYW5k
bGluZyB0aGlzIGluDQo+ID4gbXV4Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhh
a2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpn
MmwtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4g
QEAgLTU1LDYgKzU1LDE1IEBADQo+ID4gICNkZWZpbmUgR0VUX1JFR19TQU1QTExfQ0xLMSh2YWwp
ICAgICAgICgodmFsID4+IDIyKSAmIDB4ZmZmKQ0KPiA+ICAjZGVmaW5lIEdFVF9SRUdfU0FNUExM
X0NMSzIodmFsKSAgICAgICAoKHZhbCA+PiAxMikgJiAweGZmZikNCj4gPg0KPiA+ICtzdHJ1Y3Qg
c2RfaHdfZGF0YSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xrX2h3IGh3Ow0KPiA+ICsgICAgICAg
dTMyIGNvbmY7DQo+ID4gKyAgICAgICB1MzIgbXV4X2ZsYWdzOw0KPiANCj4gRG8geW91IG5lZWQg
bXV4X2ZsYWdzPyBPciBjYW4gdGhpcyBiZSBoYXJkY29kZWQgdG8gemVybz8NCg0KT0sgd2lsbCBo
YXJkY29kZWQgdG8gemVyby4NCg0KPiANCj4gPiArICAgICAgIHN0cnVjdCByemcybF9jcGdfcHJp
diAqcHJpdjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNkZWZpbmUgdG9fc2RfaHdfZGF0YShfaHcp
ICAgICBjb250YWluZXJfb2YoX2h3LCBzdHJ1Y3Qgc2RfaHdfZGF0YSwgaHcpDQo+ID4gKw0KPiA+
ICAvKioNCj4gPiAgICogc3RydWN0IHJ6ZzJsX2NwZ19wcml2IC0gQ2xvY2sgUHVsc2UgR2VuZXJh
dG9yIFByaXZhdGUgRGF0YQ0KPiA+ICAgKg0KPiA+IEBAIC0xNTAsNiArMTU5LDEwMCBAQCByemcy
bF9jcGdfbXV4X2Nsa19yZWdpc3Rlcihjb25zdCBzdHJ1Y3QNCj4gY3BnX2NvcmVfY2xrICpjb3Jl
LA0KPiA+ICAgICAgICAgcmV0dXJuIGNsa19ody0+Y2xrOw0KPiA+ICB9DQo+ID4NCj4gPiArc3Rh
dGljIGludCByemcybF9jcGdfc2RfY2xrX211eF9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3
ICpodywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0DQo+ID4gKypyZXEpIHsNCj4gPiArICAgICAgIHN0cnVj
dCBzZF9od19kYXRhICpod2RhdGEgPSB0b19zZF9od19kYXRhKGh3KTsNCj4gPiArDQo+ID4gKyAg
ICAgICByZXR1cm4gY2xrX211eF9kZXRlcm1pbmVfcmF0ZV9mbGFncyhodywgcmVxLA0KPiA+ICto
d2RhdGEtPm11eF9mbGFncyk7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnpnMmxfY3BnX3Nk
X2Nsa19tdXhfc2V0X3BhcmVudChzdHJ1Y3QgY2xrX2h3ICpodywgdTgNCj4gPiAraW5kZXgpIHsN
Cj4gPiArICAgICAgIHN0cnVjdCBzZF9od19kYXRhICpod2RhdGEgPSB0b19zZF9od19kYXRhKGh3
KTsNCj4gPiArICAgICAgIHN0cnVjdCByemcybF9jcGdfcHJpdiAqcHJpdiA9IGh3ZGF0YS0+cHJp
djsNCj4gPiArICAgICAgIHUzMiBvZmYgPSBHRVRfUkVHX09GRlNFVChod2RhdGEtPmNvbmYpOw0K
PiA+ICsgICAgICAgdTMyIHNoaWZ0ID0gR0VUX1NISUZUKGh3ZGF0YS0+Y29uZik7DQo+ID4gKyAg
ICAgICBjb25zdCB1MzIgY2xrX3NyY18yNjYgPSAyOw0KPiA+ICsgICAgICAgdTMyIGJpdG1hc2s7
DQo+ID4gKw0KPiA+ICsgICAgICAgLyoNCj4gPiArICAgICAgICAqIEFzIHBlciB0aGUgSFcgbWFu
dWFsLCB3ZSBzaG91bGQgbm90IGRpcmVjdGx5IHN3aXRjaCBmcm9tIDUzMw0KPiBNSHogdG8NCj4g
PiArICAgICAgICAqIDQwMCBNSHogYW5kIHZpY2UgdmVyc2EuIFRvIGNoYW5nZSB0aGUgc2V0dGlu
ZyBmcm9tIDLigJliMDEgKDUzMw0KPiBNSHopDQo+ID4gKyAgICAgICAgKiB0byAy4oCZYjEwICg0
MDAgTUh6KSBvciB2aWNlIHZlcnNhLCBTd2l0Y2ggdG8gMuKAmWIxMSAoMjY2IE1IeikNCj4gZmly
c3QsDQo+ID4gKyAgICAgICAgKiBhbmQgdGhlbiBzd2l0Y2ggdG8gdGhlIHRhcmdldCBzZXR0aW5n
ICgy4oCZYjAxICg1MzMgTUh6KSBvcg0KPiAy4oCZYjEwDQo+ID4gKyAgICAgICAgKiAoNDAwIE1I
eikpLg0KPiA+ICsgICAgICAgICogU2V0dGluZyBhIHZhbHVlIG9mICcwJyB0byB0aGUgU0VMX1NE
SEkwX1NFVCBvciBTRUxfU0RISTFfU0VUDQo+IGNsb2NrDQo+ID4gKyAgICAgICAgKiBzd2l0Y2hp
bmcgcmVnaXN0ZXIgaXMgcHJvaGliaXRlZC4NCj4gPiArICAgICAgICAqIFRoZSBjbG9jayBtdXgg
aGFzIDMgaW5wdXQgY2xvY2tzKDUzMyBNSHosNDAwIE1IeiwgYW5kIDI2Ng0KPiBNSHopLCBhbmQN
Cj4gPiArICAgICAgICAqIHRoZSBpbmRleCB0byB2YWx1ZSBtYXBwaW5nIGlzIGRvbmUgYnkgYWRk
aW5nIDEgdG8gdGhlIGluZGV4Lg0KPiA+ICsgICAgICAgICovDQo+ID4gKyAgICAgICBiaXRtYXNr
ID0gKEdFTk1BU0soR0VUX1dJRFRIKGh3ZGF0YS0+Y29uZikgLSAxLCAwKSA8PCBzaGlmdCkgPDwN
Cj4gMTY7DQo+ID4gKyAgICAgICBpZiAoaW5kZXggIT0gY2xrX3NyY18yNjYpDQo+ID4gKyAgICAg
ICAgICAgICAgIHdyaXRlbChiaXRtYXNrIHwgKChjbGtfc3JjXzI2NiArIDEpIDw8IHNoaWZ0KSwN
Cj4gPiArIHByaXYtPmJhc2UgKyBvZmYpOw0KPiANCj4gSSdtIHdvbmRlcmluZyBpZiB5b3Ugc2hv
dWxkIHBvbGwgKHVzaW5nIHJlYWRsX3BvbGxfdGltZW91dCgpKSB1bnRpbCB0aGUNCj4gQ1BHX0NM
S1NUQVRVUy5TRUxTREhJeF9TVFMgYml0IGlzIGNsZWFyZWQsIHRvIGluZGljYXRlIHN3aXRjaGlu
ZyBoYXMNCj4gY29tcGxldGVkPw0KDQpPSyB3aWxsIGNoZWNrIHRoaXMuDQoNCj4gDQo+ID4gKw0K
PiA+ICsgICAgICAgd3JpdGVsKGJpdG1hc2sgfCAoKGluZGV4ICsgMSkgPDwgc2hpZnQpLCBwcml2
LT5iYXNlICsgb2ZmKTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+
ICsNCj4gPiArc3RhdGljIHU4IHJ6ZzJsX2NwZ19zZF9jbGtfbXV4X2dldF9wYXJlbnQoc3RydWN0
IGNsa19odyAqaHcpIHsNCj4gPiArICAgICAgIHN0cnVjdCBzZF9od19kYXRhICpod2RhdGEgPSB0
b19zZF9od19kYXRhKGh3KTsNCj4gPiArICAgICAgIHN0cnVjdCByemcybF9jcGdfcHJpdiAqcHJp
diA9IGh3ZGF0YS0+cHJpdjsNCj4gPiArICAgICAgIHUzMiB2YWwgPSByZWFkbChwcml2LT5iYXNl
ICsgR0VUX1JFR19PRkZTRVQoaHdkYXRhLT5jb25mKSk7DQo+ID4gKw0KPiA+ICsgICAgICAgdmFs
ID4+PSBHRVRfU0hJRlQoaHdkYXRhLT5jb25mKTsNCj4gPiArICAgICAgIHZhbCAmPSBHRU5NQVNL
KEdFVF9XSURUSChod2RhdGEtPmNvbmYpIC0gMSwgMCk7DQo+ID4gKyAgICAgICBpZiAodmFsKQ0K
PiA+ICsgICAgICAgICAgICAgICB2YWwtLTsNCj4gPiArICAgICAgIGVsc2UNCj4gPiArICAgICAg
ICAgICAgICAgLyogUHJvaGliaXRlZCBjbGsgc291cmNlLCBjaGFuZ2UgaXQgdG8gNTMzIE1Ieihy
ZXNldA0KPiB2YWx1ZSkgKi8NCj4gPiArICAgICAgICAgICAgICAgcnpnMmxfY3BnX3NkX2Nsa19t
dXhfc2V0X3BhcmVudChodywgMCk7DQo+IA0KPiBQbGVhc2UgYWRkIGN1cmx5IGJyYWNlcyAodG8g
Ym90aCBicmFuY2hlcykuDQoNCk9LLg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQo+IA0KPiA+ICsNCj4g
PiArICAgICAgIHJldHVybiB2YWw7DQo+ID4gK30NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K
