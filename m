Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DDC356C7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Apr 2021 14:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235202AbhDGMqj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Apr 2021 08:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235035AbhDGMqj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 08:46:39 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A39C061756
        for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Apr 2021 05:46:29 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u10so20516832lju.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Apr 2021 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9fEidbG2mkH1AcECygNcp3MNB9ZfpqzIVMUEPrbQPzc=;
        b=BepU5eueKnJ1sfHKHWdyeTo+Ezij/ITEIe0XBuV+fOTdy3UU9S1jA+T5LgGRqXfZ7n
         5s3vYtpts12q8rprpifg9HGt4Io3N1jnAwd8RGSKZSqTxHTQ2zIiTbcCRwvmGtFiGa7I
         XW7xXC8VoWng7oLtV+NGPq+xTJ71c6T4HmllZAgZuFd3P5BQCvObMIUV5nmhuhnC+QA+
         swlyKTMG/UIWCUUaICtRtZBkTk6pvweClo/sDNfO2zh3pZvft8D3KcJmKen806weQzfl
         uka0MQCuibP3Z9zloNGhe/bv0teNSlLiCGTMQ9+Ga+yOs59KkCkmICqqSsCmE8RMDBDQ
         K3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fEidbG2mkH1AcECygNcp3MNB9ZfpqzIVMUEPrbQPzc=;
        b=rzgxaYJitZZj+RVHXIYSmaeHcmTEN5FuCpKxznbDxmX1dFn9D9A9rZSVr+W/SMOSUs
         e+eIlTdpn1hS3xUOxuXYmew4IbyZOb6DG/gLU1a4U5TAutfy7pfjkEWwzwreK1rguoT1
         UNlT+helJQbilZB0d9OiLPX+BruS1m0W9L/MKGL10BrWd5EP1nufQCKB2SJrfb1pTG1n
         ka4H1BsCuNp5aoIwA64n65UYzMJFWlVToN9zB+bKCY2HbuFMA1Fx9lMChdE9/Lxv+wVr
         bDB6GaliQB0wLz7elqoYUCqa9SHpqrq896y+5qYanKcNfstftuFUa2a7Nx6yEJblLKkN
         5GPg==
X-Gm-Message-State: AOAM532QePWl9dOUoevHC859UJGyBWhMoTaPDykp1VR84KOAgclPNdxY
        hBe251htnieUziAufDbnOof1TgqX4UujBDknEqN7qvo8rNdqwg==
X-Google-Smtp-Source: ABdhPJyjxbqkrseOVwt1d8gFHppZQCb8Bovuc1UQ5ikzaPez+dbs8HtS5kKTqLUF+M+6+plEUrE8QHk0MQKX6Elnsjs=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr2084192ljg.326.1617799587838;
 Wed, 07 Apr 2021 05:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617363828.git.geert+renesas@glider.be>
In-Reply-To: <cover.1617363828.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Apr 2021 14:46:17 +0200
Message-ID: <CACRpkdadBnrxbCr9Pe=aHD08Ouz3=Qa-WZruv=vpVBSZtFEDoA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.13 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 2, 2021 at 1:46 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit f7adcca27edf05fc1f061a9e5de059fe179f0e1c:
>
>   pinctrl: renesas: r8a77965: Add vin4_g8 and vin5_high8 pins (2021-03-10 10:50:26 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.13-tag2
>
> for you to fetch changes up to 61232cd6efca6e4d2705993850d014343ba604c4:
>
>   pinctrl: renesas: r8a7791: Add bias pinconf support (2021-03-24 10:38:29 +0100)

Pulled in! Sorry for the delay.

Yours,
Linus Walleij
