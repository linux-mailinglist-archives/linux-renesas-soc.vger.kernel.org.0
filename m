Return-Path: <linux-renesas-soc+bounces-33207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHsKKr3lFmruvgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:38:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD55E4466
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD2E6302225A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA183FF88C;
	Wed, 27 May 2026 12:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ro1GsPx7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222BA3FCB09
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884796; cv=pass; b=dGwPlRIX8sI+5VbToK5O3U7AEXa2zoY1gDGHlXX85vCSxiYAmwrIalXWNZpk3XCu8TYgBFlTQ/bttr915QLQfmNn0qhWLKSaVUYa5K5nLkvVL6ia5LfH9axbf2IVS1ypBSFCvNdrVuWcYzZQv0SOuYg+hpGenNf0Oxedr9iFWo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884796; c=relaxed/simple;
	bh=6ZMU4lW6pYzhBZFEupznRgcRzfwIjb09StuSviQb75I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmFgUzwhBNR+2oLovECpEBowLtMoZaJ4dbhSYf1451R1qIf03F4s7EkpuHoBsOEWZW0YZiw6I9GbWJlBDaauePBoK5qb8tw646Zv+hPVv8eWlaFDpYMTqry0VpSkqUvIEG4ION8A85RM3pyXdztVu/W9A3cz235ntR3//QdxR8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ro1GsPx7; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ea19f412aso3714454f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 05:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779884791; cv=none;
        d=google.com; s=arc-20240605;
        b=GoKOmKAhoYdLU/NjXPMwt1Ku8pWhAkgCV7nRiOvUXAec3a7WfUpN1fTxuTD94w28iL
         8pi9Bc+XdBov4ZQKDEEMTzUKo/+tPLk7FAAYWVDXNQyfs7Royx2MS9NOadL452WBeNk0
         CLrUsVSi4brBD00tyNDj4/N6IRN884KyUck7L1xHBa0Mx3sQ0os8AaZ7Gocj8RVgIdwr
         ods4N4c+cXogDH1VyqCcz0B0W2IHoQHmV7t/CYVF+0L5t02CTRSm6Qh5XolqUKz0sPo3
         dlXTrRkyXLqJTJUM8sX8HrjcWa6ApqzHU4L0mfQXviMc51MfFQevj98ga+GFdn+pE9AS
         rraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0unYbIUfrk39HwFjBZy82CeKdBA84Qzv0p5UdmWw7Mk=;
        fh=YKIaRO7E9rRUAmYK4Pm08cE7IVQ/kYfV+soPo53h9eE=;
        b=Q7BM3GeEyqPW5i7FseqaGy9Xuyl0Z7fOmY35uyVIzb0Jqj036Xp3P1MJ3Y2kJr0GwA
         fsylEwif2TS5Wh8P/8ya7gDuPXn9NzJetIjG6dBLZfKvMND4eRLSNk9Fi3VarrZIzirE
         McBzAc8kibpkkLhX0TGZ9NpSlCdruVKo+MLas/PjPESbGcNfhHrxng2UCNhFWSi1N81B
         8a0/MXsIlxjGZgRjWwdNmjlgCykEtyMrKfmmxw7e8EqTp3hXY3KPb0Z2GROWJObSKJLh
         wQTxj9QgmNq9Y+4QD80BDPw1/53Dn2bASQRyID5abrT5QpaDDDOpKfdIJyPz0aoOYBV2
         uWuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779884791; x=1780489591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0unYbIUfrk39HwFjBZy82CeKdBA84Qzv0p5UdmWw7Mk=;
        b=Ro1GsPx7NSysyHsNIkceFw9DnbgIyzl6xXhF9rFe8VJ/6L1XkDeSlPSlstQ2U+ZAt3
         XbvA3EhFKsR85z0uy6XZLblornfRuGe/ZbzqF7VZ5yxg2Bjgg9xOS2HbWZBdOvdG8gwT
         2nKSeSwFAZD4ugNtMED5aamFGJw+7RvAfpicbicQOPj+1PKcPMLbIiA9mM9w7UG8LZIW
         PYah9ArBt0swN83uaJI/CR8NWOyJiGeoZiU92KNp1zWM/B8e00DKNTl5mMxOrdfwn6r8
         QL6qzPXq5DrzVQy6L7RUPs+2fgZe0tbs5btZdzHTa4EkWhXy9Mx+4QaYmVlr9KS9vc+3
         S7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884791; x=1780489591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0unYbIUfrk39HwFjBZy82CeKdBA84Qzv0p5UdmWw7Mk=;
        b=YW9Pz8shqK+DN2xUTD1wlK4H53SF99A3MDCz0od27kNcREm8annZMmAEpVHxTZFSWZ
         xF+UoHqdMkhGLavmoWcjV/Tyhmr6kzckTzEA+ZHGGLJ8q4oWbMuRJ90xF5O4Q+8oqgoi
         8HfO1g38JeqBF4w+QaOc1mtjyLEIgQRs2XXb/3ZHM0X7i+qAbZvgA+iLewiyulXdMjbm
         hHGep736DU9b+H3kvcJYQPV0fNau+fsi7lpJIw0DQQos5fhJrrG7T6Ykptn1KrO/Ye4W
         j3PrPCng650iXo6GPuLqi/HGTgfR1354fCoypsoVaqt9LxHivKfKzm9P6cy3wX82204y
         hOjw==
