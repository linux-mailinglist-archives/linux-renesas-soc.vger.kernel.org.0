Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE2F45C6B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 15:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350225AbhKXOKn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 09:10:43 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:45804 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351542AbhKXOG2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 09:06:28 -0500
Received: by mail-ua1-f41.google.com with SMTP id ay21so5263639uab.12;
        Wed, 24 Nov 2021 06:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1miQpIXaIUOJb7zbeVhTJQekQAUmPNGz0CzH/J6gnS4=;
        b=aKeEk45mMWkvquGRwVVH2id1fOeETMWNJH3AZGWSsKeK+lRGDIv4CbgPOAskCvdLpU
         g8iJy67Pcvt6GTpa7jfDNDafNFvlj/H+Ns3tehLUNrJyadaJcMhtBnpjhLxcgTkjGpRx
         3bp0c9sbKGGOOGsVpbQCgu1Kt4cm8PPE8x+FCVgF71dpLRYkscu0loIq4E4ONWlRon+w
         BlM9odIVjOtdWpEpXG3785tOtHHhwDIQKap/UBayQ5j/ItIRKNjzitdQeOEFYOKYkmw+
         4eu3xzJmSN3XeVq92sL0Z1zO2iy0R6yJDbZ9tYJDiac/0TPLFzLbOSqCgqkwt0aZSqZ6
         Wlvw==
X-Gm-Message-State: AOAM530+htRD4Wz0bOO3fOyDs+C/uKtWOPImdo11yisGptgvd2loxAkp
        UeXXqHt3HZKpIVLbW9XBaEn2x0445ew0vg==
X-Google-Smtp-Source: ABdhPJxLTveykx76s0N/ZqcAbWpJ3UjBYMrJ81Ga1lYgJSD/GaupyGkToQbbiP7yhvtcuwQqTnJqLA==
X-Received: by 2002:ab0:224e:: with SMTP id z14mr10379041uan.97.1637762594793;
        Wed, 24 Nov 2021 06:03:14 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id y2sm8034567vke.43.2021.11.24.06.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 06:03:14 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id y5so5303725ual.7;
        Wed, 24 Nov 2021 06:03:14 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr22399452vsl.41.1637762593813;
 Wed, 24 Nov 2021 06:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-17-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-17-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 15:03:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVei8uVGOG91DA_G_DAghQR1OuoZ_qtxMgLFxbt9Q_hww@mail.gmail.com>
Message-ID: <CAMuHMdVei8uVGOG91DA_G_DAghQR1OuoZ_qtxMgLFxbt9Q_hww@mail.gmail.com>
Subject: Re: [PATCH 16/16] arm64: defconfig: Enable R-Car S4-8
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 16, 2021 at 8:43 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable the Renesas R-Car S4-8 (R8A779F0) SoC in the ARM64 defconfig.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
