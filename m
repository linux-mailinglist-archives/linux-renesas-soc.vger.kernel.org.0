Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6384213375F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2020 00:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgAGX1A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jan 2020 18:27:00 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46662 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbgAGX07 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jan 2020 18:26:59 -0500
Received: by mail-lj1-f195.google.com with SMTP id m26so1321652ljc.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jan 2020 15:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IjTxC1FiNozeI8fwV+AfSJ/Kn6P8fUH4jlMJdxPN5HU=;
        b=XCG5rrqAtzsyhbl2V9392ti0zcF3zJgOsQVo/QmWRKwygcFbkmffauQmt57TH0cXiq
         PSOS1Br9CeQhTaqPREAHxsu33GK93w/7lSmJgntSQFgIFkTgQFpEjxs6yYRtT6d0EhCg
         a46GhaQseqsHlQ5oSRPv+NsvLJnjHEx7oYQH0DdFbjb+Iv7TGQMGK5qLnKIMcGVRfpyt
         +KohQi2L/FG5NdfirdOcggSHMAf7cU3Tx8ZOHjJBExYv4nPSjD0535QC8IhIOFb06xSx
         fZCb3fMIXUsV0tn6z/1lBZGc0wH+WERZcQDvQeSCazoojs5NvzHo6raP2JJz+9NUWKYZ
         LKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IjTxC1FiNozeI8fwV+AfSJ/Kn6P8fUH4jlMJdxPN5HU=;
        b=SQ05Vf9cezCqwzeTm5C0JW8ukOpj8g6v9pVDHSyUmmL38/6me2bs7gP4WchARe3+/c
         pAWOpuaN4LRxS/5zr27y38Bo+8+HSltXI1f3aH1GXrMtMcwdk7v8anTo+5rZv/Wg56Xd
         6hIpfkR7QimQdo5gszcuk4gKoSIH+wM4A5i669ZMayjB2smvfgTHaX++sr82LQZnVgUK
         fhIGhpuDV1nzwzVDoa43TEhGMOJGShQM6494aTHsRKS5i7AbHdeFtlmImppiI8dx0jtL
         orf05edYMhIZdQoZ3TiYVItgGv9F2YWA5XitW1R5fVYzepDzD8pfK07ClYqQWZuPrZat
         g5Dg==
X-Gm-Message-State: APjAAAU0O6j1a8YQygpLLqTuAK3kntSFKuKf3CIIHx2fncxp3Sz4oddh
        sxWGMA3dLUQIlRYerNCU3jkgjL1XdWt/qw==
X-Google-Smtp-Source: APXvYqzI+Sfb+B5FpEUaIicFBEm/VR5Uqn3EtTC/EH9bjza4YElEGw8QUnFBkginCFXQRjQnntKpYg==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr1105809lja.152.1578439617424;
        Tue, 07 Jan 2020 15:26:57 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id 2sm408365ljq.38.2020.01.07.15.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 15:26:56 -0800 (PST)
Date:   Wed, 8 Jan 2020 00:26:55 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: renesas: Split/rename R-Car H3 support
Message-ID: <20200107232655.GR533370@oden.dyn.berto.se>
References: <20191217183841.432-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217183841.432-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Nice cleanup of the otherwise sometimes confusing names :-)

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

