Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09FE4AFC6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 14:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbfIKMVu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 08:21:50 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:35028 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727850AbfIKMVu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 08:21:50 -0400
Received: by mail-vk1-f193.google.com with SMTP id d66so4300438vka.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Sep 2019 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gTFIgpr+BcZ9Ar7qugX+r0CFY7uwPpyLv534R5un/gE=;
        b=aaG4ZdPC/9Ptcct0sLJUnguVL1nNblGzY8EBBRcMdIaUfXuixKimTwh7HfoUAWOeYT
         UzqM+krVimv3wqrWutjvqrizooRctBQu50nN47SdBX1EcQPlmjrc+tgniIygANzDKBpz
         SjKY2h9A9AFf9GjHo99ujNdF8Kqzi8hSZoKR6mOHIGeen8Lg19bA2pBkwuL5Ch88y019
         vwduy5KrYAMI+tn1Uj05hiYZ08RgRlMs+aX8Il4io48FgftiNHDl0XzA3qjqyx+dMfDk
         ts0JF45VYWt9Qpp7A0o8idosXC3OBtOFdSQwVljGId94PRUXgrCh11d7aVF9xv6ZliNx
         QqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gTFIgpr+BcZ9Ar7qugX+r0CFY7uwPpyLv534R5un/gE=;
        b=Qd1TfFEtlcxce/WgtglWSlaZC0tOOcRgsgGfRw4vIUoDF9dl91HJWUukutAd/60rfA
         1F4prr23jlUHmoD/wvXlzXu3+uUanHgs0DYbMCMLyJUycddgFo59nQKucUd+Dnd9V9HN
         q2LRy2N0aPBp3HdM0f406+sCap2hg7fhGlmsXMDV45a0/lX+gsOPPtfzWnYCd871u2Tb
         XxZcgPI7+1qIu03Z02p3Pw8n1npzcxB3zFYoBDEQSRGc3o6wDr9OcxGC0pvBz30T5uKU
         nmpqBW9lkg2JYq/WUUoijis0EeTE7ZM48krRR1Q/xlFnbQ9Nxol/FB/ZKmdkayjNFVPP
         oPSA==
X-Gm-Message-State: APjAAAVtTVYG2m1VJe3UocHPmELOQRb/aKS9fT+L5I+pM1pFj4qWqLQY
        pUMFISJ4nqKssGYPCZJd0OahlqmaWeq7+Yhm+m6Nmg==
X-Google-Smtp-Source: APXvYqw+xtgeAak4FCDho0kaEyRE4HavOitH5HuwTTZrxSjyEPx/N3Jc1TjMJO6nmL4NPZHtYGyQR1+4eEGInxt73LI=
X-Received: by 2002:a1f:8c50:: with SMTP id o77mr4202659vkd.52.1568204509548;
 Wed, 11 Sep 2019 05:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <1568088179-16865-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1568088179-16865-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 11 Sep 2019 14:21:13 +0200
Message-ID: <CAPDyKFo0kQvBUys6cFwwZ5xF4koWh3DsFAN2x+NKXfz6O4AD3w@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: queue: Fix bigger segments usage
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Thierry Reding <treding@nvidia.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+ Christoph

On Tue, 10 Sep 2019 at 06:03, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> This patch series is based on the linux-next / next-20190904 tag.
> Thierry reported an issue which caused the SDHCI environment [1]
> so that I made this patch series to resolve the issue.
>
> [1]
> https://patchwork.kernel.org/patch/11137903/
>
> Also, this patch adds the flag to enable the feature on my
> environment.
>
> Yoshihiro Shimoda (2):
>   mmc: queue: Fix bigger segments usage
>   mmc: renesas_sdhi_internal_dmac: Add MMC_CAP2_MERGE_CAPABLE
>
>  drivers/mmc/core/queue.c                      | 8 +++++++-
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 +-
>  include/linux/mmc/host.h                      | 1 +
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> --
> 2.7.4
>

I can't apply this to my tree, as it depends on the earlier series
which has been queued by Christoph.

That said, you can add my ack for both of the patches and you probably
also need to repost this to Christoph.

Kind regards
Uffe
