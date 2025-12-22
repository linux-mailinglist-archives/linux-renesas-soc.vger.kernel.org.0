Return-Path: <linux-renesas-soc+bounces-26021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8219ECD6F16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 20:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B10C1301517A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 19:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B0E32ABCA;
	Mon, 22 Dec 2025 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpC070Pv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D01B33AD87
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 19:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766430764; cv=none; b=YZxUOUH+Dqtz0z/UgJicwYD3qDN8CSP7P9MO8AQZslIcYuBm7K5mrlEmaSQivTtrtx1/iiWt+huz6oyxO3C1Pr4SXT54wypAQz7crv3h4qOLsUQGssYgWQAzz3Ci8sBzP83z2VUT9TMP/asEy5m0+79f7rnLPmkpn05aCuLzJ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766430764; c=relaxed/simple;
	bh=pUXHUbgVUJKFwHKs6lPeVQzXVyXUb1crFHCCZhiv9Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7+2UHM3OzJmyWjNm9jK6O9TZhJybAjfgGRohUIs35pwbR+xTAdGARhdAVbmlN7pSDwTcJ1anH6AacLCGDSXgE+7e5oCTrNKPeW5bDiLrE+e/Bl+Q/XQ32iMVtT/5UV5AsTce/emuDwntgxi7/grcKIv1DnBtsdtKydmz+cOUqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpC070Pv; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42f9ece6387so1625679f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 11:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766430760; x=1767035560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaljzuKRJi75G8i1tLMySnubjrnaRrAVIY8kdBl5ZSA=;
        b=FpC070Pvgs1vd/V1jwPNL/vebK3vLaooBxJLf6kRzE6N06KPhRdEGoXTtKwVjctf4k
         FQkusEFmu4kjrQmGL7VSFz5GVsiJkXCiMXeD2gCx7sCpzX88htMDtFqa3ZNJQpKlg2Xw
         WPKYODwtPvgy9Y+WakRE1daidbvhC1d1zTXVi59J7Km4oin/Q1GmDCuFnTpJK82f6esy
         hz5n3mb5kaBySG14AN5D5WQ2NhgnAmZAnnD3ATK9hcR+MIjwpOupf8ez4JNQD03iLajf
         aDu8pOCSriGmqs35SNPwbu5BI5cOp744iNMMPs/seR1ksZs8k6A+BZB5F1Lxn2xS2/XJ
         1eYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766430760; x=1767035560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DaljzuKRJi75G8i1tLMySnubjrnaRrAVIY8kdBl5ZSA=;
        b=UfRw8KAjKeiJjKvjFtWDF8rdRo+D8k6wTxmAF3jVGnyZ5lMXrB+0F0Ph0XMeFnxXE9
         9U4qqWda6SOF2ZI1hlJnSnKivLCAQ3QIgbfN2AJum8escX0oYak5C8JuSjiIYbUCDlYQ
         ymxr1QJ1GVMEAel12piO3xg1zGXPzlEoPWzA4wU5GOXkpiS9P2E57wD/yOS2mE+Ju3NN
         hcGgPyD6qAclluQgWbOvWyBGIW9XNHwCyt2i20kSFsmJatAeLPr/K0fcpv2M1qD7W6h7
         lMVntU7nZ6/3mPlGN9qHdRdZM4jIBaKFVXwfOwVdsvGtJIu09V6LxGhylcYgtzvro6o8
         vQ3A==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8/t7FB0CAQM3lBWFJXM4oPZ3L42juqhg2sTBMxNLcpbaqAXqIRsh+xs8ZiODAhcuCC0DAm+zlTkd6KuUEyHBWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywENQACxLqWnTjKr7ZG16XPUpbt9OUAIuw1ivaHQgqjEJTI+gc
	KOQaYk3U9DNBPwKBVrDQreOhejmlAKLeSg0ndcbDxTLIEUtbl/l6nIzulSdZuno0464sEWnhwAW
	H27Kt5d7qj7Cfeiwgvs4+EUiBE/5Sj25lrsJ/cUIE3A==
