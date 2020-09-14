Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D564269303
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 19:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgINRXE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 13:23:04 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44351 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgINMag (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 08:30:36 -0400
Received: by mail-oi1-f196.google.com with SMTP id 185so17633646oie.11;
        Mon, 14 Sep 2020 05:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+jbhL6fMkMsaxb8fwQQ9KI/X+FnJmmXEtjx59yCTY8=;
        b=bydVbl2BAlEB9T2VTjvn3Yw86kHTysx2KVdO57bfKs833g0nAI4tMHEWowG6U261cJ
         6fyORqqB7E2jQil1H22H81VXsCPkzVTUmIJ16YF6hRPhIc2XRVuria5NNm3FHl8WCqN0
         l7QJX2uFKj+KkqRIkgQR741Hri/9mAicptyEtG6FbbyuDUloKmaa1Y4PuJEHN1HozNyt
         vlZL7gJRHH1UOUPbld5HZWh00fkyKVxJpN3nm8R9eqINFlV64fG6GYG1f0en8mgy6ot2
         /V2wNhO1D/pt6JCQy5Ch9xnbUI7SHwt6fGoGo65RIoT0E4dFvHWPR8+D6I2pJ22RsVz4
         MaaQ==
X-Gm-Message-State: AOAM532iinIkJTRqSPhFBaxG/M/fsBivcXGV54uDBg49EjBVt+MlzZmY
        sAWfj6NUR7Dlj1QwsGHfETZ/MmcWRIRWqdeSgOS6EQY7uhM=
X-Google-Smtp-Source: ABdhPJxWecUlEvkD5czRnfhbvWXIezlwQEVTPwks1x0nHHDWs7NJoD1rFLAao7GQAla1fDSGAwC/sv/eWpK5w0S6W3k=
X-Received: by 2002:aca:3bc3:: with SMTP id i186mr7701067oia.148.1600086132231;
 Mon, 14 Sep 2020 05:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200911121259.5669-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20200911121259.5669-1-fabrizio.castro.jz@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Sep 2020 14:22:00 +0200
Message-ID: <CAMuHMdX3GYwVd7ezXS4Zkv1vJDe=g1=gj4KKaj==AVO1RuytXA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add DRIF support
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 2:13 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add the DRIF controller nodes for the r8a77990 (a.k.a. R-Car E3).
>
> Please note that R-Car E3 has register BITCTR located at offset
> 0x80 (this register is not available on the r8a77960 and r8a77951,
> whose support has already been upstreamed), and even though it is
> not dealt with just yet within the driver, we have to keep that
> into account with our device tree nodes.

Indeed.

> Also, please note that while testing it has emerged that the
> HW User Manual has the wrong DMA details for DRIF2 and DRIF3
> on E3, as they are only allowed SYS-DMAC0 rather than SYS-DMAC1
> and SYS-DMAC2. An errata addressing this issue will be available
> soon.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
