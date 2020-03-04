Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA6E1791BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 14:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729460AbgCDNwE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 08:52:04 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36983 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729175AbgCDNwD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 08:52:03 -0500
Received: by mail-oi1-f196.google.com with SMTP id q65so2135143oif.4;
        Wed, 04 Mar 2020 05:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6WwbWu0xTni9Cp99Kx5Gs/VRlduitGbpAQTNywzTd4s=;
        b=Xzv4TVwljLqgAQi7isqtAI/wr8VPjHoP+wJODwN/t40n9X9M5ey0NnD6k80LKg/j7/
         VzQQ/Qg+QP2TYBYcAHJkZZyuoPqk8TswW38oWNGfCi20wKRNuJIPA+qPZRcWXp9kzBxX
         t57FqhwUrV/ULUSBkm46K6eEO2A71eGvhc5Bkj5PaHQxh8o783nQjL6phbW+HYRECceV
         4mwjZ3WkiUnSeUHw3rUpb5Js118e0JuIYKMDcJV12EqZj6/5HIQ/N26OzyMHi4D2yQkt
         7HYkQ1REYdS9mfvGMnHxCekR+wlmF/D2qMJlzEaTQu5mof2V1R4/006tR/KytH+m44NC
         TqHg==
X-Gm-Message-State: ANhLgQ3lhGAJ8iWPZ25IVzUGvhhFJ6VLGZX0UC7mrLxTF+qUc236zMPI
        ONMKhdhMKRsfmTmXKHtUcBkVoOOP9ZfhImVDdso=
X-Google-Smtp-Source: ADFU+vuTICXrcscX5k1nu41UFQdDCfobCA8QCTKMnQP1AKsGszL/joQ2G36x47lknRco7zcosgL9uwZN9Jp0l6krX7Q=
X-Received: by 2002:aca:ac4c:: with SMTP id v73mr1851535oie.102.1583329923004;
 Wed, 04 Mar 2020 05:52:03 -0800 (PST)
MIME-Version: 1.0
References: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1583304137-28482-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1583304137-28482-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Mar 2020 14:51:51 +0100
Message-ID: <CAMuHMdU5H_xt=DNtPbrA38=wi=-4884Pe5CB=7wcHB4V5HzshQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Add power-domains and resets properties
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Mar 4, 2020 at 7:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds missing required properties of power-domains and resets.
> Fortunately, no one has this device node for now, so that we don't
> need to think of backward compatibility.
>
> Fixes: 311accb64570 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> @@ -43,6 +43,12 @@ Required properties:
>   - The USB_EXTAL clock pin must be "usb_extal"
>   - The USB_XTAL clock pin must be "usb_xtal"
>  - #clock-cells: Must be 0
> +- power-domains: A phandle and symbolic PM domain specifier.
> +                 See power/renesas,rcar-sysc.txt.

power/renesas,rcar-sysc.yaml (I'll fix that while applying)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
