Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793F72C3EBA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 12:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgKYLFI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 06:05:08 -0500
Received: from mail-eopbgr1400130.outbound.protection.outlook.com ([40.107.140.130]:31200
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725792AbgKYLFI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 06:05:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAlap7B2tgtrkCEFjI7sd8+LJkI3DNGQSFQSglHWRM+o4cLd3PIcVbvh8UVzIkQfNWVCcPgEEnMM8a/dPxi3GUHwwvse5cHDuUg9bc44ekepnxDdgKl7I3FQ3Spte84eFB4xqoa6wcDh4RhfYcaMm/GjwcYxkeg1Dl0K+BIqGXYJY42FYrVUR0Ee8AtBL4FVe9o3IV/0pqT6MZJGLpZd62AOdzEVhrvxStTmHClbEEdftcG/CWiqxpOAuTIJF4sqHvKayWixBu5R6N4MuklT07sw9OBSPOlsqWHmelvGrRLynRLKp1HIdfJxI9BqJBG4Sf3kV61dGN3AAck7t3CpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R65Jt/vwV4qJJIn58EeFr1A09GeUsyXBj7UHq1NS9dw=;
 b=MopVqer+mhPCJ9Qlo5FJSjoyjyYtu36FjoZq4d/cL6aWdwChl+81ZUZ2L8yI1pTO5KQF49M+ee8iEXUW3emUSF917HAdUO1sSRpEW05cUvUJurerxD2dLnL1imyULp/iSCAszIrt7sVsqCzk1q90hZYkhiH8NHHuPQ7Uk0/6qkzA5SJkztt/6yzlIfHWvjXt+q/c42jXAu0ScX6g8t8zCjcNtvyGO9kdU6q4aVo9YxmTmc2J/RwUBCzupIb/VR22llWSEWJB/5Q1vFaUoZBH9GbiFQim7TnmtBKsLIIYht7YBi2LsHAjDQDbeMhrCoPv0t2CGVV+3OnfTbgx232GWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R65Jt/vwV4qJJIn58EeFr1A09GeUsyXBj7UHq1NS9dw=;
 b=Iv253FMFW4HjomULfVVRGy6oiIrMZ2GHs9UaRMYgpoHwDXK9I2GqDiphXV1dWVdQ/jLM9qI0tpnIyIVTiR3OPW1q9FpgneXogq8o4SdcfCmOdVxEAjEIOPa0dsmVeboQBKQ/lk+zYpl5CjNkHzk/wF1XEglIq3vzuRMpedOAhq0=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4205.jpnprd01.prod.outlook.com (2603:1096:404:cb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 11:05:04 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::59ed:a6ce:d8dc:90dd]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::59ed:a6ce:d8dc:90dd%6]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 11:05:04 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: RE: [PATCH RFT v2 2/3] mmc: tmio: Add data timeout error detection
Thread-Topic: [PATCH RFT v2 2/3] mmc: tmio: Add data timeout error detection
Thread-Index: AQHWv07MDdJVcaSnFkOo6ZOWAaI4B6nWv+MggAHTL4CAABufIA==
Date:   Wed, 25 Nov 2020 11:05:04 +0000
Message-ID: <TY2PR01MB3692C0D399265BBB2641A1BBD8FA0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201120150647.123237-1-wsa+renesas@sang-engineering.com>
 <20201120150647.123237-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB3692D348DCAA67B40C589C50D8FB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20201125085621.GD1577@kunai>
