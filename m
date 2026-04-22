Return-Path: <linux-renesas-soc+bounces-31498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM+nArSr6GnEOQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 13:06:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0E4451C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 13:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B22B3009561
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 11:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C803CE49F;
	Wed, 22 Apr 2026 11:06:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7473CE4AC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855961; cv=none; b=hr4XlGowHVinEJXJ7C2zuk2sn7/RzRJyn7N0Gc0qHG7lEQ1OKezrPtBrr3C0ld6ilKLdQ96BECmWppLh2xoT3ETr51SW+fve28R/dj2YmoGdTtyF/HRn6OBoJUnw2OOR1T0Ebscp4RsX0otv+/IAhlRXUh0kMEyjDnEULqcFU5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855961; c=relaxed/simple;
	bh=V+ZMBuNSFVaGWYnwYt0xNSbNY/KGitTFOmcjxFWL9nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nx6gl6/unE3Ec6kptXTU/vPg/fNQzrcAfNinxXTAsjVCK2oW5ppFkl8v66hZ2c2jrf9l4+681LdGm17abuozvpkA27u9gh2Md0O9bf84KoxhngFA8JdReqTtKbmFb4XPMeDT0vcxSxriH9CCtweAXkZnApV1fHGwOzYPdzBgEdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5673804da95so1627020e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 04:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855958; x=1777460758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dE8GZKBh2kocFSYW8A22paeYqS71tNSGxjxbKeGcjc=;
        b=Y6gjJ0n4IcKAF9H0OIMYcsaLSPq1aebrojpLmGn5CkJsKdCftEUA7Oq5bbGFh4yVBw
         +EFqY7CyygdQmCiov8p7UNQgfEHsoHjhsMNRQSP0D9vIIVfbp+VW+iIiXriQzNJ7MO8T
         5dCrowSr4gfbKjw8y9uDHS0psVItg9GwOMP5N3kciiA4SoWDlHAMiawklTO8dyJImcSp
         L15vLRzbJAPwR0TMpihDcPTE/AhrdNK6+lvJm+n/k0/iTNlDzYtdqdVlEgyHF8LpDWOo
         bQX+/kcUE96leNxROZ1QV5YZF4IXgMz//17aP5qezCfpECROx6eC7+7mm5tzmHcqsMXJ
         yAsg==
X-Forwarded-Encrypted: i=1; AFNElJ9LlKtaEj8Y/4e0APrkeUp1+o/e6bgYMz4E6W50tr2NVVokmIaiinuB5xl6ExJskstVuSQuM4aHg4coe8H2vHbLlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKk5iYELAR+tIWSzuyhWAVtVi8pg/21SI2fKqFxqaI3Vrtm5qT
	XTssypUaoWgPahbpWCbiqtNbe2pT6stOyUiD1HbFuvYrlRF2PCyE+BRymztYA6vBLdI=
X-Gm-Gg: AeBDievAqVHBx70QyYSaSI9BnQK+op8jPVeGoH9+0RKicd2YoeMZ6A3s+AZP6HuF7HI
	ujZnAXvwHEFeGavla2cDZ3IzcHoPZbh0AnVWCDB90bFZ36+WOztNE6GCXOLpt484hmtt1d7S+Vk
	qkpFwjQIHjcF7l3Kq1u5D95RIu3xrM8jMf9Tu8NmRc3i/l58dgHN9Auqt4jpYtwGDDe5Qwxio+u
	nAUEUj6jfO6pwLM/KGKlnmPdx+OA0t+55E/GzJvMfnzIsYYcnXOFIkTzbk50D8Kzz2q5HiBBaB1
	nubDmYSTNM7dlvkOGlO+6iGWQLZI7CSxoyy4YZGk07aH68Y+J0jetlsX1m3pPxJWujdWrwMhGdM
	OeAbkJXDVku7FMRoy0U6Mhq6xG98/VNN1yHwdvfTJYAyuRGsUQN2WfzWCzCSr69ut6P3SYHxnmU
	cW3qrgPI30GeHKbDS3qJYtAedSWdSnhvEyFREhtcs1TSunDP+EuCBl5P5nszqiJiST+SIT09k=
X-Received: by 2002:a05:6122:4fa2:b0:56e:ded3:98eb with SMTP id 71dfb90a1353d-56fa585d299mr10466867e0c.6.1776855958292;
        Wed, 22 Apr 2026 04:05:58 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa9351ca8sm9201492e0c.18.2026.04.22.04.05.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:05:57 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-610aadb2d9fso1723040137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 04:05:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/dQ/YZv6CVkIrCBCTCNf6HUKJe0iszLeTjMcCMNOrTY7xDP0j/mk9cR9+aUebUiwoRMQtD7Y+onwi81qaKWzO6uw==@vger.kernel.org
X-Received: by 2002:a05:6102:2ad5:b0:602:8ad9:1f6f with SMTP id
 ada2fe7eead31-616f4f7437cmr8915360137.5.1776855957147; Wed, 22 Apr 2026
 04:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com> <31210e05f7189b466b30eedbdda3d11726dac279.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <31210e05f7189b466b30eedbdda3d11726dac279.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 13:05:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtm2-xGoV5Q1t7MTeDPthWGyNiR2hAtU0uTm34ELy9dA@mail.gmail.com>
X-Gm-Features: AQROBzAi0Xvfi6K-aYoZnZ1LHkHlOn6785xY4aXFH4_i4D0pQfgPtu2T2oaih5w
Message-ID: <CAMuHMdWtm2-xGoV5Q1t7MTeDPthWGyNiR2hAtU0uTm34ELy9dA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056: Add #mux-state-cells
 to usb20phyrst
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,pengutronix.de,vger.kernel.org,bp.renesas.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31498-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.241.139.240:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 70A0E4451C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 7 Apr 2026 at 17:35, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells
> as a required property. Add it to the usb20phyrst node to fix the
> following warnings:
>
> "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
>
> Fixes: 6a1b6f7e56dc ("dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

