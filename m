Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C3834C542
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 09:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbhC2Hu7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 03:50:59 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:36531 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbhC2Hu5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 03:50:57 -0400
Received: by mail-ua1-f45.google.com with SMTP id c2so3701220uaj.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 00:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/VZmRD3GdRcL23w4yEPcFXp0mN0TuBcmT0PXq1u96zg=;
        b=OIE2U74RxpVXbBKDuqo13AEnftXmZgGSxSIh5OmpZHrnShSAYt+8aqexI0BckLXr5i
         /8fJaWYIz6C3MLzO+u9KTJ5KmT2mjSjN6iIGbxtqHv/lf5sN3KapZGTrMo0focb9l9H4
         uK1wlocRB70+vQaKCN33XHlV+aB9St3BxubZcYDa0Z4OvOdxG6ZevoXsOvjZn+eue/Ab
         ES4rr5H9N/mCeRiivdG7duBA+I8NHAuqfR9ZVqNct7O12RPyGawP4TVa/6MBKoC6VLqK
         McPkwAD+/z0HFWMXkgVzPsiJd9UBgPHe/ahSLPE3X8nuGYmRnVlGcnL7nK62/B8peL/Q
         VeOQ==
X-Gm-Message-State: AOAM532z1990VHWIvfM0zFwqwIqW2P0bPUw06U7vEy+dmcGYpm/MGYrT
        qtOt/kfpjsGF6U7GsKbD9og3r9U0LJcmtBynMAE=
X-Google-Smtp-Source: ABdhPJz1HMhRwo7zzN7stRj2YctDTXHQ9SCLUqbrhWt4zurgnngPINPuSDv/MPvy3VIWK752HW+GjBVHVqU6b92eoGo=
X-Received: by 2002:ab0:3393:: with SMTP id y19mr13354125uap.2.1617004257292;
 Mon, 29 Mar 2021 00:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210325041949.925777-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210325041949.925777-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Mar 2021 09:50:45 +0200
Message-ID: <CAMuHMdWCMRURBQkBP3YCzEaUoEh6z=DPU_GUD9StcH-Q5g8p5g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779a0: Fix pmu node
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 25, 2021 at 5:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Should use PPI No.7 for the PMU. Otherwise, the perf command didn't
> show any information.
>
> Fixes: 834c310f5418 ("arm64: dts: renesas: Add Renesas R8A779A0 SoC support")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
