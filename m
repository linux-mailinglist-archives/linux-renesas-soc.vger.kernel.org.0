Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375244EEDB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 15:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241139AbiDANEc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 09:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346084AbiDANEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 09:04:31 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F20921FF77;
        Fri,  1 Apr 2022 06:02:39 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id q200so2002649qke.7;
        Fri, 01 Apr 2022 06:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XWn6Ayp+Iv7M4zR6AfaEpN05pEJLBeViniqUzCfm6kI=;
        b=tcXlmluSB4i+rRyl3i6a878tZ4l5QZuGVDpKoZU596T9yZ5kI/AByBeL8MVMdJYiJB
         1j77oxp1RUp4WLBqFK/U4JkNzT1teD3n32ActpcUxgGgDSLqQwxXEhklMaJUixYGKPst
         qX104omKUxvci92kg7UmIKjePirkHZqnyIceOtATEkd7LLP0i2tkrYHF04CeV/9ttDYi
         ieoWoMdW9+e8CHiYhCtIVxgChPvsL1ZRHgw5OAplr6hXfVE0zbJrjUqm1sGNImXcZ6H+
         5wxMHNDTbpCSKKi/d1Y0ak7eA2P2TxEnfC0SBAJzHD05i03Tf8r6/vsBoS0wWV9lWht7
         ghxg==
X-Gm-Message-State: AOAM531WfRQ9evT4HCAVJHxQ4yhxBtmYwEOCBVvuz/KY9p5dIehl6Gwv
        mFkXdCpnjFPmUeComcmtByLjnIfNJu/PTA==
X-Google-Smtp-Source: ABdhPJxA6MXiLTfqqDQ5ZcuSKo/uykOnfLz0TOwBjH251Gg4CQh6Oo7Z8vb1jDHYwfO7KXQn4/GnnQ==
X-Received: by 2002:a05:620a:22c4:b0:67d:d224:c8cf with SMTP id o4-20020a05620a22c400b0067dd224c8cfmr6479334qki.457.1648818158175;
        Fri, 01 Apr 2022 06:02:38 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id w8-20020a05622a134800b002eb8401862bsm1692307qtk.34.2022.04.01.06.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 06:02:38 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2e5e9025c20so31962507b3.7;
        Fri, 01 Apr 2022 06:02:37 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr9664858ywi.449.1648818157579; Fri, 01
 Apr 2022 06:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com> <20220320123016.57991-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220320123016.57991-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 15:02:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4RX+7s8KXgE=-sfgQa03-yPq5g8W6OfFcCC5AtDL0ow@mail.gmail.com>
Message-ID: <CAMuHMdX4RX+7s8KXgE=-sfgQa03-yPq5g8W6OfFcCC5AtDL0ow@mail.gmail.com>
Subject: Re: [PATCH 3/6] mmc: renesas_sdhi: make setup selection more understandable
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Mon, Mar 21, 2022 at 3:12 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> When I read 'no_fallback', I forgot what fallback even though I was the
> author of this change. Name it better to make the code easier to
> understand.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
