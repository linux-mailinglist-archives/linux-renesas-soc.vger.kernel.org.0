Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC9A5BACB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Sep 2022 13:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbiIPLro (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Sep 2022 07:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbiIPLrk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 07:47:40 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC8AA2DAC;
        Fri, 16 Sep 2022 04:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjJaadLbIAyRQ5nkMg9hP/SESjihW/BZeyUR8zdUf9GoGepzB9OGENlUgS3/T4q96rCeS0QWm4YWNXmrlwjBHU5DLlwQY0YcbVpyvcDxo2u5bHVwYnuY22S0Jsj/pcHMXFT/O8Ux5iBJ2MK5tD3FFfcGWZ2eadQFlIc99BSVA7qYHou2sUyuY5fbtfzsfsHSLcw0rYxNnwmzwdsyYMj31tAvu7mZCFlUEyqm6SO6n9ateXoX4pI1GSWqbGxtL0Qso2ENzE/Iw1R+MOfLU3kU4IqVbbBUot/Wlynn9fIry8AfeaFvTuQAdCvJ2qZ/Mo6wnFcHNqQX5lTcocSTyqAfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSqzZjJrgSipbyEtJb13iZXCQbnoHLBuKrwWJWiqarg=;
 b=frxjtqIHIiK1bVNBq/SU3gvs0+MdW3DaAANaQ9yB18BYXQwceWMA9gEJakXsgZKYHUBqsQoG4P8ILe5gck3AnSBTik3Khqat3xdFp58WyoFColblkLs+/klqLF4bnhsL4b3eoCvAfx+/7AWjCTLNQWeStWOMalRQ922FbuyobFE30EntkFSuCfiZG1Gp4r5JTwtQzTgNps59A+LSSKQrEknK7KukAWJ9uznee6Qgy29KTt0VbPiimVjP3gcBgVITQlMg1snGXQQX3oRIBEbPHXMdxQ2ajw0wZiPlJW+d/UvOj0Gnk8YVrEbiMvCLokfP2t/nJez0qFesoNJPhe54kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSqzZjJrgSipbyEtJb13iZXCQbnoHLBuKrwWJWiqarg=;
 b=WqskxAA0qt6A9ogSAgXRInvmvdkNQywIlJljcyUc3Pbk34IWHSFc8797E1DQvzjWbxahNHULrfHYP5ZgAh82/ZZaVoIHwL/icx0TiU2/p/JPHuMoIwJ9tkKE6ZKX1Mpry/zLafGTHNhdyqcilma3mruv+nc2VsgmEMkZBRdkuKc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5801.jpnprd01.prod.outlook.com (2603:1096:404:8056::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 11:47:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5632.015; Fri, 16 Sep 2022
 11:47:34 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs
 clock
Thread-Topic: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs
 clock
Thread-Index: AQHYx4wC10b6ZMAwoESpl81Rqm30zK3dmNGAgAAAmPCAAM/ZYIAAqVkAgALV7IA=
Date:   Fri, 16 Sep 2022 11:47:34 +0000
Message-ID: <OS0PR01MB59224F0CD24972487904C29C86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220913161506.1817432-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWLRyW_6oTxK1eWXoJ0e=XS=p90yQPHB7kJANTj5Xk9vQ@mail.gmail.com>
 <OS0PR01MB59228767EFF2C9FA75D01B9486479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922BA53872389BBDBA8A72E86469@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWJ+2VHe1--FrzaekSe=Wfn63GrGvpdjZ3uUUKacV=7Bw@mail.gmail.com>
In-Reply-To: <CAMuHMdWJ+2VHe1--FrzaekSe=Wfn63GrGvpdjZ3uUUKacV=7Bw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB5801:EE_
x-ms-office365-filtering-correlation-id: ec32dfa7-0230-4e88-8d8a-08da97d93f13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3I3HG6W2p1QP592jUpMCHlDEBRHdQmgcViUf+KJPZxTaxyg7ZkUUhHCOS9i+JnNmAlG8sAUX8tGrREeyvpX+8rMAYILoayg9nIPazPgw60KQj2QtR+hZ9Eyl+INa4NapfSb0r3BkpP8iX203HnbrLZY+pc8jNJGPvIHUyjrCdqKWR1MqI9lS+FUQsNumu2G9tnf5p5xDkMhLtKjAdSS8xpnWpvWrVYRRmZlc3qqUwpTd3elL4nHFpJPg8O9DVOEw+7ZiKcBUVXE5+bbXK2k88hUiY9geUpfVMu9CoSayygJY7QuwmZNGyCwL0PoyowZfwDvnHkmUf9Em4scs2Rh7egOS1KtBGLEiUd+4AsFzQWhA7BOOGFfrDFKfR44sxs/UOnhjNDpoGLBXQXrk8FaffwunlWHI1m/kWi/oC9g6b5JMOSK+7Ed8lFqtlGcR5AdvAUzvYRZFmz4+/ALrfOgNgg32NeBrnX3KjpiMbcWW4oviQDD1kU3LbC2LSJxGJBB4WKgK8DVcK5jz+a+oyJsjW1Rip5GzUcwESd8pzpZOOitOR+7ENVQl4rQJQV7hFYsl7tbh7ibRdGdqc90mEXbxEWMfBd9z1/mP7Pr6kJZFMXYbzTgIMarB5cdOB6ib6CDoPEojW/qOXAcbfWghPW7boZYsWYwp4OjppXKSIlk5yyCnOnKIinYTNxz0hcA8kAdvebpPwDLPk3Qh5CcbhClJlQ0+89CkVuCdSOI7RJpWSR2loVyMUBtCRpL/S6wJwIyoVM5ma6SULV/dM1Zz5NxCvA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199015)(71200400001)(55016003)(66899012)(66556008)(66476007)(66446008)(64756008)(4326008)(2906002)(66946007)(38070700005)(53546011)(41300700001)(8936002)(76116006)(316002)(38100700002)(8676002)(6916009)(122000001)(54906003)(33656002)(86362001)(52536014)(478600001)(107886003)(6506007)(5660300002)(7696005)(83380400001)(9686003)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW15RGFQZC9jWlUwZFU5REV5a1NMUGVVcWhGR3BFdEFNQjFpZTN5Z3Ruc09z?=
 =?utf-8?B?QUJweXpYd3Y0Y0UrekE5UHF0SC9uOUNlbXNBQTZtVktyWG9acWFic2JWc1Z5?=
 =?utf-8?B?QnBycHFHeGVpeGVEd3Jmc1Nua1JMT01OMytMNllZRDBjUXRDRmdadmlqQ2hh?=
 =?utf-8?B?U042bW9sNVU5bXRldzBKOFpwc09kSUxQS09kd1g2SWY0VEQxdlNQdkdpMG5k?=
 =?utf-8?B?UXVmeDRVcXdONHhHM3NSVGRDNDUrOVNyU1I0NitleGFUaEIvb0pLenBPZjlO?=
 =?utf-8?B?VE9uZU1lb2pySWV3UExkcDFhUE81bVBiVVRCdjV1UEM2bmZ5MjdQZmk5K2dt?=
 =?utf-8?B?dUYzbWkvc1gyc2crUDNWM2RmMEdaeS9xczhDUE5EQURVeXRHZFh4TVJGOE92?=
 =?utf-8?B?RFRBU1pCMENEbzVPYzVKU21mWFVpclVndVVpRTZtRVQxT1pGQkEzRkovV1BS?=
 =?utf-8?B?TFh3clhkc25xc1V4eHhPdGNnZktJb29xMTEwQ1JxMFRBbERoWDJ1TDJTemlP?=
 =?utf-8?B?bFJpNUFQR0N1WW1QanJEd0JQSHVDTHJpcko1SmZLSEk0VnQyWUwyTFRJQ294?=
 =?utf-8?B?eXRheUpXQ0xSTHNJMkFpUW9MMWtFRENHeEUwaWZGamwxMUN4VkdTakI5YnRp?=
 =?utf-8?B?TnphbnIvYkRsdkZBSTdPVEZaK25ZVVBtbm81eE9vcFFpME5nU01YZGtLYmY3?=
 =?utf-8?B?d3YxZ3R5SzNUZzRzZzFORG5tZDRSWHJQSTdwNngyS2tzU0xmWUdqREtQa3Qv?=
 =?utf-8?B?NDdxRzB0MGtvVkZwUEFTUjF2YzhMY1dOMEtkZlE5SXdZbGhXc0RmZ0hZaStM?=
 =?utf-8?B?L3dnMm1DMlNCSVRDZ2xWUzlyM1Ard1RiNk91YjIrVkZkSmZWUWs2OFRreklr?=
 =?utf-8?B?SUd2OURpRVJHSzNnMU5nM3p6M1BacnUwZFRJaTNGTFRVNG1ITlB4cDdNQWs3?=
 =?utf-8?B?cENrcmJKODVKKzRPS2NhYjVXZk9JNUFvUXJRc2QxSUJYSkdkSVJrVjE3dGxM?=
 =?utf-8?B?MSt4MVg1M3gveFVxYUxXanFZQWU4NFgvZEUzV0NHUDI0SFV2NzdhdDYrWlRY?=
 =?utf-8?B?bVVQWmY5VnVQQW56L3Y0WTI1TUxDTFNqUE4wa0JOVVhwTS8xc0NkTmlwQVR2?=
 =?utf-8?B?K0JHZHFwK1l1SFZmai9YNk9UdExZNFpQaEJESS9wYVdTSk9hR0k1cmJteEc5?=
 =?utf-8?B?L3hSek9BMWlFWjdCWlZKaUhITmswbjdYODdGSk9hU1M0VmhVcEZoUDlMcGw5?=
 =?utf-8?B?d0hXV1JkL09yYUN4TlJaaGpmSzU2aktZTGFtelNDRXNVWWYreW1QbkZLcUFW?=
 =?utf-8?B?UlpmdTlUOS9wU0FDdm94Y05MbHNObG5KcWd2NENEWjRZT1lWSnE1Q2pGYW8v?=
 =?utf-8?B?ZG5xOEl0amFZL3RsQnlVbzFDck13T0lJN0s1WGJyQno4NUt3M3g5dURXdzNO?=
 =?utf-8?B?UTYvTnBtS010VmF5L2pmVEhEalFmeTZOR3N0ZzZaYVh1dER0QXN3ODE1d0pM?=
 =?utf-8?B?ZTQ2RTgvbHU1WDNBRVpOZHZjWkFjYkQwc3p0MlNJMHFUdTl2L2cramlLR3RE?=
 =?utf-8?B?K2p2RHMzTUZHVUNENGlELzBwMmpDSGc0ZHZQUnZZb3FWTWEzQWJxYUNQaUlH?=
 =?utf-8?B?KzFqZW94RnI1d3QvYnNuVzZKU3pBQVhYMVhZeFB6dGVRdjNGMjR3Y25MRkcx?=
 =?utf-8?B?K05qV1ZQTjV2OFRjQkptYmoxVVdTdUxLZ1RhSjN6Y2pvWVBCdHhvZnRLTzhr?=
 =?utf-8?B?dy9JSnRUV0JWRGlDQmRpejVYVEVmUnVlcllGcEVuM0N6dXRkcklwakNwZENM?=
 =?utf-8?B?TlVEMll6NXNuY0p3T0tKZ2QyUUhocHh0MG5zd3BvTU9Fb3FXekVPaUR1dkR5?=
 =?utf-8?B?QVo4T1BFTHJTbVpVN29Wamp4bXhVVWE3bzBYb2NzWWRQRjhVT3YrcmhpR3Ry?=
 =?utf-8?B?Uko5TXRWTXlRZDF1OVlkZzl4VHZ2VEVzQ05hZUdQUjRFdVVZNWVOVWE0VU5C?=
 =?utf-8?B?dWgrczF6OEREUUJGZ2VxMlJ0d3h6UzljUktLbmd6T3ZpWFR2TXd1dVJJVVNZ?=
 =?utf-8?B?NFhBWUVXYXJhOGNRSnV3ZzA0aU5lbGVpTjJYb280b1llVDNJcEdxdTdrRWdS?=
 =?utf-8?B?QmV1R3JOSlI1cTF1TlQ2K0EwWlkzNlFqeUh1OUZITmlEWE5rNGE1elJtOGNx?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec32dfa7-0230-4e88-8d8a-08da97d93f13
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 11:47:34.7976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +zRDnHzCbixeQpvyYvKjoFWaGs4+hljrK/kHVDu1lHfxUXAQAe+mZliuWY8arW50V2VD49qC3QpXymsr8MfAsmoPtySpOwhEoSmFxDneZU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5801
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URI_HEX autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIG1tYzogcmVuZXNhc19zZGhpOiBBZGQgbWFyZ2lucyBmb3IgbWFpbiBjbG9jayBhbmQN
Cj4gaHMgY2xvY2sNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIFNlcCAxNCwgMjAyMiBh
dCA2OjQ0IEFNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6
DQo+ID4gPiBTdWJqZWN0OiBSRTogW1BBVENIXSBtbWM6IHJlbmVzYXNfc2RoaTogQWRkIG1hcmdp
bnMgZm9yIG1haW4gY2xvY2sNCj4gPiA+IGFuZCBocyBjbG9jaw0KPiA+ID4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBtbWM6IHJlbmVzYXNfc2RoaTogQWRkIG1hcmdpbnMgZm9yIG1haW4NCj4gY2xv
Y2sNCj4gPiA+ID4gYW5kIGhzIGNsb2NrIE9uIFR1ZSwgU2VwIDEzLCAyMDIyIGF0IDU6MTUgUE0g
QmlqdSBEYXMNCj4gPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiB3
cm90ZToNCj4gPiA+ID4gPiBUaGUgU0RISSBoaWdoIHNwZWVkIGNsb2NrIGlzIDQgdGltZXMgdGhh
dCBvZiB0aGUgbWFpbiBjbG9jay4NCj4gPiA+ID4gPiBDdXJyZW50bHksIHRoZXJlIGlzIG5vIG1h
cmdpbiBhZGRlZCBmb3Igc2V0dGluZyB0aGUgcmF0ZQ0KPiA+ID4gPiA+IGFzc29jaWF0ZWQgd2l0
aCB0aGVzZSBjbG9ja3MuIE9uIFJaL0cyTCBwbGF0Zm9ybXMsIHRoZSBsYWNrIG9mDQo+ID4gPiA+
ID4gdGhlc2UgbWFyZ2lucyBsZWFkcyB0byB0aGUgc2VsZWN0aW9uIG9mIGEgY2xvY2sgc291cmNl
IHdpdGggYQ0KPiA+ID4gPiA+IGxvd2VyIGNsb2NrIHJhdGUgY29tcGFyZWQgdG8gYSBoaWdoZXIg
b25lLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gUlovRzJMIGV4YW1wbGUgY2FzZToNCj4gPiA+ID4g
PiBTRDAgaHMgY2xvY2sgaXMgNTMzMzMzMzMzIEh6IGFuZCBTRDAgbWFpbiBjbG9jayBpcyAxMzMz
MzMzMzMNCj4gSHouDQo+ID4gPiA+ID4gV2hlbiB3ZSBzZXQgdGhlIHJhdGUgZm9yIHRoZSBtYWlu
IGNsb2NrIDEzMzMzMzMzMywgdGhlIHJlcXVlc3QNCj4gPiA+ID4gPiByYXRlIGZvciB0aGUgcGFy
ZW50IGJlY29tZXMgNTMzMzMzMzMyICgxMzMzMzMzMzMgKiA0KSBhbmQgdGhlDQo+ID4gPiA+ID4g
U0QwIGhzIGNsb2NrIGlzIHNldCBhcyA0MDAwMDAwMDAgSHouDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBUaGlzIHBhdGNoIGFkZHMgYSBtYXJnaW4gb2YgKDEvMTAyNCkgaGlnaGVyIGhzIGNsb2NrIGFu
ZCBtYWluDQo+ID4gPiA+ID4gY2xvY2sNCj4gPiA+ID4gcmF0ZS4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4gPg0KPiA+ID4g
PiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+ID4gPiA+IEBA
IC0xNDcsNiArMTQ3LDcgQEAgc3RhdGljIHVuc2lnbmVkIGludA0KPiA+ID4gPiA+IHJlbmVzYXNf
c2RoaV9jbGtfdXBkYXRlKHN0cnVjdA0KPiA+ID4gPiB0bWlvX21tY19ob3N0ICpob3N0LA0KPiA+
ID4gPiA+ICAgICAgICAgfQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gICAgICAgICBuZXdfY2xvY2sg
PSB3YW50ZWRfY2xvY2sgPDwgY2xraF9zaGlmdDsNCj4gPiA+ID4gPiArICAgICAgIG5ld19jbG9j
ayArPSBuZXdfY2xvY2sgPj4gMTA7DQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgY2hhbmdlcyB0aGUg
cmVxdWVzdGVkIGNsb2NrIHJhdGUuIElzIHRoYXQgcmVhbGx5IGEgZ29vZA0KPiBpZGVhPw0KPiA+
ID4gPg0KPiA+ID4gPiBJc24ndCBpdCBzdWZmaWNpZW50IHRvIGNoYW5nZSB0aGUgdGVzdCAiaWYg
KGZyZXEgPiAobmV3X2Nsb2NrIDw8DQo+IGkpKSINCj4gPiA+ID4gc2xpZ2h0bHk/DQo+ID4gPg0K
PiA+ID4gV2UgaGFyZGx5IGVudGVyIHRoaXMgdGVzdCwgYWZ0ZXIgaXQgcmVxdWVzdCBmb3IgcHJv
cGVyIHdhbnRlZF9jbGsuDQo+ID4gPg0KPiA+ID4gZnJlcSBpcyBjbGtfcm91bmRfcmF0ZShyZWZf
Y2xrLCBuZXdfY2xvY2sgPDwgaSk7ICBhbmQgaXQgY29tcGFyZXMNCj4gPiA+IDQwME1IeiB2cyA1
MzMuMzMyIE1Iei4NCj4gPiA+DQo+ID4gPiBCYXNpY2FsbHkgd2FudGVkX2Nsb2NrPSAxMzMuMzMz
MzMgTUh6IGFuZCBpcyBzY2FsZWQgdG8gcG93ZXIgb2YgMg0KPiA+ID4gYW5kIHRoZW4gZWFjaCBp
dGVyYXRpb24gaXQgc2NhbGUgZG93biB0byBwb3dlciBvZiAyIGNvbXBhcmUgd2l0aA0KPiA+ID4g
cm91bmQgcmF0ZSB2YWx1ZS4NCj4gPiA+DQo+ID4gPiBbICAgIDQuMDIwNzgxXSAjIyMjcnpnMmxf
Y3BnX3NkX2Nsa19tdXhfZGV0ZXJtaW5lX3JhdGUjIyMjIyMjIHJlcS0NCj4gPiA+ID5yYXRlPTQy
NjY2NjY2NTYNCj4gPiA+IFsgICAgNC4wMjgwMTNdICMjIyNyemcybF9jcGdfc2RfY2xrX211eF9k
ZXRlcm1pbmVfcmF0ZSMjIyMjIyMgcmVxLQ0KPiA+ID4gPnJhdGU9MjEzMzMzMzMyOA0KPiA+ID4g
WyAgICA0LjAzNTMzMF0gIyMjI3J6ZzJsX2NwZ19zZF9jbGtfbXV4X2RldGVybWluZV9yYXRlIyMj
IyMjIyByZXEtDQo+ID4gPiA+cmF0ZT0xMDY2NjY2NjY0DQo+ID4gPiBbICAgIDQuMDQyNjM5XSAj
IyMjcnpnMmxfY3BnX3NkX2Nsa19tdXhfZGV0ZXJtaW5lX3JhdGUjIyMjIyMjIHJlcS0NCj4gPiA+
ID5yYXRlPTUzMzMzMzMzMg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICAg
ICAgICAgLyoNCj4gPiA+ID4gPiAgICAgICAgICAqIFdlIHdhbnQgdGhlIGJ1cyBjbG9jayB0byBi
ZSBhcyBjbG9zZSBhcyBwb3NzaWJsZQ0KPiB0bywNCj4gPiA+ID4gPiBidXQgbm8gQEAgLTE3Miw2
ICsxNzMsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50DQo+ID4gPiA+ID4gcmVuZXNhc19zZGhpX2Ns
a191cGRhdGUoc3RydWN0IHRtaW9fbW1jX2hvc3QgKmhvc3QsDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiAgICAgICAgIGNsa19zZXRfcmF0ZShyZWZfY2xrLCBiZXN0X2ZyZXEpOw0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gKyAgICAgICBiZXN0X2ZyZXEgKz0gYmVzdF9mcmVxID4+IDEwOw0KPiA+ID4gPg0K
PiA+ID4gPiBDYW4geW91IHBsZWFzZSBlbGFib3JhdGUgd2h5IHRoaXMgaXMgbmVlZGVkPw0KPiA+
ID4gPiBJdCBsb29rcyBjb3VudGVyLWludHVpdGl2ZSB0byBtZS4NCj4gPiA+DQo+ID4gPiBXaGVu
IHdlIHRyeSB0byBzZXQgMTMzLjMzMyBNSHogY2xrLCB0aGUgZGV0ZXJtaW5lIHJhdGUgY2FsY3Vs
YXRlcw0KPiA+ID4gcmVxLQ0KPiA+ID4gPnJhdGUgZm9yIHNkIGNsayBhcyA1MzMuMzMyIGFuZCBz
aW5jZSBhdmFpbGFibGUgY2xvY2sgc291cmNlIGZvcg0KPiBzZDANCj4gPiA+ID5jbGtzDQo+ID4g
PiBhcmUgMjY2LjY2NjYsIDQwMCBhbmQNCj4gPiA+IDUzMy4zMzMgTUh6LCBzbyBpdCBzZWxlY3Qg
dGhlIGNsb2NrIHNvdXJjZSBhcyA0MDBNSHouDQo+ID4NCj4gPiBKdXN0IHRvIGFkZCBoZXJlIHRo
ZSBtYWluIGlzc3VlIGlzIGNvbWluZyBmcm9tIG1hdGggY2FsY3VsYXRpb24uDQo+ID4NCj4gPiBD
b25zaWRlciBhbnkgdmFsdWUgQQ0KPiA+DQo+ID4gQiA9IEEgLyA0DQo+ID4gQyA9IEIgKiA0DQo+
ID4NCj4gPiBJZGVhbGx5LCB3ZSBleHBlY3QgQSA9IEMsIEJ1dCBpbiB0aGUgYmVsb3cgZXhhbXBs
ZSBJdCBpcyBub3QgdGhlDQo+IGNhc2UNCj4gPiAoaXQgaXMgQSAhPSBDKS4NCj4gPg0KPiA+IEEg
PSA1MzMzMzMzMzMgKDE2MDAvMyBNSHopDQo+ID4gQiA9IDUzMzMzMzMzMy80ID0gMTMzMzMzMzMz
DQo+ID4gQyA9IDEzMzMzMzMzMyAqIDQgPSA1MzMzMzMzMzINCj4gPg0KPiA+IFNpbmNlIEEgIT0g
QyB3ZSBhcmUgZW5kaW5nIHVwIGluIHRoaXMgc2l0dWF0aW9uLg0KPiANCj4gSSBhbSBmdWxseSBh
d2FyZSBvZiB0aGF0IDstKQ0KPiANCj4gSG93ZXZlciwgY2xrX3JvdW5kX3JhdGUoKSBpcyBzdXBw
b3NlZCB0byByZXR1cm4gdGhlIGNsb3Nlc3QgbWF0Y2hpbmcNCj4gcmF0ZS4gIEhlbmNlIHdoZW4g
cGFzc2VkIDUzMzMzMzMzMiwgaXQgc2hvdWxkIHJldHVybiA1MzMzMzMzMzMuDQoNCk5vLCBpdCBp
cyByZXR1cm5pbmcgNDAwMDAwMDAwLmFzIHJlZl9jbGstPnJhdGU9NDAwMDAwMDAwLCBhbmQgbmV3
IGNsayByYXRlIDUzMzMzMzMzMg0KDQpbICAgIDQuNTI0MTg4XSAjIyNyZW5lc2FzX3NkaGlfY2xr
X3VwZGF0ZSArKyAjIyMgNDAwMDAwMDAwLzUzMzMzMzMzMy81MzMzMzMzMzINClsgICAgNC41MzEy
MTddICMjI3JlbmVzYXNfc2RoaV9jbGtfdXBkYXRlIC0tICMjIyA0MDAwMDAwMDAvNDAwMDAwMDAw
LzUzMzMzMzMzMg0KDQorICAgICAgICAgICAgICAgcHJfZXJyKCIjIyMlcyArKyAjIyMgJWxsdS8l
bGx1LyVsbHUiLCBfX2Z1bmNfXywgY2xrX2dldF9yYXRlKHJlZl9jbGspLGZyZXEsIG5ld19jbG9j
ayA8PCBpKTsNCiAgICAgICAgICAgICAgICBmcmVxID0gY2xrX3JvdW5kX3JhdGUocmVmX2Nsaywg
bmV3X2Nsb2NrIDw8IGkpOw0KKyAgICAgICAgICAgICAgIHByX2VycigiIyMjJXMgLS0gIyMjICVs
bHUvJWxsdS8lbGx1IiwgX19mdW5jX18sIGNsa19nZXRfcmF0ZShyZWZfY2xrKSxmcmVxLCBuZXdf
Y2xvY2sgPDwgaSk7DQoNCj4gQUZBSVUsIHRoaXMgaXMgdGhlbiByZWplY3RlZCBieSAiaWYgKGZy
ZXEgPiAobmV3X2Nsb2NrIDw8IGkpKSIsIGR1ZSB0bw0KPiBiZWluZyBzbGlnaHRseSB0b28gbGFy
Z2UsIGNhdXNpbmcgNDAwMDAwMDAwIHRvIGJlIHBpY2tlZCBpbnN0ZWFkLg0KPiANCj4gQW0gSSBt
aXNzaW5nIHNvbWV0aGluZz8NCg0KV2l0aCB0aGUgYWJvdmUsIGl0IHNraXBzIHRoZSBpZiBzdGF0
ZW1lbnQNCg0KPiBJJ20gY3VycmVudGx5IG5vdCBpbiB0aGUgcG9zaXRpb24gdG8gdGVzdC92ZXJp
Znkgd2hhdCBpcyBhY3R1YWxseQ0KPiBoYXBwZW5pbmcuDQoNCk9LIFdpbGwgY2hlY2suDQoNCj4g
DQo+IEkgZG8gc2VlIGNsa19tdXhfZGV0ZXJtaW5lX3JhdGVfZmxhZ3MoKSBoYXMgYSBjb21tZW50
Og0KPiANCj4gICAgICAgICAvKiBmaW5kIHRoZSBwYXJlbnQgdGhhdCBjYW4gcHJvdmlkZSB0aGUg
ZmFzdGVzdCByYXRlIDw9IHJhdGUNCj4gKi8NCj4gDQo+IFNvIHBlcmhhcHMgdGhlIGlzc3VlIGlz
IHRoYXQgaXQgZG9lcyBub3QgcmV0dXJuIHRoZSBjbG9zZXN0IHJhdGUsIGJ1dA0KPiBhIHNsb3dl
ciByYXRlPw0KDQpZZXMsIExvb2tzIGl0IHJldHVybnMgYSBzbG93ZXIgcmF0ZS4NCg0KQ2hlZXJz
LA0KQmlqdQ0K
