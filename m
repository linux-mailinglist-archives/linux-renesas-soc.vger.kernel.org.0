Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7813F51F6D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 May 2022 10:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbiEIIMJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 May 2022 04:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237788AbiEIIHB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 May 2022 04:07:01 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61E81B1751;
        Mon,  9 May 2022 01:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgoXTW6XguRPrXcZFgbhZPiXx6utc+Rc9EUN1qg63n2dJKDXaQp73U0ok35XEtBi3RpKwW/9LzN27dywtY6CLxIM/KaPBHo58JtSnagdSYUxVTdrOI444Ar97oijJlPdoawp0s9UfaS5lGiM00VxufHwdHyXfE/PLuH+tqHm7s+HQnerLPRrakaLfvqEG+x3k/xYXtpGnunVjiFuFxXBloYt1nPRxKwfeoRuK38qJ35dBD0K2oDMly7kuYZ89wzdqv0g1UJPx83jO5+f0TlbBkukYOla70sM31VyNS4oaTW3IG1TezTuppot6RnPAW51CKjKxSh46qIKaerm/Nl+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkU2fzj+UVv4vnzjRUCXMR4ooOvtP9jm7KGty4pwba4=;
 b=POwGzVuVeRdvtUWFXdZg2DAddVgUtWLH0KdMu7rlFsSORR8wtaQsJsN5VqcKWz3DP9nlitT9i8EE1mzzcnu+9S4r8CquAvXz/O8AWn0kx1pvKdTbnheEAnK3bn9pWa/wW2B56KeXrL6eTRPWoS6QP85jT9iz7nMsryXC9f0aHQ9X/Jh9NMx3YEaT6gcwXLdeUmmS4V0C7i0MeVbH2/9QMiGUcVqCcMLvGIXh2C7KRstbyRmxcPk2hlphUeFWT1kpJmqyYEog7kfyFTYV2ZIlirVQw90ReG8cqeulk+eYcKgC5Omae88FGfPvO2ViqwI/NAaqCgx1FP3Dyjum5frJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkU2fzj+UVv4vnzjRUCXMR4ooOvtP9jm7KGty4pwba4=;
 b=hn1Lh5Y0JWUoHyk0vUUvPmGaDVLXkgc+oHMMUcs+MLgu6WaMYwCU+TdGUP/xSeZWUmvz9JzQkE6CdzX7kD1/OrviMBAAlD12iaIpI4mmI5KsOiRjYGbPIN0R0kRSjA+i1/IQRcPblGGK0nfZ/DW/6Rf0mMS7f103ijZolluPlko=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYXPR01MB1582.jpnprd01.prod.outlook.com (2603:1096:403:10::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 08:01:11 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 08:01:11 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 5/5] pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to
 handle GPIO interrupt
Thread-Topic: [PATCH v2 5/5] pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain
 to handle GPIO interrupt
