Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C947275341
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Sep 2020 10:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgIWId0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Sep 2020 04:33:26 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38060 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgIWIdZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 04:33:25 -0400
Received: by mail-ot1-f65.google.com with SMTP id y5so18208997otg.5;
        Wed, 23 Sep 2020 01:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NITkniv1dkvmRSuRBeUNrBk2YIIlyBX21LGDwAcpHhY=;
        b=HlTKSuH7icg+4IC3Ia/kAVqQrMrN88KS56wCdkOQpxpu5FmaeMzZlcVnB3DCpcRmDM
         ylOKCufc3W/thVFLbCD6/uJAlvQBLmKf2CSCl+ndeO+3h9NOUk5vAv35ZNIGl9qGoSCp
         Bo3YfKoZip7VERAg+SGopovQDva8pPKgMB85msi+mXvfo2Ngtq7nA9Dsd3aim2tKc5b1
         FNjcneGe8baT7XRAqO4/EybA8r4HRmHj/e2XbEBR3GRLqteav9LdVww5MAOY0WQ08UWv
         e0wDuxyOiVJIbenZqq32WDnYXBsIHOMsJDE9cANaWgijgozK2kFKAv5mX1WBBP3hRXNd
         VVTg==
X-Gm-Message-State: AOAM532wSbJgAS/ZlknlDnPDVEgi0Rf7FNt9tvCYc4CD97zUiYZhUGZB
        2wt1S2RttSB2Vr7+3hqcckqoA0aWcfQQZmwXyWBb6kq49KM=
X-Google-Smtp-Source: ABdhPJwNATaaR/XWq0u61HTBnLI7iEBIp/bua4xreJw0IJku1xnl8XiT/de0zsN5uPtij9nGsAt2io8njzM0YG5+gfY=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr5033590otp.107.1600850004987;
 Wed, 23 Sep 2020 01:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200922120036.10298-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200922120036.10298-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 10:33:13 +0200
Message-ID: <CAMuHMdUw99vAgBevAHmthEUgGQepTof9skjAeBNwxiHHbMk-5w@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: remove stp_ck handling for SDHI
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Sep 22, 2020 at 2:00 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> There is no case (and none foreseen) where we would need to disable the
> SDn clock. So, for simplicity, remove its handling.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Geert seems to favor simplicity, too. So, now this patch leaves RFC
> status.
>
> Change since RFC: * fixed typo in commit message

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.11.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
(on Salvator-X(S) with R-Car H3 ES1.0 and ES2.0, M3-W ES1.0, M3-N ES1.0,
 and on Ebisu-4D with R-Car E3 ES1.0).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
