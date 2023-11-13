Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE3C7E9AA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Nov 2023 12:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjKMLEG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 06:04:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjKMLEF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 06:04:05 -0500
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B869ECB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 03:04:02 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5afa5dbc378so43259127b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 03:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699873442; x=1700478242;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0Mx0JqXfrdYeaP62h+1G6OuLHd8SctifzAQauT3crg=;
        b=YaIyzCDtGSiE49hRqQPD/ImeaI+GZrRRb+AIDUZdMlvci3ZTsugu6Ep6lNLygjOo+4
         SUyka6UPzHoutMT3RW+7CDYU2tVd6cMZTJqoznUHPz/ZvWy0Rfj8bbUgB/VnamiNU0Hs
         EEVgoTxvgyUiVzQs8tJbM+Jgiuj+qAgPJsevkL0s5GqmlDr6mwiWZLpS4LLHptwkcfwG
         d+kxOWIpFoGuHKtS70n2/2SrE/oGPgGODT6bnex4jx3sIt6GFsRkBwNwgbQ0qF4hQC1i
         YwEaB2P7ccj7gnp6aJ8timclybi2zsknCaZpDltz9sPpXApOX5MfPMuEP5KXP4/jlJLS
         y3hQ==
X-Gm-Message-State: AOJu0Yy9aB1HbdLq5qJaD28zEJODNJ0ZvEiDWDUKrBL6Aoxr5Nxm3Hbx
        jb4UwWe1QbPdbN2o3Qi8ncUuHJmt8/xb4g==
X-Google-Smtp-Source: AGHT+IGwZCJ2Nb2RJtF7lST4Jxbds/A7qFQIJ8GHq4RAOOPjij9Vcetd/ql4KqC4hcogwKxBP04s8g==
X-Received: by 2002:a81:5248:0:b0:5a7:ba17:7109 with SMTP id g69-20020a815248000000b005a7ba177109mr4288407ywb.1.1699873441785;
        Mon, 13 Nov 2023 03:04:01 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id d6-20020a814f06000000b0059b1f6d1959sm1684346ywb.101.2023.11.13.03.04.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 03:04:01 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a7fb84f6ceso43092377b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 03:04:01 -0800 (PST)
X-Received: by 2002:a0d:ddc1:0:b0:5a7:b797:d1e4 with SMTP id
 g184-20020a0dddc1000000b005a7b797d1e4mr3902644ywe.21.1699873441121; Mon, 13
 Nov 2023 03:04:01 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
 <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
 <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com> <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
In-Reply-To: <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Nov 2023 12:03:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
Message-ID: <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 11, 2023 at 5:06 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2023-10-31-v6.6 (TBD),
>   - renesas-drivers-2023-11-07-v6.6 (TBD).

So that became renesas-drivers-2023-10-31-v6.6.

Next planned releases, if all goes well:
  - renesas-drivers-2023-11-14-v6.7-rc1,
  - renesas-drivers-2023-11-28-v6.7-rc3,
  - renesas-drivers-2023-12-12-v6.7-rc5,
  - renesas-drivers-2023-12-26-v6.7-rc7,
  - renesas-drivers-2024-01-02-v6.7 (TBD),
  - renesas-drivers-2024-01-09-v6.7 (TBD).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
