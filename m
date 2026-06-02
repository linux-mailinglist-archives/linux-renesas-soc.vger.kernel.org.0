Return-Path: <linux-renesas-soc+bounces-33416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDscFiy2HmrZJgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 12:53:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27662CF88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 12:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B6943037E53
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 10:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C04367286;
	Tue,  2 Jun 2026 10:46:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291A8371056
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397160; cv=none; b=GGuwkKxfDZU/XtleNWqcgWtB6bTn8w/XwfCnNv1A+C8O5B+KwDCNK41KmXGkxCdZR9tAfFrxJWdp8FhSlbgNn1Tizry7p9mkSNtas997MPcTTgk6BxPl8C33mlzCUX0Ps2F+g4m931uDvPYnudF/wBYe0dX+jaeLVbjexbD3d5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397160; c=relaxed/simple;
	bh=m2OLyRHEzfiH1If3842QvlE2x2DkDa+BCMu7OEfVKso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LguoLC3pcESYkcqSRmUG1mMvOZAXKl1afR7Mn4vbHWBgDW52W+e1Jq2dEP/DT+KOIQc27yfbLYA8YC1Ze3I0qcdjPS4TG+EpKazm7M7NPnYV4y9HroW2aFhv6ztnpr9qcHAFFJzUEyGNY9d4l8eH9h5vGzANS3dayyjZ6y8dze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59ccf81e6feso1092478e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 03:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780397158; x=1781001958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k13AOr7bxtlzRyNR5p/riJSVMmAVP/2fDxhyixHG370=;
        b=GV7+A7/ajzzxoAids3bagpS0VsY8nWdMbBAwjGmhU3GWNrThMs/fs3x5YwsB8jWJl+
         PZMlhigPEatsEtlxZYXZkX9Hhwy8E+JyaO3LmHuhRv4J2IYMBt8Ny0APKNr2IG3NpqSF
         B7CNt5dBXbE+NPn8LbDG/LDpIjfFzxTTlWZRQM9kqlWQTZe/mzW04p9vBJ8unPUZwEoI
         5JtTbXtKcsIOUGghqInTbRqx7t5wu2b/9ddHhH718uF8qhLBiaoio79ByfxVVSYDUGJH
         9nxPVC0NxCI/cjlv3BW1WckY/1sRlmggp4YIIkQeBiW6khNtSS180qq2k0CPRa1oh/Cz
         hi+Q==
X-Gm-Message-State: AOJu0YwHglydTgbaAFrR5bv7zRH8S4JsDPNCc0iTu7dhFNPBd98Dzvx8
	ZOr+ga1k9t0XhJ47QoChmq3PBrIYdWpbUrDJmRDDSNJMb+ItT6snlu60g/W6kip4
X-Gm-Gg: Acq92OFejrDfQtA5j52pueEoEe3LLqDexaL2mHYNEzyqPpgUXtEq+EOkJwvSLcgqHTs
	eaaDhFjUTCnJ5NZBwjipcwSXO9gmDJRlmKF59dQ/T/Qm3qOMtkmkuYcqU1/tB4s6UTk7iPbxlAW
	kXrh9r49QzSNRTq7P9I2rg8QaZVYQ+aWkK/+iNFSVo8BYm3SI8OXjin/pVe4fSq+ybisZ7wI/BJ
	WI73BXADf3u3aZPvzY20lXyOClmABFRBuQ6KrRB5BKMS4ze0b1sslEeQrvm5Ppr1jB+kQBGNPrk
	0OXpTh3G4lyQAG627wzM5OpRDUD47X+y2RAzizb/4/2yOImdofl5Otqk/BDPz56gtynYGDTFy9R
	t86NJWsUPkNgPX5aoxva/xNshN/iu9g7YlAQnKbzVY9UQNlPezeve/qm04GOqhRm9WvVyPTVFRI
	ZZU+BtZApvE7wwcnhYxlYEbTDcafcXIUZzMr0tDR6xQ3jUSrpW5UGI3uKaU22xxkod2VI+/lWO0
	fdde1tqGg==
X-Received: by 2002:a05:6122:1e09:b0:575:24a9:78da with SMTP id 71dfb90a1353d-59bf52e4d02mr6326920e0c.11.1780397158187;
        Tue, 02 Jun 2026 03:45:58 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-59b02af204esm9400788e0c.5.2026.06.02.03.45.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 03:45:56 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-96387977596so2045121241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 03:45:56 -0700 (PDT)
X-Received: by 2002:a67:f0cc:0:b0:6d4:ba3e:bf97 with SMTP id
 ada2fe7eead31-6d4ba3ec953mr3380461137.4.1780397156313; Tue, 02 Jun 2026
 03:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530080340.24715-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260530080340.24715-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 12:45:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8gGvjTPat-7=r3q-bXgQJU=A2DsDEPXZy6k20_JKx9w@mail.gmail.com>
X-Gm-Features: AVHnY4L7BRTCvrScNJxSzK89y_cx_oaLMyrwYaCieTPGajQeUgjKit7WoEbSICA
Message-ID: <CAMuHMdX8gGvjTPat-7=r3q-bXgQJU=A2DsDEPXZy6k20_JKx9w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: renesas: r8a779g0: add MFIS node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: AF27662CF88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33416-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,e6260000:email,mail.gmail.com:mid,e6460000:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Wolfram,

On Sat, 30 May 2026 at 10:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Describe the MFIS core which is used for various tasks including
> inter-processor communication. Interrupt numbers look irregular but they
> all work as expected on a Renesas R-Car V4H SparrowHawk board.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -589,6 +589,23 @@ tmu4: timer@ffc00000 {
>                         status = "disabled";
>                 };
>
> +               mfis: system-controller@e6260000 {
> +                       compatible = "renesas,r8a779g0-mfis";
> +                       reg = <0 0xe6260000 0 0xf000>;

Why 0xf000 and not 0x10000?

> +                       reg-names = "common";
> +                       interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 916 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "ch0e",  "ch1e",  "ch2e",  "ch3e",  "ch4e",  "ch5e",  "ch6e",  "ch7e",  "ch8e",  "ch9e",

This is way too longer for a single line, and the double spacing
doesn't really help (yeah, it does align ch1e and ch11e...).

> +                                         "ch10e", "ch11e";
> +                       #hwlock-cells = <1>;
> +                       #mbox-cells = <2>;
> +                       status = "disabled";
> +               };
> +
>                 tsn0: ethernet@e6460000 {
>                         compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
>                         reg = <0 0xe6460000 0 0x7000>,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

