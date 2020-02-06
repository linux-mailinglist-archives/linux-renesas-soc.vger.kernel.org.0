Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC1BA154873
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2020 16:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbgBFPsJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Feb 2020 10:48:09 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42726 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgBFPsJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Feb 2020 10:48:09 -0500
Received: by mail-ot1-f65.google.com with SMTP id 66so5893468otd.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Feb 2020 07:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aN+x6yI3Y2yaBip6K8Z75cue0s1b63BjZTSNlyhpeOU=;
        b=rPA7KapY3dBxkFRti8X155t9DLYxtJXssAQvTtfC05IJlZoj413N8DI6VFST5xnuWI
         sG4nj6B94SLTbcnDlfTKfAD2KS12qsVPe5tkhC43RFoK9cvHpiHJt5ummDhTkgoijyHo
         aTOjKwSR5G5aoYI8p0Ip3JrniA++hVObBW74Bk6/rsRdJmsMvvnkWIe0RQrGQ3y/u55f
         Yrv5snDBgJ0KCY//SqvkBUbDR7zeNdyQLnWHMgjedVqP1hdw+q2Wfs3NXL0ljVapHLVW
         7hIxM9ujao4HBkRcFKIueV3OALaHm0wuUNM1Z88b9q1pmOGV3VY1ogAfXfox5XYwoqLf
         gqsw==
X-Gm-Message-State: APjAAAUob3uQlkaLIsGCLbgl25SjJZAQrtNgZUP4f+vjsvCIYfrFXRJL
        vet7iU8VViqiTg9dag/eXOSH8zxNpk1Y4nQjbLw=
X-Google-Smtp-Source: APXvYqxbONlxmOr1alXovUtvuc1Urnip8FL6DTW3ACCOZysl9NkycrP3vW6kE3oWgMs4NuOGJDDciH8wfWoQoLQfjbg=
X-Received: by 2002:a05:6830:1d55:: with SMTP id p21mr30790380oth.145.1581004088814;
 Thu, 06 Feb 2020 07:48:08 -0800 (PST)
MIME-Version: 1.0
References: <20200203072901.31548-1-dirk.behme@de.bosch.com> <20200203072901.31548-3-dirk.behme@de.bosch.com>
In-Reply-To: <20200203072901.31548-3-dirk.behme@de.bosch.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Feb 2020 16:47:56 +0100
Message-ID: <CAMuHMdUivF4c2yk1JBtW9S8ug6_M29eotFhH2ue-L80fGQTZTQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r8a77965: Add RPC clocks
To:     Dirk Behme <dirk.behme@de.bosch.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dirk,

On Mon, Feb 3, 2020 at 8:29 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> as well as the RPC-IF module clock, in the R-Car M3N (R8A77965) CPG/MSSR
> driver.
>
> Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Before I queue this in clk-renesas-for-v5.7: given the fuzz with the RPC
driver, has this been tested successfully?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
