Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9CA220AE2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 13:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731540AbgGOLJx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 07:09:53 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36525 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731536AbgGOLJv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 07:09:51 -0400
Received: by mail-ot1-f65.google.com with SMTP id 72so1148560otc.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2020 04:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kU3/MoMoF/KLtN2PgNM+bX3aSeZV3xOgu7ZJuX7RzGg=;
        b=HJcTC+NO80uDH7xuobLCo0Cp5B6xl4iVKnbsCKsqcRIxPuxn7DpKsSeEtnvHWtnwxI
         //gwjXUKNx85nyTp2q+DPAm+7KbBEuZPhBVoTiuNBpXFpBUY4dqSsAbqo3LKRBEJDj9E
         /dDnMtrX7jZIiKe9BUdm2zLS7b2p4TD5GNHCMnB36w0Lcvx6tZh1LAk+aQt1dnGB8qJ1
         JlAqwub6etIZ52Z5gS28d7QF98DnLdVAeov4lMj0dqrOxi/RoEwywcUlqt8++hAQVcBW
         ugNc9tOa6MGZbc6IOZ582voYgF51az/DscIFfIdcebqksUsuhzfUyn05K4NiYZkNw4g6
         VgfA==
X-Gm-Message-State: AOAM530kGJUBRlwqvvl1FEjV5lCj4HaKYuI4o1puRs5ZxvT0qzls6m0t
        jLyhjGMpQ+h2Qtt65i5OBGmVl+vOBSAnxT1JplMACLA9
X-Google-Smtp-Source: ABdhPJziW/WyIhT+1v/Wtfq0idv2SAADrZEqFGzpJkPZjCR70QURss5xvrYSFOe+GdhqlqX69zDuEk7uEkpKd2pl8FE=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr8327177otp.250.1594811390712;
 Wed, 15 Jul 2020 04:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200713111016.523189-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20200713111016.523189-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 13:09:39 +0200
Message-ID: <CAMuHMdVxLiDepTgPhRa0jHMhAH=BRZsUEtK2rtdMtNWc915GAw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: gose: Fix ports node name for adv7612
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 13, 2020 at 1:10 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When adding the adv7612 device node the ports node was misspelled as
> port, fix this.
>
> Fixes: bc63cd87f3ce924f ("ARM: dts: gose: add HDMI input")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
