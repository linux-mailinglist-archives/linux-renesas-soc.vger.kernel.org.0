Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8453245883
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Aug 2020 18:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbgHPQW1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Aug 2020 12:22:27 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:28386
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726339AbgHPQWX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Aug 2020 12:22:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4R2rbx2LziWrdnCehRZqrMrxpgTjPlsLMWNPJntK42Sl4wMaIjs7dreM5N/qNCMWnxxjaCKiVvnEWeMLJxKAw0gN0oQm7Rqltoz+lHV43ESFr0zLenHHmuPJe+hmSjWyw43CSSZNkwoFoYUOdnomQYmfGlyysudbSVmB3E68NMLl05nifKny+Xl0uLJDqYb9LOq8vDGHXp7DL+K4mQjFkIdPJNbl6LOE8LHVmTzl2A1ldz9GnBQpmhIcL+1wXuZTngXcbZnkJsiUQRo4CiBmhUEXskOyE6HdqroJJGz60txWEemVqx+ST1ZcBk4rTPJY8iqNtrif0fRbtrhx68Cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DssrzKZJN1ugHyj0K/JOnP74iuSzT1A3VeEyopm9Oe8=;
 b=LUllxQ/Boo86zejM6wvPsRuXWiDZzzUMrDcYNHuf2ja3whLwQ+qUoKo/KgffJvSOQbAJ2nDvi9EVnZXp2BuC/T8aswXONhgttxwtdH6GCyD2YwUDEhWrJhv9uduL+V9Jbf2iSO+/rLaRp7iaYalrYmDq1NyL9OioJTY8b7E0yTYoJnBjkHdUD2t0xLKgLzAZO9TuGCnr+/R7Kiptu3BCBIoC+D+rHGAFVfRuBrhduQACu1DEJdoqHyd+3Sh/OutcdyKEgUI85+5FrU22f+GScwZ8HebDHOkF4B52BX+7nOuv1CsXSQL4tROgjB9vQZ+rcG3Rq8+g8g3Qs7uNxfBiUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DssrzKZJN1ugHyj0K/JOnP74iuSzT1A3VeEyopm9Oe8=;
 b=L7ezXWASSEddFKwVQgg+T+1erGq7yg27MMwx54u88bQi01pr39HgG9kZhKOxfWmF5W2gaU93nq3G8G0EfeB9+T0VPgvYLLB4TwbxR6oKTh+wP74lqk/p3j2Q+s/obNyXGLNPUt3kgMYh/rdbTJIpKkgiZOlCxBH+fldqtr8pbMA=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSBPR01MB2712.jpnprd01.prod.outlook.com (2603:1096:604:18::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Sun, 16 Aug
 2020 16:22:17 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::cdbe:6988:b51c:51a3]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::cdbe:6988:b51c:51a3%6]) with mapi id 15.20.3283.026; Sun, 16 Aug 2020
 16:22:17 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hao Bui <hao.bui.yg@renesas.com>,
        KAZUMI HARADA <kazumi.harada.rh@renesas.com>,
        Sasha Levin <sashal@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Rob Landley <rob@landley.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: RE: [PATCH] serial: sh-sci: Make sure status register SCxSR is read
 in correct sequence
Thread-Topic: [PATCH] serial: sh-sci: Make sure status register SCxSR is read
 in correct sequence
Thread-Index: AQHWBGQFlOy9yMInX0ilblriC0l6Bqhi1j+AgAAFAPCAAWJFgIABfTOAgABCHYCAFD9cgIC+WUmAgAM0JMA=
Date:   Sun, 16 Aug 2020 16:22:17 +0000
Message-ID: <OSBPR01MB50485F5DA2F82E455DCA6B56AA5E0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <1585333048-31828-1-git-send-email-kazuhiro.fujita.jg@renesas.com>
 <CAMuHMdW+u5r6zyxFJsVzj21BYDrKCr=Q6Ojk5VeN+mkhvXX9Jw@mail.gmail.com>
 <OSBPR01MB3590E3D12546BC6711CEB542AAC80@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <CAMuHMdXmfQ0x7mCZ-E7OPQFv2z-=mFDT20hJ2_JKax=OePB8eA@mail.gmail.com>
 <CA+V-a8vPn_z_j1Vwr_1F=dCw8H=g5UMWvWxgRqBeVR7dzHPz8Q@mail.gmail.com>
 <CAMuHMdWc9q9NjQuAuy5M=v_x=i8XxVg5JZHswjvPsgNzhHfO0w@mail.gmail.com>
 <CAMuHMdUyV58t3eihBJv2xex5gW1Oef37Jo3FHoJstU=SspmpHA@mail.gmail.com>
 <CAMuHMdU0EiQuk_bWx1yrmbBTXg8mL-PeN2=P61xQ5Ucb5QmYYg@mail.gmail.com>
