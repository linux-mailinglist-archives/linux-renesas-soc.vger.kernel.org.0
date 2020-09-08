Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A33260ECA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 11:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgIHJit (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 05:38:49 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38757 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727995AbgIHJis (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 05:38:48 -0400
Received: by mail-ot1-f68.google.com with SMTP id y5so14306250otg.5;
        Tue, 08 Sep 2020 02:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Y6vLqp5sK1D0NIkdBwzr5/FdYN8Nrmu/GBXijD0ZA0=;
        b=FaoMUFb3XMHpKLN/At+Za11PCCi0Ul97QLCICtMC8D363Z0UV4gtc85lBjrqmCqXQ+
         fUZlcOGh0OS0JzhiXgqbMCAjbYDzLE1L+io/B1jkN8/k554iaD3bfDHtDTmCyDAn8iuc
         lPaQ/kyl5p9RmniKt1amAY4g8d8wDdrxFStMFK158ITBUuDGDq4WLyZuTFWXnKILzSwe
         1Q1dYEfNN0D+MSKEc9RIhkwtoGTcSsPqLx0lIn/TcfsiSgWRw7QHNCFIj0PHnwAw5rKD
         jSK0FgeNrRTud/0xjxk86eI6/jbfePpF103mAKa36E25rSVFdmz6e3IGtln8Rbhhav/S
         18Ew==
X-Gm-Message-State: AOAM531QvphBQBAyZG9w9fJ7CQVkBM2kRNy7d8vLJoPgBWtr31V3FS5C
        2Izw+2iE1hFo7ncTjRYELAMNTZy5QXkkg8T+R7c=
X-Google-Smtp-Source: ABdhPJzqi44rDmKBbgV4lUYybG4HYsueVzA9IFuCpw9kBlpk92vj2+SHqGy7veo2Lqlz9CwKKgPCfLX4ZHdgFpT1CEQ=
X-Received: by 2002:a9d:162:: with SMTP id 89mr17656285otu.250.1599557928030;
 Tue, 08 Sep 2020 02:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-8-git-send-email-yoshihiro.shimoda.uh@renesas.com> <CAMuHMdVeHMXD-kwV4jqiv=pjU5Q==MJYKoY9C9ULc6re-dW+YQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVeHMXD-kwV4jqiv=pjU5Q==MJYKoY9C9ULc6re-dW+YQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 11:38:37 +0200
Message-ID: <CAMuHMdXtSTN18LjHTWD-83qFzE+GsrerxU1Gs_rGNQ3jHB+8yg@mail.gmail.com>
Subject: Re: [PATCH 07/14] dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 8, 2020 at 11:23 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h

> > +#define R8A779A0_CLK_S1D1              9
> > +#define R8A779A0_CLK_S1D2              10
> > +#define R8A779A0_CLK_S1D4              11
> > +#define R8A779A0_CLK_S1D8              12
> > +#define R8A779A0_CLK_S1D12             13
>
> No S1D8 nor S1D12 in the table in Section 8.1.4 ("List of Clock Out")?

But it is listed as a child of S1...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
