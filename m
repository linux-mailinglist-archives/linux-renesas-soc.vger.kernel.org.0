Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EE22D5A9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 13:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgLJMfZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 07:35:25 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34528 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbgLJMfR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 07:35:17 -0500
Received: by mail-oi1-f194.google.com with SMTP id s75so5560505oih.1;
        Thu, 10 Dec 2020 04:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SbywUHfxiOfCKevo8kgPT+2gmwbtXlw9HIdds9wF3Wg=;
        b=M4S0R9xiZ0aluQOYxv3QKwAjGjmL0iFXe6903GLLtAe9KNAygoV2/RnEM45lUz9k5a
         wpZjKvPzgCgEjJn7ar9peEJ+HoVuvbDy/iseg8hz4kWN7iyQLhT0pJ9q8urlEq58YD78
         sgXy5CCHedNdP+djcDiiBMNf6RAmbNAS2E1updpfpYokpLFxMifAUqvmn0zEiB03sm2N
         MEiyRlSCj5jhawdSlYWmtHus8Hc4rvTKz6MsQ2lWCBQ5K46CquVYGBZVv8YKm06rrV/X
         RFhWQTE66IKpHfnJnPTIytwpX40hBK9x53MRbFZPBrkVuBkG9uww+PIjptGYYVBzc1h/
         lWjg==
X-Gm-Message-State: AOAM530me3AJQ/X5mrHK8wISzm5S3vdOfkmZLCPeuIqgvgN90MWrD/tv
        DIUMJGKjYM6GbWRiVFaSylNT83jkibXoLTC8zt8=
X-Google-Smtp-Source: ABdhPJzRH3PbL9eLmMkNuizUAgXfdwLcoyUTPylrvU0JooERkKjWQIcZE/fkb7GF8FUbWZOg5ZwIehjPy6+b6Zdxdo8=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr5146305oia.148.1607603676957;
 Thu, 10 Dec 2020 04:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20201209195343.803120-1-niklas.soderlund+renesas@ragnatech.se> <20201209195343.803120-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201209195343.803120-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 13:34:26 +0100
Message-ID: <CAMuHMdV=8a=yJeVRorrmiPQrYj7JRN26uJnxL3SanbQoi5-wnQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r8a7796: Add TMU clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 9, 2020 at 8:54 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This patch adds TMU{0,1,2,3,4} clocks.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
