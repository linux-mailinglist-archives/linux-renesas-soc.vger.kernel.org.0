Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE684688C5
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Dec 2021 01:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhLEAlR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Dec 2021 19:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhLEAlR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Dec 2021 19:41:17 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7356C0613F8
        for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Dec 2021 16:37:50 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id s139so13797189oie.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Dec 2021 16:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GYc91jfTky4WwCx9RL0QsktLqw+ztIoLTaFoG/6x6v4=;
        b=F+IzPtr4vAwIheVh2GBL/E43aPnJqVMbBMk47nMyC4S8BZmWNXZ2YqCF8aSsCvc/Oc
         UqO1IP7zHAXO5Ypu4+gj4q5FwRV5RSYAb0S022V0OLSrkNicq+cSd5S/5xEpcarXt/Da
         AGV25LV26eHfzsItc8i1zrFhGAjZn1KnKrw2XllUOLWZF2YyH4Q/o8sPFxXSfrCCp6dO
         rWSWl+EEZZ42K91gVz/D2bLUVjf9g4f3FqkPS8U3WlKrJgcH+nxRN6gxMLIMwDxE7Q6Q
         B6VqReXJLq8oWbuBT5vjV74A9OUOshvnq9MARvE7E2eS5WHrZYAVoGpvwjHJfPTJEh3a
         IoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GYc91jfTky4WwCx9RL0QsktLqw+ztIoLTaFoG/6x6v4=;
        b=yiVRH+HR24jmCwCe+fpgR5ECNcUnwgvumfZFo0ZlYyplfHjfRFZcGOP89ChZjZDfDm
         HKttF3jEHmyysAH1XJiCva4R6Nj6baogXr6RTckkT+LSceXOM1TT68npN1CcQNvUEFE7
         v78rSnPNbqoGVxBrHwWm5q6Jvz3d1AgDfGMQ32fbNttKn7ts5kjgs1E+w1XQxofOaCeS
         I4NT/hnh9Ebda/2CiJF2UeEptvotvAHW4O6J24XpAlKt2g3Jy1fYCC0EQDZNLpD4GZFh
         5+1x54tlQN4t7Mg/+s6FYKzk7s7znonWRdqAPofgQeLkvLogP0kLpnJaAE0TGOLjqViQ
         j2ZQ==
X-Gm-Message-State: AOAM533l5sD2T8+JUc+QzyWsfZRaSoSqqUT1ZT2bjiPLslGc1vJXQVb/
        PFWiBr2sUO+NpH4p2Gpp1IAgzppnpEkY2i6OMQM0qU/sA5c=
X-Google-Smtp-Source: ABdhPJxXW9fZnGj1KJj1dkHJzTt2xi8/FEBvkgE/wqjd13+GAIGvhqsL+DSfzyE4HJ5h+z5VRxRt0gi9TEH4mIsbg4k=
X-Received: by 2002:aca:120f:: with SMTP id 15mr16691330ois.132.1638664669979;
 Sat, 04 Dec 2021 16:37:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638534672.git.geert+renesas@glider.be>
In-Reply-To: <cover.1638534672.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 5 Dec 2021 01:37:38 +0100
Message-ID: <CACRpkdYNpmjfTsgT8RzsCC7X03_YQ-h+eDGPKG9fLevv65tsoA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.17
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 3, 2021 at 1:33 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
>
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.17-tag1
>
> for you to fetch changes up to 7c50a407b8687ae3589c740d2347d9ae73887889:
>
>   pinctrl: renesas: Remove unneeded locking around sh_pfc_read() calls (2021-11-19 10:55:21 +0100)

Pulled in, excellent work as always!

Yours,
Linus Walleij
