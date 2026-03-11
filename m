Return-Path: <linux-renesas-soc+bounces-29198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLYUB61vsWlVvAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 14:35:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84779264A3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 14:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD682301CD83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 13:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B873242A4;
	Wed, 11 Mar 2026 13:31:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3931E85E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235904; cv=none; b=r07csGM94aUeuD1GBi7ZiNRx+9zUyOTUklKY0pGMveK9JJObEvsBirLNsi2Pag3hrqdEFW/EDH9N4rRk4sW2rnnEVsCq7ZREbUTzcIDuAscvWgJtrEuTMDYzQfXB3EwJzaY5in99SOfwcf7AKdJ/w39tENh2ZOYACoKmY2ATXCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235904; c=relaxed/simple;
	bh=TEGOliZPIKjcYMq/SlpUhrjTFTqBozUfJkzHQj68wwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaYFuSNWzBrB6kELXe4nbsOTT3d4DV4L3pFI79eQw9jzwoZpjO35zjVt58ouZ+rPO5SKFoD+0Gm2qczjLq2bFJjVdcOloVuUiaZOrunxCpyfRpNv05by8i7o8ki31PusPyEj2bOYYQvLxZ4VqC3IuubhKs0Glf4rrKCypmEren4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56aec0ff5bdso711250e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 06:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235902; x=1773840702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFGeq6M+ANIk5ThSAzANkY3DpNoGSDLWjfwUeKz6NR8=;
        b=XDNzKewwxojsjY0BVok46QCvoVXpN9YZbQGGWrcDvQuPNcu53B8CJyRTuUe+XqWrsI
         pQrRkM5/jBg7QuzBPWIAVfe8ZZCVreDLcD8iOR71gYHJbrRcr1M4zLU10Bqj6YGgjDke
         SSJcfuItY2gwgV6CFYGVbK/ellHwsteMJ6CkQQ9p/rPYWBm7Hgwp6TO9Atg01ZqJR71d
         FwyylImwBpgjOUNSmt8VRDawEKqcFlolLnboJnKuIkkzaXddFnYKmxMlP4d5Hj1TucJ/
         LTY4+Fw8Z1wK5MzKzXWmHbDT2QnKOrZclzFwYoRftnXPYpHbpG+Z44staP0xcG25e2he
         GWXA==
X-Forwarded-Encrypted: i=1; AJvYcCWwILaTFGsJ84lzWf2pUJgyAgqzb6zIVU8h+SdJChAdiRFvrvdrd53Cf+vpF3J5IoeWsolQH1IPpmo6rPSZ7KYi5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWH9h9vBRif2b80qBotirgYOx6FlOrqMP3ixQa8Ca8JHQvxcgn
	H6KnImlyRGuP6ifP5SJ737mJZy2IbLQoWho8wVq0xHwTNImb2pwitLn+QR4Cho84
X-Gm-Gg: ATEYQzycqu2DfH6QA7vRNHSx7Sp6i6UU0TfDkBPEPSjKzyXTcqaUyBdYVYp98asxMOs
	hdHUzzD7GQpvKo5a21jS3IKG2VqwTEXOxZd5q8qOriGQGe+ExjoMNcx5jyya+VUNxwQB6Bv6KYZ
	wP3uR4jvSVL7otijAaY44elpIO1FoOG28K4VOtKXUue3P+kvfjr4a0TQTSyCqbskD1lSKyDIW6M
	07zsawzXTKHgMMUI5bQH+K1OPjZor67E19kodEx5QhvyNd5p8dGP/5ODjX4GCuUigManWjqJcMR
	Vf0IwaA8128bLkJ2AURm/xQHPRglwy3SGVNG6rdJv5cO4dERpyIeX/d1xPXM/8svDMvAjyd3Wo0
	/WbJ5QnF5VMaLoi577S0F+W/Y6YxciChfQ7xknSPSfgQzenwfgBSaUm/acWEW2q9+p5uqPg6KGi
	mR7/ictTkl6KAf51tTTMtk78BjgVa2Da9tzi2XpfzBT+ltJ5dco/GpKggMwMTm5g+7XVF/+robQ
	S8=
X-Received: by 2002:a05:6122:4d84:b0:567:4838:8e4c with SMTP id 71dfb90a1353d-56b47132b3cmr855703e0c.8.1773235901948;
        Wed, 11 Mar 2026 06:31:41 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b461c905fsm1099349e0c.0.2026.03.11.06.31.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:31:40 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56af4aa4e41so903629e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 06:31:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXwRk1pLYJ0VCzEj6MX2nfUX9ZBkq2CkUdvOx89+D6DlVaSvJpfL2zGpRNb6tkKxo24WfsRPGK1lpSLFkdn5UI2g==@vger.kernel.org
X-Received: by 2002:a05:6122:4f8a:b0:563:45d3:9b1d with SMTP id
 71dfb90a1353d-56b4717bd40mr972836e0c.9.1773235900498; Wed, 11 Mar 2026
 06:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303233314.2928711-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260303233314.2928711-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260303233314.2928711-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:31:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUn35f6a31mFz-6ejiPkrP9kdd4BLk1xrHXeGBxvqS4Q@mail.gmail.com>
X-Gm-Features: AaiRm51uhTkJAfKsu3jlarUIceDa0BcH9ZUwy9miqlqSc85b2a-agV5l4kcTtLI
Message-ID: <CAMuHMdVUn35f6a31mFz-6ejiPkrP9kdd4BLk1xrHXeGBxvqS4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a09g056: Add DMA support
 for RSPI channels
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 84779264A3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-29198-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 00:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable DMA support for RSPI channels.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added all the possible DMA channels

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

