Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9A0F6B2881
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 16:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjCIPQd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 10:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjCIPQB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 10:16:01 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2129.outbound.protection.outlook.com [40.107.113.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4C536464;
        Thu,  9 Mar 2023 07:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCMFWwivovzwOfl26AK0uAjrndpwSY36s7mbKi7ur+yanF7X7tdZe9xGDpni5ftG+cx+mpgsMg36+teYummj/6vwhGQWxRZGNeimKIXlYMbCIdOu+1sNBcSNjQWdXvbrja+HkhGSPzI38KyCRNVX+r4suBkcaPD+UKxiTumzuSbSodZOYs03qzqs/vFowB6UcQ1xuN46Vq3+dm1QuUiibSuscl1F73itgkfSG637BgbBnm0Ykc9C/7PXEivYnLkZ2PhzB1J8N7RwTwrXnzNaRySy4pl2FRZ51pWMYg3D/m4ifKwZkgx1Z82JYoWMfPwV7kA386XBwiOnlTwm1lZzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdWqEa0xZpbTvY+Xs1cmhuVSy5lBvrD8QFSBwU+AdvU=;
 b=a2y5NmPlnmhj8+RH2qnUVvMsGCQgOlC3BoUs1uGC3AOmAxFupoIqY7Hxqz6REg7EfrqnrECHFHV7MMIAd7MMi7mOnPfAPHr+TwFKvl8jVdWAJbRVgBBpBkQ32eX42HMuX1QVsbyDZSC6bQfW5/Vu/dn8+HADdG2ymoPTp2StWhBSroBh7wpmkYhe9Lt4gl5AjevKuZontDqOovVhxrXOXa3+vyFgKAZqfzh9tD40ZTflMnyJgiC16dRYnN+Y0RzeZd91rntFcdl8yfCcyu/wkN6CQmYWeYNHEWGKThLsg2yN9lHXxzbOmgD7YdEkaWsmSQ373dimVFbxhrRkx2BO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdWqEa0xZpbTvY+Xs1cmhuVSy5lBvrD8QFSBwU+AdvU=;
 b=IfdOV5a80BcoofKhDNI7wYxMfB0h5usYFkdAQE5CAcXV7hx1ow/OwZy5ZW4SLBlCemNfZqs4m6es/1HI0pWsBRZOjwn2Nz4D96mBCvaHAS9YDIJTlQCJN3+n4sUfInFt0/CaQvjKNI24JqfGN4Aw7aw2IoUx29z1kYjpu8f+xz0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5652.jpnprd01.prod.outlook.com (2603:1096:604:b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 15:15:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 15:15:31 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Topic: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Index: AQHZRS0aT95BTvtLwUKgslaMkC+eWK7at0aAgBZQ9vCAAEpeAIAAAIEwgAAHzgCAANKNMIAAFx2AgAAAUHCAAAgsgIAAA/sAgAAFUoCAAAJAAIAAUJdw
Date:   Thu, 9 Mar 2023 15:15:31 +0000
Message-ID: <OS0PR01MB59225096E3D386DA2336B7FB86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
 <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org>
 <TYCPR01MB5933650D5BAB7A3F4BE03BAF86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <984f1689-459e-bd26-b96c-6c759417b3d1@linaro.org>
 <TYCPR01MB59335607AE6A2F4FBBA46ACC86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <bc9e8ccd-9f98-6fae-9491-dc2bd96c2e4f@linaro.org>
 <CAMuHMdVNCvu6La_=f=6i4Kj3UXeFU6McnNSkXb0PVjVyzdNR4Q@mail.gmail.com>
 <2bb458ba-ef70-86f3-de89-0102e27aa0fc@linaro.org>
 <CAMuHMdWjDaNxBn7+sr40CTJpCQ8u6LsrXNXxF81LaQC7Db+5xA@mail.gmail.com>
In-Reply-To: <CAMuHMdWjDaNxBn7+sr40CTJpCQ8u6LsrXNXxF81LaQC7Db+5xA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5652:EE_
x-ms-office365-filtering-correlation-id: beb7a376-5cfd-43b5-25c4-08db20b11f8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /wMEMUGLPSfcC7wDoB/dN/4IBXfwnPS941jsvPRc+VUQ5s1B/j6JCdif/Mmtpku2K9CxAcHMTLFunzQUJ/9FcGwAF0vvJIq8Fl8i4uikb8/eD/BUjy8WLlVVbXCgBhrABAwlvBGJ3RMdt03a8/5Z8VyELMAeSiA3/P1Shih3bStVdsPm8CLfmgrFhkouZECK1RE2XRGhr9A2OfYqsh7pNunfZWU4i57wkbmVjjG/5JHh9SUW1ZroFSmUTd/+5cWVuCMxGL21FCHr2XwbqjBGDv2as3HpOpxLfhyeNJn+5PB1kQWqHlEm2YSX2V8LC884zQ02w0bTnJMtL5Ex+MqCYVxgk8+hjhOV1MYb6vftiqGN1jA3o9YD75Dd/fqVMBcvrO/LUGRcilUowxfVJ7TPUiI8qwXZIPb05Kge5/RuAV7jiPVYL4ImwN30kBsBf4aPsiFkn0ihhnbY5R0uMme16BduRftZxTdQmh9Cz2EDtr8tSUA9bIPJ2ba6+z+1XsPdfBH1Buqx/BLEGOljjvQCP/le6JHvc8Env5EZVoOdstwor0ybCC4UJ6EinDq5H0aaIVd/qjQW6ZHzaKIqzJgtWOtZK+F5PqcW26FTc7zBxPHQyoXuDkNUWhe/6+w8DwXspSdTFphB2X7x837VMcW6iNIbsyAa7bgcIiJI61PfmwjQbhis/l9KuJH4W3UnMaQvbvvTGtcbwm+ShV2pxX6zNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199018)(33656002)(83380400001)(26005)(7696005)(186003)(6506007)(53546011)(71200400001)(9686003)(8936002)(64756008)(52536014)(66476007)(2906002)(8676002)(86362001)(66556008)(66946007)(4326008)(66446008)(41300700001)(5660300002)(7416002)(76116006)(38070700005)(316002)(38100700002)(110136005)(107886003)(478600001)(55016003)(54906003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3hOQVdxUFBnVEErZzJLSzAzb0pLRE9PL0VPdS9TRXNoVTBNVUVGR2pWOGRC?=
 =?utf-8?B?SFB0aXhXYlRXUFhyVmM2VkZoVi9XUlZvajliZGtsQm5FUnhtQnJ2YnhSTm9I?=
 =?utf-8?B?bGJEcjc3MHQzU205MzlkK0cyV0FsQmZOSDBVRGx3VFd6UWZiNkp4czJza3VR?=
 =?utf-8?B?cWt3OVdwcjF1N0pPQitLd0g0N29aTEY1UGJiMGozaU14MlQyTXVtcU1mWTE0?=
 =?utf-8?B?SUxDOGtqSjMrTloyQUVmcnpvZGFMbnRVZXNtZ1FaZG40ZlI5bXBIQzIzS2tu?=
 =?utf-8?B?VTZVd2hXMXZHMS9walQ3T2kveWdIdmh5VWFlTUJSUEFNMWRRbGVLdTJwK2Rv?=
 =?utf-8?B?Mk1LT1JmTS8wcEp1QW5QZXpLNVBCKzdDQ2dlajRWL1VEdVVzWUdTUVNHM0Nw?=
 =?utf-8?B?RVJhWld4bENOTnpyeGU2VnVXeGM3andOT0UzMW56UVVGL3BZK1Q0RDkzL09R?=
 =?utf-8?B?NjJDNnlULzVxd1NPV09KM1ZEZWNUVGJWKzBOTlUyYXpUcnVvWjlUbnJuZWRq?=
 =?utf-8?B?a0J3YitKLzM1VVcrOCsvWE41R1V0b2pLQ3BXR3poY3FyQjhHNjI0WkM1Qjl4?=
 =?utf-8?B?SHd2Z2VjdlNnelk5SXNJTzIrU3FmMXFRU0E5Z0dkSzhXdVkydzBWazdLQ0Fj?=
 =?utf-8?B?R2I4a2p1Z2xLaDFBcWE3SU9kMHlldGw3Z3cydWhUdytaelBwMUZudGp2VWhs?=
 =?utf-8?B?T0pnVUtDeFd4eDBQc1ZscGcxa3k0SnhwRnNJZHZoMGpodHZTaCtYNWkxOStN?=
 =?utf-8?B?cFlFSDRpMTlQL2lTODloQ1IxUFJIaklSeVVscThHdGZITys0Yy9tUld5dGdB?=
 =?utf-8?B?SFpyS0pVNVJmOWp3WVJldzZGMEhYOUVRR3dLT0FMbmRvaWtBajdubGhnU3dC?=
 =?utf-8?B?SlFmdFJ4c1QyR2VWNG8zUUVOVDRqRktKeGRZVDZ6R2hsT2RFdjMvamRqS0hG?=
 =?utf-8?B?UUF6aUltZFRBb1p1MVNiM3RWbStTQ0ZQUi9PNlhPN0J2QjBwOFBKMWo2dGFs?=
 =?utf-8?B?RENjOHNMamVtZ0hzT0N3UVlyMXZGdWEyTGx3R0FjSVVsUnBCZWxpWVdlZVc0?=
 =?utf-8?B?YXlaQW1pUlVDOGR3SHVHZ3FlNUliblNidTlhYjN1UHZjSVFxMHZUVjRVd3I3?=
 =?utf-8?B?VldIbDNLQ3dYdy82WGRwYkk2VE9TN1RFbFNMbEYrNHBqRTh4NEVDalZkV0l1?=
 =?utf-8?B?TjBleFVhaHJLRHRLVzhZQmo2bitUbEpRZGJDSmVHVldmNnpSRzBDUjNKUVVt?=
 =?utf-8?B?V1l1OEdsZnV0d3czaTVFNTZ2eXJDUW5zY1QyY05kVDg3MzZxN0Z6T2ZRT0VB?=
 =?utf-8?B?LzNiOHVoWkgvL3V3L0lHT3dsV3RBRmU0WTVibUx2cFltMUMrclFWd2pzeWZz?=
 =?utf-8?B?eExDRzdJSXN1eWdBU0JlYUJxMTJ5SFRjRjZCc3pQcGxIMExHMktuanljQis5?=
 =?utf-8?B?R3F4b0pTUTJiQWdNNkx4MmdhU3lMRjZtZUxRQ1BobXRCdFNPNWk1V2J1NzNq?=
 =?utf-8?B?eWdKQWt2LytrdHRqdGZyYTVxK2tLVkxHeVh6OUZ2cHA3Z3pSUWNQTkpXM1lK?=
 =?utf-8?B?YUEwM2J5M1RocXIwZy9EdEVhZkdmYkRsRnpXMTNNcWl6c2ZoNmY4VVRjVkU4?=
 =?utf-8?B?SU9rK3h3UUdXeGlTeEhGMVhHZVFRbnZ3d2Q4SVJuQlVIRjc4bzExQmhrcnNS?=
 =?utf-8?B?SlRvdzN5Ny90ZTJNcDNaVWZXdXlLTjEwZDNpYnNMVGlIajQvN0pDNld2Y1Bk?=
 =?utf-8?B?MGl4cS9TYUk1UWZUK3dqK0NuM3NRdlN6azRETUZYSUlhZ05BOFh2TnU2Ujcx?=
 =?utf-8?B?RzRVQnh5TnRPVGErTFlFamtMQmxjRTdWVGVVRDBvYlRGY05wOS9rOSs0TDFu?=
 =?utf-8?B?NmhjTkh6dXBLU2d4akw5UGRCM3RMSXZialhhSlNQREFNV2s0bGRrRm04L2t2?=
 =?utf-8?B?TCtKVERrMmJXK0hSL2FkWExzekNOSjluTmF0Tlo1VHJsUXcrWi9NMWFGUGhB?=
 =?utf-8?B?WVcvVE54TTFnajhObEY4c3E5OWVxcTI1cEY4ay9JZEtFVjJhTVR1R0xCMlBK?=
 =?utf-8?B?eVBNNjBYQlVBU01rd05pR2g5L2grQVFONlZudGdYS0NWazJFOGRTUnIyNUdM?=
 =?utf-8?Q?07aAJH/iPv4Gz2u+C+s2hPAXi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb7a376-5cfd-43b5-25c4-08db20b11f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 15:15:31.3141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mSMGFRjtMwru3exP9PmvzpSgCjUKKYKcBQLQ4/+vptGybp8kDLrKCSPn6XT+Acvq3zzBH0XNQxG/f+uzeLbGr0U8bc3Eez59nXnpP+a900k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5652
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIFJGQyAxLzNdIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIFJlbmVz
YXMgdmVyc2EzIGNsb2NrDQo+IGdlbmVyYXRvciBiaW5kaW5ncw0KPiANCj4gSGkgS3J6eXN6dG9m
LA0KPiANCj4gT24gVGh1LCBNYXIgOSwgMjAyMyBhdCAxMToxN+KAr0FNIEtyenlzenRvZiBLb3ps
b3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4gT24g
MDkvMDMvMjAyMyAxMDo1OCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4+Pj4+IEhl
cmUgaXQgaXMsIFBsZWFzZSBsZXQgbWUga25vdyBpcyBpdCBvaz8NCj4gPiA+Pj4+Pg0KPiA+ID4+
Pj4+IHJlbmVzYXMsb3V0cHV0LWNsb2NrLWZpeGVkLXJhdGUtbW9kZToNCj4gPiA+Pj4+PiAgICAg
dHlwZTogYm9vbGVhbg0KPiA+ID4+Pj4+ICAgICBkZXNjcmlwdGlvbjoNCj4gPiA+Pj4+PiAgICAg
ICBJbiBvdXRwdXQgY2xvY2sgZml4ZWQgcmF0ZSBtb2RlLCB0aGUgb3V0cHV0IGNsb2NrDQo+ID4g
Pj4+Pj4gZnJlcXVlbmN5IGlzDQo+ID4gPj4+PiBhbHdheXMNCj4gPiA+Pj4+PiAgICAgICBmaXhl
ZCBhbmQgdGhlIGhhcmR3YXJlIHdpbGwgdXNlIHRoZSB2YWx1ZXMgZnJvbSB0aGUgT1RQIG9yDQo+
ID4gPj4+Pj4gZnVsbA0KPiA+ID4+Pj4gcmVnaXN0ZXINCj4gPiA+Pj4+PiAgICAgbWFwIGluaXRp
YWxpemVkIGR1cmluZyBib290Lg0KPiA+ID4+Pj4+ICAgICAgIElmIG5vdCBnaXZlbiwgdGhlIG91
dHB1dCBjbG9jayByYXRlIGlzIG5vdCBmaXhlZC4NCj4gPiA+Pj4+PiAgICAgbWF4SXRlbXM6IDYN
Cj4gPiA+Pj4+DQo+ID4gPj4+PiBib29sZWFuIGlzIHNjYWxhciwgbm90IGFycmF5LCBzbyBubyBt
YXhJdGVtcy4gSWYgdGhlIGZyZXF1ZW5jeSBpcw0KPiA+ID4+Pj4gdGFrZW4gZnJvbSBPVFAgb3Ig
cmVnaXN0ZXIgbWFwLCB3aHkgdGhleSBjYW5ub3QgYWxzbyBwcm92aWRlDQo+ID4gPj4+PiBpbmZv
cm1hdGlvbiB0aGUgY2xvY2sgaXMgZml4ZWQ/DQo+ID4gPj4+DQo+ID4gPj4+IE9LLCBJIHdpbGwg
bWFrZSBhbiBhcnJheSBwcm9wZXJ0eSBpbnN0ZWFkLiBGcm9tIEhXIHBlcnNwZWN0aXZlDQo+ID4g
Pj4+IGVhY2ggY2xvY2sgb3V0cHV0IGZyb20gdGhlIENsb2NrIGdlbmVyYXRvciBpcyBjb250cm9s
bGFibGUgaWUsIGZpeGVkDQo+IHJhdGUgb3IgZHluYW1pYyByYXRlLg0KPiA+ID4+Pg0KPiA+ID4+
PiBJZiBhbGwgdGhlIG91dHB1dCBjbG9ja3MgYXJlIGZpeGVkIHJhdGUgb25lLCB0aGVuIGZyZXF1
ZW5jeSBpcw0KPiA+ID4+PiB0YWtlbiBmcm9tIE9UUCBvciByZWdpc3RlciBtYXAuIEJ1dCBpZiBh
bnkgb25lIGNsb2NrIG91dHB1dA0KPiA+ID4+PiBnZW5lcmF0ZXMgZHluYW1pYyByYXRlLCB0aGVu
IGl0IHVzZXMgZHluYW1pYyBzZXR0aW5ncy4NCj4gPiA+Pg0KPiA+ID4+IFNlY29uZCB0cnksIHNh
bWUgcXVlc3Rpb24sIGxldCBtZSBrbm93IGlmIGl0IGlzIG5vdCBjbGVhcjoNCj4gPiA+Pg0KPiA+
ID4+ICJ3aHkgdGhleSBjYW5ub3QgYWxzbyBwcm92aWRlIGluZm9ybWF0aW9uIHRoZSBjbG9jayBp
cyBmaXhlZD8iDQo+ID4gPg0KPiA+ID4gV2hhdCBpcyB0aGUgYWN0dWFsIHVzZSBjYXNlPw0KPiA+
ID4gTXkgdW5kZXJzdGFuZGluZyBpczoNCj4gPiA+ICAgMS4gSWYgdGhlIE9UUCBpcyBwcm9ncmFt
bWVkLCB0aGUgY2xvY2sgZ2VuZXJhdG9yIHdpbGwgYmUgY29uZmlndXJlZA0KPiA+ID4gICAgICBm
cm9tIHRoZSBPVFAgb24gcG93ZXItb24sDQo+ID4gPiAgIDIuIFRoZSBjbG9jayBnZW5lcmF0b3Ig
Y2FuIGJlIChyZSljb25maWd1cmVkIGZyb20gc29mdHdhcmUuDQo+ID4gPiAgICAgIGEuIElmIHRo
ZSBPVFAgaXMgcHJvZ3JhbW1lZCwgdGhpcyBpcyBub3QgbmVlZGVkLA0KPiA+ID4gICAgICBiLiBG
b3IgY3JpdGljYWwgY2xvY2tzLCB5b3UgbWF5IHdhbnQgdG8gcHJldmVudCB0aGlzLg0KPiA+ID4N
Cj4gPiA+IEFsc28sIEFGQUlVSSwgImZpeGVkIGZyZXF1ZW5jeSIgb3IgImR5bmFtaWMgZnJlcXVl
bmN5IiBpcyBhIHBvbGljeSwNCj4gPiA+IGFuZCBwdXJlbHkgc29mdHdhcmU/IE9yIGFyZSB0aGVy
ZSBPVFAgYml0cyB0byBlbmZvcmNlIHRoaXM/DQo+ID4gPg0KPiA+ID4gUGVyaGFwcyB5b3UgbmVl
ZCBhIHBlci1vdXRwdXQgImRvLW5vdC1jaGFuZ2UtZnJlcXVlbmN5IiBmbGFnLA0KPiA+ID4gcHJv
YmFibHkgd2l0aCBhIGdlbmVyaWMgbmFtZSwgaW4gdGhlIHNwaXJpdCBvZiAicmVndWxhdG9yLWFs
d2F5cy1vbiINCj4gPiA+IGZvciByZWd1bGF0b3JzPw0KPiANCj4gQWN0dWFsbHkgd2UgYWxyZWFk
eSBoYXZlICJhc3NpZ25lZC1jbG9ja3ssLXJhdGV9cyIgcHJvcGVydGllcyBmb3IgdGhhdC4NCg0K
QWN0dWFsbHkgaXQgaXMgYSBnb29kIHBvaW50ZXIuIEkgY2FuIG1ha2UgdXNlIG9mIHRoaXMgcHJv
cGVydHkuDQoNCkNoZWVycywNCkJpanUNCg0K
