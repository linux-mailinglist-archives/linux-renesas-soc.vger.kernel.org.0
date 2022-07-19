Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E748D579495
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 09:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235873AbiGSHwq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 03:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234348AbiGSHwp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 03:52:45 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1E824972
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 00:52:45 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id h22so10457727qta.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 00:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ryzW6P58e7/grlsDczi0RbmLNexQeHWVGXu6UMg8y6w=;
        b=kFVpcMCWPfQkshVFsYMTulwGrO9WW/VIpKk5E6bVTLDBUOEalP75Sy6uuQxfV1554o
         O8+5V4r5thsViuhRhE0n9CS99GxVPoRdJY1RIPqT8VTDWFGlf897HJOUlS7gruEyrlPk
         5BR7AzD1xOA4q6OdE3yLvhUGHLlGwOaYsi0eSXj5FqiDIOCH0ILF7Zq1Ja1XzofjHyVx
         +cSpZi1jO5jWFt2YlVlsig8Tlg9NJGWivPa2nwRDP+vYTrJ3ZXM1STRnMMKJ+ow90ETf
         LeMuqX4SztxSow8yPc+tCM5oabrLTt/mVB4/9+hGAf/WguoYaqzX6yWFTb4hA87h3A2Y
         yuNA==
X-Gm-Message-State: AJIora8Ir91Ye98vJ9A6FHb0KSLokxr2cBMBxw5ezbpcawm+neaB2SWp
        Yer3HXiQem7+PWUA1XtVhZ8VfPyyFTmAUA==
X-Google-Smtp-Source: AGRyM1twmvjqhdckw7Mci7hoE2eijQT45J/BuKIXNUQmPknuD+RHXXOngFzXqDXLGvuJBE/q8wiMbg==
X-Received: by 2002:ac8:5b96:0:b0:31b:efa9:d887 with SMTP id a22-20020ac85b96000000b0031befa9d887mr23975538qta.112.1658217164323;
        Tue, 19 Jul 2022 00:52:44 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id g3-20020a05620a40c300b006b5ee4de4fbsm4376860qko.37.2022.07.19.00.52.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 00:52:44 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id c131so24395087ybf.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 00:52:44 -0700 (PDT)
X-Received: by 2002:a25:f06:0:b0:670:1685:d31d with SMTP id
 6-20020a250f06000000b006701685d31dmr12970242ybp.380.1658217163734; Tue, 19
 Jul 2022 00:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220713101447.3804-1-wsa+renesas@sang-engineering.com> <20220713101447.3804-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220713101447.3804-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Jul 2022 09:52:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUHAsxJNeK82afO8L41m_801oMSs5epgaee=dx-MB77w@mail.gmail.com>
Message-ID: <CAMuHMdWUHAsxJNeK82afO8L41m_801oMSs5epgaee=dx-MB77w@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779f0: Add CMT clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Wed, Jul 13, 2022 at 12:15 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.21.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
