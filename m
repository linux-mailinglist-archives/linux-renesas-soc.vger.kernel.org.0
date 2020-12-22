Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41ADB2E0794
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 09:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgLVI5N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 03:57:13 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:46479 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgLVI5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 03:57:12 -0500
Received: by mail-ot1-f53.google.com with SMTP id w3so11264208otp.13;
        Tue, 22 Dec 2020 00:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+hi/ka4i9bXeYc1+Vb0mJGVNlRFQ55N+aAyR5MG5+q8=;
        b=XlGBthUQ09IuCFqKaz9+8KgVKsgLebpKZJhimi112opDsCPQuJ0zkqF9YoG0vQzjIa
         tODwQ3krffIfuf6yfrBsDs0Bavn6YGBdjH33wr14BIJFIAnhBdm7nuZ/IwcJdEawEKxN
         pRQqTWI0NELrUgjaYd9PdP5u0WDPNql9BIimKhpvmLGEUPB3a3plDagQ/EgYrOG2FOOf
         emCt4mhxz44T+rNBlVqrAuNjyWs4F/TuZ6tOgdUgdaYmpYI6+2AEa5DqofxgkLeDBJGX
         cEtsl9lNiMMHIuKtsaJgULdZU8AqmuZ2tUK65w2XHdFlb+2V29qUPGT/YwAw/7422CMm
         bbJg==
X-Gm-Message-State: AOAM533ND2IJXbNrWBBB7eVHGD9+zk2K4U1wc4SEbIaST1JDIzcAumLs
        Hu6J32fh5X7h72vwJ6J8QtNOFkwiBvD7yKxKavg=
X-Google-Smtp-Source: ABdhPJxSRzUR+uXamSqHckFtqsA5DB6ShMGzGp62ctWPujtcxgcF+cWX6f+zugMpY0RFPEwMYHY12/IPErU/L3g5ycE=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr449654otr.107.1608627392066;
 Tue, 22 Dec 2020 00:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20201219143648.56217-1-wsa+renesas@sang-engineering.com> <20201219143648.56217-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201219143648.56217-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 09:56:21 +0100
Message-ID: <CAMuHMdVakxCcHxHR8_V+gLSyn4TXBWXb5YsBLN=7QJ+Yms-RgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: proper comment formatting in reboot handler
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Dec 19, 2020 at 3:38 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This comment was probably copied from arm32 and then shortened. It fits
> to single line now.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
