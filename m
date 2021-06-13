Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBDB3A5AE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 01:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbhFMXLx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Jun 2021 19:11:53 -0400
Received: from mail-eopbgr1320094.outbound.protection.outlook.com ([40.107.132.94]:36505
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232133AbhFMXLx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Jun 2021 19:11:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8nHA4uFPmXmSjoBJQ2kdui24vDmmSvaWWlyTn3lQxoBIUGUyLxaNJrJgrC6/IqhYphFw5nGKd8iyVny0IpdkU/1GrJ2l7pQ50/Rer79gTnJe2ni3wdKNYp84NqTutOhdQ1009mPa5kRX09arde6xcNy9ic08b1ezq/uZdBTXANG0EI3c76x4AjD6mxsvzd74x2hQb0HmuyC3B4hs2PuXWTQ836op8zKeFYbO6ES+1Sx9m88l1EGQMYH25U+za3WKxxQy++kq9iDq+NZZyeqizRTLjhLiPVn/7XjSEyZk9/+K7vu9U6TMXzZDHIpyDN/uSOvMaMIiZPYlLzcaB4LrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHVgK5l0EoGR5W3209BCEks6A4nZFfeJD9WaaZ5Kidw=;
 b=cWukpI0/Ji4xQz60OqjvX3uGwjxPtk6bsPvP0Zb0sNUTuRbd5x+V0juL3YcpIuAx1Hm2MMkXvc3A1ubj5M98+uJ68261K/PyWqOxctIImMO/OsdAxpG1JHoS83RjfloSgBzD7ONPZ8d0WYRwYh/KyCroTrjr9Kx9TWeCtGDay7jxbM2UbZrp4V+x75wXFaspEEhwfq2dt38jYvQcmcMD0Yc0PcHTwDX0ULsGaXUs4/uLqkQHNenr1tyNMAvm5oiw68g3j2WZrNqcvJfRFl6v8T37O8zysyu3jEZxAogHuj9oPfzj3EAwHFpmvmmFFoE7sKPjTR9gXNYSPD/xichZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHVgK5l0EoGR5W3209BCEks6A4nZFfeJD9WaaZ5Kidw=;
 b=KuUHt+/OYC5kPgjW5PDpFqPZD8udrHStSyVcs1R8x+yHVgJbIKIaCyElVeD9qq2SPObM57eNRTxQlGVmEhSay2e8hsgunh8cRMCjKVwdrtm719bAbQQamjUWpHgq5Umbs/cHJFgxa6ZgR5GsPHlz5OYWK7v+5eQNbRof+yKWxdc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2570.jpnprd01.prod.outlook.com (2603:1096:404:77::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Sun, 13 Jun
 2021 23:09:48 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4219.025; Sun, 13 Jun 2021
 23:09:48 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Fix superfluous interrupt happens
 after usb_pkt_pop()
Thread-Topic: [PATCH] usb: renesas_usbhs: Fix superfluous interrupt happens
 after usb_pkt_pop()
Thread-Index: AQHXXrAl3oGBwSWR9UqYPWlt9Cdaa6sOo3uwgAArmYCAA8TvIA==
Date:   Sun, 13 Jun 2021 23:09:47 +0000
Message-ID: <TY2PR01MB3692555C6EAC8F02BC8B3D63D8329@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210611105411.543008-1-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB36925F99E90B91E235CEE168D8349@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <YMNl7+FClXrdBr5M@kroah.com>
In-Reply-To: <YMNl7+FClXrdBr5M@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:744b:7451:4fdf:2881]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3806c08-a74f-4dd5-4ac0-08d92ec0572e
x-ms-traffictypediagnostic: TY2PR01MB2570:
x-microsoft-antispam-prvs: <TY2PR01MB25706BABA78F54840B9FD4DED8329@TY2PR01MB2570.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1GHFB3g6DbyfAJZRtOr82JfIS8YNXEkBRDR0wCxQgnf7VOzFI6rMBXCgRAlQitN8GykGDiNrDdvuwSD5csPTp4jdzXAwM0pfaSnAjGWaC35OEIWoQbHxy6GxRscKcye3uT2f5GlV+quYlTVdilJaMhknld/Y/QBeX3SzRWV/H8GoaJx/1ynNnDDnJOCt1s3Assg1esk39qD5xRB4bCugPR1ifwK4PloqUmvtjKoDUr+nRg1cCYKZR/gWxezTzC+QbLDVZJkIlbf5/0tAhhK7FJEv8y11u1oj7flHvp84RRUMc7g9OeY4hQW71hJiwJlkz2xJJ3F+sxHgC3f2nwXdwLgUomoXqME9rSX+qrvQQUYCCJ8wdogv7i+wI8b32OjL0U+Na4L2nzhKnIQLBb31zGhykoq4rFhR4hshHRLjpauEp+C245GYjUjc7+mrR0hSFlK0bOiDp+iUy+XHhkjRR7KlXzwa2gEUTzNghQmlTQ81OJT0k3/Fq/FbRXR1Yx5wK+iigKBAOHocdk27r+j2EKSR5wpjMpKMT1G0A0IuvsnByihd2SfMILRGo5olMhRYeIs1KOeb1uBp/jkgU9kJmh2LQ4ntEGXZVtfai56qDAr1RZAceZFVSbwYNZINVifpnK9DH0zKvjh1wwZDl0t6+Bx9q3y/LZvKavD+3h/oRNVDS3mY7z3kPPPcE7/a7QhmKSkjYUZT0IXQFhTyZN1Pke2Vpoy0iXKXL2Uu4ZFGx8c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(478600001)(316002)(2906002)(54906003)(122000001)(53546011)(7696005)(71200400001)(4326008)(6506007)(66556008)(966005)(8936002)(66946007)(86362001)(76116006)(6916009)(186003)(55016002)(4744005)(33656002)(8676002)(38100700002)(64756008)(52536014)(5660300002)(66476007)(9686003)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?guVjCwqeKHnR9wN0WmULAWjQ59oE/0y1WVRa9pVaQX7GcFR+GEjjTpsD9+QF?=
 =?us-ascii?Q?8MPSIcjIyw0WAQjBrrY9isxsMxOdvaVeDo5A6X6nSk8ufmLCwNcyE6mUryD5?=
 =?us-ascii?Q?xX0nXi7Gziuu3mOGjneFjlHiuJkkD8TyeJKTqZOOTtxCv/Z1kRpK0z13/xvh?=
 =?us-ascii?Q?V6r3r0BqwJ924r6s77+BLdTgCPswOaid9uiLJayWYw25FI+fSucuW2uVTCqf?=
 =?us-ascii?Q?jFFx11k0T+ZBMevInoRKc5reCfKlGVjx6Ga40+1oUISLrxhWzpfzVwD9QwPF?=
 =?us-ascii?Q?cQoHlvuo5sKje9HPXWQ43XacJClPAIfBhqxuVE+ys3VqqV7YS+Ke0P1ub8Rg?=
 =?us-ascii?Q?6ZC3WGwJvuXKfCxjax+w5Ren4ZW9rFubtpiCUu1ETEQ9/P2Vs+l9C5wxVo/z?=
 =?us-ascii?Q?51M/5g3yUf5fIND7fR/LkJroFwREZhmHxjx1Yfe07bLVY6lE3bgU4EjNdKNP?=
 =?us-ascii?Q?UFsN+FKgFhHu+0gwROlYUCU5ru0Ii8sHuMf6b1JWDSl7hUWeEPvtl2xekEHe?=
 =?us-ascii?Q?5dOu/61h3muo6mSo84/VDow5vjVbAktKf/IIZ2omHLuzTOVFrGn8y/jtgXYE?=
 =?us-ascii?Q?Q6nE9pZnSjdPpjQBgUKDUUubGO2lyJdeusgYCXBiRQKLklGHxz1rreY2LoAF?=
 =?us-ascii?Q?KXWmV8YPW4ZpHANGMwC5wS7pBExhW3JH26GhfvTdHw3G5fB2WwyN7ukEAB//?=
 =?us-ascii?Q?olfSWI8zAKeg54LNWUpUAU2XxG5nivUKlkikiwFcJGsdH1+Ou6gwuVF9SxyP?=
 =?us-ascii?Q?8Uf/GVWRLT9zvoVVQBeAs/J7H9CT/Ixgo3vWz+LiE+GPbh6GO75yM2KN05D6?=
 =?us-ascii?Q?EM4cs3dXHRpFkp3cEFmpZaj3+gufYFhQPKPalxjpEdQIgZtaksI5GmxmI8nf?=
 =?us-ascii?Q?QDsCVvB4LkLzMfFH5wHjnnEfekOO9cPQhPoMMQLVySGPyA+baU+lJ3LtVi98?=
 =?us-ascii?Q?nAnK/2z/1t1A/byhcyass+Ag36PBNj4D2DBp/DI3GogSisCmBwPY+egTTnL/?=
 =?us-ascii?Q?c/NaRkqMnO3dVxcB3bw9g47zjV2hizxA24eHShFH0poGz2MrrCE2k4YEZW3W?=
 =?us-ascii?Q?HAMePnBYPHc3FmHcoVVmX2TWzHJCwDrrjIGHNKVMU2WrENm1F9ZhewxJ59UD?=
 =?us-ascii?Q?wSCdAzSYwv7BVdoBcPl7xkBMqRN05RVIdeeVotCA2gK9KO5jauBidB/G6K0W?=
 =?us-ascii?Q?9gPpknMl/wNjy8RGDyL0kPrwTFvwt9LijdoididI/wbHR6JrxucBQUW2/AVG?=
 =?us-ascii?Q?GSdk8d/TVeIfYE0rspeelGgzlrGyluToMY1IcKVb+3Erz+nX90RukrqOH1YX?=
 =?us-ascii?Q?voOlHYwG++AKnZtdG6MEI1tCAa5ImNLBTE2A6758KdHjqXah6Aa6neWoYk83?=
 =?us-ascii?Q?HhWzR7c=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3806c08-a74f-4dd5-4ac0-08d92ec0572e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2021 23:09:47.9346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wHL9OLywjIfv+bGGqgeFOf87rwtLm0ruqvFVqmv7LT/d8ZAC9kTNo6cBvnAvweHghJApHlf7Tx/5hLyFM9IEv6N5OOzwcbFjNbfmStFU6fn3//DxiEakUt7AndtxfZ/b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2570
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

> From: gregkh@linuxfoundation.org, Sent: Friday, June 11, 2021 10:33 PM
>=20
> On Fri, Jun 11, 2021 at 10:57:56AM +0000, Yoshihiro Shimoda wrote:
> > Hi again,
> >
> > > From: Yoshihiro Shimoda, Sent: Friday, June 11, 2021 7:54 PM
> > > Subject: [PATCH] usb: renesas_usbhs: Fix superfluous interrupt happen=
s after usb_pkt_pop()
> >
> > I'm sorry. I mistook to send this patch.
> > So, I would like to recall this version.
>=20
> Which version/patch?  You sent 2 here.
>=20
> confused,

I'm very sorry for the confusion. I would like to recall this patch which i=
s subject
"[PATCH] usb: renesas_usbhs: Fix superfluous interrupt happens after usb_pk=
t_pop()"

And, I would like to apply the patch which is the following:
https://lore.kernel.org/linux-renesas-soc/20210611105411.543008-2-yoshihiro=
.shimoda.uh@renesas.com/
Subject: "[PATCH] usb: renesas_usbhs: Fix superfluous irqs happen after usb=
_pkt_pop()"

Best regards,
Yoshihiro Shimoda

