Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B13096BE25D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 08:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbjCQH7i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 03:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjCQH7h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 03:59:37 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FAE23D8B;
        Fri, 17 Mar 2023 00:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMtyBQaPXeSI3gz6m6YYNOYf82sp8oG4Y/PVH0EwbcoP50fJxoJUW1wjYsS0Hxtlyx9bABFeXlZOq2aM24MUyM8NV2QkqpkkauiCDysxLF/NLI4/VhPO1NcRea4w0RgypIH1rlFWLKYTvDOavClR/eM6LNoRnE40Cz8Z6fjN2D1GU5P6t6wZ3ODS8REu2D1P69qjXFqrd0pnxnRJcG9QMa81sFfURk4IdjiP2gQ0QDP/j2YYltNXW8hq9aQKhPrrYKRzDOdyBg0Ciodn47yA+sNYjLou1+5En+etXPSRYvJ3sAR82pHsrZ1pCS30So2OWLYyZWpwi0WxZdVnD1ZF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKOXdWs6VUJM1tM3DhobXyWgXQ7s2HxRWAiEiGE7id4=;
 b=JxFJVVi6/hpn71B0mQOmpql5b/R1ArMoBAHYT5j1R6MINjM+jO/GDoM7UVKiZijN1F/JXqJx65BigZFKMkpo8KIA4EqeGZVni7ZZaDlavFJQ49feYftGSwzByP/EgbP9jFTWltIc+TijMufHNGXfPFfRZPMhfS1w343Veyy1sUFgNoodF/SF+3Fc/CO6Rx38ac4c50ObL6QMfOszogDqkZ9wliZSlofvtNp2zYUUhVyL5QRcATjIcQqEhdkDDpDrhPQQyyvmBNmk2MeLWYiMHlwJhz+FG9SnrcBJvK5yN5OhdU9i/HE5xm/vvdmgin8nA84jsC5vfJvOLNpOskNgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKOXdWs6VUJM1tM3DhobXyWgXQ7s2HxRWAiEiGE7id4=;
 b=a2ao9BbTUxXqnU6RKIgKU3iEv43rHhUmnXfO/DBhZUvXkQs276ViywBarmfw6sxy+C2tqSdLlsljP4J21/MA44aKifqWIYvMJH97elj6wnXPDwqnXSkrSakRY1KbXdq2c2kac1oKMgn42LGegHsXYkarlwoeqEw+niiFM1jYliY=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS7PR01MB11503.jpnprd01.prod.outlook.com (2603:1096:604:241::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 07:59:24 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06%4]) with mapi id 15.20.6178.033; Fri, 17 Mar 2023
 07:59:24 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZWCCS4vXtQ/fzW0yUXUaCYffr6a79lBkAgAAA5oCAABuIgIAA62sg
