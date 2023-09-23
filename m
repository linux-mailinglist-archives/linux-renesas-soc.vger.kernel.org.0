Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50AA97AC5E7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Sep 2023 01:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjIWXi1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 Sep 2023 19:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjIWXi1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Sep 2023 19:38:27 -0400
X-Greylist: delayed 904 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 23 Sep 2023 16:38:21 PDT
Received: from sender3-op-o19.zoho.com (sender3-op-o19.zoho.com [136.143.184.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6130811D
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Sep 2023 16:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695511359; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=GPbwmo3LHS3/4p7v+oTVutSHcIZoZ8ofPGscYYLfXdrAhASLk2MVzL8pz2tAFQoq6d/PqE8X6ybWdNm0iGc/P02DT1KtIoiZ73wxyGHmxBgSCxT3+nDHQLYiLmc97f3t29kGekkZCv/0x50VEo28bDspAeI+zmx9nUvHUBLsVdQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1695511359; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
        bh=a0N00YpArzAUih/1hspzwCWdnsiIjYr4OV1zuCg+2mA=; 
        b=dEzPy81FY5P4r0zi821sZdoyYsPArcRr+j99udrqX57IEDogaBoiyDvzpKIWbDBkmAYlyE+W4I+bmWX4Fn9l2QWdctiPybVC771YKGM2L2WKIreisQZJOiwBdDgKEBN8hOzs+e85U0FqsEfnNUdheHJ8qVuCbBUXCizeBOxfxdM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=icenowy.me;
        spf=pass  smtp.mailfrom=uwu@icenowy.me;
        dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695511359;
        s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
        h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
        bh=a0N00YpArzAUih/1hspzwCWdnsiIjYr4OV1zuCg+2mA=;
        b=GSRul59W4h8hm3ZWCGQWJSBG9gHD2b4u4I5oIDu39qLCZjhokXQG4DT1qRzrCSkU
        1TFMnc6RMTO7Brt60gt7Hvn2nkrhHYmNkKeGGWXyRc5sKTWUDBBK05tw0N0DHKr1lyS
        ht/JQTEf5fAZV7ZwU0WVg6wsJw2WdeDNshgs2fV6/GNlgOVq1DN19WM2Fc2olAYBAVw
        6jYFu+wT/PJmzycYAqzhgnluLTpOKZHZZLRep6H+lOUcT2Hhv1LphoKbYaK0oiEOVLc
        CSql2T1lUmIn/EuzBKKc/Nnl099X84+s2f5vUyLtudZt7urvVFOeAbDegpvQ7+sKQ91
        jD7rudimcw==
Received: from edelgard.fodlan.icenowy.me (120.85.96.110 [120.85.96.110]) by mx.zohomail.com
        with SMTPS id 1695511357624506.5964230801262; Sat, 23 Sep 2023 16:22:37 -0700 (PDT)
Message-ID: <f3b8d0823150797bde975a09b1faf6d3826d1ea8.camel@icenowy.me>
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new
 properties
From:   Icenowy Zheng <uwu@icenowy.me>
To:     Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Date:   Sun, 24 Sep 2023 07:22:30 +0800
In-Reply-To: <20230922081351.30239-8-conor@kernel.org>
References: <20230922081351.30239-2-conor@kernel.org>
         <20230922081351.30239-8-conor@kernel.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

5ZyoIDIwMjMtMDktMjLmmJ/mnJ/kupTnmoQgMDk6MTMgKzAxMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
IAo+IENvbnZlcnQgdGhlIHRoMTUyMCBkZXZpY2V0cmVlcyB0byB1c2UgdGhlIG5ldyBwcm9wZXJ0
aWVzCj4gInJpc2N2LGlzYS1iYXNlIiAmICJyaXNjdixpc2EtZXh0ZW5zaW9ucyIuCj4gRm9yIGNv
bXBhdGliaWxpdHkgd2l0aCBvdGhlciBwcm9qZWN0cywgInJpc2N2LGlzYSIgcmVtYWlucy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
Pgo+IC0tLQo+IMKgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSB8IDEyICsr
KysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+IGIvYXJjaC9y
aXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+IGluZGV4IGNlNzA4MTgzYjZmNi4uNzIz
ZjY1NDg3MjQ2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIw
LmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gQEAg
LTIwLDYgKzIwLDkgQEAgYzkxMF8wOiBjcHVAMCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJ0aGVhZCxjOTEwIiwgInJpc2N2
IjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZp
Y2VfdHlwZSA9ICJjcHUiOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJpc2N2LGlzYSA9ICJydjY0aW1hZmRjIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJpc2N2LGlzYS1l
eHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImYiLAo+ICJkIiwgImMiLCAiemljbnRyIiwgInpp
Y3NyIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ6aWZlbmNlaSIsICJ6
aWhwbSI7CgpaZmggaXMgc3VwcG9ydGVkIGJ5IFQtSGVhZCBDOXh4IHdpdGggZmxvYXQgdG9vLgoK
SW4gYWRkaXRpb24sIHNob3VsZCBYIGV4dGVuc2lvbnMgZ2V0IGxpc3RlZCBoZXJlPwoKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgPSA8MD47Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaS1jYWNoZS1i
bG9jay1zaXplID0gPDY0PjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpLWNhY2hlLXNpemUgPSA8NjU1MzY+Owo+IEBAIC00MSw2ICs0NCw5IEBAIGM5
MTBfMTogY3B1QDEgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGNvbXBhdGlibGUgPSAidGhlYWQsYzkxMCIsICJyaXNjdiI7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2aWNlX3R5cGUgPSAiY3B1IjsK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByaXNjdixp
c2EgPSAicnY2NGltYWZkYyI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByaXNjdixpc2EtYmFzZSA9ICJydjY0aSI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwg
Im0iLCAiYSIsICJmIiwKPiAiZCIsICJjIiwgInppY250ciIsICJ6aWNzciIsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiemlmZW5jZWkiLCAiemlocG0iOwo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwxPjsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpLWNhY2hlLWJsb2Nr
LXNpemUgPSA8NjQ+Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGktY2FjaGUtc2l6ZSA9IDw2NTUzNj47Cj4gQEAgLTYyLDYgKzY4LDkgQEAgYzkxMF8y
OiBjcHVAMiB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgY29tcGF0aWJsZSA9ICJ0aGVhZCxjOTEwIiwgInJpc2N2IjsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZpY2VfdHlwZSA9ICJjcHUiOwo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJpc2N2LGlzYSA9
ICJydjY0aW1hZmRjIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJpc2N2LGlzYS1leHRlbnNpb25zID0gImkiLCAibSIs
ICJhIiwgImYiLAo+ICJkIiwgImMiLCAiemljbnRyIiwgInppY3NyIiwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ6aWZlbmNlaSIsICJ6aWhwbSI7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDI+Owo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGktY2FjaGUtYmxvY2stc2l6
ZSA9IDw2ND47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaS1jYWNoZS1zaXplID0gPDY1NTM2PjsKPiBAQCAtODMsNiArOTIsOSBAQCBjOTEwXzM6IGNw
dUAzIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBj
b21wYXRpYmxlID0gInRoZWFkLGM5MTAiLCAicmlzY3YiOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldmljZV90eXBlID0gImNwdSI7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmlzY3YsaXNhID0gInJ2
NjRpbWFmZGMiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmlzY3YsaXNhLWJhc2UgPSAicnY2NGkiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmlzY3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEi
LCAiZiIsCj4gImQiLCAiYyIsICJ6aWNudHIiLCAiemljc3IiLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgInppZmVuY2VpIiwgInppaHBtIjsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgPSA8Mz47Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaS1jYWNoZS1ibG9jay1zaXplID0g
PDY0PjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
LWNhY2hlLXNpemUgPSA8NjU1MzY+OwoK

