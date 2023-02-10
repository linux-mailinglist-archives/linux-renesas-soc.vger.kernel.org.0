Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96C8E69262D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 20:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbjBJTTI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 14:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233216AbjBJTTH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 14:19:07 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2131.outbound.protection.outlook.com [40.107.117.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490AA7DD0D;
        Fri, 10 Feb 2023 11:18:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJm33m6+41nBT8ufe4g7PJrGfdp33eSutCeZRYXsSahoZW+//BS9wUbwnhwshJ98KwLDSz7LNqA0v0vDppR9yJ+LaGiCyDVavksF78WcQHqjj8QRbhbfzZO58NAA1ulF56HyfAgmXMpZYU/fbUBkv2vUi5xt55CixTk864BhR/DkWOkDRvop5PtX7OsaeWJm1BnYvNaSYzZxlcfL7eBUKjz2se4UnzWj51y32qBvzSjLNlRhDpZFGcFk68wV+KxDntnY21RaVBqARQJmO1MuYFHu1hg4Wr9JXmHizxUD3sl2NsBEimAYorPrWMpGr83unDbs0dOpI0/jyMRLvLVtLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhSqZ+Og1W3kBdQm81n47RPMMJiDePoY3q+qWmB+fgk=;
 b=Y+U1Rg4kLh124SC4gwl9f2O8Zc38LSXca+2KiHtWnMXWLfIaDN1DHQSJL4uGG9is9jZt08F2+18amQgNa4AogVuwWOuQH3xlecOEgfqjeKORhJdKy0+Hxyr+gruGWu2A9qsnmursdvzyysUCy0Dbd29MGbQjHzMZAjcaigLHLRRqGWs4zQnaw5Vr40tvF1D1fAzubCKH7Zoymp0j8CtPTG4XbMC5Rve4cCg1oZrFaNfefUDnrho3X1LBs5dfUQ6pnaqqXowlGr+1eQng+rA80nHoBZaHPA1y80i1RFncQxWV2NtFNomxj44V1tUfNyW//cWFwyKsPQ7u6MUP/JRrBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhSqZ+Og1W3kBdQm81n47RPMMJiDePoY3q+qWmB+fgk=;
 b=spvUsPFRmkvij6RyIdIDdNv9QyK2tFFBRGWedjO4DHAnhj23krshBeWAUeML/7gAWejd1HO3zSWK8wJ+wpqBRr8HDd2Fm9Wkd9Aoi5B4n+hf97VCcGjAniUglYt8eNk/8O8MEslRsY6L8SVUQvbInGCw5rvrYsdYUD6XisLtOoU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11141.jpnprd01.prod.outlook.com (2603:1096:400:3bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 19:18:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 19:18:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] serial: 8250_em: Use dev_err_probe()
Thread-Topic: [PATCH v2 1/3] serial: 8250_em: Use dev_err_probe()
Thread-Index: AQHZPWYy7cIdVTnOGki2eV67b0hyXa7Ig0aAgAAKnnA=
Date:   Fri, 10 Feb 2023 19:18:52 +0000
Message-ID: <OS0PR01MB592243774D29EE3731AA291386DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com>
 <20230210154140.338352-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUhzBj88AkZ_DR5mzbPKYX2eRH7wvFAn8zF_nq2ytCaJQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUhzBj88AkZ_DR5mzbPKYX2eRH7wvFAn8zF_nq2ytCaJQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11141:EE_
x-ms-office365-filtering-correlation-id: dffce8ab-f214-4aea-649e-08db0b9ba551
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zNAsAnaVUlSZZAASqnO9sqWoAlaoT8N9H0mf738VIO8i/Y7M1WXNwiidB/+bJ4rqETNiDECVAo3dLX8Xkc38d6wK5DsGwMiUs9BlrM8Gr7F5U0VTXlbJyjO4m+ZuBnENqoIaC9GhVFe4Aqt3KuR/YIEe7JLFkosT26U8ZDC8FxbMBBSRMlrynC/QfVl1r4UIlJhqIENBitMvssOv9gxNK3OwhC8xFjoC55XwDhnYjKl9v4WAlsBd0XNFKqitmoRhPA9lj9SEmrp2RK9RzuY8RfYdazpxWGT5A1qqgN9P25RRD55ulvmVhEQFOOPNE3PQtgrdIGoav6vyG24JLaU2/saB6sx/x7GQ6ib9Lrsyivl0TXO5YeW0hlxdZkp6y2aKzFonMFl0KBbwhUY52L1wl9nqxbIAaMLfpwOMRGcFdrqFR+6Yw3b9QIFXXm9hY9FoYsj2EbW8yuuNOpBNoFXYIotZhz6IS8L7bk3f9ZYAtSF8jfLoil58PC/onZnFS6HsN6AH14J2kAuiaGCg2V1yOJj1JQ0iGYsDT65+Z4xzE32qJ6olv3r39E5F7MIkpB7by33Kl6qpP7Q1ZbsJECgjonLMbGpWsnUOFe/1YTNZZLJW/VkoAdHF4wlTSg3O3IE4HHPrwRW/nD+N9Q7t7+FIb4A1UAlalqlmr3d3dRJInQfVJk3jej4FXRC2rA51HEVenJafGvIMD4BlMJp6/d0Etg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(71200400001)(7696005)(478600001)(83380400001)(55016003)(38070700005)(86362001)(33656002)(122000001)(38100700002)(53546011)(6506007)(9686003)(54906003)(41300700001)(8936002)(52536014)(316002)(64756008)(6916009)(8676002)(4326008)(186003)(26005)(5660300002)(2906002)(76116006)(66446008)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWFRL0tOczA3ZUh0enZzZTk2c0w4RitVM3JVQ09ESzVVRHhRN25UQXNmck4y?=
 =?utf-8?B?VWl2L0VyTE5aTnRrMEp0Sm1OUGc2RDRpZExnRmtFcnBDUnd5Vnlmci9BZ0lz?=
 =?utf-8?B?M0pDMjZ4WHFWenM5MEhLSzYvcC9CTkZFZmJJY2JNdEp0YVlVUUNsVUJZMXI2?=
 =?utf-8?B?R2ZTbHo0MjFOVWxLZnlvVjljUzU2cXBwbGNpNC9GaTFMU292Qnp6dmN4dWRO?=
 =?utf-8?B?WTB2RGNqUTNpWHFWb0lQSFEvRjhnQ1UvbWVQV2pHZ2JaeXNHekt5OGRxa0tV?=
 =?utf-8?B?d3FSR25YRUx5N2RiZnU1QWQwNnlHZWNubjFnOUhRbGVwUktNNTVtQlJhd3BV?=
 =?utf-8?B?V1YwZ0xWa0x2SVVpNEpGcUpjZVlsV3FzeURkbkxtRXB3T1FvdnFHR3VBN1FN?=
 =?utf-8?B?V2hSd1NBU2ZySk45K2pLbURGNEN2aWxPM2pxdUhGK0QvMUZEL0F0QjRwbDZM?=
 =?utf-8?B?WTIzUVltdVZHSGVacFBUaElNdXRMR1BoSXd4cDh1a1FEY0hteU1iMmNXMU5Z?=
 =?utf-8?B?UTQ3azFyMUU4VFZVd1QxelVhOTh4d0FYU2tENmwwam5tQ2tuSnk3dXlIb3dN?=
 =?utf-8?B?cXB0SHNrdFJTVUZUQ3dScllIWk9FTHJYSDRKM0hCVGszYVhlOWRKVnRtZnIw?=
 =?utf-8?B?MVFud3lHUDc0S3ZUdmk4WW5DT1Q2OERNbU41cXAvSURpUnBHMHNyK1lpRWtD?=
 =?utf-8?B?Q1VyOUtBeGZWOXFJM24zNUVYU3VTQzlHQ3Y3cWxFWE12QkM1K1loMk5WVXhx?=
 =?utf-8?B?dVowbCt5YkF5dXhyZUVoV295RHJYSW8rekxXR1pIZExZMEpiOHVFY3NuekpP?=
 =?utf-8?B?TUtrVXkvb3E3M1hmZVRTUnhraWRSc0p3TjNyT3RnYWhWOFgyUUJjQXdWaFQ5?=
 =?utf-8?B?U0liOTEvZjdCZEVlR3loMGdXTnUzSEpHOFByZFBNK0U1cUFqaEx0M0RFQmlz?=
 =?utf-8?B?ZTJZalVRbGRiNWVyM3JLa3NicFcxdndPRS9sQW5HWi9sWW1lWHFjeFlVckVN?=
 =?utf-8?B?VWZJMW53UFNDNTkxaE1oazJNTVkwTHVObTZBcGpLMm5HRUVSa1RSQzVVUjE1?=
 =?utf-8?B?TXBtckYyaW54N3JjYll5K1BHK1NVeUVFQjFtWmIxcnk1ZlZqZUp0byt1NVAz?=
 =?utf-8?B?N3JvU09EMC9DcEo3Z0ZWVUpKbzd1QUkvczdXTFFpSzhVWVdjUTcrRnllMm9o?=
 =?utf-8?B?RlNGbFBvckNpVklEN2NmUEhkNXNBSEJGb0dRRXNXQnRiSEQzUW1Ja2lqL1Fn?=
 =?utf-8?B?SXlwMnQ3NDNXcjdNdVh4MUJndE4wbjcvVWRvaTlYZjYvNTFOMWdWOElhY1Fs?=
 =?utf-8?B?Y2ZSSktCNEZ4NVpYcFo1dFFHay9oYjUxaHEwSEVkMHZaa0dXVEFKUjMxTkZs?=
 =?utf-8?B?Tm92WnVsYUdTRit2Sk53dThkdFVwTmprK3BOUlpFY2k2QnRWVEhsWE9Ya3lq?=
 =?utf-8?B?WU5CMExlNmR4RlVyTGxxT2kvUXdQT2E3SEY3azFkNUFhN1hkRHlLdjhzL1pv?=
 =?utf-8?B?QzI0U2NDRVV1ai82Y0tnYUZkNU1nbXdEd1JHeUt5dVdqNFhGbWVEUE85L1dh?=
 =?utf-8?B?Z3p1ckY0Ny8wRzdiK0J1TEJkSlM4R1AyejNRc3ZIVnFJZ0RlZW80UFIrbVFJ?=
 =?utf-8?B?SmZpbUZzaldzUEQwWVBReVQ4c2E2dkUxektILzFCdm0rZmJYR0N0RCtRRm94?=
 =?utf-8?B?UzJ2bC9vbUp1cjU4SWQxY0drRXV6K0xEeVEwM1RTeFpJaE1rQlVGeUFmaExu?=
 =?utf-8?B?VUx1NmZqSEUxY1lSVkdKcWhhTWZVKzkwS3E0a0dDT2NJdTRBWUJwTXF6Zk15?=
 =?utf-8?B?b3B0M0J0ZGFsQzdLQ0JiSWQ4d25WSlRlV2xGeThLYndlcTRsUU1mc3RxclYx?=
 =?utf-8?B?Wk1DeEFZMHZubExKUXRBbHJYbnA4YjBqaHBRUS9vZ0JEdmRKMm9rZlp2UEJC?=
 =?utf-8?B?anI4dklvWTNLT0RYVDJOQVQyR1c4cmpzQmdoK0pZdVYyVjhqY2kyNk5Kb1JE?=
 =?utf-8?B?TU9hYjVIYUNhTTFwM1lNRHZFSytuTjJEQjBxWnNyc2lJK0J2bUZiSE92eTcr?=
 =?utf-8?B?VHhHbVNBMVFLVTl3ZUNDNHIvV1FDKzZ3Rm5RNk42cXdEQTc3cU5nb1N4cU4y?=
 =?utf-8?B?QWY5T002elJ6d2Y4S3RPUjRxczAvQ0RVNG14SlpEeGQydnlPQWViY3dlaDdG?=
 =?utf-8?B?T2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dffce8ab-f214-4aea-649e-08db0b9ba551
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 19:18:52.4155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f59IQgxcg6u1zkyE/tkD8j8BI31AfotOYcIcyoNWoq4pcEJF/9Grmep1VavIpODzpidETwKfpBm1lQE+AFjeo05Xdv9kOOjXPAZncrXRf9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11141
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTAsIDIwMjMgNjo0MCBQTQ0KPiBUbzog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogR3JlZyBLcm9haC1I
YXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IEppcmkgU2xhYnkNCj4gPGppcmlz
bGFieUBrZXJuZWwub3JnPjsgbGludXgtc2VyaWFsQHZnZXIua2VybmVsLm9yZzsgRmFicml6aW8g
Q2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBsaW51eC1yZW5lc2Fz
LXNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzNdIHNlcmlh
bDogODI1MF9lbTogVXNlIGRldl9lcnJfcHJvYmUoKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9u
IEZyaSwgRmViIDEwLCAyMDIzIGF0IDQ6NDEgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHNpbXBsaWZpZXMgcHJvYmUoKSBmdW5j
dGlvbiBieSB1c2luZyBkZXZfZXJyX3Byb2JlKCkNCj4gPiBpbnN0ZWFkIG9mIGRldl9lcnIgaW4g
cHJvYmUoKS4NCj4gPg0KPiA+IFdoaWxlIGF0IGl0LCByZW1vdmUgdGhlIHVudXNlZCBoZWFkZXIg
ZmlsZSBzbGFiLmggYW5kIGFkZGVkIGEgbG9jYWwNCj4gPiB2YXJpYWJsZSAnZGV2JyB0byByZXBs
YWNlICcmcGRldi0+ZGV2JyBpbiBwcm9iZSgpLg0KPiA+DQo+ID4gQWxzbyByZXBsYWNlIGRldm1f
Y2xrX2dldC0+ZGV2bV9jbGtfZ2V0X2VuYWJsZWQgYW5kIHVwZGF0ZWQgdGhlIGNsaw0KPiA+IGhh
bmRsaW5nIGluIHByb2JlKCkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+
ICAqIHJlcGxhY2VkIGRldm1fY2xrX2dldC0+ZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSBhbmQgdXBk
YXRlZCBjbGsNCj4gPiAgICBoYW5kbGluZyBpbiBwcm9iZSgpLg0KPiA+ICAqIEFkZGVkIFJiIHRh
ZyBmcm9tIEdlZXJ0Lg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0g
YS9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2VtLmMNCj4gPiArKysgYi9kcml2ZXJzL3R0
eS9zZXJpYWwvODI1MC84MjUwX2VtLmMNCj4gDQo+ID4gQEAgLTEyMSwxMSArMTE2LDggQEAgc3Rh
dGljIGludCBzZXJpYWw4MjUwX2VtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBk
ZXYpDQo+ID4gICAgICAgICB1cC5kbF93cml0ZSA9IHNlcmlhbDgyNTBfZW1fc2VyaWFsX2RsX3dy
aXRlOw0KPiA+DQo+ID4gICAgICAgICByZXQgPSBzZXJpYWw4MjUwX3JlZ2lzdGVyXzgyNTBfcG9y
dCgmdXApOw0KPiA+IC0gICAgICAgaWYgKHJldCA8IDApIHsNCj4gPiAtICAgICAgICAgICAgICAg
ZGV2X2VycigmcGRldi0+ZGV2LCAidW5hYmxlIHRvIHJlZ2lzdGVyIDgyNTAgcG9ydFxuIik7DQo+
ID4gLSAgICAgICAgICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5zY2xrKTsNCj4g
DQo+IFlvdSBmb3Jnb3QgdG8gcmVtb3ZlIHRoZSBjYWxsIHRvIGNsa19kaXNhYmxlX3VucHJlcGFy
ZSgpIGluDQo+IHNlcmlhbDgyNTBfZW1fcmVtb3ZlKCkuDQo+IEFmdGVyIHRoYXQsIHRoZXJlIGlz
IG5vIGxvbmdlciBhIG5lZWQgdG8gc3RvcmUgdGhlIGNsb2NrIHBvaW50ZXIgaW4gcHJpdi0NCj4g
PnNjbGsuDQoNCk9LLCB3aWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0K
QmlqdQ0KDQo+IA0KPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+IC0gICAgICAg
fQ0KPiA+ICsgICAgICAgaWYgKHJldCA8IDApDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAidW5hYmxlIHRvIHJlZ2lzdGVyDQo+ID4gKyA4MjUwIHBv
cnRcbiIpOw0KPiA+DQo+ID4gICAgICAgICBwcml2LT5saW5lID0gcmV0Ow0KPiA+ICAgICAgICAg
cGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9
cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlDQo+IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMNCg==
