Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F19F300012
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbhAVKVQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:21:16 -0500
Received: from mail-qv1-f41.google.com ([209.85.219.41]:39763 "EHLO
        mail-qv1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727836AbhAVKUy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:20:54 -0500
Received: by mail-qv1-f41.google.com with SMTP id s6so2374895qvn.6;
        Fri, 22 Jan 2021 02:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pnqYb3QY61gSashZ9AL/GOEj/gUcQuFqNmSe3PAmso=;
        b=KCTXPDWs6Z0j9G3taXNjX75PQG1HEXUzbxXgvapQYoMf92XhAJb2zS5Tn1RaOLuNMi
         azNa+e0LyyEYU2WWHnzmHwbSjsmQvWmzicpRG4gPkS6sWHtYP1PhRaJUTPsCI7NeaWnj
         zZDHlVThBrlGRHow934AOivjhZw6KWFkx2wv+FXc32bIO1v4zRDgyn/OUzfbzQ5s830Y
         Sb0s1mnSFoK/SI2z65HLwVpwxiaKr+2/nqoEUU0cJTCmasdUQSVbA6E6ltXKUmW4KKW0
         BI/uDTeO1m8s1YRCvvqtwMB3uS5NU3c9oWX7/tNmVB6rXgIy30+q+1d1cuslvGL+x2dN
         EsVQ==
X-Gm-Message-State: AOAM533xlZkG2LCzU9iYQoJJ14zt8x4nFDy4Iv2WMu9uoacXkVjiK+mZ
        r4gw4Fp4r6iS6dwHK9E6oxobxyDd9ufjrxAPI5BZVfIr
X-Google-Smtp-Source: ABdhPJx0RyalLmfJx4OSUU4CPsArtw7xqkS3xCQi6kO7AZPnIGmmsalY8GT8lFuXxsRd2HAFLC+6yhORZmUCnWK2kdM=
X-Received: by 2002:a05:6214:2b2:: with SMTP id m18mr3612576qvv.40.1611310813549;
 Fri, 22 Jan 2021 02:20:13 -0800 (PST)
MIME-Version: 1.0
References: <20210121100619.5653-1-wsa+renesas@sang-engineering.com> <20210121100619.5653-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121100619.5653-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:20:02 +0100
Message-ID: <CAMuHMdW6DnUAPimPh16omG1ZwhYDPAQA9wTKFnsvtixu8SF_dA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tho Vu <tho.vu.wh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 21, 2021 at 11:06 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Tho Vu <tho.vu.wh@renesas.com>
>
> Define the generic parts of Ethernet-AVB device nodes. Only AVB0 was
> tested because it was the only port with a PHY on current hardware.
>
> Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
> [wsa: double checked, rebased, added "internal-delay" properties]
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Change since v1:
> * added internal-delay properties

Will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
