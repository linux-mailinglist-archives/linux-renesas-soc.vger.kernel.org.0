Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B6D17B7D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 09:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgCFIAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 03:00:24 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34876 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgCFIAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 03:00:24 -0500
Received: by mail-ot1-f66.google.com with SMTP id v10so1603417otp.2;
        Fri, 06 Mar 2020 00:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vKvifh6khq6TLsSE0vcYSICDF7ZYlkhTtLvLZlGgCxw=;
        b=mNJGzFdhmnq9WNW1z64q0PgbFnVUyvc77vZo7cq3zCBfaioPwZOMB9RAIY+OeR569r
         9vkddyyAUrKnHqF0KIPsn7kqwF/WxWUiUvl9MGX2nG9a+rIRH1Dw4hq05j73G03mAwMA
         RtNGHXr/iQuanKfJ+CGXUg6Mm+UNT9hzQqjDsN1p6R2LH6aonNLOZpdWNnREJ5W1o/Dx
         eMPgcffbb3IYw1Ze/rgDEca4nyQLxzf9xSDs304zHDGchv6iub3RNgwqUL+8QiqbijUJ
         N0QyDmNOR34GlnCvRzupFDxL3pYa0vCxfMmgpk7yf2DdhcMVs9EjG/5GsiDaeZhsLgbi
         sBeA==
X-Gm-Message-State: ANhLgQ19NcxI6aNdZ+htV3N1N35VAfi1837ZN7c1JNny7NmjJ+YjboK0
        1oZOlOLTzLCguNqBsF9CNjeYZLhLyku/438SkiE=
X-Google-Smtp-Source: ADFU+vslFJIqD7NVOi0pzRNQv5zGFctvmn9FUNf5MC80KDiKCIu60GrFhZuH4Qh4VMg4lJ9w+4Mit7IhEOnS7wS7kYc=
X-Received: by 2002:a9d:b89:: with SMTP id 9mr1502003oth.297.1583481623780;
 Fri, 06 Mar 2020 00:00:23 -0800 (PST)
MIME-Version: 1.0
References: <4b50cc9f-1434-b78a-d56a-fadfd030f002@infradead.org>
In-Reply-To: <4b50cc9f-1434-b78a-d56a-fadfd030f002@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Mar 2020 09:00:12 +0100
Message-ID: <CAMuHMdV8pKP3_6sO+BSyqde9J_qkac7+nc8RnTZwOuphqAnTSQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm: rcar-du: make all sub-symbols depend on DRM_RCAR_DU
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Randy,

Thanks for your patch!

On Fri, Mar 6, 2020 at 4:18 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> DRM_RCAR_CMM depends on DRM_RCAR_DU. Since the following Kconfig
> symbols do not depend on DRM_RCAR_DU, the menu presentation is
> broken for these and following non-R-Car Kconfig symbols.
>
> Is it safe/appropriate to make all of these symbols depend on
> DRM_RCAR_DU?  It make the kconfig menu presentation much cleaner.

I think it is.
But I'd use a big "#if DRM_RCAR_DU" block instead of individual dependencies.

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

> --- linux-next-20200305.orig/drivers/gpu/drm/rcar-du/Kconfig
> +++ linux-next-20200305/drivers/gpu/drm/rcar-du/Kconfig
> @@ -24,6 +24,7 @@ config DRM_RCAR_CMM
>  config DRM_RCAR_DW_HDMI
>         tristate "R-Car DU Gen3 HDMI Encoder Support"
>         depends on DRM && OF
> +       depends on DRM_RCAR_DU
>         select DRM_DW_HDMI
>         help
>           Enable support for R-Car Gen3 internal HDMI encoder.
> @@ -31,6 +32,7 @@ config DRM_RCAR_DW_HDMI
>  config DRM_RCAR_LVDS
>         tristate "R-Car DU LVDS Encoder Support"
>         depends on DRM && DRM_BRIDGE && OF
> +       depends on DRM_RCAR_DU
>         select DRM_PANEL
>         select OF_FLATTREE
>         select OF_OVERLAY
> @@ -47,4 +49,5 @@ config DRM_RCAR_VSP
>
>  config DRM_RCAR_WRITEBACK
>         bool
> +       depends on DRM_RCAR_DU
>         default y if ARM64

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
