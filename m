Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8947E519B0A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 11:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245526AbiEDJEi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 05:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346934AbiEDJEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 05:04:09 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF2811A03;
        Wed,  4 May 2022 02:00:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPTK3qF+h9Mtr00zeFH7N2tnUoxCQc2WVHKCYvfsRR2BAtTXOPQyVsLmD+D0XO2XGkBPEsFgahjVQX2J14Ezi09YpLrjC0wCdBa4ZaoXLVC/z2AB7O3XQoKZgsx9/6ibfCGBu+U4Ivbi7/NTtnY+Cr24bWimi4L32nY88RRSYyuE16K9LcD4LhtrXzsK4KLN5FWg5zD3S+Dm44OAAQbZ3+57QKznFiOpNq8VYDkXmT72PuXvyVKa4IJpH1fg2fze4NVTqMBWSIS0TpPs0qtCLsIvoPv643VSniSas66A87cVr/Geyv47280m1pKMXPrOwM1nEO0iHP4Z7LVspmlvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15aYM94FTFKyGRyn/6jjQgFARFgvXeSFal6A9uItQ6o=;
 b=gfFvChpyCMJKcLOcnOnMcL/7s++ZlH514iZFzz9B9VHu6ylXhAkv7opqivJcHhfoK7Hmkb7f2I1Nvx6sjEW7qXoaCgMsvAVSza8vzZnSY1WxueQB41uirokeKSYfES7cvDhOUxF5PPRfyKMQjW3fPDAzxJCKN4pitrE8jJVRqGBuBKuyyDCDQD58ilEv9ay1jD69+2qRWolunxLCFO50+eWWnTWolC3cVXLe/U/4ErVxgkK9b2op1oT5/sy8EKa3y+7Oz9d1axsarY2pPB2uej3rF2JxYOn+1R0e63GJ0Mm3SnSA6yJP3+B01Q1aT+UfiNAjKmydbrvt/q8CeVDjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15aYM94FTFKyGRyn/6jjQgFARFgvXeSFal6A9uItQ6o=;
 b=oeg3sQy01pqcT9UuCYOqR8PkXmTtIsywHay0dIldthEvSsS2Jhp4xUtr+tWX8aH72p+aFCWVtRQ/l+r9+K8yZynLEtZfGXI/zIhPWCcVklienf9dj3MhIkqUfAMdCtwxj/E1GGtRcW8e6v30OtuXHzgfXB/57RlwXM+1ndlCEFc=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TY2PR01MB4522.jpnprd01.prod.outlook.com (2603:1096:404:10f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 09:00:28 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 09:00:28 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH v3 12/12] arm64: dts: renesas: Add initial device tree for
 RZ/V2M EVK
Thread-Topic: [PATCH v3 12/12] arm64: dts: renesas: Add initial device tree
 for RZ/V2M EVK
Thread-Index: AQHYXuWxy5bye08esUq5sc9Q0NTx7a0OaokAgAAArbA=
Date:   Wed, 4 May 2022 09:00:28 +0000
Message-ID: <TYYPR01MB708652B6E589258B22F17D0DF5C39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
 <20220503115557.53370-13-phil.edworthy@renesas.com>
 <CAMuHMdVxak=uJuz72uCYVVD29RMm-66h1S1gnpu2=pnVFp8A_g@mail.gmail.com>
