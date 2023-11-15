Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBF527EBEBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Nov 2023 09:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343527AbjKOIo4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Nov 2023 03:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343525AbjKOIoz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 03:44:55 -0500
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E57A10E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 00:44:51 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5b383b4184fso76761157b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 00:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700037890; x=1700642690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1OERzrXWRqF1eIEpzu9O3nN2cbwmK0YaD16D94PeSY=;
        b=DEPA1R4wC0vie6AjS646mGlK6/9uQSe2xjGhYkL6eUXhDXsyNtD3gUGnwlkiNL2Dfw
         ge986f39M/j5UlvlfHmcUEV7dVPI5UfowBZ2+TJDhA3AWHclqeR/JWLydgoNPvrHEaZF
         b/TWiWE0mTbA3J0HqNOIF3anSVKr2PPSCqMCpE/b/9V4HPEQi8r+pL0QvdoY0EcJ+Rax
         pIrIo/x/bmRIDcaNcs1UJGYiys6ze6K/udOXqdQx8FG1e+nN0ovXbgu/UUrKE4T0VAYt
         ZROcJUVGBuaRv986zf5OViZyRwtPKSFgZMDSHu78Zv4rODHDS8mz0RwbHmpAg3iUx7aC
         U5WA==
X-Gm-Message-State: AOJu0Yzl5BDwpO2e3WZNezHSllM7D++c7jCOBOhs2+McZ3pnIMbi7Hc8
        6qFrC6T6SK5J3E5xzRBrmHUEVhty5QkU9Q==
X-Google-Smtp-Source: AGHT+IGcOnufGGPnaPFAm0vO1zfUIGmBZCp6D+akbtwB1pKnRWeF8sguGyavZUGp1NBZP1Rn9zYUqw==
X-Received: by 2002:a25:7751:0:b0:d9a:f666:b68e with SMTP id s78-20020a257751000000b00d9af666b68emr12796276ybc.30.1700037890297;
        Wed, 15 Nov 2023 00:44:50 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id h7-20020a259747000000b00d9a577d8434sm225296ybo.53.2023.11.15.00.44.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 00:44:50 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a87ac9d245so76598787b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 00:44:50 -0800 (PST)
X-Received: by 2002:a25:aa2c:0:b0:d9c:aa17:2ae3 with SMTP id
 s41-20020a25aa2c000000b00d9caa172ae3mr11260416ybi.64.1700037889839; Wed, 15
 Nov 2023 00:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20231031145739.657638-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20231031145739.657638-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Nov 2023 09:44:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdae7-UcJVvqd4P0uVuQ8Gd9vWSijdfja4DmBy1o=2+w@mail.gmail.com>
Message-ID: <CAMuHMdXdae7-UcJVvqd4P0uVuQ8Gd9vWSijdfja4DmBy1o=2+w@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779g0: Add EtherTSN clock
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org
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

On Tue, Oct 31, 2023 at 3:57 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the TSN module clock, which are used by the EtherTSN module on the
> Renesas R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
