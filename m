Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1A0A4DD7EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 11:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbiCRK30 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 06:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234983AbiCRK3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 06:29:25 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397A7FD08;
        Fri, 18 Mar 2022 03:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTtPeZmI83noX08SB634z9lrMkuNrxKVa7EarIydW0n+bHklBTTYP//EVmtNG+OIB7wwjniEwLU5T8ZSHXTzZ4k1JmSloo3Hx68wt7LO2N7YmUVjcKJz9U5HOY2nCsQORJ4mpEWtPaD1nlotQEErxK2VYn/Rikm2wMfWzllzHQoKxe7tuqeC041K+shvqbFAn5w14blYyFX6IONDon947cWQhR7Kk/YDt6BDgR1Za2e/vi0PTGpvw/fOoDgdccoDHFX1MY9pVzGn9hDZWBMIO2D5rVMEUp35jh8P5/HfFaJwZ1wuQgeGa8a3JwJhLRTJ5KBgLFUiUxFRHKL0E1B+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHtKSW2SrEjgVOWDElVu23qsCgvxYfAUnplkVmwSJAA=;
 b=kPkyM0+yxn1N/QwFmJZxd2XlY60ewMZwUcCBdOUZbNmHSMO0+Fu73HQxwrlld26wCQt4LTOSS0O4ltoMTyEC+cujWtJ99Z21qCXzWkRZXeOkQE2UJqi7qTERbHX4/ehdH/L2z3U0mK22V04gh34oYTind14n089+kOcfbnlASGHdEzyi2Vma028/pnfsmhakrTxog1ItF2ftOd8ecILgU590UqB7RnbKLGC1/5cfU4H/XFwmkO+fMgfUWNEgq9BxZAi1iVfIoW/5oQT0Tyr6ekpGLZ2bAaXiam2zvJ99uf+IHtkkMOwgxa52Rf+9nS5VZ3RbjeaNnA6d8oKV3AfLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHtKSW2SrEjgVOWDElVu23qsCgvxYfAUnplkVmwSJAA=;
 b=aPQgK7AU9hsQtZ3+9axDdV4PN35p7S6mfxW1Jsd8qqsSCYdpkKCbZpVrtRBhVPJMH3nuBUetew4+X2og/0AwnsX0+A0FAMHcv3eUqQmHVRR9ViCbDA0LN72KsWN4h2MUyfwNYnAIGauAGv8MXjjzXMbBmGyLkzTMP/nj1txmF6g=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8424.jpnprd01.prod.outlook.com (2603:1096:400:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 10:28:01 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b%5]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 10:28:01 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC 02/28] clk: renesas: rzg2l: Add PLL5_4 clk mux support
