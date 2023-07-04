Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5806746B36
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jul 2023 09:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjGDHy7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jul 2023 03:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbjGDHyw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jul 2023 03:54:52 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8711AC
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Jul 2023 00:54:26 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-579e5d54e68so34894207b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Jul 2023 00:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457234; x=1691049234;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6665zobkCMIoefjuNofaG3OVMIi7JbWj8SYVnRI94s=;
        b=RAUWuRjaSQvxTYenMEMBHf+qiEnVzSLTHAzXJHUIjQRrStFJwItIfvaWLQP6ReDYEl
         gQ4A7ez+8Wd8RXuvEyjDoT/omc28p55Hw14gzIqnDq1MMXVCRoyuWPrWzzMrR0L4jAWM
         z7MvFcYuwZ1b5TFNCFK3OvvqtWwpZxzwFP7yzeA9FcX2EW5poXhLphB200UryARDzcuE
         oTMpQtzLGWpDLBRfNqsjJCLoG3ch6BOPrpvMICO3//Zg3OnaxL5BaSX+bwOeb2AcoBsG
         FsOphvus8WWZKBwofi0zXieezmU1JQWUOp7x5NIDlag6aFKrx9kXUCEUhGh3Q/6oTaOb
         Qs1A==
X-Gm-Message-State: ABy/qLYQKjHJt8BPuCZ5Fz0rbmERQBR5ZuoIhWpddlE9KxPno9T0gEql
        Tz8KRie0JHwPjGMCo6QSe6x4NiuGYMQFWw==
X-Google-Smtp-Source: APBJJlEN/OXciaedMMJJNiL5LDphawdHWyfdgGfgqEZQzl2T9sR43j7Xm39DjykuO/HvXTOwPlRw6w==
X-Received: by 2002:a25:cf8b:0:b0:c18:f85c:66b1 with SMTP id f133-20020a25cf8b000000b00c18f85c66b1mr11974996ybg.62.1688457234047;
        Tue, 04 Jul 2023 00:53:54 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 127-20020a250b85000000b00be8e8772025sm4699457ybl.45.2023.07.04.00.53.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:53:53 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-bff27026cb0so5882857276.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Jul 2023 00:53:53 -0700 (PDT)
X-Received: by 2002:a25:2fcf:0:b0:c40:e589:7c02 with SMTP id
 v198-20020a252fcf000000b00c40e5897c02mr10328560ybv.20.1688457233620; Tue, 04
 Jul 2023 00:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com> <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
In-Reply-To: <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Jul 2023 09:53:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
Message-ID: <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 2, 2023 at 12:35 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2023-06-27-v6.4 (TBD, oops during EOSS),
>   - renesas-drivers-2023-07-04-v6.4 (TBD).

So that became renesas-drivers-2023-06-27-v6.4.

Next planned releases, if all goes well:
  - renesas-drivers-2023-07-11-v6.5-rc1,
  - renesas-drivers-2023-07-25-v6.5-rc3,
  - renesas-drivers-2023-08-15-v6.5-rc6,
  - renesas-drivers-2023-08-22-v6.5-rc7,
  - renesas-drivers-2023-08-29-v6.5 (TBD),
  - renesas-drivers-2023-09-05-v6.5 (TBD).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
