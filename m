Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C7061F0D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 11:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbiKGKff (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 05:35:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbiKGKfG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 05:35:06 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E37E7B;
        Mon,  7 Nov 2022 02:34:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kabAqqJEO8UDMc59bKvAThKNcVVWWigMtYxW15lhS7snLJBBeOLVeA8h/L5XBSK9MDo8iPHoE4suljC89h6mCGtdAGKpR7UHYBUbuCmU3FVhCdRU9CiiEi+0hbT4HKiCNkKU6K4H+MJXEZuSzZR7LBj7ey7wAVaAJKgArT66JKfsLTxEPfmJMoW+0UB2j8bo8g+g0NeWmYkIULDJiKgoFF9NJeK/D7SfbYoGsJJwFg/6yvVMs1/Qe92kh8gz/YIG6zfX5jPXv1bXnR0coe7MU7Wgthd4s4qCbROBFDIyZL+o4p/O0ovFRaBpA2VU0eCzM/GACuULrxf9Q+RRVqHGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhxbJYYtKGxfwkIeqIWaBgg878Xi6t0ddkQchZFoMQ0=;
 b=TyAdMcnwEPd0/dH2cuWkLQeVe+2I+OaIlDo+scdRaNkhR8cK8AREq4TusXKWRhOXbu5wUpXsfGUlB58d1sAjeyz8nbi7h5aaunX3Z0ug/kby4evm2jFWsLwqBqGoETaFM/NoLMCSmKuPAUUm2j/OyXyClDFP9L0xYtM6Mc39aqtUwppn3VF4MUkn1GG8JICLj6PtssogVBRwxO3m86r3X3itraGlKOf4jWcKHDB/WwBv+uR3jNmIHKki/oTnLAROOtlUWZEczJHLWhbw6iAwn5kMglF8DsAfAiiRpYCdEwmH89D+AjDvPAh+FJwEXrx2DNwxeEgVFzF1iwX+8BJExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhxbJYYtKGxfwkIeqIWaBgg878Xi6t0ddkQchZFoMQ0=;
 b=qYGb1ZjtG/nve9rAt+lVB1d7lPvZinytuI4hUvg86vlQYwIFJmpYjT4tdWgQVxQgdMIm3khCdY0PmKuJ3Vqy0MeH+F1i2zD+cHoUL5FlPJcOqEV9t/Ps7nuLuYieTpwUeRC6Xq3LyoWcI14T5rTr2MzkSE33EqAoGIzKDoq2uMw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10220.jpnprd01.prod.outlook.com (2603:1096:400:1db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 10:34:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 10:34:53 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v9 2/2] pwm: Add support for RZ/G2L GPT
Thread-Topic: [PATCH v9 2/2] pwm: Add support for RZ/G2L GPT
Thread-Index: AQHY6roFtE6qfx4MwE6Ju+KWxJzVxq4zUdiAgAAAtTA=
Date:   Mon, 7 Nov 2022 10:34:53 +0000
Message-ID: <OS0PR01MB5922DE47BABC3C271C5FFECD863C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221028104231.220426-1-biju.das.jz@bp.renesas.com>
 <20221028104231.220426-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXZFtT9hjTMq3_xbbXX6_SNVSt3byGnDAko24_0XG7bcQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXZFtT9hjTMq3_xbbXX6_SNVSt3byGnDAko24_0XG7bcQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10220:EE_
x-ms-office365-filtering-correlation-id: d27f767d-e815-4b1e-b4df-08dac0abb539
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oouqv93WFMz/1AukSqZnnuZj1RFjUw1o7RVZw5b/9oXlUrSR9a5PraSrgn+ULuj2DqfTqfgbG9AqFP+HtA+ndbbz9LCtzWCIA/0QpLewIDtBOdE36SsKSs7U8uU7Ddem9lwpFRN/EpBUm1ZJ9icz1EdoH3X69yPJfce2U5FeCgNv3BJSHy+zBO/pys/XkgDYsOMuyIGv1jw+aYCNmO3ZMCVXWmXuhgGjo1nNlrlmQ4+rF9l3agYpuSuZc9Yw6nqKrhL/njAe0WPa9o2/ByUoJGYUH9K0qvKLidvwz70H1VMyCXLyjeBdK7FozjD3eZyvBAcijA3RlQa05fS+j6NcWCAuxjnWHYTd9jq7Z5Jq0+qrL33xZ+ZZkBtBLHRAFUFZ/0JeQVF7rOGGqQGH5jDAZPPx9x/SInOQ9Aiim1xqirDiIyKIhzlUr4C3fUoc/cgYupCk/HgOdFVXBm3vxkYE3YlE2J84i+4buzfAJSs100F2LhJz4vxHlZkIopst/XeoDV7ce5tfrY2sha5gh8bwu/6YnNSIyg1XLnBHx8/EHpC4aN1a8RubGfTTGJtd2XMozTuLAuN/v8q0C7orXTD03tHJfT7HGMEMtD/dSgTvASNI1xywO6rF6O7r/INCIIo+bsd+q5MWBhTHqwEgEW/894W9QYx6nI7PU7jd74tj/F7MO2JOwVAxd8kQOjbLvEQX5cOh3wTK9w1aVMPbDatjqI7u61XoY+NOGIXCjRdELAVMqiEe3UpoCPmgTbQo6vx+Y2Dcmeqgh3c4KwXVzlI84Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199015)(7696005)(53546011)(6506007)(86362001)(478600001)(9686003)(71200400001)(26005)(316002)(6916009)(54906003)(8676002)(64756008)(66446008)(66556008)(66476007)(186003)(41300700001)(83380400001)(8936002)(55016003)(122000001)(38100700002)(33656002)(52536014)(5660300002)(2906002)(4326008)(66946007)(76116006)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1NZbjhFbkJrWlZGa1o4UGRjMHZkQS9mbnh6Z1ZWN3g0TW5meCt0T2lCTFFM?=
 =?utf-8?B?Q2hhZ3N1clcxN1JpVG1hM1lDWmdKNHE2dXVDL0I2c1doblBpTldmN3BFbEt3?=
 =?utf-8?B?UUFFUnJWejhxL3ppUUl6cWJ4a3VFbW1Ucll0U1BZbXdtc2NkTWpJMzljVzJU?=
 =?utf-8?B?UWZHOWZTU2szMTZBVGg4dDE2QUdReEk4b1RoeFlzVGU3alNXWVZqOGw1dE1m?=
 =?utf-8?B?MFFpOHNWOERrdlI1WGkxUGRScE80a3dBRkFnbGJUcHdZcGF5dVkwYzc3Q1Rh?=
 =?utf-8?B?UG1hY0dwWE1rVTdHZFA0RHE0OU00UE8zaFdFNmJqQmdSTjUwM2NSTWF3bTB2?=
 =?utf-8?B?WkJaazhKOGI2OTVlSEtPZjBIUkJyV296dldNNnhnZTlBQmxDRkpCMFBCWGo3?=
 =?utf-8?B?b25xMHB2VlVqcmFxakNpSUdpbVEyYng2WlpWd0VwTVhhL1p4TUV3MmRqaFIw?=
 =?utf-8?B?cU4yMkhldllkV0x2b25ibVVNK1F6VWpLWlZpRXdNeTJhUmN1ZXUxNGJ5NFIr?=
 =?utf-8?B?OWlBSGJLWThKVFN3L2tINUp2OHlKYnJweE9tci9GL2lrMC9KNEdZSUNnbndu?=
 =?utf-8?B?RHdSaG5Fb0kzMFE5QUxSOTRTT2QxcExpWjZUV096M0Z5Ry9jU0llWFgvS3Fp?=
 =?utf-8?B?MVpDdlV6SFhKYnhnS0gvcnlIelp3THA0Mmk1dFozSGFuVTlydjJJZTNESlg0?=
 =?utf-8?B?ZnpMU3VaUEs2bURGUlFGNjZjNy95SjRsUFJIei9iSER3L0JkZVgrNmt3SUJ2?=
 =?utf-8?B?OUtMV3JqL01FTE13a3VJS3lFUEorMk1wNEVYcG52T3c4eDBXVzFOeXdhWDcw?=
 =?utf-8?B?R0FIK0NpWTlpQnZyU2dnbVFLa3A3VkFUamQ3SGoyTGdqNFZob0NUV3d6ZW5Q?=
 =?utf-8?B?eVJTUkZiWjc0KzhnK1MvL29wS3dqNE0xUkliRUQyQVhicDR2M2RieTNXVjR4?=
 =?utf-8?B?WDBjU2dnUU9qR2RvbmRoRVpjUmpXTDh0ZHd2SG9kSGREajNmSithdm9LVXNY?=
 =?utf-8?B?ZWhHaDVuNWtmYVNyOUtObUVNdGFUYVlKQVNVUDJRK2dCdmh5ZWxaaVBaMXEx?=
 =?utf-8?B?QjZzeno2Y1VMTDI2SVVaMXVCOWh3cmYrSmJBcXBZY1NXRkg4UzBoT3RoVGIw?=
 =?utf-8?B?YjNOZXlRa0pTZnZMMm5wQ3NxTzJHSEhWYWdSYWpnNXRJM2NNVlJuMkFWZVhB?=
 =?utf-8?B?ZlJBVU9SNnJZeGF3dHpLM0lYWlhyMG5WYU5takQ0U0NoZE9UcTJBYmpzNmo1?=
 =?utf-8?B?bU1XdlpMODlydEQxRDlvNWZxTXpmSVY5Nmh2ekM0ZHI0NTdVbXIxdXhGY3BP?=
 =?utf-8?B?Q2RQR0RVME1OQk9IN2I3TmhVQm10Unc2eW1WOVlVVUQ2YXptU052Y001SE1S?=
 =?utf-8?B?RW1zcUJWYzVXQm5aaGRuL25BS3VNOWEvM0NtNXVGRUVJUEcyQ1hzTjRZYkht?=
 =?utf-8?B?V2hoajJRUTJ0Mk9QQlFQTUV3bmFaRnRnY1FRa2pmcDNDSmhiaUlrRTY0dmhI?=
 =?utf-8?B?cHVjK1gwemt3R2hUSzJKeUZRM3NPSUlzc2JDNGNNL2JVVWk3RGUvQ01VV3Ix?=
 =?utf-8?B?eW12ZmF4Vk9yYUpCT0RvOG5SeXN2VnNhMUt4WjJUL2ZVb0lPOFRTbmgwTzBF?=
 =?utf-8?B?RUtpaWZTblVlMGF0K3JLb01jMnY5K3I0TmdCdGNuZG5sbGpLSDF2UjFqS1dm?=
 =?utf-8?B?aEJTWDVKNWd2TmVCWnpsRlM0WWo4b2xZWXAzNk4xTXIyNHkwaWY5M0lzam1Q?=
 =?utf-8?B?eHVJc3hPLzBuRzN3cENVbUdCUTFsRHh1WVNJZEdmRUF6S3ZFVG5Kdnh3TEhU?=
 =?utf-8?B?MDg0Mk8vME93eVMrMFB6ZTAydC8zTTA2eWFJWUcxR1ZRa2lUZjlwVG9HWkps?=
 =?utf-8?B?RWgyMm5MdEpPSjlmSlN3TjRUQnh0MjZ0RlJOeVRXSzloRU1MZ2xBRUdUakpv?=
 =?utf-8?B?NVNlanE0dGZwTXQxaHdlNXlPZjVtOExnYUhxaVNJeStmaTYrQ1ovazNyWDZ4?=
 =?utf-8?B?THZ0Z1JESDd5US83ZW9vUGlrT3BKakZRVFA5ME1LbHl3MDZCeEE4YkxmU1VW?=
 =?utf-8?B?Y2FUZS8rL0UyTDF0bDJ5VDF1WVcxVVhlZSttaVJyd3V4cVM3WjVwa3dMV01C?=
 =?utf-8?B?YUpvRFI2UE1qL0pQWXM5aXF0R2plcVBRT3k5ZmJvZFdOQUFTaTBzKy9Cb092?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27f767d-e815-4b1e-b4df-08dac0abb539
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 10:34:53.8276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/0XxQgDQ+e4jnguom6FOXmY8nzJYUF+CdXYfBtEj/Hj2vohVurNEAYpun0AkbV2SQxJ3/MgyBa0zArmy0Ebz35Ad6uil2ndrB870lYInLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10220
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA3IE5vdmVtYmVyIDIwMjIgMTA6MjgNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2OSAyLzJdIHB3bTogQWRkIHN1cHBvcnQgZm9yIFJaL0cyTCBHUFQNCj4gDQo+IEhpIEJp
anUsDQo+IA0KPiBPbiBGcmksIE9jdCAyOCwgMjAyMiBhdCAxMjo0MiBQTSBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFJaL0cyTCBHZW5lcmFsIFBXTSBU
aW1lciAoR1BUKSBjb21wb3NlZCBvZiA4IGNoYW5uZWxzIHdpdGggMzItYml0DQo+ID4gdGltZXIg
KEdQVDMyRSkuIEl0IHN1cHBvcnRzIHRoZSBmb2xsb3dpbmcgZnVuY3Rpb25zDQo+ID4gICogMzIg
Yml0cyDDlyA4IGNoYW5uZWxzDQo+ID4gICogVXAtY291bnRpbmcgb3IgZG93bi1jb3VudGluZyAo
c2F3IHdhdmVzKSBvciB1cC9kb3duLWNvdW50aW5nDQo+ID4gICAgKHRyaWFuZ2xlIHdhdmVzKSBm
b3IgZWFjaCBjb3VudGVyLg0KPiA+ICAqIENsb2NrIHNvdXJjZXMgaW5kZXBlbmRlbnRseSBzZWxl
Y3RhYmxlIGZvciBlYWNoIGNoYW5uZWwNCj4gPiAgKiBUd28gSS9PIHBpbnMgcGVyIGNoYW5uZWwN
Cj4gPiAgKiBUd28gb3V0cHV0IGNvbXBhcmUvaW5wdXQgY2FwdHVyZSByZWdpc3RlcnMgcGVyIGNo
YW5uZWwNCj4gPiAgKiBGb3IgdGhlIHR3byBvdXRwdXQgY29tcGFyZS9pbnB1dCBjYXB0dXJlIHJl
Z2lzdGVycyBvZiBlYWNoIGNoYW5uZWwsDQo+ID4gICAgZm91ciByZWdpc3RlcnMgYXJlIHByb3Zp
ZGVkIGFzIGJ1ZmZlciByZWdpc3RlcnMgYW5kIGFyZSBjYXBhYmxlIG9mDQo+ID4gICAgb3BlcmF0
aW5nIGFzIGNvbXBhcmlzb24gcmVnaXN0ZXJzIHdoZW4gYnVmZmVyaW5nIGlzIG5vdCBpbiB1c2Uu
DQo+ID4gICogSW4gb3V0cHV0IGNvbXBhcmUgb3BlcmF0aW9uLCBidWZmZXIgc3dpdGNoaW5nIGNh
biBiZSBhdCBjcmVzdHMgb3INCj4gPiAgICB0cm91Z2hzLCBlbmFibGluZyB0aGUgZ2VuZXJhdGlv
biBvZiBsYXRlcmFsbHkgYXN5bW1ldHJpYyBQV00gd2F2ZWZvcm1zLg0KPiA+ICAqIFJlZ2lzdGVy
cyBmb3Igc2V0dGluZyB1cCBmcmFtZSBjeWNsZXMgaW4gZWFjaCBjaGFubmVsICh3aXRoIGNhcGFi
aWxpdHkNCj4gPiAgICBmb3IgZ2VuZXJhdGluZyBpbnRlcnJ1cHRzIGF0IG92ZXJmbG93IG9yIHVu
ZGVyZmxvdykNCj4gPiAgKiBHZW5lcmF0aW9uIG9mIGRlYWQgdGltZXMgaW4gUFdNIG9wZXJhdGlv
bg0KPiA+ICAqIFN5bmNocm9ub3VzIHN0YXJ0aW5nLCBzdG9wcGluZyBhbmQgY2xlYXJpbmcgY291
bnRlcnMgZm9yIGFyYml0cmFyeQ0KPiA+ICAgIGNoYW5uZWxzDQo+ID4gICogU3RhcnRpbmcsIHN0
b3BwaW5nLCBjbGVhcmluZyBhbmQgdXAvZG93biBjb3VudGVycyBpbiByZXNwb25zZSB0byBpbnB1
dA0KPiA+ICAgIGxldmVsIGNvbXBhcmlzb24NCj4gPiAgKiBTdGFydGluZywgY2xlYXJpbmcsIHN0
b3BwaW5nIGFuZCB1cC9kb3duIGNvdW50ZXJzIGluIHJlc3BvbnNlIHRvIGENCj4gPiAgICBtYXhp
bXVtIG9mIGZvdXIgZXh0ZXJuYWwgdHJpZ2dlcnMNCj4gPiAgKiBPdXRwdXQgcGluIGRpc2FibGUg
ZnVuY3Rpb24gYnkgZGVhZCB0aW1lIGVycm9yIGFuZCBkZXRlY3RlZA0KPiA+ICAgIHNob3J0LWNp
cmN1aXRzIGJldHdlZW4gb3V0cHV0IHBpbnMNCj4gPiAgKiBBL0QgY29udmVydGVyIHN0YXJ0IHRy
aWdnZXJzIGNhbiBiZSBnZW5lcmF0ZWQgKEdQVDMyRTAgdG8gR1BUMzJFMykNCj4gPiAgKiBFbmFi
bGVzIHRoZSBub2lzZSBmaWx0ZXIgZm9yIGlucHV0IGNhcHR1cmUgYW5kIGV4dGVybmFsIHRyaWdn
ZXINCj4gPiAgICBvcGVyYXRpb24NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBiYXNpYyBwd20g
c3VwcG9ydCBmb3IgUlovRzJMIEdQVCBkcml2ZXIgYnkgY3JlYXRpbmcNCj4gPiBzZXBhcmF0ZSBs
b2dpY2FsIGNoYW5uZWxzIGZvciBlYWNoIElPcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2OC0+djk6
DQo+ID4gICogZGVhc3NlcnQgYWZ0ZXIgZGV2bV9jbGtfZ2V0KCkgdG8gYXZvaWQgcmVzZXQgc3Rh
eXMgZGVhc3NlcnRlZCxpbiBjYXNlDQo+ID4gICAgY2xrX2dldCgpIGZhaWxzLg0KPiA+ICAqIFJl
bW92ZWQgY2hfb2ZmcyBmcm9tIHN0cnVjdCByemcybF9ncHRfY2hpcCBhbmQgdXNlIG1hY3JvIGlu
c3RlYWQuDQo+ID4gICogUmVtb3ZlZCBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSBmcm9tIHByb2Jl
IGFzIGl0IGlzIGdpdmluZw0KPiA+ICAgIGdwdF9wY2xrIGFscmVhZHkgZGlzYWJsZWQgd2Fybmlu
ZyBpbiB0aGUgZXJyb3IgcGF0aC4NCj4gPiAgICAgICAgIFsgICAgMC45MTU2NjRdICBjbGtfY29y
ZV9kaXNhYmxlKzB4MjVjLzB4Mjc0DQo+ID4gICAgICAgICBbICAgIDAuOTE1NzU0XSAgY2xrX2Rp
c2FibGUrMHgyYy8weDQ0DQo+ID4gICAgICAgICBbICAgIDAuOTE1ODMzXSAgcnpnMmxfZ3B0X3Bt
X3J1bnRpbWVfc3VzcGVuZCsweDFjLzB4MzQNCj4gPiAgICAgICAgIFsgICAgMC45MTU5MzhdICBw
bV9nZW5lcmljX3J1bnRpbWVfc3VzcGVuZCsweDI4LzB4NDANCj4gPiAgICAgICAgIFsgICAgMC45
MTYwNDJdICBnZW5wZF9ydW50aW1lX3N1c3BlbmQrMHhhOC8weDJiMA0KPiA+ICAgICAgICAgWyAg
ICAwLjkxNjEzNl0gIF9fcnBtX2NhbGxiYWNrKzB4NDQvMHgxM2MNCj4gPiAgICAgICAgIFsgICAg
MC45MTYyMThdICBycG1fY2FsbGJhY2srMHg2NC8weDcwDQo+ID4gICAgICAgICBbICAgIDAuOTE2
Mjk2XSAgcnBtX3N1c3BlbmQrMHgxMDQvMHg2MzANCj4gPiAgICAgICAgIFsgICAgMC45MTYzNzRd
ICBwbV9ydW50aW1lX3dvcmsrMHhiNC8weGJjDQo+ID4gICAgICAgICBbICAgIDAuOTE2NDU2XSAg
cHJvY2Vzc19vbmVfd29yaysweDI4OC8weDZhDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUh
DQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3B3bS9wd20tcnpnMmwt
Z3B0LmMNCj4gDQo+ID4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgcnpnMmxfZ3B0X3BtX3J1
bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlDQo+ID4gKypkZXYpIHsNCj4gPiArICAgICAgIHN0
cnVjdCByemcybF9ncHRfY2hpcCAqcnpnMmxfZ3B0ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+
ID4gKw0KPiA+ICsgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHJ6ZzJsX2dwdC0+Y2xrKTsN
Cj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGlj
IGludCBfX21heWJlX3VudXNlZCByemcybF9ncHRfcG1fcnVudGltZV9yZXN1bWUoc3RydWN0IGRl
dmljZQ0KPiA+ICsqZGV2KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcnpnMmxfZ3B0X2NoaXAgKnJ6
ZzJsX2dwdCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICsNCj4gPiArICAgICAgIGNsa19w
cmVwYXJlX2VuYWJsZShyemcybF9ncHQtPmNsayk7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJu
IDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBy
emcybF9ncHRfcG1fb3BzID0gew0KPiA+ICsgICAgICAgU0VUX1JVTlRJTUVfUE1fT1BTKHJ6ZzJs
X2dwdF9wbV9ydW50aW1lX3N1c3BlbmQsDQo+ID4gK3J6ZzJsX2dwdF9wbV9ydW50aW1lX3Jlc3Vt
ZSwgTlVMTCkgfTsNCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHJ6ZzJsX2dwdF9yZXNldF9hc3Nl
cnRfcG1fZGlzYWJsZSh2b2lkICpkYXRhKSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcnpnMmxfZ3B0
X2NoaXAgKnJ6ZzJsX2dwdCA9IGRhdGE7DQo+ID4gKw0KPiA+ICsgICAgICAgcG1fcnVudGltZV9k
aXNhYmxlKHJ6ZzJsX2dwdC0+Y2hpcC5kZXYpOw0KPiA+ICsgICAgICAgcG1fcnVudGltZV9zZXRf
c3VzcGVuZGVkKHJ6ZzJsX2dwdC0+Y2hpcC5kZXYpOw0KPiA+ICsgICAgICAgcmVzZXRfY29udHJv
bF9hc3NlcnQocnpnMmxfZ3B0LT5yc3RjKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCByemcybF9ncHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0KPiA+ICsg
ICAgICAgYm9vbCBjaF9lbltSWkcyTF9NQVhfUFdNX0NIQU5ORUxTXTsNCj4gPiArICAgICAgIHN0
cnVjdCByemcybF9ncHRfY2hpcCAqcnpnMmxfZ3B0Ow0KPiA+ICsgICAgICAgaW50IHJldDsNCj4g
PiArICAgICAgIHUzMiBpOw0KPiA+ICsNCj4gPiArICAgICAgIHJ6ZzJsX2dwdCA9IGRldm1fa3ph
bGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnJ6ZzJsX2dwdCksDQo+IEdGUF9LRVJORUwpOw0KPiA+
ICsgICAgICAgaWYgKCFyemcybF9ncHQpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5P
TUVNOw0KPiA+ICsNCj4gPiArICAgICAgIHJ6ZzJsX2dwdC0+bW1pbyA9IGRldm1fcGxhdGZvcm1f
aW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsNCj4gPiArICAgICAgIGlmIChJU19FUlIocnpnMmxf
Z3B0LT5tbWlvKSkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocnpnMmxfZ3B0
LT5tbWlvKTsNCj4gPiArDQo+ID4gKyAgICAgICByemcybF9ncHQtPnJzdGMgPSBkZXZtX3Jlc2V0
X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZSgmcGRldi0+ZGV2LA0KPiBOVUxMKTsNCj4gPiArICAgICAg
IGlmIChJU19FUlIocnpnMmxfZ3B0LT5yc3RjKSkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJu
IGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUihyemcybF9ncHQtPnJzdGMpLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZ2V0IHJlc2V0IGZhaWxlZFxu
Iik7DQo+ID4gKw0KPiA+ICsgICAgICAgcnpnMmxfZ3B0LT5jbGsgPSBkZXZtX2Nsa19nZXQoJnBk
ZXYtPmRldiwgTlVMTCk7DQo+ID4gKyAgICAgICBpZiAoSVNfRVJSKHJ6ZzJsX2dwdC0+Y2xrKSkN
Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRS
X0VSUihyemcybF9ncHQtPmNsayksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJjYW5ub3QgZ2V0IGNsb2NrXG4iKTsNCj4gPiArDQo+ID4gKyAgICAgICByZXQgPSBy
ZXNldF9jb250cm9sX2RlYXNzZXJ0KHJ6ZzJsX2dwdC0+cnN0Yyk7DQo+ID4gKyAgICAgICBpZiAo
cmV0KQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2
LCByZXQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjYW5ub3Qg
ZGVhc3NlcnQgcmVzZXQNCj4gPiArIGNvbnRyb2xcbiIpOw0KPiA+ICsNCj4gPiArICAgICAgIHJ6
ZzJsX2dwdC0+cmF0ZSA9IGNsa19nZXRfcmF0ZShyemcybF9ncHQtPmNsayk7DQo+ID4gKw0KPiA+
ICsgICAgICAgY2xrX3ByZXBhcmVfZW5hYmxlKHJ6ZzJsX2dwdC0+Y2xrKTsNCj4gDQo+IFNvIHlv
dSBlbmFibGUgdGhlIGNsb2NrIGluIC5wcm9iZSgpLi4uDQoNClllcywgQnV0IHRoZSBQTSBoYW5k
bGVyIGNvbnRleHQgZGlzYWJsZSB0aGUgY2xvY2sgb25jZSB3ZSByZXR1cm4gZnJvbSBwcm9iZS4N
ClBsZWFzZSBzZWUgdGhlIGNvbnRleHQgZm9yIGNsa19kaXNhYmxlLg0KDQogWyAgICAwLjkxNTc1
NF0gIGNsa19kaXNhYmxlKzB4MmMvMHg0NA0KIFsgICAgMC45MTU4MzNdICByemcybF9ncHRfcG1f
cnVudGltZV9zdXNwZW5kKzB4MWMvMHgzNA0KIFsgICAgMC45MTU5MzhdICBwbV9nZW5lcmljX3J1
bnRpbWVfc3VzcGVuZCsweDI4LzB4NDANCiBbICAgIDAuOTE2MDQyXSAgZ2VucGRfcnVudGltZV9z
dXNwZW5kKzB4YTgvMHgyYjANCiBbICAgIDAuOTE2MTM2XSAgX19ycG1fY2FsbGJhY2srMHg0NC8w
eDEzYw0KIFsgICAgMC45MTYyMThdICBycG1fY2FsbGJhY2srMHg2NC8weDcwDQogWyAgICAwLjkx
NjI5Nl0gIHJwbV9zdXNwZW5kKzB4MTA0LzB4NjMwDQogWyAgICAwLjkxNjM3NF0gIHBtX3J1bnRp
bWVfd29yaysweGI0LzB4YmMNCg0KPiANCj4gPiArICAgICAgIHBtX3J1bnRpbWVfc2V0X2FjdGl2
ZSgmcGRldi0+ZGV2KTsNCj4gPiArICAgICAgIHBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYp
Ow0KPiA+ICsgICAgICAgcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCZwZGV2LT5kZXYs
DQo+ID4gKw0KPiA+ICsgcnpnMmxfZ3B0X3Jlc2V0X2Fzc2VydF9wbV9kaXNhYmxlLA0KPiANCj4g
Li4uIGFuZCByZWx5IG9uIFJ1bnRpbWUgUE0gdG8gZGlzYWJsZSB0aGUgY2xvY2sgb24gZXJyb3Iv
cmVtb3ZlPw0KPiBEb2VzIHRoYXQgYWN0dWFsbHkgd29yaz8NCg0KU2VlIGFib3ZlLg0KDQpDaGVl
cnMsDQpCaWp1DQoNCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByemcybF9ncHQpOw0KPiA+ICsgICAgICAgaWYgKHJldCA8IDApDQo+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsgICAgICAgbXV0ZXhfaW5pdCgmcnpnMmxf
Z3B0LT5sb2NrKTsNCj4gPiArICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHJ6ZzJs
X2dwdCk7DQo+ID4gKw0KPiA+ICsgICAgICAgLyoNCj4gPiArICAgICAgICAqICBXZSBuZWVkIHRv
IGtlZXAgdGhlIGNsb2NrIG9uLCBpbiBjYXNlIHRoZSBib290bG9hZGVyIGhhcw0KPiBlbmFibGVk
IHRoZQ0KPiA+ICsgICAgICAgICogIFBXTSBhbmQgaXMgcnVubmluZyBkdXJpbmcgcHJvYmUoKS4N
Cj4gPiArICAgICAgICAqLw0KPiA+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IFJaRzJMX01BWF9Q
V01fQ0hBTk5FTFM7IGkrKykgew0KPiA+ICsgICAgICAgICAgICAgICBjaF9lbltpXSA9IHJ6ZzJs
X2dwdF9pc19jaF9lbmFibGVkKHJ6ZzJsX2dwdCwgaSk7DQo+ID4gKyAgICAgICAgICAgICAgIGlm
IChjaF9lbltpXSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwbV9ydW50aW1lX2dldF9z
eW5jKCZwZGV2LT5kZXYpOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHJ6ZzJs
X2dwdC0+Y2hpcC5kZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsgICAgICAgcnpnMmxfZ3B0LT5jaGlw
Lm9wcyA9ICZyemcybF9ncHRfb3BzOw0KPiA+ICsgICAgICAgcnpnMmxfZ3B0LT5jaGlwLm5wd20g
PSBSWkcyTF9NQVhfUFdNX0NIQU5ORUxTOw0KPiA+ICsNCj4gPiArICAgICAgIHJldCA9IGRldm1f
cHdtY2hpcF9hZGQoJnBkZXYtPmRldiwgJnJ6ZzJsX2dwdC0+Y2hpcCk7DQo+ID4gKyAgICAgICBp
ZiAocmV0KSB7DQo+ID4gKyAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBSWkcyTF9NQVhf
UFdNX0NIQU5ORUxTOyBpKyspIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoY2hf
ZW5baV0pDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbV9ydW50aW1lX3B1
dCgmcGRldi0+ZGV2KTsNCj4gPiArICAgICAgICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAg
ICAgICAgICAgZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsICJmYWlsZWQgdG8gYWRkIFBX
TSBjaGlwXG4iKTsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gcmV0
Ow0KPiA+ICt9DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0K
PiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlDQo+IHRoYXQuDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
