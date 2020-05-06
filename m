Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5161C6A22
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2020 09:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgEFHfi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 May 2020 03:35:38 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35334 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgEFHfc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 May 2020 03:35:32 -0400
Received: by mail-ot1-f67.google.com with SMTP id k110so617134otc.2;
        Wed, 06 May 2020 00:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KaaQ3JVHNW9+KW3DWTK/zjD9haMqlfwmC2rgvXxWOxg=;
        b=GBe3rxqNBfZ8J5QooMx0lzKoqGgPk2zZpJFj/m3LZIB9UYNP3ycmjvgHp8sGVgDWNt
         2RHdYaI8kpGKpbgBt4JCTAR9jwk9+pu//zXxYqv7Iwoce6NtpeuDwMOp6fAWRAQq1ZvU
         fWLu9p+MAW93TLbTl1FXTqA/ptSeYpkooGMQYBL1o/8QC3yHazg6me9QCMPySVUs+Uye
         8+ATjZacbdFss7Lduiews8dhgo7tYImrT0+aFLUz8VMjK6jqMPpPvAXQKLfeUvEx2mH9
         sNwnhiY2zbvQReJxd25/0Vr4S1nJoJzCKHBj3vRcE82jq1cx25oCdIcr/eoUHCRgzAyz
         00mA==
X-Gm-Message-State: AGi0Pub7opPTXRWiBGUOLoJnOru4B/gHhpZUIJVPg2TAnY/txYD6jA4K
        3mvYyLdJ1BpoIjPob7JFLeQoAQo+bc3SyNldV7g=
X-Google-Smtp-Source: APiQypIJrhDe/Vgt3mVUWPfg4FB60SQpTU5K4VksQjitu3J0AArp5f75VH5DVPbJhfmUtRFTZrmPKhr4Y9IuFONKgxY=
X-Received: by 2002:a9d:7990:: with SMTP id h16mr5118108otm.145.1588750529840;
 Wed, 06 May 2020 00:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200430084902.1540-1-geert+renesas@glider.be> <158870715221.26370.13261608407586100210@swboyd.mtv.corp.google.com>
In-Reply-To: <158870715221.26370.13261608407586100210@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 May 2020 09:35:18 +0200
Message-ID: <CAMuHMdWOnYVaeTFgUbg+CmB5U9NCZUraC7+MQYyn4T7ScMqzTQ@mail.gmail.com>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.8
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Tue, May 5, 2020 at 9:32 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2020-04-30 01:49:02)
> > The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
> >
> >   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.8-tag1
> >
> > for you to fetch changes up to e2f022c10ed3b50ba1d2bb1f037b0e7a84cb1c3e:
> >
> >   clk: renesas: rcar-gen2: Remove superfluous CLK_RENESAS_DIV6 selects (2020-04-30 09:39:06 +0200)
> >
> > ----------------------------------------------------------------
>
> Thanks. Pulled into clk-next

Thanks!

> I see these warnings with smatch. Is it a real problem?
>
> drivers/clk/renesas/renesas-cpg-mssr.c:851
> cpg_mssr_resume_noirq() error: buffer overflow 'stbcr' 11 <= 11
> drivers/clk/renesas/renesas-cpg-mssr.c:860
> cpg_mssr_resume_noirq() error: buffer overflow 'stbcr' 11 <= 11
> clk/renesas/renesas-cpg-mssr.c:862
> cpg_mssr_resume_noirq() error: buffer overflow 'stbcr' 11 <= 11

Hmm, just installed smatch, and gave it a try, but I don't see that error:

    $ make C=1 CHECK="smatch -p=kernel" drivers/clk/renesas/renesas-cpg-mssr.o
    ...
      CHECK   drivers/clk/renesas/renesas-cpg-mssr.c
    drivers/clk/renesas/renesas-cpg-mssr.c:378
cpg_mssr_register_core_clk() warn: passing zero to 'PTR_ERR'

(that one is harmless)

The buffer overflows can't really happen: cpg_mssr_resume_noirq() indeed
restores up to 12 registers, while there are only 11 STBCRs, but the
check below makes sure any unused registers are not restored:

                mask = priv->smstpcr_saved[reg].mask;
                if (!mask)
                        continue;

However, unlike cpg_mssr_resume_noirq(), cpg_mssr_suspend_noirq() does
not take into account systems with STBCRs instead of MSTPCRs, which is a
real bug.  But even that bug cannot happen, as the suspend/resume code
is used on PSCI systems only, and systems with STBCRs (RZ/A1 and RZ/A2)
do not use PSCI.

I will fix the bug, to prevent us getting bitten on future systems.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
