Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 923BB52CF96
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 May 2022 11:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbiESJmH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 May 2022 05:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbiESJmF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 May 2022 05:42:05 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC6D70904;
        Thu, 19 May 2022 02:42:05 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id k8so4327400qki.8;
        Thu, 19 May 2022 02:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+mLwj0qU8ZU0MrTXWXte/qaAR13ENOjRWyhWbMomZA=;
        b=4lGB7TohVRDYUG7iL7SBXpiIewRsoGQxbN2qWPaoi40rbiH4uHgcg2p/WcMung2l1f
         uAFs1KaxseoXfnaFO+08hwRZFhoSUTTvuF123Oic8K3yDp76rT3N4uG8IGQ/G2riPw8a
         swujuTylIBb1bK8poud2AqKIUKy13gv/PAjJKcwbInL2L22oAROwCHksOt38ty8V183H
         1Rc6XD5iukyiKnHSCC8gwP97k5KgIvCw/b1ocV8rb6S+Q55kr8w4UEviEtBE4x3o9ugG
         kllCc5krJC0OH4GNyj6yLOcNsfVCpfAXR4K5P0VZEW+PrDXD/BiqT+HvRgXPH24al04S
         l4yQ==
X-Gm-Message-State: AOAM532/fEUQVJmN9+ZaMj0B1GMSRcDXsQnqOJeUHWMMnmBhGZ8z9Vz0
        Wp2u6bCdfGYRIiP2YQhutiduLYWznMQyFA==
X-Google-Smtp-Source: ABdhPJwJYa8dk+xyRXXtw2xGw/sErdgqDY+HYVQJJYR8E3DYg/VipRQ2Z4bVdWT5ujC9EkLoHOKqmA==
X-Received: by 2002:a05:620a:15f0:b0:69f:cabb:1f52 with SMTP id p16-20020a05620a15f000b0069fcabb1f52mr2467311qkm.24.1652953324202;
        Thu, 19 May 2022 02:42:04 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id h2-20020a376c02000000b0069fc13ce242sm992556qkc.115.2022.05.19.02.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:42:03 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id v71so8067186ybi.4;
        Thu, 19 May 2022 02:42:03 -0700 (PDT)
X-Received: by 2002:a25:e7ce:0:b0:64d:6028:96b9 with SMTP id
 e197-20020a25e7ce000000b0064d602896b9mr3363664ybh.365.1652953323061; Thu, 19
 May 2022 02:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org> <20220518172808.1691450-3-ralph.siemsen@linaro.org>
In-Reply-To: <20220518172808.1691450-3-ralph.siemsen@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 May 2022 11:41:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUn8EwLprc1A2UG=RHzGBm0ZEJpNgkkFePqmHoBm0MWEw@mail.gmail.com>
Message-ID: <CAMuHMdUn8EwLprc1A2UG=RHzGBm0ZEJpNgkkFePqmHoBm0MWEw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a06g032: remove unused field
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
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

On Wed, May 18, 2022 at 7:29 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> As the D_UGATE macro no longer uses _gi, drop it from all declarations.
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.20, folded into [PATCH 2/3].

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
