Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6658421E6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 07:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhJEFwo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 01:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbhJEFwo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 01:52:44 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435A4C061745
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Oct 2021 22:50:54 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so1106994pjc.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Oct 2021 22:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4NeMuZezzbqxNlXi1LQWclIxq6eDR6pm/+jHI0J3aK8=;
        b=S4xmUCWSrgXLjCPnoSiwsI+cxVNnf61RlJdSSJRG4uUK5Fmt7nNkR4VtIycRv4we/8
         DnC2PZX7rqJo6MW/+1Ri+eIAab8E1cCRQ9BR6/apHgI8rN4gUgL4Joz/d5DMqPQ+1rcL
         Fz7U9pn36SzARq/Jf6Ei1V4o38Giw6cIjoZhwcQLevcE/8Q5Id8LpaFN4NTXNYVbwBcu
         5m14tmrdglqtOjN7jCcGtHod88o7xzlUjHB17pxT4l/mcqgPsg2ue8R0BzPm2+P8mReJ
         bSa+M9d3DzRQOthZT6+FGhhxLaoiLhZUk1+NwdMjY3HbBaRXpEr4epJElREUQsGktIU8
         Bm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4NeMuZezzbqxNlXi1LQWclIxq6eDR6pm/+jHI0J3aK8=;
        b=J1qsE1N7nnaiTlsLAfIbTSI0VxWABHtp9LdD1bs+gIvz2v9lLrwJe6HxRyYNtFt3sR
         MoI312DAy+Q/m0MFNdXVBYDK68XtnYdZROVXEUw3Q9K+gsWVyvho+ZhzRSn/hY9aT7qr
         skECm0wc9hI1q6bKOqLft8xH9cevhwVj+WILiyVsed1EbBG8+YxIEP/mTqPzG9XnhHKn
         wBKdjSEUhc03owMLDZnbirICT/vOXRQWDz1L3f9okiKb+gTU7mYn+YNDaHvU7pctIEwa
         rBQImiR4EQPdlrFsv7tkRz3pjlkIBdLWRyU7td6fULv7ew0RCOgz6u1Q5kJEhfMo3oWL
         pbcw==
X-Gm-Message-State: AOAM530/nzuiMIS4rk4byZZgl/Q2JcgXvo7PCqDBxcAhi03AZezPfKIc
        tE40JQktLaJ27RiNiPrsOYshqA==
X-Google-Smtp-Source: ABdhPJypXaVT+p/dnAD+BO/o1OCK/fiXD9C3n/HU4n11SrE4tZJkADqT4WCFBjvmvgvHny+cPP+moA==
X-Received: by 2002:a17:90a:b382:: with SMTP id e2mr1562944pjr.119.1633413053613;
        Mon, 04 Oct 2021 22:50:53 -0700 (PDT)
Received: from localhost ([122.171.247.18])
        by smtp.gmail.com with ESMTPSA id s10sm673204pjn.38.2021.10.04.22.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 22:50:52 -0700 (PDT)
Date:   Tue, 5 Oct 2021 11:20:50 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Enrico@rox.of.borg, Weigelt@rox.of.borg,
        metux IT consult <lkml@metux.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH] gpio: aggregator: Add interrupt support
Message-ID: <20211005055050.ggimidaqis5tfxav@vireshk-i7>
References: <c987d0bf744150ca05bd952f5f9e5fb3244d27b0.1633350340.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c987d0bf744150ca05bd952f5f9e5fb3244d27b0.1633350340.git.geert+renesas@glider.be>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04-10-21, 14:44, Geert Uytterhoeven wrote:
> Currently the GPIO Aggregator does not support interrupts.  This means
> that kernel drivers going from a GPIO to an IRQ using gpiod_to_irq(),
> and userspace applications using line events do not work.
> 
> Add interrupt support by providing a gpio_chip.to_irq() callback, which
> just calls into the parent GPIO controller.
> 
> Note that this does not implement full interrupt controller (irq_chip)
> support, so using e.g. gpio-keys with "interrupts" instead of "gpios"
> still does not work.

Hi Geert,

Thanks for looking into this. I am not sure of the difference it makes
with and without full irq-chip, but lemme explain the use case that we
are concerned about with virtio.

Eventually the interrupt should be visible to userspace, with
something like libgpiod. Which can then send the information over
virtio to the guest.

Will the interrupts be visible in userspace with your patch ?

-- 
viresh
