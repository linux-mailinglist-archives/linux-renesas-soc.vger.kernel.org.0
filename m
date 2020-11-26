Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337FB2C53D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 13:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733253AbgKZMQF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 07:16:05 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42707 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbgKZMQE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 07:16:04 -0500
Received: by mail-oi1-f196.google.com with SMTP id v202so2049527oia.9;
        Thu, 26 Nov 2020 04:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/erZnxWXnxslQ4ZhtLnAtPyOjEighdhdwi5yfyZdws=;
        b=lBRl2HmeaCEzdJS7n7mxNy3A/MUvs4QdmzzE/g28UiGXpAuFhaORZqlawGR5bBdYgo
         7S+FTexYE6ZIdIezMCK+id0qbsxqUg1M1Cj9hLZydFMUIYmzMyiTYYpF2cITycaGHw/u
         XNhM1DEILI9znD2cWAha4/3Ca98k/1RcjQq4HmkcQGKl9CFvAgaNLvgeTNsIJvspOrHw
         TSTrrXVOZvqN+wExW9siCmE3hUrnkHFIyAoFzkP22jSQXDS+wzhoGYSWC/9/fvej+ve7
         GDSfXzuHYYhCb2+16xk7DkT7qceuzOdQMkba4d4TDE3p41HbXXRDVMjicLyohHuey1MS
         izSA==
X-Gm-Message-State: AOAM530OuaiaohfAaMiw0lWjcHhL6OWCHQI533GsCzULN1lwMPAX/4SF
        hpTmE/h0GqqzR7vJJYCbbzCKlCledZOamFpLv05mPPPAOAU=
X-Google-Smtp-Source: ABdhPJwN+e7eH2GQ98zSkQWw5t1ej/MBCxGJaynWcP5LLdoZlTCD7RzzBKxa0FMw9Yya6B5SI/5OgcN5nECRLPM9vi4=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr1916067oic.54.1606392963052;
 Thu, 26 Nov 2020 04:16:03 -0800 (PST)
MIME-Version: 1.0
References: <1604543524-31482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX17hSkcxYPgnGP95nH3H5s+G9Si01X_6PxJn0Skyoqhg@mail.gmail.com>
In-Reply-To: <CAMuHMdX17hSkcxYPgnGP95nH3H5s+G9Si01X_6PxJn0Skyoqhg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Nov 2020 13:15:52 +0100
Message-ID: <CAMuHMdWE1KF42W=D9cvjHR0mvWs6GuarPTkhMRS5n6Fu1mwAQg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Convert bindings to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Nov 16, 2020 at 9:40 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Nov 5, 2020 at 3:32 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Convert Renesas R-Car USB 2.0 clock selector bindings documentation
> > to json-schema.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Oops, forgot I should queue this in renesas-clk-for-v5.11. Will do.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
