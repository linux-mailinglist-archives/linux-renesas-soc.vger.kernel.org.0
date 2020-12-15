Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40482DB0B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 17:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730552AbgLOP6r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 10:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbgLOP6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 10:58:39 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD074C0617A6;
        Tue, 15 Dec 2020 07:57:58 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id w127so19396604ybw.8;
        Tue, 15 Dec 2020 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C5gWEJwzHXn1ShMFhu2t6H+9GWvdz1kML7Fx1lY6PKE=;
        b=Ld4HmbckjgNstSvqbLYzX5xzjzj7U3E+UXqv2D9TmeEn96ssBFVZn2OJUipNkuy38c
         tJjAG60RBXgCz+fYDbWEyoIupDAfPkKMDrZWnsi9Ydsc/iwhJlcoBSk8jWNxC5nGvsHD
         +0i2YKg+OdbDvw/Z1/iq6v2qMsCuSAztHoYzvTeIq71apOCH6tNoXdV9S/stASGk4Txo
         03VuNcKN+n0nBTwBqoBuuTLmy3Se5ISU1xeGsqbFThtOSzcIyiIw55SSG4NiXQFBxWQr
         90WGlX/rycXGm6K9w6T+84oFYUGkB2jHettCzWoFsFuN/dJapAccbbEv3MTGz9OF19vh
         o0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C5gWEJwzHXn1ShMFhu2t6H+9GWvdz1kML7Fx1lY6PKE=;
        b=hijOGpIqmvk3qSpSLpz6FAyskFaw4mbToWh2BsExjbrc4/2HiUdeM7P6vJXzFFXm4D
         CN/hYbSUeWA88oM/kmQL2hyTd7Yb+RgA4ubaGYXh6hJxsr+u3gpZJhBqF83m/pCZPt6H
         OiBS1eJxotxqvLhRtRbLShLRCMoa1Je1fUgp3V4aLFdrfVn18zrQAzHRaj6gPrmsWL0N
         wyEf/9ZNkxB/us11xFxGSB5tNr1uaYZtUK8SFuid7tlBdj8O6O8JiToWLcwaK2H2m/Ic
         9dB22nOYU9LE8FKl3QWcStOHl3OTxcxAFJ1IcHGtZrO5xH6+JNASceNrMPNpZXVdhW6/
         IGzA==
X-Gm-Message-State: AOAM533TGWfrH47/2Y1osMcCYtS7p2b7TAFx7+/TfdjtjxyBaPVl/+je
        RLrVdkuLcbjfi02Wxf936/MqaYCAGU3ASkdebWk=
X-Google-Smtp-Source: ABdhPJyfclnkTaENRLirConWIoOx+piMmLPYv6J/hmXVCzXRS6L+s5el1GwyYb9LXWOsq8WxGKWm4C8wY+86Y9SzZe0=
X-Received: by 2002:a25:3a86:: with SMTP id h128mr42666689yba.401.1608047878198;
 Tue, 15 Dec 2020 07:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201126103053.29881-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201215114949.teyhlmyhejck7jw2@uno.localdomain>
In-Reply-To: <20201215114949.teyhlmyhejck7jw2@uno.localdomain>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 15 Dec 2020 15:57:32 +0000
Message-ID: <CA+V-a8sTXULENp+prOd10vEwYz9wiKkAhyaEPf79QGGvtLc2hQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support
 for 8-bit ov7725 sensors
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the review.

On Tue, Dec 15, 2020 at 11:49 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hello,
>
> On Thu, Nov 26, 2020 at 10:30:53AM +0000, Lad Prabhakar wrote:
> > The 8-bit ov7725 sensors can also be connected to the camera daughter
> > board.
> >
> > This patch creates a separate dtsi file for ov7725 sensors and is included
> > in r8a7742-iwg21d-q7-dbcm-ca.dts. The user can set VINx_SENSOR depending
> > on the cameras connected.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |   7 ++
> >  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi    | 112 ++++++++++++++++++
> >  2 files changed, 119 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi
> >
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > index 1ab4f9771a34..915ff5fd437c 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > @@ -11,6 +11,7 @@
> >
> >  #define SENSOR_NONE          1
> >  #define SENSOR_OV5640                2
> > +#define SENSOR_OV7725                3
> >
> >  /* 8bit CMOS Camera 1 (J13) */
> >  #define CAM1_PARENT_I2C              i2c0
> > @@ -40,6 +41,11 @@
> >   * VIN2 interface and also the ov5640 node connected to it)
> >   *      #define VIN2_SENSOR          SENSOR_NONE
> >   *
> > + * To tie VINx endpoints to ov7725_x endpoints set VINx_SENSOR to
> > + * SENSOR_OV7725 for example if ov7725_3 is connected to the VIN3
> > + * interface set the below (this disables the ov5640_3)
> > + *      #define VIN3_SENSOR          SENSOR_OV7725
> > + *
> >   */
> >  #define VIN0_SENSOR          SENSOR_OV5640
> >  #define VIN1_SENSOR          SENSOR_OV5640
> > @@ -47,6 +53,7 @@
> >  #define VIN3_SENSOR          SENSOR_OV5640
> >
> >  #include "r8a7742-iwg21d-q7-dbcm-ov5640.dtsi"
> > +#include "r8a7742-iwg21d-q7-dbcm-ov7725.dtsi"
>
> Mmm, can't we alternatively include one .dtsi or the other depending
> on a define symbol ? The .dtsi describe pluggable expansion boards,
> they cannot be mixed, right ?
>
Since the cameras on the daughter can be mixed and matched a much
better version of the patches [1] which handle this case elegantly has
been posted by Geert.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20201126134031.4115211-1-geert@linux-m68k.org/

Cheers,
Prabhakar
