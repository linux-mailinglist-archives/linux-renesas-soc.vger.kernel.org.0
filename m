Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B11BE4EDF09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 18:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240195AbiCaQpv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 12:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240194AbiCaQpu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 12:45:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0CD209A43;
        Thu, 31 Mar 2022 09:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRGmaqfyZqxqi48+SsoDwqCyuubmISjm0QsQkGz/jFWEPbAvRS4FAKZGFJJ+tp+yHl0IMEuK87V60bxMCx8+tkzFR4cTKiuQubDYNUScQxtn5AFS5qr21hrpyUqQXAsG1G0PdITd5cqeeP7kCKMX34+rfaHLyUHRvoRb/lQV4Z5NjHNKiNo2dicBxoWA7Ksv+5P24MO47olCdk3Ol1+XHCIIiY/F2Q5KxzMJucf8lrEvqM1cCDm5MkZRsD5oYmi20Bl+uad/WLlmFN4HYiR5vYfZmhRcZUYkK62j6+d5Z+6Og+XSaHocDJbW6yh0pFT+Pqsase0dd0U7xQns9BwHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xxuUYyp0yyeHytD1KItkjdW7oPJV9zpG9MEcxDs/nE=;
 b=V7bUF4ThYjsWc5pd1tAOHqWeSQS7z04AKKmDzJduvwkGh0weyXZkKFdYtraQiF16XPnGHRLMnvtuA+MDGA0ZD03YMpqvEpfult9aP3R3ETZtiEOVTqneYeo9XAbomXdtwX2TeA7uZTEjOe5oIBFkUMD3J3iEHgE56sXQ2rZm7q3qMAsdeorHmJV8A7VWmXYq+h2I+qV8GXmvziJbxaq4h//mf0oc2q0zBu+G3kFostdyfSRWEZkhOWO+aeJ+qRb268hNuqw6g9fuA6RaK7+ObTQ650d9Flz2NiviBo9+xu5bPbq3fVtVZLP6ViVQ7tv3EODrk5JIPjYlhpISxxtbqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xxuUYyp0yyeHytD1KItkjdW7oPJV9zpG9MEcxDs/nE=;
 b=U95Fq7hYE2huqXasCqfYRVdC6IRrv5UaylLzGPZYlFLZ6TOpTcXxNhLrSb0huKKcqNF/lu+Svt46SZX4kQ9nV3glucsn8fqPvIBf4VJAwUISIx0amVqGXEQuN+/0s8zEOUy3X6bx3HBmtnZxSrjYVP8xPtAnEW0w37nTyatM5LI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3156.jpnprd01.prod.outlook.com (2603:1096:603:3c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Thu, 31 Mar
 2022 16:43:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8%3]) with mapi id 15.20.5123.023; Thu, 31 Mar 2022
 16:43:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 5/7] clk: renesas: Add support for RZ/G2UL SoC
Thread-Topic: [PATCH v3 5/7] clk: renesas: Add support for RZ/G2UL SoC
Thread-Index: AQHYOHi8lnkQmFzQ3Eyfv4dnOfeeCazZWjoAgABxiSA=
Date:   Thu, 31 Mar 2022 16:43:59 +0000
Message-ID: <OS0PR01MB59226F4FD1AF1500BA50901E86E19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
 <20220315142644.17660-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdVyocgrgDoXVVoATDr6md2RjgdqhmKWMpcTFKXf-1QQSA@mail.gmail.com>
