Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A95837BA1F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Oct 2023 17:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjJEPIU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Oct 2023 11:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbjJEPHP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 11:07:15 -0400
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F49022C89
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Oct 2023 07:41:32 -0700 (PDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-59-we0tadfBPmiF8azyarhGZw-1; Thu, 05 Oct 2023 10:40:11 +0100
X-MC-Unique: we0tadfBPmiF8azyarhGZw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 5 Oct
 2023 10:40:10 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 5 Oct 2023 10:40:09 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Prabhakar Mahadev Lad" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] clk: vc3: Use clamp() instead of min_t()
Thread-Topic: [PATCH] clk: vc3: Use clamp() instead of min_t()
Thread-Index: AQHZ92tiRFkl3d0ZyU+GXpw6cHGohrA66bOQ
Date:   Thu, 5 Oct 2023 09:40:09 +0000
Message-ID: <2fd4fce6142b43a19cd39e94e316f059@AcuMS.aculab.com>
References: <20231004064220.31452-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXageyQyqaGXJbmmpcKyjoO-VHWGzGk_WJ1YsAne+iiSw@mail.gmail.com>
 <ZR58uDLC99WUwkr2@smile.fi.intel.com>
In-Reply-To: <ZR58uDLC99WUwkr2@smile.fi.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RnJvbTogQW5keSBTaGV2Y2hlbmtvDQo+IFNlbnQ6IDA1IE9jdG9iZXIgMjAyMyAxMDowNw0KPiAN
Cj4gK0RhdmlkDQo+IA0KPiBPbiBXZWQsIE9jdCAwNCwgMjAyMyBhdCAwOTo1MDowOUFNICswMjAw
LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4gT24gV2VkLCBPY3QgNCwgMjAyMyBhdCA4
OjQy4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4g
PiA+IFRoZSBtaW5fdCgpIGlzIG9mdGVuIHVzZWQgYXMgYSBzaG9ydGN1dCBmb3IgY2xhbXAoKS4g
U2Vjb25kbHksIHRoZQ0KPiA+ID4gQklUKDE2KSAtIDEgaXMgc3BlY2lmaWNhbGx5IHVzZWQgYXMg
dGhlIHZhbHVlIHJlbGF0ZWQgdG8gdGhlIGJpdHMgaW4gdGhlDQo+ID4gPiBoYXJkd2FyZSBhbmQg
dTE2IGlzIGEgc29mdHdhcmUgdHlwZSB0aGF0IGNvaW5jaWRlbnRhbGx5IGhhcyB0aGUgc2FtZQ0K
PiA+ID4gbWF4aW11bSBhcyB0aGUgYWJvdmUgbWVudGlvbmVkIGJpdGZpZWxkLg0KPiA+DQo+ID4g
VGVjaG5pY2FsbHkgaXQgaXMgdHdvIGJ5dGUtc2l6ZWQgcmVnaXN0ZXJzIGZvcm1pbmcgYSAxNi1i
aXQgZmllbGQgOy0pDQo+ID4NCj4gPiA+IFJlcGxhY2UgbWluX3QoKS0+Y2xhbXAoKSBpbiB2YzNf
cGxsX3JvdW5kX3JhdGUoKS4NCj4gPiA+DQo+ID4gPiBTdWdnZXN0ZWQtYnk6IEFuZHkgU2hldmNo
ZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+
ID4gPiAgZHJpdmVycy9jbGsvY2xrLXZlcnNhY2xvY2szLmMgfCAyICstDQo+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay12ZXJzYWNsb2NrMy5jIGIvZHJpdmVycy9jbGsvY2xr
LXZlcnNhY2xvY2szLmMNCj4gPiA+IGluZGV4IDNkN2RlMzU1ZjhmNi4uNTA3NzJmNjEwOTZmIDEw
MDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9jbGsvY2xrLXZlcnNhY2xvY2szLmMNCj4gPiA+ICsr
KyBiL2RyaXZlcnMvY2xrL2Nsay12ZXJzYWNsb2NrMy5jDQo+ID4gPiBAQCAtNDAyLDcgKzQwMiw3
IEBAIHN0YXRpYyBsb25nIHZjM19wbGxfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5z
aWduZWQgbG9uZyByYXRlLA0KPiA+ID4gICAgICAgICAgICAgICAgIGRpdl9mcmMgPSByYXRlICUg
KnBhcmVudF9yYXRlOw0KPiA+ID4gICAgICAgICAgICAgICAgIGRpdl9mcmMgKj0gQklUKDE2KSAt
IDE7DQo+ID4gPg0KPiA+ID4gLSAgICAgICAgICAgICAgIHZjMy0+ZGl2X2ZyYyA9IG1pbl90KHU2
NCwgZGl2NjRfdWwoZGl2X2ZyYywgKnBhcmVudF9yYXRlKSwgVTE2X01BWCk7DQo+ID4gPiArICAg
ICAgICAgICAgICAgdmMzLT5kaXZfZnJjID0gY2xhbXAoZGl2NjRfdWwoZGl2X2ZyYywgKnBhcmVu
dF9yYXRlKSwgMCwgQklUKDE2KSAtIDEpOw0KPiA+DQo+ID4gSSdtIG5vdCBzdXJlIHRoaXMgaXMg
YWN0dWFsbHkgYW4gaW1wcm92ZW1lbnQuLi4NCj4gDQo+IFRoYXQncyB3aGF0IExpbnVzIGFjdHVh
bGx5IHN1Z2dlc3RlZCB0byBkby4NCj4gDQo+ID4gV2hpbGUgSSBhZ3JlZSAiQklUKDE2KSAtIDEi
IG1hdGNoZXMgdGhlIGV4cHJlc3Npb24gdHdvIGxpbmVzIGFib3ZlLA0KPiA+IEkgZmluZCBpdCBo
YXJkZXIgdG8gcmVhZC4NCj4gPiBQZXJoYXBzIGludHJvZHVjaW5nIGEgVkMzX1BMTDJfRkJfRlJD
X0RJVl9NQVggZGVmaW5pdGlvbiBtYXkgaGVscC4NCj4gDQo+IEVpdGhlciB3YXksIGJ1dCBVMTZf
TUFYIGlzIHJlYWxseSBzZW1hbnRpY2FsbHkgd3JvbmcgaGVyZS4NCg0KVGhhdCBjb2RlIGFsbCBs
b29rcyBjb21wbGV0ZWx5IGhvcnJpZCBhbmQgc3RyYW5nZS4NCkknZCBoYXZlIHRob3VnaHQgdGhl
IDE2LWJpdCBmcmFjdGlvbmFsIHBhcnQgKDAuLjB4ZmZmZikgd291bGQNCmJhc2ljYWxseSBiZSAo
KHJhdGUgKiAweDEwMDAwKS9wYXJlbnRfcmF0ZSkgJiAweGZmZmY7DQpCdXQgdGhhdCBpc24ndCB3
aGF0IGlzIGJlaW5nIGNhbGN1bGF0ZWQuDQooSXQgbWF5IG5lZWQgdHdlYWtpbmcgdG8gYXZvaWQg
dGhlIG11bHRpcGx5IG92ZXJmbG93aW5nLikNClRoZW4gdGhlcmUgaXMgdGhlIG11bHRpcGx5IGFu
ZCBkaXZpZGUgYnkgMHgxMDAwMSB3aGljaCBpcw0KZXF1YWxseSBzdHJhbmdlLg0KDQpCdXQgSSdk
IGp1c3Qgd3JpdGUgMHgxMDAwMHUgYW5kL29yIDB4ZmZmZnUuDQoNCj4gDQo+ID4gQlRXLCBpZiB0
aGUgaGFyZHdhcmUgd291bGRuJ3QgdXNlIHR3byBieXRlLXNpemVkIHJlZ2lzdGVycywgYnV0IGEg
cmVhbA0KPiA+IGJpdGlmaWVsZCwgb25lIGNvdWxkIHVzZSBGSUVMRF9HRVQobWFzaywgbWFzaykg
aW5zdGVhZC4NCj4gDQo+ID4gU2Vjb25kLCBjbGFtcGluZyBhbiB1bnNpZ25lZCB2YWx1ZSB0byB6
ZXJvIGlzIGZ1dGlsZSwgYW5kIG9wZW5zIHVzIHRvDQo+ID4gd2FybmluZ3MgbGlrZToNCj4gPg0K
PiA+ICAgICB3YXJuaW5nOiBjb21wYXJpc29uIG9mIHVuc2lnbmVkIGV4cHJlc3Npb24gaW4g4oCY
Pj0gMOKAmSBpcyBhbHdheXMNCj4gPiB0cnVlIFstV3R5cGUtbGltaXRzXQ0KPiANCj4gRGF2aWQs
IGlzIHlvdXIgc2VyaWVzIGZpeCB0aGlzIGFzIHdlbGw/DQoNCkl0IHdvdWxkIGxldCBtaW4oKSBi
ZSB1c2VkLg0KVGhlIGNvbXBpbGVycyBzaG91bGQgcmVhbGx5IGJlIGxlc3MgcGVkYW50aWMgYWJv
dXQgdGVzdHMgZm9yDQp1bnNpZ25lZCBiZWluZyA+PSAwIC0gZXNwZWNpYWxseSB3aGVuIHRoZXJl
IGlzIGFuIHVwcGVyIGxpbWl0IGNoZWNrLg0KDQpJIGNvdWxkIG1ha2UgY2xhbXAoKSBhY3QgYXMg
bWluKCkgZm9yIHVuc2lnbmVkIHdpdGggdGhlIGxvdyBsaW1pdA0KaXMgemVybyAtIGJ1dCBpdCB3
b3VsZCBiZSByYXRoZXIgb3Zlci1jb21wbGljYXRlZC4NCg0KCURhdmlkDQoNCj4gDQo+ID4gPiAg
ICAgICAgICAgICAgICAgcmF0ZSA9ICgqcGFyZW50X3JhdGUgKg0KPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgKHZjMy0+ZGl2X2ludCAqIFZDM18yX1BPV18xNiArIHZjMy0+ZGl2X2ZyYykg
LyBWQzNfMl9QT1dfMTYpOw0KPiA+ID4gICAgICAgICB9IGVsc2Ugew0KPiANCj4gLS0NCj4gV2l0
aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCg0KLQ0KUmVnaXN0ZXJlZCBB
ZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMs
IE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

