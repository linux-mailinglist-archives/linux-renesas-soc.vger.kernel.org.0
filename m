Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23703D89D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 10:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234974AbhG1Igu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 04:36:50 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:56978 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234484AbhG1Igu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 04:36:50 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-175-gJF64QSnPY6TlszXg-ZCaA-1; Wed, 28 Jul 2021 09:36:46 +0100
X-MC-Unique: gJF64QSnPY6TlszXg-ZCaA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Wed, 28 Jul 2021 09:36:44 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Wed, 28 Jul 2021 09:36:44 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Geert Uytterhoeven' <geert@linux-m68k.org>,
        Len Baker <len.baker@gmx.com>
CC:     Kees Cook <keescook@chromium.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] drivers/soc: Remove all strcpy() uses in favor of
 strscpy()
Thread-Topic: [PATCH] drivers/soc: Remove all strcpy() uses in favor of
 strscpy()
Thread-Index: AQHXgfS6PeASd7OmzkqPc7xYqoccEatYEvhA
Date:   Wed, 28 Jul 2021 08:36:44 +0000
Message-ID: <80f4574c9f6c4c6780735b0fffd83363@AcuMS.aculab.com>
References: <20210725151434.7122-1-len.baker@gmx.com>
 <CAMuHMdUdmv+YmdtjGJV2Lp_Rvar4kN4uSgSTYqXX9CtCJ+qoRw@mail.gmail.com>
In-Reply-To: <CAMuHMdUdmv+YmdtjGJV2Lp_Rvar4kN4uSgSTYqXX9CtCJ+qoRw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuDQo+IFNlbnQ6IDI2IEp1bHkgMjAyMSAwOTowMw0KPiAN
Cj4gSGkgTGVuLA0KPiANCj4gT24gU3VuLCBKdWwgMjUsIDIwMjEgYXQgNToxNSBQTSBMZW4gQmFr
ZXIgPGxlbi5iYWtlckBnbXguY29tPiB3cm90ZToNCj4gPiBzdHJjcHkoKSBwZXJmb3JtcyBubyBi
b3VuZHMgY2hlY2tpbmcgb24gdGhlIGRlc3RpbmF0aW9uIGJ1ZmZlci4gVGhpcw0KPiA+IGNvdWxk
IHJlc3VsdCBpbiBsaW5lYXIgb3ZlcmZsb3dzIGJleW9uZCB0aGUgZW5kIG9mIHRoZSBidWZmZXIs
IGxlYWRpbmcNCj4gPiB0byBhbGwga2luZHMgb2YgbWlzYmVoYXZpb3JzLiBUaGUgc2FmZSByZXBs
YWNlbWVudCBpcyBzdHJzY3B5KCkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZW4gQmFrZXIg
PGxlbi5iYWtlckBnbXguY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4g
PiAtLS0NCj4gPiBUaGlzIGlzIGEgdGFzayBvZiB0aGUgS1NQUCBbMV0NCj4gPg0KPiA+IFsxXSBo
dHRwczovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvODgNCj4gDQo+IEFueSBjaGFuY2Ug
dGhlIGFsbW9zdCBvbmUgeWVhciBvbGQgcXVlc3Rpb24gaW4gdGhhdCB0aWNrZXQgY2FuIGJlDQo+
IGFuc3dlcmVkPw0KPiANCj4gPiAgZHJpdmVycy9zb2MvcmVuZXNhcy9yY2FyLXN5c2MuYyAgICAg
fCAgNiArKysrLS0NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gQnV0IHBsZWFzZSBzZWUgbXkgY29tbWVudHMgYmVs
b3cuLi4NCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvcmVuZXNhcy9yOGE3NzlhMC1zeXNjLmMN
Cj4gPiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL3I4YTc3OWEwLXN5c2MuYw0KPiA+IEBAIC00
MDQsMTkgKzQwNCwyMSBAQCBzdGF0aWMgaW50IF9faW5pdCByOGE3NzlhMF9zeXNjX3BkX2luaXQo
dm9pZCkNCj4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBpbmZvLT5udW1fYXJlYXM7IGkrKykg
ew0KPiA+ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcjhhNzc5YTBfc3lzY19hcmVhICph
cmVhID0gJmluZm8tPmFyZWFzW2ldOw0KPiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcjhhNzc5
YTBfc3lzY19wZCAqcGQ7DQo+ID4gKyAgICAgICAgICAgICAgIHNpemVfdCBhcmVhX25hbWVfc2l6
ZTsNCj4gDQo+IEkgd291bGRuJ3QgbWluZCBhIHNob3J0ZXIgbmFtZSwgbGlrZSAibiIuDQo+IA0K
PiA+DQo+ID4gICAgICAgICAgICAgICAgIGlmICghYXJlYS0+bmFtZSkgew0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIFNraXAgTlVMTGlmaWVkIGFyZWEgKi8NCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPiAgICAgICAgICAgICAgICAgfQ0KPiA+DQo+ID4g
LSAgICAgICAgICAgICAgIHBkID0ga3phbGxvYyhzaXplb2YoKnBkKSArIHN0cmxlbihhcmVhLT5u
YW1lKSArIDEsIEdGUF9LRVJORUwpOw0KPiA+ICsgICAgICAgICAgICAgICBhcmVhX25hbWVfc2l6
ZSA9IHN0cmxlbihhcmVhLT5uYW1lKSArIDE7DQo+ID4gKyAgICAgICAgICAgICAgIHBkID0ga3ph
bGxvYyhzaXplb2YoKnBkKSArIGFyZWFfbmFtZV9zaXplLCBHRlBfS0VSTkVMKTsNCj4gPiAgICAg
ICAgICAgICAgICAgaWYgKCFwZCkgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGVycm9y
ID0gLUVOT01FTTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9wdXQ7DQo+
ID4gICAgICAgICAgICAgICAgIH0NCj4gPg0KPiA+IC0gICAgICAgICAgICAgICBzdHJjcHkocGQt
Pm5hbWUsIGFyZWEtPm5hbWUpOw0KPiA+ICsgICAgICAgICAgICAgICBzdHJzY3B5KHBkLT5uYW1l
LCBhcmVhLT5uYW1lLCBhcmVhX25hbWVfc2l6ZSk7DQoNCllvdSBjYW4ganVzdCB1c2UgbWVtY3B5
KCkuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkg
Um9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlv
biBObzogMTM5NzM4NiAoV2FsZXMpDQo=

