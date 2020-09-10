Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1CF2263C39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 06:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgIJEpN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 00:45:13 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:48736
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725372AbgIJEpH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 00:45:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSKKsg3tZqOc19KhPOrEFJEt+eFlFKvUIgRbgG9vnDfb9Us9sscEw4Mf17HozVNgnaVowYIVsXWLLPSqVZQtdII68hSCmWoml7Mnz2u0lxA1HSdJFElYTkQ7KYy2rjW98bOwCp/zt83rBqsqsRNsMT2PaS0DNUCwwsCGLncOEoGfrDCc/D55TRcydD9q59eE5HOnUvIlHRsoJHf/0VYaBfo2DAjM7X1/zsaO9A/t/GiDfQilUZT9PpGnA7/brSKuvvr7S/OKRm7GsrkATitq9GLkjA2XGyZlmCBmLOdy9Md7Lb1pBKNlmU0gaKUOm3ydoobK5kYc6tht57fzfgFQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsgOZaXK7wrEWsYR/0OVtt8I29LrsoOQtRGhO67Az2E=;
 b=aPBTob7k8SQI0eXVaxXNrkzAw/af+jjPckg4+Bb9sSoSsn2PD7iB5KtS8IwzZblZ+0PJdgrCGEsJdRmm0hPAddVmlebKJzifx2FZuio8ZHgVZz792v49LLev6K0HH6fbobRP1kQedMfZRiNBZODaAnHUG+RNdiwOEkV69j/ZtdHygk2NtO9kRBvnGSep349ACStbbzYoVNUh+REphwUQqivXWMqncTYCfpZx1Xjr2Mbod4X/jjDMhNFX4V4mGYegUYBlA1egxCo5tQiq6APaKbjxUfRz4qoDH9iq5IMvND5crvj9haJj0qliGNvxDD8bDcVYdab75YWV7WXKpriscQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsgOZaXK7wrEWsYR/0OVtt8I29LrsoOQtRGhO67Az2E=;
 b=dkDl9tc8sT8K/UGV6IMuYvba0uDKm43CoRYfDk/t0wSSE053D0nO7DATOXZ62Z3UB3cRiE91lql+AalTybGe4hG43CKK/vpxMlZ1V7qCEZvxYNb01kR/fUqprFDL3s78m+QtCXwVrOZuizx5Vu9XZSfn2xXSvR4r9VhCV43Y+XM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3645.jpnprd01.prod.outlook.com (2603:1096:404:c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 04:45:03 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 04:45:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 11/14] soc: renesas: rcar-rst: Add support for R-Car V3U
