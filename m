Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED47E4EEDD9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 15:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344149AbiDANLD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 09:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbiDANLC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 09:11:02 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1D635DF7;
        Fri,  1 Apr 2022 06:09:11 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id 1so2043215qke.1;
        Fri, 01 Apr 2022 06:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W9ZVeH/Lv5E7XZFkRWWD5nKiagb2/V5JMj3bkaQWPsY=;
        b=zENtv6FbLq2DZPCT6AifQ1J/T0iEfeV0ezoOx5LfClMwDjoyFiWPD/TUffQ8x2dhjK
         uqim/vt7lUJiyVesc30oNpU6d/OxFWKaDah8fKL2zG7oR5LrqNkOTrgNYvoFKaDyErKV
         1q4hP6P6GytAcLJH0c+n0QWx7g9jiPsGszm+OLrpbVBK5ptqkG7J4a1mdAjTMiSkV57P
         MAnPZy8Mp5ZymcxZeHZOeG1uyMxSyQ7yYOzmPwqiPXzUGvoOUuRkDRjGLlw+Hgqt0I8T
         Ps7YJjvUqRG3Ko1hiIhoKM2VZwJ0m1qljBL9kTxK85lVUsdVrDjeMkhSTVSBC3o5Bk4P
         sEtw==
X-Gm-Message-State: AOAM532J9I3i4T1GW7rAELfB3BKO3eEt18NMwdrzoeW3CsC0JrqwmC3b
        Zy9PMllG7Bphh4oCjSPX4E0rCeD3Hl1fdw==
X-Google-Smtp-Source: ABdhPJzFz417HgFMQgi9T93s4sOMwhYOGDyd+F0chDRewCYhIBpDHdqSrSYpLRS1NhjSlUmmjkCL/w==
X-Received: by 2002:a05:620a:24c7:b0:67f:9270:4b6a with SMTP id m7-20020a05620a24c700b0067f92704b6amr6336490qkn.52.1648818550050;
        Fri, 01 Apr 2022 06:09:10 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id i18-20020ac85c12000000b002e1ce74f1a8sm1807243qti.27.2022.04.01.06.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 06:09:09 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id y142so4868977ybe.11;
        Fri, 01 Apr 2022 06:09:09 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr8256219ybq.342.1648818549313; Fri, 01
 Apr 2022 06:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com> <20220320123016.57991-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220320123016.57991-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 15:08:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEJGr8e5kwKT0xjcQu5F+0XV6QfVpkfAE09koe=01sNg@mail.gmail.com>
Message-ID: <CAMuHMdXEJGr8e5kwKT0xjcQu5F+0XV6QfVpkfAE09koe=01sNg@mail.gmail.com>
Subject: Re: [PATCH 5/6] mmc: renesas_sdhi: make 'fixed_addr_mode' a quirk
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

On Mon, Mar 21, 2022 at 8:02 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> After Shimoda-san's much appreciated refactoring of the quirk handling,
> we can convert now the 'fixed_addr_mode' from an ugly global flag to a
> regular quirk. This makes quirk handling more consistent and easier to
> maintain.
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
