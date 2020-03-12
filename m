Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F154D182D17
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2020 11:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgCLKKY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Mar 2020 06:10:24 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42490 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgCLKKX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 06:10:23 -0400
Received: by mail-oi1-f195.google.com with SMTP id w17so2629053oic.9;
        Thu, 12 Mar 2020 03:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwwoiowfHNPz9HpeeIjPtaOJgNXOTQ/vvDnMi1D629A=;
        b=n9l2/tq382/vlPmvwJU2vWJ9Ts81d+MELVbuk+qaQfyUs9mB+vmZjEu0OvMtR2O9hE
         +6b1gXkWQMZt8lFS50RhT0UtPLn/Cjry7YO1tdxmIg9RC3MjW5oPUyFxNBi353XXSPdA
         Q+d1pql2n2V86pIKLhvbJoDnQzKcSeVAM5/Ep8AM0EB52tp/gUK01asqSfzkch+YIE7/
         kZJ5ddpSeUNZuGFleCY0LfT12fGlfWhc1hRo/eNsGIablE+ObOYJa3WTKi8USaj0qpyd
         djCHxqAsM+3iFIY8LkWK5U2BdlEDavjLOiOSaEUGAGy6bv65Fo1oXT0TM2WnjiqtLyNO
         Z5/A==
X-Gm-Message-State: ANhLgQ0OmuvEacVrXlbrogc0zinv/wvMjmSWJpHhdPve2VgZNBx5S4Lj
        I2yQaDnIY5s5Fv0w2pmXca7tneWkrkHS8sqQr24=
X-Google-Smtp-Source: ADFU+vt2xrdAlnM+K+3Hl7KD8Ot0CPxqX+cCiLIRU6jFW7JpfLC+f9+Lgd1azWcf6NufNcnKkmCIgjYifaSTuSjCeA8=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr1923995oia.148.1584007822268;
 Thu, 12 Mar 2020 03:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <1583957020-16359-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1583957020-16359-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Mar 2020 11:10:11 +0100
Message-ID: <CAMuHMdWqMHGeENswnfk-Hra4JrfELQkLuzY_6JHFRJZWJZPJog@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add LVDS panel support to HiHope RZ/G2M
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad,

On Wed, Mar 11, 2020 at 9:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The HiHope RZ/G2M is advertised as supporting panel idk-1110wr from
> Advantech, but the panel doesn't come with the board, it has to purchased
> separatey, therefore this series adds panel support to a new DT.
>
> v3->v4
>  * Included rzg2-advantech-idk-1110wr-panel.dtsi in
>    r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts file instead of re-inventing
>    the wheel.
>  * Dropped the Ack from Laurent for patch 2/2 due to above changes
>
> v2->v3
>  * Included Reviewed-by from Rob and Laurent
>  * Switched to dual license
>  * Added myself as the maintainer
>  * Updated copyright year
>  * Rebased the patches
>
> v1->v2
>  * fixed a space according to Geert's feedback.
>
> Thanks,
> Prabhakar
>
> Fabrizio Castro (2):
>   dt-bindings: display: Add idk-1110wr binding
>   arm64: dts: renesas: Add HiHope RZ/G2M board with idk-1110wr display
>
>  .../display/panel/advantech,idk-1110wr.yaml        | 69 ++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/Makefile               |  1 +
>  .../r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts        | 52 ++++++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts

Thanks for the update!
I've queued the second patch in renesas-devel for v5.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