X-Gm-Gg: AY/fxX4yDq1f8AvoeSlwCvA0dUXIW0DwzVSvPtXVmvWR1Rtvo/R86leXGKO/OZsU75w
	YC5h1QKr4AXAOCItIYQMxVdLMAH+5/S1xQQ8/WPnDygbWO+64qgroXC2BGCEfm7emu/Kge8IWfO
	/QZHaM0va0QYxs0bj5r+8/VNUYpSjN/WigdOQKVCPACNY0dA2fa50d423Tg5/dV+qLCBACquSJi
	wJb3JMDZ2Jg03f/FpheRcfp5XkTMRWlL70xaPUkwqMPmHHOEbN0prYiFGlMCyGKKQrgUvnL0S7S
	p5NN3hFQO7/CpJMvNZNN/NxLyCMW55Z0MLFV6ROFkD5lFtgOO6xrF826EovhvkMWYCnsD066VAZ
	Oqo8yBjxvGCNX
X-Google-Smtp-Source: AGHT+IFFdGPwBN1E1S5LAyC6UohBwqvpkMjczXYch4xqHGrMotjncWJIaimblw5QxQV/81wNGDi65C26P10OupkAuwo=
X-Received: by 2002:a05:6000:2089:b0:431:217:19dd with SMTP id
 ffacd0b85a97d-4324e4c93b7mr14727448f8f.14.1766430760325; Mon, 22 Dec 2025
 11:12:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7b6154130b973d85a224ee0026eef88979fbb1cf.1766394936.git.geert+renesas@glider.be>
In-Reply-To: <7b6154130b973d85a224ee0026eef88979fbb1cf.1766394936.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 22 Dec 2025 19:12:14 +0000
X-Gm-Features: AQt7F2qDaq3D17O0Dwsmam4IRlr9xYoGTBR6vH31C1O-7B3WRW2Jg8oRcpnafNs
Message-ID: <CA+V-a8u1Ge6xrM8nn-j8+pSMoW2-ORd2Ej9F0RwHc16XS2pDWQ@mail.gmail.com>
Subject: Re: [PATCH local] riscv: rzfive: defconfig: Refresh for v6.19-rc1
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 9:16=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Refresh the defconfig for Renesas RZ/Five systems:
>   - Disable support for the Svrsw60t59b ISA extension for using PTE bits
>     60 and 59, as it is not supported by RZ/Five,
>   - Drop CONFIG_SND_SUPPORT_OLD_API=3Dn (disabled by default since commit
>     74ac7558ea763011 ("ALSA: Do not build obsolete API")).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.
> To be applied to the topic/renesas-defconfig branch.
> ---
>  arch/riscv/configs/rzfive_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzf=
ive_defconfig
> index 622ee0136fc7a51c..35a672805fb0eb74 100644
> --- a/arch/riscv/configs/rzfive_defconfig
> +++ b/arch/riscv/configs/rzfive_defconfig
> @@ -41,6 +41,7 @@ CONFIG_NONPORTABLE=3Dy
>  # CONFIG_RISCV_ISA_ZICBOM is not set
>  # CONFIG_RISCV_ISA_ZICBOZ is not set
>  # CONFIG_RISCV_ISA_ZICBOP is not set
> +# CONFIG_RISCV_ISA_SVRSW60T59B is not set
>  # CONFIG_RISCV_ISA_VENDOR_EXT_MIPS is not set
>  # CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE is not set
>  # CONFIG_RISCV_ISA_VENDOR_EXT_THEAD is not set
> @@ -136,7 +137,6 @@ CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>  CONFIG_SOUND=3Dy
>  CONFIG_SND=3Dy
>  # CONFIG_SND_PCM_TIMER is not set
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_PROC_FS is not set
>  # CONFIG_SND_CTL_FAST_LOOKUP is not set
>  # CONFIG_SND_DRIVERS is not set
> --
> 2.43.0
>
>

