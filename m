Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE413F96F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 15:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfD3NBr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 09:01:47 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:46697 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfD3NBr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 09:01:47 -0400
Received: by mail-vk1-f196.google.com with SMTP id x2so3056528vkx.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Apr 2019 06:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T0oZOFG8tCKfwam2YkfVAEq5sKo6r7mm8L/IgkTxztw=;
        b=Yi/kJM3nlwmcqfzbDlRT+7AYuLLLUWY2qe187C/F3AmTS3hqdWY7fQzDEbfTHuc/Ey
         c66F/cXEdRoHcvt2ERtrwc1BZqeQovNrhxwSu8gj9MwYsFyReui4GA8SSEK7N9Zdpj2t
         Aa6O09KlR2/0qBrNmxhPmQJv6ZtcM5puOtNverqR0KCml0GEjWkvMlHJNIRBpeDbqVbl
         AfKkikxYfiq2hLbm2dWZIW6oHU/T+rm2KRoforkjYAHH9TatCZsqCeD39EbNHyDSLiGh
         6Q9LW/xhdeTEqEKkCf1gtLwF8Vg8a73RwjMzRgSY3+8ajqJUpcQLXBfrMF/SCUenf3g9
         aFuQ==
X-Gm-Message-State: APjAAAWbHcAQ2BCl/l3FUcxIiThHbMvJz4mD5c02LnN7m2GMZmpw4NIE
        XkjUoIIzFDa6iuHmZfzHkr8C1Y7pvw/Yeiz75Mo=
X-Google-Smtp-Source: APXvYqwGU1lu6FMCFENSv/DiLe516ZyRB7mC7XyNhZBcBZOPG4HfkJdBWtbJZMTkJaR50xPfVeryDp2qRXFAqwUGnyw=
X-Received: by 2002:a1f:84:: with SMTP id 126mr6644751vka.40.1556629306302;
 Tue, 30 Apr 2019 06:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555655522.git.horms+renesas@verge.net.au> <3d59e55ef864f5b42bac865912df4aad56d7a67e.1555655522.git.horms+renesas@verge.net.au>
In-Reply-To: <3d59e55ef864f5b42bac865912df4aad56d7a67e.1555655522.git.horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 15:01:35 +0200
Message-ID: <CAMuHMdViy6A_vmzjB5ZjS-amgCUvxgtDZ9yyywNH+uy7CCQH+w@mail.gmail.com>
Subject: Re: [PATCH 10/21] ARM: dts: r8a77470: Add PWM support
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Cao Van Dong <cv-dong@jinso.co.jp>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 19, 2019 at 4:41 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> From: Cao Van Dong <cv-dong@jinso.co.jp>
>
> Add pwm{0|1|2|3|4|5|6} nodes to dtsi for PWM support on the
> RZ/G1C (r8a77470) SoC.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
