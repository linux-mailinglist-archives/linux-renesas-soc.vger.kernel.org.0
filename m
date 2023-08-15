Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C313977C8AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbjHOHlX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235319AbjHOHlP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:41:15 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5F810F9;
        Tue, 15 Aug 2023 00:41:13 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-765a7768f1dso425935185a.0;
        Tue, 15 Aug 2023 00:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085273; x=1692690073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvzrsyQ0VeP4Buf8o1bS+U3ITedOgmzxQDcHmxq+9HE=;
        b=GsqMzWyleBanm87mG3mmb25/0d9/X6A6hafPp1nz/ekp5JoNCQFJ4MaAm58IAM9iVm
         ExsdhT8PwjVnCOnBHiJVR0leaEkozb4a6I7fFn1wgcDvCOnxi3UnG95cJ7fX9ei+q53n
         NgReAVtr1aw5fpekZ2/90IDffkX+zNORMqe3dXotrwZ0qikfT1mSi4UvYggPSrkMRHvS
         2CzUa5SjB4l2HEOm6Wq0TiQQ5+c4pi2gqJ+FdBmsv7jhqAGS+iGlm7OUNfIzn6r6Rl9K
         Gt01Dg+n5Y4Sfa5z/TzchRcKDdIHRbSuIPe+2of47eXgG/P/wznEZbB6D9iEkG+3qYUW
         mgRQ==
X-Gm-Message-State: AOJu0Yy+SYVioDE0PiHGoDIhmt2XUrKXiaLfcLS2bjJxwhrHtmVzJBpJ
        P/iRPErm6+7aPn4mWMqZUThwUCicE+k4BQ==
X-Google-Smtp-Source: AGHT+IFrhNQwRtbDOieiNarEXqbIvzS5IwcQlIqjePL9LYdFPgpA2vbRtjjPBI0ZlHnL9AYm+HodKQ==
X-Received: by 2002:a05:620a:3950:b0:76c:b2d5:5bbe with SMTP id qs16-20020a05620a395000b0076cb2d55bbemr15073862qkn.14.1692085272838;
        Tue, 15 Aug 2023 00:41:12 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id i8-20020a0c9c88000000b0063d7740b5d2sm4010546qvf.46.2023.08.15.00.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:41:12 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76ad8892d49so425610285a.1;
        Tue, 15 Aug 2023 00:41:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4053:b0:76c:bdbd:c51d with SMTP id
 i19-20020a05620a405300b0076cbdbdc51dmr15851442qko.66.1692085272236; Tue, 15
 Aug 2023 00:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com> <87o7jrpros.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o7jrpros.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 09:41:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsYok_D55D-qAaJnUjZ45fBMyjSiB1tsRD4LJm3xnsMw@mail.gmail.com>
Message-ID: <CAMuHMdWsYok_D55D-qAaJnUjZ45fBMyjSiB1tsRD4LJm3xnsMw@mail.gmail.com>
Subject: Re: [PATCH 2/9] clk: renesas: r8a7796: add 922 ADG
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
