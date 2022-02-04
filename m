Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75ED84A9492
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 08:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352051AbiBDHcw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 02:32:52 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:46763 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236214AbiBDHcw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 02:32:52 -0500
Received: by mail-ua1-f54.google.com with SMTP id c36so9371883uae.13;
        Thu, 03 Feb 2022 23:32:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hxp3fapdl4HemZ6z8HXqxe83mjU0zyEPClxpPgZ5aZs=;
        b=mO0eSuYTYB48VTD6BQSxxwQT2N5lHMYWFDlDmDycjAHKdhexsuKN9JHJ+herjxGeyZ
         gjiXckdu7L39sk4imcv0GUdlHdzfwIgkgkpKjg+PeSC7WzXjLgvTPNNCav9qOF+Ku4xg
         z5yPz4lf+nRzWJ/HLApxEc5u2OS28GN7IEGpIii6KSybTIaaiJzfbCAgg0NyebvmcMlz
         ETLEKF0kQIksHZ8rm8F5EEKO2SJD0AyxeHw4xCrmJPOZG9KH44mFLCpIuxBlq6k9FVgP
         4GTd/cUIGuRW78g5eswtew6reE7uoPLM68eB0ohphDWT4VKMA/px5Ur/yZUif67VkYpF
         7WTA==
X-Gm-Message-State: AOAM530rr09YjJ0+JgN+coVIzwrPXEcypVl2mlS9AjdXyo+I96Cl+OHK
        DXvHeO9HjhEZnFS2D4Kek6THczq4aATY1w==
X-Google-Smtp-Source: ABdhPJxpAb4mPGBSLlFYNwfbFq2MIDzylKPY1vXr7qtraYf6s98yKkJb7KTlxixwLjQ31LlmiFb6Yw==
X-Received: by 2002:a05:6102:153:: with SMTP id a19mr421422vsr.75.1643959971147;
        Thu, 03 Feb 2022 23:32:51 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id x14sm283072uav.5.2022.02.03.23.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 23:32:50 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 48so3252127vki.0;
        Thu, 03 Feb 2022 23:32:50 -0800 (PST)
X-Received: by 2002:a1f:5d84:: with SMTP id r126mr516802vkb.33.1643959970601;
 Thu, 03 Feb 2022 23:32:50 -0800 (PST)
MIME-Version: 1.0
References: <507cc45f44603afa6a70c05a3956fb7b13b49ed9.1643896347.git.geert+renesas@glider.be>
 <99ac1fc9-fa12-325c-3b54-eb3cb996a5df@gmail.com>
In-Reply-To: <99ac1fc9-fa12-325c-3b54-eb3cb996a5df@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Feb 2022 08:32:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvsUevw8dHTracUHn5Uu4XsbtBssOKss_txH87rtUV7w@mail.gmail.com>
Message-ID: <CAMuHMdXvsUevw8dHTracUHn5Uu4XsbtBssOKss_txH87rtUV7w@mail.gmail.com>
Subject: Re: [PATCH resend] dt-bindings: ata: renesas,rcar-sata: Add r8a774e1 support
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-ide@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Thu, Feb 3, 2022 at 7:52 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 2/3/22 4:58 PM, Geert Uytterhoeven wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Document SATA support for the RZ/G2H SoC, no driver change required.
>
>    I don't have the RZ/G2H manual, is it available online somewhere?

https://www.renesas.com/eu/en/products/microcontrollers-microprocessors/rz-cortex-a-mpus/rzg-linux-platform/rzg-marketplace/document
You do have to register at the website before you can download it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
