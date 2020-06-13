Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE3C1F8324
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2020 13:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgFMLzJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 13 Jun 2020 07:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgFMLzJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 07:55:09 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE92C03E96F;
        Sat, 13 Jun 2020 04:55:08 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id h185so5583905pfg.2;
        Sat, 13 Jun 2020 04:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=neCcG1dk3gHcTR94EupwHe3jWPWKcFSQgRt8l5SAAfw=;
        b=W+Gc4oBh+/wch7Ht8yeb+NznsMjrv0+yvhqeFNVv8zQYreozgTPMCqo51zNBZ8R9Sl
         YqD/wB60lKQ2iQW0uh4i8c2x/hd5R/JchCMgmw0TuCWGOQTiZFxenqstub2gbOSDWnmD
         LayCE1D/qMnsh31F9H+EnD02dHbomn2HtSZ32Sf2SoP3vcTUFPO14o85PZ/mWt1S5Fcc
         Y2PQlxPClH0tDWEQiMz9ZxogLxNivSvS0M9kHq9XS6NZcNtX1q740/kiPODDd6xx6CpA
         AEvLk7mqtC5T/t4oKtVMBX0VjcUGRD/oDdOY3lYMzU7SFxgZmtj574kuGqxF0n6zzNmh
         JPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=neCcG1dk3gHcTR94EupwHe3jWPWKcFSQgRt8l5SAAfw=;
        b=RX3eSdZ8T4Lu1Auv8rHqintGU7S6p75oQ/U+MMKNsPK/c+HetNfjMENrZqApaHGU7j
         V+JjCxO4s4ZuwsIXc8y4ip47Ip7uKru+UEH1glTtnscdjLED3emcp8VxZdGkQZTvj+Vp
         3wMkNqi39taUgilYFARpfirZsOauB4AZfVW8J6VRKUQuM9KOdljfluYky/von1NqAzm3
         Fn8nS+nXLog3wuu0NgqGWIg660KVwTHCut0/zaBLNVbvXI9UM+shlnfsUp76ZzWbhD+V
         JdND8F/kaBVUeTy7zoVirufBKmlTm+TjTeLLNzXrFfdLLXrliopNFYXWxK1yBkoZDiP7
         1xPA==
X-Gm-Message-State: AOAM533TBMUhqgzyfsXfRT/rofWosgKpJlik3nQlNu74lx7KS4+PoeWv
        1RJlUNt5nCyBcFuf+1vNAVP44FS3ATVX41dBYpA=
X-Google-Smtp-Source: ABdhPJxGk4xboMH+GIcahbHKTkvpHYFaoS74gHxMBcezBknBQLLvTdaPWmzQTQyuzNWrMzwar/u2sbQroeEXGEqSRK4=
X-Received: by 2002:a63:ff52:: with SMTP id s18mr14923524pgk.203.1592049308294;
 Sat, 13 Jun 2020 04:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200612124844.19422-1-wsa+renesas@sang-engineering.com>
 <CAHp75VdMPt60CKnP1HtkN8=3iY7+Kgrv6b9DTjcj-KMKaRknvw@mail.gmail.com> <20200613113924.GA5578@kunai>
In-Reply-To: <20200613113924.GA5578@kunai>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 Jun 2020 14:54:51 +0300
Message-ID: <CAHp75Vckh3NERodBs3e8wo3NxbrP=BPRY5g7MLmA4szqLFcfjA@mail.gmail.com>
Subject: Re: [PATCH] lib: update DEBUG_SHIRQ docs to match reality
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jun 13, 2020 at 2:39 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > > There is no extra interrupt when registering a shared interrupt handler
> > > since 2011. Update the Kconfig text to make it clear and to avoid wrong
> > > assumptions when debugging issues found by it.
> > >
> >
> > I'm not sure.
> > I have recently fixed a bug in the IIO sensor during ->probe() due to
> > an issued test interrupt exactly as soon as the handler is registered.
>
> $ git grep DEBUG_SHIRQ_FIXME
> kernel/irq/manage.c:#ifdef CONFIG_DEBUG_SHIRQ_FIXME
>
> There is no place to enable this code.
>
> Maybe your case was like Krzysztof's case where the issue turned out to
> be the extra interrupt on deregistering after a deferred probe? He
> thought it was the initial interrupt but it wasn't.

Commit
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/iio/pressure/bmp280-core.c?id=97b31a6f5fb95b1ec6575b78a7240baddba34384

The relevant IRQ core code
https://elixir.bootlin.com/linux/latest/source/kernel/irq/manage.c#L1774

It runs it at deregistering, right.

-- 
With Best Regards,
Andy Shevchenko
