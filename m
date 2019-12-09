Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6C6116DDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 14:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfLINYF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 08:24:05 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33576 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfLINYE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 08:24:04 -0500
Received: by mail-oi1-f193.google.com with SMTP id v140so6300002oie.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Dec 2019 05:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=4VcrC1StOtqbML8PQ8oY3juz7jF1dZy7bE/s1r8en7E=;
        b=J10O/Kz+Qg5/Zx8qDEd8XyTzJTUO0sZS1pg255la5PT1nUm+YbqyvkEsXwMr1rdKD1
         e2cCBh7PrIFyNgSaughHzTHb95a7TvbvgBbzxXuiqep1JiNNyu1LGVnnx6GZMSb9fN/H
         vRVJvtNBC4A0tWFSa4Bu7nkc4aHH/dn6WrrnkTFcLrlYWGvgYG79ti6ksm8LKmX02qPs
         ARDMRbUQD/sVJH7Xrlx6pWqkEhd63JJFAxriXKrDX/ZpN1vU+q6adacLrHRc0GFXiqWn
         2VLUcfCRwoNmObrYUv7s5A3yTFytqT82cldKpAy6EEtDBOo9tzE+4Kfw29YzYeLVe+ns
         y/8w==
X-Gm-Message-State: APjAAAUU0LgYDO+Q8ycqs+lwmcWIRzpd76v8YGA8ANV+3XknWpF0U/EO
        RIMLnPgcrS0xisbQzWjaP/AbkuNmFaKMN5amHzbwaw==
X-Google-Smtp-Source: APXvYqyEEUJ6t3AXC5QjZftz5cmh8kxAVj2zd6c050dBFie614LKDJLZCR8Qa3Ncv8qpcmh5bzFd/8NJie7j8LgT5m0=
X-Received: by 2002:a05:6808:8ec:: with SMTP id d12mr17557521oic.131.1575897843618;
 Mon, 09 Dec 2019 05:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20191209101327.26571-1-geert+renesas@glider.be>
 <20191209101413.26686-1-geert+renesas@glider.be> <157588777318.6568.11721295229201233140.git-patchwork-summary@kernel.org>
In-Reply-To: <157588777318.6568.11721295229201233140.git-patchwork-summary@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Dec 2019 14:23:52 +0100
Message-ID: <CAMuHMdWrE9CFzWw4DeMNK4Jw0iyxvdjWUPpdfaZQe4EQs-U7Pw@mail.gmail.com>
Subject: Re: Patchwork summary for: linux-renesas-soc
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 9, 2019 at 11:36 AM
<patchwork-bot+linux-renesas-soc@kernel.org> wrote:
> The following patches were marked "accepted", because they were applied to
> geert/renesas-devel (refs/heads/master):
>
> Patch: ARM: shmobile: defconfig: Restore debugfs support
>   Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
>   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=213533
>
> Patch: [LOCAL] arm64: renesas_defconfig: Refresh for v5.5-rc1
>   Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
>   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=213537
>
> Total patches: 2

FTR: Reverted to "Under Review", as the patches haven't been queued up yet.
I did apply them on top of renesas-devel, after merging renesas-next, as
not doing so would cause regressions on Debian 9 with systemd.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
