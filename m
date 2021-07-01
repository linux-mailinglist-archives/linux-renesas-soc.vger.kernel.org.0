Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859673B8FEA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 11:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbhGAJnT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 05:43:19 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:44804 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235362AbhGAJnT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 05:43:19 -0400
Received: by mail-ua1-f47.google.com with SMTP id e7so2204524uaj.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Jul 2021 02:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2CeG5XZGmPo3GdivDonj6oJMJ6tyQIQunEqjvNk0gRI=;
        b=L/aHx1ck6Cyg+PrheBVrqRSIc5yKLWlGXQX1zoz7FZdVPA9bWnHh6vQZbB6f0LjNZL
         tBwVY7zJEawKa9htTQLNs0Z5TsZYwrGDtJUqQoCSrdHpYfq4+regg2jMc35cpzex32mG
         ACoPSLGASPx0uvp60BMXZ9iYVi5Gfz586E3onGCgzwY0dqy3HDxlU5Yu6bp49VP64nkf
         ZTdOngEAngDGt0NsS+csdKk6NZGol/NJcnfqoNMy+29cbvG7C2z7l54nK2/AyH7OW3pT
         yebhk6xIBDwYG3dOmrfJWLYmfsdv+ALxeqf95bNmV0iJUmcbaoTitsiMaqiOMfY+ndUE
         fWlg==
X-Gm-Message-State: AOAM532oE15kxirZ4BdXAzUxL3FLX5AvqKAZYcZZ44MW2YlHmHY6+omT
        TTcXtTIcANXeEYP0paLKPNV7MpW81HM1qvC0BE4=
X-Google-Smtp-Source: ABdhPJxLF9NqjIP/mme5msK5jLKpri8zN5ynd3iI8ClAgvb2Vy6oBJ8ztgLhmseckDUVIVgJaGm6mN2ZVUPLloOGpNA=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr38815311uad.100.1625132448696;
 Thu, 01 Jul 2021 02:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210630175935.189454-1-aford173@gmail.com>
In-Reply-To: <20210630175935.189454-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Jul 2021 11:40:37 +0200
Message-ID: <CAMuHMdX-eddUW6SbECKT=aUqOHDy6fP93VMaynCTChd=-C7kjQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Enable micbias
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Wed, Jun 30, 2021 at 7:59 PM Adam Ford <aford173@gmail.com> wrote:
> The IN3R is connected to an analog microphone, and it needs the
> micbias enabled in order to power the analog microphone.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

I'm no expert on this, but "make dtbs_check" likes it, so I will
queue this in renesas-devel for v5.15, unless someone objects.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
