Return-Path: <linux-renesas-soc+bounces-29886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LayFt7pu2kKqQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:19:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFF62CB104
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4549C305E379
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD84F175A78;
	Thu, 19 Mar 2026 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNHvFdiz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3641F2030A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922638; cv=pass; b=W6+rnwMMyu0ZqgZ+OWoBpppFzqnPX0Q2l4LuzhGm70+ml8Fu34pnF6ySQYKNg/sSVljrTDxMIXBgc0madtoo1S49rQMrZjeKpQxpwPcJAtqCQ2XhzSDBsxR8eYMDkjHG2HeoLy0kSqYZiyCjtm2gUHNK+RxzSim8p+xakAoqvTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922638; c=relaxed/simple;
	bh=SwCggdTxaOgnzm4dGDW5IWh8viu0UqplPRQKc2PqBJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FACMyH04if3jiHeXeList0FB8y7IwxbXwYaRxN/mb8IFnnJpaV1a/g6m2pJFlYwG75qpbM243TwT/dwUq2N1on+s6x0/Ui4L5kHrL/bvKknfpWT3Zw2bbuTNJ5D7IkQ44B3O9ejWjJS8nlV2fH3nXcUI2YY2fPjPFgKeoa3jK/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNHvFdiz; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so6954235e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 05:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773922635; cv=none;
        d=google.com; s=arc-20240605;
        b=N3+dBOmlZRjKFoKVER4SeaU6Fim/Gntem6Bdz3Wsf6zQb1IRMlAdPtS8R20JkIhgi5
         ovfZgI8bUmI0WhpmJeFAc5eKitj8rWNJmxvXDo/fgbAA5LgDLMjInOk7DLjNwAsjgqsW
         jTygs8jL2XFZvYOBAm9GtC39hnPMShLNkr8M22ml+6Wo9bbV+vu2IjrnRE33cnqVE0vi
         3UKvbn+pcgA/zmvvqDSM8y/iu3u/XJ9PQEkhHNAtBkitScm9ES7vG+iYISItcV6dQarw
         qbjEkMlJfknlBNHSkfg97Lbk5/Z5eGYxYwgzw6Tj8qc+NgLVslVcm8/4CWKocEZsziuc
         dyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=21ilbjuNC0oBqcKWgZWCjkwsXOw1Gq5+6ZwV8kiRzTM=;
        fh=cWT/lRYj+/CNIikECdN62ijcdrbXoh5IOhhgXpSI7LQ=;
        b=Bsgo7Js4U6IhURo8gyAdm2YIjaHdU6xex5yJbEzf50Dex1PaHtNk66509rqcaPzdXS
         LyCxWauRcWYGhXcXuiSfezOzkhltNuEWsDZMwpcc+9UwhsCi1xckcxVQcphgBTOXzsLY
         5v63aDuVuc/gf/+lUFY+KGVmFMAFkG4DXYhbYW6RTsHCHUuRxQDgASowHy83/ocxsoyW
         ICTCYkKJp4ZBmN7ULHxuvsC15eQy9gLAzo/mWhgraUYbiB2WoBJ9FIhFr2pC/+IP/iL2
         NggVLbWJag3INVxZRJChmD8mcLGeeZQ4vY1f+Tt1+xYgHSVIVHGVRz3SVIrPdSDDTt5c
         G1zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773922635; x=1774527435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21ilbjuNC0oBqcKWgZWCjkwsXOw1Gq5+6ZwV8kiRzTM=;
        b=SNHvFdizZZKLlvUnYVb8XsjfMWGytA2DeySCUel0XxUaHVHRU7exfLfM9QZtmWAN+h
         uLzvF/BCiQCXtGfAh4gH4kUSBO7son5d+QMTJMdbT+09X0wedjWSFf/b2ZsFbaZencHU
         nr4gh2JmNbup4LXwd8QwRwOIgd/ZhvIanwZ91RBywLNHkNd0iNjTltecj8huVtOVS/Zw
         QPHMNiLLIWPkMMSgu+feLMpolnQIre+sswRVcsww4wc6/lOWeay0f41wvFTaBrFbbdb8
         H82Dm5w4KGcXhuxhLz+b9GFUiRR3z+JTVnK9+BQ9mHAXZJ/WcrWqWzhjyjBA/hxaMfZo
         0IGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773922635; x=1774527435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=21ilbjuNC0oBqcKWgZWCjkwsXOw1Gq5+6ZwV8kiRzTM=;
        b=kF85KYKx1edVCSvJ7TPgp7a7VS5Ov7/NItMvf4jKirx3mz23sRmloIiHIkHoVBf7bB
         KcKAolWpPRW2PoPE7ZRtyzVnXp/XHNP3ux03EqwaoqNrNooy277/kOEfuNs/XlTtwuni
         jXg0HDpcrAjRAJ1piWcvPkGILliQkzdYGGXrIa2j+OQiaL4Y1I4ARNIpBC0SxAbiUavO
         GgeCE2Kah2nqc+2hueAaOkk2L/bEly5Taa/ANK5zuYBqSpGcMPvt/kyySM8pgKgp8D1D
         PkqhNkU2acufWRVYDYIOMUYoYTfPKlBbWZk7FWrxPRF4M16BpcNRVpvqhOlM/gA25hIu
         W8ug==
