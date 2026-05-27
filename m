Return-Path: <linux-renesas-soc+bounces-33220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ4SMtcSF2pf3QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:50:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 566475E7311
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86C3D3193247
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 15:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152153EE1C6;
	Wed, 27 May 2026 15:42:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8015F368269
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896552; cv=none; b=DZRhSPQwINmMAVAy23g9jyhxvTv8v0hG3iHyAMKyiOHXDtPcB2eTFOnpSTqRJfO8MnBFvz2Dct1o8/3iQ6XqQa8IAOrveCr1MMvo+/bY44Yj1UqqjsLyJXUwT7DgFubm5T9EPgUDsg75l7wgWGsUU32TWCb6mpynh1eE4f3udHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896552; c=relaxed/simple;
	bh=QxEzYqywlw03gV5MPfwql/Vh7CF7FMFvawQxXbUcQXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=psrvSI1cYTFW8EwMukptqfM9t+yM7Wry/HoxhvF1pzm9n4BX1JBXkldxi3haBLEIyzF7Ms/O26DI8g44RD8dsypYYMh6dB0GB4OhJ7dIG5mUWZHl/ZUW8G4gMAVt2dWxNlgznbolPQ7UhmXWJOMnSOWn1b2W2TudVonTviDGjZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-96387efc30aso223784241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896549; x=1780501349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUVMYERSCtXTEyD30ce/R5zh2i/ldE4ZPLr0V8MwRIw=;
        b=cwVFgWB1ZLm0Ow1ISN/DUsCBFmLvJYRmaOv/f0JBH2Wu877DUr7DcUnStcfBZX2Fni
         mURK+6cOgXBx4ibA/dhlU/nla2arho6Nn9o+J2u/sJ9/B8DWnkRejFiK+B+aEartM1EA
         Na35KXWeg47JF2NGNtvKs7RRLB1OSJKurF4z3CQi/0p1fvxm/MlJfjNjcdu2RU2DpYct
         UZly9+Ub9RF1pQlU7Zhj+V+7LAeQDJIAyiaY3ywABKy7+wodATuCm59KZL+isN+f5fHx
         MAjUPWSMOexsTiTxhyvjMcsKF+gHw+WH+mbzzkO98wnOHoZI7iB7Zf4YxqFWvgouRyHe
         LlOw==
X-Forwarded-Encrypted: i=1; AFNElJ8rDuTrB7KaK1QuAScefzqvMxp2MwZIFYtSvEpvAQLbAR9OUcf4Oi2gNft3yDs+VP+ePk4GHKcy3OHJDiu5qYMyZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJLmOiHBc1wGDMeGq2I7lgvPgHJU6b35FqMiL84IEucW587fID
	YuyUULnPPNh4M5V1rpdSr4JFSlAvTqIhdBkTWdiH9s0OOudSvMooT02JrX3q8rxJC88=
X-Gm-Gg: Acq92OHVSLHJKMrKio9zohoQoGScxAErYkvjc/jazo/gQTzhMqnF19ExRWXtOxRd+9H
	xANJcCaesJyFj8QQJnQkryxp8w9FcGk/SOR7pLjShUWAnCo1ho6kpMYJsmnQg4hwWcixByaEDZT
	STgQ8CvjyMEDGTa+ZckclMQZQvgbHgzU8YSsf/zfFrZAwDz3b9MMOtYTsmjJyq5IB1304iCdBpx
	xmugZ0smXGQLZjPWuanexuZC+GulbG0YrK7xyP8+PsEQVnY2kETKmBTOUC++yPYbTNtq/vAI0mg
	CMp6vi3UXc7gJwHgBsf6dt2ck54ONnNciRMEgzTkciiS3yeUNdGjIZ+xl0abFiCcArp/rxRuNCT
	wTxIfsEQar3UB0RUPjc9BERFqsjR3Noo0kmFEFTLaSO8Xgne07RE36Lg3bHXTSbSkOo3mFI58N7
	vhsdEIxi8NIrYGcOrpxteXWmmDOLdZA/uGlSKGGDVyrNjRnuFSIxp/hwGK7mrAv0zgh5c/f8E=
X-Received: by 2002:a05:6102:b0f:b0:633:8c42:183a with SMTP id ada2fe7eead31-67c7ca05a66mr11998890137.9.1779896549191;
        Wed, 27 May 2026 08:42:29 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff3e499bbsm17266123137.7.2026.05.27.08.42.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:42:29 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6329f0e0a16so8006703137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:42:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+7jl/z+BVQw/ADOagi6sLv3Vz+MiAYgIPEMy5cYb54MbgHMj60+y4gxaEZuW6PnL83MuhThip9gplhquFusNGkVg==@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:631:2973:5c2c with SMTP id
 ada2fe7eead31-67c890222e7mr11190059137.21.1779896548782; Wed, 27 May 2026
 08:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com> <20260505070206.7932-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505070206.7932-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:42:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURzXkiXdaPZp1mie8zFDSQMP=_8EOe0dEAKEW3nWo6RA@mail.gmail.com>
X-Gm-Features: AVHnY4Jt_LVptrM_xgMBw8SP-oke7VXnd5tR0FGiwVcc6M8XHiNnKr4PGqFaaSM
Message-ID: <CAMuHMdURzXkiXdaPZp1mie8zFDSQMP=_8EOe0dEAKEW3nWo6RA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 I2C{2,3} devices
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33220-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.982];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 566475E7311
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 5 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable I2C{2,3} on RZ/G3L SMARC EVK board. The I2C3 is enabled by
> setting SW SYS.2 to OFF position.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -11,6 +11,7 @@
>  #define RZ_BOOT_MODE3          0
>  #define SW_DPI_EN              0
>  #define SW_GPIO4               0
> +#define SW_I3C_EN              0

FTR, this macro is active-high, like SW_DPI_EN, good.

>  #define PMOD_GPIO4             0
>  #define PMOD_GPIO6             0

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -9,6 +9,10 @@
>   * Please set the below switch position on the SoM and the corresponding macro
>   * on the board DTS:
>   *
> + * Switch position SYS.2, Macro SW_I3C_EN:
> + *      0 - SMARC_I2C_GP is enabled
> + *      1 - I3C is enabled

while the SW_I3C_EN# is active-low, so setting the switch ON pulls
the signal low, and enables I3C, good.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

