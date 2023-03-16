Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DA26BD5DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 17:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjCPQfW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 12:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbjCPQe4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 12:34:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2072f.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DCAB7883;
        Thu, 16 Mar 2023 09:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMwviSxAbeYkj4yeezQFefs/+p/XeLwEWrbs0f/355Y8h0cLtNZYcfjJZCw9bW5a0uLKCUqOf+XVO+oTr4TI1tnGnC85rCfoUWztwMG4CXYTLutO+igaXtJjPh+BcEHYPvEmGIF/+pGEcz26aSlrofw+IVXsGJ2ouClZVFA0FmHwUb6emQ2avL+cF+WRw0W1SckziJk3x6NVaprUEQQjBKB5BB0+W3NaFWFks57dKaTEKTw028usKxOVPH/oVFscZm55RBB26w3dJZEVFqVYmfqqYbM1WzMCXsYROWkh74BQLUez2lLqA9k2tldCrqt7b0u6GK7CzL8Fi0GkOUVC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcD46Jl8pcDek/irZ7G/3EJUZxwX7JMlcTWhEyRF35U=;
 b=lHK5vvcRZQw4YA1TaKGqmzYMkcjzA90ZFY0IEOvYxNZMbsbnyAPx+ZzvgFGl3Prua9Q2R+WBJGr+Jhc/uMnGWmnyHVwlf+PE5WWqX48XXNGEZgHGIq3UNROegYhkaKxZNvaTLpwQ0OaTUPJHNmvw5SNhyz8y1Ol1xTgTy4FLh5ZScyV35b2OfYef0Sd+eN+yH8mDP/Gy4KfNocW1IiPtEtcDA6ONdEvu3qaCYaai0FVKKHS0H/XBOMa11pV5EfwQfLL+kZTiFeAaW3jnQmoPRHWhQhh85thy/ppUKC1poGZ9+efKPbNBLNh60jdMyH3r0xrWDeCzEm67ABqrNfVVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcD46Jl8pcDek/irZ7G/3EJUZxwX7JMlcTWhEyRF35U=;
 b=J/7Gqr3UekSDuT71PWF9S9j7B9PK33ok5Kk/kfyltxNJKoZc0ztIILnfNY9m77OKYTmb5A507YY+sxnbhT/BJd7AYIsSM8BntftXFO9h1OpC7QAGKuucKSM8lv0wev9j3Jw95LmxpJP8+nBn2HQxJhiuSjY3eR/L6LzPgejXbHI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6215.jpnprd01.prod.outlook.com (2603:1096:604:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 16:34:03 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 16:34:03 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZWCCS4vXtQ/fzW0yUXUaCYffr6a79lBkAgAAA5oA=
Date:   Thu, 16 Mar 2023 16:34:03 +0000
Message-ID: <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB6215:EE_
x-ms-office365-filtering-correlation-id: 99c684a2-b353-437c-b663-08db263c414b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1wiNOHDGz7yNunRVoUDImwbpBd4KvPNJKaDHt8aVcy5y0BdzZsTSIgyctGqBidwDQNiWG+kZvQaIRq7fUvDNTY8Cg5vn7VE9Jl2a25HIgItW25aaPr0Bw+hC/KDJt/q2/g4sLLGgbDpuBsI4/TL+Af1EcAkfr6jE+HZr1bl53CG1meztdXiLkKdooL/600AtqXPxgF1FgzGdtiRSbT64opT5Helsvo0wYwbkqR+MfkgaNHwjwjt9zh4FNvi1kDK3gZBn9dCOpJ7OirGhUuXt0pOpRrmL5uaKG8zIUmZunIivQ08/Xqf/OdwS7SCB02tgEeWlcqSurpVSRt6Dd2ab4Y4sd17wcEqFuhcYGt1FC1XqleSQk5kLLaaCbFk4x6iVKoXsCoSH48bjLV8jGf0vgCzlQ2g5vBvbsLuUANj/e9D6sjeZG3Li6/ZJynEgVOK4Oyw9tNNiPHfY5ddMgTSlvCcP3L8gdGs6a7ViHZ/JxO6QOVsIJCZNEeg0+U5qAax9eipcQ0y1TAS/ZCTD3wmC5DsWTHt1UhWrfuOF+n60Pjf20XKRRt6I2qSRrMuecBCeqn51V0p3l/sO/S0l8QHrUjwY2uoXA2A4LhylLuGIRoil0G0CdZhyXxDjCdSi3zIHpGaiXmr2JSHRUfufBuwAogfFrfJIUnkjnkHmhCUtVsjGvxXUktkhEhpkaXzahWUh3vlh1aYQP7vNc+qzcwWb8Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199018)(2906002)(122000001)(5660300002)(66446008)(41300700001)(66476007)(316002)(86362001)(66946007)(52536014)(8936002)(54906003)(55016003)(6916009)(33656002)(66556008)(38070700005)(38100700002)(76116006)(8676002)(7696005)(186003)(478600001)(4326008)(9686003)(64756008)(71200400001)(53546011)(26005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlMvdmhLVDQzSlJKUGpOM0JRNjVNTm9kOGJjYlRVQlBuT1RPb2NuRUdJb2di?=
 =?utf-8?B?bjFLeGRaZWtUSzQzWkg4Q3ZxQmk4UnVmbTZEeGU2K0c2dmdCejF3dXhyUFQ0?=
 =?utf-8?B?eUhBai9ENTBaYUFyWXVDSWU5MnFjSU5NVUFRY3NaMGNxOHp6V0h6bFQ2UGND?=
 =?utf-8?B?aDFBb1J3STZlcUZtZWlpWlZSbEJQanBGUW8xeS9iQmszYnlxS20yZnE2WkFt?=
 =?utf-8?B?akZvaHhHMll2elJ1Wkp6b3lYZGNockpEZk9XN3M1bDRXbDVlY0psZ3h0TzRC?=
 =?utf-8?B?S3RxVTZLVW5XZXFid3dNMkVSYkp3TlloRE53eXZ3YmFJbVRWRGNtL0N0Y3c0?=
 =?utf-8?B?eitnT2VsSkdqbmNPQWV0bXdiTjVrbFJjdTVCdVJTSXJSNzNlTm5hYVpDVFMx?=
 =?utf-8?B?cktIQzBKL0UyeTNWaTREZmR1bW92WERab0I5YTViSUxIQXVyZ3gxaFZpZllu?=
 =?utf-8?B?MmNoY1N4UGlhSUlVZUlKQy9RdE5SVzB6YWxSaElmZkVBdjdHRnErbmlMMjBI?=
 =?utf-8?B?RUZXaCtITWgvOG5GYURnS3FuVkF5c3FmalEvSnhoRHF2Z3ZBNEgrcCtrUUNH?=
 =?utf-8?B?SlFvc0JlZmpIRW5zaFdqT0ZuYTRSNUgyUWtzekw4VmV4bG1ZSTg5Rkk5a1Ar?=
 =?utf-8?B?UHlZVXRqVU8wRDVPR1VwempxT3lFb3VMQnJoMHNFUzEzenlxS0VZU1hpTm9O?=
 =?utf-8?B?L1luNTRjR2Y5QUxVcDlBTlpoNzgrNFMyRjlvMXJZN01ScXZoWDF4V3h0V3JS?=
 =?utf-8?B?YWQyVlpmejZCWjMwMHFLMVA4MUpqUjk5RUpMcGpSdkxvTXUvOW81cTRkVkJo?=
 =?utf-8?B?V2k1UUFGZVNtcGZUMWROdTFtMVBhNzhPUlNOaHZtdXE3QXovNEVLeWhpb0FX?=
 =?utf-8?B?UzFCZHdZak41bit5UTZlL2NrUGwvWldoWVpoZWNONnh6LzR6bm84TlVLeXU1?=
 =?utf-8?B?SGlFRWxCRG1wYTc1NXlOUjFsS0orMFdaOTA3ZXRORFAzWVJqYU8zRnZRNkcr?=
 =?utf-8?B?REs4dHF2QmM2ZHE4bmoxQnI1NGM1TXIrVjlSclRhYXpsN0tpOWRJRE9TUng0?=
 =?utf-8?B?RkZVUk41d2pHcjBRdjg5UUJSMFAyenl4T1MramdiR3lwbmJCV3QzdEo5M1h4?=
 =?utf-8?B?YUdPbFg5bzhWMmwrRzRlOTJnWmRGWHp5N25PYXB2ZDUyaUtNNGtKUldxSmVt?=
 =?utf-8?B?Zld1SkNLV1Qvb0dLekRwV0w5aUdaYkJDODQzK3JLWXRkWlVPUmxGblVCYTRK?=
 =?utf-8?B?UUdBWE42Q2ZNRVMyeHNnci9LcDNqUGNXU3pvdXZmU0VoWlRCQnIyK2cyQUhj?=
 =?utf-8?B?NzFpRHZOUXFzdFZycDhyc3dGdFhPc3ROd2tCVGQ2bHZJdEw1SHJBVkhlS1ow?=
 =?utf-8?B?ZVd3SmRyRngyUVNNOUF5cnVyYXR1NmJhRU1TdTdDQXR2NzR6TDhBblZCM2o4?=
 =?utf-8?B?S1llak92Nkk3MFc3Y2Q1dENPVU1hU0ZLS0kwY1crYWNqRDB6WU1VRlowWmJT?=
 =?utf-8?B?MllJVUd4ZEkxZ1Q4UjVkMjg5MzNRbFRnM1Uxb3IvTnZPQmdmMExleWtSMEx2?=
 =?utf-8?B?Z2VMWGxyeGFuVFRnUjVjUmk3NHU3a2dPSWxwSEJEdWkxR3hKd0x5UXVZWjFn?=
 =?utf-8?B?aWdMVTUxTkhOOVMwQ0dwVmhyNVBCZ3FCS20xeHdUMWkxRGR5dkEyZDRNdlNR?=
 =?utf-8?B?TnZ4eVhxb0dFdXVXVXk4ZC9VaHVTU2x4TFVrbENOSXRqVklCY2NGUGUxNGlk?=
 =?utf-8?B?TTVnTXFTODdkNjBlQzE2K0REUUhWa1F2ZlQ5OXlyNWZRQ0tFZ05wVHdlQ1lE?=
 =?utf-8?B?WHBVdWthVDVQcnYzZ01jMytSYkc4YXpjSDRoTFZSUWJaUVQzZjFZU2U1Wm9z?=
 =?utf-8?B?Zkg1Lys1RVFlSW05LzhQeHppV1pDeGNQYWQ4MGtxOXdBRTRmeHAwMnJBaDcy?=
 =?utf-8?B?ZmpHakI2Y1JrdlNUZTJ1QTZZSENpazBwWE1haFpTK3lMaW91YjUzMlFrY2lx?=
 =?utf-8?B?RndianhseWxFa2xGL2JKMHpJUTJ3S1piaFJrcnB2Nk9Hd0h6ZkNCMXFkTkJP?=
 =?utf-8?B?SG5ydXR2UGg1d1hiS0kyWE5kTk8yQUZCdWErd2JCVGUrZXFRZ1dGWnJaT2ZG?=
 =?utf-8?Q?CA8+wjXgeIAZOG2C70CcCH2cA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c684a2-b353-437c-b663-08db263c414b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 16:34:03.8274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AzTeTeshiNESPFfsDVoPWoiyEoiN52cWyyu+wQRfw6ohnWOUI4mE0NlSoNpTdUBjl0oO+U30fJvtfQMtqKH+R4PuDeosCKVZL9LCHn38kEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6215
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIHR0eTogc2VyaWFsOiBzaC1zY2k6IEZpeCB0cmFuc21pdCBlbmQgaW50ZXJydXB0IGhh
bmRsZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIE1hciAxNiwgMjAyMyBhdCA1OjAx
4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBU
aGUgUlogU0NJLyBSWi9BMSBTQ0lGIGhhcyBvbmx5IDQgaW50ZXJydXB0cy4gVGhlIGZvdXJ0aCBp
bnRlcnJ1cHQgaXMNCj4gPiB0cmFuc21pdCBlbmQgaW50ZXJydXB0LCBzbyBzaHVmZmxlIHRoZSBp
bnRlcnJ1cHRzIHRvIGZpeCB0aGUgdHJhbnNtaXQNCj4gPiBlbmQgaW50ZXJydXB0IGhhbmRsZXIg
Zm9yIHRoZXNlIElQcy4NCj4gPg0KPiA+IEZpeGVzOiAzOTJmYjhkZjUyOGIgKCJzZXJpYWw6IHNo
LXNjaTogVXNlIHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwoKQ0KPiA+IGZvciBvcHRpb25hbCBp
bnRlcnJ1cHRzIikNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHRoZSByaWdodCBiYWQgY29t
bWl0Lg0KDQpPSy4gSSB3aWxsIHVzZSBiZWxvdyBjb21taXQgYXMgZml4ZXMgb25lLCANCnRoYXQg
aXMgdGhlIGNvbW1pdCB3aGljaCBhZGRlZCBSWi9BMSBTQ0lGIHdpdGggNCBpbnRlcnJ1cHRzLg0K
DQpjb21taXQgOGIwYmJkOTU2MjI4YWU4NyAoInNlcmlhbDogc2gtc2NpOiBBZGQgc3VwcG9ydCBm
b3IgUjdTOTIxMCIpDQoNCg0KPiANCj4gPiBTdWdnZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4gPiArKysgYi9k
cml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4gPiBAQCAtMzEsNiArMzEsNyBAQA0KPiA+ICAj
aW5jbHVkZSA8bGludXgvaW9wb3J0Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9rdGltZS5oPg0K
PiA+ICAjaW5jbHVkZSA8bGludXgvbWFqb3IuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21pbm1h
eC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51
eC9tbS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gPiBAQCAtMjg0MSw2ICsyODQy
LDcgQEAgc3RhdGljIGludCBzY2lfaW5pdF9zaW5nbGUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0K
PiAqZGV2LA0KPiA+ICAgICAgICAgc3RydWN0IHVhcnRfcG9ydCAqcG9ydCA9ICZzY2lfcG9ydC0+
cG9ydDsNCj4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPiA+ICAgICAg
ICAgdW5zaWduZWQgaW50IGk7DQo+ID4gKyAgICAgICBpbnQgaXJxX2NudDsNCj4gPiAgICAgICAg
IGludCByZXQ7DQo+ID4NCj4gPiAgICAgICAgIHNjaV9wb3J0LT5jZmcgICA9IHA7DQo+ID4gQEAg
LTI4NjQsNiArMjg2NiwxNCBAQCBzdGF0aWMgaW50IHNjaV9pbml0X3NpbmdsZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlDQo+ICpkZXYsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgc2NpX3Bv
cnQtPmlycXNbaV0gPSBwbGF0Zm9ybV9nZXRfaXJxKGRldiwgaSk7DQo+ID4gICAgICAgICB9DQo+
ID4NCj4gPiArICAgICAgIC8qDQo+ID4gKyAgICAgICAgKiBSWiBTQ0kvIFJaL0ExIFNDSUYgaGFz
IG9ubHkgNCBpbnRlcnJ1cHRzLiBUaGUgZm91cnRoIGludGVycnVwdA0KPiA+ICsgICAgICAgICog
aXMgdHJhbnNtaXQgZW5kIGludGVycnVwdCwgc28gc2h1ZmZsZSB0aGUgaW50ZXJydXB0cy4NCj4g
PiArICAgICAgICAqLw0KPiA+ICsgICAgICAgaXJxX2NudCA9IHBsYXRmb3JtX2lycV9jb3VudChk
ZXYpOw0KPiA+ICsgICAgICAgaWYgKGlycV9jbnQgPT0gNCkNCj4gPiArICAgICAgICAgICAgICAg
c3dhcChzY2lfcG9ydC0+aXJxc1tTQ0l4X0JSSV9JUlFdLA0KPiA+ICsgc2NpX3BvcnQtPmlycXNb
U0NJeF9URUlfSVJRXSk7DQo+ID4gKw0KPiANCj4gSSB0aGluayBpdCdzIHNpbXBsZXIgdG8ganVz
dCBjaGVjayBpZiBTQ0l4X1RFSV9JUlEgaXMgbWlzc2luZzoNCj4gDQo+ICAgICBpZiAoc2NpX3Bv
cnQtPmlycXNbU0NJeF9URUlfSVJRXSA8IDApDQo+ICAgICAgICAgICAgIHN3YXAoc2NpX3BvcnQt
PmlycXNbU0NJeF9CUklfSVJRXSwgc2NpX3BvcnQtDQo+ID5pcnFzW1NDSXhfVEVJX0lSUV0pOw0K
DQpPSy4NCg0KPiANCj4gV2UgYWxyZWFkeSByZWx5IG9uICJtYWtlIGR0YnNfY2hlY2siIHRvIGNh
dGNoIGludmFsaWQgY29tYmluYXRpb25zIChhbnl0aGluZw0KPiBkaWZmZXJlbnQgZnJvbSAxLzQv
NiBpbnRlcnJ1cHRzKS4NCj4gDQo+IEFuZCBwbGVhc2UgbW92ZSB0aGF0IGNvZGUgYmVsb3csIHRv
Z2V0aGVyIHdpdGggdGhlIG90aGVyIGNoZWNrcyBmb3Igbm9uLQ0KPiBleGlzdGluZyBpbnRlcnJ1
cHRzLg0KDQpPSywgV2lsbCBhZGQgYmVsb3cgY29kZSBpbiBwcm9iZQ0KDQorICAgICAgIGlycV9j
bnQgPSBwbGF0Zm9ybV9pcnFfY291bnQoZGV2KTsNCisgICAgICAgaWYgKGlycV9jbnQgIT0gMSAm
JiBpcnFfY250ICE9IDQgJiYgaXJxX2NudCAhPSA2KQ0KKyAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KKw0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gICAgICAgICAvKiBUaGUgU0NJ
IGdlbmVyYXRlcyBzZXZlcmFsIGludGVycnVwdHMuIFRoZXkgY2FuIGJlIG11eGVkDQo+IHRvZ2V0
aGVyIG9yDQo+ID4gICAgICAgICAgKiBjb25uZWN0ZWQgdG8gZGlmZmVyZW50IGludGVycnVwdCBs
aW5lcy4gSW4gdGhlIG11eGVkIGNhc2Ugb25seQ0KPiBvbmUNCj4gPiAgICAgICAgICAqIGludGVy
cnVwdCByZXNvdXJjZSBpcyBzcGVjaWZpZWQgYXMgdGhlcmUgaXMgb25seSBvbmUgaW50ZXJydXB0
DQo+IElELg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4g
DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZQ0KPiB0aGF0Lg0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
