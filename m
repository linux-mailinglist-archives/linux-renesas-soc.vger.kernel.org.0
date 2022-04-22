Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6625150AF90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 07:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbiDVFjk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 01:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbiDVFf3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 01:35:29 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F474F445;
        Thu, 21 Apr 2022 22:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BprhAsIHEuH0y1xkrIpxT5oGlIMu7KA2zA2Y1pErCOu+Q0uMkHaSqP31IYLHVL/RRSKSRMPgt3u3wDCNZ9AgqFyLvIDVrkQgcL8Rwbctw9HfIE/p45FLPYDRL6xxV4O/YG0LnEDzeR7c3oDUr42nGdcpN2UaUtSgC9NEhP6i//fEckFXKFqpuxoZ6ikKSdkmNl3cyUrhFAkfmP/hASQlMjX/dIRDBJm3aU9rvUtm5eM93+hPDaWYianEs7ISsfDGzPbAm0M06eY2Pf6zrJW0io/9hT/lFS838UPSrk44s8lU7f7cUOGaCTTXtIitB5XDosif7TgZGzhM/2HkjaaDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrlykHYHGvM4CtkUSTZNWdhjVM4GtWuxSE/OdnDG0xs=;
 b=gaA2jAezg/aYpFZp86GSmimITcNM3KaJZrEWjIyvoelSSMbQkdb43QmLPOXERO0VRmRX22jqdlLA0RwiO59FMg9Z4CUxo8uLtAbOH7At5WYmAjkbDK8JEd8dm/QNMQ/KKPm/Hlg9fRUxUMxehqlndptK1s7o0zEnAPthTJ7QpLXYbfH2FT63jWPhlqY2m3zV0o49to2nbrLlP/BC5MSrhFGq+ckorY7JqjasZhMrDlHWfRsl1bFEPL464OjibzvvKNxbxHs0uYsGjzE+S0UXwpXmM7QPAfnpny7TKZgwD08SGJ1owRAhRnBaWTObnJ3Ix9C9DhnApV7pGXDKYjiCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrlykHYHGvM4CtkUSTZNWdhjVM4GtWuxSE/OdnDG0xs=;
 b=pSTswY8CCg6y/rrW3VpISMTxx6bKbybYggpyZUKWEctfn3rR7HpQE+8bf17k3hD2e94QhmdMZUEJK0N+CWEdooDs7EnaddEvARCbZU/3nUydaLrUkgjb9Cl6iqKx2WWg37mbd/VfiR+kZ0g60p8wEpmFmTN2tnhixtpMm4DmxSA=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY2PR01MB2300.jpnprd01.prod.outlook.com
 (2603:1096:404:10::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 05:32:30 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%9]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 05:32:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH 07/15] dt-bindings: clock: Add r8a779g0 CPG Core Clock
 Definitions
Thread-Topic: [PATCH 07/15] dt-bindings: clock: Add r8a779g0 CPG Core Clock
 Definitions
Thread-Index: AQHYVJKjJj52YFGbOU6ODr6gZEiy9az5/0WAgAFf3jA=
Date:   Fri, 22 Apr 2022 05:32:30 +0000
Message-ID: <TYBPR01MB5341D2CAB8DD77E95C14AF8CD8F79@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-8-yoshihiro.shimoda.uh@renesas.com>
 <c86f78ac-ccf5-30ad-5de4-33211ca8b351@linaro.org>
