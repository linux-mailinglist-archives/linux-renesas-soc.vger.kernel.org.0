Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095CB2C243C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 12:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732380AbgKXLfC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 06:35:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732174AbgKXLfC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 06:35:02 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1ABC0613D6;
        Tue, 24 Nov 2020 03:35:02 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id r127so15209260yba.10;
        Tue, 24 Nov 2020 03:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JgILikoCHUCT1Af09PTpbLerrxquUF+HoTrhcOAsado=;
        b=n1yqbgzwcyROVAhQQn2tNQ4aKSWXH0egS7XGszKXlfypB1WhQj8qkXeZQpFgksDbRP
         lvkl2BT8c1IxTGKR5iI27CRt5oBtA4BSX/+QZKxSRT3DoMQXntuV/MwYlPxUd/5X1tHN
         gKrsUibfRLm7V57QfYP6YGad6ZFudwNsIfu80wlIXcJZGyb0Ll1i72smRUCwEcKMUqzh
         yoKvnQ0edM6nJ0dUS3gXgxUwwl6nl1uBt/HDK0NR+MbYx5BNMWJbUv9yk9sQ8HcMhHYu
         0+dtuSvfx9B6HCs9Cckl5SswEHZAS3L1qbrc8EGbCHRBD/HTmLKdmvk6c1bkXcjqIt0T
         Ejig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JgILikoCHUCT1Af09PTpbLerrxquUF+HoTrhcOAsado=;
        b=IeS0FGCB6RkAkvYzj6qRGntX2+wImGSh4c8C1mzWdiTaqLv9rJPdhA7EiIMmcAC2uo
         w6FyEpNmSH2yOAxXVnlLLSG2wW4u67DZK750XZZxsp+ErUyEu4xfABPovcWQwXOxakbM
         jpbA8k+fLJbJt79t6D/HnWUL/f0QUi5Q4q2t1TRAKKMbNW3ATvmGckIG5V/HkQH5BvUg
         VN9/p4CfPJuGP01UzNhEo3Sp7MLARVh3GlFIin006Tt1L9udeuyJIQwHdN/dUj00sV4W
         H4KiDC3hTwXkJGay2unEGbo9xr4hd09xp+8Y1jEdK6E5+UT9xQTfjtnFSEeofDjJzGqg
         PVEg==
X-Gm-Message-State: AOAM532Q6sfn6iz7YEqG0hkGfirQGv1UzIlQzjplhdQaifKo6A/ySiEy
        tJrirndwLmzVMFl2DwSsWAjKUddJCXxT3Ftc6j17jOTmy0wqkA==
X-Google-Smtp-Source: ABdhPJwsy+FSGLLygxj9TpEKS7K7IlatZ2yFKTNDBYB5cSpW3RBTnJelwdNlnO81EVofJYVt7DD/ApRu+6n/xiLjexQ=
X-Received: by 2002:a25:6191:: with SMTP id v139mr7248891ybb.76.1606217701071;
 Tue, 24 Nov 2020 03:35:01 -0800 (PST)
MIME-Version: 1.0
References: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 24 Nov 2020 11:34:35 +0000
Message-ID: <CA+V-a8v5iUcK6Hh=3rPiWbFs32U1TjPqT4AuwQniSFguk9-9bQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] memory: renesas-rpc-if: Trivial fixes
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Tue, Nov 24, 2020 at 11:26 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> This patch series fixes trivial issues in RPC-IF driver.
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (5):
>   memory: renesas-rpc-if: Return correct value to the caller of
>     rpcif_manual_xfer()
>   memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static
>     inline
>   memory: renesas-rpc-if: Export symbols as GPL
>   memory: renesas-rpc-if: Avoid use of C++ style comments
>   memory: renesas-rpc-if: Fix a reference leak in rpcif_probe()
>
Patches sent to sergei.shtylyov@cogentembedded.com have bounced back
so including gmail address (patchwork [1]).

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=390163

Cheers,
Prabhakar


>  drivers/memory/renesas-rpc-if.c | 28 +++++++++-------------------
>  include/memory/renesas-rpc-if.h | 19 ++++++++++++++-----
>  2 files changed, 23 insertions(+), 24 deletions(-)
>
> --
> 2.17.1
>
