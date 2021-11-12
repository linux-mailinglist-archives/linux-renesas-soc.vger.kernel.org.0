Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C3844E758
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbhKLNdj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:33:39 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:46799 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLNdi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:33:38 -0500
Received: by mail-ua1-f47.google.com with SMTP id az37so18736891uab.13;
        Fri, 12 Nov 2021 05:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9iJ184pTnCaa6ehbVjWTeQI8DGobiB3mmOI1dCbKMU=;
        b=0MPchQ9SlrBasfnnqFRlim7EbGcOix5PuaPTf2OwUeCxBeQiyqt++d2BnE/BKAM2YH
         xTmlz/6kTFrPmem27lFciZf57a3jntNL60Kxa91Cwr+ejvgXFPR1AqPk/uJ7KRLifGkx
         tVc3t5Seqfcikdr7O+GuiNxbcdN1bS53JXrYjMwbg9dgvxRM57b4s/DZm9VgTkX0L1CC
         nl5dYq7Mi3R6sCb4UgJmiC+TOHvBEaSGMvZdTAKYIqXV8x/ap65pCPK1hwHw0wc03wJl
         H+W8TaJBAVw4Ar3UawFiRh+rrolTxE89etgb5MFdkjhHTJ0y/WU08aZgEFM76H2NC770
         49oA==
X-Gm-Message-State: AOAM533wjxeNL4XyWZidueKsojnBG4suZXbKvt8qKGfdQ3YTNSNYviGM
        a5PAPhqPEpK4qEZezwv5KChWdpZKOauMEw==
X-Google-Smtp-Source: ABdhPJz2Y7ybmbPsLF09mTZs1vCC0AZdHX3FTD3C+tu5JE/QkX7rXvE0I1/DLswU3hJt0hVjoGWkSQ==
X-Received: by 2002:a9f:3f44:: with SMTP id i4mr22627543uaj.28.1636723847697;
        Fri, 12 Nov 2021 05:30:47 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id m15sm4147839vsh.31.2021.11.12.05.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:30:47 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id p37so17106736uae.8;
        Fri, 12 Nov 2021 05:30:47 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr9806767vst.37.1636723846106;
 Fri, 12 Nov 2021 05:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-15-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-15-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:30:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZMSjkZ_ocj8uirKsq6mpDgej_gH8=Ky8sF4=4fAqR7Q@mail.gmail.com>
Message-ID: <CAMuHMdUZMSjkZ_ocj8uirKsq6mpDgej_gH8=Ky8sF4=4fAqR7Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 14/21] arm64: dts: reneas: r8a77961: add SDnH clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
