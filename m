Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 243CDB0E7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 14:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731411AbfILMDg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 08:03:36 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42385 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730454AbfILMDg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 08:03:36 -0400
Received: by mail-oi1-f195.google.com with SMTP id z6so11347108oix.9;
        Thu, 12 Sep 2019 05:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dAter5ihnXBTYAaNi7sEgCFPygX/nf9VCuXJNZdSmN4=;
        b=ZuJ6kv29fN48hSfUXzz4pxd1CLb+G+9d6MSdZCp8XbOerp21Iate6yv9wcDQ01bKhu
         vsMiSt3+Qu3aeFUdYeGc6L8iRekooKrksMiR3EVHhpW+yI4j2AVgSZ+pRO3xXbNjMQH8
         rSTdNBjftCRLr7h7AFu3qVA7t9q3BjDWn77lz0Ua7XQ1pzRE8hsD8Y17rOBb1L9w4QWg
         TppwJJfR3WzKHKD9TMMCZ4aZfvNEGeqW4lp5veiFjZG3RcteAvsxMB1yY3rEljvHbeuq
         lonUlJ8cMVLDKXt8idliozjseFaxpUPZjSBzUFPfOZKxq2csnJIlDz1GLTqzXcRC5lcV
         /YOQ==
X-Gm-Message-State: APjAAAVFYW/LU640E27obu0SP+ul8+BslSJkDiJv21kBgXdRL8Vk1R+t
        eq+YnVNt3hZEDIFXvId4zIy7FcmazkQT4hi5Wws=
X-Google-Smtp-Source: APXvYqw55cL6ePYgoRX18n3lZWVAOJ6JGFgMAqg89yEN1I4+ZAJCYO//k48A8xejhV1Hkp+i0JBiIeRvlGS3MrUySD0=
X-Received: by 2002:a05:6808:8e3:: with SMTP id d3mr7841555oic.153.1568289810430;
 Thu, 12 Sep 2019 05:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com> <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
In-Reply-To: <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Sep 2019 14:03:19 +0200
Message-ID: <CAMuHMdVYqx_znkMbwCVyA6WH8-0uOotL3wXCTkvyXG1=i9W-ng@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Sep 12, 2019 at 12:26 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> (pulling in +Geert for his opinion on compatible string usages)
>
> On 12/09/2019 11:00, Sergei Shtylyov wrote:> Hello!
> > On 11.09.2019 22:25, Kieran Bingham wrote:
> >> Add direct support for the r8a77980 (V3H).
> >>
> >> The V3H shares a common, compatible configuration with the r8a77970
> >> (V3M) so that device info structure is reused.
> >
> >    Do we really need to add yet another compatible in this case?
> > I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
> > a patch like this one didn't get posted by me.
>
> It's not just about the compatible string for me here,
>
> There is no indication in the driver that it supports the r8a77980, and
> no comment in the driver to explain that the r8a77980 is shared by the
> r8a77970.
>
> This patch makes that explicit at the driver.
>
> Also - I am considering sending a patch (that I've already created
> anyway) to remove the r8a77970 reference from the
>
>   arch/arm64/boot/dts/renesas/r8a77980.dtsi file.
>
> This is the *only* non r8a77980 reference in this file, so it seems very
> out of place.

Agreed.

> In fact more so than that - except for a seemingly glaring typo, that
> I'll investigate and send a patch for next, this is the *only* cross-soc
> compatible reference:
>
> #!/bin/sh
>
> files=r8a77*.dtsi
>
> for f in $files;
> do
>         soc=`basename $f .dtsi | sed 's/-.*//'`
>         echo "F: $f soc: $soc";
>
>         # Find all references to all socs, then hide 'this' soc
>         grep r8a77 $f | grep -v $soc

This hides the complete line.  So you better use e.g.

    sed -e "s/$soc/soc/ig" $f | grep -i r8a

instead.  No new offenders, though.

> done;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
