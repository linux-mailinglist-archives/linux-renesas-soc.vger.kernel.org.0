Return-Path: <linux-renesas-soc+bounces-31748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PVbKL2bs8WlLlgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:32:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B64939A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83C7B3018093
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 11:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C49F3A1A5B;
	Wed, 29 Apr 2026 11:32:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E74C39FCC1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 11:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462368; cv=none; b=uUJP1GRIUztC9ZyzK/dtXo2lbhFuZxHOQKfgv9wA1JMs+C/07pU3+eHBoXUMIRC9n2Df1hIErTCAFtkExqLv76gVUpntveT5MgJkTRCP4kA+R2RunKrFFBK2fsoc8yfm/s88RrciAQJL5WhywHwybTt3le+NhwnK5Cd88NFWHOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462368; c=relaxed/simple;
	bh=GQd283GbRHcL1eMa5GJkNHY5pKpECh6vPQSJWAlvGH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSZ+ScS58rthBRYwM1TGg9cbjWfIMYDXNYEpDKIG78oG1GbT7PFrpajZEnNWV/jJA+Q7Lvqm2oh1Q/3fS3NCyH2c6k+QRMBjzGlhkuYEMO2YBrnCIC0VUpb8p+g2jF5oTghhtoOu8uCGHsp44cqK9m7mP5WqGobru8a0ZrwbeTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56d958880ecso4188169e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 04:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777462365; x=1778067165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4uRNs5kbsz3D4/C3TCXfPmMeHwT6iVUCZwC9U3W8vY=;
        b=ohr34tCM8Ga4D++RSO03IP0RN4/vxb9gyZNikEW3OhuQZAwKkeTDTRHBA6x2JJEdGX
         6zEuoRY7nd4gcilwGqYN3Y43N7OYTsi6zjgMNdv4fo4j62xMSpPpFR/RPBOpXcqgaMDV
         jQAuO3V8Dg7GK6IW+3S5sbNH3qDz8dJkePTFKMBQzv7oMnqrXNllq9PrbXJug5JZhAH1
         uXOPBo6y5AosmXYoFocUGUnYtf6AmS/uibU0342osB9/TeN6dlTR4qgw57Jrm2BeYTeh
         TnlrpKSTaoVGJ3u+xSWXwKj0PSMS08s1Yw3mMHaaXfWfNZO5F7Zk3T4h7TZLSWX9ssBR
         9VdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HGjwXwXc9L+zpt3e/yCw1oSrumicfZXOXxFUwv3BNObSdI5sW7vVh/eBlxv603vwvK9TZVUzYHCxW3aS5UW6b7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS9ZAbAl+6f8n2oeQoZfdF21iDThoDDJQVxOHmfglygyyb822r
	7R9IhlRNaWgAduwdyze7rRiRIF1DcNxPFQDKhzcZ8PFh8IgbZRd8dEVAbX7F+EiTccA=
X-Gm-Gg: AeBDietsRJmAdEW/gIu3alClcYIvPFuF/9UPGD7d3ueajgkmBPpTDxYy5fHjQeg2Q/E
	1qg7skbRm6CCUZ35RZj8msXB0egc05ScoTuB70/W9N1vdgGYCqlmAF3QHt9tBlt84+oGhChYoUC
	Z7WiwQsdclVtQj2pG3oMaJMI2W/WOWD/g4Hu4EaGkqoAw4fVllvIfoRzkIJupISw9kmoBGaCKAO
	b4bIKY1QJlp/hkU1UgO9UWrS49g93ffNASM4aN74gmirLripU5INVUgqS4GfGDcAB7ob08voGbs
	2jHZTsbSHHqaYTX8P/EMlgDcSXcDAGSIhT+2MpsaQrooVuwGVeFw8K5z/ddiNw53Wxr512p4GyU
	MVMqFgJyl4lL2niZxZGnSbDnOIMXy1zoO/l3PA+QnImRnOCChUE5/Vp/ZxXT3DMVmUGIgBetfoh
	iKTrEVY/InwZIMzKoIFBSga1gWHUTP5574gHzJOE90Zv/q+oqV4SkEOPtWmyrB1RbFF6kcvvz9g
	s8=
X-Received: by 2002:a05:6122:50f:b0:56e:eafe:3bdb with SMTP id 71dfb90a1353d-573a566b8c1mr3416407e0c.10.1777462364853;
        Wed, 29 Apr 2026 04:32:44 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7608f00sm762963241.6.2026.04.29.04.32.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:32:44 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso4537673e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 04:32:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+mivxEDei5hXJdpyqtkFS6sksiseKeVyzWj2i9imNNb5Qs7bgPPj9o0k74x+uiCp6B0CkWHgF5oBdVSuNDQe2hRg==@vger.kernel.org
X-Received: by 2002:a05:6122:1814:b0:56f:b2df:1791 with SMTP id
 71dfb90a1353d-573a566e6camr3723066e0c.9.1777462361508; Wed, 29 Apr 2026
 04:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:32:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
X-Gm-Features: AVHnY4LCd6eTq9wcyp22X0zMAv4PuhD2Uo4vLw9bsPU9plD7Rc1VJGY_TMU-X5Y
Message-ID: <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4C4B64939A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31748-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.719];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,mailbox.org:email]

Hi Marek,

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> @@ -11,14 +11,18 @@ maintainers:
>
>  description: |
>    The CS2000-CP is an extremely versatile system clocking device that
> -  utilizes a programmable phase lock loop.
> +  utilizes a programmable phase lock loop. CP2500-CP is a compatible
> +  drop-in replacement for CP2000-CP.

While CP2000 exists in two variants (-CP and -OTP, cfr. the link below),
there is just "CP2500"[2].

>
>    Link: https://www.cirrus.com/products/cs2000/
>
>  properties:
>    compatible:
> -    enum:
> -      - cirrus,cs2000-cp
> +    oneOf:
> +      - items:
> +          - const: cirrus,cs2500-cp

cirrus,cs2500

> +          - const: cirrus,cs2000-cp
> +      - const: cirrus,cs2000-cp
>
>    clocks:
>      description:


[1] ttps://www.cirrus.com/products/cs2500

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

