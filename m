Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 090F4157083
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 09:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbgBJINn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 03:13:43 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38548 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727983AbgBJINm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 03:13:42 -0500
Received: by mail-oi1-f194.google.com with SMTP id l9so8382739oii.5;
        Mon, 10 Feb 2020 00:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VjWry7KhoqzOiycibMPWECOfO8sZzZb1yV6KzmEpj2k=;
        b=qSeT+N0juA9iWAmRtUm10/dTMzafbLGngsu6IHVnTVy7UzDbKRp+YXKIWwLWcG6KgX
         qUP2O43bNapbIMtkjFREzvw0ImyrNpNStcvHLXl1NZDce3kpHGSwSW1jCuDZqVXgS+Tm
         iDGgn2S/TECzwyqrtdI1oj4lff3YFpBmIIvo9oD5efKq3Ab6TbfvvwS5gECNMdMA3fmo
         kNHPDCbwkGkCnP5+dXn1Sc8SX5FYYHN9V9keSMEEnyEsoeiEmGBZWTb+7qzJZ2SiYzSr
         LDV7rxHvxSe9WxJ2HLvgGbCQC0rk8KI0kDPBpfrz+IHMHyl+iYMSFcjdQLXvoc1MXNC4
         z7xQ==
X-Gm-Message-State: APjAAAUbQWhMguVflQ59Lj/yDPg2zinKyThFOrPYLYz8iVlcA3ErjM0X
        AvaecYmBpaWlweZ6ldRy42+6O2G5jim9JRh0qj0=
X-Google-Smtp-Source: APXvYqxGi5omYNkEZPvFQJrTANgioOYhVT70Qt3uG0LsD+eyonN8rfYM+fB+jinf7RoDRGBZ7PoBO/bNx2CQOqLSLTA=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr124362oia.148.1581322421411;
 Mon, 10 Feb 2020 00:13:41 -0800 (PST)
MIME-Version: 1.0
References: <20200207162704.18914-1-chris.brandt@renesas.com>
In-Reply-To: <20200207162704.18914-1-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Feb 2020 09:13:30 +0100
Message-ID: <CAMuHMdXdgcs0pgmeVR+DW_oxsUcR159i-=ZL+LLoqpQoAvq6fA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r7s72100: Add SPIBSC clocks
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Fri, Feb 7, 2020 at 5:27 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add clocks for SPIBSC blocks
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, I believe I cannot queue this in renesas-devel yet, as to avoid
a regression, the flash node in r7s72100-gr-peach.dts should gain
appropriate clock and power-domains properties.
And to avoid bisection issues, that should be combined with this patch,
right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
