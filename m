Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5398B4E4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 14:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbfIQMpC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 08:45:02 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39187 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfIQMpC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 08:45:02 -0400
Received: by mail-oi1-f193.google.com with SMTP id w144so2700817oia.6;
        Tue, 17 Sep 2019 05:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EGrylub0Vk8AQ2S2om1sRF1egJvGplwJRUQecCBF1jM=;
        b=Nyecy9+zA+Udmh8I3clrsWuA2DLSjwgf06+lWzk4/682YBTa/h4xSVzDe8Bmv3o/hz
         5qDvFh7zRyalm5WCOa10czUek2AjcP9hYsN/iM18PrTUL2pPYpxQxImpvjfdsc+gb3A8
         CY9yn7raaJl6ZI1kSOCswxAEptKvh/8oV3jNlJGEpRvNZo5+GGIHtNUDxbMzEbR3Zv3/
         Mc0ZELi51emQJrleimCulaxHleQ3WMpifd4p7okFaD3SwxnbFhF5QvEIm/ntnRFjcOqw
         vCgzFBJH4MtsseSePGH9p8uBFi9tgQa1dbNzr8MA0uxNVB8KZuUpefNiH2RZr0hgD+u0
         yAOw==
X-Gm-Message-State: APjAAAVJGc1QWRBevR+kq6C7G79fr5HXZo3rXr92pZ8Bh+HpTMiCqv8b
        spoRAhof5gc1mhUPAhQ+7kMCp0xahazkf1e8wTQ=
X-Google-Smtp-Source: APXvYqy4iM39a4KjFwbPSysPivU35jjp+zaMnoFfrE+FYTbG/2MDMlWkoeZp6T98/dw58YxRz3uygre41tZNo/s3ZDM=
X-Received: by 2002:aca:b654:: with SMTP id g81mr3215212oif.153.1568724299972;
 Tue, 17 Sep 2019 05:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-2-horms+renesas@verge.net.au> <CAL_JsqJHiAmH0eeUMLH1q9X6e+88EVZrmMtM33rVWCyBAszY8A@mail.gmail.com>
In-Reply-To: <CAL_JsqJHiAmH0eeUMLH1q9X6e+88EVZrmMtM33rVWCyBAszY8A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Sep 2019 14:44:47 +0200
Message-ID: <CAMuHMdV2bvVXWPeJqvhh+NSwmt5RbHgzCPGC8K+0Nwy7gQF+8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: bus: simple-pm-bus: convert bindings to json-schema
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Tue, Sep 17, 2019 at 2:12 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Mon, Sep 16, 2019 at 10:35 AM Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    bsc: bus@fec10000 {
> > +        compatible = "simple-pm-bus";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges = <0 0 0x20000000>;
> > +        reg = <0xfec10000 0x400>;
>
> If you have reg, then it shouldn't be "simple-pm-bus" unless you can
> function without accessing the regs.

Typically the registers are set up by the boot loader.

But this is actually the example for renesas,bsc.txt.
Perhaps agnoc@0 in arch/arm64/boot/dts/qcom/msm8996.dtsi would
be more appropriate?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
