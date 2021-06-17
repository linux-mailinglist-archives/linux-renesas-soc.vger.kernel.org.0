Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304AE3AB68F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 16:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhFQO5Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 10:57:24 -0400
Received: from mail-eopbgr1410110.outbound.protection.outlook.com ([40.107.141.110]:8992
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230299AbhFQO5Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 10:57:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHem8Bsmnr74WZxGoyJ/gL2PAiwG2q3F3G+mx2JjYtPNOAg4yYMAxqf2ANiVa7r0hehHcF6VY0f5NuPK5mjXjM1Z/6pBzXmgTD3yE/4JazEpRgheWJrqZpQtHsM6XHh2zy3IWFIeVnwXnXk+S1qa3oueCri30DsMeW8FROTRhqW1VqING53Nxu+3oKlKjgQ9sjIvsULUz6Eu5q3rR6SeKq6FU3kzwCldxQspsBWMdq+KXp2udszeDcyeTQUNMHHPdcA/VT2mt9Kpx5P/xCJnlE+LGc79ikNmwIZi1PDgKKTVxk+QZMZdzj8a5LFYKrgCawMeTKDRtmLUkVrCBEII6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aAy2PTslGvCCp8dWb/xioMwd1m4BjoW4TZYrIoRpxI=;
 b=VhVGPTJaMwNz26n7wKyOBCeU7fqflR9mGDpkB5YkYBue3uRDP9/UWiOJ52XxoK1QqU/JdpYztOBTpphvdKVfaMLuvhHkDt7ZAki0p50ZmDUQvv91Nb4XYh4478LlGcK6+a48F+CVZ9zJsu8EA+Efv0OZ69MwOuahyOoBlfjz7wTAEcxGPb7FdxQCndlKyhIhQ1cHTlAeKbn70EYWl11O3uyGvM7sk5o7+nEjRNvpSZKng9InXeNtl641KzoyOpu8SHWrGxLyx1sqMCAAVA+HL+aYe1NHZiyswZh6BwOy8xL26hjbDEnnLV5tv9hOLsTdbj9CD5c+hzCz/0/Iy5yHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aAy2PTslGvCCp8dWb/xioMwd1m4BjoW4TZYrIoRpxI=;
 b=YuR4umhOoVfbyDkE9KVV8gGn+MZ74VTInoz1+BCuGFDlwUi0aw8zLJ41k4iuxJA/quJZoLaMnQEX0SLxdDxXDh0BLVifcSPPwk+WElOHPo351+y8w9MOi8FkHilTCQPNosFeRUtlLsSSrX01nWF2FaNAuBR7UB9CRKYvdzeaHsQ=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OS0PR01MB5364.jpnprd01.prod.outlook.com (2603:1096:604:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 14:55:13 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::79f9:fd59:1111:55e6]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::79f9:fd59:1111:55e6%8]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 14:55:13 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [bug report] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
Thread-Topic: [bug report] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
Thread-Index: AQHXY33i2Wlsz5nzFU2l9cu5KTp2NasYPe0QgAAJSQCAAAK5IA==
Date:   Thu, 17 Jun 2021 14:55:13 +0000
Message-ID: <OSZPR01MB7019DDB3F023A85D48364152AA0E9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <YMtP/QHWljGcv3JX@mwanda>
 <OSZPR01MB7019B7DD71AB6E3FE04AE51CAA0E9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <20210617144312.GQ1901@kadam>
