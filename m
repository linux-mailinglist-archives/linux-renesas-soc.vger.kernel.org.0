Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E3C263051
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 17:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgIIPQT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 11:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729455AbgIILcN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 07:32:13 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24322C061795
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2020 04:24:59 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id a16so1097173vsp.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2020 04:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=YwF7oGdkWmJxr0DaGGL2B5zSMTxCBRgZEPjg5JlP9Ks=;
        b=QAazgdff84HXGeKSgLpqmQVikaFSdP5UNb6QrEEWjbfQtYZbq/0ISulDu4wVRDbAgV
         Blzaz406rfa9YdqqZ5byBj240HvKycb6mfHlmdSRBOaSWl+UNf/kM3UM8Nu53SmvTycg
         3DG2b4SlvINhCnVkLOheyROaLI1GgGzumTLHyV1QTg1hRGVrFNoeyAQ+WuglXbW6AUCl
         mGwzRhpfqjEiby8FgSU1jXPWUl9uJGpKpD6VcUs0sl5sTt910ES8bg+jdlhLxGjQsC+1
         1LCpHDV2JXl79AMSuB/lgZeCe5RvygOAaXT6CdcFlDcMmv25hU03bv87mITUk7WP9GAD
         AQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=YwF7oGdkWmJxr0DaGGL2B5zSMTxCBRgZEPjg5JlP9Ks=;
        b=lJnCo/yTIjk4s6L9Ef+lkooU2SK8AKrK8+CIELy9TwtGdor57yeMufKpHPxSJ2bU0T
         ZBHc5TkcSYE8OsEdLQRmvDoKsOdTdEwDAEQj+DdlYVW/NWfurNtmbwmj6WdfuHwrK20n
         HiXpe/qfdr6kHcduvLHYrU5PN+h8iDvi80n6lYU+tRfotL9zMfZy388JwuAAu7oJbRjD
         bLLTBY8pKg7p42gVO5zCkWFNMb7fYJ3R0aKKQmcLPNgnhnEZbEBTCY2UqajXbvieqBVa
         eIuhSQMjjI8dQr03cN3cXj2YxFORrkB6NN0htREiHbQx3UEopB77Fd46ZlKbKnUjZI46
         vRTw==
X-Gm-Message-State: AOAM531YO/UM3HS+3hkavnW/lK/hovYSqMJ5J5cR7tMTD4cBe4du5+6r
        3G3diANlr2RAsp3QsHrW9pPR04K2Whp6I9WjQdbKCA==
X-Google-Smtp-Source: ABdhPJyX26PiK8pf7hK5CA4/JStCB7QVEAiAc0iFsKHA7XBKfawE+lpIL55g2UGbvOG2rRpZZjOsbTjNKTGylQm5SnU=
X-Received: by 2002:a67:e355:: with SMTP id s21mr145683vsm.50.1599650697707;
 Wed, 09 Sep 2020 04:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200821081654.28280-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFp7rsHDY2vREakrR+PFJLs0n8JBR+URV1vCu5bydEhHuA@mail.gmail.com> <20200830130357.GA2194@kunai>
In-Reply-To: <20200830130357.GA2194@kunai>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 9 Sep 2020 13:24:21 +0200
Message-ID: <CAPDyKFr24YxoJ3m5r1C_4-UAdtJQp_MK0+wwZjsQXzrs5dxLjw@mail.gmail.com>
Subject: Re: [RFT] mmc: tmio: reset device on timeout, too
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 30 Aug 2020 at 15:04, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > This isn't how mmc_hw_reset() is intended to be used. Instead, the
> > idea is that it should be called by upper layer code, when some error
> > path is triggered for an I/O request.
>
> Hmm, there are some wireless drivers using it as well. I am confused, is
> this considered "upper layer"?
>
> drivers/net/wireless/ath/ath10k/sdio.c: ret = mmc_hw_reset(ar_sdio->func->card->host);
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:        mmc_hw_reset(sdiodev->func1->card->host);
> drivers/net/wireless/marvell/mwifiex/sdio.c:    ret = mmc_hw_reset(func->card->host);
> drivers/net/wireless/ti/wlcore/sdio.c:  mmc_hw_reset(card->host);

Correct, these are "upper layers". The same applies for the mmc block
device driver.

In this way there is a guarantee that the struct mmc_card is still present.

>
> I'd like to understand, so I can add some docs. Because the intended use
> is nowhere documented to the best of my knowledge.

That would be great. I appreciate all kinds of improvements on the doc parts.

>
> > However, let me think a bit about this.
>
> Sure, thanks for the help!

Thinking more about this.

Perhaps a better option is to return a specific error code for the
last request, that makes the core run mmc_hw_reset(). Or potentially,
add a host cap and let the core treat some error code, specifically
for hosts like tmio.

Kind regards
Uffe
