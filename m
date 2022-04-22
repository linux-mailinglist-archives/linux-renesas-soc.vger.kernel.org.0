Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2BB050B600
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 13:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381829AbiDVLS0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 07:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376986AbiDVLSY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 07:18:24 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2121.outbound.protection.outlook.com [40.107.113.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC069517CA;
        Fri, 22 Apr 2022 04:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kty5qosGAc0wHfTfM8MQfkSg6FYcqPplMrFJ8FA3OwB7AjgPTFdm02SoCJgAZSjBcjxD7408YvoH1q0JwZvCxxtlxJpSKMH5S9yJoLyvaV7p6Y1eJo7QaFGKVBfTijla/iOaFXqvCbtEGS7l/FqbA41LPhgt8wX9/8RkYo0bcuRuFObPm08an0IqbqlF9XariXNiHjNKHh9DMwQFjBqprTNdTouCzSrhXoj+rN51m/Dvl5LanZQk9T/eJK8BcuBEIka6VH77UQcf3/WoalG9eAWb+NJMzwmGicPYUrfTNf9OxaYjmilcvaltPwKTGnxFweHTjH3qanmhllgK+R2GHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KYkKcyAWJEwFa5pBrSxeKCynIzcxJQitqqIjlOTk98=;
 b=SQrZXinruWFrpR55mBEKB/Gb3f2ZfH2iwsSbu10FovadrCX+Dkokgga/4ifeVCXNtR1PiUQD8PVaq80c8//A3O0zx0axIqXv55uPmxXUdRbl+ifKuvnN7d+m+pZaoG8RnJKvqHadNx55uJ/rWlTmtOo+YUTLs56ZIqCrpYjKl6HLfXMLp31XXhhrzo3B3CtGVaPVgP+CTRv+FairJSGulgAWYx6npWGXBAeB5j5hcCaLzEcTLUJWG9nLdBg4Tk0cZy78Qr3JIDtMabKKhvpQ+hGc0MKXIX8OIHtOc3v4lp0utuGphaYWUqQcsw2mBU+gkGMAmcMDFeU+byP3dAFH2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KYkKcyAWJEwFa5pBrSxeKCynIzcxJQitqqIjlOTk98=;
 b=mmyAJOGqGZUU29eki8iBedlJn7EivCD5uCXS6GNnj0Nr8HAP4uRVNEJXSi/qvAQSOnmL53PtmmxnQ/bY9EvbTl1jbMYm9RQA3WzTlnKFaDRILigv6Sk5QvgSoBJzGnRUMcLOsaESCF82WUAhu3U6tRI3dOIj94bwcUIURDezDN4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9601.jpnprd01.prod.outlook.com (2603:1096:400:192::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 11:15:29 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 11:15:29 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/9] clk: renesas: rzg2l: Add DSI divider clk support
Thread-Topic: [PATCH 3/9] clk: renesas: rzg2l: Add DSI divider clk support
Thread-Index: AQHYOvDKCq9hd4IZo0qAvrESkuQ746z6Nm8AgAHHRNA=
Date:   Fri, 22 Apr 2022 11:15:29 +0000
Message-ID: <OS0PR01MB59220A6CE01D617EB4F1A29D86F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220318175113.8956-1-biju.das.jz@bp.renesas.com>
 <20220318175113.8956-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdV9Rt6_VQ4oU-FAAM=vdrG22Qc2yBHTrEd-NrAu3FejWw@mail.gmail.com>
In-Reply-To: <CAMuHMdV9Rt6_VQ4oU-FAAM=vdrG22Qc2yBHTrEd-NrAu3FejWw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcd8d8fc-fdcb-4b0a-a366-08da245168e9
x-ms-traffictypediagnostic: TYCPR01MB9601:EE_
x-microsoft-antispam-prvs: <TYCPR01MB9601103CDD3463B29B04844086F79@TYCPR01MB9601.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L4coybu5asB8lotGi8BrnWYsA6ADpbGSXL5p2dcjNPqfuIRKucpo/c7W0eOF6ue2ioJXjRv1dbAtBPGoe01b+xnX6DFbaBioxoCXwCe6WCJa6YygUhaj3ofHz9bwMJrPl7BOysh8J4h68nbQm2T6BoM/wK8VvlAL6WBwGIE+YfmhFxI6EVT2xX7ctQDb8hYWiuCS1drUjT47+lUA6t44YfPYVcyV4a/k0swWOSGV90aigUSIpCGcCg9SN80cIcIyOi7L8iIwMjL782NA9PIt3/aMsEChwnbRAAJffQHQoD6+kZOL/BR11NfbXTb0RS2KmOOVfAjoZa2XzFkPY9s0MJBxY9mZV8VWV8m0MFkaEIzmtNxNRayu6DxhjclkqocBk6qDLQKcOw7VPEI4EY50pH1ZnPy9zNm6K80zYPAkUnL3cuNMyucbo95uH3hFNSCh7jSUbgQj0H+b4OeuWrRcEmf0YT7v9QscTI0+T/3HXct0TbIweU8EfQb8WXYylFMZrtGNdCH/LgGaD4JchA2CG1r2TUY7gWgt037sRiPcbFyyNkWi/15MemRdvmeeTTQrCgQRsBbt8cwF5RXvyEkrHcbiavmt8uMX7Za37lGRRr9RKAAm58s1gJ2cDD3F9WbzDJuKKX3zXbAenzEnixy922BuWk2te0vCJRmX7OA4Ou4ZgXHa/SBN2rodTVmJVzsakiVXGK3lXac9MPh/N+WHHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(5660300002)(508600001)(8936002)(71200400001)(76116006)(122000001)(33656002)(316002)(38070700005)(66946007)(53546011)(2906002)(186003)(26005)(7696005)(107886003)(66476007)(38100700002)(64756008)(8676002)(4326008)(6916009)(66446008)(52536014)(54906003)(83380400001)(86362001)(66556008)(55016003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWp4UjFkNUJOQ1pPV3RXbXdQcnJxcUlSNWRqRGs0NE9SR0JsejBrVnh1aUI2?=
 =?utf-8?B?L0NkOEdNVDYxd3pNU1V4dFZWWjFwazNXT2ZJRzR1NmRmS1h6WXZiR2h6dXh4?=
 =?utf-8?B?UnJVUmxhRHY1azFMRjhoTE1EUlNGSmcvbTZ6Um10NXZLZXR5eCtKOUtYNjBX?=
 =?utf-8?B?dk5ZbTBsUXMrRDF2cW8xTEk3REJ6QTNOVFRvRGc4WEYzUkRUM01TRGZyVmVQ?=
 =?utf-8?B?dDFZYXhPUEJmd2crT1UzYWNUUE5TL2ozTU5CZHBwMUVhK1pVaTh2RkpOL0xE?=
 =?utf-8?B?NjFqSXpxaHJGZ2hLS01BTlNBWm5iTVBYbENMbmZPUGNpbFAxVXdxQTFTMngz?=
 =?utf-8?B?TUoyOVZhNzZLMmhTN204QlZCWlJvcnh4eGtLTHYrTE93Ync0VUIrbjNpZU5k?=
 =?utf-8?B?d0xVQ3FpamhYbEhoY0NTME9hbmFEalNSV21aaHZZQzQyU3BaY3JySmFETEdT?=
 =?utf-8?B?enhCSllWNzFqLzhVcDFva2hHWm9SSVJYMkNuNm5menR4cEo0ZEVCN2ttL0hU?=
 =?utf-8?B?dDFlc2o0cEZ2d3cvRUtzZDZmcnVyZnR2SW0yU2owQjJRWUswb3l4N1kxdGZQ?=
 =?utf-8?B?eEhvUEEyanZqWFZZbVlSNlBOcy9kd2dxcnpxNnBVbGFDSXpxeUNkazBhSHk4?=
 =?utf-8?B?aHcxTWNRRkRvcy9IaGZFck9ZMk1vaHpZUkhoRHd2NmZlZEdFTVlOZUcrS2lH?=
 =?utf-8?B?WFpwRmJtWStDaWdMZ1NqV0FMUE12N2oxbXMySWNYc0gvcUxsbC9QNnRwWE9n?=
 =?utf-8?B?Vmdma1ZLd1YzVTdlb0dqQnZEd0ZtUTVHajNqdEFHTnVqdnRvWU5WYUVYZUNq?=
 =?utf-8?B?MmVISjJXRU5QSVA1NkdGS2Zsb0lDMWNoZTd0ZjZ2Y2haV3luUm00SGwrZGVX?=
 =?utf-8?B?emJuTUFJYVdQK0VGZVFmaXdlaWR5K0NPOUI1b2NmN0owenBYcUFsWHg2TzFB?=
 =?utf-8?B?ZER2L1FMQ1JnV09KTXdsVUpiTnZ5ZmU0NVNLa3JrMFJWTzFJWE1oc0xlRzF0?=
 =?utf-8?B?WFRHcmwydTZNVHFZbEtBVDRzcFFtTFpXSGl4SzB5d2I4LzhqNFAvbVdpUlc5?=
 =?utf-8?B?UDM5QisrYlJSaVorZmxmcEdLSXdRK05BNkJWdGw1NEcvSUVmQXhXL0ZJVGhW?=
 =?utf-8?B?YlhiUng1YlRBWEpvTC9EWnFiNmdKUk93THo1NU83eldGYmlRb1g4eGp4dk1o?=
 =?utf-8?B?QnBkMDJZMElQTkV5RlpoNWhJaHpyQ3J4VkpXMGc5MDFETDlVa2d2VzB0ZDJM?=
 =?utf-8?B?M1NSeHQwZk1JTWtGeHlzRXovd0xMM1VmOXcybG5GaWZLbUpvY1VqMDQ0Qkpa?=
 =?utf-8?B?dTJvRFl4Zkh6eWVEU01YaStWd1BrdzV6aUpUNkhIQzFLSUtzMzY4eFhkU0p5?=
 =?utf-8?B?bE1CeFNNRFh4akR5NDBuZUViTEI2RWg4djBMTmxHUHJmbURPTWFkTkxPT1hC?=
 =?utf-8?B?Z3FHcDhDMGdJV1doK0k0WEMvdnlIcm5kbUVYVWJCQ0FMN0pqeW5ESWhIaHFv?=
 =?utf-8?B?dUlDcTNOREZYY1NleDNLc25YTS9sWkFSTWd5czB4b01kVVZVellHOUFkYlJX?=
 =?utf-8?B?cExSZzJkcjgxWGc4Sm9zNCtLNWNFMnpHczRDZmRoR3h1ampVdnlNU2pzRk8y?=
 =?utf-8?B?OVhJMGd0V3BpQVdORXhoMURpNWlMcThXclF5M0RwUUV4dldqemdFNTRXRDdv?=
 =?utf-8?B?aGt1TFR3TUV0NlY5YmdFc3E3RVBZNjJtOVlkclMwL004ZEZDcXM2U2pXbVFB?=
 =?utf-8?B?MlFYYmo4Nk9JNWYrZktsYUhYK1p2V000eC8zZDFuYjhXTEg1RFlxWFN2MmFT?=
 =?utf-8?B?R3p2aERhRlNBcXZld0tEMndQOFNqYytOSnZrVGdiMm5nVlJvMG9qdTg1WEJG?=
 =?utf-8?B?WmhXOHl4dGZrNjNDWGJ1SHdLYkJEOU9iUmlsZDRVaTVCNnpPTllIRktKWUNQ?=
 =?utf-8?B?ZU9jQTcvNy9IWUR4WHg1cFJWbXpMSDFCOVFCaHRHUWhmNDhJV0hsNXRYYWtB?=
 =?utf-8?B?Z3VLTWtWN3BpRUErbHl1eGlSWm4vUVNBeGs0VUI2SGtZSFFrUkRaRWVqMjB0?=
 =?utf-8?B?UXl5U216STVrQ0JubUhUbU02SFQvem1BekRZWkZiUUJrdVFlVjk2T203ZzRL?=
 =?utf-8?B?c2VOaVpYNm9wSk1xYmVnKzdRaWRmdkE0Mk1HL2E3UzFyYXpCclNwYklYSWhj?=
 =?utf-8?B?LzdpdEtTS3hwRzUvN29KZjdnYUpzak1RZDZ2SEN3eXBqWTlUOVFNZ2llS0xG?=
 =?utf-8?B?VG5abTY4cU1BWFR5V29YM2tvMmN4RzVwVm0vdjVCNFJaZ3Q0WXBuNXZzamVP?=
 =?utf-8?B?d3ZvTVJlWW93a2pvK3NnL3RyTE1idWFGdWZrTlJnMWtFNmJYYnhYMHR5VEY1?=
 =?utf-8?Q?kXpvdV2cVcz8rp8E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd8d8fc-fdcb-4b0a-a366-08da245168e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 11:15:29.7127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GtVo5cH2NdfVj1h9zxeZfZw3cKv4p5vWy1dIOiCQ16llcYFgPlZkJGNgxWJi3i8Ea4mp15d9LuBoTzYUWrKkMHLeXuluplKph+r3kw8IwoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9601
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMy85XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgRFNJIGRpdmlkZXIgY2xrIHN1cHBv
cnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIE1hciAxOCwgMjAyMiBhdCA2OjUxIFBN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gTTMg
Y2xvY2sgaXMgc291cmNlZCBmcm9tIERTSSBEaXZpZGVyIChEU0lESVZBICogRFNJRElWQikNCj4g
Pg0KPiA+IFRoaXMgcGF0Y2ggYWRkIHN1cHBvcnQgZm9yIERTSSBkaXZpZGVyIGNsayBieSBjb21i
YWluaW5nIERTSURJVkEgYW5kDQo+ID4gRFNJRElWQiAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gUkZD
LT5WMQ0KPiA+ICAqIFJlbW92ZWQgTFVUIGFuZCBhZGRlZCBhbiBlcXVhdGlvbiBmb3IgY29tcHV0
aW5nIFZDTEsuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2Ry
aXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5l
c2FzL3J6ZzJsLWNwZy5jDQo+ID4gQEAgLTI3OSw2ICsyODIsMTE0IEBAIHJ6ZzJsX2NwZ19zZF9t
dXhfY2xrX3JlZ2lzdGVyKGNvbnN0IHN0cnVjdA0KPiBjcGdfY29yZV9jbGsgKmNvcmUsDQo+ID4g
ICAgICAgICByZXR1cm4gY2xrX2h3LT5jbGs7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdHJ1Y3QgZHNp
X2Rpdl9od19kYXRhIHsNCj4gPiArICAgICAgIHN0cnVjdCBjbGtfaHcgaHc7DQo+ID4gKyAgICAg
ICB1MzIgY29uZjsNCj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgcmF0ZTsNCj4gPiArICAgICAg
IHN0cnVjdCByemcybF9jcGdfcHJpdiAqcHJpdjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNkZWZp
bmUgdG9fZHNpX2Rpdl9od19kYXRhKF9odykgICAgICAgIGNvbnRhaW5lcl9vZihfaHcsIHN0cnVj
dA0KPiBkc2lfZGl2X2h3X2RhdGEsIGh3KQ0KPiA+ICsNCj4gPiArc3RhdGljIHVuc2lnbmVkIGxv
bmcgcnpnMmxfY3BnX2RzaV9kaXZfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZw0KPiA+ICtwYXJlbnRfcmF0ZSkgew0KPiA+ICsgICAgICAgc3RydWN0IGRzaV9kaXZf
aHdfZGF0YSAqZHNpX2RpdiA9IHRvX2RzaV9kaXZfaHdfZGF0YShodyk7DQo+ID4gKw0KPiA+ICsg
ICAgICAgcmV0dXJuIGRzaV9kaXYtPnJhdGU7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBs
b25nIHJ6ZzJsX2NwZ19kc2lfZGl2X3JvdW5kX3JhdGUoc3RydWN0IGNsa19odyAqaHcsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHJh
dGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nICpwYXJlbnRfcmF0ZSkNCj4gDQo+IFBsZWFzZSBpbXBsZW1lbnQgdGhlIGRldGVybWlu
ZV9yYXRlKCkgaW5zdGVhZC4NCg0KT0suDQo+IA0KPiA+ICsNCj4gDQo+IFBsZWFzZSBkcm9wIHRo
ZSBibGFuayBsaW5lLg0KT0suDQo+IA0KPiA+ICt7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZHNpX2Rp
dl9od19kYXRhICpkc2lfZGl2ID0gdG9fZHNpX2Rpdl9od19kYXRhKGh3KTsNCj4gPiArICAgICAg
IHN0cnVjdCByemcybF9jcGdfcHJpdiAqcHJpdiA9IGRzaV9kaXYtPnByaXY7DQo+ID4gKw0KPiA+
ICsgICAgICAgZHNpX2Rpdi0+cmF0ZSA9IHJhdGU7DQo+ID4gKw0KPiA+ICsgICAgICAgcHJpdi0+
cGxsNV9wYXJhbXMucGw1X2ludGluID0gcmF0ZSAvIE1FR0E7DQo+IA0KPiAucm91bmRfcmF0ZSgp
IChhbmQgLmRldGVybWluZV9yYXRlKCkpIGlzIHVzZWQgdG8gY2hlY2sgaWYgYSByYXRlIGlzDQo+
IHN1cHBvcnRlZCwgd2l0aG91dCBhY3R1YWxseSBjaGFuZ2luZyB0aGUgY2xvY2sgcmF0ZS4gIEhl
bmNlIHRoaXMgc2hvdWxkIG5vdA0KPiBvcGVyYXRlIG9uIHByaXYtPnBsbDVfcGFyYW1zLCBidXQg
b24gYSBsb2NhbCB2YXJpYWJsZS4NCj4gDQo+ID4gKyAgICAgICBwcml2LT5wbGw1X3BhcmFtcy5w
bDVfZnJhY2luID0gKChyYXRlICUgTUVHQSkgPDwgMjQpIC8gTUVHQTsNCj4gDQo+IFdoaWxlIHRo
aXMgd29ya3MgZmluZSBvbiA2NC1iaXQgKFJaL0cyTCBpcyBhcm02NCwgc28gdGhhdCdzIE9LKSwg
IihyYXRlICUNCj4gTUVHQSkgPDwgMjQiIHdpbGwgb3ZlcmZsb3cgd2hlbiBjb21waWxlLXRlc3Rp
bmcgb24gMzItYml0Lg0KPiBUYWtpbmcgaW50byBhY2NvdW50IHRoZSA2NC1ieS0zMiBkaXZpc2lv
biwgSSB0aGluayB0aGlzIHNob3VsZCBiZToNCj4gDQo+ICAgICBkaXZfdTY0KCgodTY0KXJhdGUg
JSBNRUdBKSA8PCAyNCwgTUVHQSk7DQoNCk9LLg0KDQo+IA0KPiA+ICsgICAgICAgcHJpdi0+cGxs
NV9wYXJhbXMucGw1X3JlZmRpdiA9IDI7DQo+ID4gKyAgICAgICBwcml2LT5wbGw1X3BhcmFtcy5w
bDVfcG9zdGRpdjEgPSAxOw0KPiA+ICsgICAgICAgcHJpdi0+cGxsNV9wYXJhbXMucGw1X3Bvc3Rk
aXYyID0gMTsNCj4gPiArICAgICAgIHByaXYtPnBsbDVfcGFyYW1zLmNsa3NyYyA9IDE7DQo+ID4g
KyAgICAgICBwcml2LT5wbGw1X3BhcmFtcy5kc2lfZGl2X2EgPSAxOw0KPiA+ICsgICAgICAgcHJp
di0+cGxsNV9wYXJhbXMuZHNpX2Rpdl9iID0gMjsNCj4gPiArDQo+ID4gKyAgICAgICBwcml2LT5w
bGw1X3BhcmFtcy5mcmVxdWVuY3kgPQ0KPiA+ICsgICAgICAgICAgICAgICBFWFRBTF9GUkVRX0lO
X01FR0FfSFogKiBNRUdBIC8gcHJpdi0NCj4gPnBsbDVfcGFyYW1zLnBsNV9yZWZkaXYgKg0KPiA+
ICsgICAgICAgICAgICAgICAoKCgocHJpdi0+cGxsNV9wYXJhbXMucGw1X2ludGluIDw8IDI0KSAr
IHByaXYtDQo+ID5wbGw1X3BhcmFtcy5wbDVfZnJhY2luKSkgPj4gMjQpIC8NCj4gPiArICAgICAg
ICAgICAgICAgKHByaXYtPnBsbDVfcGFyYW1zLnBsNV9wb3N0ZGl2MSAqDQo+ID4gKyBwcml2LT5w
bGw1X3BhcmFtcy5wbDVfcG9zdGRpdjIpOw0KPiA+ICsNCj4gPiArICAgICAgIGlmIChwcml2LT5w
bGw1X3BhcmFtcy5jbGtzcmMpDQo+ID4gKyAgICAgICAgICAgICAgIHByaXYtPnBsbDVfcGFyYW1z
LmZyZXF1ZW5jeSAvPSAyOw0KPiA+ICsNCj4gPiArICAgICAgICpwYXJlbnRfcmF0ZSA9IHByaXYt
PnBsbDVfcGFyYW1zLmZyZXF1ZW5jeTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gZHNpX2Rp
di0+cmF0ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCByemcybF9jcGdfZHNpX2Rp
dl9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmF0ZSwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpIHsNCj4gPiAr
ICAgICAgIHN0cnVjdCBkc2lfZGl2X2h3X2RhdGEgKmRzaV9kaXYgPSB0b19kc2lfZGl2X2h3X2Rh
dGEoaHcpOw0KPiA+ICsgICAgICAgc3RydWN0IHJ6ZzJsX2NwZ19wcml2ICpwcml2ID0gZHNpX2Rp
di0+cHJpdjsNCj4gPiArDQo+IA0KPiBZb3Ugc2hvdWxkIHVwZGF0ZSBwcml2LT5wbGw1X3BhcmFt
cyBoZXJlLCBpbnN0ZWFkIG9mIGluIHlvdXINCj4gLnJvdW5kX3JhdGUoKSBjYWxsYmFjay4NCg0K
SSBuZWVkIHRvIGZpbmQgcGFyZW50X3JhdGUgYmFzZWQgb24gdmlkZW8gY2xvY2sgZHVyaW5nIHtk
ZXRlcm1pbmUscm91bmQgcmF0ZX0NCkkgaGF2ZSBhZGRlZCB0aGVyZSB0byBhdm9pZCBkdXBsaWNh
dGlvbi4NCg0KSSBhZ3JlZSwgdGhlIGZvbGxvd2luZyB0byBiZSBzZXQgaGVyZSBpbnN0ZWFkIG9m
IHJvdW5kX3JhdGUoKSBjYWxsYmFjay4NCmRzaV9kaXYtPnJhdGUgPSByYXRlOw0KDQpDaGVlcnMs
DQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgICB3cml0ZWwoQ1BHX1BMNV9TRElWX0RJVl9EU0lfQV9X
RU4gfCBDUEdfUEw1X1NESVZfRElWX0RTSV9CX1dFTiB8DQo+ID4gKyAgICAgICAgICAgICAgKHBy
aXYtPnBsbDVfcGFyYW1zLmRzaV9kaXZfYSA8PCAwKSB8IChwcml2LQ0KPiA+cGxsNV9wYXJhbXMu
ZHNpX2Rpdl9iIDw8IDgpLA0KPiA+ICsgICAgICAgICAgICAgIHByaXYtPmJhc2UgKyBDUEdfUEw1
X1NESVYpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+IA0KPiBUaGUg
cmVzdCBMR1RNLg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcN
Cj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFs
aXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
