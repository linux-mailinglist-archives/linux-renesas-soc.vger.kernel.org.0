Return-Path: <linux-renesas-soc+bounces-33022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GJ7JA97EGrdXwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 17:49:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6325B723B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 17:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6806130AE86B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B3640960E;
	Fri, 22 May 2026 15:28:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AF43A1CD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 15:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463729; cv=none; b=bTnfLULGK4MvzLtK2/RG4y2ETZixHdn/5YNHULJqT3Mab3Z60l+hdloZzTx7bIY5k2Sgi94p7kwdydL3KK/EOhkbEV2wUaExAmXKRnqrl19eDNvc2hm/XnWcxcaaUtLvCQqdmOmUDe0+FAVorXXxltcWsU3KOEHtmjYGro+HhkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463729; c=relaxed/simple;
	bh=kN/9y9XwGUDJ1nAC1IWWtL6XoKcE5qMK3/fWnrEnzQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2i4yUaXyln6py3kYjKi1coYJoyBZ01/IsgtredhIYSKlFd788Xsno2ihPVnZPO75Js3WeKyPDq7fyz5tbIYv+AIMcpRs9rNcq8Y19JLUhLlGDJqvVHOzdpGKl5wvL/HZyJEP2Fba/X5zTP0A3lIOWHWjoh37fpXqUt3ZP7nyGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f196.google.com with SMTP id 71dfb90a1353d-57524e52a3dso6126628e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463727; x=1780068527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szBb9VN5OI/LxN852+H6x+3LXcGPvGU0m4BLzBAkL+k=;
        b=rESWXidUbcerx+MofUtSxCwK4Boby1nbq77gx4f+lBS0FlcFciPSQLN+S0z6DpL8pm
         mNLH5EWBmhTBf16e3ZcnWhsbmgdRdyzIeHKz+JnSM5OYjKUG6c3UdgBmhm/IlwC3vhgh
         yo9mvIye04tHmH+TVXBBVcy1sdUf08ZnvDTrLLYhakJWQiUtfK4W159KtvZ31fs9zmkI
         TqXJWOdpAm0PrGN9IefgOEn+RMU/ix47M6P/N/AjX7gBT2Q9AA6h6UIR+7D5H+rl7Sla
         YbB8SzRrhjJiIdIFE4FD8VkrB31ZwgmmUMCkCglu/G3VuS56zxVjZiqPkEoPfMiYhJrU
         ubZA==
X-Forwarded-Encrypted: i=1; AFNElJ8/gfAN3AjJ8wUIkL+KX21b9rjgPp5+OqditkGPoTlZHzFxNL5dElzHnjuDm6lFhaKNjap66f8m9Ix2UAOcRbb5mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkMp6XGv14cX4G5ZMQ67IiMFZOx1KQG1+/8AhbrNiDMWCNujSH
	9MXo83igvNPsg6Alma6m34ToFfOixhuw/5sVnfptQ4fWMWKO7hte79j3Re3CaNNA0dLMCg==
X-Gm-Gg: Acq92OF5jvJKtcXQi9dqHUc7ki4jmPwXWfFzdOGGKUF+KqOg0sDnNRe6nDyY0z/UAMk
	AAMdzzue4ZRBhiOe3H/rMjhiHCVTQErsnGMNtGAAgS43GNL34OzmPsYxxb38PslAQJMVhtyQTnp
	Bh4OS+LyHOwXt+QgCdP1xfJMJ3bGcNckSammeb9SE7gscEVNrIAW6ZimuHGJN6hYuXXTzEdA9zc
	69lxiFK9o6KDbbyEql2dRtf5/FlBtyQOMT6xfmUfoDu3m2D3a8WiLqEhPeGrRqum+BYkDNjUc16
	3GJ6S90tjtRlJ1zc/3oQ8543ZdPUnhz79b1Cs9+LZ6/qTCY8vCk85r2uZJ6SfNkEhaCMp92W3p/
	K7zKAU8NRyr3LdgwrqTEO2eiQZb0XDQL+AIipp+rrTcR1k68EL5Zm/Z18sGzm0NQuqe2M21nRVM
	iejp6aZp/sWr/78QcIuMHCWhmtrYI1igQ6mUORKWKyuRaW07ItEcoXowZAxOlm
X-Received: by 2002:a05:6122:2203:b0:56e:e80c:bb25 with SMTP id 71dfb90a1353d-586649efacfmr2614934e0c.13.1779463727371;
        Fri, 22 May 2026 08:28:47 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791fa49sm2599163e0c.12.2026.05.22.08.28.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:28:47 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-631466587e9so5517282137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9RkIVK0Pro2yhDL3XYLwK1bZcDWeR8BwBBxIkOX4XAJNPYHoNrWfz5Mnvv5cwVsJ+gT+Ex+8+0DUXzuy4yRRa2Vg==@vger.kernel.org
X-Received: by 2002:a05:6102:f8e:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-67c70e5f66cmr2706370137.3.1779463726809; Fri, 22 May 2026
 08:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:28:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTsoEH60DBWCNnXzaZmfOcDfZ7vEaUgJetqqU-qwBxXA@mail.gmail.com>
X-Gm-Features: AVHnY4K2cO6mOrwYyMVCwX6fOKSnvdh0vCSY19G3lWwxUQ8j7rXhdTpY2ZF4U8M
Message-ID: <CAMuHMdUTsoEH60DBWCNnXzaZmfOcDfZ7vEaUgJetqqU-qwBxXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: soc: renesas: Document Renesas R-Car
 R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,microchip.com,redhat.com,kernel.org,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33022-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,glider.be:email,linux-m68k.org:email,mailbox.org:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9B6325B723B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
> SoC and the Renesas Geist development board. The Renesas M3Le SoC is
> a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals. The Geist board is derived from Renesas Salvator-X/XS
> boards, with adjustment for the R8A779MD SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Add AB from Conor
>     - Fill in Geist (RTP8A779MDASKB0F10S)
>     - Add RB from Geert

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

