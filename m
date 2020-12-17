Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133062DD085
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgLQLj3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:39:29 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:36760 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgLQLj2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:39:28 -0500
Received: by mail-ot1-f50.google.com with SMTP id d20so8961090otl.3;
        Thu, 17 Dec 2020 03:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4rzjlxV9vhJAasfHC4LoFtj8pos6DRPYtY+eyV1dre0=;
        b=CIMTdcU6XoV1KQXq22lo4SVNDtBlGWm5i6jxzHSEe5VklP9iLYcEemATFgqhHQ23v9
         ouNyRZssQUrit4bwDFhN+PuSNNPBNf7Ge0iSfWDrTMZs2IYCd5VpOqmVaefY1y1Xv5hb
         rxXgiUZMbnS1TsK5JQKUL0u46UAxOLo3BeYCf2yGnq9UWgP9uIls2UdeSw8qU18WGGyS
         tmm95HnD3LXUx36VHFXBV5DDvhYa7i+5OlNI4+MFiO2Hoa9oQ+8HfaGqVpmkZDApOtAS
         CDcMiCRW8+p+dYo3F6suHs7D5fdRgQD/ydN1Nv3UDEae42QCwfd7HE5JsRm5HDO6knd7
         iECg==
X-Gm-Message-State: AOAM533D79265SAL0azNp+SHsBe0tMH+wfky00PSse5RX8AdgTbiG8jg
        SVu0IqTpQT+/rVccH+ugWqgqCbSpfVQzKCx10pg=
X-Google-Smtp-Source: ABdhPJzINpx1LO+l730+jdwp721xmGrVtfezvHfs0k0ylTYKUYzbIvs1LNcYm6WhcKMBYKWvcxN/bbDMBRNcPUNgDMc=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr29040751ota.107.1608205127895;
 Thu, 17 Dec 2020 03:38:47 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-15-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-15-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:38:36 +0100
Message-ID: <CAMuHMdWyZTDzm2_yZEbgkZo=5fW1Py9EnS04KkgwBX+Rng_s0g@mail.gmail.com>
Subject: Re: [PATCH 14/18] arm64: dts: renesas: beacon: Correct I2C bus speeds
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

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> For greater compatibility with upcoming kits that will reuse the baseboard
> and SOM-level files, adjust the I2C speeds to make it the most compatible
> with all devices.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks, all i2c devices on the bus support 400 kHz.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
