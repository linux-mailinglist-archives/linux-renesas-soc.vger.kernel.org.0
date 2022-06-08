Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5C9542846
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 09:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiFHHqO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 03:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236782AbiFHHl7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 03:41:59 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD3D2258A9
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 00:06:38 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id d128so7057831qkg.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jun 2022 00:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F6vympKirtV/UYcPI8BombCLRkOe1GzzfEo8DO0cCHM=;
        b=KYpIj4BFZr8SDXfmaaQWX8fAkZBgFD9e76AAdfTFKDvdKMtt95+PC3fsVYYUzCFpyG
         W+GjRkH1i2Jc0rZ1VhYC0gAvoDG2InEFtHB3OfypU1KaiIQYBXiSOLCAgP6TyzZvIU8f
         SRDGVaa/4JUqXTQ3Tz1q8yIsZ/4Hb4fxv74uxhU5v+2BhNIo+DioEquwr3a97bcarSKy
         w0jByqdlxWKY2Z6pvAgQo/3Gkt+KPl8Y95NgyUPCp2N4aHZJ0BjB757IWuIW7GHXLOOD
         7Twno4cv6+u6CXWcb3i0kNwoBFyYX7xbsSipxLuhCmpK8vW6J0xC2Upz+WK0ZagjdqSC
         lefA==
X-Gm-Message-State: AOAM530ILwhC8v9wxndfHK67lyqo73gWY65iN4rcWlI+8l5MNiwQELc5
        MjlNO2iEJQ67Hn+xRMQock4gFcUunUpZSA==
X-Google-Smtp-Source: ABdhPJw6lV/haR0QEi6GvLl6irMVpeQKDXHEQcrYy5Diq0wIaUm2hxIQhUhLnS1LhlKqZJ9JGPRY3w==
X-Received: by 2002:a05:620a:4102:b0:6a3:5f1c:f9d3 with SMTP id j2-20020a05620a410200b006a35f1cf9d3mr22605981qko.672.1654671957692;
        Wed, 08 Jun 2022 00:05:57 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id l2-20020a37bb02000000b006a2e2dde144sm15319214qkf.88.2022.06.08.00.05.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 00:05:57 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id e184so34959905ybf.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jun 2022 00:05:57 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr34496689ybu.604.1654671957151; Wed, 08
 Jun 2022 00:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jun 2022 09:05:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUGkMTkUFLnpz8b1WA+Oq7M1BrrAX2jLW14QCncpie1g@mail.gmail.com>
Message-ID: <CAMuHMdVUGkMTkUFLnpz8b1WA+Oq7M1BrrAX2jLW14QCncpie1g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ak4613: cares Simple-Audio-Card case for TDM
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Morimoto-san,

On Wed, Jun 8, 2022 at 4:13 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Renesas is the only user of ak4613 on upstream for now, and
> commit f28dbaa958fbd8 ("ASoC: ak4613: add TDM256 support")
> added TDM256 support. Renesas tested part of it, because of
> board connection.
>
> It was assuming ak4613 is probed via Audio-Graph-Card, but it
> might be probed via Simple-Audio-Card either.
> It will indicates WARNING in such case. This patch fixup it.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you, this fixes the WARNING splat on Ebisu-4D.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
