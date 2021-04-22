Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E25367D9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Apr 2021 11:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235612AbhDVJVw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Apr 2021 05:21:52 -0400
Received: from mail-eopbgr1400121.outbound.protection.outlook.com ([40.107.140.121]:15338
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235614AbhDVJVv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Apr 2021 05:21:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4j8alIpwOwvFrG1Ku/h4rAEmO7s9m26QELdD6n79FUaxvj+kef2azVggasu34dwvxoY8qK6Crej42uXyQB7fy1spU9tnxrbB/SQl9EuAv+T4BTs8unwj8uhS5zcpejuJ9wAKpqGY5Tbg2S5FCSRvyine6OYSPEFUvh69VqGN/1pGWbaUeZGSdA+sx+XVrxzh5KTiqkghxOXFOFVQwaRtk1HlJ0EfLAk7bzOPEnpo4fLB6Lrwe8bAAkToCO1JZgCJYKPmDxKilKLFliQmYGgTayKKk3ZoE9ZlHX9AVJId00duIr7aT4CkG9uGRrc8dj6vsFqOwwT+kacF4L+XDDxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QustOrrJJyy3/HYt31MqIOrpXvCG+gsVKt7fx/J8vc=;
 b=mYuyHEeSWNfYXpVdENGWQgFyqexmRD28Nx7MVdxiqMwpeNn4AmX9qBCGy7YaG0JtepxbzLQrNOZjvG0arx7pkpC5XseKo0p60lV2k5k85EFhbZkhtK3sTGwHaZz5mWzBz9Jqt/EDOJux329ufl7DvyiggT5zQbkT3ruzwsU+m64F/VsvRWwWpBLuBpYZ6fycihLXcHwFF5DutWrH2abpj30LLdzC52sHQIOibPX21sYoOJ+i1+3XuRDfqgB1YEUA36YCj+gBQy+ENOMFTuBA3ZWisKPzyQ37vqXrF2+YnNFjthnm4NOVqlTneQbEYgEHTRygBtjRcAQzpTuaKfXM+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QustOrrJJyy3/HYt31MqIOrpXvCG+gsVKt7fx/J8vc=;
 b=FMJkJDBpz68X3ugTt+SeZH8Cl55vjxSWshazxTDTlsNj/jXts5qVpfquuFq+0mXf1wpRfIOKokt9sKrAyq8tQddGFN1jg3FjKxVuqddfPn5rhGq2pkRTWZQ18PNvMfE/42GnlLpX/O1WQ9G9EDuTSn4q1ElseS4HSv3sPPpmhKo=
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com (2603:1096:603:38::21)
 by OSAPR01MB2498.jpnprd01.prod.outlook.com (2603:1096:604:7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 22 Apr
 2021 09:21:13 +0000
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::4d2d:3155:768e:50e0]) by OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::4d2d:3155:768e:50e0%7]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 09:21:13 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kangjie Lu <kjlu@umn.edu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH 073/190] Revert "media: rcar_drif: fix a memory
 disclosure"
Thread-Topic: [PATCH 073/190] Revert "media: rcar_drif: fix a memory
 disclosure"
Thread-Index: AQHXNq+r2FQrjpIKCESqwpCja0Wk4aq/UzoAgAAoHoCAAKDbgIAACOsAgAAaRACAAAQ7MA==
Date:   Thu, 22 Apr 2021 09:21:13 +0000
Message-ID: <OSAPR01MB2737433383EBC530F27333CDC2469@OSAPR01MB2737.jpnprd01.prod.outlook.com>
References: <20210421130105.1226686-1-gregkh@linuxfoundation.org>
        <20210421130105.1226686-74-gregkh@linuxfoundation.org>
        <CAMuHMdVFf3_jo+oGPm4THhan3bVZx99omkG1LnAp=B4JTKhChA@mail.gmail.com>
        <YICXdauWkNRezHgX@pendragon.ideasonboard.com>
        <CAMuHMdXN_j49MeEv2wUW5JOeYbJYU7Gj1FtEv7s744mo0x1rWA@mail.gmail.com>
        <c8dbe373-8910-5b34-ce71-cad1bcab2d71@xs4all.nl>
 <20210422110336.1d67678d@coco.lan>
