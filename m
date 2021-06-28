Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F8C3B5D79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jun 2021 14:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbhF1MCu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Jun 2021 08:02:50 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:33689 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbhF1MCt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jun 2021 08:02:49 -0400
Received: by mail-vs1-f43.google.com with SMTP id j8so9897627vsd.0;
        Mon, 28 Jun 2021 05:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VHSzHjs+ZgxvxveGIMDfX3hf0jIEXkXLDTK7D16r34s=;
        b=WTbSodNYrJ+azJo3pa3ofDaYxCEL/WaQ+No/5xc7Q2JZisGsYp89v3xrZWEIM5FPa7
         z4oNkESl2BjwOmTJOTfdDKmVhjeVsOBJQLr+zDFIo++pQZ1jD3nhgVNRfc8IdCTs/I9h
         Q2TiYtJcArWRE57lduiMMt0awgO/AKE+sp6vpjgHb0cfAocd8ec8d25GpKIIQepCj745
         RaZhAfk/qAzArr0uPIByNroiHJq5yDUx8jo/d7MuBdw3v9YqzGFw3MnxniZB3HjHmlew
         JfMLIGpU812NmcDoai9d2c42QXFpCmORyfeYf1irJLkbW40EznsEgNKL81Z8vWiie+W8
         pY6Q==
X-Gm-Message-State: AOAM5328jNa/gYqXLBjtDeXEsvlO9Tyxnd220Z887/+HWMI2KVg/68Jk
        fIc7JIvFy7q/tnG/U+0DwMPUK3CvyOmU7tFagSQZclYhXpA=
X-Google-Smtp-Source: ABdhPJyx/8r4arOYeFVfuMZmPWJcEhuhMQuGYJKaUPVp3tGA078yaXZZc9g5JDzT2iBNpiyI9SeG1MtLO5LYrFJmWf8=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr17154495vsd.42.1624881622643;
 Mon, 28 Jun 2021 05:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210626081344.5783-1-biju.das.jz@bp.renesas.com> <20210626081344.5783-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210626081344.5783-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 14:00:11 +0200
Message-ID: <CAMuHMdXJR=2J-9gVtMDtXfH-17fQCeCqT8jW10K2CZLZLcqA_g@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] drivers: clk: renesas: r9a07g044-cpg: Update
 {GIC,IA55,SCIF} clock/reset entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jun 26, 2021 at 10:14 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Update {GIC,IA55,SCIF} clock and reset entries to CPG driver to match with
> RZ/G2L clock list hardware manual(RZG2L_clock_list_r02_02.xlsx) and RZ/G2L
> HW manual(Rev.0.50).
>
> Also separate reset from module clocks in order to handle it efficiently.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
