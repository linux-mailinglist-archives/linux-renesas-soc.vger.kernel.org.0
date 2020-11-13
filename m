Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7DE2B158A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Nov 2020 06:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgKMFar (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Nov 2020 00:30:47 -0500
Received: from mail-eopbgr1410112.outbound.protection.outlook.com ([40.107.141.112]:57072
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726071AbgKMFaq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 00:30:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gV5Ij4b7fNK0UpNOIX0V7YsZuMbPaNvAT1S6JQxGoGY5Pc7zknE6qLEqnacjPL9OdjjJ6+Ou2M0C6Hme/FrbNhhYnv2eWn+psDbNY281PsydlURgY/UO8ySRX0i1cLU8MFo9qve1vo+EVbXjk24rKC54ORiYsIry7Mxo7bStGmzRrCH+dzoufMRblHpaTgjTH9yvgZVMveR2jxmsTknahKGI/K1qvSMKPNQBoNC/7QFH08PsYxvmtIhdSXm69omOOvL5Oyv4bsLORWF9svhK/tW3JHY4fUFZFdshWMJsoDUJgB1lxcO/W+J0Y67vfWj773CkIJONXec5x8leLq3ZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvVm8zBROGeIKb96XudZdcC1HEuLGI+x5xyW4wU10n0=;
 b=HWNfc2ofQZorL5SPSHet6H5+RheE9JxDWA6qC1LPjBZjCQX2oBID8PTAREYpqvhQVHqXxAkDz+rZao6wNzzBtUJ7wqSA7isAm7qamN7NugEDpwZV2paXytym6KwwABu8B1q+8/fZduCjSOGrn7OeCLQ75oi1EILn3aSHZK68qEnlkB8Gnxg+ZeoYr1mGCv1Hooboh9y9UZF4jSnSO4pZr9sKyioVM8r30gKh5eUBgZKWicf3dQH7riAahnpTWsZj++auQ9sO35u0zmjfHNzjHsiMruIHcwny87GZwjvghfZ/CKCnlCgKyPxe+QBEL3/oRHZgGgpAeyxKEjQ+zvN7Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvVm8zBROGeIKb96XudZdcC1HEuLGI+x5xyW4wU10n0=;
 b=cZWO8UKWYwyz/L7/qJtfmInuMitIosyiDZqDjwXG8ZAGH070zjsfxUCqFQx6z5QhoLmMN490Igf/yLQHWM4Dr8i8rdOJZ6j4MXIqpiKpEVRSWtQ3a0LXJmy7HjFIYrBuzieaiwXm8m/27eKQmUKSMH8w7+RWiaHLrLwHrpReMhw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4302.jpnprd01.prod.outlook.com (2603:1096:404:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Fri, 13 Nov
 2020 05:30:42 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 05:30:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: RE: [PATCH 0/3] mmc: renesas_sdhi: refactor SCC reset
Thread-Topic: [PATCH 0/3] mmc: renesas_sdhi: refactor SCC reset
Thread-Index: AQHWt32fuNzFjdG/6kamaUONiTgfT6nFjNjw
Date:   Fri, 13 Nov 2020 05:30:42 +0000
Message-ID: <TY2PR01MB36929D74C7C8F2A7974F700ED8E60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:19d0:b06e:df1f:82b6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d4f63b2d-fae1-4778-de3b-08d887954364
x-ms-traffictypediagnostic: TYAPR01MB4302:
x-microsoft-antispam-prvs: <TYAPR01MB43023C70EF5278A0A10BDFE6D8E60@TYAPR01MB4302.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xd0B9HrBXNvKbutb2aY93lMY/fbajC2j0RrDDlCZQ8gV15f0v7GcZWRJpvrDdGCDIRTklkAfuNaYp/szOHZ6eGPJPNhAE0JVTekKTcoWFz7KO0SI+3UBNNRYJA9N4FgFwGSO5yruSwLygU405Lxh4UBU1ppG3GThxT0dsHhJBIyvd/MYCMRshJWRJOK9W89kvLcc69oRP6eIDrX6P5Q5ZslcSig8GC1yH57ODRGf3N3ZmnVoKu9ytIeATqRojnh7P9cQqkhdjAQc1em1UOd7bMOz/njVAR+aEN7Xo1zfmz4tBPU+34JOk19JtUMEBv7yLYACK9zbxX5AX0Rh6TZhUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(52536014)(4326008)(5660300002)(8936002)(33656002)(71200400001)(8676002)(6506007)(83380400001)(66476007)(66556008)(76116006)(64756008)(66946007)(66446008)(7696005)(478600001)(9686003)(86362001)(55016002)(186003)(316002)(54906003)(2906002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: zaYZdJhwcLHi9MKMzHJgA5wCmt2vY0ICAsNB6V3bBzEZyKDSM8QCGfo/+C4y/jbBUZi2lr3DvO7L2zvwncR3+yl4ak8HFqvK1e2beWdNa+MJAKsgoeDpffc1b+qlBaG/gL/P6yafNdUiEVVowiopUd+pYrCshc5MEjKaArYZNQX7n4wtYlbTt5j97wI8FfYNCvb6vcCRhI7E6KZJYLjUUQtGekEqX5jxEumc5280wlILl5Zm+fX+/W2g2buZ+NuFK3v5qiWTMOcKOFQKteB02nKgy1rguoICRwo7tMujX44R9bq9fbdQbbiypOW9V9XkAfgI5MtqvUzt39g0mz0BRJGp16iEVNUQ898+GVDY/CXAsxDZuDlxp8lxldK1W2kaIDuEqPWTmpi0cP+RsWlpalaoxIgvLnU/daK1zBxdzQkXbGJpQYM6vTcoXMBwjU5M86p64buNM+zD1v6EjyP9TnuJTSzAvxbOiBUQrkua5FWHof1DsyZvVTa5duRne6xB/cXAEMpiOsSzfCZu5vxxs4wMkESHXJwroWYyuJ8802tO8LlcuhQwTQCkfXP1yQk3ljnlNiCt2rKMH2Q6MBSLi6irgMBtJaBRiXio5/jihcSIdA5hD0WRdOUo353GllsE2328d1Lap3lJ2a/oD/YYAiF34xDpUSSLUVwVHQGqATMmlXFbPNRDxs5ReAY3eXRMiUBXTSqFRAKo14cFjWVeOw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f63b2d-fae1-4778-de3b-08d887954364
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 05:30:42.2186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3OFwN0ghCydCWgC57LRT+X+HwnxWmOefaMhdLRtBLouNS/FIv2AadZQ4OHogqv7+0KJiSg6JtDDBvRvZgr86UQptoXsZhLR+657yjMGXJ+tFrjH41Qb4JkwIHDH+fokv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4302
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Wednesday, November 11, 2020 1:22 AM
>=20
> So, after some preparations, we can take the next step and improve
> resetting the SCC. Patch #1 is a fix requested by the BSP team to be
> more robust in case the firmware did something unexpected before.
> Patches #2 and #3 are cleanups made possible after patch #1.
>=20
> Patches have been tested on a Renesas Salvator-XS (R-Car M3-N) and a
> Renesas Lager (R-Car H2) board.
>=20
> A note to Shimoda-san: I did not forget that the BSP team also suggested
> to use the SRCR3 register for a reset in probe(). However, it appears
> there is more to discuss there. This is why I decided to send out this
> series first because we want to have it anyhow. I'll send the SRCR3
> RFC-patch later this week.

I got it.

> This series depends on the just sent out series "[RFC PATCH 0/4] mmc:
> renesas_sdhi: reset SCC only when available". A branch (with some more
> extras) can be found here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/=
tap_en_v2

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Also, I tested on Salvator-XS (R-Car H3 and M3-W+). So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

