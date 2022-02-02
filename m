Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BE34A6DF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 10:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244330AbiBBJio (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 04:38:44 -0500
Received: from mail-vk1-f182.google.com ([209.85.221.182]:41898 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbiBBJio (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 04:38:44 -0500
Received: by mail-vk1-f182.google.com with SMTP id y192so12216843vkc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 01:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oMRNp2iTNXIOQ4mhpN3/g1XYqa8UdDXP4AL8cRQb8DU=;
        b=42p+vT4EV/G8rjt347QBlM7tZhyCB8Oz29aDoi080HTTrt2BXCVY7kmmp/HI+ue5Yh
         KSlhJN7oTnHqUrGgGmsF6za1Y5iQFrncGQttpDlVZehWrnyFvi+IRFE+B4m+rvJgvdQE
         2lSo6HEsyZa+vtrDeqVy5ICuQNkTpcb3xgQhmVtyv6TcIjTYkOmqA20gu7jr7bQKfHrE
         xcVKnlh548hGA4ZTZ7Z3gZU00MUp/JuR8bpeNBXD8ffJtojmKlkn42uH9srMX7MkNgcP
         CGVJr50a9Co1jKjcJzHMUpvkZrdV9dcYhHTL6vSc7wTVPdXzFanzhkFAbaootVestmHH
         5GhQ==
X-Gm-Message-State: AOAM531+ZGnNqvq051xxTGrYwyDT8yVXC6x/rj8fZxArhgfq8sq/CPYk
        +T4oRG8T+NDzp/3b1ovXm+oquxpy6dRvzg==
X-Google-Smtp-Source: ABdhPJyuIqzuGWRMVjRtQL0NL6nkrLqJLZzAYQS6KS6VYuWeZnXxXwXMjnc/IRBV47beL0DL/1Y3uQ==
X-Received: by 2002:a05:6122:209f:: with SMTP id i31mr12298650vkd.3.1643794723414;
        Wed, 02 Feb 2022 01:38:43 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id t14sm3473588vkb.2.2022.02.02.01.38.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 01:38:43 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id l196so12230178vki.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 01:38:43 -0800 (PST)
X-Received: by 2002:a1f:2555:: with SMTP id l82mr12296464vkl.7.1643794722771;
 Wed, 02 Feb 2022 01:38:42 -0800 (PST)
MIME-Version: 1.0
References: <20220125130021.4144902-1-yoshihiro.shimoda.uh@renesas.com> <20220125130021.4144902-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220125130021.4144902-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Feb 2022 10:38:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuR__1MTvZvvSXnRdaEcry=-sKZbBihGjRe1T1WRvTRg@mail.gmail.com>
Message-ID: <CAMuHMdUuR__1MTvZvvSXnRdaEcry=-sKZbBihGjRe1T1WRvTRg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779f0: Add iommus in dmac nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch!

On Tue, Jan 25, 2022 at 2:00 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add iommus propaties in the dmac nodes for r8a779f0.

properties.

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
