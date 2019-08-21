Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C75AB975D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 11:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfHUJQT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 05:16:19 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42904 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfHUJQS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 05:16:18 -0400
Received: by mail-oi1-f193.google.com with SMTP id o6so1047954oic.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 02:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5hGUi2i0nxlriQ2qrMCFYYed8crPnjN9WOG0blAzANk=;
        b=IMnAgdH61NN7ZIJGliaYm+VW2b7pbseM5Kd9We8cOIA6x4lGfMBi6gt2HhgJpDxNRW
         UUFcT+XaGIMhwn35NCenkW9wrMkqsb5styUv6lbccxuoBW4rI2nU5XU17gKlFZNZUOkF
         S9ZBZ8m4FcwMa9Z3Wk4oxLJfBkGdkqlWmFKE2NHKDj993ESKEjk2MvrxOVlVktWQzuKg
         XRI0oK1Ja33xIYdm8wibqnoZwofxIcwTPSnDw3v9rT6BbZA0Ole1ZRd99g57/FQ/mQdx
         TydzR8LL5zrf+BI7AuNUtkMdXqJqa+ducxL0+m8CDhFlsnlVkO6FB7hdpQ2jT3fhHdJb
         /gvg==
X-Gm-Message-State: APjAAAVICcf07J8H2hQsUCIMZNs85C+QjqxXGSljIBeBGsKU1ERZVD8h
        lrnIkfCL6Xg2wL4lBPwm7oC9qiPKfMA/BB3k5cA=
X-Google-Smtp-Source: APXvYqwCVNd21cHc4hxxioHAtgf4sAwOEb6D7/AVN+LRalxsgDIgIyZU4/25kxUoJAM12e9UsnBanVAFnWf5vWFpmKM=
X-Received: by 2002:a54:4618:: with SMTP id p24mr2888672oip.148.1566378977991;
 Wed, 21 Aug 2019 02:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190807085415.24854-1-geert+renesas@glider.be> <20190821090657.shogjxxe5kdwfgut@verge.net.au>
In-Reply-To: <20190821090657.shogjxxe5kdwfgut@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 11:16:07 +0200
Message-ID: <CAMuHMdVzZ7oHvHP9arjiX0jRCH1ooP5D7BBWFW_9E1KoXTam+g@mail.gmail.com>
Subject: Re: [PATCH] ARM: debug-ll: Add support for r7s9210
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 11:07 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Aug 07, 2019 at 10:54:15AM +0200, Geert Uytterhoeven wrote:
> > Enable low-level debugging support for RZ/A2M (r7s9210).
> >
> > The RZA2MEVB board uses either SCIF2 (SDRAM enabled) or SCIF4 (HyperRAM
> > only) for the serial console.
> >
> > Note that "SCIFA" serial ports on RZ/A2 SoCs use a compressed register
> > layout, hence add support for that to renesas-scif.S.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
