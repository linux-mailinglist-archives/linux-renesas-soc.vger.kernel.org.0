Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED82A23D0E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 21:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgHETyT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 15:54:19 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:39746 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728094AbgHEQs5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 12:48:57 -0400
Received: by mail-ua1-f66.google.com with SMTP id y17so7890769uaq.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Aug 2020 09:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DzqbPUlf3vkITjRSPP4jqUNQq2HjOeVWi+/hpMFqakk=;
        b=U3WcyvLChaXUXHUvPEII91SHAUQMVMzORADWxoXkZ+O/p6KuQ6MxEiCnxjzWrgKGNA
         7iN7VGoON4B9Usr0AatUdYX+uyDFA/9L5Tzl1+xcjhhhm2nKuLC+O0tu7of2mh6OILQg
         Ru9sOWPdFRcCeDspx4VArQhnhTjZN2Sosep3iK7+QvBGO4k6M88Prs+kRQrf0YH7FWuv
         Z2KcFB9qh0mFpnNeLPuGuRKrWjrOr2lxJoXo1x9+4NYmuGoHZQgDIc3C2orgmi6NMNLV
         nmsN+FlRsf01nuz9ghRkh7jgId3OivMgyZLNvpl1XkYLS0A1n6IF8dV78F3p4tEitxXs
         vlYQ==
X-Gm-Message-State: AOAM533EQe9/CIQDl5ANHF6SF+sDb5u58bBhdxw/r5rsvOpdUIKCMJuc
        N3hHSHBxaA0Uen3lpJKiIsI/TzFhpZjjUbP3jg15fA==
X-Google-Smtp-Source: ABdhPJxBIIGoCbvgNYwQ0gul5eerSD5PFRtEiE6mJv19QdQ+yovZhQEvBIYEby0TQaBleKPpHd1HBGQPRcxttNaFx5k=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr2271497otn.250.1596627269280;
 Wed, 05 Aug 2020 04:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <1594989201-24228-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1594989201-24228-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 13:34:18 +0200
Message-ID: <CAMuHMdXqkJ34w3qUgQB8B9UFbuQFEac_gxJXtqkRwofTE--76w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb: add full-pwr-cycle-in-suspend
 into eMMC nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 17, 2020 at 2:33 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add full-pwr-cycle-in-suspend property to do a graceful shutdown of
> the eMMC device in system suspend.
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
