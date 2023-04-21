Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 787616EAEF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 18:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbjDUQXc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 12:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbjDUQXb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 12:23:31 -0400
Received: from mail6.swissbit.com (mail5.swissbit.com [148.251.244.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8057344A0;
        Fri, 21 Apr 2023 09:23:29 -0700 (PDT)
Received: from mail6.swissbit.com (localhost [127.0.0.1])
        by DDEI (Postfix) with ESMTP id 6D574222953;
        Fri, 21 Apr 2023 18:23:27 +0200 (CEST)
Received: from mail6.swissbit.com (localhost [127.0.0.1])
        by DDEI (Postfix) with ESMTP id 532932224D3;
        Fri, 21 Apr 2023 18:23:27 +0200 (CEST)
X-TM-AS-ERS: 10.181.10.103-127.5.254.253
X-TM-AS-SMTP: 1.0 bXgxLmRtei5zd2lzc2JpdC5jb20= Y2xvZWhsZUBoeXBlcnN0b25lLmNvb
        Q==
X-DDEI-TLS-USAGE: Used
Received: from mx1.dmz.swissbit.com (mx.dmz.swissbit.com [10.181.10.103])
        by mail6.swissbit.com (Postfix) with ESMTPS;
        Fri, 21 Apr 2023 18:23:27 +0200 (CEST)
From:   Christian Loehle <CLoehle@hyperstone.com>
To:     Richard Weinberger <richard@nod.at>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        wsa+renesas <wsa+renesas@sang-engineering.com>,
        ulf hansson <ulf.hansson@linaro.org>
Subject: RE: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Topic: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Index: jiFrfBZIr7HKS7MkHilHFl02Bun/Q/AMgGyAaB0PmjP8vxGocEw2ct+x/Z5ZwOAvOJ8Zmh6KUsXr/ZciBcA=
Date:   Fri, 21 Apr 2023 16:23:25 +0000
Message-ID: <398e244a4d3746f1bd7b4c32d1ea70e3@hyperstone.com>
References: <1674847756.113858.1681762124503.JavaMail.zimbra@nod.at>
 <OS0PR01MB5922B8343E772A762315F764869D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <971572458.117024.1681798584774.JavaMail.zimbra@nod.at>
 <02ceda502af34bf0af53d52598a0b71f@hyperstone.com>
 <522326845.127346.1681805484949.JavaMail.zimbra@nod.at>
 <f50de2461dae4931abf3f0216b836fd1@hyperstone.com>
 <1186364892.150923.1681819136247.JavaMail.zimbra@nod.at>
 <1273293952.226564.1682003880265.JavaMail.zimbra@nod.at>
In-Reply-To: <1273293952.226564.1682003880265.JavaMail.zimbra@nod.at>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TMASE-Version: DDEI-5.1-9.0.1002-27580.000
X-TMASE-Result: 10--7.022900-10.000000
X-TMASE-MatchedRID: scwq2vQP8OEEyPQwW5BBaqzGfgakLdjandls9F9zmi1v8+stHWaeos79
        PlJmAmXD1eKt+ktDRM8BW0uhJTasUzuZPz8QQL7+bb4JyMK+kzCkibv63v8Su520WOXA/NsCLPJ
        tWpbJjY2QcxphQ6HjneBsBvTZAjk4UBOomz25VdHece0aRiX9WrcKVIr9tQwNyva+AirqM0WYpu
        G7kpoKR/g6/GPlsTktH2XXM8w5v7pC/bXMk2XQLIMbH85DUZXyZVXUb4KTaXv6C0ePs7A07YVH0
        dq7wY7uPefUoUh8dMNYkDF53dLWFK8x+ebofcBiIZ85+GgD7twOT08dK79K8A==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-TMASE-XGENCLOUD: bee317c1-e22a-416a-974b-0684c5db2d97-0-0-200-0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFdlaW5iZXJnZXIg
PHJpY2hhcmRAbm9kLmF0PiANClNlbnQ6IFRodXJzZGF5LCBBcHJpbCAyMCwgMjAyMyA1OjE4IFBN
DQpUbzogQ2hyaXN0aWFuIExvZWhsZSA8Q0xvZWhsZUBoeXBlcnN0b25lLmNvbT4NCkNjOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBsaW51eC1tbWMgPGxpbnV4LW1tY0B2
Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1yZW5lc2FzLXNvYyA8bGludXgtcmVuZXNhcy1zb2NAdmdl
ci5rZXJuZWwub3JnPjsgd3NhK3JlbmVzYXMgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcu
Y29tPjsgdWxmIGhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+DQpTdWJqZWN0OiBSZTog
UG9vciB3cml0ZSBwZXJmb3JtYW5jZSB0byBib290IGFyZWEgdXNpbmcgcmNhci1nZW4zLXNkaGkN
Cj4gDQo+IEkgZGlkIGZ1cnRoZXIgdHJhY2luZyBhbmQgb24gTGludXggSSBzZWUgY2xlYXJseSB0
aGF0IHRtaW9fbW1jX2lycSgpIGFsd2F5cyBtdWNoIGxhdGVyIHdoZW4gd3JpdGluZyB0byB0aGUg
Ym9vdCBhcmVhLg0KPiANCj4gQW5vdGhlciBpZGVhLCBzaW5jZSB1LWJvb3QgZG9lcyBub3QgcmVh
bGx5IHN1cHBvcnQgaW50ZXJydXB0cyBpdCBwb2xscyB2YXJpb3VzIHN0YXR1cyBiaXRzIHRvIGRl
dGVjdCBjb21wbGV0aW9uIG9mIGNvbW1hbmRzIGFuZCBkYXRhIHRyYW5zZmVycy4NCj4gQ3Jhenkg
aWRlYTogTWF5YmUgdS1ib290IHdyaXRlcyBhcmUgZmFzdGVyIHRoYW4gdGhleSBzaG91bGQgYmVj
YXVzZSBpdCBwb2xscyBub3QgYWx3YXlzIHRoZSByaWdodCBiaXRzPw0KPiANCj4gLi4ub3IgTGlu
dXggaXMgdG9vIGNvbnNlcnZhdGl2ZSBhbmQgaXQgbWF0dGVycyBmb3IgdGhlIGJvb3QgYXJlYS4N
Cj4gDQo+IFRoYW5rcywNCj4gLy9yaWNoYXJkDQo+IA0KDQpJZiB1LWJvb3QgZG9lcyBub3Qgd2Fp
dCB1bnRpbCB0aGUgY2FyZCBubyBsb25nZXIgc2lnbmFscyBidXN5LCBJIHdvdWxkIGV4cGVjdCBk
YXRhIGxvc3MuDQpUaGVyZSBhcmUgcHJvYmFibHkgc29tZSBtb3JlIGRpZmZlcmVuY2VzIGlmIHlv
dSByZWFsbHkgd2FudCB0byBnbyBkb3duIHRoYXQgcmFiYml0IGhvbGUsDQpsaWtlIGRpZmZlcmVu
dCBidXMgbW9kZXMgZm9yIHVib290IGFuZCBsaW51eC4NCkFueXdheSBJIGRvbid0IHJlYWxseSBr
bm93IGhvdyBJIGNvdWxkIGhlbHAgeW91IG91dCBoZXJlLCBpZiB5b3UgY291bGQgcHJvdmlkZSBh
IHRyYWNlIHNob3dpbmcgdGhlIGJ1c3kgdGltZXMsDQp0aGF0IHdvdWxkIGJlIGEgc21va2luZyBn
dW4gZm9yIHRoZSBlTU1DIHZlbmRvci4NCg0KUmVnYXJkcywNCkNocmlzdGlhbg0KDQpIeXBlcnN0
b25lIEdtYkggfCBSZWljaGVuYXVzdHIuIDM5YSAgfCA3ODQ2NyBLb25zdGFuegpNYW5hZ2luZyBE
aXJlY3RvcjogRHIuIEphbiBQZXRlciBCZXJucy4KQ29tbWVyY2lhbCByZWdpc3RlciBvZiBsb2Nh
bCBjb3VydHM6IEZyZWlidXJnIEhSQjM4MTc4Mg==

