Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04D72E08D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 11:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgLVKcH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 05:32:07 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:36867 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgLVKcG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 05:32:06 -0500
Received: by mail-oi1-f175.google.com with SMTP id l207so14314028oib.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 02:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FkW/WVSsRPSDyalC7/XMWf9sIHBqA1mG+fou6FQeT3M=;
        b=ZnCwjlPOTzfkWHhEro+2tYUF9dGOEMCIUW97nZXKt7QHS3BDkXV2N+UHM+ea57zLS0
         hzo0bld24wRz8+1dKeu/sUL5vXIpCmJFtEb1zCPtcQX7uhVkQsB56zILcI28HaeGkn/O
         UyRZgzaU5uFumEFBuAdPQtN6QRJ8JhhQBomZBGnPjGVFg7UTkYvhZcmKaL0dpb4AbhDB
         MqTHlhMf6CKWfazmw9nF6p5n+j/UsxYpv0B4wgKJBsO2daDz0SNHLkiGvwF1mU3hQOzf
         oO7vxS1CZLAYc3eTn1JnooCZmBDE4w0S/htMinOygTTis2+UxIIqil7gwzAZ+8dhPNxh
         KYhw==
X-Gm-Message-State: AOAM531CC7u6Lh3PZTquUXQWALWecd0SxEek/GRO9s+h4zOHXYG7d2Lo
        fwkmgaoUN3YbPICRUC1r15RPPmv3AWMtRWb5fgY=
X-Google-Smtp-Source: ABdhPJx8pY6LoXQ1RT6Wg3sVmsQ/jCtW0JN3RYqumfQDcUMuxHa6U78pKyKeglcoeUALqhWp6s9sDmA9aDMPHvo5tfA=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr12558054oia.54.1608633085310;
 Tue, 22 Dec 2020 02:31:25 -0800 (PST)
MIME-Version: 1.0
References: <20201221165448.27312-1-uli+renesas@fpond.eu> <20201221165448.27312-2-uli+renesas@fpond.eu>
In-Reply-To: <20201221165448.27312-2-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 11:31:14 +0100
Message-ID: <CAMuHMdWFdk234Mnt6HmJM+sHKdRZu34oS5MVqtJwz0HXzqNr1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: renesas: implement unlock register masks
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Mon, Dec 21, 2020 at 5:55 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> The V3U SoC has several unlock registers, one per register group. They
> reside at offset zero in each 0x200 bytes-sized block.
>
> To avoid adding yet another table to the PFC implementation, this
> patch adds the option to specify an address mask instead of the fixed
> address in sh_pfc_soc_info::unlock_reg.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

My comments for v1 are still valid:

Perhaps a comment should be added to sh_pfc_soc_info.unlock_reg,
to document this dual behavior?
Or should we just always use masking, as that seems to be suited
for all SoCs using unlock_reg?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
