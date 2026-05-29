Return-Path: <linux-renesas-soc+bounces-33338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOw7EnlqGWrGwQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 12:29:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1130600D16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 12:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD43A300BC8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD7C3BD657;
	Fri, 29 May 2026 10:26:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614363BED19
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050395; cv=none; b=QTGTrNt21dG/5Ne9qQw/+5tkX9snyf+rDBTexNfjAjIS6muuJtvfVaQhoIk3U6/EbWHvgEOrfbRsCY/QDrccwZ2RSMSa4V1UAQkfSqjte3UxIylxyK8C0KBfA1qOruvsSCS0mBmsumvBKozMCemr9mTA9w6w/29exAhh5XUWtgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050395; c=relaxed/simple;
	bh=c+8bOIJH2/zmKEeYW8ysGdmmpN9b/JyJJqcEUviAgwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raQ/tZSKNnHac+vr+IiTNkKCNIOPjq4hqjVr3n3aZeFetYQZFaCj6lVtOdkqAzxNdR9fWI5eLuSJqB+DveKRSU6B8Dvkcg+kyB9xpfPJcR49MNeA5WiYrQbyrA+HN/IVcOeOdLhTy98I5lylTdT+PGGTXwNPK3PETVbldpe1kSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6c25b040555so191607137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 03:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050393; x=1780655193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGrKUr6SO+4MwqjYJ/JW0TEtGW5JoCk1D2hlkLnc7q0=;
        b=FkVu0CJGez4Nu/w0WUYDoyZiB3ofIi1TfRs+DU22thosLd3FOi8+lYE098G6UOwKDF
         eB0cstKNDKzF457kYNtHOQot6Zh5bS2JUD8EaZfIxAF+NCTXytwxrZhOoCAedqymSMQD
         Nako3VNAHxJLa3WYp8hpHJiZay0+DEF8QMmBIiQG9i/GAQ01YEP3UmL/WxW2InGp5Wqw
         3kqx4yty1rOmZuPJpx/MrNv4LgJGcJeBE7qh2rGVqdhdBhzJuSeTzr8Uz2CQKSV64/y8
         IolXztCEhIQjjEtZMtfXcyq/rACSn04Mw6rUYjbPgjPCv6rGREp/kX5lqyNljv/5kkbM
         s3tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AJ2VGk+eHgWsm1QNGl2bU9cCyDuBysGfd453eBlkk/ygqNFE/fO80R8nTuvJ18ehd67aNXPrO1PuSOz/diFTJ8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy77ofegDwHJHKUx7rqRiW4iJqJy6Y2I3JMK/NK0pREOTioMkfU
	R27YSbDcUpjwpJ4Q95cDuCegzhiwMxOr+2sfTQo5iHiQN1e3BbQS7dXFcA7R1MY7HSU=
X-Gm-Gg: Acq92OHK1fy4VTXMw+HITug2zGVfGkqMq8cMDvPHXB+tr/Z98/mj9jHjUesJLKTDrFB
	5D/zTxPUp/mzGWQ1zSnPPL3LOyHJ/3ZCAQ26AE4zWcBEClkPZLPoWKmsUSapzanWRju+u35MHUO
	PGnAlQmz59KADALdldw4QXZWZnFYtIP6jaxd58EIotv0u9/0j+GCxr/ibuIXRZVV1OxtHompKjg
	0M32OJuDP4aB1sM+fCP0XbKrUk5FheiPiCis3Ko+kozwVpQ5qBuJejc+7+gFfJzhRiA2rthfrqG
	B2vrhoZDYqIjKHEqZ/BMY+B9qrS5NdrLz9dIIw+X9OYMgOyP9dxgKjfn+F7hH8szVNzda2W3ZAO
	9UpRJx7C/0YtmZ1nzMDo142GMiF41Cx0WFzRs8xM5RI4Ro40XzyaecwMQ3a9hmGFsQP1OUTnIGX
	2hlx/bfzws6e2ONmFjmG//KRJ7G0YoTjn6nAdoBmMQcU/OHY+7dRut+NSKFoDhs3cMFRDkeOA=
X-Received: by 2002:a05:6102:5983:b0:604:f029:224c with SMTP id ada2fe7eead31-6bf2daaadf4mr776335137.8.1780050393339;
        Fri, 29 May 2026 03:26:33 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfbae51f62sm701698137.6.2026.05.29.03.26.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:26:32 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-632e479586aso9948651137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 03:26:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+HJZDucoGNp0ZTerJF1cyZ8vzb/3w5A3EZygpoLx2fshXP400xty0oW8mKY7T1LngCbcanQM8hERwCz1abj8wIsQ==@vger.kernel.org
X-Received: by 2002:a05:6102:8008:b0:631:2a82:111f with SMTP id
 ada2fe7eead31-6bf39267a54mr800161137.17.1780050392478; Fri, 29 May 2026
 03:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com> <20260519111958.233194-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519111958.233194-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 12:26:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGjA3FCsO0QGLaRbYm0FaJYUXkd27qiW+NM8R2q5Mwdw@mail.gmail.com>
X-Gm-Features: AVHnY4LFt0O6F_i-Vh9tP5Toq47ZnKZeLEtgQ8mqX4PxSw3V2T6vgOee0I80fc8
Message-ID: <CAMuHMdXGjA3FCsO0QGLaRbYm0FaJYUXkd27qiW+NM8R2q5Mwdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33338-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A1130600D16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 19 May 2026 at 13:20, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add device tree nodes for the three RSPI channels on the RZ/G3L
> (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

I spoke too soon...

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -442,6 +442,78 @@ rsci3: serial@100f3000 {
>                         status = "disabled";
>                 };
>
> +               rspi0: spi@100b0000 {
> +                       compatible = "renesas,r9a08g046-rspi";
> +                       reg = <0 0x100b0000 0 0x400>;
> +                       interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 444 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "idle", "error", "end", "rx", "tx";
> +                       clocks = <&cpg CPG_MOD R9A08G046_RSPI0_PCLK>,
> +                                <&cpg CPG_MOD R9A08G046_RSPI0_TCLK>;
> +                       clock-names = "pclk", "tclk";
> +                       resets = <&cpg R9A08G046_RSPI0_PRESETN>,
> +                                <&cpg R9A08G046_RSPI0_TRESETN>;
> +                       reset-names = "presetn", "tresetn";
> +                       dmas = <&dmac 0x26f2>, <&dmac 0x26f1>;
> +                       dma-names = "rx", "tx";
> +                       power-domains = <&cpg>;
> +                       num-cs = <1>;

Why specify this, and why one?
The hardware has four, and the driver hardcodes four.

> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

