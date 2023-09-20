Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A7D7A6FBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Sep 2023 02:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjITACq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 20:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjITACp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 20:02:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B39995;
        Tue, 19 Sep 2023 17:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ggl1T9FSriCVnwngYoNFh4aCocgJ5G6+1kgZWbTYoRJcPn/otpTIrcLc57kVjZPOPWl76LN1W3NkeMYuF37gZMtQfd5+iz8AmCxmockG5GdnMEE5TSPPzV5fDMnpOrZTnuSV1TSVKG4W1iedsUDg4FQHmbwWYa1qW1EHP3ibbhqJdt505JqPxxbBGfyuukvNhklO2i6hOA3R2P2N+6DR4DDc9m0miD8cH+Lhe8CcN4zF0IfqA611+wKbNmVM5eW5rl3Zy+0XINC3N/q87pNaOECMizltOAVGJnTrD+6wpg9TLHput+8WSc/hzbI8KQy/4dBTE6msFW0zp6jh3IgidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjGIV6CdM+/8ATQElWP48QCpun2mJIOR4gCpFBCnCqM=;
 b=m3+4Vna/571WaCQ49kI3hn0lod18tJ3Y1v6t68dRBVq8pMsXYRvPmc3Ij2ZUqZ8k+OsE9Xq+3RB6/IrMJXTuVi6MazytPnYOd/DTzn36CXWgrRX9v1Vwh62uelsrZfBEpxux5JemXaBQcWABsLoITyc3grhLlQXkQNQkKAGL5QX4ZdCQnR6XAGYRSKHwMdJX9f8sCW8AQX1m3ZOHbM8cFVA0n6WTHlSoFnJPrFM4dAtG//NSyhFt3bniu4pzGehzibcJlf0zlZZT5atWsOmTqNeZ/o6X807cfNyljmxTSBrSEpfL+OFXMNN6k9XZO3uLi2uWUrmNIUZHEIsU9mciLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjGIV6CdM+/8ATQElWP48QCpun2mJIOR4gCpFBCnCqM=;
 b=QNlpnIGGnGbtiHCJF22z/7S6JiXcKb/+eP/T0XT29mp2qGqO9w7b7A3+qdbkzrah8MO29JjEU3kIzY2Jm8eEWjH8yk8r+h8QPqJk9DtPQVBUvHq4H1/vlI/QBLdjv1juKxW+ynQVm+uIyx3mWMIfnUyNt31gAOzwlJXBXuMGMnY=
