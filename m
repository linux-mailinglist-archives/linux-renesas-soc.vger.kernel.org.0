Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE9A5F663F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 14:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbiJFMlK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 08:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbiJFMlI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 08:41:08 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145699F77C
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Oct 2022 05:41:04 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id x18so888001qkn.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Oct 2022 05:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=JiLu8lqRwjZu0bTrwE13gkIKumEkyQ7K7yg8IICQqyU=;
        b=Q9Mc6WObS9ANNdKFhCA6J6JOgK92jMCFM3X895cwvzIw1FP7wOxUQtgcgXW2sXOo2f
         Qjdr0vNrhDXvmWFQ+sT649i4Gk6EQjCm6rBUkwWWGJW5PuEPokUBdoAIWwj+6ppfAGMU
         URDjTGqMz5/N94zOYsBH+GlHaH3QDxF892eadDIVJpQvvp3dpSoCHdzmul3okVviKIbq
         wvkqKF0AaKrvQrC68KWbP5CjZ80lycm03hxg6oESyXFS3Eq/LRGGGxtr5wGEnX416C7w
         0ZK8cN+0785SUz5M4Y1bDjkm9KXWsvjDpqCb3CkAwTZNmAnUPl2eaVXqtg2mPI6nIM+U
         Jzfg==
X-Gm-Message-State: ACrzQf0qVlk30tbhAUbq0oWj8NtPtMt2WiQ4dV9OC0lZ2FUSctkPmJ1s
        Ths+u/WQSrGB71IgXMkSbLc8t8M6iKcyKg==
X-Google-Smtp-Source: AMsMyM44WvGbHPLIie/tl1h3jhSHK+LcrfP1IHyccDDJJJpQ8kOgQtXlhbB/iI0mXzJ9wmB1yOYhIw==
X-Received: by 2002:a37:ac06:0:b0:6e3:8ddf:d45c with SMTP id e6-20020a37ac06000000b006e38ddfd45cmr3087356qkm.22.1665060062835;
        Thu, 06 Oct 2022 05:41:02 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id w9-20020a05620a148900b006e62cd6aa5bsm1041564qkj.61.2022.10.06.05.41.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 05:41:02 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-349c4310cf7so16519167b3.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Oct 2022 05:41:02 -0700 (PDT)
X-Received: by 2002:a81:848c:0:b0:356:e173:2c7a with SMTP id
 u134-20020a81848c000000b00356e1732c7amr4146755ywf.502.1665060062262; Thu, 06
 Oct 2022 05:41:02 -0700 (PDT)
MIME-Version: 1.0
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Oct 2022 14:40:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
Message-ID: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
Subject: Future renesas-drivers releases
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Next planned releases, if all goes well:
  - renesas-drivers-2022-10-04-v6.0,
  - renesas-drivers-2022-10-18-v6.1-rc1,
  - renesas-drivers-2022-11-01-v6.1-rc3,
  - renesas-drivers-2022-11-15-v6.1-rc5,
  - renesas-drivers-2022-11-29-v6.1-rc7,
  - renesas-drivers-2022-12-06-v6.1 (TBD),
  - renesas-drivers-2022-12-13-v6.1 (TBD).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
