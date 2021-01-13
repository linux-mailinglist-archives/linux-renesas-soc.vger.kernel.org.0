Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFFB2F4C5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 14:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbhAMNl5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 08:41:57 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:45623 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbhAMNl4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 08:41:56 -0500
Received: by mail-ot1-f49.google.com with SMTP id n42so1855157ota.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 05:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uuyGnuX90IPie4jr36VD8y3XQLpgnxTow0QG3nBNzU8=;
        b=jSTS8V41zm54ZTHjjbR5PvBGOkBJ/B6XEOUYvbr3I6WHSxct2aW34JeGJPFLpMX0TQ
         rZOwYglwNZoEP8K7ZVWdqr0HjjcYMBi6APeVmEdkYW/0gdJwrjrXqda04RAzZdq76Slj
         oYPXxNFdWsSIxt22m8o1vMnUu8iDP1Gaan/nmuNid3eHz4O/16nPIiPVt9PgMafv99G1
         e0JqNBbHItrtzSavtL4gyulk8uXrDLPIHfOHug25Y+ETtb1i2U58TPUiV44mSZe/6xbq
         a1e3yY0L6rGfrj8okdo8ZA+0t/2qIDGTqWihT1kgBcJcDB1+XZrKvmy+ybwzorbEAqPO
         eoig==
X-Gm-Message-State: AOAM531pFfweGk//DWURgMN2PxrdrZUVa+VJK6bFnJW+6doJY8EneZpM
        EPOG6HG3uBdu+oVGyMri9vR9R+leZGTz91sX5vI=
X-Google-Smtp-Source: ABdhPJxPP8j2+08nOuvOJahhVF/XbUv/SsBpq6LV4Ufsx/Qizd0LFEMtIhHVlVLp3SNCp4Txy5zF4gJ8lQl/S/d+eVY=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr1260033oth.250.1610545276208;
 Wed, 13 Jan 2021 05:41:16 -0800 (PST)
MIME-Version: 1.0
References: <20210112165929.31002-1-uli+renesas@fpond.eu> <20210112165929.31002-3-uli+renesas@fpond.eu>
In-Reply-To: <20210112165929.31002-3-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 14:41:05 +0100
Message-ID: <CAMuHMdVZiiQRcoQoMJkc4RPkUnS46NrOVbO1zCnbcRdapLKoPA@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] pinctrl: renesas: r8a779a0: Add EtherAVB pins,
 groups and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 12, 2021 at 5:59 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds groups and function for AVB PHY, LINK, MAGIC, RGMII and
> PTP pins for the R8A779A0 (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