Thread-Topic: [RFC 02/28] clk: renesas: rzg2l: Add PLL5_4 clk mux support
Thread-Index: AQHYB9xRs5oNvMi7m0eWlBBkvFdAXax+4ZgAgEZ0GrA=
Date:   Fri, 18 Mar 2022 10:28:01 +0000
Message-ID: <OS0PR01MB59224DA9C890DCDF7F5203F586139@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXJ_BtGHeFBMaqZe7pAHrVHK=rvKiRKn7UZa1PVGrMS8w@mail.gmail.com>
In-Reply-To: <CAMuHMdXJ_BtGHeFBMaqZe7pAHrVHK=rvKiRKn7UZa1PVGrMS8w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fb4fe18-167b-4a50-4bf5-08da08c9faa3
x-ms-traffictypediagnostic: TYCPR01MB8424:EE_
x-microsoft-antispam-prvs: <TYCPR01MB8424B38EFE6967F96519FFF786139@TYCPR01MB8424.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z981wcHfZ1K1eC/0FrbJ1LUGLnEEtB8q+imKCgud5mne4W87//1SFv7WE2BGZJ0MajKgRe71UsswxS+uuW7g523O8QgPcjRsgK/rTL69hqL649cyxewAjIdXniW23kVFeYmp5FnAM6XQpCHTB7Xs2qncN9t3djqv5rL5IDW91ILitcbKRE7fQSaPk2tSRhAafuIIFcfkCLM/PdQoDA98yrvqz+obYDt5/Bcsi6yZcHbdGBfRpgihSTcU1gnIm7znT0DfcNJxXnBhsgfZiGXNeZjNu4fO3v6Tvv/hxogk4iL/UST0zH5A1ufB6v4mxautWNQi4CJl9LiFtUujLOhWE/dISoUDj3gzEp4/vprjPtB5GjmG7NHf/oZG7Mij2cSlO3xfljT7E4vrr+XHKHsdGh2nQ/POd/dD5BOcfME5Rozlt73+bXY7tOiShqZdsznXQYyyj4vArK7GRxkag8FuwJ+kvOjRrR/MEHAXzxqzXV1yfX+Yv68IT3rOx9iRjdIdKkQzll8i+zZgVL+dAGJK0thbNeS8qMYXRhMIY9IbNwkSDhxJzQDKrsMR82eJsL1cOYCe8nfGKP9WjMMI21PqCsJtAsXb1ekT77mZUaJvhiwrEp4AU4WSslDz6+8gho8J4nPRAzZ+2wJfkKUSAnHcfftPfFgZnCexoGdmOu1o8R7t+Y9PX9L1YTD7Us5/xKkTgzXFcBdO+80b1tYYoPbsIA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(64756008)(66946007)(66556008)(66476007)(66446008)(76116006)(4326008)(9686003)(122000001)(316002)(86362001)(6916009)(53546011)(54906003)(83380400001)(4744005)(2906002)(33656002)(38100700002)(5660300002)(7696005)(6506007)(71200400001)(55016003)(8936002)(26005)(52536014)(186003)(38070700005)(508600001)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGJCRzVPd29MSUpHSFVXNy91OGlJM0hGWUlrMVB3TUxOVDQ4THZEWVNzSFFj?=
 =?utf-8?B?YUsxTDYrQUJrMk05MzRaRzhlZnJ6aGszbG1Hd3pRTXZROUM0ZlhPdVp5YmtN?=
 =?utf-8?B?bHRsTGxIRXM1V1ZkaDl4clhuZVdzZktTMlc3SGtMWjZ5WkJvRmxHVWJIVFc3?=
 =?utf-8?B?a0tJK1o5bDFyUnM4SHpMeFR3YkdTazVLb0Yvc1o2SUhtbml2QmtySk1xbGRL?=
 =?utf-8?B?aGJLVEtOTkpZdmlRbTlnNzZBT2lEL3FjVWJIR0Uxc3ZXSE4zTktrb3NaNmNC?=
 =?utf-8?B?WTdYUHMrZnlaTXFWSDRqQXhvbGRVUHV1TzR6S1gyVjdVc2ZKR1ZoeFF1UW5I?=
 =?utf-8?B?WnUvVnZWV1BBVWpnWkZLMXVmbGFSYTN4MGFPVDh5Yyt6SWJzN25SSmxYKy8v?=
 =?utf-8?B?QTVKeE01cDkvVWRmZHZyMlNWL0JNWko2cWxkbEtObDZleXlwWFQ1WnVHbUI1?=
 =?utf-8?B?ditpVmFod3kva1NNSWpXWjJmZE0zaDA2UVc2Q2tzRnh6YnJUenBjcnhkcGVi?=
 =?utf-8?B?UGRBNzhGMi95VERuOUJ0a1RBa3hZbFVrQkVqc2dOOG5sVFR1TUs3RFUwYTl5?=
 =?utf-8?B?ZEZwdnlJRHI4aXQyQ0hVYzNadlVzM1JVZTN3OU9UcXArRVZYUDd4UGRkUlg3?=
 =?utf-8?B?dUNldVlUcGFsTmdvRmZZcEVTZlRpUmllbExJYkxYclpaYXM3TjlwRzNsWjVs?=
 =?utf-8?B?c3NPNHZNM2JXWmt6NFFJS0p4OUZka0tVSjNkQStyM1Eyc1V1ZXpZSCtlSnJG?=
 =?utf-8?B?NnN2V3F4ZEloOVBGN2x2VXF6MDdDemlXNzZ3TmNEYjhBWWkyRERNcURaNU5p?=
 =?utf-8?B?a0NlVWlvUGtGWjkwbFBiWldQd00yWE4xUFJTVUx4ZGVWbmdDN0RwOXZXbU1n?=
 =?utf-8?B?YytRZ1ZPcGxCNEsvT212cEgxL0VtSXhJTzdzUjV2Zmx2Um1HOHJ5VHhhK0VL?=
 =?utf-8?B?TjRpVEIvRDFjRDRxbENCQkxRS1lGb25oTUI3UGZGTnczeVZFSlgzeUZuK0d0?=
 =?utf-8?B?SVlaZnRGRkxLU1RMbGhwdXIyMTVzZDBPZFB0U09kdnJlSitTZ2RIeWVrb2dE?=
 =?utf-8?B?VlIwQ2xLbllja09RVWl1TS90WnNwRVFadTcxelJXT2V1bms5SURzcGZNMmN2?=
 =?utf-8?B?MmlKZ3JPR1M5L3BYTnZDZVlIMEZnSHZZMHpwRWVNUnplbXFPU1RHcXJYdjFs?=
 =?utf-8?B?NWVER1duOFdzUUJnMWNVL2FuaUhNWnVGT24xUzFjb1oydnFVeVpyRUJVM1g2?=
 =?utf-8?B?THR0OGxuSHI3TzhIOGh5aWhtdU81cGh1WTNBeHFHb0VyekdMM21BblVoNHVr?=
 =?utf-8?B?aWZUM3R5L2lGcU1jelZZM3lDUHBrUldJTEx3S2RXcU5YZkhiTDNmTkVUZXpQ?=
 =?utf-8?B?MjRyZ3dHLzJwWDhKTURPbllEeU1XaC9uRnlKTWNTbWFoRHB1S2ZYVXdDcU50?=
 =?utf-8?B?elBqQlh1alBMREE4LzJzdTZKRVZpamRwUmFpSExMYkQ2WVl5SG9Gb0k3Y3Vn?=
 =?utf-8?B?a0ppMDd4RWhpbHkrOFVLSll0aUl5VEYvMkF1cUxwU0lQK1JCeWxOTGJpaThl?=
 =?utf-8?B?TWRqakZsT3k1amhXZXJ1L0k3eWI3cXFFT2hSQkxtSnBNbFBjQXRwbm5MSCt0?=
 =?utf-8?B?TGpGRnJYYUZXd0dmMjdOdUFwQVRaZ1ZEemtxcVBrR0xqMGg3ejRnWDNjWVBC?=
 =?utf-8?B?NEVHMk5CRGJjVVhlYTBDUUZPeEc4bDBtR28vZzRUcFRkZTBRN2xzb1Z2Sm5M?=
 =?utf-8?B?emdDR0JWNGs1alFBOEd1OFI5YWphMGFxcS9VWDl1S2J2ZEVVcHlBVS9iYXdw?=
 =?utf-8?B?M2VrelppWmtNNHh3Mzh6TzVhTks4cmw2d01OY0kwc2hJK3hkRFRlZDRFUlEv?=
 =?utf-8?B?dHZoWld2NEdHcnRtdkRhQXJtai9kUDVVSWljYzlaaEo2T2FUeWIrZGEzemIx?=
 =?utf-8?B?ZWZKS0ttaFQxKzBFZnVlcysxa3hSMUN0UzFCM0hDTlE5SWNOTzFaaVNvek5P?=
 =?utf-8?B?dWpFME1zRDJBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb4fe18-167b-4a50-4bf5-08da08c9faa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 10:28:01.1863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PTzTtWFxNinSxkLoxpQAutbs2cfQQOfFLj0uN7mqvD0GN8WILTKM7rVgjiSEDuFOOdGUxDCPTmfXTGO8bcyeDr4MfqOrqPwMUV5pZ21LIIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8424
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
UkZDIDAyLzI4XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgUExMNV80IGNsayBtdXggc3VwcG9y
dA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IE9u
IFdlZCwgSmFuIDEyLCAyMDIyIGF0IDY6NDYgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBBZGQgUExMNV80IGNsayBtdXggc3VwcG9ydCB0byBz
ZWxlY3QgY2xvY2sgZnJvbSBkaWZmZXJlbnQgY2xvY2sNCj4gPiBzb3VyY2VzIEZPVVRQT1NURElW
IGFuZCBGT1VUMVBIMC4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggdXNlcyB0aGUgTFVUIHRvIHNlbGVj
dCB0aGUgc291cmNlIGJhc2VkIG9uIERTSS9EUEkgbW9kZSBhbmQNCj4gPiBmcmVxdWVuY2llcy4N
Cj4gDQo+IEFuZCB0aGF0J3Mgd2h5IHlvdSBjYW4ndCB1c2UgREVGX01VWCgpLCBidXQgbmVlZCBh
IG5ldyBjbG9jayB0eXBlLi4uDQo+IERvIHlvdSBuZWVkIHRvIHVzZSB0aGUgTFVUPyA7LSkNCg0K
V2lsbCByZW1vdmUgdGhlIExVVCBpbiBuZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkJpanUNCg==
