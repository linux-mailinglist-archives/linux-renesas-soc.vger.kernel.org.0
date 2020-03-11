Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C1C1812A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2020 09:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgCKIKs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Mar 2020 04:10:48 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35386 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgCKIKs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Mar 2020 04:10:48 -0400
Received: by mail-ot1-f65.google.com with SMTP id k26so1040485otr.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2020 01:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qBa7hT/mA+nV6mgFZDKLyS09VCKTxfXOvY+TVG4wbDY=;
        b=WjRARlCVZU+RA00sx7HetNfrpcwY/746OesGigKCtJBUpf+Abw76TwNbfaaJb3Kh6t
         mjTFc3e4vgjUZnh4lXCM9JKauSsOdrUd5ZQ9EkPZOpCaFQqn+vvhx18u24Dc+Q0ouJss
         u5L3c/nBC6oX76axJ85f9ZNbWtnJmdycplkokmGZXKjaIjvv3grB9LV3cgqqotkjJT1m
         DXJbxTQLYl3XACzi29PpihvutW/vjboJkwFhYNrrLL3qfshd0/T3oAQInqHfAOujPH1u
         D5rhy3wh8CghSbHU0tAR7e3i/cx0J6ywc/PnAN/nVIdTsqoCXxdElgZaE+sALMkZaqx/
         XwRA==
X-Gm-Message-State: ANhLgQ05ABboL3NYyJmYFPJ8oq0KUe/oTAeIfUa4lyCN2R7GNNfli7/n
        YfhGXBgvaHVXKimq8w9LwPY60Mn34qP8sjc8MBp8zA==
X-Google-Smtp-Source: ADFU+vtzoPX7IJ4qJDV+3Ek8lY2JM7FBkSvLE7/64T4SZRkMckyH1ulo6ZdxVXXSYcYwYrK4Edsaq3EGxL9jpeTc2BU=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr1399615otk.145.1583914247774;
 Wed, 11 Mar 2020 01:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <1583239490-8837-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
In-Reply-To: <1583239490-8837-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Mar 2020 09:10:36 +0100
Message-ID: <CAMuHMdUO1OMhGuBK5Q-CxB2gta3c7K4yuOW05hOw6xAUfRD7vQ@mail.gmail.com>
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
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts

> @@ -150,11 +194,21 @@
>                 function = "avb";
>         };
>
> +       backlight_pins: backlight {
> +               renesas,groups = "tpu_to3_c";
> +               renesas,function = "tpu";
> +       };
> +
>         can0_pins: can0 {
>                 groups = "can0_data";
>                 function = "can0";
>         };
>
> +       du0_pins: du0 {
> +               renesas,groups = "du0_rgb666", "du0_sync", "du0_disp", "du0_clk0_out";
> +               renesas,function = "du0";
> +       };
> +
>         hscif1_pins: hscif1 {
>                 groups = "hscif1_data", "hscif1_ctrl";
>                 function = "hscif1";

As discussed on IRC, I've removed the bogus "renesas," prefixes, and
updated my branches for v5.7.

Thanks for reporting!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
