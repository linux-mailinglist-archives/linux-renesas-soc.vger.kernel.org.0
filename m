Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40C95192923
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 14:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbgCYNGq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 09:06:46 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45357 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbgCYNGq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 09:06:46 -0400
Received: by mail-oi1-f195.google.com with SMTP id l22so1940733oii.12;
        Wed, 25 Mar 2020 06:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tRAqWE5jTPBEZ5gwwukisG5aliJgP0GpLk1uYWHBM64=;
        b=nUpC4oaZMccfzvcSkkiSvPSNoynX7krGCR6bgkDYsMCW3pSo/SGHi311rLd9QJLgk7
         Wj9BxcqwIZEn294wAmlU3xd6yI6QAnBNVl0ZBex0/y8bzkaoGpWLv2OIInByG5wd7MvV
         m/nAxH+y+iiPrYNJCM/F93lUhm6zPExB7yuOqnPsi/8aHz5148p39TKY6PdJHpmqo13c
         YmDPi2Ruw1Rsnv4+Kz5EnUrE+5qw9hgl+q7vZlSjon2rkGWjMJ+IpWCJ4+Rk3SlLNmEY
         348BVFvJp/KIsmXCc3RpTszpNf32p10AUa6YKzbNE2CwfzjTROHW2dQuA3YF0npU6jtK
         Cgzw==
X-Gm-Message-State: ANhLgQ3h45evt8WtcVt6Y4MUGszpJEYAj6ud42vGptXEkd6pPh+YVz/G
        UI09CDS5rCVAEt2ekugdBzNs1kNW8cjTvSOfQsqQ12H7
X-Google-Smtp-Source: ADFU+vv1evnjrbuj83i0B7RGEzz/c4jPdtY0pyZWk0DBMBbFsDcTsnbzisEyBz8xwP8wDfazp9tgg4fkN70P3agYkFQ=
X-Received: by 2002:aca:ad93:: with SMTP id w141mr2484859oie.54.1585141604111;
 Wed, 25 Mar 2020 06:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <1585117100-8359-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117100-8359-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585117100-8359-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Mar 2020 14:06:33 +0100
Message-ID: <CAMuHMdXhwxmDuwK9M4ctP9=FVBfdLHSroq-YhuMrFtXaCtNq4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: rcar-gen3-phy-usb2: add r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Mar 25, 2020 at 7:18 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds support for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -18,6 +18,8 @@ Required properties:
>               SoC.
>               "renesas,usb2-phy-r8a7796" if the device is a part of an R8A7796

While at it, you may want to update "r8A7796 SoC" to "r8A77960 SoC", to
avoid confusion between R-Car M3-W (R8A77960) and M3-W+ (R8A77961).

Note that rebasing this patch on top of your "[PATCH v2] dt-bindings:
phy: renesas: usb2-phy: convert bindings to json-schema"
(https://lore.kernel.org/linux-devicetree/1572592763-12396-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/)
would avoid that, too.

>               SoC.
> +             "renesas,usb2-phy-r8a77961" if the device is a part of an
> +             R8A77961 SoC.
>               "renesas,usb2-phy-r8a77965" if the device is a part of an
>               R8A77965 SoC.
>               "renesas,usb2-phy-r8a77990" if the device is a part of an

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
