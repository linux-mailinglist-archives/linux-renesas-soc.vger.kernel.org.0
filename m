Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC2B23272
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 13:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730351AbfETLbv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 07:31:51 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:34579 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730302AbfETLbv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 07:31:51 -0400
Received: by mail-vk1-f193.google.com with SMTP id d7so3768859vkf.1;
        Mon, 20 May 2019 04:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lABXrm/svo69ZtFS6Y2mnzVSLQSMWNtyd1WWYIE0BkA=;
        b=AvzOmSlA1JvYO1RLYA4GCwDTccV6nc0dnu7gHrrgBN5J49kOn0soPtYVXO8naK6uwi
         QzfKvDxUV/kF5JpCWGffAjmFTUDKXK4+Vf0raEGGpxS9fma/Ywq2vFrd+G31CcmSLGYW
         DH+OFm2+R3S1SzhKp1CxsxTDjtHGMVRSs96HONENe/ZF0d/1p9zVtqcDaKfjYf2sYLFT
         OQeFO+BIcD1NIJETiowAuqkI6bpqDMUCRXqRfiJQ3qY0t3m3IBkuax2gGJAOnwNIpCCZ
         U2LsWXYYjbUZr+loadwvAcUTCa7uHtzo5mA4LnfOcl0olrJybCwCSkfsQ9nFXqTFIJg2
         o/Sg==
X-Gm-Message-State: APjAAAUkwdUy6T2DTq36KlULCaibrp+oW/v7ZxcyKx4i5nSuxKs5Ia4o
        gA9G50sQtarK9IsODXvAmS0SyMF3eFJvzHyX6KE=
X-Google-Smtp-Source: APXvYqwsNHtkxGyBmPVDINeMxQ1OYovTV/YHuXmqDktOe6kWI14vRPeIuwNupkAD7TNMWyJyyWT4H5UQAaGfE2EqfR4=
X-Received: by 2002:a1f:2fd2:: with SMTP id v201mr6282374vkv.83.1558351910292;
 Mon, 20 May 2019 04:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190520093446.30895-1-wsa+renesas@sang-engineering.com> <20190520093446.30895-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190520093446.30895-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 May 2019 13:31:38 +0200
Message-ID: <CAMuHMdXJmYUq37fyPQscrYpnZcxEncCm0soi8qdGEqa+NYmHng@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/3] regulator: da9063: platform_data is gone,
 depend on OF
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 20, 2019 at 12:46 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> With OF being the only configuration possibility left, depend on it to
> simplify some code.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
> Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
