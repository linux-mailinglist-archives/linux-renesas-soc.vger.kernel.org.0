Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34D53DBA1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 16:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238990AbhG3OMu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 10:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238958AbhG3OMn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 10:12:43 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 046A2C0613C1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jul 2021 07:12:38 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id e5so12569047ljp.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jul 2021 07:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RGcnnqSmagVNvQoebiecahwo34gntuMkg6pM3FvCbWc=;
        b=FeY89h72xK2j5E4qOePjYJK3qLXZo95FIQ+EbXxcFKVOpNgg5Xkr821smrFCBE/El0
         4a9amwKWHraMpNa7g1cKB9qTX2iXV+LWeMgN+Ujz5Pq4TXl7UMkawtb3EWSRRcNhPu48
         10gn5vz9rvQT1e1xaOoYwmSmTbxfv2q8QaeVA0jDoIXR0U9OeHuhMUV58E/HlUlUxzDD
         MNMYuXabn9fZtjKg8wUqVMmnaqBbGGO9jAFAL+YenM6YKhr9HMGvCJrtXgC1Yz8lGKgJ
         QckEImCBAaawtwjiFpXLgbB9fclDGt0fAh6oW21ITJv6hE1iI6m15Df90R8R+1KpJ/6S
         4QCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGcnnqSmagVNvQoebiecahwo34gntuMkg6pM3FvCbWc=;
        b=uP3S35vW+pT72prFPk8MRa2qJUUM92Z693ndpgUXl8QAWDkMKvE5HKm7hIomCrSHHm
         vMns3QwK6Pb62lO2vN0XhOQjoty0DOXbFDsRlAoTNjenhlatfujvUk8TlxROYtZH+IQf
         vgeI8j+X79Y3Ma5+XVGjzDaxaZsBu4Ip39JQwIgYFDiHtfHRDRYrlf9/OqehPuPRnfxH
         7jsYrgEiU2NTsXyeGEWs8RVbd5h3D/v9aRbBE05NoaTswwua2b2T+46qsgV3Nsd/BeD+
         6/rhEZLQ0VIpblViYrqnPrIj58oFV1oLtVw9GKNaVHi7uy5rmNJuFipYt1I+Oek4xdK6
         t6Vw==
X-Gm-Message-State: AOAM533v/EM1I3M9GMuf8QV1JQ0aLXR0n3FyEgbDwGvUsOeEQ1n+Ttkc
        o7PiZc661Un+Z4A+b39bix2vF4d798lUIwBUQEVIhg==
X-Google-Smtp-Source: ABdhPJzZOIuzywgWD1OYYmMBDmj/RutZYscHdNEYIrYgTYet50MTFHn1FfgdM/OQg2FeeUc9ow2dHlTydqphsBbzNB8=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr1820832lji.326.1627654356331;
 Fri, 30 Jul 2021 07:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627652747.git.geert+renesas@glider.be>
In-Reply-To: <cover.1627652747.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 16:12:25 +0200
Message-ID: <CACRpkdasmU7xHKmftgay=R-5sjek00_FR0p9Bp23P8GUaNE2ig@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.15
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 30, 2021 at 3:47 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
>
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.15-tag1
>
> for you to fetch changes up to 91d1be9fb7d667ae136f05cc645276eb2c9fa40e:
>
>   pinctrl: renesas: Fix pin control matching on R-Car H3e-2G (2021-07-27 09:29:02 +0200)

Pulled into my devel branch for v5.15!

Thanks!
Linus Walleij