X-Forwarded-Encrypted: i=1; AJvYcCUgJAvp6aVQ4hCX9iuH9Mixhz+s+1vNESDfwP9HnggO4WHD8DZh6QNol29BQfJH4FJ2kZh9cd73E9iFysR6GPrTXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU7qtJsPGqiHhRvAdnuGpVAe/8XbN6SzKeXDYkWjGyqTgTA6b8
	l1QHZC6l0Jj5KjhIgN+3G5M/6MdYqL8OiWpudWKqp4wJqvsbVx0/8i5wJYK4yk7BcnKzmM3KPvT
	7yz5CDdHVSrv7vJvh9U7e0kGBQm8yfiFQbgRMi5UaBQ==
X-Gm-Gg: ATEYQzyNkCWiq/DRPUeLiT3Qp9JfvaVkZuUp7pQYhU2ZUjedGlrr5KZwNfuGcgWXBl0
	1RX9xzG4FWxGkrBdvje4t5/6ZzmknTGdj4iRjQ6ZpM4c7pmfawpA1DrIi7kMZZ5LATA+QdsUgMw
	unsVTRC5dNZQgummn0wA0wSjhslQm/lz2WnHKNGEHAZuJrP1QOk0SCtwcfR3kb3aEtqyBz44OaD
	zOwbGEiQm7HDISKVPHh/ubzGtTrOb4Q43SJ8TTa/pYQNqzYT4IpNcZRTf0hqWqAJs4wOUzo0kzp
	IkI69SF5VM9kteOD8XcvdhBsr2TDwN8AKAmPrJGA7A4Oi+ylkDbv4WU8JY1K2kqvoyL30Ehx3Pm
	aEV7STEFt7ogJfiHT1p28FjNsWw==
X-Received: by 2002:a05:600c:810c:b0:477:b642:9dc1 with SMTP id
 5b1f17b1804b1-486f4475342mr116479195e9.20.1773922635175; Thu, 19 Mar 2026
 05:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4ce75f75a0569a4cc6f74dfda8b75f6f1a2495c1.1773842409.git.geert+renesas@glider.be>
