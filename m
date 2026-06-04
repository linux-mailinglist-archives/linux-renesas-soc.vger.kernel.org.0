Return-Path: <linux-renesas-soc+bounces-33584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sBvhHmlsIWrtGAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:15:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA0863FC74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:15:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7CE930DE26F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 12:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0820436352;
	Thu,  4 Jun 2026 12:10:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD6A42B742
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 12:10:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575023; cv=none; b=eiejRI9tv6zc7BZWagtzVCTvPvx/T9rV1vXIVP9DHny+tSKVdILl40UGJYu1REQSb0ExbSioozbvBPGkIf99KgLyYqqLc22RzAxOvTopnXFUGWpKXBU4bjOsXd6Lapk5JsGTl+tQde9F4jk7WVJM+w/jYQnkVzki4j2DG+mGpEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575023; c=relaxed/simple;
	bh=W7pkTBC2mguqsY9HevqNVRnUGKxiCNpyWrU5jMOs1ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKCouEANiqJTP0hOPPxzgbW/XdvHPuy0LEHSsUAd/TFe1+yACB3XIFSdUjaDXEUPh7mc0o3FWzUHams6Rl0nll96DnqoEBfgPU3yDcTRtxvfKWohe9xax/APEOJjUNDfkv5DhCEo+/VF+ib6s7F1HtuaSakJ0lmLWO8RevUhBP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-963a35acfaaso192098241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575021; x=1781179821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24Bm5+9RznVEO/BZ178uK6yDmvRwITtp/jjjxZ2arTI=;
        b=kklpdJ+jPZktMAAoDZxLvnBFPNd1uP3WUNW1NFrgQ10phcZv7PVPcnjI3rWcy+qrqO
         XWud/llS+s3lJiznFd1Vsklqn5MGFD1OuyTNxquPgmNbwtbqUBQdd3tD1S6hzyqU2KSz
         9F65tkY873AI0A6eZj6uhkfjRP8YO5eFKkk89uhTHu6Ct+Yo5WsWbX8HbPlyLPHaesje
         l874jZ7pRrhKlJgnqko1NZxLf6aSsUlqS7wjbG2UimpptJxOgyenrixgI3Luf4ZAXCww
         HneuJfQXfS3GPQDmHJguIzkK7x3su5a4GJCC6kW/eJPtZ6VI1xbaMkOwoHihltuA+alp
         WwZg==
X-Forwarded-Encrypted: i=1; AFNElJ+c3YKWCPZGY4bZBahPjfqNdtoYLU5xhOrBI/W0M4kc5jWNf8LSFRTquqTl+EL79hf5c0TK25/SuJUATIH+hJWi8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMFF4zPe8G5pLwzY+ACSdoMrXxsJrY3HT10n+XzulRrnaTbPEb
	L7t5RQktwfNsRSAe4ctbJn1s5uqMdkKyIyGj0k1xdKdWOE57c6Ggf4NnX/88kohLICM=
X-Gm-Gg: Acq92OEIklwLgsrunER3TGQBSpbz+GspT+/AQq0SYAE1w9bzxUHl2Bz3/M3UkFRxeLw
	dXOUIBQXyJpIi2LCV9nlstu3fHw6k5IieIARXzbwp6IhFeJeOrezbRu5ifX5HA6QWgLzzI1RYQb
	CUIkoI6hUb5NMfVkbQJht28AzYAu1cmb2OKL5EAaN3ILuz0W42Peljz93wYugZXCWXtyKDrWmTo
	Qm0zzlAqqajJLVk6opCdGpmLI/jB62KLrmcJyVGauqksqhdKIPsSoerXaSQiqiak1WTO5k7k9nu
	XM5YzMMAdVHmA0+1S6bjZG4K5cEhdaSK4QJ2ZFgPy9erbDAelQZ1G/dsOQaNNRAlcnJPacfQb6q
	WvuyroWbHOJ2fzgYLWKqea1rBvZq4M5JGADYlsUZ1FRbMy7K5m3V9mRJbez2bpqyy1a2X1BQMPa
	J4WllF4B7LkFa+OqbdcBfVZ4OuFgfD5IAyZAYCMOCklzeyIowEMtQAIu8qaApCVEkDrXTqIE8gp
	Rg=
X-Received: by 2002:a05:6102:8027:b0:633:75d3:3545 with SMTP id ada2fe7eead31-6ec4c6a8669mr4488640137.30.1780575021182;
        Thu, 04 Jun 2026 05:10:21 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb36325d59sm4972199137.0.2026.06.04.05.10.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:10:20 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59cfbfe64baso161740e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:10:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8m8ZvzZtylMQA+VoVNrqEjAVZqHG9GRx17G/2juUjjsBz5eoWGMl+e9UHJmD5mAEi43TkUfRvq9/vg/3vGygLsDg==@vger.kernel.org
X-Received: by 2002:a05:6122:3124:b0:56b:8e1c:582d with SMTP id
 71dfb90a1353d-5a6ea26b55emr4329928e0c.14.1780575019519; Thu, 04 Jun 2026
 05:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:10:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHSyaD9JBgCuC-saw8SV2WvN2H+hnMX8Nw6LJmoNQmXQ@mail.gmail.com>
X-Gm-Features: AVVi8CezB6KDo6j8ugocyAfAPtEdt_L0Vgg5u_qdNGl3T-N1qL3CcUP4MWGEjnI
Message-ID: <CAMuHMdVHSyaD9JBgCuC-saw8SV2WvN2H+hnMX8Nw6LJmoNQmXQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names list and ports schema
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33584-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:kuninori.morimoto.gx@renesas.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:john.madieu@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,renesas.com,vger.kernel.org];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AA0863FC74

Hi John,

On Wed, 3 Jun 2026 at 22:28, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Express the dvc/src/ssiu dma-names as an items list rather than an
> allOf-wrapped single schema, and drop the now-redundant maxItems. Fix
> the ports container to reference graph.yaml's ports definition instead
> of port-base (a ports container is not itself a port), keeping
> port-base on the port@N children, and constrain each playback/capture
> phandle-array entry to a single phandle.
>
> While at it, drop the unused top-level #address-cells/#size-cells since
> no child node uses a unit address and the ports node provides its own,
> require interrupts/dmas/dma-names on the src sub-nodes to match the
> ssi/ssiu sub-nodes and the driver, pin clocks and resets to their fixed
> counts (47 and 14) to match the clock-names/reset-names lists, and put
> compatible and reg first in the example.
>
> Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

> @@ -320,6 +333,8 @@ examples:
>              <0x13c31000 0x1f000>,
>              <0x13c50000 0x10000>;
>        reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +      #sound-dai-cells = <1>;
> +      #clock-cells = <0>;
>        clocks = <&cpg 245>,
>                 <&cpg 385>, <&cpg 386>,
>                 <&cpg 387>, <&cpg 388>,

What happened to the first clock cells (CPG_MOD)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

