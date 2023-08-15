Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1145877C8B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbjHOHm3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235361AbjHOHmV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:42:21 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9BF10F9;
        Tue, 15 Aug 2023 00:42:20 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-58c55d408daso6125287b3.2;
        Tue, 15 Aug 2023 00:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085339; x=1692690139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDUCXTTf70J3NMV/tHtAnev4ckRSiWyy/jzJPZI0jrI=;
        b=Lp4+1KV/XprL2I1HP14lY9SADZiDmHC02hnGF0Ca2Zmyy9TSlHGrgCN+LhY1BgyfAL
         f4gh4eS9ZmINozhcf7O1BRH5UtFfXezY1LaBJPOPjZTS7nt0pNk269vqeOS/XvDmQkdX
         a//NapGmHxSrtJOs4y8OZA1eMdQGocu3QRd+UGRlpzzc9fC3U2npUu9U+e0+B1czYpOH
         0fseuwGzWj6APtgX+XpCTRQxOEImtaETsB+FE1Lq9MwqiJ0vrEN4ZHHHNCLdxc4ESHEC
         DlT/ErS4w1o1hM9AFr0LBwIs5Jj+Wbr+Sat2Q1CqU9BlH2jCGFEJJJFvECjpD+pwHvxs
         NPmw==
X-Gm-Message-State: AOJu0Ywo3uPNnjZZKo8kPLjN9J8YjcFGvVYDezszm0hLbVUOPW9epaFN
        egpESCpMdvDWITjLgo+gmetU8EDu2r2ONA==
X-Google-Smtp-Source: AGHT+IGfXKffbKh6VRKMmz4skRD7tRj4AZf4ji8/aBx8Z26Q88GGvwK40Fqwpt+7UMWvym1dsN30jQ==
X-Received: by 2002:a81:89c6:0:b0:57a:3dd8:1038 with SMTP id z189-20020a8189c6000000b0057a3dd81038mr15625259ywf.12.1692085339290;
        Tue, 15 Aug 2023 00:42:19 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id w84-20020a817b57000000b0054bfc94a10dsm3269839ywc.47.2023.08.15.00.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:42:19 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d62b8e2860dso5107832276.3;
        Tue, 15 Aug 2023 00:42:19 -0700 (PDT)
X-Received: by 2002:a25:cbcd:0:b0:d62:619d:19b2 with SMTP id
 b196-20020a25cbcd000000b00d62619d19b2mr16007756ybg.6.1692085338580; Tue, 15
 Aug 2023 00:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com> <87jzufprod.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jzufprod.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 09:42:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqy9hdCkPCgEGwj_XvhQ8Rnv_1dzj9HuwBiw_1_t9g0A@mail.gmail.com>
Message-ID: <CAMuHMdXqy9hdCkPCgEGwj_XvhQ8Rnv_1dzj9HuwBiw_1_t9g0A@mail.gmail.com>
Subject: Re: [PATCH 5/9] clk: renesas: r8a774c0: add 922 ADG
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 1, 2023 at 1:49 AM Kuninori Morimoto
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
