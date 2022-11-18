Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E45B162F004
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 09:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241668AbiKRIsW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 03:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241561AbiKRIr5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 03:47:57 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6F992098
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 00:46:59 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id x18so2982107qki.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 00:46:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3rBnDpQzOZjch6n4Wdxu5KsgBaNOAlDbONEkGTmxIU=;
        b=mDYTUuVrmghaxAKFN4Iu3qJAf5rxSfugJH8cSQB56pg6uQBj3wXYH9oeIbWvw+gCs5
         wQewFzK2yOJGTEMSS5Ltx4O4A39DOZj4vPxAu4YybxtSw95dFbZCJwZ3kDGZqn4CwXQJ
         a1wCpt89wp2Cnx/4AXg8yW/siyDNXLmrFUApdnilhdxWKRh4pGovo/620bo0eTKPwu9Q
         /WLimY+RVXTFXAvOq+tjbdz+Oxyf8zZk8qCIEnlY6vYYvGhyosLMOb9p3X9nyrUq1esl
         A84gyxxSpHcY9O/tOk3CiVpFCquE3kh+rd5nNdJ0WH9ScnOBgihypcsG/WxolR9Krs7X
         r8yA==
X-Gm-Message-State: ANoB5pmUGzf4K6DrF1WF9iTBAMxnUVBRFH7iJ47JL795iEtT1f/NEfXD
        7iBRJO/rreIgRW3EvtIkn3cf6BBiagmVkw==
X-Google-Smtp-Source: AA0mqf5ncIzaesVhkx8uyWhObEyHleOudgCMmf6NvilR5qcsvBTf25+WqXqhUFzP9Rfb5irINXDYVw==
X-Received: by 2002:a05:620a:1a02:b0:6fa:2d09:d2e5 with SMTP id bk2-20020a05620a1a0200b006fa2d09d2e5mr5004599qkb.609.1668761218712;
        Fri, 18 Nov 2022 00:46:58 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id c27-20020a05620a269b00b006ee8874f5fasm2059471qkp.53.2022.11.18.00.46.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:46:58 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 205so4878623ybe.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 00:46:58 -0800 (PST)
X-Received: by 2002:a25:2d4e:0:b0:6dc:dc81:aaf4 with SMTP id
 s14-20020a252d4e000000b006dcdc81aaf4mr5165055ybe.365.1668761218112; Fri, 18
 Nov 2022 00:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20221116202110.1770-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUVmapwN_OHpn4RtQebZCbEi3avka+2MuWpCk59g5UyLA@mail.gmail.com>
 <Y3c0lpl8zzKMnRPO@ninjato> <CAMuHMdUynqKtPF4fBP-Wo6K2++1cStDzgTQ6gBmcKsTHmKbhZw@mail.gmail.com>
 <Y3dCig4CPYBQMJ/l@ninjato>
In-Reply-To: <Y3dCig4CPYBQMJ/l@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Nov 2022 09:46:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzyxSb0aiMhLOFbxSHdKrku5ae522US=S4p2xV-7ub_g@mail.gmail.com>
Message-ID: <CAMuHMdWzyxSb0aiMhLOFbxSHdKrku5ae522US=S4p2xV-7ub_g@mail.gmail.com>
Subject: Re: [RFC PATCH] clocksource/drivers/sh_cmt: access registers
 according to spec
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Nov 18, 2022 at 9:30 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > "2000000UL / rate + 1" is not guaranteed to be a multiple of two?
>
> Right, I missed the '+ 1'

Even without the "+ 1".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
