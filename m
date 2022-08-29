Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B7C5A4B4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 14:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbiH2MPn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 08:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiH2MPT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 08:15:19 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833D7979CF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 04:59:16 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id a22so3186985qtw.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 04:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WzIY6ntidv4Rqi4qkbjY1/AEk3CKC7O2K2iOyPt2l/M=;
        b=5vozZuOiOOKDOgqFv5ijCCkhDf9yK5vybDHEzZYW7JGcr/VhaZe0BiKUlYyPn0CT6X
         qGqgUT9iZ3bkmGdLcCjnIVLRyxxK7AbiZ4GLgAX//WCsFHXxwhcbS6WDvnb9ltYXoZhb
         p+JmmJo1odWt28zy3H5ZH1R7kdcOUPqT8LeGl55RNpdyx0yfwelLuumVkTZunzCzwoJC
         uQSYP9uv0aeO2Vmr1+IoIDcnPMVM6gJa4InAkD9zEDk+hwMBnYEZrskb5Nn6TPW9xmdT
         c4tuRmOm358VqsES8BicNa2avhxR/Zf7NdzfyjXNXZRSLGfIhdJJhaesMUl0wbCTyj2w
         QV2A==
X-Gm-Message-State: ACgBeo25RNXY9IEg49dbSR0kp7xo5JGPAca8lmkrSnrh7npy6JV8I77p
        xqmCcGToOS1PWBNguSl69hCTgMXBBe4uBQ==
X-Google-Smtp-Source: AA6agR4fnMsJSu7tlRFd+y3ErCNtr/SOCAP5eUnpCOLU4IrBi5adtUb1Fh6F/3f6WL+uB2q3eEx+zw==
X-Received: by 2002:a05:622a:181c:b0:344:6399:d8c0 with SMTP id t28-20020a05622a181c00b003446399d8c0mr9724018qtc.334.1661774302372;
        Mon, 29 Aug 2022 04:58:22 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id hf11-20020a05622a608b00b00344b807bb95sm4936408qtb.74.2022.08.29.04.58.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 04:58:22 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-324ec5a9e97so188635997b3.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 04:58:22 -0700 (PDT)
X-Received: by 2002:a25:778d:0:b0:696:4bb6:9aaa with SMTP id
 s135-20020a25778d000000b006964bb69aaamr7934411ybc.380.1661774301842; Mon, 29
 Aug 2022 04:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
 <20220824103515.54931-4-wsa+renesas@sang-engineering.com> <CAMuHMdX4q+NNf1Q=eRE3Qb8QvidJ5u_LZT8he+Aw76T45cmYWQ@mail.gmail.com>
 <Ywyezf8tXUXjm8n9@shikoro> <CAMuHMdUDnTsr28mjmOPtd+SKE+cvCDT=mu2_GvjucoFZzWJhvg@mail.gmail.com>
 <YwyoKPVs0dedZi9D@shikoro>
In-Reply-To: <YwyoKPVs0dedZi9D@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Aug 2022 13:58:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtf3rfJ9zJnbnmY4jDvLux-P0QDwY9edXVGRytn4HWdQ@mail.gmail.com>
Message-ID: <CAMuHMdVtf3rfJ9zJnbnmY4jDvLux-P0QDwY9edXVGRytn4HWdQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: spider-cpu: Add MSIOF node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Aug 29, 2022 at 1:51 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > So my preference is to leave MSIOF0 alone.
>
> So, I just resend patch2 with assigned-clocks removed?

I think that's the best approach to take. Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
