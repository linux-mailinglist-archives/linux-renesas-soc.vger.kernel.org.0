Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA9A40C1B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Sep 2021 10:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbhIOI3R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Sep 2021 04:29:17 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:41480 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236869AbhIOI3K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 04:29:10 -0400
Received: by mail-vs1-f43.google.com with SMTP id az15so739992vsb.8;
        Wed, 15 Sep 2021 01:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kVcfd09K/pu9DIuy5I9phfjdDjuWdayUGLcOlhCsr88=;
        b=PPYg63V86eW3QBkupgZu9KczTzcojK0wWwsS0uKqSHurb4lJZd8oMfx4Zt+6hT1PdJ
         HzE87oPYC1Um/4AnD852hu1C4ajgNa8bD4mqMHDmtJSqz7M+McD43EhM71Miih7ch2R8
         Uv9elY8E7RTEgpkwIFn8Pohcp4/LVmlem9MmHWI+Ulmu2iUCOteO+sM+rRU1SUHoSNT+
         s3f4ecKxU6/f6toEOyQnd4SbPp0sChYu4/We8aq7SMEg4/CeeTok+/XiAwc5Q35pOWme
         Q2lzKUDXh83xgUh4f4vokHiD9UqfM47MTvIcmB0LrV4gSfsNIHIuJWBdh8hP13PXdnv1
         gHUA==
X-Gm-Message-State: AOAM531BQWd9Sr6OFEb1ttEOyup7W9jbmcZxl0j4Iz+W5RsVjZrD9/uG
        3I+BI3AIq/WU0ofAvzg1JcHkunt7mFVmFQreTDM=
X-Google-Smtp-Source: ABdhPJzGnrwBDhZfwC7yq05wMPQSPxejA8axVLfyZ96yNQ6nxhTPrFWtcONJR0WzcHwjxErye9qGFOMNWfaz6MHjVzc=
X-Received: by 2002:a05:6102:2417:: with SMTP id j23mr2364133vsi.35.1631694471070;
 Wed, 15 Sep 2021 01:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Sep 2021 10:27:39 +0200
Message-ID: <CAMuHMdWGwncmt0V4V6mXtpU1jSb2VO4Bfe5yMsyiN+=KCkEuNA@mail.gmail.com>
Subject: Re: [PATCH 0/3] mmc: also abort tuning with CMD12 for SD
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Sep 14, 2021 at 8:22 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> After my hackish RFC patch, here is a small series implementing
> (hopefully) the solution we discussed. It will make
> mmc_send_abort_tuning() also send CMD12 for SD cards which makes more SD
> cards work for us. Details are in the patch descriptions.
>
> Please let me know what you think.
>
> Thanks, and happy hacking!
>
>
> Wolfram Sang (3):
>   mmc: core: add helper to send STOP
>   mmc: core: also abort tuning with CMD12 for SD
>   mmc: core: remove obsolete parameter from mmc_send_abort_tuning

Thanks for your series!

I gave this a quick boot test on the Gose and ALT in Magnus' farm, but
the issues are still there.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
