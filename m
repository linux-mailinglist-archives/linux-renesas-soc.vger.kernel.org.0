Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73E2F38B91
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 15:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbfFGNXW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 09:23:22 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38895 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbfFGNXV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 09:23:21 -0400
Received: by mail-lj1-f193.google.com with SMTP id o13so1723130lji.5;
        Fri, 07 Jun 2019 06:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b41tbY8XQRt7INtfdyIYjwjYCsxyzIoYSZrqkLgUmT4=;
        b=PeIu6Zmj8jObSBEUsDqeybAJjfwmnzXY8gzs6oYLucpzvy3I5BaO5j0CzlHIJw7m8H
         pLMXsJXMQu0vt0nrFZxu+QElKo189OAinShmjKFqhJrOihgl85kJ+8sgzGFHrLnJApvq
         q7eeM7sSyPZHip/4DtHMGhkq83xpGjxdlfsVF7dfGCKQcZ2vvB+p4bY5vm9i1tlCC4QG
         8a1powtL5Slvs0yrp84cBMJ/Aih2vGRg4xX5K5ZtY+kbWerAO5kMRCAt4nyfMtqZOmTA
         u7tC9GOLQBsj6k8Gf3HZltdkv4zqtHSeUeUwLCrZs8ioouiZeiOdkq5iOUMy0wpUn+sj
         adSA==
X-Gm-Message-State: APjAAAVhIlHs0MnFelo2U9CvVzlTF3OoXdrzuwDAL8OLv1HVo5Re3KdM
        SO2sSIlfXjBKsN26mebP9CdFAWpVFUz284Imqbg=
X-Google-Smtp-Source: APXvYqxoKpDRnGNG4IfsZiXCrJofosrjw6mmDMzm3neXl5STI/S6rt/xOfBgUr7QT5ALjh8fB8F+/L3FaiN2DVpx6Pc=
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr3784285lji.133.1559913799571;
 Fri, 07 Jun 2019 06:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <1559901734-23540-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1559901734-23540-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Jun 2019 15:23:07 +0200
Message-ID: <CAMuHMdVwdb1J8j4JaeHhCmkSF4ozWN+EVh7f01MSaGOkSb9W0w@mail.gmail.com>
Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: fix imbalance powered flag
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for the update!

On Fri, Jun 7, 2019 at 12:07 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> The powered flag should be set for any other phys anyway. Also
> the flag should be locked by the channel. Otherwise, after we have
> revised the device tree for the usb phy, the following warning
> happened during a second system suspend. And if the driver doesn't
> lock the flag, enabling the regulator is possible to be imbalance

I think it reads better as:

..., an imbalance is possible when enabling the regulator ...

> during system resume. So, this patch fixes the issues.

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c

> @@ -106,6 +107,7 @@ struct rcar_gen3_chan {
>         struct rcar_gen3_phy rphys[NUM_OF_PHYS];
>         struct regulator *vbus;
>         struct work_struct work;
> +       struct mutex lock;

It is always a good idea to document what is protected by the mutex:

        struct mutex lock;    /* protects rphys[...].powered */

Checkpatch does have a check for this, but unfortunately it is enabled for
drivers/net/, net/, and drivers/staging/ only:

    CHECK: struct mutex definition without comment

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

and the imbalance is gone:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
