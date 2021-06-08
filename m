Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C468E39F4CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 13:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhFHLVA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 07:21:00 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:34646 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbhFHLU7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 07:20:59 -0400
Received: by mail-lj1-f178.google.com with SMTP id bn21so26510014ljb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Jun 2021 04:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CqWp9m/g1GxCZk/aIRL+aDRtEt1RKhMuS6t58RhnXHs=;
        b=PBRNTH8Gy7WP+Z5rxgsi9lhz2jaNM0VQnb+zVNhaJFEonxG/fjCjq1PtXWDGXHmZsr
         f9ld/ZXcP4enHqA2PsaXFQripxkCokpH3RksBBNnxJOntIXsnEtDtA8Ja+66nVySOsi/
         xD81MXKoz6K7PCVr0cC2fbGlgTPCw73VIdYyeX1GxaQTDhi/oLsm2fhk/jBKKl64M2SP
         frOB6ifEj8WmCfnrvWmAcqlQMsQjOa+wMFmZxzd3YZ/Nrh07D63xjfOADFtmyCcaYLPb
         A5Mnj3OonrbqrsLR9mTQBlu5Ee0N4VWiY5gsx3m3MLKE4eA5MtaF9Gpi3qBQUkCp4UWo
         9y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CqWp9m/g1GxCZk/aIRL+aDRtEt1RKhMuS6t58RhnXHs=;
        b=JFa5mwvbwtvyRNTYYXnU+JEusjQ/SV7lZm3C1bcTKT38Dci57vUSXVHj0dXalh7PNN
         QrjQbB+iU16TeqkF5smGeckmLW5jrdvs/rCxteFWSmerV+5eejJsQfS3uh0upmjDuSBL
         0LhwHvzUxVLyBCSbMiVpVwACHa3Z3ORcnMEqtD+uFLFZePgdc1JLALUw2QRClQSI+ybY
         p5msfMoSTeNvIZ55/Ym6QM0wY9V0S+8uEgpqD16KvwxCSJNWKUGKZHic2KMyPakOl2Vs
         jki/K3t1h9tiLPaI8tSnymTNTYySjqxU26vEMNUQ+t7KVIafpA+JcFfzsEga/D8RcNhb
         QRsw==
X-Gm-Message-State: AOAM532jfG7VOyyzsnlWRiIDmXs8oy7TRV66DNG1iSpomsOeybFDxkYV
        I9EhW7E0lgDXwuqUTcS5kqkZhw==
X-Google-Smtp-Source: ABdhPJxKC6WpuEiTGagGnq2Ve6xS8VrT0TXC0ZC5lims8C6jBjzv0w6w/RczkqNLBFveXcJYto7vog==
X-Received: by 2002:a05:651c:1057:: with SMTP id x23mr17624521ljm.467.1623151069700;
        Tue, 08 Jun 2021 04:17:49 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id q15sm1576172lfk.217.2021.06.08.04.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:17:49 -0700 (PDT)
Date:   Tue, 8 Jun 2021 13:17:48 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] arm64: dts: renesas: salvator-x(s): Factor out
 common optional parts
Message-ID: <YL9R3DUV+iZocvn+@oden.dyn.berto.se>
References: <cover.1623087028.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1623087028.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-06-07 19:39:01 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The Renesas Salvator-X(S) family of boards are available with different
> SiP options (R-Car H3 ES1.x, H3 ES2.0+, M3-W, M3-W+, M3-N).  To reduce
> duplication of board descriptions, the parts common to all SoC and board
> combinations are already factored out into salvator-common.dtsi,
> salvator-x.dtsi, and salvator-xs.dtsi.  Still, there are a few board
> features that are not common to all combos, as the corresponding support
> is not present on all SoCs.
> 
> Hence this patch series moves out support for the second HDMI channel,
> the SATA interface, and the third and fourth USB channels to
> salvator-common.dtsi and/or salvator-xs.dtsi.  As these are not present
> on all SoCs, its descriptions are protected by SOC_HAS_* preprocessor
> symbols, defined in SoC-specific .dtsi files.
> 
> This series causes no changes in the generated DTB, except for the
> enablement of the SATA device node on Salvator-X board with an R-Car
> M3-N SiP, cfr. the comments in [PATCH 2/4].
> 
> Thanks for your comments!

With a bit more of logic in dts files we might get back to board files 
;-) For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Geert Uytterhoeven (4):
>   arm64: dts: renesas: salvator-x(s): Factor out HDMI1 parts
>   arm64: dts: renesas: salvator-x(s): Factor out SATA parts
>   arm64: dts: renesas: salvator-x(s): Factor out USB ch2 parts
>   arm64: dts: renesas: salvator-xs: Factor out USB ch3 parts
> 
>  .../boot/dts/renesas/r8a77950-salvator-x.dts  |  73 -----------
>  arch/arm64/boot/dts/renesas/r8a77950.dtsi     |   2 +
>  .../boot/dts/renesas/r8a77951-salvator-x.dts  |  73 -----------
>  .../boot/dts/renesas/r8a77951-salvator-xs.dts | 122 ------------------
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi     |   5 +
>  .../boot/dts/renesas/r8a77965-salvator-xs.dts |  14 --
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     |   2 +
>  .../boot/dts/renesas/salvator-common.dtsi     |  76 ++++++++++-
>  arch/arm64/boot/dts/renesas/salvator-xs.dtsi  |  56 ++++++++
>  9 files changed, 140 insertions(+), 283 deletions(-)
> 
> -- 
> 2.25.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
