Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9EBE57C886
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 12:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbiGUKEu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 06:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbiGUKEt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 06:04:49 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512042A72D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jul 2022 03:04:49 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id e16so900639qka.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jul 2022 03:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uOXz8QbMTWMipwwmnvJ/3UGzYEAZP9gAHMkb9maNqws=;
        b=xqlrlljANOBcroLhypI2VMovZcnQCaaVAs2c5cxDxl1VOKPJOT8sWwh8pytPnwQxvs
         +HXd3sMIrV2jQm5/yEtJM4fLu+treKFyo/1/oi6GLqJM9tkJ5DKJ28Cu1BTAHgYIOdMQ
         zM+h5dK22HdZhdV3b+DhDpEuPGFjwVlT1oMoJdnQFwixv4FN8C2eXaAmLlFNpLPEPNxD
         E9VlV3PWOkP/Bu2UbIq4u9bKWmJOYmUGOrzF9e+8nnCRnZnad3cYsnytMNoJV9LTwAf9
         07jV20N00awmN84g+vWZ8vMzILBADP+A5TtSDy8jQsRq8GAGlOuaHpjxU6PfKLRllb79
         TrjQ==
X-Gm-Message-State: AJIora8A0arw4V5sDnsw1G8o4aT1XDSCw4EKkfaX7cpd1+JwiaK4XCQb
        S0NLDjPsEF5q0hYqX7t5xiFIfBfFBouPGQ==
X-Google-Smtp-Source: AGRyM1sN0sZi74FNGYEei64Wh11o2ml5HkOaK1nSBpEN7SXMx9gMzbx51gCkrHrmxaqTQOs9Z0DjWQ==
X-Received: by 2002:a05:620a:1513:b0:6b5:f53c:78c6 with SMTP id i19-20020a05620a151300b006b5f53c78c6mr11347282qkk.534.1658397888266;
        Thu, 21 Jul 2022 03:04:48 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a249300b006b5da3c8d81sm1201239qkn.73.2022.07.21.03.04.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 03:04:48 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-31e7055a61dso11568597b3.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jul 2022 03:04:47 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr44867082ywb.502.1658397887715; Thu, 21
 Jul 2022 03:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220713101447.3804-1-wsa+renesas@sang-engineering.com> <20220713101447.3804-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220713101447.3804-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Jul 2022 12:04:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSSirymsHqZVj+W0zD1MOGpd19Z9RtBJe=HaK7-Vj04w@mail.gmail.com>
Message-ID: <CAMuHMdWSSirymsHqZVj+W0zD1MOGpd19Z9RtBJe=HaK7-Vj04w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a779f0: Add CMT support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 13, 2022 at 12:15 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This patch adds CMT{0|1|2|3} device nodes for R-Car S4-8 (r8a779f0) SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.21.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
