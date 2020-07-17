Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E082223816
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 11:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgGQJTB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 05:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbgGQJTA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 05:19:00 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94A7C061755;
        Fri, 17 Jul 2020 02:19:00 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id e90so6418395ote.1;
        Fri, 17 Jul 2020 02:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLc/sXnHRqOoFTO4DitwMjah/zdKxSzcKB3wEkyAsl4=;
        b=gzqHiKAhW3YEq6pFZ4XNLdc4l48OMUN12VNYCfNaufpcqn3PiMXV1FzSxbE4kBbPUP
         nMGdsnGMy10DwD+XWxlLs48KZiyqB9kxUaVXaRm1E5VhFpFokttFwn3TFdjD7A5XBCP4
         LyN4cSu1O4VjK2AkPeYpb6G/U72mrfi+lYAvstvr+roFFJIZoAnQ8s3XvTBcJ5yDNL9F
         P2r/2AkpbwclBow1dPCBHyA9s7xcHnosZqWU80OakedbhAFYPV2rLpYTHplDscW6NBkU
         08cxat2Gb19Erzu1a1c+UsaAgy8jRYvQHi54wAtPljkANPzIRz3jVHYn2nmLq5NJiIbN
         V7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLc/sXnHRqOoFTO4DitwMjah/zdKxSzcKB3wEkyAsl4=;
        b=k1JqXo5cY2SP8fTWk3qHG4mZg9SM1LrGO5BTXuMwag92MyA2Z0+Gcncqsk79DPnZ6N
         YqeGb07y31yWAcKpFef6m1Zo9nnkrqe0K+dMA04CCszx3NW4TSaWno8B94mV3YwjiHtR
         T+z5JOl/mOCJeA391uLxANJ0HdKuC9PSSPIGAlV6qWGVhxkq78/TjSYRFqOE5zRAWlY1
         Hy5/5PaCU64MUvTd+fp1qjpCpQgBfJYyGYVzoLo16PVPc7L1Zes4kQ7RCvtsCf1swBm5
         xr7TLHPOxNunJv9Q2qS/h7yvca9gqqRyTa6lwOzb+6UEGRAUFgKihSgRWO4a7d6XNpfB
         XcIA==
X-Gm-Message-State: AOAM532Hyi8OWhO1GQivytxuC1gu4REsWABYZ91kpxj063AmbBX3HmVV
        o1hqbx5dUeJ+dOHrbJ7akEsFgp4N30VDgFC458VDESWgKiQ=
X-Google-Smtp-Source: ABdhPJydHgtFc6+LYSdGKzcX0voXmBdnN1kxxM566RYPvi/tFWswt+A4ojSvBjJme3Q/iy96zMAoqK6SbNj20eM9VLQ=
X-Received: by 2002:a9d:5e18:: with SMTP id d24mr7773734oti.88.1594977540071;
 Fri, 17 Jul 2020 02:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1593004330-5039-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200717083620.GD1027@bug>
In-Reply-To: <20200717083620.GD1027@bug>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 17 Jul 2020 10:18:33 +0100
Message-ID: <CA+V-a8vBM9LKE51TEVX5auU6y07sube6Uowg6mVmd7GQTNTQQQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] arm64: dts: renesas: hihope-common: Separate out
 Rev.2.0 specific into hihope-common-rev2.dtsi file
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Pavel,

On Fri, Jul 17, 2020 at 9:36 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> Can we have node names consistent with other systems?
>
> > +     leds {
> > +             compatible = "gpio-leds";
> > +
> > +             bt_active_led {
> > +                     label = "blue:bt";
> > +                     gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
> > +                     linux,default-trigger = "hci0-power";
> > +                     default-state = "off";
> > +             };
> > +
> > +             wlan_active_led {
> > +                     label = "yellow:wlan";
> > +                     gpios = <&gpio7  1 GPIO_ACTIVE_HIGH>;
> > +                     linux,default-trigger = "phy0tx";
> > +                     default-state = "off";
> > +             };
> > +     };
>
Could you please point me to an example system which you are referring to?

Cheers,
--Prabhakar Lad

> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
