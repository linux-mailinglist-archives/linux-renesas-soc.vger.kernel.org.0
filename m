Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4219274DBE2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jul 2023 19:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjGJRE2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jul 2023 13:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbjGJRE0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 13:04:26 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2137.outbound.protection.outlook.com [40.107.113.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 822A8C0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 10:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUoU9Wgsv9kLYstXaX8ZD1M8XskEqA9PryJPsjKWqCEl+4Ev3L+SK20ZoEebHHriBEKIv1a/ad8FobEtixmoX+L1akQg5Eqj+lCW12uBPMpQEROWhRNVlSKMjiKIHfx/uuoROSIMWfTfm78EXETO7Qty0cq6Ugli5D5lwrnars3NFa5tGcS2Eeeqatu0nYbzv1bBglPDombkrR+dQ77x1RS/O5NHF4w0wznwdWZuM3uXFyOlu2fDiqJhZSel6LZJbQkZoUqMSk36yuDuv6JNM8cTfOttIpuegyKAH96RWz+dIlFlwc+NnJeuORCI7+vCHwdA9k8xkT+Rd6HWT7IpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQliAJACS+aOfx8nol2Qekt5cf/GFL5mfyTJgImeack=;
 b=dRFjXCt29h+OKjubyMk0gqDQcQJKjv1Uzx81JgEUEkAQj8ENG4slUYeIpawPM2gLB1j6KCmRlIILJ1a7uUa1W0VRN2tGj049xZ3XySSnI32DV6sBry+XD94yFYKMzKP13PJQdWztmqDh5XWCSJKJLlheeRcF1U29F/6EULa8SC8sqbrfHY9RbF+sV8WWZMSEgKDcotpu9sWxwDPlbV4rarcrHm+48cypNQ7JNLqAx3i/B/MVcGZZS2SaO2aRBxCqWSk9KaRwXAP/W7Q06T3xgRwmPU9/ofw1IkwtFh37wG2W2OgW7b/QX1H7ym0JCzfY4jm3WDo7jTCJKnIe7i7SSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQliAJACS+aOfx8nol2Qekt5cf/GFL5mfyTJgImeack=;
 b=MQc0XouBf11XE7UOKtOLa8f+f3H2BPDpp8dVMuLkOOWh2oHXJsnXeW/aDZfHM13LFTtUPLQWG8RqJugO4tjQGJ4a28hLVWSMET6xTauVwuCoOTgslCNcmCUATZCu7RG+f70KjGmbDJ8KaV5T/Tfw7OuYMqWJ4VDV7uAbxab4Xlw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11980.jpnprd01.prod.outlook.com (2603:1096:400:3fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 17:04:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::de3f:f3ca:8629:c80d]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::de3f:f3ca:8629:c80d%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 17:04:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Lee Jones <lee@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mfd: Add module build support for RZ/G2L MTU3a
Thread-Topic: [PATCH] mfd: Add module build support for RZ/G2L MTU3a
Thread-Index: AQHZrbGaW+H7hOR+m0Khw/bU1YpnDq+rEIeAgAg0y0A=
Date:   Mon, 10 Jul 2023 17:04:21 +0000
Message-ID: <OS0PR01MB5922850408798D653B1ABE938630A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230703132343.353878-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWj1PTx3Fp=Wn0h+0hHRFRaTKCre=VMvCFCq=BE+HBE5Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWj1PTx3Fp=Wn0h+0hHRFRaTKCre=VMvCFCq=BE+HBE5Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11980:EE_
x-ms-office365-filtering-correlation-id: 5d22376a-30ac-495c-a538-08db8167b49e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +uKVo8rSTDURm9w7dhQXbFk63MQ6d1VsnjKpMUJg6goWefhm0vpFQrz//iFgfxFk7jNbJiB5refkDUu275HtsSX37W6vNITJ4+vIimdenAsF71P0NblK1BEcmuiJxCHlNiafs93IC24DBYlQ2qhQz5LZFxCP3dnK7UwrPLiQ/mVwhl0pLw3kRhJGSoW/LminZ53JcuicC5f+p5dprbXq6yCV0Qh2I/54S4ip1Hx2mgHScpr/0IbHOReqLWr14PsVJSMdZjyXeipKn5y917R/AIrmB2cFfjNkRSl65B14MuSwjnpSJN5EpX5rXRaRdCDQnMJhsFLUFoy6dEYIwphdpw08bj8RyBs1YtdFY1ZCkgSnyJw3Q74/Ru2ZvXSmp3on/SGyvcJpMj5sh4O5YlgPFjGRbMdbNNHs5cBbmk1c+2iSLFdhYWyIqLp76OqsXwiDJHL3MkXcvSzB4OTPLcT1jL58cE2msU/PiyIu2Fbr+piGhdFs1/cXDrEaQGXyBKdSPJHiyiiKWHdOp/7xx/fWQWICEh0DX1v+FqSIixE7TCGEblQPoNIylYInkzBv7N96YQivTwb4IgxoTJmOuOtaE9YqP8kV31+Y3yAGv6veKRmIeaXw2XKdNNMsC3SmFktrJCr1HvlAQ5fVJQkmochjuw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(186003)(6506007)(53546011)(9686003)(83380400001)(41300700001)(4326008)(6916009)(64756008)(66446008)(66556008)(316002)(2906002)(52536014)(5660300002)(66476007)(8676002)(478600001)(66946007)(8936002)(7696005)(54906003)(76116006)(55016003)(71200400001)(33656002)(122000001)(38100700002)(86362001)(38070700005)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFNHTmNabVIvdm51Z1ZDS0hFK0VGSjUyTG5QMG9NakhjQWFobng4NnMrSHVF?=
 =?utf-8?B?SnBZdDUyU2xmc2g0Qm5iQW5QSXZuVlhMakw2bWJIUDhqTCt1c0psYUhza003?=
 =?utf-8?B?a2NKc2N3WXdiK0tlQzZGdm9WZlN6YmIxaVY0czZObHdoTERXdSt6Wmx1TnBh?=
 =?utf-8?B?TEJpK2xrNzZTWk5vMThqSTYyNFkwdEFaMWtjNFJmbXVCbm50RDNtdEpsUG5l?=
 =?utf-8?B?ZGoyOXF0RloyaDdCeEFNd21ldjFneFkySytJRXg1RHhkckRySDJ5ejZCTWFu?=
 =?utf-8?B?dStTWDdnSjhta1JDMDdPNWhrc1NZWnJwZFNTUmowV29vYTVKQy8xaElDWWN2?=
 =?utf-8?B?YnoyeUR1S1dlNmN4cFViSlErazQ2OC9tL0cvT1lxSXk4VjFScDBYb0pFU1hN?=
 =?utf-8?B?d21nYUUwSU4rT3huREFSd1JlZjl6TEF1TjVSeUFOQjgxMUthR2x1RWk0NGxC?=
 =?utf-8?B?S1Nzd0RQZUM0cisrcWNtNzNlSS9NQ2plSG5waXBRS2JMSWJ4R0lGUGdPRUFu?=
 =?utf-8?B?bVJxNmxidEFzalJMWHJSOS9hYTRSRFZGcEd0ZzFvNWRZRlVoOCtRZmRybjUy?=
 =?utf-8?B?ZzRqcVhEZVF6Q3F6TTJ1TkYvR3BTMkxKT0pjcUh0UFY2bWJIL3Vxa3hQZWQw?=
 =?utf-8?B?L1ZsODNLbXZzQXJJUFZHcEQ5UnJRTHVDZnZoL24raTdrUjFldDQ0RTBTLy82?=
 =?utf-8?B?cU1vVExQMzJlOG83T3JnOWdjK1NKNWJUOFVueVdiZkJmWjdNNG5OMGdSS1FU?=
 =?utf-8?B?NG1XL2JuUDBXQW9JVTJUbFp5YzBZSkdIcGhZOThnV2lXNXBYTEMzY3hqdldW?=
 =?utf-8?B?d1c5RUg2QnovRXpOb3VrS3R2YzgzUkJGSGVoaFJGOFJ3MlhpVzVHQVJwak9V?=
 =?utf-8?B?QlpGeEx5dDMzOS9JRzR3eGUySFBhcmMzMGRFRExucXJWZjM4ZVA5MUN6WG81?=
 =?utf-8?B?RHpZSFhqNnBWK1NEaWdyRWRBK1hUNnNLVjdLU1NBdmdndEdxUThWNnFKRSsz?=
 =?utf-8?B?SGdWOHdIb1FVQ05VUGVrYzJ0NVA3WG01UDVNWWtlcy8xSGFZN2hKbFZtK0N6?=
 =?utf-8?B?K05DOVBmSFZ4enAxNzN3WkJCWTRJTzF2dXNhMlFuVkZWbmx4QlhwZUVkclR6?=
 =?utf-8?B?cUlNWHc5TEw1MlpIMWtuRERrRkd0aUVqWkVaUjY0R1BEdFZKZkw2WnhoMzBp?=
 =?utf-8?B?cEg2RXIvSTNUcC9ETnBUOWIzYjdQYk1EalNWYnlvdUQ2QzRJSWMrU1l4TmdK?=
 =?utf-8?B?Y0QwL3VTYS9Sa0dXSUN3UGJZUEJlb0ZwajdoTFNSWEl4VCt1MDdtUHJvSXlD?=
 =?utf-8?B?NnQ2eVBKMFViL00zbForeWF3Mjl6d25EUUN6NXJGaVIwSldsRDFDY3crTjF1?=
 =?utf-8?B?c0pLWG8vOHU0V0JGRzgra29xWGRoR2NGblJxMVNFVExjUlgxYUhiMmtySzBx?=
 =?utf-8?B?bldSQko2WWh1ak5WR3RaQjJJb1M2T1ZtMW94MmYrOUNob3l1MmhDeEo4NjVM?=
 =?utf-8?B?bUdnakY0ek9Vd1Q4bnhvUnRRWkFiVGVoaFhZVkEvKzlhd1VmVHpWSHN6b3Ay?=
 =?utf-8?B?emo4SmdjTkhxVWF6K3hmR2Z0ZHZLWUdQb0NNUlFHeGdqNjVuOVFXWE95YitD?=
 =?utf-8?B?ZkRPOU10UmZWczhqRjhVamc2cWFNZGYwTkZhZmx6QVRLRnhSaWNCOTduaGZX?=
 =?utf-8?B?YkZBL2NEU2VpQlZMS2hCd0JqeWY1YU9mZCtpVUl3SEU5NlZWOVNVV1VXNTV5?=
 =?utf-8?B?dDlWTzJMVTNKYXBmSzV1aGNJM0VITE1tb1dPQzFpM0lmTzhIUkkzNW9SNW1Q?=
 =?utf-8?B?YkxRZXhYeTFSeGpLRDdzMk8wNnc3bE1zR1RwSS9kWnNBRVJaNDFWdlZuNC9R?=
 =?utf-8?B?SVllcElCZDU5YWVaWDVXcDFJdG5lN3dlSFM2eEl5b2p1aFF2M1g5cEc3WmlU?=
 =?utf-8?B?dHE4ak05VzYrbUhiMjVUTWxRem4vKzc0d2ZLQ1RIMUxLSVBKNmNYM09UZmRj?=
 =?utf-8?B?VEdsejBPbjYrMVlMSWlJTUxyMTBzZThaSElUV3BCWVV5b05GTFVWQlBKcjdx?=
 =?utf-8?B?L1B6TGk5U003Tndoak41Q1NwSkt5WjlCRUJ1MGtMYUxrYUlidzdscUwyU1du?=
 =?utf-8?Q?a38s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d22376a-30ac-495c-a538-08db8167b49e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 17:04:21.4588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FY7cefexbvyNoi9TNgVdJbpA7M/l3GI07ESAcv1vTzI+6q4tmkqJl+zKmrQRRET0Dwa/zlpHRtBC7FKMiMDLo6jLgWvRaSDZInJm4F9DgrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11980
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSA1LCAyMDIzIDEyOjQ0IFBNDQo+IFRvOiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBMZWUgSm9uZXMgPGxl
ZUBrZXJuZWwub3JnPjsgUHJhYmhha2FyIE1haGFkZXYgTGFkDQo+IDxwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20+OyBsaW51eC1yZW5lc2FzLQ0KPiBzb2NAdmdlci5rZXJu
ZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIG1mZDogQWRkIG1vZHVsZSBidWlsZCBzdXBw
b3J0IGZvciBSWi9HMkwgTVRVM2ENCj4gDQo+IE9uIE1vbiwgSnVsIDMsIDIwMjMgYXQgMzoyM+KA
r1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4g
TW9kaWZpZWQgS2NvbmZpZyB0byBlbmFibGUgbW9kdWxlIGJ1aWxkIHN1cHBvcnQgZm9yIFJaL0cy
TCBNVFUzYQ0KPiBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBBcyBkcml2ZXJzL21mZC9yei1tdHUzLmMg
YWxyZWFkeSBoYXMgdGhlIG5lZWRlZCBNT0RVTEVfKigpIGxpbmVzOg0KPiANCj4gZHJpdmVycy9t
ZmQvcnotbXR1My5jOk1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHJ6X210dTNfb2ZfbWF0Y2gpOw0K
PiBkcml2ZXJzL21mZC9yei1tdHUzLmM6TU9EVUxFX0FVVEhPUigiQmlqdSBEYXMNCj4gPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPiIpOyBkcml2ZXJzL21mZC9yei0NCj4gbXR1My5jOk1PRFVM
RV9ERVNDUklQVElPTigiUmVuZXNhcyBSWi9HMkwgTVRVM2EgQ29yZSBEcml2ZXIiKTsNCj4gZHJp
dmVycy9tZmQvcnotbXR1My5jOk1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCg0KWW91IG1lYW4sIEkg
bWlzc2VkIGFkZGluZyBsaW51eC9tb2R1bGUuaCBhcyBJIGdvdCBjb21waWxhdGlvbiBlcnJvcg0K
V2hpbGUgYmFja3BvcnRpbmcgdG8gNS4xMCBjaXAga2VybmVsPw0KDQpDaGVlcnMsDQpCaWp1DQoN
Cj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4g
DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
