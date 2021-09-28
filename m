Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB6B41AC32
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 11:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239940AbhI1Jrr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 05:47:47 -0400
Received: from mail-vk1-f172.google.com ([209.85.221.172]:33772 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240037AbhI1Jrr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 05:47:47 -0400
Received: by mail-vk1-f172.google.com with SMTP id t200so8223526vkt.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 02:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4r120zdTp134tNi2QfhkMou/f/QEPRfnVLXZJx1SLsg=;
        b=VydENh8OWTFkzDl3sRy0gJl27NrrxrnCKgEq+6Stau+3U0heayn9bXaX8ub+jZ88nX
         IKB6Jjq6oElJGlmXc9iUaV2+FkPn8LFpmToS8mgHYsSHAC6yPKAK4JQD8U9DkJDyIYF6
         QC8PxuggULpYW44xjDiOvSgj3ecwxAqfJBiyr+Ky3aXmGIori5V2tqCZ3HBddGd3jUgn
         VdgrRHYY6R/nSigySbQAD3wnumwmHk61upIYlNkd251rF8SwSufBwKTq6gNN/zO5b/eD
         qN4qtksh2oLDAydOuZs71Mb5e/uMFfV9vTOzf7ePAclUXPwVoXLHJTmYI6xCTDMMY09a
         J8kA==
X-Gm-Message-State: AOAM530BWmcHkku2wIEMuEvakE61rS9ouwKZcOsfw5c6Cz/u66bN+UBG
        JCQ7lVIqsFo9JHCoIsCtEs5cbWtUi3KNRu2vUp+P/2AG
X-Google-Smtp-Source: ABdhPJxl4GbrsCLthmZxi5sO0Rm72lEhxVUIaRbQ/bbZXXxXy2fAnshv/CxlV3IwvKg5Tuo08gKw/Qm1XBXBxQYY6iY=
X-Received: by 2002:a1f:1841:: with SMTP id 62mr3686928vky.26.1632822367754;
 Tue, 28 Sep 2021 02:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210913065317.2297-1-wsa+renesas@sang-engineering.com>
 <20210913065317.2297-5-wsa+renesas@sang-engineering.com> <CAMuHMdWf0KpbNsFJqL81o6-Cpu1nn5ZFDEVdy7iPLkrMuXjGNw@mail.gmail.com>
 <YVLi5/QgUhuE6ls0@shikoro>
In-Reply-To: <YVLi5/QgUhuE6ls0@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Sep 2021 11:45:56 +0200
Message-ID: <CAMuHMdW5y+U4oOX5ohz86C3UkCduQ=xbbQTfugNcBoJ=Te4JMA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] arm64: dts: renesas: falcon-cpu: add SPI flash
 via RPC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Sep 28, 2021 at 11:39 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Warning (unit_address_format):
> > /soc/spi@ee200000/flash@0/partitions/user@00c40000: unit name should
> > not have leading 0s
>
> Oh, sorry! Shall I resend or send a fix?

As this patch is marked RFC, and still using 50 MHz, we probably want
a v2 somewhere in the future....

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
