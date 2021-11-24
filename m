Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE0645C6C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 15:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354835AbhKXOLO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 09:11:14 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:46976 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348765AbhKXOKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 09:10:01 -0500
Received: by mail-ua1-f48.google.com with SMTP id az37so5282155uab.13;
        Wed, 24 Nov 2021 06:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/j+S/w29WKZ9bb0B5ofHCpksCQABsDjQUWjoU+wjeDw=;
        b=HgD9R3xy68SMVbOXWGSFrLXP5WW6Rc6OyTqPZhrsNSvONImCbymuiWZqyGJm081Yz9
         +mJLBe1cZ6sHm6RwPJH+hMZ6Qux9MJTed7Db2Az2sFgD+E96+R+r9js4xjRWc4oUeq00
         pp/pk3Hqq0JW9UUWPMsoIKS/tuggwGb4nS6Lv4ykxCmXEStQPXiYIR191gYzVz8AOr3B
         IqvV8IWtuFHkvLzdXttBlQuMlkwRMj8rS3zdGJgrxUDFYXaHxs68gj3xw9ZuH3orLUSj
         SxKYknM2kpFL3uECKWaQqerVv/L6745j0JT5t30hwoDJ3kSeC5p5voe5urjt3o38v4Q4
         rY/w==
X-Gm-Message-State: AOAM530vdcmLlY31S6O9cTvWXpN8X/mR0Pa63Zmayn6tcaeuSJGXS9A5
        9yac7L904SLpw7gmZ29atBnkg86V1sBZEA==
X-Google-Smtp-Source: ABdhPJwalXpWYVFoqYniEDAmayMBzpJszx/K3lyHqagctFXoA81iydKgC56QWssItVJY2yoiRE8J9g==
X-Received: by 2002:ab0:614c:: with SMTP id w12mr10823559uan.45.1637762811466;
        Wed, 24 Nov 2021 06:06:51 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id y22sm8330836vsy.33.2021.11.24.06.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 06:06:51 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 188so1559348vku.8;
        Wed, 24 Nov 2021 06:06:50 -0800 (PST)
X-Received: by 2002:a05:6122:d9d:: with SMTP id bc29mr28391500vkb.14.1637762810685;
 Wed, 24 Nov 2021 06:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-16-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-16-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 15:06:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZrGdwKnN=VKTiGp_Vj6CXgE=G_1OfDf29wHGd22q=Tg@mail.gmail.com>
Message-ID: <CAMuHMdVZrGdwKnN=VKTiGp_Vj6CXgE=G_1OfDf29wHGd22q=Tg@mail.gmail.com>
Subject: Re: [PATCH 15/16] arm64: dts: renesas: Add Renesas Spider boards support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Takehito Nakamura <takehito.nakamura.nx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial support for the Renesas Spider CPU and BreakOut boards
> support.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Takehito Nakamura <takehito.nakamura.nx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
(assuming memory size, extal clock frequency, and serial console port
 are correct)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
