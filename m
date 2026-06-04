Return-Path: <linux-renesas-soc+bounces-33589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id acazJIR2IWqUGwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:58:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 950CA6401D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:58:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64D81306678E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 12:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EF247885F;
	Thu,  4 Jun 2026 12:50:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92147A0D7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 12:50:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577408; cv=none; b=gnqQhiCSnd2bCqVFtF7ddQq/ydEWnL/KCpnBVkUzkPuZPveUoNKKSvopoU4OUPSn3TGPVeQPPgg3YqzQykno8mBMuAfmHY1JQ/fOC4o92XZhredOmb/BReadPGISt+6Z8ZodDZiQdBtAqIxmQjX8pjQQXF6dZ4vhNUtpEpitnO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577408; c=relaxed/simple;
	bh=9+GSC26KP9x8VFStwlQNXOXJrB+sq+AeP2Y3FBXhgHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSxLWr3xU/SHtq3jkeMWUaH6ps9lsZqgBew8V+SULfu9pG4BD8IHG7gI9yNpv49wAeJGH5Zmc0QpV3cioU7Rr/nWalDfwjhs5xS4CCJ+mx5rdVYADdb6pKvbiM+ivEFCEkYF+pqGqDeKB1UC3dIoeuc7GoQBPcI2gkAmAdiIWKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.51
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8cce26ee1e9so9680826d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577404; x=1781182204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwkE2UGx4d0O/VfWYwU5eSId48QfcIZRSOkCnuIrTXw=;
        b=mdUe5IJ2MwE+wM5e+cS0wm33yWLlQ6MvrD+m225NmqXbOURkYBeDtbgxwNnnMXvSu3
         3CTWmpA/Ov9ogOEd7/KeclTe2w90ytpriq34MnkKfU2ph/MsT6zk2dr3NgVvQdyvlYLY
         352+yRJLGQTbVrGZVsV2B3fM9WI79IxKaSHFvEEmvXhCyaQayQB3muL9UnBc6gGaZ1l1
         fih++kf90lmJSlu9DRccPvDAH1nlzbHQ9NT8duF45aAzqdpE+GKVQE3D4Cspz6arrzL2
         saiWPH8/ejb5yg5CTkK9j9d71ujGCZPXN3GdyHbTbZWeuNxP4vue1Y4B3BsBP32W92ZI
         CxCw==
X-Forwarded-Encrypted: i=1; AFNElJ9D+wE4LJK+owLBJk5sv6rtJFFsMQ2tajarAwSyr3i2PG4xCrmlQVeB44oSby9dgSU/+xuZCGo5Q45YR3Syjc+ugw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyNSJ+kXSsE5IScQ08FqrLdI0/qDdF9NtV1fmaU0QQcwN4ZW0p
	96+PkdCc9kosMUSxsU1bYvaaduJek+bqA7DOpUBxSvFLd1irDy+EVJC2GWDldDae2jo=
X-Gm-Gg: Acq92OFFbHIm5G2d2+KPjwBNcOoAmpAKopnMYqIutZ5Jqyq2K+oJtjvHjshA7O0V3kf
	XNQmZbzVjNdx3WeiIRQybRj0Lix42HEL53kvhtsusXbn/6BokeX+fWjn0rU92WySTTnD9DYCNzN
	W/nmfIc8YkdcJRcIjmtVTXwKQ6FOoS7YQuCEdFpxUIgcHi6uaC3Yt7DIkESaepHzd2hg+41gyNw
	mo08DxGvUQgbD/IQGAVncV8DUm3DI0fz638DzR1GsQmMBK3AD9YTr3YnW8g7ptAco208j1iKGOz
	LW69U8NjxAsrwX4f/im2Os1l9j5TLxEY/iGef6tDj34gatIzcoqUMOOePhIdClK2AoDUqo3I40M
	j8JoEfj92Tg85RlXksgfBoLnTuT4Ai1xOIE64qTk6Ly6CBnjrVN3TBIrJsPlRpZNwF7kBcjmtAh
	hQ7YC3bMyfkAU1qnVmbrESz6PJmM52p7bzUIPj1dijvVvBucbhDuAKbv8PmlmN+24AbbkkW0Ax5
	BpnZLnLgw==
X-Received: by 2002:ad4:5d42:0:b0:8ce:cad9:479a with SMTP id 6a1803df08f44-8cecde9cef5mr112400956d6.15.1780577404275;
        Thu, 04 Jun 2026 05:50:04 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fa53sm51354956d6.8.2026.06.04.05.50.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:50:04 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8cce26ee1e9so9680586d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:50:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/aaEUOhI/xa0UXCljHNwLRtrLZycgsBeCvtjxYrjLy4/o3YG2YXMhmhtE+pOi322B3f89Ey4aLjfNOcLQfbHEJGA==@vger.kernel.org
X-Received: by 2002:a05:6102:f12:b0:633:c6c4:b321 with SMTP id
 ada2fe7eead31-6ec4710d8d3mr4931144137.18.1780577022139; Thu, 04 Jun 2026
 05:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-8-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-8-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:43:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDTXYG3hEz_DjYX95TrQtC+WAbcaigcJbB6+ahgLuLRQ@mail.gmail.com>
X-Gm-Features: AVVi8CcFSLH-fFepPuSUo9_HZp_pXmYIByM4nJDNELTvumtfJ3RhzJ9KYGckeGA
Message-ID: <CAMuHMdUDTXYG3hEz_DjYX95TrQtC+WAbcaigcJbB6+ahgLuLRQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] arm64: dts: renesas: rzg3e-smarc-som: add audio
 pinmux definitions
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33589-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,redhat.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 950CA6401D6

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add pinmux definitions for SSI3/SSI4 audio interface on RZ/G3E SMARC SoM:
>
> - sound_clk_pins: AUDIO_CLKB and AUDIO_CLKC clock outputs
> - sound_pins: SSI3_SCK, SSI3_WS, SSI3_SDATA (playback) and
>   SSI4_SDATA (capture)
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -353,6 +353,18 @@ sd2-pwen {
>                 };
>         };
>
> +       sound_clk_pins: sound_clk {

Please no underscores in node names.

> +               pinmux = <RZG3E_PORT_PINMUX(4, 2, 8)>, /* AUDIO_CLKB */
> +                        <RZG3E_PORT_PINMUX(4, 3, 8)>; /* AUDIO_CLKC */
> +       };
> +
> +       sound_pins: sound {
> +               pinmux = <RZG3E_PORT_PINMUX(0, 3, 9)>, /* SSI3_SCK */
> +                        <RZG3E_PORT_PINMUX(0, 4, 9)>, /* SSI3_WS */
> +                        <RZG3E_PORT_PINMUX(0, 2, 9)>, /* SSI3_SDATA */
> +                        <RZG3E_PORT_PINMUX(0, 5, 9)>; /* SSI4_SDATA */

Please sort by GPIO number.

> +       };
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

