Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B853945A407
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 14:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236624AbhKWNoU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 08:44:20 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:37415 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236379AbhKWNoT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 08:44:19 -0500
Received: by mail-ua1-f47.google.com with SMTP id o1so43828940uap.4;
        Tue, 23 Nov 2021 05:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NhlfaLQBrrV5YPN/kTJU8T6bovxNK4H2QU1+p9lFCmg=;
        b=PU/SHxtYlj9anwg2ZueF8gNbjFPwlS0pJAEPtxf1XsA23vWF6P+l9BE8w8aK+8D97B
         NNAxwmYnxb9APG4Ji+xCV7um4qA9QVkAO5pr5xVmwFu21KkSGq9CTi7GUsR+msQthBS2
         X5O05Zl6DrnEB+wlqVZwMW1pQnkjvPYtFpmMnKHyDs86MCWPz/UwY82tRmGlin8EL/Eg
         yEC3aPQm82jdGtvrb+COppkcE2cbaARKFo2ouByXlFeSrAascVN8na5+DnX1X6Arfjmb
         i/WfGwpbQOoF5PjPdIDtv6NBkIRXArjBXjYJPufdC2GwAaCM9iK5c1bNtB6uNKLAlN2T
         ibeg==
X-Gm-Message-State: AOAM532e504lOhgq/0W/Di/gPn/fU6fCw8Du3s3Mlb8IBgoyufgzwA6M
        YKxH8SsV5IgssfxmJEG/msx+XdUZMzEqmA==
X-Google-Smtp-Source: ABdhPJxRte3mwWfg1ZQviBc/287MRb6mR0OQLXAHH6iNGqAGwM6vye3SgOZhHUDJHO6K0oUNZicjDA==
X-Received: by 2002:a9f:3e43:: with SMTP id c3mr9023964uaj.29.1637674870943;
        Tue, 23 Nov 2021 05:41:10 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id e7sm6187702vkn.20.2021.11.23.05.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 05:41:10 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id b125so12403588vkb.9;
        Tue, 23 Nov 2021 05:41:10 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr10691871vkh.11.1637674870267;
 Tue, 23 Nov 2021 05:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20211122103905.14439-1-biju.das.jz@bp.renesas.com> <20211122103905.14439-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211122103905.14439-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 14:40:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqOhfV3gCb4WcU_4Sg=x0b+CCNU1OU-gEhTmpvZxEzPg@mail.gmail.com>
Message-ID: <CAMuHMdWqOhfV3gCb4WcU_4Sg=x0b+CCNU1OU-gEhTmpvZxEzPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a07g044: Rename SDHI clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Nov 22, 2021 at 11:39 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Rename the below SDHI clocks to match with the clocks used in driver.
>
>      imclk->core
>      clk_hs->clkh
>      imclk2->cd
>
> Also re-arrange the clocks to match with the sorting order used in the
> binding document.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
