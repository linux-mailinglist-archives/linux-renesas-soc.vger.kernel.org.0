Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF1E2EF33C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbhAHNkB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:40:01 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:34616 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbhAHNkA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:40:00 -0500
Received: by mail-ot1-f52.google.com with SMTP id a109so9678764otc.1;
        Fri, 08 Jan 2021 05:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sStwu2hjVKoyJXOenHvxaoZq+Azf62d7qUTCj+UG9k0=;
        b=Glwdmn9Ze90UPlR/J5HbgYK7hQPagKfseofXvm7rvb2h9aRZhJHcTqr5H3D/XQ87+n
         HmV7Ww11AL67zRAUJFw+PjioSn07pkLrc58CceV0ndnCCVzbqgFkDmTdnP5WHqWrBI2z
         my852JuOXTNRC4POxYTEQM1D4KpB658FiHuqrc5e3hCLyovAXCTTbG43/IKNNyzO55Xo
         BgW85PI1zrElNNZvrO2NISOEPnto71gbZrQXQFqeQo4MTWcPcx/mYOUCTXDcqPD4zyZj
         NfllUTACwzxkUaMBoXR9payMOMdLLNMU3Ic4LJ8AFUZzdXezETjXWkppNfLbfyfNYG+U
         dhEw==
X-Gm-Message-State: AOAM532fcTQ69/darhMmXZ09semzAJwdwAhUwH/fEWijjXt1UInC5GeK
        hDFFoTMAEo5NVzgpZMaDg2pU5UrBuYuScoBo68w=
X-Google-Smtp-Source: ABdhPJycB+74hc70XgOW2dEACvtzzYxt/lDkIhfuvZKF+7i6EDp6dCeBfgMhDYPj/n7RvS0+kzkx+pV1EbyuufK0gDU=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2593437otc.145.1610113159552;
 Fri, 08 Jan 2021 05:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20201224170502.2254683-1-aford173@gmail.com> <20201224170502.2254683-2-aford173@gmail.com>
In-Reply-To: <20201224170502.2254683-2-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 14:39:07 +0100
Message-ID: <CAMuHMdUuuvyQ-Ck8BTW-Ym04RpO=0Fp30orUw5K+U0f+5Ne8BA@mail.gmail.com>
Subject: Re: [PATCH V2 2/9] arm64: dts: renesas: beacon kit: Fix Audio Clock sources
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 24, 2020 at 6:05 PM Adam Ford <aford173@gmail.com> wrote:
> The SoC was expecting two clock sources with different frequencies.
> One to support 44.1KHz and one to support 48KHz.  With the newly added
> ability to configure the programmably clock, configure both clocks.
>
> Assign the rcar-sound clocks to reference the versaclock instead of
> the fixed clock.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12 (with the "programmably"
typo fixed).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
