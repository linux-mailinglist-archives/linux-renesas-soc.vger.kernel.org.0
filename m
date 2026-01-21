Return-Path: <linux-renesas-soc+bounces-27198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIcvNNHTcGkOaAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:25:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B28D577DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 12B246872F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 13:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC12E3ECBC2;
	Wed, 21 Jan 2026 13:05:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67D33B8BCE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769000732; cv=none; b=PCVscc2McFFTUuC4Na+Zc8RTcdjRj9RwLxlPjTzcpnomYPWYRuu8En32Ej5MrBChFyR8s71GxFCz5TLZlHftsvRbEyWxXsQYZQXYlJONS0ddIIiPfwqwL/NpZ8/9nOxfeUsAasXeVxZ/707zRhDeXRXSJqKhCZ36Tr1hshmMChI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769000732; c=relaxed/simple;
	bh=j8PC4pp7q4XqmAMgoxQaxoyOtd/ScknE0VUhZ+nF6PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLCwDserK92uRa4k2ZJO4CRWg++dsAZ0CS50nYrwEoofkxi45lojN9DmHEh520Yjb78r8jwdL80zWleYpS/hJTJXbMPD9XGOw3dDoIZV8YuFvmcQMk5WtfHKfPoo/aRtWcw+9NEszWiAPFaRLOYGwEiVrUyNahH0lQ1fPnXUE34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56373f07265so5267162e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 05:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769000730; x=1769605530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUN0ATaibuRMMulyetCQrbYYx87LKLd1aVaMdSlzKFY=;
        b=ttXLpP3+ywL+zlZ1eHgOKCp4y7rghFpqVuyYPfebbTxn8Km21nWY6sUOJkPbQF9OBs
         TCTrEeI8TjdefVuN/87oSPXHdOMInFPJAGNFbgf07GH7+Z12ZUmtvvFYgbWtcVI+SimI
         bsWAaIsmMsqst9z/9iHExDaxRt6sYJ8Ln1ARbJ+t7jEzP2Ua0Qx70pQfow+wnPT4o2rM
         x0bGBf9dOr+sQplrV8fThmbIIf4cFLw3JL1FQfk8T5kndlaSB5Hl1gwXkdmp0r4TWBy/
         XeM+dIZAqCovyIxdmRebvoU7j8PbolQSxjkAboRhsVWeHGpMP9AfvSG0lxPs22iX7SOZ
         s8GA==
X-Forwarded-Encrypted: i=1; AJvYcCVRR9ZR5Iq/ZMDEIilUWJpIp//WqKSeh+bdlId5aYRbm1FE/dQLQftt7LXF/816JYA9yJxM5ambut4Kl5Vu2icpQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBmdYs6fZ6CdTKR29Gq4zig7pJYX8rahJNkjuu3IVVuTYRNs2n
	paOtGyiHFyDkoPP2II1hxBtqzL0O4I1O5WbEqpKfLBHaVpE/3X1OqT9q2/duK/XX
X-Gm-Gg: AZuq6aKa8SibczGKjBKmFMaDkNdzSxmXcXx3K8ARvt/AlAq7W7bH3IipGM8Ff9rYavJ
	3xHh0PzbLaVK7jSB6Fokv2MX3bRWdDz6aQF1FFr5yzOFHY77Ufcfci1aEWy51GdciefIeJXQ2mj
	Y18KMZsGWvxN2zKzihQZXeZHP2WKoju/maIZsXlhBb0BGDC8gteD7e3iH5/nUZJPlqZw/de+BZW
	qXU4UUduVmBaFfMn09gxjHV/fMxyeC+LtGGTrzmxqVyWJTq0Y7mnvGcOTQFgzvsl1a+OjACCyiS
	XkVzpriwurOW1gj5k/OfVK9V+miKXRz2X0Z7k9+jm3b3aLsJWmUNmrrKiLoz5Uows85mIy3fZTj
	oGXUHt7CtI1HV50RttsjDMuElByDPjD551dp9T66snhKa4Qj6SABmfB8dYMFa8UXvfYEOfd4Xng
	VH4BamD0D9dDjtvyPB0bUXUAVfl52V199MtT3QhjaI72dUKgSN
X-Received: by 2002:a05:6122:d21:b0:537:3e57:6bdc with SMTP id 71dfb90a1353d-563b5c63436mr6254688e0c.12.1769000729679;
        Wed, 21 Jan 2026 05:05:29 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b6fddedesm4098388e0c.1.2026.01.21.05.05.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 05:05:29 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-93f69720a7cso4120419241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 05:05:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUk2MgFkBoo6ukszjC/CggzhGv7dFI6tzYg9IvZOey3o4o0IHHv4X/ZPf99Dyy7qX3lhg/qvvlpubf9bX/NtGI1uw==@vger.kernel.org
X-Received: by 2002:a05:6102:d92:b0:5ee:a04c:7ea8 with SMTP id
 ada2fe7eead31-5f1a4dbb696mr6218862137.11.1769000728518; Wed, 21 Jan 2026
 05:05:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com> <20260120125232.349708-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260120125232.349708-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jan 2026 14:05:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVvtDs3xKwMODJ=8gHr4qWt8Lw76WNd-kPyDVNyV3xUEA@mail.gmail.com>
X-Gm-Features: AZwV_QiROaW1wh1OkD-aFEFoPkxT5s3KSbKqPsYjMai8dImdmwDx3jlnBNjf3BQ
Message-ID: <CAMuHMdVvtDs3xKwMODJ=8gHr4qWt8Lw76WNd-kPyDVNyV3xUEA@mail.gmail.com>
Subject: Re: [PATCH 09/12] arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.26 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27198-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 7B28D577DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 20 Jan 2026 at 13:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the initial DTSI for the RZ/G3L SoC.
> The files in this commit have the following meaning:
>   - r9a08g046.dtsi:    RZ/G3L family SoC common parts
>   - r9a08g046l48.dtsi: RZ/G3L R0A08G046L{46,48} SoC specific parts
>
> Added place holders to reuse the code for Renesas SMARC II carrier
> board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -0,0 +1,219 @@

> +       soc: soc {
> +               compatible = "simple-bus";
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               scif0: serial@100ac000 {
> +                       compatible = "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
> +                       reg = <0 0x100ac000 0 0x400>;
> +                       interrupts = <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "eri", "rxi", "txi",
> +                                         "bri", "dri", "tei";
> +                       clocks = <&cpg CPG_MOD R9A08G046_SCIF0_CLK_PCK>;
> +                       clock-names = "fck";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg R9A08G046_SCIF0_RST_SYSTEM_N>;
> +                       status = "disabled";
> +               };
> +
> +               i2c0: i2c@100ae000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0 0x100AE000 0 0x400>;
> +                       /* placeholder */
> +               };
> +
> +               canfd: can@100c0000 {
> +                       reg = <0 0x100c0000 0 0x20000>;
> +                       /* placeholder */
> +               };
> +

Early feedback: depending on when this goes upstream, we may
need a few more:

+               ohci0: usb@11e10000 {
+                       /* placeholder */
+               };
+
+               ohci1: usb@11e90000 {
+                       /* placeholder */
+               };
+
+               ehci0: usb@11e10100 {
+                       /* placeholder */
+               };
+
+               ehci1: usb@11e90100 {
+                       /* placeholder */
+               };
+
+               hsusb: usb@11e30000 {
+                       /* placeholder */
+               };
+
+               pcie: pcie@11e40000 {
+                       /* placeholder */
+               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

