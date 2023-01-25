Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A1367B517
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 15:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234279AbjAYOuE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 09:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbjAYOuD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 09:50:03 -0500
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0AA53565
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:50:02 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id i12so14231000qvs.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66tDWjX7J+s4zcpRTLlnYZCpN2npYPyCRmE/PW9EQRU=;
        b=3PQWlaqq/lFlfmuYTAfyMsxzLPZB8BTTac6KPgJLTZ9Ftco3G9iI6T2OOVtqA7c2Qa
         TRGuJAuulFHUZdr2tHJuK10tZaF+fdhT99ihHu+3QvpptYuSQb2cNObkoAU2a7p9WnH0
         97uEVx7qlYsCvwnk+0cZ3/MfqdE0U9nymdLdZfox1Kgwmtjc+ju7G+T7gdD7hP/qOlyQ
         qEvq2RZKl70gzrZt2QT++Gq2nkbEOK4N3ZsNgO/KTa5QwsUHpa5pXZtaHWuSd5JPDYp6
         gRu6ZqsC0cBgEg/QSZN0rtIOBtCkPFWzetcSloO5DCuNFutbvDyGsqY5iEJo7hOeLj48
         ahaw==
X-Gm-Message-State: AFqh2kqiaZsM8r0boLgOe41zQn4XGv8DTaP9V/TTzg8k63abZFInJC4m
        AYBscZXd20Lq5H08vHOMqG2KjDJepON2rA==
X-Google-Smtp-Source: AMrXdXsOx6f3gid3nKY8vdUqrsbVXtvZ+ZFjLPSYdQJOpE3BA8gY5oUWf0/cVTnCh9GzHr7zwPVSTA==
X-Received: by 2002:ad4:4983:0:b0:534:9c81:2c15 with SMTP id u3-20020ad44983000000b005349c812c15mr45875843qvx.3.1674658201161;
        Wed, 25 Jan 2023 06:50:01 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id m4-20020ae9f204000000b006f9f714cb6asm3551560qkg.50.2023.01.25.06.50.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 06:50:00 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 123so23259643ybv.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:50:00 -0800 (PST)
X-Received: by 2002:a25:e650:0:b0:80b:8b72:39fc with SMTP id
 d77-20020a25e650000000b0080b8b7239fcmr387984ybh.202.1674658200414; Wed, 25
 Jan 2023 06:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com> <20230123013448.1250991-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230123013448.1250991-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Jan 2023 15:49:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGAaLWf6jxHAQr_adkYQMe971i1W8JkmdgOUk4F7bdoA@mail.gmail.com>
Message-ID: <CAMuHMdVGAaLWf6jxHAQr_adkYQMe971i1W8JkmdgOUk4F7bdoA@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r8a779f0: Add iommus to MMC node
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
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

On Mon, Jan 23, 2023 at 2:35 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add iommus property to the MMC node for r8a779f0.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
