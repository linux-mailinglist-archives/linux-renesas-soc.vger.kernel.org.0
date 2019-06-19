Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510CA4B39E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 10:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730783AbfFSIIF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 04:08:05 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37064 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbfFSIIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 04:08:05 -0400
Received: by mail-lf1-f68.google.com with SMTP id d11so11372941lfb.4;
        Wed, 19 Jun 2019 01:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8lvNvIGQe2PK/88gQF1jLxAf+A4JVYxgGxvr+SdL+Po=;
        b=NeTMSlJwf6V7WcNebbCgn5xyYhHNeCscnrDK6eZIvrIuDwa6ruLfbj2Z13+31BWGc4
         1eNxtuZiI6aa8vA/v27Uujj3wAXV4j3Qs27YH7ap+7SsK81u/MXmrljY5b95Bzjk6znN
         CoZ4zgSfjmNZqtvhYUNY/l1SSv1dhz1U62rQVZLtYfraR/EwouL2Y+glc41WdNsMAu+S
         lCO0iSFRvt6UR/4wL7eit3tS3PChg9rp5NIr5btUqUpnhkjyk2sg3Ru6uXUb0sO+HIQI
         35oL4+ZY1Rw1c/n9IJ+AuXZWff/qRE8IvneQKahAJf+vnwOk1+4/A+8IqMor3omBU/BM
         JEYQ==
X-Gm-Message-State: APjAAAXE2mNgJQgP+oW6gkUpsDVy/1l4Ld13XShecEbW0WgTrqam+0Rr
        zFU7KufpZc228kurZsGPSthLNItl8+5p9yig4Lw=
X-Google-Smtp-Source: APXvYqwt7v33LykYXCFDQ3OwiRcWFSa+CJ8r79Sq2y87cIZreBVGbSGiOqBg0O+sRdDLpip3cD1s8uftYLPCzQVyqck=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr22164777lfp.90.1560931683071;
 Wed, 19 Jun 2019 01:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <1560920130-15475-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1560920130-15475-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Jun 2019 10:07:49 +0200
Message-ID: <CAMuHMdVFbN0itvXv5EJ7=3P-2-RrH=exMRpi0KmiH+mMVgrVWA@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: Use dma_max_mapping_size() instead of a workaround
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 19, 2019 at 6:56 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since the commit 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
> provides a helper function to get the max mapping size, we can use
> the function instead of the workaround code for swiotlb.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
