Return-Path: <linux-renesas-soc+bounces-33211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCiGICT/FmoJ0QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:26:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F155C5E5D85
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C26D3046ECF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912233451B3;
	Wed, 27 May 2026 14:23:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469963D5659
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891788; cv=none; b=Dd4OOjxJZDRS3GIvqU+BvNPfqxpv3KJzdsec77jbm0wwvJU7QrHo7y0IPIFcJ6Tkif+tT+qCs/f4mnpvzEEf5VzdCTiXLzdv86I3jQgBw2PVOZg8fxbEvkpDuIaadab+WS2A/xdHHsb20ZdlKqWQ3ooCNeEFE86Zi0TP80U/prM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891788; c=relaxed/simple;
	bh=+3l+6y9ewRC4AXsaL+0Jmm/WnR4XE92YiTVGpA0ishE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfPjRmyDdDVDeU5ucVXq4XMk817PktTTtTaVPcAOx9knp5zpkFgubLouUmOgm0/sxWsF7WoP0F9eY1yuTd+aQhYA2K+ySlrsC6B/X5Y2gKXynArjBTIfY5XJW8WYbFweca/SVFRBKBaK+d0ixOsEy78Dlsf7n/X9dfWTMeMUZlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6870a365c77so14133367a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779891785; x=1780496585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3prSOuZ3fI29cRYCO/JPEKU1fRK4LWYePkpcpuj9ak=;
        b=WTvu3glRdiuM9uiJed6avMR80rSLSpVYH4F/iywo/dqSKQf71ojE+VTkTllRxtl4dm
         4tvxgJsINsn93VxK9lsEm2oHsZYSovFpiyY5JP0wuRjiqMx3fWISg9NCQRrT4RYzkVJ9
         QO0dRCeDfvBl02God+IG/++ATughrj0LZfIqR6yZM3HkVPvL7sbWkqb5i9Dsq5QjExXV
         6YNIJieVvoR13r4zUT5BxEIAGm8yQc8AwCBeujDLzmyBUV7j/zEzWtR1XuAJHyiqX82G
         0A74FJzyac7DYev7dCZ5rOc09YMN1KEYbenvc85R43RRpxE4hPjnyjvdKLBudrAMdXaD
         HR4g==
X-Forwarded-Encrypted: i=1; AFNElJ+uhXgKVWDShOO/SRvDduie5Pkx1Mv1ZZDcF7pLPCBAQRNeoqadujmPQEr+UzbyffTlKurI9dcmmwph1DVKnW7cBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGONTruO+UUmTEhj8Fjjh35ymGqvONfxDdu0wWzlcyYOl4vos3
	tOlkqUiGxYRw8GsixEsDppHp9ky8aFpv3Eam1hDgw59a36oBWkIHMUNfrbOcOFrWJYo=
X-Gm-Gg: Acq92OGSTZnz4ZxUE7R/blyiXoEdVxABOVHID7o6s/Zep1F029C+/BcZEfeqMEEEqhI
	SdXfGOkMMZ5KPEidWbDcNglhw+sWd3B9kG2qV0IMtwfQmc9y9uCel2aytZP5qnP60+L2B3bVsCi
	EXxEBKw7bHQFo7DvLnpwXWfia1AdCWTUfthXFrZFXF3g2e81EG+MFXoI2vWxMrebvDjajeodaGb
	4z6G1uvhOwvt9UGpLWvl7CDse0o7NdPGcGrWvcV5SVv3BicNZcrqow2X/TGOoWmJt7JpeXT0QhY
	L6VerxFFNxaVTGXE3+/aDH8Rd5Vk2SEUrQEo5XtoCdaQsR4tRnwHxZbwqX3Gxak6V8YR4kNsry3
	ZJ1+vM+oz5CubgsEFwtb67urnGuEWbCzprpeyyROQUWUW1GFD0tetfNe2PySyPHSG+vn39rlR8/
	8EU8nh3iGG5xWKGlQNfRb+Uhhwsz0ny6IvMBkMPw07g7tuoA29I1imGuXSMe9/
