Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF610715A52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 11:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjE3JjA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 05:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjE3Ji7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 05:38:59 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5F393
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:38:58 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-565e6beb7aaso36929937b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685439537; x=1688031537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtzfKWVbN7jaIx42M6eciXxIXho9ZJ7/2HvWUUp93A4=;
        b=Ontya0k9c2DW79AXwHzWhaVdSKbRU0CM3s+VBjatF5lUnkNJvpHao1jXVmjguWuBpZ
         aeW9fBXEHDqgto6Xecno8B7Q9eEbmZLnKHoe7pRwBvgCu31YGJH5peoH9BIQXxgfimXp
         UWV5sUWpJQoVgl5+fKCnUSmhH3FVMWUTFwZ2iZW+eLFiz2pAYS459TX5UCFv6U7wAXKl
         SyFhAA+y/mQeFgvPENlvU8xPQmemvW5ySD0K7qH71cTGqEi/lN+NJtz9Nwc0u5nnZ5OW
         rhOI94f/dZYUWv9l06QdW0YkXk/f62+aZc9uuKFeDt7Z1alEsc8jDTRTDATZ1/s3QCe/
         W5lw==
X-Gm-Message-State: AC+VfDwpyHMWr10wdwz4Sn58F9quHYbU05GSyQGIIQtJv80n9Ekurkgk
        46oLOTcXmJLixpCOWZ0U3gdEN9CvIYSVdQ==
X-Google-Smtp-Source: ACHHUZ4K/og2vfE+Z6+2NBX/lNwzPTfTupAz7JhaFXQiow5wIqfNLfhimDhpj0iNCO83+QP2nE82mg==
X-Received: by 2002:a0d:df51:0:b0:55a:3560:8ee0 with SMTP id i78-20020a0ddf51000000b0055a35608ee0mr1560862ywe.20.1685439537399;
        Tue, 30 May 2023 02:38:57 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id j126-20020a816e84000000b005659a869a64sm3053621ywc.43.2023.05.30.02.38.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:38:57 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-568ba7abc11so12778867b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:38:57 -0700 (PDT)
X-Received: by 2002:a81:a155:0:b0:568:d586:77bd with SMTP id
 y82-20020a81a155000000b00568d58677bdmr455434ywg.1.1685439536879; Tue, 30 May
 2023 02:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230530092629.18329-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20230530092629.18329-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 May 2023 11:38:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQ+WS=DS3n-7Kb=DFkqFD=gX0zpy85XZJ1TaMuSoZzqQ@mail.gmail.com>
Message-ID: <CAMuHMdUQ+WS=DS3n-7Kb=DFkqFD=gX0zpy85XZJ1TaMuSoZzqQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe()
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 11:34 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Replace manual handling of EPROBE_DEFER with dev_err_probe() to simplify
> the code.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

I sent a similar patch before:
https://lore.kernel.org/linux-renesas-soc/62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be
leading to your comment that the deeper paths should be fixed instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
