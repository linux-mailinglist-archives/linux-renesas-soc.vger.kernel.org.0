Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87AE76E5C31
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 10:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjDRIgV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 04:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbjDRIgQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 04:36:16 -0400
Received: from mail5.swissbit.com (mail5.swissbit.com [148.251.244.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1AD5B81;
        Tue, 18 Apr 2023 01:36:05 -0700 (PDT)
Received: from mail5.swissbit.com (localhost [127.0.0.1])
        by DDEI (Postfix) with ESMTP id 91D533A2A3B;
        Tue, 18 Apr 2023 10:36:03 +0200 (CEST)
Received: from mail5.swissbit.com (localhost [127.0.0.1])
        by DDEI (Postfix) with ESMTP id 7D79F3A2A23;
        Tue, 18 Apr 2023 10:36:03 +0200 (CEST)
X-TM-AS-ERS: 10.181.10.103-127.5.254.253
X-TM-AS-SMTP: 1.0 bXgxLmRtei5zd2lzc2JpdC5jb20= Y2xvZWhsZUBoeXBlcnN0b25lLmNvb
        Q==
X-DDEI-TLS-USAGE: Used
Received: from mx1.dmz.swissbit.com (mx.dmz.swissbit.com [10.181.10.103])
        by mail5.swissbit.com (Postfix) with ESMTPS;
        Tue, 18 Apr 2023 10:36:03 +0200 (CEST)
From:   Christian Loehle <CLoehle@hyperstone.com>
To:     Richard Weinberger <richard@nod.at>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        wsa+renesas <wsa+renesas@sang-engineering.com>,
        ulf hansson <ulf.hansson@linaro.org>
Subject: RE: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Topic: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Index: jiFrfBZIr7HKS7MkHilHFl02Bun/Q/AMgGyAaB0PmjP8vxGocEw2ct+x/Z5ZwOA=
Date:   Tue, 18 Apr 2023 08:36:01 +0000
Message-ID: <f50de2461dae4931abf3f0216b836fd1@hyperstone.com>
References: <1674847756.113858.1681762124503.JavaMail.zimbra@nod.at>
 <OS0PR01MB5922B8343E772A762315F764869D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <971572458.117024.1681798584774.JavaMail.zimbra@nod.at>
 <02ceda502af34bf0af53d52598a0b71f@hyperstone.com>
 <522326845.127346.1681805484949.JavaMail.zimbra@nod.at>
In-Reply-To: <522326845.127346.1681805484949.JavaMail.zimbra@nod.at>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TMASE-Version: DDEI-5.1-9.0.1002-27572.006
X-TMASE-Result: 10--10.538900-10.000000
X-TMASE-MatchedRID: +f/wAVSGjug4HKI/yaqRmxqkhv3OdF4DELbqrOgWzye/u0i6nZyTEQcE
        3AwiiNlyl2GUABdhPszUKgjSAuBIVQtIvqWw+95BQ0Xm0pWWLkpSuvtBzlaEqCuB2leoSGSCXyC
        R2a++D/byW7CBa/HX2OkkeBTh96O09R7dwXny/bep3Btb1bH20Er9RmeG1EHij2iyfwmt0k/XQj
        bjf/eQSTAj0+z8xXqsBPT3/NC+4NLm3uWqybxfEv3vrjdfNHuXb5NyYlw4+HVGMe+tDjQ3Fhy7M
        kaYvOFgc3LebuSG3T5h85I0NOeGRzrgaSixcRrz3nHtGkYl/VrId1+nCKlIfpsoi2XrUn/J+ZL5
        o+vRV7xJeFvFlVDkf/cUt5lc1lLgOMB0shqXhHqZiAPz+RVv5UDpE//LmCLlqGk2udQyZR+uyKs
        t4WSGtlXxrS/LBd67
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-TMASE-XGENCLOUD: 2f965f5e-137f-4f68-a00a-aaf87166d5f3-0-0-200-0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBDYW4gaXQgYmUgdGhhdCByY2FyLWdlbjMtc2RoaSBjaGFuZ2VzIHNvbWUgdGltaW5ncyBhZnRl
ciBzd2l0Y2hpbmc/DQo+IEVpdGhlciBpbiBzb2Z0d2FyZSBvciBvbiBoYXJkd2FyZS4NCg0KTmVp
dGhlciBzaG91bGQgYmUgYXdhcmUgb2YgdGhlIG5vdGlvbiBvZiBhIGJvb3Qgb3IgdXNlciBhcmVh
IHBhcnRpdGlvbi4NCkFueXRoaW5nIGJlbG93IG1tYy9jb3JlIGlzbid0LCBpZiB3ZSBleGNsdWRl
IHRoZSBib290IG9wZXJhdGlvbiB3aGljaCBpcyByZWFkIG9ubHksIHNvIG5vdCBhcHBsaWNhYmxl
IHRvIHlvdXIgcHJvYmxlbS4NClNvIGFsc28gYQ0Kd2hpbGUgdHJ1ZTsgZG8gZGQgaWY9L2Rldi96
ZXJvIG9mPS9kZXYvbW1jYmxrWGJvb3QwIGJzPTEyOEsgc3RhdHVzPXByb2dyZXNzOyBkb25lDQpn
aXZlcyB5b3UgbGlrZSB+NTBLQi9zIGNvbnNpc3RlbnRseT8NCg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gDQpT
ZW50OiBUdWVzZGF5LCBBcHJpbCAxOCwgMjAyMyAxMDoxMSBBTQ0KVG86IENocmlzdGlhbiBMb2Vo
bGUgPENMb2VobGVAaHlwZXJzdG9uZS5jb20+DQpDYzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPjsgbGludXgtbW1jIDxsaW51eC1tbWNAdmdlci5rZXJuZWwub3JnPjsgbGlu
dXgtcmVuZXNhcy1zb2MgPGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz47IHdzYSty
ZW5lc2FzIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT47IHVsZiBoYW5zc29uIDx1
bGYuaGFuc3NvbkBsaW5hcm8ub3JnPg0KU3ViamVjdDogUmU6IFBvb3Igd3JpdGUgcGVyZm9ybWFu
Y2UgdG8gYm9vdCBhcmVhIHVzaW5nIHJjYXItZ2VuMy1zZGhpDQoNCi0tLS0tIFVyc3Byw7xuZ2xp
Y2hlIE1haWwgLS0tLS0NCj4gVm9uOiAiQ2hyaXN0aWFuIExvZWhsZSIgPENMb2VobGVAaHlwZXJz
dG9uZS5jb20+IFlvdXIgZU1NQyBsaWtlbHkgDQo+IHRyZWF0cyB0aGUgYm9vdCBwYXJ0aXRpb25z
IGRpZmZlcmVudGx5IHRoYW4gdGhlIHVzZXIgYXJlYSwgZS5nLg0KPiBpbiByZWdhcmRzIHRvIGNh
Y2hlLg0KPiBJcyB0aGlzIHJlcHJvZHVjaWJsZSBmb3IgbW9yZSA0ayB3cml0ZXM/IFdoYXQgYWJv
dXQgbGFyZ2VyIHdyaXRlcz8NCg0KWWVzLiBTbyBmYXIgZXZlcnkgd3JpdGUgc2l6ZSBJIHRyaWVk
IGlzIHNsb3cuDQpTb21ldGltZXMgKDEgb3V0IG9mIDUwKSBzbWFsbCB3cml0ZXMgYXJlIGZhc3Qs
IHRoYXQncyBtb3N0IGxpa2VseSBhIGNhY2hpbmcgZWZmZWN0IG9mIGVNTUMgaW50ZXJuYWxzLg0K
DQo+IFRoZSBlTU1DIG1pZ2h0IG5vdCBldmVuIGhhdmUgdGhlIG1hcHBpbmcgYXZhaWxhYmxlIGFm
dGVyIGJvb3QgYW5kIA0KPiBmaXJzdCBoYXMgdG8gaW50ZXJuYWxseSBzd2l0Y2ggdG8gaXQsIGlu
IGNvbnRyYXN0IHRvIGF0IHUtYm9vdCBzdGFnZT8NCg0KV291bGRuJ3QgdGhhdCBleHBsYWluIG9u
bHkgdGhlIGZpcnN0IHNsb3cgd3JpdGU/DQpJIHNlZSBwb29yIHdyaXRlIHNwZWVkIGFsc28gb24g
cmVwZWF0ZWQgcnVucy4NCiANCj4gQW55d2F5IHRoaXMgaXMgcHJvYmFibHkgbW9yZSBhIHF1ZXN0
aW9uIHRvIHlvdXIgZU1NQyBtYW51ZmFjdHVyZXIgYW5kIA0KPiBub3RoaW5nIHRoZSBob3N0IGlz
IHRvIGJlIGJsYW1lZCwgYXMgeW91IG1lbnRpb25lZCB5b3Vyc2VsZiwgdGhlIHRpbWUgDQo+IGlz
IHNwZW50IGF0IENNRDI1Lg0KDQpUaGUgZU1NQyBtYW51ZmFjdHVyZXIgc2F5cyB0aGVyZSBpcyBu
b3RoaW5nIHNwZWNpYWwgYWJvdXQgdGhlIGJvb3QgYXJlYSBhbmQgd3JpdGUgc3BlZWQgc2hvdWxk
IGJlIGVxdWFsbHkgZmFzdC4NCg0KQ2FuIGl0IGJlIHRoYXQgcmNhci1nZW4zLXNkaGkgY2hhbmdl
cyBzb21lIHRpbWluZ3MgYWZ0ZXIgc3dpdGNoaW5nPw0KRWl0aGVyIGluIHNvZnR3YXJlIG9yIG9u
IGhhcmR3YXJlLg0KDQpUaGFua3MsDQovL3JpY2hhcmQNCg0KSHlwZXJzdG9uZSBHbWJIIHwgUmVp
Y2hlbmF1c3RyLiAzOWEgIHwgNzg0NjcgS29uc3RhbnoKTWFuYWdpbmcgRGlyZWN0b3I6IERyLiBK
YW4gUGV0ZXIgQmVybnMuCkNvbW1lcmNpYWwgcmVnaXN0ZXIgb2YgbG9jYWwgY291cnRzOiBGcmVp
YnVyZyBIUkIzODE3ODI=

