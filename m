Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E76177F439
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Aug 2023 12:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349081AbjHQKUX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Aug 2023 06:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348524AbjHQKUP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2023 06:20:15 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E4E198C;
        Thu, 17 Aug 2023 03:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Za4akqLiOfg1yoILNCygVg88wcIVD0byWm2XyA6OjoRRjHwrIwdx+FdVvHK1DGcFHjcjBY+CAtmqry4eBPOi+wfew0xayLJ59ZTmMzA/rAkel2IyMFYb/dmSV1oOZtPi//JpMT/hDaNxPMfT3K3Pl5pqZyzg1wuVwICnUdWh5U3/zrdZcy7NQRZMSF8JDojEc+vcduiPNvdgDXCxMOowt8QVlu4tvIBqub4qnIRb7pQriM99PmfeX1HFBTLYlPo7HVrgoW+/vHg2NbNbVg8TpNYgo26/rk5H8gM54L99OJ6k/btKM4AmEgEVBdUrUnCssnlthw+EiOkRsuYpPaB+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g4pXZrEUYbcVkUlcM1wbQI4C8+KKPGHlcbJGLrl/kc=;
 b=c0caVpr/U5RuoaNr7Zff+jjGq/3GzxBQGhDE423LVqFgbOGIYBx98mc3SIuBOO8EDELXBSefzyEvGfepQQX1T8Uwy7wMve0P/ztTudmSwKns8nVD/D2+cBOEDUAdKFd12IMrNAPue9ojiNlmowTOaMdQ9Y00tXesUthvL9KXGV/tomiz9XrTbcWy12jn4nY9wliSh1VDxzK/BSOYwZhTFVqfCuQMwF+L2t9jJYkfwWxA/6G6pahLr+59Z2sgi3rmCY17KNADYkpoQe+E+oOnx/3gKoYvVV/SKdVkCIYn4jfYg+hS/JyljFuWmmdGTWzahTmFHj8O590W1sRvSy2dHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g4pXZrEUYbcVkUlcM1wbQI4C8+KKPGHlcbJGLrl/kc=;
 b=jCMEV3Ug7VOD3vdaP0IDNOKmDNKWgpaqHYSD9Iv2PMx7Xe1JBphIR/qgrqZo/XPIaC85c4cg2iZp8BoGIGts5ArUgKrvxIqsIPmr6paGVzulFZ+fv9zU0SAj2fcrZDA+kys6cL55X32qJXxWTq1A+VS5oEc8kHh9k3PBzAX0YhQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB9890.jpnprd01.prod.outlook.com (2603:1096:400:229::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 10:20:05 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%6]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 10:20:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] clk: vc3: Fix output clock mapping
Thread-Topic: [PATCH v2 2/3] clk: vc3: Fix output clock mapping
Thread-Index: AQHZ0OphIrX76rXFFEutzBWfn3nhd6/uPwGAgAAHlQA=
Date:   Thu, 17 Aug 2023 10:20:02 +0000
Message-ID: <OS0PR01MB5922FBF6768C4BAB816D56A0861AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230817090810.203900-1-biju.das.jz@bp.renesas.com>
 <20230817090810.203900-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUv5Wfgj5CNit4WMK+hRZc2QPkPzSSnL2306Us_SoZmRg@mail.gmail.com>
