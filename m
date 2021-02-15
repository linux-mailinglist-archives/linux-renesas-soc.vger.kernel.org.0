Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC9931C360
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 22:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhBOVDr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 16:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhBOVDm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 16:03:42 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8DAC0613D6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 13:03:02 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id c131so3629419ybf.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 13:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mkAE5GZrxiH2vo58IArjoyNpu2OSH2wS3QmdhBJRxPw=;
        b=fBiYM/8cpwWuNzjfET79wMLq2L1C9j1U+JdBXA2SsIS5rSyQlK6tMGLPNIGjZ/CBlc
         FMX//k/KWtsHxZsxU51KogB7ZGwS1iSrz7k7c9oTxLCKr+jJZqEZCMHF91ClWGeqb6Qk
         DvXdXbjNkd+ARkJEZiF19lfISZRJMGLLjfkAMBdbYrPQZBzsJa3M3ITWYAs9j07wCY4F
         4dz1HQJtWW/HJ9JcpTMGRL3RgC0IoBthqOMdCGR5Nkvte6hkREdsTscaqxTMpfVImDL3
         EoO2S7tG6EGs2L3w/urnzimTI6j7iAlXLBbrJFuTejHJCX76jDp89qi4WqmP4loVUkSy
         2pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mkAE5GZrxiH2vo58IArjoyNpu2OSH2wS3QmdhBJRxPw=;
        b=VLtjBnRit8RaYyGsjMaZYQRmtcSwN5bRuUr0ll3Mxo46dyrqDB1gUH5y6axl4OQHnE
         5/3Oyx7e0vpqlhYNmdJeYpiF9ukXDdCvPzNyC+HgzyLtFoAuphk1BrbHaF1cTZnvDF1Q
         6d1exjbiT23KMHGF9e8KoFZA48EhZS/qon1Dqlpu08HXd7+yD4NN+ckAGCxuL+++mXpy
         JbOvWcsc0zJpm54BTb39PzVlj7XOXF3ynnKvgOwK0jQS3gYiZYc3SXdgmNQ2CQIgyE2N
         AR/z6t5yjeY01GM03SMCaMe16u1oo7iy+OTTiKpDOZkf3V5IvS4Tn76GInrHoTNg+6J+
         JUHA==
X-Gm-Message-State: AOAM531s0usL3GAdju7zkjz6Rvbq6zTal8Uc5cP2NG21nxhf+av//1oA
        2R/+PX87AkluVv5ErEEXCvAddn7waRSSd4BavrU+sqh/DTcRLw==
X-Google-Smtp-Source: ABdhPJyxcd5wnEwohM0LtCiiq5LvJ4rEK948KUqaCPyWoHRQNCoIgCY/DDbEww3kFcj7AQbM8yQNeaTdIB3rxf5mdXI=
X-Received: by 2002:a25:dc94:: with SMTP id y142mr14822772ybe.346.1613422981325;
 Mon, 15 Feb 2021 13:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20210215151405.2551143-1-geert+renesas@glider.be>
 <CAGETcx-c5P76JkB-upi8ArDqa=TrR3bJMnpDTO-59sh83opW8g@mail.gmail.com> <CAMuHMdVXCH+27cpC=-viQev1HeN_DkU0=7Dydp4G50z0bB2Ang@mail.gmail.com>
In-Reply-To: <CAMuHMdVXCH+27cpC=-viQev1HeN_DkU0=7Dydp4G50z0bB2Ang@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 15 Feb 2021 13:02:25 -0800
Message-ID: <CAGETcx_B7r6DErnxzDngh_KW9a33f4+cHhvthzfEHX8pO0et8w@mail.gmail.com>
Subject: Re: [PATCH] staging: board: Fix uninitialized spinlock when attaching genpd
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 15, 2021 at 11:10 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Mon, Feb 15, 2021 at 7:37 PM Saravana Kannan <saravanak@google.com> wrote:
> > On Mon, Feb 15, 2021 at 7:14 AM Geert Uytterhoeven
> > > @@ -148,7 +149,11 @@ static int board_staging_add_dev_domain(struct platform_device *pdev,
> > >         pd_args.np = np;
> > >         pd_args.args_count = 0;
> > >
> > > -       return of_genpd_add_device(&pd_args, &pdev->dev);
> > > +       /* Cfr. device_pm_init_common() */
> >
> > What's Cfr?
>
> "compare to" (from Latin "confer").

Can you please change this to "refer to" or "similar to"? Also, not
sure if this comment is even adding anything useful even if you switch
the words.

Also, device_pm_init_common() is used in two places outside of
drivers/base/ with this change. Maybe better to move it to
linux/device.h?

-Saravana
