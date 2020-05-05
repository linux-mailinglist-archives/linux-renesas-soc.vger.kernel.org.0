Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90391C5466
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2020 13:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgEELdV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 May 2020 07:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727090AbgEELdV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 May 2020 07:33:21 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D01AC061A0F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2020 04:33:21 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id b14so384052vkk.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2020 04:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XbyGoPJWVWnSDkRym+hO3GL3emx5VJ8UO1Iz7FkyzXo=;
        b=kAe1lcnhk0AC+HNEKrxmbsfWWqiEmVJqjXXN1MxQazq3A4fEbFhoK9aUNx1U7rmAJ6
         +toRCf4tLAp4Y8zT96gk0ZFUwLe0D848dQh1/6BIqxgiCPzp19vMbJO0nRs7O9gL+6Es
         5dKiAG7bVfUm8wkwzvuHL7XrY9TYyxbLJ79LwefIeh8xwRja0m8oAG/aSpqAjA6+AmXw
         DgXWQhfqfeM4ZT6RkcVxwzawcCIs51Ng1T7//WHx/qOGKSsilEEMxZGR7+ZCp2KHDy2Z
         HB436HnMyTOw5bVHN294nVvnSD4P7FADwQ77H8IiSAZrj6vR+TzG7e4ZVdSf1ML42nN/
         VDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XbyGoPJWVWnSDkRym+hO3GL3emx5VJ8UO1Iz7FkyzXo=;
        b=A6/KjjlDSK7Oac9QPeK/HwhS6jiUwFrG9rG/hYVp28WTpK/m7TBIlLR9fB9vwcA9FK
         yfYmZeatNDcKJJ0PIn7iGZO3WjIvwtjyANQHZ0VwKAceORsq6tP1PvNoQTtFhJzE6GhR
         ouUSu/c+wvQRo1FP8M9vw6sONjqH5UU8hjuJ/2YzWrGvA6aTIttFwpYaktW6nIUdKXUi
         +T4r81zXbxjWZm0KHSgXhctLjX7qqbjE0VHRyyAUzNVxUwqyamAQRWwMaKja0vj9bGfC
         NfCtT28D9P2XnhojPym3NHja6+c0JCmr02S8VjXrhD3HNlsL1QhmA/D/CaGFUBGwK99D
         vdqA==
X-Gm-Message-State: AGi0PuYmS+53UdmZlo9qBaaMW+xsTfygDQQPe2MRH+CtDAVvA03i+kz1
        g0znXCzXDuO+f1xwxlT3UI3sSmT91umRwjV/uiZ9LQ==
X-Google-Smtp-Source: APiQypLpbeypU4ki+UmD5JuIgl73+i/KYp2i1XhWJ1EL1TbPRT9iSb2h8h/xOs7g1rD6SJ9y0+P6/9yASt1/vFoSHTA=
X-Received: by 2002:a1f:1a4c:: with SMTP id a73mr1887649vka.59.1588678400145;
 Tue, 05 May 2020 04:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200423130432.9990-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200423130432.9990-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 5 May 2020 13:32:43 +0200
Message-ID: <CAPDyKFpbNyEcyWpPCNNm_H4m204Kw8C2mHiRc3b4HZrOtSozzw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mmc: renesas_sdhi: avoid bad TAPs for Gen3
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 23 Apr 2020 at 15:04, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> From: Wolfram Sang <wsa@the-dreams.de>
>
> Here is a series which avoids using TAPs on R-Car Gen3 SoCs which are
> bad to use according to HW engineers. The patch was originally for the
> BSP (Thanks, Saito-san) and has been upported for the upstream driver.
> Before we can apply this, we need to add some mising information for
> R-Car M3-W ES1.[23].
>
> Patches have been tested on Renesas Salvator-XS boards with R-Car H3
> ES2.0 (changing from TAP3 to TAP4 here) and R-Car M3-N (changing from
> TAP7 to TAP0 here).
>
> A branch can be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib
>
> It is based on current mmc/next + "[PATCH] mmc: renesas_sdhi: shorten
> types after refactorization"
>
> One implementation detail: For now, I kept using a generic naming for
> the quirks, e.g. "sdhi_quirks_bad_taps2367". It is possible that we need
> to rename/add ones later which are SoC bound, e.g. "sdhi_quirks_m3w_30".
> Especially when we add manual calibration somewhen. But for now, the
> generic approach seems better to me, so I sticked to it.
>
> Looking forward to further comments and/or testing.
>
> Happy hacking,
>
>    Wolfram
>
> Takeshi Saito (1):
>   mmc: renesas_sdhi: Avoid bad TAP in HS400
>
> Wolfram Sang (1):
>   mmc: renesas_sdhi: handle M3-W ES1.2 and 1.3 revisions
>
>  drivers/mmc/host/renesas_sdhi.h      |  1 +
>  drivers/mmc/host/renesas_sdhi_core.c | 61 ++++++++++++++++++++++++----
>  2 files changed, 54 insertions(+), 8 deletions(-)
>
> --
> 2.20.1
>

Applied for next, thanks!

Kind regards
Uffe