In-Reply-To: <20210617144312.GQ1901@kadam>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.219.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9640a8b4-e08e-4d37-7c0c-08d9319fe940
x-ms-traffictypediagnostic: OS0PR01MB5364:
x-microsoft-antispam-prvs: <OS0PR01MB5364929A5D25A8656A98A254AA0E9@OS0PR01MB5364.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1L3arqEi2UAUYN1NhTc+fn5jnNilbzEc8fN4cZ4h57tmWAwdSH4qZe3tlATtl7s98ZYVj+P1XJQ6czbeoZBCAD53XlGm2GsYMEIdI5R/sXpXEAa0NbjuqrYHIu+NmMdddH5jCY3Nfxl7TD2UygeqqvXcEET2EQ5ZSBbld/G8jyOV4bd+xpaOQt6PMu0AnTzUzE2mtL6cOHdCIZOSsLuvQFtmZV/6IFWZeM0siecwTXnPTTWsEISBeXSyZl18C2Im11UrvFUx1b14my25tRBWsrUERYGNCqNTn94d9tKtWcz6VZ03ajHvU7BJRUqYrK6TNJZ1DiMtYmZO8wqc//u6nE69Um52Zdb3JQgdW82GjykpK/OVl1ldi50BwgNL2ygA0w3VEU3XNvUoSvkD3gsuRjV3A3ep8EpJZepb7anQMYCuUskgkXb1Pa2BMrEcjHR0l1BTtImfR0xDSB/S5iFCWUtjA11wHPImogerN0W396htDn0q6OmqWclNnFIjpLqbXCWW+417DlI5ue09pdOf74rdUwUa0+7Hk9MyL8Iq8rQg8Yzc2a5KkKJI3rmFewQGcNeULASoox8NbfUKgoGTWEc1pn1w8psPAacx1chjkQs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(55016002)(71200400001)(83380400001)(38100700002)(66446008)(122000001)(76116006)(66946007)(66556008)(66476007)(64756008)(33656002)(6916009)(316002)(26005)(478600001)(8936002)(8676002)(4326008)(9686003)(186003)(86362001)(52536014)(5660300002)(7696005)(2906002)(6506007)(53546011)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JYrV9JLS9phrAJVSzuT07Pdb3lmjTVnaWHB8nKLg9fGy20S4+2qzAzlqC92P?=
 =?us-ascii?Q?i8OHeLU+M6siushIw4BUMbWkFx9zSQ2gQ2VdSnz2oHrYmd5wFPyXYAP0Gtkn?=
 =?us-ascii?Q?MDeB6t+HVkS0Hp7keZeApDq+ezycNswo1wpzIH9rwbYKWuDpOOZOlg1qPty/?=
 =?us-ascii?Q?+iJXA7IhVnD/Pf1MNH69mGPbr5M7Gy8fHsdDP6AJMpzcquIZcSYoBa0D4/Bv?=
 =?us-ascii?Q?1ILSrGhragRah/8cwZR/ToRqYo8o0LIoeRKU0szlz+4YwuqgXcgkZYf377qo?=
 =?us-ascii?Q?EZKqdhaEcMVk4pDxzFVVpH0hJfp7jxtb/YS8K5zVepDl5og5WTh7kDfVFvUr?=
 =?us-ascii?Q?1hVcQywuDLA8t/SggqSqX32RquwO8NjXnOyxkmFn2vSholP2u5yfQT/DK2FB?=
 =?us-ascii?Q?wQlkYkb44WNrsRIXOM+iEQ+UssAwPgsHx5G39m6VocU5B9B8y2IRGtZq3QCe?=
 =?us-ascii?Q?8xYkYBQDBugEsXuz7eKRvqMBY+89Uw820yivsv0DYzYarSiCPeaPplvpfSxx?=
 =?us-ascii?Q?hHO3YUL02uAqb/KaUnjCt4u1fJMLZB1hGy5Z/+TDiqFpOWBOVztH3vvQjvNR?=
 =?us-ascii?Q?74L5x9/iyfRQ+Uqv/n7f/Ef1d2INBDMLaVq5uJZ9VqAdshRLCIPgKp4kWcom?=
 =?us-ascii?Q?gtAyIL1n0p5Tx82EyILFBwa06hiFCr1zGUvVOg6lRj/NjP/KttHFU6I3q5W6?=
 =?us-ascii?Q?S+34oPVsn6S0yIe3vp6qXH3k0zOs8TL1C37DRI6JhHw+3ssfUs636LlY90IB?=
 =?us-ascii?Q?FLERrjJSRMo/guXt7D/xSlLdPuZ3NGDVJG28jHW04ijtUJpfpYUfNS+BzpPX?=
 =?us-ascii?Q?xcQUBsi4N0x1/ubKsW8H6p9B6p+R+rRyeU8QI271XnKN29j4kMezK5l7oHYg?=
 =?us-ascii?Q?yEBWBwz6QnEQkO0OYVBW6uEJoXjzG+PuyO6QUJ+BecD+/3HcisOlspyE9mJG?=
 =?us-ascii?Q?NviZjpPsEnzdrzJWWpZxVEWs/lUXRbPT5eUHniKx3cs7H+VLWKM2Xa8TsVZa?=
 =?us-ascii?Q?x4Ol44xkWL8rIy7gxZZvYtWZDHN4uCegVX8jGPYXLDvL5oED0qGahpLYhAx3?=
 =?us-ascii?Q?GHVnRt0Jf/SnMpo652O3XHks46NV8BHCfmz1tqFAYeydLQf8mH1rriH5U8RD?=
 =?us-ascii?Q?Gdb6c7TQlcDP2ViMKelG2TCIYaAp78Nq67CgPtkE4T3vRBOB5dqrXws7nT09?=
 =?us-ascii?Q?gs3gPF42piHDADDm80M3zr7ddPBWz/hTcZxz0RTgMwxk2EPB7ogUGAH7tXzG?=
 =?us-ascii?Q?6ZrbkIqQj0izd62AUksdz8yT7tiU8CrsuaF4VBPO08/OHW6dv6+bBYF98EXv?=
 =?us-ascii?Q?xkw5hGZCuQK2yz+RYOlPr/jk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9640a8b4-e08e-4d37-7c0c-08d9319fe940
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 14:55:13.0562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4z9X8jUw5pMTt7dELmljQXMyDp5dZeJ2mX5tp6KbJENWZ/dBQagbnW5OY3+mZNsTUKDicCkkRMZ5RPF82f/lr49hc/VeCD0p/qLzd2amyyhnOrwzWIGn4q/MlBz8ZCMe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5364
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: 17 June 2021 15:43
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org
> Subject: Re: [bug report] clk: renesas: Add CPG core wrapper for RZ/G2L S=
oC
>=20
> On Thu, Jun 17, 2021 at 02:14:06PM +0000, Prabhakar Mahadev Lad wrote:
> > >    223                          dev_err(dev, "Invalid %s clock index =
%u\n", type, clkidx);
> > >    224                          return ERR_PTR(-EINVAL);
> > >    225                  }
> > >    226                  clk =3D priv->clks[clkidx];
> > >    227                  break;
> > >    228
> > >    229          case CPG_MOD:
> > >    230                  type =3D "module";
> > >    231                  if (clkidx > priv->num_mod_clks) {
> > >                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >
> > > Smatch did not catch it, but this condition is definitely off by
> > > one. ;)
> > >
> > Good catch this definitely needs to be if (clkidx >
> > (priv->num_mod_clks - 1)
>=20
> The size - 1 format is riskier because there is a potential for underflow=
.
>=20
Agreed, >=3D check should do the trick.

Cheers,
Prabhakar=20

> Imagine that in the future priv->num_mod_clks is zero.
> "priv->num_mod_clks - 1" is now UINT_MAX and any value of "clkidx" is acc=
epted.  In this case, you
> know that the value of num_mod_clks if 57 but it took me some time to fig=
ure that out and ensure that
> it couldn't be zero.
>=20
> regards,
> dan carpenter
>=20

