Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B0F3F8A0C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Aug 2021 16:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242838AbhHZO0U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Aug 2021 10:26:20 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:44583 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242819AbhHZO0T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Aug 2021 10:26:19 -0400
Received: by mail-vs1-f51.google.com with SMTP id s19so2143624vsl.11;
        Thu, 26 Aug 2021 07:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jprPXM4sChkG8ooptncY1YgExnlJ1w+XBvLzYryUV6g=;
        b=IwLg0AN2IlM7Q9mEDeh94jpbdRnz2phfR7lg4b9NnEbTaQzGM/BPtE6so5ekV1Yoe9
         r22Yd2pDnT3zNjv+TmNOcgK7JUMKGWmGXuXqPhgse1NYr+yhBnEoHsuDl785auRLe4F1
         ssiMXt3hpfwic8G/npyzMykRnGhhD3a/Vm2L2QZgAoJ2Ftb6ryHH4vwv3iYiqwHSN76D
         QgqhpE+1NNAiH5GtieNPJ57IpXQbWkjJ5MD76BM67t3Iwsri8mVMr0leazafGL/NWHDP
         u5mq6IWwz+RFyfsElm4miQoN1qTnN49ftD7YeLvcG681EuQp4484AYDACeZzXVljwX5N
         XGIQ==
X-Gm-Message-State: AOAM533D2qP8iyFxhefvOaBrk77Avo9y+rdK9hTV03xBMtoZOt+73Vzi
        gSHX1OtSXoWbdKZg6+lEogIKkHXBnveEZPUiIE7xtnz2
X-Google-Smtp-Source: ABdhPJzKtJ9ealj/wVf+bGA+b+hX+/EFS4KRqodTE5/viVbTHk9dSZbfX2dDw2vBjRx8x7fEhwZP3yDXX4ZFXnnHmFs=
X-Received: by 2002:a67:c789:: with SMTP id t9mr2871736vsk.60.1629987931998;
 Thu, 26 Aug 2021 07:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Aug 2021 16:25:20 +0200
Message-ID: <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old SDHIs
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Aug 26, 2021 at 10:21 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Old SDHI instances have a default value for the reset register which
> keeps it in reset state by default. So, when applying a hard reset we
> need to manually leave the soft reset state as well. Later SDHI
> instances have a different default value, the one we write manually now.
>
> Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Geez, typical SDHI nastiness here...
>
> Geert: I think this fixes the issue you saw on Koelsch. It works fine on
> my Lager now at least. Can you please test and tag if all goes well?
> It would be great to have this in 5.14 but it definately needs Geert's
> confirmation first.

Thanks, fixes the SD Card issue is was seeing on Koelsch, and still
works on Salvator-XS.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
