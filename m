Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B687B697D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 14:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbjJCMxf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Oct 2023 08:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbjJCMxd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2023 08:53:33 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BE29B;
        Tue,  3 Oct 2023 05:53:29 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-59f4f80d084so10048377b3.1;
        Tue, 03 Oct 2023 05:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696337608; x=1696942408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GreI765eB2sOrc8ogLZc2cWlkqE2bJ3aCny1Jc1iTs=;
        b=n5ZxYxTcjVp3sPWy80rt5v2J7XSRpTZKBNSuCugqMtAYR1b2obhEpo9TRlmTZRa9Os
         A4ZoblET5ezFtXNIWe5oW1aX6A5gaMWOQJL2MRkt7yh8PdLdYUYOfSXcK3L7HRb1nxOO
         oIF0JpBy5BXzBRU0L6pSNswTkj2WsYYvZmgnGOAXhxl3NSskK8BZHSJllUK2tEk5dUn1
         SBWwtYLXk4YoonmXrBBemY3LS1eC89ndUh0bnv10DYnn4PW6qPYrC9B79k6WFISUrWvP
         fFLzkY4Q4r+s+HO6Pc53hyzVolA3An6quvqHN9kjPxDYqZvmLXy+BPqBIKrYSwVJIGIC
         oMBw==
X-Gm-Message-State: AOJu0YzABjGFGk4Ydl2aWbqUN9GZUrdGFUoEfULAAeiPtcp1enHSUJMd
        iKp7c3y8GKO3nWrzyWmSWi6w4GFrL3Ze6A==
X-Google-Smtp-Source: AGHT+IE1/LBcxALKG2s1sTKo14eGtlcotUUSOpyhu9nhBsesNF4TwdUB1hQMcpyTKGFZoxIFlPvFsg==
X-Received: by 2002:a0d:c347:0:b0:56d:43cb:da98 with SMTP id f68-20020a0dc347000000b0056d43cbda98mr14712824ywd.29.1696337608580;
        Tue, 03 Oct 2023 05:53:28 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id x203-20020a0dd5d4000000b00585f60e970esm354502ywd.134.2023.10.03.05.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 05:53:28 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59f4f80d084so10047727b3.1;
        Tue, 03 Oct 2023 05:53:28 -0700 (PDT)
X-Received: by 2002:a81:8246:0:b0:58d:f1fe:5954 with SMTP id
 s67-20020a818246000000b0058df1fe5954mr15245418ywf.32.1696337607945; Tue, 03
 Oct 2023 05:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com> <87r0mcfn95.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r0mcfn95.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Oct 2023 14:53:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU05AVYKzYYWieHHG_PfTBXzp+95Lh_5nf33Ndo0BrhDw@mail.gmail.com>
Message-ID: <CAMuHMdU05AVYKzYYWieHHG_PfTBXzp+95Lh_5nf33Ndo0BrhDw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: renesas: Add Renesas R8A779F4 SoC support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 3, 2023 at 4:33 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> R8A779F4 is update version of R8A779F0.
> This patch adds its support, but is using r8a779f0 dtsi internally.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
