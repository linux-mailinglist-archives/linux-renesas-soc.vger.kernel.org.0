Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 206A867C67F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 10:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbjAZJBd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 04:01:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbjAZJBb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 04:01:31 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E622442DF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 01:01:29 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id v19so750467qtq.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 01:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzSme4T3+IGtZRjmdZKuDb9EMsIKHd1aNLOJUoa3E/k=;
        b=AZe5CzVIgaDDp2TokCfkmBmTHxd8EA6quU91E1NKIHIYIJKWyueodafDDDNvhw3qgs
         2z9CgUgAJU9LLymPihguoUQVE7T/IGuHs4RuqjwStxu9HrKyUtUakF9nvIk0z1jcz1Fb
         7GcjLee6mNwTwfPEpnN8oogOdnmnlRwNfhEgWOp9adeQ29b7NecHrBpDeS6fHvE0rJ/J
         jaKQvC3ZGlheQQCImlXAdknnfTO9/Dsn+3zrDZjlZ32mpCheLDdGIsrLTORti0bewXi8
         d0f2TOmjx41caSN91vuIdwQQQuZ6S4wa5Jb/e87ACgWVe31wHJGJclaRkQguY1XVTN3G
         U24Q==
X-Gm-Message-State: AFqh2koWIPJHQCrIk5WIWJAo3nHwIJ+jryDFUbOzDpaka92+gmHqHLnw
        CcGXmIhf+DkYlpU0fxBRmpGZQILNn4QoOg==
X-Google-Smtp-Source: AMrXdXvhRpEEfAkbYek1xYSg8+POw6KzwnquyPTytbH5XnUKh6w/ueGSd5nq4UXMTae47yqh2MzIpw==
X-Received: by 2002:ac8:6618:0:b0:3b6:9736:2e9b with SMTP id c24-20020ac86618000000b003b697362e9bmr33339488qtp.26.1674723688544;
        Thu, 26 Jan 2023 01:01:28 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id fu3-20020a05622a5d8300b003a7eb5baf3csm380553qtb.69.2023.01.26.01.01.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 01:01:28 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-50112511ba7so14783207b3.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 01:01:28 -0800 (PST)
X-Received: by 2002:a81:68c4:0:b0:506:6059:e949 with SMTP id
 d187-20020a8168c4000000b005066059e949mr702534ywc.502.1674723687820; Thu, 26
 Jan 2023 01:01:27 -0800 (PST)
MIME-Version: 1.0
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Jan 2023 10:01:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHuB3ETAHzo1JwfbHoXPHVEtYmuASC_x-TWVRD21d4fQ@mail.gmail.com>
Message-ID: <CAMuHMdVHuB3ETAHzo1JwfbHoXPHVEtYmuASC_x-TWVRD21d4fQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: V4H Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, Jan 26, 2023 at 3:18 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch-set is for V4H Sound support.

Thanks for your series!

> Sound test on V4H needs Custom White Hawk and extra Sound board.

Do you have more details?
I assume you can get digital sound from CN-40?

> Sound Driver Gen4 part is not yet tested, but SoC parts are OK,
> and these are for it.

What do you mean by "Sound Driver Gen4 part"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
