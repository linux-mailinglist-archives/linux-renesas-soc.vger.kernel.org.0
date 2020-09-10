Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFD1264294
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 11:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgIJJmM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 05:42:12 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33749 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgIJJmK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:42:10 -0400
Received: by mail-oi1-f196.google.com with SMTP id m7so3888208oie.0;
        Thu, 10 Sep 2020 02:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6t4KyNE6aKdBOe7+K4uVYMteUZyvP3X+Q55taPemhA4=;
        b=Jp6bcg7j4acdTNgd2lhDKOiy+Gynj+gVLNDZXpOjuP27uXEpY6aAc/Nru7dzdVgKY1
         puVmYmtH0itCZXl2pnRy47EnqyzapspODtdmm1pB7GRuZRAYWOz3h1HyQcd5E4SfsTYM
         kjV/CpfDK219M8m6vEYeb6dzwMfDMx8e+M0S2peckBo4jocVETkkt8y7G6jiAq8/tLK8
         75y3owZsW3+ILQ4YL6L83EBGlPuwoZWjPXaajm7aKurM89qeXgSbqf+PJMMtT7OUkkIw
         hpIpoOLp6+Lsa2LPU2kmcMuUx9o2ctaQ+NjtWkctWXfNsQKgr3ulbljCBWXzb22n6EN+
         erdA==
X-Gm-Message-State: AOAM5304O3/rKxsDd2DN/Nln1XD3tINYglYGOvP9yijJbQf8msIT3JpT
        Z1DOspVCtCrQzfA0PuqECPEIJ0n59XrdGkjOk+Q=
X-Google-Smtp-Source: ABdhPJxchL9382cME/R/2HkTsCBKE3YV6NjMKB4lOkKU/8bIrnJMCyO8Izl/WsAgXXIaQzO2ySl/oeVsdFszrdiEUFA=
X-Received: by 2002:aca:b742:: with SMTP id h63mr3036251oif.148.1599730929239;
 Thu, 10 Sep 2020 02:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com> <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 11:41:58 +0200
Message-ID: <CAMuHMdU_C90xQv1yrSAuP=hdEBE7vNSBcKN26L9nQStOB6=_eg@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 7, 2020 at 4:59 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch is test on R-Car M3-W+ Salvator-XS board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
