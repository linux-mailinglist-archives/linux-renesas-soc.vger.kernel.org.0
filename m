Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E993401DB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 17:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241923AbhIFPm3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 11:42:29 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:38871 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231781AbhIFPm2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 11:42:28 -0400
Received: by mail-ua1-f46.google.com with SMTP id s4so4005201uar.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Sep 2021 08:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KKZvd1YNNqvF5RkfjX+k627qF9szDtfM1T/6KcR+Kig=;
        b=HECUbkOOm4myr+KTeZ5LV0gW9gEfYoKEhMyC+CcoZi9Pk8ldG8MDlWqbgiUlPDVOXG
         +pc+7DTMQP2NI5WYjNFVC+UpmWSYAxiGTESV37DlBXWSy5BWyLMfOy5ps5BdsYOaQvWn
         kJIUXkV73aHQbos3RYhROHv3UqEN6+PoC3reaW69rSqzyAAbYWS53Ea8wC5k0f5gZpAt
         am/N4yvzU0qGFcr2djVroBIjo/4lTZys5EC07ipdIsgn6ZePxtk2NvhovKywUwqC/Sbt
         jGXiX+QLOkoKFgUPiiEzzigawdNQwqtsLrZLK/yva3XY9kYUU3lbpeHgH5ucPamF39+a
         qBJg==
X-Gm-Message-State: AOAM533dd/rIwiAqIwbjZhP7CpkozgqguqaUJ79+ytK+pJLHuj//GxOt
        e1FJn4wgjZjLIQJL2oaKROfca/sHDfpuZdk/jPnmnkoC
X-Google-Smtp-Source: ABdhPJzpYN0sMwvmYO7dMaKkFvjuoYecAXH6ZH5URIrnf5KCFBf+Z/Czc7kipTQkySrUZKiz70tPPKeQPeDWCu2P788=
X-Received: by 2002:ab0:2989:: with SMTP id u9mr5888182uap.122.1630942883762;
 Mon, 06 Sep 2021 08:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210901111305.570206-1-yoshihiro.shimoda.uh@renesas.com> <20210901111305.570206-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210901111305.570206-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 17:41:12 +0200
Message-ID: <CAMuHMdWqEBrq703VfMutqAW9XXQ3i3QXb-nvYT3yqRG7qxs6dA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add iommus into sdhi node
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 1, 2021 at 1:13 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add iommus into sdhi node.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
