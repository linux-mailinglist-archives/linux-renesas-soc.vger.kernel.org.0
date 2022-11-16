Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C70662B704
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 10:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbiKPJ4d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 04:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbiKPJ4b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 04:56:31 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4369118351;
        Wed, 16 Nov 2022 01:56:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcvbD5zymsudelhBoKVNtuazUEbH5/RkuLeUvGB/CumwlnG37zKAq2P4d5CCUZ/mlkGGJnK06MP8xbgRq65iNmeXdzi+3qGEflBtRcm9OEd+DmTQ+kBs/iCofBlJIZYiuu4tC6zrHr0VtdCR2wVkAvzF/qQaRKWM+Ob9pSf920QefO1efYFjtK0GcL5fpIgoQNCgfExgb+ULTtbWurv1vGGKFipHw+oTjyd5xzUOuJeMt3ExqpN244TA2wuGFdsNuooqd9Ca2UPmo6Uebp75RdkLYTem7ydhLotLOBLv8zjPVD5ZcQwGURujhmEqpFqYxmRciLoBq3xd3Xw2nQzxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u575Cunu4Fhu4U4zzxibjc5CL+Rwa0LkxL41XHzQgy4=;
 b=LCSmuBmrgCalNhOw96j296VwzqivAK7ioBlusunOtJYEwSDfdrn+ZRGipswM9+RuAd05ffrpJLZ2Km2YgZQGvv/5jBwlvZVecmKLkdtm9dJ/Lo0PkhOpxW7MN419c9jEl1T6koieG+8IMBJSDy5N8QzuwUiZ7+I2PwpolMhaep9a77q8G0bQp4Ix1k0GgsSva126zwbw218Y2xaz9W9PfhTU1bXNPDIA0vadwA78JcbhHvy/4SWx+ytTyCqDZUC86MJid9EXM8G/nUqr+iIIG1qDE6+knyFBYSgsNvMJoLy45PIq4KWKM1Is6w/N9bZi8egF7171WBsxMYb/1VtaNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u575Cunu4Fhu4U4zzxibjc5CL+Rwa0LkxL41XHzQgy4=;
 b=YFiw5+lJjDHuadW07ZzpH/5Rm4h7n9zyZvpRPO7fPCwJ37zmBmo8W0FnncVb0Dl9jpA3zWMwZQpWHUcCnS1SPHfAym7lZZcTrNc+vXxraBgrpu/rK1X1nSOk26VhYPFKw+27XTV+pzt1AKboyfVLpPkB7gbcsEHztYrHOhSvSbg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6031.jpnprd01.prod.outlook.com (2603:1096:400:4c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 09:56:25 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 09:56:25 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v3 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Thread-Topic: [PATCH v3 1/3] dt-bindings: arm: renesas: Document Renesas
 RZ/V2M System Configuration
Thread-Index: AQHY+O8vAwTDQ9Y/OEClJtUrcUwIK65BTpkAgAACqFA=
Date:   Wed, 16 Nov 2022 09:56:25 +0000
Message-ID: <OS0PR01MB592229D1D85FBC6699924CD186079@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221115123827.736141-1-biju.das.jz@bp.renesas.com>
 <20221115123827.736141-2-biju.das.jz@bp.renesas.com>
 <2a1af80b-cb1a-6d87-689d-bed8ac53bff7@linaro.org>
In-Reply-To: <2a1af80b-cb1a-6d87-689d-bed8ac53bff7@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB6031:EE_
x-ms-office365-filtering-correlation-id: 09ccb9a5-9291-4f43-0426-08dac7b8d2e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YwNH8SRMUjKWCUNVjuIJGmVScWwOR8b9GyVvmMXRs0sHTQWuJ6vJvLrFV5iqRlnExeZaqiDi1fG9RT3OFzGhR3Mbze2mdBiMvUSKc4zVOherSMJlqLc89mOeJvkiRqq+yTwrHFJU1mLs0AR/Ie4QXWBY8p/bqskCUpxIW9TruU1OL9IHekgzrhhDI+nB7LciHNr6UA4uPlIcUdTKYyYCY5oSZ6vljO0XMpAxufcun5hID2+tfFJEDJlEwlUIYKOqoULWqVLe3b2iUWGKxTrbDoy8uI6McXPwZ5vhOd4FxXqY1xBciST42ye9n8K2V5hcxt4e9NkVBO8/VE0QAkB47xS+xCfSxWOiT1mQtZ4WWBR0vlAWTCszhSO5f00Wyngt/NXfa8uvr6ZlGa5HZd/Tc5HNpTW30QWLPkRAeWL3QqXdnB94kYTWmZFTRXFvKy2pC3k4NR7yn7+7i8wOwgJDaTtX5HzmEBATaLOT49OnXJhRa/Kar+YSDvvBWHKzKdJcTioKZ1ak9JXyXCzO6JxiS+Ly2+AQIOhK+NvK1t45YoH5wgqG0+dGsariglhW62D7Sg00VID8mNfUF81FFrOmq+/lOCiT6nCYCzsp3bJArh/F4CuU0QROn2TWTAk+TKbXomSyv0zmZvkTbk9o9BkRHRHHdm0x8zGAlDSre8yYzuT2w7MXBpCYLYADUHZ0bDZTS89I+wYHjGmwbC1q9D7pvtqzgRcJZzEy8EGveiU6INL4lDtj7Rd8FPM2PbTUsN10ybC/sYtFMBAb5Y2g7pw7Hw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199015)(33656002)(54906003)(86362001)(38070700005)(4744005)(6506007)(55016003)(5660300002)(2906002)(186003)(53546011)(9686003)(38100700002)(26005)(7696005)(122000001)(66946007)(66556008)(110136005)(71200400001)(66446008)(76116006)(107886003)(66476007)(4326008)(8936002)(8676002)(478600001)(52536014)(316002)(64756008)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkVFV0xKYS8ybVZyc3lPSVB6QnE1UmtaYTVrazc2d2J5VkQ2TzM2L2lOc2dC?=
 =?utf-8?B?aExpa0R3ZnIrUlRyVGcxYXRZR3Z2Z1dVNEhuRW5Qd1g3T3k3aGpEWU1HanQ5?=
 =?utf-8?B?RkRIZEY3c3ZNdTMzN1pJWTc2UVdoTlZqWTJWVWErUnRLSzVVRXNaZVBzQWFI?=
 =?utf-8?B?UlFlcTVxcHVlZmNtdXRJUUZaU2Jkc080N0pHOHp3ckxKQmZITGhxZnFTdzBG?=
 =?utf-8?B?QUNCM05rQzVUbkhBNWdKRUlTNmc4ZjJVeWFuNlQxNER0SXpNb3lPY2ErQWlE?=
 =?utf-8?B?TStsV3p1TGxaR25QTzBqVlJnTGNYakZsNFo5UThEN210alNXYXVvaTIyb1lT?=
 =?utf-8?B?Zkk3bkdETU15RlZjTndUcGJxZVUwZklxNU02azFWUlRKQTljdUFoWXdhOGhR?=
 =?utf-8?B?RjY5aVZzT3prSlRsUHg4RmxSMWk4SDRZRDQ4a2pkV3M5VlExUytiU056RThD?=
 =?utf-8?B?aE01KzFkeVh1L2t4ejhLSmEreWErRlZGczlwWmhreUJUZWRkZkRPOE50d1h6?=
 =?utf-8?B?MVJYRmM3TzB5L0wya1BLa1RUZFUvbXBVV0xtTkRPL2U0SDUrWW16WHdRY0JD?=
 =?utf-8?B?dE1xYjBOZUxtTm5XeU1iZGNHQ0FOcGVoVzRhUEVoMUpPWWRsdVN4bGVFaGpq?=
 =?utf-8?B?UmVrTXl5emNYMXAzYkV2LzdUZXNvSFI4ODd1RHhHNW1jSjYzLzB4bzcvYkt6?=
 =?utf-8?B?ZVppUFZJcm5QZGl4QUF5S0VodmRsMWxkcWVMNGt3R1pJZW9uZXN3SDl2akxr?=
 =?utf-8?B?aktLMkcrWExFYkdnOFZhWWF5VElSKzUvU2szS21OdmpvODVTSGZZbGdHZzgw?=
 =?utf-8?B?Wk81c1VBZ25mQk5Yd2tWRS9ZVXFzMWFqcWVzNGExcWl4ZlNmcWRVM3pOVlJw?=
 =?utf-8?B?RlQ3TGFLbDgzWi9aejhCbVRWbHA2UHJ0eDdVUUF3YXhkSXpyRjQ1TGVzajJE?=
 =?utf-8?B?VVhPb1hydUlPTGNMVUJiazQ0bGxIRHRoOGhRb2lqOG1wUlBPc3k3ZnI1YjJX?=
 =?utf-8?B?UlVmNVRvd20wYTVCQmtFV2YwQjY2V0U0T2tjK1YzdmUwMnQzTUljS2E1M2Uz?=
 =?utf-8?B?OUtmOWNBSnVzZmN1VXVFRmRTbzZVcnRET3VWVktqcFdOMFR3Vy9tN0JFQUZx?=
 =?utf-8?B?OHlZTSs1TlU2WTFIeHVsbVdPODJOdHdxZEhDUVdtMis1TzBENy9QTHZlWmhx?=
 =?utf-8?B?ZVJzN1RlNlVHZmJHRlhjbXhqeUltaGhqKzgvK0N1NmVudUJkaWtYNVFrWWpz?=
 =?utf-8?B?dzU1S2p4YVlQbk1pdzdvR0d1YnF4MXgyVmRzODFGSEZCS0ZZaElzQ1VIRTdq?=
 =?utf-8?B?bmtPSitrQ1lzMlNqZWZwQzZZNVlxZEJGbDhyS2laQ3JVZ2tyTnRweWwrTFF3?=
 =?utf-8?B?SFhvQ3FHMFJWeWNKdHdmVlZUQTVxWWZITlZYdzQwcnR4N0hJR1dKM1lXVk1l?=
 =?utf-8?B?b0lsNFZMRW9WdjFOV1RVdXh5aGJ5eCtTbS94ZzRmaUVUWFNBTXk3ZmV2TFZt?=
 =?utf-8?B?Um82aHNuQ1JvM0gzYk95TzFvYkhWUGtHLzVybmh2V0kxWkNGNGw3d3VONlpB?=
 =?utf-8?B?YW9mTXhxV3RSZEcrZloyVzJmTkhseTBzMDh2emVHRFRVaCtjMUIrWEkvVVM3?=
 =?utf-8?B?OU52aWErSTYvUUoybTVEUWRGbUM4cDRlejRxeEJFMktlY2pqeEk3b0lHVlNq?=
 =?utf-8?B?QkRBbzRqSmY1SU9XdENYSHNGVGJwV0lsZGR4R3VBU1hvaHVaVWR0LzBGd2pX?=
 =?utf-8?B?U2hpVEpTRnZjTDcxbm0vTTAwa2RCRGg2aFRSdEtwelhiVGlJOXFZVHpPZFdt?=
 =?utf-8?B?SjdJZTlLRWZjb2p1NEVOUDNFa09TdCtsZUNmcjBQczdTU25yQTVBVWd0TzF3?=
 =?utf-8?B?ZVQ4VHBPVzhOY1duSmo5V3YvYWppTnlrK1FUZG45WmJ3dCtmSFdlMTBHbm96?=
 =?utf-8?B?cGV2dXpaWFlSYTg2Z0lUMjJRTHFQbFZ2V3A0NnZTU3g2cDIyOWxTd3lkZUla?=
 =?utf-8?B?TDJyVUozNTFVVVZJSnNYRysxZVR2eDFmQjJ3YXRBOTZNYWtWNnUveTluTTJy?=
 =?utf-8?B?WmF5dXVETys5Rnk5Y3pzWWd2T3ZaQ1FOODZSRUIybEZyQzlLYytSYWgwWGc3?=
 =?utf-8?B?TFUrekJicU9jK2F4V0dhWnVnZ3NCREtnU0xWSm5KR2ZNSGJmNktBT0pDQkhk?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ccb9a5-9291-4f43-0426-08dac7b8d2e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 09:56:25.1780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKn2Vc5eIBQmUwZRQO6HVNX6akNkYSMHHl8C9PxLxOuVs15mfbiEktCPtQwtJP2Qp3a/R9OW3BIZx/rFuC0BKVWq9EDIkXADK0E2R7fiyyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6031
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvM10g
ZHQtYmluZGluZ3M6IGFybTogcmVuZXNhczogRG9jdW1lbnQgUmVuZXNhcw0KPiBSWi9WMk0gU3lz
dGVtIENvbmZpZ3VyYXRpb24NCj4gDQo+IE9uIDE1LzExLzIwMjIgMTM6MzgsIEJpanUgRGFzIHdy
b3RlOg0KPiA+IEZyb206IFBoaWwgRWR3b3J0aHkgPHBoaWwuZWR3b3J0aHlAcmVuZXNhcy5jb20+
DQo+ID4NCj4gPiBBZGQgRFQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBTeXN0ZW0gQ29uZmln
dXJhdGlvbiAoU1lTKSBmb3VuZCBvbg0KPiA+IFJaL1YyTSBTb0Mncy4NCj4gDQo+IFRoYW5rIHlv
dSBmb3IgeW91ciBwYXRjaC4gVGhlcmUgaXMgc29tZXRoaW5nIHRvIGRpc2N1c3MvaW1wcm92ZS4N
Cj4gDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0
OiByZW5lc2FzLHI5YTA5ZzAxMS1zeXMNCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4
SXRlbXM6IDENCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+
ICsgIC0gcmVnDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiAr
DQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgc3lzOiBzeXN0ZW0tY29udHJv
bGxlckBhM2YwMzAwMCB7DQo+ID4gKyAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjlhMDln
MDExLXN5cyI7DQo+ID4gKyAgICAgICByZWcgPSA8MHhhM2YwMzAwMCAweDQwMD47DQo+IA0KPiBV
c2UgNCBzcGFjZXMgZm9yIGV4YW1wbGUgaW5kZW50YXRpb24gKHR3byBpcyBhbHNvIG9rYXksIGJ1
dCBub3QgdGhyZWUpLg0KDQpTdXJlLCB3aWxsIGZpeCBpdCB0byAyIHNwYWNlcy4NCg0KQ2hlZXJz
LA0KQmlqdQ0KPiANCj4gV2l0aCB0aGlzIGZpeGVkOg0KPiANCj4gUmV2aWV3ZWQtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gDQo+IEJl
c3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
