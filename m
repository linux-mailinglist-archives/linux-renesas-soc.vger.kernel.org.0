Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC0C392536
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 15:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfHSNhW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 09:37:22 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40474 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727332AbfHSNhV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 09:37:21 -0400
Received: by mail-oi1-f193.google.com with SMTP id h21so1291625oie.7;
        Mon, 19 Aug 2019 06:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FVdJP6aDv8FUszfr0u9BFHtqMojXbaWPu5cIAItI5+k=;
        b=KKAWJYSBJUXGaGbOVztp2SlDOnpvmDxba2PuXpUcG/UVIhufSayzQQHJ+teNIijLYH
         5IN9KQPDzbvD3agVjpU/y+RB5mLZgywXfClfTHcCHN2dHiDHhl71QiMrtNqq8XQMRHV/
         jakJT+nD+k56JicSKB/+8WXGNA4dx3+sapSqioQ0907GtN6SeY9x/EDM6ilcCuw2v0f6
         53cYaLEyoBeXWq5/ITnooQPTimExX5+IS4pMo+Z6NFcK0iiijMrTPD919UQBSD83l0ty
         SLX+yvJkCUQ3an7sDBn2YNsfYTlE6fAg0tQz1rqtj27HYhOdJbTg8kpZqUIZYT3c3YqL
         nK4w==
X-Gm-Message-State: APjAAAVeNZoNPiH4HjGjFKOkk5qy09SB5Y/gO/iF0H/LcUjDr6869T0w
        EKZw0MAeMvIK8FchjpjHDPDuFFW4/vOjPK4CIPI=
X-Google-Smtp-Source: APXvYqyjawrbvs/ob60OKkg071qNxpTBy5LO/7wWglcq9BSgFcIknwKjJzpJgLkt4tr9UqkHbAlM3gaIGYvEq6/b+Tw=
X-Received: by 2002:a54:478d:: with SMTP id o13mr13425879oic.54.1566221840884;
 Mon, 19 Aug 2019 06:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <1563183169-15084-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1563183169-15084-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Aug 2019 15:37:09 +0200
Message-ID: <CAMuHMdVVf_t3Sd7o2iYYX_M2DtehHd_2ykhLqfV1y+nNRb25Cw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: hihope-common: Add HDMI audio support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 15, 2019 at 11:33 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds support for HDMI audio to the device tree
> common to the HiHope RZ/G2M and the HiHope RZ/G2N.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> v1->v2:
> * Removed #sound-dai-cells from hdmi0 node

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