Date:   Fri, 17 Mar 2023 07:59:24 +0000
Message-ID: <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OS7PR01MB11503:EE_
x-ms-office365-filtering-correlation-id: c3e169b4-e46f-4e6e-2ef5-08db26bd8609
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OBeTh4zgcWf2QFbmotmyNVnrJnI4cis6xLlo+vgUKzquxsJBo4ZjrE73uP0pFPitRi3VdlPf0QlAiO5j0sw8+ukZpDNq1sCtviwbp/QO2PedsE/l43sV7WPio+rRWJmxzNIpG+u/RptZLcfTq+WVhCWVbPBUYk+UokXZXVIE/MSt5NzQ4Y43MkJvd4OWFXsUbbyIeBJ4b36YjbUlGq72t3Dph4oQ1oDUoyulOk0bfL1UAls306fFPPMAKkiMEt5nAtjOmsORc5JnUaO5HiNsrVcRGtQ0gwHw5OgUAe/UD4r0iVvSeHPi9hTfapAmTvcBhi58ZdZLlKwQaQoHUfFfzF1cGWge9H3MLIULTV+T9/8QDEsifC01eLytKjSX0rca7sbaPT4DAlouZfxTcnZnMgHUidkZ5UFFMw8uun7B6NvbgZmOzU5tI1Hk/Mm7z7R3TA5muJ6+J7DgFLvsRx1v6+wDnn1jLt8iCu+64DO0XLiQgtFMcg/vII6/aqjdQ9FNEVIOBF9RIveAKsPEFMHPsZEsRDiTji6v59bErFOtnWSr0Nx0HtpnzFXJUSOExFvpCdLOis1wikI0Rs9wgf3UkbVX9LFrhO2Xwtte8fg4zGfzROtNPvsOM9xQW2R98dHKyRL41Znt0JsygtRH9Gry1ROVKOOVUzcgRG71w13DFb/mX+s/zY45nkKgqXwczzJQ5MR6ajHXQInJDbmUNjUnkw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199018)(7696005)(71200400001)(186003)(478600001)(54906003)(316002)(8676002)(6506007)(26005)(9686003)(66476007)(66446008)(64756008)(66556008)(66946007)(53546011)(76116006)(6916009)(4326008)(52536014)(41300700001)(8936002)(5660300002)(122000001)(38100700002)(2906002)(55016003)(86362001)(38070700005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUNNVTRFbVAvT2tFdWFiNXBxRTFKK3BqWlZMMkpwWjlkWlRFNVllMG1YM2cx?=
 =?utf-8?B?SDJxQVB5bjZWMlhWMVJ0L20xRGF5bUlGeUxqNU05SWQvS3VWS2drTlBqcDBB?=
 =?utf-8?B?ZytId0tDS1hJL3BSeVdEUjlkZ0FSZlZhVTVCWXZMSUIwOXo4bUtneWY5cVFF?=
 =?utf-8?B?MlJNcEZZeGc4TjBBdUJ2VGVSVHUwMXpzc1Y3dk9tMW01dU15RWxlV05PZ1hV?=
 =?utf-8?B?amdHOWxMVGRPQ2pPUHh2TnQwMDhud3FaNFhMVmo2WVZUejZKYmVTcmQyYXRE?=
 =?utf-8?B?YlNOZUtPYUFuUEdoanBHZ0R1Ykc0dDJNNVBxQUVtdmNKWGhKRnZyTTRYL3B4?=
 =?utf-8?B?Q1h6WkZPNGszSExWQi8rSUdqZGZrdUlseTFXdlRGVzhlalZ1L25scE9Wbisr?=
 =?utf-8?B?dDlMV3BiRFR5cGFnVFptcU5kWHg1MjNwOGlGalhjcUp3NDFIQWZSNHFRNzlK?=
 =?utf-8?B?NlpYSjFDR1FOSC9OUGxyM3FVTndLTEYyc0ZYekh4WWlScWE2Q0cwVDJXSkhw?=
 =?utf-8?B?eE9pVDlHT2dtS3lBNGFVSTVjOWdoekdxNHN6SFFzcEdmc08weEJLM3E0MGE4?=
 =?utf-8?B?ZFhBU2hqc1g1Nzl1TzQvMGJSRi9WTEhjSHhjWHcxb2RlMERmRHpQaGJKOHBS?=
 =?utf-8?B?MjluSzJTd1Bsc2NDaS9KU2IxTnlhZjJpczZxYWp3cXhIamE3UnduM0s2cG51?=
 =?utf-8?B?QW9mWVpjbWZHMWRzZXkzT3dvd2NaUUl4TWJhNGNrNmZQcG45L0RPSVVZY3Iy?=
 =?utf-8?B?ZGY3dDMweW45RVl0eE9RWWVYZFlWeGp5WFF3Ylpzemt0cXhiNFlzdkhGVUlO?=
 =?utf-8?B?eDIzbEFYNkFRdzR2U2FVdlI3b2pxdkJHR1U0aDJTRHB4Vkl4MGJHNzN3a1JO?=
 =?utf-8?B?N05nd1VjOW9vRWRnMWpiQ0JsRG9iS2xjQVUrN0JtVXB6VEdrL1FEVVc2em45?=
 =?utf-8?B?aFpKUC8rSU42WGo2ajl0U090SmZtMUoxWGxoQnA0TGNIQkpWREVKTS9IeGFL?=
 =?utf-8?B?bFdEUlRIazRpVEthNnFrWHhwSjN5NmtCa0o2TVhrcEg3QytDM2Y1N2xEQnVP?=
 =?utf-8?B?eXBXcmExejF5T0pibnphQ1NIbUlCeTdKK0pTZEdtVVZlaUYzck8wQmZBdmhG?=
 =?utf-8?B?NGNTY1NnY09Kc1hpQkJjdXNuVUw2LzU1VUw1QUthVWhXb2lMNzIwL2w3V2xK?=
 =?utf-8?B?RWpoYThYcTl3NmNEOUIzWWZXYWxKQUR2NjYva2I3R1lBNzBDZ1M2K0hzUStU?=
 =?utf-8?B?dmR1d1VIdjJVMDBhV0RDYjVYRm5JQ3pnM3VKd0hsMEpQYmR2YW95Wk1kVFpr?=
 =?utf-8?B?WjA1UmxYa2NRa2RVejhXMHVoaHBwcjdQNWNDbEVxaDdNTlRQRDRCTlU1Ky9z?=
 =?utf-8?B?czZOVVF3VlRiNDh6TzVzZm1RVGdZakxUS1J3VVF3TUNNWS9YWVRKTWl5cnpX?=
 =?utf-8?B?cVRtdlRHUktRUnhFR2MzM1FLd25SNFRiRmJKTllCdEZrSTV5YmxnVkNxUThw?=
 =?utf-8?B?V0VtOVBLU29MU2ZsVFU5c1VYMk1sMGJmODNHNjlCL2VOcTl5RjZzUGtQWURz?=
 =?utf-8?B?YjFsN3cyY3daQlA0LzhYUGdwMDRBaklFSVJFUmJsRlBSTHVzSndyZVlPUnR2?=
 =?utf-8?B?N2h0RW5na0NYempqbEYvN09kVkMyRlY0MmJ5N3M2QS9BTnFFK0FFWWk1RWZ2?=
 =?utf-8?B?OFB6SG9MelNRQkE3MjJCcjV3c29mNHhmbmhvb1hCZnh3WWNmM0tITk15elFQ?=
 =?utf-8?B?WUYrdWpmak0zb3hSb1diMzgycnBrU0ZSSHhHcXJaZTc0QkxYWmw5RjAyNUFp?=
 =?utf-8?B?eWd3cEdxNTZBMk9yMTh4cUdLeFAyalZwbDlvbStxOTBTV2JiZU1zbG5FQlBT?=
 =?utf-8?B?TlB0bTlvRXN6Vmt3ZEN1Tkc5R2E3ZGFBN0R5cGlKbXNVZGJ6REM2YWROQ09X?=
 =?utf-8?B?WlEwcUtjSGtuU2ppc3VoM2Z3NUE5aFJwbWI1WGM5ZzIvcGtKdU8xUDgzdUxB?=
 =?utf-8?B?YTkvTUZ0YWhQY0ZjemhoaHIrc2tlbCtCRzdxcGs1N2JzbEFMTG9vdGVnZWx0?=
 =?utf-8?B?a2d1c2lEWjZLU1kveXdOem5XeXVTbXUrNHppcjh6c0hQT1NwT05KZ0VIWkRH?=
 =?utf-8?Q?eK5Dx9QGAAD5VmeGJ62dcVG9f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e169b4-e46f-4e6e-2ef5-08db26bd8609
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 07:59:24.2011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4rgE3zBa0X2BVUxbWxR76Ag/0by4U4BTp8zLx1vE77HYn/q06riBxdle57YskYi6oIWZlcJErqRpMPRPUrl5MoawOI+fF8goLrCPpfLCuDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11503
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIHR0eTogc2VyaWFsOiBzaC1zY2k6IEZpeCB0cmFuc21pdCBlbmQgaW50ZXJydXB0IGhh
bmRsZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIE1hciAxNiwgMjAyMyBhdCA1OjM0
4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHR0eTogc2VyaWFsOiBzaC1zY2k6IEZpeCB0cmFuc21pdCBl
bmQgaW50ZXJydXB0DQo+ID4gPiBoYW5kbGVyDQo+IA0KPiA+ID4gT24gVGh1LCBNYXIgMTYsIDIw
MjMgYXQgNTowMeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gPiA+IFRoZSBSWiBTQ0kvIFJaL0ExIFNDSUYgaGFzIG9ubHkgNCBpbnRlcnJ1
cHRzLiBUaGUgZm91cnRoIGludGVycnVwdA0KPiA+ID4gPiBpcyB0cmFuc21pdCBlbmQgaW50ZXJy
dXB0LCBzbyBzaHVmZmxlIHRoZSBpbnRlcnJ1cHRzIHRvIGZpeCB0aGUNCj4gPiA+ID4gdHJhbnNt
aXQgZW5kIGludGVycnVwdCBoYW5kbGVyIGZvciB0aGVzZSBJUHMuDQo+ID4gPiA+DQo+ID4gPiA+
IEZpeGVzOiAzOTJmYjhkZjUyOGIgKCJzZXJpYWw6IHNoLXNjaTogVXNlDQo+ID4gPiA+IHBsYXRm
b3JtX2dldF9pcnFfb3B0aW9uYWwoKSBmb3Igb3B0aW9uYWwgaW50ZXJydXB0cyIpDQo+ID4gPg0K
PiA+ID4gSSBkb24ndCB0aGluayB0aGF0J3MgdGhlIHJpZ2h0IGJhZCBjb21taXQuDQo+ID4NCj4g
PiBPSy4gSSB3aWxsIHVzZSBiZWxvdyBjb21taXQgYXMgZml4ZXMgb25lLCB0aGF0IGlzIHRoZSBj
b21taXQgd2hpY2gNCj4gPiBhZGRlZCBSWi9BMSBTQ0lGIHdpdGggNCBpbnRlcnJ1cHRzLg0KPiA+
DQo+ID4gY29tbWl0IDhiMGJiZDk1NjIyOGFlODcgKCJzZXJpYWw6IHNoLXNjaTogQWRkIHN1cHBv
cnQgZm9yIFI3UzkyMTAiKQ0KPiANCj4gVGhhdCBvbmUgYWRkZWQgc3VwcG9ydCBmb3IgUlovQTIs
IGFuZCBpcyBhbHNvIG5vdCB0aGUgYmFkIGNvbW1pdD8NCg0KT0sgd2lsbCB1c2UgYmVsb3cgb25l
LA0KDQpGaXhlczogNGM4NGMxYjNhY2NhICgiQVJNOiBzaG1vYmlsZTogcjdzNzIxMDA6IGFkZCBz
Y2lmIG5vZGVzIHRvIGR0c2kiKQ0KDQo+IA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJp
YWwvc2gtc2NpLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jDQo+
ID4gPiA+IEBAIC0zMSw2ICszMSw3IEBADQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvaW9wb3J0
Lmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgva3RpbWUuaD4NCj4gPiA+ID4gICNpbmNsdWRl
IDxsaW51eC9tYWpvci5oPg0KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L21pbm1heC5oPg0KPiA+
ID4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4
L21tLmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gPiA+ID4gQEAgLTI4NDEs
NiArMjg0Miw3IEBAIHN0YXRpYyBpbnQgc2NpX2luaXRfc2luZ2xlKHN0cnVjdA0KPiA+ID4gPiBw
bGF0Zm9ybV9kZXZpY2UNCj4gPiA+ICpkZXYsDQo+ID4gPiA+ICAgICAgICAgc3RydWN0IHVhcnRf
cG9ydCAqcG9ydCA9ICZzY2lfcG9ydC0+cG9ydDsNCj4gPiA+ID4gICAgICAgICBjb25zdCBzdHJ1
Y3QgcmVzb3VyY2UgKnJlczsNCj4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiA+
ID4gKyAgICAgICBpbnQgaXJxX2NudDsNCj4gPiA+ID4gICAgICAgICBpbnQgcmV0Ow0KPiA+ID4g
Pg0KPiA+ID4gPiAgICAgICAgIHNjaV9wb3J0LT5jZmcgICA9IHA7DQo+ID4gPiA+IEBAIC0yODY0
LDYgKzI4NjYsMTQgQEAgc3RhdGljIGludCBzY2lfaW5pdF9zaW5nbGUoc3RydWN0DQo+ID4gPiA+
IHBsYXRmb3JtX2RldmljZQ0KPiA+ID4gKmRldiwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgc2NpX3BvcnQtPmlycXNbaV0gPSBwbGF0Zm9ybV9nZXRfaXJxKGRldiwgaSk7DQo+ID4g
PiA+ICAgICAgICAgfQ0KPiA+ID4gPg0KPiA+ID4gPiArICAgICAgIC8qDQo+ID4gPiA+ICsgICAg
ICAgICogUlogU0NJLyBSWi9BMSBTQ0lGIGhhcyBvbmx5IDQgaW50ZXJydXB0cy4gVGhlIGZvdXJ0
aA0KPiBpbnRlcnJ1cHQNCj4gPiA+ID4gKyAgICAgICAgKiBpcyB0cmFuc21pdCBlbmQgaW50ZXJy
dXB0LCBzbyBzaHVmZmxlIHRoZSBpbnRlcnJ1cHRzLg0KPiA+ID4gPiArICAgICAgICAqLw0KPiA+
ID4gPiArICAgICAgIGlycV9jbnQgPSBwbGF0Zm9ybV9pcnFfY291bnQoZGV2KTsNCj4gPiA+ID4g
KyAgICAgICBpZiAoaXJxX2NudCA9PSA0KQ0KPiA+ID4gPiArICAgICAgICAgICAgICAgc3dhcChz
Y2lfcG9ydC0+aXJxc1tTQ0l4X0JSSV9JUlFdLA0KPiA+ID4gPiArIHNjaV9wb3J0LT5pcnFzW1ND
SXhfVEVJX0lSUV0pOw0KPiA+ID4gPiArDQo+ID4gPg0KPiA+ID4gSSB0aGluayBpdCdzIHNpbXBs
ZXIgdG8ganVzdCBjaGVjayBpZiBTQ0l4X1RFSV9JUlEgaXMgbWlzc2luZzoNCj4gPiA+DQo+ID4g
PiAgICAgaWYgKHNjaV9wb3J0LT5pcnFzW1NDSXhfVEVJX0lSUV0gPCAwKQ0KPiA+ID4gICAgICAg
ICAgICAgc3dhcChzY2lfcG9ydC0+aXJxc1tTQ0l4X0JSSV9JUlFdLCBzY2lfcG9ydC0NCj4gPiA+
ID5pcnFzW1NDSXhfVEVJX0lSUV0pOw0KPiA+DQo+ID4gT0suDQo+ID4NCj4gPiA+DQo+ID4gPiBX
ZSBhbHJlYWR5IHJlbHkgb24gIm1ha2UgZHRic19jaGVjayIgdG8gY2F0Y2ggaW52YWxpZCBjb21i
aW5hdGlvbnMNCj4gPiA+IChhbnl0aGluZyBkaWZmZXJlbnQgZnJvbSAxLzQvNiBpbnRlcnJ1cHRz
KS4NCj4gPiA+DQo+ID4gPiBBbmQgcGxlYXNlIG1vdmUgdGhhdCBjb2RlIGJlbG93LCB0b2dldGhl
ciB3aXRoIHRoZSBvdGhlciBjaGVja3MgZm9yDQo+ID4gPiBub24tIGV4aXN0aW5nIGludGVycnVw
dHMuDQo+ID4NCj4gPiBPSywgV2lsbCBhZGQgYmVsb3cgY29kZSBpbiBwcm9iZQ0KPiA+DQo+ID4g
KyAgICAgICBpcnFfY250ID0gcGxhdGZvcm1faXJxX2NvdW50KGRldik7DQo+ID4gKyAgICAgICBp
ZiAoaXJxX2NudCAhPSAxICYmIGlycV9jbnQgIT0gNCAmJiBpcnFfY250ICE9IDYpDQo+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gDQo+IElNSE8gbm9uZSBvZiB0
aGVzZSBjaGVja3MgYXJlIG5lZWRlZC4gIm1ha2UgZHRic19jaGVjayIgdGFrZXMgY2FyZSBvZiB0
aGF0Lg0KDQpBZ3JlZWQuIFdpbGwgcmVtb3ZlLg0KDQpDaGVlcnMsDQpCaWp1DQo=
