Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55AE87B16D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 11:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjI1JGp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Sep 2023 05:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbjI1JGo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 05:06:44 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA93AC;
        Thu, 28 Sep 2023 02:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqMRWg4Vpxh3yzz6HH4YNV1eOTcol4rJ3J4T/1gHG+n4SIj7KC9+QzpH5vuIiOEEcQsDkPSaXBUrI8mI1jauWm/T81EswqRNxdPQVjAMH0NjmN5ClAD25cqMFL3sdKM7xYsUJjsWEJ1ZbE0s5/2Zji8KU7YMefWfMS3Ho46ls0FeKpigNxpQz7NlVRBRyILq75+D9f1GUQJH8iAscaSQIHTjtakWh7WjaErjZWu96ep6vkh4M5VBVrbLNfKL0HtBplJX6vSWqZ/t9QYDGaGNW57iUzGx0hs8TAabbnK+C3IMYpQTE20a9MidyW53s43ejUX34Jye4/sF6QUOithb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5MrB+WYO2v78ZDFke+T94VGmV8BglEU7TU62t/KQt4=;
 b=HN18Ir9aD+jXw7Vo9F9M8T1cueatSGb6i2k8C5Q81/FAKD222FO0jEoDrRfR6OSK6Zd+AC21UgXpGuoSD+oLSdJo00d/nXGdKoCzrNXA9F+eKsZ3ZZ2LZ35I3rGo6hVBL5v0pfqIb1dLK4guaPytYuMUrpGiAOe3CSX/7dTUIUgl3x/P2NG25i2osHxlvm+aKat/bXEHM7wRw3G66/Wy48LFPBmPsiR3C3MXcIxCumQHr99TXJ8FwJSthDhDAh33JWnwvVKlTL4cnv9c2wqHMPyJh3qeKcXj8BkztHO7kzJr6chnHTbYG1reGV2/UKBuFbBsu7YIFSMoY8utk26rvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5MrB+WYO2v78ZDFke+T94VGmV8BglEU7TU62t/KQt4=;
 b=kXZi775CwgP0P1JgocHyA67fCCTPxr8Z9mUVAPC8fSNbYRwGWiOQmFvXTI7KYjHo0O9wQAHTwsIoH8Mg4b304vC2CfaffnTKPanwcdPyUkeJjv0tfcGZkWMbP9Afm/kZwW9P5BdKaxFr4ox9EhVSZqt8v9LHpL5F+raKceEFc1I=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB8355.jpnprd01.prod.outlook.com
 (2603:1096:604:16d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 09:06:37 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 09:06:37 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Lunn <andrew@lunn.ch>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH net v3] rswitch: Fix PHY station management clock setting
Thread-Topic: [PATCH net v3] rswitch: Fix PHY station management clock setting
Thread-Index: AQHZ8HVQ3VCH2935SU+nC4wlSYXzu7Aun5cAgADdkECAAF3vAIAAGH6Q
Date:   Thu, 28 Sep 2023 09:06:37 +0000
Message-ID: <TYBPR01MB5341C90E6D8967F06BB41B63D8C1A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230926123054.3976752-1-yoshihiro.shimoda.uh@renesas.com>
 <c88ebcd5-614d-41ce-9f13-bc3c0e4920d7@lunn.ch>
 <TYBPR01MB5341BA14DCF0BEEFBBED95D0D8C1A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdW+f_XJNFBDOkVN06NQ93vBgd4yYSQ00APX9imasHnSiw@mail.gmail.com>