In-Reply-To: <20210422110336.1d67678d@coco.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [2.28.163.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc605b39-2c9b-4ab0-a5ba-08d9056ff9b0
x-ms-traffictypediagnostic: OSAPR01MB2498:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB2498945CB78362ED5F64F3CAC2469@OSAPR01MB2498.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wt3VtuuP0hmnoaZwlI0uQ7qWQOUHoNXSG+3axJ7RCXakcsFKJquqipLYQmSJzKBQnkBiraWlRsflXv8XFP+8JPR0wEaW516XHjPJSYvsIbIkv+W8PQbAzKPuZdnkyVgl6SlViFgSUeZLWOjLh9/5rIyJ+gsx6r7rby5TcfdzUlT466mKfCFI1Go/NAg/eT0RBiGIFR3ZRMMwfOPeqIXkMO30vfpJLqFmGeYpnipzFwM7Xl72tcfYiW7YyRx2mY8QooyJKKZdFLjWFjEasffzzYPunDOX3RDe/yrr6KbXjmmC89+msajXAJ/+9zoJtfi6vJTOl6OXvFw7wyM2z4pGkhtwBCs2YyGS9na7l0bvPKNqGJfvopQ5KLdkREkBrY8S0xhKfcnmKurd+jLq67d83Jt//DY08WSd0lt3PL7Q3mI3T4sPnI8QnO837h5OQDfjtLUq9AxE6HbpKb1Qig9oWk0dPCYV3p00abehJKCOj7qzi0ojj/M6qbeU1LB7gHQ2NwnRROYFwiiqXy6Hv3s7W46relbYjo/yZ4ZCeALSxJehhqdXr3hT6rxlnXzjS6zB2SwbQoEjsNq+CQW7smGRqE6kSlLQhv6jhmLipqcM/dU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2737.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39840400004)(64756008)(66556008)(66446008)(66476007)(316002)(71200400001)(66946007)(5660300002)(122000001)(83380400001)(38100700002)(54906003)(110136005)(86362001)(76116006)(186003)(107886003)(8936002)(52536014)(26005)(2906002)(55016002)(478600001)(4326008)(7696005)(8676002)(53546011)(6506007)(33656002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?JuuDD1YcR3GOz22+xWcSOvzx84AITQIRYpNtTnQJNcrLStS0h9GXHpuuvs?=
 =?iso-8859-1?Q?+x4600DRhSbg8UCKkpc6yPzhMRYA7e5uC8xy/Hyq4/4aZA/IDaUYWq4kAG?=
 =?iso-8859-1?Q?KA83Np8p07W0qCID7RgltY4iriHTc2CVugUDRxAZjU5sSFpAK40JJPGwgu?=
 =?iso-8859-1?Q?+OTXSAlSY8sCCbVdp4V/p65SFq5Zzx9ljbEMt+UTvpAjKEuA81C9lrTwer?=
 =?iso-8859-1?Q?BZ4rat+kfkvPOBtcXMv0RdY15TozdJfOkqvjfMuYEkRBjpEy86MjG33UpT?=
 =?iso-8859-1?Q?yPnh1HUZ2DR+ykK3ltDk0khOw3PeNaQu3iHzq+lkLxHiICSY73DcNeSzCS?=
 =?iso-8859-1?Q?KMM1UiYD2W+Os0o+PbiRYM66SWGD5ZL+VFU0Niwxm0Wpzu7hB8DlO5QEEy?=
 =?iso-8859-1?Q?xN+raVcDnEh+K670prw3wwZYFOmEd5LgdJ+ngab0rxJUJ2YQB60y5wKuRl?=
 =?iso-8859-1?Q?lxxMQCQJuMZ+6uLu+a8Ps14TQ7sGR4EVSkBimuMeJAQjMBhkfPlJmE3579?=
 =?iso-8859-1?Q?2D+voxpU4iqQX97PfnVCR4t7PqK9YQIXJXu/70DyULEV2jZmlZ/LDiW7OQ?=
 =?iso-8859-1?Q?tD8IjAI+vUbByEDlIAEzEUKkufoAM+wTv0WI0r8LFxOGE11WpRoGHAJkjb?=
 =?iso-8859-1?Q?38qHHxxMDuSWsU9TPFygxM7vXBOvhKuNv2cXhrDGtV9U+k80WeBjSXR59g?=
 =?iso-8859-1?Q?znwkoD4hc6SDkGWH38yoO8GySU11nrI+6N4TGjNKnKr3Wvl6SR3fhux0fV?=
 =?iso-8859-1?Q?AVGMjAavVjcGM7qORo23Cz7oYOouTy7hsaoPu8QPRUJgI82sgSEPDSQtpU?=
 =?iso-8859-1?Q?WityDLocfXsbef+8zLCXgkxW1UA3pWtUG6NtnwJMnbAzPrf7wi036I9d/p?=
 =?iso-8859-1?Q?MfL4dXXHnDDdU7W2h9k1vj0f3CGYs6RbmJKLS3GSyjy3YYgeub4u19rGgJ?=
 =?iso-8859-1?Q?YLbbyG4IPloWQJiyIfIw65YyuhZqRahry37mugIPFKtJeHiDFS002QjlR/?=
 =?iso-8859-1?Q?G2iauIIKSmv3kutL+4f4XCo32F8dpk2mpg73VJULst/sGGyStL41fO4GTp?=
 =?iso-8859-1?Q?H9a5KaAa8QNSSzEv94KCHBAXhiVNLcUuBx5gQgSUh3A4pfcCxeojX5apc/?=
 =?iso-8859-1?Q?APoF0tSF0x/1bLFeBQL1mShu/uDuMsbABucx4ypIwWhAeC1RcpsSON7Vfo?=
 =?iso-8859-1?Q?yzmqf7bWjdogvUudPmalOZX+l5fPPrJq745sD26Cl+0Cxnt54RvW6qfhnI?=
 =?iso-8859-1?Q?Kc+NsKJ04c10yrtWcKHb7iXSt/Ep0KTMv82C0R9MTrjfnoeab23lgybssZ?=
 =?iso-8859-1?Q?hr+1X9h32CbjckjopgOqG5ZmNBXmTdlzZDesRDi/Gh6ka08=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2737.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc605b39-2c9b-4ab0-a5ba-08d9056ff9b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 09:21:13.6249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z/hN3FDN5nnQtfDd00mNiEUcopZYe7HdD8UGIDztoaWj5frZr7vJHEIU7zTHncaS+lf+DoIb/lDidNQzzHGbkiWrZ3348TdgvhOGt6xE4MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2498
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Sent: 22 April 2021 10:04
> Subject: Re: [PATCH 073/190] Revert "media: rcar_drif: fix a memory
> disclosure"
>=20
> Em Thu, 22 Apr 2021 09:29:36 +0200
> Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:
>=20
> > On 22/04/2021 08:57, Geert Uytterhoeven wrote:
> > > Hi Laurent,
> > >
> > > On Wed, Apr 21, 2021 at 11:22 PM Laurent Pinchart
> > > <laurent.pinchart@ideasonboard.com> wrote:
> > >> On Wed, Apr 21, 2021 at 08:58:22PM +0200, Geert Uytterhoeven wrote:
> > >>> On Wed, Apr 21, 2021 at 3:06 PM Greg Kroah-Hartman wrote:
> > >>>> This reverts commit d39083234c60519724c6ed59509a2129fd2aed41.
> > >>>>
> > >>>> Commits from @umn.edu addresses have been found to be submitted in
> "bad
> > >>>> faith" to try to test the kernel community's ability to review
> "known
> > >>>> malicious" changes.  The result of these submissions can be found
> in a
> > >>>> paper published at the 42nd IEEE Symposium on Security and Privacy
> > >>>> entitled, "Open Source Insecurity: Stealthily Introducing
> > >>>> Vulnerabilities via Hypocrite Commits" written by Qiushi Wu
> (University
> > >>>> of Minnesota) and Kangjie Lu (University of Minnesota).
> > >>>>
> > >>>> Because of this, all submissions from this group must be reverted
> from
> > >>>> the kernel tree and will need to be re-reviewed again to determine
> if
> > >>>> they actually are a valid fix.  Until that work is complete, remov=
e
> this
> > >>>> change to ensure that no problems are being introduced into the
> > >>>> codebase.
> > >>>>
> > >>>> Cc: Kangjie Lu <kjlu@umn.edu>
> > >>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > >>>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > >>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > >>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >>>
> > >>> Upon a second look, I still see nothing wrong with the original
> commit.
> > >>> However, as I'm no v4l expert, I'd like to defer to the experts for
> final
> > >>> judgement.
> > >>
> > >> It seems fine to me, but it also seems unneeded, as the V4L2 core
> clears
> > >> the whole f->fmt union before calling this operation. The revert wil=
l
> > >> this improve performance very slightly.
> > >
> > > Hmm, that means very recent commit f12b81e47f48940a ("media: core
> > > headers: fix kernel-doc warnings") is not fully correct, as it added
> > > kerneldoc stating this is the responsibility of the driver:
> > >
> > > + * @reserved:          drivers and applications must zero this array
> >
> > Actually, it is the V4L2 core used by the driver that zeroes this. So
> > drivers don't need to do this, it's done for them. It used to be the
> > responsibility of the driver itself, but this was all moved to the core
> > framework a long time ago since, duh!, drivers always forgot this :-)
> >
> > >
> > > Anyway, it doesn't look like this umn.edu patch introduced a bug.
> >
> > I haven't seen any bugs introduced by the media patches from umn.edu.
>=20
> Hi Greg,
>=20
> I also double-checked all media revert patches from:
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
> umn.edu-reverts
>=20
> currently on this patch:
> 	6f4747a872ad Revert "ethtool: fix a potential missing-check bug"
>=20
> That's a summary of what I found:
>=20
> All of those should be dropped from your tree:
>=20
> 	84fdb5856edd	Revert "media: si2165: fix a missing check of
> return value"
> 	867043f2206e	Revert "media: video-mux: fix null pointer
> dereferences"
> 	78ae4b621297	Revert "media: cx231xx: replace BUG_ON with
> recovery code"
> 	5be328a55817	Revert "media: saa7146: Avoid using BUG_ON as an
> assertion"
> 	81ce83158d22	Revert "media: davinci/vpfe_capture.c: Avoid
> BUG_ON for register failure"
> 	3319b39504b8	Revert "media: media/saa7146: fix incorrect
> assertion in saa7146_buffer_finish"
> 	b393f7cb29a2	Revert "media: rcar-vin: Fix a reference count
> leak."
> 	197bc5d03682	Revert "media: rcar-vin: Fix a reference count
> leak."
> 	2fd9cf68bbb6	Revert "media: rockchip/rga: Fix a reference count
> leak."
> 	d1e4614eca24	Revert "media: platform: fcp: Fix a reference
> count leak."
> 	416e8a6ae07f	Revert "media: camss: Fix a reference count leak."
> 	06b793ae497b	Revert "media: s5p-mfc: Fix a reference count
> leak"
> 	8f9fc14a7cc9	Revert "media: stm32-dcmi: Fix a reference count
> leak"
> 	556e1f86ba24	Revert "media: ti-vpe: Fix a missing check and
> reference count leak"
> 	5f5b1722ad0d	Revert "media: exynos4-is: Fix a reference count
> leak"
> 	f4c758c6c1cb	Revert "media: exynos4-is: Fix a reference count
> leak due to pm_runtime_get_sync"
> 	beb717878c73	Revert "media: exynos4-is: Fix several reference
> count leaks due to pm_runtime_get_sync
> 	7066ec748bfd	Revert "media: sti: Fix reference count leaks"
> 	cdd117093b19	Revert "media: st-delta: Fix reference count leak
> in delta_run_work"
>=20
> As, after my re-check, they all seem to be addressing real issues. So,
> NACK on those.
>=20
> This patch (073/190):
>=20
> 	899ab4671bc0	Revert "media: rcar_drif: fix a memory disclosure"
>=20
> While it doesn't hurt, it is useless, as the media core already
> prevents memory disclosure. So, it should be reverted.
>=20
> So, for patch 073/190:
>=20
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I agree, this patch should be reverted.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

>=20
> Thanks,
> Mauro
