Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D07260D13
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 10:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbgIHIIf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 04:08:35 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33843 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbgIHIIb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 04:08:31 -0400
Received: by mail-oi1-f194.google.com with SMTP id n2so4337876oij.1;
        Tue, 08 Sep 2020 01:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZZ8juEB5ESWt7COft3OIz6Zh7GIcQEgWmY/PNedOlU=;
        b=cZDF+5JblUYQ+kTzoIOnBU/unadxkyicBuOjHm/kdpWNV26X6uVdOl1N3w6H1I/xMJ
         YXEVRfo2KdDFiAhYzHgorH6K6LAGz/5ftxf08mKB804aDazdk0lDCzM/TgTcZJcYK77H
         U4ZOtBmw/4niCgkKdtyMZSZHcXu/i9zUyJWL45U3cNYrBYxMlGk3oXK6cn+9+ttQZcf/
         erEFwItobeqT7rfZgFWATUIuZTJnloxm66/C9pzcEkGls//jkWbNLVi0hdddZiEmfb2H
         n83kt/EP+T/IFCNcEo9jwiVx0jzMBTVHJ26Yn8J2WFoLgU+jtfx+3oSBA7/FQaZg5ddA
         XMPg==
X-Gm-Message-State: AOAM5310yABAEiz8XmMVZZ65azNLMdb261RwS/thg407NSYCeLJI9ATS
        PsqricsNNYg4y01iZXhCBtB6dwy0bTaFbaBhRfE=
X-Google-Smtp-Source: ABdhPJzy+7JmKXzdfJg+7LCk72Fc+JazGVeVFSgK5eqy8lP90dfBkzxF4fY1BSAtwjb8jmzQ33sj1lSP4Bu5N7l41A4=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr1929838oib.54.1599552510880;
 Tue, 08 Sep 2020 01:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 10:08:19 +0200
Message-ID: <CAMuHMdXQ1v+rFeOX4GSDcWgKKeJAG2WhjEb-4-QLrGROjUg-UQ@mail.gmail.com>
Subject: Re: [PATCH 03/14] dt-bindings: power: renesas,rcar-sysc: Document
 r8a779a0 SYSC binding
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document bindings for the R-Car V3U (aka R8A779A0) SYSC block.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
