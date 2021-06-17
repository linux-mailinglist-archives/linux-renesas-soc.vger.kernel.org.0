Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF3A3AADD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 09:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhFQHnR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 03:43:17 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:37471 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhFQHnQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 03:43:16 -0400
Received: by mail-vs1-f45.google.com with SMTP id f21so2493569vsl.4;
        Thu, 17 Jun 2021 00:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mEGYEeCbT5Y3uQ9ge9kDdnlguyAqVWsX/tNFbsNf0Go=;
        b=Moqa9taiDTiQWwD0gOSFHENLtdB9DzuM4IbaIWtH2cLaJoDIq2WEQJgDOEttfG9HE9
         lRhYL8SNCBFnZOLD3mfKKfGat6QHHfpqxGijJ8/hlVyoV9Xsh3MzU2dFgr4SRqYtll8i
         14hKvcxcutYtKGkrEK04PE5Gy7k6kfpz8WkN+xtN1cp3KSi9hxbNadRR6+p1XRbmkSqe
         C30OicRfMa3R2DtYATveMUtVVSFt1iGYV/A5MUDtbwWoIXgHeWe5Sh0uoOsLQ33BzdEX
         GP1/oLvXEjON1FtCKJQOWR6TC1dEKc/CLNQmWSk8RJwrFQhNWo4APX1T7lt8Yq3vUwiW
         OB/w==
X-Gm-Message-State: AOAM533wxcYjILP9NfEQGqrjtO3UHSigkTZpxITSxvgXH9yOcZAlQE9U
        vRIFg8uZ+uVCmm9tT9D14pmLnTXTTm22L7mLkd+TWzKMnbLIVg==
X-Google-Smtp-Source: ABdhPJyHZxhvEExJJyJ3FbSwGF668SvWyL06uTu3qETPTb/srzA8PVzp9Tn2bLHdvfcixgGT2j6f4leexfxLrEfBZGw=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr3196825vsd.42.1623915668798;
 Thu, 17 Jun 2021 00:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210419142345.53152-1-jacopo+renesas@jmondi.org>
 <20210419142345.53152-7-jacopo+renesas@jmondi.org> <YMqXjZREJbIEJxs5@pendragon.ideasonboard.com>
In-Reply-To: <YMqXjZREJbIEJxs5@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jun 2021 09:40:57 +0200
Message-ID: <CAMuHMdWULq9GTsWgVnyrBL2_pK4dT5kuAHS=4i7zPX0Hu51L7g@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] arm64: dts: renesas: eagle: Add GMSL .dtsi
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Thu, Jun 17, 2021 at 2:30 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Apr 19, 2021 at 04:23:44PM +0200, Jacopo Mondi wrote:
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >
> > Describe the FAKRA connector available on Eagle board that allows
> > connecting GMSL camera modules such as IMI RDACM20 and RDACM21.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

>
> This won't scale when we'll support more than two different cameras, but
> we'll switch to overlays then :-)

FTR, overlay support has landed upstream.
Still not sure about .dts vs .dtso...

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The DT parts are still pending acceptance of "maxim,gpio-poc", right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
