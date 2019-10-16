Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22F0CD89F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 09:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387591AbfJPHjj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 03:39:39 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44082 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbfJPHjj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 03:39:39 -0400
Received: by mail-ot1-f68.google.com with SMTP id 21so19289095otj.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2019 00:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6h+RkRVUsq/dtMElBXWonVtZrcWWoHniyxcDvzJ7QM=;
        b=WS/0JuYP1+fLyoaAofns4a44rh4/24MTk38UGyqcsydI5a0n1zLfGKpLcRXqPNYvwA
         PZ1+G/q3wK1byOp5HiXWNSmAME2wgkrVWq6TaJ2br7O7f2Zpfp1rqcRNR80leULi6RUu
         7vijxzyxlcqkm7+M9o0/WbH4YjcUbfLFOg2w1dWy17W8hL0/TlKWcMPnpoauri5BdF2U
         RTzTDa6wfbmrap3zbTFyqXCa20j1GcM5Qpt58bTk1z9eouLSgTSo9ziwkP3MVuSsn8n1
         m/UVOZwDqyWv75ON5y0i5UmRA5q39bFnVINv+c77+RQlv1kMkxSTIxQ6LsElvkRSrlzE
         O1XA==
X-Gm-Message-State: APjAAAWndvNN1QXMKghxSWssat1X3TrQcvH9rLh2dhXb9j4VaEI68ZJt
        gJv7TvD7ll3QWmJ83dFIeq8fmC2Vadv1z6AQHhc=
X-Google-Smtp-Source: APXvYqzyYxruToiWl1hUzjFEkCACi8HQQ70s5TB1u6heEcbPUmwmq3Qet/gWJ2Bnv463hqrcY06RWGvAL+nZdxWbO7Q=
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr15685380otj.107.1571211578558;
 Wed, 16 Oct 2019 00:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571137920-15314-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1571137920-15314-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 09:39:27 +0200
Message-ID: <CAMuHMdXF_cY0OM64+NcqLJaYwqOJfk2wz5FwLW7GhMm72ZcOiQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 15, 2019 at 2:10 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> This patch adds helper functions ipmmu_utlb_reg() and
> ipmmu_imu{asid,ctr}_write() for "uTLB" registers. No behavior change.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
