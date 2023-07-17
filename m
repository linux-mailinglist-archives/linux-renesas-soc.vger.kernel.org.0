Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1AF755D58
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 09:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjGQHrM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 03:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjGQHrL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 03:47:11 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E037198E;
        Mon, 17 Jul 2023 00:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFj54JMYq9CMf0HkbuB42LrMdt0efbaAI2Ff/jbEeTuWVTwgAoaj6Ly0bCWIbdzhyHemh0NZSSu9eS2OOwiqS9S5hOHy98skJcpeW/jchFPdS6IaUzW52wd7QFcqAVC4GqXKIlL536mAsl53lyqFtYujV71piQ/gwTmY0L2UN6ZWFfaejBEAM8b0MNsGiq0A1Juap6iSwRSrXJ8wndlBbyfi/Qs/0e7nALpg+EzqEaLPtOzps0tBRu+TUgD2wcNIv977NN3vqMaj/HiYACjIR/VbFl/wtKKDObXIdm7Te3nseZnRQgPIWQh5rcgv4jDVf4eS3nbojV0e2ARw04nbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YU1eLXCtmsxVFDERSgS8qgy0b+d9g7s7iiHesCKn1/w=;
 b=io6Zzfsc1pjlnHeIJ0SBqavf2kayWmQK103mm9Flixp8DuDJBnm473QwgOiev2X43WVS97mJ2IvT52qc6XFHfpwn5D+Z7yDS+fkl5godE0kfq4/BGIua4BizZx9R4oqrp0F0LSaddd/m/7WXxI8I/38puS6v+7e5fGuVnKKoMoitd+OJ+J3rOwZQLeilGGBgWq9EettOVbqKXtIR5jzJJJCbBPG5qYYaVDtB/r7m8UZDCvFDQNq89CvBm2Ajs+hiujNiE+Mo0vOZ/OpFn4jtpdKIao/UsGJyXgRrsX/mfoE4SM9YuEGQjXmlrkv3LsWyH8yFA3vKathGqSJCYsTMIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YU1eLXCtmsxVFDERSgS8qgy0b+d9g7s7iiHesCKn1/w=;
 b=pKTCkPKrT2C6wgXpcDrSiSIhtxRyQFae6MkFpRJY1XVdrr3Ipxnx8aXa+UubfxfjWKy2pU1QvNmuGs1ZuVqTzKrDkC0HNrKgJR1qOZ9pIY/3nquK3Z5SISFFGZsIw87dywc1/6aoaQljUtbUOLxJHAux4hwkym90S6v99Trm/og=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB10588.jpnprd01.prod.outlook.com (2603:1096:400:309::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 07:46:34 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::ef83:ef86:806d:6558]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::ef83:ef86:806d:6558%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:46:34 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marex@denx.de>,
        Alexander Helms <alexander.helms.jy@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] clk: vc5: Use i2c_get_match_data() instead of
 device_get_match_data()
Thread-Topic: [PATCH 1/2] clk: vc5: Use i2c_get_match_data() instead of
 device_get_match_data()
Thread-Index: AQHZt/x26WS4OvT3hUmkHdt3DgnVi6+9kpQAgAACITA=
Date:   Mon, 17 Jul 2023 07:46:34 +0000
Message-ID: <TYCPR01MB5933389C26B1C2FD6F35D97C863BA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230716154442.93908-1-biju.das.jz@bp.renesas.com>
 <20230716154442.93908-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUjF-_pX53xaEXJVP1Yvz-o=0bdHLx7ekqbqrGX7ygCLA@mail.gmail.com>
