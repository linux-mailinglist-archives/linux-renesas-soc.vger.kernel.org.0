Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E4315BFD1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2020 14:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbgBMN4k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Feb 2020 08:56:40 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:43787 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730036AbgBMN4j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 08:56:39 -0500
Received: by mail-ua1-f68.google.com with SMTP id o42so2255288uad.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Feb 2020 05:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jm/LAyla74Pje9uLjF10qj2ILC0qUy9rgPkylb/miHg=;
        b=ozoCrbCGv9vsI93eriaIXp1DjthK3gP16bqd4JZh3y5S+JxSMUxG88W2Hdnn5WDUBO
         WWhlbIVtucymLG4GspFI9ESJ1Ie7wTDwFW+udUNPNU9+yZSIG9QL7oDVTUPcQn7fxSHs
         7uV9VHiIbnPSP3A4jripb8JeE5dWGK+Q3KICf29UCUVzZF40YfrFAUBtD3LH0m1FmmcY
         VeKn2qHGuDGEhsN8Ieo0NAGLdHhPKec/9w75Fc0vSDybg3B0RE29Jsl+kFp0iTm9XDTb
         aJ+ZpOP0fxPDPpt9JV9CCnxVzUhj7WzvIyLcJRfJD6MPqu7avnX73WDxyNGt6U22d2H6
         gxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jm/LAyla74Pje9uLjF10qj2ILC0qUy9rgPkylb/miHg=;
        b=uC8r1Hp1VuMFWKEL9G/NnsiOT80E4j8jgbIwDGxZ0KTZBKoSZfOx5MBbZj2rasW4VY
         AClOfyUa9OLL4iZqJZ0/BHdHpd1e+WgA0X7eMFkDNJvk6Ak8nqnmrxYyydW1jE9mdZL7
         4uxsUA9csSmCBNXfLGDYU8sgaobPlhvzF93Zk8O0u/vyNB7gVxFn66hQZdQL1H/PG/9F
         684ykQDN31Y0djKnX+wi9aaC9K50mEH3+43WROCN6HkajE/r5jZSCtDrAEAtE1uz8O7/
         +6dy61blDSv43Le+qV9GiBLZtWfGV3a1ST71rufSp+uwwQ2Ex6EdZqSvzUrHXRqgSG4z
         BAjw==
X-Gm-Message-State: APjAAAUVoJd8z0QXKJF9IiUcdnQR1P/uq2XJgbT8xo3C9sotkRUDd/8c
        d6m6bxmqOxC7QQcl8MR7lzkrhr0MUZrvZJxm3LJqhA==
X-Google-Smtp-Source: APXvYqziDyiYnfdAWiJq7bdnX0mVuUOG7aJihW34usJdVxGekhvjtSJSIbDBQYxYQDhhLhtI3SP60+gG1ACb2O27uS8=
X-Received: by 2002:ab0:7802:: with SMTP id x2mr7660143uaq.100.1581602198751;
 Thu, 13 Feb 2020 05:56:38 -0800 (PST)
MIME-Version: 1.0
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 13 Feb 2020 14:56:02 +0100
Message-ID: <CAPDyKFp-pUwKLKDz8+rvt_yoNOZeK_-pDAxbdX+r0ViLtqnEmw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] mmc: tmio: move TAP handling to SDHI driver
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 29 Jan 2020 at 21:37, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> TAP and SCC handling is Renesas specific, so it should be moved to the
> SDHI driver. After previous refactoring, this is possible now. And
> feasible, too, to simplify further HS400 corrections. IMHO it also makes
> the driver less complicated.
>
> See the patches why this series is still RFC.
>
> This is based on top of the series:
> [RFC PATCH v2 0/5] mmc: renesas_sdhi: add manual correction
>
> A branch can be found here:
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib
>
> It has been tested with a Renesas Salvator-XS boards, one with a R-Car
> M3-N and one with H3-ES2.0. Tuning to HS400 still works.
>
>
> Wolfram Sang (6):
>   mmc: tmio: refactor tuning execution into SDHI driver
>   mmc: renesas_sdhi: complain loudly if driver needs update
>   mmc: tmio: give callback a generic name
>   mmc: tmio: enforce retune after runtime suspend
>   mmc: tmio: factor out TAP usage
>   mmc: tmio: remove superfluous callback wrappers
>
>  drivers/mmc/host/renesas_sdhi.h      |  5 ++
>  drivers/mmc/host/renesas_sdhi_core.c | 90 +++++++++++++++++-----------
>  drivers/mmc/host/tmio_mmc.h          | 11 +---
>  drivers/mmc/host/tmio_mmc_core.c     | 77 +++---------------------
>  4 files changed, 71 insertions(+), 112 deletions(-)
>
> --
> 2.20.1
>

Wolfram, I realize that there were potentially a few minor nitpicks to
address, but let's do that on top.

So, applied for next, thanks!

Kind regards
Uffe
