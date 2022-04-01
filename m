Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523954EF762
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 18:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344622AbiDAP4p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 11:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354867AbiDAPh3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 11:37:29 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CE13CA69;
        Fri,  1 Apr 2022 08:09:03 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id 10so2358557qtz.11;
        Fri, 01 Apr 2022 08:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=sQqTiC9OGfhuNjDOSSejZuPTIGOiIJFccJxlppJ7s/s=;
        b=ibYFc3mOIi2u+VOlRXr0El71X4KKqRYTQ2Ms2ukPPHqaTIuU82bqjQiKYiRQzPspsH
         fve4X8HzhySp4rJ8nfSOQMUXZVqXLNykruWQ20bnJIMze5JrmwLo9+EJ8nXQ0UwIRDuv
         clcc2xaRXKMPscJ9QA4bsEMh3IocDCdGpzpgYatp4nAWuoEpHAoLaj4lpSRA6YOXBuYL
         Nv23l3llq6k7zDRUr2BddHAxm2kAoL8SKdlHH/nes1lLXb6tyl8pcDD+iBpVDDjHKHj3
         RtxrhjnhNs+XBYYGbkjDQ59JSXxlrkeClm1OIsu22BtnOsAOYqPAzS1XVxfaoQ2yEGXO
         vr+Q==
X-Gm-Message-State: AOAM533qXYZqqtdAV9GTMyh4YxJ351x43+ixcTN4kHLpWJDFt6UBsWFO
        ehai3k9fhC5PXaLMN/KvcVjhSNiXkc4vOA==
X-Google-Smtp-Source: ABdhPJy5xnXv9zYGi+TNf+Z5I9x8j5JUbhB4m+sg0m3U2TxcIBX5Uzjp6GfvahPSKAevOVSV0PMlBQ==
X-Received: by 2002:ac8:5e4f:0:b0:2e2:2bad:4252 with SMTP id i15-20020ac85e4f000000b002e22bad4252mr8818055qtx.231.1648825742489;
        Fri, 01 Apr 2022 08:09:02 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id i18-20020ac85c12000000b002e1ce74f1a8sm2012889qti.27.2022.04.01.08.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 08:09:02 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2e592e700acso36356047b3.5;
        Fri, 01 Apr 2022 08:09:02 -0700 (PDT)
X-Received: by 2002:a81:5c2:0:b0:2e5:e4eb:c3e7 with SMTP id
 185-20020a8105c2000000b002e5e4ebc3e7mr10694826ywf.62.1648825740763; Fri, 01
 Apr 2022 08:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com>
 <20220320123016.57991-3-wsa+renesas@sang-engineering.com> <CAMuHMdUso+a2UqMTZByGQryj+GvT4go4GB9EOM60D1Ue9oMi_A@mail.gmail.com>
 <YkcTQCZceQcRQo5A@ninjato>
In-Reply-To: <YkcTQCZceQcRQo5A@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 17:08:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDPncJ7Rny6ZOxbgUMnTJPzyu6kmmYUUPkHVfuqi=7NA@mail.gmail.com>
Message-ID: <CAMuHMdWDPncJ7Rny6ZOxbgUMnTJPzyu6kmmYUUPkHVfuqi=7NA@mail.gmail.com>
Subject: Re: [PATCH 2/6] mmc: renesas_sdhi: R-Car D3 also has no HS400
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Apr 1, 2022 at 4:59 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > You mean the DS signal?  That also doesn't exist on R-Car V3M, so
> > shouldn't of_r8a77970_compatible.quirks be set to &sdhi_quirks_nohs400,
> > too?
>
> Probably. The BSP contains the DTS of a function board addon for the
> Eagle board which also enables HS200 only. But I think we should try to
> ask the Renesas HW team for confirmation. D'accord?

Sure.

BTW, SDHI0 and SDHI1 don't have the DS signal neither.
Does that mean we never support HS400 on these?
We do have SD0H and SD1H clocks.
Upstream DTS uses at most sd-uhs-sdr104 on SDHI[01].

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
