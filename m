Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7F09A8BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 09:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbfHWHZp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 03:25:45 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35306 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728519AbfHWHZp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 03:25:45 -0400
Received: by mail-ot1-f68.google.com with SMTP id g17so7934843otl.2;
        Fri, 23 Aug 2019 00:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/4ery6oYbTVDJtzAiULAUxO7jVYM45EnpHXVmFk9ZMs=;
        b=eFtZzqZlpX9igVr9iGwpzAgRQqgFlVpbklCn/ou+K8hNlmljCPmz4MRZuXX2R3tNJU
         X23+b189F3H7tKqQC36cVkvdVHKoJDcKM//iMrYP7viUhY8i9eOd/lX6rR67ZD5uEWL/
         5EVhfDXsFx6eI7AHZhJFYJ7bENNgPFXQfnuQNlO3grc7v/n1JQlZJawWQZoIiiLy8jQV
         aXYw8ImSLvzEU06BG/jbmL4sk19gTPa/Jga2GRKJ8RT1IeLQdWnwBqeilUf+C2Zn9DXL
         zBmb5MpxHtA9inwnfcZnA51S6PBvJ8G3tbUkdoZCTY78Pfr645Blo43pWWz3mhfLrvXx
         RBzQ==
X-Gm-Message-State: APjAAAWwGl4YfyJzHgJGiZfqgs12YrM/JJsHKcr+Qs4BSdJN5tBiyEok
        P/aiTGLIRrsaXHhRfvrT2fPiyOwrb6dtHuZzUyh6mgET
X-Google-Smtp-Source: APXvYqxUgPc+q63zFYw/PCIwIQSFInVb5Z1r22QefA0l+rupMNFDFPehpalDEDVIROjZNnXYx5WbUGOc+qjk1udKb5Q=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr2920288otk.145.1566545144193;
 Fri, 23 Aug 2019 00:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190822195600.30787-1-jacopo+renesas@jmondi.org>
 <20190823001209.GO5027@pendragon.ideasonboard.com> <20190823063227.7soxv2gx7t7acsqq@uno.localdomain>
In-Reply-To: <20190823063227.7soxv2gx7t7acsqq@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Aug 2019 09:25:32 +0200
Message-ID: <CAMuHMdWA6R93obZ+cq9M2XOn-vHGXaPxwP_Nzp_t1CfDE5mDHw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add LIF channel index to 'vsps'
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Fri, Aug 23, 2019 at 8:31 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Fri, Aug 23, 2019 at 03:12:09AM +0300, Laurent Pinchart wrote:
> > On Thu, Aug 22, 2019 at 09:56:00PM +0200, Jacopo Mondi wrote:
> > > According to the Renesas R-Car DU bindings documentation, the 'vsps'
> > > property should be composed by a phandle to the VSP instance and the
> >
> > > index of the LIF channel assigned to the DU channel. Some SoC device
> > > tree source files do not specify any LIF channel index, relying on the
> > > driver defaulting it to 0 if not specified.
> > >
> > > Align all device tree files by specifying the LIF channel index as
> > > prescribed by the bindings documentation. While at it, add a comment to
> > > the 'vsps' property parsing routine to point out the LIF channel index
> > > is still defaulted to 0 for backward compatibility with non-standard DTB
> > > found in the wild.
> >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> > Note that Simon or Geert will likely ask you to split this patch in two,
> > in which case I'll take the driver part in my tree.
>
> I was not sure how to split this in facts.. Simon, Geert, would you
> like a v2 with DT changes separated from the driver comment update?

Yes please.

> (for the DT changes, one patch per SoC, or a single one?)

One patch for all SoCs is fine:

    arm64: dts: renesas: Add LIF channel indices to vsps properties

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
