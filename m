Return-Path: <linux-renesas-soc+bounces-22032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC10B844D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 13:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9038D2A685A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 11:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE1C30217D;
	Thu, 18 Sep 2025 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpCECnOC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDE6A55
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758193921; cv=none; b=RAXouQBQj3qbCYju7XgxghXs/A7G087hwwp/jehtC3JNKFnk/5fqOZHIw+86HSrSdu9XNAliTftsm5qPQX0pB8ygCA83n54cA4LX9ihI93aEI3vE95Oin2G8mz8gl0tHUvH82MgTyFMLMukTRup2mWthjaPEpN5074/LeIxk9SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758193921; c=relaxed/simple;
	bh=hh9aJMUS07iQ+JFOom0lu0TZ4+z/q5RWhduVOfEcJqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8IDB5Yy6Erqg3AoTmOIJsmfiwL2xcG1jkgP5VVjgeayK4DXnjG49pBtFyR/qB6B8aCPGBjMb5IeE3CpU1myGbOHunXoq/CYs389UNZIvXDQN0A06M2r0sED6URZxywIe/xMa3LZHyf1fMhEtSqfSmv/BGaWtTk+5FWVK/Qehqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpCECnOC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so395562f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 04:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758193918; x=1758798718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgH82lUCOsP+VrtHsBb90fe5+wv2J6tQFhMpK3dJL7w=;
        b=dpCECnOCrgA1mxzqPTKyDIj1swhbBlQ5b5LTRj+j2xRdvTIQEMKrI1ymAz8wTP7Xv8
         h4+nvc2STIYQTUrdpAjc/II2zK0HfztmmR4Uwc+sXL6+HQTz8tJ85x1kWLJirour5Hjo
         c7Qet4m2UyRhkDa6U2RxZR02qr6L22osn+bngCXsZWwoologyiWnqXzjneUld5RvY9np
         uYbqU8yKTEtDs/CtOWWCBQCGArPTJNu3DP/QWW/C2Nw7hkUaEGVZSWNUBpYmmF2H2Ycf
         oVw8e9UY4QwddTvVLx+WdZMoKqAaIHsUOHwQwnBq17yCRfUwu5mFzftWApdoPIfy3wtv
         a+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758193918; x=1758798718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgH82lUCOsP+VrtHsBb90fe5+wv2J6tQFhMpK3dJL7w=;
        b=TSMdpNua2GCdbji0XNwPipugXZ7pEoqHyU0niCgazj0JttyKwSyjVM32ce5llrnqG8
         GDe4s7PacAf9q89VsJohwD7H3NkXrhNe/WJP0KeAdI6T3H7HXDyAnKwvC+ShwxQXTJ9m
         1UPDxpXNEJXFyq6h0hV8cse5rexLsp4OM0uODddHf1pEj0D2eBhcoq4wFNUd7PXDfqWg
         M/psgvfTMS3VtRzJk57RBSHEl0ivj8iPDRx++4Ccrs6diR7/jbz5q3vqYaJID/geTRZB
         FhAx5iIXtwXuCS25nupgdrQJoF46fe7f+B4c3ESxGMCRtwjjJruSx2fvClD6Yj4KI6f8
         0/kA==
X-Forwarded-Encrypted: i=1; AJvYcCUkymNahM3non/FpQKZGzeCKTnCrGt9/4wCqk4lD9s/9tjwijHI3+t5sW4AwJ2N7KEO92QO+meYuB+ACgpka/jf1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEjOjAlVpMahZRsCxE0wpxo11ikMezA5uUGlZMybWBNGeBLL8X
	3PieIYmOpRsckvwObpdj4GllBskFseBJnjI13xDma+OuRPBSKYZAJ8D8VLfMMe5AkzR9t4UArgT
	VH4Yl8DTTLehNotltXOg1sg2TsSGE6p4=
X-Gm-Gg: ASbGncutoKgKYsgzrtqSAorJj6tiIwK5J+NiBEcgg+Bxl2i7BWVYpuxeNv4B/BP+tlj
	I6puEsVkBEu6RPSVfsQ2tKS1BDnTH69gK9wC/6lR/1dDkRik1wlYIlfkHCf17riJPba3GWUGmZG
	K+Ci2sGzgiIirHJZkdVkH0pjZfg4CmQvESB9F0WUyd1Nehskjbs30eXztm2in0y5bMLx675wLZR
	XWF1QFXz39ZIr8fM8fq6DXVzrY=
X-Google-Smtp-Source: AGHT+IG0GMui68drR1bqxkF8T9cRxS3juUoMGcMHWjH/OXmaJxEWr9FQxLagF0QgDoGdQk4pJSLUDY67LP3Vklsr4dA=
X-Received: by 2002:a5d:5d10:0:b0:3dd:981d:43a5 with SMTP id
 ffacd0b85a97d-3ecdfa4e575mr3860337f8f.47.1758193917668; Thu, 18 Sep 2025
 04:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Sep 2025 12:11:30 +0100
X-Gm-Features: AS18NWD77y8PPkGANcR7F8lkci9tGtrtCWwH2x7D42Lju8LFSoC6mJti4exnjPU
Message-ID: <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Thu, Sep 18, 2025 at 4:07=E2=80=AFAM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> On R-Car V4H, the PCIEC controller DBI read would generate an SError
> in case the controller reset is released by writing SRSTCLR register
> first, and immediately afterward reading some PCIEC controller DBI
> register. The issue triggers in rcar_gen4_pcie_additional_common_init()
> on dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW), which on V4H is the first
> read after reset_control_deassert(dw->core_rsts[DW_PCIE_PWR_RST].rstc).
>
> The reset controller which contains the SRSTCLR register and the PCIEC
> controller which contains the DBI register share the same root access
> bus, but the bus then splits into separate segments before reaching
> each IP. Even if the SRSTCLR write access was posted on the bus before
> the DBI read access, it seems the DBI read access may reach the PCIEC
> controller before the SRSTCLR write completed, and trigger the SError.
>
> Mitigate the issue by adding a dummy SRSTCLR read, which assures the
> SRSTCLR write completes fully and is latched into the reset controller,
> before the PCIEC DBI read access can occur.
>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas=
/renesas-cpg-mssr.c
> index 65dfaceea71f..7b52e8235984 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controller_dev=
 *rcdev,
>
>         /* Reset module */
>         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
to read the reset register `7` times and confirm [0] (as mentioned in
the HW manual). So after reading do we want to confirm the bit is
set/clear?

[0] https://lore.kernel.org/all/20250905114558.1602756-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/

Cheers,
Prabhakar

>
>         /*
>          * On R-Car Gen4, delay after SRCR has been written is 1ms.
> @@ -701,6 +702,7 @@ static int cpg_mssr_reset(struct reset_controller_dev=
 *rcdev,
>
>         /* Release module from reset state */
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_clear_regs[reg]);
>
>         return 0;
>  }
> @@ -715,6 +717,7 @@ static int cpg_mssr_assert(struct reset_controller_de=
v *rcdev, unsigned long id)
>         dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
>
>         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
>         return 0;
>  }
>
> @@ -729,6 +732,7 @@ static int cpg_mssr_deassert(struct reset_controller_=
dev *rcdev,
>         dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
>
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_clear_regs[reg]);
>         return 0;
>  }
>
> --
> 2.51.0
>
>

