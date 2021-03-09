Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5BAA33257F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 13:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbhCIMaH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 07:30:07 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:39645 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhCIM3y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 07:29:54 -0500
Received: by mail-ua1-f53.google.com with SMTP id t15so4459402ual.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Mar 2021 04:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ni5CcSWlDxcvJxIb9zh1G4A5i9YgczGT35ZtrBWNEec=;
        b=PvDLolMmYz0ohAQjyS2gijSkGw4S6y03wiJqLcSZverCLgzwa9mMKpwV8dMNloWpXL
         6Qsrc85ImYENiKE0ue3eFWFqrRjh87XtvHH1ielm8o7aRFNCu9q1wJTJy1eVqYdoY1Bv
         AXoIz9tQ5Y/9F53KMDHl+dTDtsNvI8hc4f5KS4QyeogrKU5G2eACifdc1SIZXCxelEs5
         utz19X94t3GdRsD+4T9pcz8soS+C0LG9QqHJEIf6YJgpJBHg7YK7+MEmSw4TAqXerTAk
         eg/VYkYmKWIW2B2mviC225JbSRy47XGcqIPeJmgfqpCZzPH3Gz9GTV6/BRNV26HeG6MR
         Bh8w==
X-Gm-Message-State: AOAM532kz/gE1U642qoHN0lwLa389YWvtOQ7OIlzgKIRGkOpU6E31nti
        owe5Pn7KNCfX0cn227wpacjB2N96PV5KrKZERls=
X-Google-Smtp-Source: ABdhPJxpV/kOwARxO7NVm+TGYLmy3cYqvTkd7MFoFMSsNBSj9w8pWKnT5sziA5jrD+U5bqtGrENCsqhAX2RjLd25CL8=
X-Received: by 2002:ab0:3c8:: with SMTP id 66mr15677744uau.4.1615292993653;
 Tue, 09 Mar 2021 04:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20210309114930.2433711-1-niklas.soderlund+renesas@ragnatech.se> <20210309114930.2433711-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210309114930.2433711-5-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Mar 2021 13:29:42 +0100
Message-ID: <CAMuHMdWLeihi4ZafeTAHS_9MXB15FutDZa1qwtzwuF85HvNv2w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] pinctrl: renesas: r8a77965: Add vin4_g8 and
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
> This patch adds vin4_g8 and vin5_high8 support to the R8A77965 SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
