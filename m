Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C33A77C8CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235391AbjHOHoG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235463AbjHOHnr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:43:47 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312B8173F;
        Tue, 15 Aug 2023 00:43:44 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-58c531d9a4aso11320137b3.1;
        Tue, 15 Aug 2023 00:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085423; x=1692690223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rWQkz+u72Bytc1iKzonHEr2Ej41kcOIbbop2Hr+3Qg=;
        b=jkbj2+4g8Z7RcrkEmGiygVL8qjHpXvmPsxAlTMQtcBEFs+1CGZEq8tIsiP3ptH+KI6
         NZwvBR80Cyuc0b96MJpgOjHnmxKRG/RbVUhNB1CnEbxytXcgr4e1S72kU9nK7S6Xxq87
         igU0Kxp1Ki+gY3UaNqeftzdUnaIQidSmeySk4M1Wsgln6G0PE82p+9SmEc651D62pSpY
         1liXu7A7HzwN0X6Lz3j3qI+wwBihNGFQ9LGkWRMU01yF4mwyAbB3PXT6zSb2iER3r7cU
         bxuoBNrBEnfQY6zgiV0AThaNSpo0FRoVWSLSHN9VhJA0OOXkTzeM0uMRGYTQSg9P4G/a
         WxHg==
X-Gm-Message-State: AOJu0YxZ0osV03amDHMZLreISOdZZk95Sg45j9zAdJzx+v43A06tyfhC
        lRgST9n0aT6V/B08BZSICHk91m/FFl6ZiQ==
X-Google-Smtp-Source: AGHT+IGGeEK/E38AgubdScJu79zpeEPYwv60V8xoMeiZfB2jL+gRdemt5ch0MiEAWD5QH0yXt2jDHQ==
X-Received: by 2002:a0d:d703:0:b0:589:a400:a046 with SMTP id z3-20020a0dd703000000b00589a400a046mr1261666ywd.14.1692085422915;
        Tue, 15 Aug 2023 00:43:42 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id u129-20020a0deb87000000b005619cfb1b88sm1106182ywe.52.2023.08.15.00.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:43:42 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d67305c80deso5058216276.1;
        Tue, 15 Aug 2023 00:43:42 -0700 (PDT)
X-Received: by 2002:a25:abb4:0:b0:d47:8fb0:4c0c with SMTP id
 v49-20020a25abb4000000b00d478fb04c0cmr1328929ybi.29.1692085422312; Tue, 15
 Aug 2023 00:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com> <87fs53prny.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fs53prny.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 09:43:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVunW3GoLdY7RuQ+1dKLRCO0+Ld7DYBzmiMj29E8YiksQ@mail.gmail.com>
Message-ID: <CAMuHMdVunW3GoLdY7RuQ+1dKLRCO0+Ld7DYBzmiMj29E8YiksQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] clk: renesas: r8a77990: add 922 ADG
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
> clk_i which came from internal ZA2. This patch adds it.
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
