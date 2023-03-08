Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA5F6B0C1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 16:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbjCHPEO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 10:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbjCHPDo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 10:03:44 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446885F6CD
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 07:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4KxqzgkyTMoW03IZIAIGkguENVDp160sNPu3wrfi1cyYxEu167WhSkEAHqcjVQzkJlcjK1vvT74WZ3Jf9TvJQyooOP43x4M6xJdOywn0YGZE+hbsyN95qVRhYpaURE4a7eXjLhqdaFe39J0LNVFZ7kG3wO1/c8+ZKXWcrVErbt8/WwiXZK/We0DplaIpfelpy3rVcBAFjXkizNCJzgo9z47G/oqnwx32forj7nSybnL/BvteEkUMTwXExJHK0SFj1oACKeCCM8uAlGCavov3GaMTFHbg0GolQWaLb1zyOO2qofYW5ux2q1jfBCr36sPV/6TDEFi639ZCVDHBHlaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNMlrf/9NGZaG2t01w+9t1u9dfzVv8wrQPCLZSNr4BU=;
 b=TGp1RdeIOMEg8ep9B84BI1seQ5tQ9dEXEnJKrelTfZtHcBcGI/196uwgyyePH9DEOdlf86sy70hje0MTAqdCMruCtAx3l4Tb8rYmVckkyPKiN7OkYu417KowH6kx01t0lznDi9DL5iHJSIV5lMAmBODXoQGMZ2w9olJKH8izMbal3pti8+tN86dg1hfGRXvotDteb3Q9oR39PBE7nsBNfo7fQrqkbYeFk6ojGMCHSIKRTh/gu/b3OVp2jRpkARzEsWDpFZMMnGKn0cbl9J6+ha79+umHtnXvMvRnwsvM1zNAJBHdYeTfDXqNq9yAr2LKIoBVUKp/QerSSPBh98llTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNMlrf/9NGZaG2t01w+9t1u9dfzVv8wrQPCLZSNr4BU=;
 b=XDahj1DvbaGXesodKd3pKb83++ArzRUlx5LiH2+FiodngM3SppSKXCNzum6+AMr0fN/m7yjIQWGByY6Wnw2tr7M2P8cxXMNho9DLogeA6Yn344U+tzyZ1977hxDW13BK+pEcCMWYV/0yrmkgce7KaZtpDXlqDIpvvR9vuwjYz7E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10424.jpnprd01.prod.outlook.com (2603:1096:400:24c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Wed, 8 Mar
 2023 15:03:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 15:03:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        William Breathitt Gray <william.gray@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v13 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Thread-Topic: [PATCH v13 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Thread-Index: AQHZQkatRWA/pEQLxEGWUdoxs5QyVK7q5cgAgALDb1CAA1eDAIAAF14w
Date:   Wed, 8 Mar 2023 15:03:23 +0000
Message-ID: <OS0PR01MB59228C7F4A86DFC8A58C71AD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230216203830.196632-1-biju.das.jz@bp.renesas.com>
 <20230216203830.196632-3-biju.das.jz@bp.renesas.com>
 <20230304162000.GA2574592@google.com>
 <TYCPR01MB5933B070FDB6FFCD60B2FEB186B69@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <20230308133400.GI9667@google.com>
In-Reply-To: <20230308133400.GI9667@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10424:EE_
x-ms-office365-filtering-correlation-id: 69239c4f-f475-4875-376c-08db1fe64347
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AnR/t+oClZV7vfujNoJJupdQo3kYmSp2mmbmppPN0EOwuom/H+lKitCc4DGRt8gUIkTgpOUpTDYEqUYQEPiLrZwKYigCCuUk/yVvkjviSD94dk/s4N5EOcWbdFjbnMtQkEkkf3gM854i14qajPk5B3FU5viExi58dcBYiO0NVJB3sSuhFIoJa6cwBn6tCnM0VRJmD1Zaxk/5IYNScjux5Ecsu44urpLh86hGo7XsUdWcIG0uJcXYw7F701ZMgh1Auv9hRpP6RW0IIRT0GvtpnI62bWF0c8qLRvGSfD3QG76tRkkHQq6Cp8bAvW/Bd7yh22+aYp0jQEwm53RZtyxdz08bX9YTHU3uid61aQGCNnIcq4A5sL+E8J0mZ5Vo2UCqfZgCW3NTDixRkBDrz4+JkGLHgiUet/0ADTCPlo3Vo4MbZQ2Mqm7Cm9M7czwv9JZ7G1RfXhCCPqL+KHbw1239Oouea8Jecb/7kSwmpSWrCsAiPrnoF7C5vrWYVygGZgzTYDsECkzcyRPH37UeHro0AcdS41eolRpHHgeyKxkKMidl0kHGa9cTA2q97noJlGXG7FslPswml5y4E1cqV2OJ/ahev6yoIpd+CjFtbnxC8S8UOkpsqjw3VkVhRGoiRV26i0E4g+8cVW1REpdbA0+u5E3exhNsRf2tDiT6rtqzfNj8ytxOFxmRc0bNIkIPUZtA/thLQXfA46BVbzP8dS0VCEi2eEEk3YJrUM5YVUY3M80=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199018)(66946007)(54906003)(66476007)(66446008)(64756008)(66556008)(26005)(6506007)(76116006)(38100700002)(8676002)(316002)(6916009)(33656002)(8936002)(478600001)(52536014)(2906002)(5660300002)(86362001)(122000001)(7696005)(71200400001)(83380400001)(55016003)(38070700005)(4326008)(9686003)(41300700001)(186003)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1ovNGtXOUNHaFV1bklVYWxQbXJUN2xzdnJubGt0MGVHcVhyMXhtVjNVQVIr?=
 =?utf-8?B?elpjWjRwL3cwMzFobXhKbHphRTgzbmN4VzdBemMwSWljQ0o3Y3M5R2k5amg4?=
 =?utf-8?B?SkE1cHMyc2NVRFRaUlJMNGNSL1pWZCtzc2tnME8ramdva1NOM3o4NzdaMFc2?=
 =?utf-8?B?STdEdVhXVUMyZTJzeHB2MFZoRVJBNmZRbE96eW5ybzUwTW1yQWlmWHllcUky?=
 =?utf-8?B?TkUzbEVyM2dZRmY5eC9WM2ViM21FL25JQUFNV2t0RVNENXcrV3IvMDFsUG4y?=
 =?utf-8?B?UytERW8yQUwwZWF4ei9BVld5QkduVXhUVTRIdEs3NjVmUEhXZVFZbGFyUlRJ?=
 =?utf-8?B?VjhNYzJUcE1zOWVvSG1jUTJKVFFSdlZDaUNOYnZBaUdRNlFyK0V1c0dLVXFl?=
 =?utf-8?B?TGFOdmo5NXhXenp5SVphWXpPRUs3dTJDdGJiL3k4eElPTVJWWmREQnBybnRw?=
 =?utf-8?B?NzEweWJPRlBpVnR3Vnc0NVN4NXgyZWY0WkhtMXVpMG5MTjk1alplU244TUlw?=
 =?utf-8?B?eHVGQWF2WUFVamZSWkxHZjNpbFEwS3pXWmgyYUZzb2lvVnl2eUxQNGhlWjdQ?=
 =?utf-8?B?VERNQWJrZ0MzTDVJNjhjR3cybHllaVUvNURMSUk4UG1Fd1RxaGNFckY4aVFu?=
 =?utf-8?B?WS9MdUV4Unl6THF1RWZhOUhHQWgxb3YzNzNGRUNYV1JaV0hJM2krZGhERkZ6?=
 =?utf-8?B?SWcySjdIRkpFMlZtNlloYkJiZ21xZFVvTFRUSHYrcW1mRS82RjVIcEFWeHJv?=
 =?utf-8?B?MGNLd3Rvc2JJT2hCNThMdVF0Ry9URWs4ZExLNW9UcVBBS3gwODlJVmZMT0FP?=
 =?utf-8?B?c3hrQ1VkOVd3aXBjT3RFRmN6SVhLamhNSU93K3BwcDNRT2xJdUdUZEZ1NXdr?=
 =?utf-8?B?Qi83NEZXRFcrWUJOU2E0LzkyblNhTElIb28yUnVaU3FUcUQwby82MVhHN1h2?=
 =?utf-8?B?YThua0RWbDJudEg1WVVXdFhzdDFydkZDdlBBdGZJVmJZNkkybjExWnJOOXNL?=
 =?utf-8?B?NlMwK1lRL2FkaGVORE9DSkFSYmFhTm9GUTRwc2k1RUt4eVhyUjlTQXhDSVVZ?=
 =?utf-8?B?T2Y2dThvU2ZWVG4rUFZZbS9VUkRIYXBNOUpieXFFbmtpSnJ3OHA5bUtnZ1Jy?=
 =?utf-8?B?d3JYaWlyK2k0RHZrSTl1cmVhSFN6NjNJUk1wRSsrdTczVHB0LzZvU2N6NmlL?=
 =?utf-8?B?TzRCNFpmQ1NYN0U5eE9vUGQ4c2NQNi9KaTFwWmZST1BRMWQ2Y3NONW1aK2RC?=
 =?utf-8?B?MzFRbE9EYTBxOTJuT0QrUEJTeHFIbkxXUlR5MzlUVFJKeWJML3dzVGtQVDlx?=
 =?utf-8?B?OXNYeFUzbEpaU3NwMkU2clM5d1IwYnlqQm5KbWQ4RmhGRXV2Y3ZTajZ4OXlQ?=
 =?utf-8?B?WUxOVEMrSDRWelZoRmJZY0lFV3N3Z0RFWGNrUExOVnM1RkYvRmxjRkZleDBJ?=
 =?utf-8?B?RXFYcmltYjM1OGxualZwREcxWlZoMHFxZG1PRUt5Sk9mRU9UbkJjSDRTWmU5?=
 =?utf-8?B?Z1NJUTJQSFFYcUNKZVlzMzkyNDZjcWx3eXBkd1Y5SUFHbFhvanZoeUpJZTln?=
 =?utf-8?B?SE5jQXkvOFgvMEtvajhMcVNDam94NERWQ2dIWk5SL0hhOFpWeFozWGdhdGUy?=
 =?utf-8?B?TTdSMkpMdXB1UmI3WFM3b0Raak1TampKeG1ZQU5RSHhieFl5eldnVE1QZ1Bk?=
 =?utf-8?B?UzJabXhGVmwvaVpFMkVsNWU3OFhJZVYrTUhEeVdGWmF6YXlwZEgrNStGSlJ0?=
 =?utf-8?B?ME5PYmhQOUZuOGoxM2Q4d0hMMXM0YWJGTlBrUklvbkVoZDNyY1d2dTFYSHl2?=
 =?utf-8?B?eDdUQmVQTlFnS0VVRUZXTjdNRFBPOFJHZGxhK0pWK2JtNHpTV0oxc2thS0Vr?=
 =?utf-8?B?dU1WOXZkSnZPQlZ4c1VMZmorZ2FsUmdscUtwbHRkdjlHcFYwL3lnYysySkRk?=
 =?utf-8?B?WjgxNm1qRm14T0xrK0pHbzV1QVUvSlJmc3BteHRnbHR5S1k1Q1dwb3JIeVdr?=
 =?utf-8?B?QUtLVFlHMjVlNVNOdE1SVmo2K3dPam9NYjVySDdRclNpQmxhdGdBejMzb0pu?=
 =?utf-8?B?Qk9wajhUcnQxWER1cW9aSFR0NUZuWlJHbGF5TGlINTFqVGZ2Q0dQTkxXREt5?=
 =?utf-8?Q?DS7M2hRlrB6jmjIMeXdjT4ETt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69239c4f-f475-4875-376c-08db1fe64347
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 15:03:23.4267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87SqnorGPAX/HPBfc7skqDbqISw8Qu/4tFVBAxCYkdip2VsSeSaQBv0XJcFHcKYLdtUHNt6aB4ch5YEWXjaAlhAh7CgVweHG2b1P0Qc4snQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10424
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGVlIEpvbmVzLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYxMyAyLzZdIG1mZDogQWRkIFJlbmVzYXMgUlovRzJMIE1UVTNhIGNvcmUgZHJp
dmVyDQo+IA0KPiBPbiBNb24sIDA2IE1hciAyMDIzLCBCaWp1IERhcyB3cm90ZToNCj4gDQo+ID4g
SGkgTGVlIEpvbmVzLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KPiA+DQo+ID4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMyAyLzZdIG1mZDogQWRkIFJlbmVzYXMgUlovRzJMIE1U
VTNhIGNvcmUNCj4gPiA+IGRyaXZlcg0KPiA+ID4NCj4gPiA+IE9uIFRodSwgMTYgRmViIDIwMjMs
IEJpanUgRGFzIHdyb3RlOg0KPiA+ID4NCj4gPiA+ID4gVGhlIFJaL0cyTCBtdWx0aS1mdW5jdGlv
biB0aW1lciBwdWxzZSB1bml0IDMgKE1UVTNhKSBpcyBlbWJlZGRlZA0KPiA+ID4gPiBpbiB0aGUg
UmVuZXNhcyBSWi9HMkwgZmFtaWx5IFNvQ3MuIEl0IGNvbnNpc3RzIG9mIGVpZ2h0IDE2LWJpdA0K
PiA+ID4gPiB0aW1lciBjaGFubmVscyBhbmQgb25lIDMyLWJpdCB0aW1lciBjaGFubmVsLiBJdCBz
dXBwb3J0cyB0aGUNCj4gPiA+ID4gZm9sbG93aW5nIGZ1bmN0aW9ucw0KPiA+ID4gPiAgLSBDb3Vu
dGVyDQo+ID4gPiA+ICAtIFRpbWVyDQo+ID4gPiA+ICAtIFBXTQ0KPiA+ID4gPg0KPiA+ID4gPiBU
aGUgOC8xNi8zMiBiaXQgcmVnaXN0ZXJzIGFyZSBtaXhlZCBpbiBlYWNoIGNoYW5uZWwuDQo+ID4g
PiA+DQo+ID4gPiA+IEFkZCBNVFUzYSBjb3JlIGRyaXZlciBmb3IgUlovRzJMIFNvQy4gVGhlIGNv
cmUgZHJpdmVyIHNoYXJlcyB0aGUNCj4gPiA+ID4gY2xrIGFuZCBjaGFubmVsIHJlZ2lzdGVyIGFj
Y2VzcyBmb3IgdGhlIG90aGVyIGNoaWxkIGRldmljZXMgbGlrZQ0KPiA+ID4gPiBDb3VudGVyLCBQ
V00gYW5kIENsb2NrIGV2ZW50Lg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiBS
ZWY6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IHYxMi0+djEzOg0KPiA+ID4gPiAgKiBNb3Zl
ZCBSWl9NVFUzX1RNRFIxXyogbWFjcm9zIGZyb20gcHdtIGRyaXZlciB0byByei1tdHUzLmguDQo+
ID4gPiA+IHYxMS0+djI6DQo+ID4gPiA+ICAqIE1vdmVkIHRoZSBjb3JlIGRyaXZlciBmcm9tIHRp
bWVyIHRvIE1GRC4NCj4gPiA+ID4gICogTW92ZWQgaGVhZGVyIGZpbmUgZnJvbQ0KPiA+ID4gPiBj
bG9ja3NvdXJjZS9yei1tdHUzLmgtPmxpbnV4L21mZC9yei1tdHUzLmgNCj4gPiA+ID4gICogUmVt
b3ZlZCBTZWxlY3QgTUZEX0NPUkUgb3B0aW9uIGZyb20gY29uZmlnLg0KPiA+ID4gPiB2MTAtPnYx
MToNCj4gPiA+ID4gICogTm8gY2hhbmdlLg0KPiA+ID4gPiB2OS0+djEwOg0KPiA+ID4gPiAgKiBO
byBjaGFuZ2UuDQo+ID4gPiA+IHY4LT52OToNCj4gPiA+ID4gICogTm8gY2hhbmdlLg0KPiA+ID4g
PiB2Ny0+djg6DQo+ID4gPiA+ICAqIEFkZCBsb2NraW5nIGZvciBSTVcgb24gcnpfbXR1M19zaGFy
ZWRfcmVnX3VwZGF0ZV9iaXQoKQ0KPiA+ID4gPiAgKiBSZXBsYWNlZCBlbnVtIHJ6X210dTNfZnVu
Y3Rpb25zIHdpdGggY2hhbm5lbCBidXN5IGZsYWcNCj4gPiA+ID4gICogQWRkZWQgQVBJIGZvciBy
ZXF1ZXN0IGFuZCByZWxlYXNlIGEgY2hhbm5lbC4NCj4gPiA+ID4gdjYtPnY3Og0KPiA+ID4gPiAg
KiBBZGRlZCBjaGFubmVsIHNwZWNpZmljIG11dGV4IHRvIGF2b2lkIHJhY2VzIGJldHdlZW4gY2hp
bGQgZGV2aWNlcw0KPiA+ID4gPiAgICAoZm9yIGVnOiBwd20gYW5kIGNvdW50ZXIpDQo+ID4gPiA+
ICAqIEFkZGVkIHJ6X210dTNfc2hhcmVkX3JlZ191cGRhdGVfYml0KCkgdG8gdXBkYXRlIGJpdC4N
Cj4gPiA+ID4gdjUtPnY2Og0KPiA+ID4gPiAgKiBVcGRhdGVkIGNvbW1pdCBhbmQgS0NvbmZpZyBk
ZXNjcmlwdGlvbg0KPiA+ID4gPiAgKiBTZWxlY3RlZCBNRkRfQ09SRSB0byBhdm9pZCBidWlsZCBl
cnJvciBpZiBDT05GSUdfTUZEX0NPUkUgbm90IHNldC4NCj4gPiA+ID4gICogSW1wcm92ZWQgZXJy
b3IgaGFuZGxpbmcgaW4gcHJvYmUoKS4NCj4gPiA+ID4gICogVXBkYXRlZCBNT0RVTEVfREVTQ1JJ
UFRJT04gYW5kIHRpdGxlLg0KPiA+ID4gPiB2NC0+djU6DQo+ID4gPiA+ICAqIE1vdmVkIGNvcmUg
ZHJpdmVyIGZyb20gTUZEIHRvIHRpbWVyDQo+ID4gPiA+ICAqIENoaWxkIGRldmljZXMgaW5zdGF0
aWF0ZWQgdXNpbmcgbWZkX2FkZF9kZXZpY2VzKCkNCj4gPiA+ID4gdjMtPnY0Og0KPiA+ID4gPiAg
KiBBIHNpbmdsZSBkcml2ZXIgdGhhdCByZWdpc3RlcnMgYm90aCB0aGUgY291bnRlciBhbmQgdGhl
IHB3bQ0KPiA+ID4gZnVuY3Rpb25hbGl0aWVzDQo+ID4gPiA+ICAgIHRoYXQgYmluZHMgYWdhaW5z
dCAicmVuZXNhcyxyei1tdHUzIi4NCj4gPiA+ID4gICogTW92ZWQgUE0gaGFuZGxpbmcgZnJvbSBj
aGlsZCBkZXZpY2VzIHRvIGhlcmUuDQo+ID4gPiA+ICAqIHJlcGxhY2VkIGluY2x1ZGUvbGludXgv
bWZkL3J6LW10dTMuaC0+ZHJpdmVycy9tZmQvcnotbXR1My5oDQo+ID4gPiA+ICAqIFJlbW92ZWQg
InJlbW92ZSIgY2FsbGJhY2sNCj4gPiA+ID4gdjItPnYzOg0KPiA+ID4gPiAgKiByZW1vdmVkIHVu
d2FudGVkIGhlYWRlciBmaWxlcw0KPiA+ID4gPiAgKiBBZGRlZCBMVVQgZm9yIDMyIGJpdCByZWdp
c3RlcnMgYXMgaXQgbmVlZGVkIGZvciAzMi1iaXQgY2FzY2FkZQ0KPiA+ID4gY291bnRpbmcuDQo+
ID4gPiA+ICAqIEV4cG9ydGVkIDMyIGJpdCByZWFkL3dyaXRlIGZ1bmN0aW9ucy4NCj4gPiA+ID4g
djEtPnYyOg0KPiA+ID4gPiAgKiBDaGFuZ2VkIHRoZSBjb21wYXRpYmxlIG5hbWUNCj4gPiA+ID4g
ICogUmVwbGFjZWQNCj4gPiA+ID4gZGV2bV9yZXNldF9jb250cm9sX2dldC0+ZGV2bV9yZXNldF9j
b250cm9sX2dldF9leGNsdXNpdmUNCj4gPiA+ID4gICogUmVuYW1lZCBmdW5jdGlvbiBuYW1lcyBy
emcybF9tdHUzLT5yel9tdHUzIGFzIHRoaXMgaXMgZ2VuZXJpYyBJUA0KPiA+ID4gPiAgICBpbiBS
WiBmYW1pbHkgU29DJ3MuDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9tZmQvS2NvbmZp
ZyAgICAgICAgIHwgIDEwICsNCj4gPiA+ID4gIGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICB8
ICAgMSArDQo+ID4gPiA+ICBkcml2ZXJzL21mZC9yei1tdHUzLmMgICAgICAgfCA0NTgNCj4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICBpbmNsdWRlL2xpbnV4
L21mZC9yei1tdHUzLmggfCAyNDMgKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgNCBmaWxl
cyBjaGFuZ2VkLCA3MTIgaW5zZXJ0aW9ucygrKSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+
IGRyaXZlcnMvbWZkL3J6LW10dTMuYyAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IGluY2x1
ZGUvbGludXgvbWZkL3J6LW10dTMuaA0KPiANCj4gWy4uLl0NCj4gDQo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L21mZC9yei1tdHUzLmgNCj4gPiA+ID4gYi9pbmNsdWRlL2xpbnV4
L21mZC9yei1tdHUzLmggbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgNCj4gPiA+ID4gMDAwMDAw
MDAwMDAwLi40MmU1NjFhOTYwM2MNCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysg
Yi9pbmNsdWRlL2xpbnV4L21mZC9yei1tdHUzLmgNCj4gPiA+ID4gQEAgLTAsMCArMSwyNDMgQEAN
Cj4gPiA+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQo+ID4gPiA+
ICsvKg0KPiA+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDIyIFJlbmVzYXMgRWxlY3Ryb25pY3Mg
Q29ycG9yYXRpb24gICovICNpZm5kZWYNCj4gPiA+ID4gK19fTElOVVhfUlpfTVRVM19IX18gI2Rl
ZmluZSBfX0xJTlVYX1JaX01UVTNfSF9fDQo+ID4gPg0KPiA+ID4gX19NRkRfUlpfTVRVM19IX18N
Cj4gPg0KPiA+IE9LLg0KPiA+DQo+ID4gPg0KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2Nsay5o
Pg0KPiA+ID4NCj4gPiA+IFdoYXQgYWJvdXQgYWxsIHRoZSBvdGhlcnM/DQo+ID4NCj4gPiBJdCBp
cyBub3QgcmVxdWlyZWQgaGVyZS4gV2lsbCByZW1vdmUgaXQuDQo+IA0KPiBJdCBpcyByZXF1aXJl
ZC4gIFBsZWFzZSBleHBsaWNpdGx5IGluY2x1ZGUgYWxsIHRoZSBoZWFkZXJzIHlvdSB1c2UgaGVy
ZS4NCg0KT0sgd2lsbCBhZGQgb3RoZXJzIGFzIHdlbGwuDQoNCj4gDQo+ICA+ID4gKyNpZiBJU19F
TkFCTEVEKENPTkZJR19SWl9NVFUzKQ0KPiA+ID4gPiArc3RhdGljIGlubGluZSBib29sIHJ6X210
dTNfcmVxdWVzdF9jaGFubmVsKHN0cnVjdCByel9tdHUzX2NoYW5uZWwNCj4gPiA+ID4gKypjaCkg
ew0KPiA+ID4gPiArCWJvb2wgaXNfaWRsZTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCW11dGV4X2xv
Y2soJmNoLT5sb2NrKTsNCj4gPiA+ID4gKwlpc19pZGxlID0gIWNoLT5pc19idXN5Ow0KPiA+ID4g
PiArCWlmIChpc19pZGxlKQ0KPiA+ID4gPiArCQljaC0+aXNfYnVzeSA9IHRydWU7DQo+ID4gPg0K
PiA+ID4gUGVyaGFwcyBJJ2QgcmVhZGluZyB0aGlzIGFsbCB3cm9uZywgYnV0IC4uLg0KPiA+ID4N
Cj4gPiA+IFdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gZG8gaGVyZT8NCj4gPg0KPiA+IEl0IGlzIHRv
IGF2b2lkIHJhY2UgYmV0d2VlbiBjb3VudGVyIGFuZCBwd20gdG8gYWNxdWlyaW5nIHRoZSBzYW1l
IGNoYW5uZWwuDQo+ID4gSWYgYSBjaGFubmVsIGlzIGZyZWUsIHRoZW4gb25seSB0aGV5IGNhbiBh
Y2Nlc3MgdGhlIGNoYW5uZWwuDQo+ID4NCj4gPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgYW55IGNs
YXJpZmljYXRpb25zIG5lZWRlZCwgb3IgY29ycmVjdCBtZSBpZiBhbnl0aGluZw0KPiB3cm9uZy4N
Cj4gDQo+IEkgbWVhbiB0aGUgbG9naWMuICBQbGVhc2UgZXhwbGFpbiBpdCB0byBtZS4NCg0KbG9j
aygpDQpnZXQgdGhlIGlkbGUgc3RhdGUgb2YgYSBjaGFubmVsDQppZihpZGxlIHN0YXRlKQ0KIG1h
a2UgdGhlIGNoYW5uZWwgdG8gYnVzeQ0KdW5sb2NrDQoNCnJldHVybiB0aGUgaWRsZSBzdGF0ZTsN
Cg0KPiANCj4gRm9yIGluc3RhbmNlLCB3aHkgbm90IGp1c3QgZG86DQo+IA0KPiAgIGJvb2wgc3Vj
Y2VzcyA9IGZhbHNlDQo+IA0KPiAgIGxvY2soKQ0KPiANCj4gICBpZiAoIWlzX2J1c3kpDQo+ICAg
ICBpc19idXN5ID0gdHJ1ZQ0KPiAgICAgc3VjY2VzcyA9IHRydWUNCj4gDQo+ICAgdW5sb2NrKCkN
Cj4gDQo+ICAgcmV0dXJuIHN1Y2Nlc3MNCj4gDQo+IFdoYXQgZG8geW91IHRoaW5rPyAgRWFzaWVy
IHRvIGJyYWluIHBhcnNlPw0KDQpZZXMsIEkgYW0gb2sgd2l0aCB5b3VyIHN1Z2dlc3Rpb24gYXMg
d2VsbCwgZXZlbnRob3VnaCB0aGVyZSBpcw0KMyBhc3NpZ25tZW50IHN0YXRlbWVudHMgY29tcGFy
ZWQgdG8gMiBpbiBwcmV2aW91cyBsb2dpYywNCmFzIGl0IGlzIGVhc2llciB0byByZWFkLg0KDQpD
aGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gPiA+ICsJbXV0ZXhfdW5sb2NrKCZjaC0+bG9jayk7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKwlyZXR1cm4gaXNfaWRsZTsNCj4gPiA+ID4gK30NCj4gDQo+IC0t
DQo+IExlZSBKb25lcyBb5p2O55C85pavXQ0K
