Return-Path: <linux-renesas-soc+bounces-27446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DfZGVCWd2n0iwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:29:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7C8AACF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6E433034283
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A783433D4F9;
	Mon, 26 Jan 2026 16:26:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EF933E34E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 16:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444761; cv=none; b=fQ81B6//NMEBLD9ZeWas8/iWaqvjjefl7xygIjJWS/RDrYFCrJ41kvuDra8tp7ZjE2eLSzX4be+yWIl09Ie0xaYMbvF+nnsx9U/c2G5NlYQELc129EgxEgQ4zadg7LUSueffqyoHNEt/UqEgjcP8aacZB6OZnXBbyUfVXAUCPkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444761; c=relaxed/simple;
	bh=jeHSu/0rLnErxu+4kacTQN7/ETAke1VzTLPnHuzsYbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+7lH1TPZ4eLqcQflo7J43KFpM7Yxsj4Mcy4nvTCJLUA6UNKNB8ZZUlc5zRXJkSe4394HqehLshNWG+X+ws/cPRPTkCBKTE1qOoPxcGUzCvoXZ4+ivV6Io4sGcG2w/bj9so4rgmeqkCKdHZRU0PV4f/AiOjgqZ29UeRISrKuvFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56646a34c18so1009412e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 08:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444759; x=1770049559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3+3G5DpRreCC8uJSTxge0l/WrGM3k8EjLKp52pyAPM=;
        b=rEPc5NejsJtTaJau+2DoV7XfTq+VHDz+VnE3Q8MOo3HbSVHqmGA5sfe+ysyWWMs7KY
         Tx594t4C/LBodIGacYaTdME0rT4aOO/CdR8rfoT2/4uEwQqAnCJXqc+Yd8BRFJ77Dd7o
         Hi9ZQNsTEZnKWOk9mCuXMUqwAEYGjjXU0Gtm/fpy1pSt0RTliHa4xG30VCKKjoZcfdeG
         RFV9c4RbGYMHKdsOvfmlRyrYwjDMYkv/5CGNVjJlt29sUR1xYN6yjlb10LLafpGWkNdk
         0u7bECYvvQr5Pbe/EiAhNw8Lm0nWTY4H+blYvyyJ327lljOWjejLdyH7+AQ9IzPFfdwi
         k0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXvM7XRcOnYBsD8dqj1nKnVsPIdfJuRpocN2Opu8bSozyGG9Eo2BftJf5BjQnXFvZdMI6zas5mJ63JToFyxHuyAcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YznXvMnE9iUT90Wgu8eqvHyB8mf6leP2OqkcjQHZnfiy44Dfq5n
	XHSuBFHTFK71oxgMNqxoTTfco52ajFzwCaVIrMwbodR7eh42AP86pdhoYEir03V+
X-Gm-Gg: AZuq6aKP6eKiLsrcJq8gY9zBNBW7fAlEudfNElBRltWfrRTbj0dKT0T3gQVoG+rZZRB
	B3gOGUHXynnt+ekY8bpKnz3kHu3KfmAC+7DpiMnOy7CL25yGuhtTASysh0ByKLmY7mGzcIqqHtA
	K5omLF8eczkI1fLGfiy3brpWuxp9swxj1fUudnY7zDijXeGrpWwxDJB8/aZmYcSkPwc87y61i9L
	uP+ESx+yvDpLgV/fycqUe0wrEa5O8kzdMy4rLKNbj/Th2CUo7XrMAbsT0u9COlDYNca3oPzcoha
	iEdgvNLoUrW4Vw/1n36o24VA5G5dlQiSvfF5Ti94y3oOhuf4mchl66GeCNXxW4sMAIgrNPi9ld/
	WR310n/v7Kmj1lOnekIqKqzvMy5909FxLBaJOwb4ba29v9/Qmz6PDNnhFzFOwZxcFyRh05fdHQ3
	AyJztxqhTUAimcF63Jef1siRHvVClK+NHu05NkHMsbl/UI79pJ
X-Received: by 2002:a05:6122:6598:b0:557:d6d4:2f51 with SMTP id 71dfb90a1353d-5665c985b9bmr1193560e0c.8.1769444758664;
        Mon, 26 Jan 2026 08:25:58 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb7f18asm1821572e0c.19.2026.01.26.08.25.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 08:25:56 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5f539e05d63so1451371137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 08:25:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdTI1aQhxYUQt58qXTB3KgWrzVCKqw/c6WC+mOJp6bCGtvIpXBYXiyh7zf1XN1c1vPaZQGuqFLud/Syi/jKALWFA==@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:5f5:487c:83cd with SMTP id
 ada2fe7eead31-5f576578dacmr1239125137.40.1769444756176; Mon, 26 Jan 2026
 08:25:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com> <20260120150606.7356-5-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260120150606.7356-5-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 17:25:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
X-Gm-Features: AZwV_Qj7C5QJV_NVmMjfo_DCwWSlKdND6uVkPz6tMvHd1cTcE5aKBSokWc6r0H8
Message-ID: <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27446-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.12:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,0.0.0.69:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: BAE7C8AACF
X-Rspamd-Action: no action

Hi Ovidiu,

On Tue, 20 Jan 2026 at 16:06, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add versa3 clock generator node. It provides clocks for the RTC, PCIe
> and audio devices.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -108,6 +108,12 @@ vqmmc_sdhi1: regulator-vccq-sdhi1 {
>                 states = <3300000 0>, <1800000 1>;
>         };
>
> +       x1: x1-clock {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <24000000>;
> +       };
> +
>         /* 32.768kHz crystal */
>         x6: x6-clock {
>                 compatible = "fixed-clock";
> @@ -277,6 +283,25 @@ raa215300: pmic@12 {
>                 clocks = <&x6>;
>                 clock-names = "xin";
>         };
> +
> +       versa3: clock-generator@69 {
> +               compatible = "renesas,5l35023";
> +               reg = <0x69>;
> +               clocks = <&x1>;
> +               #clock-cells = <1>;
> +               assigned-clocks = <&versa3 0>,
> +                                 <&versa3 1>,
> +                                 <&versa3 2>,
> +                                 <&versa3 3>,
> +                                 <&versa3 4>,
> +                                 <&versa3 5>;
> +               assigned-clock-rates = <24000000>,

Shouldn't (at least) qextal_clk and

> +                                      <24576000>,
> +                                      <32768>,

rtxin_clk be overridden to point to the corresponding versa3 outputs?
Same comment for [PATCH v2 5/5].

> +                                      <22579200>,
> +                                      <100000000>,
> +                                      <100000000>;
> +       };
>  };
>
>  &mdio0 {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

