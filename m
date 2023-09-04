Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C44117913C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Sep 2023 10:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345482AbjIDIpI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Sep 2023 04:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350312AbjIDIpI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Sep 2023 04:45:08 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D79128
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Sep 2023 01:45:04 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-58d70c441d5so11699617b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Sep 2023 01:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693817103; x=1694421903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tbRWYow8DlaQwGfQdmtt1WieaUbGfuMRvU404H2SVg=;
        b=ZThtZa0gSN6+Vm258MnmGskIRTieuYnqBn/kBlJW8pGVlTbtHq6QZYnAhcNWeMNvh/
         6CtP7untoGoK/iaJrtcG64yuUQHPWSfrOLa8ExBWWLxM6OzFWv2+8X1ddSee+Iuyy6Om
         0eqyabu3Mo6/GT53NQNSoxsX6NmzMYkZjGYmio7n5yv1/tE8ltD09X1L8M+MSCc3vrV5
         Qp1vel4JrE2Zry3EsgEJ1ClOjiKRLhSNkD4/XFWMBuae2ZtkYf509jpFLPIWxPqwUdzz
         FjG9EcnB10pUGwtMblY8IirBSY2bqUE+h15/A7YFsdroECZZ2qzNhxH0mGggSXtTBM4a
         DKdA==
X-Gm-Message-State: AOJu0YzAA5MfQRKaSAncfUTE0+jX2KihZjNIJBXTFAhiDBLoib4lxTz9
        6Rrza2MVnA3xDZ15OPCP5rYjq9unXS9gMQ==
X-Google-Smtp-Source: AGHT+IGX8S/wMCKtVOJ5hNT7HOw3qx09zBYMzNjWsIADWdm9zJ8RNYRACkXjLbN8Si8CIH5zjNyfVw==
X-Received: by 2002:a81:8541:0:b0:57a:cf8:5b4 with SMTP id v62-20020a818541000000b0057a0cf805b4mr9669027ywf.51.1693817103571;
        Mon, 04 Sep 2023 01:45:03 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id m10-20020a81710a000000b005845e6f9b50sm2544840ywc.113.2023.09.04.01.45.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 01:45:03 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59209b12c50so11767027b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Sep 2023 01:45:03 -0700 (PDT)
X-Received: by 2002:a25:cfc7:0:b0:d71:6b6e:1071 with SMTP id
 f190-20020a25cfc7000000b00d716b6e1071mr10071300ybg.32.1693817103025; Mon, 04
 Sep 2023 01:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230901132730.2861451-1-yoshihiro.shimoda.uh@renesas.com> <20230901132730.2861451-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230901132730.2861451-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Sep 2023 10:44:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwgjKGnzNe-z_e_ovNoj4r3HCbVZ8jWmdcKRrv-hSo0A@mail.gmail.com>
Message-ID: <CAMuHMdVwgjKGnzNe-z_e_ovNoj4r3HCbVZ8jWmdcKRrv-hSo0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: r8a779f0: spider: Enable PCIe
 Host ch0
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
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

On Fri, Sep 1, 2023 at 3:27 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable PCIe Host controller channel 0 on R-Car S4-8 Spider board.
>
> Since this board has an Oculink connector, CLKREQ# pin of PFC for PCIe
> should not be used. So, using a GPIO is used to output the clock instead.
> Otherwise the controller cannot detect a PCIe device.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
