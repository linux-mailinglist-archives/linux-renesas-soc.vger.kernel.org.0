Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B27B1AB62
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 May 2019 10:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfELI7H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 May 2019 04:59:07 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:35479 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfELI7G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 May 2019 04:59:06 -0400
Received: by mail-vs1-f65.google.com with SMTP id q13so1348484vso.2;
        Sun, 12 May 2019 01:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xmj+I9tVEtlvAoJOYekCEKipPaHuy5E98bYFqplmOIM=;
        b=PW6pQFUPSOeCy3qsE2jtXIA8jSgf4BI5R74HmW7Phyg7V7qyIWr3f2eV8d+pjRR71k
         vFTSVj70xiRAZ1Cn3VKjWa+gO/dVrdrqiWIjIGp/Z5CPo0kkcbcOmejRUnQ+I+zqfl3s
         e+9/4ht6ZO0i1eXnvKPXMVJ0SDxMFofxmBS81tTZdU+zc+/Igj2R63AUccIllZPY47u/
         t4QDDSmSZPw646RkBC1IdkGbQ31Cj7LbETrI5nSwLFF17/2dcnihesvWTqS3aaMhnwyS
         htA4TAEpBygYgqCjtbX98lwxcFb2e7s/zItmhpEWG47gd3r8cO0eNEIzE7H9qN8tHt7d
         j52g==
X-Gm-Message-State: APjAAAUxLUVsAzmEqKeBf5xzbyP0yTEzT1hylmgYB++vHxwmmr7L9f6x
        9ou+c3wcnHluG7Et/fWfdodNMtJF0f/ccvr+Ih8T9w==
X-Google-Smtp-Source: APXvYqwV94aZ1VL4lfwYJEp/40rS1E/jr9iHPIrwVquCH0M7ZMjOYI5S9d7KrlTj86tVN5eQc1pUBKt2ei04wyvboDs=
X-Received: by 2002:a67:7c93:: with SMTP id x141mr3348581vsc.96.1557651545711;
 Sun, 12 May 2019 01:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com> <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 12 May 2019 10:58:54 +0200
Message-ID: <CAMuHMdXtg3Kv+zt6kS9tViu93AjaHsOrSSotemt8T=8XVJcdyA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sat, May 11, 2019 at 11:07 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
> dual-link. In dual-link mode both input ports are used to carry even-
> and odd-numbered pixels separately. Document this in the DT bindings,
> along with the related rules governing port and usage.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/display/bridge/thine,thc63lvd1024.txt          | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> index 37f0c04d5a28..d17d1e5820d7 100644
> --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> @@ -28,6 +28,12 @@ Optional video port nodes:
>  - port@1: Second LVDS input port
>  - port@3: Second digital CMOS/TTL parallel output
>
> +The device can operate in single-link mode or dual-link mode. In single-link
> +mode, all pixels are received on port@0, and port@1 shall not contain any
> +endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
> +odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
> +endpoints.

This describes single/dual input.
Does single/dual output need to be described, too?

BTW, I see the second input/output set is optional, wile the first set
is required.  Could it happen the hardware is wired for the second
set only?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