In-Reply-To: <CAMuHMdW+f_XJNFBDOkVN06NQ93vBgd4yYSQ00APX9imasHnSiw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSZPR01MB8355:EE_
x-ms-office365-filtering-correlation-id: ad2a0d2f-3876-4722-2d34-08dbc002385b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xQAFEv9EUxdEuuCQ+Rz0XMg/tCK91tdlQYusJ7kIwPRe4Ppn2ipWLtHU0muxvoydKNL+LFCgzJVgPbxJ/4LNv38hDwdJfb/mRcLR/44vNX6R4uaT4HzEgt4eOeyQZbcg3l5ztJ8DIgdl+im144rQ77Ltm4mjwd/q5pcPrkvDpcRWfMs1/s8eWU9Zrq1QcigE4y7QTgg9hyf62kj2cp6X/kV+5tFvil9qpnZvVP9Rq9NF5EcyMvDF9/lDnniu4jLwIHY0GB9rDy/FKskaSpaq5aZIHs/Ek+09S0A06eVGDEydynbbn66OpQPguezFS2BY63Cnm0kvYn5/9FBEVbEupcfvz9DMzDpGunP/AIkk98+HrkjX3EHSp5cXmuhUioS9ZNcgmWyywc0XW1Tgsp4TEg5OZCKlroBV3xAQJnmPuAId/S+BCojq/qYFrmYMfdUE0AJvwjqTTPXWIo1YEK3FFmuRAvneD/rnq5dG4BF308CF0IA1hiZ/jpESK8tj4AnHgpw8bnDSDqkHqo/E3DSTBCOijcbVbvXGApPMlRxTN6iNEu4DanzMb+TQ/3Kbi9Mm3O4GJRLt7yzGc8p/x/ZCZhm7JaKZoVyACgT9dcxqfElUMarj7MsLpSJuHqcyP3mJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(122000001)(38070700005)(38100700002)(33656002)(86362001)(66946007)(316002)(55016003)(71200400001)(7696005)(9686003)(53546011)(66446008)(52536014)(110136005)(41300700001)(66476007)(76116006)(54906003)(64756008)(478600001)(6506007)(5660300002)(8676002)(83380400001)(107886003)(2906002)(4326008)(8936002)(26005)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGJ1eFJtR1pkUDRDRWUrdXhpNjlTVHpLVEM0dTNUbE5DVkQ3d1RoenlSVU0x?=
 =?utf-8?B?WE9pcG1QWlhNZDBVak9Mc0o2NDBWS0ZucWxodEI2T0w3QlVRYlJqa2dkMDJp?=
 =?utf-8?B?eXZXTXRiYUdvKzdHWVlnT243VDJja2NTK1VwbzFsV2RzV2UybDVkUHV1N0tW?=
 =?utf-8?B?enI1T1dWbkgvOGhHNkVONXlkQXRMZjZRMHB2SVMyWEVuTUEwb2M1UnB2Y3pp?=
 =?utf-8?B?bi9odVl2QVM2N1BUenBwTlBob1J4OUpVWDZLM0lrTGxMamlFaUtKWGJXaUp1?=
 =?utf-8?B?cWM4WVhrRGV0TWNCTkkvTjBqK2tXRWxVbEVuL1NSRUl1aGVDbTRieVp0VjFJ?=
 =?utf-8?B?SWJ0R1EvUnhrcXArNE1lNitsWUsxUmRQWFdUQTVPSzA0dVBQR3IwOVRoUkcy?=
 =?utf-8?B?Zkp3N0hvQXl1NWUwQ0l2NlJpNGJwR1cySkZiTVMyazduZjVMV0ROalBOcHhI?=
 =?utf-8?B?NVFJcEJqK3g0bEpFRFJJbzN1YlVKQUhFdUk0b01LaXZpa3VadHR6MlpXdUFF?=
 =?utf-8?B?dEQrZEl2NStrOWRUbHJpNjc2NWx6MlVqUzJCNVZIbnhrL2ZjbFFwZ3Z5S2Ni?=
 =?utf-8?B?Nm1kZGdXZDRRVEdtOHdPL0ZmSWlJSVV0aWFaRHlJUkQ4SEJKdTZ1S1BBN2ZQ?=
 =?utf-8?B?T05YNnhwd2NEWWFMd2xodTJEWUZZc01EL3ZXWGZZRm5KTHdPU1JCWFRpNFFi?=
 =?utf-8?B?dFhLWlp4ckFUMWI1Q1JkRk9FSzFCVHp3N29VOXBOM1lxbndTYjdxWWxxVWVU?=
 =?utf-8?B?S05zK3ZnRHV3bUZjc0VjV0lvS2xoVXlCcExYcHFLSER2RTNMdmtYVFhXZEM3?=
 =?utf-8?B?RVpad2lOUmhsSEVsRUVaWndXOFVwMGlKUnE0eCs5aTU2WWxiSXhyZFV0MXJv?=
 =?utf-8?B?aEovWG9ISUFUS1F0MFlOMURyNUMrekNaZUUzcEh5MG9qQk14aDhCWUFXd1BD?=
 =?utf-8?B?aFRUazk1WVFBaDlhL09seEZYYW0wdFNaOVlTYkgrVzBsci9tY3YwckpIaDFv?=
 =?utf-8?B?MEcxV2orRm1wSXhiajhIeHdOWDhVb3hHY1hSb092V28wYjFBRVZCdERTY2tM?=
 =?utf-8?B?eCtEU1ZqUEY0UmxSdDdzMGY5clkrMlRHaC9DdkJpUVlzUDg1NU5FdkliTVlu?=
 =?utf-8?B?c1k5bG5aaHpxTU50MXRCaHp1QjRSWFM5WWZoc0NGWjdtVHVUelRMRGdVdFA3?=
 =?utf-8?B?OXJZNUlWV0xsVWZnWXp3anlIdkFhK0dHK0tCNysyUVJ2Y3ZvSXBhNlNnOEcr?=
 =?utf-8?B?WS84UzJNOHlOZVdpRHQyNHBrSnZBMnF3VHlEZHNqRzlxazRyN0RGNVR5ZVJT?=
 =?utf-8?B?TUJhUWR4UHQ3ZlVUd21pK3FpZG1NNHozOTRBdGI5L21OWnl4N1JBU0tFRzJq?=
 =?utf-8?B?V1dPN3lja0taemw4UTcvdUZJNXZ3VUhXbjRUbTR2elZ1V0E1RXN2OHpWczRJ?=
 =?utf-8?B?Q1FseDVOVmJkVUc1Nmc3a21sSi9GUUxGQ0Jxb3BGWngwdndTa0tTU3o1Qno2?=
 =?utf-8?B?ektLQnFmQnc0YkplQ1hlVzN0M2IwaGdlL3ZONHljV2lPeUk5S29xcnJHUlVi?=
 =?utf-8?B?WWxlaXd6OU02K25sV1F4dzhmMGxQUVI4WmFBczBXamFyL1AxbFN4bUtXRVJp?=
 =?utf-8?B?YkxTQzRCM013Wmw0aXZodE1jb01hbUkxRk1sM1JhTXhIRUx2c1ZzUm5mb2pY?=
 =?utf-8?B?WUVBRlhQN3gxN0E2WC9HOGlXY01ndDRVN2tySUQweDVlL2Y0Tyt6VVlaaEhz?=
 =?utf-8?B?OXdSSzlodWU1bVRZc1I3SW9vc09PbFpSaXJWcTRKMFYxYkN5K0Q0NUdwVUg0?=
 =?utf-8?B?QWNEZEtsR0ZGaDkzeitmUGoxSW9NU3d3Q0hpMzJjWEI1NlBYUTFhT1J0L0JB?=
 =?utf-8?B?OC9nQXhkd3NwU2x2L2Rpa2FFS1A2Wnd5TXFjWVhjTEpyVHY3SUxadFM0T0tC?=
 =?utf-8?B?ekVpc2p3YlZ0Y3Q0d1RPTXAwZHFkSWNObkJ1OE5TWTNqUVVZSEk5RU43d2JM?=
 =?utf-8?B?aXBESXVDUmVyNDZKNEVRd0ZaaXp6enoyeGhTN3hFeTRkck1nQnlSY2h0OFMv?=
 =?utf-8?B?TUVvbVd6TnYzK2NWb2ZhWkhoTkNYZVVhTk1uZjFUcnpJZnFxb0Z0VE5mUWI5?=
 =?utf-8?B?L3gwbUxIYWNpM1RFcmY5U0ZyaU9mQmtHejhhTWJodmR0eXJsRGhpTUVGdkdi?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2a0d2f-3876-4722-2d34-08dbc002385b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 09:06:37.0551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0uxCQy6YivQR0E1reMStLOX3fZv4oFa8yEBj99D7GhhmMrw2RZZxKrgBlfO+FWfHuvY5MEVoI2CQIzV7UsUxZKfdu81nM2jUoodL2NIapB3lleozaXKh6IBRqTyrlAGv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8355
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIFNlcHRlbWJlciAyOCwgMjAyMyA0OjMzIFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4g
DQo+IE9uIFRodSwgU2VwIDI4LCAyMDIzIGF0IDQ6MTPigK9BTSBZb3NoaWhpcm8gU2hpbW9kYQ0K
PiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTog
QW5kcmV3IEx1bm4sIFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDI3LCAyMDIzIDk6NDQgUE0N
Cj4gPiA+ID4gKyAgIC8qIE1QSUMuUFNNQ1MgPSAoY2xrIFtNSHpdIC8gKE1EQyBmcmVxdWVuY3kg
W01Iel0gKiAyKSAtIDEuDQo+ID4gPiA+ICsgICAgKiBDYWxjdWxhdGluZyBQU01DUyB2YWx1ZSBh
cyBNREMgZnJlcXVlbmN5ID0gMi41TUh6LiBTbywgbXVsdGlwbHkNCj4gPiA+ID4gKyAgICAqIGJv
dGggdGhlIG51bWVyYXRvciBhbmQgdGhlIGRlbm9taW5hdG9yIGJ5IDEwLg0KPiA+ID4gPiArICAg
ICovDQo+ID4gPiA+ICsgICBldGhhLT5wc21jcyA9IGNsa19nZXRfcmF0ZShwcml2LT5jbGspIC8g
MTAwMDAwIC8gKDI1ICogMikgLSAxOw0KPiA+ID4gPiAgfQ0KPiA+ID4gPg0KPiA+ID4gPiAgc3Rh
dGljIGludCByc3dpdGNoX2RldmljZV9hbGxvYyhzdHJ1Y3QgcnN3aXRjaF9wcml2YXRlICpwcml2
LCBpbnQgaW5kZXgpDQo+ID4gPiA+IEBAIC0xOTAwLDYgKzE5MDcsMTAgQEAgc3RhdGljIGludCBy
ZW5lc2FzX2V0aF9zd19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4g
PiAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiA+ID4gICAgIHNwaW5fbG9ja19pbml0
KCZwcml2LT5sb2NrKTsNCj4gPiA+ID4NCj4gPiA+ID4gKyAgIHByaXYtPmNsayA9IGRldm1fY2xr
X2dldCgmcGRldi0+ZGV2LCBOVUxMKTsNCj4gPiA+ID4gKyAgIGlmIChJU19FUlIocHJpdi0+Y2xr
KSkNCj4gPiA+ID4gKyAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocHJpdi0+Y2xrKTsNCj4gPiA+
ID4gKw0KPiA+ID4NCj4gPiA+IC8qKg0KPiA+ID4gICogY2xrX2dldF9yYXRlIC0gb2J0YWluIHRo
ZSBjdXJyZW50IGNsb2NrIHJhdGUgKGluIEh6KSBmb3IgYSBjbG9jayBzb3VyY2UuDQo+ID4gPiAg
KiAgICAgICAgICAgICAgVGhpcyBpcyBvbmx5IHZhbGlkIG9uY2UgdGhlIGNsb2NrIHNvdXJjZSBo
YXMgYmVlbiBlbmFibGVkLg0KPiANCj4gV2hldGhlciBjbGtfZ2V0X3JhdGUoKSB3b3JrcyB3aGVu
IHRoZSBjbG9jayBpcyBzdGlsbCBkaXNhYmxlZCBhY3R1YWxseQ0KPiBkZXBlbmRzIG9uIHRoZSBj
bG9jayBkcml2ZXIgaW1wbGVtZW50YXRpb24vaGFyZHdhcmUuICBJdCdzIG5vdA0KPiBndWFyYW50
ZWVkLCBzbyBnZW5lcmljIGNvZGUgY2Fubm90IG1ha2UgdGhhdCBhc3N1bXB0aW9uLg0KPiBJdCBz
aG91bGQgd29yayBmaW5lIG9uIGFsbCBSZW5lc2FzIG9uLVNvQyBjbG9jayBnZW5lcmF0b3JzLg0K
DQpUaGFuayB5b3UgZm9yIHRoZSBpbmZvcm1hdGlvbiENCg0KPiA+ID4gICogQGNsazogY2xvY2sg
c291cmNlDQo+ID4gPiAgKi8NCj4gPiA+IHVuc2lnbmVkIGxvbmcgY2xrX2dldF9yYXRlKHN0cnVj
dCBjbGsgKmNsayk7DQo+ID4gPg0KPiA+ID4gSSBkb24ndCBzZWUgdGhlIGNsb2NrIGJlaW5nIGVu
YWJsZWQgYW55d2hlcmUuDQo+ID4NCj4gPiBTaW5jZSBHRU5QRF9GTEFHX1BNX0NMSyBpcyBzZXQg
aW4gdGhlIGRyaXZlcnMvcG1kb21haW4vcmVuZXNhcy9yY2FyLWdlbjQtc3lzYy5jLA0KPiA+IHBt
X3J1bnRpbWVfZ2V0X3N5bmMoKSB3aWxsIGVuYWJsZSB0aGUgY2xvY2suIFRoYXQncyB3aHkgdGhp
cyBjb2RlIHdvcmtzIGNvcnJlY3RseQ0KPiA+IHdpdGhvdXQgY2xrX2VuYWJsZSgpIGNhbGxpbmcu
DQo+ID4NCj4gPiA+IEFsc28sIGlzIHRoZSBjbG9jayBkb2N1bWVudGVkIGluIHRoZSBkZXZpY2Ug
dHJlZSBiaW5kaW5nPw0KPiA+DQo+ID4gWWVzLCBidXQgdGhpcyBpcyBhICJjbG9ja3MiIHByb3Bl
cnR5IG9ubHkgdGhvdWdoLiBJbiB0aGUgZHQtYmluZGluZ3MgZG9jOg0KPiA+IC0tLQ0KPiA+IGV4
YW1wbGVzOg0KPiA+IC4uLg0KPiA+ICAgICAgICAgY2xvY2tzID0gPCZjcGcgQ1BHX01PRCAxNTA1
PjsNCj4gPiAtLS0NCj4gPg0KPiA+IEFuZCwgaW4gdGhlIGRyaXZlcnMvY2xrL3JlbmVzYXMvcjhh
Nzc5ZjAtY3BnLW1zc3IuYzoNCj4gPiAtLS0NCj4gPiAgICAgICAgIERFRl9GSVhFRCgicnN3MiIs
ICAgICAgIFI4QTc3OUYwX0NMS19SU1cyLCAgICAgIENMS19QTEw1X0RJVjIsICA1LCAxKSwNCj4g
PiAuLi4NCj4gPiAgICAgICAgIERFRl9NT0QoInJzd2l0Y2gyIiwgICAgIDE1MDUsICAgUjhBNzc5
RjBfQ0xLX1JTVzIpLA0KPiA+IC0tLQ0KPiA+IFNvLCB0aGUgZGV2aWNlIHdpbGwgZ2V0IHRoZSBw
YXJhbmV0IGNsb2NrICIgUjhBNzc5RjBfQ0xLX1JTVzIiLg0KPiA+IEFuZCBhY2NvcmRpbmcgdG8g
dGhlIGNsa19zdW1tYXJ5IGluIHRoZSBkZWJ1Z2ZzOg0KPiA+IC0tLQ0KPiA+ICMgZ3JlcCByc3cg
L3N5cy9rZXJuZWwvZGVidWcvY2xrL2Nsa19zdW1tYXJ5DQo+ID4gICAgICAgICAgICAgIHJzdzIg
ICAgICAgICAgICAgICAgICAgICAxICAgICAgICAxICAgICAgICAwICAgMzIwMDAwMDAwICAgICAg
ICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KPiA+ICAgICAgICAgICAgICAgICByc3dpdGNo
MiAgICAgICAgICAgICAgMSAgICAgICAgMSAgICAgICAgMCAgIDMyMDAwMDAwMCAgICAgICAgICAw
ICAgICAwICA1MDAwMCAgICAgICAgIFkNCj4gPiAtLS0NCj4gPg0KPiA+IEkgZm91bmQgdGhhdCBp
MmMtcmNhci5jIGFuZCBwd20tcmNhci5jIGFyZSBhbHNvIHRoZSBzYW1lIGltcGxlbWVudGF0aW9u
DQo+ID4gd2hpY2ggY2FsbCBjbGtfZ2V0X3JhdGUoKSB3aXRob3V0IGNsa19lbmFibGUoKS4gQnV0
LCBwZXJoYXBzLCB3ZSBzaG91bGQgZW5hYmxlDQo+ID4gdGhlIGNsb2NrIGJ5IGNsayBBUEk/DQo+
ID4NCj4gPiBUbyBHZWVydC1zYW4sIGRvIHlvdSBoYXZlIGFueSBvcGluaW9uPw0KPiANCj4gQXMg
dGhlIGRldmljZSBpcyBwYXJ0IG9mIGEgY2xvY2sgZG9tYWluLCB0aGUgY2xvY2sgaXMgbWFuYWdl
ZCB0aHJvdWdoDQo+IFJ1bnRpbWUgUE0sIGFuZCB0aGVyZSBpcyBubyBuZWVkIHRvIGVuYWJsZSBv
ciBkaXNhYmxlIG1hbnVhbGx5Lg0KPiBKdXN0IG1ha2Ugc3VyZSB0byBjYWxsIHBtX3J1bnRpbWVf
cmVzdW1lX2FuZF9nZXQoKSBiZWZvcmUgYWNjZXNzaW5nDQo+IGFueSByZWdpc3RlciBvZiB0aGUg
ZGV2aWNlLg0KPiANCj4gQ2FsbGluZyBjbGtfZ2V0X3JhdGUoKSBhdCBhbnkgdGltZSBpcyBmaW5l
Lg0KDQpJIGdvdCBpdC4gVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5IQ0KDQpUbyBBbmRyZXcsIEkg
YmVsaWV2ZSB0aGlzIHYzIHBhdGNoIGNhbiBiZSBhY2NlcHRhYmxlIGZvciB1cHN0cmVhbS4NCkJ1
dCwgd2hhdCBkbyB5b3UgdGhpbms/IFNob3VsZCBJIGFkZCBzb21lIGRlc2NyaXB0aW9uIHNvbWV3
aGVyZSBhYm91dCB0aGUgY2xvY2sgb2YNClJlbmVzYXMgU29DPw0KDQpCZXN0IHJlZ2FyZHMsDQpZ
b3NoaWhpcm8gU2hpbW9kYQ0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcN
Cj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFs
aXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
