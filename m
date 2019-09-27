Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394DAC0686
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 15:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfI0NlB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 09:41:01 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40627 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfI0NlA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 09:41:00 -0400
Received: by mail-oi1-f194.google.com with SMTP id k9so5207187oib.7;
        Fri, 27 Sep 2019 06:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YGKMma4c3dHCJ/F/7tsW1Hth1NtK9rXvTmoGwSGnIY8=;
        b=syqdcIvZoUS7cCgP9uLoT6Lksl1UZoiokA/10BE1z2PgNBTj59uw2XBPKG93I6onTU
         BM5x1EhpEZLOIF08UXCBJv+bitsa6CoxXoikCiaHVwwh2IKry3GgNpz4zY3RC1Jck8/X
         mnYNXLuFK0VuxXQemN3fnLgiDEZo9eek1Zz63Rgg/An7MA+IvnWz8nrRbut1/yqhvHLj
         3yrnGVS7dW0Q9MPxueFQQUeUI7+zf1d8XsEIBZHNvDITIhHGdhuQquq+v00g6lT+pDAm
         ck0+Y1/GAiMMIIVh32RGdaOijSmmOFdO5IIhgzWb5JXIHhz/Ot+o/YFOCezfLT0NBXII
         SWXA==
X-Gm-Message-State: APjAAAVgoTD7vZc62nAcwr9lPa9LIQH9Bh8+6Prhf2sb437xI+Ey7v3x
        KgyZcGQa6oj+E0jEW5GF6DxEDabBroh4nHD75qg=
X-Google-Smtp-Source: APXvYqz/NJaT+lFn3ceCFP56EEnMpX7mDW/iOsihj/u/kUVpTKCvyMkLs8zqyggHp8/KAsenw0BCb1hH24mJ2aKPIP4=
X-Received: by 2002:aca:b654:: with SMTP id g81mr6804890oif.153.1569591659785;
 Fri, 27 Sep 2019 06:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <1569589584-56917-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569589584-56917-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 15:40:48 +0200
Message-ID: <CAMuHMdWZ_L5OjysXYQet81YckD3sN+2rzqeDpDcrwCr7ZxKrbw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: Initial r8a774b1 SoC device tree
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 27, 2019 at 3:06 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Basic support for the RZ/G2N (R8A774B1) SoC. Added placeholders
> to avoid compilation error with the common platform code.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1-->V2
>  * Incorporated Geert's review comment
>  * Added Geert's Reviewed-by tag

Thanks, will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
