Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678AB2E32DB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 22:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgL0VQY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 16:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgL0VQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 16:16:23 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B56C061794
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Dec 2020 13:15:42 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id h22so20110877lfu.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Dec 2020 13:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMqIbGNT1uRm2Dt7z/3RZr+PEtVxh923UTsM0yVqWHM=;
        b=ef4XuZI8QNn8O49uxxm4f8UtYLcNbKzVHchsqHrpGTmI6u7KmkfD8tLeG/wTuQQ3e/
         DkEl0MCkL9AwAGvBSS0aoUeHdfYZSU8/t/h5yaVXTJdjDNBbkiCzPdf46yM1gmOr0e3Z
         qxDbFw6GAKSWszZzCX74Q1UXe2pUBUMP7uGw0UW197rCuIK7QYQqOO4pHd3i1Gvxro3A
         aueP6dyL3m4NI9ThtASAjbYN5nnNQGsvbD+5ddgRyxPe/wktBpUpd5WZaxemxd22VGTo
         3L0ZGIHt5Q9GYC3j93PJMFk305LWaYkCIZ+LuoiAba4keVkgF1joFthm8GSOd5qnUArq
         6H/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMqIbGNT1uRm2Dt7z/3RZr+PEtVxh923UTsM0yVqWHM=;
        b=BYOe9ZIMq5O0YQ8+V9WxQ/Piv5U4K7/C0IF6K+mxRHHHZcoI7BQFwt7ZvXuhRUgmpv
         JzeeCgCGvqzHhEGFaKH/cBBBfX2QyKstEc2n4Nj0wtZpr2msjllWP9le4Q9fllSWEwN7
         umoK1xk/NUtSpI5W1+jr8hz7GRgM4o3lcysUS+H0FkDu4qU8jKeD6UimTjG16+WTpO9v
         6NUbUpzNv2oCKJwVDL1LTFVWvaxpFsFYuYO0e/NRyVWmjraPCkafLkLmATDaixR5eTbR
         njIVfXtmIBiXJ6IhlfxTGBvREGau+R0riBamonriHPwFn5L3b8+q4z0/LkL6t/fWMnrM
         6U4A==
X-Gm-Message-State: AOAM531KWSLmtNLEffT3TBk194aK6WYMB/4Ty16Tq0p5s9DdTxyv4aSA
        +3q0dF5nweRDwt1miO3ocDff7hbVD8ZWQExI5+pllQ==
X-Google-Smtp-Source: ABdhPJyP3kmgjYBT7Dm+PX5wPDwFtO91CJVAMuLe6iKDSuOFANzhIFZA3QjoxYnDcfpOZkaT04Hm+jZxnkIClgOcAUk=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr17161577lfd.291.1609103741538;
 Sun, 27 Dec 2020 13:15:41 -0800 (PST)
MIME-Version: 1.0
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608718963-21818-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1608718963-21818-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 22:15:30 +0100
Message-ID: <CACRpkdauO+9npR-p7BV3DK=54U9J0BWE39e+C5j0SCPvf8RT6g@mail.gmail.com>
Subject: Re: [PATCH v6 07/12] gpio: bd9571mwv: rid of using struct bd9571mwv
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 23, 2020 at 11:22 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:

> To simplify this driver, use dev_get_regmap() and
> rid of using struct bd9571mwv.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Is this patch depending on other patches in the series or can it
be applied directly to the GPIO tree as-is?

Yours,
Linus Walleij
