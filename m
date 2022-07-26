Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E8258118F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 13:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbiGZLFB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jul 2022 07:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbiGZLFA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 07:05:00 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFB62F64B;
        Tue, 26 Jul 2022 04:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOdxOE8uNh2/FdgDcjgpe1SQYduPLrMYLsBtsTn5aQVeIYz+pd4yLfbod3yAjl86LyT2BDiacpxZIK3vFXBDONTJlwkC7Tm3vxV9Os1eehwjRf0IdnbACvxvEErxDyoAcNyqxoZPxwLmcfFzFxLi5VrPuL+Ftlp296501ZoCdE27vyUUkOPvwu+jEiDpk/wbEz0GV6y4LojoYfvCm4/GX6JSStPeiMYqvWAdwsanLHLgRVBN5g1wM/Rdixl/ZgJPt8M1QGruPB0ApjReqg05Pc3q6n+j7B9SobMHrUO5/kugtpdVoO3HItQzYJBfMQxAquHlmswoMkHqf7fB5MYAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZOaErtYMjvDPp854yR64RZ+98tN9b9jZqPUCwZKA7Q=;
 b=YZ9wNwmyolL0O46OFqMxd+qY/geuRqCLe3g3f95u5pS308+wG/uH0cwn1Cr15zsfpD4bS9UmrzFt4nls9RsUhMVqdOoLH39/PkutR/arEEOkAnrqe9+xKHj3vqTa6+RdVJb7WlKyfF8VKzRnLqGBwQMZvKvL/NDWtAW0mfuSvCuGahj04aXai6baxKXZm6+94gD924nw/xC7mijCzUtMFGf/NbUsJchtxuTK9CSYKXJVq3F4UYF+JdurSWoc+PsgxQ/fLgXRc9UrwGfcUsR2TVcGAoQ4U9dXp9656onTdkK2wevrM6HNJlWRXJJNcuCNp0rxZB0gr1IyEN6gnUvX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZOaErtYMjvDPp854yR64RZ+98tN9b9jZqPUCwZKA7Q=;
 b=P+8NKcQQw9G5pJyy7B1/giB0PudUeBybgyhrKaKETnelH2XE4jKEOpjvDx4GbAUqETdXGO1FkI0q6HpDgjpRd9804R064s80bAFhT/S8/S5jlFB9KkH0vzDpzJnGZsiDaAzor0ct0BPKY4b5JHm8iLWQWVfH1ygKzM0hnbPBlnM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5935.jpnprd01.prod.outlook.com (2603:1096:400:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 11:04:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%6]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 11:04:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document
 RZ/G2UL USBPHY Control bindings
Thread-Topic: [PATCH] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document
 RZ/G2UL USBPHY Control bindings
Thread-Index: AQHYVxh9xytamYHrGEySmgxtbnTiUKz92eiAgJM2yUA=
Date:   Tue, 26 Jul 2022 11:04:53 +0000
Message-ID: <OS0PR01MB5922C5F56F72744C1D7641AD86949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423134601.141975-1-biju.das.jz@bp.renesas.com>
 <fd372f05-e811-a6c5-31ae-c80df44c9ae4@linaro.org>
