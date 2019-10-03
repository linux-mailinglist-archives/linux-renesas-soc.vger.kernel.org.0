Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10EFDC9E9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 14:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbfJCMev (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 08:34:51 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42893 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728955AbfJCMev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 08:34:51 -0400
Received: by mail-oi1-f194.google.com with SMTP id i185so2385836oif.9;
        Thu, 03 Oct 2019 05:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IcTd9Itun0/KbmjKh/hg+t/fsSJ+uH8uK0GHc0XKVNo=;
        b=FMUZUMQdDqFoBg3F7z2iH+Cxjyc+lWqI5ALVQ2sYwM4+xiYwC4IZpbis5sO1y97sxJ
         dAEFwhN+aPazMF2YqUMkP5i7hHdTVs8Vd8LNg+ulAAbXmuclIvoKTxqO9tn/MLGjDEHS
         OGu1LXC/VMf7lPBsrmevwLmOo7DJJXsHsHWd7Zni3hn+P3w8nWe0cvWDFAx1hbuTfD2T
         PGRjTkuCOXRZnFcVX4GIxqVMYA2y6Iv/mb7v8FBWaumSXWveVrvLFppRW03sUyTh9ArP
         GmKJSoYl4IaA+OzLYw7b97TOS7C8k2rF+JmFCr63wASBhkjm3ZSbYKmjFCBp1f0cD17e
         t+cQ==
X-Gm-Message-State: APjAAAXP9jHCg43/+76PPYTGUz7iAwuJrL/p2OXoIYNN/A2PZGWQ9Ngm
        6e1GTprA1osJMONwsEWZxVrEBEoxTMmClyjJQhI=
X-Google-Smtp-Source: APXvYqxXgdBGyKVBW93M6H5LOzM6DCQTdl0OCF/0RLCC5POFepJqurio1hPG4ME9H1SWpjb/DvoqbRT5XNdTGbaQRlM=
X-Received: by 2002:aca:cdc7:: with SMTP id d190mr2504167oig.148.1570106090412;
 Thu, 03 Oct 2019 05:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <1570104229-59144-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570104229-59144-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Oct 2019 14:34:38 +0200
Message-ID: <CAMuHMdV_xMFK0uVNLbJRTzD4X7GxguwSin0TvK=aiQ-tR7xg=w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas, cmt: Document r8a774b1
 CMT support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 3, 2019 at 2:04 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
