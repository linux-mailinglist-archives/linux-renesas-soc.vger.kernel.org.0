Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576352B3EE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 09:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgKPIk1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 03:40:27 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42308 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgKPIk0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:40:26 -0500
Received: by mail-ot1-f65.google.com with SMTP id h16so11116541otq.9;
        Mon, 16 Nov 2020 00:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mrtXNsqbIMxlt3gugb3dT1e0m+0OD6G6OGY7UW37nTM=;
        b=R0n7XMu+4/z8PE7RPjhnwsoNKOSD51AOmTyZvzuXlpjq0S8XK8jjS7+gMwOE+E1Tq9
         E5fzhyizw1Ke1zQhAcdZXOKt0R1wl6csSgWwehQJLtzqsxHmoSEZkp9FjIwIfKtB5mys
         pwB3G3zKqJ7Cb4ijDiIAXpFKJlub2I2lSmFivHpFM0+NgUAZ1b9chxtbB8BAwzDCcMAs
         54NaX9OFBiOa/+9LJaBSPlBENu/XuWGymfIyGXVjoJkqyKDSk2rLzf9mHoXFIzGDvfqK
         WBdafYaei7iezTuEdM5J3FlBFk2efR/izFZ8tElnHr9FKP7r9LeKI9Jol3T6koE4lxIk
         VRHA==
X-Gm-Message-State: AOAM53159yPoynV7nTnhLkv+vuFhG627NtWL5WAzn35RjDoLTTTfR5PY
        ++THwd/0+IqS2HjjtepEY/YVvH2+0mRhfKwbVnG4Q1fQuMI=
X-Google-Smtp-Source: ABdhPJyvbjx1/KY/xY6F831hg9DCcUDctcN4EYXY9gfEANjNPzfI4zNBbwSXyG1T/zDn5cytFO2JGBeaeqBkFjsNwSc=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr10162467oth.250.1605516026006;
 Mon, 16 Nov 2020 00:40:26 -0800 (PST)
MIME-Version: 1.0
References: <1604543524-31482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1604543524-31482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Nov 2020 09:40:14 +0100
Message-ID: <CAMuHMdX17hSkcxYPgnGP95nH3H5s+G9Si01X_6PxJn0Skyoqhg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Convert bindings to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 5, 2020 at 3:32 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Convert Renesas R-Car USB 2.0 clock selector bindings documentation
> to json-schema.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
