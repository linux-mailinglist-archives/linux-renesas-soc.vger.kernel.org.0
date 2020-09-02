Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C671125AFFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 17:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbgIBPsQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 11:48:16 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39297 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgIBPsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 11:48:12 -0400
Received: by mail-oi1-f193.google.com with SMTP id r64so3939400oib.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2020 08:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=egO/SQ05qgy66EB4lUAykQc4/OhxLTv2XgS0XYQzvqk=;
        b=QxCaWtCJf0KEuEdMLiDC+axptlbGrrAQa1OrN4I4MtnphPZxRHNmX6q2QydZRiQYs4
         w06oAuLJkBHMeoCB3ypGNxzEZYlNHe4XUZ/LiIbtfcDd1bsmq04gTWtrOcNceJUAVRr2
         EbTKIGTYnti/e8ypH4Wa8ZI3Gs6wnBQf7/LaxAW56qo74eVHSD/u3r0rr2aLjr3CAIvw
         82KtKe2puXKm6U7Oj9z9w9cGKU9yrkE1B5X5D7fzZAMqUzrclVguM9Tf0PHCukPHS5E9
         hhp2T80ALATxVq3BAR1mJzhcOoWvhvR6SHWtQJd/TdtZFHDmM56gWrRVpFofjMFS9q+N
         wZVA==
X-Gm-Message-State: AOAM532EML0daWAe5bs8jnVNOhxAP76eKoS3TsUOM6ZxfEguLwuZBwJN
        bTQFeZ2Ot98CDFHzymyyty6Yo6TMafBKfNn7tHc=
X-Google-Smtp-Source: ABdhPJyJGmiz/9ls1sQ9gVP5czYa9yAUI+m+VB7dyOrZsumTeK+TuTtq4uJJjS1mReXXFhWAGdxMMgjm6CXjsAmswnY=
X-Received: by 2002:aca:3402:: with SMTP id b2mr2282531oia.153.1599061691512;
 Wed, 02 Sep 2020 08:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200902154129.6358-1-geert+renesas@glider.be>
In-Reply-To: <20200902154129.6358-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Sep 2020 17:48:00 +0200
Message-ID: <CAMuHMdX722bUNmZLjGi7qEVQdA4ODY5gZ-61SnMU+oiOqnjZXQ@mail.gmail.com>
Subject: Re: [PATCH] arm: kdump: Add DT properties to crash dump kernel's DTB
To:     Simon Horman <horms@verge.net.au>
Cc:     Akashi Takahiro <takahiro.akashi@linaro.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        kexec@lists.infradead.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 2, 2020 at 5:41 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Pass the following properties to the crash dump kernel, to provide a
> modern DT interface between kexec and the crash dump kernel:
>
>   - linux,elfcorehdr: ELF core header segment, similar to the
>     "elfcorehdr=" kernel parameter.
>   - linux,usable-memory-range: Usable memory reserved for the crash dump
>     kernel.
>     This makes the memory reservation explicit, so Linux no longer needs
>     to mask the program counter, and rely on the "mem=" kernel parameter
>     to obtain the start and size of usable memory.
>
> For backwards compatibility, the "elfcorehdr=" and "mem=" kernel
> parameters are still appended to the kernel command line.
>
> Loosely based on the ARM64 version by Akashi Takahiro.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

The counterpart patch for linux is "[PATCH] ARM: Parse kdump DT
properties"
(https://lore.kernel.org/r/20200902154538.6807-1-geert+renesas@glider.be)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
