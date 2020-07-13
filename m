Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0BB21D38A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 12:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgGMKIq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 06:08:46 -0400
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:11581
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726523AbgGMKIp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 06:08:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6MSyK0VbUuT4FL6yQ5NwzoR5rIpzzJe/VBnKg+TXxmmw1D5ycfseyuGNz9U6ZY+L5QB09QsqAYjiIR1tlO132pYmikZE3KIA5U5dwOfEB4EuFL9ifS8+sr7Nyt//MutWCgaUhnL6vljyohjQ/r7LfGmB/5vayYrPoWRkizjdvMOZdcCB9lKtZzScUvGmWPzTYdZpclxbtEBD5Fnui8LNDyXC81qFexEkcrLOZA9gZlsxjGQF9MLBUcvwFQZ5Fe5TG1aG8z7iBQCFQom975yFZqGB86w43zZByUQK+bjsThAYjsIbCu5Y6td7M6YL4IILoW407fr70fls0Z3NFhQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQPKIDPW1r8xyoPmIiVra8skgGE3BibYAkZtX2qqgXU=;
 b=DT/JSPRveYUr9/bOZP9+TmkL3ZLiOC67AoD5RKBBTaATEfY2+SdzRkgumEOHXGxwm3BvWK9er5PgskCOh5SMB8iFcZa7KzA1Q/02siyh3+iXbTiApVZYJKX7Bp4lUfdfi82EyVGh9D3tQ4I+h/vXGINqpLvHOM4JRpYW3hYeINU4e8xMuPWuikR5b5h9Or3iEApMhvb3tolHRP/wP7hjgbusFTCbzpkIlejev8OJQePdKIRzy03CtY6vu1F2RlZcjQNTBdrYtjmQMyYLlM7VykxyHIa5b8W277PTLF8+ZdaVruY+GbUoOVlET/EVZFi1e4V38MYwWwndrcFhqquBfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQPKIDPW1r8xyoPmIiVra8skgGE3BibYAkZtX2qqgXU=;
 b=X1BjVEicJacuWrgGOffl7d/1xCoC9xg2j/hKGsKFT1gz1Qk1Z2/UiZkJWQb8ykRXHv/pZYS7FMMAfg5EcMeZwc1Xo9WaLwz3clnwPn88VjFB2cK3SDGYQHjOw4HfTRIyYSLUMFkY0ak+tdKRetnF8zho+sfJEnIr5Yqivc/K1sc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3934.jpnprd01.prod.outlook.com (2603:1096:404:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Mon, 13 Jul
 2020 10:08:42 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 10:08:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Vinod Koul <vkoul@kernel.org>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: rcar-gen3-usb2: fix SError happen if
 DEBUG_SHIRQ is enabled
Thread-Topic: [PATCH] phy: renesas: rcar-gen3-usb2: fix SError happen if
 DEBUG_SHIRQ is enabled
Thread-Index: AQHWVdzOlRKh/M+DfUqZfhc9meFTe6kE/fiAgABPW0A=
Date:   Mon, 13 Jul 2020 10:08:42 +0000
Message-ID: <TY2PR01MB3692AB237DE409457E0E9A07D8600@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594290978-8205-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200713051705.GX34333@vkoul-mobl>
In-Reply-To: <20200713051705.GX34333@vkoul-mobl>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:f0e2:53b6:1775:a94c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 54907e5f-f460-4c1b-bc81-08d82714b8b2
x-ms-traffictypediagnostic: TYAPR01MB3934:
x-microsoft-antispam-prvs: <TYAPR01MB39346BF6DAA1C2625D9F653BD8600@TYAPR01MB3934.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0eHDEwLTf2rv+VSuzO3YEaL1GOVsX4IEly2v4ZUv+6jI7rDZKqFRxpGgnbyz1meSSPHj7A+T6dlH3WuER99V5aOI3l68zd8opuHNE4q+VK9UmZFZneg0Htj52ZeIpLCrzrU/vasLJSCRsHAiSZ28Z/495J057KvfjfeI7Lq/uHgyQfvrUda1hCfpOGMGSWOHSIGBeXaM2252b8sJDVfkyOX6A4SFIWjGfKZItYwdzcjnUhSBoGYEasInd+PxPm6YKiewkk9k6Yn/WZWGpkDUp/QGrVgoAEjTmn44R9u379qzusILclmUQdoFc9JtwAqd3fQTlFkw8sOn1JJtdooIrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(66476007)(7696005)(478600001)(86362001)(2906002)(8676002)(55016002)(9686003)(6916009)(186003)(8936002)(4326008)(71200400001)(33656002)(53546011)(6506007)(52536014)(64756008)(66556008)(66446008)(76116006)(5660300002)(83380400001)(54906003)(316002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 6N1iaZXg1ewAxK7wv/36cdqS3t6XmVocBGI0Pwx0lBvzuhddq5KqMTEKPJ1Khd+pqAQ93aV9MoNNJmNoVsC2DsO42xTh/idCKO98dnTBn3Oe13kxLEmrMaeNoshyLelQr3a/OF1nfEK6wk9KMkqIlVB1hTl1Oe5+BqLofW3iAul5Xvp4WSpbr05/jzz+b83YirG39LIYdi6si++WD0gboBu+jxRW9lrWci9EUIDSmCb/ND3BboobIRo+lxU6v4NGt5pHTsvygYPj7qmCGUXnewIo4x1EP7OhPtkx+94ZAwItGlt1des86MPhqcCX4+zgOyMZmgbYsblEaWA3QGE8huEdlUjdtd1x+wBnstr/GwYPN/75XPYF/N9Il/k9fAqtMcBeXjFQTc104z4HlPsH1ew7nX2cIZk6XbkCCKPvDkMGUpEelwyHXEXOkIqSb0fKt8o02aJt2V3NS5kb3KNV9aF9hHYJ/fI+DYJ/VSieyB/hJKGoWtqieYoPWmvJ15Z6EGnyqxyr/hhon98/rsWOeM+G/v+Y1BG7Pq4tcwOOXlw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54907e5f-f460-4c1b-bc81-08d82714b8b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 10:08:42.3206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L2IaYc5X7N1iW1Q/XXeRDMq8xvTq+oXQPPAYxeYwFzlsgWXmGzr4IqfDajxdqwt+hucPnOPDPgotvIEWhsd2UueYsxlGbM1yOpzxiw64eNXgU17WVqmWh8g/XwA0Fiwz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3934
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Vinod,

> From: Vinod Koul, Sent: Monday, July 13, 2020 2:17 PM
>=20
> Hi Yoshihiro,
>=20
> On 09-07-20, 19:36, Yoshihiro Shimoda wrote:
> > If CONFIG_DEBUG_SHIRQ was enabled, r8a77951-salvator-xs could boot
> > correctly. If we appended "earlycon keep_bootcon" to the kernel
> > command like, we could get kernel log like below.
> >
> >     SError Interrupt on CPU0, code 0xbf000002 -- SError
> >     CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-salvator-x-0050=
5-g6c843129e6faaf01 #785
> >     Hardware name: Renesas Salvator-X 2nd version board based on r8a779=
51 (DT)
> >     pstate: 60400085 (nZCv daIf +PAN -UAO BTYPE=3D--)
> >     pc : rcar_gen3_phy_usb2_irq+0x14/0x54
> >     lr : free_irq+0xf4/0x27c
> >
> > This means free_irq() calls the interrupt handler while PM runtime
> > is not getting if DEBUG_SHIRQ is enabled and rcar_gen3_phy_usb2_probe()
> > failed. To fix the issue, add a condition into the interrupt
> > handler to avoid register access if any phys are not initialized.
> >
> > Note that rcar_gen3_is_any_rphy_initialized() was introduced on v5.2.
> > So, if we backports this patch to v5.1 or less, we need to make
> > other way.
>=20
> Should we really check phy is initialized? I think the issue here is
> that you register irq first, so your handler can be invoked. Right fix
> for this would be to move the irq registration to later in the probe
> when we are ready to handle interrupts

Thank you for your review! I think we need to check whether phy is initiali=
zed
even if the irq registration moves to rcar_gen3_phy_usb2_init() because the=
 current
driver will have multiple phy instances. However, moving the irq registrati=
on can be
easy to backport than this patch, I think. So, I'll modify this patch as yo=
u suggested.

Best regards,
Yoshihiro Shiomda

