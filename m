Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A822E49B402
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 13:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383402AbiAYM2k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 07:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354976AbiAYM0A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 07:26:00 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421FBC06173E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 04:25:59 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id g14so61055190ybs.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 04:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VQHOyEJr/7l5t2krSD3OjkLLcoyZLB9f+DUN1/If5zY=;
        b=D9SJuTsLx2nifX3INRuNdnov3BYPIV88Mymma8zpXVMmxe8y9MHfLkObjRHgkaRf0A
         zC1G4WCzMQTN9MmW6Zyt6ME9QLGIpKAVOv+nOiC9K/9hJ0vxp+WSZOQLhxQ31li/cVId
         GfTlTjUcPdRBLmdpymFns5TzhfRdUT0XLHKGJ/yqQuWg3jrpuUNKxp0r9lXbdAtNSKRj
         kI+Di0hHlKGG9o3vhm5kTGhL+6rMoEWV61iFaOsY+mmkMLHcIw/K5l3JYatkJG0bWwSo
         SpOJhccmdPpGwqS1XM7Q1JG/tKdwGqhLdau96ZbBoTBhPYg5GruwQJx26xQucyKeKD//
         drQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VQHOyEJr/7l5t2krSD3OjkLLcoyZLB9f+DUN1/If5zY=;
        b=Yem4vlNkVfJYDz6pwzQWSmILZ530XhDki2AYurbCePUFxl8b3JzrcNISDsbcrI3yGn
         6CwKz5vSnvgHu94usNgB3n3bzjZYBM61LLVb522bmUBtXDIsjUQzWr/qGJKrE6LwmSrW
         h1f2It6ON0rlo+THhuIFI2HBH7ay+ppcj9i6zm4dkBj1Lyny2aHr0uj8PIJfZV6fD1BI
         Lhd9NbbWJQE3BgCncI9ocuAK4Vz4ucpGWBlgiXtFbdlgv2UIBCB5jmY4urIB7pI+m/5S
         MFvj2bhdE2Zs2DymBEr5ReA6YqB4m92151QzoVQhO3puHK5skiSnf7SVfKduGG+nIXUP
         gtQw==
X-Gm-Message-State: AOAM531+5y6m8QWUaQH2JLY0sTTWO/4sXmmV241JM8tOBHszEnSH7WnT
        +mdb0W7M8zeYiEtA5ljCj/UqoiQqIKqZbwz24A8=
X-Google-Smtp-Source: ABdhPJzkmPki5/kBAwp/O0+kC6L8SCISqPPFoN/7WGkcj22cOxcDwH2RkBK6r2D7A1ZxzRnYCJ19tCL5/V+nHDdYGXo=
X-Received: by 2002:a25:2cc7:: with SMTP id s190mr28562712ybs.186.1643113558460;
 Tue, 25 Jan 2022 04:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <164310602822.74844.12177586903406990983.b4-ty@kernel.org>
In-Reply-To: <164310602822.74844.12177586903406990983.b4-ty@kernel.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 25 Jan 2022 12:25:32 +0000
Message-ID: <CA+V-a8vooHnZqTvuq+qq5u+JLrSirj0vOYnfWXVFB19UhhRdAw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ASoC: sh: rz-ssi: Code cleanup and fixes
To:     Mark Brown <broonie@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Pavel Machek <pavel@denx.de>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

On Tue, Jan 25, 2022 at 10:20 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, 15 Jan 2022 01:22:58 +0000, Lad Prabhakar wrote:
> > This patch series does code cleanup and fixes to the rz-ssi driver.
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (5):
> >   ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv() recursively
> >   ASoC: sh: rz-ssi: Make the data structures available before
> >     registering the handlers
> >   ASoC: sh: rz-ssi: Drop ssi parameter from rz_ssi_stream_init()
> >   ASoC: sh: rz-ssi: Change return type of rz_ssi_stream_is_valid() to
> >     bool
> >   ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [1/5] ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv() recursively
>       commit: 6570f991582e32b7992601d0497c61962a2c5dcc
> [2/5] ASoC: sh: rz-ssi: Make the data structures available before registering the handlers
>       commit: 0788785c78342d422f93b1c9831c2b2b7f137937
> [3/5] ASoC: sh: rz-ssi: Drop ssi parameter from rz_ssi_stream_init()
>       commit: 4f78f3c970f131a179fd135806a9b693fa606beb
> [4/5] ASoC: sh: rz-ssi: Change return type of rz_ssi_stream_is_valid() to bool
>       (no commit info)
> [5/5] ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function
>       (no commit info)
>
It looks like you have applied v1 series instead of v2 to your next
[0] (v2 series [1]). And your comment on your patch 1/5 of not being
applying isn't true as you have already applied it ;).
You haven't applied patch 5/5 (this applies cleanly to your -next)

[0] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/
[1] https://patchwork.kernel.org/project/alsa-devel/list/?series=605672

Cheers,
Prabhakar
