Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 592A3715998
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 11:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjE3JMj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 05:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjE3JMh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 05:12:37 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9B5EC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:12:36 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-bacf7060678so6304909276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685437955; x=1688029955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZhK2M1Cfa1iJzk10nePeejfDL9JBpHmZ+wG1SkXTeE=;
        b=eElFt9wcd3phAgOD+XfxPLg0706ABB5Faa2NBu8n8dVyfiOPleT92IhlYrFkUHpzSr
         nZ+dlnhhhnrj/akiHi9rfGFOOPF8uzsBGrGbzzapYZAmntXDrDZy46h0zBSG4Q4Z145q
         O3/A7zUpR6JONG/AFzoZurtt2Vqr+jvz/mE/3OQdF5kMV6jG6STBYqT0MT0/e0lAnOU8
         T3+3CacBJBcwzi9tU37GJp+N1mgwxp+WHbQWFK5yJqtksMU1cjr85UacHb+VrRs8fBj3
         q+Y9S5XT7ovI4ISWNAjk49sxHbopOvhlGN8Af+nkIXm5MT3jb5Pq4ewo3hTgxuJkrGt7
         PdGw==
X-Gm-Message-State: AC+VfDywGceLg3ECS4DmRjVBx/2fZM35asJC/L76ogaC4RmJs4keZkPW
        cMoTTGHaE8u0fhtvT0yaVqo5k3s3uxNukg==
X-Google-Smtp-Source: ACHHUZ6K3+FQa/bJO0TulPljkjfjSEakK3iMq5rqn0jI684WSFFaJn8DW54AaqXsrM2To9c3bQDafQ==
X-Received: by 2002:a25:1986:0:b0:b9a:5606:a6bb with SMTP id 128-20020a251986000000b00b9a5606a6bbmr1678999ybz.0.1685437955506;
        Tue, 30 May 2023 02:12:35 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id f12-20020a25b08c000000b00ba6ffc7ef35sm3395689ybj.65.2023.05.30.02.12.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:12:35 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-561b7729a12so73458897b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:12:34 -0700 (PDT)
X-Received: by 2002:a81:a20a:0:b0:565:b76d:82c8 with SMTP id
 w10-20020a81a20a000000b00565b76d82c8mr1807431ywg.5.1685437954717; Tue, 30 May
 2023 02:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230525084823.4195-1-wsa+renesas@sang-engineering.com> <20230525084823.4195-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230525084823.4195-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 May 2023 11:12:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhRp5fOrsZveH1HN+SbYBgQVx1hVePhWVLNm=5tk2GCA@mail.gmail.com>
Message-ID: <CAMuHMdUhRp5fOrsZveH1HN+SbYBgQVx1hVePhWVLNm=5tk2GCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: ulcb-kf: add HSCIF1 node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 25, 2023 at 10:48 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Exposed on CN4. Tested by connecting it to a Renesas Ebisu board.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
