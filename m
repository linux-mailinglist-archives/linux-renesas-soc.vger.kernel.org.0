Return-Path: <linux-renesas-soc+bounces-31745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFFLLsDX8Wm3kgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 12:04:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E294928FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 12:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 362BD301A40F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 09:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8D73B6C1F;
	Wed, 29 Apr 2026 09:57:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5572E974D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456677; cv=none; b=e/7OCyi1aw5Bq4EXM+s2wD1qAzz5fV8mKqtTMMErQmayKUOHOlCjpu7EGtCghDe2vcnjkvp2YlxvUqH7blsVGydEI9g1Y8/OOQ/CnD3xrjwnPOmjszSyCq3xfEarA6Q/mjdShmZbNnNt872XqNTx2X1S9I7tuttEUXd2tRiwf6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456677; c=relaxed/simple;
	bh=Nn0K43nvpoluFLl6ARYq8Tlw/SbTNjxDaYPa0VhNrN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWRXz4z1ECSXPsKlaaV2a/rmwwe/oUVEkgNvI3eMmBU76pPnVPm2ykPjmSnl4pPooo2gTVic8kVv3I0IyE5sTixHSpox678f3snpe0xeOnAhMVXDZLXfgvNYxjcVPn6lDrYudAJxTyjizMcjY5PMenCZjgmuKQQQfLywqGYp1ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56d9f191ae6so8187299e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 02:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777456674; x=1778061474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=727TQd0c+qHkAEInnHUXDqUTv77oNJr8Ljf4nlxgtUQ=;
        b=AHLwCyKZVoFANTdH5CEPpZmWcasrLrtRP+KNd8cMF+nDGC7mEhRa0Fu/+ZPveeIpc3
         Ikaulhv1kDJWbAvI8T8v+Ve4u3bp4QPP6EdvX/Bgqr9+CqNzz4498LfWxvTRB4AXsZg0
         IHWYhCXvBiDOLk7+9IzXD0BlF8ggEXTKV9bfIl8VMKPtFNetnHqlhi1hlupuH+KlFIGh
         v6tBgy6arWt1i72i3F95KQYa4NGT9r2m0eBYKkyptGHi25NvfymTJ/X3ba5x/xh/u0NO
         FpZXV7cTDFGxVl8F7imJwzDHpJikVmGustUd3yPMfop0t4Vb4sUKEIYZ49Iw+FvcZ2WO
         tA/w==
X-Forwarded-Encrypted: i=1; AFNElJ93T9f8yQHYyhj4esoxt40omwEqJ5QC9+kAyLvrogwkvVNiJ4taOmZMOyQmDVO3q4+pn3zthTTGhO17L5RT8mIn7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDteqKgy0H9sdlpXn07/QM34y/+/qk+oxKL+WXC5B+2AuAligm
	J3x6vt5MJw8ppKG9C7ahieydLE/rDRwO5lHqDlk9AtHuCTdf1GStLhgfz8zRIPQV8mE=
X-Gm-Gg: AeBDietSEqHYgiEBGbuDFVsnccHEOQaq9Y1gU7mcY/UWsvNJbzigOYExL4YGcWiL5hV
	KtU1fV+Faj3eFFiDmQsPo5YToANTMShqz4jKrPF4EktuSFl3R0bh6Fr4ZfMKjCNf1DwP815exKu
	sJzntyj9Qx30OTNWk//zd1BCZLWL9YSzZ0DGqSc9AHAbZ6uSeYWqUNODUt/4UXpFHyMg4klEqAF
	koSqQJBH8Evtfp+mzoLpljlf3CwPxJF3k6s4iAKz4IrHm5dd6/iDKvBimogmFJAmdAJhvhL2Ab8
	skgwg61WLxRmkUUg7DBw0XoNN6gx0VgOILKwMFjMksWQ0lVVeXmrULlhkqvDHw99zA4BKeyYle8
	xcX+KoQRfKtrUplUoehv/oEccPJnk7cbREBZPLBTfMRy6pvtrQUElwEos0K6MfFHLHvW6BqpUM6
	3q6ApLeDIFKc8V9YH9JS6hp0qcvgZQcgUYklYZMyjWy/y1iLp0jSLlqADaOAH53sAwnJKukWA=
X-Received: by 2002:a05:6122:e142:b0:56d:b4d1:3c1e with SMTP id 71dfb90a1353d-573b369e031mr1382727e0c.10.1777456674458;
        Wed, 29 Apr 2026 02:57:54 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6d88d77sm805689e0c.11.2026.04.29.02.57.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:57:52 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6221c72515fso3799470137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 02:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ++MvpjR0dCdnRRGQu8nsxmySPr02hUEkbvZe52e+N99ziJz0poiBSU+xlTOoEvsWxHpTZNQCbY+71Sl84QN0dFcw==@vger.kernel.org
X-Received: by 2002:a05:6102:598e:b0:61a:c2e2:932e with SMTP id
 ada2fe7eead31-629272e37fbmr1942655137.22.1777456671431; Wed, 29 Apr 2026
 02:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 11:57:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
X-Gm-Features: AVHnY4IlsJzOGR_PMCF4iS-Uk9l-2ljuIGS7ZCYV7JbOA-5TFuOsoyAbIfAM7Nc
Message-ID: <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas
 R-Car R8A779MD M3Le
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
X-Rspamd-Queue-Id: 29E294928FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-31745-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.742];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,mailbox.org:email,0.0.0.1:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.2:email,linux-m68k.org:email,0.0.0.0:email,mail.gmail.com:mid]

Hi Marek,

Thanks for your patch!

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Extend the Renesas DU display bindings to support the Renesas R-Car
> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
> except the HDMI port@1 is not present.

"and DU1 is unused." (whatever that may mean...)

>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -42,6 +42,7 @@ properties:
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>        - renesas,du-r8a779g0 # for R-Car V4H compatible DU
>        - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> +      - renesas,du-r8a779md # for R-Car M3Le compatible DU

I am not sure you need a new compatible value: is the DU really
different than on R-Car M3-N, or does it just lack some wiring? ...

>
>    reg:
>      maxItems: 1
> @@ -890,6 +891,75 @@ allOf:
>          - reset-names
>          - renesas,vsps
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a779md
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1

... E.g. you still have a module clock for DU1 (the documentation
for R-Car M3Le does not mention any changes in clocks).

> +            - description: Functional clock for DU3
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock

... E.g. the package is documented to have pin DU_DOTCLKIN1.

> +            - description: DU_DOTCLKIN3 input clock
> +
> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - const: du.3
> +            - pattern: '^dclkin\.[013]$'
> +            - pattern: '^dclkin\.[013]$'
> +            - pattern: '^dclkin\.[013]$'
> +
> +        interrupts:
> +          minItems: 3
> +          maxItems: 3

... E.g. you still have an interrupt for DU1 (the documentation
for R-Car M3Le does not mention any changes in interrupts).

> +
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +            - const: du.3
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1: false

Perhaps port@1 can be present (and thus required), but left unconnected
instead?

> +            port@2:
> +              description: LVDS 0
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@2
> +
> +        renesas,cmms:
> +          minItems: 3
> +          maxItems: 3
> +
> +        renesas,vsps:
> +          minItems: 3
> +          maxItems: 3

Your arch/arm64/boot/dts/renesas/r8a779md.dtsi only has two entries
in renesas,cmms and renesas,vsps?

> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
>  additionalProperties: false
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

