Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD74C755D62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 09:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbjGQHsQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 03:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbjGQHsP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 03:48:15 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181C6E56;
        Mon, 17 Jul 2023 00:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwxvO7M4DeNe46fmzYNERgm86VqDW8BDoFbQ8EQLtk1i8v0dKZPsJAUQdBcU0bS/m/IqXbdMwlP2FAiNjcwOUkcwbvtOby1X7zUKOn/zj35+B6yMpe/zP6gOqa9OOjcjXDY/ruxNZM8mOdLsQFEjBijkF/T1x93Jbx6oSWPrww3EIBvVSvZhAryksLNB2hcMTYKhNmJitqGP0DigYaOqvkdpTwqTZdHBgZx9/pdLCDU4K/jWLrkjmjq3uDRnkculyCbbFeEnU6zfqdb+jS9+flgqaVCrbxtQmQL+fMOeuK587dleCKZZQocSeNzlJkDsuqdZfq4uX4qTLUAw46td9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+CCO/Bk+LC9l/yVjmL/uTgj3JGeASpVvPTHmykmiic=;
 b=CC5VVzg0LU4wUTybKwf6FW4N9hrSItFvFAspS8tnQ3MmXQxUbSuMLtWZ7595mhYo4BNCG+0JUmvyqGtAltDas0GqinHDORtqJRqRTKj60Et/CWM3Wi28iWPAgaMhftngRAJ/a44R544e7gi0Cp3G2sJXNVl3tOYlqH1r3bfTAO8bTNHyHz2Slc114V0JNr0J86uDIukVHCI2d1usEXVTrdIF2zqbpiwOP1C0mwQ1C7HAJqzlNN+HOx1m1GsagUz1Xzj7hPsJJKS+gp5hH6CgVuU/WrxDrx4w25fPTpoQqBUNbaH0mkPQYZ/yaDhTvAwHlgxyeSwKVD/CC+Jfgiil7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+CCO/Bk+LC9l/yVjmL/uTgj3JGeASpVvPTHmykmiic=;
 b=c2d/LtTdzO4P2hd/VAHOyrnOS805rYbJGbv18c/o1Ytq/auexjkkHisBo9XdxwQly/y0d3m/BLY1yYZc/g3rY0S/yGhLMld/VQ1JuVx6Na/I0z7x1SQ6nIeD8SNtz1wCD9NoEELCcAHC8IJHH38ux5tTaIWGPbP0DRuUkMzSgu0=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB10681.jpnprd01.prod.outlook.com (2603:1096:400:295::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Mon, 17 Jul
 2023 07:48:01 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::ef83:ef86:806d:6558]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::ef83:ef86:806d:6558%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:48:01 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alexander Helms <alexander.helms.jy@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marex@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] clk: vc7: Use i2c_get_match_data() instead of
 device_get_match_data()
Thread-Topic: [PATCH 2/2] clk: vc7: Use i2c_get_match_data() instead of
 device_get_match_data()
Thread-Index: AQHZt/x4GT9hpjloC0yc0NFWQQrF16+9ku2AgAAC6CA=
Date:   Mon, 17 Jul 2023 07:48:01 +0000
Message-ID: <TYCPR01MB593361921D7E76E3F48B4B48863BA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230716154442.93908-1-biju.das.jz@bp.renesas.com>
 <20230716154442.93908-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdW7ss_rDdf+ZGUHCzDW0Ur4qesX11sMoRiJf7dieaw9Pw@mail.gmail.com>
