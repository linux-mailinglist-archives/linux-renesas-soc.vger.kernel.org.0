Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37189691F53
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 13:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbjBJMuq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 07:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjBJMup (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 07:50:45 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227F66359F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:50:45 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id cr22so5483553qtb.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L95h9tqeS4PFF9qMDM1NmOEAr9KYqANlMfR4/IAFuLI=;
        b=nqaAZVonifE2O1/OnwDZzHoRcwrE7Q2S7KIXqXhLDHWPtv39K0wzxKlYCQ3kr/Sy1e
         ab1jDzzFETciFv40aYEFzREzTbNRv6WE08Lx1Tu54Q9vq0ggt0d5awVygRcr0zxeCA/h
         dBRgxSwe0OI1VemB7D+5RVuexPr+5oNJKi2Evliuj6MjnzS5dI5UPRThBiaEUXu9PH0Y
         eC9mWMuwmCJ+a1pAa7o7kxDsiN301XyM5VflG0emhiL5L5ozdhU+tEgdT4RWOm/wc3rC
         1qw2fx7WjDpYpMmQpP6f334pxHtYcXUeqyBV6g4pN4Wvzle6Nrv3mM8ZbuthWvLNgmS6
         bIMw==
X-Gm-Message-State: AO0yUKV1iD2sXOYBSauPTa34uZRnu2lDq4aalb+6d7y/P/LA7uUBXPZx
        84SkaU2azWDd9cURQN4XAPPajy4qsA6+Aqw7
X-Google-Smtp-Source: AK7set9/HEo+TaN76ryNcLnoIDYDzond+fXkvc7kSR+G7csSB7+lzx5h8yO8Hgsb16mWoPXnwjWYew==
X-Received: by 2002:a05:622a:1488:b0:3b8:938e:73b3 with SMTP id t8-20020a05622a148800b003b8938e73b3mr24896410qtx.45.1676033444144;
        Fri, 10 Feb 2023 04:50:44 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id p205-20020a3742d6000000b0072a375c291csm3510944qka.30.2023.02.10.04.50.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:50:43 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-52eb7a5275aso55974877b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:50:43 -0800 (PST)
X-Received: by 2002:a0d:e004:0:b0:52a:7505:84bc with SMTP id
 j4-20020a0de004000000b0052a750584bcmr1573633ywe.383.1676033443494; Fri, 10
 Feb 2023 04:50:43 -0800 (PST)
MIME-Version: 1.0
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com> <878rhganfo.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878rhganfo.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Feb 2023 13:50:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWnRKAqgCakAOaEY57KqNxjDajx_-7EKuL3H8zqkKDfFQ@mail.gmail.com>
Message-ID: <CAMuHMdWnRKAqgCakAOaEY57KqNxjDajx_-7EKuL3H8zqkKDfFQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] clk: renesas: r8a779g0: Add Audio clocks
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 2, 2023 at 2:03 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds module clocks for Audio (SSI/SSIU) blocks on
> the Renesas R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
