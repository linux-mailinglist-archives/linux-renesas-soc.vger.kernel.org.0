Return-Path: <linux-renesas-soc+bounces-33200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJE7OJLCFmrOqgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:08:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 881215E263B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 618783003624
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 10:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C253EDAC1;
	Wed, 27 May 2026 10:08:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5E83ED117
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876494; cv=none; b=M43RtzmKIPFXCF9tX1wScgdI4TBaWJjqBBuhNiylair+2T+MWKMUHx+sKna+GGmhNGks5eY05TH+oZpUaEIZBV29c7wiHvPakX2yN0i3YtZFqosj3OeBNmRbtYqONcN+7pB1GtSiVp6pqQ4m5VmRT+9nBYA/ZxKOSCSoI1uEf2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876494; c=relaxed/simple;
	bh=6hY9Vz9TJ0DFiGs8pWaosNqxcImGcQZ24scRLtK1zv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmO0jPCAPXb6AFzRYMLntcQIqOtOMWKop/NKDC60FwMkgF66pV6lsRuIQp7XvLTIlGBhScvpVgKbRqY0Ik1lpgQC9oQkgN+TcXOFlYlQZ8zTbPBpzGUeezUUVolHkbtVccnxFvxA0KAxpSEXVUIinoDdiGUBz+JVARegxepEO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-575267e3398so9390307e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876491; x=1780481291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A7F/SHFPMTU6SyxAkGug4eEVpUKc/eZBV8/DN3UW88=;
        b=UDn66w6u9QjIBV8eSkbs3hULCScMTAAK0QHatef+ez3+lP3xFBpjaQaKNiyKWDQvSz
         IINLtmjkvmqJ4jXJ986a99QNnP/9/veleXD9vCItUcx1FvCGXaNRgjDigMCbkD/YN5zl
         2y36IusHALF79JRCCw1HVdWOz+k7M7FDoZrN6EI7ikwqi3VNzEPWNE2WxLcBYtadlokr
         SF/uB2EykoAGMtlB5MPWnjMsDcsBJ3bZSsn2Jt45nwnNHKwNVRnalz8AB8zdhL6VT9ju
         uNpy7C+csVeOfEhvLPYJE9YURHYRfYlCG9SRlCvfYFuqvLnOSapCcHWDw0SEYjBMkPlB
         5NVg==
X-Forwarded-Encrypted: i=1; AFNElJ/bamc3VjxLcTrNbZ8DoUIq9U2KXmwAG7F6nHG861T7aCL0qFAdknFSB0mr45Ii0UzlI7uFXHGpJTa9kTBQsWJpOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCa7er8XJ0N93jHw3cEhvCzoDr/gsmsH8HwdJ75QVyakpulKw
	iGwYST/tKc36pj7sOnL3iOQ61HqCjNHnftclObWVGm4DrD0o0Iw2RCD2I9tIeiNRIFg=
X-Gm-Gg: Acq92OGm9v3/tTty36+4t1lJPCXxyPBPxVELHOBMUvnw9aqVIEeefDDt5qkGHWjx3Lp
	if6DWQag3peN/2HbkSqtpy83Z0SNGLvjlkWhDZtCKJ60Xs6syDc5EEy09Iwka+2oNRgcRjSGT70
	4kv/9HvBRyfDPSX78P5AjJMZUc2ypsY0vD+uaA/b0Ps8PwH9o3Z4b6s6hMwHPafESjNZ3F6sJod
	DlRT4UETe2oKTy8uVBDAyTYwveiNVccohEvVX6z3Uj2KuCZ8Nl+qSitIHJeYWNHy85cWLYMlI3I
	jYT5jjyjK/htEWnwsSb55PyxxNkiDQMRa7xj+8CprqzDT2j7eR/1ASq9ZCZNZXIYGbwcwDe+oLC
	IWeLnSdG8YOSkjm5C+nlEk1Oy1L8WoDscHQqQwTTjNVC5aWXwAebUIRV/SlpVlI7tHrqsiMas4H
	/b4GvlS8ZooMiRWCb56CfZwbosU+9L6r8KCQHjdKz31wVqkGiXM5p64aXrYkyZKxhviYWh4jRmb
	RM=
X-Received: by 2002:a05:6122:da5:b0:56a:fcbf:8aa4 with SMTP id 71dfb90a1353d-5865ea8bfe4mr12675112e0c.2.1779876491595;
        Wed, 27 May 2026 03:08:11 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f973300dsm19836105e0c.18.2026.05.27.03.08.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 03:08:10 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5780c38ecb8so8365375e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:08:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fBmNxuQqpWg6m6/ZHgDeCOgluVtn8bzNDJc1F3IzL/IHNKNFUYiHIf4xmawCxAW1YjA+UkQEekMTEU2654MoGIw==@vger.kernel.org
X-Received: by 2002:a05:6122:e22c:b0:56f:bb91:4861 with SMTP id
 71dfb90a1353d-586595dd60bmr12472501e0c.0.1779876490353; Wed, 27 May 2026
 03:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260505120153.680979-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260505120153.680979-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 12:07:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDvM1NoU0fi+9dGZWcEyEmfni_P7NH2o3V5rK-OiNjeA@mail.gmail.com>
X-Gm-Features: AVHnY4Lo1my24GbBkVvFUOFa84YDZPTbBuqbQIY9AkUO4rL63yvmDby1451NxGM
Message-ID: <CAMuHMdXDvM1NoU0fi+9dGZWcEyEmfni_P7NH2o3V5rK-OiNjeA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add xSPI nodes
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-33200-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,glider.be:email,0.0.0.3:email]
X-Rspamd-Queue-Id: 881215E263B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Tue, 5 May 2026 at 14:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add xSPI (Expanded SPI) device nodes to the RZ/T2H (R9A09G077) SoC DTSI.
> The RZ/T2H integrates two xSPI interfaces.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -1006,6 +1006,44 @@ mii_conv3: mii-conv@3 {
>                         };
>                 };
>
> +               xspi0: spi@801c0000 {
> +                       compatible = "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
> +                       reg = <0 0x801c0000 0 0x1000>,
> +                             <0 0x40000000 0 0x10000000>;
> +                       reg-names = "regs", "dirmap";
> +                       interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "pulse", "err_pulse";
> +                       clocks = <&cpg CPG_MOD 4>,
> +                                <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
> +                       clock-names = "ahb", "spi";
> +                       resets = <&cpg 0x4>;

4

> +                       reset-names = "hresetn";
> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