In-Reply-To: <c86f78ac-ccf5-30ad-5de4-33211ca8b351@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38e68cd0-f8f9-425c-28eb-08da24217e97
x-ms-traffictypediagnostic: TY2PR01MB2300:EE_
x-microsoft-antispam-prvs: <TY2PR01MB23009BC331CEE881240A6A51D8F79@TY2PR01MB2300.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9DpWmUIhuzzu+7trVFNc4P51uY3CMGukQW0zRDICjaeMhxAfbkE50K+CWoh9TF9bVI9QEpO5bxYhj4vdhl766gnYcpoA2CxtllQ/rSULFUkZErKvfVaJIt3Ro1HWeb23V2W+5t96YtQm8lFluWQaNRNQABczcx0gOO9roIos55n0ouSiB4uWkx6qsZvns8SJ5H5wePOVsX9FVmXf51tEqYQDm29hWhXgAkAUensp9Ce8OaO395Pf1tvEzyg8Zwpg4W6YZXgPvp+3u5b8TCllggVXWNvkhA1FygOxbuzJwKAah3NVhsPy7bOLtKUla0hTl2nNdB42HrdMPXpyQHx1Nt7cTyPMYuQML4EF5s0DR4W7jxORMR6qlmfccek40Nu/ht1+rHbjz7t55LLQ7JLqB9Hh2Di5oUzZGsCs47Hq5eKBIRoY5VhWPLUBrAcV6WuoKhgkIg8YiKXfnAeK+BJtAJtseLqKsLdfyZIAmx7JDbPVtLbwwVd6qKwtVM/aIH42o6GUR4N8kfHslsC5/0z/0TFMWxm8VSgcj1TYCRlwLEtZtq9t7+g5I3bTuq1Uid426b9poFqoAt7KySlqqprQ3ootDxu1SsIs7Z7Ie51RiyUpCiT0GxtxvpykGO5zxlXmlzfxLG0aGEXLa4aq2LHlIxDQH9C1j1ulfao7zKu1+ja1MUKRJRYc3vPYikO7Glu4BX7qTi/7WGfpNmKzbkvobQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(64756008)(53546011)(38100700002)(83380400001)(5660300002)(122000001)(186003)(6506007)(8936002)(52536014)(2906002)(9686003)(7696005)(55016003)(8676002)(66446008)(33656002)(54906003)(110136005)(66476007)(508600001)(4326008)(316002)(71200400001)(66946007)(66556008)(38070700005)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWd5alNRZFRWMU56eklHbWRhNWpKUzNMQlRmcGJLVTRMeWhCbHhNR3Y5K1Q1?=
 =?utf-8?B?eHpGSTJnUUtWVmYrSW1yN0haZGtnbkpZSXNWZHJIOFdlbXVIcVJRaGZHU1A0?=
 =?utf-8?B?TWRLNWo0MTFGcVl2bFRJV1cweEM1Mm5VVldxbE1lTFRRczMwTi9UbTEyQWZT?=
 =?utf-8?B?aWYrM0NaNHBRamllUFFFMFhXM1pTR2JMb05Rb2ZudkF6dzFUb29oQTQvZGp5?=
 =?utf-8?B?TGVVY0s2RXl3K0NubW5XKzQrWDUramcyOTB4UlN1WHRVeklmRW1HZUtMYTNy?=
 =?utf-8?B?RjJ1SnovMWl0YmhBcmNwL1JYclo5VGZhSmV4RmlITERXTHpTS2lScThOQzNr?=
 =?utf-8?B?cDVkdUFGZjRzUHNIS2tXMkRIbmZRSCtuR1g3SEU4cjhPSklWYjZlS3JJUXda?=
 =?utf-8?B?NElHc2ZkMHJOaUxCNEpWUEFyS3JzSG9PaU8wMUloMFpoeTdzM1pXREMxSTh1?=
 =?utf-8?B?Wml3Ly9KajU2Nm5KSFVSWkxTVUFkK3dIQXJxRldCSkd0OTJoSDlRMVRGQzRI?=
 =?utf-8?B?ZGNoRzNHZENoNnRTd0VuM1pLT3dyNDFMNnh5Vkt5d2RoakRHYjRuNUdBcWc2?=
 =?utf-8?B?MjNyblZucDk4dkhTSjZWM3lhbHJ0azZITHpZc1dqQUZYQzBDTXBNNFdPTnZh?=
 =?utf-8?B?eEZXSFFFdjdMRWFMbkxoamxMYWFZalBiYXBrVmxpblg4a3ZWVElRK1N5azQz?=
 =?utf-8?B?a3MyV2ZWSCtud3prWndmR2FPUHBUS3lKZG1VNmlDa2VYbFZGSVQ4QXg1Szdw?=
 =?utf-8?B?Mk5KZDJ4QkorckpqU09HUkd4bkNzK3FtTjhBRVNxTk05TTNzMG44OGdFMUdE?=
 =?utf-8?B?dWQ4YWU2TkFZOEt3ZFM3cldZb1dRWDB3VWY0UHpEZkIxeVRXWFVtNG1aZ29r?=
 =?utf-8?B?UXNrcVN0empoZCtuWXh5QWdnbEdxS0o5U1lTeDZ3WGlIeUJGMEt0K3kzeUFZ?=
 =?utf-8?B?T0xaNW9hNklmeU04MDNGRmRTZ005RTRPVlJLcy9ZK1hwZTJjOE9RYkVJNkFP?=
 =?utf-8?B?aWFaQjZ6c2tyM0ZENVNwL0NncU9jLzMySjFvWS8wU2RybXNMYmJTN2xENXRo?=
 =?utf-8?B?aStlaEF2cU8vaGE2eHBBZWV6VTBPbVVIMGFUUG5CWjNmaGd4VjQxODhHNURn?=
 =?utf-8?B?SzdNMUora0tKMENDZy8rMGhFZjMweEpGa3U5ZmpmTllDVzJHUld4NnU5eTBH?=
 =?utf-8?B?eTBvbldiMjJZMjhOVFdwZGR1cWNkVWJpZGtISkVRNXZiQlpRdk9ZaGhjZmFN?=
 =?utf-8?B?S1EzMytJb1AwcnRzZ25WTlYvcENKTE1lNVdqeVA4TmdqMHUwRnJURmtYdGtP?=
 =?utf-8?B?bDJSUE83UmV4QjVBNmIvaXdpT1pjOWlBcGNQQSs0SDJHcTlKNWgvczhXMzIy?=
 =?utf-8?B?OGxLZ0NmdFZHZVFqYlBPOHF4Y1FaSmJuN1hMbGhrRmdnKzdYUjBCL1dKMnU0?=
 =?utf-8?B?T3dNdUZ2NDlJbWtYSDhXOHlhT2lTYS9nZTEwZktFREpYc2pPUjJGemc4ajVS?=
 =?utf-8?B?bDdiVHIreHNCOURtQnM3YnFtM2YyMFdjUE01N3hJQUZRck52T3I3T3JoV2Q4?=
 =?utf-8?B?bHVPRzZKaEUxd2ZtZGVvWHlMejBrVWdKTVRUemIvbTdGZUdzTEQ1cU5XM21j?=
 =?utf-8?B?VTFjbG5lT1lIeHJaMFBBMi9NUktnU1FQNXQ5SG9zYzFwSzZ6TTZoVUtwRUJM?=
 =?utf-8?B?dE1NQUJXSC9mK1lON3RWNGhvUWFIYm42UndxVU9aOUVsYXcvUjFENFV5NkxH?=
 =?utf-8?B?K204dlFEWjEwNGpLMXNXWjlZRWtuMjBPNEhWN3Nra2pocEVMSDN1blA4WFJE?=
 =?utf-8?B?TWYraG5zQmFMZk9adWE3NVAwNVppSFZGYVN5elJGNFhSOTV1VHBNOGRMN1pT?=
 =?utf-8?B?S1IxNnBNZUxQY2pZeTNSZGFaemFWYVloV1Bad0dCdlorelVYSXZ3eFlzeTFJ?=
 =?utf-8?B?UTdURmp5R1d0NG0zdEo3dzVSS20zOE5TNlYwUlE0bGdCRFFzQjhLd2dDdTU5?=
 =?utf-8?B?dy9VVjQ0TlRoWGJXZ1BVNlpoRmsyTytmYVkvYk1JNkMxcUxXTWtCdEFvdlRO?=
 =?utf-8?B?NmFPeU84T3Y5a0JZZUhxMlRFbERlMlpGQVZJbzhNWVN2Q2pLd2x0a0w0YVV3?=
 =?utf-8?B?TmtkcEticFZuN2wzZ1hncVZmRlEzN050WHJySUp0SVJqVzh1QVFOVEhSVzAz?=
 =?utf-8?B?UzVZYUZHVWgzVTMyTmhDOGhkb0lCWldQT1pnb0JOZndvR3JVbGlYRHV3elcr?=
 =?utf-8?B?SGNsS2FvSk9JR2k3S3dPY2FPRkk3SmJwdmFsbGtaZUJuUlBZTWZ3Z0FTemtF?=
 =?utf-8?B?ZVhaUFF6N2svVXNyTjdDM0d2djBJWDBnbDNIT3B4eitmcUZZYTFWNE5KcllJ?=
 =?utf-8?Q?QwrY6UbiW6G5Bk89ehvDrYY0ahfqvN6j3q9zwtWYU+CT2?=