X-Forwarded-Encrypted: i=1; AFNElJ836U2bWTSRX2T1iQXGBylTb6DOiBYm/sf9aqmSPZcWsQ36ntyXiaSUT2EjMHZ/HfrUIGlNxhN+hSrSHUCdrj/y0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyinxCtSzueyy0wBTWBZPzjAxwpAZcCQweagNC5nmZxldeYCeDP
	u8YnW6f/OXenGlU/HG9UTo4RvZG0jBkVFfQyLJo75xUTHfgfrkcfS6zjbWVHaLI6vXLvayIixYl
	ZqWckjqpjoux1UPa2OaP/wBb0uK6XNLY=
X-Gm-Gg: Acq92OE3fIxcK3aQe1f3+N0GWqgQfRgzuYE9jufIPWcHQFm4GtjcYpTYkvdmUVoexAC
	EtBU8AqssF1sBYYnSy2lzvfyRprc7+Jg4ouJFEskE+U98uW/6A3qpaYJFEvoLiTAWJQF6MT46xo
	30Xkdnr6hZYhNZxvhJXPUhC7IYkt5N9ad0wYbz6vVu7CYzVQqr1DSQAFQOInhWlEVxqF/Az5ufR
	gNRGDlejh8H8j1ptS6EDJQaCMZBdtWI0U7HuunUSs0yTSh84JNXwbDI6dFozz5y4rpHPFlFJJ/G
	Ba5OYyUYHQCynKV6LB3QTIASP1Z9SCSVXPoyRxi15GhyS1uFtwf0sjB2nA+xlgRdCHPN+LM=
X-Received: by 2002:a05:6000:25f6:b0:45e:9115:2982 with SMTP id
 ffacd0b85a97d-45eb38d8177mr37043341f8f.34.1779884791248; Wed, 27 May 2026
 05:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260505120153.680979-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV+6qVRJGUVe9noYWRnG1nEeq9SPJYnwsbOEpG1osaBVw@mail.gmail.com>
In-Reply-To: <CAMuHMdV+6qVRJGUVe9noYWRnG1nEeq9SPJYnwsbOEpG1osaBVw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 May 2026 13:26:05 +0100
X-Gm-Features: AVHnY4JOosN5hDdtlUJOoB80nqu5nBarbvLX9T5TFXyo0j4X995ZvK_F-UFaGJM
Message-ID: <CA+V-a8v3+aK-+peT1G-raBMBKBshscc=pJh4mDgbTEhzpHHBYg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33207-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.4.147.224:email,mail.gmail.com:mid,linux-m68k.org:email,1fb000:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,0.0.0.0:email]
X-Rspamd-Queue-Id: A6FD55E4466
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Wed, May 27, 2026 at 11:43=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 5 May 2026 at 14:02, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.
> >
> > The xSPI0 controller is connected to an MX25LW51245 octal flash device.
> > Although the hardware supports octal mode, configure the bus width to
> > 1-bit (x1) mode. Enabling octal mode causes the BootROM to fail loading
> > the first-stage bootloader following a Watchdog Timer (WDT) reset.
> >
> > The xSPI1 controller is connected to an AT25SF128A flash device.
> > Configure this interface for 4-bit (x4) mode to utilize the available
> > data lines.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2025 Renesas Electronics Corp.
> >   */
> >
> > +#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/leds/common.h>
> >  #include <dt-bindings/net/mscc-phy-vsc8531.h>
> > @@ -20,6 +21,8 @@ aliases {
> >                 mmc0 =3D &sdhi0;
> >                 mmc1 =3D &sdhi1;
> >                 serial0 =3D &sci0;
> > +               spi0 =3D &xspi0;
> > +               spi1 =3D &xspi1;
> >         };
> >
> >         chosen {
> > @@ -331,6 +334,59 @@ ctrl-pins {
> >                                  <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* S=
D1_CD */
> >                 };
> >         };
> > +
> > +       xspi0_pins: xspi0-group {
> > +               clk-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(5, 1, 0x1c)>, /* =
XSPI0_CKP */
> > +                                <RZT2H_PORT_PINMUX(5, 2, 0x1c)>; /* XS=
PI0_CKN */
>
> XSPI0_CKN is not connected to the OSPI FLASH (zero-ohm "DNF" resistor!),
> only to the HyperRAM.
>
Agreed, I will drop it.

> > +                       input-schmitt-disable;
> > +                       slew-rate =3D <1>;
> > +                       drive-strength-microamp =3D <9000>;
> > +               };
> > +
> > +               data-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(5, 6, 0x1c)>, /* =
XSPI0_IO0 */
> > +                                <RZT2H_PORT_PINMUX(5, 7, 0x1c)>, /* XS=
PI0_IO1 */
> > +                                <RZT2H_PORT_PINMUX(6, 0, 0x1c)>, /* XS=
PI0_IO2 */
> > +                                <RZT2H_PORT_PINMUX(6, 1, 0x1c)>, /* XS=
PI0_IO3 */
> > +                                <RZT2H_PORT_PINMUX(6, 2, 0x1c)>, /* XS=
PI0_IO4 */
> > +                                <RZT2H_PORT_PINMUX(6, 3, 0x1c)>, /* XS=
PI0_IO5 */
> > +                                <RZT2H_PORT_PINMUX(6, 4, 0x1c)>, /* XS=
PI0_IO6 */
> > +                                <RZT2H_PORT_PINMUX(6, 5, 0x1c)>; /* XS=
PI0_IO7 */
> > +                       input-schmitt-disable;
> > +                       slew-rate =3D <1>;
> > +                       drive-strength-microamp =3D <9000>;
> > +               };
> > +
> > +               ctrl-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(5, 3, 0x1c)>, /* =
XSPI0_CS0 */
> > +                                <RZT2H_PORT_PINMUX(6, 6, 0x1c)>, /* XS=
PI0_RESET0 */
> > +                                <RZT2H_PORT_PINMUX(5, 5, 0x1c)>; /* XS=
PI0_DS */
> > +                       input-schmitt-disable;
> > +                       slew-rate =3D <1>;
> > +                       drive-strength-microamp =3D <9000>;
> > +               };
>
> As the three subnodes define the same parameters, you can do without
> the subnodes, and keep all pins together?
>
> Don't you also need P7_5 for XSPI0_ES, and SW5-6 closed?
>
Agreed, XSPI0_ES is needed (5: OFF, 6: ON). Since XSPI0_ES has
different DRCTL settings I'll keep it as a group but with only two sub
nodes.

