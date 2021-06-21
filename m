Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED543AE783
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 12:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhFUKsg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 06:48:36 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:44011 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhFUKsg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 06:48:36 -0400
Received: by mail-vs1-f42.google.com with SMTP id v12so389810vsg.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 03:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aNeC6/Jn3hDNK/hBotQlEqfCi4uWrlGtU7AhGRPEEgE=;
        b=tx5aDyPo/+BZm02R9s4aqbvVvGqgy2qBMk+Ha0DEWQEM18M/fCFnCsURi3DHTRBDQi
         zaCzSp1/zeWLdOS+oHPrzHxuzE8NuURzM5js0OvKpwHJCYQw7LnB8guC9Hxb+3wwWU17
         UGxryUiSDKnnyfIyFh93m/QCfTGWt40CKrvn3VVG56GjGNztFSyNWWLIE/fKb/VObWnI
         R61xn0pQ//mlSHzNwTudU/gTwzGyNqxyFD7oQmEXvNHdNT+jvwvCjT/jyg8h8toGEJKZ
         ZvJDFyqPWefM4Oepx1f74U40UH35jylbeLew2/i2QtKHk4ejKjpG6K3ZZC3ORSYrm1Xq
         4zuA==
X-Gm-Message-State: AOAM531mL/AWPtZRUQCmq2vSP5jStaPlnVy61CIQCjdXvq56fjBc613J
        UdF877GOHBXT9NPRhbNQdoE1FZtWhc1u4I0v922OJTBWlvY=
X-Google-Smtp-Source: ABdhPJyylwv91uLDqPv7j5AUjbiFAB89vhR9t1y1kEyiEcQtE4r3Os5oyR0H6zfmXa73wZnptbpwK8Mn5Jv/z2kJyWI=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr16274043vsd.42.1624272381066;
 Mon, 21 Jun 2021 03:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <162416647337.11444.4467438519249633023.sendpatchset@octo> <162416648156.11444.10425966868846910243.sendpatchset@octo>
In-Reply-To: <162416648156.11444.10425966868846910243.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jun 2021 12:46:09 +0200
Message-ID: <CAMuHMdWhWTT-W0=U21XAX_z5LLkH8Odpzk=oZCjL=UMbQtQp-w@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a77995: draak: Add SW56 support
To:     Magnus Damm <damm@opensource.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Jun 20, 2021 at 8:01 AM Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add support for SW56 via "gpio-keys" on the R-Car D3 Draak board.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