Thread-Topic: [PATCH 11/14] soc: renesas: rcar-rst: Add support for R-Car V3U
Thread-Index: AQHWhPgVVsARrY31L0ezpZXJlcFQTalenomAgAKuaJA=
Date:   Thu, 10 Sep 2020 04:45:03 +0000
Message-ID: <TY2PR01MB3692490B65EB4DFDF9BB5D73D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXsOki08u_Kf_xsm0OqddKL6RwmWLX+r+sekWYrgXf83w@mail.gmail.com>
In-Reply-To: <CAMuHMdXsOki08u_Kf_xsm0OqddKL6RwmWLX+r+sekWYrgXf83w@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:29e4:1562:227f:bbc3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c131f120-1d42-46ca-41e5-08d8554448b8
x-ms-traffictypediagnostic: TYAPR01MB3645:
x-microsoft-antispam-prvs: <TYAPR01MB3645354DE0603AF2A01ACB4AD8270@TYAPR01MB3645.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UKTGhlDj8+i7goU7lvNhhME/SMAocC71zO48MgOt+TBmoffxPWWJyLDzFpnZaSFc3M5z44kP3sKrCabLR1HvMHvFhchhV+p6Hm2z0oap8fkNqVC8OPZtVF3xwsGHMfKkyJLg+ohC7jkda0q97XCxKZ8BWDI7MHg3rnw/X2W1Gz0mAPhTNl/ORrm+2biv/gbpznuKGgwGwk+4oDSK9dWm1Vnz6o6VhGLQCz6v+Y20jqp7LUqzk+CZLQe70rEQ8vM1D8TRr3K1J3BBVhom31NhhKD/rVEcCGXkQK2hy7EQO26de6s8vEzwFhbO0opySImmvPt6yIGjZpLG7hvzAWsNng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(9686003)(55016002)(66476007)(8676002)(66556008)(66446008)(83380400001)(52536014)(33656002)(64756008)(7696005)(76116006)(66946007)(316002)(2906002)(8936002)(478600001)(54906003)(6916009)(53546011)(5660300002)(4326008)(71200400001)(186003)(6506007)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: iO6RSsNQMfYfgJawkjoW6jimiYVdBNRCFyPkktbEvGZXTMXzMgS5o9JhQm832WiCfGZh9yyhR9imW76ksJKAjjjTAsJH0B1zyIhY8Rg5D6or65VvOGV+vbm/C1eKl4hcl1fp2evDB8pwPcOCdGDeSYhIKbHDYH+rIGf0I3lS8PqAHZLuUTnPwJtBBzlLsN60Ad8pYsrTINdf0sJMZXnEAjr76O21UWzG2OEhKyZJlI1ObiRukByMcBnf/maOFSU9OVXsL75Q1DtJ7IN2XhDhTlSFFrC7wTQ4ARxBhTmhINnisjap4etGX/ouqWYPVSHqD7VihxQ9abQJGfeOkkI0PSW/8v4rc4XBRD6RZzMr9uw5+szxJoj3+gGhNPw3bqyMHHOH9fO10glLKAK6BQPLJTyyGK4iF3l4nhL8Q7XUlSbQPWCDzp/Der7tdYni5WQJqEkFm6aWuoaf0iTBJnvsqrIjuVSSiyGsEKOT2iPg/qxNNr3hKocdVQBW/MEKI2R/ngzCQiZNdRzJWAHviIBnt7zjmi8JY8Df4MbfE2cck6ORE2gAq2iN8Xr7T7XbQzIuN5EeGvzO3bfdqc8YdBs4Sg0L6uS6wrQnrZrjjS1UiUr/VZ/eQdrkskUl4XNX+mpZW9Wc3rYXdehwVPk261Ywofcz57nhwLwBAC/tPFvIgsA8jZKtlmm6S/h/2mlVZ45hq0+X6D5hVVygTTtwGlQAxA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c131f120-1d42-46ca-41e5-08d8554448b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 04:45:03.8217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xo8C7dslvW2bCWfE1+NJXQ+CZyvELNRKIIoIPPI3cQ2ek5Z2s7HjMM1JcMxKVC3H0zlIZDKs7PsHsIVnIGwcLi07Uykp0LGEhBFbdocrt45oOd0zAc0l2Q8E9556m22i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3645
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgU2VwdGVtYmVyIDgsIDIwMjAgODozNiBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBPbiBNb24sIFNlcCA3LCAyMDIwIGF0IDExOjIwIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQg
Zm9yIFItQ2FyIFYzVSAoUjhBNzc5QTApIHRvIHRoZSBSLUNhciBSU1QgZHJpdmVyLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVo
QHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gUmV2aWV3
ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQoNClRo
YW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9yZW5lc2Fz
L3JjYXItcnN0LmMNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL3JjYXItcnN0LmMNCj4g
PiBAQCAtMzcsNiArMzcsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByc3RfY29uZmlnIHJjYXJf
cnN0X2dlbjMgX19pbml0Y29uc3QgPSB7DQo+ID4gICAgICAgICAubW9kZW1yID0gMHg2MCwNCj4g
PiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJzdF9jb25maWcgcmNhcl9yc3Rf
cjhhNzc5YTAgX19pbml0Y29uc3QgPSB7DQo+ID4gKyAgICAgICAubW9kZW1yID0gMHgwMCwgICAg
ICAgICAvKiBNT0RFTVIwIGFuZCBpdCBoYXMgQ1BHIHJlbGF0ZWQgYml0cyAqLw0KPiANCj4gRG8g
eW91IG5lZWQgdGhlIGJpdHMgZnJvbSBNT0RFTVIxLCB0b28/DQo+IFBlcmhhcHMgdGhlIHRpbWUg
aXMgcmlwZSB0byBhZGQgcmNhcl9yc3RfcmVhZF9tb2RlX3BpbnM2NCgpLA0KPiBzbyB1c2VycyBj
YW4gYWNjZXNzIG1vcmUgdGhhbiAzMiBiaXRzIG9uIFNvQ3MgdGhhdCBwcm92aWRlIGl0IChSLUNh
cg0KPiBWM0ggYW5kIFYzVSk/DQoNCkkgdGhpbmsgc28uIEhvd2V2ZXIsIG1haW4gdXNlcnMgb2Yg
cmNhcl9yc3RfcmVhZF9tb2RlX3BpbnMoKQ0KYXJlIGNwZyBkcml2ZXJzIGZvciBub3cuIFNvLCBw
ZXJoYXBzIG5vIG9uZSB1c2VzIG1vcmUgdGhhbiAzMiBiaXRzIGZvciBub3cuDQoNCj4gQXQgbGVh
c3QgdGhlIG51bWJlcmluZyBpcyBzYW5lIG9uIFItQ2FyIFYzVS4gT24gUi1DYXIgVjNILCBNRDI5
IGFuZA0KPiBoaWdoZXIgYXJlIHN0b3JlZCBzdGFydGluZyBhdCBiaXQgMSBvZiB0aGUgc2Vjb25k
IE1PREVNUiByZWdpc3Rlci4uLg0KDQpPaCwgaXQncyBzdHJhbmdlIGFzc2lnbm1lbnQuLi4NCg0K
QmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
