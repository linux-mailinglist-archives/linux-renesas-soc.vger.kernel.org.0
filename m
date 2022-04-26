Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 984BD510148
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 17:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351028AbiDZPFi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 11:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348182AbiDZPFi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 11:05:38 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64886D4FA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 08:02:30 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id e15so795129qtp.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 08:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UGoW6Enl2tV37+9G3OuXtVZwF0pp1qbJnKGMEF8ZIzM=;
        b=sM1inae10EsmSLZ0r8B5ArhOKOinH0SDl3Zf8DaB0OGbu9Ju2KMUimhULF5PkNhDLR
         6VsZqFjQx3DqKQsRhB8FewI8Ve/ZUSb9DlLfd8PoTTXvnGHT5bu0FeSsXDvkrwi/pugs
         +oAqXIJ2XyGWGjv5qFzOxBj0ep1NvSh5IqPjLhxH47xPc+OH0GjIoLi7smLPzjBBYBme
         +UOQcCjWexfKH2uRQEWfaI08XFGTpStfRALze8aiBfFjevQGZqiky2mRVVe/7umkGL3S
         iTZU3WM9CV0DiIuThpp0jFdGqxiCGgqgFoFm5Wl0zglKa25yzXQECnXUYB4dj5u3DTNT
         mI+Q==
X-Gm-Message-State: AOAM530f4+ZITRNCGIGFIj1VRuIeL/k7+XFBQf6TXi7rUZ3jKxqqO5Xw
        H6eVY9QVXn5gwMX+0rWaox/cZNRA/gaCQw==
X-Google-Smtp-Source: ABdhPJxICjrHxVwIUJflLlQeFBrxJbDgGPw9s/GMbfthSVgvyhesf8ZFcN+VIbiwKe5fuh/xk+DT5g==
X-Received: by 2002:ac8:7d4e:0:b0:2e1:ba47:d757 with SMTP id h14-20020ac87d4e000000b002e1ba47d757mr15873234qtb.248.1650985349463;
        Tue, 26 Apr 2022 08:02:29 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id e23-20020a05620a12d700b0069ec181a0b2sm6359441qkl.69.2022.04.26.08.02.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 08:02:29 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id r189so33458666ybr.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 08:02:29 -0700 (PDT)
X-Received: by 2002:a25:d84c:0:b0:648:7d5e:e2d4 with SMTP id
 p73-20020a25d84c000000b006487d5ee2d4mr7886184ybg.6.1650985348774; Tue, 26 Apr
 2022 08:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220420204307.87343-1-phil.edworthy@renesas.com>
In-Reply-To: <20220420204307.87343-1-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 17:02:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMXmY4E1idUXH07mRiaKhEr3SFArQPC2wZaqP_Fkm-DQ@mail.gmail.com>
Message-ID: <CAMuHMdVMXmY4E1idUXH07mRiaKhEr3SFArQPC2wZaqP_Fkm-DQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] soc: renesas: Add RZ/V2M (R9A09G011) config option
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Wed, Apr 20, 2022 at 10:43 PM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> Add a configuration option for the RZ/V2M SoC.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
