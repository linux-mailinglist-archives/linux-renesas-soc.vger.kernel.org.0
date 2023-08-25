Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B08E6788214
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 10:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbjHYI3R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 04:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbjHYI3G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 04:29:06 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072C92102;
        Fri, 25 Aug 2023 01:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c78gDAETZhO6VIxqTv3DFzAPOKRiriIYQB51jd+D5HWov9x4cxjxyzOiMyTJZxOUJLPYSrztSqSymdejK3T29Zf9x+pYC/CKkE6iLeo2yKLSqYPAkqqWV6MKX/5XXeu0lu7FBLfYX1fKQ4daZM6oNfxebmNJNj6gO1ZKr2ru4HxUo7GRHb2OTpEaIpJPyvG6vNx4CEFn9QlGu8QhuamacEPd1j8HiukYl9UFaxApjik/2GUbH0m4VBUvf5metD/n8+enqYCuGXXTDhIuMCqzWmxh726v8tqMCrGW562VyrRD+X/HIBGtof8KiybRI8uqfyTZJpYMe1zk7gJQt6AfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIoL87vB0D1LMaZt8yQRUtS9TrEnQfM8hc7/oIfmEsE=;
 b=VdBryolpafWjzZuZB9QJ7dhbGUqQaKPS1VPAVDJinTKpQgvY0Mz3VYLRxE0pocuyUPxW4nVogI3Nl5ihBUqX9u/dvghMXwKsQoxpM6JzkJzT7n3bgbip2dMg5Vnj/x6tvex0bIkaOg31EflF72ZcEH9EE2Of+eWiQVoDsLRWFyvZxmaaR8AwBT3tL9UppV2mS+IN/xVOGkj0tcRxYnVWIsTS5HQE5hw6aiCAKSeqGjgiMSObMf9uDpU8Op0eArV95f/wfUSVZGJZqVdfxGUubvU68O5YIiHX3Z+lNJaYpRXjCtWCsx2pJJkUao7itHGCLm2HFdZxrb5lDa5IR8rUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIoL87vB0D1LMaZt8yQRUtS9TrEnQfM8hc7/oIfmEsE=;
 b=e4Ck32PptHNQXxJ0FGRU46y8OC+qSTprikGkzdc8qYIiCfD776B1tZ+kbtG+XwshY+0SKjsFXWXFVSpvLXEJQQ5BuW1txru07oBbe2/lLv/ui8rzMo8rCUFzaMaUHxD4WyNYQVOqXtbXqvA/tS04+ji6QRa/VSLqtZgtSzTsJzE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9608.jpnprd01.prod.outlook.com (2603:1096:400:19b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 08:28:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 08:28:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: rz-smarc-common: Use versa3 clk
 for audio mclk
Thread-Topic: [PATCH v2] arm64: dts: renesas: rz-smarc-common: Use versa3 clk
 for audio mclk
Thread-Index: AQHZ1qX5FSKUroXjUUyHmYSGtcljEK/6n3SAgAAIG2A=
Date:   Fri, 25 Aug 2023 08:28:54 +0000
Message-ID: <OS0PR01MB5922FF2335A142BB2F57480286E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230824161344.382188-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV_dW8j1+5VJ84+YkTRZQ3oZ=U19yNfaOEn6-X_fAbLBw@mail.gmail.com>
In-Reply-To: <CAMuHMdV_dW8j1+5VJ84+YkTRZQ3oZ=U19yNfaOEn6-X_fAbLBw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9608:EE_
x-ms-office365-filtering-correlation-id: 7be82724-71bb-4565-9aa4-08dba54551ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CV7OgR2uOJPxzVdRwGyNbCLFhr8VzYtsEePzpT7M9pI6IkgRzB2V+qUF47M7OgfZV+n3Jdm/ePA5Ba8wbM+Og1+o8VlaptRJyYKF23L6Ea8lpHSsZ34M9d4m/t4F2a39Ose9xXO+tAPwknHAFyaXegoVT6hNeJYgb+33mK2Wa85qM7JcSa/V8GyIqyHBePNtj04IFrS3DPFm75iEY+MrhRs74lT26HMfG48XltaPTFAa7ln1y76HTeSdYGu9nI7NKB300ET67+/UqwzUX2QxdG8lGZp6nKghA5bfppt9gS5Kd55siX6fWdAzSiVu5Dsc8+3C4GrI5cIuPpH79wW5N6qCjeA+XOL/Kutdzo1JhGqzWVXIQqC6I9BYE1NNALIRItbfqeftbXCdSfdAKY/+XPCAFhhHwgZjeAzyApDnsk2j4bIHeHR2AXTKTEXY6DVMvZ45g8ErPMGaoY959tkBGIJLhVKAZBftttIwdGJWfxUSSm0YUzidd3A7UUR6CoEh2xu0uw5Q1p0e7MnRJliqSfut2YR23VOqybHST9ty+pAre7TxpA2LUNWtvJgkKUZF08rhoKAHoPUClKQKBaElBtLNz5nuwO4VltUdvXrR6hJkq7vncYb9TkQYZXph5l9gTEoKRkL4UEtz44ld1UMtMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(451199024)(186009)(83380400001)(9686003)(26005)(478600001)(55016003)(5660300002)(52536014)(107886003)(966005)(2906002)(8676002)(8936002)(4326008)(38070700005)(38100700002)(122000001)(66476007)(66556008)(66946007)(76116006)(6916009)(86362001)(71200400001)(41300700001)(64756008)(54906003)(6506007)(53546011)(7696005)(66446008)(33656002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXZ4aTBYRXdzSlpkeVdqZVA2RTd1eFVWZFBLRjFXYWhqTXZQWmNEZGJ6QkZJ?=
 =?utf-8?B?eDl0blUrVXFncW54VTlNbFZEemJ5TnZkZEZ0Y2pvVVUrS2tjSGxSdlQyTlRa?=
 =?utf-8?B?bW5aOGFJYTZPcWV6QU1tWk5UM3FuWTlCM2dSelNweFhEbFBDNkgvbjlyZWRw?=
 =?utf-8?B?eGlRWFhyR2lmNmJ1VUtVc2trS05LZ2xiTnNKVVljY1QxQzB3ZzFhSUtMaWoy?=
 =?utf-8?B?UFIwRElLVkEya21JUGtta0wyQ0hOUkI2RWVLQUxLL2lUNld1azFheFhLSVZS?=
 =?utf-8?B?WXBRK0hPc0VaQXlFSFVUVFBMRE83UGZTUTlWaFo3a2RSQ0c2V1FrSlVyaW5I?=
 =?utf-8?B?NFJnMzZ6Yzk2UVNXTkZkNy85a1VzVFhkVGVNcGFndkFQVXlud3BQanpnSm1z?=
 =?utf-8?B?c0VnLzhqS1pRSW92OEEwQnZTaG9IMTBHSWJSR3hxMTN0T2pzZjNiQUIwT1Qz?=
 =?utf-8?B?NTk0Z2I3bXd3QUgzRmNOWURUZ2VPdjJDeWp4ekVpRDV2NXJUOUUxbWRJaWVp?=
 =?utf-8?B?SXlxdWl5MmpNK2NmUjNMelgxNUppWFZPbUpCbEVsQjBGVjFnL1dSYW1zM2RL?=
 =?utf-8?B?d0xLZ0k4UzN4VU13ZG9YbnptR0tTdGZGWFFYTExEMnIweVRVbjNaOFZ2YlZI?=
 =?utf-8?B?TjhTOXlVL1VhK1FzZGpvcWNiQW9Ma1NPL0d3eXlzRjRGVHBjN2JlVktlNDlY?=
 =?utf-8?B?eWJaNE9weHZNQ01paTkycEFNL1FFMDB0Z1M5KzRaRll1Si9SUHRqK211NkFU?=
 =?utf-8?B?N2dPRHNVMGJ6WDBZem9RdnRpQ2k4dnV3RHF5eHdMK2ZKVy9tZkx2RFBieGFH?=
 =?utf-8?B?eTMrVjBaT0tFU1RXR1pZVzZVRXNsa1JyRHJiUjRXZFpOcFoxZVl4d001OFRu?=
 =?utf-8?B?VlFUSGJoN3A1RzB5TjdYY2F6Z2I3aHM4VXZUSkpvcjFTdnVDTHNmQ1BoMkkz?=
 =?utf-8?B?Y29vYk1JK0dBZFhGNFMxL0ZWV0lLbGs4REFRd203K3ZFVWdBVzBCMmo0azR0?=
 =?utf-8?B?ZWJjVStKZUFmS1gxL0Y5UjIycUZPNmNBcjg5N2JlWGYwelVuTERVV3FWYU1y?=
 =?utf-8?B?RlBUSGQ0aEEvYXMwbDQxU3RuSlNWYW5DOWlndlgzRUhmMEV5M2RmVzBrcGJN?=
 =?utf-8?B?MlRGNWpOTDcrRWZXMWkzMG41VTBrczVxQ2Q3VUpZZDIrVlJpMzFmemd5eVBE?=
 =?utf-8?B?elBkUFNteHF6U3RHOGo1U003L0Z4T0VaNEo3M3dRTVFGZHdqMzhNb0E5V1B5?=
 =?utf-8?B?Qis1bUhYOVd3VFhOSlE4Wkg0K3RGbys1MDExK255TU4wNjVOTG5PQjJIR1FI?=
 =?utf-8?B?K3VORlZueThtSGlJL3VyZ3BFSmlLdzd2S0hHWUVYSkN0c1M2WVpHcGEwOHFC?=
 =?utf-8?B?RXU1YWV6NFBCUXFxZDdBeGc5d2RLMXl1L0ZpOTd4eThIemF5b2FqZzRTL0pB?=
 =?utf-8?B?WVFITlZhVVZUbEJEZCtOQWdSVDdrVVJFcDI3WHBtL3luWG5RMEFYdm9SNHNw?=
 =?utf-8?B?SVU5QTJFenErclljNktDVmo2L3VwSjdjSFRhMm8zY0NOWDFtRWJkYWNZYWd2?=
 =?utf-8?B?R3Z1dGp1MFhZbW5IQjlsaUZueHVzTVlkQXFkR0QrQ3dkNkpTU0hxaFhMTnlx?=
 =?utf-8?B?ZmpJRGxqSkd5WHVzbzhCcjJ5NE01eDFlL2dkdTBvWlJxWnVnbDJtMW5GbzVk?=
 =?utf-8?B?RWZ0M29QZjVhV0l1Rmw1M082TTVDZm8yT0xTVXFrTGJZanlPaTVHMG81RXFv?=
 =?utf-8?B?bDFMQmUzNFFLRjJoRjlJczlDdFd1UkVIOFI3ejJjcTF5L1orZE12TmQvRllW?=
 =?utf-8?B?OUdYZkowSk1OV053N0NtNi8vaThMSnF4QTNUQ2xYQ1R4Q05vWndESjJ2aWpn?=
 =?utf-8?B?L1Z3dTBnUUZDNU1tVVVBa3QzUi9TUWhxWTJlS3Vzc01SbzdPekdlcVZNK3FW?=
 =?utf-8?B?YkYvbHpXdEk5b2hGbkdaMlI1STlhUGRCMXQ1VzJQV2tNanMyaHBXNXZwazVz?=
 =?utf-8?B?alMzZENWTERBazZON3hDdVRGKy82alBpenhSUWgxZEJhak1TT3ZFbkxCbUxI?=
 =?utf-8?B?MEJhOXFLNEh0SmNaSzh1aU9tTDlMQldHaW92SHJTOThydzFGUzFja2NUeFRP?=
 =?utf-8?Q?+2/N5TnrXYGAHOMYaPsiGsQPq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be82724-71bb-4565-9aa4-08dba54551ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 08:28:54.8384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8juoyPHScKVD/hJPXvjQxBxvsMRG3LF8pCfBw4jvz2YK/9OWYFY7Yg4AG+Ql3AikFeQTzNbeiDIS0SDRdTU8mVz1YpWNjlyWnwXB4fq3d0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9608
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyXSBhcm02NDogZHRzOiByZW5lc2FzOiByei1zbWFyYy1jb21t
b246IFVzZSB2ZXJzYTMNCj4gY2xrIGZvciBhdWRpbyBtY2xrDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gT24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgNjoxM+KAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQ3VycmVudGx5IGF1ZGlvIG1jbGsgdXNl
cyBhIGZpeGVkIGNsayBvZiAxMS4yODk2TUh6IChtdWx0aXBsZSBvZg0KPiA0NC4xa0h6KS4NCj4g
PiBSZXBsYWNlIHRoaXMgZml4ZWQgY2xrIHdpdGggdGhlIHByb2dyYW1tYWJsZSB2ZXJzYTMgY2xr
IHRoYXQgY2FuDQo+ID4gcHJvdmlkZSB0aGUgY2xvY2tpbmcgdG8gc3VwcG9ydCBib3RoIDQ0LjFr
SHogKHdpdGggYSBjbG9jayBvZg0KPiA+IDExLjI4OTZNSHopIGFuZCA0OGtIeiAod2l0aCBhIGNs
b2NrIG9mIDEyLjI4ODBNSHopLCBiYXNlZCBvbiBhdWRpbw0KPiA+IHNhbXBsaW5nIHJhdGUgZm9y
IHBsYXliYWNrIGFuZCByZWNvcmQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICAq
IE1hZGUgVmVyc2EzIGNsb2NrIG1hcHBpbmcgYXMgcGVyIEhXIG1hbnVhbCBhbmQgdXBkYXRlZCBj
bG9ja3MNCj4gPiAgICBwcm9wZXJ0eSBpbiBjb2RlY19kYWkuDQo+ID4gICogUmVwbGFjZWQgdGhl
IG5vZGUgeHRhbC0+eDEtY2xvY2sgYW5kIGxhYmVsIHgxX3gyLT54MSBhcyB4MiBpcyBhDQo+ID4g
ICAgZGlmZmVyZW50IGNyeXN0YWwuDQo+ID4gICogVXBkYXRlZCBjbG9jay1mcmVxdWVuY3kgPSA8
NDAwMDAwPiBmb3IgaTJjMCBub2RlIGluIFJaL0cyVUwgU01BUkMgRVZLLg0KPiANCj4gVGhhbmtz
IGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gSSdtIGEgYml0IGNvbmZ1c2VkIGJ5IHRoZSB2ZXJzaW9u
IGFuZCB0aGUgY2hhbmdlbG9nLg0KPiBUaGlzIGlzIHRoZSBzZWNvbmQgdjIsIGFuZCBhcHBhcmVu
dGx5IHRoZXJlIHdlcmUgYWxzbyB0d28gdjFzLi4uDQoNCkFzIHlvdSBzYWlkLCBpdCBzaG91bGQg
YmUgdjQuDQoNCkkgd2lsbCByZXNlbmQgYXMgdjQgd2l0aCBmaXhpbmcgY2hhbmdlIGxvZy4NCg0K
djQ6DQogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJlbmVzYXMt
IHNvYy9wYXRjaC8yMDIzMDgyNDE2MTM0NC4zODIxODgtMS1iaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbS8NCg0KdjM6DQogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LXJlbmVzYXMtc29jL3BhdGNoLzIwMjMwODE3MDkwODEwLjIwMzkwMC00LWJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tLw0KDQp2MjoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1yZW5lc2FzLXNvYy9wYXRjaC8yMDIzMDgwMjEyMjUxMC4yNzU0MjAtNC1iaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbS8NCg0KdjE6DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtcmVuZXNhcy1zb2MvcGF0Y2gvMjAyMzA3MjYwODA4MzIuMTIwNjY5LTEt
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20vDQoNCkNoZWVycywNCkJpanUNCg==
