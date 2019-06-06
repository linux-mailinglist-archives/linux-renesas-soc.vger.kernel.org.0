Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1837F37BD4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 20:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730414AbfFFSGm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 14:06:42 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40556 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbfFFSGm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 14:06:42 -0400
Received: by mail-lf1-f66.google.com with SMTP id a9so837592lff.7;
        Thu, 06 Jun 2019 11:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UEd66WheiI8yyTRsEa+z8oLhtOyljtbH2T2dZCHUna8=;
        b=s5Wv1Fb7WHdpwRtST/K+oqN85JaYjOiLZAeQI5877b1aZeORAslVYsdZssg9Y4HYjN
         lszdFGdIlpTUzV4NGuRrHUfUzog4ZdkwYI8S8CwV76roAly5envW3I4LMm+Lg5iWznEA
         blYhmeQp1O7kZaGZBwyO2dZSnLN3tCpss8JsEbG95rWWNeeGz/JhCE0mUgscizXrZJG7
         GArP1emPG2QI96blnaErB7qBkj8XSARSpy4pUTJr3YbpfCPRLyz8ciHXqHg8XZKiXi6Z
         SpW/EqxpJ0mksibx0bZNSsKjsG+1YccnltFpDBOwtLmZf0RaTt3LFzz+7naU/OQdKuJD
         OWmQ==
X-Gm-Message-State: APjAAAWaAi+2IZcQYKktRk3ZflY/7imRVmdYQK+DEHEoofXhzDUoBOgV
        u5Vpus1+7ijdJOjGkvkDqp2l1+NfQgKnG8Y2yuo=
X-Google-Smtp-Source: APXvYqw2DQ1hkk9NGbrMoCpxPWvvSrGluX46vvZioEEIXVAu80TMiNPQs4dgaO2PEUOJN7DoCJlk4qvMl+vqvSMGZvQ=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr414494lfp.90.1559844400270;
 Thu, 06 Jun 2019 11:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org> <20190606142220.1392-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20190606142220.1392-2-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Jun 2019 20:06:28 +0200
Message-ID: <CAMuHMdXcsxnqxpQLundZq9rCTHBTN4bP4gSpUrYBCOP8NN7TXQ@mail.gmail.com>
Subject: Re: [PATCH 01/20] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Thu, Jun 6, 2019 at 4:21 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add device tree bindings documentation for the Renesas R-Car Display
> Unit Color Management Module.
>
> CMM is the image enhancement module available on each R-Car DU video
> channel on Gen2 and Gen3 SoCs (V3H and V3M excluded).

R-Car Gen2 ...

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> index 000000000000..d8d3cf9ce2ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> @@ -0,0 +1,25 @@
> +* Renesas R-Car Color Management Module (CMM)
> +
> +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> +
> +Required properties:
> + - compatible: shall be one of:
> +   - "renesas,cmm-gen3"
> +   - "renesas,cmm-gen2"

"gen3" and "gen2" don't carry much meaning on their own (SH2 is gen2 of
SuperH?). Furthermore, revision info should immediately follow the comma.

"renesas,rcar-gen3-cmm" and "renesas,rcar-gen2-cmm"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
