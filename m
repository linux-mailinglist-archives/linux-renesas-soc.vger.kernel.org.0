Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C56FF695CE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 09:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbjBNI0T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 03:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbjBNI0S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 03:26:18 -0500
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185CA1DBBB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 00:26:16 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id o20so22457990lfk.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 00:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucD4CCnfkp8arax0UEhiFRGSp5Q0kVEhqBUCYvVLIRM=;
        b=dtxpSEH4x4B/Hny+Vyl4HP2O0gAWeH4o/yVcwvoXaKAlJ+J/NpWlWiKufIgg/PCj4I
         lcbRmDWT6xUnA5vGXoqv01qgs4NXhuBSiTanqSAqybqTPbQ9YNx3S7tVYs3xXM+KJ4YM
         Gk1tIkdRIS/Q0qE+u34OPdOwqJEoas+SMHWIONSh8lu+/jFSe+1o7qsFitb7GEgF0KO8
         feb4Z5wFJWY0mweM+gL6ydEPOms1ERGVdwaUwqlD0eQOq91EcKJ2OXzAjWoTBQnbSOBt
         Imy4MQMMiFGSWwF19M2s0lnzvKPVXb1ATZk/aLtJL7jowQnR/ExDmrSndsuQlwD+cOPf
         xTQw==
X-Gm-Message-State: AO0yUKU1OboYMXkICpzS/TSz7t5mZTgEiANTPVGkhNOimEyGBeyjfTTJ
        MJT2tJpiCruDGTgEKhu00jhcYg0wRTeiH1as
X-Google-Smtp-Source: AK7set/3OTHfB0wMc2BpLliF3OZDU+TLSJAdB9ccysL05xJpb8b7Xgu+EVqcxonIhxnpt4yC1MAl2w==
X-Received: by 2002:a19:ee0a:0:b0:4cb:280b:33c9 with SMTP id g10-20020a19ee0a000000b004cb280b33c9mr423252lfb.24.1676363172901;
        Tue, 14 Feb 2023 00:26:12 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 7-20020ac24827000000b004d5a5d90d83sm1046885lft.60.2023.02.14.00.26.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:26:12 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id bi36so22406470lfb.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 00:26:10 -0800 (PST)
X-Received: by 2002:a05:6512:462:b0:4d5:ca32:68a3 with SMTP id
 x2-20020a056512046200b004d5ca3268a3mr166151lfd.8.1676363170539; Tue, 14 Feb
 2023 00:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com> <20230214003736.18871-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20230214003736.18871-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 09:25:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSt5uY=kSGrdt4V6311ZmvVEPo0oN6v-_c3uZNQLZ8=w@mail.gmail.com>
Message-ID: <CAMuHMdWSt5uY=kSGrdt4V6311ZmvVEPo0oN6v-_c3uZNQLZ8=w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: rcar-du: lvds: Move LVDS enable code to separate
 code section
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 14, 2023 at 1:45 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> To prepare for a rework of the LVDS disable code, which will need to be
> called from rcar_lvds_pclk_disable(), move the LVDS enable code,
> currently stored in the __rcar_lvds_atomic_enable() function, to a
> separate code section separate from bridge operations. It will be then
> extended with the LVDS disable code.
>
> As part of this rework the __rcar_lvds_atomic_enable() function is
> renamed to rcar_lvds_enable() to more clearly indicate its purpose.
>
> No functional change intended.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
