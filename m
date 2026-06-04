Return-Path: <linux-renesas-soc+bounces-33585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xIvfD0twIWrBGQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:32:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A400163FE3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:32:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27D1D30602A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 12:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAA844E037;
	Thu,  4 Jun 2026 12:25:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DE344DB61
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 12:25:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575941; cv=none; b=DBLxHHmTs40eoJktPgASA7jPhujfMkFjfjI6zW4daq0XYybXM4cNWsnGxHgnlNz5a+yuYGr190t00MqinaWRjrUrZjTpxfCTiYwxi9Eva9xhZm+3gGe4djua4cL9qjoffvYQjwA0dd5hMiYTqZ1vwIy6p1h5VA0uyuOptoT+uf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575941; c=relaxed/simple;
	bh=ZVR9x8tWd6AFCeFuB4BHv4sPK8zCkEI3GNQIoDCb/Xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCxrm4HJqT79ou3JPVzO6BXi9Fg/oYh9y/GV6MtdEJWvrYBK/Ea+Ats7y/5z41dhdDbKF1jH9zDNBAv2hQ4Q1a2/1BjT1PeriwRnffVj95qBlI7igwI/tuRIgS4iAyVCsZXcUeIgW+85MVaLG8Rr0hGEC621+DlVbsilPA5ivLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so466310e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575937; x=1781180737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyWpTw37mylw5bzav8uUBiWBa2W/YfP061QKPLyDS7o=;
        b=q6uVAkV1AhluBk14kUqez2uJrf05C8UNXZt9kjUJXOwnB37NlP8iwCckGcB3wtweUH
         6EE2TKujODswoOZWRH0KdL27cw7oGsS3TAJhQOneLQkHXGFyqVB7QTf1EuVv5GoEz6oC
         J55sfW+fYQxKhPQR0gnvNQ7so9ZTXXYf3mA1JdpAmsfUb8+9+0uzEp5Y0wqnZ3LtDyc2
         bRIWOs11F8IcC2iBLdzk7awH55dUHvbK/8t3fAWj2ei0mn+EX7W1S3o9qe7Rk7zLTaeW
         Xi5820uC9CmCx7ggh9ID5GfgmLo4KnYZPffKuaaielnlGhi/pu9BrJ1J4eji54rZfuTo
         crSg==
X-Forwarded-Encrypted: i=1; AFNElJ+WF+PMM2UInFKTn0t6cDDLJmusneKxb3RC0e2XOnL6sH9tHgnMLgoe8d9iZ0aatGHxiQIsm4ohkU/q+T03m+Eh1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5XvVYH7Oj4IbWWZhCSL09HvWr638XaRfAHqlaWaJFHfapcKa1
	evwfwWEDkXRiSX80NEwn2XwxHzfDwzUDa5Lpll6M3n8xbrIe3mE2Bz4JaLpRuaxy6hI=
X-Gm-Gg: Acq92OG8R4uD0F04X0BunrQ5fgrQZ8Dax/W4xHalMpTTcU0uWv/fMhJa+p4rKKfTegR
	QMAzx6msptC+e9xVGsDLl+O7J0rOY3FIhJGml/kh6TkZHZ6cMV4r+vCWtlWiCXZ/MKqqlpi74oG
	HUDWUS3wfo/uTTlZ3Ec4oXQ6JA5IrS8LhnzjJEJPEBjwOKpF7zqWTGPqnrdYiy64W8xmnOcA6XA
	Ba/Jb1UAi8k7DWL8sjegwzt+m+Yi++FnK/4zqXjnu+Mwi3TI8xXgn/1LUiLMurVlvAMnw8dNIyf
	rhEe1uyQa8FIdFVj/85wxsQ86KAeAtSNvRhOtsHdL+3RE2LXXSzWNoUabrZiqw6kMFJMqoqNTZ1
	e5KHUCF4TZhj/hnNMHr9LVpj6QnydoVm+YoIyByYDNTHa7lj4Jza7kU/eBZSPduaI/2HYxrfyIq
	+4fYfCFRMZG9U66auD827aAjEnw86o6ogWE4pcRJYUWojAdxYCigbrk9OS43Uk1PY5y82N+Y53I
	Ys=
X-Received: by 2002:a05:6122:4684:b0:59e:f988:51e with SMTP id 71dfb90a1353d-5a6e4e347d2mr5024709e0c.5.1780575937444;
        Thu, 04 Jun 2026 05:25:37 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d06a491esm5008633e0c.0.2026.06.04.05.25.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:25:37 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so466292e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:25:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+JlJI4KtxVYksYVocpACH1osCiUbydNG1WuPlL390vcpmK4FcIBTZiH7Drjy/JfRRP0B/SHY2AHEOoeQPYjz/qiQ==@vger.kernel.org
X-Received: by 2002:a05:6122:e14e:b0:5a0:3d17:f939 with SMTP id
 71dfb90a1353d-5a6e7e57815mr4955258e0c.9.1780575936747; Thu, 04 Jun 2026
 05:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:25:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5ivj=WdCH=kQUwaAwqiS-pDaTgq3tyf_CF5SRT+qzQA@mail.gmail.com>
X-Gm-Features: AVVi8Cf4Ujm0MLmye5A9UxakzZtSS845oRUcwVlQZvUP1y9AtjAcdgWbu9vD6MY
Message-ID: <CAMuHMdX5ivj=WdCH=kQUwaAwqiS-pDaTgq3tyf_CF5SRT+qzQA@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33585-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A400163FE3E

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

size 0x20000. to include the SCU DMAC?

> +                             <0 0x13c20000 0 0x10000>, /* ADG */
> +                             <0 0x13c30000 0 0x1000>,  /* SSIU */
> +                             <0 0x13c31000 0 0x1F000>, /* SSI */

0x1f000 (lower case)

> +                             <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */
> +                       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +                       clocks = <&cpg CPG_MOD 245>,    /* ssi-all */
> +                                <&cpg CPG_MOD 385>,    /* ssi-0 */

Please use hexadecimal module clock numbers, for easier matching with
the documentation.

[...]

> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 225>,    /* ssi-all */
> +                                <&cpg 226>, <&cpg 227>, <&cpg 228>,

Please use hexadecimal module reset numbers.

> +                                <&cpg 229>, <&cpg 230>, <&cpg 231>,
> +                                <&cpg 232>, <&cpg 233>, <&cpg 234>,
> +                                <&cpg 235>,
> +                                <&cpg 236>,    /* scu */
> +                                <&cpg 238>,    /* adg */
> +                                <&cpg 237>;    /* audmapp */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

