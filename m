Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF26C1E1C95
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 09:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731662AbgEZH41 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 03:56:27 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36027 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgEZH40 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 03:56:26 -0400
Received: by mail-ot1-f67.google.com with SMTP id h7so15585735otr.3;
        Tue, 26 May 2020 00:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=csDDCNL611WbHdWFs8526ifl/n2MkndYxm5xUkbs6mE=;
        b=Fg4GKd7CybnOOb1CE1IWT2l/vKxITY5riHO2e/q3K+KppUjBNc8F61x1oXKSQzoeYR
         /lOQxPXgpU29ir5OmDVGdvJEojxnOP7jfkpBZs54Ydef4ZMIXS+za15Stnz/uQI9zX/x
         9ff8qpUv8ArV/38yUFDV+ArZW8wIjVm3ZfXWCN9jN4L5QyWA3EX55vyxXA7nJlXvWSDb
         CzUsZYappVqeFHMQxvvzwyY0RplxGN6UYyhQEbXfvGqMbblR35XxgdqmaJlmvUW84Zqe
         Jh6xD+aYhz51LVuqRvs+9zts08ANgKs/qa7XkBHtL7bkMAPtd3LpPXLOJJAZjl83tBQm
         0MIQ==
X-Gm-Message-State: AOAM5319C9dxOiEGUG74HU1FosNwQxGUUwG1k0bw7spZDbsJveza9MVw
        Euqmk9osmKyfmq6ZQiHb/WR+gNGWxqbPyLgEqyA=
X-Google-Smtp-Source: ABdhPJyMWhODmPbddD8N7snI+n0OkCQkbaSwnNAeVADmYuSIH0vc12ascJTRhbCwGR1jc7GrNqHLdwxXCv/E1W8H/3g=
X-Received: by 2002:a05:6830:1151:: with SMTP id x17mr3687otq.250.1590479785513;
 Tue, 26 May 2020 00:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <1590420129-7531-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590420129-7531-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590420129-7531-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 May 2020 09:56:13 +0200
Message-ID: <CAMuHMdW=5ZNz8sC9aDGcy3tjBMqXVHzLooei4LYWo44mOs4-dQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: r8a7742-iwg21d-q7: Enable scifb2 node
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 25, 2020 at 5:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable scifb2 interface on iWave RZ/G1H carrier board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
