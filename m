Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAA3167051
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 15:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbfGLNmk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 09:42:40 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33920 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbfGLNmk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 09:42:40 -0400
Received: by mail-oi1-f193.google.com with SMTP id l12so7325569oil.1;
        Fri, 12 Jul 2019 06:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gAJx916ULrx3y0hj4qgvLoWj0HbujQzosb3yUI4ix3c=;
        b=eV7AigXXHzwKtNS5siQboadm0o3YtOJMm/fGEmfoik8ZmyCdGVaXdwlFshdircpbFL
         jqIVm8Gney2msdK2ptWbz31Pkojdr3TSPZL0ns/fa2Tua+OKFqZqQOBvFM5RRoyE2xV0
         uR0XLhvIAW1t+B6rmNlFjOZQHo058Hp68bPSCG2P8aXRraV2m7h87SDMezk2NpYc7mTF
         TQKqSfryu56d/GA7Zm+nvRrKeAheXznALhbE7xkcb4zFyHc4YA7AxgrWKjG92/j6t5hO
         0erfierhvs4hm/T/eO9nd/OYeggtRmm5iX/bAkKBsAkYAdo3zzHegHVc7gxdMz9EaRk4
         d+MQ==
X-Gm-Message-State: APjAAAVAqyQD4YpbhzRAPMe3TqPS+Z7s/QidDtA8pzZn8bJZRtuLWxFo
        1IAySqM50shNUEfa2X6RvLby6bPw5cYEh84nMes=
X-Google-Smtp-Source: APXvYqxt6VEx1jyAD9E/sh9p0P0kNu1mNrqxaD9dyvtJxyF1jGGu5/gi68cFaSTomi7WDMsdPb5xdDhgt07PDFVr+kc=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr5533734oif.148.1562938958869;
 Fri, 12 Jul 2019 06:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com> <1562333979-28516-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1562333979-28516-4-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Jul 2019 15:42:27 +0200
Message-ID: <CAMuHMdUGfHyPp=5aBig4_Sh91hUku4Xx_Ho54X=EDcqrj_zXqA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI audio support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Fri, Jul 5, 2019 at 3:40 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds support for HDMI audio to the device tree
> common to the HiHope RZ/G2M and the HiHope RZ/G2N.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi

> @@ -168,6 +180,7 @@
>
>  &hdmi0 {
>         status = "okay";
> +       #sound-dai-cells = <0>;

Why the above line?

With the above question answered:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
