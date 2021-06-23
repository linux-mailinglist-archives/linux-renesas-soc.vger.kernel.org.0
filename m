Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EC13B1923
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 13:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhFWLnj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 07:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhFWLni (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 07:43:38 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5220CC061574;
        Wed, 23 Jun 2021 04:41:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id r5so3600768lfr.5;
        Wed, 23 Jun 2021 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=4jXNkZBkJCroCZHEHJk4Yl0iihmMmzV2M0MO5HkyT6Q=;
        b=YYkBUkBpU74bPcyMCofnr6vYjMEV/taXJMbO203C+UhmzYMZlLtfIj6jjYVfkot34R
         FRyZMgx0hOwJNSjaJgn3ZOrlsluA8fZdlaumVe0xerzgjPQJxZrJa4mtYIAs/LaBOTbo
         ewVkZ9FycNDqwmYWW6cgAHTtmI0xJHp4OCk2qEJOoT+tBqJtDXzz0iaNEK77VOU/eCRD
         lUWBEWcMnE40AGTXpElCm1wymHKCcpGZ3gAdO1qxfGTqFqGb+wIM2iy9eFKW2LZ0lffi
         SbtHGSiq/ZNnIBSpy+Q1eRqbzNjFSx6103ZvlmIIE5VySWxlOozjSZX6LO5Iu9FC8FWL
         a3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=4jXNkZBkJCroCZHEHJk4Yl0iihmMmzV2M0MO5HkyT6Q=;
        b=cvwyC2KcUyrJ3GORW6Bw2jBEFtkKXwsX7zI3DqnwrphoIrVt0C8eJoEd3naMEPPigq
         ECebahYq02xL3E3bJVscV2sGvyf+1ZpWrf6empyxHl5BD/JqW2bgA+Up67UfC8pRYZkh
         A/T2Wo5YkI9ALJpUkLg8xVaGqwnRbnBW6S0xpgaSxixXTEXIlsqAhgDKQhNE+ZXUy2iK
         GEfCGNTgjnlOS6VEmh/H0DambS3zf8CJYV4y/6gXVDHG/2Wlc77YWUihvzCUDvzbplfL
         3Yo0TCIQ8BS/vZv1XG9hFce/6NBwJpMbPtwPkdLlRhw53tqeaNmZyp1S2KcEDHz3g3SX
         idgw==
X-Gm-Message-State: AOAM5338tLZw0yskCHxhOD+TBSb4IW7Fe3R2SXKprvQocqiaHbw+3/tl
        uIEjy+oyJEtVzowEJfrDfLU=
X-Google-Smtp-Source: ABdhPJzQLBEqhzr9/Fy6xHJQZ8lzEEnYgFyW2SIS8NS68pVkr6MWIEVK/UvsgUwXnzeArDL4SiA5+A==
X-Received: by 2002:a05:6512:1191:: with SMTP id g17mr4457991lfr.347.1624448479689;
        Wed, 23 Jun 2021 04:41:19 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id c12sm2067401lfc.32.2021.06.23.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 04:41:19 -0700 (PDT)
Date:   Wed, 23 Jun 2021 14:41:15 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Esaki Tomohito <etom@igel.co.jp>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
Message-ID: <20210623144115.1bc55db1@eldfell>
In-Reply-To: <ab816c34-ff98-911f-e53d-b91cd3be6f2b@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
        <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
        <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
        <20210622111239.73aa87aa@eldfell>
        <ee0161b5-c88b-40ce-c02f-86e0927b70bb@igel.co.jp>
        <20210623113922.1e603139@eldfell>
        <ab816c34-ff98-911f-e53d-b91cd3be6f2b@igel.co.jp>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ljMzJSbhx05gG.4fz0yC81V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--Sig_/ljMzJSbhx05gG.4fz0yC81V
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Jun 2021 18:22:47 +0900
Esaki Tomohito <etom@igel.co.jp> wrote:

> On 2021/06/23 17:39, Pekka Paalanen wrote:
> > On Wed, 23 Jun 2021 15:56:05 +0900
> > Esaki Tomohito <etom@igel.co.jp> wrote:
> >  =20
> >> Hi,
> >> Thank you all for your comments.
> >>
> >> On 2021/06/22 17:12, Pekka Paalanen wrote: =20
> >>> On Tue, 22 Jun 2021 13:03:39 +0900
> >>> Esaki Tomohito <etom@igel.co.jp> wrote:
> >>>    =20
> >>>> Hi, Enrico Weigelt
> >>>> Thank you for reply.
> >>>>
> >>>> On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote:   =20
> >>>>> On 21.06.21 08:27, Tomohito Esaki wrote:
> >>>>>
> >>>>> Hi,
> >>>>>      =20
> >>>>>> Virtual DRM splits the overlay planes of a display controller into=
 multiple
> >>>>>> virtual devices to allow each plane to be accessed by each process.
> >>>>>>
> >>>>>> This makes it possible to overlay images output from multiple proc=
esses on a
> >>>>>> display. For example, one process displays the camera image withou=
t compositor
> >>>>>> while another process overlays the UI.     =20
> >>>>>
> >>>>> Are you attempting to create an simple in-kernel compositor ?     =
=20
> >>>>
> >>>> I think the basic idea is the same as DRMlease.   =20
> >>>
> >>> Hi,
> >>>
> >>> indeed. Why not use DRM leases instead?
> >>>    =20
> >>
> >> In this use case, I understand that this is not possible with DRM leas=
e,
> >> am I wrong?
> >> I understand that it=E2=80=99s not possible to lease a plane and updat=
e planes
> >> on the same output independently from different processes in current D=
RM
> >> lease.
> >>
> >> If this is correct, what do you think of adding support for plane leas=
es
> >> to the DRM lease to handle this case? =20
> >=20
> > Hi,
> >=20
> > I would love to see support added for leasing individual planes,
> > especially to replace the virtual DRM proposal which seems to be
> > eradicating everything that atomic modesetting and nuclear pageflip
> > have built over the many years.
> >=20
> > However, please note that "on the same output independently" is
> > physically impossible. Semantically, the planes define what a CRTC
> > scans out, and the CRTC defines the scanout timings. Therefore it is not
> > possible to update individual planes independently, they will all
> > always share the timings of the CRTC.
> >=20
> > That combined with KMS not allowing multiple updates to be queued at
> > the same time for the same CRTC (atomic commits and legacy pageflips
> > returning EBUSY) makes the plane updates very much inter-dependent.
> >=20
> > If you want to avoid EBUSY and have planes update on the vblank you
> > intended, you really need a userspace compositor to pull everything
> > together *before* submitting anything to the kernel. =20
>=20
> Hi,
>=20
> Thank you for your comments and advice.
> I will consider leasing a plane.

Hi,

I wish you considered a userspace compositor first, once more, with
passion.

It does not need to be Weston, and it does not need to use Wayland.
Just a userspace daemon that owns the whole display device and somehow
talks to whatever else wants stuff on screen.

I have not seen any evidence that leasing individual planes would do
you any good. I can easily see it doing you harm. I'm only saying that
it would be better than the virtual DRM proposal if you absolutely have
to go there. Please, consider not going there at all.

"On the same output independently" is not possible for the very simple
reason that the pixel data needs to be streamed serially to a monitor.


Thanks,
pq

--Sig_/ljMzJSbhx05gG.4fz0yC81V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDTHdsACgkQI1/ltBGq
qqcLZg//QkFy2hWZeB2Fkh+0ETzd5SkUgpmcL5x8+DLBH71YJk0Z3+sb9EhK1jl+
kfcuHCiAE9p1f3VpiOp8c0R7zpPqanhi6epHZ8iUQHksXrt6IG84GntHafCOeTeW
6xhQrCfV9RdhASfrKFTt0AFIcP1nw7daACtGDVMMKoUH5NzdrmEZClqxHFQ+3sti
NQZ96YGUNWkbmJ9UMki4qeJ/2Rp77YKUcFXBy4qZ2MZufuAB1iRt85C3DEWJQZOp
0JXxYEfFmaLj+9fEVeI5bMAWlIGbP9tzNhCc74xUhUTnryAOvhb/9X0C0hNiHG9T
aJrNBvTEYWayx28S6w8rLSCAoJ3CpMr9pAfZSehxzZDyaRpJf0+Lj55xb9VRUT7V
Hx5Wu+2bDdC3BFP0puhbD/bgWTcgHNGmPvVinqFfGoZYsp9nz+q2g4IEB7zYrDyt
yJsfPl8b1lGSzWvESjzNVE3QyP99142rULB3YvZa8zbgQuYkIlOMRGWeaJw9FxkI
w0zGDMQYZoaJ1kC615SweChTRkkN52CW49MKIsvtVDHdxhIKuD7P3ij6Cq9OAyuW
uqa/lz2uBZOrWEfv3S1f/O1fdWO0U1juNIF1DIvszZo4KDjn1Z9flOqd1/gKSzaa
NOaKo0UKDqzSrnj/gMdQRk+3aoxOA5WrQ5Uq3wh3juagyeHW1BA=
=+5tU
-----END PGP SIGNATURE-----

--Sig_/ljMzJSbhx05gG.4fz0yC81V--
