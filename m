Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F791B495
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 13:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbfEMLNa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 07:13:30 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:36961 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbfEMLNa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 07:13:30 -0400
Received: by mail-vk1-f194.google.com with SMTP id o187so3191674vkg.4;
        Mon, 13 May 2019 04:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/pd5isyFpDeE3AyBnCUJiWiqlznT6f7kJ6kW0m/JGv0=;
        b=DgyZg9ozrEcJ/EnUGFSHoV8IdZEN2HlUrfFlXmK/lp9ZyepLBvsECfsnva1TSv3XZu
         g72eABAwyL8RwofvIT7KLlu9dFFACmhYsBtKIzOyWpmXVLdfoWuGv4vVPhuii8nqRVTP
         nHNG8tM74jU9HXp/oayGop0mSSP3xx6h9I6kGwyZmdb+w5Ae65UQGMxka9+Q3zpQUK+L
         AYUg0vvdh5/q5pVCywqtMJoIrZWT5s8dtSnJXQXP0VjAPdSYJhs+KRTJuoO9yPqESRYu
         E/btcqLrhTgzf/82yMbjK5IA828pB41DtfjqPDZMB+8e6InUFz9Zuu319CpPALPNE/6D
         n/2A==
X-Gm-Message-State: APjAAAVgyPeZOwbHD0tziHMX/wxH0TjEdNAmndbMzqd4EO3CR8tfAApL
        yU7aNN01iTJ9cCCcBQkoh2eJcxKBJwDTxiY5Ohs=
X-Google-Smtp-Source: APXvYqzGQGneFk2qC7z1BupEocV/I1PZSWp0WeD+iIZ6EKW9Py9AqeGvI70MJa2R3Izqb6b5XGD0VkEuo5ymCAzpPZc=
X-Received: by 2002:a1f:3dc9:: with SMTP id k192mr3729750vka.74.1557746008863;
 Mon, 13 May 2019 04:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190506194233.GA32430@vmlxhi-102.adit-jv.com> <1557413011-1662-1-git-send-email-george_davis@mentor.com>
In-Reply-To: <1557413011-1662-1-git-send-email-george_davis@mentor.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 May 2019 13:13:16 +0200
Message-ID: <CAMuHMdUCcxfVdY1PqfYRZMjHN2eP_-NAsniCY39XyrDysAu1Pw@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: disable DMA for uart_console
To:     "George G. Davis" <ggdavisiv@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "George G. Davis" <george_davis@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi George,

On Thu, May 9, 2019 at 4:44 PM George G. Davis <ggdavisiv@gmail.com> wrote:
> As noted in commit 84b40e3b57ee ("serial: 8250: omap: Disable DMA for
> console UART"), UART console lines use low-level PIO only access functions
> which will conflict with use of the line when DMA is enabled, e.g. when
> the console line is also used for systemd messages. So disable DMA
> support for UART console lines.
>
> Fixes: https://patchwork.kernel.org/patch/10929511/
> Reported-by: Michael Rodin <mrodin@de.adit-jv.com>
> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
> Signed-off-by: George G. Davis <george_davis@mentor.com>

I think this makes sense.  In addition to OMAP 8250, the same approach
is used in the Mediatek 8250 and iMX serial drivers.

Regardless, this is definitely better than removing the "dmas" properties
from DT, as DT describes hardware, not usage policies.

Anyone else with a comment?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
