Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DA13A0D75
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 09:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237182AbhFIHRN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 03:17:13 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:34380 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235160AbhFIHRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 03:17:11 -0400
Received: by mail-vs1-f53.google.com with SMTP id q2so4935022vsr.1;
        Wed, 09 Jun 2021 00:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iUClBMls9aiq6YhYnsPHqUWWwS2OO+tnQ5fZSKVIqwE=;
        b=mxAWTKOWktdjKUW1Bl4VyS3pD6yfBM0hfHpsK0LB1xg0SY86z58hvTsYMns/k7OFU1
         CQQYkW0+kBhsHyusENVbBHX9Ll8GLq+HMeg3OMeJP+voQ2GsnIY7E7DdXZRnVoK3W64M
         haBP3rmP1I3j2tIAdXkPsKEvhZ+m/5tU2EpjZjZ4RatKZpKhtZG2DqwSS5FBcMvlc7ib
         4ZeE6rr9HN1Qv5byWZZ6SHoOGhJ686m1iaUath1QT5q9kP3eWb5vW8rUnQvJs2aE3V40
         shD0Tt4Z6nDqmA+NC84bygnKdl4uhWa0VdguNlQH7Z5aUX6nbOuUw5cu4tiVPz1S475r
         sSNw==
X-Gm-Message-State: AOAM531QhPeU2aNrtcnlMeWs/X67bpSldn+zYA4EjUhA9Zlnxw/KBCN1
        JSKFwQuChaRU/TvyS9uxsDJskVu7ezl0zvxVUlc=
X-Google-Smtp-Source: ABdhPJyGdP0sjgGLDBZmGVp95URQr0TkbrjG8FEUw3GO1SFCkcL6EyFYobVCiAwvudV1vqIYOWOGZ/8VEYef+5L7Dto=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr3962286vsr.40.1623222904640;
 Wed, 09 Jun 2021 00:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210604121123.650-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210604121123.650-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jun 2021 09:14:53 +0200
Message-ID: <CAMuHMdWrgLL+AAUKDK42=nmAK1QUnzs_c46egP932+_=6kGTNQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: arm,gic-v3: Describe
 GIV-v3 optional properties
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 4, 2021 at 2:11 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Describe the optional GICv3 properties:
> - clocks
> - clock-names
> - power-domains
> - resets
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
