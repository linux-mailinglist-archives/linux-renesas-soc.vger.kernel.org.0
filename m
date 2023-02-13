Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBD8694D4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 17:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbjBMQvJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 11:51:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjBMQvI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 11:51:08 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDE66A46;
        Mon, 13 Feb 2023 08:51:08 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id ch10so13305112qtb.11;
        Mon, 13 Feb 2023 08:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81BoQ2T1CR+/whXjUJUBFbGfIbD8zAA5srmANKhgLXY=;
        b=jzUywvDTCaJ2Yape5if7m96DhjXmKJezR5Z1nhDHFj94rTRFZrcToZdUV/0eZw1Vdd
         ERkYCX87eZkMnLghhLu6uunxdJ32KbmmkNAO8a3+OTobedH1pCZR8bdUjUcXKZzNTxGX
         G8V9Wn7JJJ2KpfubJUHr440hcOFcJIHMuveQD4aPE3ta6gsuSoLF68LzZrjrzOaSKVIM
         4wAPzfF8QlTlKXJzyxlfrBVY/XxpxTEE52XQm+d6/Vu4TPCDyQQ/FFC8Qx9zha5N2q1p
         7Tqw6HUd3taBzfNCPX8MO6ExERHIv/STJr+1aw0ZcLmSgBmIhp74Wzyp61x58zXxKrhz
         lIEw==
X-Gm-Message-State: AO0yUKV2KUTMr1/wfZM4vj+YrpMWP2nGY8j5zr12pcdJru9jz2wCc1Ur
        4GbE2/l4hBwRZ7aTVvXpyxcSIhBDEZ5Vkw==
X-Google-Smtp-Source: AK7set/+cDHwgqxglS4jlxonc9ZMLEjetZ06nvbqc+5H95dvwaHpFiH0a1J9xTBiI8Mp8OW+dcJjQw==
X-Received: by 2002:ac8:5850:0:b0:3b6:3494:174 with SMTP id h16-20020ac85850000000b003b634940174mr47390406qth.52.1676307067043;
        Mon, 13 Feb 2023 08:51:07 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id o190-20020a375ac7000000b0073b45004754sm1951062qkb.34.2023.02.13.08.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 08:51:06 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-52f0001ff8eso72083797b3.4;
        Mon, 13 Feb 2023 08:51:06 -0800 (PST)
X-Received: by 2002:a0d:f846:0:b0:4fc:962d:7dc1 with SMTP id
 i67-20020a0df846000000b004fc962d7dc1mr2336293ywf.301.1676307066536; Mon, 13
 Feb 2023 08:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20230211153026.3898491-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211153026.3898491-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Feb 2023 17:50:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTs1uYuFACOJUdpshSNbSeU6WGb_49chu4UNhWMvgrhg@mail.gmail.com>
Message-ID: <CAMuHMdVTs1uYuFACOJUdpshSNbSeU6WGb_49chu4UNhWMvgrhg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77980: Add VIN clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Sat, Feb 11, 2023 at 4:30 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the VIN module clocks, which are used by the VIN modules on the
> Renesas R-Car Condor (R8A77980) SoC.

s/Condor/V3H/

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.4 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
