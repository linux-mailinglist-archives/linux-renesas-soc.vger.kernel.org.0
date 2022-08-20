Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1E659AC86
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Aug 2022 10:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344285AbiHTISb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 20 Aug 2022 04:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344227AbiHTIS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Aug 2022 04:18:27 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462DB1A390
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Aug 2022 01:18:25 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id b2so4880295qvp.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Aug 2022 01:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fBtE8fBRmRWfwzIW60/v0e2F65xiPxjvW85TEWbzYuo=;
        b=Ebu0R8q0kIwAXUzz97rYcDERncv5nvYJ27yAV6OKu8Knb2dwliFQob1zkjWXaTWDu/
         /vf9wKjRXD2ZVsbB3+knX1FXQOvaE8zm6iqYchKZGEMO9zTup8n8Enml/touLzrCIiUq
         5nOwrWonsa8XMHTcX7X6SYD2TgfVn/k/hHVoHwjYAotQ36QlecsHa5hI8WUqcLnaNMcb
         zUQpN5jAbetFmf+kx1biYD9LyJV49PMZnqswDRaxdv2vvzti0aZq1YSry8IqU32mXtJp
         pvIWVrTJhHwGAJbOZl7gW88rSXIituKYxVKE1DfLoYOsGVkDQCIMeLSuycKjcn4BrUV5
         gbQA==
X-Gm-Message-State: ACgBeo2WnO+N0Z2m1D9Y4quX6vojb9d57JHvizWOLok09tG47O93do5I
        I/p0jwPabNGigqM9LzF9s68/dJoEOA3zTQ==
X-Google-Smtp-Source: AA6agR4JGAXHPHSOHFhwkSsggrHHwTh/tlccSqwYhPj/jYYaWtuEwiTAJAFz/0XvNhmtWFNf3+4mqw==
X-Received: by 2002:a05:6214:d89:b0:479:6726:7f42 with SMTP id e9-20020a0562140d8900b0047967267f42mr9245684qve.20.1660983504179;
        Sat, 20 Aug 2022 01:18:24 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id bk26-20020a05620a1a1a00b006bb29d932e1sm5409252qkb.105.2022.08.20.01.18.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Aug 2022 01:18:23 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-333a4a5d495so174894207b3.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Aug 2022 01:18:23 -0700 (PDT)
X-Received: by 2002:a81:658:0:b0:334:a23e:6caa with SMTP id
 85-20020a810658000000b00334a23e6caamr10673189ywg.283.1660983503429; Sat, 20
 Aug 2022 01:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220726210110.1444-1-wsa+renesas@sang-engineering.com> <20220726210110.1444-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220726210110.1444-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 20 Aug 2022 10:18:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgC1zurRE4ytEvNfHnjoHmYYFoFbWd-B+wJ0F7oCBOxg@mail.gmail.com>
Message-ID: <CAMuHMdXgC1zurRE4ytEvNfHnjoHmYYFoFbWd-B+wJ0F7oCBOxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779f0: Add TMU and parent SASYNC clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Tue, Jul 26, 2022 at 11:03 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
