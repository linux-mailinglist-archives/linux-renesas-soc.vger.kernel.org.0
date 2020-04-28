Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863071BB7E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2020 09:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgD1How (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Apr 2020 03:44:52 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38805 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgD1How (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Apr 2020 03:44:52 -0400
Received: by mail-ot1-f65.google.com with SMTP id g19so31023236otk.5;
        Tue, 28 Apr 2020 00:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cXl7lKArunQG+/kNdzxWXFuMByrBcBqaAzCKT8iRNHY=;
        b=KJFYa/goYd448GE7CYQOqvTTONqICFVSw9i1bzEup0l1fx2XKNysmPlwCF2CIZm9+x
         /W7IS1vyYTtSYSR50Q8cvMB1PzsiA8lw3hs+fz4+2xstnpYBAqX5Ctim4gYFMLK9MMoh
         IbHMG5GjqbQu5QzcLFXWBqP+/1K5RzejbL+LNEAciEXsRrQyY2OwybNBo08s7ufAYCub
         ql5J4ZKbfJQyVMBIjewGqY09GrecCNa7gw0xAlL/c80AWtlPE9KAAClUOzjhpb0wux0I
         EUN73DMT6muuu5BqzPZ+6gjFYAIiUvSSD9iBvEtXN8sKJLi83YZ8/iGMp+5uWMXoUFZ4
         QAPw==
X-Gm-Message-State: AGi0PuZWNmhj02Bneay3w4q5oz4YtT67OY8J1qUQ4KCD69N+tg4vagKN
        bDZm0yjvaxTnLf9h4YWZ45OW0ODEdpyAMVS3u+s=
X-Google-Smtp-Source: APiQypKhptPShSJB7NSsDnhvt8r6BIMcWUz++M7lNbqsO+HW2HU8+SrM8htxROBTxsP2p13a5k9/0HekF6DYp6mYfJk=
X-Received: by 2002:aca:f541:: with SMTP id t62mr1978445oih.148.1588059891287;
 Tue, 28 Apr 2020 00:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <1587998460-7804-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1587998460-7804-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Apr 2020 09:44:40 +0200
Message-ID: <CAMuHMdV_RwosqTfEa9m=euOGnCb-y8d0a5fFjnF-2udrurBxUw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add R8A7742 support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, Apr 27, 2020 at 4:41 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add RZ/G1H (R8A7742) Clock Pulse Generator / Module Standby and Software
> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
> (and RZ/G) code.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
> Changes for v2:
> * Dropped zt* clocks
> * lb clock is now a base clock
> * Fixed clock-sources for scif2/sdhi1/iic2
> * Dropped setting div to 3 for zg clock

Thanks for the update

> --- /dev/null
> +++ b/drivers/clk/renesas/r8a7742-cpg-mssr.c

> +static struct cpg_core_clk r8a7742_core_clks[] __initdata = {

Missing "const".

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.8, with the above fixed (i.e. no need to
resend).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
