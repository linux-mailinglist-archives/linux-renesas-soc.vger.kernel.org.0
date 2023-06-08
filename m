Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80FE372782F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jun 2023 09:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235230AbjFHHIU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jun 2023 03:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbjFHHIT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2023 03:08:19 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2DFF9E;
        Thu,  8 Jun 2023 00:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfdeM6szl6MiSJ03MdCTgoyECLNYmTx1WaHtqySsOr6F+zKuybC+MoMVJ3e0SZtr75qy2Z1jzxbR0zVZNv9pamkHWG5wm/RLg8cKnBb9t83Rf7nO08h35K2E6QxRktt63C+jWpr+pnyG5gyfYstyHXNBjMyOU1yjvBVanv5ravByHMljKG0GSTSnzzpm5Q2ta2NL7JHKRn9qhf7xcP7jNtoW12iVIasdIYo/YnvyPWF3MRKml4dOgM8lhRuBt+DSVhZnOjbmhikuZd4tPsIWRhwkP/lMfFIeOVrzcLRzwSx8EkhVZIkM7dXnQpYaJndvBgCE5kDgRM8xmuEm7vpm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CT078p/IyHTXVnUiITSafEFxgtlo/3QAi4sEr8oiPg8=;
 b=ASNAKfJQDilnHUiQtE77fOzL6Xww+imeI1jnUlldaKWi/xJwLIkswMkxgKQXDkpDckMLsun2ZEDA1lBr9OzCIibr+WEZud6jCDDJqcTqjSpIwEHP6rzmpbTOtbyNmLi39Gcym7XAsArH1Svm+R/xdCqkux3lATpsOHBe1pnyzJUUq6389Vujt8N6mQe1BNN3E8PMwLBVNbnwLjggHtsfB+A1a1iP++W6qTHsItc/dIqyBaYqmF/OSIe1qbE8MIqxQ94CdtkWTNSEvwdJBybfxbxWTjuiq2IQBMw+8E6YGZzJ97b7dWTY1cyhRFoHhCz3h3EZ/cyaCMA0xhXT+/YROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT078p/IyHTXVnUiITSafEFxgtlo/3QAi4sEr8oiPg8=;
 b=h3rYF2HpCEq5u3A7ZVb4tR9oLfCiG6DRnxC3FiDgps8BsbF2a0dJz9cafpKvHFQnrB7GDN30ZNaTyzzv53BqBb5sXTjt1qEwnMdyd1TGeK7L/3jtuPuxnqzSgUjlJYyr9+ftkADRpkfV2m09m3S1apa8Qne+2Sz/Kyq29orxtoM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10204.jpnprd01.prod.outlook.com (2603:1096:400:1db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 07:08:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.039; Thu, 8 Jun 2023
 07:08:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
Thread-Index: AQHZcQtLK6/JZK1zYUeFXuixSTqo8q+AytqAgAABZHA=
Date:   Thu, 8 Jun 2023 07:08:13 +0000
Message-ID: <OS0PR01MB592274D911C4F6E37D9E502F8650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
 <20230417090159.191346-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVNaBk8XV8aCpsiE1SruHNgq47e0YHrF=_H4+SbG5DVmw@mail.gmail.com>
In-Reply-To: <CAMuHMdVNaBk8XV8aCpsiE1SruHNgq47e0YHrF=_H4+SbG5DVmw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10204:EE_
x-ms-office365-filtering-correlation-id: afbabf72-1b28-49e3-937c-08db67ef2006
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uEjnkSp14ewZjqZ25da/U1N2/vl3gg5pcf2GEmIYSRekpo9F+hJlu2FOTdx8rFgQ5dShDuq9DsmQjQXgtnlCTAc9VcOGi7GIIyaD7T9JUz3mgipW+xlZiHWLXo06htPElRtWyEntmsBZjj7TIk4za4TAf7lbecyzupIf6kvaABemQaqkpoDBIwj07LGQX+TATMlY0tZY2LUbiOEs0s3oWOTtJoeul7Cwr+5G1JGoOrf6Kv3YPUkkfWSiSQ9nzhL/qV50IB68rA7ytm1HUo23XhlkTCmLLC9So014JeA3Dj74ZpJfIJMDKGCg5A4CuPgTiHMePiSnfO0mh63bSE+P8+GbSMTpc7C6UC1ktrWfioIqVmka4nNbvsX1CUCgjZx3w2D4EdHXEPoRlU5nAm8mX4o4XnATUZ6lk8oCRrcW39/agDrZ8uWxhPTq1b6dGDoPJKrVyrkcMEMwUybU6mTLK6MleEC6wCGKWVgLkj7Ti+cDsewchWc3VkwRC+jD21jJg610VeYMcYo3/R60BhcXfBx/iDpyX2g8AKjjh6QDIc4J3/gZ+sOI9+d1DpRDUfReRIA+RZyGCCv72Gde/E11apVWQvfnyrYg2twBFUGwnH6NJicBFvDFQQrM6h2Vwwf+KvGd605u28+64NuAyvS+CQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199021)(76116006)(41300700001)(66446008)(66556008)(6916009)(4326008)(316002)(64756008)(38100700002)(8676002)(66476007)(8936002)(66946007)(83380400001)(52536014)(5660300002)(186003)(122000001)(53546011)(9686003)(54906003)(26005)(6506007)(55016003)(38070700005)(33656002)(478600001)(86362001)(107886003)(71200400001)(2906002)(7696005)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUdwakJ1MEhWMWY0bFJnTUQvNllxajB5SDlpTzk5Z3ZwY05oK2NVTzdReGx3?=
 =?utf-8?B?QjZVc1ZRdUVkWndnRHVUY3Y4YjE3NEROZHErTVU0L1p2MFZ5RjlkUE1USGxm?=
 =?utf-8?B?blFBUmFMM01mRkJobHQ3bDR2SW9KdzJta25OMU8xVDRUVnl1YnRsRnVmcEF0?=
 =?utf-8?B?QXE2NFdhOENHRTlGMklBYXJkQTBFVWpuZzZpRUlZMXdEb1lBQ2szMkt3K252?=
 =?utf-8?B?eXh1Tkp0ak9hNndRa2pjbTFnVGVMbGI4TmNqOGlnbDRTaXY1OGJIMGMzeHFi?=
 =?utf-8?B?QW44SnlaWTR2TWJLOVNuWG4vTm5yOEIzUjZhVlZwUGJOL21oVkdxb1M4QlQr?=
 =?utf-8?B?RjdTUFFMVG4vYlpOWUg2VG9URGdDa0dWS2dzV1lwdmptbkc2SjZzVC91Smxr?=
 =?utf-8?B?OVhjZjFxY284NGRwTmZsUHJ6c3hOQm9MQ3dYVWNuZys2bzVpZHdhYTFqdG9J?=
 =?utf-8?B?M3c4Z3kreHB3b1FUU2haN3JwOTRLdjdCVis2ZFc1SUdvbzJCcGZBOWc1SmRN?=
 =?utf-8?B?WVRncXNLcmluNmRJQ3Rwd2tZNXRaWUpKK1lKQjAxRHFyY1RveUZ1K1hRTmtK?=
 =?utf-8?B?QjhhN3BMVGJDdjFpUURqOEJmUDJGVm42czVZTWhFbGttSWlGdnZ6c24yWGti?=
 =?utf-8?B?dEwxcEVwcjczYnRDbkJ0eGRnemhDcE85OEh5TWZadzBRU0VoWEZwYThvYXI4?=
 =?utf-8?B?TU5Nb0VTWjJ4STh4WnBmM2hOdHRFM2d5aHgyL0xzdDljMEE1QjFLVnVxTDVW?=
 =?utf-8?B?bFVLRUpSSWduREZSam0yenBxSHNTcGhZOHphMnRxOVg4c3B1N1J3WTg0QU9C?=
 =?utf-8?B?MHFPcWVaNmlRcnl0bWJ2MXl6N1k5aXJIdnNLZ2RLWkt4NUhEZHB2bEtwSThi?=
 =?utf-8?B?dmJvMmlxejBpUlhqTDNkRHZxSUVydWJudnMzZEF5c1hHRDBZaFVhUXNrNlFz?=
 =?utf-8?B?NzNNVkQ1cDh2czlQRHdMSHpYT0RpaWFsZmFselUrWnF2cHRMekZMYmZmaUow?=
 =?utf-8?B?eXF6cjFwTTh3M0xUekQ4ZUREVUhlOEQzQnhmQXhIb2xEMHBSYStvdzV6bVNp?=
 =?utf-8?B?RmJDcmxaRk1Va2JKR09kZkJ6VjBaV3U0V1NmN0w2V2Yrb04xUDBVcmN2R08r?=
 =?utf-8?B?WFZ3OGFGZWhRQTBabTFrODEyaDZ0QjI5MFlUU05sUmVBS0xuWHlGcG4rblAr?=
 =?utf-8?B?N0w3WHNvVm16T3VtWGJJckN3bjlmbTBtdU5nMXZod2JBZVg0OFMxa0NTME1I?=
 =?utf-8?B?SllEZWZ4VXpnQ1plWG95bHhMbEI3WnBHMU5GUWQyYld6QXMzNnVldWt1NWhJ?=
 =?utf-8?B?MXRUWnE3a0x4aForelRnU1hqRlVDemFpNHZZaVEwclMxL3VHdkJXUmxCaTVO?=
 =?utf-8?B?Rk1WRnlDVXpqYVFkZVU2RmZuSHZoMVoxS3FUSEF2eEpHT1FtS3BYL1ROaTQ5?=
 =?utf-8?B?UHgyZS9XYXprdkFnNUczTHRlUVIyOUc5R0ZGRU5LWnFXNG1iZUdxd2hCcXh1?=
 =?utf-8?B?dXZ5QUMwYWh2QjZTZ1N5QkU0VzgweWxTN3hWcGFoeHhVVXQybXEvSTZPZnpq?=
 =?utf-8?B?QlRjYW85ODdpbmNFY1lRS080TlE2SjB0NUhwcTFYK3lwdE9GZTVRcUw4R1pp?=
 =?utf-8?B?WWtyVCtucHk5LzVnVWpGdHdvT1FWSU52VXcrRllSaTBXTDh1VC9PV0ZjM3Fa?=
 =?utf-8?B?WXh6SDlSYXQ1MzRGTXh2cjJVMjZBc3hBL05YNVFLbTVGSGI1S3ZvdWVwN3N0?=
 =?utf-8?B?WVdLMHNlYlE5Q3l5UE5BUDd2MFUwYjZURnQ4bFVOYS9xanIrSXlzTEdrNk9h?=
 =?utf-8?B?YWV3aUVzTzNtSDJKZEUrSENWWFlReThrQ29jTnA0MkxzUFNMWXNGZy9Pd3Ja?=
 =?utf-8?B?aFcvUkhac2E1Rk0veWFDdGNsMWtKZ0JMM3VsWUs3aFdhMjd1KzBVVmc5Q3gw?=
 =?utf-8?B?L0dSMDdjY1IxYWIrWHU2a1VRanN5RUY4SWMxYnpMUjBOdUNNdHBrTnQ4c09t?=
 =?utf-8?B?WDVrQW83ZVZMUHhEM0RtRy9Ua001RkxBQ011T3FTVHQyZ3p1RlJabFU4ekFC?=
 =?utf-8?B?VDROQS9DN090Ym14bWplS3Q5aE9hZEZQanFSRm5xYjlPOUpMYkZPaGJMQ1BZ?=
 =?utf-8?Q?CFideRdcs5UUaihX7EJ8zohQv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbabf72-1b28-49e3-937c-08db67ef2006
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 07:08:13.4699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vLToiMt0GTu6+8qnwDSk3/l4J/XCKHuBmSbyAaDhla+oUVLsPIo+7ufmKlG9VvCTDII2vu/FYCaMnmQhyiY0DlIm+EdkcJpFVJaCRfpMK+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10204
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMy8zXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcybC1zbWFyYzogRW5hYmxlIE1UVTNh
DQo+IGNvdW50ZXIgdXNpbmcgRFQgb3ZlcmxheQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1v
biwgQXByIDE3LCAyMDIzIGF0IDExOjAy4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBFbmFibGUgbXR1MyBub2RlIHVzaW5nIGR0IG92ZXJs
YXkgYW5kIGRpc2FibGUgc2NpZjIgbm9kZSBhbmQgZGVsZXRlDQo+ID4ge3NkMV9tdXgsc2QxX211
eF91aHN9IG5vZGVzIGFzIHRoZSBwaW5zIGFyZSBzaGFyZWQgd2l0aCBtdHUzIGV4dGVybmFsDQo+
ID4gY2xvY2sgaW5wdXQgcGlucyBhbmQgWiBwaGFzZSBzaWduYWwoTVRJT0MxQSkuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZSAgICAgICAg
ICB8ICAyICsNCj4gPiAgLi4uL2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMtcG1vZC5kdHNv
ICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQ1IGlu
c2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yemcybC1zbWFyYy1wbW9kLmR0c28NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9NYWtlZmlsZQ0KPiA+IGluZGV4IGYxMzAxNjU1NzdhOC4uNTc3MjdiY2QxMzM0
IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZQ0K
PiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZQ0KPiA+IEBAIC04
MSw4ICs4MSwxMCBAQCBkdGItJChDT05GSUdfQVJDSF9SOUEwN0cwNDMpICs9DQo+ID4gcjlhMDdn
MDQzLXNtYXJjLXBtb2QuZHRibw0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9SOUEwN0cwNDQpICs9
IHI5YTA3ZzA0NGMyLXNtYXJjLmR0Yg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9SOUEwN0cwNDQp
ICs9IHI5YTA3ZzA0NGwyLXNtYXJjLmR0Yg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9SOUEwN0cw
NDQpICs9IHI5YTA3ZzA0NGwyLXNtYXJjLWNydS1jc2ktb3Y1NjQ1LmR0Ym8NCj4gPiArZHRiLSQo
Q09ORklHX0FSQ0hfUjlBMDdHMDQ0KSArPSByemcybC1zbWFyYy1wbW9kLmR0Ym8NCj4gPg0KPiA+
ICBkdGItJChDT05GSUdfQVJDSF9SOUEwN0cwNTQpICs9IHI5YTA3ZzA1NGwyLXNtYXJjLmR0Yg0K
PiA+ICtkdGItJChDT05GSUdfQVJDSF9SOUEwN0cwNTQpICs9IHJ6ZzJsLXNtYXJjLXBtb2QuZHRi
bw0KPiA+DQo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX1I5QTA5RzAxMSkgKz0gcjlhMDlnMDExLXYy
bWV2azIuZHRiDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3J6ZzJsLXNtYXJjLXBtb2QuZHRzbw0KPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3J6ZzJsLXNtYXJjLXBtb2QuZHRzbw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi5hNTAyZmFmNmUxYWQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNtYXJjLXBtb2QuZHRzbw0K
PiA+IEBAIC0wLDAgKzEsNDMgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjANCj4gPiArLyoNCj4gPiArICogRGV2aWNlIFRyZWUgU291cmNlIGZvciB0aGUgUlove0cy
TCxWMkx9IFNNQVJDIEVWSyBQTU9EIHBhcnRzDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAo
QykgMjAyMyBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiAr
L2R0cy12MS87DQo+ID4gKy9wbHVnaW4vOw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL3BpbmN0cmwvcnpnMmwtcGluY3RybC5oPg0KPiA+ICsNCj4gPiArJm10dTMgew0KPiA+ICsg
ICAgICAgcGluY3RybC0wID0gPCZtdHUzX3BpbnM+Ow0KPiA+ICsgICAgICAgcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsNCj4gPiArDQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4g
K307DQo+ID4gKw0KPiA+ICsmcGluY3RybCB7DQo+ID4gKyAgICAgICBtdHUzX3BpbnM6IG10dTMg
ew0KPiA+ICsgICAgICAgICAgICAgICBtdHUzLXpwaGFzZS1jbGsgew0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHBpbm11eCA9IDxSWkcyTF9QT1JUX1BJTk1VWCgxOSwgMCwgMyk+OyAvKg0K
PiBNVElPQzFBICovDQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAg
ICAgICAgICBtdHUzLWV4dC1jbGstaW5wdXQtcGluIHsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBwaW5tdXggPSA8UlpHMkxfUE9SVF9QSU5NVVgoNDgsIDAsIDQpPiwgLyoNCj4gTVRDTEtB
ICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzJMX1BPUlRfUElO
TVVYKDQ4LCAxLCA0KT47IC8qDQo+IE1UQ0xLQiAqLw0KPiA+ICsgICAgICAgICAgICAgICB9Ow0K
PiA+ICsgICAgICAgfTsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZzY2lmMiB7DQo+ID4gKyAgICAg
ICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJnNkaGkxX3BpbnMg
ew0KPiA+ICsgICAgICAgL2RlbGV0ZS1ub2RlLyBzZDFfbXV4Ow0KPiA+ICt9Ow0KPiA+ICsNCj4g
PiArJnNkaGkxX3BpbnNfdWhzIHsNCj4gPiArICAgICAgIC9kZWxldGUtbm9kZS8gc2QxX211eF91
aHM7DQo+ID4gK307DQo+IA0KPiBJJ20gYWZyYWlkIGRlbGV0aW5nIG5vZGVzIGluIHRoZSBiYXNl
IERUIGZyb20gYW4gb3ZlcmxheSBkb2VzIG5vdCB3b3JrLi4uDQoNCkl0IGRvZXNuJ3QgZ2l2ZSBh
bnkgcGluIGNvbmZsaWN0cy4gIEkgd2lsbCByZWNoZWNrIGFuZCBjb25maXJtLg0KDQpXaGVuIEkg
dGVzdGVkLCBpdCBjbGVhcnMgdGhlIGNvdW50ZXIsIHdoZW4gSSByZW1vdmUvaW5zZXJ0IFNEIGNh
cmQgYXMgdGhlDQpjb3VudGVyIGNsZWFyaW5nIHNvdXJjZSBpcyBQMTlfMCBmdW5jdGlvbjMuDQoN
CldoYXQgYWJvdXQgZGlzYWJsaW5nIFNESEkxPz8gQXMgcGlucyBzaGFyZWQgYmV0d2VlbiBNVFUz
YSBhbmQgU0RISTEsDQpXaGVuIHdlIHVzZSB0aGlzIG92ZXJsYXksIHdlIGVuYWJsZSBvbmx5IE1U
VTNhIGFuZCBkaXNhYmxlIFNESEkxLg0KDQpGb3IgYSBub3JtYWwgY3VzdG9tZXIgdXNlIGNhc2Us
IFNESEkxIHdpbGwgYmUgYWx3YXlzIGVuYWJsZWQuDQpCdXQgdGhleSBtYXkgdXNlIGRpZmZlcmVu
dCBwaW5zIGlmIHRoZXkgdXNlIGJvdGggU0RISTEgYW5kIE1UVTNhIFotUGhhc2Ugc2lnbmFsLg0K
DQpDaGVlcnMsDQpCaWp1DQo=
