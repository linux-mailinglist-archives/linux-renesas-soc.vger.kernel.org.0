Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B24262F2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 15:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730257AbgIIN2n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 09:28:43 -0400
Received: from mail-eopbgr1320127.outbound.protection.outlook.com ([40.107.132.127]:6379
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730279AbgIINWT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 09:22:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VutIdO5mMZJOOYcYxTctlGTqkmV3ByXJpda8FBO8hd2pYRR7/auVaVGzz9pYsUpq3qmk7KoKhjs6w99sO11+NPX3hdOy3tSEOwuhZivJobLWlxw8gXAuanZ0jaZeI3rRBoU2Q+OkCSVtyIBs9PAqeaPCCuS062sKp/omfnU3lpNN8G8z0FmA1RVPsGfPYcXrDqBrrj1E3vPADyV/+/QjLuDKlEJUyJKMRTn5HC0NYoDzvlkN8/vm/KypznJ+ezI2QRz3JOeEaD3jpwTPZXH86MucQhpf3CRnfDm7J65wj1jZyCJ5DkzQiv8csI8MxMI/cqGFB8MQW+dVAqZF2cXAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhRRoEkO5GoN8kGvJSozjM1BTHyy1U2kLPuQprp+LUo=;
 b=nvtp5t90Q9Oxfl6Kabd9/FaH9JK/IQbOHm0i5by9qmAgnSGSsSRirt7ZGN2VCiE51gPOgF8MgdSxhVA8gdWZqlpNJbMZjtoB/cEzsw8mc0DUZdLyery0xkCEdNNEvluArpXvsAO8H4rQkqCO6HqYyhQWncgtc9wSH8mJGPxrKjttnMxWpk4xbvCjBxygs/RHqL5CZV2TVOgGMgQz17XfBRPiW3FFJGySvnvBR9iXNZ3MQJt2MSg5TJOCFa30bK7aDa7IZXn0ITSirR3BtlYes0H4qWSbOlL1hX8x0yL6s4UOYvY8tL4Q8D6Ovkwpm9hi+DtiNgPUPGzPD5M7r5Nb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhRRoEkO5GoN8kGvJSozjM1BTHyy1U2kLPuQprp+LUo=;
 b=C4l27c6lsL+Qj9PNu4yT2fujcQsOieL+UY59h6thUblIkL4kQ3eXZuMNv5fJbvQPsmDLIXZmL5bjfTjucAove7LadZOjx46uvrWyW7rvH3fVNURIfACZhy5eoQAHeouWMf5EJ7xPN/AxsN/8moNH5jNAGfqfvUL/kFBZvKZIS8w=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB1977.jpnprd01.prod.outlook.com (2603:1096:404:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 12:45:15 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 12:45:15 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 10/14] soc: renesas: r8a779a0-sysc: Add r8a779a0 support
Thread-Topic: [PATCH 10/14] soc: renesas: r8a779a0-sysc: Add r8a779a0 support
Thread-Index: AQHWhPgXWm1C+3nkv0SrkcyaJ0S0calemg8AgAGRxSA=
Date:   Wed, 9 Sep 2020 12:45:15 +0000
Message-ID: <TY2PR01MB3692AAF3A65B61298EE711C8D8260@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXi-nZ4XgxygdkRePJ60rGeUP4aA7Yds29z9cqWt+-KmA@mail.gmail.com>
In-Reply-To: <CAMuHMdXi-nZ4XgxygdkRePJ60rGeUP4aA7Yds29z9cqWt+-KmA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: da44b4bc-9a11-4dcd-fb30-08d854be3394
x-ms-traffictypediagnostic: TY2PR01MB1977:
x-microsoft-antispam-prvs: <TY2PR01MB1977B5B058CB4A458BFE667CD8260@TY2PR01MB1977.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AgIlvVoJDa/Ls+LKVwMtDzOc3RV7NSF/CAWuyBDSd5g9itDHCvWJzDTMjLESVXxPWH+SZ7BIBby+JwvzgXZKdIESseH98mPozJNJxDq8jcttGYHMHphMeAdhKk3O22R38v+z7/hsfaMq7v1yb3K0vXyi5RIuB9N7DHazf8OIH9fdJb2VzCRh0/yjE2YrvwGxkH64IK0L+/QJdPdPwtiHnlkap/SHdjmjJLOoQE9ONilNPG4LJ0r/bRPbLyLOgrcQWpxL7WTpzz8fgcMUDh9aSm1ci4ilygCHSCjGGJuxn1C+HlIyCdTxYqEkK2XWV29NfE9xjb+h78YW9LzhH+1+Hg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(66946007)(76116006)(64756008)(66446008)(66556008)(2906002)(4326008)(6916009)(71200400001)(186003)(55236004)(26005)(9686003)(8676002)(8936002)(53546011)(7696005)(52536014)(5660300002)(33656002)(6506007)(478600001)(66476007)(316002)(54906003)(86362001)(55016002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: BUqJ5NNsryfi5yql2EYNfMcXlLp4Ien8wIKdSm7L4rjOCJu+EG9nnEkWHyjcYFpBC5i/C0umwFqdhgX0D8Ryt9W2qOZX3z1B3khEiRFwE5DpBS9OhfCzIf00JPXHSvWwoDtjH/p1cIFznx9EofYsn8ZRQLdfhuy7l6rYhfQyaBQUkamnKUk5XJ2ca/3/aOFnyLd5hOfImMDv6zit0PsxOUwfjpbSoL2ohC9prSZ86mmx/KiQTRyoPZQTrMtvFyRTrTo53wkTuFAgLZv6c8KVG9yRKe2RNc0kVRi3FefFi0CPuuJboN6aOrhvqc5d9G/1rXDvmshCvctG4eekPt2twz84nRVzM8xiLlXzpHDSgO8sz8XOpYl6iu9IIZhQoHHFUY7Ku4c7UcLiOCuc/uXpuLdw36DDqPyzg4zTSxY4LxbmWcgh70LTkm5Gx4QllW5und+okkjVKOEtfSepeiv08WYdjEyP4nm+IxWBejlG0uJq6jm3c7od8wxKR569napdV5ZTiDYkN4F7HjivfMD3Slo3qbilDN1WDGdIT+LvUTCGZzVS5QR5725cWL/P0GQ5zXUHCoKKow56WTSF5budtjQgNCigLx+s0kTaEUK7yhwB99J2ab6dwmY5l++OuS0dDWcd9MDzUmlYLZ4+rg92Lg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da44b4bc-9a11-4dcd-fb30-08d854be3394
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 12:45:15.7287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1vMBAGlNkPr/8DUA/R+DngdHm2OfwIO3S5IIdr9/aSKmsOG9a5kDOvyrLtcdmNKxI96FoK7n9s9z7h9G0hhUEQOfuf+afVlvsk4jJqwS18Yty3SYn8nT9w9mVYKdIpk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1977
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDgsIDIwMjAgODoyMCBQ
TQ0KPiANCj4gIEhpIFNoaW1vZGEtc2FuLA0KPiANCj4gT24gTW9uLCBTZXAgNywgMjAyMCBhdCAx
MToyMCBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+IHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBSLUNhciBWM1UgKFI4QTc3OUEwKSBT
b0MgcG93ZXIgYXJlYXMgYW5kDQo+ID4gcmVnaXN0ZXIgYWNjZXNzLCBiZWNhdXNlIHJlZ2lzdGVy
IHNwZWNpZmljYXRpb24gZGlmZmVycw0KPiA+IHRoYW4gUi1DYXIgR2VuMi8zLg0KPiA+DQo+ID4g
SW5zcGlyZWQgYnkgcGF0Y2hlcyBpbiB0aGUgQlNQIGJ5IFRobyBWdS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2Fz
LmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIC9kZXYvbnVs
bA0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvcjhhNzc5YTAtc3lzYy5jDQo+ID4gQEAg
LTAsMCArMSw0NjAgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAN
Cj4gPiArLyoNCj4gPiArICogUmVuZXNhcyBSLUNhciBWM1UgU3lzdGVtIENvbnRyb2xsZXINCj4g
PiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIwIFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29y
cC4NCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8bGludXgvYml0cy5oPg0KPiA+ICsj
aW5jbHVkZSA8bGludXgvY2xrL3JlbmVzYXMuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2tl
cm5lbC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbW0uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4
L29mX2FkZHJlc3MuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3BtX2RvbWFpbi5oPg0KPiA+ICsj
aW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4N
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9zb2MvcmVu
ZXNhcy9yY2FyLXN5c2MuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3N5c19zb2MuaD4NCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L3N5c2NvcmVfb3BzLmg+DQo+IA0KPiBUaGUgYWJvdmUgMyBpbmNsdWRl
cyBhcmUgbm90IG5lZWRlZC4NCg0KSSBnb3QgaXQuDQoNCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9wb3dlci9yOGE3NzlhMC1zeXNjLmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAi
cmNhci1zeXNjLmgiDQo+IA0KPiBZb3UgZG9uJ3QgcmV1c2UgdGhlIHJjYXItc3lzYyBkcml2ZXIg
aXRzZWxmLCBidXQgeW91IGRvIHJldXNlIGl0cyBoZWFkZXINCj4gZmlsZS4gIEFzIHRoZSBjb21t
ZW50cyBpbiByY2FyLXN5c2MuaCByZWZlciB0byByZWdpc3RlcnMgdGhhdCBoYXZlIGJlZW4NCj4g
cmVuYW1lZCAoZS5nLiBQV1IqKSwgYW5kIFNZU0NFWFRNQVNLIG5vIGxvbmdlciBleGlzdHMsIGl0
IG1pZ2h0IGJlDQo+IGVhc2llciBmb3IgdGhlIGNhc3VhbCByZWFkZXIgdG8gZHJvcCB0aGUgaW5j
bHVkZSwgY29weSB0aGUgUERfKg0KPiBkZWZpbml0aW9ucywgYW5kIGRlZmluZSBuZXcgcjhhNzc5
YTBfc3lzY19hcmVhIGFuZCByOGE3NzlhMF9zeXNjX2luZm8NCj4gc3RydWN0dXJlcyBpbnN0ZWFk
LCB1c2luZyB0aGUgbmV3IG5hbWluZy4NCg0KSSB1bmRlcnN0b29kIGl0LiBJJ2xsIGRvIHRoYXQu
DQoNCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcmNhcl9zeXNjX2FyZWEgcjhhNzc5YTBfYXJl
YXNbXSBfX2luaXRkYXRhID0gew0KPiA+ICsgICAgICAgeyAiYWx3YXlzLW9uIiwgICAgICAgMCwg
MCwgUjhBNzc5QTBfUERfQUxXQVlTX09OLCAtMSwgUERfQUxXQVlTX09OIH0sDQo+ID4gKyAgICAg
ICB7ICJhM2UwIiwgICAgICAgMHgxNTAwLCAwLCBSOEE3NzlBMF9QRF9BM0UwLCBSOEE3NzlBMF9Q
RF9BTFdBWVNfT04sIFBEX1NDVSB9LA0KPiANCj4gSSB0aGluayB5b3UgY2FuIGRyb3A6DQo+ICAg
LSBjaGFuX29mZnM6IGl0J3MgYWx3YXlzIDB4MTAwMCArIHBkciAqIDY0LA0KPiAgIC0gY2hhbl9i
aXQ6IGl0J3MgYWx3YXlzIHplcm8sDQoNCkkgZ290IGl0Lg0KDQo+ID4gKy8qIFNZU0MgQ29tbW9u
ICovDQo+ID4gKyNkZWZpbmUgU1lTQ1NSICAgICAgICAgMHgwMDAgICAvKiBTWVNDIFN0YXR1cyBS
ZWdpc3RlciAqLw0KPiA+ICsjZGVmaW5lIFNZU0NQT05TUih4KSAgICgweDgwMCArICgoeCkgKiAw
eDQpKSAvKiBQb3dlci1PTiBTdGF0dXMgUmVnaXN0ZXIgMCAqLw0KPiA+ICsjZGVmaW5lIFNZU0NQ
T0ZGU1IoeCkgICgweDgwOCArICgoeCkgKiAweDQpKSAvKiBQb3dlci1PRkYgU3RhdHVzIFJlZ2lz
dGVyICovDQo+ID4gKyNkZWZpbmUgU1lTQ0lTQ1IoeCkgICAgKDB4ODEwICsgKCh4KSAqIDB4NCkp
IC8qIEludGVycnVwdCBTdGF0dXMvQ2xlYXIgUmVnaXN0ZXIgKi8NCj4gPiArI2RlZmluZSBTWVND
SUVSKHgpICAgICAoMHg4MjAgKyAoKHgpICogMHg0KSkgLyogSW50ZXJydXB0IEVuYWJsZSBSZWdp
c3RlciAqLw0KPiA+ICsjZGVmaW5lIFNZU0NJTVIoeCkgICAgICgweDgzMCArICgoeCkgKiAweDQp
KSAvKiBJbnRlcnJ1cHQgTWFzayBSZWdpc3RlciAqLw0KPiA+ICsNCj4gPiArLyogUG93ZXIgRG9t
YWluIFJlZ2lzdGVycyAqLw0KPiA+ICsjZGVmaW5lIFBEUlNSKG4pICAgICAgICgweDEwMDAgKyAo
KG4pICogMHg0MCkpDQo+ID4gKyNkZWZpbmUgUERST05DUihuKSAgICAgKDB4MTAwNCArICgobikg
KiAweDQwKSkNCj4gPiArI2RlZmluZSBQRFJPRkZDUihuKSAgICAoMHgxMDA4ICsgKChuKSAqIDB4
NDApKQ0KPiA+ICsjZGVmaW5lIFBEUkVTUihuKSAgICAgICgweDEwMEMgKyAoKG4pICogMHg0MCkp
DQo+IA0KPiBXaGlsZSBQRFJFU1JuIGlzIGRlc2NyaWJlZCwgYW5kIHNob3duIGluIGEgZmlndXJl
LCBpdCB3YXMgZm9yZ290dGVuIGluDQo+IHRoZSBUYWJsZSA5LjIgKCJMaXN0IG9mIFJlZ2lzdGVy
cyAoUG93ZXIgRG9tYWluIFJlZ2lzdGVycyBmb3IgZWFjaCBwb3dlcg0KPiBkb21haW4pIikuDQoN
CllvdSdyZSByaWdodC4NCg0KPiA+ICsNCj4gPiArLyogUG93ZXIgU3RhdGUgKi8NCj4gPiArI2Rl
ZmluZSBQV19BQ1RJVkUgICAgICAxICAgICAgIC8qIEFjdGl2ZSBzZXR0aW5nICovDQo+IA0KPiAi
LyogUFdST04vUFdST0ZGICovIj8NCg0KSSdsbCBmaXggdGhlc2UgbGluZXMgbGlrZSBiZWxvdzoN
Ci8qIFBXUk9OL1BXUk9GRiAqLw0KI2RlZmluZSBQV1JPTl9QV1JPRkYJCUJJVCgwKQkvKiBQb3dl
ci1PTi9PRkYgcmVxdWVzdCAqLw0KDQo+ID4gKw0KPiA+ICsvKiBQRFJTUiAqLw0KPiA+ICsjZGVm
aW5lIFBEUlNSX09GRiAgICAgICAgICAgICAgQklUKDApICAvKiBQb3dlci1PRkYgc3RhdGUgKi8N
Cj4gPiArI2RlZmluZSBQRFJTUl9PTiAgICAgICAgICAgICAgIEJJVCg0KSAgLyogUG93ZXItT04g
c3RhdGUgKi8NCj4gPiArI2RlZmluZSBQRFJTUl9PRkZfU1RBVEUgICAgICAgICAgICAgICAgQklU
KDgpICAvKiBQcm9jZXNzaW5nIFBvd2VyLU9GRiBzZXF1ZW5jZSAqLw0KPiA+ICsjZGVmaW5lIFBE
UlNSX09OX1NUQVRFICAgICAgICAgQklUKDEyKSAvKiBQcm9jZXNzaW5nIFBvd2VyLU9OIHNlcXVl
bmNlICovDQo+ID4gKw0KPiA+ICsjZGVmaW5lIFNZU0NTUl9QT05FTkIgICAgICAgICAgMSAgICAg
ICAvKiBSZWFkeSBmb3IgcG93ZXIgcmVzdW1lIHJlcXVlc3RzICovDQo+ID4gKyNkZWZpbmUgU1lT
Q1NSX1BPRkZFTkIgICAgICAgICAwICAgICAgIC8qIFJlYWR5IGZvciBwb3dlciBzaHV0b2ZmIHJl
cXVlc3RzICovDQo+IA0KPiBUaGVzZSB0d28gYml0cyBhcmUgbm93IGNvbWJpbmVkIGludG8gYSBz
aW5nbGUgQlVTWSBiaXQgbWFzazoNCj4gKGRvaCwgYWxsIGJpdHMgc2V0cyBpcyBub3QgYnVzeT8h
PykNCj4gDQo+ICNkZWZpbmUgU1lTQ1NSX0JVU1kgICAgR0VOTUFTSygxLCAwKSAgICAvKiBBbGwg
Yml0IHNldHMgaXMgbm90IGJ1c3kgKi8NCg0KSSBnb3QgaXQuIEknbGwgZml4IGl0Lg0KDQo+ID4g
Kw0KPiA+ICsjZGVmaW5lIFNZU0NTUl9SRVRSSUVTICAgICAgICAgMTAwMA0KPiA+ICsjZGVmaW5l
IFNZU0NTUl9ERUxBWV9VUyAgICAgICAgICAgICAgICAxMA0KPiA+ICsNCj4gPiArI2RlZmluZSBQ
RFJFU1JfUkVUUklFUyAgICAgICAgIDEwMDANCj4gPiArI2RlZmluZSBQRFJFU1JfREVMQVlfVVMg
ICAgICAgICAgICAgICAgMTANCj4gPiArDQo+ID4gKyNkZWZpbmUgU1lTQ0lTUl9SRVRSSUVTICAg
ICAgICAgICAgICAgIDEwMDANCj4gPiArI2RlZmluZSBTWVNDSVNSX0RFTEFZX1VTICAgICAgIDEw
DQo+ID4gKw0KPiA+ICsjZGVmaW5lIFI4QTc3OUEwX05VTV9QRF9BTFdBWVNfT04gICAgICA2NCAg
ICAgIC8qIEFsd2F5cy1vbiBwb3dlciBhcmVhICovDQo+IA0KPiBKdXN0IHVzZSBSOEE3NzlBMF9Q
RF9BTFdBWVNfT04gaW5zdGVhZD8NCg0KSSdsbCBmaXggaXQuDQoNCj4gPiArDQo+ID4gKyNkZWZp
bmUgTlVNX0RPTUFJTlNfRUFDSF9SRUcgICAzMg0KPiANCj4gQklUU19QRVJfVFlQRSh1MzIpPw0K
DQpJJ2xsIGZpeCBpdC4NCg0KPiA+ICsNCj4gPiArc3RydWN0IHJjYXJfc3lzY19jaCB7DQo+ID4g
KyAgICAgICB1MTYgY2hhbl9vZmZzOw0KPiA+ICsgICAgICAgdTggY2hhbl9iaXQ7DQo+ID4gKyAg
ICAgICB1OCBpc3JfYml0Ow0KPiA+ICt9Ow0KPiANCj4gQXMgY2hhbl9vZmZzIGlzIHVudXNlZCwg
YW5kIGNoYW5fYml0IGlzIGFsd2F5cyB6ZXJvLCBJIHRoaW5rIGFsbCB1c2Ugb2YNCj4gdGhpcyBz
dHJ1Y3QgY2FuIGp1c3QgYmUgcmVwbGFjZWQgYnkgInVuc2lnbmVkIGludCBwZHIiPw0KDQpJJ2xs
IGZpeCBpdC4NCg0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgX19pb21lbSAqcmNhcl9zeXNjX2Jh
c2U7DQo+IA0KPiBzL3JjYXIvcjhhNzc5YTAvIGV2ZXJ5d2hlcmU/DQoNCkkgdGhpbmsgc28uIEkn
bGwgcmVuYW1lIGl0Lg0KDQo+ID4gK3N0YXRpYyBERUZJTkVfU1BJTkxPQ0socmNhcl9zeXNjX2xv
Y2spOyAvKiBTTVAgQ1BVcyArIEkvTyBkZXZpY2VzICovDQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50
IHJjYXJfc3lzY19wd3Jfb25fb2ZmKGNvbnN0IHN0cnVjdCByY2FyX3N5c2NfY2ggKnN5c2NfY2gs
IGJvb2wgb24pDQo+ID4gK3sNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCBzcl9iaXQsIHJlZ19v
ZmZzOw0KPiANCj4gc3JfYml0IGlzIG5vIGxvbmdlciBuZWVkZWQuDQoNCkknbGwgZHJvcCBpdC4N
Cg0KPiA+ICsgICAgICAgaW50IGs7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKG9uKSB7DQo+ID4g
KyAgICAgICAgICAgICAgIHNyX2JpdCA9IFNZU0NTUl9QT05FTkI7DQo+ID4gKyAgICAgICAgICAg
ICAgIHJlZ19vZmZzID0gUERST05DUihzeXNjX2NoLT5pc3JfYml0KTsNCj4gPiArICAgICAgIH0g
ZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAgIHNyX2JpdCA9IFNZU0NTUl9QT0ZGRU5COw0KPiA+
ICsgICAgICAgICAgICAgICByZWdfb2ZmcyA9IFBEUk9GRkNSKHN5c2NfY2gtPmlzcl9iaXQpOw0K
PiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIC8qIFdhaXQgdW50aWwgU1lTQyBpcyBy
ZWFkeSB0byBhY2NlcHQgYSBwb3dlciByZXF1ZXN0ICovDQo+ID4gKyAgICAgICBmb3IgKGsgPSAw
OyBrIDwgU1lTQ1NSX1JFVFJJRVM7IGsrKykgew0KPiA+ICsgICAgICAgICAgICAgICBpZiAoaW9y
ZWFkMzIocmNhcl9zeXNjX2Jhc2UgKyBTWVNDU1IpICYgQklUKHNyX2JpdCkpDQo+IA0KPiAgICAg
aWYgKChpb3JlYWQzMihyY2FyX3N5c2NfYmFzZSArIFNZU0NTUikgJiBTWVNDU1JfQlVTWSkgPT0g
U1lTQ1NSX0JVU1kpDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+
ICsgICAgICAgICAgICAgICB1ZGVsYXkoU1lTQ1NSX0RFTEFZX1VTKTsNCj4gPiArICAgICAgIH0N
Cj4gDQo+IFBlcmhhcHMgeW91IGNhbiB1c2UgcmVhZGxfcG9sbF90aW1lb3V0KCk/DQoNCkkgdGhp
bmsgc28uIEknbGwgZml4IGl0Lg0KDQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKGsgPT0gU1lTQ1NS
X1JFVFJJRVMpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUFHQUlOOw0KPiA+ICsNCj4g
PiArICAgICAgIC8qIFN1Ym1pdCBwb3dlciBzaHV0b2ZmIG9yIHBvd2VyIHJlc3VtZSByZXF1ZXN0
ICovDQo+ID4gKyAgICAgICBpb3dyaXRlMzIoUFdfQUNUSVZFLCByY2FyX3N5c2NfYmFzZSArIHJl
Z19vZmZzKTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4g
PiArc3RhdGljIGludCBjbGVhcl9pcnFfZmxhZ3ModW5zaWduZWQgaW50IHJlZ19pZHgsIHVuc2ln
bmVkIGludCBpc3JfbWFzaykNCj4gPiArew0KPiA+ICsgICAgICAgaW50IGsgPSAwOw0KPiA+ICsN
Cj4gPiArICAgICAgIGlvd3JpdGUzMihpc3JfbWFzaywgcmNhcl9zeXNjX2Jhc2UgKyBTWVNDSVND
UihyZWdfaWR4KSk7DQo+ID4gKw0KPiA+ICsgICAgICAgZm9yIChrID0gMDsgayA8IFNZU0NJU1Jf
UkVUUklFUzsgaysrKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmICgoaW9yZWFkMzIocmNhcl9z
eXNjX2Jhc2UgKyBTWVNDSVNDUihyZWdfaWR4KSkgJiBpc3JfbWFzaykgPT0gMCkNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHVk
ZWxheShTWVNDSVNSX0RFTEFZX1VTKTsNCj4gPiArICAgICAgIH0NCj4gDQo+IHJlYWRsX3BvbGxf
dGltZW91dCgpPw0KDQpZZXMsIEknbGwgdXNlIGl0Lg0KDQo+ID4gKw0KPiA+ICsgICAgICAgaWYg
KGsgPT0gU1lTQ0lTUl9SRVRSSUVTKSB7DQo+ID4gKyAgICAgICAgICAgICAgIHByX2VycigiXG4g
JXMgOiBDYW4gbm90IGNsZWFyIElSUSBmbGFncyBpbiBTWVNDSVNDUiIsIF9fZnVuY19fKTsNCj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+
ICsgICAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gDQo+ID4gK3N0YXRpYyBib29sIGhhc19jcGdf
bXN0cDsNCj4gDQo+IFBsZWFzZSBkcm9wIHRoaXMgYW5kIGFsbCByZWxhdGVkIGNvZGUsIFItQ2Fy
IFYzVSBkb2VzIG5vdCB1c2UgdGhlIGxlZ2FjeQ0KPiBDUEcvTVNTUiBQTSBEb21haW4uDQoNCkkn
bGwgZHJvcCBpdC4NCg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByY2Fy
X3N5c2NfbWF0Y2hlc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+ICsjaWZkZWYgQ09ORklHX1NZU0Nf
UjhBNzc5QTANCj4gDQo+IFBsZWFzZSBkcm9wIHRoZSAjaWZkZWYsIGFzIGNvbXBpbGF0aW9uIG9m
IHRoaXMgZmlsZSBhbHJlYWR5IGRlcGVuZHMgb24NCj4gdGhpcyBzeW1ib2wuDQoNCk9vcHMuIEkg
Z290IGl0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
