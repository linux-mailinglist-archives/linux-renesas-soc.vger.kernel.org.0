Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96D1476507B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 12:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjG0KB5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 06:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbjG0KBv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 06:01:51 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14464116
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 03:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRQiNRLmbn8Ixin88C/354UNhJAfBRsVlpySbU3Qb1DPiuD5iiPcYmhTFYGkN1rzrQum8ep8et+PDlkAGzaK9XblMwZcWC1AC+Jyahdq+7ne7l8V3WAS7dyJG4t/dJqwDkRbBk9WsXI2jpi+iGyWpvogGWMpk5d4/eidiLcn0Y29tVyJV3dLFgibc00ReLmdBqEqyNx/ns0ylWnqlJFSM0IaDjtyGH8pZ1msOkDd8E3b/YfRScUoTUlPUQTKF2g4wQh0NSDJbVj/6PIA9Ej2Pv0aj+ZzdBg9aQ4yy2Skitxi5H0diWZjI1LNs5Vk9cudEoe5vSNXdYkurqz4u5muRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaR8YEij2Q/CMMdRTG9SvUB9BJYRv6bg5NarrSltgGk=;
 b=VMVQjdqyQ/+OujSVXgxquXc29oblc4w4OtMvzfGyWDdtAzINM55iRMVxVV2mHFJlaH5H05cbEBE2IvlzBE2GhZVugAT7Azqq58ApAcSGeYkgxW7jx0Jh6UNYkp2jnclDaQPvm/3LiEKpMerqiwo/1T8gAoOEMtWpebil9vWjWW08uzWP4fNEXI3oHo7sJc9/KTTHBDE3mTBMOLv9UCk8+tsZ0pG3QIaTa+xiFRNIMIA4N4Qm5Lc93bcqPo7jadUIFjacFfs0BGwhVvhr3Hl+/iwKO8tRSM7qMUfA6mZ22QiVUr0D+A4iE6+q57F+9rGC91CxIzC2Hj6CIYlzAiF9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaR8YEij2Q/CMMdRTG9SvUB9BJYRv6bg5NarrSltgGk=;
 b=ZB1+r0bJe2sQn0iPuDY8lRcr9stgUctSTevLPEqEz8RTuo6X6DO5pS1G4IG2dyeQ+A9MZhcP3crBz2kbHzjJG/CB6dIeTyco8l9JN6KQpnxPlY3fTiYLGqX0SYj2YovDG+4gtbOAlollTmvd8+3cUjPTVB7x0LIHBsj5dkPbrNw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5885.jpnprd01.prod.outlook.com (2603:1096:400:41::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 10:01:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 10:01:45 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Julia Lawall <julia.lawall@inria.fr>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [linux-next:master 2742/4710]
 drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32
 division, please consider using div64_ul instead. (fwd)
Thread-Topic: [linux-next:master 2742/4710]
 drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32
 division, please consider using div64_ul instead. (fwd)
Thread-Index: AQHZwEiu5bV74iVB8UuLI4yLfkRI3a/NSKAggAADsACAAAilUIAAAw4AgAAJxEA=
Date:   Thu, 27 Jul 2023 10:01:45 +0000
Message-ID: <OS0PR01MB5922FE35DD3D2C732C2CD3948601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <alpine.DEB.2.22.394.2307270709580.3082@hadrien>
 <OS0PR01MB59227764417EB66A9CBDE69F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <bf5c77ec-fc9f-419a-d0e8-15ad54df2fb@inria.fr>
 <OS0PR01MB592291F0C8AE19F7118DCF0F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXhS-u-n+ZThnNM6w81rc0LsOUyaJ5UxXwbC44e7NFw8w@mail.gmail.com>
In-Reply-To: <CAMuHMdXhS-u-n+ZThnNM6w81rc0LsOUyaJ5UxXwbC44e7NFw8w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB5885:EE_
x-ms-office365-filtering-correlation-id: 05bda345-4f4f-41dd-ff2e-08db8e887c29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V0OXe3zh7eaLum9QYBnDKpZGMYypsibQXEeqtb4CO0bOfZZqLFbKkjvtmshYQFqEtXagOkWXxwU8lDcsDHPKMtYufR0ueCMeF/b6vY/4wX2eDTlSrH4V/91bvTjRAXmqHPTkxt/i+O/Hstk/eLCDRz8FA4uyg7bPSjkYpI8qGxTQrdQRXgu2/DroGJG4QRrGWoL02JiOBdWPk1K4f0GUe4xnTnu2u/xQvVI2iG4/qkOaX+RNi53NYmKk7j7MKkVN3QfXU3A10Q9U8MVejUBEQFmuV4Wf5QU0ncWWT0UrWWHpmnC1LvaMNujPNkvd/wRmevKjFEX4h0HQd/ZQ09UhnmlES5GnY3kikstHhuE25ih3l/u/6KQ0yI+9UvTnQ4mIn/R2h0afXk3BJpsVss6OYG9Tw0ReggCT0QR4ZsvB0NyR0pd75gkp4+mb5isTQRKxNlvsM31JB1bODyK3dx1fbMz26Q18FpMQHdXOp1e1NxzbfFJyZQDquNZL7Ml47WBuietiS1bwfzn3zqqwoI/RrDnyQKHMKschK/hlQy/H2gW/E3Wdyk2QWKC+WzPe4LHqPE6IviJtDfVpPaiSUi/KHE+vD6rVE3fclgcxN8h0GY2ELmCSrE70POh+zKpoik2Y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(54906003)(71200400001)(7696005)(122000001)(2906002)(478600001)(316002)(5660300002)(8676002)(52536014)(8936002)(41300700001)(38100700002)(55016003)(76116006)(38070700005)(66946007)(6916009)(4326008)(66556008)(66446008)(66476007)(33656002)(64756008)(53546011)(186003)(86362001)(6506007)(83380400001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWMvTjE1TTBQRVJ4aGRDUVJNbStKMEJCWTdETGpSWnRVYlgwZFZrSG0wMFVF?=
 =?utf-8?B?MWJZMDNQUEloQlNSVGdFc3VrN0tIOStrRWx0R3V1dDNER3VEQ2pycDduWWV2?=
 =?utf-8?B?U0hiMGdHVFUxYmxRR3NISkdhZnBGNDRxYjZMZlFUZTl0U2Zwb1Y0a2FWeFV6?=
 =?utf-8?B?SGtxYStJVUVWdkdEMUZOK2RBdXRpcDJkWm4ySUhqbXV6dEtGN1NiTUNUR1Q5?=
 =?utf-8?B?QnEzOUY0VkQyREZIemdzdnZNd3lvaDVRSkQ0Nm9OYi83Y0ZXWXRrTW1ZRDY2?=
 =?utf-8?B?THRMTjJpZ20xMTQwdzhnMkRqKzNyZXJabGM3VkNPL05vKzZNVDJMbGtIOGtB?=
 =?utf-8?B?aVp0bkhBRVMwR1JnQ1pnZ0VwUkNtUW5MZ2xXQ1Z4UFp6SHZqTzZtNEE1Uzhs?=
 =?utf-8?B?U1cxVmRvYlRNaXZyaTJFeStBODBaSmJ3Z0JjZnhsTEo5SVJHUE5Sd1JKTy9Y?=
 =?utf-8?B?T1puNDhGRTh1bTR0WC9KUDdjWmJpVkZBUCtuTEFCMGkwTDZ1ZUxqZUY0UTBL?=
 =?utf-8?B?dkJHZm92a0RwY1FzVjF1cDY3eGZTQnp2em9JbzlzcVlRNXcrOGtrclBUYTFK?=
 =?utf-8?B?MzJ5VXhoYy9FL1NSeWxxV2dtcDV0MDVvVFUzVkg5RU1aeW8xSGJhbDM2bG00?=
 =?utf-8?B?bjVGbUl3MEt0Tm5qemlHakdnL1BoVDFQbXhkNXdBWDd5bUxFUGk5RUZZbndq?=
 =?utf-8?B?cGR3TzdwRlpHU0crMHRzOUd5ZGM3aTlmR3BEM2ZRcTlCbjVxcCt0eVdvMkJq?=
 =?utf-8?B?Mk0rdmgwWXoxcHc1cnh5Q2dseStncWdpNGJJMXBDVWJPdnZEQXRuM3RNSnVK?=
 =?utf-8?B?Yk1iUDNOeERKUUN0T1NGaEpYaFBuUFhGeGlYd0hRdEphci90VlZ3a2RYb2wr?=
 =?utf-8?B?T1JSQlQ3OVlMVGlUN0hsV1RIQTRpYyttbUZQQ2l6VlZKV1pYTXFjSXVhTDY0?=
 =?utf-8?B?ZGFYaXo1TmpldEYyUUlXQllIQWdVSjBHTnoxR1RicnFEOTZiYVMyYSs1M0Q1?=
 =?utf-8?B?TU5ReVFNVmpvam54L1Y0U3lyMzdVbGF4bHVGcDBEc2dqejJFTGo5blArS3Mw?=
 =?utf-8?B?N3pwTUpNTnVhUkdYdWU0M29jUUdyaGZ2NUpDajdtRHQ5SHpiYjFRWWVjUU1Q?=
 =?utf-8?B?VkJsWkZrV2ZsTDI1aG1sK3pHMFEySThQTGsrM01nT3pRMVhYWnNoaXU5QWhq?=
 =?utf-8?B?d1dFQXJiOUdWc3hXL1IxUU1kc2pBVnNPNkxDdG5JVkhTWnBDaEloOXJMdkp2?=
 =?utf-8?B?UVBSNnpLNk1WWUxQZjhFN2pmWFlOZTl6WEJ0ckN5aWNNanpXSks5WGZiT1l2?=
 =?utf-8?B?S1V0S1ZxZXRHZGtoc3dDd1pYS1JCSXFxbFg3dXBuTW8zMHN4aHo5d3Fia29U?=
 =?utf-8?B?dGhJT2xIeUcrMkx3aVhFRjNuZEJHZ003MDNoa2lGQnJNdGtsTklDRGJJdGlr?=
 =?utf-8?B?eWFHRldxMzh4QWJ4b3NzN0V4Tml1NC8xdVFneUJKZGZ0VE5FYnBZS3YvT29s?=
 =?utf-8?B?bGJPclpDSC9VMzJNeTJib1Mxdms3bzZwdTdBOVBudStxeXpVaW9QSnpTZ29l?=
 =?utf-8?B?dHJhZkJFRzhpUEc3OVlHZDBYMzk1MUFXRHNraGNTcmM0M0JLUmNzcGpuM0Zq?=
 =?utf-8?B?b0lIOGNJbDZUK3dORVBWVk1oYVhuOHM4RGVBVHV5Zlp1czNKSDdTS0w4YlZJ?=
 =?utf-8?B?NTJoWHhZQ0JLK1h2QnpNQUh6SmdwVE1mNzFqRHhVUlB2Um5rcTdJbmRBY2gr?=
 =?utf-8?B?bkJpRDFVYWJRcWs2Y3VmOTh2MC9wSmhPYXFsdEcwQ1FUQTJjUkFLNXUrL3U2?=
 =?utf-8?B?U09EcU1ESHZhWEhJd0UxUlpWR3JIcldPeDF2NlE5d21IajFIKzVJT1Z2MEd1?=
 =?utf-8?B?d21sUW5pdEtubXVqRXg5Ym55VTAyaXNNOGRiSkZMYTZkMnBYRTNmUFU3Y255?=
 =?utf-8?B?dzBJdDI1NUZYWktWcVBhbVE5WksxSEhSUHBjZDlUWEIvemp0NGlvZytNZ3pq?=
 =?utf-8?B?OU5kRkU5djYya0YwQzkrd1dlWUZrdUh1L013djE1aUdUSnIrR1B5VUI1c3BP?=
 =?utf-8?B?Z1VMNnRoSy9sSWpTdEwyRFUva081ZmU5cXpNSXRmNmUxY0JteDZ2d085WFZu?=
 =?utf-8?Q?noPw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bda345-4f4f-41dd-ff2e-08db8e887c29
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 10:01:45.2519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vu/gVLoIIAEkm/MkqpDB2Fp8d6/p1TJFJBprpcmS8RslRMe0LHi1QoDIC1SnDNyHZVLfUnM4ZHp+2voN/j9uyFOv4LLOoKGffHLpNIq5xrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5885
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
bGludXgtbmV4dDptYXN0ZXIgMjc0Mi80NzEwXSBkcml2ZXJzL2Nsay9jbGstDQo+IHZlcnNhY2xv
Y2szLmM6NDA0OjItODogV0FSTklORzogZG9fZGl2KCkgZG9lcyBhIDY0LWJ5LTMyIGRpdmlzaW9u
LCBwbGVhc2UNCj4gY29uc2lkZXIgdXNpbmcgZGl2NjRfdWwgaW5zdGVhZC4gKGZ3ZCkNCj4gDQo+
IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCAxMToxOeKAr0FNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiB2ZXJzYWNs
b2NrMy5jOjQwNDoyLTg6IFdBUk5JTkc6IGRvX2RpdigpIGRvZXMgYSA2NC1ieS0zMiBkaXZpc2lv
biwNCj4gPiA+IHBsZWFzZSBjb25zaWRlciB1c2luZyBkaXY2NF91bCBpbnN0ZWFkLiAoZndkKQ0K
PiA+ID4NCj4gPiA+IE9uIFRodSwgMjcgSnVsIDIwMjMsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4g
PiBUaGUgcmVwcm9kdWNlIGxpbmsgaXMgbm90IHdvcmtpbmcgZm9yIG1lLg0KPiA+ID4gPg0KPiA+
ID4gPiBDYW4geW91IHBsZWFzZSBwcm92aWRlIGluc3RydWN0aW9uIHRvIHJlcHJvZHVjZSB0aGlz
IGlzc3VlPw0KPiA+ID4NCj4gPiA+IEkgZG9uJ3QgdGhpbmsgaXQncyBpbnRlbmRlZCB0byBiZSBy
ZXByb2R1Y2VkLiAgVGhlIGlzc3VlIGlzIGp1c3QNCj4gPiA+IHRoYXQgYSBsb25nIHZhbHVlIGlz
IGJlaW5nIHBhc3NlZCB0byBhbiBpbnRlZ2VyIHRoYXQgaXMgMzIgYml0LiAgSWYNCj4gPiA+IHRo
ZSBsb25nIHZhbHVlIHdpbGwgbmV2ZXIgYmUgdmVyeSBiaWcsIHRoZW4geW91IGNhbiBqdXN0IGln
bm9yZSB0aGUNCj4gd2FybmluZy4NCj4gPg0KPiA+IFRoZSByYXRlIHZhbHVlcyBhcmUgd2VsbCBi
ZWxvdyBtYXggMzIgYml0LCA0Mjk0OTY3Mjk2LiBTbyBJIGd1ZXNzLCBpdCBpcw0KPiBvay4NCj4g
DQo+IFRoZSB0eXBlIG9mIHRoZSBwYXJlbnRfcmF0ZSBpbi9vdXRwdXQgcGFyYW1ldGVyIG9mIGNs
a19vcHMucm91bmRfcmF0ZSgpIGlzDQo+IHVuc2lnbmVkIGxvbmcuICBIZW5jZSB5b3Ugc2hvdWxk
IHVzZSBkaXY2NF91bCgpLg0KDQpBZ3JlZWQuIFdpbGwgc2VuZCBhIHBhdGNoIHRvIGZpeCB0aGlz
IGlzc3VlLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gPiA+ID4gPiB2ZXJzYWNsb2NrMy5jOjQwNDoy
LTg6IFdBUk5JTkc6IGRvX2RpdigpIGRvZXMgYSA2NC1ieS0zMg0KPiA+ID4gPiA+IGRpdmlzaW9u
LCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgZGl2NjRfdWwgaW5zdGVhZC4gKGZ3ZCkNCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAtLS0tLS0tLS0tIEZvcndhcmRlZCBt
ZXNzYWdlIC0tLS0tLS0tLS0NCj4gPiA+ID4gPiBEYXRlOiBUaHUsIDI3IEp1bCAyMDIzIDA4OjUw
OjM3ICswODAwDQo+ID4gPiA+ID4gRnJvbToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5j
b20+DQo+ID4gPiA+ID4gVG86IG9lLWtidWlsZEBsaXN0cy5saW51eC5kZXYNCj4gPiA+ID4gPiBD
YzogbGtwQGludGVsLmNvbSwgSnVsaWEgTGF3YWxsIDxqdWxpYS5sYXdhbGxAaW5yaWEuZnI+DQo+
ID4gPiA+ID4gU3ViamVjdDogW2xpbnV4LW5leHQ6bWFzdGVyIDI3NDIvNDcxMF0gZHJpdmVycy9j
bGsvY2xrLQ0KPiA+ID4gPiA+IHZlcnNhY2xvY2szLmM6NDA0OjItODoNCj4gPiA+ID4gPiAgICAg
V0FSTklORzogZG9fZGl2KCkgZG9lcyBhIDY0LWJ5LTMyIGRpdmlzaW9uLA0KPiA+ID4gPiA+ICAg
ICBwbGVhc2UgY29uc2lkZXIgdXNpbmcgZGl2NjRfdWwgaW5zdGVhZC4NCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IEJDQzogbGtwQGludGVsLmNvbQ0KPiA+ID4gPiA+IENDOiBvZS1rYnVpbGQtYWxsQGxp
c3RzLmxpbnV4LmRldg0KPiA+ID4gPiA+IENDOiBMaW51eCBNZW1vcnkgTWFuYWdlbWVudCBMaXN0
IDxsaW51eC1tbUBrdmFjay5vcmc+DQo+ID4gPiA+ID4gVE86IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiBDQzogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJu
ZWwub3JnPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gdHJlZToNCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5v
dCBqdXN0IGENCj4gPiA+ID4gPiBuZXcgdmVyc2lvbiBvZiB0aGUgc2FtZSBwYXRjaC9jb21taXQp
LCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+ID4gPiA+ID4gfCBSZXBvcnRlZC1ieToga2Vy
bmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+ID4gPiA+ID4gfCBSZXBvcnRlZC1ieTog
SnVsaWEgTGF3YWxsIDxqdWxpYS5sYXdhbGxAaW5yaWEuZnI+DQo+ID4gPiA+ID4gfCBDbG9zZXM6
DQo+ID4gPiA+ICUyQnNZNDlCNzglM0QmcmVzZXJ2ZWQ9MA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
Y29jY2kgd2FybmluZ3M6IChuZXcgb25lcyBwcmVmaXhlZCBieSA+PikNCj4gPiA+ID4gPiA+PiBk
cml2ZXJzL2Nsay9jbGstdmVyc2FjbG9jazMuYzo0MDQ6Mi04OiBXQVJOSU5HOiBkb19kaXYoKSBk
b2VzDQo+ID4gPiA+ID4gPj4gYQ0KPiA+ID4gPiA+ID4+IDY0LQ0KPiA+ID4gPiA+IGJ5LTMyIGRp
dmlzaW9uLCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgZGl2NjRfdWwgaW5zdGVhZC4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IHZpbSArNDA0IGRyaXZlcnMvY2xrL2Nsay12ZXJzYWNsb2NrMy5jDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiA2ZTlhZmY1NTVkYjdiNiBCaWp1IERhcyAyMDIzLTA3LTA1ICAzODIN
Cj4gPiA+ID4gPiA2ZTlhZmY1NTVkYjdiNiBCaWp1IERhcyAyMDIzLTA3LTA1ICAzODMgIHN0YXRp
YyBsb25nDQo+ID4gPiA+ID4gdmMzX3BsbF9yb3VuZF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LCB1
bnNpZ25lZCBsb25nIHJhdGUsDQo+ID4gPiA+ID4gNmU5YWZmNTU1ZGI3YjYgQmlqdSBEYXMgMjAy
My0wNy0wNSAgMzg0DQo+ID4gPiB1bnNpZ25lZA0KPiA+ID4gPiA+IGxvbmcgKnBhcmVudF9yYXRl
KQ0KPiA+ID4gPiA+IDZlOWFmZjU1NWRiN2I2IEJpanUgRGFzIDIwMjMtMDctMDUgIDM4NSAgew0K
PiA+ID4gPiA+IDZlOWFmZjU1NWRiN2I2IEJpanUgRGFzIDIwMjMtMDctMDUgIDM4NiAgIHN0cnVj
dCB2YzNfaHdfZGF0YSAqdmMzDQo+ID0NCj4gPiA+ID4gPiBjb250YWluZXJfb2YoaHcsIHN0cnVj
dCB2YzNfaHdfZGF0YSwgaHcpOw0KPiA+ID4gPiA+IDZlOWFmZjU1NWRiN2I2IEJpanUgRGFzIDIw
MjMtMDctMDUgIDM4NyAgIGNvbnN0IHN0cnVjdA0KPiB2YzNfcGxsX2RhdGENCj4gPiA+ICpwbGwN
Cj4gPiA+ID4gPiA9IHZjMy0+ZGF0YTsNCj4gPiA+ID4gPiA2ZTlhZmY1NTVkYjdiNiBCaWp1IERh
cyAyMDIzLTA3LTA1ICAzODggICB1NjQgZGl2X2ZyYzsNCj4gPiA+ID4gPiA2ZTlhZmY1NTVkYjdi
NiBCaWp1IERhcyAyMDIzLTA3LTA1ICAzODkNCj4gPiA+ID4gPiA2ZTlhZmY1NTVkYjdiNiBCaWp1
IERhcyAyMDIzLTA3LTA1ICAzOTAgICBpZiAocmF0ZSA8IHBsbC0+dmNvX21pbikNCj4gPiA+ID4g
PiA2ZTlhZmY1NTVkYjdiNiBCaWp1IERhcyAyMDIzLTA3LTA1ICAzOTEgICAgICAgICAgIHJhdGUg
PSBwbGwtDQo+ID52Y29fbWluOw0KPiA+ID4gPiA+IDZlOWFmZjU1NWRiN2I2IEJpanUgRGFzIDIw
MjMtMDctMDUgIDM5MiAgIGlmIChyYXRlID4gcGxsLT52Y29fbWF4KQ0KPiA+ID4gPiA+IDZlOWFm
ZjU1NWRiN2I2IEJpanUgRGFzIDIwMjMtMDctMDUgIDM5MyAgICAgICAgICAgcmF0ZSA9IHBsbC0N
Cj4gPnZjb19tYXg7DQo+ID4gPiA+ID4gNmU5YWZmNTU1ZGI3YjYgQmlqdSBEYXMgMjAyMy0wNy0w
NSAgMzk0DQo+ID4gPiA+ID4gNmU5YWZmNTU1ZGI3YjYgQmlqdSBEYXMgMjAyMy0wNy0wNSAgMzk1
ICAgdmMzLT5kaXZfaW50ID0gcmF0ZSAvDQo+ID4gPiA+ID4gKnBhcmVudF9yYXRlOw0KPiA+ID4g
PiA+IDZlOWFmZjU1NWRiN2I2IEJpanUgRGFzIDIwMjMtMDctMDUgIDM5Ng0KPiA+ID4gPiA+IDZl
OWFmZjU1NWRiN2I2IEJpanUgRGFzIDIwMjMtMDctMDUgIDM5NyAgIGlmIChwbGwtPm51bSA9PQ0K
PiBWQzNfUExMMikNCj4gPiA+IHsNCj4gPiA+ID4gPiA2ZTlhZmY1NTVkYjdiNiBCaWp1IERhcyAy
MDIzLTA3LTA1ICAzOTggICAgICAgICAgIGlmICh2YzMtPmRpdl9pbnQNCj4gPg0KPiA+ID4gMHg3
ZmYpDQo+ID4gPiA+ID4gNmU5YWZmNTU1ZGI3YjYgQmlqdSBEYXMgMjAyMy0wNy0wNSAgMzk5ICAg
ICAgICAgICAgICAgICAgIHJhdGUgPQ0KPiA+ID4gKnBhcmVudF9yYXRlDQo+ID4gPiA+ID4gKiAw
eDdmZjsNCj4gPiA+ID4gPiA2ZTlhZmY1NTVkYjdiNiBCaWp1IERhcyAyMDIzLTA3LTA1ICA0MDAN
Cj4gPiA+ID4gPiA2ZTlhZmY1NTVkYjdiNiBCaWp1IERhcyAyMDIzLTA3LTA1ICA0MDEgICAgICAg
ICAgIC8qIERldGVybWluZQ0KPiBiZXN0DQo+ID4gPiA+ID4gZnJhY3Rpb25hbCBwYXJ0LCB3aGlj
aCBpcyAxNiBiaXQgd2lkZSAqLw0KPiA+ID4gPiA+IDZlOWFmZjU1NWRiN2I2IEJpanUgRGFzIDIw
MjMtMDctMDUgIDQwMiAgICAgICAgICAgZGl2X2ZyYyA9IHJhdGUgJQ0KPiA+ID4gPiA+ICpwYXJl
bnRfcmF0ZTsNCj4gPiA+ID4gPiA2ZTlhZmY1NTVkYjdiNiBCaWp1IERhcyAyMDIzLTA3LTA1ICA0
MDMgICAgICAgICAgIGRpdl9mcmMgKj0NCj4gQklUKDE2KSAtDQo+ID4gPiAxOw0KPiA+ID4gPiA+
IDZlOWFmZjU1NWRiN2I2IEJpanUgRGFzIDIwMjMtMDctMDUgQDQwNCAgICAgICAgICAgZG9fZGl2
KGRpdl9mcmMsDQo+ID4gPiA+ID4gKnBhcmVudF9yYXRlKTsNCj4gPiA+ID4gPiA2ZTlhZmY1NTVk
YjdiNiBCaWp1IERhcyAyMDIzLTA3LTA1ICA0MDUNCj4gPiA+ID4gPiA2ZTlhZmY1NTVkYjdiNiBC
aWp1IERhcyAyMDIzLTA3LTA1ICA0MDYgICAgICAgICAgIHZjMy0+ZGl2X2ZyYyA9DQo+ID4gPiA+
ID4gKHUzMilkaXZfZnJjOw0KPiA+ID4gPiA+IDZlOWFmZjU1NWRiN2I2IEJpanUgRGFzIDIwMjMt
MDctMDUgIDQwNyAgICAgICAgICAgcmF0ZSA9DQo+ICgqcGFyZW50X3JhdGUNCj4gPiA+ICoNCj4g
PiA+ID4gPiA2ZTlhZmY1NTVkYjdiNiBCaWp1IERhcyAyMDIzLTA3LTA1ICA0MDggICAgICAgICAg
ICAgICAgICAgKHZjMy0NCj4gPmRpdl9pbnQNCj4gPiA+ICoNCj4gPiA+ID4gPiBWQzNfMl9QT1df
MTYgKyBkaXZfZnJjKSAvIFZDM18yX1BPV18xNik7DQo+ID4gPiA+ID4gNmU5YWZmNTU1ZGI3YjYg
QmlqdSBEYXMgMjAyMy0wNy0wNSAgNDA5ICAgfSBlbHNlIHsNCj4gPiA+ID4gPiA2ZTlhZmY1NTVk
YjdiNiBCaWp1IERhcyAyMDIzLTA3LTA1ICA0MTAgICAgICAgICAgIHJhdGUgPQ0KPiAqcGFyZW50
X3JhdGUNCj4gPiA+ICoNCj4gPiA+ID4gPiB2YzMtPmRpdl9pbnQ7DQo+ID4gPiA+ID4gNmU5YWZm
NTU1ZGI3YjYgQmlqdSBEYXMgMjAyMy0wNy0wNSAgNDExICAgfQ0KPiA+ID4gPiA+IDZlOWFmZjU1
NWRiN2I2IEJpanUgRGFzIDIwMjMtMDctMDUgIDQxMg0KPiA+ID4gPiA+IDZlOWFmZjU1NWRiN2I2
IEJpanUgRGFzIDIwMjMtMDctMDUgIDQxMyAgIHJldHVybiByYXRlOw0KPiA+ID4gPiA+IDZlOWFm
ZjU1NWRiN2I2IEJpanUgRGFzIDIwMjMtMDctMDUgIDQxNCAgfQ0KPiA+ID4gPiA+IDZlOWFmZjU1
NWRiN2I2IEJpanUgRGFzIDIwMjMtMDctMDUgIDQxNQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLS0N
Cj4gPiA+ID4gPiAwLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlDQo+ID4gPiA+DQo+IA0KPiAN
Cj4gDQo+IC0tDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0K
PiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