In-Reply-To: <CAMuHMdW7ss_rDdf+ZGUHCzDW0Ur4qesX11sMoRiJf7dieaw9Pw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYCPR01MB10681:EE_
x-ms-office365-filtering-correlation-id: a765b462-f099-4eae-21fc-08db869a257a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4bsPky6hQpJM4+VpjbFCkwX80gwF3W1o96okdivOaJufjdCteiGWE0NCWcRScBMjcZnbYwZm8dEHymphcchz2Gh592PTh1i5kGvE9R/DwvsBe6oaOdIKvjww7cIJK0q9KRQovkHwtIQwTVHf7/8ydbx1955Sg7ClBqFJcmKRovvyG0YIaihnLH4FqHNvnFLrj62cBwY7rgt/HqbBzAqvYvWHT04dDK4q5Gp18gXRhGwGokrbhXOLQMCODi61mGVxG6WsjRuxSF/Jzs0zXHQIN5dXaS5ciTj2eg4j0ENBqlgGIxqTZR6NY4ZQ0wwZ7L5ZapgrypuhQuJBXyp+QsueJdOlDqtnLHx2K9x5F1Atfk2/U+qcjLGQzKGNxoi7SvFmHonfSyCa9VdI+R4pk5JECURwtqHW8SO0GaewbI4PRk/1nweae4GegLst6lAyYbun/1EGGpHShjsL7Gq6tm5Xfy0h5IDaWUkWmg+5D7Zg8NZO74rpT+T1FiVpFBLjDGoAD3GaPfLoqjI3hiTIjJgwgr0Wy3IeGpR1oaBenyfHUUpk8/Q54CTmxIiNREYsNJCtW2UEFbazG7rftes+1AAs5rzXliZfSxbaqgfUaBbiQ9QRfT3+yhcaWYU2ELdeJtxQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(55016003)(41300700001)(52536014)(2906002)(8936002)(8676002)(316002)(5660300002)(6916009)(66476007)(66946007)(66446008)(64756008)(4326008)(76116006)(66556008)(26005)(6506007)(53546011)(86362001)(83380400001)(71200400001)(38070700005)(33656002)(7696005)(38100700002)(54906003)(9686003)(186003)(478600001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlJMc2hIdWRPWFRkc3lVK0kvSkxvTlAxZzVlakNTVVVWM0pTWVJyUzNZaWxn?=
 =?utf-8?B?R3dwVzFpRFBWZXV5WWloT0xORDJWc2laZGlleTdkNWxFaVYvYmZGc0lETXpB?=
 =?utf-8?B?bFZ4dUttaWdod0o1TTcrbzNIbXdMOWlLa3IrWW5QZFFPNGpwSy9hNWJTcnlr?=
 =?utf-8?B?UXBrOERaV0pPckR2eXA5ZDFzQWV6eGFlWFJwYy85UzdkRGp6YkVDMTdJNCtE?=
 =?utf-8?B?clJhUUw1UnJqYVI3UW5HTWwzTnlhc24yV3JWRU1meDVFRlZYU1R1UDQ2WDJP?=
 =?utf-8?B?VlE3M3VseEh5TVJqdHZlc0pWdXZ2MElleC9MbUtoK3NNYWdUZzBzcU1CdVBR?=
 =?utf-8?B?cUNyOUVyRkwrSm91OG4rS01DUVNIckdhcU5sV1BoK2k1ZDZoeDRYVWtZRmE5?=
 =?utf-8?B?N0F0Ni9CUUFGWHpJR21LNkYzZWQ5WFdFSEhzVTRpYWoyMHl3YTF4VDNLdVlN?=
 =?utf-8?B?Q0hpekI1a01OOWdOaG0yQ3pINkdZVW4wWmdqTVV4dWp2RytTa1J6MlhJZDlM?=
 =?utf-8?B?M3RFV2tTV05GWUZwSlJoeEo1QjNGcDExMGE2alh1NlJWWWpoOWYrYlR2OGFv?=
 =?utf-8?B?OXNQZmplb2h4Z0dwckVROUJyRExRUmVSSXVxWHRTSTlSaVE1UTRQd2VrZmRS?=
 =?utf-8?B?OWNadVArUlBQeG9GNTZxL2xSejRTZGxNS3JQODBzVDBsVlZ3VmdyMnovUmNE?=
 =?utf-8?B?aWV4VDVBNElUbEFtVU4rY3pTQUFURzBvRDNhMzBKV2YvajVtbXRXMUVjTFB1?=
 =?utf-8?B?NmRxenBVOVVJWnVvYVplUmNLNVVkRGtnNEx0Zm02cFJjZnltV2xiQUxKd2My?=
 =?utf-8?B?RTBnUm02ZzZpUEtkVWdoakkxZlR1OTZOZmtRWXQzMXhwaUh4K2tEdDhTMEM1?=
 =?utf-8?B?NUpWZnREaFBYZ1dtelF3aFUzczFoRzA2NFMzbVVac1FGem45S1I1V21ycXFV?=
 =?utf-8?B?S0FJUEdVNk5vS0JXdHFLMDNiYjJJSys5Vk9kbGVrL0ZoZUlDTmF3a1Q1SU9Z?=
 =?utf-8?B?REpOY1pac2dzVGxnT3JsVUxMdVlPYktpOTQrQUtMZk9lTU5NcEFBYnRBSU9p?=
 =?utf-8?B?TWg1UFVxWTNVeEpDeTZMTnZwMXZleG8zUW5YRjlGZS9Gc2NTaHVYRm1PeFU1?=
 =?utf-8?B?RTRKWVNpQkFQU3ZXYmRINDc4eFlJU0llalFDdWtRU3JJVGNwMytvSFA2MXFh?=
 =?utf-8?B?WVUvckVGRGRsdW5yZG1jL0R3aHJNVWsyMCs0d3J2a3lkUjBYYW9Bbk1oNHdo?=
 =?utf-8?B?Y1pRSjM1bVFITWhKeTRGK3F0dUxKMWlNVGlGa3cvVE42ZTRYQUo4UVJNWE8w?=
 =?utf-8?B?aEh1NDk4S0xpZmhyQXNvSXpqUnA2S0c0dEdIZ3lqM0MyM0tQUzd3dm5ydWxG?=
 =?utf-8?B?a0tBVms1bnl6MGxJbWVLV0NDcFdJbGk2aS9WdlJTcGsxYXRGc0tucnVuS0VY?=
 =?utf-8?B?Q01pQmp4NGVhbDltZVQyK3NGS0k5SGpPQnJNYi9LODhEcnJhQk0zOHA2WUti?=
 =?utf-8?B?SkVrTDRzNHV2UE5vV2R2aFQ1Y290VUo5aUZaY2hqaXNqOFVaclMwN0JGVXFp?=
 =?utf-8?B?ckMyaEpFSmU2djh4MTRNWWUybmFveXpKQzJyTzdBVVdXQ1NVRTIzbzdHL1dD?=
 =?utf-8?B?eUFRUUdiSElWUXBJaUl5N2hUeVl1Ty8xL2I5NEJtdXJOUEFINk5GUmpPVHRv?=
 =?utf-8?B?a3FkUlZTY0Izd2RtbFVjTDJQSThLYmdOUlN0d2FwRUlGUDFKTmQ1NExXVDUw?=
 =?utf-8?B?bEtkcHN2bGRCdUhtakVWL2UrYy9kQm1YZGNvSW9MMFRUdmR6Zk9yY1Nxakx4?=
 =?utf-8?B?eWs3QWFTUDhGMElPbGhXaDN3d2I0MTFzVHVOUEVFdHVRUysvM1hBQkJ0bXpr?=
 =?utf-8?B?bW5hdVBMVnZYUytIYnhCVTg5ZzVxaFdOZFBMcE1NbmpHb2ZOUmtmRU1Bc3ZU?=
 =?utf-8?B?L0FabWpLTmZHWDNuNUxZWHVpNlNVT2E0YjRRWDRiQTVOMWhsMzFoRDRKVGZq?=
 =?utf-8?B?K1hFUHFtaGlhTnZ2MTdQK1ZxVUdkZW9NTFRlSXh2djQ4cytNQVYrRVdQZ0JM?=
 =?utf-8?B?YmR5L0thUWJTZE5pMjRyVEEvaTRpeTE2dWFid3BEWEx4YVh2V2V3RlN4TXZl?=
 =?utf-8?Q?NbWaB+3w1DlrVOqEEsDNus+eO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a765b462-f099-4eae-21fc-08db869a257a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 07:48:01.4663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 197DFNNWxg1MFdlucdu+McESJNR9/y3iRn/690ZhLBiwXB1K0M8oXzG4rVVMyqI2LvOgf6iEkNvdvjFjWVAboxMhkUv3vkXS0YMwgsbM1f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10681
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi8yXSBjbGs6IHZjNzogVXNlIGkyY19nZXRfbWF0Y2hfZGF0YSgpIGluc3RlYWQgb2YN
Cj4gZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTdW4s
IEp1bCAxNiwgMjAyMyBhdCA1OjQ04oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiB3cm90ZToNCj4gPiBUaGUgZGV2aWNlX2dldF9tYXRjaF9kYXRhKCksIGlzIHRv
IGdldCBtYXRjaCBkYXRhIGZvciBmaXJtd2FyZQ0KPiA+IGludGVyZmFjZXMgc3VjaCBhcyBqdXN0
IE9GL0FDUEkuIFRoaXMgZHJpdmVyIGhhcyBJMkMgbWF0Y2hpbmcgdGFibGUgYXMNCj4gPiB3ZWxs
LiBVc2UNCj4gPiBpMmNfZ2V0X21hdGNoX2RhdGEoKSB0byBnZXQgbWF0Y2ggZGF0YSBmb3IgSTJD
LCBBQ1BJIGFuZCBEVC1iYXNlZA0KPiA+IG1hdGNoaW5nLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL2Nsay12ZXJz
YWNsb2NrNy5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvY2xrLXZlcnNhY2xvY2s3LmMNCj4gPiBA
QCAtMTEwOSw3ICsxMTA5LDkgQEAgc3RhdGljIGludCB2YzdfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCkNCj4gPg0KPiA+ICAgICAgICAgaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwg
dmM3KTsNCj4gPiAgICAgICAgIHZjNy0+Y2xpZW50ID0gY2xpZW50Ow0KPiA+IC0gICAgICAgdmM3
LT5jaGlwX2luZm8gPSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoJmNsaWVudC0+ZGV2KTsNCj4gPiAr
ICAgICAgIHZjNy0+Y2hpcF9pbmZvID0gaTJjX2dldF9tYXRjaF9kYXRhKGNsaWVudCk7DQo+ID4g
KyAgICAgICBpZiAoIXZjNy0+Y2hpcF9pbmZvKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
LUVOT0RFVjsNCj4gDQo+IENhbiB0aGlzIGFjdHVhbGx5IGZhaWw/IEFsbCB0YWJsZXMgaGF2ZSBk
YXRhIHBvaW50ZXJzLg0KDQpJdCBpcyBub3QgbmVlZGVkLiBJIGp1c3Qgd2FudCB0byBhdm9pZCBw
ZW9wbGUgc2VuZGluZw0KcGF0Y2hlcyBhcyB0aGlzIGZ1bmN0aW9uIGNhbiByZXR1cm4gTlVMTCwg
c28gYWRkIGEgY2hlY2suDQoNClBsZWFzZSBsZXQgbWUga25vdywgd2hldGhlciBJIHNob3VsZCBy
ZW1vdmUgdGhpcz8NCkkgYW0gaGFwcHkgdG8gc2VuZCBWMiB0YWtpbmcgb3V0IHRoaXMgY2hlY2su
DQoNCkNoZWVycywNCkJpanUNCg==
