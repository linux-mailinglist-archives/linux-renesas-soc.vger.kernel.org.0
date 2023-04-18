Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECBC6E5BEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 10:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjDRIUQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 04:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjDRIUP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 04:20:15 -0400
X-Greylist: delayed 518 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 18 Apr 2023 01:20:10 PDT
Received: from mail5.swissbit.com (mail5.swissbit.com [148.251.244.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BFDB618A;
        Tue, 18 Apr 2023 01:20:10 -0700 (PDT)
Received: from mail5.swissbit.com (localhost [127.0.0.1])
        by DDEI (Postfix) with ESMTP id 91F3C3A2A23;
        Tue, 18 Apr 2023 10:03:22 +0200 (CEST)
Received: from mail5.swissbit.com (localhost [127.0.0.1])
        by DDEI (Postfix) with ESMTP id 0E6763A2691;
        Tue, 18 Apr 2023 10:03:19 +0200 (CEST)
X-TM-AS-ERS: 10.181.10.103-127.5.254.253
X-TM-AS-SMTP: 1.0 bXgxLmRtei5zd2lzc2JpdC5jb20= Y2xvZWhsZUBoeXBlcnN0b25lLmNvb
        Q==
X-DDEI-TLS-USAGE: Used
Received: from mx1.dmz.swissbit.com (mx1.dmz.swissbit.com [10.181.10.103])
        by mail5.swissbit.com (Postfix) with ESMTPS;
        Tue, 18 Apr 2023 10:03:19 +0200 (CEST)
From:   Christian Loehle <CLoehle@hyperstone.com>
To:     Richard Weinberger <richard@nod.at>,
        Biju Das <biju.das.jz@bp.renesas.com>
CC:     linux-mmc <linux-mmc@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        wsa+renesas <wsa+renesas@sang-engineering.com>,
        ulf hansson <ulf.hansson@linaro.org>
Subject: RE: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Topic: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Index: jiFrfBZIr7HKS7MkHilHFl02Bun/Q/AMgGyAaB0PmjP8vxGocA==
Date:   Tue, 18 Apr 2023 07:48:17 +0000
Message-ID: <02ceda502af34bf0af53d52598a0b71f@hyperstone.com>
References: <1674847756.113858.1681762124503.JavaMail.zimbra@nod.at>
 <OS0PR01MB5922B8343E772A762315F764869D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <971572458.117024.1681798584774.JavaMail.zimbra@nod.at>
In-Reply-To: <971572458.117024.1681798584774.JavaMail.zimbra@nod.at>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TMASE-Version: DDEI-5.1-9.0.1002-27572.006
X-TMASE-Result: 10--7.275500-10.000000
X-TMASE-MatchedRID: HXSqh3WYKft+blH4Tb5ys6ekGZXOwUBujkDrBOJwwnSPaLJ/Ca3ST9dC
        NuN/95BJbqm1oygU5OZtZw9agzfbzXZSumiWd5pP9dFc7Qbe8moC+vX9irgZJC62hjZS0WoY9td
        qeh2SlxQEBblmchCoRdsAlO8W6PSg80zZ28YwZ5zAIZTerVmo07d2noO4P7rAycmFNidOeD3+y9
        1WXLvD2b9FJ7YZqksBSStLDpMKadIZHQl0dvECsY61Z+HJnvsOfS0Ip2eEHnylPA9G9KhcvSKve
        Q4wmYdMXWPmaFoiyJsgBwKKRHe+r72ey2/UX6Qxvqpffi3eBADLS4bIGFN+ls/C1AYnDTQsXky9
        KQy89gc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-TMASE-XGENCLOUD: dd1276e3-d085-4cfa-b48a-977c296dc4af-0-0-200-0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

WW91ciBlTU1DIGxpa2VseSB0cmVhdHMgdGhlIGJvb3QgcGFydGl0aW9ucyBkaWZmZXJlbnRseSB0
aGFuIHRoZSB1c2VyIGFyZWEsIGUuZy4gaW4gcmVnYXJkcyB0byBjYWNoZS4NCklzIHRoaXMgcmVw
cm9kdWNpYmxlIGZvciBtb3JlIDRrIHdyaXRlcz8gV2hhdCBhYm91dCBsYXJnZXIgd3JpdGVzPw0K
VGhlIGVNTUMgbWlnaHQgbm90IGV2ZW4gaGF2ZSB0aGUgbWFwcGluZyBhdmFpbGFibGUgYWZ0ZXIg
Ym9vdCBhbmQgZmlyc3QgaGFzIHRvIGludGVybmFsbHkgc3dpdGNoIHRvIGl0LCBpbiBjb250cmFz
dCB0byBhdCB1LWJvb3Qgc3RhZ2U/DQoNCkFueXdheSB0aGlzIGlzIHByb2JhYmx5IG1vcmUgYSBx
dWVzdGlvbiB0byB5b3VyIGVNTUMgbWFudWZhY3R1cmVyIGFuZCBub3RoaW5nIHRoZSBob3N0IGlz
IHRvIGJlIGJsYW1lZCwgYXMgeW91IG1lbnRpb25lZCB5b3Vyc2VsZiwgdGhlIHRpbWUgaXMgc3Bl
bnQgYXQgQ01EMjUuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJk
IFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiANClNlbnQ6IFR1ZXNkYXksIEFwcmlsIDE4LCAy
MDIzIDg6MTYgQU0NClRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQpD
YzogbGludXgtbW1jIDxsaW51eC1tbWNAdmdlci5rZXJuZWwub3JnPjsgbGludXgtcmVuZXNhcy1z
b2MgPGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz47IHdzYStyZW5lc2FzIDx3c2Er
cmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT47IHVsZiBoYW5zc29uIDx1bGYuaGFuc3NvbkBs
aW5hcm8ub3JnPg0KU3ViamVjdDogUmU6IFBvb3Igd3JpdGUgcGVyZm9ybWFuY2UgdG8gYm9vdCBh
cmVhIHVzaW5nIHJjYXItZ2VuMy1zZGhpDQoNCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0t
LS0NCj4gVm9uOiAiQmlqdSBEYXMiIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gTm90IHN1
cmUsIHRoZSBmaWxlIHN5c3RlbSANCj4gdXNlZCBiZXR3ZWVuIC9kZXYvbW1jYmxrMWJvb3QxIGFu
ZCAvZGV2L21tY2JsazFwMTMgaXMgbWFraW5nIA0KPiBkaWZmZXJlbmNlIGF0IExpbnV4Pw0KPiAN
Cj4gSSBoYXZlIHNlZW4gcGVyZm9ybWFuY2UgZGlmZmVyZW5jZSBiZXR3ZWVuIEZBVCBhbmQgZXh0
NC4NCg0KVGhlcmUgaXMgbm8gZmlsZXN5c3RlbSwgSSdtIHdyaXRpbmcgZGlyZWN0bHkgdXNpbmcg
ZGQgdG8gdGhlIHJhdyBibG9jayBkZXZpY2UuDQoNClRoYW5rcywNCi8vcmljaGFyZA0KDQpIeXBl
cnN0b25lIEdtYkggfCBSZWljaGVuYXVzdHIuIDM5YSAgfCA3ODQ2NyBLb25zdGFuegpNYW5hZ2lu
ZyBEaXJlY3RvcjogRHIuIEphbiBQZXRlciBCZXJucy4KQ29tbWVyY2lhbCByZWdpc3RlciBvZiBs
b2NhbCBjb3VydHM6IEZyZWlidXJnIEhSQjM4MTc4Mg==

