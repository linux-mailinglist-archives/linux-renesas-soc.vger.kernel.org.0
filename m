Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00413F4997
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 13:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235405AbhHWLVa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 07:21:30 -0400
Received: from mail-eopbgr1410099.outbound.protection.outlook.com ([40.107.141.99]:18614
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235272AbhHWLV3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 07:21:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLxTb5mGTPicPVEetzri923y57uEyTuQQmVVvgj4v9pTixSfMbv0eeHtzVxwr2wxln9BUKS2ldHsbJxUkonSj0h2guPe5Png6FVDOqEJIQbuWwgsHjYNPuV3+gGvW2A0nEnS7vEtHNMc0ikxx+PHqwJObATdLmFegZXSybR5T57TwMPXKsqssVLPiLt3oJGHn5MXOGdey+2OgvqPNr9h9SVx6JYv//N2WbfFS2I5jr5BocNKfUWT5dnZtwqRMTzbt/U6eKV6WCRyYfd1jiy0isVrsYpM9L3Fxqgiv0tIaIaP1H27yzB+B1V7TPBW4w1Cc7ezwxaKeJGCkvEv4fkdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za4wsRA8fTZDLpq0vQYtKmbY+KwKlWeuU3vUixR0bHM=;
 b=WKirmgSwIw1A+VCb92xd9dzP0btq6/Md7K5OVF0SC+pr4vicI+fbn0AnBuKtLUoBmkD2K3c2Nr8NozgxqopNTDvftx2tidmOoraPXLF0ZB+AKtRWcqc9YbhoDM4BKDw9NZgbb60pb1+K7YZ1jYYDH1baQ+eaIXRn5oNlLDPXr5Wh2OAKtAAzCAtIVubKAEo6bv3PMNbHFSEdsNuvcdSb5uIngfr/7OcfZN66RGCaqnVV+fdwv/Vn44LqdZcB6iU0yRuauHKAZ+/Bj80flpXO+EHI/W3kM2+OVNtZPyVVhT+EKPlQV7JKyKD5wS6IdWiQfyJvTgJRETBSF62ek03LUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za4wsRA8fTZDLpq0vQYtKmbY+KwKlWeuU3vUixR0bHM=;
 b=gl9jVK1NcJLWKZhTCvHvy1qvRPitcFhz7/Q9KDoA9mlogY376f2YIWCdnoxoP8A6vu9AXoP6WD4bnrks5yn2LDhsBx30XkmJas+s3wfnN7adJxuFMQr99wQt2KzfFbUoorgWqExzW/FON7d1LtIUh1JqEcCSURrbIdZLcJocFFQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSYPR01MB5432.jpnprd01.prod.outlook.com (2603:1096:604:86::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 23 Aug
 2021 11:20:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e111:61:43af:3b98]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e111:61:43af:3b98%3]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 11:20:45 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle coupled
 clocks
Thread-Topic: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle
 coupled clocks
Thread-Index: AQHXkcCRmNECTeakTEKTkpDF65Tyd6t12IKQgAsRs4CAABOVMA==
Date:   Mon, 23 Aug 2021 11:20:45 +0000
Message-ID: <OS0PR01MB5922060F0A3FFD60F036C99A86C49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210815103014.21208-1-biju.das.jz@bp.renesas.com>
 <20210815103014.21208-4-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922B42107A6FB3191DECD1D86FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVvzoDKN4vSjDhg+gmee=x4XuVuP1LQRxzE1zgaTG+h1g@mail.gmail.com>
