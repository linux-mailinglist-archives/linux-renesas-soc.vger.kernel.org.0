Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314886B409B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 14:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjCJNjW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 08:39:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjCJNjL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 08:39:11 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628FA10A28B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:39:09 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id r16so5594049qtx.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678455548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSw9sIUzjaiXLwZjrMAKk9R+HS/Li4XfBnLWtD9w0GA=;
        b=U6mf7xkq7YEvl1sjGrZy8rpIeBqNk5RXlRY1O6Grw/cWU0rOzSI5n+9oqAGM9Kbjr3
         XCxxY9lc0sKjwj9WaAU4dd4w9CwT6G91tAeNRsWJagaqkIS0g4sxlmjMY7GPBlvdEfuR
         86yKzt7R8eRfRPG0jbShS/DbTNWMxCAXP4LoEleewWUfk/8jQrQ5gyenLolFMOZQqil0
         Sz6nhhULTkTovjNF/Hiaqq6H2Nqo/TKHnblxaBP6XDOXpD/8eALOlFcwaTzLAOQjU9Hk
         1IrVlzc4UMdg0JgVNCrNvtN1dUq4FUKAgYhvJFI3pHh4fOAJDppLhLdqsmceRUo+Kega
         q6aA==
X-Gm-Message-State: AO0yUKU+udzd0WMPt+rayKzHJbr2yRt5EEkgHBRs3itQxyxdHRegSsMa
        5nkgECBGLbSQ5babkiza5CiFnHk3lbpO1A==
X-Google-Smtp-Source: AK7set9hcYp1r45H7pN+GQq6AFy3Kfss+MLf30kM+1lW6U1txk9LR/jHa8oZ9moPf4AWLTYvFEjLiQ==
X-Received: by 2002:ac8:5c4a:0:b0:3bf:d0ac:5ba9 with SMTP id j10-20020ac85c4a000000b003bfd0ac5ba9mr44631402qtj.7.1678455548139;
        Fri, 10 Mar 2023 05:39:08 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id c2-20020ae9ed02000000b0073b3316bbd0sm1369410qkg.29.2023.03.10.05.39.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 05:39:07 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id e82so5242263ybh.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:39:07 -0800 (PST)
X-Received: by 2002:a05:6902:d2:b0:a8f:a6cc:9657 with SMTP id
 i18-20020a05690200d200b00a8fa6cc9657mr12614392ybs.7.1678455546902; Fri, 10
 Mar 2023 05:39:06 -0800 (PST)
MIME-Version: 1.0
References: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com> <87mt4pl9sz.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mt4pl9sz.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Mar 2023 14:38:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXocK=Cz257rTa7WJ+YeytOg_+pM8AyNbAQKUZaJ1AjUQ@mail.gmail.com>
Message-ID: <CAMuHMdXocK=Cz257rTa7WJ+YeytOg_+pM8AyNbAQKUZaJ1AjUQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: defconfig: Enable DA7213 Codec
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Tue, Mar 7, 2023 at 12:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch enable DA7213 Codec for ARD-AUDIO-DA7212 support
> on R-Car V4H White Hawk
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