In-Reply-To: <CAMuHMdUjF-_pX53xaEXJVP1Yvz-o=0bdHLx7ekqbqrGX7ygCLA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYCPR01MB10588:EE_
x-ms-office365-filtering-correlation-id: 53d52208-54a2-4dc1-1a0c-08db8699f1b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: InGyVihpNjPn4VgBUaEQOJo8G6EnnPzOc6X2EztzWiuli8rCKnR6wuw3wIWzl09W5NrA9gBhkI0XgYlcYgEUiasyTDNJXw3u7DL1MGqtsHsF+YBULDu2km4rGF3MuSu2RaZT20UFBGApdQ9p1QpICrjJAnmabcLdBq5UVZub3PX88edrVocennP8pHxoLBtEJVo8z0idSLOD7rZPvoiKaj6Pvp6J0hYLoAJDk4v8vlZ1OXUt7APW4MmOAYyZ3V5VLNgF4Kd8wYM6Zc9qlh5/Ype2OWB444p5432cPsOqhe+3x29OWv+XJoCBR6T8q3Bygo2+5p7/7CiXbIoQeYqYbjDHupT6arjhHsJGRETSOJTP2IpwUFHL2086N71IIQTz8O3DTlQjBrNhnxaO62mLlQsLA4vQrKssWsUUnYNoss09zVHlnbH/uPJybjqFKTeIzl7tItS3DQba9OOydeci4JTb6R2VlFz/QeJfQNJ2HhCyZFx1kD6xdQGBHfALo6Jh7OEJnPJXT80xoUy52RBSIJPzzl24jmRuKdznUxCHt5iPY5d77iUlANk4jhrXo2tJnN/2qTRzOsub+IYw0fmxVpAW4+AyErvpSPLW/CLRWuMLjy8ehaX3phwpRUCYB3q7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(478600001)(71200400001)(7696005)(54906003)(186003)(53546011)(6506007)(26005)(9686003)(2906002)(76116006)(41300700001)(316002)(6916009)(4326008)(66476007)(66946007)(64756008)(66556008)(52536014)(5660300002)(8936002)(8676002)(66446008)(38100700002)(122000001)(86362001)(33656002)(38070700005)(83380400001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTZQZGxITThzdDRJdDZtTEtTY01aREtCbFg2VG5yNGZyQUk2REV4TU1rQnpS?=
 =?utf-8?B?TVRQcGpxbklPc3pvd1A1b2twRDAyeXJ4Sk9ocEdFWEhtWjhjUzRzUnFZUFNY?=
 =?utf-8?B?ZmNzRVRFMXhSTzNwaTVjdnhUVnpxaEdrak1LeGd0VlBrWTJSZ3Jld3lrSlFC?=
 =?utf-8?B?cGhQMVBkMjQ1dnAyaVA2UmFzNzQxZS90cmMrYVQrbCs4UFk2SG9KeXpLVXNo?=
 =?utf-8?B?UGt4U1BhSXJoVUxia1FBNkRUWWJpWmdjaGd1U3U2RmtuUnZaMm84UzlIMmg2?=
 =?utf-8?B?enBTdGI5TEdseWtneklJMS9WZHkvbklzYTIrajN0RkVlU2QzZDU3QWhYelZk?=
 =?utf-8?B?bDZlcUZCSWd6blpkLytLOEQrZGF4WVRza3UyV3U5QkptQlpvRVRMdzVJWTVL?=
 =?utf-8?B?MnlWRGI2bVdFNDJ6WlQ5TWN1K0RiaUt3ZXlPZ1NaYmgvUVN4dFhCYlI0YmVC?=
 =?utf-8?B?OWFvSUEzT2paQjJZNFVZWVBXbHNRS21lOVgrN0hMWHk4aFNheWs3T2VSNitn?=
 =?utf-8?B?SnozWTBWQS9KOWJ1Zmc0U1lTQkR0ajM5c2pWRWhWTEd6TTVTcG94aUVlcmNV?=
 =?utf-8?B?bzZmem5zcUMwcFFkK0wzQkdVdk54RklHN0FRU1NjMlR3dkd6ZkRDTVpYa2Ew?=
 =?utf-8?B?VTZadU9KZjBuS1NRTHJERUJJQkV0SHYrbDRjbmJpbnJJN2cxb3psdnVQQjda?=
 =?utf-8?B?dG5QRXN1bFdraisrVGRWZTMxck5WMlowT3dXYUxaNjhHaVpPSEFTdktsSDVa?=
 =?utf-8?B?UDVsMnJlQyt6YXJ6QUxPOGtwdUNYNWRsR3hLcEdueTNwb3AyL2dyWHk2TWwz?=
 =?utf-8?B?cVdKVkNtODEwK05PY3ZsWW45YWI1VGRzcTdEeGtlQjdFWVdhdGhLU29nNW1t?=
 =?utf-8?B?UzAwNDQwNERteXpxZ2ZDNlZDMGdXN3FtV0pSK3FFS1hHaWJjekIreDhPZzRR?=
 =?utf-8?B?WHgyZ21rYktZSURGOHdBN3NsN3Fmd0hIZGpEZ29jYTNvK0tmNk12czdhMlhS?=
 =?utf-8?B?MGhkRUxCaGQyeU1KTW5nSkFrSjZ5S3lWbVBwWng2dHUzdm1EaCtYRlR1bnhJ?=
 =?utf-8?B?WE9QbU9hMnhFZmNmMFZYRVFLTXpZdmowYVdTeFN2L3BYMzBjbUdiNERPbkRK?=
 =?utf-8?B?NCt5MEUvZmpnaVFYMFcvdTlsK2ZKUjBXK1U1L3B6cTNaQ1BHdkZpeGJSaUsx?=
 =?utf-8?B?YUoyTUE2dFRWTnM5QXBIVVlsK1NYMWtmKy9wTnRseVd2b0tNQUNrbW1VbURZ?=
 =?utf-8?B?Z0E2UWF5aG85T3BDcjVKZDBLUFR5b1V0QkFZbFczSDNCSFI2V3NzazBSM1pn?=
 =?utf-8?B?ZFdtSVI0SllGUHhLUG1aM3FMOE82K1g3UUNPS0RORit1c2c4TkJ4SWwrZmUx?=
 =?utf-8?B?NnA1YWs3bzRZNXgzck1NNW5BaVNEOWdXeGhSQjloaWYwaWxFY0hQaUMwTzEr?=
 =?utf-8?B?cWF2ODM1SjFNUC9Tdk1abE9GYnRCNVdhQ29lNGNiSEtZZUkzdU5JcXJTUVVN?=
 =?utf-8?B?M25HV2gwSVNQLzRYVFVhQ3FyUmxjSmZ0WThzdktvdW5wM1VZUGN1L0I4MlVI?=
 =?utf-8?B?Ry9YSmpZQTZ3RnVRdW95UWh1MWNBaEc2UTdsUEtGZWd2eGtEeGtWU1dKNDZo?=
 =?utf-8?B?SkpBOVFRQUU1dmJLSzBHbElLcUQyM1hGeUN0ajlJaWgyQ2MvTmM3Q0tjWk1O?=
 =?utf-8?B?ODZnMDEyeWxSbXJ4NHdmRDhpdEJuZzNXQ0Z3cW5uNFl4bWRUdTQ2ZlZqWUxU?=
 =?utf-8?B?eEYzM2VoQVNjMmJKMDJZY05ZOHVveGdJM1NNcWMrSldRUFJseUoxRlMwOEt4?=
 =?utf-8?B?WStCU0lOZURTSHZvcTg0Q2pLNUxvcjlmYTAzNkd3ak4xajhtR05ZUnNOTFRN?=
 =?utf-8?B?ZldJOXhQUUdnREpHb0h0WUJ4Y2VoenU1VkxZWHkxYXhPM2JMdTFMaDdEZ1Rr?=
 =?utf-8?B?Y0Q4dU1NWkZKSENBSUxxa0NrcnNGQmEzOWpxaUZXeVNhTWdoLzUwSXFaT1RZ?=
 =?utf-8?B?aUczcFE1MmYxQXpWUDdJTXhXeDZwWmhhcTRFK0J2QWE4alE1d3UvVHp3c0x2?=
 =?utf-8?B?RGIzTlpKWXFxQzFkdUhaQlF4WFpRaTRpQ2dnWG5zU0Vmb0pTY0crVVhvUjBE?=
 =?utf-8?Q?Mg6HfoBPmPePpD1kO0S0CfeIm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d52208-54a2-4dc1-1a0c-08db8699f1b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 07:46:34.5886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MObfU9qcZam5VCQSl9hZcO5vVsshyFq4soTsJ9OrGdDmImidtSuHo0lbQ2Fcp505hv5jQm98gDcZlovxA/oa9o6W6W2Q+ViNA5wst17b/oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10588
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvMl0gY2xrOiB2YzU6IFVzZSBpMmNfZ2V0X21hdGNoX2RhdGEoKSBpbnN0ZWFkIG9mDQo+
IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gU3VuLCBK
dWwgMTYsIDIwMjMgYXQgNTo0NOKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gd3JvdGU6DQo+ID4gVGhlIGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpLCBpcyB0byBn
ZXQgbWF0Y2ggZGF0YSBmb3IgZmlybXdhcmUNCj4gPiBpbnRlcmZhY2VzIHN1Y2ggYXMganVzdCBP
Ri9BQ1BJLiBUaGlzIGRyaXZlciBoYXMgSTJDIG1hdGNoaW5nIHRhYmxlIGFzDQo+ID4gd2VsbC4g
VXNlDQo+ID4gaTJjX2dldF9tYXRjaF9kYXRhKCkgdG8gZ2V0IG1hdGNoIGRhdGEgZm9yIEkyQywg
QUNQSSBhbmQgRFQtYmFzZWQNCj4gPiBtYXRjaGluZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gPiAt
LS0gYS9kcml2ZXJzL2Nsay9jbGstdmVyc2FjbG9jazUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xr
L2Nsay12ZXJzYWNsb2NrNS5jDQo+ID4gQEAgLTk1Niw3ICs5NTYsOSBAQCBzdGF0aWMgaW50IHZj
NV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+DQo+ID4gICAgICAgICBpMmNf
c2V0X2NsaWVudGRhdGEoY2xpZW50LCB2YzUpOw0KPiA+ICAgICAgICAgdmM1LT5jbGllbnQgPSBj
bGllbnQ7DQo+ID4gLSAgICAgICB2YzUtPmNoaXBfaW5mbyA9IGRldmljZV9nZXRfbWF0Y2hfZGF0
YSgmY2xpZW50LT5kZXYpOw0KPiA+ICsgICAgICAgdmM1LT5jaGlwX2luZm8gPSBpMmNfZ2V0X21h
dGNoX2RhdGEoY2xpZW50KTsNCj4gPiArICAgICAgIGlmICghdmM1LT5jaGlwX2luZm8pDQo+ID4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiANCj4gQ2FuIHRoaXMgYWN0dWFsbHkg
aGFwcGVuPyBBbGwgdGFibGVzIGhhdmUgZGF0YSBwb2ludGVycy4NCg0KSXQgaXMgbm90IG5lZWRl
ZC4gSSBqdXN0IHdhbnQgdG8gYXZvaWQgcGVvcGxlIHNlbmRpbmcNCnBhdGNoZXMgYXMgdGhpcyBm
dW5jdGlvbiBjYW4gcmV0dXJuIE5VTEwsIHNvIGFkZCBhIGNoZWNrLg0KDQpQbGVhc2UgbGV0IG1l
IGtub3csIHdoZXRoZXIgSSBzaG91bGQgcmVtb3ZlIHRoaXM/DQpJIGFtIGhhcHB5IHRvIHNlbmQg
VjIgdGFraW5nIG91dCB0aGlzIGNoZWNrLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gICAg
ICAgICB2YzUtPnBpbl94aW4gPSBkZXZtX2Nsa19nZXQoJmNsaWVudC0+ZGV2LCAieGluIik7DQo+
ID4gICAgICAgICBpZiAoUFRSX0VSUih2YzUtPnBpbl94aW4pID09IC1FUFJPQkVfREVGRVIpDQo+
IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
