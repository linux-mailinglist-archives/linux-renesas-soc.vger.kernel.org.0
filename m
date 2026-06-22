Return-Path: <linux-renesas-soc+bounces-34292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S0d1NbgOOWp3mAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 12:30:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D89AF6AEB37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 12:30:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D9E2300A59D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2401D3A59A8;
	Mon, 22 Jun 2026 10:29:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9583A1D14
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:29:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124194; cv=none; b=cub9hRJXaJqztaueIUFXVpfb+w+KekjOxUReRd3c9p8Ry46hjPuaW5V6x6BqfD0kVd77V3z8vH/Yjar7buXFlYMG5tZxBOZFN8iqCJ0JiiH1+WBVYGDFja5tJ1Y2V2sR58H0uUAvrdPwlWWT2+PgKh0HezncJdXZphoGlucStJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124194; c=relaxed/simple;
	bh=mEIkMOtMjOdnwR3+nT8uGH34yBj5roHB3yKHlaR5JIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/VBGJWRDCgRTOtNiGSwqhVsHnCS14fwLvSIxxF+oN4P0ZCwGzx4Ul+uXGRYTw4iI+/ACgGEC0wNjO+TXESfwu9hQCNNBoj/2YPc/uMcjGZn4dldaGLjbzqzvGZaylh2XhSQVonAVP+ER6BzOorKWmu8N0lrBrSzuLUMtzcZ9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bbd16441b9so3259990e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 03:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124192; x=1782728992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC0iMxF0nVG/U59uAaaQJUNktvAjxn1h5vRBJBxTc9E=;
        b=LKwsOxFSG0yTGPfwPnHlJwJHp/llqgqwXpnCEafA/vrcAh12oJhlSoV+WULmSfNFCq
         N5NeqdLW96/Zy2jBCxwVhUcuCIphakt0CmxM6b/1XvNYXarqOm/gTlP4PhivqsfupdPG
         kpdA/U9GO5LsO1iR4a58UJ78OjWT+U4dd0NI+ZRIP3GEPGZDUMC+QHnU1iGbm6sAsWgC
         +Aa89vhC6eNoNZcTT7HYyGQLwu5IxP3B2JYD4i6eqVO23SXNu1dvJnuzoZUwFLFoRPfM
         0Em8DA8rds3LTrRD46aFo+vD+QpR0m0G4b9fg16TRrd9xS1r3PFsdLYMvVNb6DKSIHlM
         6hgw==
X-Forwarded-Encrypted: i=1; AFNElJ9hBiBy+ouI7nld2rXpXbVBLsrMcREYdryOTynHSMnWkIVUVCm10gz6GsL4ScwZww/XljhygyQjyZeY/gBzrUdZYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc7nqphHpmXoV+BW6Qv9Hs6s60z/na0FWHWbiE0MELw1SRToVB
	+MTu+NHCsja5Co+DmwQlF8wcCyT4n2iCKmsk7Zit2NngXFU4ZsvP4SzgQG49jqgt
X-Gm-Gg: AfdE7cncSAOQOJwi9ZeOJPEPU2aTGm4PvM06dtTGZb2Y9SZU4a6EgUhvkLAhVw1Ct1r
	q4caZoWqLzamebIWH4oW9QLMslgHnLAo8oRQcVvgH3JxX26Bc5AfEIQdB4WEKULL166AgexF3xG
	M0d5w0xu9i98sOoLRRjGx+bBRj/lrWf1UBCr3o0Goy+W3hPKz6W+R9btZdZAXN0nm7WnASS7WaP
	YWOPVyZPa8XkAPrdU19q1ENUs8wUQOrqzxoWANMnijzqwqYpqhYiqjcvtUwpZu/lwUtg54GQ5pq
	0jhc6zj054+weFJLj0U0W9Sq/WKVtXHNt3faXHgXKyn+JkdduwtkttfkGGWtdVbBQ7ZyX98vSQa
	/n0t6xqDYIBVN2vExr6VLMAsZrGQy5Pzl5xspFBoZ11xw1Wn1Qy9rnP+AQR/UlJDnhnxQOKRAZu
	0B8x8HD3leJDoTqD2fhWSv2CDTmvwqUGDwqhbnXItCVpR2cbP94HxxqoHpVgVg
X-Received: by 2002:a05:6122:3384:b0:5ab:26f:4a42 with SMTP id 71dfb90a1353d-5bbee170fb9mr6923695e0c.0.1782124191814;
        Mon, 22 Jun 2026 03:29:51 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9670c30998asm6074373241.13.2026.06.22.03.29.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:29:51 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-966c991e6b1so1763402241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 03:29:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+jliL3QpaUyLXgH1Q77fpT/fFvz61XXp/96fB4CAAvkHmlwLUgu0uUzJuoGlp4smOWU8WlhVWyk7KopQvUNZN+2A==@vger.kernel.org
X-Received: by 2002:a05:6102:3913:b0:726:8813:2078 with SMTP id
 ada2fe7eead31-72a7709766amr6890168137.11.1782124189286; Mon, 22 Jun 2026
 03:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com> <20260619083951.3777556-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260619083951.3777556-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 12:29:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjNkpmDqHBhROjJj=+GfahCo4H+cBfn+VnJtuj1aAS_Q@mail.gmail.com>
X-Gm-Features: AVVi8Ce6deDQyZfxT0Du3-E4B8hQQW2OCjySypNIB9xUTqhsKTdfcfI_rV_X8l8
Message-ID: <CAMuHMdXjNkpmDqHBhROjJj=+GfahCo4H+cBfn+VnJtuj1aAS_Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34292-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D89AF6AEB37

On Fri, 19 Jun 2026 at 10:40, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
>
> Add the snd_rzg3e node for the RZ/G3E SoC with all sub-components:
>
> - SSI (Serial Sound Interface) units 0-9
> - SSIU (Serial Sound Interface Unit) units 0-27
> - SRC (Sample Rate Converter) units 0-9
> - CTU (Channel Transfer Unit) units 0-7
> - DVC (Digital Volume Control) units 0-1
> - MIX (Mixer) units 0-1
>
> Sub-node names follow the new RZ/G3E sound binding: unprefixed
> 'ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu' wrapper nodes instead of
> the legacy 'rcar_sound,xxx' R-Car prefix.
>
> Wire up all 5 DMA controllers (dmac0-dmac4) for each audio sub-node
> with repeated channel names, so that the DMA core can pick the first
> available controller.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Chqnges:
>
> v6: No changes.

You did adjust the size of the SCU register block.

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -912,6 +912,468 @@ rsci9: serial@12803000 {
>                         status = "disabled";
>                 };
>
> +               snd_rzg3e: sound@13c00000 {
> +                       compatible = "renesas,r9a09g047-sound";
> +                       reg = <0 0x13c00000 0 0x20000>, /* SCU */
> +                             <0 0x13c20000 0 0x10000>, /* ADG */
> +                             <0 0x13c30000 0 0x1000>,  /* SSIU */
> +                             <0 0x13c31000 0 0x1f000>, /* SSI */
> +                             <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

