Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD5F3B4621
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 16:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhFYOxA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 10:53:00 -0400
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:20211
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229653AbhFYOw7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 10:52:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6JhvnUcaxxlLUOetjFadXXM4sl9JgQvEkSPg2o0zM0BtoBoxeQn4w4pd+CrBdGrtLV2sNTdy+TZ0PKts4eowm7qSMuw3DJgp20ZTPG57eTASxhZ5QKDiDVOsqI750900M5Ta4V/Ipm4vD579+fYvyCBZVf3cvmXOnxauRsPZtlIEuWgtCPA6jPCqYuzusPSqeNCQ9SHBcBeI/tju0T6yWmvq/Is1tmuny1oUsqDjfljqDDHrNCoPXLF6egigDaCZkAlkYKX5p4JMM0fqgEOCTNIlPFZnIZM3jm+atUaBQmT1EeEQ+5lFW4KM9F/dY/kdSKEn95gK2nYsyGchAF6uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9Sxof3jG5Rhc37JUGv/GqAQfrwrZASX2Xggle59PSY=;
 b=A2uzLH8XDXt6ET+Olnqk6m2VvgK04JGREAiCCbSX4zd8067jEA1DTrxthZe81AqEl8toeqJJLE6ojBjJt3ZjxRClySazEsox8xBfep4sJMnm9AiEsYIplMN4uSyJuejN1jHpH7JOscgIbxsZRPRTI2H70RUuBPEAw4SHwt+qyHIEDiLqceU9PwZ+gMq+79/FXOLNvsjb4jjxS+C+Q3597AbjwUIy71fmHNYPXqsU/2G01QG7yRkZFvUtCNHQSONc9mkjdk3idrThpAzHqWZ7GWZxnlDMorONwim84m3F8SOXHP0fA1t+SeVAE7IIgoL1D38/QncUsgDFYoXJkv4g0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9Sxof3jG5Rhc37JUGv/GqAQfrwrZASX2Xggle59PSY=;
 b=a+Xgrs+bF1X0YMPI9YX+mz7x/uYCjHjv7xv5wauQ1OJG5jrxMh97GjKDnX4Wwf9Tq21elQAZRBUdk9edQ6NMunlItBQy2k+oxvu6n0BQ6cJPPLbz3nGod6SiON/+BpKltzvjGNNHr58LnlRhFxSTIyLR7i/RUHLt5RvIdJDOfPo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2803.jpnprd01.prod.outlook.com (2603:1096:604::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16; Fri, 25 Jun 2021 14:50:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 14:50:34 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 06/11] drivers: clk: renesas: renesas-rzg2l-cpg:
 Separate reset from module clocks
Thread-Topic: [PATCH v2 06/11] drivers: clk: renesas: renesas-rzg2l-cpg:
 Separate reset from module clocks
Thread-Index: AQHXaPlELICz91C9b0WAVIYORMZpuaskzsyAgAAB1GA=
Date:   Fri, 25 Jun 2021 14:50:34 +0000
Message-ID: <OS0PR01MB59227FBD89B9F5667C05D1AE86069@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
 <20210624130240.17468-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdWLdDoL++e7qerjEoO3NtqdoxxN4zoa4XJ9Xy1EoZKVNw@mail.gmail.com>
