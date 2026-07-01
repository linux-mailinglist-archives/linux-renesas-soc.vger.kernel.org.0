Return-Path: <linux-renesas-soc+bounces-34618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VLfyDBMpRWob8AoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 16:49:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2BF6EEF91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 16:49:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFF3030878E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 14:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFB33403F9;
	Wed,  1 Jul 2026 14:48:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26D035E1A4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 14:48:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917290; cv=none; b=nlSTnsVWlfZ9SBjQ5sPQxO4qPK+DpHGTKsTZ9Xt8/jcLuIOWIpO7C6PU9iZIbJO+HMHZX89T6/hOA6RmdhBrtNAXPInnyjCYHJ/lZsIRLXPqFNzAaRMWSjZoZ1oypAWn3ZqIvIFfpwakTjuFi3XalV11JQORO0QRyJc/fn374ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917290; c=relaxed/simple;
	bh=mbYj/DgxQsH01Bs5jx6IuDvkCh8mMCApKMcE8PUQ/Qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKcjFYg3rCdF3Simk/Tcrzq1eeW7+kiF3y0FinoOx9ykPJP6YochWL3egoI6GWbpto6tymrNpMPxl++uawPx2Rp1iMao97X9QNlBrnoQ9/WIymniWZLba6bVBBoiqxOTrsSedpnLlhYMx07tC8FXPPIrP+IGEeMxnUukDb4Nwtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bdcbb1f3f2so393733e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917288; x=1783522088;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fn5x9jVdVZoiN333nyZT+iD2lKvbWjTH6VHWdCyr2L4=;
        b=glV2nZJdYuY6egHUb1IH3h3QV+lN2GaMalMU4ByJUITQa/VAC1xtwgzrTa09T5mjDL
         9LEH7Or0nlWdG+1bOcrFCTp3k7TzIdU5NX+/62o7nCJRVpoVQ4C68ATLyOik/l4A7iMB
         f6RUBcx3HYYDRw3Q+37+zcj76s1/q5Lqh3KXQCNO6gvQR4NtFw85UT9VyJ9cSxWTCovI
         jhRz6lQGRbpnhGUkrw+A8XFRkwS61TxU0NTIpg3eR5JFwkFxn+angE9Tyg2TVYQB2fBD
         VbTzhP5uPVxighw6hmn0mFN+h9M8MRkHNxGJ4+TglW+6/a9+KKMx+mWUUpP+gVoCxFqs
         ntlA==
X-Forwarded-Encrypted: i=1; AHgh+RoEuLrik0wlVQ6AzpsMl/Sr39H6gqQSDWarEmNAP2Wmo+qdzNfP1Ex0CWbggtalMHD+1kfZsXB6+nuf0HVnufE/GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CsCMr9bH7ccuCL7+IYowsCstJ8YoVCCTYcxHA4tSZ/4nRX4S
	JEdELU9KhGQKRm5Eo/jydMHWu+L6Zw8mjPUCu06hw0tqnGZqqj89eEYnP8hUsSfYRQE=
X-Gm-Gg: AfdE7cn13jyYWaZS6QrlDiXrPlZtnJk/lucuEY+4BLp0KGTWdkB2CD7LU7Nc//evnwT
	LVnsOVRd2KZcDrn/H6/eAYna+v/3pRnc15RAyzP16YIfQ3Z+qPHsgsbjd46bt0BdOJdB5oMWU66
	uzZYBHdCDP3+wFlVHAsqgWDA/ZseWJ67jIoSN1sE9h0hy8mftVveEoLpoB6jL06jYqluzpXe/1b
	MqBxOhablCDpJ0P0RDEV/ci1zRHPM2Nn7v32qU6C8Ej6ASlZkplAfwbIacLUkgn+9WJgVbZggL2
	RdIPh0CNkuF0t6dGBKzQ8/v3/l2n+6kCuFGNyiNTZQUdgVxA7QxWeEGqAO7nHkIQfZMDe3e76gD
	VAMYtoSdYtJOqwOSR7Vxt5AOhfXC/D/zwiX4B9TgF8ufhgzrWNyRfb5F0Y8rH1wYHfC+MCte4cv
	I1h4PRmtZCLeH1fKwXI+NAhFsimGfr83eGrVaLDHfgnnKkVwz6Kg==
X-Received: by 2002:a05:6122:3b8b:b0:5bd:a6e9:711b with SMTP id 71dfb90a1353d-5bde3cefdfcmr543392e0c.13.1782917287813;
        Wed, 01 Jul 2026 07:48:07 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc18bac6fsm3361047e0c.8.2026.07.01.07.48.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:48:07 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7391d5504b5so371348137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:48:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp87vSOEAaH/n944+lOldTJ0f8EyerVPzTtwnTH0gXML9HhsAUKbm+XKbiLIvVz076gnEljsiUolwobK4gjf18w6A==@vger.kernel.org
X-Received: by 2002:a05:6102:4414:b0:739:4fa1:50aa with SMTP id
 ada2fe7eead31-73dbf3a292dmr614675137.14.1782917287445; Wed, 01 Jul 2026
 07:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260602204707.1920839-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260602204707.1920839-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Jul 2026 16:47:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCzxRRK8oZvHmHFHCUN2v_kn69_8pzCVrW9RPk9FRA0Q@mail.gmail.com>
X-Gm-Features: AVVi8CcnXjaDrB2t_UaCpLhZ82qgKt5I5D4N9jNEZBN_xFIuCBoqVp036vPforE
Message-ID: <CAMuHMdUCzxRRK8oZvHmHFHCUN2v_kn69_8pzCVrW9RPk9FRA0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-34618-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB2BF6EEF91

Hi Prabhakar,

On Tue, 2 Jun 2026 at 22:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the PCIE1 slot which is connected to PCIe0 channel.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts

> @@ -430,6 +442,12 @@ i2c8_pins: i2c8 {
>                          <RZV2H_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
>         };
>
> +       pcie0_pins: pcie {

pcie0

> +               pins = "PCIE0_RSTOUTB";
> +               slew-rate = <0>;
> +               renesas,output-impedance = <2>;
> +       };
> +
>         scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
>                 renesas,output-impedance = <1>;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