Thread-Index: AQHYY2Mk76CXU0rqe0uShlNWW0dHWq0WGfewgAARioCAAAKIAA==
Date:   Mon, 9 May 2022 08:01:10 +0000
Message-ID: <OS0PR01MB5922AFCAFF0F2BAA57E7A88486C69@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220509050953.11005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220509050953.11005-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB59228AE4AF4EE53C382E8BA986C69@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CA+V-a8syBvN7czRA7tq0TJSmUcBzmgjLrFmizHD6Ycp5kLXJWw@mail.gmail.com>
In-Reply-To: <CA+V-a8syBvN7czRA7tq0TJSmUcBzmgjLrFmizHD6Ycp5kLXJWw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dec8719a-07a0-44e3-a02c-08da319214c6
x-ms-traffictypediagnostic: TYXPR01MB1582:EE_
x-microsoft-antispam-prvs: <TYXPR01MB15822811F8C60E811C5F705886C69@TYXPR01MB1582.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: clm9JBGrchoIDdXptenvQR2yVmlMeRP9EpuWrkLfF4/kQNX5DSWHFSKzNFLKAjcl1Yjh5xPbYSKITRVBkbgRm6GUKTQz6FtWWBqzptLJLafSb7rhBL2R64cKJYaPaXyd7l5R9LR5+esFTHapQvjHgfPNoAA2DlTzBhFeEr0RKYhQjiOP9SuDFhNgOQmq+ac9ktjxovOm+FQj+JwXerrtFUiHnzRRk4WN0ItnJKc6bsiNj8gEWkSin5vMV6wScuXftoZVX4hshp59pRV+KfFfZ0UAr/H2EL4jQZIishrfU4N6kBBQ+EvG06pErLjAiw0PgcETC6YgDtscDiMKs2JQaqu0Tvual1USGOYuLN2XkLjreiPPqziRANYxCPXoRa64R1I3X+nRyahfwaB3m3c4PXcXq1oaZzoW+QdiV++LOwRYbLctNSe6QyLF4qQyCb1r1wg+YT0SaraN3AW93QNFZNmlLPJgWGgTIU43DnBTMmplbJVPTaKtdpHA9n6X81kxvfIMfGdWMvfYd6qFce8cXLg2XO1CJ2UUrQlorURZ34CU6qQqFZvIp4blhQ1hq01Fton3Aa+ZwV/eIC38lXCdUo0qhqV+GKfZhUffMFk/dJGJEK1G7eDhWHje8PfEuxqPPl8SqDshohuG6NLxFgD5PvHDHjZeJMmh/vi7tTp+ZW0qmn+ZQFnwN1n6m5JIObhNNhd21K+7+JtL10Y/VFC2Pg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(83380400001)(122000001)(2906002)(186003)(9686003)(33656002)(26005)(55016003)(7416002)(5660300002)(30864003)(6506007)(7696005)(8936002)(52536014)(53546011)(86362001)(71200400001)(8676002)(4326008)(54906003)(6916009)(38070700005)(38100700002)(66446008)(66556008)(64756008)(66476007)(66946007)(76116006)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cm0yK0FHOVZsVXdSOE51SFlVMUp0VFJpZGZuVzZZd0NRSStHcnpsdmhvWm9i?=
 =?utf-8?B?ZHpUVXpLYXREOU9JRExpeUF0Q0JJa05JMEllSzhyYkVRRzJxeThTZDVIVHZU?=
 =?utf-8?B?VnJvWHROeDZNU1ZGODNFQUxsVnNoWWlKWmFpZXp4SXNyNE9Ra3J0VG1XT25R?=
 =?utf-8?B?NVBGS3R2Qnc4dHNuRlhESmo1MXVUZVRtT0o1RCt3SGdXWDN0SlpyQ2dkRlZR?=
 =?utf-8?B?ZDd0a3dheHlHK3dyVW8xSEFMWDlOVXFpNHJtazFYd3FhaTFVM3hUdjdjczhR?=
 =?utf-8?B?THJWZWNEaTZDdkgvaHVSTjVPRkRvREVCU2d2ZXpsS1N4RzJlb05YYU5BU0Iv?=
 =?utf-8?B?NHJ4bktEN2s2R0NQRXB3ZFFmWi81YktPcWRXdFp1L2N5dEFFOVVJSDRUVzJm?=
 =?utf-8?B?ZHpBZUYvTk9adGlBc0d6OGVrZlF1WlllWmwzRXhYelpWUVp2akFSRXd0WVNx?=
 =?utf-8?B?NURFaGdRa2YxZUYzWkZtdVBKSnJKaWFSblVCRUl2YXpyWHFvazBkZnlLSDll?=
 =?utf-8?B?aE1OYkRPWHl0ancvcm5XUHdYN3Z2UTA2WW54TFZ3dS9BWlltZ0YwbkdrNWdX?=
 =?utf-8?B?Vk1jcjQ1M1l2RkdtakpRa2ZpQkN0R0g5a0JLVWlnNGM4V1EyN1Z5M2ErSnN6?=
 =?utf-8?B?blp4UEM3ckJUdk1XMWhIa3BJUTdUWlFNZXh3b1FZRXdTVnNWK25UdjhCYVlP?=
 =?utf-8?B?YU91YXlZRUhzQm9ETUw3VFZyZGNsdlE2a25td2wxZ3FRSXNQQWhFckEySHFC?=
 =?utf-8?B?U3ZTTStDN1o5azdETkUwekpmdUpXczVBU1NhREVJanNTakhqbnBMbGFtNmJP?=
 =?utf-8?B?dFJUekZoMVlCS2dXMnFCdXZwZEZUcTFOZUxza3hNSWpEY3E0WWErdGlDOTdx?=
 =?utf-8?B?VC9BYkRiN3lxUmNVd1FUYnhDYUx4OGRQSHFYYVFZaFBObjhlYmMvLzkyOUt0?=
 =?utf-8?B?cTlMSWJmRmJ0OXNSWXQzNlZYRTA2eUlNYTRUdFhzT3UwZDVyZFhaa1U2bXFE?=
 =?utf-8?B?MkFyellBaGwvWEZUTTFkSWRvdVZqUThpaWRsa0JCUXhYOUZ0dC8zRS8zcmJP?=
 =?utf-8?B?QVRKT2VYRXRxc3AwOE1xSUdjTUcycUs1ZTlJWDlleDFIY2ZpNmhlK09ROFdG?=
 =?utf-8?B?YlE4MDU1czJjcm9uZm5oM2h3angzR041MnRISHhXTllqRC95SGIzSEkwb2pF?=
 =?utf-8?B?N094Ri8vV0drWmNZSGNzUlczWWVxclMycDNoTElOY2poNG1mOStIV2hraGox?=
 =?utf-8?B?VjdjWUpWUHhGQTJ4VDJCVU43cEkzQThpdXp4dlNBd1pYd253bEhWQXhyTmZy?=
 =?utf-8?B?WjFHazBiblVQbXIzUERRa29FaDZOSGNuck1qb01hSitsODZWWmRiTTVmU0N1?=
 =?utf-8?B?WGZqdlpMVERIcVoxVk9PSUxaSDVBVjRKOTBJY2xqRlYwNlVQWEhwdDBuUGx4?=
 =?utf-8?B?RnpHSjVsejNJNjd0UUtBRkk4MXR2enZkdmVWRGlVMlV0dWNyS0lHaC9QUEw0?=
 =?utf-8?B?VUlWUDhaWFJiNFdzOGNRZndEaUh2aUdUQmRrQmwvaGprM1huWlVHb252WVY0?=
 =?utf-8?B?TWZ6ZC9yb0tCVWYxL1plczBBamc5em5jNXlWWC9JVElaR2xiMU5BdGVuZm5R?=
 =?utf-8?B?anpaUzRvTSs5aGJCbmdRZDB1aW5Lak9RYnRSbFp2OTBQaHlrU3h5Yy80cDN4?=
 =?utf-8?B?SjV1dlQxWW5nV0lLVkFNZ3ZQaklDa0FnYzdSd2Q4NkFyYnkyVmhnN1JYNmQ1?=
 =?utf-8?B?TVArNENJYWFoa2sxcENaY0g1dCtTdmVrVHArRnJVR1c5cTlUN0haQnN2TjJT?=
 =?utf-8?B?bGRTY3hKaStBMW9YREgrRVZiYzZ0YmIvc0VRYmFEWE9LTnQ3UlVPOUR5U2pT?=
 =?utf-8?B?bFB0QXJ3TGl1R3lzTTBzRHlYL1Q4WXBkanVnSmhTSG5YRTlDY0lwK295YTNH?=
 =?utf-8?B?K2ZVMFBUWEgvWUJ4a0w4c3JXRDB1U1ljYllCdGdobEFCbytGbFpmTHJ1Slpp?=
 =?utf-8?B?blNnRWptMjFFcVRxYlZlV1RPSkhRRGgxa0RiZjNOMzRFbFpiK3BRbkQrSEZS?=
 =?utf-8?B?NmNQS1JqeHFwYUUxcE05cEJ0MFIrcnM3VzFZNzZlc00xQVZxVzNwaENIRXJI?=
 =?utf-8?B?UExhVlI4SStQdTVmcmZXQ0o2eFpXK0hvemFMTDE4UTFCRUErKzZGNDlTNjc1?=
 =?utf-8?B?bExFdytoV2NNeHFnaHRkNjV1bFZ0NkF5bnNLNkNmdWpNVThRTmR1eFJiZFVo?=
 =?utf-8?B?cElEbWxQVDluWnVabU5FYkl6UEhMSitWQTdxeGxqS05IYUo5Nko1bWRsN2Z1?=
 =?utf-8?B?eEdVRkZxUERLMU1abm9PZHRaYk0yRGhXRjZDRTljSGVGWno1dmM5cXBWUXN6?=
 =?utf-8?Q?m6maOZCLd4T1sLRQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec8719a-07a0-44e3-a02c-08da319214c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 08:01:10.9425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JSFKhDfe6iZ202Dj8ILxVK2byaXL5RtxccmO+s4XScAzQgSJxDyhpoxQBFOfrSUQz9yFl4jI5VWlinynF5SSIwOlUQJzMOmM2ZngJkuumhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1582
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUHJhYmhha2FyLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNS81XSBwaW5jdHJsOiBy
ZW5lc2FzOiBwaW5jdHJsLXJ6ZzJsOiBBZGQgSVJRIGRvbWFpbg0KPiB0byBoYW5kbGUgR1BJTyBp
bnRlcnJ1cHQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcu
DQo+IA0KPiBPbiBNb24sIE1heSA5LCAyMDIyIGF0IDc6NDkgQU0gQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIFByYWJoYWthciwNCj4gPg0K
PiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIg
NS81XSBwaW5jdHJsOiByZW5lc2FzOiBwaW5jdHJsLXJ6ZzJsOiBBZGQgSVJRDQo+ID4gPiBkb21h
aW4gdG8gaGFuZGxlIEdQSU8gaW50ZXJydXB0DQo+ID4gPg0KPiA+ID4gQWRkIElSUSBkb21pYW4g
dG8gUlovRzJMIHBpbmN0cmwgZHJpdmVyIHRvIGhhbmRsZSBHUElPIGludGVycnVwdC4NCj4gPiA+
DQo+ID4gPiBHUElPMC1HUElPMTIyIHBpbnMgY2FuIGJlIHVzZWQgYXMgSVJRIGxpbmVzIGJ1dCBv
bmx5IDMyIHBpbnMgY2FuIGJlDQo+ID4gPiB1c2VkIGFzIElSUSBsaW5lcyBhdCBnaXZlbiB0aW1l
LiBTZWxlY3Rpb24gb2YgcGlucyBhcyBJUlEgbGluZXMgaXMNCj4gPiA+IGhhbmRsZWQgYnkgSUE1
NSAod2hpY2ggaXMgdGhlIElSUUMgYmxvY2spIHdoaWNoIHNpdHMgaW4gYmV0d2VlbiB0aGUNCj4g
R1BJTyBhbmQgR0lDLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIN
Cj4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiAt
LS0NCj4gPiA+ICBkcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMgfCAyMDUN
Cj4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
MDUgaW5zZXJ0aW9ucygrKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0
cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMNCj4gPiA+IGIvZHJpdmVycy9waW5jdHJsL3JlbmVz
YXMvcGluY3RybC1yemcybC5jDQo+ID4gPiBpbmRleCBhNDhjYWM1NTE1MmMuLjI3NWRmZWM3NDMy
OSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpn
MmwuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5j
DQo+ID4gPiBAQCAtOSw4ICs5LDEwIEBADQo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0K
PiA+ID4gICNpbmNsdWRlIDxsaW51eC9ncGlvL2RyaXZlci5oPg0KPiA+ID4gICNpbmNsdWRlIDxs
aW51eC9pby5oPg0KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4NCj4gPiA+ICAj
aW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L29mX2Rldmlj
ZS5oPg0KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4NCj4gPiA+ICAjaW5jbHVkZSA8
bGludXgvcGluY3RybC9waW5jb25mLWdlbmVyaWMuaD4gICNpbmNsdWRlDQo+ID4gPiA8bGludXgv
cGluY3RybC9waW5jb25mLmg+ICAjaW5jbHVkZSA8bGludXgvcGluY3RybC9waW5jdHJsLmg+IEBA
DQo+ID4gPiAtODksNg0KPiA+ID4gKzkxLDcgQEANCj4gPiA+ICAjZGVmaW5lIFBJTihuKSAgICAg
ICAgICAgICAgICAgICAgICAgKDB4MDgwMCArIDB4MTAgKyAobikpDQo+ID4gPiAgI2RlZmluZSBJ
T0xIKG4pICAgICAgICAgICAgICAgICAgICAgICgweDEwMDAgKyAobikgKiA4KQ0KPiA+ID4gICNk
ZWZpbmUgSUVOKG4pICAgICAgICAgICAgICAgICAgICAgICAoMHgxODAwICsgKG4pICogOCkNCj4g
PiA+ICsjZGVmaW5lIElTRUwobikgICAgICAgICAgICAgICAgICAgICAgKDB4MmM4MCArIChuKSAq
IDgpDQo+ID4gPiAgI2RlZmluZSBQV1BSICAgICAgICAgICAgICAgICAoMHgzMDE0KQ0KPiA+ID4g
ICNkZWZpbmUgU0RfQ0gobikgICAgICAgICAgICAgKDB4MzAwMCArIChuKSAqIDQpDQo+ID4gPiAg
I2RlZmluZSBRU1BJICAgICAgICAgICAgICAgICAoMHgzMDA4KQ0KPiA+ID4gQEAgLTExMiw2ICsx
MTUsMTAgQEANCj4gPiA+ICAjZGVmaW5lIFJaRzJMX1BJTl9JRF9UT19QT1JUX09GRlNFVChpZCkg
ICAgICAoUlpHMkxfUElOX0lEX1RPX1BPUlQoaWQpDQo+ICsNCj4gPiA+IDB4MTApDQo+ID4gPiAg
I2RlZmluZSBSWkcyTF9QSU5fSURfVE9fUElOKGlkKSAgICAgICAgICAgICAgKChpZCkgJQ0KPiBS
WkcyTF9QSU5TX1BFUl9QT1JUKQ0KPiA+ID4NCj4gPiA+ICsjZGVmaW5lIFJaRzJMX1RJTlRfTUFY
X0lOVEVSUlVQVCAgICAgMzINCj4gPiA+ICsjZGVmaW5lIFJaRzJMX1RJTlRfSVJRX1NUQVJUX0lO
REVYICAgOQ0KPiA+ID4gKyNkZWZpbmUgUlpHMkxfUEFDS19IV0lSUSh0LCBpKSAgICAgICAgICAg
ICAgICgoKHQpIDw8IDE2KSB8IChpKSkNCj4gPiA+ICsNCj4gPiA+ICBzdHJ1Y3QgcnpnMmxfZGVk
aWNhdGVkX2NvbmZpZ3Mgew0KPiA+ID4gICAgICAgY29uc3QgY2hhciAqbmFtZTsNCj4gPiA+ICAg
ICAgIHUzMiBjb25maWc7DQo+ID4gPiBAQCAtMTM3LDYgKzE0NCw5IEBAIHN0cnVjdCByemcybF9w
aW5jdHJsIHsNCj4gPiA+DQo+ID4gPiAgICAgICBzdHJ1Y3QgZ3Bpb19jaGlwICAgICAgICAgICAg
ICAgIGdwaW9fY2hpcDsNCj4gPiA+ICAgICAgIHN0cnVjdCBwaW5jdHJsX2dwaW9fcmFuZ2UgICAg
ICAgZ3Bpb19yYW5nZTsNCj4gPiA+ICsgICAgIERFQ0xBUkVfQklUTUFQKHRpbnRfc2xvdCwgUlpH
MkxfVElOVF9NQVhfSU5URVJSVVBUKTsNCj4gPiA+ICsgICAgIHNwaW5sb2NrX3QgICAgICAgICAg
ICAgICAgICAgICAgYml0bWFwX2xvY2s7DQo+ID4gPiArICAgICB1bnNpZ25lZCBpbnQgICAgICAg
ICAgICAgICAgICAgIGh3aXJxW1JaRzJMX1RJTlRfTUFYX0lOVEVSUlVQVF07DQo+ID4gPg0KPiA+
ID4gICAgICAgc3BpbmxvY2tfdCAgICAgICAgICAgICAgICAgICAgICBsb2NrOw0KPiA+ID4gIH07
DQo+ID4gPiBAQCAtODgzLDYgKzg5Myw4IEBAIHN0YXRpYyBpbnQgcnpnMmxfZ3Bpb19nZXQoc3Ry
dWN0IGdwaW9fY2hpcA0KPiA+ID4gKmNoaXAsIHVuc2lnbmVkIGludCBvZmZzZXQpDQo+ID4gPg0K
PiA+ID4gIHN0YXRpYyB2b2lkIHJ6ZzJsX2dwaW9fZnJlZShzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlw
LCB1bnNpZ25lZCBpbnQNCj4gPiA+IG9mZnNldCkgew0KPiA+ID4gKyAgICAgdW5zaWduZWQgaW50
IHZpcnE7DQo+ID4gPiArDQo+ID4gPiAgICAgICBwaW5jdHJsX2dwaW9fZnJlZShjaGlwLT5iYXNl
ICsgb2Zmc2V0KTsNCj4gPiA+DQo+ID4gPiAgICAgICAvKg0KPiA+ID4gQEAgLTg5MCw2ICs5MDIs
MTAgQEAgc3RhdGljIHZvaWQgcnpnMmxfZ3Bpb19mcmVlKHN0cnVjdCBncGlvX2NoaXANCj4gPiA+
ICpjaGlwLCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQ0KPiA+ID4gICAgICAgICogZHJpdmUgdGhlIEdQ
SU8gcGluIGFzIGFuIG91dHB1dC4NCj4gPiA+ICAgICAgICAqLw0KPiA+ID4gICAgICAgcnpnMmxf
Z3Bpb19kaXJlY3Rpb25faW5wdXQoY2hpcCwgb2Zmc2V0KTsNCj4gPiA+ICsNCj4gPiA+ICsgICAg
IHZpcnEgPSBpcnFfZmluZF9tYXBwaW5nKGNoaXAtPmlycS5kb21haW4sIG9mZnNldCk7DQo+ID4g
PiArICAgICBpZiAodmlycSkNCj4gPiA+ICsgICAgICAgICAgICAgaXJxX2Rpc3Bvc2VfbWFwcGlu
Zyh2aXJxKTsNCj4gPiA+ICB9DQo+ID4gPg0KPiA+ID4gIHN0YXRpYyBjb25zdCBjaGFyICogY29u
c3QgcnpnMmxfZ3Bpb19uYW1lc1tdID0geyBAQCAtMTEwNCwxNA0KPiA+ID4gKzExMjAsMTkzIEBA
IHN0YXRpYyBzdHJ1Y3Qgew0KPiA+ID4gICAgICAgfQ0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4g
K3N0YXRpYyBpbnQgcnpnMmxfZ3Bpb19nZXRfZ3Bpb2ludCh1bnNpZ25lZCBpbnQgdmlycSkgew0K
PiA+ID4gKyAgICAgdW5zaWduZWQgaW50IGdwaW9pbnQgPSAwOw0KPiA+ID4gKyAgICAgdW5zaWdu
ZWQgaW50IGkgPSAwOw0KPiA+ID4gKyAgICAgdTMyIHBvcnQsIGJpdDsNCj4gPiA+ICsNCj4gPiA+
ICsgICAgIHBvcnQgPSB2aXJxIC8gODsNCj4gPiA+ICsgICAgIGJpdCA9IHZpcnEgJSA4Ow0KPiA+
ID4gKw0KPiA+ID4gKyAgICAgaWYgKHBvcnQgPj0gQVJSQVlfU0laRShyemcybF9ncGlvX2NvbmZp
Z3MpKQ0KPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiA+ICsNCj4gPiA+
ICsgICAgIGZvciAoaSA9IDA7IGkgPCBwb3J0OyBpKyspDQo+ID4gPiArICAgICAgICAgICAgIGdw
aW9pbnQgKz0NCj4gPiA+ICsgUlpHMkxfR1BJT19QT1JUX0dFVF9QSU5DTlQocnpnMmxfZ3Bpb19j
b25maWdzW2ldKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIGlmIChiaXQgPj0gUlpHMkxfR1BJT19Q
T1JUX0dFVF9QSU5DTlQocnpnMmxfZ3Bpb19jb25maWdzW2ldKSkNCj4gPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4NCj4gPiBNYXkgYmUgY29tYmluZSB0aGlzIHN0YXRlbWVu
dCB0byBhYm92ZSB3aXRoDQo+ID4NCj4gPiB8fCAoYml0ID49IFJaRzJMX0dQSU9fUE9SVF9HRVRf
UElOQ05UKHJ6ZzJsX2dwaW9fY29uZmlnc1twb3J0XSkpDQo+ID4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiA+DQo+IFRoZSByZWFzb24gSSBoYXZlIGtlcHQgaXQgb3V0c2lkZSB0
aGUgbG9vcCBpcyB0aGF0IEknbGwgaGF2ZSB0byBjaGVjayBpdA0KPiBvbmx5IG9uY2UgYXQgdGhl
IGVuZCBvZiB0aGUgbG9vcCBpbnN0ZWFkIG9mIHJlcGVhdGluZyB0aGUgY2hlY2sgZXZlcnkgdGlt
ZQ0KPiBpbiB0aGUgbG9vcC4NCg0KSSBtZWFudCBhYm92ZSBmb3IgbG9vcCwgc28gdGhhdCB2YWxp
ZGF0aW9uIGhhcHBlbnMgYmVmb3JlIHRoZSBmb3IgbG9vcD8/DQoNCmlmIChwb3J0ID49IEFSUkFZ
X1NJWkUocnpnMmxfZ3Bpb19jb25maWdzKSkgfHwgKGJpdCA+PSBSWkcyTF9HUElPX1BPUlRfR0VU
X1BJTkNOVChyemcybF9ncGlvX2NvbmZpZ3NbcG9ydF0pKQ0KCXJldHVybiAtRUlOVkFMOw0KDQpD
aGVlcnMsDQpCaWp1DQoNCg0KPiANCj4gQ2hlZXJzLA0KPiBQcmFiaGFrYXINCj4gDQo+ID4gQ2hl
ZXJzLA0KPiA+IEJJanUNCj4gPg0KPiA+ID4gKw0KPiA+ID4gKyAgICAgZ3Bpb2ludCArPSBiaXQ7
DQo+ID4gPiArDQo+ID4gPiArICAgICByZXR1cm4gZ3Bpb2ludDsNCj4gPiA+ICt9DQo+ID4gPiAr
DQo+ID4gPiArc3RhdGljIHZvaWQgcnpnMmxfZ3Bpb19pcnFfZG9tYWluX2ZyZWUoc3RydWN0IGly
cV9kb21haW4gKmRvbWFpbiwNCj4gPiA+ICt1bnNpZ25lZA0KPiA+ID4gaW50IHZpcnEsDQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX2ly
cXMpIHsNCj4gPiA+ICsgICAgIHN0cnVjdCBpcnFfZGF0YSAqZDsNCj4gPiA+ICsNCj4gPiA+ICsg
ICAgIGQgPSBpcnFfZG9tYWluX2dldF9pcnFfZGF0YShkb21haW4sIHZpcnEpOw0KPiA+ID4gKyAg
ICAgaWYgKGQpIHsNCj4gPiA+ICsgICAgICAgICAgICAgc3RydWN0IGdwaW9fY2hpcCAqZ2MgPSBp
cnFfZGF0YV9nZXRfaXJxX2NoaXBfZGF0YShkKTsNCj4gPiA+ICsgICAgICAgICAgICAgc3RydWN0
IHJ6ZzJsX3BpbmN0cmwgKnBjdHJsID0gY29udGFpbmVyX29mKGdjLCBzdHJ1Y3QNCj4gPiA+IHJ6
ZzJsX3BpbmN0cmwsIGdwaW9fY2hpcCk7DQo+ID4gPiArICAgICAgICAgICAgIGlycV9od19udW1i
ZXJfdCBod2lycSA9IGlycWRfdG9faHdpcnEoZCk7DQo+ID4gPiArICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgZmxhZ3M7DQo+ID4gPiArICAgICAgICAgICAgIHVuc2lnbmVkIGludCBpOw0KPiA+
ID4gKw0KPiA+ID4gKyAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgUlpHMkxfVElOVF9NQVhf
SU5URVJSVVBUOyBpKyspIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAocGN0cmwt
Pmh3aXJxW2ldID09IGh3aXJxKSB7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzcGluX2xvY2tfaXJxc2F2ZSgmcGN0cmwtPmJpdG1hcF9sb2NrLA0KPiBmbGFncyk7DQo+ID4g
PiArDQo+ID4gPiArIGJpdG1hcF9yZWxlYXNlX3JlZ2lvbihwY3RybC0+dGludF9zbG90LCBpLA0K
PiA+ID4gZ2V0X29yZGVyKDEpKTsNCj4gPiA+ICsNCj4gPiA+ICsgc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmcGN0cmwtPmJpdG1hcF9sb2NrLA0KPiA+ID4gZmxhZ3MpOw0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGN0cmwtPmh3aXJxW2ldID0gMDsNCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
IH0NCj4gPiA+ICsgICAgICAgICAgICAgfQ0KPiA+ID4gKyAgICAgfQ0KPiA+ID4gKyAgICAgaXJx
X2RvbWFpbl9mcmVlX2lycXNfY29tbW9uKGRvbWFpbiwgdmlycSwgbnJfaXJxcyk7IH0NCj4gPiA+
ICsNCj4gPiA+ICtzdGF0aWMgdm9pZCByemcybF9ncGlvX2lycV9kaXNhYmxlKHN0cnVjdCBpcnFf
ZGF0YSAqZCkgew0KPiA+ID4gKyAgICAgc3RydWN0IGdwaW9fY2hpcCAqZ2MgPSBpcnFfZGF0YV9n
ZXRfaXJxX2NoaXBfZGF0YShkKTsNCj4gPiA+ICsgICAgIHN0cnVjdCByemcybF9waW5jdHJsICpw
Y3RybCA9IGNvbnRhaW5lcl9vZihnYywgc3RydWN0DQo+ID4gPiArcnpnMmxfcGluY3RybCwNCj4g
PiA+IGdwaW9fY2hpcCk7DQo+ID4gPiArICAgICB1bnNpZ25lZCBpbnQgaHdpcnEgPSBpcnFkX3Rv
X2h3aXJxKGQpOw0KPiA+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiA+ICsgICAg
IHZvaWQgX19pb21lbSAqYWRkcjsNCj4gPiA+ICsgICAgIHUzMiBwb3J0Ow0KPiA+ID4gKyAgICAg
dTggYml0Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICAgcG9ydCA9IFJaRzJMX1BJTl9JRF9UT19QT1JU
KGh3aXJxKTsNCj4gPiA+ICsgICAgIGJpdCA9IFJaRzJMX1BJTl9JRF9UT19QSU4oaHdpcnEpOw0K
PiA+ID4gKw0KPiA+ID4gKyAgICAgYWRkciA9IHBjdHJsLT5iYXNlICsgSVNFTChwb3J0KTsNCj4g
PiA+ICsgICAgIGlmIChiaXQgPj0gNCkgew0KPiA+ID4gKyAgICAgICAgICAgICBiaXQgLT0gNDsN
Cj4gPiA+ICsgICAgICAgICAgICAgYWRkciArPSA0Ow0KPiA+ID4gKyAgICAgfQ0KPiA+ID4gKw0K
PiA+ID4gKyAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnBjdHJsLT5sb2NrLCBmbGFncyk7DQo+ID4g
PiArICAgICB3cml0ZWwocmVhZGwoYWRkcikgJiB+QklUKGJpdCAqIDgpLCBhZGRyKTsNCj4gPiA+
ICsgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnBjdHJsLT5sb2NrLCBmbGFncyk7DQo+ID4g
PiArDQo+ID4gPiArICAgICBpcnFfY2hpcF9kaXNhYmxlX3BhcmVudChkKTsNCj4gPiA+ICt9DQo+
ID4gPiArDQo+ID4gPiArc3RhdGljIHZvaWQgcnpnMmxfZ3Bpb19pcnFfZW5hYmxlKHN0cnVjdCBp
cnFfZGF0YSAqZCkgew0KPiA+ID4gKyAgICAgc3RydWN0IGdwaW9fY2hpcCAqZ2MgPSBpcnFfZGF0
YV9nZXRfaXJxX2NoaXBfZGF0YShkKTsNCj4gPiA+ICsgICAgIHN0cnVjdCByemcybF9waW5jdHJs
ICpwY3RybCA9IGNvbnRhaW5lcl9vZihnYywgc3RydWN0DQo+ID4gPiArcnpnMmxfcGluY3RybCwN
Cj4gPiA+IGdwaW9fY2hpcCk7DQo+ID4gPiArICAgICB1bnNpZ25lZCBpbnQgaHdpcnEgPSBpcnFk
X3RvX2h3aXJxKGQpOw0KPiA+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiA+ICsg
ICAgIHZvaWQgX19pb21lbSAqYWRkcjsNCj4gPiA+ICsgICAgIHUzMiBwb3J0Ow0KPiA+ID4gKyAg
ICAgdTggYml0Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICAgcG9ydCA9IFJaRzJMX1BJTl9JRF9UT19Q
T1JUKGh3aXJxKTsNCj4gPiA+ICsgICAgIGJpdCA9IFJaRzJMX1BJTl9JRF9UT19QSU4oaHdpcnEp
Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICAgYWRkciA9IHBjdHJsLT5iYXNlICsgSVNFTChwb3J0KTsN
Cj4gPiA+ICsgICAgIGlmIChiaXQgPj0gNCkgew0KPiA+ID4gKyAgICAgICAgICAgICBiaXQgLT0g
NDsNCj4gPiA+ICsgICAgICAgICAgICAgYWRkciArPSA0Ow0KPiA+ID4gKyAgICAgfQ0KPiA+ID4g
Kw0KPiA+ID4gKyAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnBjdHJsLT5sb2NrLCBmbGFncyk7DQo+
ID4gPiArICAgICB3cml0ZWwocmVhZGwoYWRkcikgfCBCSVQoYml0ICogOCksIGFkZHIpOw0KPiA+
ID4gKyAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcGN0cmwtPmxvY2ssIGZsYWdzKTsNCj4g
PiA+ICsNCj4gPiA+ICsgICAgIGlycV9jaGlwX2VuYWJsZV9wYXJlbnQoZCk7DQo+ID4gPiArfQ0K
PiA+ID4gKw0KPiA+ID4gK3N0YXRpYyBpbnQgcnpnMmxfZ3Bpb19pcnFfc2V0X3R5cGUoc3RydWN0
IGlycV9kYXRhICpkLCB1bnNpZ25lZCBpbnQNCj4gPiA+ICt0eXBlKSB7DQo+ID4gPiArICAgICBy
ZXR1cm4gaXJxX2NoaXBfc2V0X3R5cGVfcGFyZW50KGQsIHR5cGUpOyB9DQo+ID4gPiArDQo+ID4g
PiArc3RhdGljIHZvaWQgcnpnMmxfZ3Bpb19pcnFjX2VvaShzdHJ1Y3QgaXJxX2RhdGEgKmQpIHsN
Cj4gPiA+ICsgICAgIGlycV9jaGlwX2VvaV9wYXJlbnQoZCk7DQo+ID4gPiArfQ0KPiA+ID4gKw0K
PiA+ID4gK3N0YXRpYyBzdHJ1Y3QgaXJxX2NoaXAgcnpnMmxfZ3Bpb19pcnFjaGlwID0gew0KPiA+
ID4gKyAgICAgLm5hbWUgPSAicnpnMmwtZ3BpbyIsDQo+ID4gPiArICAgICAuaXJxX2Rpc2FibGUg
PSByemcybF9ncGlvX2lycV9kaXNhYmxlLA0KPiA+ID4gKyAgICAgLmlycV9lbmFibGUgPSByemcy
bF9ncGlvX2lycV9lbmFibGUsDQo+ID4gPiArICAgICAuaXJxX21hc2sgPSBpcnFfY2hpcF9tYXNr
X3BhcmVudCwNCj4gPiA+ICsgICAgIC5pcnFfdW5tYXNrID0gaXJxX2NoaXBfdW5tYXNrX3BhcmVu
dCwNCj4gPiA+ICsgICAgIC5pcnFfc2V0X3R5cGUgPSByemcybF9ncGlvX2lycV9zZXRfdHlwZSwN
Cj4gPiA+ICsgICAgIC5pcnFfZW9pID0gcnpnMmxfZ3Bpb19pcnFjX2VvaSwgfTsNCj4gPiA+ICsN
Cj4gPiA+ICtzdGF0aWMgaW50IHJ6ZzJsX2dwaW9fY2hpbGRfdG9fcGFyZW50X2h3aXJxKHN0cnVj
dCBncGlvX2NoaXAgKmdjLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGNoaWxkLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNoaWxkX3R5cGUsDQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKnBhcmVu
dCwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCAqcGFyZW50X3R5cGUpDQo+ID4gPiArew0KPiA+ID4gKyAgICAgc3RydWN0IHJ6ZzJs
X3BpbmN0cmwgKnBjdHJsID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2MpOw0KPiA+ID4gKyAgICAgdW5z
aWduZWQgbG9uZyBmbGFnczsNCj4gPiA+ICsgICAgIGludCBncGlvaW50LCBpcnE7DQo+ID4gPiAr
DQo+ID4gPiArICAgICBncGlvaW50ID0gcnpnMmxfZ3Bpb19nZXRfZ3Bpb2ludChjaGlsZCk7DQo+
ID4gPiArICAgICBpZiAoZ3Bpb2ludCA8IDApDQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiBn
cGlvaW50Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnBjdHJsLT5i
aXRtYXBfbG9jaywgZmxhZ3MpOw0KPiA+ID4gKyAgICAgaXJxID0gYml0bWFwX2ZpbmRfZnJlZV9y
ZWdpb24ocGN0cmwtPnRpbnRfc2xvdCwNCj4gPiA+IFJaRzJMX1RJTlRfTUFYX0lOVEVSUlVQVCwg
Z2V0X29yZGVyKDEpKTsNCj4gPiA+ICsgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnBjdHJs
LT5iaXRtYXBfbG9jaywgZmxhZ3MpOw0KPiA+ID4gKyAgICAgaWYgKGlycSA8IDApDQo+ID4gPiAr
ICAgICAgICAgICAgIHJldHVybiAtRU5PU1BDOw0KPiA+ID4gKyAgICAgcGN0cmwtPmh3aXJxW2ly
cV0gPSBjaGlsZDsNCj4gPiA+ICsgICAgIGlycSArPSBSWkcyTF9USU5UX0lSUV9TVEFSVF9JTkRF
WDsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIC8qIEFsbCB0aGVzZSBpbnRlcnJ1cHRzIGFyZSBsZXZl
bCBoaWdoIGluIHRoZSBDUFUgKi8NCj4gPiA+ICsgICAgICpwYXJlbnRfdHlwZSA9IElSUV9UWVBF
X0xFVkVMX0hJR0g7DQo+ID4gPiArICAgICAqcGFyZW50ID0gUlpHMkxfUEFDS19IV0lSUShncGlv
aW50LCBpcnEpOw0KPiA+ID4gKyAgICAgcmV0dXJuIDA7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+
ID4gK3N0YXRpYyB2b2lkICpyemcybF9ncGlvX3BvcHVsYXRlX3BhcmVudF9md3NwZWMoc3RydWN0
IGdwaW9fY2hpcCAqY2hpcCwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwYXJlbnRfaHdpcnEsDQo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQNCj4gPiA+ICtw
YXJlbnRfdHlwZSkgew0KPiA+ID4gKyAgICAgc3RydWN0IGlycV9md3NwZWMgKmZ3c3BlYzsNCj4g
PiA+ICsNCj4gPiA+ICsgICAgIGZ3c3BlYyA9IGt6YWxsb2Moc2l6ZW9mKCpmd3NwZWMpLCBHRlBf
S0VSTkVMKTsNCj4gPiA+ICsgICAgIGlmICghZndzcGVjKQ0KPiA+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gTlVMTDsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIGZ3c3BlYy0+Zndub2RlID0gY2hpcC0+
aXJxLnBhcmVudF9kb21haW4tPmZ3bm9kZTsNCj4gPiA+ICsgICAgIGZ3c3BlYy0+cGFyYW1fY291
bnQgPSAyOw0KPiA+ID4gKyAgICAgZndzcGVjLT5wYXJhbVswXSA9IHBhcmVudF9od2lycTsNCj4g
PiA+ICsgICAgIGZ3c3BlYy0+cGFyYW1bMV0gPSBwYXJlbnRfdHlwZTsNCj4gPiA+ICsNCj4gPiA+
ICsgICAgIHJldHVybiBmd3NwZWM7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gIHN0YXRpYyBp
bnQgcnpnMmxfZ3Bpb19yZWdpc3RlcihzdHJ1Y3QgcnpnMmxfcGluY3RybCAqcGN0cmwpICB7DQo+
ID4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGN0cmwtPmRldi0+b2Zfbm9kZTsN
Cj4gPiA+ICAgICAgIHN0cnVjdCBncGlvX2NoaXAgKmNoaXAgPSAmcGN0cmwtPmdwaW9fY2hpcDsN
Cj4gPiA+ICAgICAgIGNvbnN0IGNoYXIgKm5hbWUgPSBkZXZfbmFtZShwY3RybC0+ZGV2KTsNCj4g
PiA+ICsgICAgIHN0cnVjdCBpcnFfZG9tYWluICpwYXJlbnRfZG9tYWluOw0KPiA+ID4gICAgICAg
c3RydWN0IG9mX3BoYW5kbGVfYXJncyBvZl9hcmdzOw0KPiA+ID4gKyAgICAgc3RydWN0IGRldmlj
ZV9ub2RlICpwYXJlbnRfbnA7DQo+ID4gPiArICAgICBzdHJ1Y3QgZ3Bpb19pcnFfY2hpcCAqZ2ly
cTsNCj4gPiA+ICAgICAgIGludCByZXQ7DQo+ID4gPg0KPiA+ID4gKyAgICAgcGFyZW50X25wID0g
b2ZfaXJxX2ZpbmRfcGFyZW50KG5wKTsNCj4gPiA+ICsgICAgIGlmICghcGFyZW50X25wKQ0KPiA+
ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVOWElPOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgcGFy
ZW50X2RvbWFpbiA9IGlycV9maW5kX2hvc3QocGFyZW50X25wKTsNCj4gPiA+ICsgICAgIG9mX25v
ZGVfcHV0KHBhcmVudF9ucCk7DQo+ID4gPiArICAgICBpZiAoIXBhcmVudF9kb21haW4pDQo+ID4g
PiArICAgICAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVSOw0KPiA+ID4gKw0KPiA+ID4gICAg
ICAgcmV0ID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2ZpeGVkX2FyZ3MobnAsICJncGlvLXJhbmdl
cyIsIDMsDQo+ID4gPiAwLCAmb2ZfYXJncyk7DQo+ID4gPiAgICAgICBpZiAocmV0KSB7DQo+ID4g
PiAgICAgICAgICAgICAgIGRldl9lcnIocGN0cmwtPmRldiwgIlVuYWJsZSB0byBwYXJzZSBncGlv
LXJhbmdlc1xuIik7DQo+ID4gPiBAQCAtDQo+ID4gPiAxMTM4LDYgKzEzMzMsMTUgQEAgc3RhdGlj
IGludCByemcybF9ncGlvX3JlZ2lzdGVyKHN0cnVjdA0KPiA+ID4gcnpnMmxfcGluY3RybA0KPiA+
ID4gKnBjdHJsKQ0KPiA+ID4gICAgICAgY2hpcC0+YmFzZSA9IC0xOw0KPiA+ID4gICAgICAgY2hp
cC0+bmdwaW8gPSBvZl9hcmdzLmFyZ3NbMl07DQo+ID4gPg0KPiA+ID4gKyAgICAgZ2lycSA9ICZj
aGlwLT5pcnE7DQo+ID4gPiArICAgICBnaXJxLT5jaGlwID0gJnJ6ZzJsX2dwaW9faXJxY2hpcDsN
Cj4gPiA+ICsgICAgIGdpcnEtPmZ3bm9kZSA9IG9mX25vZGVfdG9fZndub2RlKG5wKTsNCj4gPiA+
ICsgICAgIGdpcnEtPnBhcmVudF9kb21haW4gPSBwYXJlbnRfZG9tYWluOw0KPiA+ID4gKyAgICAg
Z2lycS0+Y2hpbGRfdG9fcGFyZW50X2h3aXJxID0gcnpnMmxfZ3Bpb19jaGlsZF90b19wYXJlbnRf
aHdpcnE7DQo+ID4gPiArICAgICBnaXJxLT5wb3B1bGF0ZV9wYXJlbnRfYWxsb2NfYXJnID0NCj4g
cnpnMmxfZ3Bpb19wb3B1bGF0ZV9wYXJlbnRfZndzcGVjOw0KPiA+ID4gKyAgICAgZ2lycS0+Y2hp
bGRfaXJxX2RvbWFpbl9vcHMuZnJlZSA9IHJ6ZzJsX2dwaW9faXJxX2RvbWFpbl9mcmVlOw0KPiA+
ID4gKyAgICAgZ2lycS0+bmdpcnEgPSBSWkcyTF9USU5UX01BWF9JTlRFUlJVUFQ7DQo+ID4gPiAr
DQo+ID4gPiAgICAgICBwY3RybC0+Z3Bpb19yYW5nZS5pZCA9IDA7DQo+ID4gPiAgICAgICBwY3Ry
bC0+Z3Bpb19yYW5nZS5waW5fYmFzZSA9IDA7DQo+ID4gPiAgICAgICBwY3RybC0+Z3Bpb19yYW5n
ZS5iYXNlID0gMDsNCj4gPiA+IEBAIC0xMjUzLDYgKzE0NTcsNyBAQCBzdGF0aWMgaW50IHJ6ZzJs
X3BpbmN0cmxfcHJvYmUoc3RydWN0DQo+ID4gPiBwbGF0Zm9ybV9kZXZpY2UNCj4gPiA+ICpwZGV2
KQ0KPiA+ID4gICAgICAgfQ0KPiA+ID4NCj4gPiA+ICAgICAgIHNwaW5fbG9ja19pbml0KCZwY3Ry
bC0+bG9jayk7DQo+ID4gPiArICAgICBzcGluX2xvY2tfaW5pdCgmcGN0cmwtPmJpdG1hcF9sb2Nr
KTsNCj4gPiA+DQo+ID4gPiAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwY3RybCk7
DQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IDIuMjUuMQ0KPiA+DQo=
