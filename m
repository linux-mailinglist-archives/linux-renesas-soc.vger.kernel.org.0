Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5724A7B6205
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 09:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjJCHDw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Oct 2023 03:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjJCHDv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2023 03:03:51 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8631DAD
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Oct 2023 00:03:48 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59f7f46b326so6972357b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Oct 2023 00:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696316627; x=1696921427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+tS/Rd3MbOVUSs5gHEgiViE4FDD3e/IguNl9axOzAI=;
        b=Uj5s30tzKc/NNknP46Z4cruyWfpM88UVsFHZGe2mdbm+QbO0imEeS4J6n1b1hJ/3P8
         3Retx4Gs8SLMWJo7c6jaahDKH/1ORud+PRK/zO8I5Hg1AKgVYmWzeyuxNPDEX/ykbccd
         TuZm7beV1VXRhAkgmwxbLwX+XBMwQFuiw8cge9uzMAVKDC4Fb5kVrkxNkmAy72RqhuD5
         0WVttouk7IwXosKhxGLqXW061v0SmButcy+1GZU/OAsqwegFv61YUJa6Uca0Tii7yRMT
         otsg3dUlXvW4TkEkCmEeExSXYpkLaTTRO30YpsDt1u4ZjIu/bNqK4g4UhbBKHdpi9kIt
         ZGdw==
X-Gm-Message-State: AOJu0YwIbodXauWt4HwavT2YAxV/F0iiW6oepdEfkvrCrTOjPgfgLthW
        25HWfXte9+Q3miaxVuY05XGvxrifcPEX7w==
X-Google-Smtp-Source: AGHT+IHc7oATac5CJ5NYC2zYKGvFVsRpzVYsSNie4lOViP8bC+n3lL6Ow0yVpiO05xrHy5DFDFwmQw==
X-Received: by 2002:a0d:d90b:0:b0:59b:5231:50d7 with SMTP id b11-20020a0dd90b000000b0059b523150d7mr13005532ywe.10.1696316627404;
        Tue, 03 Oct 2023 00:03:47 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id z196-20020a0dd7cd000000b0059812d9719fsm192105ywd.8.2023.10.03.00.03.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 00:03:47 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59f4f80d084so6845387b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Oct 2023 00:03:47 -0700 (PDT)
X-Received: by 2002:a81:6d17:0:b0:59b:69cf:72c0 with SMTP id
 i23-20020a816d17000000b0059b69cf72c0mr13515740ywc.6.1696316626918; Tue, 03
 Oct 2023 00:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <TYBPR01MB534193210976F3274EC31622D8C5A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <87wmw4fo8b.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmw4fo8b.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Oct 2023 09:03:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkUKZuAjFq4OuzNoNJKXdBBRLgSw90KOsAU5m6MSQOpA@mail.gmail.com>
Message-ID: <CAMuHMdUkUKZuAjFq4OuzNoNJKXdBBRLgSw90KOsAU5m6MSQOpA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marc Zyngier <maz@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Oct 3, 2023 at 4:12 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > Document support for the Interrupt Controller for External Devices
> > > (INT-EX) in the Renesas R-Car S4 (R8A779F0) SoC.
> >
> > nit:
> > s/INT-EX/INTC-EX/
>
> Thank you for the review.
> I have copy-and-pasted the log message.
> It seems original log hadwas nit :)

/me is hiding behind a rock labeled with two different misspellings
of INTC-EX...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
