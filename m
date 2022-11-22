Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41BCD6344BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 20:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbiKVTlS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 14:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232734AbiKVTlR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 14:41:17 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC666F372;
        Tue, 22 Nov 2022 11:41:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niMP18Ul3pfPrSyCVY0CC8tH3N1WrDTrU3T/gAwTYqqukrHhGklttXJYnoSBYW75y4vpGBVFeoeviuxAE6RYG4L2k3LTtl2tDaXqqt4mU7AwINYULsLIyPNiXVNYWqyfWG0XRWgdRJpPGOdtYZnbTyNGgfJ+7PwtHzXCuGHCIUZpBxnOEphLJ72qY0j/Y/KC1xOh44IwJyC4W1lv0H/sp9CYHMb/nGG8cSEGI4KRqQNQWNKB7Hu7ebaB/YglJgc03ef/ZhDMZbp7OOJHUWO+vyycMuvUOHI2MkMtvYldO7v+hpMYI6iwsI1wpbjZjcKIkoNlGarN5V8Y1G9W6f7KNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeOLXNAPb2NEhIyPAt/zlNyziB8LWB1QnPLFGZPSd68=;
 b=U+puxOXK3HqyyH4JjaSNICp2ImGQLKa0fnYvJ+GaVk3u3s9wti/GuPfkpfOPyM6WhnBJaloI6KaNUnpjHF9ioH4uOGDExfhjWPnTv/FB2/wvW3nS+Dr7nGe4vrZUMBij8/YILXQaoULG4pHGWFJgdUJYnDZUU6ZJy9XM7rqqgo+/MzxhzRAiNaUtSwAMnJBza7yzxvM+7UBJcYeRBNK0NsQ8hqlfLMFy27GXDekELx4tcUBaf7wkyEseTAgPaPZ+heBrW9PdQxA9ImDHXQFiKSCMJQb1iho2naADMutFPIVt5m7LJ4uyDtu5VDmqGx45nLEvCaevstjNIqAQH6bZGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeOLXNAPb2NEhIyPAt/zlNyziB8LWB1QnPLFGZPSd68=;
 b=DsBmfx1myL5PQGqHb3/QUABumfD7/iwLn28bAXukTB21KUum69+4zb1QqRIFYuAeepv691FmCs8jVtHvB16abR7jn65BEpqL9ux6TraKvOkzNBNY7EneeF2x15Yr+qfUdJdLKXaw4vtwN2jCNQ6h2Faaee+VxsCuevWluhk0F2M=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8681.jpnprd01.prod.outlook.com (2603:1096:604:17d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 19:41:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 19:41:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
Thread-Topic: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
Thread-Index: AQHY/qRdHnnq9f6Pjk2Z6VVJLbhAZ65LVS6AgAAAlfA=
Date:   Tue, 22 Nov 2022 19:41:13 +0000
Message-ID: <OS0PR01MB59224A76B83B9A2318A8D4E9860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221122185802.1853648-1-biju.das.jz@bp.renesas.com>
 <Y30j7Q6Jc/y8mGTu@pendragon.ideasonboard.com>
In-Reply-To: <Y30j7Q6Jc/y8mGTu@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8681:EE_
x-ms-office365-filtering-correlation-id: 6c7d2c88-a9bd-462c-fa61-08daccc18362
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /743M0EMHkv5XW7SJO6VGdZUdVmik80Ufhc64h3xajlqtApQvZaEeZgI36n1So8rMYQDvlIYu+SOaKmmBogcr+XvgYVMRAKzxTqLiRxiG395I0F3uPM61eHaA05L/4/F6cjBnMTChiknCZ2zLOnDTq6S1n4kF6Lk1FYrJQo9JgA4ELs8+NinO9VGoufcL4vZmQXWZn8CR2nspdPJ15tlO81XK82cFCynpp62Kh1aqLYi9x1WFmj+cH+xOCuWsMxj7P5l89WrVhpkZ+Rzu5HaCT2jzeQmuGKf7SwMq5oRdXq1sUZOxRwc7glP9i0/D/MXuo1hyXTbLNYF+KSswuGIr30fyGinyDJ2MmlVw6iX19zk6eBARLua2iJX19nNScnTD63r5w+u9crcuVqqhVcYpi2PZxYTnmBvlgoizdN6EBDtyuGvTWhfq9mnDVv4pyO4tvZ8Van5b6R35XCKlkBY5nckPky3q3VcBHTQ+du0Yaws7frRA9ddXHVxtOsuz4FV5FzAhe6AWdC9mSfPtgAD7A8dGTFqglKjcT/8Gy4FDPccFcKO5OGlsJBd/eJTaO7eV/vZi3RpBsYFWEm3+2QnCs6hMqWK4oO6pH6mCEj4g0FqqSsvmjQMDCNEw0lhjbav87qsHzVBkGsC/nNvH+NYzLcchbwti8E/DJn+abyqv96SWCWw1ckvMEjiIeOahyA8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199015)(76116006)(66946007)(26005)(64756008)(9686003)(66476007)(7696005)(33656002)(41300700001)(54906003)(66446008)(316002)(6916009)(6506007)(4326008)(55016003)(8676002)(66556008)(71200400001)(38100700002)(122000001)(2906002)(186003)(478600001)(52536014)(5660300002)(8936002)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDlvR25KdE5ER25DRndNeUllNkUySjhES1R0aVFrZDBiejRZdVNaWjNJeUdS?=
 =?utf-8?B?djBWMlhPV2pocmVqQWlIekNrZXJGYlpwRVUxM0U4MEd4Q0loYTgrYU5BZEoy?=
 =?utf-8?B?YmhIZ3MwcE95L3hzczA0MWN6QmF4K1ZJS0FlZ2pETXJVc0t1UnZIK1A3ZE9l?=
 =?utf-8?B?RjhNMFhjQy9NdGJ0aWk5NzlpSzJRK05XODBOTWpSQUp2V01leHJ4RGtrMDhi?=
 =?utf-8?B?KzNKN1REUlBrV0g3OXMweitzdmd5WnBHRUFES1h6ZUdOcWM5L2NrOWp3aEdo?=
 =?utf-8?B?eHVDUUlNdGl1WEZWV3UyZG5NU08xTXNnMlh0a0FnQUJZcHIvMjNPYmIyN2dw?=
 =?utf-8?B?bkRua1VOOGgxTysrVVdlZGlDY2V3ekpBamFtVlBOU2creTZtSTZNY2o4YnFx?=
 =?utf-8?B?eHRIYmNYMWdIbXBuNnY3NnpUa05KTWZreXRCU0R1Q1ZGdFZPVDBvTyt5TFNi?=
 =?utf-8?B?SndKZjlLUFcwRFlBeWR6WDJJVVFJb2RYTjBveEcwWjJwQTRZOHVFL0IrSUlM?=
 =?utf-8?B?YmxTSFBSNFhZWGE0RHFLVldHQ2RhK20zWTJBT0tzZVRGSU9LdytUU3JLMUZu?=
 =?utf-8?B?R1BBblBHTGRNaDFGajd1QUF5aTNjeUVJd3BpYXNvRDNiMCtER0Nzckw4eWhF?=
 =?utf-8?B?NHZqYW1CNEdtaFFrNHlBUDNhQ3MvVk9JT1JnTWF2dnJNWjFNZmo2eU95bTJU?=
 =?utf-8?B?MzJxbDRvSzU1cGg1K0kvaDZCQVozU3prS0tKM1JhOGFyOXhBZHVRWkNwb0Fx?=
 =?utf-8?B?aVFNUkJLOXE3M2NZUWpBMnFFZXFrZVgwamdxcmc1R0lML0s3S29lbWNYdjA3?=
 =?utf-8?B?aE5tckRvZG1UWFdiT1BtbmlvQWVXemg4Q29qOXg4Q2daYWtkQUtJYkNid1o0?=
 =?utf-8?B?bERmMUdxUlZHYXVCMmg3RWJZTnFZR2VDTEtwUXlhTXpON0VDdGp3YzNrMU5z?=
 =?utf-8?B?OWs5K2dIOVVUM2o5eEk0aWpSR0JCMnpRT3RXK2Z0WDhieE92Y005dVBZTHNu?=
 =?utf-8?B?bS9zUjZHRkpqZndOakpSZkRJVG1BV2hGZU1sWHVUa0RmYWo5cXJneithdjlx?=
 =?utf-8?B?NGxBUU9GT3FDcEJQdUtxOFVlK0VJcEdyZWZsbGFMQ25OOElyQVF1NWJMd1E2?=
 =?utf-8?B?QitKb0FHM29EeVM4THFpay82Q3JZQzRmSTdiakhYblp3UDdXdEFkNWt3eVJr?=
 =?utf-8?B?YnZaVE93enBJT1BpYXFzS1gwQmxITXhzVVVNZ3A4dVl6T1pleHB5RTlrRW16?=
 =?utf-8?B?VUZxdEU0ZVdBWTB1NW83VXZwTWdQS2k1RnhWaWJvRS9kcXJpUWthNy9iT0l4?=
 =?utf-8?B?dFpGbWFMTE5hMDJuQWFYeWNGRFBVa2JSMi9mWDdrdENVV2Jpa0lxa3hDRVNz?=
 =?utf-8?B?RXBGQWRHZktnWnBTeHFyN09uOWRCM2t6MlFtb2Q0Y2ROckUrTnBySW9ncVFQ?=
 =?utf-8?B?dFcyWlNMWEhpSjdoeWNwQlR2cktyeVhyVUFPbVFtQXZtNS92eVB2VUk5enZ3?=
 =?utf-8?B?ZUtNY05UcHBWd0x3TTBYdEgxMzNPWEI4OEtTM3A2bHh5UG1oSGZTOUhnWGRw?=
 =?utf-8?B?ZUdwVWI5NVkvMFNBOUlQNE0vWTBud1lqS2o4UVBuQTJ2YTJzclNxcThDUnBh?=
 =?utf-8?B?a0pMQ2VYb2lTTytnYks3WkRNVys0MFM5Tk1mcEZQOXJTVVRtNFAyZnFseUFM?=
 =?utf-8?B?ekdJZkJnaWVKMVcxMWFDb01LWHV1RDlyTkhDYlBxMTRhZzc5U1pDNktuOXJJ?=
 =?utf-8?B?SlpuQ0NyRVNnTE5LWCtmOThFem5QM3dSTGM5b0lqNFhKZXR3amJlZnd0VU5T?=
 =?utf-8?B?Y1A1YkphTDlhM0JoVGhvZmd3eXlCTndxcE1GckRyRkoxeDhDM2RMdmc5dGhW?=
 =?utf-8?B?MHhkYWQrYUp6TVUzWW1BT0x1M2FuMHk1dm1LRk5HTlgzbnY2dS9rSFB5Q003?=
 =?utf-8?B?NXBza2RrdVdabEVySitZODZYNlpwcDM5M0hadkhsWTNlNlIxbnBWY2NidVB1?=
 =?utf-8?B?eEZadlQyZ3djWTRpMUF1KzZad2IrTXFrM3BUMjBhdVpoYzlrdkI5dUs4d1BH?=
 =?utf-8?B?SXRsR3I5WVJTVGljQmxMVWdEaHRBMUwvQ0tQQjczQVdtMWpCbDFXckozM1c2?=
 =?utf-8?B?WmtkV1pPUnJpWERtbkJvRDRTcDJ4TFRpbmtEc05sRzd5WFljRUNRRkhkZWJh?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7d2c88-a9bd-462c-fa61-08daccc18362
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 19:41:13.0934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCk5V2TrOsgLn8PObjLiBdu+O0oh98rp5WXdjUdQK3Ac2lRBT64M/ePtm+XH91wHKKslRI5sD8P5ADG7SZuZ3R4egkbdsYC8ZuyuXURgYLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8681
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMmwtc21hcmM6IEVuYWJsZSBBRFY3NTM1
IG9uDQo+IGNhcnJpZXIgYm9hcmQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9y
IHRoZSBwYXRjaC4NCj4gDQo+IE9uIFR1ZSwgTm92IDIyLCAyMDIyIGF0IDA2OjU4OjAyUE0gKzAw
MDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEVuYWJsZSBBRFY3NTM1IChNSVBJIERTSSBSZWNlaXZl
ciB3aXRoIEhETUkgVHJhbnNtaXR0ZXIpIG9uIFJaL0cyTA0KPiA+IFNNQVJDIEVWSy4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNtYXJjLmR0
c2kgfCA0NA0KPiA+ICsrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
NCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3J6ZzJsLXNtYXJjLmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yemcybC1zbWFyYy5kdHNpDQo+ID4gaW5kZXggZTE4MGE5NTViNmFjLi4wMWVhODc1OWMx
OTIgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNt
YXJjLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21h
cmMuZHRzaQ0KPiA+IEBAIC0xNiwxMiArMTYsNTYgQEAgYWxpYXNlcyB7DQo+ID4gIAkJc2VyaWFs
MSA9ICZzY2lmMjsNCj4gPiAgCQlpMmMzID0gJmkyYzM7DQo+ID4gIAl9Ow0KPiA+ICsNCj4gPiAr
CWhkbWktb3V0IHsNCj4gPiArCQljb21wYXRpYmxlID0gImhkbWktY29ubmVjdG9yIjsNCj4gPiAr
CQl0eXBlID0gImQiOw0KPiA+ICsNCj4gPiArCQlwb3J0IHsNCj4gPiArCQkJaGRtaV9jb25fb3V0
OiBlbmRwb2ludCB7DQo+ID4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmFkdjc1MzVfb3V0PjsN
Cj4gPiArCQkJfTsNCj4gPiArCQl9Ow0KPiA+ICsJfTsNCj4gPiAgfTsNCj4gPg0KPiA+ICAmY3B1
X2RhaSB7DQo+ID4gIAlzb3VuZC1kYWkgPSA8JnNzaTA+Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gKyZp
MmMxIHsNCj4gPiArCXBpbmN0cmwtMCA9IDwmaTJjMV9waW5zPjsNCj4gPiArCXBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7DQo+ID4gKw0KPiA+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiA+ICsNCj4g
PiArCWFkdjc1MzU6IGhkbWlAM2Qgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAiYWRpLGFkdjc1MzUi
Ow0KPiA+ICsJCXJlZyA9IDwweDNkPjsNCj4gPiArDQo+ID4gKwkJYXZkZC1zdXBwbHkgPSA8JnJl
Z18xcDh2PjsNCj4gPiArCQlkdmRkLXN1cHBseSA9IDwmcmVnXzFwOHY+Ow0KPiA+ICsJCXB2ZGQt
c3VwcGx5ID0gPCZyZWdfMXA4dj47DQo+ID4gKwkJYTJ2ZGQtc3VwcGx5ID0gPCZyZWdfMXA4dj47
DQo+ID4gKwkJdjNwMy1zdXBwbHkgPSA8JnJlZ18zcDN2PjsNCj4gPiArCQl2MXAyLXN1cHBseSA9
IDwmcmVnXzFwOHY+Ow0KPiA+ICsNCj4gPiArCQlhZGksZHNpLWxhbmVzID0gPDQ+Ow0KPiA+ICsN
Cj4gPiArCQlwb3J0cyB7DQo+ID4gKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsJCQkj
c2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArDQo+IA0KPiBIb3cgYWJvdXQgcG9ydEAwID8gVGhhdCdz
IHRoZSBEU0kgaW5wdXQsIEkgZXhwZWN0IGl0IHNob3VsZCBiZSBjb25uZWN0ZWQNCj4gdG8gdGhl
IERTSSBlbmNvZGVyIG91dHB1dC4NCg0KWWVzLCBJIHdpbGwgZW5hYmxlIERTSSBub2RlIGFuZCBs
aW5rIHdpdGggcG9ydEAwLiAgU2luY2UgYm90aCBSWi9HMkwgYW5kIFJaL1YyTA0KdXNlcyBzYW1l
IENhcnJpZXIgYm9hcmQsIEkgbmVlZCB0byBzZW5kIGJpbmRpbmcgcGF0Y2ggZm9yIFJaL1YyTC4N
Cg0KZHRzIFBhdGNoZXMgZm9yIGVuYWJsaW5nIERTSSBmb3IgUlovRzJMIHJlYWR5LiBCdXQgVjJM
IHRoZXJlIGlzIGRlcGVuZGVuY3kgb24gYmluZGluZ3MuDQoNCklmIHlvdSBwcmVmZXIgYm90aCBw
b3J0cyB0b2dldGhlciwgdGhlbiBJIGNhbiBkZWZlciB0aGlzIGxhdGVyLg0KDQpDaGVlcnMsDQpC
aWp1DQoNCj4gDQo+ID4gKwkJCXBvcnRAMSB7DQo+ID4gKwkJCQlyZWcgPSA8MT47DQo+ID4gKwkJ
CQlhZHY3NTM1X291dDogZW5kcG9pbnQgew0KPiA+ICsJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
aGRtaV9jb25fb3V0PjsNCj4gPiArCQkJCX07DQo+ID4gKwkJCX07DQo+ID4gKwkJfTsNCj4gPiAr
CX07DQo+ID4gK307DQo+ID4gKw0KPiA+ICAmaTJjMyB7DQo+ID4gIAlwaW5jdHJsLTAgPSA8Jmky
YzNfcGlucz47DQo+ID4gIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiANCj4gLS0NCj4g
UmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