In-Reply-To: <CAMuHMdUv5Wfgj5CNit4WMK+hRZc2QPkPzSSnL2306Us_SoZmRg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB9890:EE_
x-ms-office365-filtering-correlation-id: 4b52b32f-6942-4ba8-7fec-08db9f0b84bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P1p5rYvKSbK248i9G2TBlw8MP/WaVDI8pUOdRO71tAk2dkJ3f2Cx+BnwsmmqEG8iT0fQQr3+GVXB4U0FyZglWBJPVtmjrlTepDvH8KBk+PG5EfFsPLbDKqmPZXmRI+TrHop5JyrcaK6BCL9RwHxfMIXHjXtgbv/avb3cEwbx/NS6nBHdxmZkLwtH++a5yWG+wqml6HhLg34LvcBVQl01v3i4s3KLiI0T26hDyomb0JMbmmj0yoytc7Bfq+wks1NtzElxntrSwlUPUa5ZPvNeL/EB2J4N6XAcqdqOjsOsI+hDtJL4lOhd5r7X/T3FbPjQaaQknN8XVs13SFoWx7gRXRmGiXgKr2ei9N/ZDXIXMYjr0uMyHDIUbNaHUMcEa19O2gMFCEhVuTrKorSm2GqXRJ7npVdVm8RM4qptsKImwaqfyBatILy6uPrmlNT7PZ6XHh1kONG+1FeWnqfRG+CoTVbH3jLQlDmMQhfEj14SIIoWCdW5AtrntB56fN+tzF/TZqnUs9AQ/E+dTCE9W08GaRkMNgAw3nz05ZUOtMZCSnJZ+pg9xTj4M6LWvXfQnpP2ktvQ+pBjfoSymsAvVoGRDUptasi6dthyxfRQMlW/3vNUmS4fwkbboVdppLcwnyuD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199024)(1800799009)(186009)(33656002)(83380400001)(316002)(55016003)(6916009)(54906003)(66446008)(66556008)(66476007)(66946007)(64756008)(5660300002)(26005)(2906002)(53546011)(6506007)(7696005)(76116006)(9686003)(71200400001)(478600001)(122000001)(38100700002)(38070700005)(86362001)(4326008)(8936002)(8676002)(41300700001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVF1Y2taY0k0bjdSU3BUTGNuZUU3TkJOUDdrU3ZKRDN5Uk9WNnROL2FiMUpX?=
 =?utf-8?B?OFNVa0NEMmxQVjRVcnZYV2p5cFBQLzBjNnhPR2pLQUVvUSsrNGlmaHlLV2Jp?=
 =?utf-8?B?T1A0cnE5aldqK1dxQWZtbkk1VHhrRUxGbC83dWVYdG5GaTlSWlM0UitxYXlG?=
 =?utf-8?B?cHBJWm5uTUc1djVIUGcvSmljYmQ4cDFaMHlhZTYzbFNVdURsYWpmbjhjUk13?=
 =?utf-8?B?NEg2cGo2SWRqaGZXWHBYSHFCK0g1S2xLMWRhQy80clVoTGszM21HOFVFa3lW?=
 =?utf-8?B?c2VMc2E0TWdtMHBQSFRsTU9SYkZ4dnYyNndQdU5SUnp4VXBjMm5sSXR0UTMx?=
 =?utf-8?B?b0IrRzdCMElRenVrb0NoSE1zTHdrMlk0OEVjeXlFQmxHRVpCNjhrQXJqVjN1?=
 =?utf-8?B?V3NUWG15S3NWVXNRVjdvTU1GY0hzV2hSRlVzS1AzM2ZVOElXdWw1Yk1NTkRT?=
 =?utf-8?B?ZVFMMzk0RjBNR083TVh6d1JBaGlSbER1M3AyNEhqOWIvd09TbUpWS2ZIeFlO?=
 =?utf-8?B?Tml0S2Q3MVd4dkFsaU5abHNFRkNiR2xBbzJocHcwMUprVzdrOTQ4VnRJcERn?=
 =?utf-8?B?c0tMTVJVNDhEeGxFYzA4NVVITHVsUW03RXFnVUpaMXlOa1BzV3RMb3pNRjdj?=
 =?utf-8?B?UlFZQ094d0Jydzd1ZnNVVm9KNFdoVWp5dkZnMmdmMlF3cEM1dUhpWmZYVnE4?=
 =?utf-8?B?MnhqRWt3Mktodng2NEpwVXhPc1BBaUlUWmxSbzlpYkhjYStTSTVqUkFxUUpF?=
 =?utf-8?B?N29obmJPM056ZUlQZ1ZCQTlrbWNDUTd3dW8rTGVob05ldlBiSjVoWHFyTWNo?=
 =?utf-8?B?ZmY4NTBqakFtK2pqMXhIZFNmZ2UzanRhK2JqdWl5aE5uNVkvb3VQcWFGajBh?=
 =?utf-8?B?QW9vZFVvNlNRTWhxRTRObXNFeUQ1UzZMVm9CQlBJc2UyeS9jb0I5NlViVVhi?=
 =?utf-8?B?NVBIRXU1WmRhd1g2eTJSeUx5amRtWkh3a3Zhbmd5VEVCeURpbno2ZDRkNDRj?=
 =?utf-8?B?T0NPeDhObldNL3B1VVUwSnNxcndQeWVHb1poNVlxVlI1K09nNUtURVp0dytI?=
 =?utf-8?B?KzIxa3ZTWVcrNDNpQkZRM3FRem90bTRQZ3EwdllXYjZOaGdTRjZhLy83RExT?=
 =?utf-8?B?N0lZdkZGSFNSVml5T1FHL1c3d0ttcUVMaVgzTE55THVwUlgzRGdJZ1B4Smls?=
 =?utf-8?B?eXVjem5vRENMTUVNTjBsSnlmbFNqYk80UHZ5eXRxazFTZWpGaUJSbXFhd0RW?=
 =?utf-8?B?WUVoNDRKNlVzUjBJc2ExZFJBTWJvcm02Zms2NkVoanpvTEM2Smk0QkJ2MVNw?=
 =?utf-8?B?UXBpT2JGQVNUdGdLZFZjWGJ6VmI2R2V1MTE4cUFZVitzdmthNS9wUzc5Nmxx?=
 =?utf-8?B?UXRUblc2aHIrVWFpVzlSNW5KSGJaUzFXcDZxanZQYzFMTk1QVk4rMDh1dm9m?=
 =?utf-8?B?bnpESFBLOWdoWFREbWNVWnlBbEhzRWRUOHhHeHEyNnRUSk1LQjlYVkZLZlNm?=
 =?utf-8?B?aTRXdS9GOCtyWEhpNzVPL3g5RW8xQTBYemNDUC9vV0FXZm9lelF6YmtDVGVR?=
 =?utf-8?B?dk8zamZKbGh0SjVLcVI1L081eXRnSjdDd0JvbktVM2J3R2t6WmgyRzBsbDQv?=
 =?utf-8?B?Y0N1TWtNQWN2V2k2UEs0V2o5aE81WEZvVXNJSWtmT3UrOGF1diswd1V2dENP?=
 =?utf-8?B?a08zbFdWcnZFcFhEZzh3R0toT2lkcjdVUk9idzhCRGdjSW9ScThVYmdkbExw?=
 =?utf-8?B?MkR6ZEtLdEFRbWpsR2RGa2h0L0hLVjB4TlROYnFSamVMMXdTZWw5cU9oSDlQ?=
 =?utf-8?B?ZGpLcEZtc29Oa2kxSDhoeklPMUxybWlUbHJJZ3lkMERCY3BabnFMUVBaSUtZ?=
 =?utf-8?B?U0FMTENDMks4TjlDTmNhajZwaUF6dDFUUDVrd2hPR2lFSGtOdHRUSUVyU09k?=
 =?utf-8?B?Y2Rvc0ZYejlJSUlkSDk2eWN0ZU5DdDBCVGo3andjV0tQZ2k4VHhPZGhTQlBi?=
 =?utf-8?B?WERFZ09tQWg4djZsT1htQjdYL3YwZSs5U055ZTdHVUpvd0tGSFRRd2ErTlZQ?=
 =?utf-8?B?eHVyMFRsVkJYOVpPMllydEFpbk5Ma0ZLQnpkcklQK0RSR1c4ZXJWSkN4emFZ?=
 =?utf-8?Q?3LDewSOIONza8YOuGEm6fOntX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b52b32f-6942-4ba8-7fec-08db9f0b84bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 10:20:02.3044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AG2esEogQ/8tGct599dVy0zQTf+p/YEpf9LJuodedxtGTmIdMO41GvEuIUptcI7quN2v3Rfxq4lRvp4Z0/yI746OSomldBkn7uI7LqRs06I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9890
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMi8zXSBjbGs6IHZjMzogRml4IG91dHB1dCBjbG9jayBtYXBwaW5nDQo+IA0KPiBI
aSBCaWp1LA0KPiANCj4gT24gVGh1LCBBdWcgMTcsIDIwMjMgYXQgMTE6MDjigK9BTSBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEFjY29yZGluZyB0
byBUYWJsZSAzLiAoIk91dHB1dCBTb3VyY2UiKSBpbiB0aGUgNVAzNTAyMyBkYXRhc2hlZXQsIHRo
ZQ0KPiA+IG91dHB1dCBjbG9jayBtYXBwaW5nIHNob3VsZCBiZSAwPVJFRiwgMT1TRTEsIDI9U0Uy
LCAzPVNFMywgND1ESUZGMSwNCj4gPiA1PURJRkYyLiBCdXQgdGhlIGNvZGUgdXNlcyBpbnZlcnNl
LiBGaXggdGhpcyBtYXBwaW5nIGlzc3VlLg0KPiA+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IEZpeGVzOiA2ZTlhZmY1
NTVkYjcgKCJjbGs6IEFkZCBzdXBwb3J0IGZvciB2ZXJzYTMgY2xvY2sgZHJpdmVyIikNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0K
PiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT4NCj4gDQo+IE9uZSBzdWdnZXN0aW9uIGZvciBmdXR1cmUgaW1wcm92ZW1lbnQgKHdoaWNoIGNh
biBiZSBhIHNlcGFyYXRlIHBhdGNoKQ0KPiBiZWxvdy4uLg0KDQpPay4gDQoNCj4gDQo+ID4gLS0t
IGEvZHJpdmVycy9jbGsvY2xrLXZlcnNhY2xvY2szLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9j
bGstdmVyc2FjbG9jazMuYw0KPiA+IEBAIC0xMTksMjAgKzExOSwyMCBAQCBlbnVtIHZjM19kaXYg
ew0KPiA+ICB9Ow0KPiA+DQo+ID4gIGVudW0gdmMzX2Nsa19tdXggew0KPiA+IC0gICAgICAgVkMz
X0RJRkYyX01VWCwNCj4gPiAtICAgICAgIFZDM19ESUZGMV9NVVgsDQo+ID4gLSAgICAgICBWQzNf
U0UzX01VWCwNCj4gPiAtICAgICAgIFZDM19TRTJfTVVYLA0KPiA+ICAgICAgICAgVkMzX1NFMV9N
VVgsDQo+ID4gKyAgICAgICBWQzNfU0UyX01VWCwNCj4gPiArICAgICAgIFZDM19TRTNfTVVYLA0K
PiA+ICsgICAgICAgVkMzX0RJRkYxX01VWCwNCj4gPiArICAgICAgIFZDM19ESUZGMl9NVVgsDQo+
ID4gIH07DQo+ID4NCj4gPiAgZW51bSB2YzNfY2xrIHsNCj4gPiAtICAgICAgIFZDM19ESUZGMiwN
Cj4gPiAtICAgICAgIFZDM19ESUZGMSwNCj4gPiAtICAgICAgIFZDM19TRTMsDQo+ID4gLSAgICAg
ICBWQzNfU0UyLA0KPiA+IC0gICAgICAgVkMzX1NFMSwNCj4gPiAgICAgICAgIFZDM19SRUYsDQo+
ID4gKyAgICAgICBWQzNfU0UxLA0KPiA+ICsgICAgICAgVkMzX1NFMiwNCj4gPiArICAgICAgIFZD
M19TRTMsDQo+ID4gKyAgICAgICBWQzNfRElGRjEsDQo+ID4gKyAgICAgICBWQzNfRElGRjIsDQo+
ID4gIH07DQo+ID4NCj4gPiAgc3RydWN0IHZjM19jbGtfZGF0YSB7DQo+IA0KPiA+IEBAIC0xMTEw
LDcgKzExMTAsNyBAQCBzdGF0aWMgaW50IHZjM19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xp
ZW50KQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmFtZSwgMCwgQ0xLX1NF
VF9SQVRFX1BBUkVOVCwgMSwgMSk7DQo+ID4gICAgICAgICAgICAgICAgIGVsc2UNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICBjbGtfb3V0W2ldID0NCj4gZGV2bV9jbGtfaHdfcmVnaXN0ZXJf
Zml4ZWRfZmFjdG9yX3BhcmVudF9odyhkZXYsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBuYW1lLCAmY2xrX211eFtpXS5odywNCj4gQ0xLX1NFVF9SQVRFX1BBUkVOVCwgMSwg
MSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuYW1lLCAmY2xrX211eFtp
IC0gMV0uaHcsDQo+ID4gKyBDTEtfU0VUX1JBVEVfUEFSRU5ULCAxLCAxKTsNCj4gDQo+IFRoaXMg
aXMgKGFuZCB3YXMgYmVmb3JlKSBmcmFnaWxlLCBhcyBpdCBpbXBsaWVzIGEgc3RyaWN0IHJlbGF0
aW9uIGJldHdlZW4NCj4gdGhlIHZjM19jbGtfbXV4IGFuZCB2YzNfY2xrIGVudW0gdmFsdWVzLiAg
VG8gYXZvaWQgYWNjaWRlbnRhbCBicmVha2FnZSwgSQ0KPiB0aGluayBpdCB3b3VsZCBiZSB3aXNl
IHRvIG1ha2UgdGhpcyBleHBsaWNpdCwgZS5nLg0KPiANCj4gICAgIGVudW0gdmMzX2Nsa19tdXgg
ew0KPiAgICAgICAgICAgICBWQzNfU0UxX01VWCA9IFZDM19TRTEgLSAxLA0KPiAgICAgICAgICAg
ICBWQzNfU0UyX01VWCA9IFZDM19TRTIgLSAxLA0KPiAgICAgICAgICAgICBbLi4uXQ0KPiAgICAg
fTsNCg0KQWdyZWVkLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4NCj4gPiAgICAgICAgICAg
ICAgICAgaWYgKElTX0VSUihjbGtfb3V0W2ldKSkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gUFRSX0VSUihjbGtfb3V0W2ldKTsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K
