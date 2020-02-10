Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D120157D41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 15:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbgBJORf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 09:17:35 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34903 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbgBJORf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 09:17:35 -0500
Received: by mail-ot1-f65.google.com with SMTP id r16so6479446otd.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2020 06:17:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R1jTtyT7pSfz15415nWDBJyp604FPKP3qITJOCahGWY=;
        b=stiJB2iqedW/QhqTXg/qDu7MVAxlFHbrFuQg92aqllMAHOKBzu9InM1TNCs6oV8j7M
         QnvARjY//qQBM7IfLnrjNspsaSx1dAHkYai1J/tA5Cp/OZueh3D7T8tHz3aQY5kgsOgF
         N+IWq4kcvXFg0H0AGitqFRnBu5sFoPJSFHfbmfiUKL/7BBRlw9yfIE18KOWuckUG7qcM
         ubGPVooojYBDo3wObRz6JTztCqmpXwaFp1bVtunBqjskA6NCUMFODLedhzpr6ATcSEVa
         agZqRY+nWaIz2Xgs57FS0B0mmCfSt5N31bfy4juBIrMp+iacV4HwJAq3X8DiYDy9Db3e
         Gg1Q==
X-Gm-Message-State: APjAAAUFEodKwj7OfucoX2ZP/UMGbXpAmtA8BsM6osBs9Nq1qI4RI7E9
        1sKKecYsqz/yacp0KlVFjvghA5DGz5vxCGluK8w=
X-Google-Smtp-Source: APXvYqzt2BV/pGSD95zbu1iPpF4WPdMTLGpJeirfPCzEXtGB1CXt1kV9C633+isUTzK3aQGH8DPxiGer4LwZs9rceTM=
X-Received: by 2002:a9d:8f8:: with SMTP id 111mr1157341otf.107.1581344253354;
 Mon, 10 Feb 2020 06:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20200203072901.31548-1-dirk.behme@de.bosch.com>
In-Reply-To: <20200203072901.31548-1-dirk.behme@de.bosch.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Feb 2020 15:17:12 +0100
Message-ID: <CAMuHMdVNasuQW=TcnaSZ6wcnB73+dhD4w1e4iBYB2WtCtp-ndw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a7795: Add RPC clocks
To:     Dirk Behme <dirk.behme@de.bosch.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 3, 2020 at 8:29 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> as well as the RPC-IF module clock, in the R-Car H3 (R8A7795) CPG/MSSR
> driver.
>
> Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks, all 3 queued in clk-renesas-for-v5.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
