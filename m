Return-Path: <linux-renesas-soc+bounces-28714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO29KQPqpmnjZgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 15:02:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE811F0F22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 15:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5615230591E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6AE3624D2;
	Tue,  3 Mar 2026 13:53:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04E235B12D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545999; cv=none; b=J81LLZIFW5W5t32g3vXTZxPdpycnVlYqiQTmBU7xRnd69uMUPsa1Z1OPVnt12KRRm4QaOiIreU5WniwV07C3lX8CRugVJEQUJkC/4y1kAFiGaGzBW5aeJhgCfnSUrdGZnBwFmoe9J1KQrKaqKg7x+PqgAA4x+rwfSKWvTcNq2+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545999; c=relaxed/simple;
	bh=CLpy3oVfBpno5pNtd654a0t44zAg8ABNYi8W5CRKakE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bcy0Tr9p1rDqEZ16gSp55ELZBiW0kvTEP8+GHig5BfqTgAlL3DR5yM9+RDH4hOOX2xnuWStkw8iZQv0SePL/gYxjoqqDOsWig9Spnvf1/H4ZweqlimsymKJhUhWdvEh7fyIAVyKpg7vVL/+wvWZtSb70C9CGpVCcKcbaRGy9VSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso1735493e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545997; x=1773150797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftlyiDWQ8XObPCVS8E03AqNdtSao1cmOMFUjNen6Yhc=;
        b=YojZSlNeoGaU+zKFvEKr7ijeauoJC0pIP7+AyW9a843C8HXgQeg6NbevRo/pCUnQxV
         mm/18DEZiujt5CRMlDnh8fmPpySiIfyukCGYlf+z6UVsOd7eYksXpy7rL254HHHkOflf
         P1WM2gO72nowlUsrQxYivj+ApDc4dbpec+fEzVLQLcWQqfS40OnORFMQ1qDqqTsrgPgk
         YBM46jL/JszUbUaRbBg0fz+0VOT2otXDS/TYcprRo7zFAzR9wyr11P34JoMrtIdOtlX8
         UDAFxCCRc4X2fvI7x0SDO+HTAkgnu5Krd2ZYyOoiLdu+IJ3Jm04BAojE7GkrPBRUhbl7
         FeMg==
X-Forwarded-Encrypted: i=1; AJvYcCUF7FRcbNTzzsdHYqKKgYBRKp07DDdTBxRKgph86wRtLfOGNhsXn6V8vd7a/AdmpfWp3dFHPeXEi+ooLREsLviS0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFif3IOCNcuV/KHSbIlWYe/AOx+cjNcQObOYj/nl6AI/dyUZ8Z
	+WunRoFudmHPFCX10KishW7v50CMosbvVpXwO7z5KDLj3ysXnIy6phC46D192WAP
X-Gm-Gg: ATEYQzw8wSzri1PQBjf5bfq5rgMqIp5/qLK927jqm2d/Ycchmw+eoobkij0uTseqMVX
	v1rH6CL5BXU+/ytL+euPyL80Vzt0q78RJE7cplsrpkrvZE96WGGwcagpLilYxY7jAMMeJ0OE7Hx
	h6fM7zyZNW7Zdq9bNEY9i3zvVFodm3a2kl3eq5FmX9Q7RNE6A3JP00bt5KHR+gtcksjb1WlH5Ec
	qdPPvb8heTz2U3XTBYCWB4Qw8nL3nCiNYzcjkoiY62/kI20aMWKF7LQLOWnbGqYGJbEZuAWv0t+
	lwHoNM5+kCJys/Ym3VkDxpINenR+iThVeCuMv2SYSAMG+L1/e6MNuTTIIAx1DsAlL0oSC2B/DO3
	27+7W/A0t0xgqFTS4VRiu84Jz6tfEcbiUkxC+So98Jxdo8AKXo81gLRLH9x/UcioGOW9jrkluU0
	WWaOn/gEPm+IGOpXSTsNgUwcJC9rRmkiBgPNLu+bo3fIDZB0UZUm+nn919p+OfDIVw
X-Received: by 2002:a05:6122:1313:b0:566:23b5:ced7 with SMTP id 71dfb90a1353d-56aa0a13793mr6747879e0c.5.1772545996689;
        Tue, 03 Mar 2026 05:53:16 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56adfad07f5sm529017e0c.10.2026.03.03.05.53.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:53:16 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56753dc51baso2422289e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:53:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcxpXbKE4NF3lb2wIuF4vWiWV/RjRYDfSC5GEQiGTbFOCzrg3QU1xsyMGhC1Q6zGVBXLazhfk1/PzeicfMpgum4Q==@vger.kernel.org
X-Received: by 2002:a05:6122:7ca:b0:56a:9401:11eb with SMTP id
 71dfb90a1353d-56aa09f0b38mr6440166e0c.2.1772545995814; Tue, 03 Mar 2026
 05:53:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251014191121.368475-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014191121.368475-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:53:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQeOa5L9QAMDMy-KSH=HiZeOpLnq+VewSTVbvWHosygw@mail.gmail.com>
X-Gm-Features: AaiRm503CgavmHGHdjX0Ja6Qo22cAvLU4FN50HhU_yNMMdgGQ2R4xUYUTQ3hqfw
Message-ID: <CAMuHMdWQeOa5L9QAMDMy-KSH=HiZeOpLnq+VewSTVbvWHosygw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 8FE811F0F22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28714-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.125];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Prabhakar,

On Tue, 14 Oct 2025 at 21:11, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H allows
> configuring pin properties through the DRCTLm (I/O Buffer Function
> Switching) registers, including:
> - Drive strength (low/middle/high/ultra high)
> - Pull-up/pull-down/no-bias configuration (3 options: no pull, pull-up,
>   pull-down)
> - Schmitt trigger control (enable/disable)
> - Slew rate control (2 options: slow/fast)
>
> The drive strength configuration uses four discrete levels (low, middle,
> high, ultra high) rather than the standard milliamp values. To properly
> represent this hardware behavior, implement a custom device-tree binding
> parameter "renesas,drive-strength" that accepts values 0-3 corresponding
> to these discrete levels.
>
> The DRCTLm registers are accessed in 32-bit mode, with each port split
> into two halves (bits 0-3 and bits 4-7) requiring separate register
> offsets.
>
> Implement pinconf_ops to support:
> - Getting/setting individual pin configurations
> - Getting/setting pin group configurations
> - Standard properties: bias-disable, bias-pull-up, bias-pull-down,
>   input-schmitt-enable, slew-rate
> - Custom property: renesas,drive-strength
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Just a minor drive-by comment for a patch that is still WIP...

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> +static void rzt2h_drctl_rmw(struct rzt2h_pinctrl *pctrl, unsigned int pin,
> +                           u32 mask, u32 val)
> +{
> +       u32 port = RZT2H_PIN_ID_TO_PORT(pin);
> +       u8 bit = RZT2H_PIN_ID_TO_PIN(pin);
> +       u32 offset = DRCTL(port);
> +       unsigned long flags;
> +       u32 drctl;
> +
> +       /* Access DRCTLm register in 32-bit mode */
> +       if (bit >= 4)
> +               offset += 4;
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);

Please use "guard(spinlock_irqsave)(&pctrl->lock);" instead, to match
the style of the rest of the file.

Note that that will become "raw_spinlock_irqsave" soon, due to
"[PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context".

> +       drctl = rzt2h_pinctrl_readl(pctrl, port, offset) & ~mask;
> +       rzt2h_pinctrl_writel(pctrl, port, drctl | val, offset);
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

