Return-Path: <linux-renesas-soc+bounces-33202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BnsEtfKFmr7sAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:43:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9425E2E57
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 622A1300D36D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 10:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBBE3EFD10;
	Wed, 27 May 2026 10:43:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461E3D6484
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878614; cv=none; b=XjCPmaTNc9E4uV9P0nlGbc/tmnYe+ixf2WSFo1/I8BCwMt4cWqlGWOc6osyKc/Rni8fmlT8lLas9x/WV7aj38efEaPiH6tAItYJtkLurCA2unTHwCj4sJIanMxX01eC2DjJ0eFGBAuX6UfLbnKcUy4sPprfjIJVdQcwVkXkItE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878614; c=relaxed/simple;
	bh=6ZfjJyjHo1+6wXNY0VH4t1SbCnQeqbO2bVIcxpATc68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZdZW1t3l4m+JpeWeMrKxJILxpdv/kqXJXNkPZzyuQntJD2+7nakElId2qrsT0o1dJzG8mySYBq+FciqozLshwRhRRLy2J++yZUdZ/uM5QMvBSxgKiZgGILBNKiCXQJx1l78Ktp8v369daMPai87ntmwh8rEpq1D79wh7ve6B28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9617940274bso1759038241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878611; x=1780483411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1fZpK3wjr4pqcWYWlRG5eHG529oVQ3i8sQvLS13gr0=;
        b=d7GIYEOy48aNZVPmc3I5fd9f81wtGjZpdYYwGZhKIhjFKB3RaTKIxR5I3SRWmeJLIP
         qwiv0XayZ8sHiREXdNxycHwC+BkofQuQE+OQGvMjgFd3CEEwO2HXXI+UMcNpll+e7I4x
         YSNaNzlU83l9lZH+TC/tJtPSt7rL40AjPIY5zB3wUT/xbpvdcSppRKVeR/LWpBi/wRJj
         kU3OZcV2cuVxwFh26q63JtqkcbgwOyn6bGp2vo2TebxmfcXpAhc7U4jq0uESThNMzWnH
         hAtu/FUXVxdyuNkj8wIvakuBkcgESacpb9JftEbMzNzu5PSddDplKoS3qWl/WF27hLvi
         crZw==
X-Forwarded-Encrypted: i=1; AFNElJ/w6Xc70zqsTjXu4ElVqE3NdFmOFm3FBR3MF9k++poXza9QbxkMpv0XGjXW+dAFKpAFw2WEp0uPWoEVqd2v5K24dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOttWL80M8XafjuS+Q0Tr2zM1DHa+QVSuuwRGYQVCPqYN6uy9w
	ABCVlDRcnqUqACiNlnlHDoOO9mRc63X/jXQnVcIhy4H3dR+icrfzoo9v1u8AR72Ihpg=
X-Gm-Gg: Acq92OHi1tZRIGkoDaAncUeeE29JSumOFrfQN14IWypcH3TFDV+U6FhZuiseU7p89jv
	oyKHJXsNrfmQO2I/i4+e6qE1Cmq1l/ONk/gepWwM8akdhg0nXIxXige+M1JnIPpnggKLM31TYMu
	CR7k0oPGpK9Z5WSZ0IeNC+XiQRbqJ/7YT1DAbHkZloyX6LiEAuCIWJq3JbuG9kWKEdqDQN7ieMj
	wnS1tiASY7Zh20MDEb3v28ayp43F2x4RPqgU6nbYbyKf2vtNd2ub3/Qk3Brtmo/FE1Jw9SVlc8r
	13pvDsQw0EJs2M/KR+fCq8/FjglAHTt22jXzHQ9e5frtP5tm8KYgw77vlIzTXxt1jnBR5IF26yw
	Rvpwl+Yn3OiVc1sbOgSbZ3Ui26yYfJyj8MaWAXsVpFPNslIG0C+MqElVVEmIpoxA3zNuLsvGty4
	jCZ+eO83C5qcQFho+bw4lCGZtukCel3y4b7Xc82CIrockchP8pn72IETh6L7G+8lOKY1OP34M0p
	4xK9P0wog==
X-Received: by 2002:a05:6122:32c7:b0:575:2f91:6fd3 with SMTP id 71dfb90a1353d-5865e3af75emr4084311e0c.5.1779878611347;
        Wed, 27 May 2026 03:43:31 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f37281e7sm19636795e0c.7.2026.05.27.03.43.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 03:43:30 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-63a3977145fso3758584137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:43:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+4Fz+FpC+K3bR64HJJ/b3Z+7H7aEG2a3a8kyW93zeh4o+2aM5JwzzKL57z/7b5hNah4+zEcz0avkA2pJg94QMcTg==@vger.kernel.org
X-Received: by 2002:a05:6102:4bcb:b0:632:73ad:6c4 with SMTP id
 ada2fe7eead31-67c7294dbbamr10996229137.8.1779878610039; Wed, 27 May 2026
 03:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260505120153.680979-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260505120153.680979-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 12:43:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+6qVRJGUVe9noYWRnG1nEeq9SPJYnwsbOEpG1osaBVw@mail.gmail.com>
