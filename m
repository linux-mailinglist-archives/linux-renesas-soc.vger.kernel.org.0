Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E6066BBD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 11:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjAPKh1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 05:37:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjAPKh1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 05:37:27 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE3917CF9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:37:25 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id r15so1046666qtx.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/shpG2ip1H3IgJyO/89q4XJU28bYEWOGcTj+I9rsi4=;
        b=t83qB/JJOsAj5nZqssDF2zj2MVDblGHjyjApROB7DFj7F9AybTtQK7FHF5wQ7F9EuW
         gjQowEN9GboGN2/OUIf5LCIZ88XOcjq2HCJdbB0QGlLRAiIRpFzCGu6mShLsYXmiv6hM
         GVlKrz88g/6Yi4j2VloXLkTUk6zgJZBBKWO0ZGEacpek1LauSWjtmdnU+Xe6biEgcScC
         EUIww0A/6oHPjYj3zgHUD5gzHrM/gtEjMyLVDOfDcJbEzvSFcKmlewnxRqBsveY7gR1F
         TzWpXS+9xeoKwy/RQ7ZTZciiwjBnD3Jqifa9eKXw/+jQkRoH11eHDI5GYw2i7pdZxrxT
         O+QQ==
X-Gm-Message-State: AFqh2koiIlHZOjpCaBW7dLq932IgErPZPGarXH4/MWAWf/xNG/RIURup
        KuJSyXBTWT7UNXSEu1iBnmxnoIrVGpcH4A==
X-Google-Smtp-Source: AMrXdXup1Ddh1cZZ7XpgruZnUZdRHXmBMxvfM4N8WxYwp9FYzyn5KZ+ii1N6ObJmcsMxbI5dzWOD1A==
X-Received: by 2002:ac8:4747:0:b0:3b3:560b:353 with SMTP id k7-20020ac84747000000b003b3560b0353mr13186635qtp.63.1673865444567;
        Mon, 16 Jan 2023 02:37:24 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id d8-20020ac84e28000000b0039c7b9522ecsm14452068qtw.35.2023.01.16.02.37.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:37:24 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id e202so6376226ybh.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:37:24 -0800 (PST)
X-Received: by 2002:a25:244f:0:b0:7d5:b884:3617 with SMTP id
 k76-20020a25244f000000b007d5b8843617mr577561ybk.380.1673865443943; Mon, 16
 Jan 2023 02:37:23 -0800 (PST)
MIME-Version: 1.0
References: <20230114225647.227972-1-aford173@gmail.com>
In-Reply-To: <20230114225647.227972-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 11:37:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkTz7_7_LkddK86d7r+EL3R3E+iOmq0zfsDxG1pCXGGg@mail.gmail.com>
Message-ID: <CAMuHMdVkTz7_7_LkddK86d7r+EL3R3E+iOmq0zfsDxG1pCXGGg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: beacon-renesom: Fix gpio expander reference
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        aford@beaconembedded.com
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

On Sat, Jan 14, 2023 at 11:56 PM Adam Ford <aford173@gmail.com> wrote:
> The board used to originally introduce the Beacon Embedded
> RZ/G2[M/N/H] boards had a GPIO expander with address 20, but
> this was change when the final board went to production.
>
> The production boards changed both the part itself and
> the address.  With the incorrect address, the LCD cannot
> come up.  If the LCD fails, the rcar-du driver fails to come up,
> and that also breaks HDMI.
>
> Pre-release board were not shipped to the general public, so it
> should be safe to push this as a fix.  Anyone with a production
> board would have video fail due to this GPIO expander change.
>
> Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Update compatible to reflect the part change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
