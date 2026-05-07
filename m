Return-Path: <linux-renesas-soc+bounces-32234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJikIX1//GkcQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:03:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C14E7EFF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71DCA3004F27
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7270390C8D;
	Thu,  7 May 2026 12:03:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7D38D6A8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155386; cv=none; b=tGYDn5MzY08v5DS9AnfFXJ5tpJxrdPtyZSaKh5xxo/BBuM0IOvgWdEMwye9Hf9GjgHvbDCc0zzfO7BfEfMUDfFlt8n7Xnr8jD7x0b08C0O6ZMGvOtVAJIrCh0Bg8Cwf/YibYvtZqM+ec5tQmYQuxwANAzN+oOqiezLawA3HaBxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155386; c=relaxed/simple;
	bh=p+XWJXs8Fb2LlH88N+M2IGyKYxsF2z5kQ59hgbl3aTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3pFehBMrJ0z5oOLki7a4E/TjuTjJvmu9PecCFYyQlYH6cWtQ/NE+9Esr6Ktm0MesqbWw1DjsZEiJjSw+ZR3tN5jzg0ybvS39KIyT0kskXUmZGki2iK2ASz8Fo8a0/7twKvwc+ZjCWIzHwIiVPrq4B2ZbSo+FhIPrdGU/v/MvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-57516e08474so510367e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155384; x=1778760184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08k+FLSK8wyyvtw3toL3M525xsZ0Tw/gihnmIZ5j7rs=;
        b=ZApw0MmoltXzyNV1qKHAwgA2XyZvQc2Z98Q3qpifUCDnCjkUBcRQcjB8GKR6yJM+bF
         d/rT2HFYd0IWghnbXa/RaKGTBDUE+dR+2kIxao2UJUIDZlhy5bZcBK2xMNEd1XI03qNT
         JMyt2QO05OEmob6hF+OthrFvjvJ4U3jHDWSuexg4mMhBCtbwCZ6C6D5Rf3oLkSrEJ2EB
         1KD7YjKFr/sXMdQdPKHFgzAqpJDYZslvQxqFTv1x9S+QVxOOKAmEDIhhMTd6RxCVXzFA
         Jx2VQqmIfFmAEZNAF4H6eaz6WvRehyIz7C2qWEYRqEnNWniviPboD7bkruKYq+w/ysGD
         aZ5g==
X-Forwarded-Encrypted: i=1; AFNElJ8yyQfDVVn/S60kyeLgwPgOsLjWldjvg7FY92ArLr4ZAVbB3S8xK3oCbYcVvCHHKCVQCCAkrThe4Y9hFmUgkkI7NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhGSPEYeQZzCsTTCn+/f+qK/RIuSu8Jo+qXVpURZVBmrwN7k04
	Y/PGxjYb55vYVfV/YqJxA8Y4iHvRsbIKfYJ2z+vQLcUgtTuLgmL2xCCtq0sYbLCUENw=
X-Gm-Gg: AeBDies1wrwyIgt7obknHXJ60nsSXqBFkphKCC19KTgRuStWrSzsl0VouKPIC4H2tKL
	EkTpPXH5l+mM8olcX+XL9d/h0LtQQszqM5ygmhJAmzqccNktiXn2Cx/2FqivLdGkSrtxuBbjXcP
	sBrDkbTBkjjT1RyAG/LTZjEZr5uzygjqUz1wDtmQfM6Vn2YbDmPFYH7WnPREYfQslPWV8YjJYJ5
	UNPLXEqBTHVDIfrYs6F0j19dEfLs9iaiPxV4YcIs1YRjwEeH+Eq2mND/nrt7pIDcBIDW9E8lRoE
	GBYGL80TEbP6jGKb524TP7AUAVwZmR3Cm2EYv9YmKLucMx5I2jz8ZzznSf7kisp58FKPZwAJ6Ne
	s/x7tD/W03vpWCcptInw5AVAEtd8utqte5VTQEfIq2XC4FW6fV0nzAhZoo7VmMhH+8sYYM42DBw
	oEEUsolu3P2hRWqra15cSI1HR/LzLV2KGCysp1CgXGbSAYcmHTfw6Xhhin1mhY7ETlbCQ+rr8SZ
	N0nYgCxctZUoA==
X-Received: by 2002:a05:6122:45a1:b0:575:256a:b2fb with SMTP id 71dfb90a1353d-57559688400mr4702909e0c.9.1778155354692;
        Thu, 07 May 2026 05:02:34 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce08f4a7asm10353414241.5.2026.05.07.05.02.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:02:33 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso783936e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:02:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+TqEnawkErcUjftHu2ASBVXfLmlkv3NrjHjiP7uwSU5JFqQWYwMqwdl7ppF40ZNhGZnt4+EaqKWOgGUAF0MjnSOg==@vger.kernel.org
X-Received: by 2002:a05:6123:2e5:b0:56c:d5cd:1e7c with SMTP id
 71dfb90a1353d-57559559f3emr4470964e0c.5.1778155353016; Thu, 07 May 2026
 05:02:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:02:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9_UQ7ucnxGZ4GJFbzsVZOvewG=VtwsBj2XwkRJPQa3A@mail.gmail.com>
X-Gm-Features: AVHnY4ISlb6BiUDz7sER5C3jekDZJDnjIykmuY5F806Vt0AJOxMiMVOOAVqLUqc
Message-ID: <CAMuHMdV9_UQ7ucnxGZ4GJFbzsVZOvewG=VtwsBj2XwkRJPQa3A@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: renesas: rzg3l-smarc-som: Enable eth1
 (GBETH1) interface
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 0A7C14E7EFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32234-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Action: no action

Hi Biju,

On Thu, 30 Apr 2026 at 14:53, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the Gigabit Ethernet Interface (GBETH1) populated on the RZ/G3L
> SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped ethernet-phy-ieee802.3-c22 from mdio1 device node.
>  * Fixed typo txdv-skew-psec -> txen-skew-psec.
>  * Added hotplug support.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -83,4 +117,31 @@ ctrl {
>                                  power-source = <1800>;
>                 };
>         };
> +
> +       eth1_pins: eth1 {
> +               txc {
> +                       pinmux = <RZG3L_PORT_PINMUX(E, 1, 1)>;  /* ETH1_TXC_REF_CLK */
> +                       power-source = <1800>;
> +                       output-enable;
> +                       drive-strength-microamp = <5200>;
> +               };
> +
> +               ctrl {
> +                       pinmux = <RZG3L_PORT_PINMUX(D, 1, 1)>, /* MDC */
> +                                <RZG3L_PORT_PINMUX(D, 0, 1)>, /* MDIO */
> +                                <RZG3L_PORT_PINMUX(F, 2, 15)>, /* PHY_INTR */
> +                                <RZG3L_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
> +                                <RZG3L_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
> +                                <RZG3L_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
> +                                <RZG3L_PORT_PINMUX(E, 6, 1)>, /* RXD0 */

I will sort in ascending order while applying.

> +                                <RZG3L_PORT_PINMUX(E, 0, 1)>, /* RXC */
> +                                <RZG3L_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
> +                                <RZG3L_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
> +                                <RZG3L_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
> +                                <RZG3L_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
> +                                <RZG3L_PORT_PINMUX(E, 2, 1)>, /* TXD0 */

Likewise.

> +                                <RZG3L_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
> +                                power-source = <1800>;
> +               };
> +       };
>  };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

