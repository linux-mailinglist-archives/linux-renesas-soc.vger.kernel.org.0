Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7380A520FAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 10:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237173AbiEJI2g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 May 2022 04:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233956AbiEJI2f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 May 2022 04:28:35 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17BC291CFF;
        Tue, 10 May 2022 01:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6fsfSWAhRMgaNPyQMu0U5hwuzgPUMRGJJWKcreqfba+XZbFTxjXrXlsHf0zx+96XA89yPa5/LzgHzkhTIyw0wrX1YKAEYO8yrbl7yZQKurLXRjqL8gAOvbPRc16hrC1Xl+OlO4kgLjf2t1br6jYBci5L337y/2yoZtuy+CY653sk7YGyVqtYTWCrU+ukCOxuNkytN8iJYn/gfNOR+iqHyRyoHgJoAS5Z77xDDxrrYbn/TSt7G1sy/qKt4G+j4fRYIoD+BYj2EjE3b5cWYaw1dD76Xp67SOMAlrqyXpDOy+C0Z9KM/CQOvWRgpLynQvNG+eCRAlOp+xcRmtGC62e7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFXiUuG2niQOozfMv7l6JGWwErzTbLlQH1ylWu5qtYM=;
 b=ikKli7HVobcgyT8NMQavn8/bNogAiFCa2FqFVSVJuoK31eq+kE68SRIfgC0dqTdC0wdda9EENpmNzsvYjHZI1a7TexTCTZTHYvwas1+Dlo5L0/ejn3yTjK8Wiuf2J/55bCGZ2LG/CpXNH1WJcp2F/2TTA+3WheR/K23Ac45Vb1YYhNYYBHxEdtShtIoxg4bsADM78FSjD4dYWIeLJyJg9K96aHS0LY0r9fk5Iqq9JBYQb+PsuobpxeiQedC72VdmsdeK4C6iggmYHG8uACJ83ce5sRBKBeOByNat3G+Xz3CU7+U++fkCAP8B+7Xz4YZqzMtROjwe7IAKWDb7Xt4E0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFXiUuG2niQOozfMv7l6JGWwErzTbLlQH1ylWu5qtYM=;
 b=sd9qy+SoNveRMDnR8CimlCLiv+hNeIpn6jmW9NDAKyFxTgvm/MqDjFXxDa9D3RYdNx8VDDMK2nBmHvNuqo7RracPgjjKmZjiL+bM/zcdOksJfpdwVzz2+Vrg9eyX8Pdd8YJ3wocBCpC2dqSlrZYTIu46CgHaQtOuu3FQXqvS1+Y=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6158.jpnprd01.prod.outlook.com (2603:1096:400:4a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 08:24:35 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 08:24:35 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
Thread-Topic: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
Thread-Index: AQHYYLAXexu1Iz9l/0mXLMs9PUTblK0Xy8wAgAAA//A=
Date:   Tue, 10 May 2022 08:24:35 +0000
Message-ID: <OS0PR01MB592248147BA1A775236B080186C99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220505184353.512133-1-biju.das.jz@bp.renesas.com>
 <b89be37d-ec17-8b6f-561b-63781352e774@gmail.com>
In-Reply-To: <b89be37d-ec17-8b6f-561b-63781352e774@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76a1638a-2df7-41a5-ff13-08da325e8442
x-ms-traffictypediagnostic: TYCPR01MB6158:EE_
x-microsoft-antispam-prvs: <TYCPR01MB61586BA44F345336A48DBAD986C99@TYCPR01MB6158.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f56Vf4KACdtnLM0NzSKpbk8kRQ6jHAr58PqH9PPP2wGKkAjCZWjfyo8O1shfHjF7rl3CmgkHAv2YewspG2k4zHpmHk8VmQNkQwiCbOrp5xN+kGOOJuMXIEpyX6uYZoIub7uHHAQnz6GocKBUadkTJxf8PSHqg+wHnIC0pmR32oySJ7FtaBfv51uiygv5MrLv8z3L6TEwJFFY5eJ/QzinwRkc5kB61YQ3ARJUH+thvgqzrt9MuDWRji6jx586Kl+Dt3yN9PG2z8nG02HZsWY+fxQASEMqN67plC4OHjKvbcqHhU8ncOwYoc02QIjt32iEVlgc6plzSEPVwV2iWK4pD7SE+QzVR3sXf6zEbilMyzI2zN6/WBovoxPkt9BX4wSCNrEi7TDkZHWS8GmDbj90MKLcccHz6wbT2JmvnPhkS+y9X6/wQhifNM4hISlsD0iS9Jg8Gh74rUwJuhkOMngNa1D8sztV+J/0p3tMrXafBFJSvtKqfoQWtqCs3p2RMTU+DJ6FkjaLH36M8BAmVVnpJCczPk0IYIN4X+GG1J6JuMa9v+Yy8dRfI4tGclD6d5g1ZAKgMib2ryXTqlBd6e9DgTvswGyBdSMg47CslEVlXtUYgMGfSQxKBVAqUNogXGLFrkZFeFESjuSLzMt7wq3bM+VZAFCYKlGVjrERcxEyXCFz2WqzZuVOaP+eDkLmukixLzSwccPQ4gqrvXGaegP5ruf627bPldKAEX7iFhl/jHdgOwVLNnp7Eq8V4FboXB5v5x49eiie/hyZrCaFpJ69s0BFTKLggF2dpbwXXa3Oqv4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(83380400001)(7696005)(316002)(508600001)(55016003)(966005)(33656002)(86362001)(9686003)(186003)(107886003)(6506007)(110136005)(54906003)(53546011)(26005)(52536014)(8936002)(2906002)(38100700002)(38070700005)(122000001)(4326008)(8676002)(64756008)(66476007)(66446008)(66946007)(66556008)(76116006)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enFRelZCQy9OOC9tKzI4NWRFcTVHZkhkZXdrdmtMQUt0NDVGakYwcnlWVm5U?=
 =?utf-8?B?L3k1VXJWR2JHcGt5WHUxOCtMNnc5L0RkQk5RWmVOZGtjY0ZCMVZQODBRWW9G?=
 =?utf-8?B?d2tFKzF0dWlUUzBOT1U4bWZocVBvTFgxNDNEYjlMc0htNC9JbVdsa3NYMENS?=
 =?utf-8?B?V1pabk5uMUMrQ2EvQ0tEVUVMckkvSUd1WTRXcUNXbW1lL1JxWkxGSHpLeG5q?=
 =?utf-8?B?RnRZMUwvbWE3NTF3NlZPOG9rL1B3WE9acWFsdVBSV3ErNnQwZkF1VVpDUndJ?=
 =?utf-8?B?M2VkSVlDWjFwUWVwT2pBd1RqMDJKdE93QXc1T3UrYlZtR0dTdldxQWNvZElm?=
 =?utf-8?B?WnVubHQ1UXluNlJwb1F6NGpXT3ZMa3NUdVdLSWhuWWJKcjNPSTZxcUtXeC9N?=
 =?utf-8?B?Vnd3Zlp3Sml4ZWxUNUNyN00yRkR0WTFid3NIZUduL0tHZmxvWlZoYlRwZW9Q?=
 =?utf-8?B?L3NWZ0FabzFMaGQwUXMyeFdDUWJtQWY2NVIreEFiTW5HNEVPaDdtSUZLS2c2?=
 =?utf-8?B?MTV1Z3YycHgxaEtTU0E1bDN2WUhuNHJNN29SdXVyZXA2bXJPNlF2N2NDbnpT?=
 =?utf-8?B?RTlqYUFOSVA0OG12V0lhT1l4SnMyaEJ2K29pT3NyVm02azJ1TmZnaHZlKzgx?=
 =?utf-8?B?OVhNY01JRGRtNTRPV0d0KzE0OG8wdWdMbEIzVTBDd2RNL0F5ZXhWMlpWMXFY?=
 =?utf-8?B?MitzMThzTlpLMXkrUk9aSFcrcm9ONldwVmZ3bEgyT2tkSlBaWTRYODRWQ0Fh?=
 =?utf-8?B?MGV0RThveDhmbDROMlF1VmlYRS9sQ3d0T3JPekNoSjNhSDJSQUg1ZkR4bndR?=
 =?utf-8?B?UlRsTDA0QUZUb2IxcDRPRHMzQjlMUHpVNEY5Y05PVWhHK2VScWNkWU03YU9t?=
 =?utf-8?B?c2NZWDNYcy9tRTJjL2dPZlV3R2F6d252bWEzWXJSdHBWR0VsSjE3bmhrTTNx?=
 =?utf-8?B?VUs3OFRscFMxSEViL0ZZeGlWOHNyR1BjeXNHQVNGbUJiYVRnZGg0bmY5RUg5?=
 =?utf-8?B?UW1SZDdmYWVwRDRQaW9sZmsxRFlrTkdaWEtKQ0FZTzlmQjlEQzlOSGFMZnZw?=
 =?utf-8?B?T2pwblRrTWVCMEw4TmhPWmQrMUsyOEo0Ym9JNERZMHdVMndXZU53blFsdnMr?=
 =?utf-8?B?UmRqR3UvR0FyZ3dMOFpxdnZPTUUvYVN1blNuZjNPb2F3d3ZOK1Z5dVorVnhS?=
 =?utf-8?B?djduWHZiU2V3RjYvN3R6emVBbWhvcy9HMTdZRml3d2I0dDV5aUVNK3RvSFVT?=
 =?utf-8?B?RUJhVDlwSjEzRzY2eXZvUGtIL25aRHpjbHFyU2VRakY1aXYzQmtrL3lwc1Nw?=
 =?utf-8?B?RG5CVytRUTBoYm5VMnZBbGZETVNDc0tsY3RNcUlwd01YWmFjYzJzRTE1TU56?=
 =?utf-8?B?dkwxeGRxbXQrVG01bXRPTy8wcGc4eVlEQ0FTeXJqN25MbkE1cmlJd3pCWUVP?=
 =?utf-8?B?N1lEbFpFMkdWM3N0SC8yWDJ0MklISmxzc0dPWUhwS2RlUHQrTGtaSldoQTZM?=
 =?utf-8?B?MHFMbjQ5QWtGVG5JajBZbmFlQnRWcFdHcm9hL1d2aEQxV0crMzcwRXdWdVNs?=
 =?utf-8?B?MGtFQlFWL2gyYmpmQmZrNllaNGtRa3NrMVp3d0JweSt4VVRTVGJ4V21kQjJ4?=
 =?utf-8?B?eFAyeEpwTlJkUnorWHpXeTJmeG45S2Y0endWNjVGUjl1R244L1I1ekNwSnAy?=
 =?utf-8?B?czNkVUEvaEJPOVZWcUJPdXNsUE9sN2x2cVBRUkIxVzJlak45K2VLcDlSYldh?=
 =?utf-8?B?N1NncllmYTZOK2lkVDJMTmxlU05wVGZna1JQQVZZaFA1VlgzeGh6YWVMdTRk?=
 =?utf-8?B?RGEwZDNLdms2aUxISW1NQTlmcWtzRnBScGswbkNCWGN3M0RSU2hUcDByaldG?=
 =?utf-8?B?ZFF4dTV2U282dUtuM1JpZE9pSXpZcXBPdUxpZjd3SlMrc0N6L3FqVktkcHF2?=
 =?utf-8?B?Y3N6VUhhcjhabmtac1ZDa2NmZ1RLelcvdDdXTE95aUJvNWJON1pSYzBIN1ZX?=
 =?utf-8?B?Z3BFTXN5RGNlRHlCbUxaMFpqbnh1UnEwNmt4VUkzMzd5bDZWOU1maXdkUmFG?=
 =?utf-8?B?OHhwOTdFUC9INkNtSG1zUURiWkphdCtjL0Zja2d0NS9LVFZ2UzZ5ZG1WUUJh?=
 =?utf-8?B?UVZ6ZmNEUmZZQW05UnZkOHJaWFVNaE1tSDFWeC9leHBTMGNyR3crZERDeTRM?=
 =?utf-8?B?TFpyWWpQZ0lBajBnb3FXRWY0QVhMc3FDTXUvRG1mVU00MDVjZVpmVEk3YmNv?=
 =?utf-8?B?UG5YVURlQlZhVmQ5engrOXVEUXhUbDBFSHB6amxhMFZid1VHcFJVdW5qaDJh?=
 =?utf-8?B?WGtLYkJUTHd6UXVMd1hSbjVKSW9vU3VRTjB6elJQOEdpL2NXTEtYN2N4VUhB?=
 =?utf-8?Q?s6uPxpsaSeSgoPao=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a1638a-2df7-41a5-ff13-08da325e8442
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 08:24:35.3175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q9Q7gmklGHeEw5JiL2AGcxD7VI7AfE2JA67xzsNb9GaNQ7MCmQa3SZe/NO665ypNXY3ADFmoR4QooRZ2PV80p8BOLXM3/HOWZARyhvxegag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6158
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2VpLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6
IHI5YTA3ZzA0MzogQWRkIEFEQyBub2RlDQo+IA0KPiBIZWxsbyENCj4gDQo+IE9uIDUvNS8yMiA5
OjQzIFBNLCBCaWp1IERhcyB3cm90ZToNCj4gDQo+ID4gQWRkIEFEQyBub2RlIHRvIFI5QTA3RzA0
MyAoUlovRzJVTCkgU29DIERUU0kuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOWEwN2cwNDMuZHRzaSB8IDIxICsrKysrKysrKysrKysrKysrKysrLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDMu
ZHRzaQ0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDMuZHRzaQ0KPiA+
IGluZGV4IGIzMWZiNzEzYWU0ZC4uNDAyMDFhMTZkNjUzIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDMuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDMuZHRzaQ0KPiA+IEBAIC00ODMsOCArNDgzLDI3
IEBAIGkyYzM6IGkyY0AxMDA1OGMwMCB7DQo+ID4gIAkJfTsNCj4gPg0KPiA+ICAJCWFkYzogYWRj
QDEwMDU5MDAwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA3ZzA0My1hZGMi
LCAicmVuZXNhcyxyemcybC0NCj4gYWRjIjsNCj4gPiAgCQkJcmVnID0gPDAgMHgxMDA1OTAwMCAw
IDB4NDAwPjsNCj4gPiAtCQkJLyogcGxhY2UgaG9sZGVyICovDQo+ID4gKwkJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAzNDcgSVJRX1RZUEVfRURHRV9SSVNJTkc+Ow0KPiA+ICsJCQljbG9ja3MgPSA8
JmNwZyBDUEdfTU9EIFI5QTA3RzA0M19BRENfQURDTEs+LA0KPiA+ICsJCQkJIDwmY3BnIENQR19N
T0QgUjlBMDdHMDQzX0FEQ19QQ0xLPjsNCj4gPiArCQkJY2xvY2stbmFtZXMgPSAiYWRjbGsiLCAi
cGNsayI7DQo+ID4gKwkJCXJlc2V0cyA9IDwmY3BnIFI5QTA3RzA0M19BRENfUFJFU0VUTj4sDQo+
ID4gKwkJCQkgPCZjcGcgUjlBMDdHMDQzX0FEQ19BRFJTVF9OPjsNCj4gPiArCQkJcmVzZXQtbmFt
ZXMgPSAicHJlc2V0biIsICJhZHJzdC1uIjsNCj4gDQo+ICAgIE5vdCAiYWRyc3RfbiI/DQoNCkFz
IHBlciBiaW5kaW5nc1sxXSwgaXQgaXMgY29ycmVjdCBpZSwgImFkcnN0LW4iDQoNCmh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5n
aXQvdHJlZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9yZW5lc2Fz
LHJ6ZzJsLWFkYy55YW1sP2g9bmV4dC0yMDIyMDUwOSNuNTENCg0KQ2hlZXJzLA0KQmlqdQ0K
