Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0135A3D5748
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jul 2021 12:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhGZJi0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 05:38:26 -0400
Received: from mail-eopbgr1410113.outbound.protection.outlook.com ([40.107.141.113]:32544
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231820AbhGZJiX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 05:38:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foKw5zxL4AnN+7yEpPg9qIrfIPm9SRaRqSELnpysV77QFcyv0hM+dcyOW9h/lyNvaq6xxtF+huHZLOLSiqTN1cs9pVg4VbJSp+9AgIPkqrPg41qhoWi3Crv9MPkSx91hMBO4U3HtaCTUO5lKqLi6p+9EKYhr1maWC18TQwcOp0k0UDJU4vllCa7S5pKzjpk16E+DO/Zl6KAwgKVwDLxgpckwDL2csgYyiKK50Jy3QU+5KZ7Juhz1WQcuJjV9A+tiJeio3A2Eh+9oNhP5NN8We9GumDl4n6ZmJg7Mx7QnsPxUq4IpSHw/ILFDif9LAVjmLJ0uhLbRgIA6BGoqketXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XREBPo4RTagAKEw/ISU8XHeax6IyzUoh2PQXgZlRYps=;
 b=MowEZErh2770inovnBlabQ+HmwX4z7wuNHjmxOj/xUXQQZBTfGDu9DWEBRbMpje761jgLBbUH0M4e/tVWOfgCcUgAKNtApTNAAhVi9hK7XkQplYJQfEfwQj2OP7IOAQcetNNROLIC3yRBeBAuCr1vtbV5e1vn9wj+3009ei01j2ktkJiskjWk7hS3+YNfMjCa3v1fG+xK6dfWVqc+HtTL7rAd06aVg+AUyq7bIx2taavpMooj9wf+paKcX9TXKrGLsUkl5fcltiGT381MPBdhgXRi8XUUigOTwBEdrN8CzZBI9JwUJ2UA34Fr2XyD39GiVvp4G16ncI3bs/tNkUGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XREBPo4RTagAKEw/ISU8XHeax6IyzUoh2PQXgZlRYps=;
 b=QNv2vSJchJvNW+QwgYlESu1o4+NJiiX0Z46eT7/Gk71UYkUgx84z8jceu7ZPIabs57vvVt4OObWNHGu4k83v9NGKirMld333qQH9f1z72MT0DxdTeMsZdimj1Jyj9SdsbsPwPwn4rHEl9jJfs93DbTo3fALVUI2lg6cAXqOwXdo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4804.jpnprd01.prod.outlook.com (2603:1096:604:69::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Mon, 26 Jul
 2021 10:18:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 10:18:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next 04/18] drivers: clk: renesas: r9a07g044-cpg: Add
 GbEthernet clock/reset
Thread-Topic: [PATCH net-next 04/18] drivers: clk: renesas: r9a07g044-cpg: Add
 GbEthernet clock/reset
Thread-Index: AQHXfwPZ9KfPZHnWQUG0B1Zoil7gD6tVDzgAgAABfRA=
Date:   Mon, 26 Jul 2021 10:18:47 +0000
Message-ID: <OS0PR01MB59224C79B256C56054EEFAEE86E89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
 <20210722141351.13668-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdWj6jjHPhP9M=W8uwj3x-eOeDCtnRLR8t8x6XY6-H7CWg@mail.gmail.com>
In-Reply-To: <CAMuHMdWj6jjHPhP9M=W8uwj3x-eOeDCtnRLR8t8x6XY6-H7CWg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbea2955-5a55-474a-9fa6-08d9501ec1d2
x-ms-traffictypediagnostic: OSAPR01MB4804:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB4804B4243B3F8F8824F8AAFA86E89@OSAPR01MB4804.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bcr6lkyU/CEYJa6C6YqTePkUswTx8pLu/sJW1bgg6uVT2CAht7h6XOqplE6Tdi/MNMl9K4cdNvJ+kqP9BKg0Q6A/YKN0N2urb6/bXoj732aLY1rjjfZJ79rpxl1pXHfYIsUq7+roNtcbQLxf3es8vUpOmkjBvth916FlyBVbA6oweBG8meu7lTDCagihMG+QnrVoWjMgRf0gkQmlzZDULpgrRp2pj8RSDS+EWEuALP6nv+LJLzhZNkIFhDmtwecFEAWLLfeP0Gpc+G/V3HXem4Bjrj2wIyEC4CoaWiy2+lq8qcnGUdmPXkErwfxLwFY/0K/bfS0pa53bbBB429aSAQ4dL1R/lYNVrLLFi7wgnmA1QTdjKkFGcQP0jePMSSa1FkWPT8R4S4LNnNFWq42HU6lFkJ7jZe5B5VRksogk4+orRnWF9cHmcLOrqNiXJt/CoYURn36Rrx0GPghyUNyUwTOjZHqG/xef6iIm1HQ+niZtRC/QrJWtbSaDTZsK/dGFX1j5V9QtqP+hYOt4MtQJhX9qiC2ngiTYGS1snXqtun7TmuipB7bXiPnXHTdAyh1clrSAJiob0dAjQTCaRLGdRrLJqUewYe5bMHAqFqHFtTQ5mNPmfL02LkkXY0JS23HQvZ17ems5cwLmNipvSVfhJ23pQmCOxTVLRzszkJ8t8RhaTvUOKTLNb4XbJgE7T4MU+H4Sbqq7CTLXhEUBf1dQqQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(39850400004)(376002)(396003)(346002)(366004)(136003)(8676002)(9686003)(64756008)(55016002)(86362001)(26005)(66476007)(52536014)(71200400001)(54906003)(53546011)(7696005)(6506007)(186003)(66556008)(33656002)(76116006)(66946007)(4326008)(5660300002)(478600001)(6916009)(83380400001)(8936002)(38100700002)(66446008)(2906002)(122000001)(107886003)(316002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGdOajRGOFlnRDJ0UmREWG5sbzJnZzRNcitMKzBlK09wZmdTdzhGYTNYTG03?=
 =?utf-8?B?b3FVQ1EwbnFUQzFvL2doQURrVmFMcVgwc1R6clRUUzA1cHVac09YdHBZUUR1?=
 =?utf-8?B?SmRYRHZ1N0xsbjNibUh3K0RvZi9FdFVCRGs4N2NkMk5DN0tUWGVCWXVRcHhS?=
 =?utf-8?B?eTk1ZnRRbWNqWk1Sd3JkZ2tzSUNhUy9VWDhOZkdsa0JWQXpnYjZyRUg0T0pO?=
 =?utf-8?B?OTE4Si8yc01UZnN1UWtpdG8vZTJRZE9KRFVQcFNOWW9UWGZsWFhxOFV3RXRY?=
 =?utf-8?B?S2RFbzhaTWhxWDNrNFNBY2JzVDBBdzZ0NjNkK1I1dW53aW1ZSU10TzVhK1ZO?=
 =?utf-8?B?QUl6U1ozcWhpK2ZNdnNla1hxdzBQaUFDZ016eWlZaHB5eXZvRU1yMTNWTUdE?=
 =?utf-8?B?WEU3UEk5THNBZjd1TFlYWjBYWGN6bVh2dEhHL1RKU1FNSEtIL1ZpU2d6TGJH?=
 =?utf-8?B?dk9sS0IwMy9qb0o4NWxDOUNZTHpZbEljMSs1dk1zUkVnSzlkZFJ4cFdKbTJa?=
 =?utf-8?B?Ly92MVM4Q3pITVZpekFaQTZjV2JuVzZnQWFiWEU5RkUrcFdRT3ByVHFzUm5x?=
 =?utf-8?B?bmNaQnhKdjJiUndrbHFXWFFSY1lzSnpTcDlYbndQYnFQZ3YwdXpieDVSK3Vr?=
 =?utf-8?B?dis4c3ZkKy90NkN2dG9DQURyd1EvNUhRVVlHbFF1MDNnZHh6NGNsMFYzR0pG?=
 =?utf-8?B?NjBBYkxnNkdPRlJYVmdKRXVuSFAvMGtwbU1lZVVKK1Q4Y0JacFBDZ2RLSVJ1?=
 =?utf-8?B?aTV2OXhDa0ZMaHA5enNrY0lXSlR5V2xuS0xsRFhscUVWRndtTkttWWN3N2lP?=
 =?utf-8?B?YWxMeWhTQkl1YmRmTWhRMkNYV1RZbnNhN2NEa0cwTzZwVUIvd1VDVlhuaDJ5?=
 =?utf-8?B?NnBEU0h3TFFhQzR3Q1FtenlibTV2SEZrcFh1Nmx5TzMra2QyRjZnUm9KSGJz?=
 =?utf-8?B?bnBJWit6cHZ1UWtXbCtTQkhzd3UyWW1nVGR2a09iMXdWekwvTVNUWmpwM0I4?=
 =?utf-8?B?TVE5U0RzZWNyUWVMTCttYm9GQnhjWDRuTVpUT2lzNHZvZ3czaGZodkM2Y29q?=
 =?utf-8?B?bWtGYXNKV2dnalMxclN4ekFZVW9hUkNzbnc5N1BpZlZleTBmOUhvVUllOHRt?=
 =?utf-8?B?ZU4wdFZZMzl3dTBmaTAwazdvNFFheUlIdkRYeHZSMEF5aGVOTUpzaVBQeFdh?=
 =?utf-8?B?TEpFc21WRGUyWmdNR2w4OTgxYTc2NExXeWVjT1g1WGFydmplYzJDVWp3ekdt?=
 =?utf-8?B?YmZKOTBvbmtRalkzeVJmRm01REdlUm1XQUVLSkRDY0NpU0cvTUdBcUVJT1lx?=
 =?utf-8?B?anlkMncxUXpHb2FKbWZ5MmJnRjJPNFVoZWdCbk10dDNWVDFXejV1cXBTeEFP?=
 =?utf-8?B?TWRwU3UvN0xUa3lpT0xZSElYMlRlRlQyYS8yOW0yVzBpeDZ5SXlnekloK2dv?=
 =?utf-8?B?NXo1cGJWUytJRVoyZDhjYmJ1TUV0Q3JMNFJHTFp5c25uamxVNTFQK21VTnVH?=
 =?utf-8?B?UDJwOWhHVWRDYnF2WkV5Y25qdi9TemRUVlhMaDZ3dWtqRk9vRkEvUWozOEdn?=
 =?utf-8?B?Z05tYTE0S1RhT3JnaUx0OXBzZFZqRXp3TEZBMDRWeXFhNG56OG1QVUpNZytv?=
 =?utf-8?B?c3BxSFRRRlZmVkw4VDNmNndXWEFndTZUdEl6SExvRWNpUktGbzZteU1EL1A2?=
 =?utf-8?B?RWoxcEtCN3IyY3BwMzVrcUlxWjV1ZGlEOWIwcEFkcGVBVGpMdElvM3lKbWw5?=
 =?utf-8?Q?ZTW1XW2nHPknmI6Dzwq/BftE9+L+HEstO3iKrE0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbea2955-5a55-474a-9fa6-08d9501ec1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 10:18:47.6879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ok+zK0WRlplNiPMHfJ1tnJ49dD+htgBaOhM+606dnE/9T7+TxaO/PbgBGZGXsYBdZ/DB3ExPIDuWlMzMClTxAtu9CBOyIHp/ewzf5OVTONY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4804
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggbmV0LW5leHQgMDQvMThdIGRyaXZlcnM6IGNsazogcmVuZXNhczogcjlhMDdnMDQ0LWNw
ZzoNCj4gQWRkIEdiRXRoZXJuZXQgY2xvY2svcmVzZXQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBP
biBUaHUsIEp1bCAyMiwgMjAyMSBhdCA0OjE0IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQWRkIEVUSHswLDF9IGNsb2NrL3Jlc2V0IGVudHJp
ZXMgdG8gQ1BHIGRyaXZlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0
NC1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDdnMDQ0LWNwZy5jDQo+
ID4gQEAgLTEzNyw2ICsxMzcsMTQgQEAgc3RhdGljIHN0cnVjdCByemcybF9tb2RfY2xrIHI5YTA3
ZzA0NF9tb2RfY2xrc1tdID0NCj4gew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMHg1NzgsIDIpLA0KPiA+ICAgICAgICAgREVGX01PRCgidXNiX3BjbGsiLCAgICAgUjlBMDdH
MDQ0X1VTQl9QQ0xLLCBSOUEwN0cwNDRfQ0xLX1AxLA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMHg1NzgsIDMpLA0KPiA+ICsgICAgICAgREVGX01PRCgiZXRoMF9heGkiLCAg
ICAgUjlBMDdHMDQ0X0VUSDBfQ0xLX0FYSSwNCj4gUjlBMDdHMDQ0X0NMS19NMCwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4NTdjLCAwKSwNCj4gPiArICAgICAgIERFRl9N
T0QoImV0aDBfY2hpIiwgICAgIFI5QTA3RzA0NF9FVEgwX0NMS19DSEksDQo+IFI5QTA3RzA0NF9D
TEtfWlQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDU3YywgMCksDQo+
ID4gKyAgICAgICBERUZfTU9EKCJldGgxX2F4aSIsICAgICBSOUEwN0cwNDRfRVRIMV9DTEtfQVhJ
LA0KPiBSOUEwN0cwNDRfQ0xLX00wLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMHg1N2MsIDEpLA0KPiA+ICsgICAgICAgREVGX01PRCgiZXRoMV9jaGkiLCAgICAgUjlBMDdH
MDQ0X0VUSDFfQ0xLX0NISSwNCj4gUjlBMDdHMDQ0X0NMS19aVCwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4NTdjLCAxKSwNCj4gDQo+IFRoZSBBWEkgYW5kIENISSBjbG9j
a3MgdXNlIHRoZSBzYW1lIHJlZ2lzdGVyIGJpdHMsIHNvIHRoaXMgd29uJ3Qgd29yayBhcw0KPiBl
eHBlY3RlZC4gRS5nLiB3aGVuIGRpc2FibGluZyBvbmUgY2xvY2ssIHRoZSBvdGhlciBjbG9jayB3
aWxsIGJlIGRpc2FibGVkLA0KPiB0b28uIFRoZSBjb3JyZWN0IHdheSB0byBoYW5kbGUgdGhpcyBp
cyB0byBjcmVhdGUgYSBuZXcgY2xvY2sgdHlwZSBmb3INCj4gY291cGxlZCBjbG9ja3MsIHdoaWNo
IHNldHMgdGhlIENQR19DTEtPTl9FVEguQ0xLWzAxXV9PTiBiaXQgd2hlbiBhdCBsZWFzdA0KPiBv
bmUgY2xvY2sgaXMgZW5hYmxlZCwgYW5kIGNsZWFycyB0aGUgYml0IG9ubHkgd2hlbiBib3RoIGNs
b2NrcyBhcmUNCj4gZGlzYWJsZWQuDQoNCk9LLiBXaWxsIGNyZWF0ZSBuZXcgY2xrIHR5cGUgYW5k
IGFkZCB0aGUgbG9naWMgdG8gaGFuZGxlIHRoZSBzYW1lLg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQo+
IA0KPiA+ICAgICAgICAgREVGX01PRCgiaTJjMCIsICAgICAgICAgUjlBMDdHMDQ0X0kyQzBfUENM
SywgUjlBMDdHMDQ0X0NMS19QMCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDB4NTgwLCAwKSwNCj4gPiAgICAgICAgIERFRl9NT0QoImkyYzEiLCAgICAgICAgIFI5QTA3RzA0
NF9JMkMxX1BDTEssIFI5QTA3RzA0NF9DTEtfUDAsDQo+ID4gQEAgLTE4MSw2ICsxODksOCBAQCBz
dGF0aWMgc3RydWN0IHJ6ZzJsX3Jlc2V0IHI5YTA3ZzA0NF9yZXNldHNbXSA9IHsNCj4gPiAgICAg
ICAgIERFRl9SU1QoUjlBMDdHMDQ0X1VTQl9VMkgxX0hSRVNFVE4sIDB4ODc4LCAxKSwNCj4gPiAg
ICAgICAgIERFRl9SU1QoUjlBMDdHMDQ0X1VTQl9VMlBfRVhMX1NZU1JTVCwgMHg4NzgsIDIpLA0K
PiA+ICAgICAgICAgREVGX1JTVChSOUEwN0cwNDRfVVNCX1BSRVNFVE4sIDB4ODc4LCAzKSwNCj4g
PiArICAgICAgIERFRl9SU1QoUjlBMDdHMDQ0X0VUSDBfUlNUX0hXX04sIDB4ODdjLCAwKSwNCj4g
PiArICAgICAgIERFRl9SU1QoUjlBMDdHMDQ0X0VUSDFfUlNUX0hXX04sIDB4ODdjLCAxKSwNCj4g
PiAgICAgICAgIERFRl9SU1QoUjlBMDdHMDQ0X0kyQzBfTVJTVCwgMHg4ODAsIDApLA0KPiA+ICAg
ICAgICAgREVGX1JTVChSOUEwN0cwNDRfSTJDMV9NUlNULCAweDg4MCwgMSksDQo+ID4gICAgICAg
ICBERUZfUlNUKFI5QTA3RzA0NF9JMkMyX01SU1QsIDB4ODgwLCAyKSwNCj4gDQo+IFRoaXMgcGFy
dCBpcyBPSy4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+
IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
