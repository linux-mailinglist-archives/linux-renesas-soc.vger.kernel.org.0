Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4970312A7A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 11:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbfECJ2m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 05:28:42 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44893 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfECJ2m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 05:28:42 -0400
Received: by mail-vs1-f66.google.com with SMTP id j184so3148728vsd.11;
        Fri, 03 May 2019 02:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EvKw68jMK2eDsWxVRqOtlnx8B1f8dGcMlPF+TnAfRsQ=;
        b=cFGRwbWcFvQIB88pk2K1PWzpKno92ySBvc/3ncXacfRvhkB1q+I4skRg8E9k0Bt4iy
         55l7Negj8kHedVDlRGwKUkmHT3SB4Pv8d0OtslXKymvFevryii7xA79RVcRwOOBIpznB
         kjy7abQeL7NXAIbo3hha3Ca1bqmyACtlu+yWMHDqSvyvub/bfIXCMg2ZaEZDJUrb0o9Y
         HeotUPAVn/pmJHgllvruyg1tDTRlCY3IkH/mL3S9k09u4Y7ilM5K7priLyUW//MuJDSH
         5xAldjvssNHQe2B0FXFjZQF7k43eAffEjrIQ2E1gY8zC4qVeSivoLI8apfLZ+AUtvGVM
         FcWA==
X-Gm-Message-State: APjAAAUX9QqtX/RYNqzdIDy8/ZIPbGeFeg1lcm3OHUV7J8yykIulYkJo
        za+tzptm3DtQe93cWuK6BD+6WLtL4sV/ejGBQ8I=
X-Google-Smtp-Source: APXvYqzvcCpnZZHmYadtKA97equNJmiCauvATqWDHHcaEcLdwzyZBnlDLQVW4NSZNk/nEE+utx+c0+iWQBeKuVFjgIE=
X-Received: by 2002:a67:83cf:: with SMTP id f198mr4830491vsd.63.1556875721239;
 Fri, 03 May 2019 02:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp> <1556155517-5054-5-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1556155517-5054-5-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 May 2019 11:28:30 +0200
Message-ID: <CAMuHMdVtmn-mDMXZh8F6C6oC_Qd809VvZHFyBN-SATXNJ9_T8w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r8a77965: Add TPU support
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
> Add tpu device node to dtsi for TPU support on r8a77965 SoC.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
