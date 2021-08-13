Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D073EBE58
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Aug 2021 00:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbhHMWmI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 18:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235327AbhHMWmI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 18:42:08 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7061C061756
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Aug 2021 15:41:40 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id m17so14067790ljp.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Aug 2021 15:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gg2dj+Ghgetmvc+mMf0/S4duMGD84/QEoSOPyY6l8pQ=;
        b=fMrGMth5ttz773anaFDqQ1DEn0qZxKH/bSrWu/t60MEQF7hdUS+Xw8gnJ4a1jkDHkC
         cbk9Feyvph1NTGdNqZG2vaKeYX8Iy/c7eFWoVcyiHNSpBLSVVQGbYMdS/F5PCK03zCh9
         GIQ2g/6kurPr2n3pBQ00TphC3aTATJl+RFWHcJ3R4kcmMR+ATigUCPyk0f8/hFvmbzIr
         BOvKOska9lWyby5tzgDqCCNEe3PsKhDjqpOuZKbFBTOdW0ZnaesLRnMkDTbu1+2zzall
         5ogX/qHifWtBVU3ar8onNM+RtyQMGUDnBHkyHuUpp7k3Q3hmje/eMcuw4q3veucUkuJo
         nHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gg2dj+Ghgetmvc+mMf0/S4duMGD84/QEoSOPyY6l8pQ=;
        b=otO4WIZjRW4PTbgjkqTL/Y1ksotnpqdVJFURf/nH545d0IhGZrfWJ4mjmv9DG5SyWi
         ACZpem9M3q6U8k0hagV3oPHfZ6rZCNzahiIt8zfGWogN7E5YtfrNXiQwNZseqFbenQD3
         Tavl/IsnhWzKMHoebHiwr0VbOALrtPz/P/N1lPYqhR4ErEln0ZzO4o01JUGNaXO34i0u
         E9ts1rwoyZjSu/6pSZtWJdtd7CrSh7ZUMpVkuQbc1RC8WYCAjuJ9dRIqW0OrbcX95B+p
         YxWygb8IsJuImmPuv6lRGD/wClPCkO8SJktq4M8C1He7aeEC4p/qA5IhIAOsI/sCfj+H
         WKjw==
X-Gm-Message-State: AOAM533FJU7Gf+8asLnA5kK3+JFqI5Rlx7R8ItspUgiTCO/xbmjk5FQG
        8e5YDHsoGeVEdbDdQXZ9rJ+Vf4w/ZqOGvyO8w0J9iTMW4Ds=
X-Google-Smtp-Source: ABdhPJwwZqNFL9U3AG7S2Mt3ahulRT6tWTMf9AUcRUrrv0VzehC1gyqRY7BxDEi4z2Ew41uqGbVGTeCMYhs8yE6s6Xs=
X-Received: by 2002:a2e:9e46:: with SMTP id g6mr3442282ljk.326.1628894499045;
 Fri, 13 Aug 2021 15:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628850411.git.geert+renesas@glider.be>
In-Reply-To: <cover.1628850411.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 14 Aug 2021 00:41:28 +0200
Message-ID: <CACRpkdZks7_gUHs8SWugX8KubPqWfAuOQiPLa_uWKmpNU1iY6Q@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.15 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 13, 2021 at 12:28 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 91d1be9fb7d667ae136f05cc645276eb2c9fa40e:
>
>   pinctrl: renesas: Fix pin control matching on R-Car H3e-2G (2021-07-27 09:29:02 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.15-tag2
>
> for you to fetch changes up to c4c4637eb57f2a25c445421aadeb689a2538b20b:
>
>   pinctrl: renesas: Add RZ/G2L pin and gpio controller driver (2021-08-13 12:09:04 +0200)

Pulled in for v5.15!

Yours,
Linus Walleij
