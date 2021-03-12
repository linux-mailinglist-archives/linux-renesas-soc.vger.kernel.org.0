Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA37338947
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 10:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbhCLJxT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 04:53:19 -0500
Received: from mail-vk1-f173.google.com ([209.85.221.173]:37498 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbhCLJww (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 04:52:52 -0500
Received: by mail-vk1-f173.google.com with SMTP id p62so1112937vkp.4;
        Fri, 12 Mar 2021 01:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2AAoMuZNlimPYRL0sCsn3FgkDxNRBSXgtfFk8ci3BDI=;
        b=XI2DPvcYY5WKR+/Uab61HF/ro9dvSAsiKz5XJ7q3iTRNFkcmCAsJtLBDiNrDt4X9dy
         2tEiXytxbqJq1AbC0WJdiIF8M4u1kL0bsZjnEzcOCYdC6sQrHFBnAuFy4qyknElbDf8t
         UIkO7hP3GxGmdD6N4JDZ5dZ+U3RoUFMKiqJhacKPtmmNTkYK5H+y3K9H6GU9R+aSFshw
         RsGPqNz1mNRl4ZH0W55aptneGPoPqgBM2KVF/6bgaAhu6FiwDm1Ph50JnUZr67ozx4Ub
         bpkU9iedOFNO+K2vI0NEhu+c+UlG1spUfYZes1kj47GbmH2UJRvt+4IBjXEw++jjQZgw
         hudA==
X-Gm-Message-State: AOAM532AInPbfZMVS4UihHuvum+PxkGKzd5aWsistXuyWfXlN4Cky+ev
        PHiEsKSjilLyaa8Hwuxafo1FdqDVfnTMJx3r+euHV2L5
X-Google-Smtp-Source: ABdhPJyCw5IKMPTvj+dhZQXwvNOBw4MllvdWvcZWGcTmpr+P/v5EG6eqVJitvR5ciXdCU1FqDupeq4e0NB3nP/kEv1I=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr7424852vkl.5.1615542771260;
 Fri, 12 Mar 2021 01:52:51 -0800 (PST)
MIME-Version: 1.0
References: <20210312095030.534957-1-yoshihiro.shimoda.uh@renesas.com> <20210312095030.534957-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210312095030.534957-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Mar 2021 10:52:39 +0100
Message-ID: <CAMuHMdW5jhxF26B13dUpVPzo+S35T3WxcaTXY1Q0iHnEGj2eqQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: can: rcar_can: Document r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 12, 2021 at 10:50 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document SoC specific bindings for R-Car M3-W+ (r8a77961) SoC.
>
> Also as R8A7796 is now called R8A77960 so that update those
> references.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
