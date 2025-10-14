Return-Path: <linux-renesas-soc+bounces-22990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA72BD7DEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 09:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F8854FCD91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 07:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C6729BD81;
	Tue, 14 Oct 2025 07:22:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3141A2D8DAF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426562; cv=none; b=DAPmMEXIdkQtX6ArlYMG0qwukY7Gh6TP9msaEno1+nNPHOzmo1+q7a4ULeQeq56+uIAILDFrwL1sNUfVtXVFfmXz8D+cpyOBstNJLuHnE+C5H4dStXVHKgH/9kRzuenwAbHG2Kp1VGIslzu64uua8yzjQ2/zZ4U2+MzwYuhOuDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426562; c=relaxed/simple;
	bh=qcHTUS0wo1f43VFStYszqJZcg60j4r28QkB5kGixAXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ny9zw8Jy5mTnZ9p3WK+BL/MywPKNUcaMVrQMiNteU9/Qy79QGucQaeIDUgYBjWGz3Vx1WoKDNDGkRzt98uVxXCdG2BV7yWiuqtqmDfNjudEXYDxZJ/hPZnR5ph0Rv+EogAEZrPWB+7i3j8xzsdJfQsOCeg8hSveKzUwz3ipQ7u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-863fa984ef5so831486285a.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 00:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760426560; x=1761031360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LJPJfcpv0pJD66G650kRDT3CGUnlnJtrjGpdse2lj8=;
        b=W6Ug7o0/R//pzvT7nbBm2xelVF2jmAYwFK8JGHJTT4wSoz1+CibzYEEmMQYjzvP2rz
         ONPZZTImQWU91OJhQhxN1XMOMCx1KGTvQ2ea1DX/z7EDMPB9KMbdwx7veIaoDsqj3qyA
         xZfAJceAziMYrdVJISC2L+zuDOXwpATJNCWoOeFs1Lg7Uw64QECTmBRaQjReTkUSFM1R
         G89HTybhYRthyuYk5cLd0hmMWKYA2RdKQB8sJK85QLjwpz+r3dxk/32VpfkW25awbxLq
         fQ01Vg6l/LO2B/vfo+fsOIpeNEvOLBQ2CbbyV058bjEmSNkdnyqFD460I7JUXgTfTmRY
         bc+A==
X-Forwarded-Encrypted: i=1; AJvYcCUZ16j0fDjMZ1HKsuqqgF24QQQCG8gfywgUuqyYtjBmOXKNL9Sbn7GGBAePmjf/KMGejeLqfodIW3gEG/ZBjOFbSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJQE7v+K+OqLdWpyJhzTQC07feTkHZQO9782FRs+MqzMuBOprE
	VE4nVMFDkDfAsqzOvHjtlBLiMTlOc6NQD/6uCSmORr4RKJ5VWmLyhvViUiEvxTPT
X-Gm-Gg: ASbGncuO0hX8CMYAKZRYLShc4qFzGLtyE/iJ4Bq/0m76UGUQHeC7qwD54BFuN+YI321
	4yRVJPvofg+/dJaHRiM8BnkDZWtlqowVuF1OrPkc3l7rEqvCeU8ojCMN4hmy/kyJNKQjFrSV4Y6
	7GjAQI/+PuMRlK80/l92uEGKGROMmDS7lJAsu/jZXtsVA7Bg5Snxi0w6EQpi09hu7JktfP62u89
	Q7TJLLU2sfYHr2HsFjVuUjX1svZ7nodO5cWfzHf/DUYAZx3E4okTTFTYz3ec17Kk7E5Z/yzaYpP
	onuxrVXjD2PXRJht9bYzW5HRAhOLiLytN/2CXsmeFR8yVL3pzbsw6WtUuKvU59KSeQP2sjU6iaX
	Qvp/4sXGAzM2mgMuuI/v08T7bxC3EFqnDXm4e0qxED3A2Q1Dx1dmKJiO3iK90zN5wflkbPkBzsy
	w+dqJgbEc=
