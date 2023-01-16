Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE20E66BBF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 11:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjAPKi6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 05:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjAPKiK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 05:38:10 -0500
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908681DBB4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:37:46 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id z9so1613979qtv.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLZ1YlG6yHJFQjh7N/pyxn/Ph81a5c1KqTdsapWF7Zo=;
        b=c52YGORd0kHGQGY+3cCNTECh8SAqUoiF9BSoGgPbbPxsjOjfEa38GJJKqI5HssPYHJ
         YXoXxJm1UqimCc/l46ixBJCIWDRKATctJ+OrKTFL3EfYrFB5RC3gfhpILGzHW2f6VR0M
         vU+jccjr84o9MK4Er89U2CWIlLT/IL+0+smglWna2w9b1aFkQdAj/R8/hFobQzfx3v59
         x+KCOAWTID+5g9rNX53qdHDdSHBavK0GY7A3tl5UJZyHjp/UU7KFCxr6FHl01bu9R0G1
         vbtDH4g85Q3CF24c6l282/GJb3XUXMXLmj+FWu8IhYMMkvWY4Y0hmH371nULuKnH+Y+b
         abUg==
X-Gm-Message-State: AFqh2koZnc7ewHfRBKJBes/ylmOakpnZx57DrAQ3n5FwXynRRur5NxLW
        lOVpD7b8ILU6fltT5x2NXOoR8nxhWTtvxA==
X-Google-Smtp-Source: AMrXdXu9OyemP1e/X32ntVV5fc2Ra+vnD1qhuIwHHta6b8SG2yu1mdqIY4pKvI/15A5cAURGdmEE6A==
X-Received: by 2002:ac8:6890:0:b0:3b3:ff67:b95c with SMTP id m16-20020ac86890000000b003b3ff67b95cmr11925199qtq.24.1673865465348;
        Mon, 16 Jan 2023 02:37:45 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id l6-20020ac81486000000b003a981f7315bsm14504885qtj.44.2023.01.16.02.37.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:37:45 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-4d13cb4bbffso254465797b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:37:45 -0800 (PST)
X-Received: by 2002:a81:1a16:0:b0:46f:bd6:957d with SMTP id
 a22-20020a811a16000000b0046f0bd6957dmr3039050ywa.383.1673865464776; Mon, 16
 Jan 2023 02:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20230114225647.227972-1-aford173@gmail.com> <20230114225647.227972-2-aford173@gmail.com>
In-Reply-To: <20230114225647.227972-2-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 11:37:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_e_1raAzxL9AveyMoMasBVsRrVrfmhdqvsNHG3WVTDg@mail.gmail.com>
Message-ID: <CAMuHMdV_e_1raAzxL9AveyMoMasBVsRrVrfmhdqvsNHG3WVTDg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: beacon-renesom: Update Ethernet PHY ID
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, aford@beaconembedded.com
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
> Due to the part shortage, the AR8031 PHY was replaced with a
> Micrel KSZ9131.  Hard-coding the ID of the PHY makes this new
> PHY non-operational on newer hardware.  Since previous hardware
> had only shipped to a limited number of people, and they have
> not gone to production, it should be safe to update the PHY ID.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
