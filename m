Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A776CC654
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Mar 2023 17:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjC1Pa0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Mar 2023 11:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbjC1PaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 11:30:06 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20705.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::705])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924FC11E80;
        Tue, 28 Mar 2023 08:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkyGcQKXZlitQLsZbwe9XbFwdflag4a+jOOoHLbbkj7C2oknuxKhpkWYXNKugAD6bRJtVmZzrnHE+2FYaKy9ZNMXn7bNXy2tl/3KJz3er/GUajlx1LAXkuaUMFR3k7RcEUvkNdgQCGk4Gc9ivEHHwblzAevrDPzplOb5drqFRFdSUw7bk0gvyQrXQP5Q61lY+4OY3yB6Qczy/eT+WDrwGemTa4CXEQVwVy1E3jMkzjQgM+fU3yS9pyc2d+7KEJwphbB6AUy1ml+2UffggXnCvc5B7D+VR1ldl07KoAlCIYW46obs63605/x6TD6BJsY8oheTBj9qRsKnazQebenRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj2ocSMvzpD/EL10453Ts/kRtp2es/tN4LnIusm7ffw=;
 b=D2viqJV5UkKusriyvLHt0NSNMgmAd3XTSnOOJAZpN0KdWMLxUQ7/ZK9A4RNJSSjFGKn76/yKeL2kIe58XZ9m25C2scoMe9j8qLPyt4JXsWRzcqbLYOhAoUg7JZnpySFSC4NmVbpev6aF9zNRBKepJWTucgHztEtRYAoK1Wl3XQQ3MSkRwRHQB2qfL6+6JUauuclVydWkjLWVR6YPParMSwuThUdpzsQXfUTq0vS7yMDiDNw3cQpO0QK4tmUs9fgtoepUGVsFkdBACDzW4yRtDWs+xiumYDSeoD/X3Ed0LvcbQn8wgwKP5yw464f9aW1h6q0HHFzESksw8N80f4Ii8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj2ocSMvzpD/EL10453Ts/kRtp2es/tN4LnIusm7ffw=;
 b=Xug2skVtNZ2K7vU0jDP7JWU8MnUl+DEuYOizeDohEcMFjrVTYTQpDC7PBNhbBmUewrlxIu9nSJJRNNh2syn8k1/34kEo0Q3IGCX4Xg0RgmOuL62b8N0+Wy7lbANTO7/zm0yZug7tablgI5HvdtxBAPjxz5bqJdRX+T5KEkFl9eg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8176.jpnprd01.prod.outlook.com (2603:1096:400:105::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Tue, 28 Mar
 2023 15:23:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 15:23:12 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] tty: serial: sh-sci: Add RZ/G2L SCIF DMA tx
 support
Thread-Topic: [PATCH v2 2/3] tty: serial: sh-sci: Add RZ/G2L SCIF DMA tx
 support
Thread-Index: AQHZXjfBTDHISNg5UkChA8A1nZywSq8Oay8AgAHegzA=
Date:   Tue, 28 Mar 2023 15:23:12 +0000
Message-ID: <OS0PR01MB5922807F1CFA140279897D8D86889@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230324100222.116666-1-biju.das.jz@bp.renesas.com>
 <20230324100222.116666-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUxf1Vc0wERHTAPB2BSGZVUnfuBR_ueNXM+hcm92ibr4g@mail.gmail.com>
