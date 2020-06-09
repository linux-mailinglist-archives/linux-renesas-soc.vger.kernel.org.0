Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABA41F3821
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 12:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728751AbgFIK3b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 06:29:31 -0400
Received: from mail-eopbgr1310115.outbound.protection.outlook.com ([40.107.131.115]:28064
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726116AbgFIK3a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 06:29:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Un+mBfU4T6LPKkre7WH1miUbvY5mU3TgLMvmOkFj6qwdqh6gkTXmr9a+57R7VoMb0Jww+tuygKqw3Ek3DIuumH2VmXCNtir7Bd0P8CWGPbm952QKI4xEFHl5gB7KpGrm0apfqggHqiNX2OWuEoGJdCA6torTriafYVdBeYeniuL9qanoExP95A1/vUMtRvgWOKdzTqhyWaC9Ho+zbccXOPvjBpBZxH22IS+b3Rc2omqQtTbAIEzVZztiMoZcsyW8YPszpCa0ObuyxaA6/QhFQtGognMekjPs5Z4ouWj10+UxYOvz9YYZ6X627CywWE8cRm0dgySGzaiSMWXX5Nt93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhhWBAyYQTkXJN4ieOdlQck29mKUTTgnsbdr/hpQaRE=;
 b=EkJi3/rS043197/Ay1JpQf9HsXzlnWniIqKrah6RjF8Z/bHYCqNNmuz5Wuo26fauPrcNgQhXH1Hgi9Tm0faAjfnMuziIxZ7ZCo2Momr4Og4a7jRB+f6nm3aXoSBp1NeVk8gXjv1X986r+pMecemBdxhmrPl+mqtVfYWcX8jMAuWQezTy4KZm/3x++HQKV+25hKvkBHs12G4TZ9Lm0PgPuXDCOvlyfDTylvN0y/UmMxyDhCn78PuTQ0FBjQrEL3K+8AREE1/72oFDE8VaCjoYdfALMTvdIqjlsX99QA7t7t32NoPR2cbNBUUAcwnEvLXolqmuTUyY1FzvcSP7fpV7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhhWBAyYQTkXJN4ieOdlQck29mKUTTgnsbdr/hpQaRE=;
 b=sJ6pJotgH2e0jW5s2JPyAK5dvH8rLKWREPcHEhH+pNeR04RRZWGDKbi1syHwFYxlnFijHjAUFOaJDtOu+HknvhWcUH/U7RjW9fxQeqGbMsjZpVIxe/XdkAIXiaEWfBaTTEVy/kNxwJ3NOTo80J2O7K51nYmhiYFKofYtcsUXJmc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2762.jpnprd01.prod.outlook.com (2603:1096:404:6d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 10:29:24 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 10:29:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC
 Suspend-to-RAM
Thread-Topic: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC
 Suspend-to-RAM
Thread-Index: AQHWLdFW4LWb0SXvbUyfh/OMYFhgGajIc4JwgAYKZYCAAB5UIIAAHL+AgAAOPwCAACWGAIABRKng
Date:   Tue, 9 Jun 2020 10:29:24 +0000
Message-ID: <TY2PR01MB3692B6260A4F95AFD2AB60AFD8820@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB3692FD4D8058D5EEFC761D47D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAPDyKFptcUJj3u2LChz+tk61u8WcOrpaZLmDcj5Xb3HNuJv_qw@mail.gmail.com>
 <TY2PR01MB3692FAFE6FCA89538FA3AC4DD8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAPDyKFrcENub_NCP5s0v+3A09O55qGrK+gNrVswYjdqoLzPVzA@mail.gmail.com>
 <CAMuHMdXK2QkxMr3Lh6JnAh9RzHm4-CwpO_GLjD0+Vh-cM5a7nw@mail.gmail.com>
 <CAPDyKFrHHJE7zc+Mz5ddZ4iy6AA-K5ba8-rmsdzW1C6fGSWgeQ@mail.gmail.com>
In-Reply-To: <CAPDyKFrHHJE7zc+Mz5ddZ4iy6AA-K5ba8-rmsdzW1C6fGSWgeQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c45caac1-8f39-4835-b9d7-08d80c5ffac9
x-ms-traffictypediagnostic: TY2PR01MB2762:
x-microsoft-antispam-prvs: <TY2PR01MB276207E543302B3699694129D8820@TY2PR01MB2762.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3OxuWBv4yGMJLuIVtuQeZcISZLAxiTX7FouTwggKY8RaFdHYnvfiF5zsReK/4vkDHQJxRSw7l2ty23H8axLUiIkBipAn0fwTJl6qQSYhxFgEwwTaMpcAtbsSdQVlcBxYeAtvb56B2HTOUG77sVHb7xprRJFkPOSIj5lAcvx/gTRNsJ7QndIJjAOqkY6oSS2YnRiuG8/jL2krxojMmZ5glWIKnr49SJCzK+AWsDf5WAjGRoszelvnVS2HOFY9P2wSFOOp8kD/WJ3Nfi5P3IZM+mbc/UQ2wlH6RaHudNu4ocmCDPu8d6RT3I5dnS8/xDNT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(15650500001)(52536014)(86362001)(53546011)(6506007)(83380400001)(55236004)(76116006)(5660300002)(71200400001)(66446008)(186003)(26005)(64756008)(66946007)(66476007)(66556008)(8676002)(7696005)(316002)(54906003)(33656002)(4326008)(8936002)(478600001)(110136005)(2906002)(9686003)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: SD9/xkEQAwfYcR4pD8As34yMC73tFM/3RaOQaZqnf++tQCH5P0qgjupXWZiHkhmiJLFi+d60kIoEdbXcbvum4/mLjxd0VnwxGfLwsnsXDCaXEMM2hIQm9SkdEbGAZAcXSF5tAqLJL07I0tEk9Y2DwbtWDOYmhW/2PAW4qyRV6fPZs1b+c+UCXKcliZehLM/NZDf9IUssWsgj8G+uMpWHP+kI3rJY8GcR3WQDngknqGHzCX6TcZysXmIq/fuTEpF7MszeGWDbu7mK0mGw3PmgM3Z9mobgA6xwGjbgeQEYmU0oJDzN/7tlb79ven8rp30Kx70jZJDuzAfTNEOvOjszmYo0ij8aIlwMiKYoU9QKazvpIKaJqrTdPof8ix6X3T3j/DyjiiVG9OH6ATNtqQxUiDBORjZfndFMG53dB7Wmv7GlJBN53S4ru05yQXy4xdOhAl0wUgrVy+UGpLcGlKiPIGuKUlbdV9ZKw4xcADNjnUp3QKMpb6skYmaS2u/UfUcr
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45caac1-8f39-4835-b9d7-08d80c5ffac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 10:29:24.0786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EjGEGbVdZg+JzJRCsJhajONFVPXwrCsKO863tK6XPMrGZeVHnYy6gcUMMk+1+SxO27kd8+/5nTSeY8MTdKduQUMr4+1a7KzIYybCa2JO9+uB7jyQ3KLe/qd5ldgW/sqZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2762
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxmLA0KDQo+IEZyb206IFVsZiBIYW5zc29uLCBTZW50OiBNb25kYXksIEp1bmUgOCwgMjAy
MCAxMTo1MSBQTQ0KPiANCj4gT24gTW9uLCA4IEp1biAyMDIwIGF0IDE0OjM2LCBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToNCj4gPg0KPiA+IEhpIFVsZiwN
Cj4gPg0KPiA+IE9uIE1vbiwgSnVuIDgsIDIwMjAgYXQgMTo0NyBQTSBVbGYgSGFuc3NvbiA8dWxm
LmhhbnNzb25AbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4gPiBPbiBNb24sIDggSnVuIDIwMjAgYXQg
MTI6MzksIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IFVsZiBIYW5zc29uLCBTZW50OiBNb25k
YXksIEp1bmUgOCwgMjAyMCA1OjE0IFBNDQo+ID4gPiA+ID4gT24gVGh1LCA0IEp1biAyMDIwIGF0
IDE0OjE3LCBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA+ID4gPiA+IDx5b3NoaWhpcm8uc2hpbW9kYS51
aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+IEZyb206IFlvc2hpaGlybyBTaGlt
b2RhLCBTZW50OiBUdWVzZGF5LCBNYXkgMTksIDIwMjAgODozMyBQTQ0KPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiBUaGUgY29tbWl0IDQzMjM1Njc5MzQxNSAoIm1tYzogY29yZTogRW5hYmxl
IHBvd2VyX29mZl9ub3RpZnkgZm9yDQo+ID4gPiA+ID4gPiA+IGVNTUMgc2h1dGRvd24gc2VxdWVu
Y2UiKSBlbmFibGVkIHRoZSBwb3dlciBvZmYgbm90aWZpY2F0aW9uDQo+ID4gPiA+ID4gPiA+IGV2
ZW4gaWYgTU1DX0NBUDJfUE9XRVJPRkZfTk9USUZZIChNTUNfQ0FQMl9GVUxMX1BXUl9DWUNMRSBu
b3cpIGlzDQo+ID4gPiA+ID4gPiA+IG5vdCBzZXQuIEhvd2V2ZXIsIHRoZSBtbWMgY29yZSBsYWNr
cyB0byBpc3N1ZSB0aGUgcG93ZXIgb2ZmDQo+ID4gPiA+ID4gPiA+IG5vdGlmaWNhaXRvbiB3aGVu
IFN1c3BlbmQtdG8te1JBTSxEaXNrfSBoYXBwZW5zIG9uIHRoZSBzeXN0ZW0uDQo+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+IFNvLCBhZGQgU3VzcGVuZC10by1SQU0gc3VwcG9ydCBhdCBmaXJz
dCBiZWNhdXNlIHRoaXMgaXMgZWFzeSB0bw0KPiA+ID4gPiA+ID4gPiBjaGVjayBieSB1c2luZyBw
bV9zdXNwZW5kX3RhcmdldF9zdGF0ZSBjb25kaXRpb24gb24gX21tY19zdXNwZW5kKCkuDQo+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2Rh
IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBJJ2QgbGlrZSB0byBhZGQgbW9yZSBkZXRhaWwgd2h5IHRoaXMgcGF0Y2ggaXMgbmVlZGVk
Lg0KPiA+ID4gPiA+ID4gSSB0aGluayB3ZSBzaG91bGQgdGhpbmsgc29tZSBldmVudHMgKHdoaWNo
IGFyZSBTaHV0ZG93biwgU3VzcGVuZC10by1pZGxlLA0KPiA+ID4gPiA+ID4gU3VzcGVuZC10by1S
QU0pIGZvciB0aGUgUG93ZXIgb2ZmIE5vdGlmaWNhdGlvbiBjb250cm9sLg0KPiA+ID4gPiA+ID4g
SSBkZXNjcmliZWQgdGhlc2UgZXZlbnRzIGxpa2UgYmVsb3cuDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gQXNzdW1wdGlvbiBvZiB0aGUgaG9zdCA6IE1NQ19DQVAyX0ZVTExfUFdSX0NZQ0xFPWZh
bHNlDQo+ID4gPiA+ID4gPiBBc3N1bXB0aW9uIG9mIHRoZSBlTU1DIDogaW4gUE9XRVJFRF9PTg0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IDEpIEV2ZW50ICA6IFNodXRkb3duDQo+ID4gPiA+ID4g
PiAtIHBvd2VyICAgOiBnb2luZyB0byBWQ0M9T0ZGICYgVkNDUT1PRkYNCj4gPiA+ID4gPiA+IC0g
aWRlYWwgICA6IEVpdGhlciBQT1dFUl9PRkZfTE9ORyBvciBQT1dFUl9PRkZfU0hPUlQNCj4gPiA+
ID4gPiA+IC0gY3VycmVudCA6IFBPV0VSX09GRl9MT05HIC0tPiBQZXJmZWN0DQo+ID4gPiA+ID4g
PiAtIFJlbWFya3MgOiB0aGUgY29tbWl0IDQzMjM1Njc5MzQxNQ0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+IDIpIEV2ZW50ICA6IFN1c3BlbmQtdG8tSWRsZQ0KPiA+ID4gPiA+ID4gLSBwb3dlciAg
IDogS2VlcCBWQ0M9T04gJiBWQ0NRPU9ODQo+ID4gPiA+ID4gPiAtIGlkZWFsICAgOiBpc3N1ZSBN
TUNfU0xFRVBfQVdBS0UgYW5kIGtlZXAgdGhlIHBvd2VyIChiZWNhdXNlIHRoZSBob3N0IGNvdWxk
IG5vdCBjaGFuZ2UgVkNDPU9GRikNCj4gPiA+ID4gPiA+IC0gY3VycmVudCA6IGlzc3VlIE1NQ19T
TEVFUF9BV0FLRSBhbmQga2VlcCB0aGUgcG93ZXIgLS0+IFBlcmZlY3QNCj4gPiA+ID4gPiA+IC0g
UmVtYXJrcyA6IElJVUMsIGV2ZW4gaWYgdGhlIGVNTUMgaXMgaW4gUE9XRVJFRF9PTiwgYSBob3N0
IGNhbiBpc3N1ZSBDTUQ1IChzbGVlcCkuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBcyBhIG1hdHRl
ciBvZiBmYWN0LCBWQ0NRICptdXN0KiByZW1haW4gb24gaW4gc2xlZXAgc3RhdGUsIHdoaWxlIFZD
Qw0KPiA+ID4gPiA+IGNhbiBiZSBwb3dlcmVkIG9mZi4NCj4gPiA+ID4NCj4gPiA+ID4gSSBnb3Qg
aXQuDQo+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gMykgRXZlbnQgIDogU3VzcGVu
ZC10by1SQU0NCj4gPiA+ID4gPiA+IC0gcG93ZXIgICA6IGdvaW5nIHRvIFZDQz1PRkYgJiBWQ0NR
PU9GRg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3UgdGhp
bmsgUzJSIHNob3VsZCBiZSB0cmVhdGVkIGRpZmZlcmVudGx5DQo+ID4gPiA+ID4gZnJvbSBTMkk/
IEF0IGxlYXN0IGZyb20gdGhlIE1NQyBzdWJzeXN0ZW0gcG9pbnQgb2YgdmlldywgdGhlcmUgaXMg
bm8NCj4gPiA+ID4gPiBkaWZmZXJlbmNlLiBObz8NCj4gPiA+ID4NCj4gPiA+ID4gT24gbXkgZW52
aXJvbm1lbnQsIFZDQyAmIFZDQ1EgY29uZGl0aW9uIGRpZmZlcnMgbGlrZSBiZWxvdy4NCj4gPiA+
ID4gIFMySTogVkNDPU9OICYgVkNDUT1PTg0KPiA+ID4gPiAgUzJSOiBWQ0M9T0ZGICYgVkNDUT1P
RkYNCj4gPiA+DQo+ID4gPiBDYW4geW91IGV4cGxhaW4gd2h5IGl0IGRpZmZlcnM/IFdobyBpcyBt
YW5hZ2luZyB0aGUgcmVndWxhdG9ycyBhbmQgd2hvDQo+ID4gPiBkZWNpZGVzIHRvIHR1cm4gdGhl
bSBvZmY/DQo+ID4NCj4gPiBUaGUgZmlybXdhcmUgZG9lcywgdGhyb3VnaCBQU0NJIHN5c3RlbSBz
dXNwZW5kLg0KPiA+IEFuZCB3aGF0IGl0IGRvZXMgZXhhY3RseSBpcyBub3Qgc3RhbmRhcmRpemVk
Lg0KPiANCj4gVGhpcyBzb3VuZHMgcmVhbGx5IHdlaXJkLiBFc3BlY2lhbGx5LCB0byBsZXQgUFND
SSBoYW5kbGUgdGhlIFZDQw0KPiByZWd1bGF0b3Igc2VlbXMgd3JvbmcsIHdoaWxlIFBTQ0kgaXMg
YWJvdXQgcG93ZXIgZm9yIENQVXMgYW5kIENQVQ0KPiBjbHVzdGVycyAoYW5kIGNvcnJlc3BvbmRp
bmcgcG93ZXIgcmFpbHMpLg0KPiANCj4gT2ggd2VsbCwgbmV2ZXJtaW5kLg0KPiANCj4gPiBQZXJo
YXBzIHdlIGRvIG5lZWQgYW4gImFybSxwc2NpLXN5c3RlbS1zdXNwZW5kLWlzLXBvd2VyLWRvd24i
WzFdDQo+ID4gRFQgcHJvcGVydHk/DQo+IA0KPiBIbW0uDQo+IA0KPiBJIHdvdWxkbid0IGxpbWl0
IHRoaXMgdG8gUFNDSSwgYnV0IHJhdGhlciBzZWUgdGhpcyBhcyBhIGdlbmVyaWMgRlcgaXNzdWUu
DQo+IA0KPiBJbiBwcmluY2lwbGUsIGl0IHNvdW5kcyB0byBtZSwgbGlrZSB3ZSBuZWVkIHRvIGR5
bmFtaWNhbGx5IGFsbG93IHRoZQ0KPiBtbWMgaG9zdCB0byB1cGRhdGUgTU1DX0NBUDJfRlVMTF9Q
V1JfQ1lDTEUsIGRlcGVuZGluZyBvbiB3aGF0IHN5c3RlbQ0KPiBzdXNwZW5kIG1vZGUgd2UgYXJl
IGFib3V0IHRvIGVudGVyLiBPciBzb21ldGhpbmcgYWxvbmcgdGhvc2UgbGluZXMuDQoNCkkgc2Vl
Lg0KSG93ZXZlciwgSSBoYXZlIG5vIGlkZWEgaG93IHRvIGluZm9ybSB0byBhIGhvc3QgYWJvdXQg
dGhlIEZXIHdpbGwgdHVybg0KdGhlIHBvd2VyIG9mZiBpbiBzdXNwZW5kIG1vZGUgZm9yIG5vdy4u
Lg0KDQpCeSB0aGUgd2F5LCB0aGlzIGlzIGEgd29ya2Fyb3VuZCB0aG91Z2gsIHRvIGF2b2lkIHRo
ZSBpc3N1ZSAoZW50ZXJpbmcNCnNsZWVwIG1vZGUgYW5kIHBvd2VyIG9mZiksIGNvdWxkIHdlIGFk
ZCBhIG5ldyBwcm9wZXJ0eSB0byBhIG1tYyBob3N0Pw0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhp
cm8gU2hpbW9kYQ0KDQo+ID4NCj4gPiA+IFBlcmhhcHMgdGhpcyBpcyBhIHJlZ3VsYXRvci1lbmFi
bGUgdXNhZ2UgY291bnQgcHJvYmxlbT8NCj4gPg0KPiA+IFVuZm9ydHVuYXRlbHkgbm90LiBFbHNl
IHdlIGNvdWxkIGZpeCBpdCA6LSkNCj4gDQo+IEkgc2VlLg0KPiANCj4gWy4uLl0NCj4gDQo+IEtp
bmQgcmVnYXJkcw0KPiBVZmZlDQo=
