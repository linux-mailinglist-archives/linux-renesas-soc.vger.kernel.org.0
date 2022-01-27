Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3936F49DD1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jan 2022 09:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbiA0I6I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jan 2022 03:58:08 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:43558 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbiA0I6H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jan 2022 03:58:07 -0500
Received: by mail-ua1-f51.google.com with SMTP id 2so3432038uax.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jan 2022 00:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m0Oa/punTZo54neBO2R7a2vYQkIoxYN32vSsBfoG+aw=;
        b=Avfu0Id8CAUiSTpIfrhbbUSpC7nh+xXRpH/oUM9HdeQlD0Qc8fh8IyovZzT9Ek9ckW
         etGkVijppE6dRRnypzmQRj+apCFIH1eolY5mUvseNnFB35AxUYN76yLGPjdhF/ypI9d/
         E7o9Mcoph7RmWNKhxg1rK7uD9dfhaPfx6BLP7x5O9rFSp+YkytE9ZR6c6MuWP953QzxH
         l//IP9DEbOUHGZ3z4cX50ylTJxEzVRtHuRN4xlxsSL/IwEgZlDSWmKWJl3hoc6Z6sjG4
         Gfm2giOuYNQwokdbzz/0GPxZSZnj+172jgq03Hq8Z0JMIoha0pywmFMq8Iv+WRpDcReR
         LX+A==
X-Gm-Message-State: AOAM530GuGMN1jzEFOAonwZRezTX9YLmOEmavqGQZr3NF4VJAu/Qb9Sv
        CNlnNGIUnWcRCxDntggOUTdbmW0x6Of+nO0T
X-Google-Smtp-Source: ABdhPJyVdRtJ8mMqfoyMLgiMcysvYklVWtd/Vc25wcBc+EmSGSpj2kk9uTXapWnxRTOF1VADy2GDmw==
X-Received: by 2002:a67:b807:: with SMTP id i7mr1128492vsf.44.1643273886788;
        Thu, 27 Jan 2022 00:58:06 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id z27sm460111vsf.24.2022.01.27.00.58.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 00:58:06 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id z15so1380384vkp.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jan 2022 00:58:06 -0800 (PST)
X-Received: by 2002:a1f:2555:: with SMTP id l82mr1183080vkl.7.1643273886146;
 Thu, 27 Jan 2022 00:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20220126202956.18364-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20220126202956.18364-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jan 2022 09:57:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLvpvdfGASq_QbYVBurF=44PLiTQy666HMAYn2RwbfvA@mail.gmail.com>
Message-ID: <CAMuHMdWLvpvdfGASq_QbYVBurF=44PLiTQy666HMAYn2RwbfvA@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Drop LVDS device tree backward compatibility
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thanks for your patch!

On Wed, Jan 26, 2022 at 9:30 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The rcar-du driver goes to great lengths to preserve device tree
> backward compatibility for the LVDS encoders by patching old device
> trees at runtime.
>
> The last R-Car Gen2 platform was converted to the new bindings commit
> edb0c3affe5214a2 ("ARM: dts: r8a7793: Convert to new LVDS DT bindings"),
> in v4.17, and the last RZ/G1 platform converted in commit
> 6a6a797625b5fe85 ("ARM: dts: r8a7743: Convert to new LVDS DT bindings"),
> in v5.0. Both are older than commit 58256143cff7c2e0 ("clk: renesas:
> Remove R-Car Gen2 legacy DT clock support"), in v5.5, which removes
> support for legacy bindings for clocks. The LBDS compatibility code is

LVDS

> thus not needed anymore. Drop it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  .../drm/rcar-du/rcar_du_of_lvds_r8a7795.dts   |  43 ---
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7796.dts   |  43 ---

I had completely forgotten this was used on R-Car Gen3, too, until
commit 58e8ed2ee9abe718 ("arm64: dts: renesas: Convert to new LVDS
DT bindings") in v4.20.  I guess that's old enough?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
