Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E75B2159D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 16:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbgGFOpX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 10:45:23 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41060 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729148AbgGFOpW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 10:45:22 -0400
Received: by mail-oi1-f196.google.com with SMTP id y22so19575747oie.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 07:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=99siHt0c7wnyWMrg3p5OAUmdiu6ouS0VpmbI4VESkX8=;
        b=I+v4+0GyUify5QKn57K+zI7cw9JUsrR/iJnzMIeCQpWVHs6zH77sJlb4MlsY0AeizN
         YxIiHTniC+g+qWXehAgK/+LBJzBse5+Vj1VwF+7rFohmHTxrJuWtt7pFAFpixMW8I15K
         /YXq4i6hoz60Y4V9SyUH/hcQNl0E1y14auaS17Ui2OkE1G5+h//hbVJOYzXS0XYvBCJ5
         4MF9b73tTcnPB2/ubq/uyKvuENMWCSvjNjtBZYClsJX6z94UW6+L8CqXxRE0mrenfHyd
         qFtCd7BvxXVohqc2FljKMDNV7rUgIKKDayQ5HY3WaZNH2A/8p+oAb6bMuJIhwaaABoQo
         8xfg==
X-Gm-Message-State: AOAM531Ut37liure4chvKnM2BRilkTFJ/JMMZ6NU5+Rngox/Xw0pu0fB
        52w+35dTw9nz1EgQB3JLR75e9tl/vGLHV7Hj6FbGFv2G
X-Google-Smtp-Source: ABdhPJz0gRl5fIJY4+TZNz4HIkfsKnWEipUeDWz/2tdoozk0sHLpaSArNh3Pfgsk0rDXT0+3qDbBj6xzihONiYtLd+Y=
X-Received: by 2002:aca:ac10:: with SMTP id v16mr16894241oie.153.1594046721929;
 Mon, 06 Jul 2020 07:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200703120642.5128-1-geert+renesas@glider.be>
 <20200703120642.5128-2-geert+renesas@glider.be> <CAK8P3a0GTf-NBAixvgefyvx_nRpLgYZ6gZdp_VAUNTOV2=+t0g@mail.gmail.com>
In-Reply-To: <CAK8P3a0GTf-NBAixvgefyvx_nRpLgYZ6gZdp_VAUNTOV2=+t0g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Jul 2020 16:45:10 +0200
Message-ID: <CAMuHMdVHXztUyvEbj6ozp-zHf5Afg_hLmf4OU8v50sF2vBmPxg@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Renesas ARM defconfig updates for v5.9
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Mon, Jul 6, 2020 at 4:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Jul 3, 2020 at 2:07 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > ----------------------------------------------------------------
> > Renesas ARM defconfig updates for v5.9
> >
> >   - Refresh shmobile_defconfig for v5.8-rc1
> >   - Enable additional support for Renesas platforms to
> >     shmobile_defconfig, multi_v7_defconfig, and the arm64 defconfig.
>
> As you write on one of the commits
>
>    "All of the above are modular, except for Ethernet support (HDMI Audio
>     support is an optional feature of the modular ADV7511 driver)."
>
> I'm starting to see some demand for making more drivers loadable modules
> that are traditionally built-in. Can you give a more specific reason why
> this one (and I guess CONFIG_RAVB next to it) should not a loadable module?

We tend to make Ethernet built-in, to ease testing using nfsroot.
If that is no longer desirable, I guess we'll have to improve our initramfs
skills ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
