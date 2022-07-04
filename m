Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A016564E73
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 09:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiGDHMR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 03:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbiGDHMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 03:12:16 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5E96444;
        Mon,  4 Jul 2022 00:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+6JFj0W7Y8vXy8tiWifvMOPmQh+pSN+4R++nqa+vP7E/3KDjwvdharG/Gf3d0znwQE5+fx6+UHashKpMQm+VHUtqC1+6dT3hRYaD1OT4J4uT1KzZBqj7DJzzXr4r5S3pbUB//2p2uSlib+6+dK3Wxb+K+uCOz60JLz62FtM0+WCKrs1w0TzCWa2/kNr9yttg0kfkIjUqPDuXmg+vrrFD0OKvRrb05cSPLb88HgzaugS5nSrEkGXJX3tOWsKEbmkg2nv7mCsDr7f5VUDtlFn5vWzrCbDRC//bIsIDBjW5mFzJCEPwrt+ljAsbeCRQPmaankxZYyTPzflLfU8r0+Y2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95Dn+DDHOSmL63cOXwXdgR9wM8Xi6oGt16ZaZD9B8Hk=;
 b=IASA14CSs/e9aBhnJT3OMcBrkWrLnXYG5HSYrgkXyNTTzg2pzs7DFSQLnZEg7AEePGjzAAFAInIDy42gwse90r4MK9LLQCSd6sL6QuoGanx/pvnTP3Fea8urI2QRWhFCzRw38mdqVi3g7tFxb9TPHALCqNXS+cxWzhjSwfqqyUWYk+qaK2yrz9xqs/y4rKWRZ4ErZUwxflRHzEvCkppcASbbTMJvm7tGxsf2XeWaceJzfl/U04i9zT/OMzoPPmCTV8t6P/XJHN1OQy3ort7p15zfSv4TByo8OieAqzh7pq8/I6wQO6TfXXStUA8nEwB4BoKnBcQEnFBCZi/YXmeOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95Dn+DDHOSmL63cOXwXdgR9wM8Xi6oGt16ZaZD9B8Hk=;
 b=T4CoUAWhty7liuEN43AH1Fyhg5cJ/P1QiAV1cW+0spIKNAlNEMkvTLmleTIKYx2OTPrP5ltqFHI3Mo+UQZYngaDGeLJJ5XhTB7xI8nUZMS0LQNejeasGCY5wRbyzL4cekqWaUD8YLly/KzQtb6f/VdY5fnaheSREr25Q7T9Zhhs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10392.jpnprd01.prod.outlook.com (2603:1096:400:249::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 07:12:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce%9]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 07:12:11 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Johan Hovold <johan@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] serial: 8250: dw: Fix the macro
 RZN1_UART_xDMACR_8_WORD_BURST
Thread-Topic: [PATCH] serial: 8250: dw: Fix the macro
 RZN1_UART_xDMACR_8_WORD_BURST
Thread-Index: AQHYjFzicLJAOXueakmTUlp0Tbrj9q1tx+UAgAAIuvA=
Date:   Mon, 4 Jul 2022 07:12:11 +0000
Message-ID: <OS0PR01MB5922F80CCAF4DFA9C2970FB686BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
 <7431817a-ed5e-1de6-9f69-fda2c1907861@kernel.org>
