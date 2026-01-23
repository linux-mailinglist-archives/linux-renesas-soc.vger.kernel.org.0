Return-Path: <linux-renesas-soc+bounces-27333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CYwOeJ5c2kfwAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:38:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EC07661D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69EB9301068F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB3333A9CB;
	Fri, 23 Jan 2026 13:37:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2772334C08
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175459; cv=none; b=Nvv33npyanTQBFOB9GVIw22zKHGEqPQGtfpUf7h0owl0+o7s6w9ZsQVuPI1oXalPd5Ua/MAl/oUFYtwSU0TaRHQ37Op+JO7NLLqtV71Mx/QtzPKHSxpTkzCHLDeLl3lGkZwctcBLamjqdGXJ4TsfFKb8MaO8BZH5yp61CfFH2Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175459; c=relaxed/simple;
	bh=KpEkSaPxGcZCxS2l4iPet5USqgRy1vOPgX2jrVKUpZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCTm7rH2+cOaSPvWbz3pgtw6o+rNFBthjehy4AphvVwMiMOrXfIdNxX95bvQZJ42A0VGdb6/GjveUZtjDvenyNLflbyEjyArO/dFNlkGG5uK+TqYy1zeFzOA+2ZW3KE4VMsEHtC+Q8Ao+GdGtIPiAGxVfQIAfvJWVJ8zCJLQ2Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5635f3eff8aso512818e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175457; x=1769780257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Na04EJHnGuwBWJSiBwz4H9SjxnMaXn6qdMG7GO1T4ho=;
        b=azHv3dmXZi7Hm0WuG28hc2U7ddbce717pqq+aD8q3bqjVIRPoobco8yHvhopC9aaQE
         5SwlsNLecLwqaxBb+lH4nCBjRHTA5me+ZUrtYzjcKCTdgv39M1fMDlcpHwmivFuJBRw5
         SMmmzEYrPG1V0kPhAdLXEpl+bFF3zTNP3/NipDeJza/JHQuUqDWGElFER7B8Pq6PW8P2
         PSisETFTo97cScdJmV0jEPM/AkA7/ra6AZE6AZE2mhLIDIJhLaV11xrNaOekjmFMuL/B
         EFgDmA5kyZsXPTOzDjl/O7/T8MZmnMTLJECVC1jFUlHVK6pwIWleflfIbdX2LmfQ7x4Q
         kfNA==
X-Forwarded-Encrypted: i=1; AJvYcCU6jhkR51pPGUswANE/iw+LaJ6mtghtP2KDFEPbBL/ijdoA2Fg9b4HQawvCxSJWpFFJATXnd/7O0YlO4T7JcwP9Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNX6Ssv8OKgNfVEsRHGaeIDVOSo/ffYyIUySG49Y3+L5zwAO9C
	bY+yrteQz87tDLRROkZavlm75JA6bkxRTAEmbqg04cWCijiG0KpzchuUiqQH9/rg
X-Gm-Gg: AZuq6aLEfSdjwt7qpgs8Rt/HFzdqAlSp79Q9ptzj7bcGgFG7qTKLgzBxH0W/LQl6Nqk
	1hKZ5397kx7Avbo4iJsWvXx+9byatPv7IKbzEmn7c81o7F6WwXpXLfD3Pd8ttbcr7wGjCfp98Y8
	TLx4kFwcnEFw3g7/rKaMSQKBBy4BYOqLr6UvYU7aSDjd4PJY71h3X1Be4fvHRsgy9CXxDMVcfh7
	tOSz+gVNv1PFZMc7EW4HsIONIKInwwhDb7LTbjKC2iL9THQBtNn2jKqrV0/KyYnrCp2sLPgiphu
	6Q60CUPQp7fbdlS8MlIHKzPM4GUrZ93yuZhoToEMnl4FyqgPQDTDR3QxMNatDVt0mW8YQm66DWZ
	jqqpn6F9/yQ7SwtYCSp29uMUkDUAPakv+3s2duzCNOmsEjCWn8E1dHVYXVaXrISqJGXcqF2Z1Hg
	H/mYA8rG66JJO3OuXVqpQll4Iu9iLV0j799n6+2X57YPPkLrBo
X-Received: by 2002:a05:6122:1b0e:b0:563:72d8:ea6 with SMTP id 71dfb90a1353d-5663eb44e4bmr846300e0c.10.1769175456568;
        Fri, 23 Jan 2026 05:37:36 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb7e98asm483555e0c.16.2026.01.23.05.37.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:37:34 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5f539e05d63so668749137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:37:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuAtqXmWGHB32AyAVYQVH5xCe9z2nKB0zi2sp0khFIMAk2BPfvEGPpgclTqmYCpjdsT30kNbfbywl8rCiVaM3vDQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3753:b0:5ee:a6f8:f94a with SMTP id
 ada2fe7eead31-5f54b9a5530mr796917137.9.1769175452517; Fri, 23 Jan 2026
 05:37:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-9-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:37:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7UPWCqj4A6097KKT+Es2Zz_mPeJoyJd5qDMudrNx_5A@mail.gmail.com>
X-Gm-Features: AZwV_Qg4phN--rvftcV-K3FmN-Id0724_eD0xvFoKX3QxXmm0sEuNGOexfRaO-I
Message-ID: <CAMuHMdV7UPWCqj4A6097KKT+Es2Zz_mPeJoyJd5qDMudrNx_5A@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: ulcb: ulcb-kf: Describe
 PCIe/USB3.0 clock generator
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27333-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mailbox.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A4EC07661D
X-Rspamd-Action: no action

Hi Marek,

Thanks for your patch!

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on ULCB
> board. The clock generator supplies 100 MHz differential clock for both
> PCIe ports, the USB 3.0 PHY and SATA.
>
> SATA is not yet described in the ULCB DT, therefore the connection to
> this clock generator is not described here either.
>
> The H3 ULCB schematic does describe connection from output DIF7 to
> USB3S1_CLK_*, but these signals do not exist on the SoC, therefore
> this connection is also not described.

That is the case because the first ULCB came with R-Car H3 ES1.0,
which did have two USB3 channels. R-Car H3 ES2.0, M3-W, M3-W+,
and M3-N have only a single USB3 channel.

> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -352,19 +352,30 @@ &ohci0 {
>
>  &pcie_bus_clk {
>         clock-frequency = <100000000>;

I will drop the clock-frequency while applying, as there is no point
in changing it in a disabled node.

> +       status = "disabled";
>  };
>

> @@ -475,6 +486,16 @@ &usb2_phy0 {
>         status = "okay";
>  };
>
> +&usb3_phy0 {
> +       clocks = <&cpg CPG_MOD 328>, <&pcie_usb_clk 6>, <&usb_extal_clk>;
> +       status = "okay";
> +};
> +
> +&usb3s0_clk {
> +       clock-frequency = <100000000>;

Likewise.

> +       status = "disabled";
> +};
> +
>  &xhci0 {
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

