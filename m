Return-Path: <linux-renesas-soc+bounces-31497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI6CJDqr6GnEOQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 13:04:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A2445182
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 13:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEB3D300D614
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 11:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1893CE48D;
	Wed, 22 Apr 2026 11:04:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE641EA7DB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855853; cv=none; b=sQHPiGfPUGywje9rLudrjtbDC5PA0Fk3Pntu2H14yY2CjVUoR6XJr+XvixXdEX/qQCJpTuyn2vdyMDc8DByfR68yUdqx1z0m7Ym5pozRUYvbznsn0mdK1CPLl7FMSn4uJnCTCQZ8N8Q/eCwmi6HBaYAa3FLGCo4wJNQOvMCw+Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855853; c=relaxed/simple;
	bh=+kKnoE3X5myIN/x98gvTEBRPP0ds1FM6+RV8J+/UXuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XltE70FW2yYx3c61I2OVdNtzdlU/Beufsb1HNpTPTMtNe2IzcO1OC1MBuTMSpB1KomwEmJGWZxucNoj8uqWpkZyTWb7GwT668dbWAI4fpo7yOTRfYoE6Cy5109Y+7O/cFCyJh25dcSb5aT7Xc7Ota3jkMBmthl6T3Ku+7OO/WOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56739adfa1aso3761699e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 04:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855851; x=1777460651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAq7sn6tmrcy4Xrh4FAud6hbxe2HMMl+qUt+pq72w94=;
        b=FvKsyU227b6YTVqmtffq1N4LI6WQQqjzrF/8vwAlcgSWKjC/uh7TKr7509SK9KxsV0
         yjMaF9WBhYhKWklerrJvS5pPAfmUVTHco25V4MvGL8CIszPKor8rjxPOTOD71qEzwJCD
         mjfAwgBPJwky6eKOKHKY21/Kx9cEn5frSAJj6j/Zb//ams8iKROy/HRnXTfrglEgvqxz
         jEWS5lx+WrxMZH1CIby9FAuEDWRC50pgPfKUmd+HO5HTdyQ6FIt2ISxpd/IuXm4qf54y
         TMFQk4Szptc3yCh97JRMy2kvVeWOayZNg9tXmuiqEdPL3AbjYeqRSqvwQT9xOBByKdLI
         MT1w==
X-Forwarded-Encrypted: i=1; AFNElJ+qSZ4gPIe0Vk0AZBHFUqPyOMlYOxiDHlz4nRklv2NNDSaTb6cBmW7096HgbwRrho3MYAjTFnsRcZquGUUBr+nTsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6gbpwX7EixFnNSW+Jt8wH+0wmf9Zd2klPe7PJKxqARRIAI/Bt
	UwaV2wLfVK/xZORTxoTZ/AIXd6nHHqMNJU9NlT70qFLC34o9UWdKCFqLaj6ud0Qa2yc=
X-Gm-Gg: AeBDievQYsfM77KFPVkU4njwAa4szxw2Qz0rXwdoPmcYajs1K9gpym1zIoqKLzpD3Pc
	NdOw2d2rLz3YmraA1IQ+KNtu90080TgG5KmkPnx3QbEDL6ExDbajWM618NuIecIA2OTun0vIglF
	xl/jwAwV256qyuIrWWvMgBwSPi7XG2JrMQVBMF+mY8hHqsuD5p5s4g3d/MqaMykekki0ljtQKob
	p11AuXxZSo+vx/JF9XwN/T//XCG2wLud1RMuBzfU1g3WLm/v9GvB9XLsulyMUDNzdU4YrQ7DKJ7
	AvhT2gGsd5Ohrs0+8Xxrv54gZMSlyTmBCQHiBwsz/HushA8pP3wEaYzRHSRC9B1jyQ0ZkSes9M6
	VOtLbDGWFBMy4smIcSOwXi/FTqsl9AuZpsErOBgPKyCgMohoUt4WZ9KVZXio4/suwcfM94ehDct
	DJgSpM4Kypnf8o2gcwuy+HV8KNZaaFXhFo9jtZ+ymsFdW+jaOxlYxO/9XrpzMFgZtcNJhKEoI=
X-Received: by 2002:a05:6122:3408:b0:566:354d:9f4a with SMTP id 71dfb90a1353d-56fa58132d4mr11658133e0c.1.1776855851387;
        Wed, 22 Apr 2026 04:04:11 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa90335e6sm9955807e0c.0.2026.04.22.04.04.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:04:09 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95697b46831so3095656241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 04:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fmgol3ch7bEZz9+EJkRD1tgeUggeIOS+AVkXBm6YlmQcS4QMoJGnvzj6hRy3H7kLHi9VGnoMCSw+bGOxIdh07HA==@vger.kernel.org
X-Received: by 2002:a05:6122:e253:b0:56a:fcbf:8aa4 with SMTP id
 71dfb90a1353d-56fa5811e9fmr11350501e0c.2.1776855849546; Wed, 22 Apr 2026
 04:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com> <22fb9a500cdbc3272dc23cd5e36bca5fbbec75fc.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <22fb9a500cdbc3272dc23cd5e36bca5fbbec75fc.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 13:03:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDZ98dTwEu0ErX+0eiauNUwDQcWxxfrD=pSo2wA61Cig@mail.gmail.com>
X-Gm-Features: AQROBzD1uypvoBrb0e6rgYJ6ENObDj8jwDEQe2Y8m7CIn0z6EpqWaIELEZXNRQo
Message-ID: <CAMuHMdWDZ98dTwEu0ErX+0eiauNUwDQcWxxfrD=pSo2wA61Cig@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add #mux-state-cells
 to usb2{0,1}phyrst
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,pengutronix.de,vger.kernel.org,bp.renesas.com,glider.be,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31497-lists,linux-renesas-soc=lfdr.de];
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
	DBL_PROHIBIT(0.00)[0.241.179.0:email,0.241.139.240:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 547A2445182
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 7 Apr 2026 at 17:35, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells
> as a required property. Add it to the usb20phyrst and usb21phyrst nodes
> to fix the following warnings:
>
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
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

