Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5289FB165
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 14:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfKMNej (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 08:34:39 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39137 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfKMNej (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 08:34:39 -0500
Received: by mail-ot1-f67.google.com with SMTP id w24so1113492otk.6;
        Wed, 13 Nov 2019 05:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2BUGmK0Tlnu9PkcroMtQbN3ebq9HP8EWdnAg1PeQPpI=;
        b=uTeP6Zo+zjbGze48oXU8IaUBVFMlPjBCtg/g/fpTqiW8JcC0Y8dCDtOHgz34vCAUDY
         Z/Jc66pVYOqBRXDxap0/2MFmpsrZHUbEPr9p8oaRigKOVySDzPK03WpyO+T1Uwnqnr0c
         4GM8q9F0csV9eLEjoA6sVYDy3rJ7RFtz+CdFotv8KsW87Pz5HVIN0vDUP7FUabT4Vvmi
         8qtXePFmoIezZIWp2v6cuMWMgXCXnd6SXQOduTMcj7aELegM7ykNB8dB+yaE4eAYhl1S
         gsCX/MbjSC9bwCUckrKX0SbuiBd5WNiF5/46EHQNB6HgzJMvG/fiSL1oq8e3IFSJIP2w
         YRtQ==
X-Gm-Message-State: APjAAAX8leOcVfzIELaBbghJuRv6zAeUNb1Vmpz3u2PS+/oE4kraiCXK
        +bIT4QccVlg951N17fUq5fJiN8fvk+7TBTW/6Kk=
X-Google-Smtp-Source: APXvYqwi7Xw2lfi4sIU7wx1mg128Apj/k00opOCJ9UHzzco7XRYdpN6ucxcgQ3ELDbknwAcBlsN8r36/qkmcXICISpY=
X-Received: by 2002:a9d:5511:: with SMTP id l17mr3161151oth.145.1573652078174;
 Wed, 13 Nov 2019 05:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org> <20191113100556.15616-3-jacopo+renesas@jmondi.org>
In-Reply-To: <20191113100556.15616-3-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Nov 2019 14:34:27 +0100
Message-ID: <CAMuHMdWAvFfL5gWZVkfan=o2pRygxCKaNwCf=7AbiPJS1r8nAA@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: display, renesas,du: Document cmms property
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Sorry for spoiling your v7 ;-)

On Wed, Nov 13, 2019 at 11:04 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Document the newly added 'cmms' property which accepts a list of phandle

renesas,cmms

> and channel index pairs that point to the CMM units available for each
> Display Unit output video channel.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