X-Gm-Features: AVHnY4I078iHs0rk4IwqVKZLKVIlEqIe2R4RXj6eXob3wzbESQW-hndXolsiWAA
Message-ID: <CAMuHMdV+6qVRJGUVe9noYWRnG1nEeq9SPJYnwsbOEpG1osaBVw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-33202-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.4.147.224:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email,0.0.0.0:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,1fb000:email]
X-Rspamd-Queue-Id: EE9425E2E57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Tue, 5 May 2026 at 14:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.
>
> The xSPI0 controller is connected to an MX25LW51245 octal flash device.
> Although the hardware supports octal mode, configure the bus width to
> 1-bit (x1) mode. Enabling octal mode causes the BootROM to fail loading
> the first-stage bootloader following a Watchdog Timer (WDT) reset.
>
> The xSPI1 controller is connected to an AT25SF128A flash device.
> Configure this interface for 4-bit (x4) mode to utilize the available
> data lines.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2025 Renesas Electronics Corp.
>   */
>
> +#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/net/mscc-phy-vsc8531.h>
> @@ -20,6 +21,8 @@ aliases {
>                 mmc0 = &sdhi0;
>                 mmc1 = &sdhi1;
>                 serial0 = &sci0;
> +               spi0 = &xspi0;
> +               spi1 = &xspi1;
>         };
>
>         chosen {
> @@ -331,6 +334,59 @@ ctrl-pins {
>                                  <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
>                 };
>         };
> +
> +       xspi0_pins: xspi0-group {
> +               clk-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(5, 1, 0x1c)>, /* XSPI0_CKP */
> +                                <RZT2H_PORT_PINMUX(5, 2, 0x1c)>; /* XSPI0_CKN */

XSPI0_CKN is not connected to the OSPI FLASH (zero-ohm "DNF" resistor!),
only to the HyperRAM.

> +                       input-schmitt-disable;
> +                       slew-rate = <1>;
> +                       drive-strength-microamp = <9000>;
> +               };
> +
> +               data-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(5, 6, 0x1c)>, /* XSPI0_IO0 */
> +                                <RZT2H_PORT_PINMUX(5, 7, 0x1c)>, /* XSPI0_IO1 */
> +                                <RZT2H_PORT_PINMUX(6, 0, 0x1c)>, /* XSPI0_IO2 */
> +                                <RZT2H_PORT_PINMUX(6, 1, 0x1c)>, /* XSPI0_IO3 */
> +                                <RZT2H_PORT_PINMUX(6, 2, 0x1c)>, /* XSPI0_IO4 */
> +                                <RZT2H_PORT_PINMUX(6, 3, 0x1c)>, /* XSPI0_IO5 */
> +                                <RZT2H_PORT_PINMUX(6, 4, 0x1c)>, /* XSPI0_IO6 */
> +                                <RZT2H_PORT_PINMUX(6, 5, 0x1c)>; /* XSPI0_IO7 */
> +                       input-schmitt-disable;
> +                       slew-rate = <1>;
> +                       drive-strength-microamp = <9000>;
> +               };
> +
> +               ctrl-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(5, 3, 0x1c)>, /* XSPI0_CS0 */
> +                                <RZT2H_PORT_PINMUX(6, 6, 0x1c)>, /* XSPI0_RESET0 */
> +                                <RZT2H_PORT_PINMUX(5, 5, 0x1c)>; /* XSPI0_DS */
> +                       input-schmitt-disable;
> +                       slew-rate = <1>;
> +                       drive-strength-microamp = <9000>;
> +               };

As the three subnodes define the same parameters, you can do without
the subnodes, and keep all pins together?

Don't you also need P7_5 for XSPI0_ES, and SW5-6 closed?

> +       };
> +
> +       xspi1_pins: xspi1-group {
> +               ctrl-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(1, 0, 0x1c)>, /* XSPI1_CKP */
> +                                <RZT2H_PORT_PINMUX(1, 1, 0x1c)>; /* XSPI1_CS0 */
> +                       input-schmitt-enable;
> +                       slew-rate = <1>;
> +                       drive-strength-microamp = <9000>;
> +               };
> +
> +               data-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(1, 4, 0x1c)>, /* XSPI1_IO0 */
> +                                <RZT2H_PORT_PINMUX(1, 5, 0x1c)>, /* XSPI1_IO1 */
> +                                <RZT2H_PORT_PINMUX(1, 6, 0x1c)>, /* XSPI1_IO2 */
> +                                <RZT2H_PORT_PINMUX(1, 7, 0x1c)>; /* XSPI1_IO3 */
> +                       input-schmitt-enable;
> +                       slew-rate = <1>;
> +                       drive-strength-microamp = <9000>;
> +               };

As the two subnodes define the same parameters, you can do without
the subnodes, and keep all pins together?

And SW1-6 must be closed?

> +       };
>  };
>
>  &sci0 {
> @@ -395,3 +451,82 @@ &wdt2 {
>         timeout-sec = <60>;
>  };
>
> +&xspi0 {
> +       pinctrl-0 = <&xspi0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       assigned-clocks = <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
> +       assigned-clock-rates = <50000000>;
> +
> +       flash@0 {
> +               compatible = "jedec,spi-nor";
> +               reg = <0>;
> +               m25p,fast-read;
> +               spi-tx-bus-width = <1>;
> +               spi-rx-bus-width = <1>;
> +               vcc-supply = <&reg_3p3v>;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       partition@0 {
> +                               label = "bl2-0";
> +                               reg = <0x00000000 0x00060000>;
> +                               read-only;
> +                       };
> +
> +                       partition@1fb000 {

60000?

> +                               label = "fip-0";
> +                               reg = <0x00060000 0x007a0000>;
> +                               read-only;
> +                       };
> +
> +                       partition@300000 {

800000?

> +                               label = "user-0";
> +                               reg = <0x800000 0x003800000>;
> +                       };

Given this is a 64 MiB part, I assume the reg entries are correct,
and the unit-addresses are not?

> +               };
> +       };
> +};


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

