Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAB598C31
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 09:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729716AbfHVHH4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 03:07:56 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35001 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbfHVHH4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 03:07:56 -0400
Received: by mail-oi1-f196.google.com with SMTP id a127so3622124oii.2;
        Thu, 22 Aug 2019 00:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wvPGUUKVfeC8WPgez1SmTd9lQXOUTgZUHTYZ8rQHMgg=;
        b=aCqClD3WP7PIqnlzgekHhKrFrxXIzCux4jOFid4gA7zwHqMF5CpXgtGn4hhrbbDdFm
         m6vV/sXnLJI3T7jDJK/ds4vUQv7+YZ2O+krQpb8IJWczxy8mpIKT6p+/2bIQOqN0HQxe
         XM5a69VIWU0TplQV4/skhq+PmzqDswLNYuXyvuQyfwftHORFJDPWF9Bqb0B1g49ATtpC
         GybywRzpdgK5MGeUB0CMCyWwKJD+xgfN1v7OldMeqetfUcFnnRA6XpNUwlYVhn2wDCHd
         YAIcBTLyTz3x0QvMi+EtTiU6+h63vixib0Z7AjRVgrPNoFsPTpnbLKl3MW7Wm+r5UuvL
         s2JQ==
X-Gm-Message-State: APjAAAUAb1xGq2oCKQPYRMaNryEk/8QYq27N+xUAM+otWcpc77iTWFDR
        WdvIb1zJVzrzXLen/Z/U0Onxzi1KdPmefKMK6nA=
X-Google-Smtp-Source: APXvYqw9kfh7EtJNimiI/MUjkpHdCqdhzcoPvDjZcIryjuUooM7yP93adW0U2TImjCDJZcy7YA+zHMBZHmr3XY5WcSc=
X-Received: by 2002:aca:ea82:: with SMTP id i124mr2623012oih.153.1566457675331;
 Thu, 22 Aug 2019 00:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <156630449239.17444.11157306180861080402.sendpatchset@octo> <156630450374.17444.10813153921641289392.sendpatchset@octo>
In-Reply-To: <156630450374.17444.10813153921641289392.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Aug 2019 09:07:43 +0200
Message-ID: <CAMuHMdX2MLeAHGMCAcsc1CnMrUYfJzsv4ut=dn435B8Zw_49gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: timer: renesas, cmt: Add CMT0234 to
 sh73a0 and r8a7740
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 20, 2019 at 2:33 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Document the on-chip CMT devices included in r8a7740 and sh73a0.
>
> Included in this patch is DT binding documentation for 32-bit CMTs
> CMT0, CMT2, CMT3 and CMT4. They all contain a single channel and are
> quite similar however some minor differences still exist:
>  - "Counter input clock" (clock input and on-device divider)
>     One example is that RCLK 1/1 is supported by CMT2, CMT3 and CMT4.
>  - "Wakeup request" (supported by CMT0 and CMT2)
>
> Because of this one unique compat string per CMT device is selected.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
