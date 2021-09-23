Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF5B4158DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 09:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbhIWHOg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 03:14:36 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:35760 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234343AbhIWHOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 03:14:35 -0400
Received: by mail-vs1-f48.google.com with SMTP id f18so5589010vsp.2;
        Thu, 23 Sep 2021 00:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HzeQrgtYJ+KN9cbzfGKrylJWKL7WhW18t10xUgj9FyM=;
        b=hw1bQ6wU8YLh78tTbPW/trxu8UU6XwnoucVggROaKxtG5QPtrpDxgGXtF+LENM6vIg
         JRTP2wrPIqvBs7l1zt7tL3r0ICPMil5Z1yamULDWBiaIzg7f/xQIr5b23FQxG7Xu9JdK
         3Dnee2Htk9atsSnot8AphAiKy8Upw8UxVZhzk//C7+2TDjLzoloTNewE1thrskLAeFuZ
         3uCoRPonOiv67YIzi1KHlD/kPkWnrUFpvAzT0piRihFKYZCvzN02om54AheqioDmNUcd
         hR9E+xuwz9PRVk8L3aN2dlBCj7rqjkOUe9mcrPlk3j2WHTyQjMGdyRj7WI5pfBik1n63
         34Ig==
X-Gm-Message-State: AOAM532uI//seRqd8ZXRCacqItqnajtbc0lUwiEaV2BrOVjRbJSt68s7
        /9Xi8AHue/FGVTU/hEUaRli8EEZlha8D7kQTVmZsVvfU
X-Google-Smtp-Source: ABdhPJyPXVLr89ihtCYGJHbouzG39IJdqPgTa3cXRRZKWPsS8ezadlBfC6KvuZLn/1w5MviosnMZhBr8JewDKsfO69U=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr2903486vss.35.1632381184361;
 Thu, 23 Sep 2021 00:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210922201314.3205674-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210922201314.3205674-1-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 09:12:53 +0200
Message-ID: <CAMuHMdW=4ZjtSynuBmwAnK+Nx_q+Ocn-wP36WoC+COUp-fdiXw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779a0: falcon-cpu: Add
 SW47-SW49 support
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 22, 2021 at 10:13 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Add support for SW47, SW48 and SW49 via "gpio-keys" on the R-Car V3U
> Falcon board.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
