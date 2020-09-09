Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538EE262FCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 16:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgIIO3u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 10:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730256AbgIIM5S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 08:57:18 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24910C061786
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2020 05:46:18 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id x203so1230366vsc.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2020 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rOOi9G5yd8K6h51VynUxd0PypjiCWrC4mFiMS8Wcf+A=;
        b=lHchZD9e8fVEUhyyPmD9ZJ5Q8Vqz/Zd824nUhUxMWUHzUWjAJLOMctBVLiW3+1sVC0
         Yp1GsT5V6zooiNvTkpbisdw642L+0MduASirosMlkPCSf2ZieRRwJ8LCyvbxwMAFunVB
         Mjz3oc2a84q7EibTEBsbVNAvJKfSi3dyeiOf7ZyrrcT1Lra5OoIP6RYOLLz7xrhLZeuv
         zYHh6OR2Jjq7lj9BFvu1ebf8ckecIzB/a9rCd/sdSelzlLhv1wp7Fpd1uB2XCwiBfljU
         +IuRzNszzcYBUs3aV886PUPJ78WN563gkzmK68jjia/g0DNRrTydCy8rkaI+KIS5s0hl
         zQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rOOi9G5yd8K6h51VynUxd0PypjiCWrC4mFiMS8Wcf+A=;
        b=gzLrpH9tkXvVtEOHLlheAETXhpLQ/PVpHHdpQ9jV03N2y/m2zwyUuzJvTPBUR55914
         v2DVs9Va5UG0af99JDQr0PtwIYGbY4j3nsZfqQ7Vc3c3K5GjIVCmU76vMuLuFvA4cyM+
         KONA1RF4iRHCKnFZM8X6BDgqTIhnQjLH8ZpNfaob3VH9gqHq2MKEZ6pJjKR8q1BmASxm
         5fBYgexaV+stKCWJSzySCnIXMF4dUwqwDpMoXRON2M1ziUX1c0ukqnuNgF1EwlaXIe8p
         ZDpCeaCDnp+AIQatYoeopur1VfWWnc00VzITQh4+Tyc4duUcSkgJqsbYruiKgQ4ufcS/
         to9Q==
X-Gm-Message-State: AOAM532gnXDA2x2T5VO+KTNYlUPvuQNffErs+QnmMHnb6gOFFxH8f9d3
        erV2ErdVqdHdr2z/N9hV/AAkb0javQmFNUA8QID1RA==
X-Google-Smtp-Source: ABdhPJxF7W+9PErnGC/FzGCmAOLlQJ4/XLqKXXwqmlAzX1SeA1LY4T96oPXXL2PnGOHOWmEQbQfy5NuQIo/Ewdvyowk=
X-Received: by 2002:a67:2d48:: with SMTP id t69mr415544vst.27.1599655577190;
 Wed, 09 Sep 2020 05:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200821081654.28280-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFp7rsHDY2vREakrR+PFJLs0n8JBR+URV1vCu5bydEhHuA@mail.gmail.com>
 <20200830130357.GA2194@kunai> <CAPDyKFr24YxoJ3m5r1C_4-UAdtJQp_MK0+wwZjsQXzrs5dxLjw@mail.gmail.com>
 <20200909113745.GK2272@ninjato>
In-Reply-To: <20200909113745.GK2272@ninjato>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 9 Sep 2020 14:45:40 +0200
Message-ID: <CAPDyKFoPn_x_NDp7pXpf9q8Kvf_fVA+xwJSfm4g-oLubmU9nyQ@mail.gmail.com>
Subject: Re: [RFT] mmc: tmio: reset device on timeout, too
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 9 Sep 2020 at 13:37, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Ulf,
>
> > > Hmm, there are some wireless drivers using it as well. I am confused, is
> > > this considered "upper layer"?
> > >
> > > drivers/net/wireless/ath/ath10k/sdio.c: ret = mmc_hw_reset(ar_sdio->func->card->host);
> > > drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:        mmc_hw_reset(sdiodev->func1->card->host);
> > > drivers/net/wireless/marvell/mwifiex/sdio.c:    ret = mmc_hw_reset(func->card->host);
> > > drivers/net/wireless/ti/wlcore/sdio.c:  mmc_hw_reset(card->host);
> >
> > Correct, these are "upper layers". The same applies for the mmc block
> > device driver.
> >
> > In this way there is a guarantee that the struct mmc_card is still present.
>
> Ah, now I get it. "upper layers" as in consumers. And because consumers
> sit on a card, this guarantees that mmc_card is still there. Correct?

Yes.

>
> > That would be great. I appreciate all kinds of improvements on the doc parts.
>
> You are welcome!
>
> > Perhaps a better option is to return a specific error code for the
> > last request, that makes the core run mmc_hw_reset(). Or potentially,
> > add a host cap and let the core treat some error code, specifically
> > for hosts like tmio.
>
> A specific errno could work. I don't see the advantage of a CAP (besides
> it is rather a quirk than a cap). We could also have
> 'mmc_controller_card_reset()' or something which ensures mmc_card is
> present and let that controllers call when they see fit. Or?

Maybe something like "mmc_controller_card_reset" could work, but it's
not going to be that straight forward. In the end, we depend on the
context for when the host driver would call such a function. In some
cases it must call mmc_claim_host() while in others it shouldn't.

BTW, I see that tmio_mmc_reset() is called at
tmio_mmc_host_runtime_resume(). This seems to work fine without having
to make a full reset of the card. Why can't you do something similar
to that instead?

Kind regards
Uffe
