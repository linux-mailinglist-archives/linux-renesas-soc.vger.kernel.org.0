Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FEA341F15
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Mar 2021 15:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhCSON3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Mar 2021 10:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhCSONK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Mar 2021 10:13:10 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7C8C06175F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Mar 2021 07:13:09 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id b5so3551479vsl.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Mar 2021 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lK7Wu5em661YsAR1P2potPtShBWXtZV+d3VXeg7OZ/4=;
        b=PuwPqedHM4wwnj/REp27vI/oK8PfMnDRpyeL08ngxS9vZmjitbH5wKYhe9Cc1b6aEB
         WYY7u2oTBpF5/WjawVEDOQlpKUnM5JNc4GpG6EMXHxRQaMPuQZY+rkuoyFBRRTQOqEIg
         QJyQp164IRzxayvhaKjA6k8UYyvrd/OWufy7gH045vrqO/mWWV/SXYO33xH1b+18bkoS
         cYZipf1giPZKmDeuf+idECeI+r8Lep6S+/VKrwpTR+uzs9OVLcIvTX/YUtjJjJkli+2B
         LfvIUCn//nOyTb4G2R1ciTaPFI9m+ymdnWjsziPlMoMyDRm9zghYE3t2QwqlHKdJm1cR
         FM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lK7Wu5em661YsAR1P2potPtShBWXtZV+d3VXeg7OZ/4=;
        b=pthWmrroBQVm2iekQYnkZKcuzZJawRtjFt2H5Ku3FPToPvvwJkNF+DPmbRwZE6d+Sb
         Sk87rMxjA5QLkusjbfugOt/dqtrqv+tmNZWchFwN4qDfCkiXo4Qu9cFRO+UyPiHK0Bgm
         YJPUfMQvIUr5Hy1CCBk4ap28mUEHpmU35lardfjRV3njCCVlyYN2Z60Y5VfS/10rGA8n
         J0ffivRlGtWby9UKi81mkfkFXzh3kSIF/4Pm3BKn1W+xpYiOTRsYuQSodtnPCICEBQFQ
         +yIdCa6Wc7o4wPlB90WN2r8iSz83fm9EB7EEd/+3x8PANaRZkXzb0LdLJwaN9K71udVX
         hcJA==
X-Gm-Message-State: AOAM530F/fRJ3x3UfwC0witbWmASq7EhXy8CHmvLiHYn8RKPQ0KOqosX
        pxBC4Fvng/NMrNLDoY6G35ArUtDrnbyFTCEAUIA0YfO4duRu3w==
X-Google-Smtp-Source: ABdhPJyNpWg4z4tcFrSKHiEmVMgwRWPb64lSh15KFv9VTHU/nCdYRX3yO8gVoBDCVbF/xqquafwLoV54HttmqWVawTQ=
X-Received: by 2002:a05:6102:7b0:: with SMTP id x16mr2733377vsg.34.1616163189000;
 Fri, 19 Mar 2021 07:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210317091622.31890-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210317091622.31890-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 19 Mar 2021 15:12:32 +0100
Message-ID: <CAPDyKFr2HCu+DLc5RhdNZhzyiuEggZhr_BMG39S7Gmnt2An0Aw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] mmc: renesas_sdhi: reset via reset controller
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 17 Mar 2021 at 10:17, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This series enables SDHI to be reset via a reset controller. The series
> is based on mmc/next and tested on Salvator-XS with R-Car H3 ES2.0 with
> what I think I can do locally here. Shimoda-san, tested, too (thanks!)
>
> Changes since v2:
> * 'select' statement in Kconfig only for ARCH_RENESAS
> * Shimoda-san's tags added
>
> Wolfram Sang (3):
>   mmc: tmio: abort DMA before reset
>   mmc: renesas_sdhi: break SCC reset into own function
>   mmc: renesas_sdhi: do hard reset if possible
>
>  drivers/mmc/host/Kconfig             |  1 +
>  drivers/mmc/host/renesas_sdhi.h      |  2 ++
>  drivers/mmc/host/renesas_sdhi_core.c | 35 +++++++++++++++++++++-------
>  drivers/mmc/host/tmio_mmc_core.c     |  4 ++--
>  4 files changed, 32 insertions(+), 10 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
