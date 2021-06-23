Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32913B1964
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 13:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhFWL40 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 07:56:26 -0400
Received: from mail-eopbgr1410105.outbound.protection.outlook.com ([40.107.141.105]:47856
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230182AbhFWL4Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 07:56:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cG1B6n8V5qr/fKBkyFUkEHs5azP9kndq22tUXjP7Hi2ZCLHVs0VZsQw7LDhIJ6f+ffEBlQ0OUyCYgrkSuxRHR7nQKYluI7d48CQiMAcA/R7GmRSWr73GsUY6dPqK2YS2MG4GHggkGolyE8231zg6OEMfCe/gyUYISlNZtAKxL9G+lVegGLLfBBc1TzGUt9rVMjEo4aDtpy4UKpV8IDiKOWAED/Ir/V8qwd+sgn1cT/PN8tI3k8hPl8xosGpqDIM79MQW1ptmQXSLXnv9yamzkj58wYfelJHhXueFn9aDiTcOXZpx0A8+wYMFG8GVT2W2XVxnOoJpETJe/plbgSq9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKLDQ2fNfmevL1qr5kTzvKhxEuQIvM2HjqAZZYuRVVs=;
 b=EONzoY3JHf4mZSX0Vbbb39EIFUh8U+VBUW/BQ0Q4JmwcO18kPvoV4nG7LHjKTvwK/IfGgtjpCWlLgQm2El/zQRTLmp1FeR4Dgqxw3LMjpdEYAWFLBKiQEzUEVwHfPkMlj3F3QfonZiU/kR2EePyWcxGooAYJCCappdGH49SK2Mkx4EKVNWiizreYqJakZef0zU+wYOXGJIulekd9osWOLjTk6g+kP4yH5l6Gyn31KgfoaOVYHAzj7251rBc/T/cXeYa6l1/UH2O2+H48IacsDZmfI1UKWvB5460M/DOKuo5zKHAAA1IMnQpPMlHLMCMD7VCVhDPqusdRE8F7D0m6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKLDQ2fNfmevL1qr5kTzvKhxEuQIvM2HjqAZZYuRVVs=;
 b=eHAjAuNfXVMqPSKTf/Dn94bhbbdJr6s1VhYfYayfFc6e1YTJ5RPi3DWuyaIrsy5eQcV2EIIXPf6vjWNVfUN3M+gibYko/v9OqMA3MWAWfjoNpg+jVcFmo00Wxj2qvLzyzuW76/PBQxxZFNjGc1ZbJXE3If97rd/Iz3zx52eitDw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB1905.jpnprd01.prod.outlook.com (2603:1096:603:15::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 11:54:05 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 11:54:05 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 10/11] phy: renesas: phy-rcar-gen3-usb2: Add OTG
 support for RZ/G2L
Thread-Topic: [PATCH v2 10/11] phy: renesas: phy-rcar-gen3-usb2: Add OTG
 support for RZ/G2L
Thread-Index: AQHXZoFznG1LvyJquEaSi6z7En8La6shPzUAgABAdAA=
Date:   Wed, 23 Jun 2021 11:54:05 +0000
Message-ID: <OS0PR01MB592290660DF9D2062486A82586089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-11-biju.das.jz@bp.renesas.com>
 <TY2PR01MB369203283E466150FD9E1DD0D8089@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB369203283E466150FD9E1DD0D8089@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d590b1b-2f72-4827-62ad-08d9363d9a25
x-ms-traffictypediagnostic: OSAPR01MB1905:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB1905A4454B22C26EE4B8F67286089@OSAPR01MB1905.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2OhATZ0uejyX0y3BAXRVW7rRfPp0wkzXsdwcxq5ryEZSR9/sySp9IjvvkrrDJe2iDQzspayK8AnxUOgdgXbxu4GTbSsKz7p4+eos9Ou5l0E86Et28hJA49TN5dnv4FuK6UIFdCDa/gMlQRSmz30h0Rgrqf/fs/gt8qw9M0SpoqCMjeDf3wDD2ZtiDm6qXCNLdyTDzw2T7hI7RyPTIHv0+pvHL97OyKbmRCOXnuAjhU3Y690UbRTWZCBsXi7d0MloNhVHj6VXOp+ykzhZ1NS4oPZYA/GehNktbBEugDyGuOzaRyfVq4sSjiy/ysAj/b48k5CYAZOecOKudYcmqgjWJG/NHsNmyVfQfu/LLQtjsIS1tyiOf3jOPUIqGT8aPj+TCzpSipsjEj2/00pjP6KKsSaXmWCTZ9gbc87SMhWZ2DuxNWJl6EUODDJI0uKaI9bP6bCEmf62IoIssH/jqzt1i5keDyK57DSqPr7PxK1U0cLKgPMDjbeb1Ki9FEjeQklX613fxd9yeSdj3EqhyHY59ya0Jaa1MuRcPL24eUR6oKB8VJjTYTXcufo1I+4Ui4MXKg5x2UjUCPY7xA9TiTGqrcKSI7hi8d3rOu3xAP5CX8E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(7696005)(122000001)(8936002)(86362001)(83380400001)(66476007)(33656002)(66446008)(2906002)(66556008)(64756008)(6506007)(76116006)(107886003)(4326008)(66946007)(8676002)(26005)(6862004)(5660300002)(316002)(186003)(52536014)(478600001)(71200400001)(38100700002)(54906003)(55016002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nGVeo+FzGYU3NGdsMniOHt5Gj5kkeNMZVPefSsgKWODJTuWXqlrqZKpo5TkL?=
 =?us-ascii?Q?ID3LTh3PHP6Kwst51t0Cpd0IESyEDWN4Vk/ca9MHeYbHbGnbLCnq1raQ5lQg?=
 =?us-ascii?Q?E+gzh/8vv85YhoC+l2CmGeZDkuyhuTOqs5N5LlMMT5lrbm+UPL1pFzZJRbv3?=
 =?us-ascii?Q?jhEdkUYAhDZ0+uasXbDybTn/pw1hogpa593mharDYbevz9FqqfzoKDLIyd07?=
 =?us-ascii?Q?tNcHoXeQQopdbCfL79eeAY+5cBXh0qTU+pOOg4AflqC3AneciHojVDXvHIMN?=
 =?us-ascii?Q?CXzWG4whkEd752TREgP4cbb0kaqZ19OL6wuIqxnEXo/l12XGBKpoaIsbKzPX?=
 =?us-ascii?Q?bNRklsABqg+g2Ss10fDcGU3TfKeJqb197g0ATWNDtO+ITpPClCikuANZ5VDI?=
 =?us-ascii?Q?5ulZen3mVHVvwaH4QGwhEuWAArJWSBWg+pLgi9ozmRu/Bfh6UkIoemKuQpB+?=
 =?us-ascii?Q?YdLiwmBKrPSpk1IsVHh7Rlaw1KKSb6W1NxWu4RQ9owaYCtflop5exSlxKg4W?=
 =?us-ascii?Q?YAV9WyrpWAQZtBiHj7l7JHkp9HUTv+nwRIgF8CiN8C09O8poyUWXzDrZf9uL?=
 =?us-ascii?Q?fXKnkSH17NcNTgNQXsmc0MuPw7+b4emyjn+VJVgwki2olQ58mEo5hTZAlr9T?=
 =?us-ascii?Q?b3be5ZMpx29h7NQ7CP4Rqs87gjO73pdn6IhkxaQ+KmEjwDMoP/+afs/Rf38m?=
 =?us-ascii?Q?4nNM78EJZfM+3uwCHomw4NogMzajXQcu88l4BAme6lCNPQo3YN6cmQLw8S2i?=
 =?us-ascii?Q?Pxn7qwr2mAR9bk54szesqr5mwLt7UVUF3EgiYszTlgxCtH6a7tyHdOw3XNFg?=
 =?us-ascii?Q?9pHHMK9B+pNR5rmej4u1r+5/LFnvsWu9aVSiQ4i0ubDE4L7xxeLJ4XGa188b?=
 =?us-ascii?Q?w7jL8bVCiyrd0MPumfNg9WBp+zH4e+Qah06+lB+kBEJK/cQ/DIBJt4umMvoH?=
 =?us-ascii?Q?9deiu+rLbvBzvSJE2Yk4d0t2NwGoE+0G+kDajyPe0rgvNIdVPO1Yy6gnN9Cx?=
 =?us-ascii?Q?5TsqeuDZKMOwn6KPYnvQIs0FdwxdrWsTYxuPgVI00prAetGByOGZZP3grtyB?=
 =?us-ascii?Q?bJoLR2sNTjCegrunfk4X6ZJZcI6xl2+5ss7Ear10gwXiXCPmYWd6vaaY9dOH?=
 =?us-ascii?Q?clD7SHt/Zmsa4QEUoNVc0yYryIpDJFXelMWwPrU0aor5xacfjfxTS8zOzKuz?=
 =?us-ascii?Q?uZ571vDp8v7vIVLOdoZ0R4rQ+rSLYeSdjLswEemXsAJDQHfpoZcDKCdoXhZG?=
 =?us-ascii?Q?RVTyOSMj+LMCwhBcKx6jjQFQyD9XiwGhuUUGnsZBzx4dJ0xEP9faI+DgMeDV?=
 =?us-ascii?Q?964kahs+opSpSsxXdLSWz6Xr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d590b1b-2f72-4827-62ad-08d9363d9a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 11:54:05.5387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5h64ioAmThJMEbNRSFamDLs+rWiTT0Ryhsy6Za0me9KR1ObMHLrRDOvzKWV0hpRKq3uGtnUUittCHk+OhnCG0uLiq3JVDXoe5JBoVu7eSts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1905
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH v2 10/11] phy: renesas: phy-rcar-gen3-usb2: Add OTG
> support for RZ/G2L
>=20
> Hi Biju-san,
>=20
> Thank you for the patch!
>=20
> > From: Biju Das, Sent: Monday, June 21, 2021 6:40 PM
> >
> > This patch adds OTG support for RZ/G2L SoC.
> >
> > RZ/G2L USB2.0 phy is compatible with rcar gen3, but it uses line ctrl
> > register for OTG_ID pin changes. Apart from this it uses a different
> > OTG-BC interrupt bit for device recognition.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 63
> > ++++++++++++++++++------
> >  1 file changed, 48 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > index fbc55232120e..aff0749be65d 100644
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> <snip>
> > @@ -627,6 +653,7 @@ static int rcar_gen3_phy_usb2_probe(struct
> platform_device *pdev)
> >  	if (IS_ERR(channel->base))
> >  		return PTR_ERR(channel->base);
> >
> > +	channel->obint_enable_bits =3D USB2_OBINT_SESSVLDCHG |
> > +USB2_OBINT_IDDIGCHG;
>=20
> Please use USB2_OBINT_BITS instead of USB2_OBINT_SESSVLDCHG |
> USB2_OBINT_IDDIGCHG.

OK.  Will use USB2_OBINT_BITS.

Regards,
Biju

> Sorry, I thought we needed more update when I sent an email before, but I
> have this comment only now.
>=20
> Best regards,
> Yoshihiro Shimoda

