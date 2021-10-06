Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C699423AD3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Oct 2021 11:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237969AbhJFJuQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 05:50:16 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:34763 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237935AbhJFJuP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 05:50:15 -0400
Received: by mail-ua1-f49.google.com with SMTP id h4so1349457uaw.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Oct 2021 02:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPEuKjVCcMfPlc2qyyfy8CwebttlAdi7ueasG5UMvVA=;
        b=j7PM1SR4rO0KjWsCFXMLGixaIp2FRJN4sE4h927LwEeODfl6tL0jeJ/coO9DOXyCOv
         UpK+psGjo7B3GiCxy7Oo9QZhQC2rYh25+eggEBzWij2Ds/YSjG/ENxfpVIxZV4o/KsI6
         u9xDiauOFmG46rluQ3lNzGsoiRIyVVuFG7rG2LyzL3UiLlXv9daM6S6UbQuOjMY6pO/w
         gJaOGJBYdPkQX3Bda6l83SfVhWrooBF2TZ0olDykd1DTz5MMP48y8INJozZUsiDz+jir
         uwwhCoWnhP6kL0z8I4r5dQsdcn0lWPOinK9UpqogLV1cynZn7JN53se9kwIwtmnVfu1B
         8DoQ==
X-Gm-Message-State: AOAM532aU6bTs/GmxmyQyQLKTNzPWEyTW4bOmUTyAYPdyp1BIH6uhPgL
        u8LfJiSbo/oyT+IZtBC4geTI7STSoANatEOWYPiUANSd
X-Google-Smtp-Source: ABdhPJz9Fg8NCwmb2yAPj5Pd+FAkVvmnGCvh+iquR0W9xE6MBXlkGC3sV9jK2U4+DtKyAuSIsDrLAzgVxjX+/5zO2Jk=
X-Received: by 2002:ab0:58c1:: with SMTP id r1mr16661010uac.89.1633513703464;
 Wed, 06 Oct 2021 02:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211006085836.42155-1-wsa+renesas@sang-engineering.com> <20211006085836.42155-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211006085836.42155-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Oct 2021 11:48:11 +0200
Message-ID: <CAMuHMdX_91a79aAUtkrxKCB3-64FAuQmz2mzQ-9aE+W2KD9Z3A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: falcon-cpu: add SPI flash via RPC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 6, 2021 at 10:58 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
