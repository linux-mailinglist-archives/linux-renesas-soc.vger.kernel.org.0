Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9994A5E5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 15:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239356AbiBAOdd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 09:33:33 -0500
Received: from mail-vk1-f169.google.com ([209.85.221.169]:36823 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239320AbiBAOdd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 09:33:33 -0500
Received: by mail-vk1-f169.google.com with SMTP id u25so7249821vkk.3;
        Tue, 01 Feb 2022 06:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1V2WoxcDe5Gs2O3zMc7b/Bf3Xc+KPhypjkD8ZA3lAhU=;
        b=zX+eEz6K6th9EtHgTWfwbWo2VlhLwSBMUgD6eRxlM6YV3TT3St8OiinZ3jKelVsKei
         59ClHpn5yNh0NaSc9nhjXiSSn2e4wEg1PaS35hTdUPTx7x6XBoqTPuBvgrWDC906MJ0W
         795PJXVfMYqm3EJe+ueR5qk+l6Z2sm67DsSZL8Z4ynBkve08sK70y42RuYi8UfH2q9Ww
         QjyHYi1XjuyIOPQ0X4xoJ93Tpl4GwypGWSpPTuTOKimdntFVp/MJmtKg2oli9fsHIerS
         iSyTl0zNYRj80astAuCIq1Gzb/MqEae8ESknbxhP7HDw8o4sLodtqUOo2Bh/s47/DZR9
         33/g==
X-Gm-Message-State: AOAM5314phisckGmuPiPOGzJ6xBFuHRIhYeheVAxZRn0m97ICJuLr9hV
        kzXyn4lS+6O/z/Wm5G2/xcqiSotmpeqIow==
X-Google-Smtp-Source: ABdhPJxtSBL0QrEkNaOS7a2FYqaEErpUVAqnqzaziAgWMfz9lMk/RWBDrt+wBWsbVojj3EBPgW0Y6A==
X-Received: by 2002:a1f:914f:: with SMTP id t76mr10533814vkd.17.1643726012785;
        Tue, 01 Feb 2022 06:33:32 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id j37sm5085134vka.45.2022.02.01.06.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 06:33:31 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id g23so16312483vsf.7;
        Tue, 01 Feb 2022 06:33:31 -0800 (PST)
X-Received: by 2002:a67:fd63:: with SMTP id h3mr9048152vsa.77.1643726011426;
 Tue, 01 Feb 2022 06:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 15:33:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJ_BtGHeFBMaqZe7pAHrVHK=rvKiRKn7UZa1PVGrMS8w@mail.gmail.com>
Message-ID: <CAMuHMdXJ_BtGHeFBMaqZe7pAHrVHK=rvKiRKn7UZa1PVGrMS8w@mail.gmail.com>
Subject: Re: [RFC 02/28] clk: renesas: rzg2l: Add PLL5_4 clk mux support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thanks for your patch!

On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add PLL5_4 clk mux support to select clock from different clock
> sources FOUTPOSTDIV and FOUT1PH0.
>
> This patch uses the LUT to select the source based on DSI/DPI mode
> and frequencies.

And that's why you can't use DEF_MUX(), but need a new clock type...
Do you need to use the LUT? ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