In-Reply-To: <CAMuHMdVvzoDKN4vSjDhg+gmee=x4XuVuP1LQRxzE1zgaTG+h1g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f98853ba-832e-472c-7aec-08d966280d69
x-ms-traffictypediagnostic: OSYPR01MB5432:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSYPR01MB5432A6C33A5A55108C0DDD3686C49@OSYPR01MB5432.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RrPLWski7VCepsBiilItzndGJ81+JFkxjbUFeAruGsu7YgYY4YC1qhH4Z9ObwxmKhXBOJQLYn9w3orw58UmZiqnGtv90lkXNNgaT+Hn47c6Ge4tHjcc+zZTc/mj5aCW3lBTJCfj0faXrsju1RKxY/REs/qgx/+qOgwZLRKsmrfSNZ/NH4D5HijASeaS5wdcxhQJAKAdDFDPcINPl280VUYKFCj2sQhNfRBEzX8k6YYVCwBRWCcjBwkr3FX9FV5SVg/1Gbdm7XfgPJmRTSTzw6wfeOzeUvl/MOpNDdCXHsWViKzaW91v1BDVr3NDOKWY+3nh1qqunwB5HBo0FEIGNzogrNlIGgYd2GwWSk8gh0/2xdEvgBEL/diLI2+SftQTfXYVYiamEEgXHa9NCUqZNLUmMPHOBntfloFiuKyuN2UTyYrWXpN/VPiPS5oxJrGCrppckMBpAXaJDpBWLhithanxpiZGTRacY3LWy+R+7QRL0ONUkZ8Nbk3xMGDyXWdSpKOKMcj0+LMV1J4elFkMe6F6F89MD9yhXBgENFXcQo84hmOj+Y6OeuxgVZtX/KOSDm9fwy86dzG/SbIOYZ7XB1oA6IlFyyY3v2Km22NrytKu5qcpwa1RdGS3yNtSGtNl1jIDG2RK/32SMsPI2kecEmREvgSPS0CWV81xvKzeciadUfPutfkiKnAjOXuEJXusq3SQkN7uyOWXItn5jlKiN/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(39850400004)(136003)(376002)(71200400001)(7696005)(53546011)(55016002)(6506007)(5660300002)(83380400001)(86362001)(38100700002)(2906002)(33656002)(8676002)(54906003)(6916009)(26005)(52536014)(316002)(122000001)(66446008)(76116006)(66476007)(66556008)(64756008)(4326008)(66946007)(107886003)(478600001)(9686003)(8936002)(186003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akl3UnlwSG8xSHowekJaN0orSU81cXZ4VkwvZXVXZW13eXRHL3V2U0hyenNH?=
 =?utf-8?B?eTBxMzZNNTFBNXZoN09kMmp6TmtRMWVEVUt5L1lrQXAvRzdCZE0vNVB6R1R2?=
 =?utf-8?B?WWVQeUIrSVFUcWxuTStCOEJJNmdFWVY1Nm5BR0oyM3RxT205KzZTSXBGWUNE?=
 =?utf-8?B?NUhUZVh2dTM2aVNxZjNsdFdwVkw2TGxDVHlBUmRDRmtBMk1KUENXMWZYR05F?=
 =?utf-8?B?TkljS0V1cjNlUVJwMnBuZ2pHenJZd1pMQnh2NnJVU3BKRTEvMGZ4NmJkMWVI?=
 =?utf-8?B?WXVKUlgwb2tTTGlhTG9XOFY3bTN0WUI0QXUyYnFaNUM3SXdZRjBObXZuWjc0?=
 =?utf-8?B?MXFYWkpaSktmbEN0aUJ1bEJUdTcvUCtpZTc2L2VVdXU4YW9laHprUjVKNi9l?=
 =?utf-8?B?a0RpSTlRdEljeExtcm9sOW0xWUxrRFpKVzNRSVJsUysxZWUwS0dKUko4YkZY?=
 =?utf-8?B?N2MvOTFvTktjTG5HQVcvKzgxcTg0ZHFKakk2clpSR0I2MTJaQWNrcU4ySVhI?=
 =?utf-8?B?ZHlPSmdraU1CSndzL1NCMnRTV0FVOGtEVzNQd0YwUGd3bGhOV3hCOWdXVEVX?=
 =?utf-8?B?UW9PT0YyemRHTys3OGxhSFZGbEJ2VlVzcmFJRWNVUHU4WVN2Y0NxWlRHbk9z?=
 =?utf-8?B?ZVBxaEJCdW5vRlZGTTdvQWN1TFE3QkV2YXpySXRodXo0cmNXWGF4ejZWb3NR?=
 =?utf-8?B?Z0xIQjhsYzVra3VQbUFOM0xVTFhYQkd5UFhTajhReEdoZ0NIUURwSnBreThK?=
 =?utf-8?B?T2t5ZnZsamFXamVqZnJQNldDTXRna1J5bG9nV2tUQWJkZ0JuNXFBOWlqa2Jv?=
 =?utf-8?B?TmtFcGc3cVNISm1nWDZWQU5GWXJZYndNdTFjSWxRT3E3N0RpbktlbHh1blpi?=
 =?utf-8?B?dFpYSzhKR0t5S3RDQjVYbGV4YlowajRwMTRMb245REJEUU5ESGhyN3QzZ0My?=
 =?utf-8?B?d1FUZ1k4VFdGTGhDN0poSjAzMkNVM3JLY2NXMDlJUzFQRUxmVTlhNWd5Z09Z?=
 =?utf-8?B?MFYzRndKaXh4YlJxanRIR2ZFblJxeDNIdjJ3djl2OTgxV3VVcWQwQnJQR2Vi?=
 =?utf-8?B?TklaRHgrem9GM2g3amFOVWJycTFEN1NQemtNaFpVVzQyd3BFM0EvS1VsQmpr?=
 =?utf-8?B?aXltZzE0dDFxd2Q5Nm02UmJTblBSOVFHMDdmdHl5VVBBRVpiNWtCcEllaVZC?=
 =?utf-8?B?MWdmUE1iWnE1UDI4SUc3blFzR2ZMN0w2aHpuYVljY1lFUVJ2d0l6NWtJbzZO?=
 =?utf-8?B?a25MQy91YUFRc1FFS2Rva1BFS1Mva3diUHppN01BdGtuSm43NXFJcVdETjJ6?=
 =?utf-8?B?YW5wWlZLMXAzWHJhL3liaW1BTmVMeFpQQXlIL0ZEaS95ZEx3Q1d0dDFXVU9B?=
 =?utf-8?B?eDdxZzRMRnpUdW83WC93VTBBci9HeFN6Zk5QRTJNTTF1U0JHdVd6QmVyVGxm?=
 =?utf-8?B?a3JBT0hOUW9uck9mV3JaTnhhZ2NiRkRZN1hTRG5ma3ROR1VybXM2T05LcWFa?=
 =?utf-8?B?NkMzQUovR3FaQXZqMk5HbDRPaWZ3dDBRWC9qTmhCaExMT0JieGJSYWRBd25p?=
 =?utf-8?B?dHh1dEZCbjYxYTNEVkZvRUhnVDRPdmoyRHBKMlpremJ4Wmc0S2lCcTh2dlZB?=
 =?utf-8?B?TXFZcVZ5TFpqOS9sU3hJSHgyRHFHTVF1UDZrcFpkamhRRzY1VVpMUUdWVDJU?=
 =?utf-8?B?VVl6T1RJVEx4SGtvL2k1bmZtRUxtL3lCYlBVRm4wVDRIa2k1cFBzNXNybXZD?=
 =?utf-8?Q?K8dZKDT1zWgfmGFkwE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f98853ba-832e-472c-7aec-08d966280d69
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 11:20:45.7595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMNnJ0NR0nYmok3jYKUruWmgFzyZ0JSfpqRf0v32mbl9MBoFxgQHDMVrks/qu/zRnFq2tnVsgPB6AIYvKRwaIVRW1YCL2lh/1R+QKofDsf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5432
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMy80XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCB0byBoYW5kbGUN
Cj4gY291cGxlZCBjbG9ja3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEF1ZyAxNiwg
MjAyMSBhdCAxMToyMyBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogW1BBVENIIHYzIDMvNF0gY2xrOiByZW5lc2FzOiByemcy
bDogQWRkIHN1cHBvcnQgdG8gaGFuZGxlDQo+ID4gPiBjb3VwbGVkIGNsb2Nrcw0KPiA+ID4NCj4g
PiA+IFRoZSBBWEkgYW5kIENISSBjbG9ja3MgdXNlIHRoZSBzYW1lIHJlZ2lzdGVyIGJpdCBmb3Ig
Y29udHJvbGxpbmcNCj4gPiA+IGNsb2NrIG91dHB1dC4gQWRkIGEgbmV3IGNsb2NrIHR5cGUgZm9y
IGNvdXBsZWQgY2xvY2tzLCB3aGljaCBzZXRzDQo+ID4gPiB0aGUgQ1BHX0NMS09OX0VUSC5DTEtb
MDFdX09OIGJpdCB3aGVuIGF0IGxlYXN0IG9uZSBjbG9jayBpcyBlbmFibGVkLA0KPiA+ID4gYW5k
IGNsZWFycyB0aGUgYml0IG9ubHkgd2hlbiBib3RoIGNsb2NrcyBhcmUgZGlzYWJsZWQuDQo+ID4g
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5l
c2FzL3J6ZzJsLWNwZy5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNw
Zy5jDQo+ID4gPiBAQCAtNDIzLDExICs0NTQsMzMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtf
b3BzIHJ6ZzJsX21vZF9jbG9ja19vcHMNCj4gPSB7DQo+ID4gPiAgICAgICAuaXNfZW5hYmxlZCA9
IHJ6ZzJsX21vZF9jbG9ja19pc19lbmFibGVkLCAgfTsNCj4gPiA+DQo+ID4gPiArc3RhdGljIHN0
cnVjdCBtc3RwX2Nsb2NrDQo+ID4gPiArKnJ6ZzJsX2NwZ19nZXRfc2libGluZ19jbGsoc3RydWN0
IG1zdHBfY2xvY2sgKmNsb2NrLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCByemcybF9jcGdfcHJpdiAqcHJpdikgew0KPiA+ID4gKyAgICAgc3RydWN0IG1zdHBfY2xvY2sg
KnNpYmxfY2xrID0gTlVMTDsNCj4gPiA+ICsgICAgIHN0cnVjdCBjbGtfaHcgKmh3Ow0KPiA+ID4g
KyAgICAgdW5zaWduZWQgaW50IGk7DQo+ID4gPiArDQo+ID4gPiArICAgICBmb3IgKGkgPSAwOyBp
IDwgcHJpdi0+bnVtX21vZF9jbGtzOyBpKyspIHsNCj4gPiA+ICsgICAgICAgICAgICAgaWYgKHBy
aXYtPmNsa3NbcHJpdi0+bnVtX2NvcmVfY2xrcyArIGldID09IEVSUl9QVFIoLQ0KPiBFTk9FTlQp
KQ0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ID4gKw0KPiA+ID4g
KyAgICAgICAgICAgICBodyA9IF9fY2xrX2dldF9odyhwcml2LT5jbGtzW3ByaXYtPm51bV9jb3Jl
X2Nsa3MgKyBpXSk7DQo+ID4gPiArICAgICAgICAgICAgIHNpYmxfY2xrID0gdG9fbW9kX2Nsb2Nr
KGh3KTsNCj4gPiA+ICsgICAgICAgICAgICAgaWYgKGNsb2NrLT5vZmYgPT0gc2libF9jbGstPm9m
ZiAmJiBjbG9jay0+Yml0ID09DQo+ID4gPiArIHNpYmxfY2xrLQ0KPiA+ID4gPmJpdCkNCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPg0KPiA+IEp1c3QgZm91bmQgZHVyaW5n
IHRlc3RpbmcsIGluc3RlYWQgb2YgImJyZWFrIiB3ZSBzaG91bGQgcmV0dXJuDQo+ID4gc2libF9j
bGs7IE90aGVyd2lzZSBmb3IgdGhlIGZpcnN0IGNsb2NrLCBpdCBnZXRzIGEgd3Jvbmcgc2libGlu
Z3MsDQo+ID4gV2hpY2ggd2lsbCBiZSBvdmVycmlkZGVuIHdpdGggY29ycmVjdCBzaWJsaW5ncyBk
dXJpbmcgcmVnaXN0cmF0aW9uIG9mDQo+ID4gb3RoZXIgY291cGxlZCBjbG9jay4NCj4gDQo+IElu
ZGVlZC4NCj4gDQo+ID4gQ3VycmVudGx5IGl0IGdldHMgaW50byB0aGUgbG9vcCA0ICo5NyA9IDM4
OCB0aW1lcyBkdXJpbmcgcmVnaXN0cmF0aW9uDQo+IGFuZCB0aGUgZXh0cmEgbWVtb3J5IGlzIDk3
KnNpemVvZihtc3RwKikgYnl0ZXMuDQo+ID4gVGhpcyBzb2x1dGlvbiBzaW1wbGVyIGFuZCBuZWF0
ZXIuDQo+ID4NCj4gPiBCdXQgbm90IHN1cmUgd2Ugc2hvdWxkIG9wdGltaXplIHRoaXMgYnkgYWRk
aW5nIGFsbCB0aGUgY291cGxlZCBjbG9ja3MNCj4gPiBpbnRvIHByaXYgc3RydWN0dXJlICg0ICog
c2l6ZW9mKG1zdHAqKSBieXRlcyArIDQqIGVuYWJsZWQgZmxhZ3MgKyA0Kg0KPiA+IGxpbmsgcG9p
bnRlcikgPyBhbmQgYXQgcnVuIHRpbWUgZW5hYmxlL2Rpc2FibGUgd2lsbCBnbyB0aHJvdWdoIHRo
aXMNCj4gPiBsaXN0LCBmaW5kIHRoZSBjbG9jayBhbmQgY291cGxlZCBjbGsgYW5kIGJhc2VkIG9u
IGNvdXBsZWQgY2xrJ3MgZW5hYmxlDQo+ID4gc3RhdHVzIGl0IHdpbGwgc2V0IGNsaydzIGVuYWJs
ZWQgc3RhdHVzIGFuZCBzZXQgaGFyZHdhcmUgY2xvY2sNCj4gPg0KPiA+IEluIHRoYXQgY2FzZSBy
emcybF9tb2RfY2xvY2tfaXNfZW5hYmxlZCB3aWxsIGFsc28gbmVlZCB0byBmaW5kIHRoZQ0KPiA+
IGNsb2NrIGZyb20gdGhhdCBsaXN0IGFuZCByZXR1cm4gc29mdCBlbmFibGVkIHN0YXR1cyBmcm9t
IHByaXYgc3RydWN0dXJlLg0KPiA+DQo+ID4gQnV0IHRoaXMgc29sdXRpb24gaGFzIHJ1bnRpbWUg
b3ZlcmhlYWQgb2YgZmluZGluZyBjbGsgYW5kIGNvdXBsZWQgY2xrDQo+ID4gZnJvbSB0aGUgcHJp
diBzdHJ1Y3R1cmUNCj4gDQo+IFllYWgsIHRoYXQgc2hvdWxkIGJlIHNsb3dlciwgZHVlIHRvIHRo
ZSBsb29rLXVwIG92ZXJoZWFkLg0KDQpPSy4NCg0KPiANCj4gQXMgYW4gYWx0ZXJuYXRpdmUgdG8g
dGhlIHNpYmxpbmcgcG9pbnRlciwgeW91IGNvdWxkIHN0b3JlIGEgcG9pbnRlciB0byBhDQo+IHNo
YXJlZCBhdG9taWNfdCBjb3VudGVyLCBhbmQgdXNlIGF0b21pY197aW5jLGRlY31fcmV0dXJuKCku
DQo+IFRoYXQgcmVxdWlyZXMgZXh0cmEgc3RvcmFnZSAob25lIGF0b21pY190IHBlciBjb3VwbGVk
IGNsb2NrKSwgYW5kIGF2b2lkcw0KPiB0YWtpbmcgdGhlIHNwaW5sb2NrLiAgQnV0IHlvdSBoYXZl
IHRvIHRha2UgdGhlIHNwaW5sb2NrIGxhdGVyIGFueXdheSwgZm9yDQo+IGNoYW5naW5nIHRoZSBj
bG9jayBiaXRzLCBhbmQgeW91IHN0aWxsIG5lZWQgdG8gc3RvcmUgdGhlIHBlci1jbG9jayAic29m
dCINCj4gZW5hYmxlIGZsYWcuDQoNCkFncmVlZC4gTG9va3MgdGhlIGN1cnJlbnQgc29sdXRpb24g
aXMgYmV0dGVyLiBTbyBJIHdpbGwgc3RpY2sgd2l0aCBjdXJyZW50IG9uZQ0KQW5kIHdpbGwgcG9z
dCBWNCBiYXNlZCBvbiBwcmV2aW91cyBjb21tZW50cy4NCg0KUmVnYXJkcywNCkJpanUNCg==
