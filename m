Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2976260DD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 10:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729734AbgIHIpw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 04:45:52 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:54400
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729390AbgIHIpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 04:45:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbkzGt0irR9WMouFBbnLWQTPGPOq5d7MCIFtQgfvF3ELRPzr+ZIGGyhCorLK1UdxTg2byWuaE5eyInCtfmy+EsviKVU6oEW+idNcOA1enCt1sToIx0HkYKecdZg4JFyZ7NxcC6nJ66G3nWybv9UN/43DtA3k8aUKhLPgwIuuoPH6IgZm+yD3u8oXcipPvz7YdbiJiX07K7pVNpEgRDie3tZlRWKQbZ5oDoAW59YfA+QY+e2H4nrqkS1lvywK0PRmFt9yANGLK9KyNgdurMkRQ5ReQepfsKTG6VXOFxT1F1HWdOf2O71rg8sm6QvrqfZLfzVduQ5FBAgPuZdjtpoDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmnO37VPOVBB14sxVjzsz36/oLZfpN3ma/goK0DtMO0=;
 b=oFirnN9BUQjvLcaxjHKDkt5XsLBVpuP24osTU+U5jRW5JxJtvZ7OESlaq675WXNMtoDXIpB6nizkqZ8gTJtYWGy6Zxiwx6tC7F4hPIv5v0V8VOwTiFq5G2uTDRhXgGGMCkkbZW0mpo92pIOBPLvavq7AElCK99I1vdxcSXwnmb7EqM5atfcUSeL+mVQDjggnl3GcksRKEvDeU8usZTPMe22cGq24NOFSmz5cDzIzMQAk532yE+ovStgvWpU18Fqg7p9/Dz/mkYlwber9hv/ImY2CxKNHUN/FY5kC8HzKJnvWkooqcs77njp37pAa8nV3W9a5Mm5jefHgeTPHvv2sXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmnO37VPOVBB14sxVjzsz36/oLZfpN3ma/goK0DtMO0=;
 b=PHlpXl2QY8MutKJ3pNmOB+hYOB8vK945kefbb07avCJVqAqsPfJMsdmh4QVHWbnBaGrjSKXd7rdR14w61ujK9ge6WDpeaBsaCulTO+J0QIrRHrcNyPrVOpsJ7wfx8TlO+gQTekmjgmSxa9wnY4w0qjjdzOYcsvVPVWbW5lEIpoI=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1549.jpnprd01.prod.outlook.com (2603:1096:403:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 08:45:47 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 08:45:47 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas Falcon
 boards
Thread-Topic: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas Falcon
 boards
Thread-Index: AQHWhPgVqH2AcydHXEixjAxMOPZFmaldTeAAgACLPhCAAHuZgIAAEYQg
Date:   Tue, 8 Sep 2020 08:45:46 +0000
Message-ID: <TY2PR01MB36920EF68291EF53EE91D2E7D8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX_be=+3soDGQBxPGvjF5Ty40wDEPaki3Z=SwbDToPA3g@mail.gmail.com>
 <TY2PR01MB3692F7496EE91E633E9EF68AD8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdUUqdqf0unaT5efUL-VmSD8Vh1PH69qOqiWZZFLmTGGDg@mail.gmail.com>
In-Reply-To: <CAMuHMdUUqdqf0unaT5efUL-VmSD8Vh1PH69qOqiWZZFLmTGGDg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:7120:412c:ecaf:cff5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b5fc44f1-6ad9-4a1d-5cad-08d853d394b1
x-ms-traffictypediagnostic: TYXPR01MB1549:
x-microsoft-antispam-prvs: <TYXPR01MB1549B82ED95245FF4DC8BA90D8290@TYXPR01MB1549.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ns+H7vZE/2Bu2i4IhS0SkCyUgCvmqHAGOTABiwnXrjbp9o1G/mnjm6qLivN8OBzoZwzBjUpVBypZPKIBDSXIGae9exAzpxtRXvFef97vZUgw3QPrD7ITNF3NG0HNHxZDo8HONz1Iq0E2FJx/bxoFo3bXBL8bhO6tXbe2YPGJr2tf4XhCO7hZNV0JwzwBlcHHk0eYZBQ/394Rlmq9GPw91f2exheKEjxK7w1571zuX2eXrGFPn1WtJwdTYmwVh+0wukbVbVVTDpPqgTvwJdzheoUb8virPQbZGp8zC4GJOIll0+/DWrcre3PWzx31mFPYjUtysSpeoflpf6jt0csC4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(76116006)(66556008)(316002)(6916009)(66476007)(64756008)(66446008)(4326008)(6506007)(53546011)(9686003)(186003)(66946007)(86362001)(55016002)(71200400001)(478600001)(54906003)(7696005)(52536014)(33656002)(2906002)(8676002)(5660300002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: lYR6CqWl/FsKGqf+42OaFvYg4YoEwLGuLI15rBjL3RHoAZZOLdHyZRQDntHUhu9Maa/29k7pSh6z8dm7M6aIEQosPNgi2SYEELiJbXBzntLC7SrH/Eu/sMJmC23YEPHB9BXvkh+NjhmRu8T31YywVYjqeyp1IQh0FrikJQ9n5tv7D87d2lCNhuFWBnwjUq/1AB6j/I6brxejOk4cLGknjfysOJ7CUlbf6UnTBFNsSbGSYaGMAXp/KmAz5YZ+HQsXrz/pTpNCWZ2YSOw/cbX9Vh1UbGinGP8pi4LS4Cw/n9+ror0g+g63ZKJdATPrEktHwvqZAvNNsYYlwz2GXaxQeVljOCxS+OQpeKAJNiD2IKOH0Ld4aBK3FsTqhkw7x6RUB5edrE/tsjPp6OQrx0YM9AMIrwEKqL1xujUi+gizfpz6NHovduj7xV8OoxwiJA7e1CI0eFJXVYCM6JVOR9+IXlIk1mgy8WmP6sru7omBw413epwwYzjSrns8a83Dk89wrDheanjTk1k3rKyVVqjH2sPFEWdjyqMLDW8g08Lo7swI31xwCHmQh/kYHZ49yIJEoCt75awsriHwf9JZoFkCy0gsSw6t4RS0MWajQ0Ed6HvsgGJmSyrNKVFBBfqYgx+MfEsuG3fuUCWVzZdbqfT8N6AnNE0bTPGki2o06IW5VcP/eP3U80vnLBgE0rcEsdd1xDDites+fHuHGT0GMMCYOQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fc44f1-6ad9-4a1d-5cad-08d853d394b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 08:45:46.9742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /rBr14Tzqm4SUKPuTGbLChE/60eysXlgFgH+R7/gKJGlYF8AX5hN+m6yVonbCrSbwQgVlbtIonUV2nakha2doLEFJqrEJJC/6mPCetVxfzA0VCpalCCiOs8mJzmW4iwX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1549
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgU2VwdGVtYmVyIDgsIDIwMjAgNDoxMiBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBPbiBUdWUsIFNlcCA4LCAyMDIwIGF0IDM6MDEgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0
IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDgsIDIwMjAgMTI6MzEgQU0N
Cj4gPiA+IE9uIE1vbiwgU2VwIDcsIDIwMjAgYXQgMTE6MjAgQU0gWW9zaGloaXJvIFNoaW1vZGEN
Cj4gPiA+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+
IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGZvciBSZW5lc2FzIFItQ2Fy
IFYzVQ0KPiA+ID4gPiBGYWxjb24gQ1BVIGFuZCBCcmVha091dCBib2FyZHMuDQo+ID4gPiA+DQo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9k
YS51aEByZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
ID4gPg0KPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L3JlbmVzYXMueWFtbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL3JlbmVzYXMueWFtbA0KPiA+ID4gPiBAQCAtMjgzLDYgKzI4Myw5IEBAIHByb3Bl
cnRpZXM6DQo+ID4gPiA+DQo+ID4gPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBSLUNhciBWM1Ug
KFI4QTc3OUEwKQ0KPiA+ID4gPiAgICAgICAgICBpdGVtczoNCj4gPiA+ID4gKyAgICAgICAgICAt
IGVudW06DQo+ID4gPiA+ICsgICAgICAgICAgICAgIC0gcmVuZXNhcyxmYWxjb24tY3B1ICMgRmFs
Y29uIENQVSBib2FyZCAoUlRQMFJDNzc5QTBDUEIwMDEwUykNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgLSByZW5lc2FzLGZhbGNvbi1icmVha291dCAjIEZhbGNvbiBCcmVha091dCBib2FyZCAoUlRQ
MFJDNzc5QTBCT0IwMDEwUykNCj4gPiA+ID4gICAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHI4
YTc3OWEwDQo+ID4gPg0KPiA+ID4gSG93IGlzIHRoaXMgaW50ZW5kZWQgdG8gYmUgdXNlZD8NCj4g
Pg0KPiA+IEkgaW50ZW5kZWQgdG8gdXNlICJyZW5lc2FzLGZhbGNvbi1icmVha291dCIsICJyZW5l
c2FzLGZhbGNvbi1jcHUiLCAicmVuZXNhcyxyOGE3NzlhMCINCj4gPiBpbiB0aGUgZnV0dXJlLiBI
b3dldmVyLCBpZiBzbywgSSBzaG91bGQgZml4IHRoZSBkZXNjcmlwdGlvbiBsaWtlIEtpbmdmaXNo
ZXIuDQo+ID4NCj4gPiA+IFRoZSBhYm92ZSBtZWFucyBpdHMgdXNlcnMgc2hvdWxkIGRlY2xhcmUg
ZWl0aGVyDQo+ID4gPg0KPiA+ID4gICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxmYWxjb24tY3B1
IiwgInJlbmVzYXMscjhhNzc5YTAiOw0KPiA+ID4NCj4gPiA+IG9yDQo+ID4gPg0KPiA+ID4gICAg
IGNvbXBhdGlibGUgPSAicmVuZXNhcyxmYWxjb24tYnJlYWtvdXQiLCAicmVuZXNhcyxyOGE3Nzlh
MCI7DQo+ID4NCj4gPiBJIHVuZGVyc3Rvb2QgaXQuIEkgbWlzdG9vayB0aGUgZGVzY3JpcHRpb24u
Li4NCj4gPg0KPiA+ID4gSG93ZXZlciwgZmFsY29uLWNwdS5kdHNpIGhhcyBqdXN0DQo+ID4gPg0K
PiA+ID4gICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxmYWxjb24tY3B1IjsNCj4gPiA+DQo+ID4g
PiBXaG8gd2lsbCB1c2UgInJlbmVzYXMsZmFsY29uLWJyZWFrb3V0Ij8NCj4gPg0KPiA+IEkgaW50
ZW5kZWQgdG8gYWRkIGZhbGNvbi1icmVha291dC5kdHNpIGFuZCB0aGUgZmlsZSBpbnRlbmRlZCB0
byB1c2UNCj4gPiAicmVuZXNhcyxmYWxjb24tYnJlYWtvdXQiIGxpa2UgS2luZ2Zpc2hlciArIFVM
Q0IgaW4gdGhlIGZ1dHVyZS4NCj4gPg0KPiA+IEhvd2V2ZXIsIEkgcmVhbGl6ZWQgYSBjb21iaW5h
dGlvbiBiZXR3ZWVuIHRoZSBjcHUgYm9hcmQgYW5kDQo+ID4gdGhlIGJyZWFrb3V0IGJvYXJkIGRp
ZmZlcnMgdGhhbiBVTENCICsgS2luZ2Zpc2hlciBsaWtlIGJlbG93Og0KPiA+DQo+ID4gLSBUaGUg
VUxDQiB3aXRob3V0IHRoZSBLaW5nZmlzaGVyIGNhbiB3b3JrLg0KPiA+IC0tIFNvLCBzb21lIC5k
dHMgZmlsZXMgZXhpc3QgbGlrZSByOGE3Nzk1MS11bGNiLmR0cy4NCj4gPiAtLSBBbmQsIHI4YTc3
OTUxLXVsY2Ita2YuZHRzIGluY2x1ZGVzIHI4YTc3OTUxLXVsY2IuZHRzIGZvciBVTENCICsgS2lu
Z2Zpc2hlci4NCj4gPg0KPiA+IC0gVGhlIEZhbGNvbiBDUFUgYm9hcmQgd2l0aG91dCB0aGUgYnJl
YWtvdXQgYm9hcmQgY2Fubm90IHdvcmsgYWN0dWFsbHkuDQo+ID4gLS0gQnV0LCBvbiB0aGlzIGlu
aXRpYWwgcGF0Y2ggc2VyaWVzIGVuYWJsZXMgdGhlIENQVSBib2FyZCBoYXJkd2FyZSAobWVtb3J5
IG5vZGVzICYgU0NJRjApIG9ubHkuDQo+ID4gLS0gVGhlIGJyZWFrb3V0IGJvYXJkIGhhcyBzb21l
IGhhcmR3YXJlIGxpa2UgRXRoZXJuZXQgYW5kIENBTi4NCj4gPiAtLSBUaGUgYnJlYWtvdXQgYm9h
cmQgYWxzbyBoYXMgc29tZSBjb25uZWN0b3JzIGZvciBzdWIgYm9hcmRzLg0KPiA+IC0tIFNvLCBJ
IGludGVuZGVkIHRvIGFkZCBmYWxjb24tYnJlYWtvdXQuZHRzaSB0byBzdXBwb3J0IEV0aGVybmV0
IGluIHRoZSBmdXR1cmUuDQo+ID4NCj4gPiBJbiB0aGlzIGNhc2UsIEkgd29uZGVyIGlmIHdlIHNo
b3VsZCBkZXNjcmliZSBqdXN0ICJyZW5lc2FzLGZhbGNvbiIgb25seQ0KPiA+IGJlY2F1c2Ugd2Ug
d2lsbCBub3QgaGF2ZSByOGE3NzlhMC1mYWxjb24te2NwdSxicmVha291dH0uZHRzIGZpbGVzLg0K
PiA+IEJ1dCwgd2hhdCBkbyB5b3UgdGhpbms/DQo+IA0KPiBXaGF0IGtpbmQgb2YgY29ubmVjdG9y
IGRvZXMgdGhlIEZhbGNvbiBDUFUgYm9hcmQgaGF2ZT8NCj4gUGVyaGFwcyBpdCBjYW4gYmUgcGx1
Z2dlZCBpbnRvIGFub3RoZXIgYmFzZSBib2FyZCwgdG9vPw0KDQpUaGUgRmFsY29uIENQVSBib2Fy
ZCBoYXMgMiBFWElPIGNvbm5lY3RvcnMuIFRoZSBFWElPIGNvbm5lY3Rvcg0KaGFzIDQwMCBwaW5z
LiBTbywgSSB0aGluayBpdCBjYW4gYmUgcGx1Z2dlZCBpbnRvIGFub3RoZXIgYmFzZSBib2FyZC4N
Cg0KPiBXaGF0IGFib3V0IG1vZGVsbGluZyBpdCBsaWtlIHRoZSBpd2F2ZSxnMjJtIFNvTSwgYW5k
IHRoZSBpd2F2ZSxnMjJkDQo+IFNPRElNTSBib2FyZD8NCj4gYXJjaC9hcm0vYm9vdC9kdHMvcjhh
Nzc0NS1pd2cqDQoNClRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24uIFNvLCBJJ2xsIGZpeCB0
aGUgcGF0Y2ggbGlrZSBiZWxvdy4NCi0tLQ0KDQogICAgICAgLSBkZXNjcmlwdGlvbjogUi1DYXIg
VjNVIChSOEE3NzlBMCkNCiAgICAgICAgIGl0ZW1zOg0KKyAgICAgICAgICAtIGVudW06DQorICAg
ICAgICAgICAgICAtIHJlbmVzYXMscjhhNzc5YTAtY3B1ICMgRmFsY29uIENQVSBib2FyZCAoUlRQ
MFJDNzc5QTBDUEIwMDEwUw0KKyAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHI4YTc3OWEwDQor
DQorICAgICAgLSBpdGVtczoNCisgICAgICAgICAgLSBlbnVtOg0KKyAgICAgICAgICAgICAgLSBy
ZW5lc2FzLHI4YTc3OWEwLWJyZWFrb3V0ICMgRmFsY29uIEJyZWFrT3V0IGJvYXJkIChSVFAwUkM3
NzlBMEJPQjAwMTBTKQ0KKyAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHI4YTc3OWEwLWNwdQ0K
ICAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHI4YTc3OWEwDQoNCiAgICAgICAtIGRlc2NyaXB0
aW9uOiBSWi9OMUQgKFI5QTA2RzAzMikNCi0tLQ0KDQpBbmQsIEkgd2lsbCBmaXggdGhlIGNvbXBh
dGlibGUgb2YgcjhhNzc5YTAtZmFsY29uLmR0cyBpbiB0aGUgcGF0Y2ggMTQvMTQgbGlrZSBiZWxv
dy4NCi0tLQ0KKwljb21wYXRpYmxlID0gInJlbmVzYXMsZmFsY29uLWJyZWFrb3V0IiwgInJlbmVz
YXMsZmFsY29uLWNwdSIsICJyZW5lc2FzLHI4YTc3OWEwIjsNCi0tLQ0KDQpCdXQsIHdoYXQgZG8g
eW91IHRoaW5rPw0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
