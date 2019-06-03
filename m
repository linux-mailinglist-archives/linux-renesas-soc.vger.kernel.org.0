Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A24832A40
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 10:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfFCIBl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 04:01:41 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38156 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfFCIBk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 04:01:40 -0400
Received: by mail-lj1-f195.google.com with SMTP id o13so15231702lji.5;
        Mon, 03 Jun 2019 01:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KkW+WcA8xr3IAwKXO0NCLpjNO+SlOMn996T9vCAZgFM=;
        b=H+m0ZxZZf+fC5n4l7BHI/0Fb9/YJl2/Dlwg6UTY9zsze8Zr9LSfEN4Hr1Lztq5n9yx
         0Ztv2IVK/uyXj4ApVAsi7xSNHvwgNyYy77vI1qMXXOWKRhGzlEYxJbzxqGfN8bKQCQpV
         gI5AFwvObRfq/sV+9SYQXjfZp+uk5Hi23NqqjQ99nEYXs4jT8fJH5/DyxoJ8bY2N2xbC
         RV6jBPrdNYfjNVN0xMMKxrdByCIbXOVNx0saAJdNtjjOJgFSsLE5818aQaqdTN8fJ9+i
         9tI81Z4d6hvy0H5RsaHQG5oOOcgzzELAyseXf5HIJGxCkG0Yv3b1cHVcUCn472OB4oLJ
         8u0A==
X-Gm-Message-State: APjAAAVjR/qv8IiPw5rDR/nTk1RIDpxuS4zcE9d34fxSsDxyoJAk5I5H
        23+XxDhO76Gcga6nywU1hGR0C+tV7EEkfsrK2Rs=
X-Google-Smtp-Source: APXvYqzGr2OJE5ibdf/4JMBzaDSw+RyaCvo/V1a/stIxCLEME3rIBFMKVouuvHC7voDpXdzuXIoF5hUrjPfHo3CULAU=
X-Received: by 2002:a2e:2b8d:: with SMTP id r13mr238216ljr.145.1559548898567;
 Mon, 03 Jun 2019 01:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <1559044467-2639-1-git-send-email-gareth.williams.jx@renesas.com> <1559044467-2639-3-git-send-email-gareth.williams.jx@renesas.com>
In-Reply-To: <1559044467-2639-3-git-send-email-gareth.williams.jx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Jun 2019 10:01:26 +0200
Message-ID: <CAMuHMdXFVY6x37KtZWYfp4E3gSfEPs4uQDp2wofRTzKm_LFGrA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] clk: renesas: r9a06g032: Add clock domain support
To:     Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 28, 2019 at 1:55 PM Gareth Williams
<gareth.williams.jx@renesas.com> wrote:
> There are several clocks on the r9a06g032 which are currently not
> enabled in their drivers that can be delegated to clock domain system
> for power management. Therefore add support for clock domain
> functionality to the r9a06g032 clock driver.
>
> Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clock-renesas-for-v5.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
