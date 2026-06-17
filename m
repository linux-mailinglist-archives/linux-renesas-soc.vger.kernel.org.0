Return-Path: <linux-renesas-soc+bounces-34110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 12TuJUBIMmo9yAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 09:09:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B25697100
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 09:09:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BF2F3012304
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 07:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2EC3B9D9F;
	Wed, 17 Jun 2026 07:09:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F826059D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 07:09:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680189; cv=none; b=V2SwS4f7T996ABTvb2izOikcoAPlUtN4vTYkZJWjU+tSNy4wn1RjDBfMtcsX5cwp5B06aP/AmweLoRRCp9vZAAXpOqpX+8jYovBWP9JPzH3y5iDu9PfgQOsQfQb/Y75Igh0frvqzlvzk0g2AWxUx6NAkVAc2SQC1h3cDC6BWU40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680189; c=relaxed/simple;
	bh=iVrtPWbggK31kf+NMVcxt/bIB/zBj/D8Klfi+iYlymo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTTp0cRP1KxZXcMBTpkFu4CogwtQvwJjFjqT0YQtYZA/eOXOsvGkNZMg6c030AvpVRjFcjaOkpIQXIkQLcrN8U5S7AYX5A5IcksfD7EeZYYw1BK+P6ThVyarKBrm/0UuavKrOx5u7aDBsESnl5kUxqxAZxYcpSTplpkNMb8DDzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-966df39a092so26973241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 00:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680187; x=1782284987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdX/1r/VC5gVdSWCvpldxzdbyoom7W8WRGEDFlCTq6c=;
        b=fifooak0zUDhv1oAHikSBl3Nw2H9MshSR/eZuakbiKhL61vXxpgSZ3Ce8sc8Zqc5yy
         wKNXd+syqw00tlbeMGSM0N4IjT03L+viM8zBPrl5MXr+ET+TR1SQOImZNDm5XBsEhJkB
         k1AIJb8hH5noE8jCoBFJ3VkVjdbYjRR7Vl7iTJg1rBMu2H9FHejAmbsyP6WbA+UPfwpL
         wpttWaA9u/D3qeOrtWIQ/Dx4jpWuuAQWQfg3JS4U0REZCDrJ0Lsk56+RqSobOufEeIaf
         PoS6djySaElT3g845y6Hg9Q770ue+4AfabfKen47BWo6xlfT8CExlM/CkNJr0YCyKXZ6
         ZGaA==
X-Forwarded-Encrypted: i=1; AFNElJ9aB5EjoaLdwYUeUHyUYV0e4BZ7BlQAa6QYhR7gwxzf3RH66m/INYQQx4FbUHKEyGK1pFBD8zPxUjInHnnYP3pvCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ8sNBH4POT/q5UuIExmEbEFvS+UNlcZ607hGFhJ6C/tbPzGmZ
	2IUcRXIJly/8TptxsdIvy867KMEoymO+lWCNBl9CkTCmWV4mKzXAf61l3LglBfZr
X-Gm-Gg: Acq92OHespbCGFZvQ5jlsL8yjQ3TuE3Ohc3pq6K5t87FolpwGHAucnfh5VvQ/pb+7Uo
	lviPIFxVTbsXsA7/g7xXp7eLNmNw/tQpZkZEnslodoELxuiPHqyWFxcT4pRh0V8saI2FxjMrReD
	sQQG1kADUDpNZR4h4rcLHgSIUxqQljj82R0xRLWiB9FZRPaNj9i0KSuSRh1BSGSECySFwLtR4NL
	Y6xGq4SosqPtijwOKTusw16ANMT9tfYOVQjNc5x7TcxlbPcfFj2zPU/mNt/7+v02pd+E5GGw8v1
	5oWr4r8LYvVMQYvzxfokVbbAVvh1JmLMWZFhm4ocH7NWUs9/Id56YUiTgZ+nsstDoOGttnp8Rcy
	IAy13jIQlrRhjA85Eud3o0Z1ta+ZBDBwsxV2LlD3dA+pyRSBvFhBKHFSqWgdCrqPEfl58myIIS4
	bnsLSI/YA4hOshddtcEIFW5MkxjI04hEcQ0H4+OnoWRvdyoZslGQ==
X-Received: by 2002:a05:6102:509e:b0:71d:3739:76ba with SMTP id ada2fe7eead31-7246d31c8cbmr1210435137.25.1781680187085;
        Wed, 17 Jun 2026 00:09:47 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720847c1525sm6476576137.1.2026.06.17.00.09.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:09:46 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9667fd8e4ccso1152955241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 00:09:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8EfQdDoQR4l9Pv41k2cPIXQGoe4ADXzhMVdU9Eb1R9yA3mKnml+5Bru/4QhuPIqLdwTp4/7H6Q3psG7pdRNeJ7Bg==@vger.kernel.org
X-Received: by 2002:a05:6102:8386:20b0:631:e729:4575 with SMTP id
 ada2fe7eead31-7245cec45e5mr949237137.5.1781680186567; Wed, 17 Jun 2026
 00:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org> <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:09:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
X-Gm-Features: AVVi8Cf4irFbaHbMK6oTTjowYmtlzx-ojJFWgXAHjFGSCYVJj8Ydp7M37Z78yvQ
Message-ID: <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34110-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10B25697100

Hi Marek,

On Wed, 17 Jun 2026 at 05:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
> or APB interface configured to 32 bit, it can therefore access only
> the first 4 GiB of physical address space. This information comes from
> R-Car V4H Interface Specification sheet, there is currently no technical
> update number assigned to this limitation. Further input from hardware
> engineer indicates that this limitation also applies to R-Car S4 and V4M.
> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
> limitation.
>
> Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
> common for many ARM GICv3 implementations. Therefore, add an extra
> of_machine_is_compatible() check.
>
> The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4901,6 +4901,18 @@ static bool __maybe_unused its_enable_rk3568002(void *data)
>         return true;
>  }
>
> +static bool __maybe_unused its_enable_renesas_gen4(void *data)
> +{
> +       if (!of_machine_is_compatible("renesas,r8a779f0") &&
> +           !of_machine_is_compatible("renesas,r8a779g0") &&
> +           !of_machine_is_compatible("renesas,r8a779h0"))

of_machine_compatible_match() with an array of strings might generate
smaller code (I didn't check if 3 entries is enough to trip the balance).

> +               return false;
> +
> +       gfp_flags_quirk |= GFP_DMA32;
> +
> +       return true;
> +}
> +
>  static const struct gic_quirk its_quirks[] = {
>  #ifdef CONFIG_CAVIUM_ERRATUM_22375
>         {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

