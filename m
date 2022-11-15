Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B8362AF96
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 00:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiKOXkq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 18:40:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiKOXko (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 18:40:44 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 858DCF09
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 15:40:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiFIlCJWmntcJxLkyRliqJHnIlEsFyyKjtFk2p4AIA8g5enDLOoVlplzuz1Sgv7FSM7V1xUH3EcvZXDfJiNbZJe5Com0JBeCrzI33fvFV86TNLZESVUa5pxdaJMttkQAHEoAScGEP1ZBi6+OY50Ht8xkTxNmOuGKeVGFCMbuRrOxdyaqklK9thoLDLWCkLMOCQMEz8t50J+nppDBGC7h0paxzO3teVh4R9Ijk3teKfLGC0F/bal+ZjdiOXszqT7abhrETYG2ao0SJQgefZwuTMMeDgMkAfd1int3UwTeUTsPwM9yumf0CuKyHuL8ta2jSMSskMzsihds1pqHw1UH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4y6Xuvl5bcrJuGcsoSitnXwXcU24a+zYz3b3KhHDsM=;
 b=KHo9fCuCG9aXrsWfa3MjHWPtHFew50WZ9gxwXKbmicf0u0W7Z/zy0mTiZUiX3UfgwhIvvT69TARGfAGa1YRUS2xJe/pXhKCSpfTbCNtcwLxS+AZSDmBGeWIQ2CTV73+XwG1J0QCvP1/0T5Wnv2F6YPczSnwwU1iA2rAUfrfMw+JRB4/RayYLq9fJ3vbLTVGtNUmKNT5HlpFf3ck54dRuaNM0dVdrZx9yvrE8yHaH9zK/mZIckmsU2r38ONqZ7vdheF1uFV4ibIuo2h8+iKlx5u3gGMI39nxnX6QPd9pFseO9h4gM5z8lOsWW/2WwrWsoQwZ+LituTVJXFncG09DvUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4y6Xuvl5bcrJuGcsoSitnXwXcU24a+zYz3b3KhHDsM=;
 b=ClEE9DIPC+JXC6lKnM/jF+fVkc33c8tFyouYufKig4pcJ74/aPPzYxagv8jKrfnUwnIFRHvVg9DOzwTfkwxfPP+1yz8sX0iJHeN3VWVHcQZhKi+Aaa4+1TQIKprK38at3n/vvaDxdRLLhqTn6SIg2iBc1VjyaIl9+/gegEIsGbc=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB6134.jpnprd01.prod.outlook.com
 (2603:1096:604:d0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 23:40:40 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%9]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 23:40:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Carpenter <error27@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [bug report] net: ethernet: renesas: Add support for "Ethernet
 Switch"
Thread-Topic: [bug report] net: ethernet: renesas: Add support for "Ethernet
 Switch"
Thread-Index: AQHY+PRCuIxhDTqI9EScc/zaNIOwHq5ACYYAgACbM7A=
Date:   Tue, 15 Nov 2022 23:40:40 +0000
Message-ID: <TYBPR01MB5341A8A2F3A43078F58DE5EBD8049@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <Y3OQysxE+f/AmI3y@kili>
 <CAMuHMdWrEii8qCDHYEouQrKv5xaVmNZn7F9QOQeA-70A=A5O2g@mail.gmail.com>
In-Reply-To: <CAMuHMdWrEii8qCDHYEouQrKv5xaVmNZn7F9QOQeA-70A=A5O2g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB6134:EE_
x-ms-office365-filtering-correlation-id: c1b2953d-809d-482f-152b-08dac762ce30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rxzp/2RRDxAIfUCPr8FFiApXS+FzsluGytLGd7C815jujoxXsldTbvcomkDcYn5J4NBsXteKq/hZGjsd/GMPIkxb8mMYlm1Ep38wO5zWIr+9TxRtdQoFGdN5YfAbdQGFRAa+iXgnt/CW+bMXKymNC8qNHqV/JYRDHHFUl6iaOUEZyURV8rOMJQDLIckvfWoc2vwf1JIiZgYZBKOLYt+rsPBWf0brYZRdgXnm0TJ4tr5/ySKTUWYwdASOkH9Ve8oi8h5BkjU2uipnIZBNoqNAjqQkeekrbaZj1i8n8fmofgMZTfmLtXUgJOwYIMLwwt4Y8zXArAMo+S460PDuaFQaz3wMfmFtzUc8etr8NW2yoJAPwmxBOO7xqGuIMnqmyGfhAulnf5fWb+g5PaRqIQaRjg12KB3RJ07ZM1FZrD7osxPuUH4u3KFxzN9MFOeFK82KFyKpYGU5jvswfRUlwL3TwK6Qvieg/nI3x4rT33IpEdQKGL7S2FSrSFFUsuTmBvjwbRNwftOP5NRFJIa57x/cdnhkGxfiGr7fmC/Xr1hC15cP76zkQKtpKD71W1a4KE0wGY5bRc4hHNeQEOxhWndfNHU5SikkknzE0rugnjP83tPTd5NSkjp8ZqTHZJ/T0++LDaU91x0tlm4FSivw2gahxvrb2B9dvCvtZ6OZTABVYgtLzgQvSR5LDiI9ajCXb/qu2+jwlfXrI+hjZR9xztbSIgLlTRDvhSb3fyiMbHd6rUppK+GZvsiUEmJHtO6/k5Z7Z2MikGdzD3cXOmCMkU67Nw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199015)(2906002)(55016003)(33656002)(66946007)(66446008)(76116006)(41300700001)(66556008)(86362001)(66476007)(122000001)(38100700002)(7696005)(110136005)(53546011)(83380400001)(8936002)(38070700005)(6506007)(52536014)(186003)(4326008)(64756008)(5660300002)(71200400001)(8676002)(316002)(478600001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHl0a05zUkxOV3RSR08wNTlTRmVNWjhRbTAxdVBCd3Q1UzErM3o4RU9tVU5X?=
 =?utf-8?B?UGRDZkQ1bWFWdDNGUitYRXNjbWh0ZVRnY0REU0Jjdnk4UmNpQTR5T0ZNa01V?=
 =?utf-8?B?YkZuNGdaZ0ZTQjh0VHViTk9RSWF2Y1NBREk0aHZWb2syL0RsaFdBcVVPZ0ht?=
 =?utf-8?B?RGZQSmFIdVl3dXhqRVVpMWZMOVpWT2lSbXBQbUFCM1B6Ym5GdzVWTisweVRF?=
 =?utf-8?B?citxVndYSnRTYW93V2x2aFJ1R2pRTXJEL1NLdmJlaTJMMjhxaE00TFpWWjVH?=
 =?utf-8?B?eTdTRzdWT2s2djNiT3N2T0gydVNhUXh6S20rb0dFZkwxWjhNSk91RkNlVDgz?=
 =?utf-8?B?TVBDMy8zNzhmZit3T1BwZU1ycFNta3FQRjJVMjRzZmFwTVZTMmRadjllVDFu?=
 =?utf-8?B?OHRYdzVsbGwrMUoya21vZWsxNnJscEY2OWNjaEkyQjZlM0tmL0hBWWtuSFBQ?=
 =?utf-8?B?TS9jclh3Qk43OVFkUDd2TEFzNUFkQTRLbEpUTVFFZkFHVW9LKzZXWW9KeWlj?=
 =?utf-8?B?T1V2VWVYZE1RSTJObGNqbU83OVczT2JCR3FmWTVWSXpBM3RtUTlwenpOKzlE?=
 =?utf-8?B?dVZwK0xybGdqRWdCTC9YckU1MnB1MjBLY2lwNGR4NDNMR3FZbFc3N2FWUUFY?=
 =?utf-8?B?YVFPVEhiMndJNURCcHk5UmxyY2RiNDVDcWFxejdnRVpYZG1BZEp3MG0rRWVx?=
 =?utf-8?B?NEUyWW1tYzRKWGFBSFFqMXB4QWsxWm10VkVYczBYcElqWDRCKzNvckwrN1Bl?=
 =?utf-8?B?dmZHUFdvQzQ0ZytPUlhDSDA4cWRhWUVIRmltNkhXMXIvV2tlZDY0M3FBRFpD?=
 =?utf-8?B?YzNubjd5RWZESW1jU2FJTHpJYlphVk45QjVtdzdyaFVDN2toc0FZb2Nzd3dL?=
 =?utf-8?B?TytiMHJrVHFFTWhGdHV6OStSZFhUR1JGR0pENzl3TlpqTlByRWlQSHlTNzdP?=
 =?utf-8?B?STZSSmZDaFMxQS9CZUxqbWRaYTJzdXoyMVpUYW5pQWRFeUhtS2pvTmRiQ3V6?=
 =?utf-8?B?R2d4eVcxN3VEY0VudjNrTUR6SXJURUNpcHRQWWU4SnFpMkYrOWYwM3B0UHhm?=
 =?utf-8?B?TTgyQUdoclBheGRyUTR6UVFWMTQrWlVtZG9MNDdvdkx6ZTZSQWhWenNxR1V5?=
 =?utf-8?B?RmROaVlkLzR2MSthazlxL2ttWEtQMlovaG00VFhVSEsyQjVUcWE3Zm5MUW81?=
 =?utf-8?B?V2hYdzJFcGVRTjRzL01ZMnNyUzdXL1ZxdVh5T095Wms1bkNFQmRTUHd4dTFG?=
 =?utf-8?B?YUtlYzRZbkJHWGNJanIzcEpBaXJtbVpWcEZ0SEl6TWNiZU05UTJpcTRzanNu?=
 =?utf-8?B?blVFa1pheWRIN2Z0cEkxOXpLZHhsUEN3M1AyaVl4Z2prYnRWZGcwa0hJVGE2?=
 =?utf-8?B?L0JUZkhWQTBUYlE4MElkK2wxeHNOU0pUUnBQVElWQ1cvN0w0UnZwVTlUY0pM?=
 =?utf-8?B?L2NWU3VVQWJ3bWI2SnByY1U3d2RnQ0FrU3VxVGF4M21UTEVOK2pxd2EyT2Qx?=
 =?utf-8?B?cXVoVXdDZnE3NnIxOE8zeHpIenR4djUzc05Xc1RtSkJXbUNZdklrWENIYnlP?=
 =?utf-8?B?YXVIVXdSQ25oQVczMzR2cmxLRzBsVEI0eVUvaWNuVllsQVZqbFB4eTBHVVJH?=
 =?utf-8?B?RlFUTU5jbzYvWXNidThqd29YQyt6SisrbmtQN1Uvc2Q1WkpTNklvRVlOK1pq?=
 =?utf-8?B?dlVrZXp4UmExM0UwRUdVN0VPcjFTNEtxVTR5c1BXbncrTDkzU3BwMDJUQVp1?=
 =?utf-8?B?NTVIK05Vd2xlSU1WRkF3QjdCWHJYMUNGQjNXejRlaXBxd3EzZllYQTVrWnB0?=
 =?utf-8?B?SXRsaUJ0S3VYa0wvc2tyR0l5cElqaHMvV3hCelNERjRINUU3ZzRFaUhpaVF5?=
 =?utf-8?B?aENrelczbmJNQU9mblE1alRhbE5iUHFoWmdwbERxL2c0bXR1M3FiQkhMZnFm?=
 =?utf-8?B?M3FhMTZIaVFFbjQ5YktGNjFRdWdGNytadUZFQWhkZU9tc1Bxd0xLRzF0ek5D?=
 =?utf-8?B?UUF2bWNqUWRsRXQrZ0ZEcVdiMHloZVBKWStjSVFCYVc5UUd0NUFSZFNWUm5M?=
 =?utf-8?B?T09uNG1sMlNDdGo5ekhYZHR2OVdDdXdiT2xoekhXcHYrSXdWNzV5ZXBJd3Nl?=
 =?utf-8?B?VE14Wm9NRUM4YnMxMmo3dWg1a2IwbGNSZkdObkJIclJZbm4xYWtrU2pZZ0pt?=
 =?utf-8?B?MlB1Yk9iMDB2K2hjMGtDbWlScUJCNWNXcFN4Q0JaOGQ4bWhPQjBnK2FTNHF3?=
 =?utf-8?B?N0pGdlNIRnVNckdkRTFjbFZOUCtnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b2953d-809d-482f-152b-08dac762ce30
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 23:40:40.6014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDMm8CIFPqp14fYV1TjUxya2vi93KJ5tn513JJ/4FL41WBScDPaGiSEd2FVMRXfvXEclFOvcZf/Gnfu2aCZ2hL3F6Tr/JtBI+8xGKYs7Bwas0kuA142L2lafPLnSp2EB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6134
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGksDQoNCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuLCBTZW50OiBUdWVzZGF5LCBOb3ZlbWJl
ciAxNSwgMjAyMiAxMToyMyBQTQ0KPiANCj4gSGkgRGFuLA0KPiANCj4gT24gVHVlLCBOb3YgMTUs
IDIwMjIgYXQgMjoxNyBQTSBEYW4gQ2FycGVudGVyIDxlcnJvcjI3QGdtYWlsLmNvbT4gd3JvdGU6
DQo+ID4gVGhlIHBhdGNoIDM1OTA5MThiNWQwNzogIm5ldDogZXRoZXJuZXQ6IHJlbmVzYXM6IEFk
ZCBzdXBwb3J0IGZvcg0KPiA+ICJFdGhlcm5ldCBTd2l0Y2giIiBmcm9tIE9jdCAzMSwgMjAyMiwg
bGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0Y2gNCj4gPiBzdGF0aWMgY2hlY2tlciB3YXJuaW5n
Og0KPiA+DQo+ID4gICAgICAgICBkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2gu
YzoxNzE3IHJzd2l0Y2hfaW5pdCgpDQo+ID4gICAgICAgICB3YXJuOiAnJXBNJyBjYW5ub3QgYmUg
Zm9sbG93ZWQgYnkgJ24nDQo+ID4NCj4gPiBkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jz
d2l0Y2guYw0KPiA+ICAgICAxNzA2DQo+ID4gICAgIDE3MDcgICAgICAgICBmb3IgKGkgPSAwOyBp
IDwgUlNXSVRDSF9OVU1fUE9SVFM7IGkrKykgew0KPiA+ICAgICAxNzA4ICAgICAgICAgICAgICAg
ICBlcnIgPSByZWdpc3Rlcl9uZXRkZXYocHJpdi0+cmRldltpXS0+bmRldik7DQo+ID4gICAgIDE3
MDkgICAgICAgICAgICAgICAgIGlmIChlcnIpIHsNCj4gPiAgICAgMTcxMCAgICAgICAgICAgICAg
ICAgICAgICAgICBmb3IgKGktLTsgaSA+PSAwOyBpLS0pDQo+ID4gICAgIDE3MTEgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnJlZ2lzdGVyX25ldGRldihwcml2LT5yZGV2W2ldLT5u
ZGV2KTsNCj4gPiAgICAgMTcxMiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl9yZWdp
c3Rlcl9uZXRkZXY7DQo+ID4gICAgIDE3MTMgICAgICAgICAgICAgICAgIH0NCj4gPiAgICAgMTcx
NCAgICAgICAgIH0NCj4gPiAgICAgMTcxNQ0KPiA+ICAgICAxNzE2ICAgICAgICAgZm9yIChpID0g
MDsgaSA8IFJTV0lUQ0hfTlVNX1BPUlRTOyBpKyspDQo+ID4gLS0+IDE3MTcgICAgICAgICAgICAg
ICAgIG5ldGRldl9pbmZvKHByaXYtPnJkZXZbaV0tPm5kZXYsICJNQUMgYWRkcmVzcyAlcE1uIiwN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4NCj4gPiBUaGlzICduJyBkb2Vzbid0IG1ha2Ugc2Vuc2Uu
ICBTZWUgbWFjX2FkZHJlc3Nfc3RyaW5nKCkgZm9yIG1vcmUgZGV0YWlscy4NCg0KRGFuLCB0aGFu
ayB5b3UgZm9yIHRoZSByZXBvcnQhDQoNCj4gSSBndWVzcyB0aGF0IHNob3VsZCBiZSAiXG4iPw0K
DQpHZWVydC1zYW4sIHRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24uIFlvdSdyZSBjb3JyZWN0
Lg0KSSBjb25maXJtZWQgdGhhdCAiXG4iIHJlc29sdmVkIHRoZSBzbWF0Y2ggd2FybmluZy4NCkkn
bGwgbWFrZS9zdWJtaXQgYSBwYXRjaCBmb3IgdGhpcyBpc3N1ZS4NCg0KQmVzdCByZWdhcmRzLA0K
WW9zaGloaXJvIFNoaW1vZGENCg0KDQo+ID4gICAgIDE3MTggICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHByaXYtPnJkZXZbaV0tPm5kZXYtPmRldl9hZGRyKTsNCj4gDQo+IEdye29ldGplLGVl
dGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+
IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzDQo=
