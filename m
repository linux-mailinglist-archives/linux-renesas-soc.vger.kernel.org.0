Return-Path: <linux-renesas-soc+bounces-29798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGGBIDDVummfcAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 17:39:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFEC2BF6B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 17:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76071302A7F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AC53FBEC0;
	Wed, 18 Mar 2026 16:14:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616D93FCB28
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850484; cv=none; b=hGgFDgejD614u83JRIAdBhiOxy8Xz0BJ1TAr25fqcat8DHs3DimUIwc9s2ehMGAa7PqERtCIoO/w9Vs+gdlbT3PsNdPuuRlgWnSK+F2WyHDDig/zawACOzvyyEtg1HLsTY0PGwtquEgE60Tg2FEnx4URusSGcmXmqltNaU/whmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850484; c=relaxed/simple;
	bh=61LThXM6TkHf22dtxLqfIwd9R5jJPl9iMytA9rm+YuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xf0gE+4zLCpxXTHuDPdBQQ/lYVfPyFpsErrpt6+C0kOxQ/AwEFmnPS3VTXuz82zEkiocxByIW5y8f1Z1R3IRcdjbi6pCTI62pJPY5jBXcOcVI3XPNbLfivIX/8rBuGKu0BCWLUuTnJunSkk1lEASrE+LRF2U/YQF4lLSPOpYL3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso3733584241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850477; x=1774455277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQg3ZojwgSHDqijm0VNHDAW00kkVZrPeOY6PyIIDxp4=;
        b=B5OmJ4Wj3GVa31iukRMa8YtDss4UUz1T9PBUIFBIaL1unpmwFk82pnkVxTKKabucmv
         GMP4wHbHiD5+9lJ5qgL6s7NoGRMuEG2vdyQ6NOKOmzKXCF9LBY5S40kSMk0xrPQONr7j
         4AtqlwvrUexPoIG0BHRpTEvedwCWzIYyPu2/c6GV1sXtHn0/9vzTJXu9rvKdaY6ydOOg
         T4/UAqG15QwL6AvaeAHniqIE9huGh2c8nyoIWO3fKzqxbFKdXpzQZNxWh4WFblVrtu9J
         yyerkaUUdmfMUt1m7swSBIMOlQve/ygAL8aa1j4j9q5ezLdAVoJlWomkUbaWmQ9MC0If
         rESg==
X-Forwarded-Encrypted: i=1; AJvYcCWDFeHyk8+qVwhjZ0dYvjmLqQEUIR3VslFu1b11Y/ctvntm7Wka+jJmlWIBE8JFyRcxxkMGRjpz8XlHkpMvW2BjQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7H4KdUEAwxkxQh+J52DDFq8Xntem+NrUhWVvMO1MNQj1S4mt
	bLUDAMkN6fkZ/8hUwygbGKhoxDdWY+DmtZhLX3ZiJ2txx29ci02FQ7ZnCabaBKBppr4=
X-Gm-Gg: ATEYQzxBrTjpm4Na10m5H/MI/HPjYaNC7re98s03Cjd1ppNco0ZauQunww1LbLtEU7I
	HwIDN9jxmvyqOCExWL60OluGom08rYU4f88ewdLXZpcGfOJ4odvGhyqnEvTuOeO+uCn1Mdawzma
	rC0ePFEcqtnrPvbG2YckUTrVTzsyNMLyh5rVHLODk/Y7B3TdoThYQqLc0A00a4bIxLveIkXrs8/
	sjCM89LunJhcMmUoqql5ZjhsJr4oLaf6l8MiSqEj8crswlqlj4nIpHCynSzJ1MPqaoU/90JNi32
	UjRAZSQ6uMgFYAwxwkLdb8PQ8IPtZ1Vw5JxogKZErbDeIdIiQn8JYxWR6XO/rdqW58pPVx9SQuR
	0uYyTiAUbhplkjyd5PU9j118h+GqTJFiOWRhANEpkVIQ2DCGm+gPlO9g6SWufZjWSVADw3WodAM
	R3XNPxAxf6muBRjF4qabUzo/dFBFek4Fr0Wz/6iI42k5luBA2ndU6PVj7B2PYq9tkm6my0Jus=
X-Received: by 2002:a05:6102:3ec2:b0:5fe:f14:e701 with SMTP id ada2fe7eead31-6027d2bb713mr2082124137.24.1773850476518;
        Wed, 18 Mar 2026 09:14:36 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9510325d85csm1487897241.1.2026.03.18.09.14.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 09:14:36 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ffe6887e29so14436137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:14:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3ZA4XBrLHgKjx2H5Pa6Onm9vU9WrgFK7wkM5MGa8kWN6dTknbQSNgFcYvq5DQxGEjxSJdSGhK8HMRg4n2S/N2Vw==@vger.kernel.org
X-Received: by 2002:a05:6102:3596:b0:602:7a74:fbcc with SMTP id
 ada2fe7eead31-6027d12667emr2198273137.15.1773850475876; Wed, 18 Mar 2026
 09:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 17:14:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVF9=CVokdAoAKxr6QcEoftqTv8GcUTd2y2NhMcBWRFmA@mail.gmail.com>
X-Gm-Features: AaiRm53rX4HCYWST9itRTskWWhbI-bKvKrF3W9m6D7fYdmf48lf66Cz3h9Y7xcM
Message-ID: <CAMuHMdVF9=CVokdAoAKxr6QcEoftqTv8GcUTd2y2NhMcBWRFmA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-29798-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.499];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: EDFEC2BF6B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 28 Jan 2026 at 22:52, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> All supported SoCs have multiple DMA controllers that can be used with
> the RSPI peripheral. The current bindings only allow a single pair of RX
> and TX DMAs.
>
> The DMA core allows specifying multiple DMAs with the same name, and it
> will pick the first available one.
>
> There is an exception in the base dt-schema rules specifically for
> allowing this behavior (dtschema/schemas/dma/dma.yaml).
>
> dma-names:
>   anyOf:
>     - uniqueItems: true
>     - items:
>         # Hack around Renesas bindings which repeat entries to support
>         # multiple possible DMA providers
>         enum: [rx, tx]
>
> Allow multiple DMAs to have the same name and only restrict the possible
> names of the DMA channels, not their count.
>
> For RZ/T2H and RZ/N2H SoCs, limit the number of DMA channels to 6, as
> they have 3 DMA controllers.
>
> For RZ/V2H and RZ/V2N SoCs, limit the number of DMA channels to 10, as
> they have 5 DMA controllers.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * impose proper maxItems for each device
>  * impose maxItems for dmas property

FTR
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

