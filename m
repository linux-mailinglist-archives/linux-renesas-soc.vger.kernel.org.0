Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871A35C01EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Sep 2022 17:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiIUPpa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Sep 2022 11:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbiIUPp2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Sep 2022 11:45:28 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FBE5E567;
        Wed, 21 Sep 2022 08:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gClbrAKdax7HbtD75QmqPAv6KIqgGctN2sRe6z9W/W82xb5Gajr8SPPEnO4ypQ1DxHS+Rp6csdx+scBL7mJiCvCBZNQ5Q7ikqOs/5jlX//63BHuiKglRGzErsyEySvobw1pBJrfepZIOqVQO49fc3n2/ZtxcojIh5Sg5WaYDzW/1dCZD1y2Ze/xSHeC9WA278c765aR1o/K5HEAfIVQB9ZUK/SEKaCxVBnRquL9ubcx2givindYeP5PZ4seBkDu0xq2nrAC5GpQSDXkzDSoVxSu8+PtAZDIZlNBKYnhA8cEAJpVoBknFy8bleP+qnPAzM1ypGe5t+3kiQr0O5gGxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bOao9Px2g4w7NsjwdLOHAwvAgbBWgFOxGNF9xrCsDk=;
 b=VkxuMrkKoKrCARrjgkEIR82S1j/e+XbTXXzcz29CKElHgbhYYAQ5O/gnzpoU6R2nDfT7tJWDAH06wZFqO5IXohZ39dFUTlPfhbmPNu1D+BOjTgTg5GKnUi1px+wV0duPg5He7GHOnlYw9Thm+W0dWvRFFt960M2483q0iAKFZ+i7UzfjdUsq01JCxdH7ssAuKBCnsNEDZOKPae2DceRlQ2SaJceNcxPe3bSR63rfaH20XBkw0OU3X6DUqUwEDfw3pWMHCUOTbIQg34Vw2CcVKWkQTWWcMsK5K6TiTBGoC5XQDrsaSQTRajh7G0JkWlmvS354EoyaI9clwqdmRW0OWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bOao9Px2g4w7NsjwdLOHAwvAgbBWgFOxGNF9xrCsDk=;
 b=nrHld9Rk/MANlOXkns5PjpjXc+1YxjJu8/BzB8lZ0vKN99/8VRRa3HF5Atj3k/d13GjV/yWz3A93zUP90C2KrzjiZXLo7OYQqXflE/BJBz8GwMbYGdkE7Jp5q+OOPpkw6BL4XZbfPSWTCBKTrkk0epUz5JEN60ZuM96Hi/5f6AQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8671.jpnprd01.prod.outlook.com (2603:1096:604:180::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Wed, 21 Sep
 2022 15:45:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5654.017; Wed, 21 Sep 2022
 15:45:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] mmc: renesas_sdhi: Add clk margin for sdhi hs clock
