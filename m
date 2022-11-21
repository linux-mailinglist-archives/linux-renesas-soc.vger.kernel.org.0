Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91BB1631B7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 09:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiKUIeZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 03:34:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiKUIeY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 03:34:24 -0500
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1B9167CF;
        Mon, 21 Nov 2022 00:34:21 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id d8so7513751qki.13;
        Mon, 21 Nov 2022 00:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8MgetOy5CnVNmfwc+KbsEuIV70+zhmbk49OeDSi6Pc=;
        b=F5v+MXOUFlj2H7FZwBqQ9wuU/2NBcy7SG5quyeOooYi5aXsQKX94LP7Emz5gLExVXV
         uy9f3h8J9iua/ZvEQEQPDHLHYtPv7jZPV1EnYdu2oFUDRrNPU5OxlPsgIX3T1pckiE/U
         inOR6a0+ialu5UnXq2iMNN1QzAiScn7d+f8dWTviUKqA6g7FVQeDy1t9jsZv5C7eZ5LG
         nQuRNu1qCs9hfiNTLUZzCFrsJFT1lnqw8s9UIJyKHsJFF3Ct11K6cZE1Qo1vJW4ACD+P
         JeAiuWo5C8yS6eht52iPB3cXp7Ld7zoV6nCDBe6RGQUPqdanmTgsdxO5E7c2q9PqQIjN
         eqBg==
X-Gm-Message-State: ANoB5pmodKfIESvvjVOGKcJHfsrzM8VAWuq/uIWMh5Ck/QkD34hzSkeO
        fd58XoqgFgGHsfswNrPwYRJDQvO4F+3i6w==
X-Google-Smtp-Source: AA0mqf4glMGYaG/0ZN1T8zjt1/lDfnJGeND+0VyYva3ucqPH4dv03q0Wpl90BVvQcnGTjK3EA0w/DQ==
X-Received: by 2002:a05:620a:191a:b0:6fa:774:16e3 with SMTP id bj26-20020a05620a191a00b006fa077416e3mr15410734qkb.46.1669019659994;
        Mon, 21 Nov 2022 00:34:19 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id j6-20020a05620a410600b006fa2dde9db8sm7894288qko.95.2022.11.21.00.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:34:19 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id k84so12762973ybk.3;
        Mon, 21 Nov 2022 00:34:19 -0800 (PST)
X-Received: by 2002:a5b:24b:0:b0:6ca:3b11:8d76 with SMTP id
 g11-20020a5b024b000000b006ca3b118d76mr16176436ybp.202.1669019659156; Mon, 21
 Nov 2022 00:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20221120113457.42010-1-wsa+renesas@sang-engineering.com> <20221120113457.42010-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221120113457.42010-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Nov 2022 09:34:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWGYfChJ-jyyKLJVb6q34ZjvDnvb+FdVEzdoTsSR0Oo6w@mail.gmail.com>
Message-ID: <CAMuHMdWGYfChJ-jyyKLJVb6q34ZjvDnvb+FdVEzdoTsSR0Oo6w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mmc: renesas_sdhi: add helper to access quirks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Nov 20, 2022 at 12:52 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add a macro to check for a quirk because it a) ensures that the check
> for non-empty 'quirks' struct is not forgotten and b) is easier to read.
> Convert existing quirk access as well.
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
