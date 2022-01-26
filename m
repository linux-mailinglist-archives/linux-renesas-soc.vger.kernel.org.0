Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB3F49CE84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 16:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbiAZPct convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 10:32:49 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:38870 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242866AbiAZPct (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 10:32:49 -0500
Received: by mail-ua1-f44.google.com with SMTP id n15so41993314uaq.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jan 2022 07:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/TCzPHSTUILHMCMj1ywqWIOE7iE27gTZBSDRCa5QhEk=;
        b=GN4x/2Z4LaiqYRKGuWyhkXvHIuAjgTwa4H/xjKWtwnrkdGiLHkCVOhCC36+5hgkUQv
         /KgHZdjvNa4ChGM0zXel26eGDCog2YkQECt02SuFf7hU7VIRY00fhmsn3u1TZiY/eMxO
         UKhP1lftmA2LeBbpUh6AIMrxbE0TkvvOuWX5JaXGp063wjJ8IbKDDyMTvQlOvRSX/oLe
         yEiCczdHCrB974kTR6344Bx7MvHub3T1oegR/5ZvmI7Ro2rGRNf5ogThxNJ6NTKT2/tq
         Pwzd9RuZ/WlCOxiTRVL3kTusXpyeFdBP9pTnRbE2enJ0HPrWLDVGTXAhcGlr5dmC7f0b
         dEWA==
X-Gm-Message-State: AOAM533CxGqGSr3FiHk4pbZH6j6WofW7ArRPxhS4gSGhNqlZcFs7+Bav
        2xPKsXgUS5ARu6zkzHrskJ0md51ARgmIk9ML
X-Google-Smtp-Source: ABdhPJzP25UQm67gErizv1Fk/eYBHxpU5jBPoXNIZmK0XoGMmiAScvPDPehDYr9CebiIgS71bSVxfA==
X-Received: by 2002:ab0:4952:: with SMTP id a18mr9574210uad.84.1643211168174;
        Wed, 26 Jan 2022 07:32:48 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id x18sm2557621vsj.20.2022.01.26.07.32.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 07:32:48 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id m90so43632382uam.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jan 2022 07:32:47 -0800 (PST)
X-Received: by 2002:ab0:13f1:: with SMTP id n46mr6819685uae.14.1643211167702;
 Wed, 26 Jan 2022 07:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20220113163239.3035073-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20220113163239.3035073-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Jan 2022 16:32:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdURJ4cXAaP-hUXT9L=1BkR97PmEZsutc5ZLqtSz=EAtyw@mail.gmail.com>
Message-ID: <CAMuHMdURJ4cXAaP-hUXT9L=1BkR97PmEZsutc5ZLqtSz=EAtyw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: falcon-csi-dsi: Add and connect MAX96712
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Thu, Jan 13, 2022 at 5:33 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The sub-board contains three MAX96712 connected to the main-board using
> I2C and CSI-2, record the connections. Also enable all nodes (VIN, CSI-2
> and ISP) that are part of the downstream video capture pipeline.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi

> +
> +&csi40 {

Moving the csi nodes up, to preserve sort order.

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.18.
But I wouldn't mind receiving an Rb or Tb tag from someone else...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