Thread-Topic: [PATCH v2] mmc: renesas_sdhi: Add clk margin for sdhi hs clock
Thread-Index: AQHYzAShIsegq7K2yE697IQJlXUFH63mhu4AgAOC5LA=
Date:   Wed, 21 Sep 2022 15:45:23 +0000
Message-ID: <OS0PR01MB59229766CC71D8CC68FE92B6864F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220919084838.3066429-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVF4WDA6e4bTXuqLCKCCCYYYGW6Cufi3kPFuTGt184RJA@mail.gmail.com>
In-Reply-To: <CAMuHMdVF4WDA6e4bTXuqLCKCCCYYYGW6Cufi3kPFuTGt184RJA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8671:EE_
x-ms-office365-filtering-correlation-id: 13a3d793-2150-4d65-cf83-08da9be84bc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ED+Yx0GhBD8qudRKC5kigytgLeocmDkkhXJ4aZ2C/YQpAyrwopL3cszpc4LwwWqRnaXh5UVxo/vMp+m7DIZFrGBDbbqVnZfIhkWegeXwhYfEt9xD6Dmfli1BUUbD5xF1ftnEr/pS8U1lFImIWvRMJ85S7YSBKqj2LfghNT1H+GwTa60dCMJo4JSFi2tJ5I4Q49tUaOk+CawOHqUGfnH/F5ikUACCYBD1YBCqYjrZjeTFIfMho668dchbkoNcRcyrZ39btut0NQEzFIX/VPW1yHJZQ/8DmGIq4eI2pwBRONxp+hv3bECZHOpx6ab2HcvJuDE6NhankSnhqM9KbfyjXY+ejjPTy7Q6c2BRMyzoR0rjsS1c8UwXeCv5fA9rik8eOEDkfue1LnQavKUtQ2adsLZE5yL8Mh0PoWfKmz27zu9Wa0U8Z8xvcSSU/o8P/okchhmxDlZtLMeT1zQVKuz1N5gO/Zme5oxFSj6jQ9dJ54iAFuugdLKdQscr4g/EL6sQ6YaZ+SvidFYpbHKlJgLkqeGgq6f+pdUo0469qwYjir9QGyJnGEok95ckcDBTXlLs9Sir8qDzT3MiXF8dHd0Ls2es+0LQP/ced570b1bFIaFf7FnVbrZgwwCrRM68Yqgh1fp2X7Lvi/Dfe9IPb+4QCeskPD2Jx/kfTZN+aXdpLaRuedoNSx4ya6phSfv3g1VvhYqcsKVEDyNNwvuQJrIXLj78ikrFRE2XVvgJCTD0yEi9l9jhV/D9Jha1v8Qmq17yHQXLX7qD1rJmGTI7c5419Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(478600001)(38100700002)(52536014)(41300700001)(9686003)(54906003)(2906002)(122000001)(26005)(53546011)(6506007)(107886003)(7696005)(71200400001)(6916009)(316002)(5660300002)(64756008)(33656002)(83380400001)(186003)(66556008)(38070700005)(76116006)(66946007)(66476007)(66446008)(4326008)(86362001)(55016003)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlBLN2daR09SaEttQURrYVpMU0E5bzJMUjR4b20rQjJYS25ObjVqMzVkUGZm?=
 =?utf-8?B?dktkK0RUZlA2Zzk3OUx6QXVZVWhGdGR0SDQ0SWhvZkEzZ2hSWGltNjcvOTFG?=
 =?utf-8?B?WHloci81bFdpdDE5ZU5tK00rZmFzOWpEMDdzckhKWVB3YWdNbDlwQ0MxS1k2?=
 =?utf-8?B?UlRqZjdxdklJRG53U3lqaS9hWGF2ZG9rc1BZcnZ1dGVia0d2VVQ0aFBiUzBh?=
 =?utf-8?B?aktzeklXc0IwR1Njd1BEd0ROUXJBNGNFcmVIU0FRQTYrWmYxdklieEhhbG5P?=
 =?utf-8?B?dlpDUmpNVGRKSjgzaGtpTWgvdkVDelJ2L2JJSnFvRFRGSlp1cmErblRQdndp?=
 =?utf-8?B?Slg1RkJkOFYxSXNNNnd4ZXlMTDJ6V1FlT0lhdUpJcWlqMGpaKzJxT0RDZ1Vl?=
 =?utf-8?B?bkZmelNYSlNZemkwSzY4Ni9jRTBHcWNyRFNhSHJqeVp6R0dManYybmdwSHNF?=
 =?utf-8?B?UEs5Q2NUeUE2T2RHOElwbG5ETjIyN1FUWTJPdkcwMlVHN2RIZGFTL0lnc1BR?=
 =?utf-8?B?d2x4K1Bzd3JhQ1B6YWpNU2thZmRsa2lSN2xTZlFoaitTZ3dlZDlsVDZkYThM?=
 =?utf-8?B?aTFFWEE5eXAzN2svZ1VlMFZoT3NkWGlWMHZIaGdFdVpEdUl0TkhuVm0wMnNW?=
 =?utf-8?B?UG5FdkpBaWNlcWMwWmgrMC9TcVlVQ3dXeFBuWWdRSmFibkNjaE01WGE3UTNN?=
 =?utf-8?B?M3JzanJyVE9PQmw3VGdOU1g3M0dnbUZLeDQvbnVCRm1TVjU2VnJZUXR0eWMx?=
 =?utf-8?B?REJNeWpYRmVMZHFUQzVnM2g0WG5hemw2RXZsTDRRekRaUGVxbzFab0RHZDNq?=
 =?utf-8?B?cHRlVFhwQnhjZjU5MVpUcEdZaW5vQ09wdjVEbEN0dzRDRG5GRVFjTzZzZzRU?=
 =?utf-8?B?cjY4T0xKdXNlc01BZGVpeHRJdlhqUW4zMUxERHIvR2owQ0ZSTkMvWmtHVkFH?=
 =?utf-8?B?N3RVdkQ5UTU0eU45UDFDWGwyWTZkQmllMnU4WnMvMWxCelBmZGU5UlNibW1J?=
 =?utf-8?B?M2dMdUN1RzVqbk56eUtZNjlGWWFRdVIzS1FHY1QwcERpOXRYNmIvL3ZZTktn?=
 =?utf-8?B?aXZSNnVDaXRKdGRmMGpjTXNJdUlYbkxKTHBBcTVJY29yNzdRb2V5U2VIaDkr?=
 =?utf-8?B?VFFyeEdHQWdZczFSR1FldXplYS9TczZtdDZaaFkzcU5MQU9UNHNhMnhDYkR6?=
 =?utf-8?B?V3I0UVFMdVpEWnlDd1hhSlBpRGhaL01iNUZTc0FIc3FSMHN6MUpaRm9hd3pS?=
 =?utf-8?B?VUhOemZlVm5DdmlIcGdINkpCK05hRENVbjM0dkN2WVVXaDZ3N002ZG1JVFBY?=
 =?utf-8?B?V0dHaFZDdnM0WXhqMmlCankybG5YT3MvK2twM0k2NkF4d0N3M1p1NHZFcnl3?=
 =?utf-8?B?ajY1NjdlWlppeDI0Y2JwWHMxU1hUaVJ5MjZuS013S09yYlBLOGd3L0ROMWdE?=
 =?utf-8?B?bFVwL0VJMWp6QkFVaWNJam9CRExwU1B4eEtxQ2t6cEF0NXY0ckdWUmYzWVJo?=
 =?utf-8?B?N3M2dkNQbE14dVY4RnQ0TWY4UFhKTkltOGZPd2dvU2hBZ0RDSm45Tmxoa3BE?=
 =?utf-8?B?eEdubExDcEFTcmdNaXdVRGtBclVFMTBEbi8xMG9CZEE5a2dCWEp1eVcwOW4z?=
 =?utf-8?B?R0pDczd0c29WcEJmRkNoYWttU0I4aytONEtFMk4xaDh5Y3lWSys4aUFGN2dY?=
 =?utf-8?B?RERCdDlxbmpKN21uYjZPTGlRWllnQ2FNVHFUTmlOMG53T2hweWJ5OG5jOGFJ?=
 =?utf-8?B?eFBOTDFsRzd1WVB5UnRCSGZLdlI3SHNGQmdhWG4vc3ppMVFCK2pvNVJUemhH?=
 =?utf-8?B?ZStmNnA3Vzc5bVhmcGZQbHBJRExUR001L0cxWlJZWW5tNmhPYmYyaWNEaUx0?=
 =?utf-8?B?WHYwUmx0amhIcVFjZFpjNDdxSDczQklHK3FQRjA2Y1QvNkVSRzJ4Z05ScnZC?=
 =?utf-8?B?dzI2VkxTdkhFUmJwRTdWNGVBWEk3MHdOWjZwdk9zdWRKek4yM2lISkhnV2hm?=
 =?utf-8?B?OGl1Yk0vQ1EybjZKZzRiTmY0anB6cys3dkx5TVdNZWJ0bFpxODZmRnF0Wmc1?=
 =?utf-8?B?dTQxT1JpZC93bnU5N002dXhaRE1kb1Bnam1uR2FYQmIvclhlWWtoemwyNjZU?=
 =?utf-8?B?SUtmcDZ5bnZQVzJJanFpNk00N1o1UzlHNTRIVXVOeCsweU5PU0tvanRCSmJW?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a3d793-2150-4d65-cf83-08da9be84bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 15:45:23.1826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQg+EHJtFUI0DqxvOaZYVW1ILGlWunrmOJEa+8RqPyZhEXEAqA6sKluYehvaEGUrtAFVUON2tm58E6HyIM6ERmhdzahnI26YcqyIwvRJGQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8671
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFByYWJoYWthciBNYWhh
ZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyXSBtbWM6IHJlbmVzYXNfc2RoaTogQWRkIGNsayBtYXJnaW4gZm9y
IHNkaGkgaHMNCj4gY2xvY2sNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIFNlcCAxOSwg
MjAyMiBhdCAxMDo0OCBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IHdyb3RlOg0KPiA+IFRoZSBTREhJIGhpZ2ggc3BlZWQgY2xvY2sgaXMgNCB0aW1lcyB0aGF0IG9m
IHRoZSBtYWluIGNsb2NrLg0KPiA+IEN1cnJlbnRseSwgdGhlcmUgaXMgbm8gbWFyZ2luIGFkZGVk
IGZvciBzZXR0aW5nIHRoZSByYXRlIGFzc29jaWF0ZWQNCj4gPiB3aXRoIHRoaXMgY2xvY2suIE9u
IFJaL0cyTCBwbGF0Zm9ybXMsIGR1ZSB0byBsYWNrIG9mIHRoaXMgbWFyZ2luDQo+IGxlYWRzDQo+
ID4gdG8gdGhlIHNlbGVjdGlvbiBvZiBhIGNsb2NrIHNvdXJjZSB3aXRoIGEgbG93ZXIgY2xvY2sg
cmF0ZSBjb21wYXJlZA0KPiB0bw0KPiA+IGEgaGlnaGVyIG9uZS4NCj4gPg0KPiA+IFRoaXMgcGF0
Y2ggYWRkcyBhIG1hcmdpbiBvZiAoMS8xMDI0KSBoaWdoZXIgdG8gaHMgY2xvY2sgcmF0ZSBhbmQN
Cj4gdGhlcmUNCj4gPiBieSBhdm9pZCBsb29raW5nIGZvciBhIHNtYWxsZXIgY2xvY2sgb3B0aW9u
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAgKiBBZGQgYSBjb21tZW50IGV4cGxh
aW5pbmcgd2h5IG1hcmdpbiBpcyBuZWVkZWQgYW5kIHNldCBpdCB0bw0KPiA+ICAgIHRoYXQgcGFy
dGljdWxhciB2YWx1ZS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0t
IGEvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jDQo+ID4gKysrIGIvZHJpdmVy
cy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jDQo+ID4gQEAgLTEyOCw2ICsxMjgsNyBAQCBz
dGF0aWMgdW5zaWduZWQgaW50DQo+IHJlbmVzYXNfc2RoaV9jbGtfdXBkYXRlKHN0cnVjdCB0bWlv
X21tY19ob3N0ICpob3N0LA0KPiA+ICAgICAgICAgc3RydWN0IGNsayAqcmVmX2NsayA9IHByaXYt
PmNsazsNCj4gPiAgICAgICAgIHVuc2lnbmVkIGludCBmcmVxLCBkaWZmLCBiZXN0X2ZyZXEgPSAw
LCBkaWZmX21pbiA9IH4wOw0KPiA+ICAgICAgICAgdW5zaWduZWQgaW50IG5ld19jbG9jaywgY2xr
aF9zaGlmdCA9IDA7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgbmV3X2Nsb2NrX21hcmdpbjsN
Cj4gPiAgICAgICAgIGludCBpOw0KPiA+DQo+ID4gICAgICAgICAvKg0KPiA+IEBAIC0xNTYsNyAr
MTU3LDE2IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQNCj4gcmVuZXNhc19zZGhpX2Nsa191cGRhdGUo
c3RydWN0IHRtaW9fbW1jX2hvc3QgKmhvc3QsDQo+ID4gICAgICAgICAgKi8NCj4gPiAgICAgICAg
IGZvciAoaSA9IG1pbig5LCBpbG9nMihVSU5UX01BWCAvIG5ld19jbG9jaykpOyBpID49IDA7IGkt
LSkgew0KPiA+ICAgICAgICAgICAgICAgICBmcmVxID0gY2xrX3JvdW5kX3JhdGUocmVmX2Nsaywg
bmV3X2Nsb2NrIDw8IGkpOw0KPiA+IC0gICAgICAgICAgICAgICBpZiAoZnJlcSA+IChuZXdfY2xv
Y2sgPDwgaSkpIHsNCj4gPiArICAgICAgICAgICAgICAgLyoNCj4gPiArICAgICAgICAgICAgICAg
ICogQWRkIGEgbWFyZ2luIG9mIDEvMTAyNCByYXRlIGhpZ2hlciB0byB0aGUgY2xvY2sNCj4gcmF0
ZSBpbiBvcmRlcg0KPiA+ICsgICAgICAgICAgICAgICAgKiB0byBhdm9pZCBsb29raW5nIGZvciBh
IHNsb3dlciBjbG9jayBvbiBib3VuZGFyeQ0KPiBjYXNlcyAoZWc6DQo+ID4gKyAgICAgICAgICAg
ICAgICAqIFJaL0cyTCBoYXMgMyBjbGsgc291cmNlcyA1MzMuMzMzMzMzIE1IeiwgNDAwIE1Ieg0K
PiBhbmQNCj4gPiArICAgICAgICAgICAgICAgICogMjY2LjY2NjY2NiBNSHouIFRoZSByZXF1ZXN0
IGZvciA1MzMuMzMzMzMyIE1Ieg0KPiB3aWxsIGxvb2sgZm9yDQo+ID4gKyAgICAgICAgICAgICAg
ICAqIHNsb3dlciBvcHRpb24gYW5kIGl0IHNlbGVjdHMgYSBzbG93ZXIgNDAwIE1Ieg0KPiBzb3Vy
Y2UgY2xvY2sNCj4gPiArICAgICAgICAgICAgICAgICogaW5zdGVhZCBvZiA1MzMuMzMzMzMzIE1I
eikuDQo+ID4gKyAgICAgICAgICAgICAgICAqLw0KPiA+ICsgICAgICAgICAgICAgICBuZXdfY2xv
Y2tfbWFyZ2luID0gKG5ld19jbG9jayA8PCBpKSArICgobmV3X2Nsb2NrIDw8DQo+ID4gKyBpKSA+
PiAxMCk7DQo+IA0KPiBVbmxpa2UgaW4gdGhlIGNhc2UgYmVsb3csICJuZXdfY2xvY2tfbWFyZ2lu
IiBpcyBub3QgdGhlIG1hcmdpbiwgYnV0DQo+IHRoZSBhY3R1YWwgdmFsdWUgcGx1cyB0aGUgbWFy
Z2luLiAgU28gcGVyaGFwcyAibmV3X3VwcGVyX2xpbWl0Ij8NCg0KT0suIA0KDQo+IA0KPiBBbHNv
LCB0aGlzIHZhbHVlIGlzIGNvbnN0YW50IGluc2lkZSB0aGUgbG9vcCwgc28gaXRzIGNhbGN1bGF0
aW9uIGNhbg0KPiBiZSBtb3ZlZCBvdXRzaWRlLCBhbmQgaXRzIGNvbW1lbnQgY2FuIGJlIGNvbWJp
bmVkIHdpdGggdGhlIGV4aXN0aW5nDQo+IGNvbW1lbnQganVzdCBiZWZvcmUgdGhlIGxvb3AuDQoN
Ck9LLg0KDQo+IA0KPiBJIHdvdWxkIGFsc28gc2F5IHNvbWV0aGluZyBhYm91dCByb3VuZGluZyBl
cnJvcnMsIGFzIHRoYXQgaXMgd2hhdCBpcw0KPiByZWFsbHkgdGhlIHByb2JsZW0gKDUzMzMzMzMz
MyBIeiAvIDQgKiA0ID0gNTMzMzMzMzMyIEh6IDwgNTMzMzMzMzMzDQo+IEh6KS4NCg0KT0sgQWdy
ZWVkLg0KDQpXaWxsIHNlbmQgdjMgd2l0aCB0aGVzZSBjaGFuZ2VzLg0KDQpDaGVlcnMsDQpCaWp1
DQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIGlmIChmcmVxID4gbmV3X2Nsb2NrX21hcmdpbikg
ew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFRvbyBmYXN0OyBsb29rIGZvciBhIHNs
aWdodGx5IHNsb3dlcg0KPiBvcHRpb24gKi8NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBm
cmVxID0gY2xrX3JvdW5kX3JhdGUocmVmX2NsaywgKG5ld19jbG9jayA8PA0KPiBpKSAvIDQgKiAz
KTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoZnJlcSA+IChuZXdfY2xvY2sgPDwg
aSkpIEBAIC0xODEsNg0KPiArMTkxLDcNCj4gPiBAQCBzdGF0aWMgdW5zaWduZWQgaW50IHJlbmVz
YXNfc2RoaV9jbGtfdXBkYXRlKHN0cnVjdCB0bWlvX21tY19ob3N0DQo+ID4gKmhvc3QsICBzdGF0
aWMgdm9pZCByZW5lc2FzX3NkaGlfc2V0X2Nsb2NrKHN0cnVjdCB0bWlvX21tY19ob3N0DQo+ICpo
b3N0LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IG5ld19jbG9jaykgIHsNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCBjbGtfbWFyZ2luOw0KPiA+
ICAgICAgICAgdTMyIGNsayA9IDAsIGNsb2NrOw0KPiA+DQo+ID4gICAgICAgICBzZF9jdHJsX3dy
aXRlMTYoaG9zdCwgQ1RMX1NEX0NBUkRfQ0xLX0NUTCwgfkNMS19DVExfU0NMS0VOICYNCj4gPiBA
QCAtMTk0LDcgKzIwNSwxMyBAQCBzdGF0aWMgdm9pZCByZW5lc2FzX3NkaGlfc2V0X2Nsb2NrKHN0
cnVjdA0KPiB0bWlvX21tY19ob3N0ICpob3N0LA0KPiA+ICAgICAgICAgaG9zdC0+bW1jLT5hY3R1
YWxfY2xvY2sgPSByZW5lc2FzX3NkaGlfY2xrX3VwZGF0ZShob3N0LA0KPiBuZXdfY2xvY2spOw0K
PiA+ICAgICAgICAgY2xvY2sgPSBob3N0LT5tbWMtPmFjdHVhbF9jbG9jayAvIDUxMjsNCj4gPg0K
PiA+IC0gICAgICAgZm9yIChjbGsgPSAweDgwMDAwMDgwOyBuZXdfY2xvY2sgPj0gKGNsb2NrIDw8
IDEpOyBjbGsgPj49IDEpDQo+ID4gKyAgICAgICAvKg0KPiA+ICsgICAgICAgICogQWRkIGEgbWFy
Z2luIG9mIDEvMTAyNCByYXRlIGhpZ2hlciB0byB0aGUgY2xvY2sgcmF0ZSBpbg0KPiBvcmRlcg0K
PiA+ICsgICAgICAgICogdG8gYXZvaWQgY2xrIHZhcmlhYmxlIHNldHRpbmcgYSB2YWx1ZSBvZiAw
IGR1ZSB0byB0aGUNCj4gbWFyZ2luDQo+ID4gKyAgICAgICAgKiBwcm92aWRlZCBmb3IgYWN0dWFs
X2Nsb2NrIGluIHJlbmVzYXNfc2RoaV9jbGtfdXBkYXRlKCkuDQo+ID4gKyAgICAgICAgKi8NCj4g
PiArICAgICAgIGNsa19tYXJnaW4gPSBuZXdfY2xvY2sgPj4gMTA7DQo+ID4gKyAgICAgICBmb3Ig
KGNsayA9IDB4ODAwMDAwODA7IG5ld19jbG9jayArIGNsa19tYXJnaW4gPj0gKGNsb2NrIDw8DQo+
IDEpOw0KPiA+ICsgY2xrID4+PSAxKQ0KPiA+ICAgICAgICAgICAgICAgICBjbG9jayA8PD0gMTsN
Cj4gPg0KPiA+ICAgICAgICAgLyogMS8xIGNsb2NrIGlzIG9wdGlvbiAqLw0KPiANCj4gVGhlIHJl
c3QgTEdUTS4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0NCj4gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4g
DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGENCj4gaGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvcg0KPiBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
