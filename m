Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8089142C443
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 16:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237935AbhJMO7v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 10:59:51 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:35694 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236737AbhJMO70 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 10:59:26 -0400
Received: by mail-ua1-f43.google.com with SMTP id q13so5084779uaq.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Oct 2021 07:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pdjo9DA8HXMhwStNiMJa3iLx/3LFKK0Zo5WiUIt2TOE=;
        b=BYvL/YvOnqyRZ/g0JqyPysd25FQTLO8ySRhehQfCFyMWgH1i7lLwoguuzAlKJQ/XaT
         xT0G5jAf7vGNbMDOPc68xKIjR9Uy8ecvF/Nya/MvRO3EGTvbo1soXsPqo/cfjYTnkjrH
         zzkQnIvxCkWgGerirl21mUuyVn1MeNK1uGARggRIZfTKFIXpaQI6mnQSyyNpfB0jeUF2
         3DsxvvxfWnJt3XPUvp8wCi9YTsofRaC4yyLC/2N9hTizedYK5XZVA5uc8oOHsMatSerM
         WlfgOwWeXermygp795+YFm0B0jExWCwXwQNy55/9moqs3sH+/46uD1mZ4ziCaNlMsxCj
         KibQ==
X-Gm-Message-State: AOAM530dbe2HYtRBcHMmfGGxgVGI/upVVpX1tbgoXOO6fE7CulMd3A+i
        pjsauQU2+jjw4nefvj/WXhdvjK6syPD4X9rnVLNftE3nqvU=
X-Google-Smtp-Source: ABdhPJzXeWn+nQpmoB/UnXAE41cHEewAzfPMEWa0/O+URQOodKNMRtX7Kff1luQyuC7jVWY+50ev/+vcaPSj2o/r61Y=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr39595072vse.50.1634137042424;
 Wed, 13 Oct 2021 07:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211012183431.718691-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20211012183431.718691-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 16:57:11 +0200
Message-ID: <CAMuHMdWwrjw7t6SL3OQ==_BsB-phz=iFoyRdGAcTUbLhA1DmTg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add ports node to all adv7482 nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Tue, Oct 12, 2021 at 8:34 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The different port@ entries of the adv7482 nodes shall be encapsulated
> in a ports node, add one. This change do not change how the driver

does

> parses the DT and no driver change is needed.
>
> The change however makes it possible to validate the source files with a
> correct json-schema.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts

arch/arm64/boot/dts/renesas/ebisu.dtsi, I assume? ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
