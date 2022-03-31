Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46C5F4EDB07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 16:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237118AbiCaODJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 10:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234183AbiCaODI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 10:03:08 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2137.outbound.protection.outlook.com [40.107.113.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097831706C;
        Thu, 31 Mar 2022 07:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qegf6sbDaOqDl28nVLJbzb6W7Jv+ttNO3clwHFSzBHXYqvT20L9+di/B97XCEfNiC3rBM0goNVcWyWCl++CrFuddZo5q5eCamIdmOSjfY7GH5qTQmYpquD72iL7McFEC8QSU8KdfURM81EfAFVz3rK/AXh/nY6q0ZjWh6ksO148rhwZHTriNzr02wn5OnGC+pPuRGTKPgVKPCUwt4ZEF5o7Ul0QX5lG4yNFywh/c6mLncWagQ1XLYc27PC+Kc9uI8breTXd2q/9intedk6clFyT/LeuJtcZkuaf6FbjWAfsHgmwD+67CV0bUt1W6sp8OGvKliJLSS5pdDbogaG9GEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0ANgXP7CG2vMhHFvpZP7n+BOnZu20p0zSPvGtTjOR4=;
 b=NjreolBe6smIl2HuXccKFwYGnnngbSJDE3co2H43H74zqvn/rQh0P0/fy4sPx3/sa80El8AC3I1bnaBwrTFPuDb7j7SFFweDTVcWz3BSViz1l5zXCSFPqCikXXlTyAHR8CY2cCoZN3n/IaFZrphxCQBZxO56PLV8z1RGHtaEFgJsVhyXBG9plYCVcZlMF/hooIViG0xiVJtm0XI+8/8Kf5WZIvxe8r5uagmHXGZiahYO89KTIKQnHeCIUKAYOnTLmh5pWrcKaq9Iv+Eyuy4pPu/3NaJhipyR6b9+0L4p1uloFZuIvEretfq8e2voL0w7NyZrNdu9hQyB5nRzbL3O/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0ANgXP7CG2vMhHFvpZP7n+BOnZu20p0zSPvGtTjOR4=;
 b=NBW2osTMSxv8t3oQwenyc1/MSq05Ic6UG9FS9120xKVk38U7Q4irxV/ZoeLfds8TngPdcnsScyXjAQvzSy6v1UxCDGlsqvTHUaQ2lnLYQCRRhmWdEyCcrC1KEzPBQycnGTWNfIMZ/qgQqg3mhO8cUGkFQVojR0La8GxTRNGPKUw=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSBPR01MB3272.jpnprd01.prod.outlook.com (2603:1096:604:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 14:01:18 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24%8]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 14:01:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on
 carrier board
Thread-Topic: [PATCH v2] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on
 carrier board
Thread-Index: AQHYPSt80/B8c9hobEW9AGFlcZJkkKzZkXiAgAADMYA=
Date:   Thu, 31 Mar 2022 14:01:18 +0000
Message-ID: <TYCPR01MB593313B46713822594C0887086E19@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220321135629.16876-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXyMd3Haqbg3wh3o3jty6aqzZ+f_-59tvwyEOzP=6cuew@mail.gmail.com>
In-Reply-To: <CAMuHMdXyMd3Haqbg3wh3o3jty6aqzZ+f_-59tvwyEOzP=6cuew@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55f827a8-0d11-4bf4-ed80-08da131eede8
x-ms-traffictypediagnostic: OSBPR01MB3272:EE_
x-microsoft-antispam-prvs: <OSBPR01MB32722433541562F8B2E3E81186E19@OSBPR01MB3272.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XbPw4iNbX1Az0abbvNWZ11o0bGeOBJIV08I/QdcYpg7NM2qKRcpz01sIqRd+BUztnPxoHr7bPwCPOOCvI/8dGRo68Hn2PUTKvq+MZdts2JOifRWWnx/sw+edNPdNR0Osazll+stbVhHNgo6Y/zcdYRSWkz49QeKqduwbcFr54OZOT9XG5pekcVBRDvSNbRzZCiBFMDVLS+Lc1nMPWxC3L0rOuoh0agg7kPR2vco9EnHnitE+frqL7O+stwNIDWzkmI8xfyrnuAyMGJn/uvNFQUoyn/4gZx/wEZaNtETn5N4hk8d0vdJXTmTW+LUJwg7t7a/Rj5wmkkLzQ0CUv0ZVmZMWOSqGugrS/RVJCu2P2eJ0UN37NuDQkrSaU+XHaK+Raes60BpKg7wXg/ufkxg1yRVpKogvw4RF1wyvBSpBtozpYOaRecF75EZaFg24jKPlCPzPQGgEO4qt2lJEcDSSqQShN83J9cch1SIA/jPO1dPXZdv6jCjrO1MA1A93t75esjCEHQ69PRrH3kYEwIBFc3LGIurlX4VnclmZigIOWOhOlhGyUKdp/6L5yZHiMuDRjF9Msmi9fgCsckQ6YMaWkGfKhhjgjcg1+63y0rA/pmMdGmHRIvcQxFwz+QHk9+Lx/coh6KEjAl+b+6sN6acojoTPI4ijpNKz/hbRHDIOyTEGCyzKjTVUp3/0qXEQadn8aKyJkxXYRoACcxjyfbIX5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(2906002)(55016003)(83380400001)(33656002)(38100700002)(5660300002)(66946007)(71200400001)(8936002)(508600001)(38070700005)(26005)(76116006)(6506007)(52536014)(107886003)(53546011)(186003)(9686003)(6916009)(54906003)(316002)(66446008)(66556008)(66476007)(4326008)(8676002)(86362001)(64756008)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2tIOFNpRXBPMjkzcVdaeWVCTnd4bXY2Y1JOVGd6YXllTnlpM0h3dm9hM3hY?=
 =?utf-8?B?TWxNRDVNZjQ1a1Z3ZllvTjNpYnhlK3hONU1Udk1oYytNM0pJa1lYZVJlY0VP?=
 =?utf-8?B?RW43eG5CdHQ3a0VhUmZSZDlGSFJ0NWN6Z2NVMHVoNXNOWUYxRnQvL2RrcTJp?=
 =?utf-8?B?cDlvQXl2Y3E3b2lSSDVYTUZvdU1FY2hVV24veGpVeXVZWDBsQjRrMCtlcTMy?=
 =?utf-8?B?NG4wc3JGSVQvTkxvcjJBWmRzOEU3dDVLNmxsc2h4TTdBR0N0bmMzQnRDTUc4?=
 =?utf-8?B?VmNxTU91MGpSSGlCMWRCZSthZHpNQjN0Wm1mYzhrNGlFOUxpN0RzUmNwYzFI?=
 =?utf-8?B?cnRVSFJrVlVCWEc1SGJkcnI1Uko3MGdENkpmd0hXOEloTG9ickVlUUJsWmtn?=
 =?utf-8?B?d1duRHZyK1QxYUFwVlhoUjBCUzlFUUJxWWEyVXBQWjhaNnR2dFd4ci9EM2gv?=
 =?utf-8?B?SE9uUm9iYk8xUDFnakVWQ3BmbG12M0gyWk9uczVqRHBJY0c3NmNrT25Uc0Zw?=
 =?utf-8?B?SjFJTGpUVndzUjlXTVBya1VkWVBrRU1Jb2pNVkdmbVdzeXdWcFZhN2FoN0Zt?=
 =?utf-8?B?WHlLZWNMSlFxMUNYaHlWUWd6eEFzekgrK3Z1aDVuZHhnUFZCa0R2eG9PeldU?=
 =?utf-8?B?dXB0U3FobVZ2MnFsS1QrZW1TUWtJbUR3MEdIak84OSt4d0F6eXpFOVJ5T2Jh?=
 =?utf-8?B?YVBmT2NSbWpvY0oxOVExUFkyT0lqczljSTVEOXFDMHVWOVphQm44NVVRcjA4?=
 =?utf-8?B?Ylh6RFhBUmo0Y0JlYXErdE1kdmVkTU5FbWRqNDJjemsrVGdNc3JMNVNydjMr?=
 =?utf-8?B?ZGFROHp0bzRxaFRPMUc5NjIrUktHL2VkcWxHWllsRGZheTRob0pUUmFQQThJ?=
 =?utf-8?B?eW00ZFAyQUdnc0NtaDlYbjRSOUphR0pBVEsrVjZNZjdnVjB1SThGRjFUWEhO?=
 =?utf-8?B?eUJlQkUyRFVlNm9iczdqb29YN0pPRyt2SWxFTEFvU3BKQWpNcjV3UWZWbVkz?=
 =?utf-8?B?SXFVVk04aU9zUEg1S3luOGx3d2lneEtoVTJLbG5CMHJ5c0xsMzdrNjRPME9w?=
 =?utf-8?B?SGtUck10bGJ3S0NzSUZiNkxFdzRPeGsyVkMxbEl2aSt6MkM4MTRDalZ1aDdi?=
 =?utf-8?B?NmQ5ekpxQk1NbmYrRys4N3lmNHcvRnVLRkZMWEo1cnVuV0lrUGF4M3lLMVdX?=
 =?utf-8?B?akpjWVZTOHI1SmJENHhNMnVLbC93dmk4VmN3QThoWWh5NEpCNENLSVV3MUV4?=
 =?utf-8?B?VGs0OE1YanN6RjJzbGs1SUM5QzFoU29KdytPL3hNREFNaGhLNFdsWUd2SDFx?=
 =?utf-8?B?K29EejVRV3RxUlJ5ckpwekpUNGdEMW8xNXpsTnhzUTQwUjJwZm9mVGNPWmp0?=
 =?utf-8?B?d0o4eUM2L2lwUFBra2Z4SVhTd0VETDNRdUg0MmlkclJkUVR4SlJKdFkwN2lJ?=
 =?utf-8?B?S3ozVUtFODExSXV1NUlhTkovN215eUw3dWk1RThUUlRzbmhGbGJpREVMTk55?=
 =?utf-8?B?eWpCUkNXMGROVlNSYzhjWi9YcXUzaTRpYnJhSitJWk5oZWloNGVML0Eyd2Rt?=
 =?utf-8?B?VW14YlVmNHRoeVhkaytKanFiRzJwakp2MytiejBCejZpc1pQcUY5a3QzaW1E?=
 =?utf-8?B?aGtIUXNRUzU2MFFyR1FvZVV4bkZtbGNqVUFlMEl3aE80S2RmRkFXZmlCMnlj?=
 =?utf-8?B?S00rRElOREJFOUV3Uk44VnhoSDVTSW1vUjBheEx0L2FtV1k5MFB0K3Zlc09D?=
 =?utf-8?B?Z2Y0NzRDdmQwRU9lM1NFMS9FTGJKcFlaeS9MZElLREV6NkNhU3hKYjZVeTZx?=
 =?utf-8?B?SzVTSS9pRUg0QjJKRTczNzlvdmlmN3BsZjA0RXN6VWg3L3hyVENCb1FTL2RE?=
 =?utf-8?B?dmkxZmpEVDV4eWtEeFJwY2FXM1dsbXBIVGgyWlROYmdWL0Z6SlJ5WW1pN3VW?=
 =?utf-8?B?TVcxMjE0WEhlaXd2emNEYUtMVFhRREU1T2VvSU4yYkk1dUNoRXpUdjRXZzVT?=
 =?utf-8?B?TXlneEh2a1liQktaek4wb2wzS2M0TzAxT0w0dEZZYVR0dmNvNGlESGFDSkUw?=
 =?utf-8?B?ZUs4aXU4U25Ec0t0L2tiMlhSeXVpKzJHSndSY0kzd0JqSHRLRVl3WmxvSnJu?=
 =?utf-8?B?WjdUYjV5NXB1Q2tqWDhycjgvdTVvaTJzU3JHNW5xRGY5UWNmNWpqOTA2dlpp?=
 =?utf-8?B?NHltVjlGd1doakhlYktVK2FpNzFYYVU1bmdmcEsyY1JHUnhJMWdRWEJJTUh0?=
 =?utf-8?B?dkdDSEp5K0FqbU9YSlNpWGtyTzByM3lWWVJrNmZaU0ZKS2I1dW9RbDRGUWU3?=
 =?utf-8?B?eW1JSC9SaEtiSzM0QUY5d1BmQ20xSE95d3ZJRzdrQzlweTFYZmVEZVRYTDlQ?=
 =?utf-8?Q?qcWmxXiM1rt/1//k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f827a8-0d11-4bf4-ed80-08da131eede8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 14:01:18.6821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYA9l3EnWUlKxUTi/c6/HQYjYcqcKrubfMrIC4M+UM8qPbmmsP5KI+F7bz4NS38NgHSYmSS7ksxfIgwupaahUINTdtGUbBmgqufK/ROOwUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3272
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJsYy1zbWFyYzogRW5hYmxlIFJTUEkx
IG9uDQo+IGNhcnJpZXIgYm9hcmQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIE1hciAy
MSwgMjAyMiBhdCAyOjU2IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gd3JvdGU6DQo+ID4gUlNQSTEgKFNQSTEpIGludGVyZmFjZSBpcyBhdmFpbGFibGUgb24gUE1P
RDAgY29ubmVjdG9yIChKMSkgb24gdGhlDQo+ID4gY2FycmllciBib2FyZC4gIFRoaXMgcGF0Y2gg
YWRkcyBwaW5tdXggYW5kIHNwaTEgbm9kZXMgdG8gdGhlIGNhcnJpZXINCj4gPiBib2FyZCBkdHNp
IGZpbGUgYW5kIGRyb3BzIGRlbGV0aW5nIHBpbmN0bCogcHJvcGVydGllcyBmcm9tIERUUyBmaWxl
Lg0KPiA+DQo+ID4gUlNQSTEgaW50ZXJmYWNlIGlzIHRlc3RlZCBieSBzZXR0aW5nIHRoZSBtYWNy
byBTV19SU1BJX0NBTiB0byAwLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2Fy
IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4g
djEtPnYyOg0KPiA+ICAqIFNvcnRlZCB0aGUgbm9kZSBhbHBoYWJldGljYWxseQ0KPiA+ICAqIERl
bGV0ZS9kaXNhYmxlIHBpbmN0cmwvc3BpIG5vZGUsIHdoZW4gU1dfUlNQSV9DQU4gbWFjcm8gaXMg
c2V0IHRvIDEuDQo+ID4gICAgVGhpcyBjaGFuZ2UgaXMgZG9uZSBpbiBjb21tb24gZmlsZSwgc28g
dGhhdCBib3RoIHNpbmdsZSBjb3JlIGFuZA0KPiA+ICAgIGR1YWwgY29yZSBSWi9HMkxDIFNNQVJD
IEVWSyBjYW4gcmV1c2UgdGhlIHNhbWUuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+
IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRz
aQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRz
aQ0KPiA+IEBAIC0xNTgsMyArMTU4LDE3IEBADQo+ID4gICAgICAgICBzdGF0dXMgPSAib2theSI7
DQo+ID4gIH07DQo+ID4gICNlbmRpZg0KPiA+ICsNCj4gPiArI2lmICghU1dfUlNQSV9DQU4pDQo+
ID4gKyZzcGkxIHsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwmc3BpMV9waW5zPjsNCj4gPiAr
ICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAi
b2theSI7DQo+ID4gK307DQo+IA0KPiBVbmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLCB0aGUg
YWJvdmUgaXMgb3ZlcnJpZGluZyBwcm9wZXJ0aWVzIGluIHRoZQ0KPiBzcGkxIG5vZGUgaW4gcnot
c21hcmMtY29tbW9uLmR0c2kgd2l0aCB0aGUgZXhhY3Qgc2FtZSB2YWx1ZXMgdGhleSBhbHJlYWR5
DQo+IGhhdmU/DQoNCkRlZmF1bHQgU1dJVENIIHNldHRpbmcgaXMgQ0FOIGVuYWJsZWQgYW5kIFJT
UDEgZGlzYWJsZWQuIFRoYXQgaXMgdGhlIHJlYXNvbi4NCg0KUmVnYXJkcywNCkJpanUNCg0KDQo+
IFNvIEkgdGhpbmsgdGhpcyBicmFuY2ggY2FuIGJlIHJlbW92ZWQsIGFuZCBvbmx5IHRoZSAjZWxz
ZSBiZWxvdyBzaG91bGQgYmUNCj4ga2VwdC4NCj4gDQo+ID4gKyNlbHNlDQo+ID4gKyZzcGkxIHsN
Cj4gPiArICAgICAgIC9kZWxldGUtcHJvcGVydHkvIHBpbmN0cmwtMDsNCj4gPiArICAgICAgIC9k
ZWxldGUtcHJvcGVydHkvIHBpbmN0cmwtbmFtZXM7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAiZGlz
YWJsZWQiOw0KPiA+ICt9Ow0KPiA+ICsjZW5kaWYNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K
