Return-Path: <linux-renesas-soc+bounces-33914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MBjbCzDVK2riFwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 11:45:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F716678698
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 11:45:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 877E9302FA9F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 09:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332D215B971;
	Fri, 12 Jun 2026 09:44:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6041279DAF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 09:44:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781257484; cv=none; b=bUtJkEmK0cSBYPm2TKsApGRq3hzMsbAfbQ7NovC7D9rj/+Gk7K8z5hwzDSPx9U6HLU1557Y/k2woLlZHtu1dBMIzzpvrdXeet1GWM2rRrMR7ryqB+DJoG8IF/kj6BptkNgEE1+LL9SACla62WREqCfM8UvA8ass76t3TdAUz2IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781257484; c=relaxed/simple;
	bh=TsdwKdc9yokgTj1o1KWL7wDregVHwkh9wLKY74tlLjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ml/Q/VXH+ajBfVsUaLK3GXM/6Bx/JRUqULseLmRAcHkz1IHacRixcBu6k+c+DV0DNJsvzKNkJxcAoF5EUlTkPOPq8VCwoO8iQ/XCQB7f1iHHukdCg+QIFVH8k0K5ZaoE80spDhGrPnlfztTkOilN/82kFTjWiY6gtzukQTyE7XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-963a722ed58so515806241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 02:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781257482; x=1781862282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ekw+Oevfx6i4xq0d1g4dLAXWaWK/4ZFI+zNuRgMbC8=;
        b=snJxgCNeSjVnEW8xqkrifnYKNDli4EkXWx8FzieXc1eF4XrntaNZkLH1Hpzx+gbv4a
         2eiAmXZyoIuwmlo+5Qm1UMFQqaYTbFVtegZesUqiN44bE8a9twUg0ZFStMMJJOqZtq2t
         bTyWtYLAa4rJQNtli7neG+Dpto7I0M6UIkVGDtDyF5GV+za85dHJ7DxDXaaZjKU/HyQ5
         wvAqNVQ7XDhcR5nR2QPebK5ls3MkeULAQqynHT2xsN/9CANWfXyGOQWUrN+LD2L1EOcr
         4A375Ygk/zqI/52r+rt3dJf/a/jTxf+eyJeavZOFusxWR7aiZvEooX3Yj6cDXCnpCZsM
         ec4g==
X-Forwarded-Encrypted: i=1; AFNElJ/fp2lkkRHyIFesRT0SbtN/Z9mSrVJGqPsBcchhNv1nCHL4+O+tHwPLvv5s/aLxdCmPw/5v7bxOY6/G9FbWa0mB3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/xRyt6jYgFOp6A+W/V/zd496fsrgMHxHiydTzSXaa6lkC5fqI
	aYVUZbGK97p4viWoNV32FXBzmQYqI7cT1w4m+68G/JZA6iDORXSLV17evIme0kpW
X-Gm-Gg: Acq92OFY7z703fVzzyj7hl/WsSYeRdb5g45qPpGQyBsHzDae+5BVx6dboMgcbC0VNoC
	5vBUmrDu/bLKEL/iQxhUpWMPKfqr7f6hy/5+2wbtHvQMfwwCQJrXlITGE/zphjaXkS5rb+HBUBz
	PFrNfRQUx+xBbsClRV5r4Hlo2ZnTy6XjdnL6xdePfQRHeQMWmh+AetDqU5/eKa/gf2RF+f5Ntc8
	Fj80tRydN1r1CHb+NI/GfV9QjY5h1UZGQLz1rfUOWM8mRBjYwurckQ+mBEx67Bmbl/EoiMXKxpQ
	KCMxIJtFK5v5Zm6WCcWYIHgjTH5JDAfs3DCTxwGbIGhJvl5lohh5Yq0nj6cXCMhMIJMkIzCADLD
	ZXLRt44BfeXnfV0wKNiX0rIVhlFPuiFNxC8+qCLauSP1wnM/4jkJhCFLkDd0ph/UwgrV5aexrZx
	P/X6coACxXd87uDmJgEou5+E1wQCcbhf3JxElOBX7Ttd1AErwoL3R5jSY4L4MF
X-Received: by 2002:a05:6102:1527:b0:6ef:db57:d472 with SMTP id ada2fe7eead31-71e88fce218mr844946137.27.1781257481929;
        Fri, 12 Jun 2026 02:44:41 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-71e88aac49fsm950588137.12.2026.06.12.02.44.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 02:44:41 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-96358d0a024so504949241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 02:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9J/ryipfd7YUyzHVqfsIKaStZwPk5fDYoKmXj7HWwBSgIbRryWcST0fK7fklfsPkFObsHufu0z00VzB6WdxuVSQg==@vger.kernel.org
X-Received: by 2002:a05:6102:1527:b0:6ef:db57:d472 with SMTP id
 ada2fe7eead31-71e88fce218mr844922137.27.1781257480541; Fri, 12 Jun 2026
 02:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612092851.2141782-1-niklas.soderlund+renesas@ragnatech.se> <20260612092851.2141782-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260612092851.2141782-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 11:44:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXq59znV1uatwVyszTh5PjR96Ay3DTe=TzP9VxgKm5W_g@mail.gmail.com>
X-Gm-Features: AVVi8CeFKC4WGhTZS8WnXOfTTINM5eUjUYYQa4NqNv0sVR6at_JjsT2cJ1T43Ag
Message-ID: <CAMuHMdXq59znV1uatwVyszTh5PjR96Ay3DTe=TzP9VxgKm5W_g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33914-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt,netdev];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ragnatech.se:email,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F716678698

Hi Niklas,

On Fri, 12 Jun 2026 at 11:29, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The gPTP module is shared between the RAVB and RTSN Ethernet devices on
> the SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Rename node ptp.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -603,6 +603,15 @@ tsn0: ethernet@e6460000 {
>                         status =3D "disabled";
>                 };
>
> +               gptp: ptp@e6449000 {

Please preserve sort order (by unit-address).

> +                       compatible =3D "renesas,r8a779g0-gptp", "renesas,=
rcar-gen4-gptp";
> +                       reg =3D <0 0xe6449000 0 0x500>;
> +                       clocks =3D <&cpg CPG_MOD 2723>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 2723>;
> +                       status =3D "disabled";
> +               };
> +
>                 i2c0: i2c@e6500000 {
>                         compatible =3D "renesas,i2c-r8a779g0",
>                                      "renesas,rcar-gen4-i2c";

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

