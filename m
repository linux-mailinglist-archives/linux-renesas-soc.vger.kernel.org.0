Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2399020DFB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 23:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388811AbgF2UjL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 16:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731727AbgF2TOP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 15:14:15 -0400
Received: from APC01-HK2-obe.outbound.protection.outlook.com (mail-hk2apc01on0708.outbound.protection.outlook.com [IPv6:2a01:111:f400:febc::708])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B38C08E81A;
        Sun, 28 Jun 2020 22:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbwSdYtd2/mf/m7RXuPMTauDzJ3pWf8RvE+Wz/bKtsinBV0ukAO8zHlo/cCwognWYOH+DGLronSpaKQPdkoKy4jVte6wOfQitUSHjmFrdU/FM5Ctspgx0endem3uvqSsedYB7MTrQFtqSGIqR1m6dFzsM9I21hs9vMF3BzZSTuVsUpl3LQb9jYbiXwY3I7OC83RRNus/fMGVCqCyi6ldu0J07KZRlqDI7LuB71denGRPJjbm2Up7cOh+NP+7FQEZky7NkZvCbyWCQxcXwozLLd3AxMNBSGQJtqodqOV4nkaaj2V9kJa+vI82WoT4Y1MQHfdir3vsWhVi9vLjNrjENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU6bJVp5twjwAufNmBP/C37WJ4RjFc7sz331r/5OrWI=;
 b=RJPX2DV5f9wRtQghopIoE/iHsGv78YBsKT9U6PkkXtHOTsoeaDDFaPijE8W5nzBn0tVFZB4AH4H0rWIuIn6xsW8cJ/j4B2xbtxV+wsprFtvMPgxgIzVx92Yma3lsRvKg4YCcLxCWkhlJlFxDUzTJSTdfaIeAukQYJZXTY52rgjgD6ecz+RxCrN7Pqlw6l6I592HKTLIASlxxCOqM6e12kaqV7B3RZQTxXM0uZMwzFbCjNHvrQCV1xKfzpFYuxmv5zlvidRY2TghynuRery1DiEBTI9cIXwKFpowrzDu9Cpr2KO76puOYAWmQ1ghyboRKupscqTXnUsUrnbhbOwKIZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU6bJVp5twjwAufNmBP/C37WJ4RjFc7sz331r/5OrWI=;
 b=WOBCG3x6dry9y9wWJbxj7umJK2XwMaiBpHH28O4m36BGOVSZAfKR/BaJOWbOodqWd0a+QhmqKACIiHUe57fPf1UjqML7laUmuTbIICGRKCgTcSsvgDxLEi7cM4Nqqs/qtUKgtgoyuJ1t0+xXKu/UzH06hEq/YGVvkh3vRTNb/Js=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2329.jpnprd01.prod.outlook.com (2603:1096:404:6b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 05:16:46 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 05:16:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Subject: RE: [PATCH/RFC v4 3/4] mmc: core: Call mmc_poweroff_nofity() if
 regulators are disabled
Thread-Topic: [PATCH/RFC v4 3/4] mmc: core: Call mmc_poweroff_nofity() if
 regulators are disabled
Thread-Index: AQHWS5y2P9SOm+4ShEmD+FQrAiQE9qjrDL+AgAQErAA=
Date:   Mon, 29 Jun 2020 05:16:46 +0000
Message-ID: <TY2PR01MB3692D8D02FF1680B2A7391B8D86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <059bced3-00d3-cf2e-6628-a8c9f1544909@cogentembedded.com>
In-Reply-To: <059bced3-00d3-cf2e-6628-a8c9f1544909@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none;cogentembedded.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b318ef9b-1faf-430c-3a10-08d81beb9ec8
x-ms-traffictypediagnostic: TY2PR01MB2329:
x-microsoft-antispam-prvs: <TY2PR01MB2329B5A32CB041739EE4BC83D86E0@TY2PR01MB2329.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wsdhJlkxId8q8l9Xot95x7fdTmruznnK7H/b5WqTXp1/HFfdyuHRrsP5VuARnvTGxdnAGYX7NitkQLPzfZnB6Ta4MOMMExhHnEl9r3RyNySD/x6SdZzsQU3NXavwhNtaMw3DCYB84AWMcAqT8wOLbwF4NF9OKYnh38RrNnw+nRDCx07in6erEuIGERn6quxwntapDaOcStpkqecm0VB4phoYiWYuuWj/yIYt9/qfGcckMhLTDIeeHccTUhRScwfMBIl+fdjVoHzyAASLvgUIWozZga1g6463GSEkkcLrBHwVIk8t+fXCuCHS1pwK+aXBWhmyWoZgG+492MSt37uFxA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(71200400001)(7696005)(83380400001)(86362001)(26005)(4744005)(186003)(64756008)(66476007)(66446008)(76116006)(53546011)(52536014)(5660300002)(66556008)(66946007)(55236004)(6506007)(54906003)(4326008)(316002)(8936002)(2906002)(55016002)(8676002)(9686003)(478600001)(33656002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: cebFixr0WPYa6cLiz0eUHvHULn7AoKnVNh1ma2O1geG9RwPD3yxpMfdW7i26hiF3qKU5CmiHWnit49byFN0ze6Lzrij0fdInCYxncKDW9b043/HwUrT4wvYol1tPuRag1p3Dr3Zf/DGmyXjMW+HkvOb2gY5t1h4IwUsKREEkPHETYjGIPPBEmaHfG++3t8YUHWURNX603CDuyVcN2sCilt8hUCpt2S0bBshJP4BgAOvw4rCw1rYeinVSdrMwykZFjJIZVBY+WyYb2ud0F1YbCivDbHF2xIHI/clEZUhNVv6oFKHY0hkEtQND9Y84EEhWpVXjFMugknij3tnC7mnP9PGtwb4ZeVDqdP+i6LpHyqRRf0A5YNldFlzz0xEfQHvlpV2My4nX43fg8vUWHOV0FLdT0aIqXjnoDQZxF4sZNT5JZiWBQJKp/wqUJSK9RPFbirRVIMfBI+hls1LTGXowTrGlt3ukrMge9nQSAun3wy/2lyvcGcXPzhEIOAGnaNjz
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b318ef9b-1faf-430c-3a10-08d81beb9ec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 05:16:46.6422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlNaZPy/8Ky5AW437YMByKVrNHdIYbjQGWmyD71atULmP1JJCm7OqzZrQcQz8/QYyapVBLx95i5I4yj6S3zYUecObVVYTO/sOW1AtdPeD9y7XULErtHHEVrTAq5V0Vcl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2329
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8hDQoNCj4gRnJvbTogU2VyZ2VpIFNodHlseW92LCBTZW50OiBTYXR1cmRheSwgSnVuZSAy
NywgMjAyMCAxMjo1NCBBTQ0KPiANCj4gSGVsbG8hDQo+IA0KPiBPbiAwNi8yNi8yMDIwIDEyOjMy
IFBNLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gDQo+ID4gSWYgcmVndWxhdG9yX2lzX2Vu
YWJsZWQoKSBvZiBib3RoIHZtbWMgYW5kIHZxbW1jIHJldHVybnMgZmFsc2UsDQo+ID4gX21tY19z
dXNwZW5kKCkgc2hvdWxkIGNhbGwgbW1jX3Bvd2Vyb2ZmX25vZml0eSgpIGluc3RlYWQgb2YNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eDQo+ICAgVGhh
dCBoYXJkIHdvcmQgYWdhaW4uIDotKQ0KDQpPb3BzISBUaGFuayB5b3UgZm9yIHBvaW50ZWQgaXQg
b3V0IQ0KIyBBbHNvLCB0aGUgc3ViamVjdCB3YXMgaW5jb3JyZWN0Li4uDQoNCkJlc3QgcmVnYXJk
cywNCllvc2hpaGlybyBTaGltb2RhDQoNCg0K
