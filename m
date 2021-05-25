Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300C338FBEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 09:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhEYHmf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 03:42:35 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:39784 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbhEYHmf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 03:42:35 -0400
Received: by mail-ua1-f47.google.com with SMTP id f20so6199161uax.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 00:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hqzn0+JTlJzM8CxwS0p7hlFtKObpQDLDw0PGhDvb6LM=;
        b=PS17+HeF9TDBGSITzcj+0euRmDk+Y9aHt7z2o0PqnsPdKypmmcK6XrD3ES92xDk8Dx
         YibNjqMhOG/EBxqC/y1wZnFM+M9VK+1j+vYALo+0hDbJyWzGajlPkkYZsZncFgWzoOMN
         nQdjsVDgfO+qC+TDjpZOhIPpUq8pvsF3RoHvvIy6KYRJ5jyOq2OwNUbLQoc3G4Hw2ja0
         a6HF7xFAa5cG+ASQEPcYvFZphpzXYtpmuiWLV//uA+w7ZfulqKl2gn25e3tTw72aFX52
         XL7nXIlXhj+RONcPQjnoHxNdPm1JSaDzMOZ6F5wHbJ390XxcNxBA8lO+MemJuCYYejJ3
         KWXw==
X-Gm-Message-State: AOAM530NmbpHYgT1auowrk87qK9dVdg3XkD8brgiDT0a6NzeiY4HERYB
        b/XJ6e48EFLYNFtHi+M2795c4P876UXVWaZ7VflfpsDe
X-Google-Smtp-Source: ABdhPJwUnN8MxZQyKjg9JISMNUhsoLVNRPvIjMNmMoSTdTfe/X5Ai4x1Lah6SKQWEN4mRNI9J93vycEZqW5MWHsg5NY=
X-Received: by 2002:ab0:2a8b:: with SMTP id h11mr26029490uar.4.1621928464392;
 Tue, 25 May 2021 00:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com>
 <87h7j2ci1k.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdXtnSenYk3sE6Pp89YeuUf=RsU5ueOLKX3ip9j1NMBKCQ@mail.gmail.com>
 <878s4dc7y3.wl-kuninori.morimoto.gx@renesas.com> <87zgwkofex.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zgwkofex.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 May 2021 09:40:53 +0200
Message-ID: <CAMuHMdWsH=eydBaHH99UCUSooB6qptM4tWO71U4e3vTZ9uHWBw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77995: add R-Car Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, May 24, 2021 at 7:43 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > Please use numerical sort order when adding nodes with unit addresses.
>
> It seems r8a77995.dtsi numerical sort order is already broken.
> Or am I misunderstanding ?
>
>         ...
>         ipmmu_vi0: iommu@febd0000
>         ipmmu_vp0: iommu@fe990000
> =>      avb: ethernet@e6800000
> =>      can0: can@e6c30000
>         ---- and ore ----

We use numerical sort order, but group similar entries together.
I.e. all iommu nodes are together, and their position is determined by
the unit address of the first iommu node.

I really should write a script to automate sorting, and propose that as
the gold standard...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
