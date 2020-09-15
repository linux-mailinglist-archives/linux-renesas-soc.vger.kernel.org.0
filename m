Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F2826A148
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 10:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgIOIvI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 04:51:08 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43906 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgIOIvH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 04:51:07 -0400
Received: by mail-ot1-f66.google.com with SMTP id n61so2475340ota.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CWVJKtcIvRP0jlU2X0g/vyqL/HKDKIe9sDBPgM5LZaM=;
        b=IYilJBZaMu0/Wqa43ms6V9dTowMxD/Z+PppNmn6eKhuD0qJzX6LKRo/GHlVmCbyQnv
         yZJSC7EnHvrCryOHwm+MMfFFydbdvsHT8czte4iYOyUlJ5dS/4ee3qTGs8MMN48aELXu
         kIhyg1R57Aj7zfrs+eSrHnAELUa3SvmtoHMHPR2F2oNR7wtDGEOHWLOY8rumUEjZtYsE
         7bQFynW+gXfAR5sRnybaMNeqqWeCv4kOZR27f3gDloxNE9CcvuZf8oqVClCUXh4x36QN
         rmxNrjmju2EdqNUqN1948qsUohzZ5zSjtHD5lFCimtlaEvz99nRT2IZwBEP/aRPtdPNj
         yivQ==
X-Gm-Message-State: AOAM531Y5j1GtkbbN6wQRywbe656USpfXPhqHuTQgi8AWK9Adb4Q2zOZ
        U/btetqAabiw5tWGAxcDgU99n4t7V/PW/RLJVLU=
X-Google-Smtp-Source: ABdhPJy3SDYeGFQHzHwZwAPinXmTHIIKqS6DvPGJDOgin9o9T9QDMr20vo9JH/YiSb0okqn5/5b7/YWE9g+F6S0r9to=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr11948235oth.145.1600159866935;
 Tue, 15 Sep 2020 01:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se>
 <20200914233744.468175-5-niklas.soderlund+renesas@ragnatech.se> <e38a41d9-d765-da0a-ec03-60432dece9e0@gmail.com>
In-Reply-To: <e38a41d9-d765-da0a-ec03-60432dece9e0@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Sep 2020 10:50:55 +0200
Message-ID: <CAMuHMdWksZj4_mNE5zsuO6-FGA8HmgCg+Lu=SWBMU=JWvDHK1Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: sh-pfc: r8a77965: Add VIN stf8 pins
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Tue, Sep 15, 2020 at 10:18 AM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 15.09.2020 2:37, Niklas Söderlund wrote:
> > This patch adds VIN{4,5} sft8 pins to the R8A77965 SoC.
>
>     Same question here. And what is SFT8 anyway? :-)

https://lore.kernel.org/linux-renesas-soc/CAMuHMdXdDkPX447AibYNjUwGHkYxC3sE-18G2DNVQR2T-jxX2w@mail.gmail.com

Would you prefer "vin[45]_g8"?
Or perhaps even "vin[45]_green8"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
