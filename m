Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D342456814
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 03:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234050AbhKSCaN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 21:30:13 -0500
Received: from mail-os0jpn01on2125.outbound.protection.outlook.com ([40.107.113.125]:16389
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231526AbhKSCaM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 21:30:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdnE4K+SM8aiY8FhF7qM+1h8ZYjKyxxe6R1fu7JSDDRDPKZEnOxsQAfkZk6TrayRbrYLSQEk0FUJlxoGP7kJsBYS565KwwJXnvyvP0wq8aquZLXnmvIdlASxxvwq0CbUmHNIdbaFtg+2nsPhRON3i5DbpbMFeJhGOKinh/WADsUzIgra4iAhMFW9i1LDtinuCe9FXA4BQHSX8KWOFCXlaMNptICqcDCDnNzGsyNsF4FFByHe9JDEQoAuteJdxyP8WJwm5A3K45h2oCfjdl3JJEp4C6KGIK+6iD86qln1hwBUPEQ4WWFnnql75bu3WRvynsCL78Nm1FLmrO6XsCvAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFGL/TPBj8Prtm7mKD2NGMGKvb94OUac6YxRKSuZ8UM=;
 b=OQVHvqhA+bLaHGuDQTRyIDmixAqSjrtJLrM8TC2meYJmIQ33jPcjfsvBmG+wftTPRAocFTqZMSYzUP1AhjPVDRS8V42hsm2XSPN0C+0FPSXjP3PhTeZ47Xbg+OeQEL8FXRULU3WMlzbyszoBQMniMnksxC/UeNP/73xezf7CAbuhpFDP6ES3D8JBwcfddMWV280LU4cXZIWGRyh3e6PslqczUM3aO+V5KiInpKMkChsmzGsjWPx4KpDR3fknTFg8wa1zeSYtY+TepMGr+iOBJCvoqjFNfilxsSsmRok8ZEXvkZTcQ1HL3kUgKQWaxsazzcgQ9oYBqS0imZeuIlhEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFGL/TPBj8Prtm7mKD2NGMGKvb94OUac6YxRKSuZ8UM=;
 b=fRRhvlZ/i7XiUmWUicp0RyXFC1UHSfBHksaLK0ubdsxSKFrQfzxw46q6D4G11u0ljzjlLPJcJoeZ0kwEWxK/Hb2PBSp++ze/1wdECeRiFR7jVOVQetq2epEZsbmWqH4vLBC44pRdRsnbBFaxZJ9HBuXOZH44xEqgjC9yfq0qK4c=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB1979.jpnprd01.prod.outlook.com (2603:1096:404:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 02:27:09 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 02:27:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH 09/16] soc: renesas: Identify R-Car S4-8
Thread-Topic: [PATCH 09/16] soc: renesas: Identify R-Car S4-8
Thread-Index: AQHX2r2IUwb3kVRJd0+iljhSKStbxawJqHmAgAB7nkA=
Date:   Fri, 19 Nov 2021 02:27:09 +0000
Message-ID: <TY2PR01MB3692B7B592B7032016D6DFD3D89C9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-10-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWvgK7w82Y1D27y98RdZZWLjXv-Q-jjh=g3YQw5zfbNfQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWvgK7w82Y1D27y98RdZZWLjXv-Q-jjh=g3YQw5zfbNfQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5011a373-d196-4714-039f-08d9ab04167e
x-ms-traffictypediagnostic: TY2PR01MB1979:
x-microsoft-antispam-prvs: <TY2PR01MB19793C3570AD8FF1B62B6F9CD89C9@TY2PR01MB1979.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5cnsdiqOk8Xj5SJg8QJMkzli/xs+AlwDKWRo6ekifShVMINwE94lDDQLJNlalbq9NuE1jCKzxHVjjgxBTmlWn6b9PVRN/w1iZ9z2P7qyoyD2FVFKaWiT0xpshGj9GapV6HEtSznHei2rXXVQkaqDya253JmTl18mZUczgKF9aqx7kOLxzif5wjGZjCDDX+TGC3avxV+9Jej0gAdtygisbJV853qp/quCjfHo3bwINGl7jJupge8jei56YP3D7ryi9qAXnS2AhfrEkPItit8couFS0gl8M+lRAIyPGZnnPYu2fO4/IcEbpLUHxySSrIRfWAqHqj9mJlP/uc+dDJPakk3fpDO2Ux1iLLbOgLwsEjojpGmtTtCIqtKRrTF0EgnP0Dx90+8fqL7iOieOKNw8kzNW+Gd6rcScG66XpNNzZid1897UJ94ttBzipZbr3zyjkbp2M4jayS9ngiksLqyrqf4tAI5lEwHPEG0NV4eb8NGcUyv2ajpa+bDYZa6c+A/T+QJU0pjDlQ6dUZqiTAirZJ5O48bdyP2vz9PJUWjG5MIOYGTIhUCEJFLdAcWeXGGXAm2dPkIcqsNkxX88zMkyVdsjsxRGl01Uw52aC0JrdILkJay9/H7Sld8pAyW5B35RqpVu1SErNW8uR+qwRogMjXmAGOrKYqOyakoP2aiGORuudfm8i4zBK9wNmR9IZBGZzz7Os3M15Z42CxhxvgQ5SA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6506007)(122000001)(66556008)(6916009)(2906002)(71200400001)(38070700005)(38100700002)(33656002)(7696005)(54906003)(9686003)(52536014)(26005)(66946007)(8676002)(316002)(186003)(76116006)(8936002)(86362001)(66476007)(55016002)(508600001)(5660300002)(53546011)(64756008)(83380400001)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjBvVS80NzFEV1FsOXpqa0FBQUFhc1k1NHIwY0s1YUFrTmxaVTV3WjV1Zk0w?=
 =?utf-8?B?eFhXV0x5dWRPZ2RxcjBaQ0RkMllCUmNrWUZta3VVUjZQT1huMEl1NFhlakhC?=
 =?utf-8?B?aDVJZnFFaXhNOGJtK21GeHMzN2NWY2Q4TzNONmdEVGdqakNva1lwWXFBNUtU?=
 =?utf-8?B?eG41UzkzYXdyWjg0U0g0aVo0eGw1a0lUdjV0MHoyemt5MFBBVkp6eklrMmJL?=
 =?utf-8?B?cEhQK3RXbnJkWUhnbENSTStjQlpiZ3V4UU8yRHNYbHJZVWw3aUpvUkx6b292?=
 =?utf-8?B?VmJ3V0poUjlFdkpHL2Z6b1krb0NYZHI3UjVrM2RYVXMrU1c2WGF6dFRBakYw?=
 =?utf-8?B?ZXZnNTk3MGVnb0pST2RwV2ZZdGNCejYrbzkyZWM1RUVMWjJya0FQZlFDMFRR?=
 =?utf-8?B?cTJCV1pPSUVkdXBYeEFlK1RoRXlRL2NkNzRvMlVqcmV0MGorWlNDOTBVcEtN?=
 =?utf-8?B?RG5ITDlTU2VTKzh3MGNDK2ZyWCtPaEJSaGVvUm1YeVhvVE9YdkpKaHhyMkE2?=
 =?utf-8?B?K1UxejRWcm9kVXp0d2pYd3dXUjFCemw5S0ovbG9BODkwczdUNTAyak4raEkx?=
 =?utf-8?B?bHJVWFZndTg4QlRXWHpENTJzUUdselhqUExoZ1lYMkZjK2trL1ZrZFJjb1Jl?=
 =?utf-8?B?eHhYajh6Umxaam5vM0hVaVpZcFM2eVBhc1V6dVFvdSt6T0RuNXA2M2ZuR3ZG?=
 =?utf-8?B?ODlzclg4R0RCcHhnbXdCQXRlcTRxSzhjREhMOEtpSlVhSGwvUXFERytQODh3?=
 =?utf-8?B?YkRRTm56ZUgyN20wd3Zsc2plZFFwYTUxcW11WDNMTEZBZGl3L0ZwNWpWZXI2?=
 =?utf-8?B?b1dmbk0vNE5QbHR1ZW9LRGZ2bGtwenllOHJJRk5WampxenZodjgyQlBVRXIx?=
 =?utf-8?B?TGdGWm5HTU5wczduL1NrU09uNDk3Z1RPc3RLTmdWeTlrdEVtMUwzYWM0T1Vy?=
 =?utf-8?B?OU1TUHg3MUp4eVJiTDY0OEltUms1a29zZ2VZWVZGTjB4OWljcHF1cXpreGdV?=
 =?utf-8?B?NFpmbDBtNGFnckhlelgvMEVMejNVMjVRcWEyUGZXb0Jvb09URlNXTzhnTzV4?=
 =?utf-8?B?MHJWa0dldTBVLzJ3ZVFsUGd6Z0Fzd0xZQjV5VVBoN01lRG81dThhZUVtSmdL?=
 =?utf-8?B?cjlIRUtRdzJVNE5YQVNvclYwakNqTEpmOGtscXRjWENQZHRVYkptcTBRWUYw?=
 =?utf-8?B?YVl2N04zRXd3Y20yMjdtVkZMZFVKaTQ2am85d0dhUUI5dXk3MTRpNlhMdEsx?=
 =?utf-8?B?Q1FEZ0R0ZnhuVUhSb0R5SXhSRmpiRElzQXNHemt4a1hsdEdnWmRUYVc1Z0Q4?=
 =?utf-8?B?UWNYVlQvS2k1Vm1UUVRHaFluWVRnRXN1ZzhNOUhvcm9qUFRITWw3c0p0MHF4?=
 =?utf-8?B?Kzd3cjFhc0I2bjBEWXpSLzhDcWsxSW9xYmpTVFF5aGJQNHhkemE1T09pL0oz?=
 =?utf-8?B?dmtBcllkUDZSTCsvNXAvcjJTalZvaG9rVTJhR0pReWRzTmZpVjZaMm9MbUtq?=
 =?utf-8?B?aktGbDIvU3BUUUw0V0ZCTHREZnZDdnl6YUtycnVDNXU5WGZFV1lXQ0tpMERD?=
 =?utf-8?B?bTJiRVdtbWYwUktZQWxMWEtXdXdqZUdlbjVFYUJNTFpmQkYyaFRHYWx1OFpV?=
 =?utf-8?B?NFZ4eHRiYzZZcmk5WEN1YjNualVhZWV6dUZ3Zm1JV0tnRVM2enRScWRHUDVm?=
 =?utf-8?B?azBNRkR2QWNyalpOUWNTTm5oaVVTcncxNTlreVh3YjZnak9NWXlQNXhaNHlJ?=
 =?utf-8?B?RnFsdXJjdkkxRUFIV2JBMG5UQ090VFFjd3FnRngxTk10ZDNpbldLazVyTml1?=
 =?utf-8?B?OFE2Zk12SFRiTzl0Ky85UjM3SmdOSDU2d00xbEhBdC9QTW5pclN4ZmpvckVu?=
 =?utf-8?B?VlNWVUNXNWY2QjdhMEJWYmlLU2hlakNKT3E3bHQyUUd6ZVpyT0Y1UXFwKzFC?=
 =?utf-8?B?WUs3RkgwcnJKQnNZWHR5bDcrSjNMTjZ4L05FZFFmcE1IbDhMTlp5M1dDRXlo?=
 =?utf-8?B?L3QrU2xBd1loNjYvNEFiZmR1SHM2VzJhaS82RkhNRlFsOElIOWdJSlBqanRU?=
 =?utf-8?B?cXRkMHJiUnloQ2J0YlVVQTJPQjdmTlJ1K0pGSTF6cUdXYVZYejcvZFk3WkZJ?=
 =?utf-8?B?NHZSaTU0bUhtVk1rTExxeTlKWE4wY2I3QVUyM0w3ZFYwRlF0aW50L3hjSlpT?=
 =?utf-8?B?M2VuK2kyb3JOSkpKZXR1YkpvbkhTeUx4SmxrVXJNZXIxdERFSDh4T1hnT0R0?=
 =?utf-8?B?d1ZlQ2hmdmMxR1lkeEpMQjZpZE5LQkE5Vnc0VEdjT0pKTTVPaDdyQk9FUXMy?=
 =?utf-8?Q?ura4GJLcq6Ps4pDyer?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5011a373-d196-4714-039f-08d9ab04167e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 02:27:09.3482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilzgeN5DCt6M3RjhBiYScqs9iznmGI5rcYAcEHaoN4idT3RzrppA8LVdRPPl7ficceCot0sE9DIyLte/38xdG13PAFqBalwUvo7uZGx3DZHVdwA731qpM2mIMzhbCc8e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1979
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3MQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxOSwgMjAyMSA0OjA0IEFN
DQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIFR1ZSwgTm92IDE2LCAyMDIxIGF0IDg6
NDIgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgaWRlbnRpZnlpbmcgdGhlIFItQ2FyIFM0
LTggKFI4QTc3OUYwKSBTb0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hp
bW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9y
IHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZw0K
PiA+ICsrKyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZw0KPiA+IEBAIC0yNTYsNiArMjU2
LDEzIEBAIGNvbmZpZyBBUkNIX1I4QTc3OUEwDQo+ID4gICAgICAgICBoZWxwDQo+ID4gICAgICAg
ICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciB0aGUgUmVuZXNhcyBSLUNhciBWM1UgU29DLg0K
PiA+DQo+ID4gK2NvbmZpZyBBUkNIX1I4QTc3OUYwDQo+ID4gKyAgICAgICBib29sICJBUk02NCBQ
bGF0Zm9ybSBzdXBwb3J0IGZvciBSLUNhciBTNC04Ig0KPiA+ICsgICAgICAgc2VsZWN0IEFSQ0hf
UkNBUl9HRU4zDQo+ID4gKyAgICAgICBzZWxlY3QgU1lTQ19SOEE3NzlGMA0KPiA+ICsgICAgICAg
aGVscA0KPiA+ICsgICAgICAgICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgdGhlIFJlbmVzYXMg
Ui1DYXIgUzQtOCBTb0MuDQo+ID4gKw0KPiANCj4gUGxlYXNlIGtlZXAgc29ydCBvcmRlciAoYWxw
aGFiZXRpY2FsLCBub3QgYnkgcGFydCBudW1iZXIpLg0KDQpJJ20gc29ycnkuIEkgZGlkbid0IHJl
YWxpemVkIHRoYXQuIEknbGwgZml4IGl0IGluIHYyLg0KDQo+ID4gIGNvbmZpZyBBUkNIX1I4QTc3
NEMwDQo+ID4gICAgICAgICBib29sICJBUk02NCBQbGF0Zm9ybSBzdXBwb3J0IGZvciBSWi9HMkUi
DQo+ID4gICAgICAgICBzZWxlY3QgQVJDSF9SQ0FSX0dFTjMNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zb2MvcmVuZXNhcy9yZW5lc2FzLXNvYy5jIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9yZW5l
c2FzLXNvYy5jDQo+ID4gaW5kZXggNzk2MWIwYmUxODUwLi44NTdhNDJhODI3NDcgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9zb2MvcmVuZXNhcy9yZW5lc2FzLXNvYy5jDQo+ID4gKysrIGIvZHJp
dmVycy9zb2MvcmVuZXNhcy9yZW5lc2FzLXNvYy5jDQo+ID4gQEAgLTMzLDYgKzMzLDExIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVuZXNhc19mYW1pbHkgZmFtX3JjYXJfZ2VuMyBfX2luaXRjb25z
dCBfX21heWJlX3VudXNlZCA9IHsNCj4gPiAgICAgICAgIC5yZWcgICAgPSAweGZmZjAwMDQ0LCAg
ICAgICAgICAgLyogUFJSIChQcm9kdWN0IFJlZ2lzdGVyKSAqLw0KPiA+ICB9Ow0KPiA+DQo+ID4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVuZXNhc19mYW1pbHkgZmFtX3JjYXJfZ2VuNCBfX2luaXRj
b25zdCBfX21heWJlX3VudXNlZCA9IHsNCj4gPiArICAgICAgIC5uYW1lICAgPSAiUi1DYXIgR2Vu
NCIsDQo+ID4gKyAgICAgICAucmVnICAgID0gMHhmZmYwMDA0NCwgICAgICAgICAgIC8qIFBSUiAo
UHJvZHVjdCBSZWdpc3RlcikgKi8NCj4gDQo+IFBsZWFzZSBkcm9wICIucmVnIiwgd2hpY2ggaXMg
b25seSBtZWFudCBmb3IgZXhpc3RpbmcgU29Dcy4NCj4gRm9yIG5ldyBTb0NzLCB3ZSByZWx5IG9u
IHRoZSBwcmVzZW5jZSBvZiBhICJyZW5lc2FzLHByciIgbm9kZSBpbiBEVC4NCg0KSSBnb3QgaXQu
IEknbGwgZml4IGl0IGluIHYyLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0K
DQo=
