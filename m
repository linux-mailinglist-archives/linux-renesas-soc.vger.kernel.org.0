Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41CF747E15
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 09:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbjGEHTx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 03:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjGEHTw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 03:19:52 -0400
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64210197;
        Wed,  5 Jul 2023 00:19:49 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bd61dd9a346so7076406276.2;
        Wed, 05 Jul 2023 00:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688541588; x=1691133588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgy3bfYoDh3OFcAtaur8cdXDGvZi9pap36arqcEt75Q=;
        b=O/4mMI8SvCsSJ9SJkraMGnM34VEHSPJTeuayFjSIyecmoBs37+670VBT5RIgHJl/1X
         y+K9goUf5O/kwT+P2XLHIJlYXm+jBNaNjhGLGgMnkUDNo8a6UZmUexhTyP3nY/lquEj/
         uhNQu+2sgp69yreYOWImZWINR74P6VYPMZZ04Xkr0SNn0gcS+TVXa03CiWdMjmJZ2PSQ
         vYX41PcqDdVkQvdoqd1ar9DxJ+LnmI+bz8GwrD4nx5nUDcgM80WlHHlumVht8Vk4/Exv
         xWzKXp8mRmfS/sXPClNRSqiE/f0tMGC8z+cmB95K1tQFEmcxdnOrRZzKy90jHforCCvG
         67fw==
X-Gm-Message-State: ABy/qLbBtOgmhzcbhfpRiA/AIcXwT/2z4R1OaOgxPMySEyyD+QjZU3Rr
        nh58lnmENqdt9OU05DZeIp6ENSFgrWhE7w==
X-Google-Smtp-Source: APBJJlEI8WyC0TQej8eT6atEWpjJs8eD8ETnclKJvqwlvwtAg1gpydUeHuNqdQ3eHNDWDfbJWU7E8g==
X-Received: by 2002:a81:a187:0:b0:577:3cd0:384 with SMTP id y129-20020a81a187000000b005773cd00384mr14211779ywg.15.1688541588317;
        Wed, 05 Jul 2023 00:19:48 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id l189-20020a0dfbc6000000b0055a931afe48sm6014793ywf.8.2023.07.05.00.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 00:19:47 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bb3a77abd7bso7103680276.0;
        Wed, 05 Jul 2023 00:19:47 -0700 (PDT)
X-Received: by 2002:a25:14d7:0:b0:bd6:8725:2258 with SMTP id
 206-20020a2514d7000000b00bd687252258mr12591806ybu.60.1688541587389; Wed, 05
 Jul 2023 00:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230704154818.406913-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230704154818.406913-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 09:19:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpiTo_eWFqnqeHzR4hM+qLngqhEb94CQgLmttxw2G6Qg@mail.gmail.com>
Message-ID: <CAMuHMdWpiTo_eWFqnqeHzR4hM+qLngqhEb94CQgLmttxw2G6Qg@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: sh-sci: Fix sleeping in atomic context
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, stable@kernel.org
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

On Tue, Jul 4, 2023 at 5:48 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix sleeping in atomic context warning as reported by the Smatch static
> checker tool by replacing disable_irq->disable_irq_nosync.
>
> Reported by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: 8749061be196 ("tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx support")
> Cc: stable@kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
