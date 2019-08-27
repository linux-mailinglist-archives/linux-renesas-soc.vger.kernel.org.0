Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE3A9E960
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 15:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbfH0Nb2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 09:31:28 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41214 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfH0Nb1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 09:31:27 -0400
Received: by mail-oi1-f193.google.com with SMTP id p127so6314458oic.8;
        Tue, 27 Aug 2019 06:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fbrpcnaW6FeusXGWHy/FZL17iPbB9NJ4oGcjQCYCxAc=;
        b=RakY2sD09NKfmQRgIm5vkJ6AD90XUEMiPdtphaWnbaz6kuZ3msa/zniJWSblqmLsm5
         CQ3Y7FMIUUeJzESZRJh/pFXN4rTDrlwoAbnnl57RxoOVuVncCOmdBqk6IUl/CGsPRZCu
         oJaAqu5b+ZDsotlFFj+MkoJ+CoOm2rmAAi/xJ2y/M09Vf2Z1eqYqGdL/KIb21ApzZw+A
         Yl77l8BgxFvCtpGdgbIRu6xdqecBfeu0lnDsyEOOvmqKZGJVArUEEEMfgUTaWpQ7/GBP
         eJ7i/HXnPHbqC3YpD6QqLM+5yBbyzbt0iNXH/LpI3hSJ0sDx/ufas+isaYWCUp6qWWYo
         lS3Q==
X-Gm-Message-State: APjAAAVj+fSpW5P2a1T99jfa7B7Gc+jZv5pNccHfjsnii1pnerxS0MQ9
        ydQnbBAAhPTNtL/LiBfbyXJUIYAxkAc1kYtWEcc=
X-Google-Smtp-Source: APXvYqzZzbXU+RqScZH8H98sHGPvNyaTmnwaD9hadGmeyRCrAgllptmivlqOHf5SeYogP/M2CHNeVInHgpGlCSPZLcY=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr15420301oih.131.1566912686716;
 Tue, 27 Aug 2019 06:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <e66b822b-026b-29cc-e461-6334aafd1d30@web.de>
In-Reply-To: <e66b822b-026b-29cc-e461-6334aafd1d30@web.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Aug 2019 15:31:15 +0200
Message-ID: <CAMuHMdVCcHn1YHFhehkvNV29s5jCDDsDWBOkVcWmf1XBPRdfYg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: mstp: Delete an unnecessary kfree() call in cpg_mstp_clocks_init()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 27, 2019 at 3:27 PM Markus Elfring <Markus.Elfring@web.de> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 27 Aug 2019 15:22:12 +0200
>
> A null pointer would be passed to a call of the function “kfree”
> directly after a call of the function “kzalloc” failed at one place.
> Remove this superfluous function call.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
