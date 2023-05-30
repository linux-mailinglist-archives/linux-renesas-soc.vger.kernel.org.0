Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8498F715856
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 10:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjE3IX5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 04:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjE3IX4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 04:23:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF16AD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 01:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+GzQW0R519P13QORRN/mYRgY48340VIvPI+NJcaSmR/pf1RF62qYsQnvjGVdqrONIGFdpKXpORaLUidqU17VMdRKWdiizTcK9mfXf9V4eyCtql8sw16IxNiHuBjuSoZN6UgunRzeXLJsuNh45ALRjwLYqOJpJNSyYb7xXULCwUQIgzMCW70pkMJJIK4Z7jUwnd/pl/QSujA3w7YA7r17Cn3dcGaxko/AFRo9n4nYpYzT1RrcYkgZa8ED2l+FI433w/0rNskIYX7Ty4cSHd4Yliuk87isVdNzoMATp7wuPz52uXElL8vc+KTECWjlnxHZPreL7ArAoFTxGXULun45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf9ZDsiI5zKRh/LUNg0matsUn376hptc783rqsNYzhI=;
 b=AarfOYieZXV1mELtmhkq67Za4u0tqUUQJXAWaIe4gnxBTfZfrbTDk/ffZmOiY9RREP95yYA88QBV1HMFYI3gZVZD75mcCyfgX2VtBQM3sw2PfLhDy312WD1InR4rU5YIiEJdlok/6XmBaoc+ymQ27kaKruR9MJ2r5geRqVQbg7QuAXjID20cJU2nmsGD0hzZ3VjgVRiJU25P75sWwOzCTtNW0wGgRT0uT22Gg5MxudJXBO8yIPBHtBTSgeMqZRRbc01avqJ4Q5x5mtuVIWt248gdliypftNv52HrPA8BAnKG87Ecdxf+TwIar3eJSM2+3/xWFFWnAgoFukVuCU40fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf9ZDsiI5zKRh/LUNg0matsUn376hptc783rqsNYzhI=;
 b=VTYyFWihdQ1M7mMCq3FSrRLGfLlUmNPH6LjDrKg1PFFyQO+ZRd+OHBJfx6C6vefj0kFsMz2XpvYreqP4sjnmO5KjDByBrGBO4JEaPxi/4UfCm8DJLIGfq/mbQ/mOgqoD60S3XQlgCqHsk1EG1TPQpKv1P1S0RrK3cSh8nIJfIGk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8371.jpnprd01.prod.outlook.com (2603:1096:604:16d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 08:23:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6433.020; Tue, 30 May 2023
 08:23:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Mark Brown <broonie@kernel.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: defconfig: Enable Renesas MTU3a counter config
Thread-Topic: [PATCH] arm64: defconfig: Enable Renesas MTU3a counter config
Thread-Index: AQHZcRRA18OfkTZuwEWuPMqfKzPpLa9yti0AgAADk0A=
Date:   Tue, 30 May 2023 08:23:50 +0000
Message-ID: <OS0PR01MB592281063148690B858899F7864B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230417100607.309068-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWP=9DV=uAP9WXufgaxqpkXOmnd-sfS1c72u5u-uGbC6A@mail.gmail.com>
In-Reply-To: <CAMuHMdWP=9DV=uAP9WXufgaxqpkXOmnd-sfS1c72u5u-uGbC6A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8371:EE_
x-ms-office365-filtering-correlation-id: af08b440-46a2-4b52-2792-08db60e732a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0pVFFdP1Uz+5VoFEzA3YLVm6x02oko2mM1Vk9kyFELCMe5y1QUwbd61HIhE+JAkv3AVMAX3IN4y/qo4OBY5+sCHevKb6yY2Zu73SQ6X67AixLL+QWLR85YEsyI/cHVHGXEebpsWJ2etVXMkpKTvmcXWFjkhY4pPjcAlNNEyDruLssB+HDDFMGR02OQaxK0JdUlwZE838t6iPiXfzgHY5Yoe2Ca0BQttM5OT4XjV3igSE28+3HOyv0guU8pYUT4REWl/LDwlyWZyl8FXVsjm2rg2yt05uZzmXyrY5L/ZVRcdD14oie4ah/bMo3Kn99oifoi3VRuucqHFMzGM4ljr2iBI/ANdh7XDj+iaIRwUBhqgihQM5B8t6h2WeDu2vdZznXN25hp5akpYK5Q/UPUWONyQtkCrv7T6DD3yax8IsxP/VzMKfVHDdCCT7uRRIOLjTrqGXVlKpBIQi6TWmIUVrgqhcr2fbzR1fa81vWw8wxFw6lHJoDwTfhOd7hg97em03hBsofobXB9kPWoegJna5hYa5XGY6PKqEeIPpQmkfdADfBrTgnDoEPp600RfVTI2xZF3uH8HAkCpnslsHlHuJ/JQ5zn4NfHSkCVGnBX3zpUtXpsS1UftwLbG8wbcEOnxbxlo2eJrcVsvQbD9Qhr0JZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199021)(54906003)(71200400001)(478600001)(8676002)(8936002)(7416002)(52536014)(5660300002)(38070700005)(2906002)(86362001)(33656002)(66476007)(6916009)(4326008)(66446008)(122000001)(66556008)(76116006)(66946007)(64756008)(316002)(55016003)(38100700002)(41300700001)(186003)(6506007)(53546011)(9686003)(26005)(7696005)(83380400001)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDJwS3p3NVViWWc5a1IwQU0rUE9aMVNqSlhCU0xqMVdudVF3aEU3clFSdjlY?=
 =?utf-8?B?RFl2VG9UV1hEQ1JDZHlGL1I1aldLa2hjaXkybHBsNlpBcUpyNnE1K1BTakxJ?=
 =?utf-8?B?eGVrRlljSW9NZ0pSMDBHVkN0Y0J5cHVGN2FGbVFyVzliYzdpVnhxT3lVSjh1?=
 =?utf-8?B?bkZ2U0Y3cVZldFRuSmNONWNCcEJ1YVFEVHhTQ2J0MFBiUjBnT3RtS1o0cUVk?=
 =?utf-8?B?a210WGN6Q3NYTTZqeVZpeEg1Z1FpQVBiMHAwRXBLOVpCNWJlQ0tSZmhZMG1t?=
 =?utf-8?B?NFV3bmxJUWx3T2gxQlhoNHNDa2dmeXF2aG5LdjB4ekJXNEJ3K2lDNFhDZWYx?=
 =?utf-8?B?Vmp1Qk1YNVBsSHpKQXBxdE9yTnpPaGxwd3crc0xhYnFQenBhTGNYUFdCMW91?=
 =?utf-8?B?Q0x3SmF2cW94SGowVUVlbmY2aVBQWFY3MFRnL29JbUVwYXR6eXB6b2MyUlZJ?=
 =?utf-8?B?cWs3TkNSQ0NUaXdrN0RaWXppc1pvWFpIdUNHTEhlcjluUW5UMnRtQUdqeTdW?=
 =?utf-8?B?UzB5QmlNNEZsVmQ5ZHBwZUEvL21nWlJSQzhVOXYxTWVtcFA4di9ORjBrRmgw?=
 =?utf-8?B?Qi9Fd1JyckFsUVRsRER2dFM5dEt4WFZxR2dTdmVCR0RFZlNZcmNWS1pFeXFR?=
 =?utf-8?B?UGdQUlY3NjdoaTZmQ0VZaFh2SFlLREhCUzlWSWNMZlE4ZXZUcGNHMU1BUStt?=
 =?utf-8?B?SGJxemxoWkkzRTdaTlB4aTlXTTdLUS8xTzlUV1JQbGgrTm03aUE4YmpyYmtX?=
 =?utf-8?B?VFg4alBUZnUvbUZJZ1Z0d1ZxZFI4bGo1ZFBQd3ZiOXFtZ29Icnh6a1YwMXU5?=
 =?utf-8?B?cXhHOVZUaWN5ajBNcDZoa1F1QUxyNE5RU1F3eU92aTJIQXdKSzdGUklBb0I3?=
 =?utf-8?B?WnYvZmd3ZkZweTIwTXBwR1NmZTJSdWZnUDV6TEZqbnA4R3g1NlBEU1lWcE5v?=
 =?utf-8?B?cWpad2k3SUJFbjB2NzFjczBYQVVmQThaVFZRN1RtQ2ZWOFpkNzJieFZJWFhq?=
 =?utf-8?B?QkN0ditRQ2ZnTXlZa1R1L28xYXJBT0NmeEoxd0RtR29UclRYcUhBWEt3MnYz?=
 =?utf-8?B?VklHeGs2cTIzODZ1bnl5U01lWDlrWUlWblV6U29LdFhnUGRRTzU4QjBBTmpH?=
 =?utf-8?B?eXRwWUt5dXQ0dlM1a01GcGRRR2kxa1o2QkJtZ3M3S05wbEVyRzZ6NHgrNkhu?=
 =?utf-8?B?S0txQ0JKVjdJWG9TdXNSQXdEN0xkS1hOTDRHLzdkbGdWUExTWlpXZGxEcVlX?=
 =?utf-8?B?MjFzREh5c05zMjExeFo1L1dmRnM0ZWRnSTI5a21IekdMM2hSQVQ4ekljMGp3?=
 =?utf-8?B?SUJXVE1rbFNUVWN3cDZCNjVRS3d0Mkp2TjZjdXJzNjB1UGk5TkxsUnFpWXV2?=
 =?utf-8?B?ekpvVEcwRTVwWXNTSU1SYkw0cWZWR3dTTy8zNkl1MndqWUhlMWRnV2h5b2Rh?=
 =?utf-8?B?bExMY0NNemp4aSt5eHR0MkpaajFPdWFwcE5EZWRsMnBjWUJGbE03S1ZSbnM1?=
 =?utf-8?B?SEp2VDAyYUJwSXdua1JZSnl2bVYzdVJPa0dWOHljT3ltNDcwY21WT0hvbUgx?=
 =?utf-8?B?c3dXM1BSTWkzd1FSSFU1U1RSZ2s3N2hneUtzRVRXNW14dm91NXFjZ0NjamdI?=
 =?utf-8?B?RHY5U254SEljOVJ3WjJtNk04U3RnSUU5dDhOVlBhT0JMZytKVzMvM2Z3MjBt?=
 =?utf-8?B?aHBZeVprVExNWXZKaUVSQURMYTZkdVkvRVJaeFFCRXlsdmRJUXdmcGQrNUxW?=
 =?utf-8?B?OUtuZkczUGRLNzJVNXhoRmFvRlFXdTM1MzV2c0RtMUN5WHNHdGZaMmhDT3Jn?=
 =?utf-8?B?TTJrMHlHRmlUVFZpb3Vqd0J3d1YxUjRiRVloVHBhaE1uRmo2UmVSVjFQWitW?=
 =?utf-8?B?Y09nQ1pKaVAxZXY0aXlOWlNkWUswbkYrMTdBWkZmZ3dpT2dkY3hwaG1YOFJr?=
 =?utf-8?B?Zm9ZZVNDYTNlYUpFOWpla1N3aTJZNG5lVFFiQkljaE55RnpOSURjTTczRzYw?=
 =?utf-8?B?am9qT0lFS2tMVXdGdU1HbTNoN1NMQjdGbExMVFQwZGNWclNaVHB4eXIyN3B2?=
 =?utf-8?B?RUJDSG1NdWNuRDdBaGRzemp6YU1sRWtJUVJGUGlOVCttRWZpQjU3YkFZUjRa?=
 =?utf-8?Q?M7uMfTiYt91/ZfwEkN1wDAGwb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af08b440-46a2-4b52-2792-08db60e732a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 08:23:50.6000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJhmEYmvtRl2CxyPTcFA4yQAM9QVFKkdzYD3ckbwVB2d64yA80o7OY1GYaSrGtwAd0Utux6ASfYMl6CTdsNSETatrDJNV92Ue9dxsKxtVZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8371
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
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAzMCwgMjAyMyA4OjU2IEFNDQo+IFRvOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBDYXRhbGluIE1hcmluYXMg
PGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPjsgV2lsbCBEZWFjb24NCj4gPHdpbGxAa2VybmVsLm9y
Zz47IEJqb3JuIEFuZGVyc3NvbiA8cXVpY19iam9yYW5kZUBxdWljaW5jLmNvbT47IEFybmQNCj4g
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+OyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPjsNCj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBsaW5hcm8ub3JnPjsgVGhpZXJyeSBSZWRpbmcNCj4gPHRyZWRpbmdAbnZpZGlhLmNvbT47IE7D
rWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT47DQo+IE1hcmsg
QnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz47IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD47DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgUHJhYmhha2Fy
IE1haGFkZXYgTGFkDQo+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
OyBsaW51eC1yZW5lc2FzLQ0KPiBzb2NAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBSZW5lc2FzIE1UVTNhIGNvdW50ZXINCj4g
Y29uZmlnDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMTI6
MDbigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+IEVuYWJsZSBNRkQgJiBjb3VudGVyIHJlbGF0ZWQgY29uZmlncyBmb3IgUmVuZXNhcyBNVFUz
YSBDb3VudGVyIGFzIGl0DQo+ID4gaXMgcG9wdWxhdGVkIG9uIFJaL3tHMkwsIExDLCBVTH0gYW5k
IFJaL1YyTCBTTUFSQyBFVktzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IFRoaXMgcGF0Y2ggaXMgYmFz
ZWQgb24gbGludXgtbmV4dC4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4g
LS0tIGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZw0KPiA+ICsrKyBiL2FyY2gvYXJtNjQv
Y29uZmlncy9kZWZjb25maWcNCj4gPiBAQCAtNjkwLDYgKzY5MCw3IEBAIENPTkZJR19NRkRfU1BN
SV9QTUlDPXkgIENPTkZJR19NRkRfUks4MDg9eQ0KPiA+IENPTkZJR19NRkRfU0VDX0NPUkU9eSAg
Q09ORklHX01GRF9TTDI4Q1BMRD15DQo+ID4gK0NPTkZJR19SWl9NVFUzPXkNCj4gDQo+IEl0J3Mg
YSBwaXR5IHRoaXMgY2FuJ3QgYmUgbW9kdWxhci4gQ2FyZSB0byBmaXggdGhhdD8NCg0KT0ssIHdp
bGwgZml4IHRoaXMgbGF0ZXIsIHdoaWxlIG1haW5saW5nIE1UVTNfUFdNIGNvbmZpZy4NCg0KQ2hl
ZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICBDT05GSUdfTUZEX1RQUzY1MjE5PXkNCj4gPiAgQ09ORklH
X01GRF9ST0hNX0JENzE4WFg9eQ0KPiA+ICBDT05GSUdfTUZEX1dDRDkzNFg9bQ0KPiA+IEBAIC0x
NDIxLDYgKzE0MjIsOCBAQCBDT05GSUdfSU5URVJDT05ORUNUX1FDT01fU004MjUwPW0NCj4gPiBD
T05GSUdfSU5URVJDT05ORUNUX1FDT01fU004MzUwPW0gIENPTkZJR19JTlRFUkNPTk5FQ1RfUUNP
TV9TTTg0NTA9eQ0KPiA+IENPTkZJR19JTlRFUkNPTk5FQ1RfUUNPTV9TTTg1NTA9eQ0KPiA+ICtD
T05GSUdfQ09VTlRFUj1tDQo+ID4gK0NPTkZJR19SWl9NVFUzX0NOVD1tDQo+ID4gIENPTkZJR19I
VEU9eQ0KPiA+ICBDT05GSUdfSFRFX1RFR1JBMTk0PXkNCj4gPiAgQ09ORklHX0hURV9URUdSQTE5
NF9URVNUPW0NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPiBpLmUuIHdpbGwNCj4gcXVldWUgaW4gcmVuZXNhcy1kZXZlbCBmb3Ig
djYuNS4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0K
PiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
