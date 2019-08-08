Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F00E857E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Aug 2019 03:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730505AbfHHB6d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Aug 2019 21:58:33 -0400
Received: from mail-eopbgr1400123.outbound.protection.outlook.com ([40.107.140.123]:29051
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730038AbfHHB6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 21:58:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwaQyWYFLdz9KT5jyV7lnnW2gGBENEc7vvmsuYNqtHSTETvSQWB8UxAHACu6uC901sXZthhGdUeiRKYxmK5LyjN9uALJ8AnmWj6zy5FOU+3DEEQXsdXWs3OlZSFCxCOppiOnJeqaZvn2G/XtwgA+piCW5Yy11q6Ffh2yymO6bogp/QaawCdXBylOasyn6dVPCYseeD81cjzTS1AMfJZLjkZ6gsgIkmtwwWA/8P1rEnSHufPzZwBlVLYMZmVjzyqilzNJb5NTcxHDhPn2r3mcw88HKu/ofTPlmOhXU68/sNJqze1fBd7KgsGdchhhEsSU1hlfRMp25boIHHddQuA+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVyfQ61dnTQ5PkjK+i3FhOYXTliLEXsudkPXg5sCcfc=;
 b=hlZ/nNNZEQHYrCGO4uZKYFFSGzkJESwjj8s/psLy06li+QR3MQJyQVwzcaLRSNBtIJfnv30zguGVB8gKshUrRRUvTHoZt0xpkauJrkSfAkmA98x/cFvdc+xjC710U9XaTsUBI6VduabJodf3+SBvNiO/P6VRvjdAAAjjSQ79TD0pOBkfTitrJTm2LJUHII716z1w3F3ZBZno4sadfN1ar6s/7i9TVu7vCVzEdxUizeSm8VlmH62lfMGAVh+9s6cKTXh+QrnlTHsi5p9KlA/DnZcd1UyM9A/iW2D5nqwp8S+gR6ZaDoLwqITUDwtDqtZbRtNncs3EBPlcmnOP2bw8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=renesas.com;dmarc=pass action=none
 header.from=renesas.com;dkim=pass header.d=renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVyfQ61dnTQ5PkjK+i3FhOYXTliLEXsudkPXg5sCcfc=;
 b=i3xUeJYTSy+OBTz/SvxLsHgIn/GQG1M1ryYoUAf9ClDdts6yaFgmUaTjucN011wEogV7Jif7wY0aOldt0DOOQ43M0abnNN79v+cGuYPrMkT0Bc2ri/tFzpgbSe5wzueACOL+vLLPCIvQOwr7OK72Itp0Wo50Wydz7BFKk15VhKc=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3200.jpnprd01.prod.outlook.com (20.177.104.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 8 Aug 2019 01:58:30 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 01:58:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: rcar-usb2-clock-sel: Use
 devm_platform_ioremap_resource() helper
Thread-Topic: [PATCH] clk: renesas: rcar-usb2-clock-sel: Use
 devm_platform_ioremap_resource() helper
Thread-Index: AQHVTPz5JtCvJ1kzDk2HW5OWVA77Eqbwf2kg
Date:   Thu, 8 Aug 2019 01:58:30 +0000
Message-ID: <TYAPR01MB45442308CBF677A992C52F96D8D70@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190807084901.24359-1-geert+renesas@glider.be>
In-Reply-To: <20190807084901.24359-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cffb17cb-c196-467f-ecde-08d71ba3e99e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3200;
x-ms-traffictypediagnostic: TYAPR01MB3200:
x-microsoft-antispam-prvs: <TYAPR01MB32006166AAE2241B1BA04E88D8D70@TYAPR01MB3200.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(189003)(199004)(9686003)(81166006)(256004)(53936002)(486006)(476003)(446003)(4326008)(11346002)(33656002)(25786009)(55016002)(6506007)(186003)(81156014)(14454004)(110136005)(478600001)(74316002)(54906003)(102836004)(8676002)(26005)(8936002)(316002)(229853002)(6436002)(99286004)(7696005)(66066001)(6116002)(76176011)(305945005)(2906002)(71190400001)(52536014)(6246003)(66446008)(7736002)(5660300002)(3846002)(66476007)(86362001)(71200400001)(76116006)(4744005)(66946007)(64756008)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3200;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FNWG3VUfPrMbKhWoeyJ7kakqCBkXb5ZAQ1euYh6qKwDpeWY5L5A2QxdV3cZ86g0RWmOzzCEZaX1L5iZqP43qRTYNe1kzAaGIbMBI7bxV6va8HwNgRyJIhL+PFt6DirKvp1d9il9vzCeVye4fJL4yxT4eVa6IoLdsi2jAcfMY/Bb1mFCIW7hVYZTSb6DXGw/Hylnz3PGI5CPZHFW87Nqg/803CVsH85MH75WR3dqdyOFTio/3cE00CoHm84nzbGMmCbn5J+0glak/RP0mLs5PzU+Gxa5n7LaCKbGKuFiyKjgx/lMPl0ICpAKsP0t6+hCCvUWDLQMU6FqrlCJ0c7D5ThPQ3fKcucht6sEZpxfqZcJzB/QjZIP/irG4xNUjTVDnuVvtz9xkCX8eA5zKlSbc0u6hsoaICbYQu7Kt2OB2LYU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cffb17cb-c196-467f-ecde-08d71ba3e99e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 01:58:30.6991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: StDdbZ7fMIYW20i/qFExe2z2duSwpXMMt5ZlLyfgYOIRkqfRvxk97eVotGjesZ5tOw9Lian7N/h/6B07YJpJLKdc5IH3DPdtnAgt9RpQUpIsIy+wk7LWpckrfP38aLYi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3200
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, August 7, 2019 5:49 PM
>=20
> Use the devm_platform_ioremap_resource() helper instead of open-coding
> the same operation.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

