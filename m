Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AB02640E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 11:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730093AbgIJJF5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 05:05:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35972 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgIJJF4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:05:56 -0400
Received: by mail-ot1-f65.google.com with SMTP id 60so4744587otw.3;
        Thu, 10 Sep 2020 02:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hFNMAhYmlLxYKeb7svmHG1hXMeSW5ltqU9S2s32FYG4=;
        b=CYI0oCOON+BOI+EKwufA9OK+FX4kOM5NGW0+T7yLf5MUob7E31XVwV4wp3/WJRqNUH
         rujuaqljxc4TFrIHo8IEhOXtvA4+gHbGCkpoiAmACmBgsWr+5RyiZFNCcCBI1IB8MgUb
         V1oP404UcUhdp9aDPWGnexQNhUCoa4q6I4kfGa1ZKUaldg3rJ/s8eh2QwaA3Kuiszixf
         tE9xT7tkkz97sjoq/zWGf2truMxjg8WXQKuBzjDPyBmFn/3Xf4++O4EFYN/vwq4IeCwf
         bpCRJkMHNxF3E9tlZ70IyFwuv3qNuOxjXl+Qhcik0CtTvPKG7dhJGLiuKBM4nANev2Xy
         W+zA==
X-Gm-Message-State: AOAM530vh5jxBTsNaZnCrvj/CyPum2vj4r+QMcPKY4iNyx0bXmwOrVlp
        70gQ9qfxC4Sf8c+DhXW24EoLbNqYjtg/sr8bYmk=
X-Google-Smtp-Source: ABdhPJxniUaza46mYCMHdv2Xhtn1rGJeyKAGQvZtGFWosMTcRyVa75TOrOoPNNukhNh2gMy/jn4/RGfhdoG1mbLYG5I=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr3061640otp.107.1599728755415;
 Thu, 10 Sep 2020 02:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200907155541.2011-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200907155541.2011-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200907155541.2011-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 11:05:44 +0200
Message-ID: <CAMuHMdVdfZCbKdXbWMONVRdBPE2k07Gp1tRsGO495DStA9uRpA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED indication
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 7, 2020 at 5:56 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for LED trigger on SD2 interface.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the update, will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
