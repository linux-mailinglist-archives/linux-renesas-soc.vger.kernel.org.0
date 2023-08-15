Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4F577C8BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235284AbjHOHnB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235386AbjHOHmx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:42:53 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD751736;
        Tue, 15 Aug 2023 00:42:52 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-589f2fb1a88so19908117b3.2;
        Tue, 15 Aug 2023 00:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085371; x=1692690171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZQrwOxrWyffD25n9GLtilWn3mmluKLzMUUVuXoXb90=;
        b=khjg4CEKx12vRHJiwziVA3Kz+UybBO/LKd9g/9LhZB2dxkNnUnsEMsc9NoWQ7f72zW
         7Bzq6RfPlby33N3LLI/zUJlFZjVFIGu6zZA7CLWel92/4soD+EiprSQUU/++wNU7nyDx
         Txp7o/x8v6XVteAVrGc0y7eZQcp/pFTf2e3zSi+ka6hAx/7/CsJJji+vetSjP+YuL6Pi
         UaO1u6jIW+GF0ORh1wBU036BTAFnCXoFPxXETs8SfLobcJEDbaOgwYxlRspznHMHWwJ6
         ZEJ6G6aW5nFFvmXp6JqhxP6GD5jT8HcKqNdghKctNqoEh/ySLn0/JBqdDQqQT0Z+ecm2
         NK9g==
X-Gm-Message-State: AOJu0YyaT2HvyB5OAyJJoQNobZcbRvNb90c1H0gJ/nmAPTkhG23AM3uN
        RxrAqXTdB8OlfVzhqiGMDfWigQ32Cd3Q8w==
X-Google-Smtp-Source: AGHT+IFufOuuf0/LFkjR+lh8K4gNO/cxWFwm3EYQVFOqC91g/1NGD9MqQX5LfMmbDQncLweGX5arzw==
X-Received: by 2002:a0d:e8c4:0:b0:573:b0d5:757 with SMTP id r187-20020a0de8c4000000b00573b0d50757mr13373095ywe.29.1692085371368;
        Tue, 15 Aug 2023 00:42:51 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id dc22-20020a05690c0f1600b00584554be59dsm3237295ywb.85.2023.08.15.00.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:42:51 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d62b9bd5b03so4976229276.1;
        Tue, 15 Aug 2023 00:42:50 -0700 (PDT)
X-Received: by 2002:a25:428b:0:b0:c19:6a03:2704 with SMTP id
 p133-20020a25428b000000b00c196a032704mr12036447yba.25.1692085370705; Tue, 15
 Aug 2023 00:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com> <87il9zpro8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87il9zpro8.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 09:42:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXt+Ed755tCkcx_X10EWwd8Wt3d4mW5WqAHzLLowQNWEQ@mail.gmail.com>
Message-ID: <CAMuHMdXt+Ed755tCkcx_X10EWwd8Wt3d4mW5WqAHzLLowQNWEQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] clk: renesas: r8a774e1: add 922 ADG
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

On Tue, Aug 1, 2023 at 1:50 AM Kuninori Morimoto
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
