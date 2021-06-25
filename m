Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D663B4089
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 11:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhFYJdY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 05:33:24 -0400
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:10432
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230461AbhFYJdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 05:33:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XucEkuYfnjfx9+NhQ39SYB07C9X3Go0oDy0yMljNo9ldBc4EmU3EAl9PBEvL4fjQkCt9Kf3yveXaGq/JkGB+6Iefo5K70SPuMDVQ0HUKTDCopGzePFTwBpNSQsVsS1Zvq2V4nYoCL2PYDiv8EZnvNocnu9HSJhWfE+RxiHFZxBxTh+tpfxTG8BFpo5wBUxRXeHJou2RmjjBEb5v80Mt4f48E3PSM6t4DX2q/T9q1y9cUirKyrriLzBx/IE67rnjKwW5wzKC4+ffkewnPqKcYBwQyT6aMi5s2w1SqqOU4c9ad4E5tVGydv2ZSIli6vR8tw0BAB+lCqKew3LoweeezlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM+0pjVnytI9wBsWH2N7huR3YbivAhJmD4rOGyPKAng=;
 b=nHh2sVABdc5CY/YDz739pgnj46wxtPThSXqtpPIcqS9ElUDcAVqUstpWRD69MuqkQIfcKmprRXbMG/z6YY/h7kefA45MtuLiikejPo3u/qHkZU8VCZXjmNka12YSNasV/ZhG0FCt46TGG5WI74ZJrholXsGt5GCYB/NEJQILtc8sD7gxqMhhui/k+s7Q9Um9Z/tRFUdaKEj4bqQs9JexYNYjq66xLI4+GRkV5gvUM/JmCsdmN29b/apJSy3/4lpAU1strLKIDUaZOXU1T0eat57pIPjYOfUdQxGJY2N0i1XHaH10ut76TEvkCNkL43Sdsh/Zck9d0UsV9hWiOvsh+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM+0pjVnytI9wBsWH2N7huR3YbivAhJmD4rOGyPKAng=;
 b=OHGR+O6HDscnCjyHCUa6Cr0YxpOobFlfkm+gln4CNZaY3ap17qpCvBZgTnn20JSRGymJU5wG0c6R0MmuR8AEBZabgzeCdTWvMClGZjAYuUsAxWeSy3C8r7y3Pz8SXTUxLSj0Z0yM+XXglsNl68U7/2+XYxCxY0VA5DZ/x44gcRc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2687.jpnprd01.prod.outlook.com (2603:1096:404:82::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 09:31:00 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Fri, 25 Jun 2021
 09:31:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Subject: RE: [PATCH 0/3] mmc: avoid vicious circle when retuning
Thread-Topic: [PATCH 0/3] mmc: avoid vicious circle when retuning
Thread-Index: AQHXaQvpsT6QxYEcWk2Y8L5XyXqCQqskcYZw
Date:   Fri, 25 Jun 2021 09:31:00 +0000
Message-ID: <TY2PR01MB3692F4994590D12B9C4DC0AAD8069@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210624151616.38770-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210624151616.38770-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4338dd38-fa76-447e-b474-08d937bbf1a2
x-ms-traffictypediagnostic: TYAPR01MB2687:
x-microsoft-antispam-prvs: <TYAPR01MB26877CDE031E1C201865FEFCD8069@TYAPR01MB2687.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dKsW3Xa7jW2bcpQWAQK03VVnaLx9ONIsSZFITYwUEYfATYIWqf40ksVQtRWpxaqVwvZbRaNNU/flyfYoEtLVWyQp49ss6QjpnK8ri0FTQbTbiggTVR0+lo5Tc7oBTX0GSW7h9SZL9VieDydU3NCosqW6G2xVG85YRMS/bvLkRrh58xMO6OQWZ9ZohbGByyLrtrLyhPXpZckNIUpZ4/e177LyPfA0XvR/OTjzPoA8PgDPfcAzEocQ1NXGWKIMPjmlebDSyqTg2f6siF9i3PzG43CjRqLLWtUjLdNhb2FuNX+/O82nSKOPPdxQcHVCu86n1e44KtwQQmcBS3GaQSnZFniiXEmk+H0LXTOhDTR2Nlw+Tx2huA4bkxScR2utdbDTNpgZhT/nn7oJ6t7ihM7YyTb7hsCS9JJ+n/HAjlorggsL3ATRVgG8vpcxnb76aJDGkDetcw+ikApXHrIVsYn07VkhJtmigTKikADYAH7Y5nOOLQ0XJNs1v9LR0lkXgCSmJQ1xlY7Fb/W1nJcLdjb/i20jFH/Ej0KuF4uHoJTYYx+YmgwCgBdtpnmXlPBRa3D3K6dz5o15pg465Lko5i7em+ARnlaWYGeJYPH5pwBJsP0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(136003)(346002)(39850400004)(66946007)(38100700002)(66476007)(66446008)(66556008)(26005)(8936002)(7696005)(64756008)(2906002)(33656002)(6506007)(76116006)(122000001)(4744005)(55236004)(55016002)(478600001)(4326008)(9686003)(52536014)(110136005)(5660300002)(86362001)(71200400001)(8676002)(316002)(54906003)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SAbgnIP6P+qqoiuCQWM8rbtFrW5wFRVwlX5Jgn6t0opL6iSWEd2lPC8cPCmy?=
 =?us-ascii?Q?qrAp0e667zeqMp+SkkuDzdFyKwlFsGuzEJo8hMbW932nGOjFv6FwlTIwzv5r?=
 =?us-ascii?Q?OGWQwq4cSLrcShuvhA4aHVsRtpPXSaQOmAfi3QJNm/mTjmTW7C3jm3N+X6ZI?=
 =?us-ascii?Q?F5fgd2qp0YSy2BBEWQkaIxYrfkMqWWieHRkGqNWyy/ow07mdzMSfVee7UpR/?=
 =?us-ascii?Q?LSe1B6W1pdROMq9rfqg8uRIFP0qKT0DMq5efv2nhRlAVQskER741WKnEPQvu?=
 =?us-ascii?Q?Gu/LyyQYhniHKL/6vsO1lu+hnHmZRYssMCp6hcZp9Kg/Rn3bFdXgI8dJl4L0?=
 =?us-ascii?Q?OIYiwbICfkN+HULMzHEyNcyQB9CuqKkYXsCh+zqU+yM9e3AFK6JT6hcI4JuJ?=
 =?us-ascii?Q?M5OEXPUhbScQb+FHb1eJbBWtJOG4F+Z+tQFLZCExkivSK2Me/rMhH62JNcKg?=
 =?us-ascii?Q?btZy1IBcNLKO+WrVoiutrWSG56AM4b71MP6AYcF6jFY9ilVXUkiuQMcAkoac?=
 =?us-ascii?Q?wRlcIuAY752m6vAhApl2btyHMMIm7dcv6lCEkhhmp1SZH+0AzQ70pgG9vUZA?=
 =?us-ascii?Q?M9d0pAzG1+cs35BLKnbmqIVUv4e8HcFeP4yeBpzvCCXo8kgbhBZ1LHEq/sNI?=
 =?us-ascii?Q?47t6+OxpAOb3252YHPMFPKrcvNk+h2DQ2bUIQmH4bpnIM14UrNfD3DcPthRZ?=
 =?us-ascii?Q?U+xPSQRek8QuzPY9zYKd0Dwws657FoUu1y0FzCWKJihnHDG9q8mopjj0FYrj?=
 =?us-ascii?Q?rYBarA0liGH9mfSv9GKLZGyfRR8GtM2ER0NtGJFFnjQmJzxbfbA9DGPZ17mr?=
 =?us-ascii?Q?YHwpfcyB1rCrhMK7fmfHePoLLKXybm1YcF1rnReWqBiljnPMgc7ID6Bvcs2/?=
 =?us-ascii?Q?2Y8kNxww0sEi1BVz08zI9BWZE1xQNoQ44DVgjhW5MIkubIHDz6M2KOQlZzCQ?=
 =?us-ascii?Q?FJibOAqtCta42ha2B+YtxZ6yJ8xcW5zCY/eUr5AVHSSK/V3YnlOXCLrKPard?=
 =?us-ascii?Q?s5bGYzJW6knijYi0eAkdz1fIOaE0jc57FEWmZ7YBetljgiIcCa5RW2KKoQU+?=
 =?us-ascii?Q?B77Ed+xRKiVtP04U9k1Ry629ddMYTtbolDLDL/Yctlxp4qchygufpE3hYx/R?=
 =?us-ascii?Q?TUTcasF7UstXTfD2BbrJHtX/+5A19yM3GcaPBZmJic0R7WzGMfU2Gq87lzpr?=
 =?us-ascii?Q?5WvJW9re+jQT9Lxc1jutMblKPJnIQ3APRJnEbpgT4/ZU1jvGCMkAe4KNu8RB?=
 =?us-ascii?Q?DItwl7eeMxTAENInS00WFixkvrOQYKKC8b4GaOaQPVAK85OZzvSzfJ6cIRhh?=
 =?us-ascii?Q?kBZGAT20GmKDw2GHXBDaHhRb?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4338dd38-fa76-447e-b474-08d937bbf1a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 09:31:00.1210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hwKPyvp/ssva7MYH9vSEQHQRUMvTF1Vcj1vJk243RdxrR04oAnA7o79OzlF6UARJSt0XdeLA1/heEmaMndsq5t6enKJi9M9FHTp3ASJuqXUwr3bMVZ3hfKfayO9xXZJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2687
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patches!

> From: Wolfram Sang, Sent: Friday, June 25, 2021 12:16 AM
>=20
> See patch 1 for a description of the problem. This series implements the
> alternative approach suggested by Adrian (thanks!). It also adds some
> documentation and a minor cleanup which I came up with while working on
> the fix. Patch 1 can go to stable as is, the rest built on top of that.

Perhaps, we can add a Fixes tag into the patch 1 like below?

Fixes: bd11e8bd03ca ("mmc: core: Flag re-tuning is needed on CRC errors")

> This series fixes the performance issue which we saw when injecting CRC
> errors on Renesas R-Car Gen3 hardware.
>=20
> Looking forward to comments!

The patches look good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested on my environment (r8a77951-salvator-xs) with local error
injection, and the performance issue disappeared. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