In-Reply-To: <4ce75f75a0569a4cc6f74dfda8b75f6f1a2495c1.1773842409.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Mar 2026 12:16:47 +0000
X-Gm-Features: AaiRm51lDKJiyDMRjLR6PdRV65bY-qlwMnmYthicRSEOPW0Z71EeuFLE0ovF12g
Message-ID: <CA+V-a8vtA4-779BNJERDoKP6ZE7Xdmap3bS3d8Z_OHGjAfk8-g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-rzn2h-evk: Fix GMAC pins sort order
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29886-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.400];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 9AFF62CB104
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 2:16=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Restore alphabetical sort order of the pin control subnodes by
> exchanging the gmac1-pins and gmac2-pins nodes.
> While at it, fix the index in an incorrect "GMAC2" comment.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v7.1.
>
>  .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 58 +++++++++---------
>  .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 60 +++++++++----------
>  2 files changed, 59 insertions(+), 59 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> index 52e5f6c3ab67d177..4c0e52850ca97250 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -253,6 +253,35 @@ can0_pins: can0-pins {
>                          <RZT2H_PORT_PINMUX(24, 4, 0x19)>; /* CANTX0 */
>         };
>
> +       /*
> +        * GMAC1 Pin Configuration:
> +        *
> +        * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
> +        * P35_0-P35_2 for Ethernet port 3
> +        */
> +       gmac1_pins: gmac1-pins {
> +               pinmux =3D <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK=
 */
> +                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> +                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
> +                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> +                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> +                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> +                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK *=
/
> +                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
> +                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
> +                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
> +                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
> +                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> +                        <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
> +                        <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
> +                        <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
> +                        <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
> +                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC *=
/
> +                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO =
*/
> +                        <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK =
*/
> +                        <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
> +       };
> +
>         /*
>          * GMAC2 Pin Configuration:
>          *
> @@ -283,35 +312,6 @@ gmac2_pins: gmac2-pins {
>                          <RZT2H_PORT_PINMUX(31, 1, 0x0)>; /* IRQ13 */
>         };
>
> -       /*
> -        * GMAC1 Pin Configuration:
> -        *
> -        * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
> -        * P35_0-P35_2 for Ethernet port 3
> -        */
> -       gmac1_pins: gmac1-pins {
> -               pinmux =3D <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK=
 */
> -                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> -                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
> -                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> -                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> -                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> -                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK *=
/
> -                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
> -                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
> -                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
> -                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
> -                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> -                        <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
> -                        <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
> -                        <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
> -                        <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
> -                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC *=
/
> -                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO =
*/
> -                        <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK =
*/
> -                        <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
> -       };
> -
>         /*
>          * I2C0 Pin Configuration:
>          * ------------------------
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> index 3c636c92f3d6f445..ef6cc7497c2c4c8c 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> @@ -336,6 +336,36 @@ can1_pins: can1-pins {
>                          <RZT2H_PORT_PINMUX(12, 1, 0x19)>; /* CANTX1 */
>         };
>
> +       /*
> +        * GMAC1 Pin Configuration:
> +        *
> +        * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
> +        * for Ethernet port 3
> +        * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
> +        */
> +       gmac1_pins: gmac1-pins {
> +               pinmux =3D <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK=
 */
> +                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> +                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD0 */
> +                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> +                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> +                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> +                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK *=
/
> +                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
> +                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
> +                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
> +                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
> +                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> +                        <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
> +                        <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
> +                        <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
> +                        <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
> +                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC *=
/
> +                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO =
*/
> +                        <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK =
*/
> +                        <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
> +       };
> +
>         /*
>          * GMAC2 Pin Configuration:
>          *
> @@ -368,36 +398,6 @@ gmac2_pins: gmac2-pins {
>
>         };
>
> -       /*
> -        * GMAC2 Pin Configuration:
> -        *
> -        * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
> -        * for Ethernet port 3
> -        * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
> -        */
> -       gmac1_pins: gmac1-pins {
> -               pinmux =3D <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK=
 */
> -                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> -                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD0 */
> -                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> -                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> -                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> -                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK *=
/
> -                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
> -                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
> -                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
> -                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
> -                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> -                        <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
> -                        <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
> -                        <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
> -                        <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
> -                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC *=
/
> -                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO =
*/
> -                        <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK =
*/
> -                        <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
> -       };
> -
>         /*
>          * I2C0 Pin Configuration:
>          * ------------------------
> --
> 2.43.0
>
>

