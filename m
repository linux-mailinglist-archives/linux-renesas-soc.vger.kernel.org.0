Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3D087B506B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 12:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236473AbjJBKfc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 06:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236436AbjJBKfa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 06:35:30 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5095D99
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Oct 2023 03:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knMCbEIFsW7ZN8vLrZ34p9yCTpuy+L7EU4MLKfEEWhMVu7d48aD3hq74y9IrdGj4hOkaCtBQmBV2dldp0wl9blU6Z7KUIeuuWYYEBZHD3I8fgt4NQ57sXgAoMmG/16MzgpwU4geMmKEKBVZD3NSR4DVYF85K2cTerBwkKnBqTMKQvB/MlDQ37mWoP46WHAZaHS4B4Ai5zToUvUwFAAbYFi8SewLJZaobZ+WWG5gX6b3g2jzw5vaxbCkXzM0RDejRubvvXx4yZld3yLdHN/yMKEMqamES4JdKm1FaZ/1Hnw3qA80buT6ygK+mKLYoTbpwJPojWt4A/zP4PhZV+dbeFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7bXqAOWqyxkzhYB9HnmkiSxDRNsfv9QOXrTJn0fhlI=;
 b=mQp6rM4BUGovpqdX/9dfWGFqjVk5wbkSKZtDuOIGwpx9KFv1xGMkGIisMUeOaQ2Mx9ckJycU3mdZBMMLP0K0ZcJIjqD9hTNaUxv/t1V8ptGodV6Vv/u2122HLD5rXCpnmuThXknYE4pvLqGvC2YWeLEB/8I7BvOsQtYfKQHl4ET+PrZ5TYzTfxkBhJVEMjdFoP23y4Bo41BfwUacJO7LfU6nWZ+lpnYNEuxClODBu13UcO6+xMG2N+v46r2iLKh7bUsBl0BN/tj6y3VGV1+oaKCHXKJsE7YRuB2q4DNkR0tybIVfE42rCnkilT82AXIR9/O6nZCjOQybeIWipT00Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7bXqAOWqyxkzhYB9HnmkiSxDRNsfv9QOXrTJn0fhlI=;
 b=VZKwnRTnWy+nvyBqXTArw9L2DQBuRPBPdNYm+9zMoYR+RaeX3jw/EA6mxU6MVaz4OEn44dW2c0rbZ2L3nyeKRA/f2JhEZqzsISryTeTJXup7il2GxYgP49w/3fLStGofxC1zKAFL7172YEdEX0tmE8aSn/SQ+gCFQqbAObxJalc=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYWPR01MB9986.jpnprd01.prod.outlook.com (2603:1096:400:1e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 10:35:22 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::8e13:cc46:2137:9b03]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::8e13:cc46:2137:9b03%7]) with mapi id 15.20.6838.028; Mon, 2 Oct 2023
 10:35:22 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v10 3/4] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v10 3/4] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHZrlaiiBQbWXhS+Emr4nZJnYyusrAPmtiAgAF9iHCAD5mQUIAB170AgBRNMMA=
Date:   Mon, 2 Oct 2023 10:35:22 +0000
Message-ID: <TYCPR01MB59332FFA99B8606DE6B48C0686C5A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230704090447.27420-1-biju.das.jz@bp.renesas.com>
 <20230704090447.27420-4-biju.das.jz@bp.renesas.com>
 <6sewdcmxpudtixyqmjnegu5jxv7r7rudmzvesequl5b3zotm4h@3twdl2k553fh>
 <OS0PR01MB592252908516D973497E7BE886EDA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <TYCPR01MB5933534F20B0552AD908855786FBA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <txc2agqgm7hdbjhrq7ysmjsyflyjc6cqyvkb2ouzdlpy6qzqkw@cn3ax3bnsytq>
