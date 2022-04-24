Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2E6150D019
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Apr 2022 08:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238417AbiDXGsn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 02:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238408AbiDXGsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 02:48:40 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C915A6240;
        Sat, 23 Apr 2022 23:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqeDU5utwDmFiEEbCY5aKuPDwYlgR0vi7E7qWdZrVuwoLLe3pEs6ka5jfdnN6Hw5EVZpTMTafHZ8X5WUR5UjYDt9/2Gr64Ab7MrVukQSbDnhMH/Ir7L0KHJKDVLZ38TBKGAIi6qSgTGGdhOv2wrgQte9E/oPAgIZYCdpuYXolsk+F2IYsaDY7nJmGA+eZeur0K5R21vfBd2dBreixdriRWIGOHPUZPb9klThefZyiKfh5uswr4LP6wVOiA3O/5OLmOqVaS2SmeICaazUqpOchfRxeXR3Go8fjYVT9VLBURRJGBqZoqq+eSXPzCWodVGEJyN3chejWXqLH/y99Q/8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IY6e7TeKfsGUyTGLmJ5ZYW7ak328zbdSeBqK1w3NsSA=;
 b=Td9GWtC0vt1bgkO2ZCEpqwwTaspvmlMaiY47Ef8Eyp8QoYUd73xiula6vC1HTJ4Dh/rbhQSomxn1BL3LILVrmkpyw7RbBZFg2ttBmao3K+75XbODWvgzL6rktoDkihjHP+UQ1gXxzKXG3TawdRiJZIVIFO35ZqF8GpEjHXMr+xQU1G1Xs9wIVE0lAliB5xjUKukHAPpHPUipysd/KbJpUZ/r/Fnb6f6J0I23HWEzethBc5eb5nQEe+8nH5Ae99/nZd/IEK4Fz6dBWwS6fB3hZvYiWGQQxU4imsUttbmWVmKvaMcsKuxBWMASxAl90RxAQMQt6LYhspxFJVY59zjgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IY6e7TeKfsGUyTGLmJ5ZYW7ak328zbdSeBqK1w3NsSA=;
 b=aEUsZpyWk9GiA1tfat8/OpZ5LYx5o6ut6ak8mqaaSANubCzRcmYhQv/iNBa1A6xfrUKjKHaBEdiOOpZiZIZV0v8QDC5vDajLJKkfqbTMeSRt3LSq0CYKbfCECT/G9lLgELbn4W45P8LmVC/rFfqDyXielww2b7NvZJpfChvk6hw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6280.jpnprd01.prod.outlook.com (2603:1096:604:e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Sun, 24 Apr
 2022 06:45:36 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 06:45:35 +0000
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
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk node
 names
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk
 node names
Thread-Index: AQHYVxtpZzDNpS2cMUqYhuvLl0rlk6z94/kAgAC6McA=
Date:   Sun, 24 Apr 2022 06:45:35 +0000
Message-ID: <OS0PR01MB5922CFACC8FEC6D67E6BFC4986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423140658.145000-1-biju.das.jz@bp.renesas.com>
 <f9c6e5e2-c819-d309-0c11-b87deb772858@linaro.org>
In-Reply-To: <f9c6e5e2-c819-d309-0c11-b87deb772858@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95d45d1d-420d-47c3-fc93-08da25be0928
x-ms-traffictypediagnostic: OSZPR01MB6280:EE_
x-microsoft-antispam-prvs: <OSZPR01MB6280E68F757DEB3F03C176AE86F99@OSZPR01MB6280.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DQhxJ5mCzyqUFL7FV7ItPSa39h0c7QkjkCGbBzq1m0LRlrrJcSYKT7EcJ9GKx6g6sANNWYByitlwXygCLRN4ZYneUqByv5+UyX680ETHj3aj4FOPTfuPCZeRSY2eFM5Lgz/sdIa168IHvrYbFxBOQROOOR6DHZlyvZXv00nBVMu0uezKsHPL/2UiOj0p+BVjiu5s4NrUDrU0FofLLFbrM8KfsH8a+iR2+KP3rt2t35Y2gQpOpAYt/O07Uozw7nkwLbyv5SrDVhU9ZDZj3Sxp8pxIpy4XLb0r8+XTMd5kB3Zc2smCo69te2VepdJZBelEsrnFKNe3CgOrTnCe9UqN5B/L5X48LxhVob6Ge/qRZblihhihVPr3K4MVpOvGCPxlf3NY/gnBrkRiBrX6cLD4CB0aNWnARrOr8eTszbiqtf5Beg4lLRkr+tFuaf0/PtWCPsMvL2Zz6LqQWLTGgu8n3aeecMwNDYgloOyszCxHR7PxHxYldOQmZUM7qhPc89rY3SdF3U3nLBLceKp77rk8BIvtd7U5JpEpYGycfCYTvXYNA8ARTonqW1tihUM2PKBmwu0FkHOEEEGjxSC40EjsmtdS2oQ23+98iWqP7qbqydh1c5AHnJif1iKQmv5hIYB9xxzxZl3bBWKFvjJkQ7ttIR4he2OWDbQspLMnVOh6E1mg8/8T40/bPAEVm9qRTOv1riQ86/lrxrqtCaKJ3Akmww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(5660300002)(66946007)(66556008)(66476007)(76116006)(64756008)(55016003)(66446008)(52536014)(8676002)(38070700005)(9686003)(110136005)(54906003)(4326008)(71200400001)(508600001)(2906002)(316002)(83380400001)(86362001)(107886003)(53546011)(8936002)(7696005)(6506007)(26005)(186003)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjNlRjI1Rk5uZkx6VXpMbnZMcDZScjRoc09uVUdSQS9BWS91NXFTYm1TL0hq?=
 =?utf-8?B?RXBrcXVobkhQaUVoQnh2bm1CVys5V0hzNWlmVzlKZWg0NlFkcVNXTy95QjIy?=
 =?utf-8?B?c3kxa0hvSkJFbU8xMnRhR0pKZUxQaTNNbElxWHZWdHhzdWQxV1R6dkJCNXc4?=
 =?utf-8?B?QXZVQ2VQQVNId2JSRTZVczR2VlhZcU52N2xyRlFHejhWSWRlYmFDdlh4bE5Y?=
 =?utf-8?B?VmtjV0tJQ2RRVk4vVWZHQ3hzdS9TUXJWTDQyampORVZYdk45TjZ4alNJUkxY?=
 =?utf-8?B?MStua0FoYmIrelpvaHVaSklXUVJMTXAvbmZCZE9IU2lFd2dja3d2MmpnVEMy?=
 =?utf-8?B?NWVvZXIycTg1UHFkby9DZ1U1TXlZNGU2UXVxZ0FDcFNuZ05QbFRKNWwwdDF0?=
 =?utf-8?B?aUt5d3dITy9OUElXU1A1dnlpSjdmb2lsbHBaek5oNHE0S0R0WisrY1ZhVjJE?=
 =?utf-8?B?WmhnT3FQb25mME1ONVkxdXBIdzZ3cnRadUhtU3RhK1J6aUIxcmVnb1QwWUJI?=
 =?utf-8?B?aFlkMGNxMEEvdnczRDB5VXhybmhmZ0ZJOE0vbW0zVTRkbUVTczM1YWcwNW1q?=
 =?utf-8?B?N0JIMi9nOUcxaXFhOGlnRllyVjZMRWxhWmE3TlJaTHFycGMxOTZIK2trWkE3?=
 =?utf-8?B?VmsxMWszaUt5TEJCVWtyMnJsM3djUkFhV05kdmtNcnJicUttVUdKNWc4aUdW?=
 =?utf-8?B?NithT28xdStYY0hIMlgrajZ5VWFXS3lzSGJVWlFHMWtid25GRXpseUZTVkxU?=
 =?utf-8?B?dFdQRjdiN3hpVVhDb3lmMUo1Y1NBZUdhS1VJeXhRS2twa1ZPYXd4amkxSU9G?=
 =?utf-8?B?Q2FZQkRyY2l4bE11WFZxV2FxNkNDNEFxN3NTeG9vNzZwZ1cvUFYxb25kU2Nw?=
 =?utf-8?B?elg5VFhWSUNUOXhOT1AxNzducFVQOVc2RktiNGxZMHNkNlJPRXBPNjdMZCsz?=
 =?utf-8?B?amZ3Zm0yZ1lCMm9pT2RjNXNYQkJwZHpjN2hrYVFKa0p1OTZKdk5pUklYeXpj?=
 =?utf-8?B?NVBNZ0pCN25pRlNhN29ybmQ1b0FaQjZ2NlltaFErUGpqczQrUUlNZ2QvWE5x?=
 =?utf-8?B?dkM3c0F0K1FtQnAzdHp5WElPaDMrRnY4QlU1SmJVQTJlVUpFNy9kZmV6ZUNX?=
 =?utf-8?B?YUVuSFNsakRocTBQWmNIanBqMC8xSkN3QTA2WVdxelR4QXlpWW1EWC9HRG1Z?=
 =?utf-8?B?ZEh0andhNllPWHJYSkFXUjVxTGRHbTd6bGhONFhlYzZ3THFKVXQwV1pMd3c0?=
 =?utf-8?B?dHN4c0MzbVJXcUl6cVFsT2l5cmdhenhrOVJpRXRQeHlkUXQ1NDZjdCtCN1JT?=
 =?utf-8?B?dCtPcXRqRjQzRXdXOU9KN3dmOGRuaVlzT2RkMkNSNjJKZElIcVhhTVpjb1hm?=
 =?utf-8?B?cDJoaW5NZ1NzODFRVS9pZ0E1Q3dlVlVmRFBiT21TQ3h4eVZQVy9kRHhCWWlE?=
 =?utf-8?B?clBmWUdBM0NudDgrUTlLLzQyTG9FVVJuODY0cUVWSkpROUlqcVVyQXgxU01T?=
 =?utf-8?B?YjhQRllNMU9uSk9vS1QrdDRwMWhtWWhtclFZWTZrV3gvazY0cnFlTEVmRHIx?=
 =?utf-8?B?RFNkdXhIMTcyMUgxWFNBemFEdjBpd1hUcDNwdEQ1RkE1S2V1Zkx2QWJCN2NP?=
 =?utf-8?B?OG85Z2k0UUNiaE9IY09MQXgwYlc2ajhmQXc5UmdncEFQQ1g4NEZlM1ZPSE1B?=
 =?utf-8?B?cDZ6L09BWTR2cXRxaWVzcjgzNyt5VU5KN0RqcXYxa3g5aERwY3Q0YzRiTWF5?=
 =?utf-8?B?L0hvUlh2MHZHN1FrKytMUFhzOGhwM28vOGw1d0ZSQWI3eWEyTm1lYjBEVjlH?=
 =?utf-8?B?dVVhSXRPM24rYjNvWGh5TkNKM3ZhUmp2ZjdxMXpKOU9WM2s5THJMNWJWQjZp?=
 =?utf-8?B?eWFZYTEzYXpqWksreHR4UEtoaGJrdVlFZElMbGtlUTVVMllaM05tUEsrWlVU?=
 =?utf-8?B?UGpaWGNTK2pmeC96VjZQd0NuVDZtaUp6bUVDbEtMN2h1Wk56Z1lZNExDMHlU?=
 =?utf-8?B?UnJiUkVsZGM2eU5VODQwTTR6ZGZhdEdHZysrM3cwNWM4cTdqM05HWUFTaFFG?=
 =?utf-8?B?SytvTHdPUUhPckFRVDNSaVlkVUIrVUQvSExvb0dYUlk0clNPZ0pUS0hwc3pY?=
 =?utf-8?B?cUNkRllBSGxJZ0s2bHAxeS9TZnhYTWV0Y0dTOUdFTk5objU1Z2srTnZVZzho?=
 =?utf-8?B?Qy90bHJ0NkNSc0xIb2hCV0ZUbXo3alphbnlFVk0wekVoZ0hyMExHalFXM29S?=
 =?utf-8?B?Mnhmak5Ua0w0djJMRE1JaVVIV2NoamFPcktrRHU4Sy9PaUllbDZ5cGZQMk5z?=
 =?utf-8?B?T3hnc0Q3cjZmaHlSTzlYWTRjcXJpYWxQaVluSVBNTUp6bjErTlV5NE84dXho?=
 =?utf-8?Q?8oUZC48Kp4ZJvbBE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d45d1d-420d-47c3-fc93-08da25be0928
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 06:45:35.3416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brkKdG7WYe4UCjbh066LuzqBIP0NFXVqgPKZHXAdbuUzy0GLVsQaS3bWJMXfihXQD9lzxX6UGA4pAgnGlhTPCqnC0vO939ziYGNDUgovJhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6280
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0NDog
Rml4IGV4dGVybmFsIGNsaw0KPiBub2RlIG5hbWVzDQo+IA0KPiBPbiAyMy8wNC8yMDIyIDE2OjA2
LCBCaWp1IERhcyB3cm90ZToNCj4gPiBGaXggYXVkaW8gY2xrIG5vZGUgbmFtZXMgd2l0aCAiXyIg
LT4gIi0iIGFuZCBhZGQgc3VmZml4ICctY2xrJyBmb3IgY2FuDQo+ID4gYW5kIGV4dGFsIGNsa3Mu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cw
NDQuZHRzaSB8IDggKysrKy0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjlhMDdnMDQ0LmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiA+IGluZGV4IDE5Mjg3Y2NjYjFmMC4uNGY5YTg0ZDdhZjA4
IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQu
ZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQuZHRz
aQ0KPiA+IEBAIC0xMywxNCArMTMsMTQgQEAgLyB7DQo+ID4gIAkjYWRkcmVzcy1jZWxscyA9IDwy
PjsNCj4gPiAgCSNzaXplLWNlbGxzID0gPDI+Ow0KPiA+DQo+ID4gLQlhdWRpb19jbGsxOiBhdWRp
b19jbGsxIHsNCj4gPiArCWF1ZGlvX2NsazE6IGF1ZGlvLWNsazEgew0KPiANCj4gSG93IGFib3V0
IGluIHN1Y2ggY2FzZSBrZWVwaW5nIHN1ZmZpeCAiY2xrIiBldmVyeXdoZXJlIGFuZCBtb3Zpbmcg
dGhlIGluZGV4DQo+ICgxLzIpIHRvIHRoZSBmaXJzdCBwYXJ0PyBUaGlzIHdheSBvbmUgZGF5IG1h
eWJlIHNjaGVtYSB3aWxsIG1hdGNoIHRoZQ0KPiBjbG9ja3MuDQoNCkp1c3QgYSBxdWVzdGlvbiwN
Cg0KWW91ciBzdWdnZXN0aW9uIGlzICJhdWRpb19jbGsxOiBhdWRpby1jbGsxIiAtPiAiYXVkaW9f
Y2xrMTogYXVkaW8tY2xrIg0KDQpJbiB0aGF0IGNhc2UsIElmIHlvdSBwbGFuIHRvIGRyb3AgdGhl
IGxhYmVsIGluIGZ1dHVyZSwgaG93IHdpbGwgeW91IGRpZmZlcmVudGlhdGUgYmV0d2Vlbg0KYXVk
aW8tY2xrMSBhbmQgYXVkaW8tY2xrMiB3aXRoIGp1c3Qgbm9kZSBuYW1lcz8NCg0KQ2hlZXJzLA0K
QmlqdQ0KDQoNCg==