In-Reply-To: <7431817a-ed5e-1de6-9f69-fda2c1907861@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e3d6c23-e6a0-4435-e42a-08da5d8c83a0
x-ms-traffictypediagnostic: TYWPR01MB10392:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vin2nxyEqzF/+Z2CpKFtTHDz286K/fl3hW+h/mtEYdzJ6BE9AfeRqBpUFKl5ajGQjOG/4G2Xv7YmWq09GrhFt4qwABTRqakjEjEubMRe1G+8gNjm1cPi/UXIn30teZ3L1aGvuFhdHDPuUmpO+8eBPSuwaakbIa7O789n5Z0iAxQCxAxwH1OBmTRvhSsg7+Od8gSQex+MPTxAN+uEu5Jg2p7oHOMrM8HeJk60wRxnO6FQt/SDe0N26NMkEao72SBlEpHj9sEkBEyeiaonBtkFm2fZeszu93bFuLLJB48WIWGLtvodmOOVPqszX+kY6pTTq8YTPfLq39p8gaxlBpYaJQ4Gu2UQ2OJNGidNa90bi95Z8P7hKPpbSvB96RrhqveImA4zWCUWAzesrXwOw15RYyU+hh6rGcri2oH1J4r96UopYBVUjUM5FPYPIuki8wEmxLJJ9x5SQsTtr45Vq9+NTiN9YdGdF6rTUBD3QWSbdO3+hbVe+WnJ4xeUNYgAeKH5vfDXK3Gpjzx8eFW8aQGJXa9NL3C9i1Z31HHUj6nRN+IAtZr92FZz7TxbuhWJ8LsPRL4Tff0F6ngto9XdJHIgs5wh46ktcY15wbVJUDT78EXXqfUa3bA0ztoFymWHXksKbQ6RkNW/WOvrb6E931QP4u+xgYc4F6VrJJB9KbUnhE+0SjO//XX/jbeNXLOregz6vEQEtCoxbM2QFAgRmVnUnnMRDfuLvzfGFC4GRnc1EDM6jABzb9m0L7kukNrlZado+vJ25jYRwYNGJSfb2a/+gdBHW1iqsR1yr8E0tIoE7BI3aiA2c4cux5ITdUyBP0BDyC2z7F6uNn1r6jqg1d9mjg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(71200400001)(966005)(478600001)(54906003)(66476007)(6506007)(7696005)(26005)(76116006)(9686003)(2906002)(66946007)(316002)(110136005)(52536014)(5660300002)(66556008)(33656002)(8936002)(66446008)(64756008)(8676002)(4326008)(86362001)(41300700001)(186003)(83380400001)(38100700002)(122000001)(38070700005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGZUMXlENk1YbC9lRXRTZ0JqS21qczh6L0RPR3FGajgvQTVib0hyVG0xYVdE?=
 =?utf-8?B?NVpRZzRQRXVqT285L29GUkRGSkFlS3l5aWFoKzd5cS8ya2UxaG5pZlhXekZG?=
 =?utf-8?B?bzVjTWJYajJGSWtBNFpJcXVtY1FwbnJ3ZGJIUzFsSlJ4SlN4TnpCUVhhL3Ev?=
 =?utf-8?B?Z3dOaGtNZ3kvUFZmaUVTNmxpbFoxMW0rRm4rYnQyb2dJb3N1bjNwRURkcWxJ?=
 =?utf-8?B?dUlkVFA3QXg1U2pkZUNjN2ZIUWZXUnB5c1Y4MU9PYUhCdmtiRzdyTDdSMGhv?=
 =?utf-8?B?YXJIbUxiNjJGUktnejVPZHZtamFZOTA5NjQ3NXo0d29OdUlYZFhjZHpaREVy?=
 =?utf-8?B?T0RjMFo0UmhzSWVMOFNYZmt6YUJaVURjeEhXV3BnMUp2eUc5RzFzL0FCZzFw?=
 =?utf-8?B?SXpqR3Fmb2wrWURuczNhdll4czlweGZTNjJBdXozdnk0c2QxQllOekJDMS9m?=
 =?utf-8?B?YjVzajlHc2hRY25jMFhOTnRZM3V4dEdMbWsrRDZZeWlnZ0xiNlhmTnB3a01X?=
 =?utf-8?B?bjhvQmVLRHNyOWpzcFo0Y3ZMaytqK2cyMTNPYk9FbU1kR1cvQ1Y4S3IrZ3Rq?=
 =?utf-8?B?T0g3VmVONGgyQUFabXdqRWpXYjVEMmNFd3grVGtYOFFTT0g3T2IvUThVRldz?=
 =?utf-8?B?THVXVy80cCtVdGpaWEFsdHpDUWViNENxeWE4bmtVdmJPR3hMNW95bmxzUXpI?=
 =?utf-8?B?RHI4L3d1N0hvRlpINGYrRTYxVkVHN1ZVWGtIR2dSNnVZMTYxTG9SdXhYYkpT?=
 =?utf-8?B?OGRiVDBwM3lJVmFrTTI4R1NrdTIrcFZGUUlYS0hWMS9rOUJZV1hlM0t0bTBj?=
 =?utf-8?B?Y2FqcndGbjFpZ25WZ2o0QVNrYjF1SHpEbGRqcC95bmhya0N3T1pJQkM2RlFT?=
 =?utf-8?B?ZExGQ1JLd0h0eHA0NUU4b1Y4VjVxZm5oL1l2T3AyNXpLNnZ6OFJDVjU2c2ww?=
 =?utf-8?B?Y290Z1BadEFxc3NPem1DY2FtOTNjajZEL1hiRnBxME5OSldQYVYwV2cvckdC?=
 =?utf-8?B?RHNHVHU5bXlJdHI3TjZuMXk3SFNyL1p0Sm1lKzJGT1BmVkFrSEZGd2VrSXUx?=
 =?utf-8?B?OUcvZGVwTUVSQTMrdGtqV3ZQUUpMVjA0dHROYUREL1NjcndUTWIrK2RPWG8x?=
 =?utf-8?B?MVBET3V4VlRtUFMzSEJyUnFpQ0pnUm9sYi9FYWRvYlpiSy9XekFQNDhVYkhO?=
 =?utf-8?B?K1ZGeDNjNjhRWC9qWnNIR2VMSXNaMGkvM3Z0WE5menN4RmZmZnBkbjhiUE5q?=
 =?utf-8?B?clBkd2NNbEpGTnpjVFVkMVptQlV6cUw3VDNaTGRaZ090ejdwbzEvSExsVEM2?=
 =?utf-8?B?Ly82enRYWFJINzZlVUVTMVQzd1JRNDRocnoyODV0c2xDcmZCdENjL2lBVVVj?=
 =?utf-8?B?NG9EelRvNHFqUkJ2K3NsRG56WWJwaGRxa0hGamUvdUJjSzh3V3Rhb3Rta1Vh?=
 =?utf-8?B?UWpRaW45T2MxbnVJRXhFQ1Myek9PdS9kRUFFcExYNS83KzlUWUdtMGlLbWx3?=
 =?utf-8?B?TFlkNG5LUUk3STZLSDZnQi9WS0ZTNDcycEJuUnRUczBRb3FBa2xTL25QcXp3?=
 =?utf-8?B?WnJySE4xRzRXNFQvcmlEV2tUck92T3V2MHJkOFhzMHE3M0RJbWZteGl6WWpy?=
 =?utf-8?B?aGc3ZmI4dUV4RS9ML1BKUnBKcVBlN1ovbG5FZ1hKTHIyS2pzTGc5ZkxCOWtp?=
 =?utf-8?B?NGx6Y05pdW5BMGZpOE9QM3ZOb2pSR3doM3JsZVRJSVZoTEFZRVgyeGpOVEFr?=
 =?utf-8?B?aUVsN3pxcklaMGpkMEhQU2lmWVFBMVE5SmQyZ0NobjdneUM3TFVDWmtHaWYx?=
 =?utf-8?B?TFU2Vk1DRlpNQ1BrbjlXK3RBSlB3MXlVbnU3K09XQWJnZTJMSGRKQ0dlb3F0?=
 =?utf-8?B?WXVXa2gwY1hncE92RXVYRWZheEVqUWxON1hUOFZ5NlZjRGpjbGhtSEhFSk1C?=
 =?utf-8?B?bllWSFhzN0xxUUt3ejYyMDJlbi9DTE5EUkxXUWxUQnR6SzNuRzhJRUVZYTZI?=
 =?utf-8?B?akRpSDNxSnNPL0FEK3Jjc01jeW1rbVdmMGpFLzVvZ0tsZ3lsN05TaEU4Mlhj?=
 =?utf-8?B?SkhBQXdtU3FwQjNxOXhDWWp0K3doS2pmOXlYREtud2tNSFBacCs0eXlMamQ0?=
 =?utf-8?B?Z0x4YmY1cmhvTjJLRjBSejdnNWhJSW5XR05ia1VKZ0ZUOVpIL1hqOXJPeUxK?=
 =?utf-8?B?c2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3d6c23-e6a0-4435-e42a-08da5d8c83a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 07:12:11.1198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: slGuPr1jDtEHrsDnqsp212vYEcsaXcuFDUg7pUGfMT6K9IBxpI4PZ5u9Hgd/6qDEg7O+q1WKi9ec4P78hdsx94xN4TGe7pMeOQIXOYnO/x0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10392
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgSmlyaSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gc2VyaWFsOiA4MjUwOiBkdzogRml4IHRoZSBtYWNybw0KPiBSWk4xX1VBUlRfeERNQUNS
XzhfV09SRF9CVVJTVA0KPiANCj4gT24gMzAuIDA2LiAyMiwgMTA6MzksIEJpanUgRGFzIHdyb3Rl
Og0KPiA+IEFzIHBlciBSWi9OMSBwZXJpcGhlcmFsIHVzZXINCj4gPiBtYW51YWwocjAxdWgwNzUy
ZWowMTAwLXJ6bjEtcGVyaXBoZXJhbC5wZGYpDQo+ID4gcmV2IDEuMC4wIE1hciwyMDE5LA0KPiAN
Cj4gSXMgdGhpcyBwdWJsaWMgYW55d2hlcmU/DQoNClllcywgSXQgaXMgYXZhaWxhYmxlIGhlcmVb
MV0gc2VlIHBhZ2UgNzIgYW5kIDczLg0KDQpbMV0gaHR0cHM6Ly93d3cucmVuZXNhcy5jb20vdXMv
ZW4vZG9jdW1lbnQvbWFoL3J6bjFkLWdyb3VwLXJ6bjFzLWdyb3VwLXJ6bjFsLWdyb3VwLXVzZXJz
LW1hbnVhbC1wZXJpcGhlcmFscz9sYW5ndWFnZT1lbiZyPTEwNTQ1NjENCg0KDQo+IA0KPiA+IHRo
ZSB2YWx1ZSBmb3IgOF9XT1JEX0JVUlNUIGlzIDQoYjIsYjE9MuKAmWIxMCkuDQo+ID4NCj4gPiBU
aGlzIHBhdGNoIGZpeGVzIHRoZSBtYWNybyBhcyBwZXIgdGhlIHVzZXIgbWFudWFsLg0KPiANCj4g
SSdtIGN1cmlvdXMsIGlzIHRoZSBib3R0b20gYml0IGZyb20gIjMiIGlnbm9yZWQgYnkgdGhlIEhX
IG9yIGRvZXMgdGhpcw0KPiBmaXggYSByZWFsIHByb2JsZW0gaW4gYmVoYXZpb3I/IFN0YXRpbmcg
dGhhdCBtaWdodCBoZWxwIGJhY2twb3J0ZXJzIHRvDQo+IGRlY2lkZSBpZiB0byB0YWtlIHRoZSBw
YXRjaCBvciBub3QuDQoNClNlZSBwYWdlIDcyIGFuZCA3My4NCg0KWWVzLCBpdCBmaXhlcyBhIHJl
YWwgcHJvYmxlbSBhcyBieSB1c2luZyBhIHZhbHVlIG9mIDggLCB5b3UgYXJlIHdyb25nbHkgY29u
ZmlndXJpbmcNCkRNQV9CVVJTVF9TSVpFIG9mIDEgaW5zdGVhZCBvZiBETUFfQlVSU1RfU0laRSBv
ZiA4Lg0KDQpiMiwgYjEgYlVhcnRfREVTVF9CVVJTVA0KX1NJWkUNCkRFU1RfQlVSU1RfU0laRQ0K
RGVzdGluYXRpb24gQnVyc3QgVHJhbnNhY3Rpb24gU2l6ZSBpbiBUcmFuc21pdCBGSUZPLg0KVUFS
VCBpcyB0aGUgZmxvdyBjb250cm9sbGVyLiBUaHVzLCB0aGUgdXNlciBtdXN0IHdyaXRlIHRoaXMg
ZmllbGQgYmVmb3JlIG9yIGF0IHRoZSBzYW1lDQp0aW1lIHRoZSBETUEgbW9kZSBpcyBlbmFibGVk
LiBOdW1iZXIgb2YgZGF0YSBieXRlLCB0byBiZSB3cml0dGVuIHRvIHRoZSBUcmFuc21pdA0KRklG
TyBldmVyeSB0aW1lIGEgdHJhbnNtaXQgYnVyc3QgdHJhbnNhY3Rpb24gcmVxdWVzdCBhcmUgbWFk
ZSBvbiBETUEgcmVxdWVzdC4NCjLigJliMDAgPSAxIGJ5dGUNCjLigJliMDEgPSA0IGJ5dGVzDQoy
4oCZYjEwID0gOCBieXRlcw0KMuKAmWIxMSA9IFJlc2VydmVkLCBub3QgdXNlZA0KDQpDaGVlcnMs
DQpCaWp1DQoNCg0KPiANCj4gPiBGaXhlczogYWE2M2Q3ODZjZWEyICgic2VyaWFsOiA4MjUwOiBk
dzogQWRkIHN1cHBvcnQgZm9yIERNQSBmbG93DQo+ID4gY29udHJvbGxpbmcgZGV2aWNlcyIpDQo+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+IC0tLQ0KPiA+ICAgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jIHwgMiArLQ0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jDQo+ID4g
Yi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMNCj4gPiBpbmRleCBmNTdiYmQzMmVm
MTEuLjkzMTQ5MGIyN2Q2YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvODI1
MC84MjUwX2R3LmMNCj4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMN
Cj4gPiBAQCAtNDcsNyArNDcsNyBAQA0KPiA+ICAgI2RlZmluZSBSWk4xX1VBUlRfeERNQUNSX0RN
QV9FTgkJQklUKDApDQo+ID4gICAjZGVmaW5lIFJaTjFfVUFSVF94RE1BQ1JfMV9XT1JEX0JVUlNU
CSgwIDw8IDEpDQo+ID4gICAjZGVmaW5lIFJaTjFfVUFSVF94RE1BQ1JfNF9XT1JEX0JVUlNUCSgx
IDw8IDEpDQo+ID4gLSNkZWZpbmUgUlpOMV9VQVJUX3hETUFDUl84X1dPUkRfQlVSU1QJKDMgPDwg
MSkNCj4gPiArI2RlZmluZSBSWk4xX1VBUlRfeERNQUNSXzhfV09SRF9CVVJTVAkoMiA8PCAxKQ0K
PiA+ICAgI2RlZmluZSBSWk4xX1VBUlRfeERNQUNSX0JMS19TWih4KQkoKHgpIDw8IDMpDQo+ID4N
Cj4gPiAgIC8qIFF1aXJrcyAqLw0KPiANCj4gdGhhbmtzLA0KPiAtLQ0KPiBqcw0K
