Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CEE300095
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbhAVKpB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:45:01 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:42715 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbhAVKnz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:43:55 -0500
Received: by mail-oi1-f178.google.com with SMTP id x71so5485461oia.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 02:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDv4OeKxurboysUj3U4UyOR4jJuQ13MYfUeTwSkxr+E=;
        b=FVvf3egxckCbuA+EUOgVbm/8C+QF7fKJNR4Eia81qSZoBJNTMkFlyaDaEPFXIJeq6x
         DbnrkWps+v50wKVHnAkp5L6r121s90v7OujsAjsRsUgz3AGlmKNCcYDlOAvE7rBInRgX
         2Vo4fKvkn3Sl4G8LyoCYgPZNWjPDSV6epLH6afCBWg3FKZUM11V6Ee926un7ENxglXTV
         93CsOc6/D7w2ykE0sVyQ1U/HmhqWHe/HyRgrKxtyrFJP6E1o0PLj9McEA4MHLzoVxf9c
         CHFnuOd2zEwR+aJ+ezqX9Yk1Yb6vhVLDWolMfy5QsBkOPLqnpjt7SYr9UcZP5S4qGEVY
         lTQA==
X-Gm-Message-State: AOAM533WPnJG8D7VBWHp2K07qdchc0/lAy2XeekH9VcT7OR/raJ7jYln
        eAIoQIXmlOob3WEcSTsjyPC0owESSmvdDnZ+kpQ=
X-Google-Smtp-Source: ABdhPJwsUoesUVWwsn7DQyAtMQ/Y1n62aBW2LeOmnRtV50kIrPtkhsvGARS0GRy5F4dyU9UsOt70RMs/Yq1Eg878o+w=
X-Received: by 2002:aca:31d5:: with SMTP id x204mr2737532oix.153.1611312192107;
 Fri, 22 Jan 2021 02:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20210121110008.15894-1-wsa+renesas@sang-engineering.com> <20210121110008.15894-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121110008.15894-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:43:01 +0100
Message-ID: <CAMuHMdVuPh_t36n33pM_1re9W4VzU8b971AOG8wemQewJtUSjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r8a779a0: Add HSCIF support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linh Phung <linh.phung.jy@renesas.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 21, 2021 at 12:00 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Linh Phung <linh.phung.jy@renesas.com>
>
> Define the generic parts of the HSCIF[0-3] device nodes.
>
> Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
> Changes since v1: none

Thx, will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
