Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECEC31D3B8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 21:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730064AbgENTDI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 15:03:08 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33864 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729645AbgENTDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 15:03:07 -0400
Received: by mail-ot1-f65.google.com with SMTP id 72so3297174otu.1;
        Thu, 14 May 2020 12:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NuQFLQ72I0J0DKeS9L7b1iMxSobCW1C+Qb2KkEUowaM=;
        b=R5gVpDIq0DHIv7SzGtqgqOnVWMuq8Qkxn5wChcfjAeElLColOX3RQH4auRk9DLonRv
         +Xh6rSvi9n8corlLJcmRwiainaDuUEO8Sqtr5+2fVGS5KkMUmJr0H/thg0eIfPX0NmaP
         vSkKwEZDRpK5CGC7hwdqpKxOiJFCUQMyV5D0KTOmHqOtstIOuKPpiSwC4IFfarwIbcTA
         hSlfZwxppodEaP5ryl53Up96E76OZM5n0HVf7CTLMla1hIuXCAN2YOH6rx4Y0A30kKh8
         2lPXccUVn1ZfrgrWtDc03VC4qKvli39SkNOqTTKyDM4l1i+h5kj++qPEdbED6+tCZFAt
         3dNw==
X-Gm-Message-State: AOAM533MmFsegbRI3F1CiYCNIWURAZihgli51T183FdGSs8YfO1ZQGnL
        cDszFuxsiPY/aKPgTkZ9wLU3SbkFryETFc1fTH8wyHx/
X-Google-Smtp-Source: ABdhPJxS/x6khHmLb+BuWxzhx5jsDw8uFHomhEbhTkk23nKiA6DF1SpbqxI4DkSPB4fSmxLf/QvEVGoNgyYH9rONp9Q=
X-Received: by 2002:a9d:564:: with SMTP id 91mr4736276otw.250.1589482986051;
 Thu, 14 May 2020 12:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com> <20200514151721.GF5955@pendragon.ideasonboard.com>
In-Reply-To: <20200514151721.GF5955@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 May 2020 21:02:54 +0200
Message-ID: <CAMuHMdVrO8WfKVdp2wONSYg=cbK=CWyXMyC+Hqv4tkiuCm5WAQ@mail.gmail.com>
Subject: Re: [PATCH v1.1 4/4] dt-bindings: display: bridge: renesas,lvds:
 Convert binding to YAML
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, May 14, 2020 at 5:17 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, May 14, 2020 at 09:31:53AM +0200, Geert Uytterhoeven wrote:
> > On Thu, May 14, 2020 at 1:29 AM Laurent Pinchart wrote:
> > > Convert the Renesas R-Car LVDS encoder text binding to YAML.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Acked-by: Maxime Ripard <mripard@kernel.org>
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> >
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > > +
> > > +    lvds@feb90000 {
> > > +        compatible = "renesas,r8a7795-lvds";
> > > +        reg = <0 0xfeb90000 0 0x14>;
> >
> > #{address,size}-cells = <1> for examples.
> > Applies to all nodes below, too.
>
> Why ?

See "[PATCH 5/5] dt-bindings: Fix incorrect 'reg' property sizes"
https://lore.kernel.org/linux-devicetree/20200512204543.22090-5-robh@kernel.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
