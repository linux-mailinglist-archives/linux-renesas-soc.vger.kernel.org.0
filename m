Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57237BFD29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Oct 2023 15:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbjJJNTO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Oct 2023 09:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbjJJNTN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 09:19:13 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94528CA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:19:10 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7ac4c3666so16474367b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696943949; x=1697548749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dxdG/ZRE9yLFZ1V3viwpI81b7wQ//TjpxYIorqlmwo=;
        b=ZKkkatT+7kdNuuUCmmViCHXzxEBHcKMewwCwrI2OO8/Qfawxf5oilwMf93NMEUlVKA
         GvK9aT1X0UlQ1mU1AI2uzEyjZw3Z0v7af0Nc1Kt66VFoS2bRZOVjQYopJXLhMBMGaW2Z
         crc+FcRkY2aDBDxh0ZjKwdTCf1qs/GF1clc4k+NrYX+R5r+8bX9KuvVlcUNsltJrXQem
         q29QcYyK8P1G8+YIEKsY4SaIlM0dH128r0GI5p154GRdRfFPXJCOtekE1QjX7IBLegAS
         PJu6dsVlQdBaxphCtrkL2CgnkDtsMHSMKV406+vucQMF+aQ5Tl+FQ82Ifs90Ed1Jkdhv
         a4yA==
X-Gm-Message-State: AOJu0Yw6BDPvBoIFcYri/FeDYTclUySXzcJMcL99NLu5+qL7qQH47bEj
        3zSncwY62tEks263fDQTD5JSR5CORULFOw==
X-Google-Smtp-Source: AGHT+IFOmdUU1cD1wXXj+f/bCXsBeaE2dMVU9mP821v4mWtbj3cGSWf/yruf28HIrld0E6uV8cav8g==
X-Received: by 2002:a0d:ca4f:0:b0:5a7:bcac:7d3 with SMTP id m76-20020a0dca4f000000b005a7bcac07d3mr2341594ywd.9.1696943949602;
        Tue, 10 Oct 2023 06:19:09 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id v83-20020a814856000000b005a7d50b7edfsm10498ywa.142.2023.10.10.06.19.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 06:19:09 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59f6441215dso69380607b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:19:09 -0700 (PDT)
X-Received: by 2002:a0d:d748:0:b0:5a3:dc2b:6f44 with SMTP id
 z69-20020a0dd748000000b005a3dc2b6f44mr18747498ywd.18.1696943949224; Tue, 10
 Oct 2023 06:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <527f23d5290c5d62984093e78b4b20ffc212a0c4.1696943815.git.geert+renesas@glider.be>
In-Reply-To: <527f23d5290c5d62984093e78b4b20ffc212a0c4.1696943815.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Oct 2023 15:18:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0t5zoxrPrX8c=wY0Q-Ynxzgk6kUhCti0Th=L8MqTboA@mail.gmail.com>
Message-ID: <CAMuHMdW0t5zoxrPrX8c=wY0Q-Ynxzgk6kUhCti0Th=L8MqTboA@mail.gmail.com>
Subject: Re: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.6-rc3
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
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

Oops, rc5.

On Tue, Oct 10, 2023 at 3:17 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Refresh the defconfig for Renesas ARM64 systems:
>   - Disable CONFIG_ARM64_ERRATUM_2966298 (No Cortex-A520).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
