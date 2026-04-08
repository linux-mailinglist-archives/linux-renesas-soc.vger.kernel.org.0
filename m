Return-Path: <linux-renesas-soc+bounces-30964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GghNW0O1mmxAwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:14:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D75E13B8D67
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03031303120A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 08:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD04B39D6F3;
	Wed,  8 Apr 2026 08:12:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9234339D6F9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635956; cv=none; b=A/0lxD8u4mkHi6XyEwm4eNETFVJVnchy2auxdZLu+B0szsRi/WevhsQSAV2w3UU8YO9SlPFJJSukdQvZT5ej/zeVV3FJvdiLVJBUdTo1oUicxtI1LGf7KD0WerG0lKAdPS4loA+FEoGMeKkheTiSkHQdRgadtMl0PHFDZFil/SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635956; c=relaxed/simple;
	bh=OO8/V/ieRVIAY7OerP7B4Q+EVWmrnJ0uFfqR67sUp4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4JoXRe0sXMxEzyHe0WbfoYmrQL7tMjrLIUvpdqy+/KQu0PnuQCbf1/g2HmE14InB7UdXKsGyG8alXzlOgLsYqkrcTJi3N4Vq7dsH2GRJCwBwh8C3FnktsgLwd06zeKV4IIWNbhRm4EVUnaq2pxHX8uoW17JvdfM2AiQwdMNrFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cfc5941028so980423885a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 01:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775635955; x=1776240755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UVrHD1kGj3aaIesoTisHRRJzYnLIrQ82+sB6XN35Xo=;
        b=OLihQOPgd6ka+qFvKDaVaNDD3bpK/qg3sNbb/F4CLTh6rihzlo4G545s6xnd/I4f4p
         J71+T1rSdYcpM61HYGhpG8w96RiUYx6JqtDUUUGlkYXPUeNJPSCzSYADKdpzaWqrKB2G
         gChBs21JdrUenTHWlgSsBjWqmo3IYvAOPbs/wiiOimzDfhSR864SVc/18eVCWfqGLtA1
         Y2FDmY0ck9AWMwhWdnk/hie8ARSlXTFg5/QyZAp1sbGgxt/RXsz383/UDAQX98lxsG0s
         lM0DFZPAEG7XQRBAijehOLYEyoUhNS7ES2xSKvk9k9xJtbb2fFQWkVekXRJq3wDjPzuk
         eTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Buk1gi1XE2x75wACPQT2vARWyIogMRJMfkeH5zaezn6HM4cWRF6U39y6SfAo94V52tveSht4GQQ6v8i3m+r0PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmToyBfZBN9JEZizbhYfmpk/VsNNMp/LKswBPDEn4Vbbr8KaxV
	kA2jcXJUzwyxYbPQtEtjjuwAijWQcL698j93j9Y+VzQ2Udr1UOkDr/nSIp7WsQ==
X-Gm-Gg: AeBDieuxv071EJqL46jfl6u7WJ8Q6MCc0KrB7mAySRCrMcz1GcBx1MMyZW7lUmnXD8j
	oEbCutXbX0VQSUt2zCKFa3h89Jkn1kJXSYSAzUD2G5UcYXRPsIKJxmM+UTQajx+HypRx14XWkTr
	FSujmBuoUTkTGuByjtVjuW8cDLGMu4132Wg9ZNq+zbHRqyUrZJl3Rgd83tBBgeGUB7gUJ1eiIof
	Jponzt+sJOU+/MsPUMgIJLnA3uQXSPyKoEZtWEMAj6tSs0zsIa1zsX67gS6MmKV1PpNL+CcHdBn
	xKK2iZnFiZMfLXdf/JTqjrzGGnYd1SoupDi5frPjOqK7Ptp4O3zjNpFGH6Q0GIIwOcq3dhxJNJ+
	T2WEwSnEyDI9Rn/LzmlCoEIPWlo735LZ9ZklHMutUQhw9sj0ZR9c8sQEneVi/61d4HX7BBwmSyM
	JfvD7gLaABF1Q4xsojD/hq9uEimmnyhNnHqbiPd4ZEIs1YFwvbfvMC0QBZjVo+eDyi
X-Received: by 2002:ac8:59d1:0:b0:50d:ade4:adb1 with SMTP id d75a77b69052e-50dade4c266mr56136551cf.35.1775635954621;
        Wed, 08 Apr 2026 01:12:34 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b73e32csm181796681cf.19.2026.04.08.01.12.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:12:34 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d2945e6adso93472641cf.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 01:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcxt8rNEpTZWqgNDz8lzQQNe05G4a12YyCDqhgGklgUOSfRNe2rODb0PeHDP3Y5LOoBDjr55fufiseNixbCy6Z9w==@vger.kernel.org
X-Received: by 2002:a05:6102:5486:b0:602:ac40:969d with SMTP id
 ada2fe7eead31-605a5125dbemr8047885137.30.1775635529642; Wed, 08 Apr 2026
 01:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com> <20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 10:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWr5OT0iAbZMgDAizO9KnhmyUN3hsqFnp+JYRao4aKu_A@mail.gmail.com>
X-Gm-Features: AQROBzB7FKSpqL9vAEkvQ3NeO0nTGrKiA5rUbk_QvEvIe1vD5_FZ5lwMa_3wMnk
Message-ID: <CAMuHMdWr5OT0iAbZMgDAizO9KnhmyUN3hsqFnp+JYRao4aKu_A@mail.gmail.com>
Subject: Re: [PATCH 12/16] irqchip/eip201-aic: Add support for Safexcel
 EIP-201 AIC
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jayesh Choudhary <j-choudhary@ti.com>, 
	"David S. Miller" <davem@davemloft.net>, Christian Marangi <ansuelsmth@gmail.com>, 
	Antoine Tenart <atenart@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pascal EBERHARD <pascal.eberhard@se.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30964-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.063];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,bootlin.com:email]
X-Rspamd-Queue-Id: D75E13B8D67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miquel,

On Fri, 27 Mar 2026 at 21:11, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> Describe the EIP-201 Advanced Interrupt Controller from Inside Secure,
> typically found in a bigger block named EIP-150. This controller is
> rather simple and is driven using the generic irqchip model. Its
> own interrupt domain is limited to just a few interrupts connected to
> other inner blocks, such as a Random Number Generator and a Public Key
> Accelerator.
>
> The one I used receives only rising edge interrupts and uses its own
> logic to track them. It is theoretically possible to wire devices with
> level interrupts, but not in the context of the EIP-150.
>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -826,4 +826,12 @@ config SUNPLUS_SP7021_INTC
>           chained controller, routing all interrupt source in P-Chip to
>           the primary controller on C-Chip.
>
> +config SAFEXCEL_EIP201_AIC
> +        tristate "Safexcel EIP201 AIC"

Is there any platform dependency that could be added here?

> +       select IRQ_DOMAIN
> +       help
> +         Support for the Advanced Interrupt Controller (AIC) typically
> +         inside Safexcel EIP150 IPs, gathering Public Key Accelerator
> +         and True Random Number Generator interrupts.
> +
>  endmenu

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

