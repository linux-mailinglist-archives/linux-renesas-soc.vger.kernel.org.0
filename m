Return-Path: <linux-renesas-soc+bounces-29792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ox3MdrFumk8bwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:33:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9602BE4A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31D0831C49A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46003E5EE1;
	Wed, 18 Mar 2026 15:12:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0B83E5580
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846738; cv=none; b=JoDnpELnpWZn3gEK/nG7TK9Sk8y/SBVL8Hdc+KfCcU+K4d90yvh6wIssuNppMmZt7QVL0CVLsnSXCZKsuotpkzgsy+woY9w4MGLxcERqg/vuL3lO+HYff78VXoYBZwoJvQmCtLPZLxGOqJwWPVEKQmIKyif9S5F3T49bGWTlzos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846738; c=relaxed/simple;
	bh=u4mw1mnxsE2xaHpeKnafIrg+HVlfFWM9FQywR1Yp/94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PW+LBUPV8GudI96ZWjb8YMdundPpTp7oCjL76zCz2ym4Nl/wWgEkzP/oVHvKtfyktPBXYxEGetV9ZyfCpUc96SBhuy5IO++8Pr9BZIzxW1zBoRD/tt73AHlRJ+mnAImJ3O4ltGeWO+36RmoS3QuwRZDw0r7TR5Ci6Kx5rCT27gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b49b943c1so357813e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846735; x=1774451535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBetpwbPiNwfNeNZijFKkbGHgEIzzYw66eC/Gkn7kCo=;
        b=naGkHN6nxgWQlI8QKxeTfp587CZnm5yTYvxh0t0dK57o+InAYRhAtebodHYjgbZl5l
         g+00eDwj9cq7tA0W9kHewvjW62UO+t/rpYNgVzH0pZD+nCYJKSmnQHMZtCmbYIeiEjdI
         Frco01o4KZDR+r+DpNXxFG7kCBcacwIzghDrlNHxljqTg6vh83R1IZ5scoIpZsSFu6/W
         4cW0Jp9vwYIMKMEhyCYPYlcRL67GaNd+434TWfueswdJFXEfjNH5Z5QVG0Dijr2LxKtB
         QuJk76kM+dw6dGb3s6EjWJzh6det9kLWkK7TIF55d2b6tXxE6nZH0lz3UGQYh3FXlbRO
         HIXw==
X-Forwarded-Encrypted: i=1; AJvYcCXm2NrEpQZzer4pArkkNr5+dtFpMJmUVwTo/Mm1pThJWQr9xukbMRiNHh+Rr9b5oZ/q7UKF4/v5J6h+HxT93IHvnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjKi1ZjqXBugfFItPGgWLsDGh4VWld6SQTJ6ZSqvXCz1SJLl1I
	YuN6LjBe5+gSjODSMBavi6vMO++s9AyY3plCvWxDrmdTFLJmDGZCcscK98CrA/H9dFQ=
X-Gm-Gg: ATEYQzxSuu+CcBTqKRPFXb1EbHjNlVEv4oDnHF8cu1ytJd1uMtuLGjekVYTO1nhVDjj
	djc8H0Mm4+WbRkp0SLuKaL73P1ox50dhFVNR2H/443pT1BypwMWNTzDaqSRKzLpEG9gHNK4X4Vj
	SoDTctIWbH1x8sfyEibZUC7nQF6xq2Jrv4pCv6AceFG5ikRgxbJ/wX7xNBaySVBbQDTBtjVcoSg
	VSxBi7RtYAwUkvP67tH8xw7e39ELxj8K170Vi7KyHqB/mex2RrNIlPT0bRzND+lL/EF3BcJtoa7
	b2sIhBt2BcabqQZmRJwzYjjpb5QciYf/on35XIKxR+fA3VzelV5xSuECdgp8cjmAFY01LTCFL7p
	U1SYaz0CGZ2+L5p1nhnI8tEJlCzH/+3F+4QEHTRKdzjnwecswrdN5BRGzy9YF0nwBru5kb/PGIG
	05wrIgBwMccXWx1FoThUca4NrHi2GZ9YmJy1tfe1V/NCRbHHOGFUTnBNtdW4HtETop
X-Received: by 2002:a05:6122:6991:b0:56a:fb7b:7528 with SMTP id 71dfb90a1353d-56ba71e45camr2229862e0c.13.1773846734998;
        Wed, 18 Mar 2026 08:12:14 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba705cb2asm1930925e0c.14.2026.03.18.08.12.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:12:14 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a9076813bso375277e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:12:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVx8/4Gkip1acxIBprturaGDH6262jNCqu9EeWtr4r7Aozzqwu0DPjJls0iHBY0rswpYXsr1azMEg7sdoEazkpdA==@vger.kernel.org
X-Received: by 2002:a05:6122:134d:b0:56b:982f:1265 with SMTP id
 71dfb90a1353d-56ba7079b27mr2156520e0c.7.1773846734329; Wed, 18 Mar 2026
 08:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com> <20260318084151.122674-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260318084151.122674-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 16:12:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVv7rjMfp=53i8iKUSDgTs3ppFW_Q8XJ+KciJnzsHg3Gw@mail.gmail.com>
X-Gm-Features: AaiRm50lR9Zd74d8Uv5dWajd_dqV84YCpjvE8cwPo39SJAzSMjiI0zCUocu_kts
Message-ID: <CAMuHMdVv7rjMfp=53i8iKUSDgTs3ppFW_Q8XJ+KciJnzsHg3Gw@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29792-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.454];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,0.0.0.0:email,linux-m68k.org:email,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,11e40000:email]
X-Rspamd-Queue-Id: BD9602BE4A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 18 Mar 2026 at 09:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the initial DTSI for the RZ/G3L SoC.
> The files in this commit have the following meaning:
>   - r9a08g046.dtsi:    RZ/G3L family SoC common parts
>   - r9a08g046l48.dtsi: RZ/G3L R9A08G046L48 SoC-specific parts
>
> Add placeholders to reuse the code for the Renesas SMARC II carrier
> board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * No change
> v3->v4:
>  * Fixed typo R0A08G046L->R9A08G046L in commit description
>  * Dropped R9A08G046L46 from commit description
>  * Dropped unused audio_clk{1,2} andcan_clk device nodes
>  * Reordered i2c device node and updated reg entries by using lower-case
>    hexadecimal number
>  * Added placeholder in pinctrl node
>  * Dropped unused DMAC device node
>  * Added pcie node with placeholder

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -0,0 +1,215 @@

> +       soc: soc {
> +               compatible = "simple-bus";
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;

> +               pcie: pcie@11e40000 {
> +                       reg = <0 0x11e40000 0 0x10000>;
> +                       ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
> +                       /* Map all possible DRAM ranges (4 GB). */
> +                       dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 1 0x00000000>;
> +                       bus-range = <0x0 0xff>;
> +                       device_type = "pci";
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       /* placeholder */
> +
> +                       pcie_port0: pcie@0,0 {
> +                               reg = <0x0 0x0 0x0 0x0 0x0>;
> +                               ranges;
> +                               device_type = "pci";
> +                               #address-cells = <3>;
> +                               #size-cells = <2>;
> +                               /* placeholder */
> +                       };
> +               };

That's a rather large placeholder. Do you need all of that now?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

