Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1F38F29C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 09:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733209AbfKGIwS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 03:52:18 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:49802 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfKGIwR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 03:52:17 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-ff-5dc3db3fd332
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 8E.72.08102.F3BD3CD5; Thu,  7 Nov 2019 09:52:16 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Thu, 7 Nov 2019 09:52:11 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "nandor.han@vaisala.com" <nandor.han@vaisala.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Add definition for GPIO direction
Thread-Topic: [PATCH v2 0/2] Add definition for GPIO direction
Thread-Index: AQHVlJrx7wcBaYPaxUmQrQAzc732Rad+AIyAgAAhVYCAAS5RgIAABxwA
Date:   Thu, 7 Nov 2019 08:52:11 +0000
Message-ID: <2ca76ecb58b9e6377925d6790ff4f7722604f57b.camel@fi.rohmeurope.com>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
         <20191106120846.5bunrqj3uz4khih5@earth.universe>
         <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
         <20191106142441.GC32742@smile.fi.intel.com>
         <CACRpkdZ2F3zR2bdHgUV9GJX8iSojiM34BTWizTV_z+j7sS4jtw@mail.gmail.com>
In-Reply-To: <CACRpkdZ2F3zR2bdHgUV9GJX8iSojiM34BTWizTV_z+j7sS4jtw@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <854708258CFAAF48AF358D516979CCB9@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe885bq+XU+82bW9WQqMLRU4lgwVW+xCyikIp+lANO+bJSbvI
        2RStD2klMS+l5q2VF8wsUspmlqgDnVIpmB9C8RblJUENTZRJKKtztlK/nPf/Pv/n9/xfOA8k
        pWWiYJhktLCckdErRH5U+4sVe6h6pFMb7logVC1foCrvdimhWirvoVTljwuBqmj1OaGyTwz4
        qJqm5wjV3fkSoIaa/nstYs38YJZYU9AbqhkdaBNpKrpjNY01tzQjTf2UZtEeEgMv+kfFM5bU
        c0mJxrBjV/x1X2vKRMkfJGnT716RGSBXkg0gxCgS53Sps4EflKJ+gFfyin2ygS9/+QiwtV4p
        9IhQFM4eEgs9gegXwJ3jhUC4kMgNsGMhhxQAGTqKe99MEoIORMfwp7pSyqujsbW9FgiaQrtx
        Xnu3p06js9jVOk56k5sIXFCc70n2RbG4st3tAQDaia0Zc56hJJJj+9SypwcjhGva+kivDsLT
        E+5/dQV2/B6jhFeTaD9+3RLmlWrc8EPmnbILF+WMib1PkODuR5NUPthq2xBgW4dt67BtA2zb
        AFcBn5cAG5gkfSJjYSOUHJui5Ew6A39cNRnswPuPl5rBH+dJJyAgcIJtkFAE0YecTq10c7wp
        IV3HmHVxXIqeNTsBhqQikL58v0MrpROY9BssZ/pvbYeUQk7vGyvQSpGQdZ1lk1nuv7sDQgWm
        c4c6tVIJxyayadeS9JZ1m4C+wnC/4EAza0xgOSbFoosTtiPOzK+HYAXwuS4Bp83JjIGvetEe
        EAHzp8urSTjaUMF/u8qfVZNSymgyssFy+ogAIAHQpRjX4maAHAKFjFYLbgC/7mvTZvgggg8K
        H3QKQRZm3QrOAJJIcW7f503KDoMoemE2Vv394ZaGqpi5PU+eyoyXfE+Ryqmbp3++l4X2hLuK
        HPTBJXfdhdZ8V9QweLE3c3a19oHBKs1szeqvr250pLqX39b5+8lDqmOsx/VZK4uryppVrU9d
        yfjQ+eXDY857+Iy+cvTEbl1z5HLAsOxOb3PON4eCMuuYiAMkZ2b+AuiBlI+rAwAA
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpPbiBUaHUsIDIwMTktMTEtMDcgYXQgMDk6MjYgKzAxMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6
DQo+IE9uIFdlZCwgTm92IDYsIDIwMTkgYXQgMzoyNSBQTSBhbmRyaXkuc2hldmNoZW5rb0BsaW51
eC5pbnRlbC5jb20NCj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
DQo+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTI6MjU6MThQTSArMDAwMCwgVmFpdHRpbmVu
LCBNYXR0aSB3cm90ZToNCj4gPiA+IElmIG5vIG9uZQ0KPiA+ID4gZWxzZSB3aWxsIHRha2UgdGhl
IHBpbmN0cmwgcGFydCB0aGVuIEkgY2FuIHByb2JhYmx5IGRvIHBpbmN0cmwNCj4gPiA+IHBhdGNo
ZXMNCj4gPiA+IGZvciB2NS42IGN5Y2xlLg0KPiA+IA0KPiA+IEZvciBwaW4gY29udHJvbCBJbnRl
bCwgc2luY2Ugd2Ugc2VuZCBQUiB0byBMaW51cyBhbmQgaXQgd29uJ3QgYmUNCj4gPiBkaWZmZXJl
bnQgdG8NCj4gPiBoaW0sIHdlIHdvdWxkIGxpa2UgdG8gc2VlIHBhdGNoIHBlciBkcml2ZXIuDQo+
IA0KPiBJdCBpcyBnZW5lcmFsbHkgZ29vZCB0byBidW5kbGUgdGhlc2UgY2hhbmdlcyBiZWNhdXNl
IHNvIG1hbnkNCj4gZHJpdmVyIG1haW50YWluZXJzIGFyZSBwYXNzaXZlLiAoTm90IEludGVsISkN
Cg0KVGhhdCByZW1pbmRlZCBtZS4uIEkgZ290ICd1bmtub3duIHJlY2lwaWVudCcgcmVwbGllcw0K
PG5hbmRvci5oYW5AZ2UuY29tPjogNTUwIDUuMS4xIE5vIHN1Y2ggdXNlciAtIHBwDQo8c2VtaS5t
YWxpbmVuQGdlLmNvbT46IDU1MCA1LjEuMSBObyBzdWNoIHVzZXIgLSBwcA0KDQpmcm9tIGJvdGgg
U2VtaSBhbmQgTmFuZG9yIC0gd2hvIHNlZW0gdG8gYmUgdGhlIG9ubHkgbWFpbnRhaW5lcnMgbGlz
dGVkDQpmb3IgWFJBMTQwMyBHUElPIEVYUEFOREVSIGluIE1BSU5UQUlORVJTLg0KDQpYUkExNDAz
IEdQSU8gRVhQQU5ERVINCk06ICAgICAgTmFuZG9yIEhhbiA8bmFuZG9yLmhhbkBnZS5jb20+DQpN
OiAgICAgIFNlbWkgTWFsaW5lbiA8c2VtaS5tYWxpbmVuQGdlLmNvbT4NCkw6ICAgICAgbGludXgt
Z3Bpb0B2Z2VyLmtlcm5lbC5vcmcNClM6ICAgICAgTWFpbnRhaW5lZA0KRjogICAgICBkcml2ZXJz
L2dwaW8vZ3Bpby14cmExNDAzLmMNCkY6ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwaW8vZ3Bpby14cmExNDAzLnR4dA0KDQpBbnlvbmUga25vd3MgbmV3IG1haWwgYWRk
cmVzc2VzIG9yIHBlcmhhcHMgdGhlIHNlcGFyYXRlIGVudHJ5DQpmb3IgWFJBMTQwMyBzaG91bGQg
YmUgcmVtb3ZlZD8gDQoNCj4gSWYgeW91IGFyZSBjb25jZXJuZWQsIHdoYXQgYWJvdXQgd2UganVz
dCBtYWtlIGEgc2VwYXJhdGUgcGF0Y2gNCj4gZm9yIHRoZSBkcml2ZXJzIHVuZGVyIGRyaXZlcnMv
cGluY3RybC9pbnRlbCBhbmQgYnVuZGxlIHRoZSByZXN0Pw0KPiBQb3NzaWJseSBHZWVydCB3YW50
IHRoZSBzaC1wZmMgY2hhbmdlcyBzZXBhcmF0ZWx5IGFzIHdlbGwNCj4gYXMgaGUgYnVpbGQgaGlz
IG93biBwaW5jdHJsIGNoYW5nZXMuDQo+IA0KPiBSb3VnaCBjb25zZW5zdXMgYW5kIHdvcmtpbmcg
cGF0Y2hlcy4NCg0KSW4gZ2VuZXJhbCAtIFdoaWNoIG9uZSBpcyBoYXJkZXI/IHhEDQoNCkJ1dCB0
aGlzIHdvcmtzIGZvciBtZS4NCg0KQnIsDQoJTWF0dGkgVmFpdHRpbmVuDQo=
