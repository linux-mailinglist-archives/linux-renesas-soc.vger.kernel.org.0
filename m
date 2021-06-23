Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A633A3B1601
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 10:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhFWIlw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 04:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbhFWIlw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 04:41:52 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3D4C061574;
        Wed, 23 Jun 2021 01:39:34 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a16so1890931ljq.3;
        Wed, 23 Jun 2021 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=JVVPmMsCMUJTTUxP116vddvjsDYb2XLODOyPNo5b6Q0=;
        b=U8eroileOWi5RjAvTJj2sDllrmRnJd7CJ2xXyOXYrz7nigB3aytLM82H7a1DPsBH3V
         Hsw69y+VTcpUOUHJs29X501UsAhEHWI9msIuuNmEws/tq6hY6Ckgi1BPMfnKY53vE7LJ
         /TaUi+TAQv1+NYS5MR40NHlrd3xKxQtvJe8efbcBJN0rFhiakjMSlZ/7Ni+FOwsaaqfY
         96xCgqOaa0WiOonkcri+JXw/VVlO7/X6NnQiEVL3H8K4R4SMbtxIo+CqoVBewweUauvl
         5GGQ/lQHolXyiT/zVi8qRMBZa1nF8GiVwsKtUr/91gEM430Azg2ZBJHUN5Ff4MBINR/x
         J1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=JVVPmMsCMUJTTUxP116vddvjsDYb2XLODOyPNo5b6Q0=;
        b=N/x5FAByvnW44j5s/i+UNlfKZ91UolmbSRVB4HyMhsmbACHS5hLUmK9RRhksWXTdVm
         ECl57RT4MN5lJw/KnEu+RiPzINHGNNoSQBJufvIxHpxFMNhyiBhi5WWV4gh9/3g9IlHR
         K1oBaDivlAZyDB+raCNuQVgEuqRrx1f5NlIw8GPmaalPuxwPu1JFF8VYyoC+9erzxrMP
         LCkYVoJoDUI7WihfxmPpctPeOre6OEbVvGDmvfw1lJ2n/21hk3HTzNBYVDFl8LLA0t+H
         Zd6pwajWdRjYd0yat2EMtmssyXY6rnnrzvUgsRb1UcDPeN2p0x38F4+5uRTZCSEHKYBT
         7Xvw==
X-Gm-Message-State: AOAM531h6b0YqYk6ZGQjs88H+AhCO2UhB66V/PZA+vehzNaafLurowqQ
        u8MESpB9e+K11fnfSD2oG/g=
X-Google-Smtp-Source: ABdhPJzRh29FsphJLIFAyu1GAlHco4CplOxueTqhR9EahKY4LwtLyMQ1B/Fxt5QvKOBHup6q/XrY0w==
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr7013293ljp.24.1624437572620;
        Wed, 23 Jun 2021 01:39:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id v13sm400428lfo.33.2021.06.23.01.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 01:39:32 -0700 (PDT)
Date:   Wed, 23 Jun 2021 11:39:22 +0300
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
Message-ID: <20210623113922.1e603139@eldfell>
In-Reply-To: <ee0161b5-c88b-40ce-c02f-86e0927b70bb@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
        <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
        <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
        <20210622111239.73aa87aa@eldfell>
        <ee0161b5-c88b-40ce-c02f-86e0927b70bb@igel.co.jp>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R+0wtRr6C.FPOSdHFeGxePL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--Sig_/R+0wtRr6C.FPOSdHFeGxePL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Jun 2021 15:56:05 +0900
Esaki Tomohito <etom@igel.co.jp> wrote:

> Hi,
> Thank you all for your comments.
>=20
> On 2021/06/22 17:12, Pekka Paalanen wrote:
> > On Tue, 22 Jun 2021 13:03:39 +0900
> > Esaki Tomohito <etom@igel.co.jp> wrote:
> >  =20
> >> Hi, Enrico Weigelt
> >> Thank you for reply.
> >>
> >> On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote: =20
> >>> On 21.06.21 08:27, Tomohito Esaki wrote:
> >>>
> >>> Hi,
> >>>    =20
> >>>> Virtual DRM splits the overlay planes of a display controller into m=
ultiple
> >>>> virtual devices to allow each plane to be accessed by each process.
> >>>>
> >>>> This makes it possible to overlay images output from multiple proces=
ses on a
> >>>> display. For example, one process displays the camera image without =
compositor
> >>>> while another process overlays the UI.   =20
> >>>
> >>> Are you attempting to create an simple in-kernel compositor ?   =20
> >>
> >> I think the basic idea is the same as DRMlease. =20
> >=20
> > Hi,
> >=20
> > indeed. Why not use DRM leases instead?
> >  =20
>=20
> In this use case, I understand that this is not possible with DRM lease,
> am I wrong?
> I understand that it=E2=80=99s not possible to lease a plane and update p=
lanes
> on the same output independently from different processes in current DRM
> lease.
>=20
> If this is correct, what do you think of adding support for plane leases
> to the DRM lease to handle this case?

Hi,

I would love to see support added for leasing individual planes,
especially to replace the virtual DRM proposal which seems to be
eradicating everything that atomic modesetting and nuclear pageflip
have built over the many years.

However, please note that "on the same output independently" is
physically impossible. Semantically, the planes define what a CRTC
scans out, and the CRTC defines the scanout timings. Therefore it is not
possible to update individual planes independently, they will all
always share the timings of the CRTC.

That combined with KMS not allowing multiple updates to be queued at
the same time for the same CRTC (atomic commits and legacy pageflips
returning EBUSY) makes the plane updates very much inter-dependent.

If you want to avoid EBUSY and have planes update on the vblank you
intended, you really need a userspace compositor to pull everything
together *before* submitting anything to the kernel.


Thanks,
pq

--Sig_/R+0wtRr6C.FPOSdHFeGxePL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDS8zoACgkQI1/ltBGq
qqc/5g/3ak40wL+VtqFnrsfVD4HOtihTdvbodwtvOR+di7hRg9DyAo4acZgCylm/
XDsoSrLQtUQZIhlub+nSt4937wJFkhBLdhKJIAXQ6EYJHlizAWvzh1UE949lz70T
p5pvLlXbzr1tBj7ekgLuU3J1Tk5EywMB5/nCtEfivvrSAbW4t624kR731VgFPua5
p70PRiQeNWAxwXsMhK6ujD7B0egngvnKzXCA6f8zjT8t8psi4cduGujo8v5tmGoj
wDh1HcMmtlU2eXSxaiNjq/nP+d6MV6WAeVghFzbDg8H883PB5UPLby1TAZugqO17
vcysXxj9knf4jVGO2glafuxPyQD62X2bcSbSv8EX4gEVSggseht/Lq3ZPWr+CMG2
3yGPKr3bn+MW8S2X5N0T/UQm6umxJS/3Gu0AiruVCZ2CG999CUKIc+O7cLW+EvQP
sCol/K0/fbJamuPE5wE0REj9RkpEADNM4+i/Iv1Xh9RXecetKXLuOBX2lkVZrbdr
XSU8mCVBx+D7Bhp9rGYv7uy4MP3R2m19D4UfWt1BEDEX/oF3Tv53fbIkw7U685YX
ZRQcnrMxExYyM6AZtXNs2cH1jelablm8fDPr8QLCoCDya06iAZK2F43hag0HOm3B
+ny7k73O/3HeUyehS0uFaUh+BnPLI2lHvWjURHhWlOqtNzVl2w==
=dkL2
-----END PGP SIGNATURE-----

--Sig_/R+0wtRr6C.FPOSdHFeGxePL--
