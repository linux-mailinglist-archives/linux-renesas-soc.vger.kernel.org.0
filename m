Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADBC5B78DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 19:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbiIMRwy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 13:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233551AbiIMRwe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 13:52:34 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1EB5D0EB;
        Tue, 13 Sep 2022 09:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek+MKJ/wjfutA3rSWNNEGITnFWQUPZXLXVHFT85/upAbad19AX3BVIXAxd4ZgdODb90+UPVnYDTJ/vJ+/2QR8AZIJO+rEcLhfXInFGncSnB3k1Dt4SQnU2i1zYdrwZx8e/EfkmGBLSlyqwskA53VlBdO9J5Q91O3M3rzYlCoEmC+HvlPJWCX8T7DLbs7wDkvvIIh4GIKlgnZ7ehzTxCZQL4nleDv+lAYNWo+KK70g3Md/8r2sEO88PmrupDu64QH2mQvTJc0iQpe4QJA6+lWV0nw50ptrc+1PsflhXeDbPQ56abkvqhU/7IwsuKUjTw6BBHsa3MkybRvnt8eRAqu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPXYhD92OKvx6qobK3ySyjn66Nk4Cu/UNoFJdZRLGJs=;
 b=hZ4IkD7+DQfdui0f7gC+SuSAzZFqZcyqC6xQO8U7WseMV/Q7g5FNKs7hetjOwcG5Ci7ntwYPCjauMELECUUPlJa2ab/UIpFEeL3X1AhaWLCcMJlC0vCnlW8f3/JUMWVXTTBrOg2C5TyScvIhswYzfsF36mMAvtVm0CWleRXCU3dS9hgKQUhCdWlhn9EsnxSxLB1fxcVP8XCVjggxbviSYpkuc3kRXBqvZ2GJAXX5gq6lRtz9hnmno/dbhWAxWYBt/1MdhIx7yshoyVg+941lkdDBuHu731Abg2nlIH6Sn9FqGZVcbJyj64qem7S9HlYIdlaYkGoL+6vIcPLVxLQeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPXYhD92OKvx6qobK3ySyjn66Nk4Cu/UNoFJdZRLGJs=;
 b=Z3H8bXdPzhBLkqqkFRs6PbTvpPma1vpAViRETUAw35w2GY7VJArB0cWbacP7XGPNDdGSEADO9j1JWoabnA2WbjMQHCBKPJCWhiNYJNH3m5VlaH47FWm/GKXctu0PZv4KBxLS00blVWYgncxa/Wr8H4Hvin8e/jPuHxn3BdCUuYM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9494.jpnprd01.prod.outlook.com (2603:1096:400:1a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Tue, 13 Sep
 2022 16:51:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 16:51:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Topic: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Index: AQHYx00SZzRJbu1f4Een84uOmb7F263dDxQAgAABfCCAAArXgIAAAUtQgAB0H4CAAAG+sA==
Date:   Tue, 13 Sep 2022 16:51:50 +0000
Message-ID: <OS0PR01MB5922176670A9BF68D77A6FE786479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
 <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXdAt5kfgPbyY-ragOL=abS_GUg4U_E1ovA3Ps0sZqHhg@mail.gmail.com>
 <OS0PR01MB592232E7F1F06F53463FBCC986479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU5c=S9m+4w7vvkEPsFjuBZKsunRYK3pivxEDvr_1JJYA@mail.gmail.com>
In-Reply-To: <CAMuHMdU5c=S9m+4w7vvkEPsFjuBZKsunRYK3pivxEDvr_1JJYA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9494:EE_
x-ms-office365-filtering-correlation-id: dcba68a6-ef9c-453e-50e3-08da95a8412e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OFFLZhGz+BAlQgsKs2Ke3pcVbDa2TVOUmpQYzofO7k/oMD8wt4lPKC/fALLqSCo47r+6eVk14/TXDGuSgJ89wmIbd1+fdQlEoD9gV5Qm9xswi+VouU/abluMzjjQ2v//upnZtLVxcMb7hErGhnpWCu3oxR1TX7g8UxU1zK/+76zF82OGUbtlDjgfIV/9V8+RuyfuJFlxzLumrzKXF+xaFYFU7ZJagXStgqbhTIqkaCZZAA+Sk8MAK0pV5BqoEm3ApJ3kjoxe+4OVLPISdMF2qN0q8DyvpBRpK8IWTitYdwAwnJ1Otjxg9E8B+AKdM8NCJRsUFDbSy5V/wOOttUHScwNOY/gwwmD/oSNr8g6xjbcyDZkAIkqZIOtTATlPYyl5dFZpV/HUO/QtC7qIKdhE3htMueDbxb0wJyo+zv/FKEYQgTxXhzQyeAjfULnXZ5kfOwb5fT9IaWTdgRbZ0mnrwRqTPVkpPjVAJv2o7k5nsE+K58KCHUpHweWCZTpzYScdFt071IoOpxUrZvTthDXb/HiARDG8bxl+CX3HhGf2r7xeeUNO6pqquI04k6wRZPt0jcUqTPLtoyosrqyAwqKzIxCr114Sf3KBYNtN3CE6y4i4bZcIZBZtlyRL2peB8QCUW2N7OzHeGnN47LtX8Xd7ns9hJErICyMjS1wunvqTymCfESHyK+Uh1iyiJ9ufYJbvnZ2YE6qh+5m07NwJ1LAWz/WwZ9DmUGXk+xlAieB9ua61NHXgGwEA33sggFphKApgyhbnDT1rk6GqDOzgqTSRddAeNyX3wXQKNKJhHB5cL2fXliZMQMRLza2JAet/Ko0L
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(33656002)(7696005)(55016003)(6506007)(9686003)(38070700005)(26005)(38100700002)(6916009)(66446008)(53546011)(478600001)(71200400001)(8676002)(64756008)(66476007)(41300700001)(66556008)(54906003)(186003)(66946007)(83380400001)(8936002)(52536014)(5660300002)(122000001)(4326008)(76116006)(86362001)(316002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STZwWXY4bTNtTzlmZVFtOEhVM2x5VTJrUUdsNkVWWXJhREpHMG9PbFZDTmVO?=
 =?utf-8?B?ODB1bjFHZ1A2SXlYVmlHTWhTTjlZVVFJbklEWFVHNWpjc2Y5eE02SHBDT0dM?=
 =?utf-8?B?U3VpMXkvMGNwNThHT1EzVW5XVW1SeFQwbllmbmFlSmtVMTNvRW1pMElLcnFB?=
 =?utf-8?B?andib05aYXVCdUpCakFja0JmSVBoSWxSaXFBVFRmTlJHSzF3UVVyRGRGbWZm?=
 =?utf-8?B?T0l2RWpRVDhpVG9VME1rdUFsWnhqa0YyZWZCWE1qRkVFbEU3TjArQ2FKSU5n?=
 =?utf-8?B?b09DdjlwYTlSbDh4TDFVMlBDaytPTitxRWhXNUlhK01MU3NJS3pTeUNqZnBH?=
 =?utf-8?B?SXNocVR4ZzhHYjQvOWM1Nkg1Um5aZ1lSOVhrMFJpQjBhV0xmNTBIdUNXMVpt?=
 =?utf-8?B?UXNxK3JIMDB6QUg1TDRNTHczNk5yMFNldmdabThXK0xyeVlFKzZLVEZBSGZm?=
 =?utf-8?B?a0x2YVJOaEhIY2hqbks2VjdMajNvcTY3R3RUUUl1T1BERHpsSHc4RnBBUXFY?=
 =?utf-8?B?RDNpRGNKZVQ4bzc2QmFVMkRRT2g4N2hkOFV6dk14V0wvbGkvMHNlUmxkREpq?=
 =?utf-8?B?bDNDOE94aFZFM2pjREhENVhROGhTODNzRDE3UEV1eHZCMGtYS1kzbFJrSktD?=
 =?utf-8?B?M0JpR2hPQXg0Sm8wUXd1aWdTVmw1WjVkSXphZUgvY3VobW40S0crTzdlRUV6?=
 =?utf-8?B?T0UwcC9NNElCNlE2QmVJQUZMVFB4Y29KN3Q3bnhhNU9JR0lzd1dpWG9SNmYz?=
 =?utf-8?B?OGhEbFMvUjh0RlRmMk0vZUg2VXNubFhHYUtoRlRnN2xtUkVBdE9WSTJiRXlw?=
 =?utf-8?B?SmJDNVM4VXgycUhONmxmSTd0UnhkVERWWXlmUHpvUDNnN1V4ekMydmptSkpk?=
 =?utf-8?B?OGVsdkZGTm9jTXQvczZuTk1hb055TndCTTQyeXByb3kyTDdjZkx3TzFSR1kw?=
 =?utf-8?B?RFlQMjlaSHdtVUxWSC8xUnRGUmRPdGk2bUlQdlltdUtzUG43VVlCWWtGemJ2?=
 =?utf-8?B?U05vMFlMYURFeDY3WW9OWWZ4SXJsWjU0bjNxUzZTbUlnNlpXWTBlRVlUdHNC?=
 =?utf-8?B?VVdMdXRDT0xrZjhyTUt6SkhMS3R4aENDZTY1MmwzVnRGWjZRS1haaXUzTFRl?=
 =?utf-8?B?SGYvMnd6MXdZeFFOZnRXYnlPZW1iSDNZWXZwb0ZXbCtLbDlHNXJwUWZURmQ3?=
 =?utf-8?B?aExqSEt6UTQ2cUV4S3pSL084Q1ZrelQrYjBXQS83eDlMU2Q4MVIzNzU1S3hw?=
 =?utf-8?B?RzZSb2ZVdUkwRG1ZbmZrbTMrUWtRWlFKQzQzQnBVa0lKYmorRXZFenJrMkRn?=
 =?utf-8?B?c211VjdPdEEzZE5ncFkxNENvczZlekFwTU5peEVpei9Eck8vcXZHSTVEb0tR?=
 =?utf-8?B?M3dzb1JXdUlMVjI4NFJHNkZPczRMSFU4dTdhZnFsWFpQSnhmc0lKTGVrVDZF?=
 =?utf-8?B?ZnU4ZkRkT0ZIRVZqRmN0MHM3N1J3ajVOa1JwWlhQUlorY2FzeE5LOUJaSnFX?=
 =?utf-8?B?RVdYM1VuSExLbkN2VkRmNTNXNlA2UEFLQTFXYkhQVis1VWpLQ3IwL0pJSUdn?=
 =?utf-8?B?U1duUlh2QmcwYmQ1T0lqb1czRWdiNzYvdjd5RlhoR2dCeWtXZm9peWE3Vnpt?=
 =?utf-8?B?dVRtTno5T2RWbkFSN2d5bmUrakFWVkg3Z0pxZFpxN0wvRFdQN25LZ05KWTls?=
 =?utf-8?B?OXpQRGN2amJSQlYyTnRHSUhqaEJScHIzMnlXVXVZa1VKR3hlTzRxY0J3aWpw?=
 =?utf-8?B?OWdzVHhDTW8zb01MYnRmWU1nSTFjb1p5R0lzSGduV1FwOEJqam9TSVJQdGRJ?=
 =?utf-8?B?RnBuRC9RYVkxTWR1WWZvRndUV3NKWTd2TU9YU24rc21UZWZMZ0VjNUNVVDRw?=
 =?utf-8?B?Kys1dHc5NkVRMWlKTjc3T3JYczZ1WlAwQTFOK3VHVlZyU3R0OFFwa3I4RWFt?=
 =?utf-8?B?YW5OVXJwZWJzb1d3clVrci90UUxLTVZhL0llZDVTSjZaaEs0SUJwME5IUEQ2?=
 =?utf-8?B?TFdnOWJBSlN5N2pISmtYczFVeUxhdUZjdThhbmdkVmpwc0FIQlV3Qi8xSmgv?=
 =?utf-8?B?UE5sSHV5SDhoSTFWdjRvN0JiL0xBT3IwL2Z3dXAwQlZ1bVc2dUxXTFNQcWhD?=
 =?utf-8?Q?ORAMKceywex8I7OGbDEzrCXHI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcba68a6-ef9c-453e-50e3-08da95a8412e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 16:51:50.6788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2nXLm7ZPStJ8Bs/WTK8JV3mnwFzpCdnbNUvtdOjlOdxlGzYFZJO/PT6cAm73j9HuhcaER85n21fOjDkUo0Ehd6qjaq9dQPzPJYaio2gHi4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9494
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gY2xrOiByZW5lc2FzOiByOWEwN2cw
NDQ6IEZpeCA1MzNNSHogUExMMi8zIGNsb2NrDQo+IG11bHRpcGxpZXIgYW5kIGRpdmlkZXIgdmFs
dWVzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBTZXAgMTMsIDIwMjIgYXQgMTA6NTgg
QU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGNsazogcmVuZXNhczogcjlhMDdnMDQ0OiBGaXggNTMzTUh6
IFBMTDIvMw0KPiA+ID4gY2xvY2sgbXVsdGlwbGllciBhbmQgZGl2aWRlciB2YWx1ZXMNCj4gPiA+
DQo+ID4gPiBPbiBUdWUsIFNlcCAxMywgMjAyMiBhdCAxMDoxMSBBTSBCaWp1IERhcw0KPiA+ID4g
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gY2xrOiByZW5lc2FzOiByOWEwN2cwNDQ6IEZpeCA1MzNNSHogUExM
Mi8zDQo+ID4gPiA+ID4gY2xvY2sgbXVsdGlwbGllciBhbmQgZGl2aWRlciB2YWx1ZXMgT24gVHVl
LCBTZXAgMTMsIDIwMjIgYXQgOTo0NA0KPiA+ID4gPiA+IEFNIEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+IEFzIHBlciB0
aGUgSFcgbWFudWFsIChSZXYuMS4xMCBBcHIsIDIwMjIpIGNsb2NrIHJhdGUgZm9yDQo+ID4gPiA+
ID4gPiA1MzNNSHoNCj4gPiA+ID4gPiA+IFBMTDIgYW5kDQo+ID4gPiA+ID4gPiBQTEwzIGNsb2Nr
cyBzaG91bGQgYmUgNTMzIE1IeiwgYnV0IHdpdGggY3VycmVudCBtdWx0aXBsaWVyIGFuZA0KPiA+
ID4gPiA+ID4gZGl2aWRlciB2YWx1ZXMgdGhpcyByZXN1bHRlZCB0byA1MzMuMzMzMzMzIE1Iei4N
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIHVwZGF0ZXMgdGhlIG11bHRpcGxp
ZXIgYW5kIGRpdmlkZXIgdmFsdWVzIGZvciA1MzMNCj4gPiA+ID4gPiA+IE1Ieg0KPiA+ID4gPiA+
ID4gUExMMiBhbmQNCj4gPiA+ID4gPiA+IFBMTDMgY2xvY2tzIHNvIHRoYXQgd2UgZ2V0IHRoZSBl
eGFjdCAoNTMzIE1IeikgdmFsdWVzLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gRG9lcyB0aGlzIG1h
dHRlcj8gSXMgdGhlcmUgYW55dGhpbmcgdGhhdCBkb2Vzbid0IHdvcmsgKHdlbGwpDQo+ID4gPiA+
ID4gYmVjYXVzZSBvZiB0aGlzPw0KPiA+ID4gPg0KPiA+ID4gPiBZZXMsIFNESEkgcGVyZm9ybWFu
Y2UgZ29uZSBiYWQgYXMgaXQgc2VsZWN0cyA0MDBNaHogY2xvY2sgaW5zdGVhZA0KPiA+ID4gPiBv
Zg0KPiA+ID4gNTMzTWh6Lg0KPiA+ID4gPiBTaW1pbGFyIGNhc2UgZm9yIFJaL0cyVUwsIHdoaWNo
IEkgYW0gdGVzdGluZyBpdCBub3cuDQo+ID4gPiA+DQo+ID4gPiA+IFByZXZpb3VzbHk6LQ0KPiA+
ID4gPiA1MzMzMzMzMzMtPnNyYyBjbGswDQo+ID4gPiA+IDQwMDAwMDAwMC0+c3JjIGNsazENCj4g
PiA+ID4gMjY2NjY2NjY2LT5zcmMgY2xrMg0KPiA+ID4gPg0KPiA+ID4gPiBOb3c6LQ0KPiA+ID4g
PiA1MzMwMDAwMDAtPnNyYyBjbGswDQo+ID4gPiA+IDQwMDAwMDAwMC0+c3JjIGNsazENCj4gPiA+
ID4gMjY2NTAwMDAwLT5zcmMgY2xrMg0KPiA+ID4gPg0KPiA+ID4gPiBJZiBJIGFtIGNvcnJlY3Qs
IHdpdGggd3JvbmcgdmFsdWVzLCBpdCBlbmRlZCB1cCBpbg0KPiA+ID4gPiA1MzMzMzMzMzIocGFy
ZW50IHJhdGU9IDEzMzMzMzMzMyAqNCkgYW5kIHJlcXVlc3RlZCByYXRlIDUzMzMzMzMzMw0KPiA+
ID4gPiBhbmQgaXQgc2VsZWN0ZWQgYmVzdCByYXRlIGFzIDQwMDAwMDAwMC4NCj4gPiA+DQo+ID4g
PiBJQywgdGhhdCBpcyBhbm5veWluZy4NCj4gPiA+DQo+ID4gPiBIb3dldmVyLCBJIGRvbid0IHRo
aW5rIHRoZSByaWdodCBmaXggaXMgdG8gY2hhbmdlIHRoZSBkaXZpZGVycyB0bw0KPiA+ID4gdmFs
dWVzIHRoYXQgZG8gbm90IG1hdGNoIHRoZSBoYXJkd2FyZS4NCj4gPg0KPiA+IFRoZSBuZXcgdmFs
dWVzKGZvciBTREhJLCBTUEkgbXVsdCBhbmQgTTQpIGFyZSBtYXRjaGluZyB3aXRoIGNsb2NrIGxp
c3QNCj4gPiBEb2N1bWVudCBSWkcyTF9jbG9ja19saXN0X3IxLjEueGxzeCBhbmQgSFcgbWFudWFs
KHBhZ2UgMjM1LzIzNikgRmlndXJlDQo+ID4gNy4yLzcuMyBDbG9jayBTeXN0ZW0gRGlhZ3JhbS4N
Cj4gDQo+IEFsbCB2YWx1ZXMgYXJlIGdpdmVuIGluIE1Ieiwgd2l0aCBhIGxpbWl0ZWQgbnVtYmVy
IG9mIHNpZ25pZmljYW50IGRpZ2l0cywNCj4gbm90IGluIEh6LiBUaGUgbW9zdCBhY2N1cmF0ZSB2
YWx1ZSBJIGZvdW5kIGlzIDY2LjYyNSBNSHosIHdoaWNoIGhhcyA1DQo+IHNpZ25pZmljYW50IGRp
Z2l0cywgYW5kIHRodXMgcmVhbGx5IG1lYW5zIDY2NjI1eHh4IEh6Lg0KPiBTdWNoIGFuIGFjY3Vy
YWN5IG1hdGNoZXMgdGhlIGFjY3VyYWN5IG9mIHR5cGljYWwgY2xvY2sgY3J5c3RhbHMuDQoNCk9L
LCBJIGdvdCBjb25mdXNlZCB3aXRoIGNsb2NrIGxpc3QgeGxzLCB3aGVyZSBpdCBtZW50aW9ucw0K
NTMzLCAyNjYuNSwgMTMzLjI1IGFuZCA2Ni42MjUgTUh6LiBBcyB5b3Ugc2FpZCBzaW5jZSBpdCBp
cyBub3QgaW4gSHosDQpJdCBtYXkgYmUgdGhlIHRydW5jYXRlZCB2YWx1ZXMuDQoNCkNoZWVycywN
CkJpanUNCg0KPiANCj4gVGhlIGZpZ3VyZXMgb25seSBtZW50aW9uICIxNjAwIE1IeiIgYW5kICI1
MzMgTUh6Ii4gIFRoZSBsYXR0ZXIgaGFzIG9ubHkgMw0KPiBzaWduaWZpY2FudCBkaWdpdHMsIGFu
ZCBpcyBwcm9iYWJseSBqdXN0IDE2MDAgTUh6IC8gMy4NCj4gQWxsIGZ1cnRoZXIgZGl2aWRlcnMg
YXJlIGRvY3VtZW50ZWQgdG8gYmUgcG93ZXJzIG9mIHR3by4NCj4gDQo+ID4gWWVzLCB3ZSBuZWVk
IHRvIGhhdmUgc29tZSByZWxheGF0aW9uIGZvciBjbG9ja3MgYXMgbWVudGlvbmVkIGJlbG93Lg0K
PiANCj4gSW5kZWVkLiBCdXQgdGhpcyBpcyBJTUhPIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBo
YW5kbGVkIGJ5IHRoZSBjb2RlDQo+IHRoYXQgbG9va3MgZm9yIHRoZSBiZXN0IGNsb2NrIHJhdGUs
IGluc3RlYWQgb2YgYnkgZmlkZGxpbmcgd2l0aCB0aGUNCj4gZGl2aWRlcnMgdG8gZ2V0ICJuaWNl
bHkgcm91bmRlZCIgbnVtYmVycy4NCj4gDQo+ID4gPiBEdWUgdG8gdGhlIChpbilhY2N1cmFjeSBv
ZiBjbG9jayBjcnlzdGFscywgdGhlIGxlYXN0IHNpZ25pZmljYW50DQo+ID4gPiBkaWdpdHMgaW4g
dGhlIGFib3ZlIGNsb2NrIHJhdGVzIGFyZSBub3Qgc2lnbmlmaWNhbnQgYW55d2F5Lg0KPiA+ID4N
Cj4gPiA+IFBlcmhhcHMgdGhlICJpZiAoZnJlcSA+IChuZXdfY2xvY2sgPDwgaSkpIiBjaGVjayBp
bg0KPiA+ID4gcmVuZXNhc19zZGhpX2Nsa191cGRhdGUoKSBjYW4gYmUgc2xpZ2h0bHkgcmVsYXhl
ZCwgc28gaXQgYWxsb3dzIGUuZy4NCj4gPiA+IGEgMC4xJSAob3IgMS8xMDI0dGg/KSBoaWdoZXIg
Y2xvY2sgcmF0ZSB0aGFuIHJlcXVlc3RlZD8NCj4gPiA+DQo+ID4gPiA+ID4gPiAtICAgICAgICAg
ICAgICAgREVGX0ZJWEVEKCIucGxsMl81MzMiLCBDTEtfUExMMl81MzMsIENMS19QTEwyLA0KPiAx
LA0KPiA+ID4gMyksDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgREVGX0ZJWEVEKCIucGxs
Ml81MzMiLCBDTEtfUExMMl81MzMsIENMS19QTEwyLA0KPiA+ID4gPiA+ID4gKyA1MzMsIDE2MDAp
LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSBoaWdobHkgZG91YnQgdGhlIGFjdHVhbCBoYXJkd2Fy
ZSBpcyBub3QgdXNpbmcgYSBieS0zDQo+IGRpdmlkZXIuLi4uDQo+IA0KPiBHcntvZXRqZSxlZXRp
bmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMNCg==
