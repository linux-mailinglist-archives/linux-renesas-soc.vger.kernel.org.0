Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7FD696723
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 15:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbjBNOlF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 09:41:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbjBNOlD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 09:41:03 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A6627D4D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 06:40:59 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id c2so17601667qtw.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 06:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dj8U3aIRT4JqgQAJm2pAns5ek2BuQfm8zcZorm8+OAc=;
        b=h8ajmtMWwGDfRzQx4xDWZV2YkO98I6r/lf4sjoY3a808/XLSK5tZSQ2zqwTl6ulKLj
         WWS7owSm1BU8ucsM0++k+bjFGfHDNaGNzSzCCRT8Y9pT9yx9wNWBBKWrHc6hzNhJLeHD
         c21EZjj0VH6/z5ORSDhXmxhn323VWNvQ6K8k65uauM50Me19a4tKQYZO5Ph/nnLr9Ojd
         ig3fl+nm0LAxrbWWyOUf1Ocujoo94krjqVG/S72Yuy0vVGi3d0Q4m0NFjzFbR9uVxw5s
         bgZGTL6Nc4OXsI+CVNs21TSMmrhpvhcNdR7DIWr8TWbU+iBpAhkUcONBD8lc11BDv0+X
         J7Hg==
X-Gm-Message-State: AO0yUKVvgzNWrCw189JBJywWUT3/5zb9aTNuv2UbFHxXegkdep4JG7CU
        Z+v4Jhp8KTdHt9DM2o5UvE10ArkaFafOb8+w
X-Google-Smtp-Source: AK7set/kZzct+Q/95PhCc6G4xGPu5XOnrF35WRtzLpNpDXq23MkD2B5qhLiE6y0CGmQJl7BXJJQ72Q==
X-Received: by 2002:a05:622a:5c7:b0:3b8:ea00:7023 with SMTP id d7-20020a05622a05c700b003b8ea007023mr4280796qtb.19.1676385658541;
        Tue, 14 Feb 2023 06:40:58 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id u123-20020a379281000000b0073b4d9e2e8dsm2731922qkd.43.2023.02.14.06.40.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 06:40:58 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-52ebee9a848so193435127b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 06:40:58 -0800 (PST)
X-Received: by 2002:a0d:e841:0:b0:52e:ec16:6f19 with SMTP id
 r62-20020a0de841000000b0052eec166f19mr331157ywe.33.1676385658008; Tue, 14 Feb
 2023 06:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20230209200735.3882-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230209200735.3882-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 15:40:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9J=MnkJT7SYEmrrsp96KeMiwmRAFbReuN9VKLg0jZXQ@mail.gmail.com>
Message-ID: <CAMuHMdV9J=MnkJT7SYEmrrsp96KeMiwmRAFbReuN9VKLg0jZXQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: use proper labels for
 thermal zones
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
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

On Thu, Feb 9, 2023 at 9:09 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The documentation provides information about the placement of the zones,
> so that can be used for more descriptive labels.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
