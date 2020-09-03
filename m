Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC0F25BC6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 10:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgICIL1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 04:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbgICILH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 04:11:07 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E21C06125E
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2020 01:10:58 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id y194so1255491vsc.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2020 01:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IlPhFv3k/5AArHDg0SRbTlfwKIdxAJ6WzF8fNhVRF3g=;
        b=xRj9yZtdnpoyoT5l03xzQyj7eOGOaUj2twdc5WiO5LJsQChratHnWLrVoCWDDlzPbR
         bjocUnImIRPEnoMdVmvq4fEiVagyZCcVEcr87/KldB4MfM427BhgYKTi9GzU3LzlN/Ao
         CgeY9QVRKlBUxNokoWALjzf1UoEjwjuXUIojQy6s6or8zHm82D0rrGb6HPfG7nrsx3m8
         +hBKneDFMnIwdXO+tFTnxchBkjkqRo9iSAsfWppdpTPNHbspvi+cqikvATVRBaY5dC4q
         NZanMrHfEYEQfFhdJXgE3Amq2U5zgKb5vgn5f5DKTnRKr9EDgQ4mDri1tgKjg8ngogfV
         PR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IlPhFv3k/5AArHDg0SRbTlfwKIdxAJ6WzF8fNhVRF3g=;
        b=a3R6riEIvunPB5tFHvR4DwMhT/xDnKGP8X2+rM4ZCoSvz1DNLjtsofH4H13Ux3CAJp
         rRmoUjgxbtYsr7Q9oEDiuNvPXov/QhzPNKRitdPekrQ3QarCIEiCLAN7gqseGJNX6OXG
         wWntke9b54MGbOBrDGMzsSFgaEY55u2HXm021IfFa2cEfjaqwYFkVodWeydM1IWYHdxD
         Gvbcekcv+D69UTMtkCyTMzpSTYSKCB4dwCFcRVIG43zYqKjcrhQtj9McaxV4YpjVP6vB
         hK06UEyCAyfK1hJVWpHCarfdgw4GZ4G+6DjMJpHIyJoDjw5BfRf8QeueOJLOmKrvLgCd
         RmtQ==
X-Gm-Message-State: AOAM532ilgJeZoxvNr7atllMZu6QxSid8oLcVbTJ7ApkXTsA2poGuHja
        hlx/oPRFQ4cwtLWwizVESku+krsC5YtFlssp4rS9kw==
X-Google-Smtp-Source: ABdhPJwf/WJQ//nMEysTS3jgGT4ZxA8X0LItoOPOOazU5r3pmYl4mFta5eihz0jSXywclJ5FZHOaMWtpkjH3wL8R/aU=
X-Received: by 2002:a67:e197:: with SMTP id e23mr399268vsl.7.1599120657792;
 Thu, 03 Sep 2020 01:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200901150250.26236-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200901150250.26236-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Sep 2020 10:10:20 +0200
Message-ID: <CAPDyKFr=7W3BG-ZXcOAWs3j-5W=mm7WrhcgyTQi8h3HmWe6iYA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] renesas_sdhi: fix hang when SCC loses its clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 1 Sep 2020 at 17:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This again took a while since v1 because the issue was so hard to
> trigger. But I finally found a way to inject the flaw, so this series
> could be tested and it fixes the issue.
>
> Changes since v1:
>         * introduce a new flag to MMC core indicating any kind of tuning
>           not only retune
>         * use the new flag to keep SCC flag active
>         * new patch 4, minor cleanup to MMC core
>
> A branch including the DEBUG patch can be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib-for-5.10
>
> If you revert patch 3, you should have the SCC hang during boot again.
> For the record, let me copy some findings I mentioned in another thread:
>
> ===
> Interesting news: The hang comes from a code path I would have not
> expected. It is not because of accessing an SCC register, it is this
> line from renesas_sdhi_set_clock() which causes the issue:
>
> 186         sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clk & CLK_CTL_DIV_MASK);
>
> I mean I can guess that the clock setting has something to do with the
> SCC, but I can't see the direct connection with the documentation I
> have.
> ===
>
> Tested on R-Car H3 ES2.0 and M3-N and patches based on mmc/next.
>
> Another hope this is gone for good now...
>
> Kind regards,
>
>    Wolfram
>
>
> Wolfram Sang (4):
>   mmc: core: when downgrading HS400, callback into drivers earlier
>   mmc: core: add a 'doing_init_tune' flag and a 'mmc_doing_tune' helper
>   mmc: renesas_sdhi: keep SCC clock active when tuning
>   mmc: core: simplify an expression
>
>  drivers/mmc/core/mmc.c               | 16 ++++++++++------
>  drivers/mmc/host/renesas_sdhi_core.c |  8 ++++++--
>  include/linux/mmc/host.h             |  6 ++++++
>  3 files changed, 22 insertions(+), 8 deletions(-)
>
> --
> 2.20.1
>

Applied for next, thanks!

Kind regards
Uffe