In-Reply-To: <CAMuHMdU0EiQuk_bWx1yrmbBTXg8mL-PeN2=P61xQ5Ucb5QmYYg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 77ef32a5-8321-44f4-0298-08d842008b44
x-ms-traffictypediagnostic: OSBPR01MB2712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB27123A94EA333553D1B61416AA5E0@OSBPR01MB2712.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NHhT3CjtjQvy5DKbgMr6Y5eprpAUZP79o0IF4dRN2A03RsnW6xuhV14zoABg6pRI044xqSxdMFW0WgO0MM1PETfmgGGx9fMKwIYVVTYxaJy0FeFNIYWs2ubv96+0Jbr8+mr1Sp8RGRSO/PkTz9lNGc+o4p9emJsz7YlWMkyYJmRGxRI3QmOFxWGGf9VfdOwAsaXLaQ0bcUnsWCiQlJrAdHyTPNZ6uAfdj3V+Npq8gS0WGIbXd2Rj40QpnaVXy1LKAckaDT0m9U1I4ys/h6K68gx5F7iIq2DGKhv4m8AZiEw/1d6aammuxmjK3k5Cur2DgZMLs+gw0bXbmwt1VL+7jw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(376002)(396003)(136003)(33656002)(7696005)(6506007)(8936002)(53546011)(76116006)(478600001)(186003)(52536014)(4326008)(7416002)(66946007)(86362001)(26005)(8676002)(71200400001)(83380400001)(110136005)(5660300002)(54906003)(2906002)(316002)(55016002)(66476007)(66556008)(9686003)(66446008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ZYLuT1u8Qf4YbbRcPSJBlNJKfTfUM+Qy0eAmEHnMDxRTKwJ+hezoXzZR1CiPx2q5RLMukdSNV6VeLsI6zQHg1bu0Yok2uNFnnIDSeioK4kN/M+/av3Hjc70XfFeLrXqGVKP1NjsZW3qTfsj56KIeP8sq7/98ss3pqHunNpKk2fb99pwb5PvN+8mwX06VmTSMw98zNXlFUTgXJT8ta7m2vwx5GmJKjh3S8uW5vXMAxA0nayU5Qudzc62UcwjVdUv9iYq3dZIDjXDae+u6FcyzfvuUCcnyy3xfIpOB+5xL29UrAlsF3mT7SjjTq8DTBIdSpJR+ZOuZq2NaddDeyikgblgks/enHXLCNLnjF6cLm47oWlIaDd2Be4OnctMvq95HIKYAa+ZKbqnC4kcfEEUPxyN0GuR27rHSVJ3zQoqjRcfeOgJze9fBL+7khTqYIc+MwJkxivuYEUAVl0M/B2BKIt/FpE7IaKLsT4rKg8Cn6+/YahOMq/Wc5Wrys4kZGv4TtI/zv8/kaFRIjCDWwKEvKvp1NBLXGvZdlrSMTRtOuwLX/4na5HyxfSMi/XiKCCw70sKo6jSmNb8RO2BqKNLKuJNx50h+oIv6uZjkCwvLrHEZFMi6pfh/KvzzBaceXDerHeBxNLahzOJnAFP3xbVbXw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ef32a5-8321-44f4-0298-08d842008b44
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2020 16:22:17.4849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnpv6D/nUTTdzEf1uM0Bb4OCH6o6KOqyROszgTrgCXSRbwGy8wrzLxgkFm8VjN/0eQlm8MZo8EvbY75a9g0xos3JYRQHLtfYhicUjMq7eUc89HuIc5HZFJJ8Ce6CIPb5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2712
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxNCBBdWd1c3QgMjAyMCAxNjoyNQ0KPiBU
bzogTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBDYzogUHJh
Ymhha2FyIE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+OyBLYXp1aGlybyBGdWppdGEgPGthenVoaXJvLmZ1aml0YS5qZ0ByZW5lc2FzLmNvbT47IEdy
ZWcgS3JvYWgtDQo+IEhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgSmlyaSBT
bGFieSA8anNsYWJ5QHN1c2UuY29tPjsgb3BlbiBsaXN0OlNFUklBTCBEUklWRVJTIDxsaW51eC1z
ZXJpYWxAdmdlci5rZXJuZWwub3JnPjsgTGludXgtDQo+IFJlbmVzYXMgPGxpbnV4LXJlbmVzYXMt
c29jQHZnZXIua2VybmVsLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBIYW8gQnVpDQo+IDxoYW8uYnVpLnlnQHJlbmVzYXMuY29t
PjsgS0FaVU1JIEhBUkFEQSA8a2F6dW1pLmhhcmFkYS5yaEByZW5lc2FzLmNvbT47IFNhc2hhIExl
dmluIDxzYXNoYWxAa2VybmVsLm9yZz47IENocmlzIEJyYW5kdA0KPiA8Q2hyaXMuQnJhbmR0QHJl
bmVzYXMuY29tPjsgTWFnbnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IExpbnV4LXNo
IGxpc3QgPGxpbnV4LXNoQHZnZXIua2VybmVsLm9yZz47IFJvYiBMYW5kbGV5DQo+IDxyb2JAbGFu
ZGxleS5uZXQ+OyBKb2huIFBhdWwgQWRyaWFuIEdsYXViaXR6IDxnbGF1Yml0ekBwaHlzaWsuZnUt
YmVybGluLmRlPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBzZXJpYWw6IHNoLXNjaTogTWFrZSBz
dXJlIHN0YXR1cyByZWdpc3RlciBTQ3hTUiBpcyByZWFkIGluIGNvcnJlY3Qgc2VxdWVuY2UNCj4N
Cj4gT24gV2VkLCBBcHIgMTUsIDIwMjAgYXQgMjozNiBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToNCj4gPiBPbiBUaHUsIEFwciAyLCAyMDIwIGF0IDU6
MjQgUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+
ID4gPiBPbiBUaHUsIEFwciAyLCAyMDIwIGF0IDE6MjggUE0gTGFkLCBQcmFiaGFrYXINCj4gPiA+
IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPiA+IE9uIFdlZCwgQXBy
IDEsIDIwMjAgYXQgMTo0MyBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsu
b3JnPiB3cm90ZToNCj4gPiA+ID4gPiBPbiBUdWUsIE1hciAzMSwgMjAyMCBhdCA1OjU4IFBNIFBy
YWJoYWthciBNYWhhZGV2IExhZA0KPiA+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpA
YnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gPiA+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPg0KPiA+ID4gPiA+ID4gPiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCA3OjE3
IFBNIEthenVoaXJvIEZ1aml0YQ0KPiA+ID4gPiA+ID4gPiA8a2F6dWhpcm8uZnVqaXRhLmpnQHJl
bmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBGb3IgU0NJRiBhbmQgSFNDSUYgaW50
ZXJmYWNlcyB0aGUgU0N4U1IgcmVnaXN0ZXIgaG9sZHMgdGhlIHN0YXR1cyBvZg0KPiA+ID4gPiA+
ID4gPiA+IGRhdGEgdGhhdCBpcyB0byBiZSByZWFkIG5leHQgZnJvbSBTQ3hSRFIgcmVnaXN0ZXIs
IEJ1dCB3aGVyZSBhcyBmb3INCj4gPiA+ID4gPiA+ID4gPiBTQ0lGQSBhbmQgU0NJRkIgaW50ZXJm
YWNlcyBTQ3hTUiByZWdpc3RlciBob2xkcyBzdGF0dXMgb2YgZGF0YSB0aGF0IGlzDQo+ID4gPiA+
ID4gPiA+ID4gcHJldmlvdXNseSByZWFkIGZyb20gU0N4UkRSIHJlZ2lzdGVyLg0KPiA+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBtYWtlcyBzdXJlIHRoZSBzdGF0dXMg
cmVnaXN0ZXIgaXMgcmVhZCBkZXBlbmRpbmcgb24gdGhlIHBvcnQNCj4gPiA+ID4gPiA+ID4gPiB0
eXBlcyBzbyB0aGF0IGVycm9ycyBhcmUgY2F1Z2h0IGFjY29yZGluZ2x5Lg0KPiA+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPiA+ID4g
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEthenVoaXJvIEZ1aml0YSA8a2F6dWhpcm8uZnVqaXRh
LmpnQHJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEhhbyBCdWkg
PGhhby5idWkueWdAcmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
S0FaVU1JIEhBUkFEQSA8a2F6dW1pLmhhcmFkYS5yaEByZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQu
cmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gTmV2ZXJ0aGVsZXNz
LCB0aGlzIHBhdGNoIHdpbGwgbmVlZCBzb21lIHRlc3Rpbmcgb24gdmFyaW91cyBoYXJkd2FyZS4N
Cj4gPiA+ID4gPiA+ID4gRG8geW91IGhhdmUgYSB0ZXN0IGNhc2UgdG8gdmVyaWZ5IHRoZSBicm9r
ZW4vZml4ZWQgYmVoYXZpb3I/DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBBZ3JlZWQsIGl0
cyBiZWVuIHRlc3RlZCBvbiBSWi9HMnggJiBSWi9HMXggIGJ5IGRvaW5nIGEgbG9vcGJhY2sgdGVz
dCwgY29uZmlndXJlIG9uZSBpbnRlcmZhY2UgYXMgQ1M4IG1vZGUoOC1iaXRzIGRhdGEsIE5vIHBh
cml0eSkNCj4gYW5kIG90aGVyIGFzIENTNyBtb2RlICg3LWJpdHMgZGF0YSwgMS1iaXQgUGFyaXR5
KSBhbmQgcGFyaXR5IGVycm9ycyBzaG91bGQgYmUgZGV0ZWN0ZWQuDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBUaGlzIGNhbiBlYXNpbHkgYmUgdGVzdGVkIG9uIHRoZSBjb25zb2xlLiAgQmFzaWMgdGVz
dGluZyBjYW4gZXZlbiBiZQ0KPiA+ID4gPiA+IGRvbmUgd2l0aCBhbiB1bm1vZGlmaWVkIGtlcm5l
bCwgYXMgdGhlcmUgaXMgYWxyZWFkeSBhICJwYXJpdHkgZXJyb3IiDQo+ID4gPiA+ID4gbm90aWNl
IG1lc3NhZ2UgaW4gdGhlIGRyaXZlci4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEVuYWJsZSBldmVu
IHBhcml0eSBvbiB0aGUgY29uc29sZToNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICQgc3R0eSBldmVu
cA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gKHVzZSAib2RkcCIgZm9yIG9kZCBwYXJpdHksIGFuZCBp
bnZlcnQgYWxsIGJlbG93KQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVHlwaW5nIGUuZy4gYSBzaW5n
bGUgInAiIHNob3VsZCB0cmlnZ2VyIGEgcGFyaXR5IGVycm9yLg0KPiA+ID4gPiA+IFR5cGluZyAi
byIgc2hvdWxkbid0Lg0KPiA+ID4gPiA+IFdpdGhvdXQgdGhpcyBwYXRjaCwgbm8gcGFyaXR5IGVy
cm9yIGlzIGRldGVjdGVkIG9uIFNDSUYuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBMaWtld2lzZSwg
cGFzdGluZyBhIHNlcXVlbmNlIG9mICJwIiBjaGFyYWN0ZXJzIHNob3VsZCB0cmlnZ2VyIGEgbG90
IG9mDQo+ID4gPiA+ID4gcGFyaXR5IGVycm9ycywgIm8iIHNob3VsZG4ndC4NCj4gPiA+ID4gPiBX
aXRob3V0IHRoaXMgcGF0Y2gsIHBhcml0eSBlcnJvcnMgYXJlIGRldGVjdGVkIG9uIFNDSUYsIGV4
Y2VwdCBmb3IgdGhlDQo+ID4gPiA+ID4gZmlyc3QgY2hhcmFjdGVyLg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gRm9yIG1vcmUgYWR2YW5jZWQgdGVzdGluZywgbWFrZSB0aGUgZm9sbG93aW5nIGNoYW5n
ZSB0byB0aGUgZHJpdmVyOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLSBkZXZfbm90aWNlKHBvcnQt
PmRldiwgInBhcml0eSBlcnJvclxuIik7DQo+ID4gPiA+ID4gKyBkZXZfbm90aWNlKHBvcnQtPmRl
diwgInBhcml0eSBlcnJvciBmb3IgY2hhciAweCUwMnggaHdlaWdodCAldVxuIiwNCj4gPiA+ID4g
PiBjLCBod2VpZ2h0OChjKSk7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBQYXN0aW5nIGFuIGFsdGVy
bmF0aW5nIHNlcXVlbmNlIG9mICJwIiBhbmQgIm8iIGNoYXJhY3RlcnMgc2hvdWxkIHRyaWdnZXIN
Cj4gPiA+ID4gPiBwYXJpdHkgZXJyb3JzIGZvciB0aGUgInAiIGNoYXJhY3RlcnMuDQo+ID4gPiA+
ID4gV2l0aG91dCB0aGlzIHBhdGNoLCB0aGV5IGFyZSB0cmlnZ2VyZWQgZm9yIHRoZSAibyIgY2hh
cmFjdGVycyBpbnN0ZWFkLg0KPiA+ID4gPiA+DQo+ID4gPiA+IFRoYW5rIHlvdSB0aGF0IG1ha2Vz
IGxpZmUgZWFzaWVyLg0KPiA+ID4gPg0KPiA+ID4gPiA+IFdpdGggdGhpcyBwYXRjaCwgdGhlIGlz
c3VlcyBhYm92ZSBhcmUgZml4ZWQgb24gU0NJRi4NCj4gPiA+ID4gPiBUaGlzIGhhcyBiZWVuIHZl
cmlmaWVkIG9uOg0KPiA+ID4gPiA+ICAgMS4gU0NJRiBvbiBSLUNhciBHZW4gMiwNCj4gPiA+ID4g
PiAgIDIuIFNDSUYgb24gUi1DYXIgR2VuMw0KPiA+ID4gPiA+ICAgMy4gU0NJRiBvbiBSWi9BMUgs
DQo+ID4gPiA+ID4gICA0LiBTQ0lGIG9uIFJaL0EyTS4NCj4gPg0KPiA+ID4gSWYgSSBkaXNhYmxl
IERNQSBmb3IgSFNDSUYxIGluIHRoZSAuZHRzaSwgcGFyaXR5IGVycm9ycyBhcmUgZGV0ZWN0ZWQN
Cj4gPiA+IGFzIGV4cGVjdGVkLg0KPiA+DQo+ID4gU28gSFNDSUYgb24gUi1DYXIgR2VuMyBpcyBh
ZmZlY3RlZCwgYW5kIGZpeGVkIGJ5IHRoaXMgcGF0Y2guDQo+ID4NCj4gPiA+IEhlbmNlIHRoZSBk
cml2ZXIgZG9lcyBub3Qgc3VwcG9ydCBwYXJpdHkgY2hlY2tpbmcgd2hlbiBETUEgaXMgZW5hYmxl
ZC4NCj4gPiA+IEkgYWxzbyB0aGluayBpdCdzIG5vdCBlYXN5IHRvIGFkZCBzdXBwb3J0IGZvciB0
aGF0LCBpZiBwb3NzaWJsZSBhdCBhbGwuDQo+ID4gPg0KPiA+ID4gPiA+IEkgaGF2ZW4ndCB0ZXN0
ZWQgaXQgeWV0IG9uOg0KPiA+ID4gPiA+ICAgMS4gU0NJRkIgb24gU0gvUi1Nb2JpbGUgKG5lZWRz
IHdpcmluZyB1cCksDQo+ID4NCj4gPiBTQ0lGQiBvbiBSLU1vYmlsZSBBMSBpcyBub3QgYWZmZWN0
ZWQsIGFuZCB3b3JrcyBiZWZvcmUvYWZ0ZXIsIGFzIGV4cGVjdGVkLg0KPiA+DQo+ID4gPiA+ID4g
ICAyLiBTQ0lGQSwgU0NJRkIsIGFuZCBIU0NJRiBvbiBSLUNhciBHZW4yIChuZWVkcyB3aXJpbmcg
dXApLA0KPiA+DQo+ID4gU2FtZSBmb3IgU0NJRkEsIFNDSUZCIG9uIFItQ2FyIE0yLVcuDQo+ID4N
Cj4gPiBIU0NJRiBvbiBSLUNhciBNMi1XIGlzIGFmZmVjdGVkLCBhbmQgZml4ZWQgYnkgdGhpcyBw
YXRjaC4NCj4gPg0KPiA+IFRoaXMgbWVhbnMgdGhlIG1vZGVybiBwbGF0Zm9ybXMgd2UgY2FyZSBh
Ym91dCBhcmUgaGFuZGxlZCBmaW5lLCBzbw0KPiA+IFRlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPg0KPiA+IFRoYXQgbGVhdmVzIHVzIHdp
dGggdGVzdGluZyBvbiBhIGZldyBsZWdhY3kgcGxhdGZvcm1zLi4uDQo+ID4NCj4gPiA+ID4gPiAg
IDMuIChIKVNDSUYgb24gUi1DYXIgR2VuMSAocmVtb3RlIGJvYXJkcyB1bmFjY2Vzc2libGUgYXQg
dGhlIG1vbWVudCksDQo+ID4gPiA+ID4gICA0LiBTdXBlckggKG9ubHkgcmVtb3RlIE1pZ28tUiBh
dmFpbGFibGUsIGJ1dCB1bmFjY2Vzc2libGUpLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSBjYW4g
dGVzdCAxIGFuZCAyIChhbmQgcGVyaGFwcyAzIGFuZCA0KSBsYXRlciwgaWYgbmVlZGVkLg0KPiA+
ID4gPiBwcm9iYWJseSB0ZXN0aW5nIHRoaXMgb24gU3VwZXJIIGlzIGdvbm5hIGJlIGEgcGFpbiBk
dWUgdG8gbGFjayBvZg0KPiA+ID4gPiBoYXJkd2FyZSBhdmFpbGFiaWxpdHksDQo+ID4gPiA+IChp
dCBuZWVkcyB0byBiZSB0ZXN0ZWQgb24gMTkgcGxhdGZvcm1zKQ0KPiA+ID4gPiBob3cgYWJvdXQg
I2lmZGVmIENPTkZJR19BUkNIX1JFTkVTQVMgfHwgQ09ORklHX0g4MzAwIGFuZCB0aGUgZml4ID8N
Cj4gPiA+DQo+ID4gPiBJIGhhZCBhIGxvb2sgYXQgYSBmZXcgU3VwZXJIIGRvY3Mgdy5yLnQuIGZy
YW1pbmcvcGFyaXR5IGVycm9yIGJlaGF2aW9yOg0KPiA+ID4gICAtIFNDSUYoQSkgb24gU0g3NzI0
OiBzaW1pbGFyIHRvIFItQ2FyIEdlbjIsDQo+ID4gPiAgIC0gSChTQ0lGKSBvbiBTSDc3MzQ6IHNh
bWUgYXMgb24gUi1DYXIgR2VuMiwNCj4gPiA+ICAgLSBTQ0lGIG9uIFNINzc1MTogY29uZmxpY3Qg
YmV0d2VlbiBzdGF0dXMgcmVnaXN0ZXIgKCJ0byBiZSByZWFkIG5leHQiKQ0KPiA+ID4gICAgIGFu
ZCBmbG93Y2hhcnQgKCJyZWFkIGZyb20iKS4NCj4NCj4gRlRSLCBJIGdhdmUgaXQgYSB0cnkgb24g
dGhlIFNINzc1MVItYmFzZWQgSS1PIERBVEEgVVNMLTVQIGFrYSBMYW5kaXNrOg0KPiBTQ0lGIGlz
IGFmZmVjdGVkLCBhbmQgZml4ZWQgYnkgY29tbWl0IDNkYzRkYjM2NjIzNjYzMDYgKCJzZXJpYWw6
IHNoLXNjaToNCj4gTWFrZSBzdXJlIHN0YXR1cyByZWdpc3RlciBTQ3hTUiBpcyByZWFkIGluIGNv
cnJlY3Qgc2VxdWVuY2UiKS4NCj4NClRoYW5rIHlvdSBHZWVydC4NCg0KQ2hlZXJzLA0KUHJhYmhh
a2FyDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1ZWhy
ZXIvUHJlc2lkZW50OiBDYXJzdGVuIEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVnaXN0
ZXJlZCBvZmZpY2U6IER1ZXNzZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVlc3Nl
bGRvcmYsIEdlcm1hbnksIEhhbmRlbHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBEdWVz
c2VsZG9yZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46IERFIDEx
OTM1MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
