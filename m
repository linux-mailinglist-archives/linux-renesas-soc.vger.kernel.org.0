Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4591D696A5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 17:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbjBNQwe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 11:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjBNQwd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 11:52:33 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2117.outbound.protection.outlook.com [40.107.117.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06518A79;
        Tue, 14 Feb 2023 08:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBsmsbx7NUowxZ472xhV95JrxZ02ikcRj/qYK/LzATVbWAmiP9N4JcWmnG1kNkh6dhiY+VHBS2Lo6hdnIOKfzI0Wf46OgtPPbubCMnsVfia0P8O/4n/QmwXW75CjevmgwF9qzxz5n7YAy5EDttr0/Gp5tSr3wZjo9is1aqfhJCvo++C7wGb9isxckMXifYYJi6sdwwA7b5+7OMoxP0pkU8ylawtavqZy4S0QdhH9m3bJxepULIf7z2ENX4g/Hr8bF9HXRklaI5jwBw8LYqAetZDo5NERnNZ42NFG/NMUHzj0hnRIJHjBt7VH4LzhV5hzZ6+B3Ma66YaWysfLBIjHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUJLm/UZQWT7U822MQU3GKh7+1ikgeNTBCjUdeEY+MM=;
 b=aSLThjS0gBkxuhgp6eycE/d9fioD29+8xV8TPjVj91ADiyHgsn0okM4QvMwPLVVZoKaEm6HO/WowxQqw8wBldzLm3I4qerE3NwSV2nk3dZeCtUCDDqnZHIcsCm+YbiB+zn8kzJ0uS5PC/AiW2+lGiTjRAGQiA+pUKGmNhJHxtdqDD9CcCGvVTxlIB/EmkImA5/mJTBVf+WaQtjdWiYj90r8V9DOTK+hvxBFgnFjwHtdAL8QTf0hSICJviGDvR6qc8coPTgu2kW2kALMQPqurFyCJEM1Tq/Ci0KgG5usSkyhQ6fz3aBSTFuhCBOPggJG/PMbkk8jLtcDgtoR7VleP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUJLm/UZQWT7U822MQU3GKh7+1ikgeNTBCjUdeEY+MM=;
 b=osOaIN/Ic8srQQa6sjQOAHoW2pSriPxbFExSkvSVOEf3lE7Tko/seDGYj3Y+WUiGLFsvQDUsSkm12CQIIfRqWYCA7F+b2QB0KxyLrbM0Ijj7/CqglH/j4++CvXyLJ5yMhIT4OP6U5kCj3YapD5Q8+hSd9OQ1NykJDt05WHmgJPg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11895.jpnprd01.prod.outlook.com (2603:1096:400:403::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Tue, 14 Feb
 2023 16:52:01 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 16:51:58 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR
 flash
Thread-Topic: [PATCH] arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR
 flash
Thread-Index: AQHZPKU0b6zbHAtvrEanojvrZYDOl67OhG8AgAAqXFA=
Date:   Tue, 14 Feb 2023 16:51:58 +0000
Message-ID: <OS0PR01MB592283A7548A0102B137386586A29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230209164016.645399-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWMuNrSY=79wCbgpQU_QGzJkk3mPHm35a0c+dMaSqH0XQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWMuNrSY=79wCbgpQU_QGzJkk3mPHm35a0c+dMaSqH0XQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11895:EE_
x-ms-office365-filtering-correlation-id: 079d759c-f68f-41f9-3d26-08db0eabc994
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ibn2JnWzrHCJlFQq+XYm3l2PUXP7OoV2lpmNIt/b86mY0WSx4SXTi2CSE0IjOLSTmwUIbbr1Wh320arCgEOIV4elwZBrX0j1grJU80j5lxLwBas63I97nqxYgshVgi/7SLEfIpV8UyY5x9XuIF7rtFm/xL+lFBSx5h/C+6/YfIj5/S7T4I3iNRM4yj1ZP0k/4AThvZfRb33pY29ZdNTF+IGqJSsG4QIzTs1oc1L7Q6yla2otf0Tezha7WTGco33WU6aUU8FW9JDYarUc3ni3TvQBHOJZjlzyr0lHdC+ZmOq4dTN5vt9883SidEL3FlpiESkUh3rdfo1r57OSd8v65C6sn7WB9FZ9R7BHFFdjoqWNwvjR+fJurxaKgS4L6koe4KAetfYzvcn1ZsMfvvNv7eflvZ1idJRiUivCIoslG/ZHPcoxSiWA3s3Pyt9+2UU9iv7qR5KB3exbKVJdCndikABK3yOSTHD9fnjXpmb2AX5LIaVm/kzNEUcwM1SSPNEZrJ2Ov52htKDCKALE5BhRtYxioFI7D0NseOL8iF8SnADCtRfFPZDrtyOIxsmuL6ZICJXeeVRb/n6hr0yJ3oKSKdG8OdtDp4u0uMlkZ0e7km5TeA7SPDvxR3xzyzH0mmO3ZXGr4XUx35FRPOzUmTkC+q4HbqSx4AUgWV6zkFBD2sjqL0A3ZS5KHf/kHNKngf7UbX5vawEregmfG4sQHSEWOD+7PgwuUbIRyEECWEoMBt94UqNv9M1sgssm8Dgo6O5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(6916009)(8676002)(64756008)(76116006)(66946007)(66556008)(66476007)(4326008)(66446008)(86362001)(55016003)(38100700002)(38070700005)(122000001)(54906003)(316002)(33656002)(107886003)(26005)(186003)(9686003)(6506007)(7696005)(53546011)(71200400001)(478600001)(5660300002)(2906002)(52536014)(41300700001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnNnY05lM1loZVRpdjlQZ2VHRkhTb2FhN2FyNkV2WFhoanBOSEljdHFsbXhU?=
 =?utf-8?B?NHJQSVhjNUFzc2IwNTR5MUhPbnBkU1lHM0FPZEFXU0VvZllBYzdqbDN6Y0ln?=
 =?utf-8?B?bnNPWG1vbWJwWVBrNWZQUTFWZlNjUHRHQjU5U2JCV1loZnhCa0tLbmdYeStJ?=
 =?utf-8?B?OG1VMUlKblZ3ZE5DeW1qb2JCSWJHdnhrT3VrZU1wcUx1bHRMWE9lb2xpUVFh?=
 =?utf-8?B?K3hNcFUvMXJOV0ViOUFIaTZTRHhUWlZubzh1R2JVSVNsTFEvZmJMSFNjOXdX?=
 =?utf-8?B?WUJtWWZhTkpONDh1aVJ6LzZmMmlHRDNiL0V3VnAxL1d6UzdWSXBSRkNTY2w4?=
 =?utf-8?B?dmN1QVVvTm1oRGRqenMwU2NQeDJJalpmT1lWQUFwSHZieG41dDRxMXZ0VGxq?=
 =?utf-8?B?NEJSTWdoczlzMUhlWVU0K0NTSHJMV3FaN3RHdTIrSXNvWTUyY0Q5VTVaakpa?=
 =?utf-8?B?dlV5SkRPUXVVeUhFVlJZVzVvTXA0NERUUC9iejNXT2JDSG9mUmxlMVZUdkNk?=
 =?utf-8?B?UEo2eDRidGhSSU5Uei9uWHFTZ3o0YXBYOXMrM2VndTJiZ0JQRjYxbGE2UE9Y?=
 =?utf-8?B?c2xQRUJBUTN4cUoxYTNCaEFkdWxCTEpFbTdDcFFpZ1Qyd1ZFdHlYV0ZJMCtD?=
 =?utf-8?B?NHh5YUV2Vmd0R2hsbllPMHFndDhXcHVkMStTRjZzcTVLcHgzRDRTUE83b2Zu?=
 =?utf-8?B?RUFOTnBBbEJyYmMxc1huNTlQTVl5RnBmdmFiUkowdkJ4SEhsNnJ5MEpDMVYx?=
 =?utf-8?B?K0xwWWh2SHFoWmJ6cndaNzJyRVZRckxERHh3TkdZcGlIMnlMNFVGTTM5dXdt?=
 =?utf-8?B?dE5aRzNmcit2S1dGZXhqKzJLcTBQNk1McG5pKzFQbjNnM3R3T3h1WUV5SGov?=
 =?utf-8?B?YUhOdTBnbWsyczdySWNFY0pKRXBmaTNDdCtiRXBrVXV5b3dRK2F2Q2MyVG5n?=
 =?utf-8?B?ZlJ0ai92eVVXcmo0MkQzVDFVZzJRd2tVc09zam1aa0llNVdjRkRGeG5TUGlP?=
 =?utf-8?B?UDF4TmJoTlk3Z1Rrb0J1bHVRZVZ0Umx2WFZ0VnJTV3NiaHZ5TktSQkVGZW4y?=
 =?utf-8?B?SFZ1dVhnL0dCc24wRldlWnd6ZFZHcWNsOTU3ZXdPWEh6d3dnalZqQk5qQUNS?=
 =?utf-8?B?NXU5OUlKbGlLcytkeVgrVDhJQ2hlaExIL1lkci9rNm9RQk8zdTF4UjBJNmVk?=
 =?utf-8?B?UldYZ01kMnJzdHNhaDRYakREbFFxYmtHWnNyV0N6N3c2cUtERzFIRVNCbCs3?=
 =?utf-8?B?OEtXcGNsM29kYmFzRlhvMFBsZVhrR2hHdEJIT250a2M1YXlDdHFZUUYxeHl0?=
 =?utf-8?B?Sm9zWlpPTHRWN29XVFV6STZBdzlhclVSVU5MWmY2UUsyQ0o5Q3dkc1hPZWFo?=
 =?utf-8?B?ZjNXMTZpeFlldDgxQ01jeTBvM0hiNG5PVkh6MXlMall0N3BZZE1JMk5IVnYw?=
 =?utf-8?B?QVRJNTgyTGlXZ1pBZ2w5L1hUODdzNTM0MnJyNmlDNEVKTDlNdndVTWdrdkdY?=
 =?utf-8?B?OERDNExhOFoxWXVpWUR4WVdIN1dTbXNxaFUwMndkOXdXbUkrUEYxMHpqNmcy?=
 =?utf-8?B?SlJGRUFaeGI3djR1Tk96a3pmUDFnR1ZkSTNGUmNkYlBHUjRXazVwWll0WWsy?=
 =?utf-8?B?ZFJSclV0UzJnbWNEUjkxMlRQNzhNWXRwc2lKOHFyRTgzSld2TktLdGxjRGNm?=
 =?utf-8?B?NWJjOXVWTThxU1AzWENDYXlSeXpIMHdxMDVlS3ZaMUZldVpqbEZIM1dpajBG?=
 =?utf-8?B?MFhIb0FCMVM5c0RwUUt2SFdFWjZueWIxQjh5Zy81ZTB0MXN5QTRpLzFTckpt?=
 =?utf-8?B?ZUg5MFU5MTlZdzdUanB5ZzBsNVowZitSZHlwOVppVjBWOFBBakRpdnphSWo3?=
 =?utf-8?B?bXNpQ3BzUFFEQ0xEWlNJdWlDY3o5em52b29SSllTdHlvWU00OGlPeG5RWmpY?=
 =?utf-8?B?L1lKUHFYU1ZtVFJDcVBvZEN1NWdTcVZjZmxkRFJoZ2paRWo0ZEhVam1NbzVw?=
 =?utf-8?B?cGR0ZEp2WllWUVVVQ003ZFpMMWRMQlNmVEM2RXlTUW5NY0Y3ZS9PSlpJS0FF?=
 =?utf-8?B?azl6aVU0a1pzNk80NHZETklJZ21lR3Fzb29nZVB5N0E5MlJVQzFlNGhKYkhO?=
 =?utf-8?B?dndGWFZSRTYwSVNvREl5bCttRVQ1NWVjdTI2ZENCSndkcFZ1SGZ1SzJqa2lr?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079d759c-f68f-41f9-3d26-08db0eabc994
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 16:51:58.6564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hxohoQqCq34Fops24/ItMOfZ5mj/Kf3L91i4QgS2zyXWSgVw7vJj7bE+O1xuh1y9Zf1axOsZvB5nFmDE1Pu8Fexuk2SSrkufy/6GHBCUO9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11895
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJ1bC1zbWFyYy1zb206IEVuYWJsZSBzZXJp
YWwNCj4gTk9SIGZsYXNoDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBGZWIgOSwgMjAy
MyBhdCA1OjQwIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6
DQo+ID4gRW5hYmxlIFJlbmVzYXMgYXQyNXFsMTI4YSBmbGFzaCBjb25uZWN0ZWQgdG8gUVNQSTAu
IEFsc28gZGlzYWJsZSB0aGUNCj4gPiBub2RlIGZyb20gcnpmaXZlLXNtYXJjLXNvbSBhcyBpdCBp
cyB1bnRlc3RlZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJ1bC1zbWFyYy1zb20uZHRzaQ0K
PiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcydWwtc21hcmMtc29tLmR0
c2kNCj4gPiBAQCAtMTc5LDYgKzE3OSwxOCBAQCBldGgxX3BpbnM6IGV0aDEgew0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5NVVgoMTgsIDUsIDEpPjsgLyogSVJR
NyAqLw0KPiA+ICAgICAgICAgfTsNCj4gPg0KPiA+ICsgICAgICAgcXNwaTBfcGluczogcXNwaTAg
ew0KPiA+ICsgICAgICAgICAgICAgICBxc3BpMC1kYXRhIHsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBwaW5zID0gIlFTUEkwX0lPMCIsICJRU1BJMF9JTzEiLCAiUVNQSTBfSU8yIiwNCj4g
IlFTUEkwX0lPMyI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItc291cmNlID0g
PDE4MDA+Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAg
ICAgcXNwaTAtY3RybCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGlucyA9ICJRU1BJ
MF9TUENMSyIsICJRU1BJMF9TU0wiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2Vy
LXNvdXJjZSA9IDwxODAwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gDQo+IEkgZ3Vlc3Mg
dGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhlIHN1Ym5vZGVzLCBhcyBhbGwgcGlucyB1c2UgdGhlIHNh
bWUgcG93ZXItDQo+IHNvdXJjZSB2YWx1ZT8NCg0KT0ssIHdpbGwgcmVtb3ZlIHN1Ym5vZGUuDQoN
Cj4gDQo+ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiAgICAgICAgIHNkaGkwX2VtbWNfcGluczog
c2QwZW1tYyB7DQo+ID4gICAgICAgICAgICAgICAgIHNkMF9lbW1jX2RhdGEgew0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHBpbnMgPSAiU0QwX0RBVEEwIiwgIlNEMF9EQVRBMSIsICJTRDBf
REFUQTIiLA0KPiA+ICJTRDBfREFUQTMiLCBAQCAtMjMwLDYgKzI0MiwzOCBAQCBzZDBfbXV4X3Vo
cyB7DQo+ID4gICAgICAgICB9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gKyZzYmMgew0KPiA+ICsgICAg
ICAgcGluY3RybC0wID0gPCZxc3BpMF9waW5zPjsNCj4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gKw0KPiA+ICsg
ICAgICAgZmxhc2hAMCB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiamVkZWMs
c3BpLW5vciI7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gPiArICAgICAgICAg
ICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAg
ICBzcGktdHgtYnVzLXdpZHRoID0gPDE+Ow0KPiANCj4gV2h5IG5vdCA8ND4/IEFjY29yZGluZyB0
byB0aGUgZGF0YXNoZWV0LCBBVDI1UUwxMjhBIHN1cHBvcnRzIHF1YWQgcmVhZCBhbmQNCj4gd3Jp
dGUuDQoNCldpdGggYSB2YWx1ZSBvZiA8ND4sIGN1cnJlbnRseSBmbGFzaCB3cml0ZSBpcyBmYWls
aW5nLiBOZWVkIHRvIGRlYnVnIHRoaXMNCklzc3VlIGxhdGVyLg0KDQpyb290QHNtYXJjLXJ6ZzJ1
bDp+IyBtb2Rwcm9iZSBzcGktcnBjLWlmDQpbICAgOTMuNjA0NzIzXSBzcGktbm9yIHNwaTEuMDog
c3BpLW5vci1nZW5lcmljICgxNjM4NCBLYnl0ZXMpDQpbICAgOTMuNjY4NDAzXSAyIGZpeGVkLXBh
cnRpdGlvbnMgcGFydGl0aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNlIHNwaTEuMA0KWyAgIDkzLjY3
NjIyNl0gQ3JlYXRpbmcgMiBNVEQgcGFydGl0aW9ucyBvbiAic3BpMS4wIjoNClsgICA5My42ODI5
ODJdIDB4MDAwMDAwMDAwMDAwLTB4MDAwMDAwMjAwMDAwIDogImJvb3QiDQpbICAgOTMuNjkyNjU3
XSAweDAwMDAwMDIwMDAwMC0weDAwMDAwMTAwMDAwMCA6ICJ1c2VyIg0Kcm9vdEBzbWFyYy1yemcy
dWw6fiMgY2QgL2NpcC10ZXN0LXNjcmlwdHMvDQpyb290QHNtYXJjLXJ6ZzJ1bDovY2lwLXRlc3Qt
c2NyaXB0cyMgLi9ycGNpZl90XzAwMS5zaA0KDQpFWElUfEZBSUx8cnBjaWZfdF8wMDEuc2h8WzAw
OjAwOjUzXSBXcml0aW5nIHRvIGZsYXNoIGZhaWxlZHx8DQoNCkNoZWVycywNCkJpanUNCg0KDQoN
Cg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICBzcGktcngtYnVzLXdpZHRoID0gPDQ+Ow0KPiAN
Cj4gVGhlIHJlc3QgTEdUTS4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02
OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UNCj4g
dGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cw0K