X-Google-Smtp-Source: AGHT+IFVjTIHoWhV/NSkLWVU3VVPShtcN++BCG1ul23zJHF/UKfZiXpbvv5dvvrSPCGdugt4xYfpOA==
X-Received: by 2002:a05:620a:1a13:b0:85c:bb2:ad8e with SMTP id af79cd13be357-88353b341admr3264870885a.48.1760426559834;
        Tue, 14 Oct 2025 00:22:39 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a293a9a5sm1139864285a.61.2025.10.14.00.22.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 00:22:39 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-856cbf74c4aso962902685a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 00:22:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtx95EgaAfBAcDTknIc55LQ78veseHc1ovqRmNojEWtdlBEfGleYO8QyMfzIqx5JJBcVcRqJCR92ABwo/fjuJSuw==@vger.kernel.org
X-Received: by 2002:a05:6102:3c8e:b0:4fa:25a2:5804 with SMTP id
 ada2fe7eead31-5d5e220420bmr8840762137.10.1760426229660; Tue, 14 Oct 2025
 00:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-rcar_pcie_probe-avoid-nocfi-objtool-warning-v1-1-552876b94f04@kernel.org>
In-Reply-To: <20251013-rcar_pcie_probe-avoid-nocfi-objtool-warning-v1-1-552876b94f04@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 09:16:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZvoTyWcgRp6TnkybnKY4ekfO9aB33iumPVaR7wvEXkw@mail.gmail.com>
X-Gm-Features: AS18NWBECJtooFXj8wIhcLw2_n3BPi6xXTVAMYxpuf1MNXW6QPz_d-TTeadxeIw
Message-ID: <CAMuHMdXZvoTyWcgRp6TnkybnKY4ekfO9aB33iumPVaR7wvEXkw@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-host: Avoid objtool no-cfi warning in rcar_pcie_probe()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Mon, 13 Oct 2025 at 20:26, Nathan Chancellor <nathan@kernel.org> wrote:
> After commit 894af4a1cde6 ("objtool: Validate kCFI calls"), compile
> testing pcie-rcar-host.c with CONFIG_FINEIBT=y and CONFIG_OF=n results
> in a no-cfi objtool warning in rcar_pcie_probe():
>
>   $ cat allno.config
>   CONFIG_CFI=y
>   CONFIG_COMPILE_TEST=y
>   CONFIG_CPU_MITIGATIONS=y
>   CONFIG_GENERIC_PHY=y
>   CONFIG_MITIGATION_RETPOLINE=y
>   CONFIG_MODULES=y
>   CONFIG_PCI=y
>   CONFIG_PCI_MSI=y
>   CONFIG_PCIE_RCAR_HOST=y
>   CONFIG_X86_KERNEL_IBT=y
>
>   $ make -skj"$(nproc)" ARCH=x86_64 KCONFIG_ALLCONFIG=1 LLVM=1 clean allnoconfig vmlinux
>   vmlinux.o: warning: objtool: rcar_pcie_probe+0x191: no-cfi indirect call!
>
> When CONFIG_OF is unset, of_device_get_match_data() returns NULL, so
> LLVM knows this indirect call has no valid destination and drops the
> kCFI setup before the call, triggering the objtool check that makes sure
> all indirect calls have kCFI setup.
>
> Check that host->phy_init_fn is not NULL before calling it to avoid the
> warning.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510092124.O2IX0Jek-lkp@intel.com/
> Reviewed-by: Kees Cook <kees@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for your patch!

> ---
> Another alternative is to make this driver depend on CONFIG_OF since it
> clearly requires it but that would restrict compile testing so I went
> with this first.
> ---
>  drivers/pci/controller/pcie-rcar-host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
> index 213028052aa5..15514c9c1927 100644
> --- a/drivers/pci/controller/pcie-rcar-host.c
> +++ b/drivers/pci/controller/pcie-rcar-host.c
> @@ -981,7 +981,7 @@ static int rcar_pcie_probe(struct platform_device *pdev)
>                 goto err_clk_disable;
>
>         host->phy_init_fn = of_device_get_match_data(dev);
> -       err = host->phy_init_fn(host);
> +       err = host->phy_init_fn ? host->phy_init_fn(host) : -ENODEV;
>         if (err) {
>                 dev_err(dev, "failed to init PCIe PHY\n");
>                 goto err_clk_disable;

I am afraid you're playing a big game of whack-a-mole, since we tend
to remove these checks, as they can never happen in practice (driver
is probed from DT only, and all entries in rcar_pcie_of_match[] have
a non-NULL .data member)...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

