Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8A6435B68
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 09:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhJUHMB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 03:12:01 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:36770 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhJUHMA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 03:12:00 -0400
Received: by mail-ua1-f52.google.com with SMTP id e10so11397851uab.3;
        Thu, 21 Oct 2021 00:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rcs4KqLtCpKEKi9bvm/eDiORA5M+mO9mYBdkVch1vhc=;
        b=RtTmDc22pVWuavV5jWxAbBUmnEZzviM474UmW0ICjBevn8OlkqrJjUOtX4h2lzI/9a
         tScdSX7t0zN7Hp+nB320SsOeOxF0EZMldm2KONJGnpI2/1zYAB6GHDn93siJWtMTFPrs
         oKWio56PlNG5Nr2AqEFWdWymM3frYGoIK85a11cunbDxjFmi7irG+chgRwsJ82cgItGb
         U75bU0edCkqq1eCXDq5akuHUo5CXrj0V1rggE3F/3gMSiNmkLEaPTk+/4zVafQd0LM1G
         AA44RRfb0pjpOc0hkNvoj2ZXr/A+g0zOKuvXHzfXSg2znFp2lxzgk2x0eWfRH3iz5YNA
         HIFA==
X-Gm-Message-State: AOAM531KP5DHtJgCrXjOigNDtyLHhVcRf9jNTqJumR/zWp30/fxSVnoa
        8GMAoX24jgGpBVXLNbAdGaeJsVV9tEySMQ==
X-Google-Smtp-Source: ABdhPJxGDXGamHjHLofyfgoHEuut9vVFAffLlF8IyXxU3/kE5D2daQT3y1OmHpWqqyv2Mcx0Tz3C0w==
X-Received: by 2002:a67:d393:: with SMTP id b19mr4012537vsj.33.1634800184130;
        Thu, 21 Oct 2021 00:09:44 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id j133sm2687694vke.47.2021.10.21.00.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 00:09:43 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id f126so13284479vke.3;
        Thu, 21 Oct 2021 00:09:43 -0700 (PDT)
X-Received: by 2002:a05:6122:d05:: with SMTP id az5mr4322945vkb.19.1634800183049;
 Thu, 21 Oct 2021 00:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211020180949.15024-1-alexander.helms.jy@renesas.com> <20211020180949.15024-2-alexander.helms.jy@renesas.com>
In-Reply-To: <20211020180949.15024-2-alexander.helms.jy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Oct 2021 09:09:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMz7umrtjLz-vbfSuxd8nz7iJro8oQN7ZStkuRMK6kSg@mail.gmail.com>
Message-ID: <CAMuHMdUMz7umrtjLz-vbfSuxd8nz7iJro8oQN7ZStkuRMK6kSg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: Add binding for Renesas 8T49N241
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        david.cater.jc@renesas.com, Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 20, 2021 at 8:10 PM Alex Helms
<alexander.helms.jy@renesas.com> wrote:
> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> The 8T49N241 accepts up to two differential or single-ended input clocks
> and a fundamental-mode crystal input. The internal PLL can lock to either
> of the input reference clocks or to the crystal to behave as a frequency
> synthesizer.
>
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
