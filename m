Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0CD6625641
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 10:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233037AbiKKJK5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Nov 2022 04:10:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbiKKJK4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 04:10:56 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0861CFEB;
        Fri, 11 Nov 2022 01:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQfU0YC/y0y2OEtyy9ABPC14g+BoKpyBQAOGZVCXwonsXIT4lVMca4/pOB3lj5EpomPlHGud53CjUU74pldB17NnNt4BlpwXz0IIZOE66rtUnwJTZRcIAG2MnrqEseJhC+cvFkAtD3GWtj+u0npIdClyGi5lFAs1xX9U35tdQ7qeVER1G5sLTjnH61sIQqHB/KYZFo4YVcCnAoOQs79mqqqm4naSN5kvIvgJBumovlAEbiq0uB97Xwqa8USV4mJGTL6/xk6pLVV8+B1fST74zpzl753gTtUj3y7rhVBchMjez7NmrO6CV9xqdhiAKh0YlLigjmWmOscbP3EkQ17BNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4w1gydAJOgFoJMQRBGVjsq7YnedTP0LycvTPifTlOa8=;
 b=f4txw9YEa/V1CYHjcVviaOyMX4fIICTEI9yGdujIPd7uNYZFBNKr8oyOLJYRpriTxzYGg2XCh16KCfvtRneYjEb+KLi3z56z8ZGuJyP5R8L4TZNsEcuvQcXuEAvtHzazQTJUS9sYTjB5NFKqqvgZKIVMvtsNkHTFt63JiidlT0EoqZwoqHXabDow4swGXs4lMRcL7npwBKqSbzxANig4P4WX2itRkriV4AwDTnK22im/8YJKYIXyw3K9F47w5AX6+vOILXwR+l3G1xnV5NJyq3VCI8aznQ8r3xrlHmqvXPaBKmUOjEoqKh/NwpC1GYK7uFDxCDemITZKudenwqP3Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4w1gydAJOgFoJMQRBGVjsq7YnedTP0LycvTPifTlOa8=;
 b=md03qFVBliMX10n6QhwVarSKXZFXNXna1bR6Wi2H4jCkMEoNTMJzOB5rreypkahlx6qvfBmXS+ETeozVI6hYMO1D9rFGAmJ6I6KQKcNZSJX2LjLLQSP2HTnyN8I9Ypz1C6Oai67bXQ/pFmqvMikQNJ0LYXwyEpQdjUMh1euS2+M=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10456.jpnprd01.prod.outlook.com (2603:1096:400:2f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 09:10:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.014; Fri, 11 Nov 2022
 09:10:53 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: renesas: r9a09g011: Add system
 configuration node
Thread-Topic: [PATCH v2 3/3] arm64: dts: renesas: r9a09g011: Add system
 configuration node
Thread-Index: AQHY9SCF6b1SNCs8dkO8lRnBdWXNLK45ZqwAgAAJIcA=
Date:   Fri, 11 Nov 2022 09:10:53 +0000
Message-ID: <OS0PR01MB5922ADB9F181E6745FE46EE986009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-4-biju.das.jz@bp.renesas.com>
 <b28c469b-f0f0-47c0-dd07-bf2dcde55824@linaro.org>
In-Reply-To: <b28c469b-f0f0-47c0-dd07-bf2dcde55824@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10456:EE_
x-ms-office365-filtering-correlation-id: 315bb787-61f9-405d-d536-08dac3c4a26b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MC01zcaWDztuPurXvuIAmt35zRNbpNUWc6YDmBdjesIsiEIJQ8NG/SGG56FVhYgKtEQBsmDJGl6g9aJUg3etmc/VC4/yLFio+W+0mWuA920mHYyU/VDPTcKcVrZ83DKz/RxUdxEHWoA7nID0/+eyQUZjgL/jg08vIgznf6oFcI+kScSyDmCQI6YKb9z5fYUfD3fNn+qdD17VyXs7lGIttcaXoXNzaeJOxxWYJNsbf6VtaKXj3dilBAtrEOWgTLwCd8CloDS5DzUD8XJopLm+EwFfxzyl9EPmzapqZwecrh99o3DfR02mZoHRPmV2zghY7RjqcMYAhnzDGrZJfczn4C6bPX+9syQP9IiALxHu7ROmZSMCeCMzmbKc8klSKB1MCFN8ldb8lVB6MNdz9NsIWdsi5EkF0p4vT/Xl7OdtHoLEiKuiipNJz+AzD/M1hyv+RZljDVvZOmAKRMp7noYMTq00MF+UD0PL5yR7aZ7qeq+xs5Q8OvHI2oZFlWMwAXzq5Jr8I0EnEAarNGJLhbyTQReNG/Fd3fDd4kBe8ZkGKx94dH0fkAP1m1K91jc7qM+uHvEW6/0IIUS3X3SGEM1PNIL4ZwudsiiEXqfpyIjQiw9qo3d8phrs7VtEYjYe3352Ycp47vcMA/yuBAplE8RZ0mHPmRrgaTkG48m1f4PSWiUFLhX5LO4TJF7QCa/wzZYcXpPPhwYYXsv1EObVNwzZzcA5ZJAvQ5x+wGbFcqam9eYCwpt+NyT4prX3oimJkE18msX/fyMSlt6f4PwZGs2cvg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(66946007)(66476007)(8676002)(76116006)(66556008)(64756008)(186003)(66446008)(4326008)(86362001)(478600001)(83380400001)(7696005)(107886003)(2906002)(52536014)(53546011)(5660300002)(8936002)(6506007)(33656002)(26005)(55016003)(9686003)(41300700001)(38100700002)(71200400001)(38070700005)(122000001)(316002)(110136005)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blh0aEFYRXZ1dUNKZU83dXE0WHpQUFpQclJ5Y0xZcHR2byswSmcxamFoampR?=
 =?utf-8?B?UkRncnBsKzV6cThMQlI5dHhuR2h2b0ZNUWlDanEvcVRMZ0lWRng4UTh5MnVu?=
 =?utf-8?B?SzRDaFJYSGlUaWhrcUw1YzlFa1ZGaHlsanVQNnY1UmRyMjRWUFllT2l6aDNR?=
 =?utf-8?B?dXRFS1NMbXI5NC9tWitGcjFuTXlwZnRyTExZRzNtM01EVnhSaXdSaWgwallY?=
 =?utf-8?B?VDZQU1dCY2NjeFlsMC9CNXdsaExnSllvemdCS0tuZlo2OEE0cVVjdVBXSGJM?=
 =?utf-8?B?L3F2TVNEeitiYXpHa2RJeWdBTTdOWlg2SkRVb3R4dmplVHNFZ0lqcXVsNEho?=
 =?utf-8?B?VzB6dFlobHY2bXlKL2N0Rit1VlNNTE55RldYZ0NpeENRUkU2dENlOEQ4cndP?=
 =?utf-8?B?VDNWdndXVk9XQXpFWWNWVFV3Zm13QkRlZUlxOHpKc2Voa2p2QlVkR0U5eGt1?=
 =?utf-8?B?Q2s2M3JDcU5QY0hFTHc2cnlkMkpsRkF5d2FPY0t0dE1OYzRsc1F2MHVueFhs?=
 =?utf-8?B?QVpkVndiVEt3QlVaMzNLRkE0Y1JQNVA2OW9teFZFVWdidVYvRTZWc3cvNTh6?=
 =?utf-8?B?U3hRcHVhRjIrdFNVdk5palgyeElnM3VjZjRST2FZcXhtVEN6L2lxa080Mm5W?=
 =?utf-8?B?RkNKdnVaQ0tUUUFiWFJYN3cwQU5GZzdtMnBoRitBaThmVDFCMittLzdxQUQ3?=
 =?utf-8?B?eW1iR0xkT21qUitReDU2L1FYOGxQK3M2RDVYWVBGVUE2VlR0dmRqK0lKSFNK?=
 =?utf-8?B?RFBJT3Avb21JeU1vaHdBZEpkZW5NUlBZbFl1cnlHU3B3NVJ5Q1hucWVRREZ0?=
 =?utf-8?B?WFVSelQzY21DVHN3Y0pjL2I4dElPbWo0aUNJeTZ6eXlFRTFVTDNpTWw3OTg3?=
 =?utf-8?B?ZitoMkpPSWUvSFZVTkhRbmg0aHIvTk1QTnZwWEZRRkZZbmVCT0VxTjZuY1V1?=
 =?utf-8?B?N055OVZrMncvU2pFbWx0dUwzSTJ1Tmw3b3BsMTRPUWlObjlRQ2J2NU04c2l5?=
 =?utf-8?B?VXdHNVRRUnQycTduMFp2bGR6cGg0Tnl2cm90UUNaOGRoQnVzcXhyaHpWbmFj?=
 =?utf-8?B?S1FSYUFQSmxPVmE5a0grVTRWTE56NGk0NzRnbHNPRXB3QlYrcnFsODUxaWpk?=
 =?utf-8?B?TURTUDlKbEEvaXk4VWlHSmh1Z0pVNTBNclFhb2RDbWsyYWt4N29zM2tlUnFw?=
 =?utf-8?B?OGVCZytuL0Y3R2Eza2M5alhieXBxeTFkMWNhd2N4eDJNblg4cExzeXVCZ0pS?=
 =?utf-8?B?eHF3eVlhazhyUllNZ2F2MU1VOTFHZktzd1Bac3JhcFdNc003N3lZeUQweUl4?=
 =?utf-8?B?Qk1PSTNsUlVCMkhiUmhQV1pSUldGZ3BCVzFIWURvRFdoWmFRc0R2UVJ2NUV1?=
 =?utf-8?B?emVxMkJPMFBOZHlBeWZnREVQd3RST2VnckZzRnptZmkwY2NwSEp5RktnSGRV?=
 =?utf-8?B?V1VRamhibHFOK2JvU3VSTTdVUktDUFVHWmlkMjhSSU8rVC9DMkJqM0thR3dS?=
 =?utf-8?B?dGxpNzgxc1RqZWg1N2ZBN2N5UUVZaFozQlpLWEpNbHRYUUhGV2RiejI0blJX?=
 =?utf-8?B?UnQwZUJQZ0NmSmU2UmZFOGNueTd3OEtWN3djSXVzLzh3c1RQNUtaRy93UUdL?=
 =?utf-8?B?REkwQzhDUHFpVGEvWllnTE94cGFZQTdXN0hWZXdSVUpmQTVweUdDSW5VL3ha?=
 =?utf-8?B?WDdKTjU3Q2IyYjl5U3R4Ly9GOVZmeUMwcG5yZjUycXRaTm5oZVlpcFNuWmZG?=
 =?utf-8?B?UytFZ1JzZFlBY0IrTXd2ZTRsdmRvSVZNOGNrZzREZ2U4QU1ZTC9uWUxiN1Ex?=
 =?utf-8?B?bWJrTkNOcXFHVytvem14TEhVNSt0cEh0bnZlcUdsYjdLMTQzeFE4dVQ5R3Vl?=
 =?utf-8?B?eFR0UFNPV2JHY0VJbmtuN3paczVyUVF5U25DanBqYjEzSk9udStQR1JySjRr?=
 =?utf-8?B?dlU4dWhuU1NJeHdVUk1GMUx4ZzFsKzVTbVVYR3lVUHlpSWVGc1FIU21NdzQv?=
 =?utf-8?B?SzVsL3hrdUlKK0tPOEVqT2xZRDMwbzY3SUdrVVZyOGkrSjE2K2NQVXQ3aGlr?=
 =?utf-8?B?Rzhtb1lDOEE5QnZFRVdwMG80TWRNNkg5b2EvRzlvZHJuc1pyK3RoaVFzNDQz?=
 =?utf-8?B?dWw2dExWZmFnS3h6SnVhQzZHT0g1Y2pRb2tuVCtMWkVQbmVuK0RML1ArWUkx?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315bb787-61f9-405d-d536-08dac3c4a26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 09:10:53.1860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pZkoIrC0Ea2VsGHqUsi/9ltvZ6Kqmn8vYCPsRNBR0R4lEy9D1a94aOxQGOv2IcaqNQqa0WAqCDLkIe4Z5Z7prADnPdMIxj7X0DU86gMpB/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10456
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgIGZlZWRiYWNrLg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2VudDogMTEgTm92ZW1iZXIgMjAy
MiAwODozNQ0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgUm9i
IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47DQo+IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz4NCj4gQ2M6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBNYWdudXMgRGFtbQ0KPiA8bWFnbnVzLmRhbW1A
Z21haWwuY29tPjsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgQ2hyaXMgUGF0ZXJzb24gPENocmlzLlBhdGVyc29uMkByZW5l
c2FzLmNvbT47DQo+IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvM10gYXJtNjQ6IGR0czogcmVuZXNhczog
cjlhMDlnMDExOiBBZGQgc3lzdGVtDQo+IGNvbmZpZ3VyYXRpb24gbm9kZQ0KPiANCj4gT24gMTAv
MTEvMjAyMiAxNzoyMSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gQWRkIHN5c3RlbSBjb25maWd1cmF0
aW9uIG5vZGUgdG8gUlovVjJNIFNvQyBkdHNpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYyOg0KPiA+
ICAqIE5ldyBwYXRjaA0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cjlhMDlnMDExLmR0c2kgfCA2ICsrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I5YTA5ZzAxMS5kdHNpDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzAx
MS5kdHNpDQo+ID4gaW5kZXggN2I5NDllNDA3NDVhLi4wNzE2NGQ5ZTRhMGYgMTAwNjQ0DQo+ID4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzAxMS5kdHNpDQo+ID4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzAxMS5kdHNpDQo+ID4gQEAgLTEz
MCw2ICsxMzAsMTIgQEAgY3BnOiBjbG9jay1jb250cm9sbGVyQGEzNTAwMDAwIHsNCj4gPiAgCQkJ
I3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwwPjsNCj4gPiAgCQl9Ow0KPiA+DQo+ID4gKwkJc3lzYzog
c3lzdGVtLWNvbmZpZ3VyYXRpb25AYTNmMDMwMDAgew0KPiA+ICsJCQljb21wYXRpYmxlID0gInJl
bmVzYXMscjlhMDlnMDExLXN5cyI7DQo+ID4gKwkJCXJlZyA9IDwwIDB4YTNmMDMwMDAgMCAweDQw
MD47DQo+ID4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+IA0KPiBXaHkgZGlzYWJsZWQ/IFlv
dSBkbyBub3QgaGF2ZSBhbnkgb3RoZXIgcmVzb3VyY2VzIG5lZWRlZC4gVGhpcyBpcyBvZGQuDQoN
Ck9LLCB3aWxsIGVuYWJsZSBieSBkZWZhdWx0LiBDdXJyZW50bHkgdGhlIGRyaXZlciBjb21wYXRp
YmxlIGlzIHVzZWQgZm9yIGdldHRpbmcgU29DDQpNYWpvciBhbmQgTWlub3IgdmVyc2lvbnMuIEJ1
dCBsYXRlciB3aWxsIGVuaGFuY2UgdG8gc3VwcG9ydCBtb3JlIGZlYXR1cmVzLg0KDQpDaGVlcnMs
DQpCaWp1DQo=
