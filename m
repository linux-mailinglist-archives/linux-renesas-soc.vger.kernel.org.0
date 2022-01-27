Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024AD49DF9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jan 2022 11:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbiA0Knb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jan 2022 05:43:31 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:33707 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235285AbiA0Kna (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jan 2022 05:43:30 -0500
Received: by mail-ua1-f47.google.com with SMTP id u6so4029461uaq.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jan 2022 02:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=faaNlfXvBYFgxluEI8eSkiLNHC8pxNWGbLvY8pP4fD4=;
        b=283EKZQ6fCZbSYMgiIwlke7/zOpMxLMnJJpFKjlDA6FQDJEdWuOEK0y7MIl4rphzay
         fLp6nEy5tVABdf6XsWIWIBSdn/UE90ZHwz+yRPkkcu4o94oB8N//GE4nTUKbaxPDlb8e
         4TIN08VmjE2EcppKFN8vqJuMvOsr4TioayN9GgLs2iMor2hdccjfaMPez5Mo0zuRRI5o
         Jvsd9Tf7iaQ2AkomwMYN1c6A8Ev2GB9FfS8ErrBCydlQmLv8qK+xzzuXEQOK9q/+e7tV
         AHZlwlsAQQYLr2qNV2z+8IEGM5Yw8RVTgh9XLegABo4lSXVhGxFfx383IrbiuK4T7Zj5
         NhIg==
X-Gm-Message-State: AOAM531Wrz/ALrzu7tH2AOfE4oWZGFuQlKPuoSi+fReblwAIrz252vsN
        kplrGAEIzx3HwxcfKFAYcil4MvsLGFuhCA==
X-Google-Smtp-Source: ABdhPJxyd55rc84GN6Q1ILq8w/zcl73OQY3LG9aZrAJEqC+8ql+ZWjuJPG1wJWFAyz29aIKeMPcj2g==
X-Received: by 2002:a9f:3b19:: with SMTP id i25mr1463003uah.14.1643280209828;
        Thu, 27 Jan 2022 02:43:29 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id w124sm494288vke.20.2022.01.27.02.43.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 02:43:29 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id f24so3861879uab.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jan 2022 02:43:29 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr1345082vsj.5.1643280209093;
 Thu, 27 Jan 2022 02:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20220124021142.224592-1-kuninori.morimoto.gx@renesas.com> <20220124021142.224592-2-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20220124021142.224592-2-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jan 2022 11:43:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1hJUNC_NBvJjg-2A23AY4qPwYdYc5416_AdG-OsMg8g@mail.gmail.com>
Message-ID: <CAMuHMdV1hJUNC_NBvJjg-2A23AY4qPwYdYc5416_AdG-OsMg8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: ulcb/ulcb-kf: switch to use
 audio-graph-card2 for sound
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 24, 2022 at 3:12 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current ULCB{-KF} are using audio-graph-card.
> Now ALSA is supporting new audio-graph-card2 which can easily handle
> more advanced feature. Let's switch to use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
