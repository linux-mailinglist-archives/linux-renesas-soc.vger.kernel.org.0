Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0CF1A9B22
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 12:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896509AbgDOKnK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 06:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2896481AbgDOKXj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 06:23:39 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889BEC061BD3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 03:22:31 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id g10so1120829uae.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 03:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FuGBbMoDh6W2a9p0xXuJ+PPx7Ir4Bj61daY341TPdbw=;
        b=QZo1BZx+QGh50qm5qUZHPbW4xyX1pvVlc8h4GRwBgrQ/jNtgQyPKvVxDbu41FPPpZi
         RnEE2WMuN6aG7hz5eGI8P/470aR90LFk/+e8zNj6Rlbpf3gvCfDKkzOPJKfLxnRZ/7QO
         QC7+1IlaLHU3cDKsEqj7B4INPipTqWMmcUrG1lXH9lxipwwdhylK/qAd1nKMZiYWbz9f
         yg9FWqyqg/SAgBLrX1jPq7XBOnfXET6qaHuEiFccIQngOHZRqZV6lY/JKJg5ODMDDR9D
         T+Ll8xjgGAfDGnsHaQz+QfbmdNHSN15qnj42zUtvdwjaoERLl7kN6nZZe9IAFjsUCjfT
         3o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FuGBbMoDh6W2a9p0xXuJ+PPx7Ir4Bj61daY341TPdbw=;
        b=V9U0d8wgbuqbrJkJAckD1nzVwy2T8ybP9nVtjKdQeuv70mTq/5H5H/yEbRfzgKkWK4
         z+al9VTaq8e61AXsM/6BsCjbVCmRU5bSSDs9inQjj7Uhw/W3OGfE/jHFam0p+mV4HmLS
         hI8gFUYD1gwxZdUAAB9ansal/pYKOKOTT9hj115j10dyrZAYhA7Gvf9NB7Lbwytf3ZDN
         iq4fc/nIsne1z6Dt8/JgkHfVnuWF65ZBACtUZrQWc+Avwjb9HjBzsbN1IrAOTRsPGRMW
         Nr+rQIBtRxcOx3b2vCMLR3azdhwo62aajf7IXnRY+OzvyOnmA+pqQvfs/M2qIh/+TbSt
         tAMQ==
X-Gm-Message-State: AGi0PuaJDzptV33rdEqvWgxC5Nm1G9KsoV84YNBHN6afcThBZoXAhah2
        QHLZySHgQPB6pMM6SdqGLqi/zgkl81Crxw4HrnRgiA==
X-Google-Smtp-Source: APiQypKkEAIbUpmbVejhcwkLz3HtHZcBJQnkgevDEQsukLrhkH4TNtn4QHd2XnNHeQxb93SciLjElrPG4Ql0HQNfwlw=
X-Received: by 2002:ab0:6449:: with SMTP id j9mr3734076uap.19.1586946150691;
 Wed, 15 Apr 2020 03:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200408094638.10375-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200408094638.10375-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 15 Apr 2020 12:21:54 +0200
Message-ID: <CAPDyKFoqWgxrGBO14T6V6MyZx33r+Ln4cnxBjrvXJE+H+-8twA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: renesas_sdhi: improve TAP selection if all
 TAPs are good
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 8 Apr 2020 at 11:46, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> SDHI (with SCC) has a mechanism to select an optimal TAP even if all
> were considered good during the tuning process. This series implements
> support for it. Before that, some refactoring of 'best TAP selection' is
> done to avoid code duplication and get more understandable code.
>
> This work is based on BSP patches by Masaharu Hayakawa and Takeshi
> Saito. It is built on top of mmc/next. For convenience, a branch is
> here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib
>
> It has been tested on Renesas Salvator-XS boards (R-Car M3-N and R-Car
> H3 ES2.0). There were no regressions detected. HS400 could be tuned the
> same way, and checksumming large files still works.
>
> And while this series is useful by itself, it is also the last
> prerequisite to implement some 'bad tap avoidance' on top which is what
> we are originally aiming for.
>
> Note about backporting: The super useful iterator
> bitmap_for_each_set_region() is only available since v5.6. If you want
> that before, you need to backport the needed bits of e837dfde15a4
> ("bitmap: genericize percpu bitmap region iterators"), too.
>
> Thank you to Shimoda-san for his valuable input since the RFT version
> of this patchset (see patch 1 for details)!
>
> Kind regards,
>
>    Wolfram
>
> Wolfram Sang (3):
>   mmc: renesas_sdhi: refactor calculation of best TAP
>   mmc: renesas_sdhi: clarify handling of selecting TAPs
>   mmc: renesas_sdhi: improve TAP selection if all TAPs are good
>
>  drivers/mmc/host/renesas_sdhi.h      |  2 +
>  drivers/mmc/host/renesas_sdhi_core.c | 64 ++++++++++++++--------------
>  2 files changed, 34 insertions(+), 32 deletions(-)
>
> --
> 2.20.1
>

Applied for next, thanks!

Kind regards
Uffe
