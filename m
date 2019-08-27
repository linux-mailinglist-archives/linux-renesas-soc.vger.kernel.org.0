Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B88019E6A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 13:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfH0LTe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 07:19:34 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40397 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfH0LTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 07:19:33 -0400
Received: by mail-ot1-f68.google.com with SMTP id c34so18289743otb.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2019 04:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sYk+37wOJSzhcGzIFSoywjHkngRMXRbj8qcdqOxje6g=;
        b=GAPv4Mko7P5GVMdLLaR5RtRVmOa8ofA7YSv8fSA8fZScYGkEx2VCjB8wxc5On4AuDe
         ZG5uO+W/lsJQBbJ2zDV0owJjtybEZywmbdAJbOfbF8V39OD5mxcgJxvVNoHqwF4SuE2W
         v1d8G81gnI8FyyQ9V0H1Ddu8GG0ijIeX/IK8cY7S7k+iPuQtLGkm+a6p0r7RqhprJoRI
         cXzmt+xDr8TDViCRNo7ldPe7GKpdrWOwvD4Xq3R3ADHJ20ZXjKwJ7Rv2PtTjFqZ5uhjX
         1w9dsm/sStUOVXfS4/Q1lahNxIr6kKIMPTTpk+KZQhGbDuAk0BQ3wStEVm/Hklh99jlB
         aZIQ==
X-Gm-Message-State: APjAAAWoo3Pbmv0JuSLANvGr5EGvazuqoY/dYNEOZd9k58nU33D4Jz42
        wuDr8+BKx991YFJLYAkyabFfAAWd/4OGvK/F3rI=
X-Google-Smtp-Source: APXvYqx4gN3JxQp/tGt4kloCeYK2ROb0PoRByzCaitZFDl0je6UeXKF8A38oGaQqfVnT/kLpU2DliUgvouJ0FD7oHBc=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr19600631otn.297.1566904772856;
 Tue, 27 Aug 2019 04:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190827103353.109218-1-hsinyi@chromium.org>
In-Reply-To: <20190827103353.109218-1-hsinyi@chromium.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Aug 2019 13:19:21 +0200
Message-ID: <CAMuHMdX4bDQcT1CSucH0+AWQ6Cv4ji6YNSWCtc2Pc3oF9=5oAw@mail.gmail.com>
Subject: Re: [PATCH] fdt: Update CRC check for rng-seed
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hsin-Yi,

Thanks for the prompt fix!

On Tue, Aug 27, 2019 at 12:34 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> Commit 428826f5358c ("fdt: add support for rng-seed") moves of_fdt_crc32
> from early_init_dt_verify() to early_init_dt_scan() since
> early_init_dt_scan_chosen() may modify fdt to erase rng-seed.
>
> However, arm and some other arch won't call early_init_dt_scan(), they
> call early_init_dt_verify() then early_init_dt_scan_nodes().
>
> Restore of_fdt_crc32 to early_init_dt_verify() then update it in
> early_init_dt_scan_chosen() if fdt if updated.
>
> Fixes: 428826f5358c ("fdt: add support for rng-seed")

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
