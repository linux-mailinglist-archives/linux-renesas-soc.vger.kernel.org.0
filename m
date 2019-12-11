Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFED11A545
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2019 08:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbfLKHoM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Dec 2019 02:44:12 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45027 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbfLKHoM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 02:44:12 -0500
Received: by mail-ot1-f66.google.com with SMTP id x3so17929295oto.11;
        Tue, 10 Dec 2019 23:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SSkmzSLd0mhEamwLjE9BgKTPi/OpTk4Lal5ysSTN9q4=;
        b=dYSPAoY1ZGEh22Z/4972Br9x6dH1gjevqoht82/XjGvQ60NKyrxj5EE+LerQrDXZNo
         e6+X3/5KS2euhT9LjGwd/It3s/BfSy9fM913cy4KPjYWUYMnKz7l3qvKJ7mNeW2RhzFf
         0LuGaLrli7IcU84MBJzMKFUDfD4Kij+hHtNhMDLCrXpO/yWUKvOni8p5z4XHFt7YzIj+
         yVOxPgOVdL3ikbWyPl4TDUePC1ZnBIjUC2KqUveJOnIbL5tbZK9wpGSP+YMJN+HJyPS9
         XdeP1+oCSDc2d3Vncia/+QGTzS8rZsg+HRsXH6+vsunW5vGdi1WTRZUjb7wfBLcc7riM
         AzTQ==
X-Gm-Message-State: APjAAAVDUtjSXObGfJD37A5WRvfVhWxhVXdAlvM79A0JYFpelHH0JMej
        WQFanXVUNMc2N9YkaL67drABL5quQHRPBy0ArYR9fw==
X-Google-Smtp-Source: APXvYqzAoPMbFZMB2wvPaLl4x3rBbkYF1XnhtGhi8OQFbYI08m7qX/BLlOhcAujdugZytN91HfgMRzBr7j/pCW0FgfQ=
X-Received: by 2002:a05:6830:91:: with SMTP id a17mr1208130oto.107.1576050251144;
 Tue, 10 Dec 2019 23:44:11 -0800 (PST)
MIME-Version: 1.0
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
 <20191203203301.2202-2-wsa+renesas@sang-engineering.com> <CAMuHMdUnC=PM0iM7NwoeVLb2v=r4g-uUU3h4dBn9-St75fLyAw@mail.gmail.com>
 <20191210222844.GD8683@kunai>
In-Reply-To: <20191210222844.GD8683@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Dec 2019 08:43:59 +0100
Message-ID: <CAMuHMdV8+35xLVqAX1mpU1gBKhkw6nBRFwdJwBF0_UXJPh18+g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] mmc: renesas_sdhi: Add manual correction
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Dec 10, 2019 at 11:28 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > BTW, why is tap_set unsigned long instead of unsigned int?
>
> Because we use bitmap functions on it, and those have all unsigned long
> as arguments.

Do we? I only see bitops on host->taps?

> > And perhaps it should be moved from host to priv?
>
> That would be great, but other tap_* variables are still used in
> tmio_mmc_core.c. We maybe can refactor all tap handling into
> renesas_sdhi_core.c meanwhile, but this is a seperate issue.

tap_num is shared by the Renesas and TMIO code.
tap_set is Renesas-specific.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
