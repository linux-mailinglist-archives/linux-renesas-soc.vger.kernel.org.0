Return-Path: <linux-renesas-soc+bounces-33025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOYQMCF9EGrdXwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 17:58:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B0D5B7414
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 17:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF4F3300D6AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417E733E37C;
	Fri, 22 May 2026 15:55:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD0E32E72F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465338; cv=none; b=lqzrzYJYGfGAsCB2ZYypH90LTZvXalw07KlGUB37wPuNgirxkyM/udqKSn/yaUGfBwBLiyaDBzTTQkDnZs9fpiap29CfLxNQgXClH5GeO5B5RDfFeWEw9yN02jGyy/cZTBPsAaMkeN+LY9YSndHUCXjgahWDRpA54KU7BLWD32Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465338; c=relaxed/simple;
	bh=J9pqhe3rEd28EB+7QM4Mt7JtYR/l/3S7v8/M/aaqFQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVSVlfumqWCMWJydIAsNtGAqiflu0DErz7B8FcSQdUwpW4ELZWGCOa3XNaiHcyZk8Tdqi4ZFm/YkmgQNm1tz3ENGPX6Ksl/ZPc60BI2vdGCXXAhRTIdHx+f2Oto6dJMCwDKNGSzrtikPFzKB/chPqYDkoPILEO+AJX8VJ1fsiac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b5de17382cso62186636d6.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779465336; x=1780070136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mat1V267K7OB4qn2fEb5sEkdQiWDnrER2vm5Q5jlK3U=;
        b=EPUGtwoiBokQljrJviUNqFk7YSUlX0EbkRlzxOPfz6OKoqr0FZ8OpwJRL3F56z5QYk
         hHo/+qYavQtYbpRNWC96Ne205r+7RDrVKLoPWSb0XCeNN1zsPq/fPpNcqBHkHRTY/E/J
         yOJwOWa9okD7gXqvKWajFKVuojYIWBBjZi5rEsZPLx8jvN0BVdA0ibKB8uPegOuAayPx
         eMTEmcxE1UbCXnVYPox3iUPbDSY3mMXo4CfOia16jwbkBf/h6ObfcAAKaVtjPUoiD99v
         SotvPCAvAwD9H6IDABql263zicR5I+hnpuelWaUnQqV0Xxg/SeoFcVD/txO5EJqaKQAz
         Vf+g==
X-Forwarded-Encrypted: i=1; AFNElJ8oxiQ1+HGT5k6DCAhcHHFdQifHGn4UIOfvEqPwtvh9Ri76oSL+0bpuw5YqP50VgfGFoBVcrqNLfpNwPkAz2tgkXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqU5Fsv5QwHgmaEF0gJppSoBFUZ00L07gKt+Eb9EZVZx4HWjZS
	krygihKk3x9/+/GE2/wLuWLq/NOwidR3duLcG6D/2CoaYoLvQqUPhg5AB50jgg6PjQE=
X-Gm-Gg: Acq92OHj0cKCJpnwIPwwtabZGme5nBCM/+uIMCgVWClrx4IikgXo7yHrFclR+KNaJY0
	tfb8JMMkwA1xyAjnc6K6HEAC3wgBikNHk2vhZzxAoqyZfqBXC2n0WEwNaBIlrdwCpcV8UMVEjV0
	aITmrYBMhqjzHoreS6VmZi4Rox/8szHjmNEzBTInFHr/s5AGt6nqJ3VfC1RqGJ5LBq7Y+kKmaku
	AynGQAJkK0VvqbJZwf5lrM45wqN9aq7E21ciqt+O8qM3WFFhPJSubdLnHl9zoP8aNJolngMhfxS
	y1yvHfhUuQci/2GDHze8GYIcke8/YntjeEMaMNogeihEyuWkBkHRHNQ3UEby4jshnuJp81Jwi7D
	A2Tly+Ed7pgIl+rxnH9OW2Cj9IP0dPSijk5ZJWxmtUIlIeho8wWFvUaa0vlNVMJYeZ5yeBzSzQr
	BIewFgnJkWDpB8axlTnSmHCium26pKJtBwCreZyq5T2r7KKYWXQzvjiyfMA/QT
X-Received: by 2002:a05:6214:4019:b0:8c3:f47f:50f8 with SMTP id 6a1803df08f44-8cc7b3b878cmr72363266d6.0.1779465336345;
        Fri, 22 May 2026 08:55:36 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcf895sm22926406d6.1.2026.05.22.08.55.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:55:35 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b7105dfb35so96468566d6.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:55:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+DFgOj8g1x0WlNwasD9ipzXK7CvBQbktIEv5rKIDqEJirjUvKAvPJFa+ayyX5Got6Xwo6QqLA66QgzWUNqSkfhtg==@vger.kernel.org
X-Received: by 2002:a05:6122:3402:b0:56a:fff5:b4d6 with SMTP id
 71dfb90a1353d-5865e2b5250mr2614239e0c.4.1779464839874; Fri, 22 May 2026
 08:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:47:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
X-Gm-Features: AVHnY4IbX-4yvb6-_QqYAmKEvB5Pw7JiMigOp3rN1DUejXGr6NhPRl6ad5aF2d4
Message-ID: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: r8a779md: Add support for
 R-Car M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,redhat.com,kernel.org,glider.be,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33025-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,mailbox.org:email,glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 29B0D5B7414
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Geist board based on the Renesas R-Car R8A779MD (M3Le)
> SoC, a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop CS2500 variant suffix
>     - Drop cells from rcar_sound ports {}
>     - Drop ehci1, ohci1, usb2_phy1
>     - Drop Salvator-X reference from commit message
>     - Split panel DTO into separate patch
>     - Drop FCNL node
>     - Add another memory node for the second 2 GiB of DRAM,
>       although the DRAM layout is patched in by U-Boot
>     - Drop FIXME from audio-clkout {}
>     - Sort nodes without unit address
>     - Rename regulators, use npmv suffix for n.m V regulators
>     - Rename x12 node to x12-clock node
>     - Add PHY compatible string
>     - Use interrupts-extended in PHY node
>     - Rename clk_multiplier/clock-generator to clock-controller
>     - Use interrupts-extended
>     - Reinstate port@0 to rsound
>     - Drop iommus from SDHI2
>     - Drop DU until it can be tested

Thanks for the update!

--- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts

> +&avb {
> +       pinctrl-0 = <&avb_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy0>;
> +       tx-internal-delay-ps = <2000>;
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               compatible = "ethernet-phy-id0022.1622";
> +               rxc-skew-ps = <1500>;
> +               reg = <0>;
> +               interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
> +               reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +               reset-assert-us = <100>;

10000?

> +               reset-deassert-us = <100>;

300?

> +       };
> +};

> +&pfc {

> +       pwm2_pins: pwm2 {
> +               groups = "pwm2_a";
> +               function = "pwm2";
> +       };

Shall I drop this while applying?

> +&pwm2 {
> +       pinctrl-0 = <&pwm2_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};

Shall I drop this while applying?

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

