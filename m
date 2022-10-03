Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFFBD5F28DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 08:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiJCG6W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 02:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJCG6V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 02:58:21 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88B43B3
        for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Oct 2022 23:58:20 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id de14so6324335qvb.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 02 Oct 2022 23:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VE2EaszWSOVK09P0giOKgf38Sg2kH5fRHizmc7GoTCQ=;
        b=Z6/FSGH1oQZWeDJJ+fUecFQ76zJOmn9+lG0/431t+l7wSBFgNnKlP9SvKBR2NS4CyW
         s065HTdylwf+Wvzpv2HWNodV1XnQGIacEyL8bVHDzN0Qsx/s7tiQ53JPHxC8GkcSLzpB
         clDezVsMzyGwKZkDlQEPVaRk7V9wgvokVXyg0KoiTZ8Wv8Z6xf2Iofoy3xhAaP8t/fht
         V6XD28DQusJ+3Cva/kTBAw2qATm6reGTTgP6zDA2/N0yQxDcpwRq1UqzyuzX3p/ihAP1
         9YWlRT/4z+5SeqzyQRkRQ+F10JB4YkH05Z/uL/lV3tKklbCtZv5hsxY+N8A0GiXQzmjV
         isdA==
X-Gm-Message-State: ACrzQf2smle7az/HyjnmMgszs7io1VxCDGZ7FeeoOUQz98ylIvdItwoQ
        QncG4AvM0N68CehCgnq2vxoYU+Uq9C0Zfg==
X-Google-Smtp-Source: AMsMyM4S5LpChRNteIcC8HN9UlxDw3Bw72Nh8UKjJ1LE1aQ12o0ksdFxt7HyRFO18xnCQjZLHg/SCQ==
X-Received: by 2002:a05:6214:d8c:b0:4b1:7bfa:1f93 with SMTP id e12-20020a0562140d8c00b004b17bfa1f93mr6438491qve.70.1664780299504;
        Sun, 02 Oct 2022 23:58:19 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id y19-20020a05620a44d300b006b8f4ade2c9sm10938724qkp.19.2022.10.02.23.58.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 23:58:19 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id o123so12008801yba.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 02 Oct 2022 23:58:18 -0700 (PDT)
X-Received: by 2002:a25:3a02:0:b0:6bb:fce3:7b06 with SMTP id
 h2-20020a253a02000000b006bbfce37b06mr18798059yba.89.1664780298718; Sun, 02
 Oct 2022 23:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be>
 <CAMuHMdWdrugZEN=7yqrsSc86AeuFR2=qM7nRk_aD=UXW9Q6cLQ@mail.gmail.com>
 <CAMuHMdWiQNjx9_hDhMEe0gHLiqLw1U0Sy0JSb+bdXHEBMgyNvg@mail.gmail.com>
 <CAMuHMdXAdeVXFytY4_ffNUJ6JVVt4SpVyk4wwDx4yMNY4hwG4Q@mail.gmail.com>
 <7b05d61c-3f81-c58d-3728-88a2b4a5201f@arm.com> <CAMuHMdWhHMMzaLhko38Twi2Qv81qtkzsuz0T=Jb4PjLqes09TA@mail.gmail.com>
In-Reply-To: <CAMuHMdWhHMMzaLhko38Twi2Qv81qtkzsuz0T=Jb4PjLqes09TA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Oct 2022 08:58:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLtoY4ccMdhkJozHAbtYxJtotfu9+NRtaEF9n7UBznww@mail.gmail.com>
Message-ID: <CAMuHMdXLtoY4ccMdhkJozHAbtYxJtotfu9+NRtaEF9n7UBznww@mail.gmail.com>
Subject: Re: [TF-A] Re: [PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node name
To:     Sandrine Bailleux <sandrine.bailleux@arm.com>
Cc:     tf-a@lists.trustedfirmware.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Sandrine,

On Tue, Sep 20, 2022 at 12:04 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Sep 1, 2022 at 9:57 AM Sandrine Bailleux
> <sandrine.bailleux@arm.com> wrote:
> > TF-A project uses Gerrit for code reviews. Please refer to the
> > "Contributor's Guide" [1], in particular section "6.3. Submitting Changes".
> >
> > Could you please post your patch to review.trustedfirmware.org, adding
> > the Renesas platform maintainers as reviewers?
>
> Thank you, I have done so.
> If anything is still missing, please let me know.

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/16792
seems to be stuck because the CI tries to build for the unsupported
"versal_net" plaform, hence fails.

What's the next step?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
