Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136F92A08A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 15:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgJ3O6h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 10:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726929AbgJ3O6g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 10:58:36 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC08C0613D2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2020 07:58:34 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id s15so8993989ejf.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2020 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i2vW/gUa8KABq6vJRUyix0aI3FxbHcHCVNJ+zNv4J+U=;
        b=KPV3bpHHrAzBaaC50FEZp+AnzqFoDsf4z8fG2+W4QSR91laGEjppD2dpd2cPkJZauC
         qEcnqyokHcyC/alN6Zz1evo0v6FklEUsIcAlIBHlWmh+p5dlgqj5bTy20UcTr5kpJ2Ln
         Xjn3QVSADxZAq22aqaHl7jdGHHSpuAfyBIBsMRkPWTA/IBeRuZbKJXr8DmwMdpdhIrPb
         205xpSbwsxBUDgFC23oKMYvmnUtvbEj0Y6uD9Z54izsByibk6E/MkizklE7OH+T4ko+W
         ELOVHsUsUjbAtx1KWcn55nqyRK8UJafNsSkFd9igeyIjYA9RJPlA7fpbMT924mVbq96P
         FJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i2vW/gUa8KABq6vJRUyix0aI3FxbHcHCVNJ+zNv4J+U=;
        b=ozR0ayZ0sjjAuml2rSXbqkM1K0K60BbW0Z00gJOrAeuLIYwUboe68VYxwgO/4a2tGN
         6Ht+veNv5/2FsmXIHRza2O3B2Uc29R+TsWUw7tUxe2+ofZdJL9ev3BstS687BooJO9l3
         4ONnEQrTI7eER+YgbFim8t490mWYy+6Bkr6WMzDMOBDsT9O2cDRumeCnPqP3dSpDiyw9
         d3T0ZV3R3mEj7ZBR01wuy7gRuilZ3g6dglQZX4ysnN8dHcH2sbaVB3nz0bqVHs/grSDa
         AgIHRGd+mDV5GjYywu7iFrdGb0C9G9JsmjDUb99+OxoLMOsa3CqV3PxIqlUOF1CmCIU4
         I3yA==
X-Gm-Message-State: AOAM530vCIy7xh+QY7Jb2ZlnUOH43DgC0qQWrDayBo/jXi/lanOkf/Hb
        W1ox00C/O+LvQJqirVJrLwmIxVZLU4bOxo5mhZCISw==
X-Google-Smtp-Source: ABdhPJwAe5vVmO6vKwNIvkOdI5Rlek4y2s3XyxCFNDw0GCTi9mdwLw0HpOOabuKkXdvVQpzi81tYQoZqMo3W99mrbmw=
X-Received: by 2002:a17:906:6a8b:: with SMTP id p11mr2948429ejr.470.1604069913474;
 Fri, 30 Oct 2020 07:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201028141504.1729093-1-geert+renesas@glider.be>
In-Reply-To: <20201028141504.1729093-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 30 Oct 2020 15:58:22 +0100
Message-ID: <CAMpxmJWXUHCOMdZOjqXADx3jM2p0pQUdm2j=qO96ZgJr46JxuA@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: rcar: Cleanups and improvements
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 28, 2020 at 3:15 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi Linus, Bartosz,
>
> This patch series contains a few cleanups and improvements for the R-Car
> GPIO driver.  All four patches are independent.
>
> The gpio_chip.get_multiple() implementation has been tested on R-Car
> Gen2 and Gen3.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (4):
>   gpio: rcar: Cache gpiochip_get_data() return value
>   gpio: rcar: Align register offsets
>   gpio: rcar: Rework hardware features handling
>   gpio: rcar: Implement gpio_chip.get_multiple()
>
>  drivers/gpio/gpio-rcar.c | 87 ++++++++++++++++++++++++++--------------
>  1 file changed, 58 insertions(+), 29 deletions(-)
>

Applied the entire series, thanks!

Bartosz