In-Reply-To: <txc2agqgm7hdbjhrq7ysmjsyflyjc6cqyvkb2ouzdlpy6qzqkw@cn3ax3bnsytq>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYWPR01MB9986:EE_
x-ms-office365-filtering-correlation-id: e1628111-00db-43d7-ef45-08dbc333485e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U4r88BBP6qDVjeKRpgRxDPI6n2xtrnsuKtB91/slh7tt2sAcnXQ9+45V8YKMgUr2u0VQe/hRNUbN4wHcfDsuPOCzi6IA59meX10MSto/ROZ6rvJA327gF3kR6WlWV0mpyk+wmHdFM2hK7yXcTAwEDWzTujv44ODqbLwlojwqWuCP+JdXfrF3h5O+OYBGP327MqeOc+px4G/fq8Jp75rcKF5Oit3uX8z/dYfMX49H1rYeWpV0r+RnTd8vAflgLPp+w//h02/K9vSSjY+1OqOGbD/ZZyg/vCv2bgVrhokk2URw0622WxZQMbSJkUTT+2va/exjFxHogT+r8MT0kvMQFtl+KCyAlFRsU0/XqLuy7oe4M/FO2pz8nAwCzC9qVDFQ5s0qKQzXmiBMtCyMhSnji4UUxa66B8FSdHaDg6xxrglvE4sWcOC5a4b9nQaVSmudXcDKYoYJ16jugEU8sf7AX8a6J6e0A95g4nczsktuN9enanVupRgG+MjFccdj5ar4PbQL21Y20VanxAxXZE+eI/LvVQeo/duRJg9NOEUVMzIFXcS6rXyVbWkCVb5KhGqaK0eWR2FoPvJtsMipKhRuWKrAGhrNNO4FxhMoHlskGM82YviSa4CUL9Gd4mLC9FaX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(66556008)(66476007)(76116006)(66446008)(64756008)(54906003)(6916009)(316002)(2906002)(478600001)(8936002)(8676002)(71200400001)(4326008)(5660300002)(66946007)(53546011)(52536014)(83380400001)(6506007)(7696005)(7416002)(9686003)(41300700001)(122000001)(38070700005)(38100700002)(86362001)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUJZZ0xYb09kYXI4NkFUb2ZIT1NsdDlMMzFxZ1Bodm1lMHQ2Z1lhK2dNMlFV?=
 =?utf-8?B?T2JVR1pqb0g5bXUrUWZZV3FNS0s2UU9XTmpweUh6dW1FMHpKQ2VsWk0vc0Na?=
 =?utf-8?B?YjRwZzFsQlRia2JrZ3owb0VWZHJKbERhYTFFTjk4MEc3dlVMUzRZekhCUVVT?=
 =?utf-8?B?aEZRTUhKMzlGMTlQWkJHL3hEdnhtaFZRRzYxWWdDVTdCb2NiaWRTYTFPRHFE?=
 =?utf-8?B?Zmdkc0RKYzJhWktZZHdadnpJVHhlZEtJYlU3YlJYMmM5Q3ZLdEJvNTY0S0ta?=
 =?utf-8?B?WE9pV3pXL3VLNmQ4aEY1QVFXaVhKeThrMjJGVi9leERxa1dWdVowVFFPcjEv?=
 =?utf-8?B?WXptVXg3bVF4VEJDdityVUkvb000ZWx0bjdDMkEzNTRrK2JXZzB5VTVtaEFM?=
 =?utf-8?B?ZERGVmZDTGFaUUJoTm55T3ladWJCT21vdW52WHNuN3g3VHNERnZUSWIreVU2?=
 =?utf-8?B?RzZLdDRJZGF3K1M1d296RUZHRjVxNlk4OGFjRUtUTjFnc0UrVzdjelA2ME9U?=
 =?utf-8?B?U1ZVTjBSVDVJMC9mZHZZYzlaWFhQZzRiUUMxTk5jWUpmdmZBQjBWc3d6cmp2?=
 =?utf-8?B?K1h3dXdxTHlQMnFsZEFEN3orTno4ZitpRDlFcVNZc011VjdjaEd0QzY4eWx1?=
 =?utf-8?B?SkNSNXM3KzBIaG96b3BqdnNhV2g1RER3bEJMV3RuYzl1c1RNL2VadVJqdjR5?=
 =?utf-8?B?R0xZTjJwdVh3YVpsNkQveGwwQk5mRGRaSmNCdnVmSlZqTEVMdWRaZGJSeFMw?=
 =?utf-8?B?QldDUDF0OStjalZvOXd4TGVwY2pyZmNmcVZiUWtsU0JUS2hHTzdNQVdiaVBW?=
 =?utf-8?B?cklVYnppYmQxTkVnbmRmeHBSSVRFMkh5REs1SHM4TGE0WUtmQUpFK3JSUHBZ?=
 =?utf-8?B?Qlk3Qlhsa2ZuN0ZPSXB1eXdjTHNnS1gzZUdadlEzZ0V0eVJnTGtBbGRnR2dX?=
 =?utf-8?B?dDNlclJUQUdZTldBSUhpVE5seUhRbWRockVLRklKYlZXSnZ4bml2TlRTYndn?=
 =?utf-8?B?Tk9WMUYzdlJqWDZvU2hpbGpBaC9DR0p1MmJJZnVIaW5QUTNBTDY2bEg3VWZa?=
 =?utf-8?B?eVE4c2V6ZjA4eUh0Y1hNUFVianBVY1BLbjlKTWZFSHRTeXdOOEZXVG9lSmFq?=
 =?utf-8?B?VVZmOXozRFVIbktSWmpZU0dvd3FXQmt4Q04wR3lNWVZEMHNqOTdRbkNQaE1K?=
 =?utf-8?B?djhzcmFWemw1a2NRNTdQY2U2SDhxdXQyQi9mRFpyaU9HL0tYNndnK1l0dmJ6?=
 =?utf-8?B?TitIQzRYNWJoYVczWWhqNHJ0UDdDM3JMQXl6elV2S3VObUVZcHNkS2Z1bW5O?=
 =?utf-8?B?ektqUnhTK3MyWlZobUFTVU5LMm1lTkpPZnFvcFhqRVBxQUgwNkRld1kxYldz?=
 =?utf-8?B?SWxnYmhuczNSdkFhV2VXdHRxM29DanVWekVZekN0cHdFak1oYXJZaVhURHV3?=
 =?utf-8?B?ZDU5UlliRVFOdkxyNEJ5L0lsdWpwb0xhTFV3ZWIyd0VDQ1pQV1RRVkRiQklk?=
 =?utf-8?B?STNleE5BcFRvR2Zzelo5dTY1a3dmbUozV1VQRGxtMW1yVm5nYlNVSVdid1lE?=
 =?utf-8?B?Wjg5UU9oaHR4NURDajFQWDRvT0lNZTBLUlZzRi9QcXk3bmxtNjBCSGxYNkIx?=
 =?utf-8?B?dmppN0ducWZ2RUFSOE9vR3pCSi9aT1I5dXlCUjl4Nnh5VVVrUHhheEZlbUs5?=
 =?utf-8?B?cEEzdGUxS3RHQStZM2tselY1M1BLZXpJZ2ZWczRpV0kwQ2hRd1ZiL3VEbW1V?=
 =?utf-8?B?UFJ0WS80cWF6S3ozb1dlTlJHNDdMZGNnM09iK0tnekFSU2tpbkw3T055RWFv?=
 =?utf-8?B?MSs2S28zRC8veDMyRlpOQU8xaTgwOHJmWnVoeWRiYmhSZ2FxaURZUjlJWlIv?=
 =?utf-8?B?U3hpUUxnOXh3cGtjS2pTenp0Wlh5SjZ1enBuOHhyV3l0QVhtSUJIb1FFYjJo?=
 =?utf-8?B?NCs5MGwwaVNNTUNIZGlpRjkzdGZxbEdPRWRxYjFSMm9aR1d2MU95UHo0WDhH?=
 =?utf-8?B?NXJsMWM1bnpyOU5vajlhMHNWR2FUWHU0UHVRL1o4WjFVNWI4dHZlRENnRGtK?=
 =?utf-8?B?aVRqVjQ2UFJmeFk3SHRvNnJiY01TK1NUdUNMNWRXbS8wQ1FFSDdJOUpIcU5S?=
 =?utf-8?Q?EQS4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1628111-00db-43d7-ef45-08dbc333485e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 10:35:22.7568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DEaySI09SVSX1vhIzY3el9N3E32bZq45YhfnOg828ZVjNBwgD3vFQTAG1s2lyenuyFn9GrN1X/PzDXF/KHgNmubVE5xjVQSLBTYg2DnHBJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9986
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgSmFjb3BvLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEwIDMvNF0gZHJtOiByZW5lc2Fz
OiBBZGQgUlovRzJMIERVIFN1cHBvcnQNCj4gDQo+IEhpIEJpanUNCj4gDQo+IE9uIE1vbiwgU2Vw
IDE4LCAyMDIzIGF0IDA4OjA5OjU4QU0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEph
Y29wbyBNb25kaSwNCj4gPg0KPiA+IExvb2tzIGxpa2UgeW91IGFyZSBoYXBweSB3aXRoIG15IHJl
c3BvbnNlIGZvciBWMTAuIEkgd2lsbCBzZW5kIFYxMSBzb29uLg0KPiANCj4gU29ycnkgZm9yIHRo
ZSBsYXRlIHJlcGx5Li4NCj4gDQo+IFNlZSBiZWxvdywgSSBvbmx5IHNlZSB0d28gImNvbnRyb3Zl
cnNpYWwiIHBvaW50cw0KPiANCj4gPg0KPiA+IENoZWVycywNCj4gPiBCaWp1DQo+ID4NCj4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciA4LCAy
MDIzIDI6MjQgUE0NCj4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjEwIDMvNF0gZHJtOiByZW5l
c2FzOiBBZGQgUlovRzJMIERVIFN1cHBvcnQNCj4gPiA+DQo+IA0KPiAgW3NuaXBdDQo+IA0KPiA+
ID4gPg0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCWRpdHIwID0gKERVX0RJVFIwX0RFTURfSElH
SA0KPiA+ID4gPg0KPiA+ID4gPiBJIHNlZSBtb3N0IHJlZ2lzdGVycyBkZWZpbml0aW9uIGluIHJ6
ZzJsX2R1X3JlZ3MuaCBiZWluZyBvbmx5IHVzZWQNCj4gPiA+ID4gYnkgdGhlIGNydGMgZHJpdmVy
IChzb21lIG9mIHRoZW0gYXJlIG5vdCBldmVuIHVzZWQpLiBXaHkgYQ0KPiA+ID4gPiBzZXBhcmF0
ZSBoZWFkZXIgZmlsZSA/DQo+ID4gPg0KPiA+ID4gRm9yIGNvbnNpc3RlbmN5IEkgYWRkZWQgaGVh
ZGVyIGZpbGUgc2ltaWxhciB0byBSLUNhci4gUGxlYXNlIGxldCBtZQ0KPiA+ID4ga25vdyB0aGlz
IHRvIGJlIGFkZGVkIGluIC5jID8NCj4gPiA+DQo+IA0KPiANCj4gSSB3b3VsZCBzYXkgdXAgdG8g
eW91LCBhcyBSLUNhciBkb2VzIHRoZSBzYW1lLiBJbiBnZW5lcmFsLCBpZiBhIHN5bWJvbA0KPiBk
b2Vzbid0IG5lZWQgdG8gYmUgZXhwb3J0ZWQgdG8gYW55IG90aGVyIGZpbGUsIGl0IGNvdWxkIHZl
cnkgd2VsbCBsaXZlIGluDQo+IHRoZSAuYyBmaWxlLg0KDQpBZ3JlZWQuDQoNCj4gDQo+ID4gPiA+
DQo+ID4gPiA+ID4gKwkgICAgICB8ICgobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX1BWU1lO
QykgPw0KPiBEVV9ESVRSMF9WU1BPTCA6IDApDQo+ID4gPiA+ID4gKwkgICAgICB8ICgobW9kZS0+
ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX1BIU1lOQykgPw0KPiBEVV9ESVRSMF9IU1BPTCA6DQo+IA0K
PiBbc25pcF0NCj4gDQo+ID4gPiA+IC0tLS0tLS0tLQ0KPiA+ID4gPiA+ICsgKiBGb3JtYXQgaGVs
cGVycw0KPiA+ID4gPiA+ICsgKi8NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgcnpnMmxfZHVfZm9ybWF0X2luZm8gcnpnMmxfZHVfZm9ybWF0X2luZm9zW10gPQ0K
PiB7DQo+ID4gPiA+ID4gKwl7DQo+ID4gPiA+ID4gKwkJLmZvdXJjYyA9IERSTV9GT1JNQVRfUkdC
NTY1LA0KPiA+ID4gPiA+ICsJCS52NGwyID0gVjRMMl9QSVhfRk1UX1JHQjU2NSwNCj4gPiA+ID4g
PiArCQkuYnBwID0gMTYsDQo+ID4gPiA+ID4gKwkJLnBsYW5lcyA9IDEsDQo+ID4gPiA+ID4gKwkJ
LmhzdWIgPSAxLA0KPiA+ID4gPiA+ICsJfSwgew0KPiA+ID4gPiA+ICsJCS5mb3VyY2MgPSBEUk1f
Rk9STUFUX0FSR0IxNTU1LA0KPiA+ID4gPiA+ICsJCS52NGwyID0gVjRMMl9QSVhfRk1UX0FSR0I1
NTUsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDE2LA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0K
PiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQku
Zm91cmNjID0gRFJNX0ZPUk1BVF9YUkdCMTU1NSwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJf
UElYX0ZNVF9YUkdCNTU1LA0KPiA+ID4gPiA+ICsJCS5icHAgPSAxNiwNCj4gPiA+ID4gPiArCQku
cGxhbmVzID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJN
X0ZPUk1BVF9YUkdCODg4OCwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9YQkdS
MzIsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDMyLA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0K
PiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQku
Zm91cmNjID0gRFJNX0ZPUk1BVF9BUkdCODg4OCwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJf
UElYX0ZNVF9BQkdSMzIsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDMyLA0KPiA+ID4gPiA+ICsJCS5w
bGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4g
PiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9VWVZZLA0KPiA+ID4gPiA+ICsJCS52NGwy
ID0gVjRMMl9QSVhfRk1UX1VZVlksDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDE2LA0KPiA+ID4gPiA+
ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMiwNCj4gPiA+ID4gPiArCX0s
IHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9ZVVlWLA0KPiA+ID4gPiA+ICsJ
CS52NGwyID0gVjRMMl9QSVhfRk1UX1lVWVYsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDE2LA0KPiA+
ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMiwNCj4gPiA+ID4g
PiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9OVjEyLA0KPiA+ID4g
PiA+ICsJCS52NGwyID0gVjRMMl9QSVhfRk1UX05WMTJNLA0KPiA+ID4gPiA+ICsJCS5icHAgPSAx
MiwNCj4gPiA+ID4gPiArCQkucGxhbmVzID0gMiwNCj4gPiA+ID4gPiArCQkuaHN1YiA9IDIsDQo+
ID4gPiA+ID4gKwl9LCB7DQo+ID4gPiA+ID4gKwkJLmZvdXJjYyA9IERSTV9GT1JNQVRfTlYyMSwN
Cj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9OVjIxTSwNCj4gPiA+ID4gPiArCQku
YnBwID0gMTIsDQo+ID4gPiA+ID4gKwkJLnBsYW5lcyA9IDIsDQo+ID4gPiA+ID4gKwkJLmhzdWIg
PSAyLA0KPiA+ID4gPiA+ICsJfSwgew0KPiA+ID4gPiA+ICsJCS5mb3VyY2MgPSBEUk1fRk9STUFU
X05WMTYsDQo+ID4gPiA+ID4gKwkJLnY0bDIgPSBWNEwyX1BJWF9GTVRfTlYxNk0sDQo+ID4gPiA+
ID4gKwkJLmJwcCA9IDE2LA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAyLA0KPiA+ID4gPiA+ICsJ
CS5oc3ViID0gMiwNCj4gPiA+ID4gPiArCX0sDQo+ID4gPiA+ID4gKwl7DQo+ID4gPiA+ID4gKwkJ
LmZvdXJjYyA9IERSTV9GT1JNQVRfUkdCMzMyLA0KPiA+ID4gPiA+ICsJCS52NGwyID0gVjRMMl9Q
SVhfRk1UX1JHQjMzMiwNCj4gPiA+ID4gPiArCQkuYnBwID0gOCwNCj4gPiA+ID4gPiArCQkucGxh
bmVzID0gMSwNCj4gPiA+ID4gPiArCQkuaHN1YiA9IDEsDQo+ID4gPiA+ID4gKwl9LCB7DQo+ID4g
PiA+ID4gKwkJLmZvdXJjYyA9IERSTV9GT1JNQVRfQVJHQjQ0NDQsDQo+ID4gPiA+ID4gKwkJLnY0
bDIgPSBWNEwyX1BJWF9GTVRfQVJHQjQ0NCwNCj4gPiA+ID4gPiArCQkuYnBwID0gMTYsDQo+ID4g
PiA+ID4gKwkJLnBsYW5lcyA9IDEsDQo+ID4gPiA+ID4gKwkJLmhzdWIgPSAxLA0KPiA+ID4gPiA+
ICsJfSwgew0KPiA+ID4gPiA+ICsJCS5mb3VyY2MgPSBEUk1fRk9STUFUX1hSR0I0NDQ0LA0KPiA+
ID4gPiA+ICsJCS52NGwyID0gVjRMMl9QSVhfRk1UX1hSR0I0NDQsDQo+ID4gPiA+ID4gKwkJLmJw
cCA9IDE2LA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0g
MSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9S
R0JBNDQ0NCwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9SR0JBNDQ0LA0KPiA+
ID4gPiA+ICsJCS5icHAgPSAxNiwNCj4gPiA+ID4gPiArCQkucGxhbmVzID0gMSwNCj4gPiA+ID4g
PiArCQkuaHN1YiA9IDEsDQo+ID4gPiA+ID4gKwl9LCB7DQo+ID4gPiA+ID4gKwkJLmZvdXJjYyA9
IERSTV9GT1JNQVRfUkdCWDQ0NDQsDQo+ID4gPiA+ID4gKwkJLnY0bDIgPSBWNEwyX1BJWF9GTVRf
UkdCWDQ0NCwNCj4gPiA+ID4gPiArCQkuYnBwID0gMTYsDQo+ID4gPiA+ID4gKwkJLnBsYW5lcyA9
IDEsDQo+ID4gPiA+ID4gKwkJLmhzdWIgPSAxLA0KPiA+ID4gPiA+ICsJfSwgew0KPiA+ID4gPiA+
ICsJCS5mb3VyY2MgPSBEUk1fRk9STUFUX0FCR1I0NDQ0LA0KPiA+ID4gPiA+ICsJCS52NGwyID0g
VjRMMl9QSVhfRk1UX0FCR1I0NDQsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDE2LA0KPiA+ID4gPiA+
ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiArCX0s
IHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9YQkdSNDQ0NCwNCj4gPiA+ID4g
PiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9YQkdSNDQ0LA0KPiA+ID4gPiA+ICsJCS5icHAgPSAx
NiwNCj4gPiA+ID4gPiArCQkucGxhbmVzID0gMSwNCj4gPiA+ID4gPiArCQkuaHN1YiA9IDEsDQo+
ID4gPiA+ID4gKwl9LCB7DQo+ID4gPiA+ID4gKwkJLmZvdXJjYyA9IERSTV9GT1JNQVRfQkdSQTQ0
NDQsDQo+ID4gPiA+ID4gKwkJLnY0bDIgPSBWNEwyX1BJWF9GTVRfQkdSQTQ0NCwNCj4gPiA+ID4g
PiArCQkuYnBwID0gMTYsDQo+ID4gPiA+ID4gKwkJLnBsYW5lcyA9IDEsDQo+ID4gPiA+ID4gKwkJ
LmhzdWIgPSAxLA0KPiA+ID4gPiA+ICsJfSwgew0KPiA+ID4gPiA+ICsJCS5mb3VyY2MgPSBEUk1f
Rk9STUFUX0JHUlg0NDQ0LA0KPiA+ID4gPiA+ICsJCS52NGwyID0gVjRMMl9QSVhfRk1UX0JHUlg0
NDQsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDE2LA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0K
PiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQku
Zm91cmNjID0gRFJNX0ZPUk1BVF9SR0JBNTU1MSwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJf
UElYX0ZNVF9SR0JBNTU1LA0KPiA+ID4gPiA+ICsJCS5icHAgPSAxNiwNCj4gPiA+ID4gPiArCQku
cGxhbmVzID0gMSwNCj4gPiA+ID4gPiArCQkuaHN1YiA9IDEsDQo+ID4gPiA+ID4gKwl9LCB7DQo+
ID4gPiA+ID4gKwkJLmZvdXJjYyA9IERSTV9GT1JNQVRfUkdCWDU1NTEsDQo+ID4gPiA+ID4gKwkJ
LnY0bDIgPSBWNEwyX1BJWF9GTVRfUkdCWDU1NSwNCj4gPiA+ID4gPiArCQkuYnBwID0gMTYsDQo+
ID4gPiA+ID4gKwkJLnBsYW5lcyA9IDEsDQo+ID4gPiA+ID4gKwkJLmhzdWIgPSAxLA0KPiA+ID4g
PiA+ICsJfSwgew0KPiA+ID4gPiA+ICsJCS5mb3VyY2MgPSBEUk1fRk9STUFUX0FCR1IxNTU1LA0K
PiA+ID4gPiA+ICsJCS52NGwyID0gVjRMMl9QSVhfRk1UX0FCR1I1NTUsDQo+ID4gPiA+ID4gKwkJ
LmJwcCA9IDE2LA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3Vi
ID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1B
VF9YQkdSMTU1NSwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9YQkdSNTU1LA0K
PiA+ID4gPiA+ICsJCS5icHAgPSAxNiwNCj4gPiA+ID4gPiArCQkucGxhbmVzID0gMSwNCj4gPiA+
ID4gPiArCQkuaHN1YiA9IDEsDQo+ID4gPiA+ID4gKwl9LCB7DQo+ID4gPiA+ID4gKwkJLmZvdXJj
YyA9IERSTV9GT1JNQVRfQkdSQTU1NTEsDQo+ID4gPiA+ID4gKwkJLnY0bDIgPSBWNEwyX1BJWF9G
TVRfQkdSQTU1NSwNCj4gPiA+ID4gPiArCQkuYnBwID0gMTYsDQo+ID4gPiA+ID4gKwkJLnBsYW5l
cyA9IDEsDQo+ID4gPiA+ID4gKwkJLmhzdWIgPSAxLA0KPiA+ID4gPiA+ICsJfSwgew0KPiA+ID4g
PiA+ICsJCS5mb3VyY2MgPSBEUk1fRk9STUFUX0JHUlg1NTUxLA0KPiA+ID4gPiA+ICsJCS52NGwy
ID0gVjRMMl9QSVhfRk1UX0JHUlg1NTUsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDE2LA0KPiA+ID4g
PiA+ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiAr
CX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9CR1I4ODgsDQo+ID4gPiA+
ID4gKwkJLnY0bDIgPSBWNEwyX1BJWF9GTVRfUkdCMjQsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDI0
LA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4g
PiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9SR0I4ODgs
DQo+ID4gPiA+ID4gKwkJLnY0bDIgPSBWNEwyX1BJWF9GTVRfQkdSMjQsDQo+ID4gPiA+ID4gKwkJ
LmJwcCA9IDI0LA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3Vi
ID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1B
VF9SR0JBODg4OCwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9CR1JBMzIsDQo+
ID4gPiA+ID4gKwkJLmJwcCA9IDMyLA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4g
PiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNj
ID0gRFJNX0ZPUk1BVF9SR0JYODg4OCwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJfUElYX0ZN
VF9CR1JYMzIsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDMyLA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMg
PSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4g
PiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9BQkdSODg4OCwNCj4gPiA+ID4gPiArCQkudjRsMiA9
IFY0TDJfUElYX0ZNVF9SR0JBMzIsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDMyLA0KPiA+ID4gPiA+
ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiArCX0s
IHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9YQkdSODg4OCwNCj4gPiA+ID4g
PiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9SR0JYMzIsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDMy
LA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4g
PiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9CR1JBODg4
OCwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9BUkdCMzIsDQo+ID4gPiA+ID4g
KwkJLmJwcCA9IDMyLA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0KPiA+ID4gPiA+ICsJCS5o
c3ViID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZP
Uk1BVF9CR1JYODg4OCwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9YUkdCMzIs
DQo+ID4gPiA+ID4gKwkJLmJwcCA9IDMyLA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0KPiA+
ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91
cmNjID0gRFJNX0ZPUk1BVF9SR0JYMTAxMDEwMiwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJf
UElYX0ZNVF9SR0JYMTAxMDEwMiwNCj4gPiA+ID4gPiArCQkuYnBwID0gMzIsDQo+ID4gPiA+ID4g
KwkJLnBsYW5lcyA9IDEsDQo+ID4gPiA+ID4gKwkJLmhzdWIgPSAxLA0KPiA+ID4gPiA+ICsJfSwg
ew0KPiA+ID4gPiA+ICsJCS5mb3VyY2MgPSBEUk1fRk9STUFUX1JHQkExMDEwMTAyLA0KPiA+ID4g
PiA+ICsJCS52NGwyID0gVjRMMl9QSVhfRk1UX1JHQkExMDEwMTAyLA0KPiA+ID4gPiA+ICsJCS5i
cHAgPSAzMiwNCj4gPiA+ID4gPiArCQkucGxhbmVzID0gMSwNCj4gPiA+ID4gPiArCQkuaHN1YiA9
IDEsDQo+ID4gPiA+ID4gKwl9LCB7DQo+ID4gPiA+ID4gKwkJLmZvdXJjYyA9IERSTV9GT1JNQVRf
QVJHQjIxMDEwMTAsDQo+ID4gPiA+ID4gKwkJLnY0bDIgPSBWNEwyX1BJWF9GTVRfQVJHQjIxMDEw
MTAsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDMyLA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAxLA0K
PiA+ID4gPiA+ICsJCS5oc3ViID0gMSwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQku
Zm91cmNjID0gRFJNX0ZPUk1BVF9ZVllVLA0KPiA+ID4gPiA+ICsJCS52NGwyID0gVjRMMl9QSVhf
Rk1UX1lWWVUsDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDE2LA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMg
PSAxLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMiwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4g
PiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9OVjYxLA0KPiA+ID4gPiA+ICsJCS52NGwyID0gVjRM
Ml9QSVhfRk1UX05WNjFNLA0KPiA+ID4gPiA+ICsJCS5icHAgPSAxNiwNCj4gPiA+ID4gPiArCQku
cGxhbmVzID0gMiwNCj4gPiA+ID4gPiArCQkuaHN1YiA9IDIsDQo+ID4gPiA+ID4gKwl9LCB7DQo+
ID4gPiA+ID4gKwkJLmZvdXJjYyA9IERSTV9GT1JNQVRfWVVWNDIwLA0KPiA+ID4gPiA+ICsJCS52
NGwyID0gVjRMMl9QSVhfRk1UX1lVVjQyME0sDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDEyLA0KPiA+
ID4gPiA+ICsJCS5wbGFuZXMgPSAzLA0KPiA+ID4gPiA+ICsJCS5oc3ViID0gMiwNCj4gPiA+ID4g
PiArCX0sIHsNCj4gPiA+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9ZVlU0MjAsDQo+ID4g
PiA+ID4gKwkJLnY0bDIgPSBWNEwyX1BJWF9GTVRfWVZVNDIwTSwNCj4gPiA+ID4gPiArCQkuYnBw
ID0gMTIsDQo+ID4gPiA+ID4gKwkJLnBsYW5lcyA9IDMsDQo+ID4gPiA+ID4gKwkJLmhzdWIgPSAy
LA0KPiA+ID4gPiA+ICsJfSwgew0KPiA+ID4gPiA+ICsJCS5mb3VyY2MgPSBEUk1fRk9STUFUX1lV
VjQyMiwNCj4gPiA+ID4gPiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9ZVVY0MjJNLA0KPiA+ID4g
PiA+ICsJCS5icHAgPSAxNiwNCj4gPiA+ID4gPiArCQkucGxhbmVzID0gMywNCj4gPiA+ID4gPiAr
CQkuaHN1YiA9IDIsDQo+ID4gPiA+ID4gKwl9LCB7DQo+ID4gPiA+ID4gKwkJLmZvdXJjYyA9IERS
TV9GT1JNQVRfWVZVNDIyLA0KPiA+ID4gPiA+ICsJCS52NGwyID0gVjRMMl9QSVhfRk1UX1lWVTQy
Mk0sDQo+ID4gPiA+ID4gKwkJLmJwcCA9IDE2LA0KPiA+ID4gPiA+ICsJCS5wbGFuZXMgPSAzLA0K
PiA+ID4gPiA+ICsJCS5oc3ViID0gMiwNCj4gPiA+ID4gPiArCX0sIHsNCj4gPiA+ID4gPiArCQku
Zm91cmNjID0gRFJNX0ZPUk1BVF9ZVVY0NDQsDQo+ID4gPiA+ID4gKwkJLnY0bDIgPSBWNEwyX1BJ
WF9GTVRfWVVWNDQ0TSwNCj4gPiA+ID4gPiArCQkuYnBwID0gMjQsDQo+ID4gPiA+ID4gKwkJLnBs
YW5lcyA9IDMsDQo+ID4gPiA+ID4gKwkJLmhzdWIgPSAxLA0KPiA+ID4gPiA+ICsJfSwgew0KPiA+
ID4gPiA+ICsJCS5mb3VyY2MgPSBEUk1fRk9STUFUX1lWVTQ0NCwNCj4gPiA+ID4gPiArCQkudjRs
MiA9IFY0TDJfUElYX0ZNVF9ZVlU0NDRNLA0KPiA+ID4gPiA+ICsJCS5icHAgPSAyNCwNCj4gPiA+
ID4gPiArCQkucGxhbmVzID0gMywNCj4gPiA+ID4gPiArCQkuaHN1YiA9IDEsDQo+ID4gPiA+ID4g
Kwl9LCB7DQo+ID4gPiA+ID4gKwkJLmZvdXJjYyA9IERSTV9GT1JNQVRfWTIxMCwNCj4gPiA+ID4g
PiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9ZMjEwLA0KPiA+ID4gPiA+ICsJCS5icHAgPSAzMiwN
Cj4gPiA+ID4gPiArCQkucGxhbmVzID0gMSwNCj4gPiA+ID4gPiArCQkuaHN1YiA9IDIsDQo+ID4g
PiA+ID4gKwl9LCB7DQo+ID4gPiA+ID4gKwkJLmZvdXJjYyA9IERSTV9GT1JNQVRfWTIxMiwNCj4g
PiA+ID4gPiArCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9ZMjEyLA0KPiA+ID4gPiA+ICsJCS5icHAg
PSAzMiwNCj4gPiA+ID4gPiArCQkucGxhbmVzID0gMSwNCj4gPiA+ID4gPiArCQkuaHN1YiA9IDIs
DQo+ID4gPiA+ID4gKwl9LA0KPiA+ID4gPiA+ICt9Ow0KPiA+ID4gPg0KPiA+ID4gPiBJIHNlZSBs
aXN0ZWQgYXMgc3VwcG9ydGVkIGZvcm1hdHMgaW4gdGhlIERVIGZlYXR1cmVzIGxpc3QNCj4gPiA+
ID4NCj4gPiA+ID4gSW5wdXQgZGF0YSBmb3JtYXQgKGZyb20gVlNQRCk6IFJHQjg4OCwgUkdCNjY2
IChub3Qgc3VwcG9ydHMNCj4gPiA+ID4gZGl0aGVyaW5nIG9mDQo+ID4gPiA+IFJHQjU2NSkNCj4g
PiA+ID4g4oiSIE91dHB1dCBkYXRhIGZvcm1hdDogc2FtZSBhcyBJbnB1dCBkYXRhIGZvcm1hdA0K
PiA+ID4gPg0KPiA+ID4gPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nID8NCj4gPiA+DQo+ID4gPiBJ
ZiB5b3Ugc2VlIHRoZSBwaXBlbGluZSBiZWxvdywgdGhlIEltYWdlIGJ1ZmZlciBpcyByZWFkIGJ5
IFJQRiBhbmQNCj4gPiA+IGZpbmFsbHkgcmVuZGVyZWQgdG8gRFUgYXMgdGhlIFZTUCBpcyB0aGUg
Y29tcG9zaXRvci4NCj4gPiA+DQo+ID4gPiBJbWFnZWJ1ZmZlciAoWVVWKSAtLT4gUlBGKFlVVikt
LT5XUEYoWVVWKS0tPkxJRihSR0IpLS0+RFUoUkdCKQ0KPiANCj4gSSBzZWUsIGFyZW4ndCBSUEYv
V1BGIGFuZCBMSUYgcGFydCBvZiBWU1AgPyBXaHkgZG8geW91IG5lZWQgdG8gbGlzdCBZVVYNCj4g
Zm9ybWF0cyBoZXJlIGlmIHRoZSBEVSBvbmx5IGFjY2VwdHMgUkdCIGFzIGlucHV0ID8NCg0KQWdy
ZWVkLiBXaWxsIHNlbmQgVjExLg0KDQpDaGVlcnMsDQpCaWp1DQo=
