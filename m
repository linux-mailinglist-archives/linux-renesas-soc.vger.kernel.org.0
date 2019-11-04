Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE02BEDBEB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2019 10:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfKDJuX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Nov 2019 04:50:23 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33033 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfKDJuX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Nov 2019 04:50:23 -0500
Received: by mail-ot1-f65.google.com with SMTP id u13so13869713ote.0;
        Mon, 04 Nov 2019 01:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=In2BvITp0W5HarTx3CDPphxXxdYomKlC+mZY/I3WVRg=;
        b=syqdH+la4xIp25eLDI01nuTId/6tNHgK1fCbg6F7e8jrBEkvvB6H0UQTtijYZgoikh
         iAxF9hOxBI0XebLkZQXeVVOiHbXyDGaZnFfFHPApbmel0S0eI7d44uCJPhmJYXYUy7Jl
         X4c0O86MR7UsHBBvWQiRAhFB7bjmj6+BT/agzYqtSZSLHxPI6Sx8r2tz6cXuboUebuq8
         El4hq88Wx1tyKT4mKoTMCN/zmoooWxxqbvhgAZtNRMCliMO2uLQBETLgQDvH9etvv+K/
         EGD1vXEybws+VoJpncB6NtHZjBrMJwSMYjCAinTjscbh3bDetAfAbBClkTpL06HQ4wVw
         M+Xw==
X-Gm-Message-State: APjAAAXbxU3JWxjf4MwxivOEBYLgZb1FPqkyctIF9h73uum5CEivHIAd
        sF0/gUaZnlwxj4sbkMwV14yK17ycNsxcs1GUtIo=
X-Google-Smtp-Source: APXvYqw7Lf6Za1jmV3Lv6QPYSl8TPkxo/pEg/iZ9HTgK3QdzsL20i8UReVD6/t1bbDURJkPMzgQr6neBmx36H0eLrtQ=
X-Received: by 2002:a9d:191e:: with SMTP id j30mr8440939ota.297.1572861022252;
 Mon, 04 Nov 2019 01:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20191016151109.30747-1-geert+renesas@glider.be>
In-Reply-To: <20191016151109.30747-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Nov 2019 10:50:11 +0100
Message-ID: <CAMuHMdXm6Afp4bdn1kHsarcbykBkNHeAzSsnm_6VPijNOB_oUQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Add R-Car M3-N ULCB with Kingfisher
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 16, 2019 at 5:11 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Document the use of the Kingfisher expansion board with the R-Car
> Starter Kit Pro equipped with an R-Car M3-N SoC.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Queued in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
