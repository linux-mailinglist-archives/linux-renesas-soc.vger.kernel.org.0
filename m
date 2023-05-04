Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE836F6572
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 May 2023 09:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjEDHHE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 May 2023 03:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjEDHHD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 May 2023 03:07:03 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC5D2122;
        Thu,  4 May 2023 00:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMJD8PQPJDkuHw/7o9LdQt7pg9FGKKiS42Hny2x5dQ+eFQTmzw0pXdAVhcf/HOt5yMIqQUU8o6bPVUXh+b1KN+zaX+ilcACqAzxM9ACnmVvGTnv+V2TEMhBPjzBXMbtnNTY3jJWUKNXy8Y/sKi2ZNyhU3ImOkEX9NqbCqdbZzZ83lkN4vNyQtsTgQcCAAwpMfI4Gv34U5OmnBRh76KCA45Jb1YWBVLuEnDjClJVCAg89QCPOAuGDeZqUBHRNBMIlBwd9EQ/Xd7wVW6lTssImhJBxO1vGMP3c5FHcrfpih2bQIhIwdLhUVsVTztNbZq2pdxPfEfZye2E/PJB7wZubuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXEuJ7XbO/g7q8s2rJZeNPS7ReSkZUHHRz7vMENHkZU=;
 b=aNt11mydEXKWNt2f1JM7URPPbZfocNzNW2z/6cA1rbgpr7b8nMDoQf+HNpuS/D4Avh1+Ft+RItvwBb5EF+8d8UDO2Bqs2aBGOXIxJg9poAX5IlOnwpN00IGHfnmhvfcPdafsa8R7tXTyCiS5CgkbPSPyJ0W128BmMh0azEmYEDl2N6zv0ilZZOx/UXriUwnLLCCH/37FJAH7DUh5OS8JDgMuFnwp4U+w7JQQrVSmw8UU6EhDE8POGYLe4/NgQd6i4pFIyVpu3duLOZbXfenA39sXtUfnned817QhvWAtd/aPJTUw86Pmf9vQNxGlRfudriSo+Gp2usBFRp3Yo6GHXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXEuJ7XbO/g7q8s2rJZeNPS7ReSkZUHHRz7vMENHkZU=;
 b=GqQ66OFG6Hg/9C4CNx9LHcceuCDnKFng/F3QoqszWxXE2UJQpIBDU4LNCeBDURqWS5ijKlYyyNFz8J4OvqxEvnozpMpmQkhyaPD2QHd16FMReAjAdXdGlYwZ6VFmnXbAwIs98/Zy/XvylLNJqcQzgXcjpoXhCG85G0RQq5/ZsjU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB7820.jpnprd01.prod.outlook.com (2603:1096:604:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 07:06:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 07:06:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add gpu cooling
 device
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add gpu cooling
 device
Thread-Index: AQHZd437vVphkAaVeUSevrGzzLBfVq9IZOEAgAFZ1OA=
Date:   Thu, 4 May 2023 07:06:56 +0000
Message-ID: <OS0PR01MB5922BE735279BE59FD5A4DF4866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230425155237.357592-1-biju.das.jz@bp.renesas.com>
 <20230425155237.357592-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUs=F3ePP1P5OTbf9cut1wrbov=YEsyZEnKToBaFK0qNA@mail.gmail.com>
In-Reply-To: <CAMuHMdUs=F3ePP1P5OTbf9cut1wrbov=YEsyZEnKToBaFK0qNA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB7820:EE_
x-ms-office365-filtering-correlation-id: 54047811-ab05-4f4b-8452-08db4c6e25b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aTazS9GqO43iYTB+dct9xMDUUqTb8yhiJc+ifGN0hgpwfqCkVeqiJJgqI1BZlML5jdcCw2B6RW7JDuueeMq+7oecVyizzI7LZLkfAAOsG8kDFRqz+PdKYGsEPJ8ip6nGDqEYyVMg326KETG/bG0WBGsYFdQfANxvEmT2cPI1wyK07Ur8TFM1e8A8bTmdgRioevmoVxo30sdkXaTBzH5MUzCZFbLrc2mF8wQj832coRim9F3PXPNmV79bEOLuxt4FX/SPuRJ2+6utkWC41nVyLIWCy46kEqOz8VVtXB4dbbW+9Fm94+/DpzO+RzPbgLikTp/hmLtRp3B4YFrHB/uS81uGV0+gbq9EDXO2DKqX+EfpwoI6C9soEAKCkZcF6OjVvfLCPSn8X+0/7LcwKu/1puVyi1u2crKxxwAXuY4DHMzQMNfWq2GQBhhGBpMsjkITWOLTdOQq0kGkNG3lK+hsBNR2sThDmCmPeRb4kiVa0pJaG+ySClcAW4IGhMEp29nXWYtVYWaeZtUKj9Wre4c7ZakFNbvwU5Rdx//GXDfptIb2lyilEPnsEse1uizq3BYATUdI3EOLHxrptzEjs6r+7qDSPsjd0QCYgKLExEK9OB+Y/Ue1xcaKvjHsIqpjWm1H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(86362001)(33656002)(7696005)(316002)(54906003)(66556008)(64756008)(66446008)(6916009)(76116006)(478600001)(66946007)(71200400001)(4326008)(66476007)(5660300002)(55016003)(8936002)(52536014)(8676002)(41300700001)(2906002)(38070700005)(38100700002)(122000001)(186003)(107886003)(53546011)(26005)(9686003)(6506007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3JHNWkzOXV4WHJORVJZN0x1NXhGMU1UZDNxalVHK2RnQ21jREt3NVcxMzNn?=
 =?utf-8?B?NkxTQmFEUGpzdi9XQW93dHhJYWxKeTE0SWRtQzRhWkwwWE5YNzJ5UFNTbzlU?=
 =?utf-8?B?NjFXQmlDK3dTUUg1RXJHNVJUb254Nm8wdi8venZVSVJMeTVlanE0eUpVVUYy?=
 =?utf-8?B?UWYwMzdWaGdIUFp1aVdHdmhnbVJ0Q01nRUlPdURVamJDUjFRTlRxYW1YQXhr?=
 =?utf-8?B?WXBLUUlXRSt3RXo2SEpYMEFnRkR4WTI1ekZhdUwrdDIzb3NlbTR4S3BnMXow?=
 =?utf-8?B?YmhQVkloN250bEZyUWRMYU9oNWF1QjRBSlUvLzBzTi8vZ2Zld1I5R3hNaDZF?=
 =?utf-8?B?bFp1Ni8reWhhY3h2cXgzZmdFQURaQjlkL2IyZkdRdktnTEFGZ0JENm42OW81?=
 =?utf-8?B?ZWtHRE1McnFYZWhQZExXVFMzUXdjVjAxRmJZQmU2RGdneS9ENE40YmhSTjlV?=
 =?utf-8?B?ZC9JWnU0NnMvc1JERlVxTkN2MDdwVHJNeVVKMVNLQzBQQnJFR2N5MlM5Q01o?=
 =?utf-8?B?ZzJwNk4wS1J5UE80UVdIckVYUVlDcjdoRWQ5Uy9NZCtmNUNWMnRkbmR1NytH?=
 =?utf-8?B?ZVB4WDEyRWJra0p6NlBUZWpvS3ZOOEg0bFd4RGs0SVZFK1c4c1dsL2dtQ0F5?=
 =?utf-8?B?ekJ2TEt5NTN6RHNjak04NlRjK0J0SDFuQUt0VnUrNmZHRFhLVW9lSVNrOU5t?=
 =?utf-8?B?amFmaFRTNjJ6K3QvU1RZL2luSU5GYVJWT0hocU0wUURWVngxeUgzanRZekVQ?=
 =?utf-8?B?UGN5UDZRSGxCeFNrM3Y1bHY2enFDbytQV3Q3MnBsajhHelo2dWUxMzgwYnVM?=
 =?utf-8?B?bm54aTQ3QzVma2ZIbzA0YzdTY0d5RFNadHpZck1rN2phSnU1bnVzTUVyN2R4?=
 =?utf-8?B?UVZ0ZFVnWWYyUStkTDBoV01sMCtTRzU1MFM3THl4di9mKzZUS0p4QXM5S0dp?=
 =?utf-8?B?a1BGZmxKWXEzaGxvU3BvYjExWVZkbGQyL0JqSHlkRFNIWlprMURzSkliVlVv?=
 =?utf-8?B?YytySE5iL2FvL3Z4bkhiL2I4UVcvdU0waXMvOVZiRUNCTnRiai9HcmZIUE94?=
 =?utf-8?B?blZkT0xZUFNRd1pBTElXNXY0U2NkV1kzR3EzL3FDOGVtd2xZMTBET1loRFBX?=
 =?utf-8?B?MnVwMTE0YWlGVmtXSnpUOTdMM0E0cjFQV09va3A4TlRyZW93cnFNQUN1UHBP?=
 =?utf-8?B?dEE2NjVSclVtbnNuOFdFN2x6eFd5TjQ4Tlh5dFk5em5XK2NWOUNQYWIrRlhx?=
 =?utf-8?B?RDV6OEtKbGdjdFB0T3RCd0VsRWNjb3BNbk5EZHpWSzA0amRKRXk5RWt6VVZC?=
 =?utf-8?B?dktEeDZDaW1CR05SRWo3ZTV6ZGNHTDM4TFJtbVNPVTdZM0cxbFo3bUlZNFd1?=
 =?utf-8?B?NHYvdjRTWXE5cmdRZ1FuTVE5Z2NMLzJVOVkreWsvb3NWVmlWcVZpdWhyQXFG?=
 =?utf-8?B?V0E3dHdrajVkS3JEMjN6UlNRVmRudUY4YTVlNGtHRUlqcGY1SGZDQm4xYUtE?=
 =?utf-8?B?N20rV0xubWQ4MmpxdWpSVU1OZ0VFMlphZUZDUTJLcmpvS2o2RzMrTUFsVUJv?=
 =?utf-8?B?aUNwZGJBWmRISjNqVmk2bkswWkduanlhUjgwVjI3Y3pHUmdHR2RYbGhGalhi?=
 =?utf-8?B?ZWtEUkN0Wkx6cmRwbVVYWXBIemdtY1krLytoZ0Zlcno1NDMyVmFmeGJkNzho?=
 =?utf-8?B?VVU3ZndzWjYxTjRPaXdhM1FNYmFJT3FBdHBXNlAwcjIvOUs4SHRVbno5TXJN?=
 =?utf-8?B?V0Z6SnhGQVd6ZnRoNGlzTmN3TVE1SUJSSUc4VEpGT2pXMnBwK3lQVzhMZHFo?=
 =?utf-8?B?V0o4S3JOMVpQWElvcWU4YkY3M0l4MWtVNnlxMkt6ZWJzYS9zSXhTemVFTjQ3?=
 =?utf-8?B?aS94Rk5EYkxDS0I5d2wxbUF3eFVCRWMrYXBEeGtQeGZYTnUwa1BZcE4xSTQx?=
 =?utf-8?B?c05YalNDbUR0Q3NCTUJUTFh1MHRlRE5Gekx5MFVPSk9FTzRQVmpnbGU2WUxu?=
 =?utf-8?B?Y3VwRGFuV25yWEZ2SmpiMVVVZXlRN2N0OFNGTm9LcGJRdExiLy9nZnJabi9m?=
 =?utf-8?B?bnM1bFVsOStyOTY3UWlYeSt6bUlRSm5GR1lkU3doMDVrS2Z6UHR2SU5MTTl4?=
 =?utf-8?Q?mZUx4GV0aVt7KWXbss1fGA9Y5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54047811-ab05-4f4b-8452-08db4c6e25b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 07:06:56.5451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gPwW/9mOlYi7/CpNokNJ3lrlzwkHBSZvuqHlGF7ALj36xBiWUUZuxmunce/66RYrJsUHU+gBzw2XeZKX9O7kOBC6Dh2IyV+Yu5cWcQp8m9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7820
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDMsIDIwMjMgMTE6MjggQU0NCj4gVG86IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IFJvYiBIZXJyaW5nIDxy
b2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296
bG93c2tpK2R0QGxpbmFyby5vcmc+OyBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPjsgTWFnbnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IGxpbnV4
LQ0KPiByZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0
NDogQWRkIGdwdSBjb29saW5nDQo+IGRldmljZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1
ZSwgQXByIDI1LCAyMDIzIGF0IDU6NTLigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBncHUgY29vbGluZyBkZXZpY2UgZm9yIHBhc3NpdmUg
Y29udHJvbC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpDQo+ID4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpDQo+ID4gQEAgLTk3MCw2
ICs5NzAsNyBAQCBncHU6IGdwdUAxMTg0MDAwMCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPCZjcGcgUjlBMDdHMDQ0X0dQVV9BQ0VfUkVTRVROPjsNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICByZXNldC1uYW1lcyA9ICJyc3QiLCAiYXhpX3JzdCIsICJhY2VfcnN0
IjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZn
cHVfb3BwX3RhYmxlPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjY29vbGluZy1jZWxs
cyA9IDwyPjsNCj4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPg0KPiA+ICAgICAgICAgICAgICAg
ICBnaWM6IGludGVycnVwdC1jb250cm9sbGVyQDExOTAwMDAwIHsgQEAgLTEyNDUsNg0KPiA+ICsx
MjQ2LDExIEBAIG1hcDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb29saW5nLWRldmljZSA9IDwmY3B1MCAwIDI+Ow0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb250cmlidXRpb24gPSA8MTAyND47DQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG1hcDEgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB0cmlwID0gPCZ0YXJnZXQ+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb29saW5nLWRldmljZSA9IDwmZ3B1IDAgMj47DQo+IA0KPiBQZXJo
YXBzIHRoaXMgbmVlZHMgYSAiY29udHJpYnV0aW9uIiBwcm9wZXJ0eSwgYXMgdGhlIENQVSBkZXZp
Y2UgaW4gdGhlIHNhbWUNCj4gem9uZSBoYXMgb25lPw0KDQpPSywgd2lsbCBjaGVjayB0aGlzLg0K
DQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB9Ow0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICB0cmlwcyB7DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0K
PiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
DQo+IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==
