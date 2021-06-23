Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C7D3B1829
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 12:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhFWKgv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 06:36:51 -0400
Received: from mail-eopbgr1320105.outbound.protection.outlook.com ([40.107.132.105]:43808
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229833AbhFWKgu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 06:36:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIensxMkLiiboWmRGZ+/yjVZwg1vkfVKtv+eyXviBa/br91RhCKLgawIrP6tp9XdY0428Oe5CHKjxVrMKlR/dHnu5dzqy44b4AmW6v+FlZ3LcQYTTo2zFyB9/311gQllJBG1fRbvUP36VYKkeTldKW+b8SmRpVa3YnkJoVPpSvc/ksJtV/EzTVWIgZSJ9cKLxjUiOtwxe8ysSPbPyKhyBNMMWhu1cJA8CWT7SfpyDRunIqan6sBz9GI6ltzm3oSE+HTbmTjTSLaxeTgdhivikwcL6oc9uLV8xDzZS9GnX3jLKO/eUUMPd3Yz50HvtqganejhT89pCJItj6C8Hj9x/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHB4Q18NoYcYe5U9QCbHvq96GwiIl+8TP5d55GE0EQw=;
 b=h/xIhpyUz46uDrmSyoRxkTKznTW8jwHoRCOxlP/jZNAjYmRc6F/5jHH1mpdskDqu6UaQtCOi7dgnJl5vEPh9b8rFMrICb31ORxxPlm4Pyr2X+2lrYw1LOPTlx7UdQc7XgIkzQdb1zTPownlXKY1X6oLvtCc2rnf5rmvXOk/52kWiew+c7S461PeWOQ3Izh9o9supQokD0ql8YX+f9gyVVZfJZMwJB1yYMvdqoOJEcZA8GcXc9wQEAlZDJNbbmZDXVRD/AoT8HN0+/4BYtoWmsxi8q/H/Dm7p0E7YTvK1tvjDZ7jXRGOxNmaiAivxgi/vh46Nhj6MfpXUtjD1oMxz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHB4Q18NoYcYe5U9QCbHvq96GwiIl+8TP5d55GE0EQw=;
 b=crRDC4NLYmFuV3z7naD2x8crrzIo0+OmtD2/gXutip4lacgqBxwF+Xeol9pjuBPo+xwwGA5gLeqqPlKknurkE4NM05WCdUTjW3VAiVbCMs/fkHhFn9sw41kkilWCrbse0e231oA4/0zahEJS1yZ371IUH94CrKe8fW/xTEF0dO4=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3514.jpnprd01.prod.outlook.com (2603:1096:404:e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 10:34:29 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 10:34:29 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 03/14] pinctrl: renesas: Fix pin control matching on R-Car
 H3e-2G
Thread-Topic: [PATCH 03/14] pinctrl: renesas: Fix pin control matching on
 R-Car H3e-2G
Thread-Index: AQHXXdxGBfJJC7BEGEm1oOMO0AG256shefKA
Date:   Wed, 23 Jun 2021 10:34:29 +0000
Message-ID: <TY2PR01MB36928C52ADEDDC289FF1318ED8089@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <ab1acd836e990c536ff3a8c715ce57363d3ff8cb.1623315732.git.geert+renesas@glider.be>
In-Reply-To: <ab1acd836e990c536ff3a8c715ce57363d3ff8cb.1623315732.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e215dca6-ee60-4d71-ab56-08d936327b5a
x-ms-traffictypediagnostic: TY2PR01MB3514:
x-microsoft-antispam-prvs: <TY2PR01MB3514E589950D52C6BA9DB6CBD8089@TY2PR01MB3514.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9fd7Sxq4GBnBjAG19Jg/0ikBjBSlPwswiHxNkoFQmACSdhNHIXUD3ZLD5RHdNayC5tRNztVoC8KsIovT4SCtWcq8slRQtJ/iklwRoYHGDOMvZEvHYJZcRbEhGpQpI0jKymflVsSw4kVYwtU0GnbDvt3r0zDlYmvZcIl7L5duxn28qMhGZ9H4g/+i3v/dPl5tPA9CjSyAI0JWU5zwr6mw6WJHUPhD7d2C33eThfhX1fc+eckiko6le7s8RQe4pZvKth+5XIpgALMXagjVC6a0ZhRKPPEWofJtcgJxp10VQyE0QTPNWtwTsxF4vp64mo7AVu///y60cLuFdmor7RkW7Y8KPxBMCHO25H6ezsh8LM9oqQbWdgsn9ncZcpQKg1ObzcC0e/p0JAZEVtZYbpfxLo3HtyOiCRGgBJl8bEQkyM9DaY7/U1pLn2DeukeJUYi/h8QLacsJ8m8iUn3SD5vHVl6/DSWdgI88Po9RYZEpLKBzNlM1qayiR9xobcQ9zI4HOwD3P/5UWEEXd/lS+QVxMLnbu4ds60aBENMp+swTXDWvOl5fgONzmFPF9jgpHo7NJFoKUaxn/gIRJ4ClisjdgHxZpGxkM45bdEa+bQGxMc0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(5660300002)(9686003)(8936002)(8676002)(66946007)(64756008)(66556008)(55016002)(66446008)(66476007)(76116006)(52536014)(110136005)(478600001)(86362001)(7696005)(6506007)(54906003)(55236004)(26005)(186003)(316002)(2906002)(38100700002)(122000001)(33656002)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AdKvfcKj/QKJB1F2ACU/cC82imi86rmSDs9hzWLC69DA8oJoqVIRw/xWgQKv?=
 =?us-ascii?Q?n7T3lk5aQuyOqhQ1bxFlCU5dRYr9uAvWKRGE+CRv3zK1Ynb5A1JPb62ye36i?=
 =?us-ascii?Q?OA7cq6YT7IMCPCJF3+BxJKnooxZpnFpRsfdi+L89Mag//hF020MjhwHbZhGC?=
 =?us-ascii?Q?3CpcsWkm0ULSDcufsFDiMx1giEcPFxHNJzIGGjm56tvghovJnJi4irHb+Br3?=
 =?us-ascii?Q?b3sJRPSAWMu/fmISwFxziHzFWdsYba8pH2arQgc2gYZj77TlRy0xJjLqtpwm?=
 =?us-ascii?Q?aFTQSySjWEmJCL3hFwYIvkSBP/P6dacnosP7CsZ6O6XPnP6Sf3qUJHmlwRXJ?=
 =?us-ascii?Q?TKGfJOPtQ/P6Pvt4V0DXkRHxYMEvtGV6WrLJioYxWEJX3zD8252h3ccrjLaK?=
 =?us-ascii?Q?6FtFKl75aEq6TSMv/TpMsW3NFL0GJ31SiwHtZ0xvU5r4fITCWsQFS+Ca8ff+?=
 =?us-ascii?Q?feuQSyWfrJnVhSl2mmtjTf11T0TO7ECQYVaErekpfnapjw6uHnDXOJ3Gk5y3?=
 =?us-ascii?Q?F6lQlTzpY50TlTS2vGiFizMJi7nKpaPQevTQOKA1yut5Z4LYyCSpxEG9W6/t?=
 =?us-ascii?Q?FeVNAwY9va0Yym0+47gREMbr1qZQeQfiE5asU8hXeIGeMp9myP/qaSRAIVYN?=
 =?us-ascii?Q?bbAbsHiZSKakoVmrV1KkZ8vhHY6MrbmXbqawS3h+uuKBBANx08q6HYbeYLI5?=
 =?us-ascii?Q?jz+awUZbFYaAt14plYiKmJkPaVqtbk/IBDlkEwOhtXqS0tD/3c4EUqOpU4e9?=
 =?us-ascii?Q?UyHePjYQg/D2eQwIHiGtEk/xZy7MGZxdZI0MX7jDOkizRcHDiisau0ZMd+ic?=
 =?us-ascii?Q?NwpGRPhFPXDt8yJXzUL+uC0wCqvSkA4QJS5xK0eGC+ZaHrXsUkGjQrlap9pG?=
 =?us-ascii?Q?9pkFTwAF89F1qXVmdZkcbifOIVuEBSUskD0qJSVkH553+QCTkJw5O6M88jqU?=
 =?us-ascii?Q?+qVuWJZDEa4S+DDz/59y5PDLREVnvVJaO6avPwkjGscthkup9GTD2DFFTu/F?=
 =?us-ascii?Q?foZHJPU+5nXryTFITucwQbBiJJo1Xh6GSFCDAO/g79YWfsKeutf6hDURJAmd?=
 =?us-ascii?Q?nc7FxQocs2pGCIicN32vLawTUqgyfU1kYW8BZzBuU6oJDyGxNkmZekPj5GN+?=
 =?us-ascii?Q?lgISgmVHMV8vHZkWy54Mes1Id/fvpWD9AxhnIxp+CVTWAjLG4NAqIowRO6lK?=
 =?us-ascii?Q?l0H03HiAa4gSgHD+a8oGhWNLZ3Gxcbz6ZscNmWLr/OeJsBnx5mOy/k3jo2Ny?=
 =?us-ascii?Q?O3JOek4kQuYq2tr3wYEH2JLGrTbwbieV9AeHAgEvcI4Y4bwOfsTiPHfd8JTT?=
 =?us-ascii?Q?7we9f4HDLpqTnpMKjR3RbBta?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e215dca6-ee60-4d71-ab56-08d936327b5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 10:34:29.4490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZsLCJDk9mH9YKM6n27MlmWd07yD4V8FRgW/ICWpnNM10lH7vExU/HQ1i68dGQUY1cyyz6rQKq9eoTv2CuyoJPdgL5D5cvc6SisDlgSuG+tPhyn+phfvHRhZ+RmMJMBM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3514
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, June 10, 2021 6:37 PM
>=20
> As R-Car H3 ES1.x (R8A77950) and R-Car ES2.0+ (R8A77951) use the same
> compatible value, the pin control driver relies on soc_device_match()
> with soc_id =3D "r8a7795" and the (non)matching of revision =3D "ES1.*" t=
o
> match with and distinguish between the two SoC variants.  The
> corresponding entries in the normal of_match_table are present only to
> make the optional sanity checks work.
>=20
> The R-Car H3e-2G (R8A779M1) SoC is a different grading of the R-Car H3
> ES3.0 (R8A77951) SoC.  It uses the same compatible values for individual
> devices, but has an additional compatible value for the root node.
> When running on an R-Car H3e-2G SoC, soc_device_match() with soc_id =3D
> "r8a7795" does not return a match.  Hence the pin control driver falls
> back to the normal of_match_table, and, as the R8A77950 entry is listed
> first, incorrectly uses the sub-driver for R-Car H3 ES1.x.
>=20
> Fix this by moving the entry for R8A77951 before the entry for R8A77950.

Thank you for the patch! After that, IIUC, we can remove an entry of r8a779=
51
from quirks[] in the sh_pfc_quirk_match().

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

