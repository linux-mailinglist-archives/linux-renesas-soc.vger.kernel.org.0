Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE7E6DD84B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Apr 2023 12:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjDKKu3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Apr 2023 06:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjDKKuU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Apr 2023 06:50:20 -0400
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848AB40C7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Apr 2023 03:50:18 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id ch3so8660748ybb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Apr 2023 03:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681210217;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xs2/x86u4erLtJ74tp6ukYUrJzojRcQ45RRn+/5uWKo=;
        b=C/ACPtaC49VATM9ZbTa2dDyIVtVhn10JlJAobMApFnQKvJVC9Ee/7g7GdgbUOJXMKb
         H9u1boQpPAytm0I1AkfUOqtvZkiZ/5WTQLSSZzZIxLHm3xROwE5DigIjQzBomA2gQGYc
         LPTS297kBauh0MvyrnJvSqPJl9GCU7/qFAHuE2AcLBJ6R7Mso+OQVxDinAuh3KnfN2up
         u5GwV/tCEXJad6UUM3/MFsn6iQCkONctsgsdSfiQ45eNe5JG/ATK144FEZcn8JWtTWbV
         FSl25bQxnCibGXZCO68BGqdZi4WlhBP4WlEyvH3VqubFBL3u6Tj/IYRKAAl3Q9tMYQcY
         TGQw==
X-Gm-Message-State: AAQBX9cITMMbHkQl6wcQfWa5pmz1rix/lk0ua/z4f2MiBswKGjJAwEW8
        eXmx6U5wATI9i0SvzsRvtZNTJLx17UM7rw==
X-Google-Smtp-Source: AKy350bObc1Zlb75eQ00tj/6m1shO2HgYvyR+8HNydQCtkWZ//ahz43Zo3obm2f23i8jHmL3OuEkVw==
X-Received: by 2002:a25:ac49:0:b0:b8b:8abb:d4d6 with SMTP id r9-20020a25ac49000000b00b8b8abbd4d6mr1540889ybd.8.1681210217373;
        Tue, 11 Apr 2023 03:50:17 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id k15-20020a81ed0f000000b0054629ed8300sm3420258ywm.80.2023.04.11.03.50.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 03:50:16 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-54ee0b73e08so152910767b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Apr 2023 03:50:16 -0700 (PDT)
X-Received: by 2002:a81:7643:0:b0:54b:fa6f:106e with SMTP id
 j3-20020a817643000000b0054bfa6f106emr1417332ywk.4.1681210216434; Tue, 11 Apr
 2023 03:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Apr 2023 12:50:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
Message-ID: <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 22, 2022 at 2:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2023-02-14-v6.2 (TBD),
>   - renesas-drivers-2023-02-21-v6.2 (TBD).

So that became the latter.

Apparently I forgot  to update the forecasts, sorry for that.
In the meantime we had:
  - renesas-drivers-2023-03-07-v6.3-rc1,
  - renesas-drivers-2023-03-21-v6.3-rc3,
  - renesas-drivers-2023-04-04-v6.3-rc5.

Next planned releases, if all goes well:
  - renesas-drivers-2023-04-18-v6.3-rc7,
  - renesas-drivers-2023-04-25-v6.3 (TBD),
  - renesas-drivers-2023-05-02-v6.3 (TBD).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
