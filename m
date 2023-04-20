Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A44D26E9B67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Apr 2023 20:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjDTSQV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Apr 2023 14:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjDTSQU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2023 14:16:20 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC74269E;
        Thu, 20 Apr 2023 11:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5KTFiU1xuLzBIjQr1oYEIRdvyvmovjue8UhyBBHSUl7Yl3W04iUakmSZi0Kr8ozCXetZHof6LJT6kic904lNylni8TvSYqoExi/CBVtPxtsa0geGhPr0oOXJfdSl8mIX36dhnA1WXsMNwVqrTFnR/Sw4BZL6prFJaxPToteKkWYvn9zgus0LDLV6Dl0Ubc2qlVHhCUm/3B6pJlYV1M+0jL7vLBmC11AWJhhbCMKXZx+IC0gHwiFOrmkRgVrUf7Mx36M1yk5mRrEp6XOyK5k6Sl75nQ89pJ+A6rB6ACGzlv5VJjNbQQWkq8+geBQjYOD9CHG4aIYrYTvH6sW7pta0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07CXhBQMnpNYYNindcBHq+sPt3AhSS/2kWyK1+oS2Ys=;
 b=mN81diaj2j5B7ruVg4a5E5O/GFUrXD0rnWEv7tNs5u+TRS8pZZNKdxINIbb1TYPDwALMYvLuUJOtZRkSwI8LmmhpI3k2lVR1EJKSAkufsKbFDZgGt/UnWYUzxLsURxPDZIQwS2B3OxEIGOYH/G8D2hxJLg2z7iEGWdSa/s1ZqoqUi262llau7IHYFGsGRHlT3UQgcdtzS3U+GfbhIhNXAAAgj7MY8Gwlza4DBy1NVhg7Sw0lc9VVyS6eoEjAv9U04goaPlEsyjK705E79shAOQbG6L1B338r+VUlcb52F7n6Z2JWrsbxDKZhc6Jx04oOMYxre5fQdebHa1fxlvx6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07CXhBQMnpNYYNindcBHq+sPt3AhSS/2kWyK1+oS2Ys=;
 b=s6sgV/hFG6otibLwU+8ckJbd7Z6DBf8LLKb+PtJ7ifSimTFocqXbW6lMriJ7PUMwwnKMesH8ttekXkkt6dVOfUpY1P2J/uAR9b0FKjiYc+OsG2DpC/fNIvJ0+niZziZ+zL7Z6QIq6YlhvoQBz8cAVvnRqJr/g5W9rr3oN9ocdyc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9616.jpnprd01.prod.outlook.com (2603:1096:400:199::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 18:16:14 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 18:16:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
Thread-Index: AQHZcQtLK6/JZK1zYUeFXuixSTqo8q80WqqAgAAATSCAABpUgIAAD/tg
Date:   Thu, 20 Apr 2023 18:16:13 +0000
Message-ID: <OS0PR01MB59225B62056AFA6FF70F1F3186639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
 <20230417090159.191346-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXQ9NLra76pknQ+ASNiRVK2RWSh2jG=Ub+tZpC6uiwK6g@mail.gmail.com>
 <OS0PR01MB59221C7EE8ECA83F1892360E86639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVeeOGethjtSCUKjM2S+bhueLW25HtcDpSAY0xQcWgB5Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVeeOGethjtSCUKjM2S+bhueLW25HtcDpSAY0xQcWgB5Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9616:EE_
x-ms-office365-filtering-correlation-id: c74fc315-20c5-44a3-d975-08db41cb5386
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: khUIIGntkXVGjcyKJNTzVl6cl3ZPKHYtch9PszQU8ZMvMOBU2xPwvM+Abqc9C1lgl6MDHsL8FavOVRirFNET+8UtMFxMLB4KuLjpeguu1FbgDVwwA6RyKcdrJAfH3Z2RRtDGyqImx+upgbFoQ1y8rMQXrOW9ifMeD0WN7gAmpfCriNiwB/KcpTLO8GPjCQIflUG3sYZ47MPP1ZtI6oDcnciA6duJ53GOAvhKsBgSdCWzunSKhI6Hkh0hE80MepyB+4LhGevim8Ha+2t+NJMH5vdItsPOCnhiqMdeRYEoKqOFzuIKjQ/sbbF+hnihwwRSttH3S017VPEq8iHX2YOXLT7ifpNkp8scss3nX1cKjCEydlA2DrhlWhmPwMU79X+Wmtk2xvYb+H2O3XX4ghrGIveD7hm8Zga0Gr4PTU3AUeAkvWmQ22xw1bmuzaVpT+C8kz7UF/HKBM8IXV2+d1+veUCXqgeGYEBhjtT1cwdefbzNAB5axR1H+PNnJX91S9k+hNGfnwFYNIRS0MfN2WqilLoav5ztNGD/Dsi/rILP52i4xkkbPxVtDTIJ72si9GgA33nNemh5n1xeH2folwgxyGWTOmhZCj4v4+8Od2sz65lSLB4UttY/DL+pAGMsBQOP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(33656002)(186003)(38100700002)(107886003)(71200400001)(478600001)(122000001)(86362001)(54906003)(7696005)(53546011)(9686003)(6506007)(4326008)(6916009)(316002)(66556008)(66446008)(66476007)(66946007)(76116006)(64756008)(41300700001)(8936002)(8676002)(38070700005)(83380400001)(52536014)(5660300002)(2906002)(55016003)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWw4VmRqZ09MUkU0bnBRa2lYYUttejdhaUNudmZ5NkFPS0dlMmhSOC9idG1G?=
 =?utf-8?B?YnFOVkV1NEFTM21lZTJhN2tFVDJZNlNBSWl0M2h0Zzc3QlJUWkdpcEs0MEVU?=
 =?utf-8?B?NjgwSitJbVphM2RFdXBMVXJJWTMxNXpNQS9IajFJdUNKRWNFMTQ3MG9HV1NJ?=
 =?utf-8?B?WmVrczV0eGkvd3FzU3Z1Q3VMM3ZFYzQ3WVRvNFdKYzFoZjk4YWxiQi9oQ2x4?=
 =?utf-8?B?Sm41NzE1c0cwc1c2cHJoMEZ0OUtSRjFLUk5wQm1UcGxBak8ya2xvY0Y3ZzN5?=
 =?utf-8?B?TXNKc2dtRTA5Q3RkYk5QcU9YMzYrdGgrdXlIMGJpeG5IRFRCejNLcS9SNFJo?=
 =?utf-8?B?WWIyWEhNWmFZeldFMHRNZlExVG9tanhWU0pxWG5PWHMxdmtEbTRpN1QwOEYr?=
 =?utf-8?B?cFNETDBvR2xjQjlBdXVvWEFVWCtrU1RRdFVncGswVldMWCtzcEo1VkFlR2Ex?=
 =?utf-8?B?ZWFoeVB0eVcvSjJ3NWczZXM0cWZUazJNbHViTk8vK2hWUGJqOUpjS3o0RTZw?=
 =?utf-8?B?SmZwWjAvZHZVTnN6M2tHRXRORDNyVWFYQUI5SGtGVjlMYjdrYWdodlNzWXJ5?=
 =?utf-8?B?WUcyQUowa2FvcXF3UVV2N2dRNUZSajk4WGRiWlNMZFNQbFVqSWF1MUVvbkVj?=
 =?utf-8?B?R0dDdlBmKytuMXlya1FmYTYyZWtTZTV4cy9vU2FkSXp5U0N4STNyWENFMDJD?=
 =?utf-8?B?dk1ralcxOFV4S2E0VjRsRXNCRmFUb0V1VHRqMlJmeVBDUGQ1TnhGYzUrcXV6?=
 =?utf-8?B?bi9hOTFVT1V1M0cxMWtXQXlLNitwSFp0VERUWjdFOGdBK29lZEZhUFNsRTZG?=
 =?utf-8?B?Njh4UGhOem1GLzRZVVpVd2VmSFViR09wS01MQUdyRFhYNGU2Q1M4OFgxSTlD?=
 =?utf-8?B?MWd1OUxReWI1dnJmQklDMzQ0WnhkU05Lak9iZEZsUnZrb0tnMVZZd0JrR3lY?=
 =?utf-8?B?L2JDd1h2dHpPMDNVazJITU9KWHZDOSs5SmxRVTc4bE05VkpaOU5hSEZuVW5q?=
 =?utf-8?B?ZXVrV3h0aTl4VEdIbXgvMVZFU0h4eHVXS2hGa0tIdzByZjNnME1qRGZXeHN3?=
 =?utf-8?B?a0ZJNXF6SEFEQjJmakRGSitHRXgzQkN5aTRJQWdrUUpmT3VuNDEyaGJ3VnBi?=
 =?utf-8?B?TzZMM3NmZUFZdmhEOVhudUgySy9kdEZDdVU0RStGSjR0K0d1Y0JZeElIcTlF?=
 =?utf-8?B?MUptWUtjT0xQUGxDU1EwVDlMcTBmY1c3bXRJUlgva0R2MVZLa3NBNUVFTWZw?=
 =?utf-8?B?VjIrdzcvVzBHdlpDbk9NRCtGUzNrQ0wzbEplSGhuYkdYeGxjOWFsZnl0UUJi?=
 =?utf-8?B?UWF1SUE4ajhNZnllaVBHL0xHUjBYUkhSKzRENFRRZ0U0UlVxU0tUbnRsemVs?=
 =?utf-8?B?WWJYYUZndk4rVFNMa213ZFRSMTdXVG5LRk9aVjliM3JzbzQzZEl4TDhuME1r?=
 =?utf-8?B?T0xCUEpFenV5MmNzTXlheUt0TGladHlBd2FhV1hlaGhsQStIcUZ4ekwzbGJu?=
 =?utf-8?B?ZWU5QUxCajRQcVFJSEQvYTBhWjFzVUtxRHFBT0Y2NTVIVUhOR2t2NnBXaFQr?=
 =?utf-8?B?bWl1UHJFSU9FNGJJVk8rWUh3ZXBibVFyamZrRk95V01EUGRrV3VrQTcvWVJR?=
 =?utf-8?B?Z3JUMVFQYWpkOFhSL2xuck9jcnc5ZnlKclkyWHFELzA2YjZiZkp4dm43OS9P?=
 =?utf-8?B?cWJ3L29LMHl0NkZ0Mi9VOG1lZTZIUXpuY1hjSjNNa0RlclhkdmJ3K25DbWln?=
 =?utf-8?B?aTNSU0VNQVE3WnVLbzdLY3pIa3p6Y2o0RHptb1BnM2N1WXZOZmxoZGFDN0lu?=
 =?utf-8?B?SDJoV0ZwK3FFaVU4K3NkQjladXVDS3hhYVdwcDFmeGFTN3VSclJEMUpSNEpK?=
 =?utf-8?B?MytCMlQ0aWVJVGZTOWxJRXY5WlhJdUxGaXl6T09vQkFPdENjeUVTNURkdDNh?=
 =?utf-8?B?Q1htOWZZTFh6RXlCRjhTUHQ2cUdVYjdZT1c0NlZuVGR6Vnp3RFhZOU82eWJt?=
 =?utf-8?B?a3dTMjlTaG5YK3p2RDVvZHFCcDJGeTVHOUtCMUx2cDBxdUxxNXNqM3JlelBF?=
 =?utf-8?B?dVM4UmNCQjg3eElQTTFOZDJqWWtBSElzQ2x2Vy8xZ1B5TEcybFByWHZDOEJW?=
 =?utf-8?Q?lV1w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74fc315-20c5-44a3-d975-08db41cb5386
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 18:16:13.7997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vOZ89pyvUi2pSqviTKJqWK9pSBmyaV4xQYCv3seNY23tz+UJP/NWl9/Rr9PCA4uzoWNQMmRLa6UHjbBx5CbdiA/ptmg+R/gzMH9Hvyp7yr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9616
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEFw
cmlsIDIwLCAyMDIzIDY6MTUgUE0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0
b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBNYWdu
dXMgRGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsNCj4gbGludXgtcmVuZXNhcy1zb2NAdmdl
ci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgUHJhYmhha2FyDQo+IE1h
aGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMy8zXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcybC1zbWFyYzog
RW5hYmxlIE1UVTNhDQo+IGNvdW50ZXIgdXNpbmcgRFQgb3ZlcmxheQ0KPiANCj4gSGkgQmlqdSwN
Cj4gDQo+IE9uIFRodSwgQXByIDIwLCAyMDIzIGF0IDU6NDnigK9QTSBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5v
cmc+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMjAsIDIwMjMgNDo0MCBQTQ0KPiA+ID4g
VG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IENjOiBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+ID4g
PGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IEdlZXJ0IFV5dHRlcmhvZXZlbg0K
PiA+ID4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgTWFnbnVzIERhbW0gPG1hZ251cy5kYW1t
QGdtYWlsLmNvbT47DQo+ID4gPiBsaW51eC0gcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IFByYWJoYWthciBNYWhhZGV2IExhZCA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCAzLzNdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJsLXNtYXJjOiBFbmFibGUN
Cj4gPiA+IE1UVTNhIGNvdW50ZXIgdXNpbmcgRFQgb3ZlcmxheQ0KPiA+ID4NCj4gPiA+IEhpIEJp
anUsDQo+ID4gPg0KPiA+ID4gT24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMTE6MDLigK9BTSBCaWp1
IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+
ID4gPiA+IEVuYWJsZSBtdHUzIG5vZGUgdXNpbmcgZHQgb3ZlcmxheSBhbmQgZGlzYWJsZSBzY2lm
MiBub2RlIGFuZA0KPiA+ID4gPiBkZWxldGUge3NkMV9tdXgsc2QxX211eF91aHN9IG5vZGVzIGFz
IHRoZSBwaW5zIGFyZSBzaGFyZWQgd2l0aA0KPiA+ID4gPiBtdHUzIGV4dGVybmFsIGNsb2NrIGlu
cHV0IHBpbnMgYW5kIFogcGhhc2Ugc2lnbmFsKE1USU9DMUEpLg0KPiA+ID4gPg0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0K
PiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yemcybC1zbWFyYy1wbW9kLmR0c28NCj4gPiA+ID4gQEAgLTAsMCArMSw0MyBAQA0K
PiA+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiA+ID4gKy8q
DQo+ID4gPiA+ICsgKiBEZXZpY2UgVHJlZSBTb3VyY2UgZm9yIHRoZSBSWi97RzJMLFYyTH0gU01B
UkMgRVZLIFBNT0QgcGFydHMNCj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMjMgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ID4gPiArICovDQo+ID4gPiA+ICsN
Cj4gPiA+ID4gKy9kdHMtdjEvOw0KPiA+ID4gPiArL3BsdWdpbi87DQo+ID4gPiA+ICsNCj4gPiA+
ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3J6ZzJsLXBpbmN0cmwuaD4NCj4gPiA+
ID4gKw0KPiA+ID4gPiArJm10dTMgew0KPiA+ID4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwmbXR1
M19waW5zPjsNCj4gPiA+ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+
ID4gPiArDQo+ID4gPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ID4gPiArfTsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArJnBpbmN0cmwgew0KPiA+ID4gPiArICAgICAgIG10dTNfcGluczog
bXR1MyB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBtdHUzLXpwaGFzZS1jbGsgew0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8UlpHMkxfUE9SVF9QSU5NVVgoMTks
IDAsIDMpPjsgLyoNCj4gPiA+ID4gK01USU9DMUENCj4gPiA+ICovDQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICB9Ow0KPiA+ID4NCj4gPiA+IFVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcsIHRo
aXMgc2lnbmFsIGlzIG5vdCBhdmFpbGFibGUgb24gdGhlDQo+ID4gPiBQTU9EIGNvbm5lY3Rvcj8N
Cj4gPg0KPiA+IFllcywgaXQgaXMgbm90IGF2YWlsYWJsZSBvbiB0aGUgUE1PRCBjb25uZWN0b3Iu
IFNEIGNhcmQgZGV0ZWN0aW9uDQo+ID4gc2lnbmFsLCBpcyBtdXhlZCB3aXRoIE1USU9DMUEgKFog
UGhhc2Ugc2lnbmFsKS4gU28gZm9yIGNvdW50ZXIgdXNlDQo+ID4gY2FzZSwgd2UgdXNlIGl0IGFz
IE1USU9DMUEgcGlucy4NCj4gDQo+IEFzIHRoZSBzaWduYWwgaXMgbm90IGF2YWlsYWJsZSBvbiB0
aGUgUE1PRCBjb25uZWN0b3IsIGNhbid0IHlvdSBqdXN0IGlnbm9yZQ0KPiB0aGUgWiBQaGFzZSBz
aWduYWwsIGFuZCBrZWVwIHRoZSBTRCBjYXJkIENEIHNpZ25hbCBhdmFpbGFibGUgaW5zdGVhZD8N
Cg0KDQpTb21lIGN1c3RvbWVycyBhcmUgdXNpbmcgWiBwaGFzZSBzaWduYWwgaW4gdGhlaXIgcHJv
ZHVjdCB0byBjbGVhciB0aGUgY291bnRlci4NCk1heWJlIHdlIGRlZmluZSBhIG1hY3JvIGluIG92
ZXJsYXksIGJ5IGRlZmF1bHQgWiBwaGFzZSBzaWduYWwgaXMgZGlzYWJsZWQuDQoNCklzIGl0IG9r
Pw0KDQpOb3RlOi0NCkkgdXNlIFNEIGNhcmQgcmVtb3ZhbC9pbnNlcnQgd2hpY2ggY2hhbmdlcyB0
aGUgWiBwaGFzZSBzaWduYWwgbGV2ZWwgZm9yDQpjbGVhcmluZyB0aGUgY291bnRlci4NCg0KDQpD
aGVlcnMsDQpCaWp1DQo=
