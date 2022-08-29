Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77B205A4360
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 08:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiH2Gqf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 02:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiH2Gqe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 02:46:34 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B50B2715A
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Aug 2022 23:46:33 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id x5so5466591qtv.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Aug 2022 23:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=OYzZsqhi6z4Pzefu9edG0BokXpWc1nUYZJu9jp50RSA=;
        b=v/45UaKNZkYIVSWU0efGNQLgxmAQwgCfGnoaoc/aEXbDTYXZHMJ6xJ6BmNC1c18LAL
         6t/uCfbD5N8jUAuNFc/uIbMX7STbaohKmhebi9Dr2S7TJP+n6Qw/N/J+kCBKclVAIMR4
         JgJV08vJVWN2LU3rSxaSLb5JfEVfpt6KkD0uf/Vxz83bycwR68aH+BSKPuEg5AuX+vWK
         WtDuotaOPznNle0JEiS1aTOQaNsXnytxlA+hgiaf3gd0dmA6HadJUte/xyM2f1pV2/Pv
         FaAOmEdv8eXc3BYqUhiAgPHYgTnoHHJIA3T3xBR/uiusuenwNiuJXblYLP3AzfvBVytI
         wsdQ==
X-Gm-Message-State: ACgBeo3RqqDL7e/sqywIQLDUKAkDAOXVGpS01xQCfLvEgXCzuILiarlJ
        XMkFuBqnNkwSzUDpaaB332aOJXV7xR2cYw==
X-Google-Smtp-Source: AA6agR5MFJOA4of/kWLT+SRtMw7CpZz9MnPzpv2aezohCjxMGJPsfB5VOHEA/9+W5/WF9umKygn9kg==
X-Received: by 2002:a05:622a:106:b0:344:8b6f:23d8 with SMTP id u6-20020a05622a010600b003448b6f23d8mr8901755qtw.668.1661755592091;
        Sun, 28 Aug 2022 23:46:32 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id r2-20020ae9d602000000b006af1f0af045sm5241712qkk.107.2022.08.28.23.46.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 23:46:31 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3378303138bso172389957b3.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Aug 2022 23:46:31 -0700 (PDT)
X-Received: by 2002:a81:83c8:0:b0:341:4b7b:3d9e with SMTP id
 t191-20020a8183c8000000b003414b7b3d9emr411195ywf.47.1661755591357; Sun, 28
 Aug 2022 23:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220827004220.8397-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20220827004220.8397-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Aug 2022 08:46:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNx6LGoD062o8LsJruuw_a4Ugb978ZFiwi4Am5W5SfRQ@mail.gmail.com>
Message-ID: <CAMuHMdXNx6LGoD062o8LsJruuw_a4Ugb978ZFiwi4Am5W5SfRQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Drop leftovers variables from Makefile
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 27, 2022 at 2:50 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Commit 841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward
> compatibility") has removed device tree overlay sources used for
> backward compatibility with old bindings, but forgot to remove related
> variables from the Makefile. Fix it.
>
> Fixes: 841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward compatibility")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
