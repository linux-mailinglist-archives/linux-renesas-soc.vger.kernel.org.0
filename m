Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C321117BD7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 14:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgCFNDv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 08:03:51 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45735 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgCFNDv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 08:03:51 -0500
Received: by mail-ot1-f66.google.com with SMTP id f21so2275760otp.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2020 05:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aEVVe6+3afQR9p/gn1w7f9TwJ7DFs/1rjcn7GyOCqzs=;
        b=Q22/QXdjdlfGhbeNQCRZrhSB0ynWhTwfnaS/XTUZ9Xj5dN+TXuVq6lzj9lfAqlLt2o
         oBl0h8PG9a3SWQeEweqy3JACd0QQADRP7xR7ndrB/CcUZyEy7QBYdD4VJ7PUBr9qfhPb
         c9S0U24nTT/SNphOMzi2LKVNyb0GA/Br8HieC14V/J6d8G2ArprZUSVJqOWxO/2l5E4G
         UxoAAKQYS66uxq7iZEcjMdJZWq1KVhNBiEYLFmeCf06BnwNaqDmx466ebwt08MphYoax
         w2/K83qqN3AtiALlsHTi6t4D+dJxWcnsIYNy+PZYQubIv7fhZKCGNJYq2vHEGhcDrkhw
         tbkQ==
X-Gm-Message-State: ANhLgQ3KvQRL+zUR6qnjf4KeHTiq/Kfg/1qXfRzD91NBNgXlMsLh4cGI
        xZZnum5NyibJb5QSDgdt/fk6y2P0i9OcaLdVXAw=
X-Google-Smtp-Source: ADFU+vuvBcTJRHPXduE4YdOdFpuk+AGgFWQNlfIn+2xdOgYZq5yYxIXunK7DRisRsRSCaP33WcDcKLIo3PbNfJKKzGg=
X-Received: by 2002:a9d:1708:: with SMTP id i8mr106779ota.250.1583499830222;
 Fri, 06 Mar 2020 05:03:50 -0800 (PST)
MIME-Version: 1.0
References: <1583239490-8837-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
In-Reply-To: <1583239490-8837-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Mar 2020 14:03:39 +0100
Message-ID: <CAMuHMdWyKoFPwEP03qxXzDPziiw4=N7cDd=SkcqONEUtTbV1HA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: iwg22d-sodimm: enable LCD panel
To:     Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marian,

On Tue, Mar 3, 2020 at 2:06 PM Marian-Cristian Rotariu
<marian-cristian.rotariu.rb@bp.renesas.com> wrote:
> On the Generic SODIMM Development Platform there is an RGB LCD panel
> directly connected to the DU output. It uses the TPU0 as backlight, one
> GPIO pull-up configuration for power enable, R[2:7], G[2:7], B[2:7],
> VSYNC, HSYNC, DU0_DISP and, DU0_CLK as inputs.
>
> There is no encoder between the DU and the panel, therefore the default
> connector driver is used.
>
> The two variants of the iW-G22D should be mutually exclusive, therefore
> this patch also disables the RGB LCD display when the HDMI extension board
> is used.
>
> Changes for v2:
> - fix the backlight of the panel
> - remove "simple-panel" compatible as it is not needed
> - use only one port for the endpoint connection of the panel

Thanks for the update!

> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
