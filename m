Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 590CA26245B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 03:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgIIBFJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 21:05:09 -0400
Received: from mail-eopbgr1320119.outbound.protection.outlook.com ([40.107.132.119]:53058
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726369AbgIIBFH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 21:05:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlJD/Oh8D4R+hidp0Itr2/J/HAZsonRdQIxwVs4PWqxEU3aKd3kZtbsPdf0AqiqQm2GHKg2IDkHmnw1nAaj3rRpczbcBQM6j2zAb/8uaIoLqwozaMHbDRtbtZ+yhHlv9G6R+ogz/FvEsc6ajRQ5PTTkXs4HvNBXHF+CFd+FM8pAsjgvGobE+YZJSr/EzM52eYM+5yLKxYagjckG6zsxVe7bA/PVerpaYUS6U3mEz3caCPKPo09o0wfpwBlz5UFYhCkhyBtfQ26gETgqcDDQHlvMCx2I4xhmeq9SM/MFqVkikJkNssyoBTQR5kFlzoyXBlJWZO+PKZl3GLF1tL+MSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jelxjDt8XdlXPfEfKlhLB3dbYhaXk/L0qv9fcEjdh4=;
 b=V7jpS1eK9mPG4d+YIFyD9KoKrqgUEJzMIh7X0LE41JD7MBuV7N5t6jcCkU00oor0wHLaHtvugEUIi0cXurCjmLzUnZZsPlxKtggnwC6+coN3XZPWUOLyJ1Nc9EzJmkD/cpkDDJ7uTohEHG4mZZnjiaX3bp38NTiZDglo5OVbq21zyZ5iIIsHfsmxSr+cJDVriU5mQaLlFzR6D8n+dfNEGq/WDwm5s3ENEASOmmpZ+lptH1wDFIGK3sb2n6envE7ycYtDrX6aLbqMJYJiBKWY7LRc4EOy/adtzgAOuE6er4KhvqiKXMYjKoO6eXfJfzEPirmX0GgEIW2cJr8ZPqaBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jelxjDt8XdlXPfEfKlhLB3dbYhaXk/L0qv9fcEjdh4=;
 b=MMet2MfEMbRRARHCLjyP37z9faEzqeSo1v9XJf+43JmPdXjy8WirBmx3vNRDKEfLp2M+LuC0YDqA/eDMcrXmgJwaMHbMIYz8DE/x8Mu3BGrTsoUGAlCGgU5T+oWRDmlI3nUPazJnVOOH3NZG1otmRSbgoZ8bP28c01Q1nJg9Ptk=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3434.jpnprd01.prod.outlook.com (2603:1096:404:d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 01:05:01 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 01:05:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 07/14] dt-bindings: clock: Add r8a77961 CPG Core Clock
 Definitions
Thread-Topic: [PATCH 07/14] dt-bindings: clock: Add r8a77961 CPG Core Clock
 Definitions
Thread-Index: AQHWhPgVGLoA43I9mkep19S8BwjFEqleeZ6AgAEAerA=
Date:   Wed, 9 Sep 2020 01:05:00 +0000
Message-ID: <TY2PR01MB36921226FA12D4EA0B0960E7D8260@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVeHMXD-kwV4jqiv=pjU5Q==MJYKoY9C9ULc6re-dW+YQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVeHMXD-kwV4jqiv=pjU5Q==MJYKoY9C9ULc6re-dW+YQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e7481e13-dfd3-4c53-ab98-08d8545c60c8
x-ms-traffictypediagnostic: TY2PR01MB3434:
x-microsoft-antispam-prvs: <TY2PR01MB34349AE29530282A4A52D1AFD8260@TY2PR01MB3434.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xH1rvHLxOFe4AyYOv5Jgw6SAvaHIDeNgTIntzbkiWfFukccI2Ra5/8z7tY0nbhOix28UnW0VxlESp2ekzCuuOgqkLRF9qF8D/OLsaQe9cwUH8Vns6JcsTOAyRpziFibBEy+22QklB88/qyvBRiNO5Y/Cu8FuOvvqsyjRwuTth4WOwGH3rixm+kNrNOdvFIHEMrTnMLSM9Ih5xVOL8B+U/YgY55x/vZTiBgrIsFCGaSCqjSxZMhNdO2CUy50xICXC9J5srW844X14fL0cg8tp9r34juRFZjqSv28Orn7vOqcTMhB0Oc4MVH5POwYzuCv2lRtwyDjpUueQAur8Q8liFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(6506007)(71200400001)(316002)(53546011)(5660300002)(64756008)(66446008)(8676002)(26005)(76116006)(55236004)(66476007)(186003)(66556008)(66946007)(52536014)(33656002)(4326008)(83380400001)(2906002)(9686003)(7696005)(8936002)(6916009)(86362001)(478600001)(55016002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: tAFwSR2WVNyP3/DFsJ68AtHB2EF/tl6Akv/wlFiLG5m8W7dzbnstkzLO3Blz23C/fRpVchvyAygYWgoeC0+lZW8VLoDj70WG+xg5kPNTBj2o7BCfd25oRgFj+pWt+TLIoBHH5NAd+tjlqhDJEZLFSscw/2OXkIEPkwcCU2ffESKwbV9Qe8WXDhCunCH5SyPZhJr6kN+/EEprIWkix0bE2o+H7bqKg97k4eVDATOZ6hayZ6Ro4qQocsr5rqcr97IfMfUxI57146TFvUV3JrTYmrQUvwrS8yWiXgM6VZEAVv5TbqRf46TAYGs5OPVdWMJ3YEpk0B6N0ei+AzafySN5cfeB4fjx++nlZ+QWxrOeB0htgF//cG/ci3AcTc5TVwToFhW3/AwlS7/gtwz3+K1XetAFoBnN8rRnLbm0lKRC6mJ6anRfSnimgm2Ry58hc6uaFweXp4JWC2X0nDInaGoNCCCTPaV5yAkixIgYR/w8VModEphEbLXHA1BiQPdfb5vCf0tzN22yLya4EiGnE2oXe3odvFzoxmBWvOQhHbQIoSiDiIu/tmXaNPI/9T3ZBOcs6JnIYkwH9QYRbH7VYHc1HaVJCSF1XXmUcS8ucmmB3mmb9MYH5D7Xn/U9hWl1ciZVJDKiu7GuOE3HtvqmjPUlkg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7481e13-dfd3-4c53-ab98-08d8545c60c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 01:05:00.8554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bP+6ZsI39JLY+bZP5k8Ux5Oim9LOkKoYKM6BIqs6+kVUMbcdg1gAK7ZfjT5vFE4zktcPuq8lphxZxW068pBpebKskYzpl92a/iYNYsOor5EOKcuV6EEQbfLneMbf2PGK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3434
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDgsIDIwMjAgNjoyNCBQ
TQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiBPbiBNb24sIFNlcCA3LCAyMDIwIGF0IDExOjIwIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+
IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIGFsbCBD
bG9jayBQdWxzZSBHZW5lcmF0b3IgQ29yZSBDbG9jayBPdXRwdXRzIGZvciB0aGUgUmVuZXNhcyBS
LUNhcg0KPiA+IFYzVSAoUjhBNzc5QTApIFNvQy4NCj4gDQo+IFNvIG9idmlvdXNseSBzLzYxL2Ew
LyBpbiB0aGUgcGF0Y2ggc3ViamVjdCA7LSkNCg0KT29wcy4gWW91J3JlIGNvcnJlY3QgOikNCg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51
aEByZW5lc2FzLmNvbT4NCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2luY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svcjhhNzc5YTAtY3BnLW1zc3IuaA0KPiA+IEBAIC0wLDAgKzEsNjMg
QEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8NCj4gDQo+IEdQ
TC0yLjAtb25seT8NCg0KSSdsbCBmaXggaXQuDQoNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0
IChDKSAyMDIwIFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycC4NCj4gPiArICovDQo+ID4gKyNpZm5k
ZWYgX19EVF9CSU5ESU5HU19DTE9DS19SOEE3NzlBMF9DUEdfTVNTUl9IX18NCj4gPiArI2RlZmlu
ZSBfX0RUX0JJTkRJTkdTX0NMT0NLX1I4QTc3OUEwX0NQR19NU1NSX0hfXw0KPiA+ICsNCj4gPiAr
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3JlbmVzYXMtY3BnLW1zc3IuaD4NCj4gPiArDQo+
ID4gKy8qIHI4YTc3OUEwIENQRyBDb3JlIENsb2NrcyAqLw0KPiA+ICsjZGVmaW5lIFI4QTc3OUEw
X0NMS19aMCAgICAgICAgICAgICAgICAgICAgICAgIDANCj4gPiArI2RlZmluZSBSOEE3NzlBMF9D
TEtfWlggICAgICAgICAgICAgICAgICAgICAgICAxDQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xL
X1oxICAgICAgICAgICAgICAgICAgICAgICAgMg0KPiA+ICsjZGVmaW5lIFI4QTc3OUEwX0NMS19a
UiAgICAgICAgICAgICAgICAgICAgICAgIDMNCj4gPiArI2RlZmluZSBSOEE3NzlBMF9DTEtfWlMg
ICAgICAgICAgICAgICAgICAgICAgICA0DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1pUICAg
ICAgICAgICAgICAgICAgICAgICAgNQ0KPiA+ICsjZGVmaW5lIFI4QTc3OUEwX0NMS19aVFIgICAg
ICAgICAgICAgICA2DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1MxICAgICAgICAgICAgICAg
ICAgICAgICAgNw0KPiA+ICsjZGVmaW5lIFI4QTc3OUEwX0NMS19TMyAgICAgICAgICAgICAgICAg
ICAgICAgIDgNCj4gDQo+IE9uIG90aGVyIFNvQ3MsIHdlIGRpZG4ndCBpbmNsdWRlIFMxIGFuZCBT
MywgYXMgdGhleSBhcmUgaW50ZXJuYWwgY2xvY2tzLg0KDQpJIGdvdCBpdC4gSSdsbCBkcm9wIFMx
IGFuZCBTMy4NCg0KPiA+ICsjZGVmaW5lIFI4QTc3OUEwX0NMS19TMUQxICAgICAgICAgICAgICA5
DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1MxRDIgICAgICAgICAgICAgIDEwDQo+ID4gKyNk
ZWZpbmUgUjhBNzc5QTBfQ0xLX1MxRDQgICAgICAgICAgICAgIDExDQo+ID4gKyNkZWZpbmUgUjhB
Nzc5QTBfQ0xLX1MxRDggICAgICAgICAgICAgIDEyDQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xL
X1MxRDEyICAgICAgICAgICAgIDEzDQo+IA0KPiBObyBTMUQ4IG5vciBTMUQxMiBpbiB0aGUgdGFi
bGUgaW4gU2VjdGlvbiA4LjEuNCAoIkxpc3Qgb2YgQ2xvY2sgT3V0Iik/DQoNCkFzIHlvdSBtZW50
aW9uZWQgb3RoZXIgZW1haWwgdGhyZWFkLCBpdCBpcyBsaXN0ZWQgYXMgYSBjaGlsZCBvZiBTMS4N
CkFuZCwgSSBjaGVja2VkIGFuIGludGVybmFsIG1hdGVyaWFsIGFuZCB0aGVuIFMxRDggYW5kIFMx
RDEyIGV4aXN0Lg0KDQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1MyRDEgICAgICAgICAgICAg
IDE0DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1MyRDIgICAgICAgICAgICAgIDE1DQo+ID4g
KyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1MyRDQgICAgICAgICAgICAgIDE2DQo+IA0KPiBHaXZlbiB0
aGUgdGFibGUgaGFzIG5vIFMyIHBhcmVudCBjbG9jaywgYW5kIHRoZXJlIGFyZSBubyBvdGhlcg0K
PiByZWZlcmVuY2VzIHRvIGFueSBvZiB0aGUgUzJEKiBjbG9ja3MsIEkgd29uZGVyIGlmIHRoZXkg
ZXhpc3QgYXQgYWxsPw0KDQpJIGFsc28gY2hlY2tlZCB0aGUgbWF0ZXJpYWwsIGFuZCB0aGVuLCBW
M1UgZG9lc24ndCBoYXZlIGFueSBTMiouDQpTbywgSSdsbCBkcm9wIHRoZXNlIFMyKi4NCg0KPiBB
cyB0aGlzIGZpbGUgd2lsbCBiZWNvbWUgc3RhYmxlIERUIEFCSSwgaXQgd291bGQgYmUgZ29vZCB0
byBoYXZlIGENCj4gZGVmaW5pdGl2ZSBhbnN3ZXIuDQoNCkkgZ290IGl0Lg0KDQo+ID4gKyNkZWZp
bmUgUjhBNzc5QTBfQ0xLX1MzRDEgICAgICAgICAgICAgIDE3DQo+ID4gKyNkZWZpbmUgUjhBNzc5
QTBfQ0xLX1MzRDIgICAgICAgICAgICAgIDE4DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1Mz
RDQgICAgICAgICAgICAgIDE5DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX0xCICAgICAgICAg
ICAgICAgICAgICAgICAgMjANCj4gPiArI2RlZmluZSBSOEE3NzlBMF9DTEtfQ1AgICAgICAgICAg
ICAgICAgICAgICAgICAyMQ0KPiA+ICsjZGVmaW5lIFI4QTc3OUEwX0NMS19DTCAgICAgICAgICAg
ICAgICAgICAgICAgIDIyDQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX0NMMTZNQ0sgICAgICAg
ICAgIDIzDQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1pCMzAgICAgICAgICAgICAgIDI0DQo+
ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1pCMzBEMiAgICAgICAgICAgIDI1DQo+ID4gKyNkZWZp
bmUgUjhBNzc5QTBfQ0xLX1pCMzBENCAgICAgICAgICAgIDI2DQo+ID4gKyNkZWZpbmUgUjhBNzc5
QTBfQ0xLX1pCMzEgICAgICAgICAgICAgIDI3DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1pC
MzFEMiAgICAgICAgICAgIDI4DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1pCMzFENCAgICAg
ICAgICAgIDI5DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1NEMEggICAgICAgICAgICAgIDMw
DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1NEMCAgICAgICAgICAgICAgIDMxDQo+ID4gKyNk
ZWZpbmUgUjhBNzc5QTBfQ0xLX1JQQyAgICAgICAgICAgICAgIDMyDQo+ID4gKyNkZWZpbmUgUjhB
Nzc5QTBfQ0xLX1JQQ0QyICAgICAgICAgICAgIDMzDQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xL
X01TTyAgICAgICAgICAgICAgIDM0DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX0NBTkZEICAg
ICAgICAgICAgIDM1DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX0NTSTAgICAgICAgICAgICAg
IDM2DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBfQ0xLX0ZSQVkgICAgICAgICAgICAgIDM3DQo+ID4g
KyNkZWZpbmUgUjhBNzc5QTBfQ0xLX1BPU1QgICAgICAgICAgICAgIDM4DQo+ID4gKyNkZWZpbmUg
UjhBNzc5QTBfQ0xLX1BPU1QyICAgICAgICAgICAgIDM5DQo+ID4gKyNkZWZpbmUgUjhBNzc5QTBf
Q0xLX1BPU1QzICAgICAgICAgICAgIDQwDQo+IA0KPiBEbyB3ZSBuZWVkIHRoZSBQT1NUIGNsb2Nr
cyAoQlRXLCBQT1NUNCBpcyBtaXNzaW5nKT8NCj4gT24gb3RoZXIgU29Dcywgd2UgZGlkbid0IGlu
Y2x1ZGUgdGhlbS4NCg0KSSBzZWUuIFNvLCBJJ2xsIGRyb3AgUE9TVCouDQoNCj4gPiArI2RlZmlu
ZSBSOEE3NzlBMF9DTEtfRFNJICAgICAgICAgICAgICAgNDENCj4gPiArI2RlZmluZSBSOEE3NzlB
MF9DTEtfVklQICAgICAgICAgICAgICAgNDINCj4gPiArI2RlZmluZSBSOEE3NzlBMF9DTEtfQURH
SCAgICAgICAgICAgICAgNDMNCj4gPiArI2RlZmluZSBSOEE3NzlBMF9DTEtfQ05ORFNQICAgICAg
ICAgICAgNDQNCj4gPiArI2RlZmluZSBSOEE3NzlBMF9DTEtfSUNVICAgICAgICAgICAgICAgNDUN
Cj4gPiArI2RlZmluZSBSOEE3NzlBMF9DTEtfSUNVRDIgICAgICAgICAgICAgNDYNCj4gPiArI2Rl
ZmluZSBSOEE3NzlBMF9DTEtfVkNCVVMgICAgICAgICAgICAgNDcNCj4gPiArI2RlZmluZSBSOEE3
NzlBMF9DTEtfQ0JGVVNBICAgICAgICAgICAgNDgNCj4gPiArI2RlZmluZSBSOEE3NzlBMF9DTEtf
UkNMSyAgICAgICAgICAgICAgNDkNCj4gPiArI2RlZmluZSBSOEE3NzlBMF9DTEtfT1NDQ0xLICAg
ICAgICAgICAgNTANCj4gDQo+IE9uIG90aGVyIFNvQ3MsIHdlIGNhbGxlZCB0aGVtIDxTT0M+X0NM
S19SIGFuZCA8U09DPl9DTEtfT1NDLg0KDQpJJ2xsIGZpeCB0aGVzZSBkZWZpbml0aW9ucy4NCg0K
QmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
