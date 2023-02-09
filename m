Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA740690E53
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 17:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjBIQ1o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 11:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBIQ1o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 11:27:44 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17BB5C8A2;
        Thu,  9 Feb 2023 08:27:42 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id 5so2509705qtp.9;
        Thu, 09 Feb 2023 08:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1tmcGPfgBqwmSMisPm12Dql/d+jNcJgFXbFklszrS4=;
        b=KOKZ5DlKvS8XdqLSq2i6FQKOvXNjUWh0enOHKv7F/dM/5Bw2yRLYCQjhXGmxgptp4o
         jkZY2ooMz9KPh+AQT7MgzJU4nlD+yUNHRarL/g5VV8Bziqw194TphnE58iveL1c87/kd
         9oZokuLmop1GslXJA8HnM6mQI+b76IaPUKizUxvOfjV/gnRyHQKRw4E+f3VZZN2FpYXx
         kDZqJ4OVed7X81/HPMwbC+Q4w+IapjLnLTI2t5kne59tFAaNvhQQrhgqzjp3JgQEN0UY
         Tct9D4iPgvzxFUx6wKf2KIO3lCf90oYDzhrkT8tsxHpyFSGdhXPEmpvI4JVucs46/FSD
         ys+w==
X-Gm-Message-State: AO0yUKVlhbNcJ+uOtYH+W05ga6rx5rIxmSxVVSDWbp+WmDVmepTuZLSW
        yCvYWwT9uliicX2uc8nOOvBJ5l32SNEkHqDO
X-Google-Smtp-Source: AK7set8jnnxAYqIfcQz7An0JXM/3cIWEsU3lt+Ug6ZEbgoQ79M92+pRS0wuNC8K/XJcdldSSyF8hOg==
X-Received: by 2002:a05:622a:589:b0:3bb:7c6b:9cb5 with SMTP id c9-20020a05622a058900b003bb7c6b9cb5mr8503989qtb.27.1675960061621;
        Thu, 09 Feb 2023 08:27:41 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 194-20020a3707cb000000b007090f7a4f2asm1630188qkh.82.2023.02.09.08.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 08:27:41 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 184so2985227ybw.5;
        Thu, 09 Feb 2023 08:27:41 -0800 (PST)
X-Received: by 2002:a25:5d11:0:b0:839:c329:be37 with SMTP id
 r17-20020a255d11000000b00839c329be37mr1292454ybb.89.1675960061232; Thu, 09
 Feb 2023 08:27:41 -0800 (PST)
MIME-Version: 1.0
References: <59461effd0d9f7a39e0c91352c87f2b7071b1891.1675958536.git.geert+renesas@glider.be>
 <Y+UeCSo7y7nYkkB8@ninjato>
In-Reply-To: <Y+UeCSo7y7nYkkB8@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Feb 2023 17:27:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPTMBD=BoEF7Comx4s_4V+ZGEk4ywiMDDtSzhg3sS5aQ@mail.gmail.com>
Message-ID: <CAMuHMdWPTMBD=BoEF7Comx4s_4V+ZGEk4ywiMDDtSzhg3sS5aQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779g0: Add thermal clock
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
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

Hi Wolfram,

On Thu, Feb 9, 2023 at 5:23 PM Wolfram Sang <wsa@kernel.org> wrote:
> > make the new value fit.
>
> ^ leftover?

Indeed. Consider it gone.

> > Based on a large patch in the BSP by Kazuya Mizuguchi.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
