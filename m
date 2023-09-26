Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6227AE69D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 09:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjIZHSz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 03:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbjIZHSy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 03:18:54 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F25DE;
        Tue, 26 Sep 2023 00:18:47 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59f7cc71e2eso44146517b3.0;
        Tue, 26 Sep 2023 00:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695712726; x=1696317526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etITwZ9S1d4OwXd3gmZ2itprSMpUFaDTBdD/d1Zk1lI=;
        b=r5XfjV06koydMyY+dDmW6ybZOwzGrmNVHcvPqmRBAZaVJVOS535mEtFCHWMre074nU
         AfsYukvVBXz4IrtJXWNK4xlyB4fDq2oQnpqVr89iiyvOV9Em2or8TalAN0cFCu1lkLKZ
         mt3Vw1aLYc7M2QhUD54gznS+JVm6tprkI8Eh4rPnaDofnfxAiV1c/F6s87sk9IuwcJiG
         7pCRF1q/LojDMichfnG6W94uW1lpJZpoeWtf5g6CbM5HIg/Hwkpb8jSwIfO3Y8xJMuGR
         PGST/4JjEQBSvgOvs0iLVBQvRMTvtNOnFgHzTL9NY6yFT52QV7iJ9XR057EuOvAfIO6N
         ZUVQ==
X-Gm-Message-State: AOJu0YyAkLSkHElhuptfdSnW0Lxj73z/uBIZ1O9XDopAxRaSoVMQlIoU
        FOIljQWSsaOGS/ZC3NeT5DhozwUaNlmmNA==
X-Google-Smtp-Source: AGHT+IHtPJ1jecUvUiXLjEcB7m7b8/zM25n1MhlAXR/SUQGaaoKQ+209TYB1yXaMj8JB+IWc2cbtcw==
X-Received: by 2002:a81:524c:0:b0:59b:1bf9:b2db with SMTP id g73-20020a81524c000000b0059b1bf9b2dbmr9143720ywb.13.1695712726461;
        Tue, 26 Sep 2023 00:18:46 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id d11-20020a0ddb0b000000b0058419c57c66sm2850395ywe.4.2023.09.26.00.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 00:18:44 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d8164e661abso9272468276.1;
        Tue, 26 Sep 2023 00:18:44 -0700 (PDT)
X-Received: by 2002:a05:690c:2c8d:b0:59f:b0d9:5df2 with SMTP id
 ep13-20020a05690c2c8d00b0059fb0d95df2mr3207676ywb.0.1695712724571; Tue, 26
 Sep 2023 00:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com> <7156d89e-ef72-487f-b7ce-b08be461ec1c@lunn.ch>
In-Reply-To: <7156d89e-ef72-487f-b7ce-b08be461ec1c@lunn.ch>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Sep 2023 09:18:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4THYuBLTDOnpL+HyQqEpk69F4ZsM4d6+HX4EnDE2EmA@mail.gmail.com>
Message-ID: <CAMuHMdV4THYuBLTDOnpL+HyQqEpk69F4ZsM4d6+HX4EnDE2EmA@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Tue, Sep 26, 2023 at 8:45 AM Andrew Lunn <andrew@lunn.ch> wrote:
> On Mon, Sep 25, 2023 at 09:34:16AM +0900, Yoshihiro Shimoda wrote:
> > From: Tam Nguyen <tam.nguyen.xa@renesas.com>
> >
> > Fix the MPIC.PSMCS value following the programming example in the
> > section 6.4.2 Management Data Clock (MDC) Setting, Ethernet MAC IP,
> > S4 Hardware User Manual Rev.1.00.
> >
> > The value is calculated by
> >     MPIC.PSMCS = clk[MHz] / ((MDC frequency[MHz] + 1) * 2)
> > with the input clock frequency of 320MHz and MDC frequency of 2.5MHz.
> > Otherwise, this driver cannot communicate PHYs on the R-Car S4 Starter
> > Kit board.
>
> If you run this calculation backwards, what frequency does
> MPIC_PSMCS(0x3f) map to?
>
> Is 320MHz really fixed? For all silicon variants? Is it possible to do
> a clk_get_rate() on a clock to get the actual clock rate?

With debugfs enabled, one can just look at /sys/kernel/debug/clk/clk_summary.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
