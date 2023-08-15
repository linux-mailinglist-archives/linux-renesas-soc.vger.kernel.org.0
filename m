Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B009477C8CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235401AbjHOHoi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235518AbjHOHoF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:44:05 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CE01984;
        Tue, 15 Aug 2023 00:44:04 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6471744acb6so10374286d6.1;
        Tue, 15 Aug 2023 00:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085443; x=1692690243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rWQkz+u72Bytc1iKzonHEr2Ej41kcOIbbop2Hr+3Qg=;
        b=ghMvJUjRPFszUqJB1FVvt4bA4fa2mqX5lYBr4P65zUCB/5asERRK7iXy/9Q3fkaudk
         VPI0hPDKDoO9sWFa6sr3459DermSHdzpxcVZC2qlTcz9Bhmw9AG5pP/f9xMtoZKddup7
         +HPEIlwE7cnqgbjfqlap19Mkm/mmVYnQg1PNrEJD/fT6sp/7uRq1YSzXahtRr+dU1LWd
         sj3arvCgTzVkrqZma8yTBaMztmQpbbOylqFhkZ+/U6xSow6XVarCG9iXEv4JC7MkQ/J9
         orTbRSLjMmWQg20jfI3/Z0+c+ClJGJPItxq/5t9EyIqMhVp3MZmRoo2qDoCn1SRb5Xkt
         OKZQ==
X-Gm-Message-State: AOJu0YwIzjSp6du9hrUlEcydjCTgWt7k8x6T98Q+vHHqzKF+w03sSDsq
        MWprPL7yf02e++ljzhsuSrbABqwbcZD1jw==
X-Google-Smtp-Source: AGHT+IF/7JxgluR118Ltlcgd2a7ZNABIhGFQ4EGYFYNbpHRNwYkcPP1/0oXfRXLr+/AIlKlehYGNIg==
X-Received: by 2002:a05:6214:5805:b0:647:1fc5:1cbf with SMTP id mk5-20020a056214580500b006471fc51cbfmr5196953qvb.54.1692085443171;
        Tue, 15 Aug 2023 00:44:03 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id s14-20020a0cdc0e000000b006431027ac44sm1554314qvk.83.2023.08.15.00.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:44:02 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-76731802203so351952885a.3;
        Tue, 15 Aug 2023 00:44:02 -0700 (PDT)
X-Received: by 2002:a05:620a:d8a:b0:76c:8e37:49b5 with SMTP id
 q10-20020a05620a0d8a00b0076c8e3749b5mr14170625qkl.47.1692085442461; Tue, 15
 Aug 2023 00:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com> <87edknprnt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edknprnt.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 09:43:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiNO6UUY24Jsg1QSAx5whb4aaHC946tou867DY-S730Q@mail.gmail.com>
Message-ID: <CAMuHMdUiNO6UUY24Jsg1QSAx5whb4aaHC946tou867DY-S730Q@mail.gmail.com>
Subject: Re: [PATCH 9/9] clk: renesas: r8a77995: add 922 ADG
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
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
