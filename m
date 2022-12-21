Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD7B6532C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Dec 2022 15:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbiLUOz4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Dec 2022 09:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233305AbiLUOzs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Dec 2022 09:55:48 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8C0193EC;
        Wed, 21 Dec 2022 06:55:46 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id a16so13778536qtw.10;
        Wed, 21 Dec 2022 06:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTPZ0K5JpYMjZzjTSAwMmU9Y72BvxSLKSQXO+/uT6k4=;
        b=2ASXnmc0KTXhh1R4PiPe76YkgaKVW9CkGdPhkNf/k3zN1XfBAP+SxQh8Hut1wHG8TJ
         f7KKU9zIYcu3ktWR6KjohVoM8xRPRGYy1qWWxcbHlmg/vfl+K/l16uyP1LY82yZYbXZK
         dlA4ZMDKA4eBKWA6ITdAmEuwHvIq68xQ7BlfvThCwkUOaotol70pstyB68Mk/FaQPijX
         v5X4bUQhm/QVJ+lX9LfxtJH1/TvPT/EG2Bs8Hg8b9Sq4PbqiW+GDjJymXS1V8pKB8qSK
         94xM3jvlptL+6IoW5J7DymRc+gVRzHd4w5OKHQVfuatxLNhtRefG/QzCBDgZ8o1tYDOp
         vVHw==
X-Gm-Message-State: AFqh2kopcDeepWR+5i2vxs6mxDYMIYc57dzfOxsKn1RvLYzrKDhf0xNT
        2HUju5ZCTbFwgWySejuiP0iggj/LOk+wRg==
X-Google-Smtp-Source: AMrXdXurdZF4GGi+24eFQWehJIAsl30uuEcpjrfZVHLzt5dAVaYHVn6y2QYl0sQiKxNQFuRpf6EVfA==
X-Received: by 2002:ac8:70ca:0:b0:3a7:e838:11da with SMTP id g10-20020ac870ca000000b003a7e83811damr7793080qtp.58.1671634545270;
        Wed, 21 Dec 2022 06:55:45 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id a5-20020ac844a5000000b003a68af60591sm9212809qto.70.2022.12.21.06.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 06:55:44 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-381662c78a9so214324677b3.7;
        Wed, 21 Dec 2022 06:55:44 -0800 (PST)
X-Received: by 2002:a05:690c:c02:b0:370:202b:f085 with SMTP id
 cl2-20020a05690c0c0200b00370202bf085mr131138ywb.502.1671634544246; Wed, 21
 Dec 2022 06:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com> <20221212172804.1277751-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221212172804.1277751-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Dec 2022 15:55:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSXLAVJ5nPSozH5rDO60SxFZza=48VyzYtvOU0ACu4fw@mail.gmail.com>
Message-ID: <CAMuHMdWSXLAVJ5nPSozH5rDO60SxFZza=48VyzYtvOU0ACu4fw@mail.gmail.com>
Subject: Re: [PATCH 01/16] clk: renesas: r9a09g011: Add USB clock and reset entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 12, 2022 at 6:28 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add USB clock and reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

I couldn't review the clock parents, as that information seems to
be restricted, but the rest LGTM.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