In-Reply-To: <CAMuHMdVyocgrgDoXVVoATDr6md2RjgdqhmKWMpcTFKXf-1QQSA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ae3adcc-53ac-4501-6dbd-08da1335a783
x-ms-traffictypediagnostic: OSAPR01MB3156:EE_
x-microsoft-antispam-prvs: <OSAPR01MB315606AEDABD0C1E5FAC125986E19@OSAPR01MB3156.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BMJHD1twHlsWR+6Bm6Xsmjt+Uij8vltruXcWlIXTQ3eSC6yDaz3AICt8OHqg74NGVMfWpLT7pu+URsDQNcPPR3DAWbWQdpXm/UlXRwBrnW/5kABcqqgo0I/ObTx1InEubf3WsiFLcCRTPfN16VPib9NVmW6fqfMWzvUtV1iUrNQWKz7FzsHh/51hxm1feQg/vU9RPHn+6qusUYFjWz71gG3AxNAqEFzVOdfW+hyA+KCQrZSna25v8tyDNvEcAXFctj7p0kPVRIiirql3HCA7YH9SGI69BhcHKWKysW05Gdw+XdsvpE93zOXBghLgST0+3m35Dd9wvaRkhHvkf2+MWIFvvV7wg9wR9dHj1+osTj/oUY+A69JrFhBK7MjOtRGla/A9oBgFDTttpWY35CMsME6C/z3wyb9aIrw+Ro05XCyhxKL6gBn6YP6qadc2d0t3CNDQZ2sZoiBAs/b6wNk3RKns9hyRYVfY8nPf+AqICYDLZkgiFIZPjB5IfGqJTSQYWwnAroOl9D3e0QI9KJ6+PRUEFLucyuVn1uNrNJsf4FdIb+qihdTaWz8ZooGmGHp6AMmIqINSfWSlDSjX/zqPF/5SJkerK97vC7ZxCO5skwmUIq0CC2a+lmG/XCEnKnpRa73J30gF1ueFlyXJAMx2dKVhlEr0MMWzx0+AiQWuZKRIDb0hGR82lsDBEIRetnhY2OI9T57CmUEZ7VkKuc+zMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(71200400001)(8936002)(38100700002)(107886003)(508600001)(122000001)(8676002)(76116006)(33656002)(26005)(186003)(54906003)(64756008)(55016003)(316002)(6916009)(4326008)(53546011)(38070700005)(7696005)(66446008)(5660300002)(66556008)(9686003)(66476007)(2906002)(86362001)(52536014)(6506007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y25qVTRlRmUvYVVrZjMycldFUVNLS3FrT2lZUTkvank4Tm94UzhobysxNFJH?=
 =?utf-8?B?ZHlEUURMcWY1aG1VMTVucXVGNzg2S2JkR2o2ek54LzBvMUFOdmVZSkdRMDZo?=
 =?utf-8?B?QkhVbTR5RFVpaTNTT1VmZUhXU2JFRlZVWjNkWVhKamlnTGk0aS9lQmFoSG1T?=
 =?utf-8?B?cGsvdWtpay9nMWlaOFpVNDNhUERWakVrUDFTSWxqemN5NnJqUkJqRjZiNjZq?=
 =?utf-8?B?aTg4cWkzYWd4V3BXUnBYYXI4OW53UGZYeWk2d3Vsb0k4NnI1L0l4bzRzSGIr?=
 =?utf-8?B?Zk1EbG5FMG5YMDFPRUlMbTdYTHU5WXhvUEtaMGNrb2JLclNZak5PbERnUDhF?=
 =?utf-8?B?NVcyTm13WUh3OURBZEl4NndVWUxmR0dDMXZDWVJQcEhDM1Z5MHdON0xJaWhM?=
 =?utf-8?B?VWFxQjNLcW1hVjdCTFJTZUovVXFtR05oeXQyYUJyVGJiMWVGSi9UK0dTcTB3?=
 =?utf-8?B?cENUN0luSUM0c0pTcjFVNFdlWjZPTDYrV1ZNWVJUNHV1d0piblptOVhldUxy?=
 =?utf-8?B?OUlBc2Y5MWJyVlFhaVk1d0FWMmMvVHpCbUlPanpaallieksrdjArU3hidjVF?=
 =?utf-8?B?N3U0R2hVcm9kVGlBaXNERXpvSW12b0NHNTJZRDF0dzY4RVJ2VkNZcHppUVBD?=
 =?utf-8?B?NHdPNTBrU0FtNk1EVUdWTTVSQ3Z4ZHREdGNuSXNlR2pjUFowZ2RwVlNvcFZr?=
 =?utf-8?B?MWhkOVk2b2p2WU9lRWRWeXg3WEpnNU5SWUc3NEdpNUxxMnc4RVdRM0Q2M3cv?=
 =?utf-8?B?Q3NXWjVZSERCSFZ6RlBxcnNXd2FqQzkvbDJiRVFkLzZZczJJUTJvZEdXTCsz?=
 =?utf-8?B?UWFvQ0VieVFLdjNzYXFiN3VNNU03N29mamlxL0MrOGM0NzNGZFVGdWt1UExs?=
 =?utf-8?B?c1VDQzdiaTNHS0RuUWFMb004ZkdhRWVGY0tJYlMrK1FlZHVuYnNKdHpkZVVF?=
 =?utf-8?B?ZFcwR0lXS0J1WmwvdWtDVGl1cG1wU0d4c29rZWhNc2VMelY4Y29sd05pSTdE?=
 =?utf-8?B?cTlFL2pGbnlCa2c5dXdkMUFDZlZUS0pzVWhwb0pGQVIvMHF3WFJqbXRkdTY1?=
 =?utf-8?B?SjZnV3AxeTJzUitQaUpWaVQraDN5RlV2WWdrTWg1TTV4ZDN5SXFXcG9UUGJq?=
 =?utf-8?B?SGNrWDdWanJaYUJDaktZR2ZMbVRodGppUWlSZ1p6dHh2L1p2M3V6Q0VvbzRN?=
 =?utf-8?B?Zyt6bENJM1UvdmN3T3ZYczRRNEYycjJ2bzdvU3RLQXBkUlhkb3R5U1pDV3Q5?=
 =?utf-8?B?Q0QxK05Pdmc4UFU2TGk4WWg2NzZLb1Y0VktJa29uQVc1R2c2b3p5Qmhabi95?=
 =?utf-8?B?UWlzcmJlVHhITmVyOXlsdEdrUHlNZm05RUpVYTArSE42NDNWMTBvcW8waFdF?=
 =?utf-8?B?QXpMd1NidHlkeUhHbmczODRBSGJPSGh4U0NHYm52T2V0ZktGN0kyUm0wWTNU?=
 =?utf-8?B?WmRQZW9IY0xUd3pRY2NENFRoTGxKOHp3SXMvOGxYRkwrUjh6bXVQNjIwNFBu?=
 =?utf-8?B?a1N2Tk1sbzhCNjF1OWdXYmZrMGNXNGFPT29pOTVLc0pCK210QTJmVFNZa2V0?=
 =?utf-8?B?VGlDdy9LSGhnV2d1VElDaWpDN1F5RERSRHljNnUyRWUraXlmSnBkVTR6b3ha?=
 =?utf-8?B?Q2Mrcm01b1JOY01NT3cwRE5kTmptLzZYSHRINW8xVm9SR0x5bVNDZDBSMThO?=
 =?utf-8?B?bW1RQlI5Z2wzd1ZtSlh2NjRNZGZTNmxDakRJaEo3dW1wSG5FZURTdll3L29H?=
 =?utf-8?B?czZmVnFzdndkcjFUR1J1ZGJuZWR0Q3pKc21ZMjhDMDV6UUROZml5TktyY0Mv?=
 =?utf-8?B?cU5QZFhQYWJvYng3WFhqa1EyaXc2d2tmaUhwc2pPdUI4cllJRUJXdHVoU3Jh?=
 =?utf-8?B?TVcrREE3Nys5Vk11V2RKM3J2a3JKM3laLzhmMk81UEczV2FRNk95WmpVaTRF?=
 =?utf-8?B?NW5KSGJpRjdtWklHUSttK0ZUdHU3bEdId043OC9BdE83QlIrWnRjVElsZEF2?=
 =?utf-8?B?d3pwNHRFcUl3SVd4VkszRGpvV21IM2hLd2tITU4ycEJDV2grYmlQSmJYNUFl?=
 =?utf-8?B?WklkelJnRkhjQ3BDd2lIcEwvRldCQTYxd0FvbzFoWmg2akN3ZFdRSGF3SThR?=
 =?utf-8?B?UnZXaDF1Sk14UHZSSjV4SWtXRityZ1hSTnJmajVRa3RxVjR4OS9HYVo3K2R5?=
 =?utf-8?B?VDlNeklDRG5RMGJoOENCVnN3N1FhVkwwMzlwZy8vbGhxQk1sZTVlK2xaclhz?=
 =?utf-8?B?RUdraExWOWZIYXhZYUkyVXV4M2sxYmcwY2E4OGRELzhIVW1hQnVRU2xTS2lO?=
 =?utf-8?B?V3cybFMxNzVHQTg0NWxOc2NrMVQyL1JEbW56SW5SRWJIdllaT3NpZzBqSHQz?=
 =?utf-8?Q?nDVqRsdyp4BqrRh8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae3adcc-53ac-4501-6dbd-08da1335a783
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 16:43:59.0324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYq6F3MIOgPfs+D/jY+aa6ubKGV7F1JEKmwZnE9AIg7eNhtL3aacQ8FyDDc7OO5auEOGwIztuKu5LCebUI0/ervCwFiXIq7MB4bv98WUZFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3156
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgNS83XSBjbGs6IHJlbmVzYXM6IEFkZCBzdXBwb3J0IGZvciBSWi9HMlVMIFNvQw0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgTWFyIDE1LCAyMDIyIGF0IDM6MjcgUE0gQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBUaGUgY2xv
Y2sgc3RydWN0dXJlIGZvciBSWi9HMlVMIGlzIGFsbW9zdCBpZGVudGljYWwgdG8gUlovRzJMIFNv
QyB3aXRoDQo+ID4gZmV3ZXIgSVAgYmxvY2tzLiBUaGUgSVAgYmxvY2tzIHN1Y2ggYXMgV0RUMSwg
R1BULCBIMjY0LCBHUFUgYW5kIFBPRUcNCj4gPiBhcmUgbm90IHByZXNlbnQgb24gUlovRzJVTC4N
Cj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBtaW5pbWFsIGNsb2NrIGFuZCByZXNldCBlbnRyaWVz
IHJlcXVpcmVkIHRvIGJvb3QgdGhlDQo+ID4gc3lzdGVtIG9uIFJlbmVzYXMgUlovRzJVTCBTTUFS
QyBFVksgYW5kIGJpbmRzIGl0IHdpdGggdGhlIFJaL0cyTCBDUEcNCj4gPiBjb3JlIGRyaXZlci4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYt
bGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAgKiBSZXBs
YWNlZCBSOUEwN0cwNDNVLT5SOUEwN0cwNDMgYW5kIHI5YTA3ZzA0M3UtPnI5YTA3ZzA0Mw0KPiAN
Cj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0My1jcGcuYw0KPiANCj4gPiAr
Y29uc3Qgc3RydWN0IHJ6ZzJsX2NwZ19pbmZvIHI5YTA3ZzA0M19jcGdfaW5mbyA9IHsNCj4gPiAr
ICAgICAgIC8qIENvcmUgQ2xvY2tzICovDQo+ID4gKyAgICAgICAuY29yZV9jbGtzID0gcjlhMDdn
MDQzX2NvcmVfY2xrcywNCj4gPiArICAgICAgIC5udW1fY29yZV9jbGtzID0gQVJSQVlfU0laRShy
OWEwN2cwNDNfY29yZV9jbGtzKSwNCj4gPiArICAgICAgIC5sYXN0X2R0X2NvcmVfY2xrID0gTEFT
VF9EVF9DT1JFX0NMSywNCj4gPiArICAgICAgIC5udW1fdG90YWxfY29yZV9jbGtzID0gTU9EX0NM
S19CQVNFLA0KPiA+ICsNCj4gPiArICAgICAgIC8qIENyaXRpY2FsIE1vZHVsZSBDbG9ja3MgKi8N
Cj4gPiArICAgICAgIC5jcml0X21vZF9jbGtzID0gcjlhMDdnMDQzX2NyaXRfbW9kX2Nsa3MsDQo+
ID4gKyAgICAgICAubnVtX2NyaXRfbW9kX2Nsa3MgPSBBUlJBWV9TSVpFKHI5YTA3ZzA0M19jcml0
X21vZF9jbGtzKSwNCj4gDQo+IFRoaXMgbWF5IG5lZWQgYW4gdXBkYXRlIGlmIHlvdSBjaGFuZ2Ug
dGhlIENsb2NrIGFuZCBSZXNldCBEZWZpbml0aW9ucy4NCg0KT0suIFdpbGwgdXBkYXRlDQoNCkNo
ZWVycywNCkJpanUNCg0KPiANCj4gPiArDQo+ID4gKyAgICAgICAvKiBNb2R1bGUgQ2xvY2tzICov
DQo+ID4gKyAgICAgICAubW9kX2Nsa3MgPSByOWEwN2cwNDNfbW9kX2Nsa3MsDQo+ID4gKyAgICAg
ICAubnVtX21vZF9jbGtzID0gQVJSQVlfU0laRShyOWEwN2cwNDNfbW9kX2Nsa3MpLA0KPiA+ICsg
ICAgICAgLm51bV9od19tb2RfY2xrcyA9IFI5QTA3RzA0M19MQ0RDX0NMS19EICsgMSwNCj4gPiAr
DQo+ID4gKyAgICAgICAvKiBSZXNldHMgKi8NCj4gPiArICAgICAgIC5yZXNldHMgPSByOWEwN2cw
NDNfcmVzZXRzLA0KPiA+ICsgICAgICAgLm51bV9yZXNldHMgPSBSOUEwN0cwNDNfTENEQ19SRVNF
VF9OICsgMSwgLyogTGFzdCByZXNldCBJRCArIDENCj4gPiArICovDQo+IA0KPiBMaWtld2lzZS4N
Cj4gDQo+ID4gK307DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9y
Zw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQu
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
