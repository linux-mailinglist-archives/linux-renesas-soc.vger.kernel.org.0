Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 337C66488E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 20:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiLITQi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 14:16:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLITQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 14:16:37 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF6526AF9;
        Fri,  9 Dec 2022 11:16:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al+PnEnMPidpZXnwigpwf1RDbkmKHHv9q8/dNSWmhP6PWwZaFR1rwdZ3NFWtp6J9u5Ry6S6Elut1ANH0Sb8vcUC92QnWZ+mW58DzKSDedgJlVAVqczQsxSeQg5xnythPNV+COUduwchySno+aQuu0sxnQnrw8mYbNlB3gEwZpDAlvKVx/5jV8Xe801w/uzx47/IeBzPkN/F7aKBZ8p/vdWEAbQQ6Tuz50m0QYfD9pshb6OJQWwR/lStzP7gfxjzOzyCZDef+2xKfAyZOQUycBMJ/2SOHsEcAbONdODTcuANz9DV+V6DIYnh6/AqxiEqzHeOk9LxswOA8dfDtqxzpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hj5C2M4opJiVs75uA1ctNnxN1aK7ifTS4gevjctG9hY=;
 b=l88Qo/mNPOPHAtY4MDtVhHl/TOP+73feQLo8PVq4V9a8Rk7wgEj5fGoaf4em4VogF/u2+dNwMGbQb1awaZpelw3FASiIeIWFdXuxDElm9ql/BQbo6klyCBjOvr9BX2uUYcxyFzo1FCpsgAW5Tpds7TEUIZDko83I82rceQVKqwq592l2wp5pqMw6GfJGJ6Tmsk84P0TKgek9j+FQ8LTCokgWvmbRUjCE1KmiGWDv6onnphK4SY/muGkMjldKTIDqkNCuHEsPi8SfilyHMYKjRaCEAaQVP8/22dOs0TDR5N6XHExBqmOXFCIoqM8iXcoo5tM09VyzRFx/MozQbepHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hj5C2M4opJiVs75uA1ctNnxN1aK7ifTS4gevjctG9hY=;
 b=q1A9XBgGGiESkqYjECaGT/IKuWJwBB5mPwe6iycfiuj6aRVPKcxFoE1PHGwPjs6967gjRWL7g3uN0njRnkIwq524daKoWifi+G6larMkzECpsvYpcx6rHu/8cJi5UTAzW2m78X83xysOcThCgWRhRQzkV07HVQS26hTRYY9J6AM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8500.jpnprd01.prod.outlook.com (2603:1096:604:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 19:16:33 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5880.019; Fri, 9 Dec 2022
 19:16:33 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     William Breathitt Gray <william.gray@linaro.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 4/5] counter: Add Renesas RZ/G2L MTU3a counter driver
Thread-Topic: [PATCH v7 4/5] counter: Add Renesas RZ/G2L MTU3a counter driver
Thread-Index: AQHZACZIeUmqDu1oFU+pwR0Fu2oQwK5ZOxcAgAzGq3A=
Date:   Fri, 9 Dec 2022 19:16:33 +0000
Message-ID: <OS0PR01MB592266C9D8E52988B386E48F861C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221124170018.3150687-1-biju.das.jz@bp.renesas.com>
 <20221124170018.3150687-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyBBcSs5Y9tjnpYf83UGUSaUYhxU2ACHkq_2jDNeiQSA@mail.gmail.com>
