Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D53025B6A6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 11:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbiIMJNn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 05:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbiIMJNZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 05:13:25 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7819C5C976;
        Tue, 13 Sep 2022 02:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReHL74qqGMA5JXw/7+IY98sAC2PNkeFcv53wVtuG/J0Sx/19GnEkLVyFkmew6wPAuAP50yayQUUHg5KUM5YZbGiUfpoCTzme3AJQqjbzXMPoD2ApNo1eKh1mOO4eA7DFLBkdnuLRJVMGKWsaL0WlclcjFp8z5mrSpzmqv45aCPhdJBFG2LTJpFCBsK2kKFtx651pRQlOomQiZiKdWl8oJB6CMgxMOUo4JHXMOknuAEx3gHI/UBa/i8vmBz9lx4sCXmM8YJwN69MYGk1ff+vLpu/YF5Y379toV/cdGZkINjVChqVuJOlgX2VOfgRCv3xfK/+d9r7oSTugtbUA3nNTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMVzDYM98el5s0pscQXLFuGsWnuVDBg2IuHq7rzaMew=;
 b=dSLu1f5z5EhMkm6Eo4fA8c/ij+0pf8+8YmVWD9pyu/dTD09Rx2oaBo2CeUht4SimzdTGbszuk0PxHRpG0EO0owPciddXhHmbfVhzqA11Z3Vom6x+m93Rq0W1GDYuo2w/mgMgIn9Dhw3XQEN4PMsvEmnSlL4f1hmJk0QgJ5thlZf4WsYKeTG7quWHz177qosXvz74NT/FwAFeMB/6/mKb2eHSN1IiJGrKKdS30ANUFQwxR5fbVAznv0IydbTIiJ3YHqRud0Psu0cyY/4knv5WvSfPqASKvCWvLutCWrz3+Pf12wl5xrvwAOBZGMILOZsRItZXanzqU8PpMZSeUroBlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMVzDYM98el5s0pscQXLFuGsWnuVDBg2IuHq7rzaMew=;
 b=ecpJ0gKqtWrkUxnUgxLMNj596IkySYhVBFK4ziH2FvS4CJ95HIXUl3ADaEqhHq33CIlrhdiwQ7k++6gHPdZZBHtCe6FrGxo/xxQpgVyq2fTIpBOIsgxQ2Un7q/Y9beR1+50HkpewpqIT1BOpyteOp+6tqjb3kjoyuRYd6y1InCU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10636.jpnprd01.prod.outlook.com (2603:1096:400:299::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 09:13:14 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 09:13:14 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Topic: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Index: AQHYx00SZzRJbu1f4Een84uOmb7F263dDxQAgAABfCCAAAKoUA==
Date:   Tue, 13 Sep 2022 09:13:14 +0000
Message-ID: <OS0PR01MB59226E7F0010A3EC85A1CD8286479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
 <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10636:EE_
x-ms-office365-filtering-correlation-id: 9c652500-038b-4862-48a8-08da9568300e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YSCBm58+jT+sAQNXq+vdPp9eadyVk9UjxZZCxn3aNhfuA4yNYh6k7Sfv1H/e1l7sNKwQnVzntbdCLVn02rfyUIMeaRo1Ob0HDg1PMSdZwP7qr20Y7NTMIfdU5YbDR7Za0z6hcB8mfHHki/xNPv1IFYHiPmh/HFgyieN5YJf/vYuggrUEfUp5Lw3rOxk6pk7XU8xWEkXbYbflFYAPWBEEwSe1JLwchidSzIQk9sKwBeRoA0z1hfnzfXOrZunbdMfHrERIUmzUW/lAt0S8vzrp/EcHXo2HfqWV897QMFmataznKgRK7frZPr/MENCJP+Sp0NfrIG+KZVKRaKDiCT1ZDTBxX7tfTGDfmDKBd6lnkYp6ENpWzRL6tFU5EN/4mNAkyB27O7Em8vlObuivg7x2Jv+5zylkZXMTqLGs6BELrgnnnPQjutrJFF0CaB9sGLj7HD736tSEQ1bnJ4S/nUAdlZaJQtOu/ncAsIi9Kxe2e41OA3PBM4S2QprDE2GRfvDLQkoVPY9iB03YJTQyQoGK2oYgrcZLYQ7ANc4cWfe9avLFgERT6IvXQdmkMzXAV92s6rY/8pFc/qXigeO1xo637wJ+LnM/pYAgEira3S3dvIa+UeEHsTutLaeYpxJHbYw42jFPsqKWbk/2zHyJVKiUqNC+2LBrBSc1wH5CAjn7KJSMFp3s2lA4gjGJl/aLYK3Ym0I46q6IjUDgQBwS1WeKd8yr3VsyNtyINWpKMx1VP/7Ue/zND8JXJ/9wBJSoVOGF0LdIafoepMzYPt+aHpcclA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199015)(8936002)(38100700002)(71200400001)(38070700005)(2940100002)(110136005)(41300700001)(186003)(6506007)(26005)(2906002)(7696005)(9686003)(52536014)(107886003)(66446008)(478600001)(76116006)(4326008)(64756008)(66946007)(122000001)(53546011)(55016003)(316002)(5660300002)(8676002)(66556008)(66476007)(86362001)(33656002)(83380400001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0planBjVlNOd3RvT0dOVHM5SHhNUnRjcGtTNWVMcTU3SDh5TkhUZlJuKzlH?=
 =?utf-8?B?RzdhL0pHQkQ5WFVNSld5QzY0dmd4NFlTTGRoU01maldlaFJ6VVU1UHJka1M0?=
 =?utf-8?B?NXErb2NIS0VKV1BGUnZUdFloNFhpMEZ4bGh1emQ1RVNyb2pLQ1dlUVo5akNm?=
 =?utf-8?B?NGlhcmlmaFB3VnlLQzdCL0hZbHZQSnpnZ2tDZU5MQUd4azU2VXY5K2FBOHFx?=
 =?utf-8?B?ZnoxUHFWcDhsMHJQeE9RTHV5aThnTjZtZUxHZ3lRdE80REdRbTQwOFpMQTdZ?=
 =?utf-8?B?VGluTksrWVRJVkNXRFpqTklqaEpOc2Zmd0FJUysxakZtNHFlVzdhWURGalI5?=
 =?utf-8?B?N0JHV2VDZmV4akZaU0lOb0krakJuOGZ3WGtJb1Nrc01hNEJtNTI1aVpzY05W?=
 =?utf-8?B?eG5WTUpPcncwbXowb2RkWXpKUzc5ZXFDeFFFWVdJTENGY2pwSkY0blZpTEZV?=
 =?utf-8?B?eUY5eG5MdTI2V0hybEZKaEVFbVlzTUNYYWpVVURRK2JoSmRqRDZqY0w0ZWpu?=
 =?utf-8?B?SGxNRHczVFRnZjBJcllidmpPb013Wm0rVlJpRkx3aXhlZ0o1WjBBTlRsYUt1?=
 =?utf-8?B?cEtCcG02MkZRdWY3cFlQempRZ2J0amxZQ1FMWU5tY29ZZndmclhGSEM1MXVN?=
 =?utf-8?B?dlRDeng0VkJZUDZnbU12S0NXcnl5cVdGZGJuUlhZMk5GVEI0VVpoQkRrZkFj?=
 =?utf-8?B?ZzI0K2ZDQjRVRWIwU3FzRGQ1ZUo2aWxYSUg1OUpMdlVKYmxhQVIxR0F3dThP?=
 =?utf-8?B?MDhlT1BtYXRwQ0NJbnRuNlRxOGlUajJ2d1o5eDFJWU13UDBrNFBoWHNLMGVQ?=
 =?utf-8?B?cFI5bHI0WUNDSXMzbGVxTmFER3JodjlaY1gxTDZjRTNwSk9ZUUJDTzRrSnM4?=
 =?utf-8?B?cjVCdkJiaXI4cGtQaFdBeStVQVZoMFBYWm1JNmE1YWhXTnJqa1FRWVRzQkJt?=
 =?utf-8?B?Y3I1YzlpTmpLNXlrT1IvaGhWQjd5L3NCbUduUURBdFMrMWg4Z3YwZ0JKcVd1?=
 =?utf-8?B?QzZkelY3RjZwdk92SlBXWlUxTjl6dWVQd1JmMFQ2aHdNbHJzeVZhUUdVWi9T?=
 =?utf-8?B?V1dkeEE4Qk5hN0dUWVZpdXk3cm5JUnNwUkc4Q0hFdzZYd2NVejM4akFOdkZL?=
 =?utf-8?B?SXNQYnBjbE1DSFBCYXpIMTFvYzREU1o3UEtralZUUXp4MGd2V0xWK2ZzbDVq?=
 =?utf-8?B?dTRiWDBHNjZTS2lsYzhDTlQrdGVGZVRRWFFYdDloVVdSTzJUWVVscGUwd0Vr?=
 =?utf-8?B?dDhNYi84R2pNYUVXcWFRcENvb0tmRG1reEFXM0dCT05oMlNqK2NyYkZOSzFq?=
 =?utf-8?B?dkpKTlgzMVhZOHg5ZWQ2SDd2eFhUY04vTEZQM1ZpNzIvMzdjcDdkWStKVmly?=
 =?utf-8?B?WXNSdlFzRDJQQUd4QjdKdjhCRzhQbjd5Z3R4SHdvc04wdmRIMFNVeENCSGxL?=
 =?utf-8?B?YmxiNEZtb0M5anF4T0pVRW5YYUZGVWlLTllrTDRZcU1ITTV3ZlhUbERqR2Zr?=
 =?utf-8?B?aTlTTkVkZ1BTWlIxeEJSYmxVVXU3ejc3NU10cHdKSnNiMW8vMG93aERjYzA1?=
 =?utf-8?B?ZW9wRXA4eHR2YVVQMWMxbFRkZWhtS1JsOUpWNlNkYW1RSUMxa2xuOStIeEVi?=
 =?utf-8?B?TDAzTkNuN0lmMExVclJUemErWmNEV1YzU2UybTdGOVlvSEFJZ3RRZ1UrMlp0?=
 =?utf-8?B?bGZRR1Zkd1h4SG91UzhMcGtxY2dtRDhxVGhXYmJTbnU5akdXYmY5N2ROckxG?=
 =?utf-8?B?dzN0NW9EakN3b1RKeVE0SzR6ZTZpWTl1bG9ham42QzV1TWlVL2RCUFdXZWMx?=
 =?utf-8?B?U01abUxsN2lIdTJGOEFvSzNUZDdFVVNhVDROOVRhU3VjalM4bmpwTVhKWWs3?=
 =?utf-8?B?Qk1rWnRTdnF4Z3NPcFdOaVU0RkovOFJjQ3RUQUp3ZmN5anJyaFN2UmZpNVRS?=
 =?utf-8?B?MWFucldrN3FHWTg5UmRuS2JETC9HMGVsVzJBK0IzdFU0cndQN08wZnR3RW5K?=
 =?utf-8?B?N0syUDNLVW51R0N2RzdpNDlXMjc4Nk5SL2ZMS3Q3bkpUZVJldndSMEFjQkw4?=
 =?utf-8?B?MHBoQ2dmelgralR5OEpnR1BPVktNcmt0VmxKVldZZFZKWGovVUVoRGtvZDBL?=
 =?utf-8?Q?30um4C6cImcbAeHqDQEkIb32g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c652500-038b-4862-48a8-08da9568300e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 09:13:14.1570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmZDFY5MPellJcDMkc7BcOiOvIEOVIJBrSjnRbWfuz7NrG4DxmaonqdM2YZDb52bQEIdM5CSp7+2Cq5jr9F0tTaxN79bdw7gEJavZDAT4+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10636
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBtdWx0aXBsaWVyIGFuZCBkaXZpZGVyIHZhbHVlcw0KPiANCj4gSGkgR2VlcnQsDQo+IA0KPiA+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGNsazogcmVuZXNhczogcjlhMDdnMDQ0OiBGaXggNTMzTUh6
IFBMTDIvMyBjbG9jaw0KPiA+IG11bHRpcGxpZXIgYW5kIGRpdmlkZXIgdmFsdWVzDQo+ID4NCj4g
PiBIaSBCaWp1LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+DQo+ID4gT24g
VHVlLCBTZXAgMTMsIDIwMjIgYXQgOTo0NCBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiBBcyBwZXIgdGhlIEhXIG1hbnVhbCAoUmV2LjEu
MTAgQXByLCAyMDIyKSBjbG9jayByYXRlIGZvciA1MzNNSHogUExMMg0KPiA+ID4gYW5kDQo+ID4g
PiBQTEwzIGNsb2NrcyBzaG91bGQgYmUgNTMzIE1IeiwgYnV0IHdpdGggY3VycmVudCBtdWx0aXBs
aWVyIGFuZA0KPiA+ID4gZGl2aWRlciB2YWx1ZXMgdGhpcyByZXN1bHRlZCB0byA1MzMuMzMzMzMz
IE1Iei4NCj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNoIHVwZGF0ZXMgdGhlIG11bHRpcGxpZXIgYW5k
IGRpdmlkZXIgdmFsdWVzIGZvciA1MzMgTUh6DQo+ID4gPiBQTEwyIGFuZA0KPiA+ID4gUExMMyBj
bG9ja3Mgc28gdGhhdCB3ZSBnZXQgdGhlIGV4YWN0ICg1MzMgTUh6KSB2YWx1ZXMuDQo+ID4NCj4g
PiBEb2VzIHRoaXMgbWF0dGVyPyBJcyB0aGVyZSBhbnl0aGluZyB0aGF0IGRvZXNuJ3Qgd29yayAo
d2VsbCkgYmVjYXVzZQ0KPiA+IG9mIHRoaXM/DQo+IA0KPiBZZXMsIFNESEkgcGVyZm9ybWFuY2Ug
Z29uZSBiYWQgYXMgaXQgc2VsZWN0cyA1MzNNaHogY2xvY2sgaW5zdGVhZCBvZg0KPiA0MDBNaHou
DQoNClR5cG8gcGxlYXNlIHJlYWQgaXQgYXMgaXQgc2VsZWN0cyA0MDBNSHogaW5zdGVhZCBvZiA1
MzNNSHouDQoNCkNoZWVycywNCkJpanUNCg0KPiBTaW1pbGFyIGNhc2UgZm9yIFJaL0cyVUwsIHdo
aWNoIEkgYW0gdGVzdGluZyBpdCBub3cuDQo+IA0KPiBQcmV2aW91c2x5Oi0NCj4gNTMzMzMzMzMz
LT5zcmMgY2xrMA0KPiA0MDAwMDAwMDAtPnNyYyBjbGsxDQo+IDI2NjY2NjY2Ni0+c3JjIGNsazIN
Cj4gDQo+IE5vdzotDQo+IDUzMzAwMDAwMC0+c3JjIGNsazANCj4gNDAwMDAwMDAwLT5zcmMgY2xr
MQ0KPiAyNjY1MDAwMDAtPnNyYyBjbGsyDQo+IA0KPiBJZiBJIGFtIGNvcnJlY3QsIHdpdGggd3Jv
bmcgdmFsdWVzLCBpdCBlbmRlZCB1cCBpbiA1MzMzMzMzMzIocGFyZW50IHJhdGU9DQo+IDEzMzMz
MzMzMyAqNCkgYW5kIHJlcXVlc3RlZCByYXRlIDUzMzMzMzMzMyBhbmQgaXQgc2VsZWN0ZWQgYmVz
dCByYXRlIGFzDQo+IDQwMDAwMDAwMC4NCj4gDQo+IENoZWVycywNCj4gQmlqdQ0KPiANCj4gPg0K
PiA+ID4gRml4ZXM6IDM3M2JkNmY0ODc1NjJlICgiY2xrOiByZW5lc2FzOiByOWEwN2cwNDQ6IEFk
ZCBTREhJIGNsb2NrIGFuZA0KPiA+ID4gcmVzZXQgZW50cmllcyIpDQo+ID4gPiBGaXhlczogZjI5
NGEwZWE5ZDEyYTYgKCJjbGs6IHJlbmVzYXM6IHI5YTA3ZzA0NDogQWRkIGNsb2NrIGFuZCByZXNl
dA0KPiA+ID4gZW50cmllcyBmb3IgU1BJIE11bHRpIEkvTyBCdXMgQ29udHJvbGxlciIpDQo+ID4g
PiBGaXhlczogMzFkNWVmMmY1NjVkMjMgKCJjbGs6IHJlbmVzYXM6IHI5YTA3ZzA0NDogQWRkIE00
IENsb2NrDQo+ID4gPiBzdXBwb3J0IikNCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+ID4gLS0tIGEvZHJpdmVycy9jbGsv
cmVuZXNhcy9yOWEwN2cwNDQtY3BnLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMv
cjlhMDdnMDQ0LWNwZy5jDQo+ID4gPiBAQCAtMTEzLDEwICsxMTMsMTAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCB7DQo+ID4gPiAgICAgICAgICAgICAgICAgREVGX0ZJWEVEKCIub3NjX2RpdjEwMDAi
LCBDTEtfT1NDX0RJVjEwMDAsDQo+ID4gPiBDTEtfRVhUQUwsDQo+ID4gMSwgMTAwMCksDQo+ID4g
PiAgICAgICAgICAgICAgICAgREVGX1NBTVBMTCgiLnBsbDEiLCBDTEtfUExMMSwgQ0xLX0VYVEFM
LA0KPiA+IFBMTDE0Nl9DT05GKDApKSwNCj4gPiA+ICAgICAgICAgICAgICAgICBERUZfRklYRUQo
Ii5wbGwyIiwgQ0xLX1BMTDIsIENMS19FWFRBTCwgMjAwLCAzKSwNCj4gPiA+IC0gICAgICAgICAg
ICAgICBERUZfRklYRUQoIi5wbGwyXzUzMyIsIENMS19QTEwyXzUzMywgQ0xLX1BMTDIsIDEsIDMp
LA0KPiA+ID4gKyAgICAgICAgICAgICAgIERFRl9GSVhFRCgiLnBsbDJfNTMzIiwgQ0xLX1BMTDJf
NTMzLCBDTEtfUExMMiwgNTMzLA0KPiA+ID4gKyAxNjAwKSwNCj4gPg0KPiA+IEkgaGlnaGx5IGRv
dWJ0IHRoZSBhY3R1YWwgaGFyZHdhcmUgaXMgbm90IHVzaW5nIGEgYnktMyBkaXZpZGVyLi4uLg0K
PiA+DQo+ID4gR3J7b2V0amUsZWV0aW5nfXMsDQo+ID4NCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydA0KPiA+DQo+ID4gLS0NCj4gPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tDQo+ID4gZ2VlcnRAbGludXgtIG02OGsub3Jn
DQo+ID4NCj4gPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhDQo+IGhhY2tlci4NCj4gPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvcg0KPiA+IHNvbWV0aGluZyBs
aWtlIHRoYXQuDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcw0K