x-ms-exchange-antispam-messagedata-1: 8c4TzkOHRCw1sA+KZT+3gEraLWhoxEpa0kY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e68cd0-f8f9-425c-28eb-08da24217e97
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 05:32:30.2546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQMGja9Fac1LOQtjeqEVMMRJhjZ3bM9Qjxa7ugIWlHjhuGtc3pe8g/RoMLkiupnQ/czyY5AEYQS38Dp4ODDfgiABcXSE5ad3Cy4727k4/IlYDV4qIiCu/O+ClIRykwsl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2300
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2ksIFNlbnQ6IFRo
dXJzZGF5LCBBcHJpbCAyMSwgMjAyMiA0OjQ5IFBNDQo+IA0KPiBPbiAyMC8wNC8yMDIyIDEwOjQy
LCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gPiBBZGQgYWxsIENsb2NrIFB1bHNlIEdlbmVy
YXRvciBDb3JlIENsb2NrIE91dHB1dHMgZm9yIHRoZSBSZW5lc2FzDQo+ID4gUi1DYXIgVjRIIChS
OEE3NzlHMCkgU29DLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBpbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL3I4YTc3OWcwLWNwZy1tc3NyLmggfCA4NyArKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3I4YTc3OWcwLWNwZy1tc3Ny
LmgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3I4YTc3
OWcwLWNwZy1tc3NyLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3I4YTc3OWcwLWNwZy1t
c3NyLmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
MDdhOTRjZjQ1NTgxDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmlu
ZGluZ3MvY2xvY2svcjhhNzc5ZzAtY3BnLW1zc3IuaA0KPiA+IEBAIC0wLDAgKzEsODcgQEANCj4g
PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIG9yIE1JVCkgKi8NCj4gDQo+
IEFueSByZWFzb24gd2h5IG5vdCBsaWNlbnNpbmcgaXQgdGhlIHNhbWUgYXMgYmluZGluZ3MgZG9j
dW1lbnQNCj4gKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpPyBUaGUgc2FtZSBhcHBsaWVz
IHRvIHBhdGNoIDUuDQo+IA0KPiBNSVQgYW5kIEJTRC0yLWNsYXVzZSBhcmUgYWxtb3N0IHRoZSBz
YW1lLCBBRkFJUiwgc28gbGV0J3Mgc3RpY2sgdG8gb25lDQo+IChCU0QtMi1jbGF1c2UpIGZvciBj
b25zaXN0ZW5jeT8NCg0KU2luY2UgcjhhNzc5ZzAuZHRzaSAod2hpY2ggdXNlcyB0aGlzKSBpcyB1
bmRlciAoR1BMLTIuMCBvciBNSVQpLCBJIHVzZSBpdCBoZXJlLg0KQWxzbywgcjhhNzc5ZzAuZHRz
aSBpbmNsdWRlcyBkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmggYW5k
DQp0aGUgYXJtLWdpYy5oIGlzIHVuZGVyIChHUEwtMi4wIG9yIE1JVCkuIFNvLCB1c2luZyBpdCBp
cyBiZXR0ZXIsIElJVUMuDQpJbiBvdGhlciB3b3JkcywgcjhhNzc5ZzAuZHRzaSBkb2Vzbid0IGlu
Y2x1ZGUgYW55IHRoZSBiaW5kaW5ncyBkb2N1bWVudA0Kc28gdGhhdCB0aGVyZSBpcyBub3QgbmVl
ZGVkIHRvIHVzZSB0aGUgc2FtZSBsaWNlbnNlLCBJIHRoaW5rLg0KIyBJJ20gbm90IGEgbGF3eWVy
IHRob3VnaC4uLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