Received: from OSYPR01MB5334.jpnprd01.prod.outlook.com (2603:1096:604:8a::15)
 by TYCPR01MB11025.jpnprd01.prod.outlook.com (2603:1096:400:3a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 00:02:34 +0000
Received: from OSYPR01MB5334.jpnprd01.prod.outlook.com
 ([fe80::fe8:f613:9823:4075]) by OSYPR01MB5334.jpnprd01.prod.outlook.com
 ([fe80::fe8:f613:9823:4075%7]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 00:02:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Michael Walle <michael@walle.cc>,
        Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH net-next 41/54] net: ethernet: renesas: Convert to
 platform remove callback returning void
Thread-Topic: [PATCH net-next 41/54] net: ethernet: renesas: Convert to
 platform remove callback returning void
Thread-Index: AQHZ6nCy5AGglgFxlUuFVmo2nm0oW7Ai1liw
Date:   Wed, 20 Sep 2023 00:02:30 +0000
Message-ID: <OSYPR01MB5334D260EF1786521CB63291D8F9A@OSYPR01MB5334.jpnprd01.prod.outlook.com>
References: <20230918204227.1316886-1-u.kleine-koenig@pengutronix.de>
 <20230918204227.1316886-42-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230918204227.1316886-42-u.kleine-koenig@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSYPR01MB5334:EE_|TYCPR01MB11025:EE_
x-ms-office365-filtering-correlation-id: e33e4740-2100-415d-9c2f-08dbb96ce204
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OdaXiF/NUYGPaIZsev2hzfv+1inA1k0S+w2tMHpEngV7BdW2crmI7E1s+XLAH2pqWcamxciP4M6GqILUHJUlycHkHRak7+bNJjyAaUUWTJgBNL6Ol5nEF8epj4cDZpCptzBuPO0qKAd4nytXiHMCOlQtTdiidtivoQJmjl8pvfNAC8Rpphox6e2TNL06613zCVBeLZwYpieyV7wYAq7ITN8A/rycy6D02MqwIKEVxRTvwqlz9pZeDLB6ElfHjulwLdJVWtqrMybaPnd5GzcPV0fGNkUeZArF4LmJ7f644Tr2Eo5YLnOWW3N9NkaFlQvPGkEsEOPwfTbn5J6zQsBDeGo3WAcNAdIHIEmmmwpq7J8htd1XtXAHOi99ZiJ2VziqlhglK+hgHtT+LuNUzLZQ5g6KoEoLXDFjOfYlk1ak/2TK1XDgDl0XBVrbcCbp7JTdX/alRLLPrJxHDIHNoY/xeW9secz+njeI0SVQLu5xveWsIPeR3Y3eDGEEzstPHxd8dKj3zW1aXpWLZCw/8+LXUdZCEZ/LGRbY8jKKazm6Nrs6SgixD6mydgWNps5G+SUl1sD7OUm1ZpIn2rxTF/RPF7Np4m05E9zDuXRPupf3GRI+9Mff1GjBDhQCpfQBGqXt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSYPR01MB5334.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(1800799009)(451199024)(186009)(8936002)(2906002)(8676002)(4326008)(41300700001)(316002)(7416002)(55016003)(66574015)(52536014)(478600001)(66446008)(76116006)(66556008)(66476007)(110136005)(66946007)(54906003)(64756008)(5660300002)(7696005)(9686003)(6506007)(38070700005)(83380400001)(71200400001)(86362001)(122000001)(38100700002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWFKQ2o3cDVrUkJIWTBJaWhzSFlIb0FMRmg0anVvU2pLMytTUHl2bG1XMWda?=
 =?utf-8?B?WmhMRVJ5TGUvYS9LOWIxck4rdTFYa0liQ3FuRTBKczNRdDJONXRBeVdtN1lw?=
 =?utf-8?B?WjJpMEpSRnJBZGk2dmsrQ0JhN0VqWlNiWFBzVEhHN3VDYlZPL3IwT0hWeS91?=
 =?utf-8?B?WlhzNjJadUJpcW9MTjFMMjBBR3ZiQ1lBTmlFWEo5OEd4by9FZldJRXdyUmtx?=
 =?utf-8?B?cDlVWkJtTnh6MExoQTBzWUtGenZWbE9VRjc1VFZSWGR0Z3FHZWlFR0RBNFFW?=
 =?utf-8?B?T2hVVVJqejZTcEY4ZXhoZ2lmQVozeUd6QXZMRXJNRGE5TFhPTlZvT1dEK0pF?=
 =?utf-8?B?N3VkWmNBTE1KYW1BTk5Ydmt5SzRuQ1BBdWtzTjI1eWpiODNTVzJuckhBOTJq?=
 =?utf-8?B?clcvczBhZVhhK0M2WEQ3bTlMNEZzd0J6YnNxK0tJcE50aTM5TG9sMkxNZUNn?=
 =?utf-8?B?UFBVbmtjNDhzd3lPcFFZQVBrTzlJTXM4aXFXRzA4SmtLT05iaFVRWjZtbERx?=
 =?utf-8?B?MFNvVURSTGwyM3A5WXNWVzIza2xVbEVmS1oybWpqbW5aaTFZOXRaNjdFaTdx?=
 =?utf-8?B?YWEwaHZLOVZMVVVpRW8vT0p4UnVYOWdnZk5KVW1MWStCNkZLNGF1dnJuV1B6?=
 =?utf-8?B?NktuNmVxVWFBdGRCNERBcVh4NDlDN0pWNkFXcm4reEdBYWNrYkkvMlFRdXBB?=
 =?utf-8?B?enlUMGFWWTFyWE9CWWRIUzVpUUZxRFFZMDdMOFRQRnhnUFhnM1VMczFPMEc5?=
 =?utf-8?B?akh3enh4T3BFcXdOUkRlM1hmUkdUb1Fld0RReTU3Q1RUeUkvYUtKOC8zVnJo?=
 =?utf-8?B?ZnhwNTV2MGc4bWpvVFVKUG5sWGpPRFZZQjdTOUNraTBJdVFybXV1NThtOTlV?=
 =?utf-8?B?bERFOEorN3F4R2FkQTJnWVUrMmMrelVkcDNidG4vTlFJdmgwUGRZUXp6Q2Y2?=
 =?utf-8?B?OGlGd3RZelNpWlg1alg2dTJ5d0IwZGoyaEl1UVJwRVV3UzBNS0JkNzZFcVdH?=
 =?utf-8?B?WnRLRjAwVHAvK3NMaXdzcG83aE80enFBZHNyK3NibFZrNjU3L2VPdmt0bm1U?=
 =?utf-8?B?aVNCVFVXZ0RoQWlXUGVMbnBBK2VBdUVXREVkaEpLbjdTVlJzZjhNOWZ3M2dO?=
 =?utf-8?B?OWVwb0x2QjZodktVeGpzVFBqdFlaOWhSS3ZpYzFac09JR1B2K3ZRNzZ0QUx2?=
 =?utf-8?B?YkVkOElmVktUQW50U1hCbGIrc3ZhRmRoRmVITjl4OFZTUkt3SFVoamh2RTFK?=
 =?utf-8?B?c2tmS2RxQnY3OXExTFNhRXorNzZZVTlPRXBuK0pwazBsYmM3N3pmSG5vTGNF?=
 =?utf-8?B?THAyTUFkdHdSN1MrUWtRdXkvdXV0bmlGbmpCdmV6V3ltZGViR3EvVTcrSkp6?=
 =?utf-8?B?ZEVWN3M1bmx4ZzR2TnpQUld4L1E3bWg2NGcvL1FQdWVDMVNLZXhHMmNiaFBD?=
 =?utf-8?B?ZHhqOXpkMzNVT010NHpnRGNvd0NablVhTWJDanQ0S0o4MnhVcW0zK0VvcHlJ?=
 =?utf-8?B?MlpWOGNmWG54M1lBZUREQ2kvZzQ0Y1kxcW1Fb20xaHlGd25SWVRDRHdESkpI?=
 =?utf-8?B?bUZiOGdINFY1dFc2RjB2b0dYWW0rZUZrbWM5ZEVOZXc1VzlHK0NjejNvM3ll?=
 =?utf-8?B?UnEzNlQ0NTk1NTJBWHAzZ1ZvNlo3RzJHeGg4UEdWNWh5SnJ6OUNtZVByY2pK?=
 =?utf-8?B?VnpaZ2NvU3hraHBtNFNnbVNWMzhWeUNlVzA5ZzQyRlBFSzEySk11UDMyL0xo?=
 =?utf-8?B?bFllb2dqN1JJTUhpamRTMEh5Q0M5aUJpSXlkdDFhMk9TWTdReHRaNXVhaG9D?=
 =?utf-8?B?Y3hwSm1oTDFqZWdaUngvTVdHdlU2ZTlUbjBkRk1nVFBSTTZFcE5WTlBMQmJO?=
 =?utf-8?B?eVIxejIvTWh3OWFVaDBNM1ZGR3JreDBIVnAzbm9oV3YrWDNxdjZMRk5hcWxt?=
 =?utf-8?B?OThwWVVDTWpUbXVOTEJFSkVtT3JiZlYzbWNVYWxyeEJ5YnJnL01jamVIMWxi?=
 =?utf-8?B?S1Q4b1ozeDdIZGdJQWZqTkVmQlBZWjk1Sm9rOFBNakpYTkhLeUppYjNLSXZ1?=
 =?utf-8?B?NGp0WFU2WmVreE5xamR1SmpPei90bHZWVFNtSzlKSDZvTGhibUlSVURwYXhQ?=
 =?utf-8?B?MjU2MzNONGU0alZQUEdZbUErU0NxU0JqSXRYd0U0WVNaak1QckxXTWN4OFEx?=
 =?utf-8?B?U3dPYWhkbkxCeVpXVEU1TU1UYlU1NWkzcXF6djhtQnZUT1kvZE8wbmVGK2Zv?=
 =?utf-8?B?eDZTZnR1clRjRzdMbUlXaURKcWlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSYPR01MB5334.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33e4740-2100-415d-9c2f-08dbb96ce204
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 00:02:30.2570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ORwoxKB4cFvvxqFrVetzQuC9ScPvfSEZ+5hkz/MWB63pNznQctuCkOi2eo0gh5AyfMZj7ocOUvyYt6Z5v9I5PfAbEAM6NK4W6J04kv7mVoRZcCmaxxozFV+5rJQgd3m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11025
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVXdlLA0KDQo+IEZyb206IFV3ZSBLbGVpbmUtS8O2bmlnLCBTZW50OiBUdWVzZGF5LCBTZXB0
ZW1iZXIgMTksIDIwMjMgNTo0MiBBTQ0KPiANCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3Ig
YSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMNCj4gbWFueSBkcml2
ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRs
aW5nIGJ5DQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1ZSByZXR1
cm5lZCBpcyBpZ25vcmVkIChhcGFydA0KPiBmcm9tIGVtaXR0aW5nIGEgd2FybmluZykgYW5kIHRo
aXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3MuDQo+IFRvIGltcHJvdmUgaGVy
ZSB0aGVyZSBpcyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4NCj4g
dm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcyBxdWVzdCBhbGwgZHJpdmVycyBhcmUgY29u
dmVydGVkIHRvDQo+IC5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5zIHZvaWQuIEV2
ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMNCj4gYXJlIGNvbnZlcnRlZCwgLnJlbW92ZV9uZXco
KSBpcyByZW5hbWVkIHRvIC5yZW1vdmUoKS4NCj4gDQo+IFRyaXZpYWxseSBjb252ZXJ0IHRoZXNl
IGRyaXZlcnMgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQ0KPiBjYWxs
YmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQoNClRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoIQ0KDQpSZXZpZXdlZC1ieTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3No
aWhpcm8gU2hpbW9kYQ0KDQo+IC0tLQ0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9y
YXZiX21haW4uYyB8IDYgKystLS0tDQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jz
d2l0Y2guYyAgIHwgNiArKy0tLS0NCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvc2hf
ZXRoLmMgICAgfCA2ICsrLS0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3JlbmVzYXMvcmF2Yl9tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJf
bWFpbi5jDQo+IGluZGV4IDdkZjlmOWY4ZTEzNC4uZTYyMzkxMTgwMDMyIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jDQo+ICsrKyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gQEAgLTI4NzgsNyArMjg3OCw3
IEBAIHN0YXRpYyBpbnQgcmF2Yl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgCXJldHVybiBlcnJvcjsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IHJhdmJfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9pZCByYXZiX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBuZXRfZGV2aWNl
ICpuZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICAJc3RydWN0IHJhdmJfcHJp
dmF0ZSAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOw0KPiBAQCAtMjkwNSw4ICsyOTA1LDYgQEAg
c3RhdGljIGludCByYXZiX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
CXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHByaXYtPnJzdGMpOw0KPiAgCWZyZWVfbmV0ZGV2KG5kZXYp
Ow0KPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOw0KPiAtDQo+IC0JcmV0dXJu
IDA7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCByYXZiX3dvbF9zZXR1cChzdHJ1Y3QgbmV0X2Rl
dmljZSAqbmRldikNCj4gQEAgLTMwNDQsNyArMzA0Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZGV2X3BtX29wcyByYXZiX2Rldl9wbV9vcHMgPSB7DQo+IA0KPiAgc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgcmF2Yl9kcml2ZXIgPSB7DQo+ICAJLnByb2JlCQk9IHJhdmJfcHJvYmUsDQo+
IC0JLnJlbW92ZQkJPSByYXZiX3JlbW92ZSwNCj4gKwkucmVtb3ZlX25ldwk9IHJhdmJfcmVtb3Zl
LA0KPiAgCS5kcml2ZXIgPSB7DQo+ICAJCS5uYW1lCT0gInJhdmIiLA0KPiAgCQkucG0JPSAmcmF2
Yl9kZXZfcG1fb3BzLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNh
cy9yc3dpdGNoLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2guYw0KPiBp
bmRleCBlYTkxODYxNzgwOTEuLjNjMTY1YjE1NzA5ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvcmVuZXNhcy9yc3dpdGNoLmMNCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvcmVuZXNhcy9yc3dpdGNoLmMNCj4gQEAgLTE5NjgsNyArMTk2OCw3IEBAIHN0YXRpYyB2b2lk
IHJzd2l0Y2hfZGVpbml0KHN0cnVjdCByc3dpdGNoX3ByaXZhdGUgKnByaXYpDQo+ICAJcnN3aXRj
aF9jbG9ja19kaXNhYmxlKHByaXYpOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgcmVuZXNhc19l
dGhfc3dfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9p
ZCByZW5lc2FzX2V0aF9zd19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
IHsNCj4gIAlzdHJ1Y3QgcnN3aXRjaF9wcml2YXRlICpwcml2ID0gcGxhdGZvcm1fZ2V0X2RydmRh
dGEocGRldik7DQo+IA0KPiBAQCAtMTk3OCwxMyArMTk3OCwxMSBAQCBzdGF0aWMgaW50IHJlbmVz
YXNfZXRoX3N3X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXBtX3J1
bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsNCj4gDQo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEo
cGRldiwgTlVMTCk7DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciByZW5lc2FzX2V0aF9zd19kcml2ZXJfcGxhdGZvcm0gPSB7DQo+
ICAJLnByb2JlID0gcmVuZXNhc19ldGhfc3dfcHJvYmUsDQo+IC0JLnJlbW92ZSA9IHJlbmVzYXNf
ZXRoX3N3X3JlbW92ZSwNCj4gKwkucmVtb3ZlX25ldyA9IHJlbmVzYXNfZXRoX3N3X3JlbW92ZSwN
Cj4gIAkuZHJpdmVyID0gew0KPiAgCQkubmFtZSA9ICJyZW5lc2FzX2V0aF9zdyIsDQo+ICAJCS5v
Zl9tYXRjaF90YWJsZSA9IHJlbmVzYXNfZXRoX3N3X29mX3RhYmxlLA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9zaF9ldGguYyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3JlbmVzYXMvc2hfZXRoLmMNCj4gaW5kZXggMjc0ZWExNmMwYTFmLi40NzVlMWU4YzFkMzUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvc2hfZXRoLmMNCj4g
KysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9zaF9ldGguYw0KPiBAQCAtMzQzMSw3
ICszNDMxLDcgQEAgc3RhdGljIGludCBzaF9ldGhfZHJ2X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IHNo
X2V0aF9kcnZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMg
dm9pZCBzaF9ldGhfZHJ2X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
ew0KPiAgCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRl
dik7DQo+ICAJc3RydWN0IHNoX2V0aF9wcml2YXRlICptZHAgPSBuZXRkZXZfcHJpdihuZGV2KTsN
Cj4gQEAgLTM0NDEsOCArMzQ0MSw2IEBAIHN0YXRpYyBpbnQgc2hfZXRoX2Rydl9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlzaF9tZGlvX3JlbGVhc2UobWRwKTsNCj4g
IAlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7DQo+ICAJZnJlZV9uZXRkZXYobmRldik7
DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICAjaWZkZWYgQ09ORklHX1BNDQo+IEBA
IC0zNTYyLDcgKzM1NjAsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKHBsYXRmb3JtLCBzaF9ldGhf
aWRfdGFibGUpOw0KPiANCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNoX2V0aF9k
cml2ZXIgPSB7DQo+ICAJLnByb2JlID0gc2hfZXRoX2Rydl9wcm9iZSwNCj4gLQkucmVtb3ZlID0g
c2hfZXRoX2Rydl9yZW1vdmUsDQo+ICsJLnJlbW92ZV9uZXcgPSBzaF9ldGhfZHJ2X3JlbW92ZSwN
Cj4gIAkuaWRfdGFibGUgPSBzaF9ldGhfaWRfdGFibGUsDQo+ICAJLmRyaXZlciA9IHsNCj4gIAkJ
ICAgLm5hbWUgPSBDQVJETkFNRSwNCj4gLS0NCj4gMi40MC4xDQoNCg==
