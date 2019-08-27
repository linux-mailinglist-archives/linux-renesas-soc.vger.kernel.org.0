Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B15199E577
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 12:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfH0KMz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 06:12:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36300 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfH0KMy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 06:12:54 -0400
Received: by mail-ot1-f65.google.com with SMTP id k18so18151684otr.3;
        Tue, 27 Aug 2019 03:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zXr/N6UgFoqBhJXBYPum2Xxi7qT4YPGKDkbFVNt1Z+s=;
        b=KPm+o1erW1sfPs4eZTzXIx4GddeLHevApj/5Wzi8QYgxB8ImMxLIDCkCZcTnrTk4dT
         sntEphXsz44LKHvyCJqDMNVcAYg/PTPf77vaeH0szFMOzMruw/eUI3GXBFJvZltr280Q
         m96XpBkpiGN+Bb3Fdxcfsk8Q9GJ9zLa43QDIu5GOgWqnJMrwJYqXIQrNj8g3R9izIc7Z
         qkAVLO1uxayx9/et5G3o1t/E2lIox98wb9JPEqPXQU2fHKEpATHCSlTjrqceQmZlMJrP
         D24UKU0unBaw7yhVqg/REPGw0nBtEyKgFOw/oNvvQNdov4t2HnbT5zQ58FesQBubMaDM
         3ygw==
X-Gm-Message-State: APjAAAXSA3RMYpavied+fDyPGVNQ/r0NUDIfe6Ojx3Ahgpx77jKe6jR2
        NwL2qcqHvNSGEIn/Z4oTVMzmzgWbKZ+HcLg17Eo=
X-Google-Smtp-Source: APXvYqwQjA7AvGiWHLmEQWgX4aad74lTLZ6g2giXr2GRvvfGYJpyeYuiAjBgoZ9EQiYgJBi6q8v3OoelPEM01eljDUw=
X-Received: by 2002:a9d:2cc:: with SMTP id 70mr16177733otl.145.1566900773750;
 Tue, 27 Aug 2019 03:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-4-jacopo+renesas@jmondi.org> <20190826224337.GL5031@pendragon.ideasonboard.com>
 <20190827095508.lpp74fh5capobvcf@uno.localdomain>
In-Reply-To: <20190827095508.lpp74fh5capobvcf@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Aug 2019 12:12:42 +0200
Message-ID: <CAMuHMdWzUcpER2baZU_ysQeSKPA2AQ_5892+uJiUxsyvTYDSvA@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] arm64: dts: renesas: r8a7796: Add CMM units
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>, Ulrich Hecht <uli@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Tue, Aug 27, 2019 at 11:53 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Tue, Aug 27, 2019 at 01:43:37AM +0300, Laurent Pinchart wrote:
> > Should you squash this with the patches that add CMM units to the other
> > SoCs ?
>
> I don't know, I guess it depends on Geert's preferences. Geert?

If you add it to all supported SoCs at the same time, a single patch
makes sense.

Acceptance will mostly depends on who's at the end of the arm-soc pipeline:
Olof would prefer a single patch ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
