Return-Path: <linux-renesas-soc+bounces-14391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7199DA615C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 17:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0061F7A3D05
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFF21FF615;
	Fri, 14 Mar 2025 16:07:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACE91339A4;
	Fri, 14 Mar 2025 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741968436; cv=none; b=tuFd30o1eRgCq4o/tWjVvrEW0ZzdzlxPqGT+OAkTOgsiyH47cRPcslAerWBT6TgLOam1/VUoQKpAoJwO3/fkf7RnrTZsJvI457vhdvewtJ+omZL7oR+d7winYVsuBBdbTg6FP91gtdoADvKmQyEv6sOMtcuXT/Bzp+IjjpGJr20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741968436; c=relaxed/simple;
	bh=ueYcQebqj5dvSuKz/XDVozjbPZ97i4jpeckMhlXamfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuqZjB2aBJ8PeN0BBlKXlYFDYPX3E81s4QnvZPRDauFUvl5OgTLv5B99WecumlHTfc/GJFH8M8U4E+0lR3+9qXWLyeeEBmSzpWaZbkl3DpXnfbMudMJCccW8zOShrSa10S4GiFeV9cFm0HFZyAeTdMTRIZ1ph+x3b0Sw7+oXNpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476af5479feso22981431cf.2;
        Fri, 14 Mar 2025 09:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741968432; x=1742573232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+kUAFJlKsHeNQB3aXZYLf8uXmj2ju8FKbQeqZ7v9pk=;
        b=by5zbpgVayCjARBRzKVtA97EUOKsbE+FLqvC1uuJ8x2GaxwqPVzQSAbTPo0SmYzbXC
         GNmsMEnHrHDK6sh+frmIAEXGTm1vaDTHonxe4Jx+HQX3A8EuKxjHGTw7D4atMzpgT3bS
         9wn8ArkaojyyQWxgO27XnMUDqZegITRLD833J6u5hd0Y6292JJBQpHArDNhsIpUYccVd
         m1/ZITvmdPhtgOgnK02mCM9fKgv4wz5IuToe8LSm9royo9fIUZYMQ/OBdEpFyQyE+V5Z
         pUAHDdXtDkHDMvp8uvDKa/SQYNV7z21lY9bWNeTyD3F1Cc71CTzJTnPlYZ3V5ylB/lqr
         uhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6CDTbY1Cssm3IA7/SWqioeaehRw8dwy3Xe4wJs/DUBxkvW4NmN83W3XQqptZSmYjyjhabcUw0cebA++yGxgy4w1A=@vger.kernel.org, AJvYcCXvY1QobgoZKHZ5E+EtcWvnHKLcou3LUwjZa45oHZwfzARm44ssamFQE/NIAss5r7TwnxPIqXrygW2H@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvvh7DbHSlU1ae2hEKaIp9gJNa5GIqxCuJEMWncDhzvAoyH6hH
	CvBRBaZwPOdzmHhKybc0FKWW80m4aB43A6O23uPDBO0jcL5nRuLaDgVXc1Dw
X-Gm-Gg: ASbGncvytVpIsWjUs5FFYAKnZuwAhsr3ig45Lgb1iz1PVaDmruFSWhKbZyVoUmATK7j
	ZKB3QMxlQcX5FTlO33bWKVN2wsqLZCT/s8FrpZZrPHlFrNaxSaviIsoXZJJW8hsDRd2vMn7etl7
	/Goc/vDiO2xhp51B+DEr8z/9EfN7wfO8K5nG62o7H7hb3rJC85LUeUBgPAhQ9fJD496lVRc/89P
	bWto3lUPHr6yBBiSOqMyCXrFct/vvHCkDfmuAVf12p617ACyQzerWQW+QBdocIfj5yHH6SGyaFk
	QnlyeVbKjKp62fJc/8pmb+mah1nGsIYHNjztDos6g7Ta5H6Oi6MGEDIJxHu7HC4jCssRl5H3JU5
	LXEMAHdUaUTi7bWiljg==
X-Google-Smtp-Source: AGHT+IF1Is4lHCMIZH80b35gENezqi1teKaDb8zBKP5/Jl9saW15jyOTwNXrgaxZeLw7eRkRLYbybg==
X-Received: by 2002:a05:622a:1654:b0:476:9cf2:d907 with SMTP id d75a77b69052e-476c820ba15mr45222541cf.52.1741968432628;
        Fri, 14 Mar 2025 09:07:12 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-476bb6735d0sm25202111cf.44.2025.03.14.09.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 09:07:12 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8ffa00555so19476956d6.0;
        Fri, 14 Mar 2025 09:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIbxO6d+kjsUnweZdvaSYvVaZ9TqVj8o7NCne4AhGLZbBIR0FCUTQUafA/r3AI7VNs33oPmYv3AutK@vger.kernel.org, AJvYcCVsRaEk/+B7pk3ZcP6Z8jP7ugPz8QthaNU6LTSJHghYID17cz8bNTgd18t9DLvg1NSsX0+Pz2+rAd5Cbge5sxyDiaI=@vger.kernel.org
X-Received: by 2002:a05:6214:27c9:b0:6e8:9dc9:1c03 with SMTP id
 6a1803df08f44-6eaeaa64668mr49630456d6.21.1741968432074; Fri, 14 Mar 2025
 09:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218105007.66358-1-biju.das.jz@bp.renesas.com> <20250218105007.66358-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250218105007.66358-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 17:07:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi9_GnTbBwSCyfmEFN-eV1okSBLKNgb7OQ3z7WTb4-Zg@mail.gmail.com>
X-Gm-Features: AQ5f1JrKL8kY96OZT6cWD6BUWt-6w1BEjpHx0C8va_AwHlfW7jfM6oIoUvofDlA
Message-ID: <CAMuHMdUi9_GnTbBwSCyfmEFN-eV1okSBLKNgb7OQ3z7WTb4-Zg@mail.gmail.com>
Subject: Re: [PATCH 10/11] arm64: dts: renesas: r9a09g047: Add CANFD node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 18 Feb 2025 at 11:50, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add CANFD node to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -272,6 +272,68 @@ scif0: serial@11c01400 {
>                         status = "disabled";
>                 };
>
> +               canfd: can@12440000 {
> +                       compatible = "renesas,r9a09g047-canfd";
> +                       reg = <0 0x12440000 0 0x40000>;
> +                       interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 698 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 704 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 713 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 714 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 701 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "g_err", "g_recc",
> +                                         "ch0_err", "ch0_rec", "ch0_trx",
> +                                         "ch1_err", "ch1_rec", "ch1_trx",
> +                                         "ch2_err", "ch2_rec", "ch2_trx",
> +                                         "ch3_err", "ch3_rec", "ch3_trx",
> +                                         "ch4_err", "ch4_rec", "ch4_trx",
> +                                         "ch5_err", "ch5_rec", "ch5_trx";
> +                       clocks = <&cpg CPG_MOD 156>,
> +                                <&cpg CPG_MOD 157>,
> +                                <&cpg CPG_MOD 158>;

Please use hexadecimal module clock numbers...

> +                       clock-names = "fck", "ram_clk", "can_clk";
> +                       assigned-clocks = <&cpg CPG_MOD 158>;
> +                       assigned-clock-rates = <80000000>;
> +                       resets = <&cpg 161>,
> +                                <&cpg 162>;

... and resets, like is used for all other modules.

> +                       reset-names = "rstp_n", "rstc_n";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