In-Reply-To: <fd372f05-e811-a6c5-31ae-c80df44c9ae4@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c1bac69-948c-4f0d-d0a3-08da6ef6ab55
x-ms-traffictypediagnostic: TYCPR01MB5935:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x9cTX4PxCr1MRq8IWjokciljrvB6pxwnqqpdrpPYAbMRCAg1s39BR4VwDbMCCon4w+AzcdeC5N1i17I6OP/EJKLDsAXPalg1nansBR60hbJjrIMwNtWSqWmMS3qDbwT0grqX061YnJEl8GpcERO3l8K+pyHrfLqVbGaCiZ6h+aNNG/5DLPgDkg3lQtUy0+aKGYjl/VUPPP25A6itQ8NP1FpnywwmTSd5ASyxv09c4TuxrYG777gkq1x7t13SAUdiN/lDVDXWurzWzWxBmdSFS6WS6xQUz0jZtvCknXN6t0wK9wN9JLhxuJLPhoMo7kEbvxi/ANTo810RjXIV6wk7S3gFlz+W4/Pd7fAWtcessqh0aRALhH/lVFeoSe0mqq3iG6QASkyeAe7F1uUeFl6UjTaaNOF4N2zoHJrV71TvAe6efIVo3xQX6xuVTNUpOinSMB2YmLWt8oU6+Ucp6UPgDd6xq/pQzLgSXDtfD0oY5XLpUziLaQdZ2nLKhPXejFsrdyqdmGKEb12u69PIENlostmqU7G5BFh3pct6+Boavf0rI+fapm7r8HPZmsMZUy6r8wooiVW0o1QIJ8g0le7Ulz2Fz1uQLvf+ZIH/ZEnb00b9kHDIZoeOaKxVYEKe7VP9bKuIwNTqe45LJpIQ3NN9itgTsDTa6ElpRoNYHuCPPG0emCG0aa8RD+zbaddehaSkGD0h2F4Tc+lKqI7adNYwgn4eNOo2fbmqSY8jO+PvowZP/ePz8dzmSepRJiXP889Orsi26hrVjOuJMNT6TLUGTbG4NHAhHV3O9utCNlTVYmiLQXqNxUcmra9czaRwzGJk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(4326008)(110136005)(54906003)(55016003)(71200400001)(478600001)(41300700001)(316002)(2906002)(76116006)(66556008)(8676002)(66476007)(66946007)(4744005)(5660300002)(66446008)(64756008)(52536014)(122000001)(8936002)(26005)(33656002)(86362001)(38100700002)(83380400001)(6506007)(9686003)(7696005)(38070700005)(53546011)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emlPdmZqRXM4ZFc1ZUkrcGkzYmJDUG0wV2c0RXJqSjd6NWtKTitvZXhWU3hp?=
 =?utf-8?B?RDAzYnlsdThVb2YxZGhBaDI3ek9zYWRhK1NZTDRkaDJVTkpsV3Nob21YVWJi?=
 =?utf-8?B?cHkxbXg0Z0tDQkZWL3h5RkZMVDBRcW41YkszNkZOTTVwSy84TnJBOTlLc0th?=
 =?utf-8?B?VXZLMmVKYTNqSUp0MGFLZGM5U0xhdW0wUS83eHk2cHZrMmRvOGFFWGVRc21H?=
 =?utf-8?B?eUpNVWNTTzhqM1htTlp5RDNZeUNNYTc1WVVjR2xEa21ESjljM2w2VnZENnl4?=
 =?utf-8?B?UVpZRGtpMUZubHJYZTNtbVVKZkYvOFAyU3hjSGQyKzZOUk8vZFM0UU1jUURR?=
 =?utf-8?B?Q2puaE1ud2V6UldQeDQwODZrVGNONGlDSnBDVTFVY1BvM1prdTZxRjRmQzM3?=
 =?utf-8?B?aWZsZjAzcWJ6Yi9HUko4b2dYZ3UzVFdiMDdNNCtJYzdCc1hScmp4MGNBWGRX?=
 =?utf-8?B?Zzl0S2pBREtjWU0yZDF3Uk9ZSFFUcHcyNHRDTTBlUm9xaVVocHBGOE5uMytR?=
 =?utf-8?B?S2dHSE91ZjhubDZTY1R5c1Z3Uk5xVUJxQkxJd2U1UTg2djZHNEZudUJwOG9a?=
 =?utf-8?B?V1RPRUVISDFjazJOVnd1cXNBUWVsMzdBdWtPTVhQR2drTzErc29uNmZvMnU5?=
 =?utf-8?B?VE1SenhTanE4WWJRR0lHejBjZ0ZRVTAwT0c2R3lVQm5ramNUK2N4cjVtQUEz?=
 =?utf-8?B?SXNxTDFLL3RENDhZcEtRZWx6aXRxTU54MTFWQVVxcHlQdXdZM0pJcm42bmZ1?=
 =?utf-8?B?MEZWQ2d5cWZUTElKcGtvOUtkRk1WZkc2b2NJL2M3SmlrYmZTTzFwZFNLakZj?=
 =?utf-8?B?UzVERWdSR0xaSVk3dkVYRHk4dnBUcEViZmJnMzl0VStQU2tEOW1Ra25idWhh?=
 =?utf-8?B?emhKeE4yUldqVWpQclQ3ZWpZam1zWmhqVUZ5N3YyMkUrOTV2NlBCdXVVeXc4?=
 =?utf-8?B?MFFnK2xVb2VrWW1tdEZwdk81azBZQ1pDQVRZL0lkZmREWW1hYjg4UjlueHhH?=
 =?utf-8?B?MWRpSDZGTEpHVFh0SDBQR25KZWEvRWNsMWNpdkhyWXdjZm9ISk9BaGY0U2NT?=
 =?utf-8?B?dEszZjlWWEkvckdTNDFaTU53ejJHcjloUG9Oa0JYR1VXcWpYNnBKdTN4Z204?=
 =?utf-8?B?aElwYktOdXRBdmcyYWNDZEFMNDJybXBncFlPQm5uR3pEWHh4TVRyMlh2L1Q3?=
 =?utf-8?B?UkZQR0hLNjY0d2NYUzNjcTFJbnVxSWpQaGdGY1RZNDI4cHJoUDdZbmRLanlk?=
 =?utf-8?B?Tm1Ha05JT2taY2FLdkR0SFFaMXlSNklLNm9PL2FTVUdCZEFlS3ZIelVsM2VZ?=
 =?utf-8?B?aGdyTzBhZ05oVTdhSUQwUVRmT0RxSnY5a1pSSnRrOEplUGxUdnBqRUI5Rno1?=
 =?utf-8?B?ZFVrMUJmZ2h0MXFncVlOLzlYNS85OERwY0JpZzU0eWM4MDRPMUtHbTFpa05F?=
 =?utf-8?B?Yk9wZFVsQSswTFF4Q0hZb25QZlkxOTZEdVlZbFFJbWxJUG1IVVlCU2NxU1VJ?=
 =?utf-8?B?SWtzb3JFY3pvS1ZuYjFQU2pSOHRQcTE4V2NnTC9NNTBMaTZsRVBwRllSUDF4?=
 =?utf-8?B?RlExQjJISVVXb0k1NUxaYkozdHRtU0lCYllMV1h2cWs5K3lyRW0rdXo0NHZQ?=
 =?utf-8?B?alJGZTI1aWZhRUo5QnFOK2laQTUwSEhTdDRiR0NSTXRFQ3ltdjV1UGJlMHdR?=
 =?utf-8?B?Y1dMRnJNWG8yS2gvVWpkdWdyNjFxWFFGVmxOeVRYWnVSYkZOcHdWZUpUdVVn?=
 =?utf-8?B?eVM0aGdiS2ZlSEFwNGEzdVQ3NzJvdUZxM2xMc0Z6amt5dEhXZG5NUHc2cWN4?=
 =?utf-8?B?U0FWUzhVblNkRzA2dTl5c0N4eTdOcUtUdlZqVzQ1azQyN2xoY1drN01kMEl0?=
 =?utf-8?B?Mk84Z1RsRDZ5NStyNGNPU0xYRnZiVXBMUm1KQ0dyRnFHMzdld2xQTmg0NEVV?=
 =?utf-8?B?anpVc3R2dDN1bTNjTXByU2J6Zms5K2EyQzd3bUFuVCtBM1NoL3B3TWdmbGI2?=
 =?utf-8?B?d1ZNcGJmRHRzeVVwRkg1VE1MSlhwd2hMbHBZRzhuVlNkcXZpd0VaaDZKVFo4?=
 =?utf-8?B?bVd5MXhtelJzU0lPVW0vWlJFa3NCRDNPTG8rM1I2ai9KamxHeGZBUlgreVB5?=
 =?utf-8?B?dE8zZTF0aDZvYm9xZ1BBdm9IUWZwUnc4THVKNGpYVy9HSWZBNHZxUEFLY0gv?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1bac69-948c-4f0d-d0a3-08da6ef6ab55
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 11:04:54.1414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4oP02PvbFGYA0VolMa7MMsidzbAGy54IhAI6m7yOkWmRIVRaGn2cm4d8S6bixcZibDaQRv2pqtfY6pDWNxNajwsQ9zMj9kB9IrMJa+7gxz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5935
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQWxsLA0KDQpHZW50bGUgcGluZy4NCg0KQXJlIHdlIGhhcHB5IHdpdGggdGhpcyBwYXRjaD8N
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4g
U2VudDogMjMgQXByaWwgMjAyMiAxOTo1OA0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPjsgUGhpbGlwcCBaYWJlbA0KPiA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47
IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+DQo+IENjOiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgR2VlcnQgVXl0dGVyaG9ldmVuDQo+IDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT47IENocmlzIFBhdGVyc29uIDxDaHJpcy5QYXRlcnNvbjJAcmVuZXNhcy5jb20+Ow0KPiBC
aWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQN
Cj4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVz
YXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHQtYmlu
ZGluZ3M6IHJlc2V0OiByZW5lc2FzLHJ6ZzJsLXVzYnBoeS1jdHJsOg0KPiBEb2N1bWVudCBSWi9H
MlVMIFVTQlBIWSBDb250cm9sIGJpbmRpbmdzDQo+IA0KPiBPbiAyMy8wNC8yMDIyIDE1OjQ2LCBC
aWp1IERhcyB3cm90ZToNCj4gPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudCBmb3Ig
UlovRzJVTCBVU0JQSFkgQ29udHJvbCBEZXZpY2UuDQo+ID4gUlovRzJVTCBVU0JQSFkgQ29udHJv
bCBEZXZpY2UgaXMgaWRlbnRpY2FsIHRvIG9uZSBmb3VuZCBvbiB0aGUgUlovRzJMDQo+IFNvQy4N
Cj4gPiBObyBkcml2ZXIgY2hhbmdlcyBhcmUgcmVxdWlyZWQgYXMgZ2VuZXJpYyBjb21wYXRpYmxl
IHN0cmluZw0KPiA+ICJyZW5lc2FzLHJ6ZzJsLXVzYnBoeS1jdHJsIiB3aWxsIGJlIHVzZWQgYXMg
YSBmYWxsYmFjay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IA0KPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiANCj4gDQo+IEJlc3QgcmVnYXJk
cywNCj4gS3J6eXN6dG9mDQo=