In-Reply-To: <CAMuHMdWLdDoL++e7qerjEoO3NtqdoxxN4zoa4XJ9Xy1EoZKVNw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccefb5f3-368a-4e9e-2768-08d937e8966c
x-ms-traffictypediagnostic: OSAPR01MB2803:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB280363A29ED2CC531CA8524B86069@OSAPR01MB2803.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o6FBFckGxKK+34F+i04IVITha4PW1VGvDZuz1p/J6WlOlNrcnSIQGK+4e8oBF2Qyzsevp2iEXMY3EsXJlY1NJfcUQBZMyPO+dfRNy1POMAdrfmPADrLOwcayr88bc+k+aCXIoHb078XA5Pc/XdzvWe2zoA1okVOpf61dWjueC5n9JP9PxZujo+/SwM2+7niSTuRIavp7vhYFGysfW1XeEKLin4izufQiTinJ1St6Xql5RBSGFCmISSwazNa6VSqd2KQ8J9YwbQjQ6VrySiBMFUjdOQGvJZ+GDXySNXf76dU+UEx0IniT7L6d2ZAQerpwcEpFNwMyWHEMl/+wh3kKrFvwDZP2PAGQq4+amQCCRH0g40p9dn0xcxE964ItnKU/3Gi3cvVZ8BgLLvBk4zJdHR3k+kCVvZsFoeoR3KNArFHk//Kr/nQUjsG8GYoVahre/spGcCW71BblZFuiz7b+crpq4VHbkgu3N9vWN595ejWRvVfjHKHIId7MEeuqsoqGZSWhdPE/EDA9xfDDt/0YxGJ5rE+bg7Z2lkjj6/vlDxYcH1k49Y0tJaQZ8L/Kjnn47abVQW9yg1/bpW0yPCnRWzldFc5ZxPKPsrF3VlNOlJc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39830400003)(136003)(396003)(366004)(316002)(4326008)(122000001)(6916009)(478600001)(2906002)(71200400001)(8676002)(66556008)(66946007)(76116006)(9686003)(26005)(52536014)(66476007)(33656002)(53546011)(38100700002)(64756008)(55016002)(186003)(66446008)(5660300002)(8936002)(83380400001)(86362001)(54906003)(7696005)(6506007)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUFIelBVNThmN1ZKdW54NmZCejI5dWM0MjNpUWsyNk4vRVNLVVdRbDg1Y2hv?=
 =?utf-8?B?cmNxZWFvOVdLRGgyQ015TkF5V213dXE4RzM1Uk9rRGplL3dZUTNmcWJQaEU5?=
 =?utf-8?B?WHlEZVdOVE5IUTVpT0ZZcnNWRVY5NERKaTRjTEJ3SXFSUXI0ZHViL3pTc3hI?=
 =?utf-8?B?bDhTTWxGR3pkbTA5K3dmSXdtWEZxQXhCaXZzcTVlalBzdksvR01HRk92ZlNC?=
 =?utf-8?B?WUJ3cUJRYXFpTDBLbTRxVm1Ca250UW9hODRoUlBoZ0tIaUs4Nzl3eEYxcUJ0?=
 =?utf-8?B?d2plc3lTNVF5eGs5RTI1SFRyS0cwcFdUOEpjODZFVG90bGxHV2NpeHdUMWpu?=
 =?utf-8?B?Mnl4L1NSajFqb1FSZ1hZTitvYlo1QSswYVB3ZGluTnZITWpscXArLzBURU5w?=
 =?utf-8?B?ekZGQ2F4UGlXMDlWaSt5Q1lnazduK2JsYXQwclpKaWorMysybUhlcTJPRnNh?=
 =?utf-8?B?ZVhVdkoyeEJ0ZEFUNkJtaUNmMUd0WDRjMjFlQ1hqemF6OW5uL1ExcXJacTht?=
 =?utf-8?B?Z280ZzAzcE02Q3JDOE5RN3M4T3JNUm95MVhIZnM4bHNwL0tsQU5jOWVqNGhE?=
 =?utf-8?B?aGhCN1AwQ2s3T3IxRllhb1dpc3ZNbTlIKzZmNjlvK1h5ZXlDTlB5aGhWZEdl?=
 =?utf-8?B?TnhPWnFNV3RKVE0rVitWR1RSblk5SHRtSXFOV2RKSjdkMTk2N0dwT3FZbVF5?=
 =?utf-8?B?c0FwSzl3Q05rdTZ5TW1Wck5LVnIwNHNoZlpTaW9DZDNFbmUvNlhFUG1lVGtT?=
 =?utf-8?B?T2IzdEdjT0xlTk9OT1RXcVpNK05JNUlnelZmbjkxV0ZVVStweDJtQmFpZzNK?=
 =?utf-8?B?akdoNFhLcnpxN0p3ZUVXM0F4by9ndmVyTDl4SzIzY2oyZll0VmFEcWNjRjF5?=
 =?utf-8?B?b0lyMmhnU0swSXB5SGI4czJBak16Wk80dmN3VVVsVUkrQ3ZrV3VDcDVZNENM?=
 =?utf-8?B?WUVvMGxXUWltZ1pxR0pEUk91aG1nSDJzazhtK09CSmZiSmFYSmk4SU1HOHJr?=
 =?utf-8?B?TlUwdGprUDVEd0ZWTFJ2Zks1QVNJT2dlR21vVTVRV01jSGg0cGJLVmJvaU1U?=
 =?utf-8?B?QS9lN0ZzQitmMUdVbDdoVGlremVoRVpZSnNyOVdzWEQ2Uk1POWkwS3IxQXF3?=
 =?utf-8?B?bmtNSDJIbWwwZGtkdWZRYjRWdERZRzJwdkV6d0orczZLZjg4bHFyY1VnSkdh?=
 =?utf-8?B?UUYrTm5keDdWSDNqUXppYnk1YjJHM2RNK3ZlNmhMOEhURjB3ZlFpWG0yblJm?=
 =?utf-8?B?RmdzZlVITzhWREM0QjRKdCs0MDFXOWY2cXg0R0U2Qkp6Z0MwWEhQcG03Q3pE?=
 =?utf-8?B?RjBxOU5nQkYyc3FnOW0xVm9JREc0TUZFUWhUYkdRaytDYnMwSUhwYW4vZFJT?=
 =?utf-8?B?TlFkRXBQQnRQODVSczBxVHFkN0gvNStUcEpXaERrL0F3SE1ia051YmlYVTJZ?=
 =?utf-8?B?MTZHUHFuV0dVeUgvZ2lSZUVocWxSbzFHV215ZFJnRHBXYytNcjFraXNXLzVT?=
 =?utf-8?B?aXJFUi83QUxIQlpyWjZYU08zek40TjJNa3Z1YVYxeW9SR1lFUWtyZkcvOXRl?=
 =?utf-8?B?REoreVpRKzlBTURLNXVQem8ydlhOQTExTHBQUU5XR1Z4ei9WVVFjNmU1UGF5?=
 =?utf-8?B?Z01yaDRYeE14QmRrcG1zUlVlZ2pwQUwxaFBOOGNpWDJuZEJWUXJjd0pJK3kr?=
 =?utf-8?B?WUl1dnpJU09wMWViTndISlpFUkNXcUpyVG9oeDNhU3lXNWRJaGxHb0tBSW5u?=
 =?utf-8?Q?lv4UUADu49CgM6/DWWMpYd1qGOEsV0fp2U8VqEW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccefb5f3-368a-4e9e-2768-08d937e8966c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 14:50:34.3842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bGdKAd1bGmkcwJhdUB5kYElWkvIeAFoDK3wLFmhz+hfZrE57fyYOXnvVa6br8l7v/sgZDFFYOx6Q7/luGTue9QNc+fAbzXyMwZ0YYYcHpKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2803
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMDYvMTFdIGRyaXZlcnM6IGNsazogcmVuZXNhczogcmVuZXNhcy1yemcybC1jcGc6
DQo+IFNlcGFyYXRlIHJlc2V0IGZyb20gbW9kdWxlIGNsb2Nrcw0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IE9uIFRodSwgSnVuIDI0LCAyMDIxIGF0IDM6MDMgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBSWi9HMkwgU29DJ3MgaGF2ZSBkaWZmZXJl
bnQgZGVmaW5pdGlvbnMgZm9yIGNsb2NrIGFuZCByZXNldC4NCj4gPiBTZXBhcmF0ZSByZXNldCBm
cm9tIG1vZHVsZSBjbG9ja3MgaW4gb3JkZXIgdG8gaGFuZGxlIGl0IGVmZmljaWVudGx5Lg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQu
cmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+
IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcmVuZXNhcy1yemcybC1jcGcuaA0KPiA+ICsrKyBi
L2RyaXZlcnMvY2xrL3JlbmVzYXMvcmVuZXNhcy1yemcybC1jcGcuaA0KPiA+IEBAIC05OSw2ICs5
OSwyNiBAQCBzdHJ1Y3QgcnpnMmxfbW9kX2NsayB7DQo+ID4gICAgICAgICAgICAgICAgIC5yZXNl
dCA9IChfcmVzZXQpIFwNCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICsvKioNCj4gPiArICogc3Ry
dWN0IHJ6ZzJsX3Jlc2V0IC0gUmVzZXQgZGVmaW5pdGlvbnMNCj4gPiArICoNCj4gPiArICogQGlk
OiByZXNldCBpbmRleCBpbiBhcnJheSBjb250YWluaW5nIGFsbCByZXNldHMNCj4gPiArICogQG9m
ZjogcmVnaXN0ZXIgb2Zmc2V0DQo+ID4gKyAqIEByZXNldDogcmVzZXQgYml0cw0KPiANCj4gYml0
DQoNCk9LLiBXaWxsIGZpeCBpdC4NCg0KPiA+ICsgKi8NCj4gPiArc3RydWN0IHJ6ZzJsX3Jlc2V0
IHsNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCBpZDsNCj4gDQo+IERvIHlvdSBuZWVkIHRoaXMg
ZmllbGQ/IEl0IHNlZW1zIHRvIGJlIHNldCBvbmx5Lg0KDQpPSywgbm90IHJlcXVpcmVkLg0KDQpS
ZWdhcmRzLA0KQmlqdQ0KDQo+IA0KPiA+ICsgICAgICAgdTE2IG9mZjsNCj4gPiArICAgICAgIHU4
IHJlc2V0Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArI2RlZmluZSBERUZfUlNUKF9pZCwgX29mZiwg
X3Jlc2V0KSAgICAgXA0KPiA+ICsgICAgICAgW19pZF0gPSB7IFwNCj4gPiArICAgICAgICAgICAg
ICAgLmlkID0gX2lkLCBcDQo+ID4gKyAgICAgICAgICAgICAgIC5vZmYgPSAoX29mZiksIFwNCj4g
PiArICAgICAgICAgICAgICAgLnJlc2V0ID0gKF9yZXNldCkgXA0KPiA+ICsgICAgICAgfQ0KPiAN
Cj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
