Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D347EBEEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Nov 2023 09:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343499AbjKOIz6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Nov 2023 03:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343492AbjKOIz5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 03:55:57 -0500
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1536710D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 00:55:55 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a86b6391e9so77959807b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 00:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700038554; x=1700643354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HL/poyLJsijRf52soOQExG8kcI/orhsYPyE8cpMnPa4=;
        b=F85SnOVG1MzF1nXXZxx6ITqYJ7bNAPWVg0bPW8SJxSsq9/yPQAIqccstswFL0fNOli
         KmarBHhYy2vdlWhN0DnCm72VcJ4y3k2fQd7DjfTqEVa60q8t24thoSSfhcwu1wfMaGnE
         075kJ2Dj6eQOkivb2Ce6dJv5LO8bQTA61Swt6qq+FhytnfN5u4jlSEGfd/ch6Fcmgjvm
         /UDLr4hM9mBeSaEG9R6yokb07C2DZ/OZv7VnhLsbTNM4Ac02C/aq+n4xSI/R02/z8ryQ
         WEN0v3XNUGr+NK8XI3RGQT7m+dqCS2eRIMSum/dUUmlPxTXHjYjRoIHloVrIS+Y7OgWM
         7BKw==
X-Gm-Message-State: AOJu0YwJsAHWg07cpfmc3TAcTk7HdxHAygxu5PTUlI4OcsHjTfeYxRDf
        5Jj3hFf4Nv2LSK3IuwrenKV+AmqIcbKVHg==
X-Google-Smtp-Source: AGHT+IFwbhON/bE1mWIdE/JWtiFkZFlbdcpG2/F9oAqD2S8K2oyRj0txeGuu5aK+KnlUV/qWggzyTA==
X-Received: by 2002:a81:a14b:0:b0:5be:997a:8173 with SMTP id y72-20020a81a14b000000b005be997a8173mr12608898ywg.35.1700038554028;
        Wed, 15 Nov 2023 00:55:54 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id b81-20020a0dd954000000b0057087e7691bsm260195ywe.56.2023.11.15.00.55.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 00:55:53 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5bf812041a6so72408867b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 00:55:53 -0800 (PST)
X-Received: by 2002:a81:4886:0:b0:5be:a164:5673 with SMTP id
 v128-20020a814886000000b005bea1645673mr11850482ywa.3.1700038553519; Wed, 15
 Nov 2023 00:55:53 -0800 (PST)
MIME-Version: 1.0
References: <20231114122252.2266799-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20231114122252.2266799-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Nov 2023 09:55:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXWb9HcaNbpQC4UhWea=JD-ZyAL5X87TB+GyO1B034vyA@mail.gmail.com>
Message-ID: <CAMuHMdXWb9HcaNbpQC4UhWea=JD-ZyAL5X87TB+GyO1B034vyA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779g0: Add PCIe clocks
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 14, 2023 at 1:23 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add the PCIe module clocks, which are used by the PCIe modules on the
> Renesas R-Car V4H (R8A779G0) SoC. Note that the following descriptions
> in the hardware manual Rev.0.81 are incorrect about the PCIe module
> clocks:
>
> 9.2.1.7 Software Reset Register 6 (SRCR6)
> 9.2.1.12 Software Reset Register 11 (SRCR11)
> 9.2.3.7 Module Stop Control Register 6 (MSTPCR6)
>
> Instead of that, please refer to the Figure 104.3[ab].
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
