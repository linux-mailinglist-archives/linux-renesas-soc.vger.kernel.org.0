Return-Path: <linux-renesas-soc+bounces-26430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EB9D04330
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A399311D510
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AD14F108D;
	Thu,  8 Jan 2026 14:05:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08A94F1071
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881112; cv=none; b=s/PSFg4NgiK80P6+agQNyxXFw7HAx8xETLNPeHu63TRTKV81cZ+robbX3N5PauTN+l6ufDbwbmtVhYj5AHRwJauEc4110MHEZBoLAvKR+EZ0laW6bOGrpDxUPkAHTL0UnnOZiple/XZ2O+VDEKMmWCH33UmrZbrJVKrX3ZLDOFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881112; c=relaxed/simple;
	bh=HlrnZ8e7cEsDtIu1iGGmzbLViXvTPSBzBPsUVB4+7EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItrSOS5jzJg9wwkvzS5/uMhdvuvMgRapIsvN1vhuTNH/ryt30w6C8lq778JbMctuWZnRKNTtejlVsvD9WnMFtel9WtuXpZ9Abiqi7EeJa1B5S2hb8a0gOCI47tjXEr7atEBl6ua6J/9iGF/GOVoGUck1VqQ48DGVmHfjFFtiN/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56021b53e9eso948661e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 06:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881108; x=1768485908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjOIXZ6fEDhVPcVriijkgDsDTtSfEVFEHTyea+pXJEc=;
        b=nn/OWiI4w9hj7UIuq3Z8UPX47LwjUSxP2Mj+Kb6r4QAXcPg8hULEgy9IsKTEGvqSw8
         bMeYTmGwMZK5QoIw5pNcSTfKVEZmV5iWBeTq1bDfZdUA0BtOtmgWZy93AGchGTviHBR6
         YkLdRYtU3vBeCGYOxR5MviOIk5G5VGMxK/mOpKltkqhmHiVU3iGXGYtXO6W/0gCGUsOZ
         aSI+VkpyBvDrEAMG+XLOdstJf65Y2r/xsLBMZGB0h5qbWBa4BeHdSEnk9SPTQIYMgY7a
         n5E7/pe+wFuJ867BjtW3LyFJca/iDK8Tj0/RLyiqqriWRDZ0UmOqm86RdTgvtHqmLRte
         oNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVyLEOo8ESfhu29EvN1PAL6HdnCDR41jOEwdKmph/aDkOIRuOVBh6HstztqcAOIJyBW/O3IJpHFzSBzFN9A0TNHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfc6fDpIUZFvLD5s59eXyTZWVVs3jQPX0TklFQ5ZQQP+haX5Cf
	g8YeOlA1dfUhj9U5HDCfYg6ilQp7Wm2PmssWKmzup1PFWctaGMe59YLutmaP65gi
X-Gm-Gg: AY/fxX6BI9Bxv+j75c/7Im9hRcYGEWD+Lfoi9t3XAnZoAajKSJxSSaOg37CgZ4Y7uNG
	kCC3rvG45vzd4udtL964IbRzgBzWKolIFlLCx4c4CU0tAh57vRLcJYh8tQUQTKvAc890lBLucER
	OLC0ydyWelByB130iNwdFPJ3NlCR7oV4BG9aVw9D86xT+u26JS3teIZ3iwzhwwpnCsMiTJNvvHd
	u6Pxzy550Wk9qOzqzIevJE41/ENKEB74CnB2kKvmr9+KiXE5KAyFxFrSHuaWHNnBrV56rGRWAYp
	GcVstOjSGK9mJ56m6KcmQNixSUOVaEAU81OsAuUpHj5DVQ8j9RErlGnPGKKepOmMBdamBMPIV3a
	8dZm07bDQ1cjRKR7Zg66lPbvBKp2R9qzmUoowxBdf624YOpSYa77S2XsEJRfxP4A88ljaH3x1iD
	Sj/pYyrNOUYY2H+DjXtEVCropIMdRbDWApEjObe5AUt1+XFwBjptujIUhuuXl9cUo=
X-Google-Smtp-Source: AGHT+IG0V/7bEBdbcHjXntHol0WYmz2FiHRbweBGo7Fz4KLkMtVCUWEnZRwsWnlC+2HbDyx7oPTo+Q==
X-Received: by 2002:a05:6122:32d1:b0:55e:4bcb:6baf with SMTP id 71dfb90a1353d-56347faf5e7mr1941532e0c.11.1767881106764;
        Thu, 08 Jan 2026 06:05:06 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a41f813sm6101055e0c.18.2026.01.08.06.05.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:05:06 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56021b53e9eso948629e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 06:05:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYCnE+evPLRFwdXYCVI1J4EmkkaXoUwZ6C9VsvWLCq++VjSplPly+z9jCfjQ8kQwLfiUd4fXnD5SE4sxuM339gfw==@vger.kernel.org
X-Received: by 2002:a05:6122:d15:b0:544:75d1:15ba with SMTP id
 71dfb90a1353d-56347d61e20mr1818171e0c.8.1767881105589; Thu, 08 Jan 2026
 06:05:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106131319.643084-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260106131319.643084-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 15:04:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrQR2rSHw-n2_CYCtRqF6JtHoguWWpxxVb=Sc6VoujBQ@mail.gmail.com>
X-Gm-Features: AQt7F2rafNUyBmgIwD2Yf6vBHnotvexE9agKVZAsYDW5ipRGhdmreE715xYNYLo
Message-ID: <CAMuHMdUrQR2rSHw-n2_CYCtRqF6JtHoguWWpxxVb=Sc6VoujBQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk-common: Use GPIO for
 SD0 write protect
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

CC wsa

On Tue, 6 Jan 2026 at 14:13, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Switch SD0 write-protect detection to a GPIO on the RZ/T2H and RZ/N2H
> EVKs. Both boards use a full-size SD card slot on the SD0 channel with
> a dedicated WP pin.
>
> The RZ/T2H and RZ/N2H SoCs use of_data_rcar_gen3, which sets
> MMC_CAP2_NO_WRITE_PROTECT and causes the core to ignore the WP signal
> unless a wp-gpios property is provided. Describe the WP pin as a GPIO
> to allow the MMC core to evaluate the write-protect status correctly.
>
> Fixes: d065453e5ee0 ("arm64: dts: renesas: rzt2h-rzn2h-evk: Enable SD card slot")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In light of commit ef5332c10d4f332a ("mmc: renesas_sdhi: really fix
WP logic regressions"), this LGTM so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -380,8 +380,7 @@ data-pins {
>                 ctrl-pins {
>                         pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
>                                  <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
> -                                <RZT2H_PORT_PINMUX(22, 5, 0x29)>, /* SD0_CD */
> -                                <RZT2H_PORT_PINMUX(22, 6, 0x29)>; /* SD0_WP */
> +                                <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0_CD */
>                 };
>         };
>
> @@ -491,6 +490,7 @@ &sdhi0 {
>         pinctrl-names = "default", "state_uhs";
>         vmmc-supply = <&reg_3p3v>;
>         vqmmc-supply = <&vqmmc_sdhi0>;
> +       wp-gpios = <&pinctrl RZT2H_GPIO(22, 6) GPIO_ACTIVE_HIGH>;
>         bus-width = <4>;
>         sd-uhs-sdr50;
>         sd-uhs-sdr104;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