In-Reply-To: <CAMuHMdVxak=uJuz72uCYVVD29RMm-66h1S1gnpu2=pnVFp8A_g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 143e0bb3-1009-4120-8c84-08da2dac893e
x-ms-traffictypediagnostic: TY2PR01MB4522:EE_
x-microsoft-antispam-prvs: <TY2PR01MB4522668223C7646C9B3FDA69F5C39@TY2PR01MB4522.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zNhSbHKWdMiY9iLzhTrgbWN4mgWPN6fvu/15JHj7llTpIXXSJa51dOKcIisbsCFgxoN6E89QYc6A7hLb7a2K0Kn/03MVikxJYTgv9cRQ6UaraHwEV1WaOqTysK7eeH+n/4HEyFwIvpY8kPFNbek6JOVIu8A9RVfcH6ZNCXtLRlM4432+7/BemkKjPJDKa8nvrXXjUKo3gc01qj/XqIPASWh8D4KVaus4kj0rCAQKqVxLh3OTe9fUJg1tHE/2Nv8A1hPxjZKE0LjaEPVJZQCA337Ko4QwhvrSaoDZjbOP4qMk3EePlJqsECgb8iZ4oXhKt7GEbTq5H/3wk/UffHhS11AgYoZ+KV59KI9790zn9s9atK+QZSt+aw6RhziUjAkJHNyfFArB5NfCPvHL4s1X1nWwLT9PD/qTgyHFBJFiB1hDqqD2he9STjp3wSoso/B+pHdduQtCgO0aSsIitlvzUaiqz+gXlihyCDpAcGNere//OsKI4hiGL7NHPEUQl1XoTkOX+1kN175EGqKekXdtQ+CmnrnwqOf+B3BqZataYELus3jVGmO4KCLF+WxtUiBshJ96iHGrtCa4G+GHIMkxKbBKflKOmfkHhEbnbEcQ2UL3G2CA7HFc6k4nntNaHC3Vtgy8tfk1l4Jc3zs1dHJ/pVS7BdwbOO6VWsqMf9iJxo6WAw6C5fLE7kt+ihSe0DEPtXoA35DlmqUg9Ui9vFRBhQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(107886003)(9686003)(7696005)(6506007)(26005)(33656002)(122000001)(55016003)(71200400001)(508600001)(83380400001)(66446008)(66946007)(8676002)(53546011)(76116006)(64756008)(66476007)(66556008)(4326008)(316002)(44832011)(6916009)(54906003)(52536014)(2906002)(38100700002)(38070700005)(8936002)(5660300002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjdZenVDSjN6NGlvN2w2eW92K3BhVlBGVGtscEdmUVVJYmhqc1FOZ3hLQkg4?=
 =?utf-8?B?OTJjMzlyZGJJUnovV3BwSkJPRGRvZ0FpVEhpcWZUZTYxQ0ZZb0FsTDVreWs4?=
 =?utf-8?B?TVM1TWp1bmk5c00ydHo1TVdvTVkzTHVIQ3RMZzJTVzB0OGlHMmFiWldtUzlq?=
 =?utf-8?B?T3JsbGFyR2tHRDNZQkcvMFlvQTJRNDJBbjFRMk9yZUM4cStoQndFZGR2SzQ0?=
 =?utf-8?B?YVpJRVBwQ2NnOXhMejRoRlAvUE9hVVN3amRZMEd4RFdOUWxQeENZempaRUxL?=
 =?utf-8?B?eE9FMHNYZEg2Zmc0R3R4cGtTMGZDWFZOZDJkdjhxSUE3WlZpWE01VW5aSVB4?=
 =?utf-8?B?anJwazFqcDhUd3EwS0xJTjBRZjZaNUEwQ0lZVEJmR0R5QmJMSWswU0ZrTU9B?=
 =?utf-8?B?OVh6aVlhSXdiYmRMTTFSUWt1QmR0TzZmblU2RE55U3JHb2t4Ny9nMXVsYmtG?=
 =?utf-8?B?VzNSQ3VwRm41K0xPUW9oMWI3Sys5czYyOFNyREFqdlBtUGtObjRnZjZFblkx?=
 =?utf-8?B?ZEYzTzZJYVJsQkh0RGYwVC9tZC9DdDRQNjFoNEdjSi85cFdaVDE2bW9XU2NL?=
 =?utf-8?B?enpndnp2NlNKK0xNVUVTWW5za0hqcDQ2RGxJNUx6YWxwR210SCs0TW4vRHZt?=
 =?utf-8?B?UjE4cS9vMFNEQlJvV09qYXVGUys2M0xZWHMzT0VtUU5VN2ZrK0xwV3lpNXd2?=
 =?utf-8?B?a2kwdmVIc3dNQ3BhL1FvbEhhalBiYXo3UXNpcXUwVWtUVmJJMjh4cDFpSExB?=
 =?utf-8?B?TFVSODU0MmIzaUpDS2lpZ3g4eGFWc1lsdGpNYlJmTTVoZURuNVVzTmlFOEgy?=
 =?utf-8?B?YU9hdHlrTWx2NTFwNlliem5zTzc0WkkxNk96aDJhWWg2cmo4UVA4aHJBZGh3?=
 =?utf-8?B?QnZFQmtkL0syNFpXNVJ4dGtCMGVpWHkvSG1nMFRUclpnYVpLOUpvV3M3dHBO?=
 =?utf-8?B?U2hpdDY5RzYxaHNjUS9FLzlsc1pDei9TaVExMjJEUTFGRkF4OW1Bd2ozeCtw?=
 =?utf-8?B?YittREphazVEU3ZYZjQ1ZUNFc1hTeUFOd0tTOGhzbUhJS1k2dXpOcDh3dkh1?=
 =?utf-8?B?dHhVUldoaFkxQzZYNWNMMURHZUhEZ1dVdmJKSjhickgyVmVXa0Y2dkMxWUh5?=
 =?utf-8?B?RTBCNk9Ma0o1V29UTFMxQ3ZXNWN0VFpjQzZqUmlsMmYwR2VEZk1VUGdVS0lH?=
 =?utf-8?B?MkpjaGxzNSsyT01lVUF5eWdxK3puMEN2RSt3YnlXMFJ0R0wrNFlQOTVpZy9V?=
 =?utf-8?B?K3VCRlhEaEpXc3RTTlZCdUxVc3BGNjQ0OVN4ZWlnVGNHUFJkQUVqVXVBWjZJ?=
 =?utf-8?B?S0cxckpyRHhOQkMvSzFONmNYR0xvZ0YwQzZZYnc5aldTWmZJTEFIdFM4UkxM?=
 =?utf-8?B?LzRSQ2NQenZtSnlvSUpqaXpla2s0d0pRUUdaVkVIYkdEb0k2WHpjRFdUOTJj?=
 =?utf-8?B?M29kN0lTanhOd242ejloZjcvTEJMMmpoVjRIdlZjNjNuVnl4VVk1NHhxalkw?=
 =?utf-8?B?d1BoUW5SZlZsbGVrbElwbW1RaGYzNTVLWmhteC9qTEJMOXBjVThDY1U4UHE5?=
 =?utf-8?B?L2hVcThidWM3T3FMeURsZ1kvekV3aU1qODV6Q3gzM3pTZ2FDejdVZTAxNmlH?=
 =?utf-8?B?YkNmdWRlakh6TkR2N2dVMlYvTEFXU09Td2xVQ2RxZ29GZUljWllpMjZYU0ZM?=
 =?utf-8?B?dG5ZQzFaemt1QWw4aDl5RWE1MUZxenZXR2E0TmJSYzYvM3Y0L2x5Sk5OSE8x?=
 =?utf-8?B?ZTlEaEJxT0NjRzRRTThqdE8rVDBvYzJ5bGsvWU1pSUxjUVRSMGVoMjdPanFv?=
 =?utf-8?B?OGxZNXZURy93aC9EMFRRT3QyeHVnQ2ZUTE5NM2UxUFNCdkxsdFYyeWZQeHgv?=
 =?utf-8?B?VWZYUkJ3V1Z3T29IL25pUDU5djlXV1cyZHNNajFONVR0b1o4UG92TWlFUlJZ?=
 =?utf-8?B?NDBiY2ZxdUtmaWdxSjJKbGVLVHB5Y1puK3hXaXBwaER1TnRONmp4RWZIRGtt?=
 =?utf-8?B?OHgzcVlCcXNZcEg3a0FLTkRBOStLbEh0L2ZmNWdUNy9NTUt4cFVXZy9lakZW?=
 =?utf-8?B?aVMrRmFzSTVVOCt4cEloYWgwWGFHZDh4bWo5NEZFay9BSjc5VndHZjd0bmdu?=
 =?utf-8?B?ZUV5bFJiNXV4WTJseU9CQWlSS0ZzM05KYVRhQWVvZmQxTGxaQmtYT05ZWTZ1?=
 =?utf-8?B?NCtOdkRGbjdYVytEYkI3SkU0djZLUFRTNXkyS24rNHEyd0I2RFRDQ1A2aVVi?=
 =?utf-8?B?bkRrRmtGK0hZYS8xTHFJSjlVZk1XYmRzTXE4RVptSmpQYjlsOEtkdDE3aklR?=
 =?utf-8?B?d00xNldiVHZUWG5BbTJjdDlETldjSTE0SHJESVBReFZEUVRpQStrN0xLNVM5?=
 =?utf-8?Q?zn0xxj9YbONiRJho=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143e0bb3-1009-4120-8c84-08da2dac893e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 09:00:28.6393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7D8eHuUIDRL0iGh4G01fJqXPcXGu+Kw2GkghayteSJjMsij5OQk8f+5jq3usdFhvUVNRh/KIJwUItLAPlwa1iPJj+9+hAnYSx4ebMdLLmDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4522
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDA0IE1heSAyMDIyIDA5OjUyIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90
ZToNCj4gT24gVHVlLCBNYXkgMywgMjAyMiBhdCAyOjAyIFBNIFBoaWwgRWR3b3J0aHkgd3JvdGU6
DQo+ID4gQWRkIGJhc2ljIHN1cHBvcnQgZm9yIFJaL1YyTSBFVksgKGJhc2VkIG9uIFI5QTA5RzAx
MSk6DQo+ID4gLSBtZW1vcnkNCj4gPiAtIEV4dGVybmFsIGlucHV0IGNsb2NrDQo+ID4gLSBVQVJU
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsIEVkd29ydGh5IDxwaGlsLmVkd29ydGh5QHJl
bmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjM6DQo+ID4gIC0gQWRkIGNvbW1lbnQgYWJvdXQgbWVt
IHJlc2VydmVkIGZvciBJU1AgRmlybXdhcmUNCj4gPiAgLSBSZW1vdmUgc3lzIG5vZGUNCj4gDQo+
IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwMTEtdjJtZXZrMi5kdHMNCj4gPiBA
QCAtMCwwICsxLDQ0IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArLyoNCj4gPiArICogRGV2aWNlIFRyZWUgU291
cmNlIGZvciB0aGUgUlovVjJNIChyOWEwOWcwMTEpIEV2YWx1YXRpb24gS2l0IEJvYXJkDQo+ID4g
KyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAu
DQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArL2R0cy12MS87DQo+ID4gKyNpbmNsdWRlICJyOWEwOWcw
MTEuZHRzaSINCj4gPiArDQo+ID4gKy8gew0KPiANCj4gPiArICAgICAgIG1lbW9yeUA1ODAwMDAw
MCB7DQo+ID4gKyAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9yeSI7DQo+ID4gKyAg
ICAgICAgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICAgICAgICAqIGZpcnN0IDJHaUIgaXMgcmVz
ZXJ2ZWQgZm9yIElTUCBGaXJtd2FyZSwNCj4gDQo+ICIyR2lCIiAoMHg4MDAwMDAwMCkgZG9lc24n
dCBsb29rIHJpZ2h0IHRvIG1lLg0KPiBQZXJoYXBzIDEuMjUgR0lCPw0KSG93IG9uIGVhcnRoIGRp
ZCBJIGRvIHRoYXQ/DQpZZXMsIDEuMjUgR2lCIGlzIGNvcnJlY3QuDQoNCj4gSWYgeW91IGNvbmZp
cm0sIEkgY2FuIGZpeCB1cCAoYW5kIHRoZSBwcmV2aW91cyBwYXRjaCksIGFuZCBxdWV1ZSBpbg0K
PiByZW5lc2FzLWRldmVsIGZvciB2NS4xOS4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAqIG5l
eHQgMTI4TWlCIGlzIHJlc2VydmVkIGZvciBzZWN1cmUgYXJlYS4NCj4gPiArICAgICAgICAgICAg
ICAgICovDQo+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg1ODAwMDAwMCAweDAgMHgy
ODAwMDAwMD47DQo+ID4gKyAgICAgICB9Ow0KPiANCj4gVGhlIHJlc3QgTEdUTSwgc28gd2l0aCB0
aGUgYWJvdmUgZml4ZWQ6DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPg0KDQpUaGFua3MhDQpQaGlsDQo=
