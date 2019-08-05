Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 647478208C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 17:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbfHEPmT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 11:42:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38579 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfHEPmT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 11:42:19 -0400
Received: by mail-wm1-f65.google.com with SMTP id s15so52133420wmj.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Aug 2019 08:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JHB3YRpbA21rEsaEiwqW6v/ZPe4iBbBAdrfJyabclTk=;
        b=UFpYXij6vTL5dcy/sSgieI9oMpMsssNxydC1z0S/GRexllJKEJydzNMMJIGi6V7PBt
         wjVDY7mExxeVcD4m45pRFwC405VkBdPcuwt7aWF1fUK3tf8wGH0+vpjIZriG66kPIFhj
         6TfiFv9+w/xi0bqSdcBr76iYyPn05hGfWMQL2+pMxGUPkrLzjAD4Ir2fZa+ECdXJmsrn
         3kBSO7UIsm3C9Wunz5qcDFvT3Bzd0m7TB//QQ64lobroY1SGy8yPMkwOdkkbkTuqmvL5
         87EU0TXesH95Sn2JOHv7Rbg8DEabv24NOJfqoeTOYkEOriU3UG4Joa3HIdkmoDCCJrhN
         A/HA==
X-Gm-Message-State: APjAAAWKa7Rw46iOhxLoQToWDawRMeGYIlHlVDIOWc5ufjaA4q83pd5e
        lrZ6CYOQ9PRT7o686W8IO7oGbOsa5xhjsSpCpGwTrw==
X-Google-Smtp-Source: APXvYqwGH0WxwiEM4rEv8gjyJAJpqpLcNgB8hwXg5oELB5DdDMcoSoZElVYpCdaot1+js1CzioCzjU28Ess+5w/dpqk=
X-Received: by 2002:a05:600c:20ca:: with SMTP id y10mr18649465wmm.72.1565019736805;
 Mon, 05 Aug 2019 08:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <1564669414-22553-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1564669414-22553-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 17:42:04 +0200
Message-ID: <CAMuHMdXodj0-FL9hBP-wO77H1JnVH7hV_9ayZwm0_N3+7=w-sA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980-condor: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 1, 2019 at 4:23 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