X-Received: by 2002:a17:907:c706:b0:bdc:bb32:2ea9 with SMTP id a640c23a62f3a-bdd263cb23emr1386106066b.35.1779891784374;
        Wed, 27 May 2026 07:23:04 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc66d22b8sm609853766b.55.2026.05.27.07.23.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 07:23:03 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bda62f13d90so1194646366b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:23:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+AHFfQXv3XAmZRUHlwyO9CyP+nEk7ryUuqZN6NsNGtkHAS0dLAlV+jY1XOg088eIaektKIpLmZERCuzzVtfkmA4Q==@vger.kernel.org
X-Received: by 2002:a17:906:9c9:b0:bcb:d9c7:c6f with SMTP id
 a640c23a62f3a-bdd22a454a7mr999392966b.7.1779891783475; Wed, 27 May 2026
 07:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 16:22:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXj8o+K5M+t_D-G_CGRGYgc1jBz0z21ye6UhAzWs0iJ8g@mail.gmail.com>
X-Gm-Features: AVHnY4KJG1smVEhyqmGQ6O4ZxxblTfhIdfIGaVVy0daiVThaQXAOe2q8bvr14ho
Message-ID: <CAMuHMdXj8o+K5M+t_D-G_CGRGYgc1jBz0z21ye6UhAzWs0iJ8g@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,redhat.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33211-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,13c00000:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.195.91.184:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: F155C5E5D85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
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
> Changes:
>
> v4:
>  - Rename the indexed clock-names and reset-names from the dotted
>    form (ssi.N, src.N, adg.ssi.N, clk_a, clk_b, clk_c, clk_i) to the
>    hyphenated form (ssi-N, src-N, adg-ssi-N, audio-clka, audio-clkb,
>    audio-clkc, audio-clki), matching the new RZ/G3E sound binding.
>  - Rename the sub-nodes from the legacy rcar_sound,{ctu,dvc,mix,src,
>    ssi,ssiu} prefix to the unprefixed ctu/dvc/mix/src/ssi/ssiu names
>    used by the new RZ/G3E sound binding.
>  - Reorder the clocks and resets phandle lists into ascending index
>    order and annotate each entry with a per-line comment naming the
>    clock / reset.
>  - Drop the #sound-dai-cells and #clock-cells explanatory comment
>    blocks from the node.
>  - Align the continuation lines of the dmas property.
>  - Fix the commit message: the node label is snd_rzg3e (v3 referred
>    to it as rzg3e_sound), and add a paragraph noting the unprefixed
>    sub-node names.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -912,6 +912,482 @@ rsci9: serial@12803000 {
>                         status = "disabled";
>                 };
>
> +               snd_rzg3e: sound@13c00000 {
> +                       compatible = "renesas,r9a09g047-sound";
> +                       reg = <0 0x13c00000 0 0x10000>, /* SCU */
> +                             <0 0x13c20000 0 0x10000>, /* ADG */
> +                             <0 0x13c30000 0 0x1000>,  /* SSIU */
> +                             <0 0x13c31000 0 0x1F000>, /* SSI */
> +                             <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */
> +                       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +                       clocks = <&cpg CPG_MOD 245>,    /* ssi-all */
> +                                <&cpg CPG_MOD 385>,    /* ssi-0 */
> +                                <&cpg CPG_MOD 386>,    /* ssi-1 */
> +                                <&cpg CPG_MOD 387>,    /* ssi-2 */
> +                                <&cpg CPG_MOD 388>,    /* ssi-3 */
> +                                <&cpg CPG_MOD 389>,    /* ssi-4 */
> +                                <&cpg CPG_MOD 390>,    /* ssi-5 */
> +                                <&cpg CPG_MOD 391>,    /* ssi-6 */
> +                                <&cpg CPG_MOD 392>,    /* ssi-7 */
> +                                <&cpg CPG_MOD 393>,    /* ssi-8 */
> +                                <&cpg CPG_MOD 394>,    /* ssi-9 */
> +                                <&cpg CPG_MOD 372>,    /* src-0 */
> +                                <&cpg CPG_MOD 373>,    /* src-1 */
> +                                <&cpg CPG_MOD 374>,    /* src-2 */
> +                                <&cpg CPG_MOD 375>,    /* src-3 */
> +                                <&cpg CPG_MOD 376>,    /* src-4 */
> +                                <&cpg CPG_MOD 377>,    /* src-5 */
> +                                <&cpg CPG_MOD 378>,    /* src-6 */
> +                                <&cpg CPG_MOD 379>,    /* src-7 */
> +                                <&cpg CPG_MOD 380>,    /* src-8 */
> +                                <&cpg CPG_MOD 381>,    /* src-9 */
> +                                <&cpg CPG_MOD 370>,    /* mix-0 */
> +                                <&cpg CPG_MOD 371>,    /* mix-1 */
> +                                <&cpg CPG_MOD 370>,    /* ctu-0 */
> +                                <&cpg CPG_MOD 371>,    /* ctu-1 */
> +                                <&cpg CPG_MOD 368>,    /* dvc-0 */
> +                                <&cpg CPG_MOD 369>,    /* dvc-1 */
> +                                <&cpg CPG_MOD 251>,    /* audio-clka */
> +                                <&cpg CPG_MOD 252>,    /* audio-clkb */
> +                                <&cpg CPG_MOD 253>,    /* audio-clkc */
> +                                <&cpg CPG_MOD 250>,    /* audio-clki */
> +                                <&cpg CPG_MOD 384>,    /* ssif_supply */
> +                                <&cpg CPG_MOD 246>,    /* scu */
> +                                <&cpg CPG_MOD 247>,    /* scu_x2 */
> +                                <&cpg CPG_MOD 382>,    /* scu_supply */
> +                                <&cpg CPG_MOD 352>,    /* adg-ssi-0 */
> +                                <&cpg CPG_MOD 353>,    /* adg-ssi-1 */
> +                                <&cpg CPG_MOD 354>,    /* adg-ssi-2 */
> +                                <&cpg CPG_MOD 355>,    /* adg-ssi-3 */
> +                                <&cpg CPG_MOD 356>,    /* adg-ssi-4 */
> +                                <&cpg CPG_MOD 357>,    /* adg-ssi-5 */
> +                                <&cpg CPG_MOD 358>,    /* adg-ssi-6 */
> +                                <&cpg CPG_MOD 359>,    /* adg-ssi-7 */
> +                                <&cpg CPG_MOD 360>,    /* adg-ssi-8 */
> +                                <&cpg CPG_MOD 361>,    /* adg-ssi-9 */
> +                                <&cpg CPG_MOD 248>,    /* audmapp */
> +                                <&cpg CPG_MOD 249>;    /* adg */

Please drop these comments...

> +                       clock-names = "ssi-all",
> +                                     "ssi-0", "ssi-1", "ssi-2",
> +                                     "ssi-3", "ssi-4", "ssi-5",
> +                                     "ssi-6", "ssi-7", "ssi-8", "ssi-9",
> +                                     "src-0", "src-1", "src-2",
> +                                     "src-3", "src-4", "src-5",
> +                                     "src-6", "src-7", "src-8", "src-9",
> +                                     "mix-0", "mix-1",
> +                                     "ctu-0", "ctu-1",
> +                                     "dvc-0", "dvc-1",
> +                                     "audio-clka", "audio-clkb",
> +                                     "audio-clkc", "audio-clki",
> +                                     "ssif_supply",
> +                                     "scu", "scu_x2", "scu_supply",
> +                                     "adg-ssi-0", "adg-ssi-1",
> +                                     "adg-ssi-2", "adg-ssi-3",
> +                                     "adg-ssi-4", "adg-ssi-5",
> +                                     "adg-ssi-6", "adg-ssi-7",
> +                                     "adg-ssi-8", "adg-ssi-9",
> +                                     "audmapp", "adg";

... as clock-names already serves this purpose.


> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 225>,    /* ssi-all */
> +                                <&cpg 226>, <&cpg 227>, <&cpg 228>,
> +                                <&cpg 229>, <&cpg 230>, <&cpg 231>,
> +                                <&cpg 232>, <&cpg 233>, <&cpg 234>,
> +                                <&cpg 235>,
> +                                <&cpg 236>,    /* scu */
> +                                <&cpg 238>,    /* adg */
> +                                <&cpg 237>;    /* audmapp */
> +                       reset-names = "ssi-all",
> +                                     "ssi-0", "ssi-1", "ssi-2",
> +                                     "ssi-3", "ssi-4", "ssi-5",
> +                                     "ssi-6", "ssi-7", "ssi-8", "ssi-9",
> +                                     "scu", "adg", "audmapp";

Same for resets and reset-names.

> +                       status = "disabled";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

