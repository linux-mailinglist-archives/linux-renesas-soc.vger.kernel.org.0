Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4D9243775
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 11:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgHMJRY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 05:17:24 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36258 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgHMJRY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 05:17:24 -0400
Received: by mail-ot1-f68.google.com with SMTP id x24so4264680otp.3;
        Thu, 13 Aug 2020 02:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V07KhpRlm+XyrUY9W/wqJIuuVTBiRrW7230tHoTMcI8=;
        b=AL4EM9XTva3cC0oOZH+AcGBesvrDaIPewm9yN25ilgH6LV666WiuXPLdG4zIbe133l
         Lk8fy4AHnKTRm1AQdVOCZHd/Y7WXmGNG7BFIlbPSNvc3hBgf2s1M7zs2ePRduCjkL+d+
         Gcl5yzLZDGNQCzqEJ6AKb2HnMxc0aV4Q4xmJhOmfYBHz5DgnmEoUoKXxlA/2bNdFac60
         r2gBvr7l+9w7pR43LRMVsMOuxVwMESRNsmniwC5yiRMvra9Qp93sZlx1y5rCIse7uX8e
         7TGApwiNOVTDQNI3miakGuanPy+oBmsOeRjHSPZAf/ztLCwZ8yNeQPGpDPVfzRiF8x5f
         l92w==
X-Gm-Message-State: AOAM530BgxQRKaDwH6taCKLnZ1u0XnUJ+j2ClLlO3Bk+S+j4C4jlmKPV
        ABkq1a3lMJg3nZrYAQvssaH4tVivWjPSZQoKrYY=
X-Google-Smtp-Source: ABdhPJxdPkdRpPWiNCOIxmN2JxvlePZTVF3T8bGebJ7eRWYMeJA5GOIXNkf4wj0qjwTCLwg6p4yGtROhDO1jLcqkr3g=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr3428687otn.250.1597310243034;
 Thu, 13 Aug 2020 02:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200812140217.24251-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Aug 2020 11:17:10 +0200
Message-ID: <CAMuHMdX0L-TcdHbmvdVGmwQCNuteXnCFLyt=e9qaSYq7BTdFWA@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: renesas: r8a774e1: Add LVDS device node
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 12, 2020 at 4:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Add the LVDS device node to R8A774E1 to SoC dtsi and connect it with
> the DU node.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10 (after resolving the port numbering).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
