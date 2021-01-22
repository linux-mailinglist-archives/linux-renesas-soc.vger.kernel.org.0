Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B070A30009D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbhAVKo4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:44:56 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:46993 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbhAVKke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:40:34 -0500
Received: by mail-oi1-f172.google.com with SMTP id q205so5450854oig.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 02:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iD8HJa+xv5WQtBM9V3lSEqSHOkYKZaNeU1Nqn3jtyZ0=;
        b=OXEmDGQxkyy12rPYouUg0kw9sp6pYEbAuG/A80TiYgsWC4OjqeyL2NO+DLuMVTadi6
         NTK3XQPkBrv0TfQOsF6y9i6gMHFSmvNjWbs3I+NtWnW0nwWZkzvjwXvhbHnNyWyhtB6g
         Z0SeHvQgTVKtUvhY0CpB7xgKb1JcUK8Wsmb6kSNxsnnQ5Q5eKz61OuVwS+FMInWhH7Lq
         IrdITOqllNbb2J3lirMl1EnWH3RRggC6xBnIp8OFqGKLdMX1IfkYiYvTE7+74Kj6kxSH
         brPv66e7bQC0/twHigG54J5cF20gMxk+q5Me3pH0+WfjLqm1hh0+kyGp09OFUDVq/yGt
         dQew==
X-Gm-Message-State: AOAM531oAUuKi7amLthazME+77/FaX8X/cQkL2fzks1VLpGYn25uyFJH
        MXDWloSSDKf1IyLPr9wQ53clY2eR4MdQSlIfd1RzjiZe
X-Google-Smtp-Source: ABdhPJxggZlc4S8Z8vRUQXwrtJ2qGtAJQQ83q5vRFvchyqdhVHrMAFJKiw/NFz0YPhT0CXKlCj7Oq06H2nRxVrrK+zY=
X-Received: by 2002:aca:bbc4:: with SMTP id l187mr2768830oif.148.1611311990359;
 Fri, 22 Jan 2021 02:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20210121110008.15894-1-wsa+renesas@sang-engineering.com> <20210121110008.15894-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121110008.15894-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:39:39 +0100
Message-ID: <CAMuHMdVZ4M=m=+pgwUY4Cuc8PUt8JJpCchk7mDuvmg9Km-zuQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: r8a779a0: add & update SCIF nodes
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linh Phung <linh.phung.jy@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 21, 2021 at 12:00 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This is the result of multiple patches taken from the BSP, combined,
> rebased, and properly sorted. SCIF0 gets DMA properties, other SCIFs are
> entirely new.
>
> Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
> * fixed sorting

Thx, will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