> > +       };
> > +
> > +       xspi1_pins: xspi1-group {
> > +               ctrl-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(1, 0, 0x1c)>, /* =
XSPI1_CKP */
> > +                                <RZT2H_PORT_PINMUX(1, 1, 0x1c)>; /* XS=
PI1_CS0 */
> > +                       input-schmitt-enable;
> > +                       slew-rate =3D <1>;
> > +                       drive-strength-microamp =3D <9000>;
> > +               };
> > +
> > +               data-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(1, 4, 0x1c)>, /* =
XSPI1_IO0 */
> > +                                <RZT2H_PORT_PINMUX(1, 5, 0x1c)>, /* XS=
PI1_IO1 */
> > +                                <RZT2H_PORT_PINMUX(1, 6, 0x1c)>, /* XS=
PI1_IO2 */
> > +                                <RZT2H_PORT_PINMUX(1, 7, 0x1c)>; /* XS=
PI1_IO3 */
> > +                       input-schmitt-enable;
> > +                       slew-rate =3D <1>;
> > +                       drive-strength-microamp =3D <9000>;
> > +               };
>
> As the two subnodes define the same parameters, you can do without
> the subnodes, and keep all pins together?
>
Ok, I will drop the subnodes.

> And SW1-6 must be closed?
>
SW1[6] needs to be ON, I will add comments for it.

> > +       };
> >  };
> >
> >  &sci0 {
> > @@ -395,3 +451,82 @@ &wdt2 {
> >         timeout-sec =3D <60>;
> >  };
> >
> > +&xspi0 {
> > +       pinctrl-0 =3D <&xspi0_pins>;
> > +       pinctrl-names =3D "default";
> > +       status =3D "okay";
> > +
> > +       assigned-clocks =3D <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
> > +       assigned-clock-rates =3D <50000000>;
> > +
> > +       flash@0 {
> > +               compatible =3D "jedec,spi-nor";
> > +               reg =3D <0>;
> > +               m25p,fast-read;
> > +               spi-tx-bus-width =3D <1>;
> > +               spi-rx-bus-width =3D <1>;
> > +               vcc-supply =3D <&reg_3p3v>;
> > +
> > +               partitions {
> > +                       compatible =3D "fixed-partitions";
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <1>;
> > +
> > +                       partition@0 {
> > +                               label =3D "bl2-0";
> > +                               reg =3D <0x00000000 0x00060000>;
> > +                               read-only;
> > +                       };
> > +
> > +                       partition@1fb000 {
>
> 60000?
>
Agreed.

> > +                               label =3D "fip-0";
> > +                               reg =3D <0x00060000 0x007a0000>;
> > +                               read-only;
> > +                       };
> > +
> > +                       partition@300000 {
>
> 800000?
>
Agreed.

> > +                               label =3D "user-0";
> > +                               reg =3D <0x800000 0x003800000>;
> > +                       };
>
> Given this is a 64 MiB part, I assume the reg entries are correct,
> and the unit-addresses are not?
>
Yes, thats right.

I will address the comments and send a v2 for just this single patch.

Cheers,
Prabhakar

