Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B043672FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Apr 2021 20:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243259AbhDUS7H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Apr 2021 14:59:07 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:42898 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245352AbhDUS7H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Apr 2021 14:59:07 -0400
Received: by mail-vk1-f177.google.com with SMTP id k128so5806275vke.9;
        Wed, 21 Apr 2021 11:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3SxB69pUYAxGtcTsZ0OZls1Z7/FhoWntrRFhu04EJ/g=;
        b=SyiypKUxzYst1GOz9oIGIVD3aPWTuSXnSV2VBJ0LLUpVnvMty+T1euAqQC6A1SLnXj
         5cW/7EKay95Fe7ytKFIET2gv9frHNAJDaZIwNIGUr/KgdjzRfmWB7QG9HBc0zTMZ9JFQ
         QQula9FPJuvV7IasgA/lUw3O9qqG6re1FM/BeGFWJibaSG89jZRmbYUe7KInZEiUhsSu
         cCNJD3TR4dyQsEvUV2B+yEJC1CiVT17A7yrFi5DDkpa6ZH7FbhjsYa8yfC8xBnoOsDNI
         DsFVYEWUbjQOqzOEcZfxVk57Sxz7DtuZ3me/cnXMD6Y0PIXfpC2QaVs1faVmtymF9quk
         Hkqg==
X-Gm-Message-State: AOAM531PCaVuE8409NNk2t1M7JSoDMmZPuuHqu+2DEZAb1Laz7ZH0TxM
        Kfy0RRKvywr8/9L2aaZ8oaazBh5cTTCqLNJYTPvqMUzh
X-Google-Smtp-Source: ABdhPJzv+Gfvn5UVDzPrZgWN3n2JCrP7UuiJq/g4kG6fLExWhvt7T3ukPswRuKSUoLVGTkfToVDlYnbYZ33P8lNaOIQ=
X-Received: by 2002:a1f:23d0:: with SMTP id j199mr12911517vkj.1.1619031513120;
 Wed, 21 Apr 2021 11:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210421130105.1226686-1-gregkh@linuxfoundation.org> <20210421130105.1226686-74-gregkh@linuxfoundation.org>
In-Reply-To: <20210421130105.1226686-74-gregkh@linuxfoundation.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Apr 2021 20:58:22 +0200
Message-ID: <CAMuHMdVFf3_jo+oGPm4THhan3bVZx99omkG1LnAp=B4JTKhChA@mail.gmail.com>
Subject: Re: [PATCH 073/190] Revert "media: rcar_drif: fix a memory disclosure"
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kangjie Lu <kjlu@umn.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

On Wed, Apr 21, 2021 at 3:06 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> This reverts commit d39083234c60519724c6ed59509a2129fd2aed41.
>
> Commits from @umn.edu addresses have been found to be submitted in "bad
> faith" to try to test the kernel community's ability to review "known
> malicious" changes.  The result of these submissions can be found in a
> paper published at the 42nd IEEE Symposium on Security and Privacy
> entitled, "Open Source Insecurity: Stealthily Introducing
> Vulnerabilities via Hypocrite Commits" written by Qiushi Wu (University
> of Minnesota) and Kangjie Lu (University of Minnesota).
>
> Because of this, all submissions from this group must be reverted from
> the kernel tree and will need to be re-reviewed again to determine if
> they actually are a valid fix.  Until that work is complete, remove this
> change to ensure that no problems are being introduced into the
> codebase.
>
> Cc: Kangjie Lu <kjlu@umn.edu>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Upon a second look, I still see nothing wrong with the original commit.
However, as I'm no v4l expert, I'd like to defer to the experts for final
judgement.

> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -915,7 +915,6 @@ static int rcar_drif_g_fmt_sdr_cap(struct file *file, void *priv,
>  {
>         struct rcar_drif_sdr *sdr = video_drvdata(file);
>
> -       memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
>         f->fmt.sdr.pixelformat = sdr->fmt->pixelformat;
>         f->fmt.sdr.buffersize = sdr->fmt->buffersize;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
