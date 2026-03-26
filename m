Return-Path: <linux-renesas-soc+bounces-30322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COggNY4CxWl55gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:55:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A922332BBB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAE3930CA8B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC322386436;
	Thu, 26 Mar 2026 09:45:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1AE386565
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518352; cv=none; b=Ytk0gwj7CCporsWhmIHeVZnQmn2hTJ3rTXCVchQLCPv2VFjYosPahvZ0PsNCIcx2Jt35uTInBOBBJ7XgNIy+z/tlnWD64nosRHPa3eVWY0z32wY2gk9wr+0yXtKiv8boztvVtLtIn6ykr4oF0flY5TSaAUcaU/IA59WnVXGKCC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518352; c=relaxed/simple;
	bh=gfVyTw5dAjjc5IHqXHgZ14Y9JqLHZU9WvnW2xeFFW5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyRvoWe3OXbqgyGHr83XkXWj/7a+BSXIWArcLp1q84UisJYkfTws/YjwMvjZ+w8r5Ytb1HkSoCT3oRXCiapkVmncAENpxfzxVGut341GLdZbT4SI2wC2nsINNE1cJ2pXMJsUM1wwLYBRbLePhB+aquHkAf372d/gBcbSk5oSn/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56adf76631cso389291e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518349; x=1775123149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASd/BgNDcSm2/LLglL5z3Gr32bRWBqPeJ/CuWSEmnDQ=;
        b=iWXgAltlKvyFMH64muhY8UPxK9V8NNgOq4ngJo8jgyXzlsxjMBYIaNbumbewdt/z0M
         h3zJQ1Qtor6wF2cw47NVjOIziyWQlpEVjrsPUFIlnmapabBO/7kaDq2zbO2ntzhpC6UH
         RvKdk3WypA4lCsH7gknBfgVUDfIPh1y/Qjqx++7istlryJhT1QUDVhSyXI36Nctby7PJ
         BUsUJtxW6tG9LHO7S8/lW9SVa7rHoE03SUQNhMqw2OD+wQRl1urVJUr1GlqYHOMprOd/
         ISkA8ewqab+11ksogBdeTRUvoWxpgCz107xKo8RNdM6kiE3qEWGcSgX3/TpHIiOW/oFT
         hq5A==
X-Forwarded-Encrypted: i=1; AJvYcCUIzxYHGFcRxL1GVVVMJ1OolD5b9pwmlTpSZN5iw+cuYcgPwu7xAmQVnWJ+Gk3rYFfs8mTFQ1tikSyvhWbm5amjrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwbT5LVK+xfEvVfhIg6nCkL0YLO1Z09AVTEKaV94ZbqMoZRFa
	thyTRfQn+xcJnzIm+41Ij1x21H9PZn+X/irzdJqcXnSL2wVJs13zjXyE9A243zIUBkE=
X-Gm-Gg: ATEYQzyNPYf/oktOwOTAAQkiyniOrkQamgCNyprIwjzpm8gINoK2sMCcR5IRaqddog+
	Pr8bGK3/tQRyCIUcjcywW1anosAmIiTM5at5t+H0hi5DC36HY9ka0wG6umkfaHsbc0foTkMBroR
	s2BWhhLROIkA1+h9wPdLbfcegSv/XUup9chHcbKtrJgz16Nmprg3DErLGIffG9YS7Anye0yD3BL
	Tlb6r5W2y7dZsXkUdfVLyvNIrJQywaIH0wq9y10Bxx0zp9F1MiRqP9RnyJHEpwxivfd1ntFfPci
	3mAGWlGaNpKNorH/552DSCmZJxUOcMLufXZnsc/kKPC3mlkXh0620V+50lW0WTv0WI5x9fyJFxw
	OhWBCy/s8tfwuo7H8iEZXIyKGQtDqo4qietx07ByUBvmDuWyszwdaNXtdXXqq81xBSb0sYy6YCw
	r7VbXkNgoZdYvXKpfLvVi1fgLKXpkslG8nUD0owuhQ8yiQ4NgSylWZFuqHj/HV1Imf
X-Received: by 2002:a05:6123:a9:b0:56a:e25f:fc87 with SMTP id 71dfb90a1353d-56d21fa0afcmr3089505e0c.7.1774518348759;
        Thu, 26 Mar 2026 02:45:48 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d81edbsm3359420e0c.15.2026.03.26.02.45.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:45:47 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5637886c92aso405854e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8R5XXe0Gyx2HyLwPrTqk+OqnbQ/spaNlASELEcX7Az5W3xwm69c7hd2Wre+H3YDoocy4++RueG/s2ufVNl/w00g==@vger.kernel.org
X-Received: by 2002:a05:6122:32d5:b0:56a:fc35:966d with SMTP id
 71dfb90a1353d-56d21fb12c5mr3316119e0c.8.1774518347412; Thu, 26 Mar 2026
 02:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326045416.223556-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326045416.223556-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:45:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwa47N2VsvH8pBkAD215dr3M-qkA0SXed0vhLS2-aoKA@mail.gmail.com>
X-Gm-Features: AQROBzBx-ZigpBR2T4evThvMi_IdjHn8HsOwRs3EfiLeP9xAlQUuukRrtBVPuG4
Message-ID: <CAMuHMdVwa47N2VsvH8pBkAD215dr3M-qkA0SXed0vhLS2-aoKA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: rza2mevb: Drop RTL8211F PHY C22
 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30322-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,0.0.0.1:email,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: 3A922332BBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

Thanks for your patch!

On Thu, 26 Mar 2026 at 05:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Realtek RTL8211F PHY schema indicates that compatible string
> "ethernet-phy-id001c.c916" must not be followed by any other

This is actually RTL8201F / c816; I will fix this while applying.

> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

> --- a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
> @@ -94,8 +94,7 @@ &ether1 {
>         renesas,no-ether-link;
>         phy-handle = <&phy1>;
>         phy1: ethernet-phy@1 {
> -               compatible = "ethernet-phy-id001c.c816",
> -                            "ethernet-phy-ieee802.3-c22";
> +               compatible = "ethernet-phy-id001c.c816";
>                 reg = <0>;
>         };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

