Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05CE095EB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 14:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbfHTMe1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 08:34:27 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38476 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfHTMe1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 08:34:27 -0400
Received: by mail-wm1-f65.google.com with SMTP id m125so2499050wmm.3;
        Tue, 20 Aug 2019 05:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xa07j27CudydjRpMZ106HsEb06gJp/wN03S1cLbpmTQ=;
        b=ZDrqG7EdEka57QuU+p7FwChFS6PiBSZPU4k9m0CBOU2pyzYSTBT+3gBsaYkN7v6FPQ
         9FQkvi+8nZDIcClqJfc/LaCjQdS8RUFLOAdZ8MtW5iAvt3s3qUh/vLHQ90qFq32qwowD
         NRYPkIHnY/MTCr1GwuW8/2jcnfcrA73KpKjaAjw/h+OEnrDhIi28zoiNexo/0IK/qVUV
         zzfjvmLwuvpvXefs7cWvhPt9Mvw6SE8DzzYFp7VWEW99No6Tf5J2SvxP9/gfHlqVTQXf
         zzNpiRs1z3M2FhVVPZBE+V1SXmDd8bRMfiSgvHR3zWrGAUeFbhdiXhWentP7OnlNsdL+
         FcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xa07j27CudydjRpMZ106HsEb06gJp/wN03S1cLbpmTQ=;
        b=Jata6+jJhUQz7svtNWrI+BQbaMYtgB6Xln5kCm2OIWrDgkrSaevjrHFQUct9oDVKPQ
         bcFOW9A4k4qlvXfd3v5DctIc/23dYwgsIwzUxzy/Yv4k4d1HH71dx7keil1hq9UHX0wE
         InI3ajSvhxh65qI0h8sQSAV8kb1L7LKyI+RnVN2hl5aoUuOWIhnMs0FJ/1m0HWW+ToUN
         9lZv79b6YNR3gJewPeTqdGaZcqlbX1TAr6y3KUMmwiW8s+qYzatcuJmL6AScFPtpMmmc
         Hqj3x7sM6MYwJZkd7Muw16QihhOex8OWj1rCyyU1dEBV+Yg1vFdHbbaWvAsYiODHQ7x8
         w3jA==
X-Gm-Message-State: APjAAAUt6gHICrrPr5CA0iW3JKNRz06Crw65LOwoHW8RamzZ7SlY0izz
        sD1uYgjZbOtVDBue6n411DB1xa5CkwHn1gpQtCW9SQ==
X-Google-Smtp-Source: APXvYqzpLw62X1lQkUKh9feSfGHBguEYlMo/8dLhOPZPDUGsRCN74drQ6d4X8vb8lq3jOO7aauUmUmOazv66wZFCqYs=
X-Received: by 2002:a1c:5453:: with SMTP id p19mr26516638wmi.120.1566304465489;
 Tue, 20 Aug 2019 05:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345032407.5307.16702422867507502597.sendpatchset@octo> <20190724111227.qaeq3d5mkeyvlkq3@verge.net.au>
In-Reply-To: <20190724111227.qaeq3d5mkeyvlkq3@verge.net.au>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 20 Aug 2019 21:34:13 +0900
Message-ID: <CANqRtoTN3Ea6LK2BwdUevWOPRiquBWmw=foEDPMzsRut08QcPA@mail.gmail.com>
Subject: Re: [PATCH 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0
 SoC-specific match
To:     Simon Horman <horms@verge.net.au>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, Jul 24, 2019 at 8:12 PM Simon Horman <horms@verge.net.au> wrote:
>
> On Thu, Jul 18, 2019 at 08:45:24PM +0900, Magnus Damm wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Add SoC-specific matching for CMT1 on r8a7740 and sh73a0.
> >
> > This allows us to move away from the old DT bindings such as
> >  - "renesas,cmt-48-sh73a0"
> >  - "renesas,cmt-48-r8a7740"
> >  - "renesas,cmt-48"
> > in favour for the now commonly used format "renesas,<soc>-<device>"
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks!

> > ---
> >
> >  drivers/clocksource/sh_cmt.c |    8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > --- 0001/drivers/clocksource/sh_cmt.c
> > +++ work/drivers/clocksource/sh_cmt.c 2019-07-18 19:29:06.005414716 +0900
> > @@ -928,6 +928,14 @@ static const struct of_device_id sh_cmt_
> >               .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
> >       },
> >       {
> > +             .compatible = "renesas,r8a7740-cmt1",
> > +             .data = &sh_cmt_info[SH_CMT_48BIT]
>
> Perhaps as a follow-up SH_CMT_48BIT could be renamed.

I was actually considering implementing proper 48-bit support, and
reworking those names might be a good idea at that point.

Cheers,

/ magnus
