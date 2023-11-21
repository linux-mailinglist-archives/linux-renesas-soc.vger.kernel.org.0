Return-Path: <linux-renesas-soc+bounces-29-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0B17F2A1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 11:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B04FB21A24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 10:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D9247782;
	Tue, 21 Nov 2023 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255AE10C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 02:17:18 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6bd9:a79:1d00:5285])
	by baptiste.telenet-ops.be with bizsmtp
	id CyHB2B00Z0Wid3g01yHB4U; Tue, 21 Nov 2023 11:17:16 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5Nod-009vBm-RS;
	Tue, 21 Nov 2023 11:17:11 +0100
Date: Tue, 21 Nov 2023 11:17:11 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
cc: tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
    conor+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, 
    sboyd@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
    Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 5/9] irqchip/renesas-rzg2l: Implement restriction when
 writing ISCR register
In-Reply-To: <20231120111820.87398-6-claudiu.beznea.uj@bp.renesas.com>
Message-ID: <86e165a-fcce-4877-c59a-afaeefd9a42d@linux-m68k.org>
References: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com> <20231120111820.87398-6-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1279773061-1700561831=:2361084"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1279773061-1700561831=:2361084
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 20 Nov 2023, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/G2L manual (chapter "IRQ Status Control Register (ISCR)") describes
> the operation to clear interrupts through the ISCR register as follows:
>
> [Write operation]
> When "Falling-edge detection", "Rising-edge detection" or
> "Falling/Rising-edge detection" is set in IITSR:
> - In case ISTAT is 1
> 	0: IRQn interrupt detection status is cleared.
> 	1: Invalid to write.
> - In case ISTAT is 0
> 	Invalid to write.
>
> When “Low-level detection” is set in IITSR.:
> 	Invalid to write.
>
> Take the interrupt type into account when clearing interrupts through
> the ISCR register to avoid writing the ISCR when interrupt type is
> level.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
--8323329-1279773061-1700561831=:2361084--

