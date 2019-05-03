Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D1B12A6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 11:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfECJ0q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 05:26:46 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42549 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfECJ0q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 05:26:46 -0400
Received: by mail-vs1-f66.google.com with SMTP id b74so3162300vsd.9;
        Fri, 03 May 2019 02:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VEt869By4fwnKuDlVkUu1x8f0OyZLunIRAefHEWzhRs=;
        b=kzC11jmdZoA0OzPwsxmHKPlw32IDttOYrOnW534+zD9cHaau9zQRUZxzFVOODzpxQ5
         vXlavw5ulIZ6irT857DgNJoxRfQmfVRwWh+2YYJHuS8+wpdIjZ7HELW+/cWQSkm2aGiX
         QLhl076masQZ6qhmcH1Jh1NPJNYFDVF73/1NY+FdGNM/bKmCHm35s/VSVzCeboQ/tYTr
         SNhxOAFqF+lXYNKdI/7A7/vieap2lc0y+SAYqBiTZOJBcnzAlwy8nANV+6pyt8omCxx7
         Z9s0y4F5xJDX/9WDP9muBDMpn8GSUSrnqlkryPE5LpkU1FQ+p5ehpFZO/T2Qz3ILIhZp
         b+hA==
X-Gm-Message-State: APjAAAXC47RCNmEzZZTBTC9eIuBHJ1FPpBav6hIGcBTxwLmBKIe+9LT2
        qx3ZqxiczSCj+FiPgQaz4fwN54W9kCLYPn0OWnA=
X-Google-Smtp-Source: APXvYqwVcPQ54KaZ5s230q5v7ROxk5JLioAvdTP8ZIYV7TgwpVNz2T90FMvVPE5jxILUJx1Qo/yiYstFS7MDjDRgxk8=
X-Received: by 2002:a67:83cf:: with SMTP id f198mr4826626vsd.63.1556875605467;
 Fri, 03 May 2019 02:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp> <1556155517-5054-4-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1556155517-5054-4-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 May 2019 11:26:34 +0200
Message-ID: <CAMuHMdXSNz2NVaHgN_BJq6=NXDR3LL95a2tRauCcdzpk-fUiDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: renesas: r8a7796: Add TPU support
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 3:25 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> Add tpu device node to dtsi for TPU support on r8a7796 SoC.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
