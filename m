Return-Path: <linux-renesas-soc+bounces-30971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJfvAeok1mklBQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 11:50:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 903783BA210
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 11:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C1E73020FDE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 09:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698F03ACA4C;
	Wed,  8 Apr 2026 09:49:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030462E7179
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641740; cv=none; b=pXv6bMcd8x3l3iMrMzvfYdrxFxn6U0Fwb5PbImuJxJQ/ToF+acbTmUkGms3LLOqdIwuvSXMP2aKsZ16qDKDk+13U14sv8WnNpv7Pz1vT8+FCV0dKTapcaNC9f8i/HW8H9JAxrCJpArqnily8+rBqbB5n7AMQ27X/0tRhKC2eils=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641740; c=relaxed/simple;
	bh=O0dPKIPUwqcZQdDhmwfagNKRPoro50YwQ5jiiYuAkY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sm6Gy4mZMl6ShIE4dOBPTzjJQFLl1Kz63DU42sC3rmpvk8GSz2sRi41MlxwxMmKXKbtoqZIFEK+HaMVBN90mCRzJuzNnO7h6MYTM6Ou8tNVLt1mL/AL6XnmzidXmq2Sv9DWHURuJjqbwXihKoF0uxYD9YfTxT1PEtXfMFhTsnNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-46aa216a65aso3263659b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 02:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641730; x=1776246530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quvvcejYXNcTSghIu/ABG/aBBVzSmRl0OrHbMTAKiNc=;
        b=MCaXAkdciEYdUXZp2wQE9a4SbmytwpO7Mly2xpvmXIodfP+T1fdigvpcdvLeuPSug2
         49T0/pZvaxV+uV8kGon8KyiR6Ddagfp0j1xD20X5m+XzP5PsZQmaILsDrbIrYU2dUyrK
         yUhCMPvTdSBSVBHeg/1iPWIryy57WthjYlwe6Bo+19KC6zhkWbLxWN1YLSCBdj8L22wb
         YNmwq1gNwt3upJ14oAcEjr/rkwNRaVUpcOGUUBN38KeEfBhCU87iE32EoByfq22rBrJh
         QAXy8Vs3+KtrUVJJXSBiYQcHzCmL96NXpK2qol3/ppQAPjuexdEshwbDbP87eMrD3gTy
         iuiA==
X-Forwarded-Encrypted: i=1; AJvYcCVNR8ejANJdf9AM17C3280jUcImppzcVqxsdon1kIgmQttEUV6Hn476nUAt1oQcUC72zOJr4Ft2vv8o3C8S9aZlBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHncrj0wXHZqa0kY9qNIm8QHLjuMtgdOET9tPMGmhjp3ymK4i6
	99Qz3aUdscO2EYY6W0UhuZjBPbxNbXbSEYXo/Gr7mmtrr/2XJIJ//JQlZEU/RkWL
X-Gm-Gg: AeBDieuzefFszQH1jT1uP4QEANNN/gI9CPOphu7o9XaExVyPpk7GCuCzaa+TEqO4sqc
	iljVz5k7iC8W40dvMmHONP3f7z7nf3M3X3Wv0UjWoLwaV3vEQwK2con87KxkMuUKWHXJMxpvhma
	JThJkkZ5a08S7v3bQyu+0dJ4szPabeBp01swHviAaqR7cqn7/2sDU9tNPaZa/hmOj2ZWW4XfI59
	SHr5PKGhvK3AeHFPL0oPoQSEnGikzXCXkQw0PItwuCNWIoe14tAslzY2n4Kz7178WJpagm/cM9p
	w6QxXAuzEPxJiYVTgfviDJx6htGuvx6FC8axBmx36MNOnW05bnTXj14BJosPYK7kK343t3BuiaQ
	IgJXnVJ+jW9P3HjiSALAswyz7NJ/1ODO99ZNb7qaiCosv8p8IAFpCHXFhj2JSn21eXMxHLG+Q6e
	X6Ld+V2qX8OrIxc+blShN3nmIy7LE6ta1bdY+9VTrlxXe/1ILLazt09HgB9o46
X-Received: by 2002:a05:6808:5088:b0:450:d471:dce5 with SMTP id 5614622812f47-46ef8e521c7mr10705731b6e.6.1775641730152;
        Wed, 08 Apr 2026 02:48:50 -0700 (PDT)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4765fe4ca12sm498733b6e.9.2026.04.08.02.48.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:48:49 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40ef10ec84cso4474035fac.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 02:48:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVo7LUDA36FxZuOyPoaIsNsffcT5ld/38on5OGZ9OyyO1sPmuZh6CMT7gaGgSy1SpSsreEel8MGOoM08xR87svFzA==@vger.kernel.org
X-Received: by 2002:a05:6122:a5c9:10b0:56e:e9cf:7134 with SMTP id
 71dfb90a1353d-56ee9cfa0fbmr3844058e0c.3.1775641295235; Wed, 08 Apr 2026
 02:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com> <20260402090524.9137-25-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402090524.9137-25-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 11:41:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLb3Wj=4qK_5jLsiN28i2LDYPVH9ch91Y6e8XyT+yjjA@mail.gmail.com>
X-Gm-Features: AQROBzD3bL2aOOG6EzT_imFnbWnAbXmWWZH1UF0TeTlDTbev2ZgK_ZCcpyzlvIk
Message-ID: <CAMuHMdVLb3Wj=4qK_5jLsiN28i2LDYPVH9ch91Y6e8XyT+yjjA@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] arm64: dts: renesas: r9a09g047e57-smarc: add
 DA7212 audio codec support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30971-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,baylibre.com,gmail.com,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.001];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 903783BA210
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

On Thu, 2 Apr 2026 at 11:10, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
> sound input/output using SSI3/SSI4 where:
>
>  - The codec receives its master clock from the Versa3 clock
>    generator present on the SoM
>  - SSI4 shares clock pins with SSI3 to provide a separate data
>    line for full-duplex audio capture.
>
> Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts

> @@ -280,6 +358,42 @@ &sdhi1 {
>         vqmmc-supply = <&vqmmc_sd1_pvdd>;
>  };
>
> +&snd_rzg3e {

Please preserve sort order (alphabetical, by label).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

