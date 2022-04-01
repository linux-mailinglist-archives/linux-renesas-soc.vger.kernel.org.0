Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58DEA4EF7A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 18:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350396AbiDAQVa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 12:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354731AbiDAQUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 12:20:42 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5111DDFCA
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Apr 2022 08:47:52 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id f3so2295509qvz.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Apr 2022 08:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I4INJ0cnbwVVfR999rpsiqpwDibtqMQV1QlU5oQ4Lk0=;
        b=Lu7wFLpDCEYsJAkjbjMMgAoMGSEwp9Vp4n4DMZ0tVXw+gjjG+8YzVk/umviK7Ch62V
         k4n+ImHhv9Glxuc5lC9HLboNkl2z2Rb+zMm4bjUgEMF4d3ofMcjsNP/rTGskN+QwNeGH
         bgxw8qpJMwx/CPkxThV/c8E4zHnL3VQLBCCaBOEToTNPutH1PEXS5uSp0mI2mtB7lMAi
         nbe4CiycI9F6emrlgPaTXuxT3RAYJaDN5MTZofvrscV1yESYR7hFqroXcEqVmYMCryPM
         LKajuwxRyE9ymgPoXFAn029fi/QTUEtzognLCiaWFCjWubEhJg1TqRtSS/VTZG90zyLC
         ypZA==
X-Gm-Message-State: AOAM530t4CdR+V48oSQIKIHqZ+DQtgw5SqW/j9JJzB+W2ejruozsupfd
        BYIqI6zPVYjE4FK96g3QtqFc7We7AUxVOQ==
X-Google-Smtp-Source: ABdhPJwr2DIpVnVSC6PVEEMGVCA5TUXgRb0TqJzquyOm1IsIHU8X1tHZlctQ6n20S2jTfUZpYrhQ0w==
X-Received: by 2002:ad4:5cc3:0:b0:441:1959:cb45 with SMTP id iu3-20020ad45cc3000000b004411959cb45mr8580468qvb.93.1648828071250;
        Fri, 01 Apr 2022 08:47:51 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id d12-20020a05620a158c00b00648ec3fcbdfsm1403730qkk.72.2022.04.01.08.47.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 08:47:51 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id y38so5723761ybi.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Apr 2022 08:47:50 -0700 (PDT)
X-Received: by 2002:a05:6902:101:b0:633:ccde:cfca with SMTP id
 o1-20020a056902010100b00633ccdecfcamr8798090ybh.207.1648828070557; Fri, 01
 Apr 2022 08:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220319223306.60782-1-wsa+renesas@sang-engineering.com>
 <20220319223306.60782-3-wsa+renesas@sang-engineering.com> <CAMuHMdVTDZ+_4in0x6vJViw2d-gjWfXSVyA0cV=3AZZ3kXpAEw@mail.gmail.com>
 <YkcZZ4PJ+Uhp/z+T@ninjato>
In-Reply-To: <YkcZZ4PJ+Uhp/z+T@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 17:47:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiKyM7oTejOPprAMakWvy5bNE7UPurgJX2H9LcegGWxA@mail.gmail.com>
Message-ID: <CAMuHMdXiKyM7oTejOPprAMakWvy5bNE7UPurgJX2H9LcegGWxA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77961: Add i2c aliases
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>
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

Hi Wolfram,

On Fri, Apr 1, 2022 at 5:25 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Unless you have a good reason to keep them, I'd rather remove them
> > everywhere.
>
> Would you agree to move them to salvator-common.dtsi then? The
> schematics name them that way, also on the connectors.

That might be a good compromise...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
