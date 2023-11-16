Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69FBB7ED9B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Nov 2023 03:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344454AbjKPCnf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Nov 2023 21:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344386AbjKPCne (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 21:43:34 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F5401AD;
        Wed, 15 Nov 2023 18:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adC4LYLXAh/zjTYiXtI15QQr8xlPrIdrRrTdlTff6Rv2eWCAdSOTCau1YAJUIcOgckjJC6M01x0W1pfXa4WDHU7njJgYL4ZrfCUfFqWmQ8BU/pMySoZUpJpCv5rIuN0fI/xWtO38A324HjgKPNIcAWrmHprW+o6UM0jtJ66in4s0eDNg5upsHL3xKwk0Zs/OSOUjxHhElXsJuRs8UuOn8+bi0Z9SbrIWU+O7UJHOctH8H7WnbBipx0F5EMoG6HaXv+QpAs7iXbFeqLzJN6NMVyvob2DHsCANNOWnhleIwZm8S/BMuJAQ1K4KNkQU5Tj4GcJuaTAfgDQzu7QfvdboYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iC9cnWKT8Pr/ZgMYzcg0izqBc15L0PRAarGDTLeI6Mk=;
 b=WxgWVwkdRV8AVl0DVdI/4yDR8rUAfnw2uYTn3sSasEV7YY5k0YEv8ztm3vQnkgUcjGX2v0foHzCvM4y3cahrlfiC6HNhuRRpWyXklQWIpIs/vqqykBc3QyFdqzSWtPOt/9MiivUfmVqToRbB1zuggkomcTgoerz5irrmLICnN3nPfIGRJT6NmliCxJFOF2LB6uTHF9//v4pzeN5ZpXS3fR3Exp88OwthHQ8HS5SY3eCFRUmO1wU72CtwPeReHzQaxzEyMHQPFnzpbOL/f/4CQE8ajOR4NcR96LK/c95ZOq597WM1FNFQ7OcRXuXGWCGsB+FwVFxTV/NnrmYxZo6fJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iC9cnWKT8Pr/ZgMYzcg0izqBc15L0PRAarGDTLeI6Mk=;
 b=gwD6K/ThYFFfjOa+chkegtdR8X1kbjWFWxxVCZk2TGdyIpokN5Xe/7scqrQ27NLVgYi7Brnl27RgIFyZnl4HFqDylSFLNQ1mYXCVi1rKOtJBT9ik45OGQaS89LDkFU1AtPT8oKc1lVtSdTfeNYpV4hFjB3rmTcMD8uflA90Ve5U=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB8219.jpnprd01.prod.outlook.com
 (2603:1096:604:1a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 02:43:27 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 02:43:27 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@kernel.org>
Subject: RE: [PATCH net v3] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Topic: [PATCH net v3] ravb: Fix races between ravb_tx_timeout_work()
 and net related ops
Thread-Index: AQHaF2s87xPKvfomxU6H13dEu47X9LB7tqwAgACDB4A=
Date:   Thu, 16 Nov 2023 02:43:27 +0000
Message-ID: <TYBPR01MB5341209D8B6E97F8C0AE9DCFD8B0A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231115022644.2316961-1-yoshihiro.shimoda.uh@renesas.com>
 <903d8187-3979-22b4-0849-43e84560ea4b@omp.ru>
In-Reply-To: <903d8187-3979-22b4-0849-43e84560ea4b@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSZPR01MB8219:EE_
x-ms-office365-filtering-correlation-id: bdab7346-6ca8-4766-0da9-08dbe64dcf96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pt3NWp1Q+wNkn0/DFuCmRy2E+u+FZH2Lwk3gLREDolHrwTGQzVZC85xwONG/WalHQL5xKXoOXu13Q7imUDQ4mkOJS+IK8YHBpXqLSmvN7pEFJaxBvgHEhWruzhwuyrzyJ39kB7FCOAIMHvhTJiJQq+VB++SrHPiBF1NRRecBhS5ahbCH9fznr/hdxgn4XSE3kNW3d7zS8z6uzciae2wqfJrvN8shkZmSNW7ZjTi3JJ26dl1nYMqXby5ikwEt9uMbC8E1oYIRXp4Oo61maah36EIIYslhRhiumlRBcK3cecDGmXDxDHDRL8f0YSs4afw49nYSRI3EFlIwU0wZRCT50s5BA8E5HPXTWgqT+MZRZEkei0yaCnU6b8fg46SiZG/nvfllOEIR5PFU96gO4GV5GVWp0zRKIICP6AGZrMAQEgN1mQA2HbN6M11gVcONf7kEjNW/QdJOX5Tu8CUiKjnm9oQpOKHml+d2uiPuOdE3WGJZ+27pq3f9GQjEKncAwjRX4N8XQdj/umQEyqnmVpWC6STU4J9/IxQndMYfz27Bur8kT8YviqJmW+uE6+aGqxs6W83V7VFpnmutxAwhMQNEf8bH7g8isLGd6hAr1zODl+ibT2yfgTV995Wz+tlUXkIH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(5660300002)(122000001)(83380400001)(2906002)(41300700001)(38100700002)(54906003)(64756008)(316002)(110136005)(38070700009)(66946007)(66556008)(66476007)(66446008)(76116006)(6506007)(7696005)(53546011)(9686003)(55016003)(86362001)(33656002)(52536014)(478600001)(4326008)(8676002)(8936002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXlvN0IyS0lwdWoyVlRJb1dLWjBIZDNRazdlUjduY0M2dXJ1UWZtS2F2Y0xB?=
 =?utf-8?B?U2d6b1pYTk9ub3c4QW40MGhNRXJ4Q3Z0ZFZTY0RwRzNwSFRYOG5nN3h3bmNh?=
 =?utf-8?B?V2xiNXFyMXFhQlFPOFR1Zm4yYVJ0clRQUU9TK3FJWmN6YW81T0ZJOXpvUWxm?=
 =?utf-8?B?TWhrRGtzMzZ4c0tvVWJsK1VWTWhsWksyaXB3ZldjK3U2TG1aVnhDc210Vi9v?=
 =?utf-8?B?cVJNOHU1dUhPR2pHK3l4K091OG1mR2pGT0oxSU55SWtOOEQxR2RQVVZVOVNQ?=
 =?utf-8?B?WHplVzlEWUswcTBoQTlIQm8zMXB2eUVmZm5jcnFCRjY4bTB1N3BPdmhzd1Zx?=
 =?utf-8?B?OEp0SUI5Tnhpd093Ym5DenMyTW44TktGZTd0MUpXZ2NjM1d1a05CY09vTEFi?=
 =?utf-8?B?cjhsQVpRUzlHUkVKdm5OWmtwUkpBVlBBN0cvajhwMlU2aFNneVhzNGJrT0Ev?=
 =?utf-8?B?azF3cjJNWjMySVd5VnBHTGkxYm1aVzQ4Visvb2N3NGduRHhHRnJYKzhRZ2tu?=
 =?utf-8?B?clJxZFZITzFkelFhemdhWTZkT29aN3J2QzE5d1lMZ0tEY3YvR0RiMnEyV2V4?=
 =?utf-8?B?REJsWFdnV0QxSVA5RVNsYlJZa3lyY1F5bkIxK3RieXRXRmpPZVJISW43SVBP?=
 =?utf-8?B?SmxUVTBGbjl4YlNsM1JiMHVyOUpmMXN0TmZDZE0yT0JNMjJYYWNwTzkwN1FT?=
 =?utf-8?B?eVVuYU12bTVFanVFajZEZFdWWllUaFllbmIyU3o1MmcwUlVzeUhKWjBXVndK?=
 =?utf-8?B?QWtRQ0RYYU56ZnlBeEcrZk1FNVhZN0g3WWIyMHNPdVpCZmdHNFluK1JGYU8z?=
 =?utf-8?B?TkFWK3hwN1BoZlMwcVg2SnEva1E3a3czaHFmekMzVGtJa0xlYm5HMm1Lek5B?=
 =?utf-8?B?N3JYZWhrMVA4cy9aMGRnVDAxYjRRNzFFQkZHMjZSRm5rN2Y5UHNTY1hENmNZ?=
 =?utf-8?B?djZKYnVCV1F0a0pvMEFtalBiSFN3QlVTakIvWVpTMDB3TVdMYUZ0VGh3a1cx?=
 =?utf-8?B?NHhjMCtFNVR4UUNlSWcwWXBMRjBWL1ZXaEVOaDA2TGpyUTNXenAyTGt0TGE2?=
 =?utf-8?B?ZnZpVXMrRjFjL0xnY2FrbFpKRUZnZm8rZEw2dzlDeFB4NC8rODhMbHhmamJ0?=
 =?utf-8?B?Vmw0Ym5GNzlhQnQ0QnY5SUN2VlVZVUN6Wkx2TVFpdE5NNG16RW9YMnJGVzFm?=
 =?utf-8?B?a0FyUGFKM1NaUzhCSjk0aXp1RnZHZm1DSXUwWlMxV0ZiYWJRZU10RjZ3bXh2?=
 =?utf-8?B?Ryt6SnFiWUtqNGdxbTc2K0g1SEw1VzBOQWQ5TzFmdWFUY2lmTkl3SDk2SlN0?=
 =?utf-8?B?V3FhNkNUYTFCSk9wbXpramlVekpZTTVDR1hIekVIUk9vV1JuTTJQdmw1TWVU?=
 =?utf-8?B?dUdXRlMrWkt3M3NLYVh2ak93K05XekI2R2FqaHlXVlhhMDdkbmx4dkc3b1pL?=
 =?utf-8?B?N2hHM25MQnNRbXFxTmVLSFBHS1kxb0dma3hkYWtqbCtBZnlHdHNhdmVFN2Jj?=
 =?utf-8?B?RlJ6R2JxTEhHbnBHUnptaFljWktXSVlhMERKM1pzSFlPNHVFM3dXZjN5c0Q1?=
 =?utf-8?B?RndwWmh1bHEyOFpTYTFuVHk2T3RCRDNLbmFqMkxEaHRRUmhKTURoYnhXdjUw?=
 =?utf-8?B?bjdJOFJnMnJaZlR1dUtRU2Y4Si9HeXBvSmZqeTZXSXJiNjZnU0N2cFk5eG5j?=
 =?utf-8?B?a1AySlBOTXFNZk9wQmNTang4RE50eG54ckxHK2dXNzRRSFZ4eGs5UHlhNU9a?=
 =?utf-8?B?RW1PTkNaVnQyZFNTVW1qdndxYyswTnpKVnFhdysweFFpQ1lsYWFseTB6K1NT?=
 =?utf-8?B?RUFHSWZTMkM3S20wNGFHaC9SYllBdjR2Z0VDbEcwZG03WEF6WUlobTZTVm15?=
 =?utf-8?B?YkphSVkwZGtOd0FKYlM1N3Q3czB6YmR3YU1vam5HUkJnRDNjUEdPaFdlY3hM?=
 =?utf-8?B?VEwxMTcwZnlxMXZTcDVKV25McHU1QTVLV1BpUTBBRG1wUFdzVUFRWjIzUzFI?=
 =?utf-8?B?TXlYb2RCeER1WS81aHFIaTArY2JlOXdTelF0czVYVXFyeVJxUWtLTUs2QTZp?=
 =?utf-8?B?ZzYyZGU3LzN0L3VraU1WSW1FY0RVZlRMVFF2eXVtNU1wQzlOQ0pZME4vdEdj?=
 =?utf-8?B?VnVmK1hvd2xCMlExTjZGZ1h1U2gvN2NSSEhSRE5HclZDdDBhd1JMV2kxeXpa?=
 =?utf-8?B?WWgzckJ4bUwwc1FvMmRHMk10YW9JaXBGS0NkZ0hYRi9Jc1hZMWNmNElZMHpP?=
 =?utf-8?B?ZmZFUzUyc0JsNy9XQW03VzJ6UmJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdab7346-6ca8-4766-0da9-08dbe64dcf96
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 02:43:27.2463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bR44X3RK7tetMGExoKtpBUEI4xruLFnqRzSwE8+Q2E0LsIL0TDUZPZeRb7D1kDEV9PyGNSu2uCLg1eVXlOV4ZC7zlyBidNzJ5g2hH5Xfl+I3bqIfZ5tw/8F5rblh2SBt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8219
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8sDQoNCj4gRnJvbTogU2VyZ2V5IFNodHlseW92LCBTZW50OiBUaHVyc2RheSwgTm92ZW1i
ZXIgMTYsIDIwMjMgMzozNyBBTQ0KPiANCj4gT24gMTEvMTUvMjMgNToyNiBBTSwgWW9zaGloaXJv
IFNoaW1vZGEgd3JvdGU6DQo+IA0KPiA+IEZpeCByYWNlcyBiZXR3ZWVuIHJhdmJfdHhfdGltZW91
dF93b3JrKCkgYW5kIGZ1bmN0aW9ucyBvZiBuZXRfZGV2aWNlX29wcw0KPiA+IGFuZCBldGh0b29s
X29wcyBieSB1c2luZyBydG5sX3RyeWxvY2soKSBhbmQgcnRubF91bmxvY2soKS4gTm90ZSB0aGF0
DQo+ID4gc2luY2UgcmF2Yl9jbG9zZSgpIGlzIHVuZGVyIHRoZSBydG5sIGxvY2sgYW5kIGNhbGxz
IGNhbmNlbF93b3JrX3N5bmMoKSwNCj4gPiByYXZiX3R4X3RpbWVvdXRfd29yaygpIHNob3VsZCBj
YWxscyBydG5sX3RyeWxvY2soKS4gT3RoZXJ3aXNlLCBhIGRlYWRsb2NrDQo+ID4gbWF5IGhhcHBl
biBpbiByYXZiX3R4X3RpbWVvdXRfd29yaygpIGxpa2UgYmVsb3c6DQo+ID4NCj4gPiBDUFUwCQkJ
Q1BVMQ0KPiA+IAkJCXJhdmJfdHhfdGltZW91dCgpDQo+ID4gCQkJc2NoZWR1bGVfd29yaygpDQo+
ID4gLi4uDQo+ID4gX19kZXZfY2xvc2VfbWFueSgpDQo+ID4gLy8gVW5kZXIgcnRubCBsb2NrDQo+
ID4gcmF2Yl9jbG9zZSgpDQo+ID4gY2FuY2VsX3dvcmtfc3luYygpDQo+ID4gLy8gV2FpdGluZw0K
PiA+IAkJCXJhdmJfdHhfdGltZW91dF93b3JrKCkNCj4gPiAJCQlydG5sX2xvY2soKQ0KPiA+IAkJ
CS8vIFRoaXMgaXMgcG9zc2libGUgdG8gY2F1c2UgYSBkZWFkbG9jaw0KPiA+DQo+ID4gQW5kLCBp
ZiBydG5sX3RyeWxvY2soKSBmYWlscyBhbmQgdGhlIG5ldGlmIGlzIHN0aWxsIHJ1bm5pbmcsDQo+
ID4gcmVzY2hlZHVsaW5nIHRoZSB3b3JrIHdpdGggMSBtc2VjIGRlbGF5ZWQuIFNvLCB1c2luZw0K
PiA+IHNjaGVkdWxlX2RlbGF5ZWRfd29yaygpIGluc3RlYWQgb2Ygc2NoZWR1bGVfd29yaygpLg0K
PiA+DQo+ID4gRml4ZXM6IGMxNTY2MzNmMTM1MyAoIlJlbmVzYXMgRXRoZXJuZXQgQVZCIGRyaXZl
ciBwcm9wZXIiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhp
cm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogU2VyZ2V5IFNodHls
eW92IDxzLnNodHlseW92QG9tcC5ydT4NCj4gDQo+ICAgIEhtLCBJIGhhdmVuJ3QgcmV2aWV3ZWQg
dGhpcyB2ZXJzaW9uLi4uIDotKQ0KDQpPb3BzLCBJIHNob3VsZCBoYXZlIGRyb3BwZWQgdGhlIHRh
Zy4uLg0KDQo+ID4gUmV2aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8aG9ybXNAa2VybmVsLm9yZz4N
Cj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9y
YXZiLmggYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmIuaA0KPiA+IGluZGV4IGUw
ZjgyNzZjZmZlZC4uZTliYjhlZTNiYTJkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3JlbmVzYXMvcmF2Yi5oDQo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yYXZiLmgNCj4gPiBAQCAtMTA4MSw3ICsxMDgxLDcgQEAgc3RydWN0IHJhdmJfcHJpdmF0
ZSB7DQo+ID4gIAl1MzIgY3VyX3R4W05VTV9UWF9RVUVVRV07DQo+ID4gIAl1MzIgZGlydHlfdHhb
TlVNX1RYX1FVRVVFXTsNCj4gPiAgCXN0cnVjdCBuYXBpX3N0cnVjdCBuYXBpW05VTV9SWF9RVUVV
RV07DQo+ID4gLQlzdHJ1Y3Qgd29ya19zdHJ1Y3Qgd29yazsNCj4gPiArCXN0cnVjdCBkZWxheWVk
X3dvcmsgd29yazsNCj4gDQo+ICAgIE5vdCBzdXJlIHRoaXMgaXMganVzdGlmaWVkLi4uDQo+ICAg
IFRoZW4gYWdhaW4sIHdoYXQgZG8gSSBrbm93IGFib3V0IHdvcmtxdWV1ZXM/IE5vdCBtdWNoLi4u
IDotKQ0KDQpJIHRob3VnaHQgdGhhdCB0aGUgc2NoZWR1bGVfd29yaygpIGNhbGxlZCB0aGUgd29y
ayBmdW5jdGlvbiBpbW1lZGlhdGVseS4NClNvLCBJIHRob3VnaHQgY2FsbCppbmcgdGhlIHNjaGVk
dWxlX3dvcmsoKSBmcm9tIHRoZSB3b3JrIGZ1bmN0aW9uIGNhdXNlZA0KZW5kbGVzcyBsb29wLiBI
b3dldmVyLCBpdCBpcyBub3QgdHJ1ZS4gVGhlIHNjaGVkdWxlX3dvcmsoKSBqdXN0IGluc2VydHMN
CmEgd29yayBxdWV1ZSwgYW5kIHRoZW4gdGhlIGtlcm5lbCBjYWxscyB0aGUgd29yayBmdW5jdGlv
biBsYXRlci4NCg0KU28sIGNoYW5naW5nIGZyb20gd29ya19zdHJ1Y3QgdG8gZGVsYXllZF93b3Jr
IGlzIG5vdCBuZWVkZWQgZm9yIGZpeGluZw0KdGhpcyBpc3N1ZSwgSSB0aGluayBub3cuIEhvd2V2
ZXIsIEkgaGF2ZSBhbm90aGVyIGNvbmNlcm4gYWJvdXQgcmVzY2hlZHVsaW5nDQp0aGlzIHdvcmsg
Ynkgc2NoZWR1bGVfd29yaygpIGhlcmUgYmVjYXVzZSBpdCdzIHBvc3NpYmxlIHRvIGNhdXNlIGhp
Z2ggQ1BVIGxvYWQNCndoaWxlIHRoZSBydG5sX2xvY2soKSBpcyBoZWxkLiBTbywgSSB0aGluayB3
ZSBzaG91bGQgY2FsbCBhIHNsZWVwIGZ1bmN0aW9uDQpsaWtlIHVzbGVlcF9yYW5nZSgxMDAwLCAy
MDAwKSBmb3IgaW5zdGFuY2UgYmVmb3JlIHNjaGVkdWxlX3dvcmsoKS4NCkJ1dCwgd2hhdCBkbyB5
b3UgdGhpbms/DQoNCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvcmVuZXNhcy9yYXZiX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2
Yl9tYWluLmMNCj4gPiBpbmRleCBjNzBjZmY4MGNjOTkuLmNhN2RiOGE1YjQxMiAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jDQo+ID4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiA+IEBAIC0xODYz
LDE3ICsxODYzLDI0IEBAIHN0YXRpYyB2b2lkIHJhdmJfdHhfdGltZW91dChzdHJ1Y3QgbmV0X2Rl
dmljZSAqbmRldiwgdW5zaWduZWQgaW50IHR4cXVldWUpDQo+ID4gIAkvKiB0eF9lcnJvcnMgY291
bnQgdXAgKi8NCj4gPiAgCW5kZXYtPnN0YXRzLnR4X2Vycm9ycysrOw0KPiA+DQo+ID4gLQlzY2hl
ZHVsZV93b3JrKCZwcml2LT53b3JrKTsNCj4gPiArCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmcHJp
di0+d29yaywgMCk7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCByYXZiX3R4X3RpbWVv
dXRfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gIHsNCj4gPiAtCXN0cnVjdCBy
YXZiX3ByaXZhdGUgKnByaXYgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IHJhdmJfcHJpdmF0
ZSwNCj4gPiArCXN0cnVjdCBkZWxheWVkX3dvcmsgKmR3b3JrID0gdG9fZGVsYXllZF93b3JrKHdv
cmspOw0KPiA+ICsJc3RydWN0IHJhdmJfcHJpdmF0ZSAqcHJpdiA9IGNvbnRhaW5lcl9vZihkd29y
aywgc3RydWN0IHJhdmJfcHJpdmF0ZSwNCj4gPiAgCQkJCQkJIHdvcmspOw0KPiA+ICAJY29uc3Qg
c3RydWN0IHJhdmJfaHdfaW5mbyAqaW5mbyA9IHByaXYtPmluZm87DQo+ID4gIAlzdHJ1Y3QgbmV0
X2RldmljZSAqbmRldiA9IHByaXYtPm5kZXY7DQo+ID4gIAlpbnQgZXJyb3I7DQo+ID4NCj4gPiAr
CWlmICghcnRubF90cnlsb2NrKCkpIHsNCj4gPiArCQlpZiAobmV0aWZfcnVubmluZyhuZGV2KSkN
Cj4gPiArCQkJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZwcml2LT53b3JrLCBtc2Vjc190b19qaWZm
aWVzKDEwKSk7DQo+IA0KPiAgICBUaGUgZGVsYXkgaXMgcmF0aGVyIGFyYml0cmFyeS4gV2h5IG5v
dCBlLmcuIDEgbXM/DQoNCkkgdGhpbmsgdGhhdCAxIG1zIGlzIGVub3VnaC4NCg0KQmVzdCByZWdh
cmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBbLi4uXQ0KPiANCj4gTUJSLCBTZXJnZXkNCg==
