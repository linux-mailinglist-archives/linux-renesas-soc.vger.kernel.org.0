Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB72C392AB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 11:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235754AbhE0J2n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 05:28:43 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:40633 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235608AbhE0J2m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 05:28:42 -0400
Received: by mail-ua1-f41.google.com with SMTP id j2so1374232uak.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 02:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u41zP/oGirF15EDJGtpaAwNQf8udDYmD+vxX25vdV+E=;
        b=oyOI/RPCTCCQuOkXu+qoGQ+1vaC17ts84CZ8hVRJEiGjkRlHTZKF/g/U0O2osTPhA/
         FsFoTS1Hi7B0ckkz+3iVFPMCVqXE0cVwOD/6UmwApMsgzVH5A4XUFPC+1mraqbGbGEHp
         ZVhjC4ng1j3XhPEk2NDc800d43hegc1aegtl1iphmjhsivwejDxZI0Ji6nox2trRmiEi
         s941DEWDnAVanV//V0eOeGqi24gDx0B+J6FPJlW4BgNsbh4GhUScw/DdbnC3fOLcHwzf
         9xF+pTDNiohnbOsiO5YGdg8MrnEqqhaTId8KimHvovNXb13GcoRw58i7uJip+HyuaBj2
         Of8A==
X-Gm-Message-State: AOAM531nKclXFjFjwzK2YL/QJcKNS5JyFmdBIaoRQ8Oenp0ZBhzoFt46
        miw8o+w2D1W7dBKBvu+Qg8++KcGU31E3KLVX1/HJvbSH
X-Google-Smtp-Source: ABdhPJw+fhpW/rYBFhFfzvLzMHRJC43bX/7Q7lwQPNSE9kx59/hpf6vbU4vDclHIW46KWGIu936bna3hd2S01zMg5b0=
X-Received: by 2002:a1f:d8c3:: with SMTP id p186mr1268960vkg.1.1622107629038;
 Thu, 27 May 2021 02:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <87r1hslrno.wl-kuninori.morimoto.gx@renesas.com> <87mtsglrmi.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mtsglrmi.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 11:26:57 +0200
Message-ID: <CAMuHMdXx2Ma+Fj9guJa5q+HMeCL+sngHckL2NRcGrcDXTFL=Lw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: r8a77995: draak: Add R-Car
 Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 27, 2021 at 6:36 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds R-Car Sound support for D3 draak.
>
> One note is that it is using different clock definition style
> from ulcb/salvator boards to avoid verbose clocks settings
> on rcar_sound node (see ulcb.dtsi  rcar_sound::clocks).
>
> cs2000 and ADG are cross connected, and need each other.
> ulcb/salvator boards assume drivers are probed cs2000 -> rcar_sound.
> This draak board assumes drivers are probed rcar_sound -> cs2000.
>
> Link: https://lore.kernel.org/r/87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87sg2boi3h.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
