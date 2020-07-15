Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D131220829
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 11:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbgGOJFD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 05:05:03 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37230 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730370AbgGOJEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 05:04:54 -0400
Received: by mail-ot1-f68.google.com with SMTP id w17so908204otl.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2020 02:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MAKCnn9l0PzOfUntKz317hOMjIY5m5I3mE2SaEZSVs4=;
        b=sSaO+0dHnNZo2j0BTacenBzOnqNG7I7qHGaAFc8lWjEaMfaagwCCO0c3o29lg2MngH
         DOrp6VXZczsNCBBv+ORWlJVTSPL8XLDrXpzw+/pW6lAf8dMpz8r6I7iuFH/l8s6z2fLH
         FSXYr2Fyjgx9sYcrSzC4+nbgY/fltWO6eXTVnhvMb95P2UccyLquVaq0aM+SdBXpSXLO
         puEg8RGK/rqWC6HhW1vcsYMcP2voJyF8k1YEb/vDrux3rgFRRCJi341ig4uWFpi1Piuq
         V5sPDdC2kO848GOTAviWuin6gNjqCanCfidPILZOboJCe8+COPR4ezQJ0GoHoogXf6Qg
         u3Zw==
X-Gm-Message-State: AOAM533lX2NA8S/rEA4IePeg1M/F57WMXSfc0EL8kYCzPOpP3ZhStYZw
        ESC2zzV0UXvx+vH9oEzzKFq88Vt9KEOCKsWvLgKTVG00MjQ=
X-Google-Smtp-Source: ABdhPJwExIQeczi+GnoWsQ302Cw+44x+nCn7TWOHWXGli+ok3fkqTmX4A4ZGYYDLYY6lRFdIUPfB0qtGDIYSOLsWbSk=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr7864297otp.250.1594803893466;
 Wed, 15 Jul 2020 02:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 11:04:42 +0200
Message-ID: <CAMuHMdVqFU538syZq2B=An-MA3zo3RT115JmvaVxyt5mb-Wvsg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into
 eMMC nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Jul 10, 2020 at 2:03 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add full-pwr-cycle-in-suspend property to do a graceful shutdown of
> the eMMC device in system suspend.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   | 1 +
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +

I assume we need this on other boards, too?
At least ULCB uses the BD9571 PMIC, and has a similar PSCI s2ram
implementation as Salvator-X(S) and Ebisu.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
