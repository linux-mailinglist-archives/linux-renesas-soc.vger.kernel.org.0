Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF0726472A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 15:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730973AbgIJNm3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 09:42:29 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:32849 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730940AbgIJNjw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 09:39:52 -0400
Received: by mail-oo1-f67.google.com with SMTP id m25so1446169oou.0;
        Thu, 10 Sep 2020 06:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fuIaTh3Pz3XpBBXXvEDUU0YQElK+nkti8UzeWWJ7a+U=;
        b=BVlnlHizRSX/wts4QURL6v+vSKhMiFmUcJYxxq5qIRR6n69yMZUwhWQgD/U+xS1YJy
         XltqVGs2oLWzqzl0iNM64qKLMpSkEQUZKZS1gcuBvFZo2rG0oykLVgj8Loh0N6+ormp+
         pkOSzNwldUN1wzvxcsAdIHF/pJBXJ0MBGg0+vN5qp61YSB+PCZMd5g+60Sz+FbVrkuvw
         5wSiojc/MsQvRe7qgW33fqJAEb3IKNYCd5MxxAkVSUGBOaeZ4ptBSYliAArwZMe9gNWt
         RoO14jtHtYRIfGlGYFfiX8Qc+peMB8BDugxL+ov8S7HDH2xsvxknCz+rqdgiC09noBGt
         Z7Bg==
X-Gm-Message-State: AOAM5300By7PJJdGe2Oau4XITppbZwfuUz2ZLnuxyL5GUUZxQxiNzdf6
        WFcPQmzzI+kKJBn3vPVVKUpWoRYSekyNaqj5gpN+Fd5/JQc=
X-Google-Smtp-Source: ABdhPJzBoEOi1+NC2zEApW5vQGpwWc46XxoohF+/VXD2icQ34M3cjcdB1EMf0Ctl0IujE3VlBgKOiOWdXEjqTyRpxg4=
X-Received: by 2002:a4a:da4e:: with SMTP id f14mr4490811oou.40.1599745190779;
 Thu, 10 Sep 2020 06:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599739372-30669-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599739372-30669-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 15:39:39 +0200
Message-ID: <CAMuHMdUELBtGqkjryfcg6P=Ja6vZuR9MG8FDu66Ze9npJ_r=DQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: Add Renesas Falcon boards support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Sep 10, 2020 at 2:03 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial support for the Renesas Falcon CPU and BreakOut boards
> support.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for the update!

> --- /dev/null> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Falcon CPU and BreakOut boards
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a779a0.dtsi"

Not needed, as already included by the file below.

> +#include "r8a779a0-falcon-cpu.dtsi"

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

No need to resend, will queue in renesas-devel for v5.10 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
