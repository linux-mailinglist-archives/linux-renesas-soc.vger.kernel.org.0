Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319871B0394
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2020 09:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgDTH7c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Apr 2020 03:59:32 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:40441 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgDTH7c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 03:59:32 -0400
Received: by mail-oo1-f67.google.com with SMTP id r1so1923764oog.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2020 00:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=atQJFy852B3iA6B0JXffqacjge8XFaCkE1QdhFOTi18=;
        b=tGnzgoL5/qZrG7YTALoGlOt54TuneFUhn5XlTqcQewrU/ae8EUFaOD9rbRtdWvvmtK
         PSz5IqOtbZbqlwQsXULm/jgxM1BsxvxCWL4qZw2so5Xz57810CqnA5o9QiBIn3RpiD06
         v+l6Y9UvjIVIfETmWdo/jloAoT+IvbPSGz+sNN+UEfivvnpe0aEQtPkHgI/76e4OGd9g
         9Bivz5N7XKPnF6HRJ0l/nOOd4ifmHYAKllynsyjyp5Xg6sxSPalX/xbVelh8ooe5xu8l
         TABKBzTnhZEx0tET0XdSXPtpiYECNilNrjegULhISY1hqyP1rfx5I9ucxByMd4FXOvv3
         enKA==
X-Gm-Message-State: AGi0PuZfcEM8YO45QQk//U/GKdTjmlIDVm5gMArudzRexZouYgygzKTZ
        V9ecHMg2j2FKIVbcpA1cEL9/lLKHo74fy+4rsQ4=
X-Google-Smtp-Source: APiQypLFuyZ7wjBv3wPXI3UR2IogVxmmdnc8VlCUDObAO9fnuYcqTXrUA7wNMEff6PsTJkeUtXfP/TGm6h047J08zlM=
X-Received: by 2002:a4a:4c46:: with SMTP id a67mr11823696oob.1.1587369571030;
 Mon, 20 Apr 2020 00:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200415124959.2588-1-geert+renesas@glider.be>
In-Reply-To: <20200415124959.2588-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Apr 2020 09:59:19 +0200
Message-ID: <CAMuHMdUQmXmzeg3uvbe9e7dsDDceBF7mQxAcRYqxuQs0o8cOmw@mail.gmail.com>
Subject: Re: [PATCH LOCAL] arm64: renesas_defconfig: Refresh for v5.7-rc1
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 15, 2020 at 2:50 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Update the defconfig for Renesas R-Car Gen3 boards:
>   - Disable CONFIG_ARM64_AMU_EXTN (R-Car Gen3 is not ARMv8.4),
>   - Enable CONFIG_DRM_DISPLAY_CONNECTOR (for HDMI, VGA, and composite
>     display connectors on various boards, since commit 0c275c30176b2e78
>     ("drm/bridge: Add bridge driver for display connectors")),
>   - Replace CONFIG_DRM_DUMB_VGA_DAC by CONFIG_DRM_SIMPLE_BRIDGE (cfr.
>     commit 0411374bdf2b3cc1 ("drm/bridge: dumb-vga-dac: Rename driver to
>     simple-bridge")),
>   - Disable CONFIG_VHOST_MENU (should not default to yes),
>   - Drop CONFIG_ARCH_R8A7795=y (removed in commit 4ff27112282e5482
>     ("soc: renesas: Remove ARCH_R8A7795")).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be applied to topic/renesas-defconfig.
> Not intended for upstream merge.

> @@ -275,6 +277,7 @@ CONFIG_VFIO_PCI=y
>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_MMIO=y
> +# CONFIG_VHOST_MENU is not set
>  CONFIG_CHROME_PLATFORMS=y
>  CONFIG_COMMON_CLK_CS2000_CP=y
>  CONFIG_COMMON_CLK_VC5=y

I'm dropping this hunk, as it does not affect code generation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
