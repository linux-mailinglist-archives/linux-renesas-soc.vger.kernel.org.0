Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80CA713384
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 20:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfECSNT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 14:13:19 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:33879 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfECSNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 14:13:19 -0400
Received: by mail-ua1-f68.google.com with SMTP id f9so2342736ual.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 May 2019 11:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3gjzOmwtBtfKqkGn3S2GmjBOVaVXE+wt0Qm+gLbvmMQ=;
        b=DjBhWLb6KOt8mcp9NnJpCrXKl/uazlhUt/M67gA5+guXcbXsGAQIeW1xyWTUW6/FqO
         OjPPtHj5RlGKK449Wjll8F9Fi7d955vFwO+kfJGsOku/RVy2knCzJKMDgh/5oMognt4x
         WPoFZ+IowBa0Nkj5dI2QoSJqqNlm/8VK8Ju+qtCe2FWcM3DtqQ3HmtTyWDWkrymE8Qfp
         pisMx4RlcbX7CIXw1P1sen4CxT7NovSUJt3hkkF4Kv88X4rc4nx+TVdQlwxy7L2QMyvU
         f6H6HBbVSEjtCD/qe9b9j4xEWF1uGmq+YFX8YCd9jn0Vyct7PcHzt1blf7t/X4erDzha
         jqhg==
X-Gm-Message-State: APjAAAX22yodnwv1bdhsTKqJjcPbpAxPiUV98BiQw21hsNxyiiqJjXKY
        YsnhE+sUW9kQtahdicY9H13vfUpr0HRsdn+R6Ng=
X-Google-Smtp-Source: APXvYqz/BkTb3TnX2KzjbmuMueVosaqavf6OJGBUk3o3HyYsAgiApYixzerzW/uL8CA6Lgv2gbHMFx5R8CMU+WsHD/s=
X-Received: by 2002:ab0:d89:: with SMTP id i9mr5851213uak.96.1556907198361;
 Fri, 03 May 2019 11:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190502140634.4529-1-marek.vasut@gmail.com> <CAMuHMdVGAq1XgSohBjc8i4c_o-N-yWGedS_LLS_Apr4Bx10xGQ@mail.gmail.com>
 <fa79e656-d71a-6f3d-21a5-8acac72e20f0@gmail.com>
In-Reply-To: <fa79e656-d71a-6f3d-21a5-8acac72e20f0@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 May 2019 20:13:06 +0200
Message-ID: <CAMuHMdXrK7CMhBjFXAYX4wUPK=4Q2LpBCu+65-t5Y7-VjEBsog@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a779x: Configure PMIC IRQ pinmux
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Fri, May 3, 2019 at 5:18 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 5/3/19 2:36 PM, Geert Uytterhoeven wrote:
> >>  &rwdt {
> >> @@ -309,6 +314,8 @@
> >>  };
> >>
> >>  &iic3 {
> >> +       pinctrl-names = "default";
> >> +       pinctrl-0 = <&pmic_irq_pins>;
> >
> > Given Blanche has a single device connected to irq2, I think it makes
> > sense to move the pinctrl properties to the pmic node below.
>
> It makes blanche somehow inconsistent with the other boards, but if you
> insist ... ?

Typically the pinctrl properties are part of the device node that uses them.
For the other boards, that's not possible, as they are shared by all PMIC
nodes. Hence the other boards are the exceptions, actually ;-)

Note that for multi-PMIC boards, adding the pinctrl properties to a single
PMIC node won't work, as that would break:
  1. The case where the driver for that PMIC is not compiled in,
  2. The R-Car Gen2 regulator quirk.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
