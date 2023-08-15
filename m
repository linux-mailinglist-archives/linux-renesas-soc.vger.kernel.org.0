Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67EA477C8B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235270AbjHOHm2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235312AbjHOHmB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:42:01 -0400
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101B010F9;
        Tue, 15 Aug 2023 00:41:58 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d6a5207d9d8so2670514276.0;
        Tue, 15 Aug 2023 00:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085317; x=1692690117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvzrsyQ0VeP4Buf8o1bS+U3ITedOgmzxQDcHmxq+9HE=;
        b=PwqjsQ8udbUtYxFHKwOJR8nG9xGwkdyJkDjfROmWjUiHXFwL7ppbF0/N26Q9cXbsOQ
         xaPLZtUMfEHTj3wzM9vQvdLwOD2nlo2ClMb8wYMP6hnqIcI8tQtVJjnKowrTe83rTV45
         GChgnW2UNvWUr2TAnEupV5hoKAA3biojv5vnJJy+/PkJC5lYZw0YRlxAuBO3zn/9bcR8
         Lv2NFE3hacUePP7KzEw+W81d+tJcEEGN7IyCz6v/U+4FWrmWhGvmNOUuDIb5EjQ0YTNj
         He2sr7fyXk1XYWoGAka1GUsI9int+YvxNDQ92RzivFCXGB4yBvkSm1uii2K0Kg20hFWv
         rH0Q==
X-Gm-Message-State: AOJu0Yw18leNkUeVygV3zvdotrqip5m0Zn063si3QFBcbE9bvnx8bZrz
        iTwdh/QPLhaKvW7pqJkx7C6DPYSN3mlwkA==
X-Google-Smtp-Source: AGHT+IGMYHKyO48k9QF29I5JO01k9mffewJgHiI/qDEUOXSVS7FqzeNH06D7U++uNMqTPyGGfxnyWw==
X-Received: by 2002:a05:6902:283:b0:d3f:cfa:2349 with SMTP id v3-20020a056902028300b00d3f0cfa2349mr1287087ybh.3.1692085317095;
        Tue, 15 Aug 2023 00:41:57 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 78-20020a250551000000b00d69e78047a4sm1319800ybf.39.2023.08.15.00.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:41:56 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d299ed34bacso8743637276.1;
        Tue, 15 Aug 2023 00:41:56 -0700 (PDT)
X-Received: by 2002:a25:ad9c:0:b0:cb4:6167:a69c with SMTP id
 z28-20020a25ad9c000000b00cb46167a69cmr1441930ybi.8.1692085316550; Tue, 15 Aug
 2023 00:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com> <87leevproh.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87leevproh.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 09:41:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTAuQ7QO5rAJcUnjai5S1aXr8nU8-McOGjoockUOfsPw@mail.gmail.com>
Message-ID: <CAMuHMdUTAuQ7QO5rAJcUnjai5S1aXr8nU8-McOGjoockUOfsPw@mail.gmail.com>
Subject: Re: [PATCH 4/9] clk: renesas: r8a774b1: add 922 ADG
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 1, 2023 at 1:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> R-Car Sound needs to enable "ADG" on RMSTPCR9/SMSTPCR9 22bit to use
> clk_i which came from internal S0D4. This patch adds it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
