Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9F902C197
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 10:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbfE1IrX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 04:47:23 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45847 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE1IrX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 04:47:23 -0400
Received: by mail-lf1-f67.google.com with SMTP id m14so713643lfp.12;
        Tue, 28 May 2019 01:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0BZhFw5XvENC9DVo6G2yJZFwTXeqFKPCts0weQ9ljkI=;
        b=HOv8hRa8eKGdWa3ZFhPyXXbuCLMej58nOh0pVUMVa/SzGe0woh1WUiRIXwE0bolYUP
         C4DvImEMIFXzf4owFZBsf1rePD1+b8kuMgBBQpbXuEbMR+b/iewBO77RtUcwYc59ih70
         A+2jfgHHg9AdYjZ7ZT6Sn3H/90oZUJJPU0KchrzFD32q1ZVKx9xYiTiZ79zLbItiUgkf
         qcom/cU88y4Y6CFawTkxA3wX7n9VZPPQ7KpJO8n4GqA8JG9vh0TJsQjuP4TGkz0zbF5R
         2Ub4JhfW+9gzTfz3x+nu3VUXPxM+OrGr10RGCXq8vUdpRI8jKBL5R4UU1L5Y1l63xq3/
         mekQ==
X-Gm-Message-State: APjAAAWIbgyw4CJCQCqBTnfk/NR05K0E9u4STdlfFRuB4pjjKILTTPvR
        OE3FYbUfy/xF4e+ppy5Q30GbszIRg+F2/zlg/bk=
X-Google-Smtp-Source: APXvYqz/XHyUYD0KGucZO3XZHqTc09FsYgJppemKQ5vPmF3Z0Q/btUW/O0mFABcdosXXMESX4LvPI0u0MUcKU1B9Gew=
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr9783021lfm.87.1559033241102;
 Tue, 28 May 2019 01:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com> <1557997166-63351-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1557997166-63351-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 May 2019 10:47:09 +0200
Message-ID: <CAMuHMdUeRmE0k9EwsObRPjB4whiRokr1OTAWVgv7DBREoO0Etg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774c0-cat874: Add BT support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 16, 2019 at 11:06 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch enables BT support for the CAT874 board.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
