Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD23333D7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 14:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhCJNQC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 08:16:02 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:35703 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbhCJNP4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 08:15:56 -0500
Received: by mail-ua1-f41.google.com with SMTP id 92so5752363uas.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 05:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CPjezEew7cd+D27vejApeUyPHP41fzYItYiVjAqWBOg=;
        b=V/bfMQAN8NyeqqodnF0RpI6mRT4HPpMllWERoPAOO5RXdfMr7nytpz546RgJj+V+iM
         7K00CotmgRvRo1zwxlu+4tDYA5YBPm0VreUgSC45dIfe/FF/J9Nn3nky2dQnRHMn5ad2
         jGp4kPHAUiFGoSyMITMubcaE+JzLcb725LzJmDe0tkHiO9zo2uP2SC/XoXXRBw8qXv7u
         q/53leoNIQdpp3Czddae+MOLmyZ5AS5hUUONuTBTJmo8ELHGIcW5XfSIjTN+jmxq8IQE
         rnZMzLLddVonCfJ36baF/Lgd2cIeUZXxFNL/3S9M3WFH+4AvF13JI0HFeMzmW5NV+Ttq
         xNiA==
X-Gm-Message-State: AOAM530Mnx/YZAmFEXBwuNaEb4U67dsb9Fv8TfDyG+WRZ+XfSu8qA7+U
        0rU/u96VubgE9TG6GhO6n3e/OB1PXD+EFoSDAXR3J7P4Kas=
X-Google-Smtp-Source: ABdhPJw6DkBltXE5ALBwRjmEUVw/ZGDhlxXjMs5KwgROh0DuriZJipVwxvx9IF4VEQxrZ/h2iJyIRr5nquf8pTcBacY=
X-Received: by 2002:ab0:6045:: with SMTP id o5mr1489228ual.100.1615382155769;
 Wed, 10 Mar 2021 05:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20210310110951.3299524-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210310110951.3299524-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Mar 2021 14:15:44 +0100
Message-ID: <CAMuHMdXR_BFrvSC15DZjRYSS--t6HYwxa1BHjOheUhvKmQ_KdQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779a0: Add thermal support
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Mar 10, 2021 at 12:10 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add support for thermal.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Add fifth TSC node.
>
> * Changes since v2
> - Increase register size to 0x200 to cover the larger V3U layout.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
