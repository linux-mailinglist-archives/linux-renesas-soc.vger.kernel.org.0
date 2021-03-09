Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F0633257B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 13:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbhCIM3C convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 07:29:02 -0500
Received: from mail-vs1-f46.google.com ([209.85.217.46]:36597 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhCIM2p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 07:28:45 -0500
Received: by mail-vs1-f46.google.com with SMTP id a12so6681835vsd.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Mar 2021 04:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gsKMo7a6YmEw6wUIymu3l3VI1N52lc5wMOIpZUNEdG4=;
        b=MJjfjd+a5k7qAeMbW2oItmySHrbSppu313VlxH+hkM70GcxjOWe9Np31xwoLmT6oLe
         Ny5r3S129Ooixve3OWh42FK5anHO8qs033WCcIPB3ec0kJLNP/BylIaByu3t/t5a9Tlx
         ov9Yw93f3FeXPI/spRHk0ibEKTzhW8MkbDYJW+HUqpdEnnHL0w2TaSN7ejZf/P/hjJ8k
         RE/8FvUUa7kTxSYIZHJf8Wgpxm4avWCUc9d5v+G/NThGCR+hoaFO7ZLd+IqROygCLwsE
         R2vb068ZXfvvqAXoEZ/BM3yAnNqayaweTiG73oxDw3Wdv0/Jsfg/NOCQdkBucX4w7OJi
         5d1g==
X-Gm-Message-State: AOAM531psPRPpzPIBh7QNejI4f3WHWsWde12bgkZS2uvsaTdG86f/JQQ
        FDxKDYPckgqoQyBsLozn/QEs6EGCUovvzICN7f6oddLv
X-Google-Smtp-Source: ABdhPJxYPgc02P0Qvnn1puUKJyuGEK5wsHAniY9VVa+wqGOpPuxUa28iifyDdy4ZMTkOkE7Gj1eCO5Hjyk8/QcTwDkc=
X-Received: by 2002:a67:efd0:: with SMTP id s16mr11205988vsp.3.1615292924870;
 Tue, 09 Mar 2021 04:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20210309114930.2433711-1-niklas.soderlund+renesas@ragnatech.se> <20210309114930.2433711-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210309114930.2433711-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Mar 2021 13:28:33 +0100
Message-ID: <CAMuHMdWrmjRtyN857uGzkzOQ=5gyYK7t_deAqY-VLC6r6gkY8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] pinctrl: renesas: r8a77951: Add vin4_g8 and
 vin5_high8 pins
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 9, 2021 at 12:49 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This patch adds vin4_g8 and vin5_high8 support to the R8A77951 SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> * Changes since v1
> - Rename g8 to high8 per Geerts suggestion.
> - Rebase to renesas-pinctrl.
>
> * Changes since v2
> - Keep the _g8 suffix for vin4.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