In-Reply-To: <20201125085621.GD1577@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b52b00e4-2b61-4634-36d1-08d89131f62f
x-ms-traffictypediagnostic: TYAPR01MB4205:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB4205F4EDEB81698E19F5ACA2D8FA0@TYAPR01MB4205.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 12LrcHa5VDPrCUSJ43p9dkDze/VtN8vaYbhQUCujvPQpxJEtw2h2FsyMEr5B7voCqIYjCh8JuqRGPxPgi5BgEwDNr3N7xvdTEG0h/pnk+BigjhzrCpc30+/0G2iVNz46OrNu1SBMA8XC3K6kisuCbCKISIrzENrTipWXfpymq3tb3nWIWrea2v81jdGJXFHOEBs+vz09Mx3KCqMwZwUklcp6wHoK0KbfxsqASaEBkuMbH9WrhcV/O3wtr/2+ZOAt34IcxSwOSa7BIZoMLkMdhMGqCMdvFx10Jz2ohpNdUo4zcLBBq9LD4bs6LZ2BjofqMMisQAnw0bGVEerkaBlnpw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(8936002)(5660300002)(55016002)(71200400001)(86362001)(33656002)(52536014)(66446008)(64756008)(66476007)(66946007)(8676002)(4326008)(76116006)(107886003)(9686003)(54906003)(66556008)(7696005)(316002)(6506007)(26005)(478600001)(55236004)(2906002)(83380400001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: o7CgO7ImWvhitZEMaxfH/P5rtVECnm+FUus72k6GKdjCnqj7bJ6NT9SWJizrAMZ7VzisME57GP+csnjXl9EbDUZwwsKYCh98csWFXnsQMeW7uqw7Qi/sDptZfeMBT/wol4zgpMlHxnTTPK9+LrHNVdEKJoEv9oT/UZOSeQBFDvGFDqxprUs956hCAiNHjFNDXTfe4wsM7A9H8sDT8nfljh8K8CUoURoUfrjQojynn5lw9ZhejRGUu7aQQF4nIhqL2AGNaMYDFaujmOMR64KxW9hWaWVBpvCPB1/A3Mq14RBztNOL/3eDb8ndqr4J7dCD5qFmU9QwNBlSBDggNPW3d9xQpRSFiRS6ZsZ2fpVvNx9issYBXDLMcojbkDgEfw8l7Jas5yXw3te3VsITvSGh+7mUdo/kUk2Nz7GVNxNbhBU2L6JlQflq9byN7McsV788I5SYWI1XR26PnZgn7NCUPR+qilQjxUjqQj0KpxJezEH5Oni2qnVP+xuJR3UVU5wRhhklXyjbF1Ebw3MXxM7cg/liGNYuF8kwA5Y8bjWVhJMZ6xRJsM0Qa4qVEqRjsgPC4f27r2aExSb3XWUq2Vm1gJ9+fUn1tejpoVdzfgT2F99J4aA8ODVYm9iMNS7tvQUmwVcKHz8pkGu5NtVZ3CNzc0FXLAN9HA2ZURbX1jyDQXq2DZ6mAh/3IdJQ+T4D8PUtWTG2yR4qcyU1TJplz5z/BvFEtjLXrS1+Rr/sIQserz1SX3+pyzsRhu3825OsSC1fP9RtWcZ4uWiK9RCVcCnzLp/QI99lppxiSxXyAwd+sX015TUFEzdbDAyfDnIsAzvTLfcQ5d72Ontag1XFYqBVJUEMRaA/+r+rD9ctK0sutrrOOSzXmhhvfhSBAgHSmj3lgRJih+IK4Vij0xIk24impw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52b00e4-2b61-4634-36d1-08d89131f62f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 11:05:04.1640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XXe+ONwc1C30FCM4l+Ukq9YMp1SKZhFq3Rt8pTMqKl10zQYf+Cmroj9xgAi7Lx4CicGWkVT2KodRwUAcBue5BVjRowEsvsfGxJM6rtW2boMBVctP03zY1jL2il/ou0L+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4205
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, November 25, 2020 5:56 PM
<snip>
> > The following commit [1] is a BSP local patch though,
> > we need to set -EILSEQ to retune a card for R-Car Gen3 [2]
> > by MMC core driver [3].
>=20
> So, if there is a non-removable eMMC or a SD card inserted, then we need
> to EILSEQ to enforce a retune. Otherwise it is a data timeout. Is my
> understanding correct?

Yes.

> I wonder, though, if "Gen3" is a complete description? There are SDHI
> instances on Gen2 which can also do SDR104. Won't they need the same
> treatment? Then we could say that every SDHI which has an SCC will need
> this treatment.

Hmm, since Gen2 datasheet didn't update the flowchart so that I thought
we need special handling for "Gen3". But, I'll ask hardware team whether
my thought is correct or not.

> >  - The patch also change the tmio_mmc_cmd_irq() when CMDTIMEOUT happens=
 for R-Car Gen3.
> >    But, for upstream, we should make a separated patch for it.
>=20
> I am sorry. I don't fully understand. Why does the change to
> tmio_mmc_cmd_irq() need a seperate patch?

The patch subject is "Add data timeout error detection".
That's why I thought so.

> >  - These "for R-Car Gen3" means I'm thinking we need additional conditi=
on:
> >     1) to set -EILSRQ or -ETIMEDOUT for R-Car Gen3
> >     2) to set -ETIMEDOUT anyway for other SoCs.
> >    # These are complex conditions a little though...
>=20
> Well, from what I understood this sounds not too hard. Let's hope I just
> got it correctly :)

I got it :)

> However, there is something in this patch which makes mmc_test #15 work,
> though. We still want this in this series, or do you think it is better
> to move it to a seperate series?

Thank you for the comments. I realized mmc_test #15 failed if tmio driver
returned -EILSEQ when I applied the BSP patch as the following:
---
[  206.016193] mmc0: Starting tests of card mmc0:0001...
[  206.022708] mmc0: Test case 15. Proper xfer_size at write (start failure=
)...
[  206.854082] mmc0: Result: ERROR (-84)
[  206.858632] mmc0: Tests completed.
---

So, I'm thinking retuning -EILSEQ in cmd/data timeout should be a separate =
series now.
# Perhaps we need other way to follow the retuning sequence for R-Car Gen3.=
..

Best regards,
Yoshihiro Shimoda