On 2019-12-17 19:38:36 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Despite using the same compatible values ("r8a7795"-based) because of
> historical reasons, R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+
> (R8A77951) are really different SoCs, with different part numbers.
> 
> Hence this patch series splits the config symbols for R-Car H3, and
> renames the related DTS files, to maintain a clear separation between
> early (ES1.x) and later (ES2.0+) SoC revisions.  This will pave the way
> for configuring out support for early SoC revisions, which can reduce
> kernel size, especially in the pin control subsystem.
> This is similar to the recent split of R8A7796 symbols for R-Car M3-W
> (R8A77960) and M3-W+ (R8A77961)[1], and the related DTS file renames[2],
> but different due to the sharing of compatible values between R-Car H3
> ES1.x and H3 ES2.0+.
> 
> This series also includes the rename/cleanup of the ULCB DTS file names,
> as suggested by Eugeniu Rosca.  As DTS files are already being renamed
> for v5.6[2], it makes sense to combine them with other renames, to avoid
> inconveniencing the user with multiple renames in multiple kernel
> versions.
> 
> The pin control part will be handled in a separate patch.
> 
> For your convenience, all of this is available in the
> topic/r8a7795-rename-v1 branch of my renesas-drivers git repository at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
> 
> Thanks for your comments!
> 
> References:
>   [1] "[PATCH v2 00/11] arm64: renesas: Add r8a77961 support"
>       https://lore.kernel.org/linux-renesas-soc/20191023123342.13100-1-geert+renesas@glider.be/
>   [2] "[PATCH/RFC] arm64: dts: renesas: Rename r8a7796* to r8a77960*"
>       https://lore.kernel.org/linux-renesas-soc/20191211131311.23661-1-geert+renesas@glider.be/
> 
> Geert Uytterhoeven (5):
>   arm64: dts: renesas: Rename r8a7795{-es1,}* to r8a7795[01]*
>   arm64: dts: renesas: Drop redudant SoC prefixes from ULCB DTS file
>     names
>   arm64: dts: renesas: Sort DTBs in Makefile
>   arm64: dts: renesas: Prepare for split of ARCH_R8A7795 into
>     ARCH_R8A7795[01]
>   soc: renesas: Add ARCH_R8A7795[01] for existing R-Car H3
> 
>  arch/arm64/boot/dts/renesas/Makefile          | 21 ++++++++++---------
>  ...salvator-x.dts => r8a77950-salvator-x.dts} |  4 ++--
>  ...795-h3ulcb-kf.dts => r8a77950-ulcb-kf.dts} |  4 ++--
>  ...a7795-es1-h3ulcb.dts => r8a77950-ulcb.dts} |  4 ++--
>  .../{r8a7795-es1.dtsi => r8a77950.dtsi}       |  4 ++--
>  ...salvator-x.dts => r8a77951-salvator-x.dts} |  4 ++--
>  ...lvator-xs.dts => r8a77951-salvator-xs.dts} |  8 +++----
>  ...es1-h3ulcb-kf.dts => r8a77951-ulcb-kf.dts} |  4 ++--
>  .../{r8a7795-h3ulcb.dts => r8a77951-ulcb.dts} |  4 ++--
>  .../renesas/{r8a7795.dtsi => r8a77951.dtsi}   |  2 +-
>  ...960-m3ulcb-kf.dts => r8a77960-ulcb-kf.dts} |  2 +-
>  ...{r8a77960-m3ulcb.dts => r8a77960-ulcb.dts} |  0
>  ...65-m3nulcb-kf.dts => r8a77965-ulcb-kf.dts} |  2 +-
>  ...r8a77965-m3nulcb.dts => r8a77965-ulcb.dts} |  0
>  drivers/soc/renesas/Kconfig                   |  8 +++++++
>  15 files changed, 40 insertions(+), 31 deletions(-)
>  rename arch/arm64/boot/dts/renesas/{r8a7795-es1-salvator-x.dts => r8a77950-salvator-x.dts} (96%)
>  rename arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb-kf.dts => r8a77950-ulcb-kf.dts} (75%)
>  rename arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb.dts => r8a77950-ulcb.dts} (89%)
>  rename arch/arm64/boot/dts/renesas/{r8a7795-es1.dtsi => r8a77950.dtsi} (98%)
>  rename arch/arm64/boot/dts/renesas/{r8a7795-salvator-x.dts => r8a77951-salvator-x.dts} (96%)
>  rename arch/arm64/boot/dts/renesas/{r8a7795-salvator-xs.dts => r8a77951-salvator-xs.dts} (96%)
>  rename arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb-kf.dts => r8a77951-ulcb-kf.dts} (75%)
>  rename arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb.dts => r8a77951-ulcb.dts} (92%)
>  rename arch/arm64/boot/dts/renesas/{r8a7795.dtsi => r8a77951.dtsi} (99%)
>  rename arch/arm64/boot/dts/renesas/{r8a77960-m3ulcb-kf.dts => r8a77960-ulcb-kf.dts} (92%)
>  rename arch/arm64/boot/dts/renesas/{r8a77960-m3ulcb.dts => r8a77960-ulcb.dts} (100%)
>  rename arch/arm64/boot/dts/renesas/{r8a77965-m3nulcb-kf.dts => r8a77965-ulcb-kf.dts} (92%)
>  rename arch/arm64/boot/dts/renesas/{r8a77965-m3nulcb.dts => r8a77965-ulcb.dts} (100%)
> 
> -- 
> 2.17.1
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