In-Reply-To: <CAMuHMdUxf1Vc0wERHTAPB2BSGZVUnfuBR_ueNXM+hcm92ibr4g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8176:EE_
x-ms-office365-filtering-correlation-id: 43a81bc2-afd5-4e86-0c45-08db2fa0583a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k2uI84Y0D24V+3GLdt+wzojKkMp29ck170mHl91e6ce3MvGi9AfqS74XCbqllehNoV4xrXmWbxd0V9OwglUV4oekSVqmM/Jwd5SLEvbmv1cWIRDFeq2emXJvnos3085mgoznylhS8CLh2nzg6U8Zey3P7+2mf/k8toMbPlKVF+TcpVC9kyCyX9YRLDkZ+T/Xbi1qFKWYcnM3o8MS9EbmP/R8NT8x2wK8x1rchPzCiyV+nSPnPx9S9b9xfh34yRrRd+OFkxeowg7091nZxtDtnal3MGZKQd0P3HbpGpYXKqQgvUWmo2KkARvfquey6u5V6L+zDyqZ645juvwJ7mEDmGThP/s9hJt/iAv7JKyO58ML7DVTDi0ad4hvMe2fUiV2UWafOPGfsYKBDL931NZvP1ohY2qU5uIo5jdoiLdt0Dl6W4kyTUBHOcdlMmb8eeX/KLrRLrpJ9viKH1MR7oq6Bi/qEEQWVknYdRPVQByDMbdrm57rsJ+8wBWrAktiAFj8i4EAn8bV0eiipyxMJ0VOmgMdlFr+SmuXOUpjKLWP/Cr3Rop8G//B0QC0diIq8y/2afXyxr3l9P9Dq+apRKpFC/b8RtpOoq64unnhDZL1b/i8GT/FqyEpmBC/BbZxrFsN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(2906002)(8936002)(52536014)(5660300002)(83380400001)(55016003)(7696005)(71200400001)(86362001)(33656002)(38070700005)(38100700002)(122000001)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(8676002)(186003)(66946007)(76116006)(41300700001)(316002)(54906003)(26005)(53546011)(6506007)(9686003)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEJOOHdPSVZDRmJpajhjVkswL3dFVitPdDVCb3BXcmN1cER6TWVMWUNvOXRH?=
 =?utf-8?B?V081NkJYLzhLQndHOGdyMStnd0dKYWUvcFJEM0N3Rzd1cmwrdUEzbHVJMWhG?=
 =?utf-8?B?dnRjZEhZTVo1alpsK1BNbkE5TUNDM3lsL0RIMU03U21rdG5oaVA3eVg2RTFB?=
 =?utf-8?B?TUZHT00veVFYSVlpM0t0b1ZxYkRPYjNCV29wVVpEVWwwYjByc2c3QkV4OXVP?=
 =?utf-8?B?ZlBVOFpkSWQzVHhudlhXMjQ0ZnU4Q0JjUXo1ZHpRWnJuL0FGNUhrZ0tFRmRD?=
 =?utf-8?B?enZYWktwdnE1YmRDRGRrdTByZnhTajloM29tY2hSWFgwdC9PUnU3RVNiRXlO?=
 =?utf-8?B?YUZzNmtiamJFUXJsOW5MMXpLRVdpY01JVjVGT3NWblpGL2VVQmZOSkIra20r?=
 =?utf-8?B?dFNLekczdktrZ0ppcnZ6NmR0Uzlpa05ITUF2aVYxejd6aU5BK3lKNUFFbjlD?=
 =?utf-8?B?ZFNXSDV0cG44OCtPVUczVGtwNWJ4TmNFb0pnU3A1Y3ZzUUlOekhCVXhBdUho?=
 =?utf-8?B?N0dpNkVmQnFmaGRwb2twZ0lwWG9wemhST3plS244QlFETlBTTzZxRzZCYUc5?=
 =?utf-8?B?dWdOSUNLU0l3dVVLTzBHRVV4M0EvMk1yN0F0ZWFieEh2cUhjbnEyZWdCVWhz?=
 =?utf-8?B?cGhIeUdBdE5icEwwckNucFU1d0Q5UDFJaWtUZlI5K01Ob1lvUW1HZUxhVElo?=
 =?utf-8?B?cFRJdUp3VTM4T2xJbFFNTWNTSmZ5ME5Mcm1ZaUlqa3VaemFpd2xqdXFVNzZx?=
 =?utf-8?B?ZHpYa3A1Zm55c0lxeGdadFVVOHl6VHRnb2VNNWZ6QWlnQmRvZTRGa1U0ODRk?=
 =?utf-8?B?disvZ09nRnNGbjdENmVzeGdGM2t6djBtakx6cG1zUUFDLzZjUXlCbkhPeUZy?=
 =?utf-8?B?ZDlENzdjZUVQZ3N6L2h6NkVRRWhUaXI4VU5veHZVTGhoQzlvbXY2T1VURzJT?=
 =?utf-8?B?algzUFdFc1dFRWtvM3VHblpYMHMrUlhka3JyMjhjVTNEUW82ZkxlbDFmYU1G?=
 =?utf-8?B?OW1hMVFCeHYraDNPaC91bG5UcWpnZElVazdBVHRObkliTWc1VkhZN3I3enNI?=
 =?utf-8?B?a3VReEY0OHl6dVVoRXNRZHhRM1NrQW8ybER2UGlCRmpHdytuZXBla3o5Q1U1?=
 =?utf-8?B?aWR4UGh3b1VkTS9KWjJkeWpHQ0lNWkRodkFUdVBnNVhsQnVyZC8zNWhpVWlp?=
 =?utf-8?B?UnpRc0dIWVNFZDMyb3R0RjN1Nnd0c3FFV2g1VThIZXVUd0N5ZElpNE9lMG9k?=
 =?utf-8?B?K2hyWXBmaVJ0RjZXWW1hanpPVlMrajJITGVMTWN0Um1WRTI3N2VoSEhwb05W?=
 =?utf-8?B?MWpRdGdKYW1keVM0cHdpMTdkLzRHcUxwbkZyUGhQN1BJUElnMERYR1lEcC9K?=
 =?utf-8?B?dW91RnMweElkeGhrQ1YwN0RzanJhanBzRTYwdThRbUdJcGxvN285TUtSM1VB?=
 =?utf-8?B?SGI2RTFDM01LV3ZmWDJoUER2cVpZb2Q3R0RIeDZHRXR4RUZOVEtRaFNZcDhW?=
 =?utf-8?B?Nlluczl6SWxJV1ZqcE1OL0ZOcmkwSDJjUUQ2djF1cndxSld2MHpaV2p3T2VT?=
 =?utf-8?B?KzNPWjNjalR5UzFRdHhhcWFxS3NSUXR0TTdFeVFXSnk2Q0M0WmkvTGdvZVpY?=
 =?utf-8?B?SzkwWENSSGZOUjRTYWN6NXkvUHJiZk1Ob1RnRmJmTmh5ajFrSXNZMTV2Q2w2?=
 =?utf-8?B?T2RTaFA3Z3NJRFhOd3R5dksvY1NYaWtmOXpqS0Vva0xCbE12Z1B0dVlHd21K?=
 =?utf-8?B?dy8yOFJESzNHbnBZR2lCMHJLdlNHdVpPb3FCditCSzdNaVl2VVBTcC8yYm10?=
 =?utf-8?B?RVN5WHBIYllZalZvNmVxMk5SUmx1RzIxeFZhSldsSzF1VXpBSE1aSXBjM25v?=
 =?utf-8?B?cmdLVDY5cUVrV01aU3IxMHFYakxkdjdrYWJ6dEcwRUJwS09WQU9DYWJTQkxU?=
 =?utf-8?B?N2ZTaml1L2pPZFZ5QmlVS2FMeUR5T3gwaXorZXlKOG1QakZUSTZ5QU5MVW9O?=
 =?utf-8?B?OHJUaUdlN2t5WkluUk55YkVubVVWdExmdWE1bysvNGRNcGhBNXdSVnVJQ3VZ?=
 =?utf-8?B?MjlDc3ovdFlrZVUwaWdBbGJwc0xvRzJhVDduOEh4VWxSWVVWWFZmckNTUEhO?=
 =?utf-8?Q?2q29xSe+P2EWTSaLbFrGIaPyE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a81bc2-afd5-4e86-0c45-08db2fa0583a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 15:23:12.4191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rk/eQNr8JCUeP+im/Nh0mwJQBU2Q/PFPS/gtMZHMmNmgDT73qBBbhEXVRXU2LSkj2u4sN3UtZ5tI5ja504UAXGFJwBGJ9oKIs/3kDx/r3hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8176
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMi8zXSB0dHk6IHNlcmlhbDogc2gtc2NpOiBBZGQgUlovRzJMIFNDSUYgRE1BIHR4
DQo+IHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIE1hciAyNCwgMjAyMyBh
dCAxMTowMuKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3Jv
dGU6DQo+ID4gQWRkIFNDSUYgRE1BIHR4IHN1cHBvcnQgZm9yIFJaL0cyTCBhbGlrZSBTb0NzLg0K
PiA+DQo+ID4gUlovRzJMIGFsaWtlIFNvQyB1c2UgdGhlIHNhbWUgc2lnbmFsIGZvciBib3RoIGlu
dGVycnVwdCBhbmQgRE1BDQo+ID4gdHJhbnNmZXIgcmVxdWVzdHMsIHNvIHdlIG11c3QgZGlzYWJs
ZSBsaW5lIGludGVycnVwdHModHggYW5kIHR4IGVuZCkNCj4gPiB3aGlsZSB0cmFuc2ZlcnJpbmcg
RE1BIGFuZCBlbmFibGUgdGhlIFRJRSBzb3VyY2UgaW50ZXJydXB0Lg0KPiA+DQo+ID4gQmFzZWQg
b24gYSBwYXRjaCBpbiB0aGUgQlNQIGJ5IExvbmcgTHV1IDxsb25nLmx1dS51ckByZW5lc2FzLmNv
bT4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJp
dmVycy90dHkvc2VyaWFsL3NoLXNjaS5jDQo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3No
LXNjaS5jDQo+ID4gQEAgLTE3Miw2ICsxNzIsMTMgQEAgdG9fc2NpX3BvcnQoc3RydWN0IHVhcnRf
cG9ydCAqdWFydCkNCj4gPiAgICAgICAgIHJldHVybiBjb250YWluZXJfb2YodWFydCwgc3RydWN0
IHNjaV9wb3J0LCBwb3J0KTsgIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfcnpf
c2NpZl9wb3J0KHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIHN0cnVjdA0KPiA+ICtzY2lfcG9ydCAq
cykgew0KPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IHBsYXRfc2NpX3BvcnQgKnAgPSBzLT5jZmc7
DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIHBvcnQtPnR5cGUgPT0gUE9SVF9TQ0lGICYmIHAt
PnJlZ3R5cGUgPT0NCj4gPiArIFNDSXhfUlpfU0NJRkFfUkVHVFlQRTsNCj4gDQo+IFRoZSBsYXR0
ZXIgaW1wbGllcyB0aGUgZm9ybWVyLCBzbyB5b3UgY2FuIGRyb3AgdGhlIGZpcnN0IGNoZWNrLg0K
PiBBZnRlciB0aGF0LCB0aGUgY2hlY2sgYmVjb21lcyBzdWZmaWNpZW50bHkgc2ltcGxlIHRvIGlu
bGluZT8NCg0KT0sgd2lsbCByZW1vdmUgdGhpcyBzdGF0aWMgaW5saW5lIGZ1bmN0aW9uIGFuZCB3
aWxsIHVzZSBjZmctPnJlZ3R5cGUgPT0NClNDSXhfUlpfU0NJRkFfUkVHVFlQRSBpbnN0ZWFkLg0K
DQo+IA0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNjaV9wb3J0X3Bh
cmFtcyBzY2lfcG9ydF9wYXJhbXNbU0NJeF9OUl9SRUdUWVBFU10gPSB7DQo+ID4gICAgICAgICAv
Kg0KPiA+ICAgICAgICAgICogQ29tbW9uIFNDSSBkZWZpbml0aW9ucywgZGVwZW5kZW50IG9uIHRo
ZSBwb3J0J3MgcmVnc2hpZnQgQEANCj4gPiAtNTg4LDYgKzU5NSwxNiBAQCBzdGF0aWMgdm9pZCBz
Y2lfc3RhcnRfdHgoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCkNCj4gPg0KPiA+ICAgICAgICAgaWYg
KHMtPmNoYW5fdHggJiYgIXVhcnRfY2lyY19lbXB0eSgmcy0+cG9ydC5zdGF0ZS0+eG1pdCkgJiYN
Cj4gPiAgICAgICAgICAgICBkbWFfc3VibWl0X2Vycm9yKHMtPmNvb2tpZV90eCkpIHsNCj4gPiAr
ICAgICAgICAgICAgICAgaWYgKGlzX3J6X3NjaWZfcG9ydChwb3J0LCBzKSkgew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIC8qIFN3aXRjaCBpcnEgZnJvbSBTQ0lGIHRvIERNQSAqLw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGRpc2FibGVfaXJxKHMtPmlycXNbU0NJeF9UWElfSVJR
XSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGlzYWJsZV9pcnEocy0+aXJxc1tTQ0l4
X1RFSV9JUlFdKTsNCg0KQXMgcGVyIFRhYmxlIDIyLjE5IFNDSUZBIEludGVycnVwdCBTb3VyY2Vz
LCBXZSBkb24ndCBuZWVkIHRvDQpkaXNhYmxlIFRFSSBhcyBETUFDIGFjdGl2YXRpb24gbm90IHBv
c3NpYmxlIHdpdGggVEVJLg0KDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC8q
IERNQSBuZWVkIFRJRSBlbmFibGUgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjdHJs
ID0gc2VyaWFsX3BvcnRfaW4ocG9ydCwgU0NTQ1IpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHNlcmlhbF9wb3J0X291dChwb3J0LCBTQ1NDUiwgY3RybCB8DQo+ID4gKyBTQ1NDUl9USUUp
Ow0KPiANCj4gRW5hYmxpbmcgVElFIGlzIGFsc28gZG9uZSBmb3IgU0NJRkEgYmVsb3cgKG91dCBv
ZiB2aXNpYmxlIGNvbnRleHQpLg0KPiBQZXJoYXBzIHlvdSBjYW4gY29tYmluZT8NCg0KT0suDQoN
Cj4gDQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAgICAgICAgICAgIHMt
PmNvb2tpZV90eCA9IDA7DQo+ID4gICAgICAgICAgICAgICAgIHNjaGVkdWxlX3dvcmsoJnMtPndv
cmtfdHgpOw0KPiA+ICAgICAgICAgfQ0KPiA+IEBAIC0xMjE0LDkgKzEyMzEsMTYgQEAgc3RhdGlj
IHZvaWQgc2NpX2RtYV90eF9jb21wbGV0ZSh2b2lkICphcmcpDQo+ID4gICAgICAgICAgICAgICAg
IHNjaGVkdWxlX3dvcmsoJnMtPndvcmtfdHgpOw0KPiA+ICAgICAgICAgfSBlbHNlIHsNCj4gPiAg
ICAgICAgICAgICAgICAgcy0+Y29va2llX3R4ID0gLUVJTlZBTDsNCj4gPiAtICAgICAgICAgICAg
ICAgaWYgKHBvcnQtPnR5cGUgPT0gUE9SVF9TQ0lGQSB8fCBwb3J0LT50eXBlID09IFBPUlRfU0NJ
RkIpDQo+IHsNCj4gPiArICAgICAgICAgICAgICAgaWYgKHBvcnQtPnR5cGUgPT0gUE9SVF9TQ0lG
QSB8fCBwb3J0LT50eXBlID09IFBPUlRfU0NJRkINCj4gfHwNCj4gPiArICAgICAgICAgICAgICAg
ICAgIGlzX3J6X3NjaWZfcG9ydChwb3J0LCBzKSkgew0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHUxNiBjdHJsID0gc2VyaWFsX3BvcnRfaW4ocG9ydCwgU0NTQ1IpOw0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHNlcmlhbF9wb3J0X291dChwb3J0LCBTQ1NDUiwgY3RybCAmDQo+ID4g
flNDU0NSX1RJRSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHBvcnQtPnR5cGUg
PT0gUE9SVF9TQ0lGKSB7DQo+IA0KPiAiaWYgKHMtPmNmZy0+cmVndHlwZSA9PSBTQ0l4X1JaX1ND
SUZBX1JFR1RZUEUpIj8NCg0KQWdyZWVkLg0KDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiBTd2l0Y2ggaXJxIGZyb20gRE1BIHRvIFNDSUYgKi8NCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYWVuZ2luZV9wYXVzZShzLT5jaGFuX3R4X3Nh
dmVkKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuYWJsZV9pcnEocy0+
aXJxc1tTQ0l4X1RYSV9JUlFdKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGVuYWJsZV9pcnEocy0+aXJxc1tTQ0l4X1RFSV9JUlFdKTsNCg0KV2lsbCByZW1vdmUgVEVJIGFz
IHBlciB0aGUgdGFibGUsIGl0IGlzIG5vdCByZXF1aXJlZC4NCg0KQ2hlZXJzLA0KQmlqdQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIH0NCj4gPiAgICAgICAgICAgICAgICAgfQ0KPiA+ICAg
ICAgICAgfQ0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4g
DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZQ0KPiB0aGF0Lg0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
