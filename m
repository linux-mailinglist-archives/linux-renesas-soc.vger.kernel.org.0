Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E49AD909
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 14:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfIIMbB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 08:31:01 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36135 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfIIMbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 08:31:01 -0400
Received: by mail-oi1-f195.google.com with SMTP id k20so10323311oih.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Sep 2019 05:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PnCjypVvqZD6/19X+hlsQRlmyK+FUmKwk/lRXRpvUIE=;
        b=inLDKRCLX6J1vL9eZJdDnDwTBEVNTg/uYdwpF5sOhhjhiEP6qtWuzY0XDrsCPsCKHB
         vAb4wvXcrpLeYilmsP7qGZrqQCeCxizKWIw8Yf5UHhkFSE8RRk5GsPZM4sQstmCeIUoo
         yh/BUi5duFvTixrIllrbZDAnfQzK8tawpW3IUsHzQeZ+jhGEbBFqaphoto1jaXRdjV/T
         Vjbwrlz04ivnGdddY9fsiJuLAYzKMCa/sXM29pRQdg3e1yYR0Gmhkfb3hMDcy+FnNgsw
         6a16HvsQAfORzbFD/GBFgxSmrpvMIitv2dOSKnwvmqsSYYrmg49aSmHbFjzevOGawRFI
         kKnw==
X-Gm-Message-State: APjAAAWBhgkteqCtiLb69RUvdY3RlPKM1qmd59aUTqDmeVb4UqQKE+nr
        GWl6rxkRZWE8n1TxFTcWtCyDpCvB/uc5YvYMQCLr3pTv
X-Google-Smtp-Source: APXvYqzh1Ws8FmXHQNEr29bVe/MZhkCORdlHtGvwy66EKrIWjnWxOjdfoxbR9p9M2GUO3f9MmiZNizrCqReVD6CTWlY=
X-Received: by 2002:aca:cdc7:: with SMTP id d190mr16305878oig.148.1568032259985;
 Mon, 09 Sep 2019 05:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com> <1567675844-19247-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1567675844-19247-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Sep 2019 14:30:48 +0200
Message-ID: <CAMuHMdXxFEmuGRzYJCgqo5EpcXVzt6ZVpsy63BjA9fixFc5vtw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: Add Renesas R8A774B1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 5, 2019 at 11:37 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add configuration option for the RZ/G2N (R8A774B1) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5, with the one-line summary
changed to "soc: renesas: Add Renesas R8A774B1 config option".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
