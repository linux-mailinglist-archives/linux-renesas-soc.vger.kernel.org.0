Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71345416D58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 10:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244561AbhIXIHC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 04:07:02 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:37600 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244495AbhIXIHB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 04:07:01 -0400
Received: by mail-vs1-f54.google.com with SMTP id q66so9174756vsa.4;
        Fri, 24 Sep 2021 01:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OYUDHwYw1h4gP3Mb0ddjLCH65TqjAubVcrA3PqEmy1s=;
        b=f708hWepBPkF5Jv4KIKWeDLv/RS9kOC/LKOjUVmY4qXAOi7QT7ahvREWO+8sQvqP4o
         PhT0t1Hr7IanuEGNVVEIdRB01GqeRE+43h761SH34v48Q2yHeZi7zVLkWnFrW2RbgLdR
         ZxcR2mLAfNsG0vQd0STKc3Zei0P9zFxqFdk60mMUltzUgMmJWbh8v5qVvXdMTXYR7lBL
         uooxTx8fyu6rJR8Aa6ZcOm2Fkycz2aHCz1IqHHB5sb6qrfOjeUGc6XrYqFcVIeduOMuh
         BqgfPh0Priz8JIhRTeBldGPtvwB4TEsICkKvmGxwKkBKxvMsg9sK2KPJHRfavY5ftr6J
         7WoQ==
X-Gm-Message-State: AOAM530A/uNaiQJZjbha9sO8UcJJaUo49JywXd17EHB4Yd2M68eRAjOB
        NzIGgcXpsHaxl9CHDGHsIivPBIBHIFchDws8sQosrJ6H
X-Google-Smtp-Source: ABdhPJxa3G4sYuZksM/AQwNv0yboNG4QZgHza2cE5ZVeBmnm3ZJU5AYqKXvH1ybc22Xtd+R49aeV10/k9dsf8nMk94Q=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr7949368vsl.37.1632470727654;
 Fri, 24 Sep 2021 01:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210921084605.16250-1-biju.das.jz@bp.renesas.com> <20210921084605.16250-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210921084605.16250-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 10:05:16 +0200
Message-ID: <CAMuHMdV-cU3B--iAV2ed5HT_jgMcFSy3X+xf9f1NfxvsrhX-LQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: rzg2l-smarc: Add WM8978 sound codec
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

On Tue, Sep 21, 2021 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add WM8978 sound codec node to RZ/G2L SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