In-Reply-To: <CAMuHMdUyBBcSs5Y9tjnpYf83UGUSaUYhxU2ACHkq_2jDNeiQSA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8500:EE_
x-ms-office365-filtering-correlation-id: f604adb4-4fb2-4aa1-86f4-08dada19e23c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: km6l1AgmuG3euReK4+4CFu0Hoq3vcpEShAQVox7OdD/g11/BYmo2XrdhQF3ylbnUKlpRRqp9yhiKZRU7i0/yZ+JcBPckb4xQ6A6ZM9PducL0exY9w/eL1fonqtzpfSzkVEjNrD9v0fV5AiIzKtmCz2yi5yVfSrv1JelTfAGFFtHIGY4J9qt1bhY3GspqMDazi15oT9FUViuSdibimtC/rA55NiF3+eWnrSJ3OLnQN2oPybJqIFV9WeiIz1MnouRPoF+GvhN2q/dXsJlQkZpSXCSYW3ZWAg3pKKMT8/yZhdksYRWS+bO/KiKk/R2u2hyFB4U0GxdAswZavuR6PK7N9gxhYRO5yxi50qj0/0MLM3O+Y8Lmk0rDlbYBvpzcEfqrIQfsvfypPDndQAQZSxwtuYW8giaSlZNHNHO5hvEEhvw+xJ4j1YrI/duiNuO12L1JVjUCrxauWQ28yqfVburnvWrvQhXV6hHlUcwni8TRMkjiCuEMBuTcuXb+/SfPxIh65o49JqN+utwcdjX5ZL1bOHFB3qL5lxShpoeYFY4yHEUIX46BKtGCsv16mU6v7jJ+r6/mKcknFjCaJohBNEz4ScQJSyoMnl19oblE4NeqzuuDJCspbWpD+8hZeBVWi73YQgj7bocvFH/cUyTtqnVMcqbgrsWegmTKY+2ys7wALSHQKc5tf+yKXrUX72FADasMKDVHzIRWcA5du//tu/ksxPb3wbUK8WYiD4OfLR4czI4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(26005)(53546011)(6916009)(7696005)(6506007)(9686003)(54906003)(122000001)(478600001)(71200400001)(55016003)(38070700005)(38100700002)(86362001)(186003)(83380400001)(33656002)(2906002)(66446008)(66556008)(4326008)(64756008)(66946007)(8676002)(66476007)(76116006)(5660300002)(41300700001)(316002)(8936002)(52536014)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVp2L21FWktiV3RPb1BGaDVpcGRNVTNqZWlaNTBoL1NENVI1MEp4bEdBWC9K?=
 =?utf-8?B?eGQwZXZaSXF6WlZEMVJJODArdXNmTmNFOEdibFRtc0FtZ3dBcmFlWXJkOG43?=
 =?utf-8?B?LzZScGg4NXRSdkptUkRpRGNKZmpQMUtLK25ZZkZ0VHEvc1l0R1JPNXNVVlBZ?=
 =?utf-8?B?L2NNOFNyajBESEU2TjZTbFZ3OEVMOWV1RCt6WXBvRG1Nd1cxU1YzNnlRa1ds?=
 =?utf-8?B?bm1EZG93aTYrcFUwN0NYS2gvbnp6R2FMRklwbWRxbVNMNHE4M3YwWnlRQ3dN?=
 =?utf-8?B?RE9pVVhBNHVLV0ZiNmhLUituUURiVEwvMGx3dnVVbHo0bnExUGVUSWZvZU1U?=
 =?utf-8?B?dDc5cHBxWHg4ZHlKcDE2c3RCRm15V0NOVllWZFFENVJNSGIvNTNRUWt0QmJZ?=
 =?utf-8?B?eGxqM0QxZGVWK3h0UlBaRS9CSERSSllLQTNqeVU5OVlyTkxxQVdBcSt5MFBw?=
 =?utf-8?B?MHNOUnBHUUtPbGVBYWVEVWppeXFVblJDRyt2eDk2L1g4STJ2UlVSNHZqbWo1?=
 =?utf-8?B?OHZhdlpYWjRiSGc1ZHlZcnUvYlZiTWdlck1NblBoTFp2Yjc4TWN6bTk2bTNo?=
 =?utf-8?B?aExUcDlaa0k0UVpjTFJMdk1SZE9iK0V4MG1zdjBld09CVUdCcllKRDQ1TjVz?=
 =?utf-8?B?bW1LL0I4dnRkelRjVjh5dytLcjFMNHovOFJZcUtRZmVydVJsTVI4OVNzV254?=
 =?utf-8?B?RTlXVE5tL0VvTDZheEZ2bUNnRVVuQnZHb1hjRHIzRTVyZW1iZkFHN0w0S0Qx?=
 =?utf-8?B?WHg4RGo0clRuMHhTVnhUeHM5aExuTDhKTmdQd2xiSzZmMHNaWklWSEtlRS9w?=
 =?utf-8?B?RnhYYlNlallodzhTY3hYYW1hZi9qMGxxZWQ4cG1GM3Rrc1BnNnJFTTY5S1F5?=
 =?utf-8?B?OVU0T1BaSEIvVWpaWHBWNlhkU3A1QmdWay9WWTczZC9Ea3p6VFZZSTlWWEhP?=
 =?utf-8?B?Z2t5UU5SUDhya3Y3WDRkKzZXYkljMzhJejY2VHRBOWk4eEpyRnA2YURVVDdG?=
 =?utf-8?B?cVZUTU9PYmxML09pTlZIMnRVc0VtVjJDUlFPZ0xxZGwyRTllbkhKQTJNMUxX?=
 =?utf-8?B?c2ZHamIvWng0aTgvL2Vyc0RkQUJ4Z0JzZkdweklPdFRNUE9MM2E3WW9hRXgy?=
 =?utf-8?B?Q1BGWEpMbmN2LzBvWCs5eS9yaUg5am42MFdjcklSdmcyclJsQ0g2TlhGOEQ3?=
 =?utf-8?B?TlB6ZS9xanJ0RnI2ekNBQnFFMWxIa3NXaFQ2V3RTbHZuR1h5VnVQTi9GUmtv?=
 =?utf-8?B?Z3hhQjZ2dVdXWjcvcXd3OEN1TzVURTNONDBiWEF4OWZNd3NXcG5qNzhMbzR2?=
 =?utf-8?B?Q1JHSUQrbWlmZUR0OEduMy9ZVitYNEdqblVnbkRRSXpyaUZvdERjUFU3Z3JR?=
 =?utf-8?B?akhsOGV3a0hBbHZJcHkzUGVNNWJCai82dXhwUmdwcmVlNG91Z2JYVUEvckhL?=
 =?utf-8?B?ZzFVUzl2aHNGb0NSMUdYL25zdTZOVUdoUDlxOUlYYk9ZNmhDMUc3MS9tdWxw?=
 =?utf-8?B?aHJKdm9reGQ0MXJFbW1WTGc4cmpnUGR5TVdUNEN6L3F5TUQ5Mkx6ZVNNdExT?=
 =?utf-8?B?Nkp1M0tZdkFyYlJYTnN5V3BnOGdYWkcxUXlzb0Y3QXBRS3NjdzRLbXZJQTh5?=
 =?utf-8?B?ZEt5Nm10eitDaGsxT1F5d3BtV0ovUWZsZi9Zb01vanY1aWxqMGtXSnY5VnEy?=
 =?utf-8?B?N0tsT2pxcFJmb0xiTW93d1VkZmptYmZRVHQ5MFpUaTZ4Mlc3bUVsU0h0Wlhq?=
 =?utf-8?B?WWUwR00vaThZdzdoZXNQZ1RWS3JLcExIYXdUakEyRHhhRE8vbndGZnYxTXNk?=
 =?utf-8?B?aEg1cmVCMHhiRGU1eHp1L042V3pENjQyQUxzc3NvSDgyR1J4cGtGYW1kT2xU?=
 =?utf-8?B?S0FoQ2pzSmRlckN4eXJoNXI5elk2Vnd6WE9CdjhKTzhHQzh0d2NBdTlFQURP?=
 =?utf-8?B?MlV6a0FONEhVYUlEWlQxcGlJL0M3RG1tWklMOURPS2hwK1RzM1hIZVduenRR?=
 =?utf-8?B?VFRoK1BnZ1V0UnZncWdTeE5Tdk5tdXBmQXdYQjVIM3RBclFIYldxeUVQT3RY?=
 =?utf-8?B?MkdPdnN5NGhaMVdUTjhMZ1AzTnpzVG1LU0lYZUUrZWk0TDhjdWZRQVd2SkI1?=
 =?utf-8?B?ZVVobTd1aVlCMXJOVUI1cjhSV2pQeHRPNGpHbTJFMmJ6aCsvVFh0amJzcXZP?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f604adb4-4fb2-4aa1-86f4-08dada19e23c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 19:16:33.0845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8117w1my5TW9PvvDKAMc+Y+xWrAR8uKM5/PyeIVVluGMwDx5pYldRjrJfo+x3a9awf55pysyK/1/trx1+lE9HMpCKo3GeMqqTkcDBmXxhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8500
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjcgNC81XSBjb3VudGVyOiBBZGQgUmVuZXNhcyBSWi9HMkwgTVRVM2EgY291bnRlcg0K
PiBkcml2ZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIE5vdiAyNCwgMjAyMiBhdCA2
OjAwIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+
ID4gQWRkIFJaL0cyTCBNVFUzYSBjb3VudGVyIGRyaXZlci4gVGhpcyBJUCBzdXBwb3J0cyB0aGUg
Zm9sbG93aW5nIHBoYXNlDQo+ID4gY291bnRpbmcgbW9kZXMgb24gTVRVMSBhbmQgTVRVMiBjaGFu
bmVscw0KPiA+DQo+ID4gMSkgMTYtYml0IHBoYXNlIGNvdW50aW5nIG1vZGVzIG9uIE1UVTEgYW5k
IE1UVTIgY2hhbm5lbHMuDQo+ID4gMikgMzItYml0IHBoYXNlIGNvdW50aW5nIG1vZGUgYnkgY2Fz
Y2FkaW5nIE1UVTEgYW5kIE1UVTIgY2hhbm5lbHMuDQo+ID4NCj4gPiBUaGlzIHBhdGNoIGFkZHMg
MyBjb3VudGVyIHZhbHVlIGNoYW5uZWxzLg0KPiA+ICAgICAgICAgY291bnQwOiAxNi1iaXQgcGhh
c2UgY291bnRlciB2YWx1ZSBjaGFubmVsIG9uIE1UVTENCj4gPiAgICAgICAgIGNvdW50MTogMTYt
Yml0IHBoYXNlIGNvdW50ZXIgdmFsdWUgY2hhbm5lbCBvbiBNVFUyDQo+ID4gICAgICAgICBjb3Vu
dDI6IDMyLWJpdCBwaGFzZSBjb3VudGVyIHZhbHVlIGNoYW5uZWwgYnkgY2FzY2FkaW5nDQo+ID4g
ICAgICAgICAgICAgICAgIE1UVTEgYW5kIE1UVTIgY2hhbm5lbHMuDQo+ID4NCj4gPiBUaGUgZXh0
ZXJuYWwgaW5wdXQgcGhhc2UgY2xvY2sgcGluIGZvciB0aGUgY291bnRlciB2YWx1ZSBjaGFubmVs
cyBhcmUNCj4gPiBhcyBmb2xsb3dzOg0KPiA+ICAgICAgICAgY291bnQwOiAiTVRDTEtBLU1UQ0xL
QiINCj4gPiAgICAgICAgIGNvdW50MTogIk1UQ0xLQS1NVENMS0IiIG9yICJNVENMS0MtTVRDTEtE
Ig0KPiA+ICAgICAgICAgY291bnQyOiAiTVRDTEtBLU1UQ0xLQiIgb3IgIk1UQ0xLQy1NVENMS0Qi
DQo+ID4NCj4gPiBVc2UgdGhlIHN5c2ZzIHZhcmlhYmxlICJleHRlcm5hbF9pbnB1dF9waGFzZV9j
bG9ja19zZWxlY3QiIHRvIHNlbGVjdA0KPiA+IHRoZSBleHRlcm5hbCBpbnB1dCBwaGFzZSBjbG9j
ayBwaW4gYW5kICJjYXNjYWRlX2VuYWJsZSIgdG8NCj4gPiBlbmFibGUvZGlzYWJsZSBjYXNjYWRp
bmcgb2YgY2hhbm5lbHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjYtPnY3Og0KPiA+ICAqIFVwZGF0
ZWQgY29tbWl0IGRlc2NyaXB0aW9uDQo+ID4gICogQWRkZWQgUmVnaXN0ZXIgZGVzY3JpcHRpb25z
DQo+ID4gICogT3BpbWl6ZWQgc2l6ZSBvZiBjYWNoZSB2YXJpYWJsZSBieSB1c2luZyB1bmlvbg0K
PiA+ICAqIFVzZWQgdGVzdF9iaXQoKSBpbiByel9tdHUzX2lzX2NvdW50ZXJfaW52YWxpZCgpDQo+
ID4gICogUmVwbGFjZWQgdmFsLT50aW1lcl9tb2RlIGluIHJ6X210dTNfY291bnRfZnVuY3Rpb25f
e3JlYWQsd3JpdGV9DQo+ID4gICogQWRkZWQgVE9ETyBjb21tZW50IHBoYXNlMyBhbmQgcGhhc2U1
IG1vZGVzLg0KPiA+ICAqIHJlcGxhY2VkIGlmLWVsc2Ugd2l0aCB0ZXJuYXJ5IGV4cHJlc3Npb24g
aW4NCj4gPiByel9tdHUzX2NvdW50X2RpcmVjdGlvbl9yZWFkKCkNCj4gPiAgKiBVc2VkIHN3aXRj
aCBzdGF0ZW1lbnQgaW4gcnpfbXR1M19jb3VudF9jZWlsaW5nX3JlYWQgdG8gY29uc2lzdGVudA0K
PiA+IHdpdGggd3JpdGUNCj4gPiAgKiBQcm92aWRlZCBkZWZhdWx0IGNhc2UgZm9yIGFsbCBzd2l0
Y2ggc3RhdGVtZW50Lg0KPiA+ICAqIEFkZCBtdXRleCBsb2NrIGZvciBhdm9pZGluZyByYWNlcyB3
aXRoIG90aGVyIGRldmljZXMNCj4gPiAgKiBVcGRhdGVkIGNvbW1lbnRzIGluIHJ6X210dTNfYWN0
aW9uX3JlYWQNCj4gPiAgKiBSZXBsYWNlZCBDT1VOVEVSX0NPTVBfREVWSUNFX0JPT0wtPkNPVU5U
RVJfQ09NUF9ERVZJQ0VfQk9PTCBmb3INCj4gPiAgICBjYXNjYWRlX2VuYWJsZQ0KPiA+ICAqIFJl
cGxhY2VkIFJaX01UVTNfR0VUX0hXX0NILT5yel9tdHUzX2dldF9od19jaA0KPiA+ICAqIEFkZGVk
IHJ6X210dTNfZ2V0X2NoKCkgdG8gZ2V0IGNoYW5uZWxzDQo+ID4gICogdXNlZCByel9tdHUzX3No
YXJlZF9yZWdfdXBkYXRlX2JpdCBmb3IgY2FzY2FkZV9lbmFibGUgYW5kDQo+ID4gICAgc2VsZWN0
aW5nIHBoYXNlIGlucHV0IGNsb2NrLg0KPiA+ICAqIEFkZGVkIHJ6X210dTNfaXNfY291bnRlcl9p
bnZhbGlkKCkgY2hlY2sgaW4NCj4gPiByel9tdHUzX2NvdW50X2NlaWxpbmdfcmVhZCgpDQo+IA0K
PiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9kcml2ZXJzL2NvdW50ZXIvcnotbXR1My1jbnQuYw0KPiANCj4gPiArc3RhdGljIGludCByel9t
dHUzX2luaXRpYWxpemVfY291bnRlcihzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsDQo+
ID4gK2ludCBpZCkgew0KPiA+ICsgICAgICAgc3RydWN0IHJ6X210dTNfY2hhbm5lbCAqY29uc3Qg
Y2ggPSByel9tdHUzX2dldF9jaChjb3VudGVyLCBpZCk7DQo+ID4gKyAgICAgICBzdHJ1Y3Qgcnpf
bXR1M19jaGFubmVsICpjb25zdCBjaDEgPSByel9tdHUzX2dldF9jaChjb3VudGVyLCAwKTsNCj4g
PiArICAgICAgIHN0cnVjdCByel9tdHUzX2NoYW5uZWwgKmNvbnN0IGNoMiA9IHJ6X210dTNfZ2V0
X2NoKGNvdW50ZXIsDQo+ID4gKzEpOw0KPiA+ICsNCj4gPiArICAgICAgIHN3aXRjaCAoaWQpIHsN
Cj4gPiArICAgICAgIGNhc2UgUlpfTVRVM18xNl9CSVRfTVRVMV9DSDoNCj4gPiArICAgICAgIGNh
c2UgUlpfTVRVM18xNl9CSVRfTVRVMl9DSDoNCj4gPiArICAgICAgICAgICAgICAgbXV0ZXhfbG9j
aygmY2gtPmxvY2spOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAoY2gtPmZ1bmN0aW9uID09IFJa
X01UVTNfTk9STUFMKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNoLT5mdW5jdGlvbiA9
IFJaX01UVTNfMTZCSVRfUEhBU0VfQ09VTlRJTkc7DQo+ID4gKyAgICAgICAgICAgICAgIG11dGV4
X3VubG9jaygmY2gtPmxvY2spOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgaWYgKGNoLT5m
dW5jdGlvbiAhPSBSWl9NVFUzXzE2QklUX1BIQVNFX0NPVU5USU5HKQ0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7DQo+IA0KPiBJIHRoaW5rIGhhdmluZyBhIHJlcXVl
c3RfY2hhbm5lbCgpIEFQSSB3b3VsZCBtYWtlIHRoaXMgbW9yZSByZWFkYWJsZSwgYW5kDQo+IGF2
b2lkIGR1cGxpY2F0aW9uIChoZXJlIGFuZCBpbiB0aGUgUFdNIGRyaXZlcikuDQoNCkFncmVlZC4N
Cg0KPiANCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHJ6X210dTNfMTZiaXRfY250X3NldHRp
bmcoY291bnRlciwgaWQpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4g
KyAgICAgICBjYXNlIFJaX01UVTNfMzJfQklUX0NIOg0KPiA+ICsgICAgICAgICAgICAgICAvKg0K
PiA+ICsgICAgICAgICAgICAgICAgKiAzMi1iaXQgcGhhc2UgY291bnRpbmcgbmVlZCBNVFUxIGFu
ZCBNVFUyIHRvIGNyZWF0ZQ0KPiAzMi1iaXQNCj4gPiArICAgICAgICAgICAgICAgICogY2FzY2Fk
ZSBjb3VudGVyLg0KPiA+ICsgICAgICAgICAgICAgICAgKi8NCj4gPiArICAgICAgICAgICAgICAg
bXV0ZXhfbG9jaygmY2gxLT5sb2NrKTsNCj4gPiArICAgICAgICAgICAgICAgaWYgKGNoMS0+ZnVu
Y3Rpb24gPT0gUlpfTVRVM19OT1JNQUwpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2gx
LT5mdW5jdGlvbiA9IFJaX01UVTNfMzJCSVRfUEhBU0VfQ09VTlRJTkc7DQo+ID4gKyAgICAgICAg
ICAgICAgIG11dGV4X3VubG9jaygmY2gxLT5sb2NrKTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAg
ICAgIG11dGV4X2xvY2soJmNoMi0+bG9jayk7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChjaDIt
PmZ1bmN0aW9uID09IFJaX01UVTNfTk9STUFMKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGNoMi0+ZnVuY3Rpb24gPSBSWl9NVFUzXzMyQklUX1BIQVNFX0NPVU5USU5HOw0KPiA+ICsgICAg
ICAgICAgICAgICBtdXRleF91bmxvY2soJmNoMi0+bG9jayk7DQo+ID4gKw0KPiA+ICsgICAgICAg
ICAgICAgICBpZiAoY2gxLT5mdW5jdGlvbiAhPSBSWl9NVFUzXzMyQklUX1BIQVNFX0NPVU5USU5H
IHx8DQo+ID4gKyAgICAgICAgICAgICAgICAgICBjaDItPmZ1bmN0aW9uICE9IFJaX01UVTNfMzJC
SVRfUEhBU0VfQ09VTlRJTkcpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
QlVTWTsNCj4gDQo+IFN1cmVseSB5b3UgbmVlZCB0byByZWxlYXNlIHRoZSBjaGFubmVsIHlvdSBk
aWQgb2J0YWluIChpZiBhbnkpPw0KQWdyZWVkLg0KDQo+IA0KPiA+ICsNCj4gPiArICAgICAgICAg
ICAgICAgcnpfbXR1M18zMmJpdF9jbnRfc2V0dGluZyhjb3VudGVyLCBpZCk7DQo+ID4gKyAgICAg
ICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgZGVmYXVsdDoNCj4gPiArICAgICAgICAgICAg
ICAgLyogc2hvdWxkIG5ldmVyIHJlYWNoIHRoaXMgcGF0aCAqLw0KPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICByZXR1
cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgcnpfbXR1M190ZXJtaW5hdGVf
Y291bnRlcihzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsDQo+ID4gK2ludCBpZCkgew0K
PiA+ICsgICAgICAgc3RydWN0IHJ6X210dTNfY2hhbm5lbCAqY29uc3QgY2ggPSByel9tdHUzX2dl
dF9jaChjb3VudGVyLCBpZCk7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcnpfbXR1M19jaGFubmVsICpj
b25zdCBjaDEgPSByel9tdHUzX2dldF9jaChjb3VudGVyLCAwKTsNCj4gPiArICAgICAgIHN0cnVj
dCByel9tdHUzX2NoYW5uZWwgKmNvbnN0IGNoMiA9IHJ6X210dTNfZ2V0X2NoKGNvdW50ZXIsDQo+
ID4gKzEpOw0KPiA+ICsNCj4gPiArICAgICAgIGlmIChpZCA9PSBSWl9NVFUzXzMyX0JJVF9DSCkg
ew0KPiA+ICsgICAgICAgICAgICAgICBtdXRleF9sb2NrKCZjaDEtPmxvY2spOw0KPiA+ICsgICAg
ICAgICAgICAgICBjaDEtPmZ1bmN0aW9uID0gUlpfTVRVM19OT1JNQUw7DQo+ID4gKyAgICAgICAg
ICAgICAgIG11dGV4X3VubG9jaygmY2gxLT5sb2NrKTsNCj4gDQo+IExvY2tpbmcgYXJvdW5kIGEg
c2ltcGxlIGludGVnZXIgYXNzaWdubWVudCBkb2Vzbid0IGRvIG11Y2guDQo+IFlvdSBtaWdodCBh
cyB3ZWxsIGp1c3QgdXNlIFdSSVRFX09OQ0UoKSwgdG8gYXZvaWQgcmVvcmRlcmluZyBieSB0aGUN
Cj4gY29tcGlsZXIuDQoNCldlIGRvbid0IG5lZWQgdGhpcyBhbnltb3JlIG9uY2Ugd2UgaGF2ZSBy
ZXF1ZXN0IGFuZCByZWxlYXNlIGNhbGxzDQphcyB0aGF0IGZ1bmN0aW9uIHVwZGF0ZXMgY2hhbm5l
bCBzdGF0ZSBieSBob2xkaW5nIGNoYW5uZWwgbG9jay4NCg0KQ2hlZXJzDQpCaWp1DQoNCj4gDQo+
ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBtdXRleF9sb2NrKCZjaDItPmxvY2spOw0KPiA+ICsg
ICAgICAgICAgICAgICBjaDItPmZ1bmN0aW9uID0gUlpfTVRVM19OT1JNQUw7DQo+ID4gKyAgICAg
ICAgICAgICAgIG11dGV4X3VubG9jaygmY2gyLT5sb2NrKTsNCj4gPiArDQo+ID4gKyAgICAgICAg
ICAgICAgIHJ6X210dTNfZGlzYWJsZShjaDIpOw0KPiA+ICsgICAgICAgICAgICAgICByel9tdHUz
X2Rpc2FibGUoY2gxKTsNCj4gPiArICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAg
IG11dGV4X2xvY2soJmNoLT5sb2NrKTsNCj4gPiArICAgICAgICAgICAgICAgY2gtPmZ1bmN0aW9u
ID0gUlpfTVRVM19OT1JNQUw7DQo+ID4gKyAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmY2gt
PmxvY2spOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgcnpfbXR1M19kaXNhYmxlKGNoKTsN
Cj4gPiArICAgICAgIH0NCj4gPiArfQ0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9l
dmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0N
Cj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4g
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzDQo=
