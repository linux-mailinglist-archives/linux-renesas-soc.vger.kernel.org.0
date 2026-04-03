Return-Path: <linux-renesas-soc+bounces-30825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DGcGm2Cz2mwwwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:03:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65F39287C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CEE383033958
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E4E38657D;
	Fri,  3 Apr 2026 09:02:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75992848AA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206927; cv=none; b=QrFST+muj/Lh+eKBsCemSEnNiR+cETcfU/FdhIZE1RnW5dZeSuDRtk5ypn6z2GihyF8IFkBIQopF4CCIBTCdmVi5tQC3+ZvE8dU8BZvRlEntfTyMGrfT/ZsI19p3RyDxDkGXsrjWQgbN3YOhBXRNuuFUs0M0WerwzslRZCo493o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206927; c=relaxed/simple;
	bh=Mo191O7E9T+4RM1pvPEGJkHX0h7C/nugkZdEy+VTOts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+rrqKVlSkPyRugke1iMAkCCSAWAoUxUiD2b0ngr1S1EuWaqIcduYbmvCJmjUtW0bCF2QTY+K/Q+vBzpYVKJ/tBpTNtWymGqGdf7sl2AMe4CqAIrtSxNsRXSNhH2ZtPM/157maAogXtECca566zGBxI6E1SJYJpYuUxzuAZ0i40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56d85881a68so663623e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206926; x=1775811726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qsj1RGLAszaRKzpMsR2E+ns4h5R80DTAT3PdStNjiP8=;
        b=gdFD+uQxY8l0lLo+6zGqRK1fAqkzCoo2hR0o7i5uubevFV9jDWbbBBUD+EcKRWlxwv
         BrZG7K50K3Q+1POzmzCCSw1UGuEP98plQkixsx9pzsNSkzAznVuJGDSZLdVMK6XOpHHd
         4Axly9Qtlk5B7o4BY+ewS2sJW6yaLSIvaHOnB0S8/Pjtgnr5eC7zsOqRqWuVwROzU+iq
         MZTylNf6Y3yakB8dICKri1/w/1aYkBtoDE/TIMAH4i3XRLLPGuDxpg0FEHx+Ox9uuAkD
         pb5C7u9p+CHx7OIR0VR2HfksU8E/vFl73pMM4vGgAw5XS9+lZM/qb/H6UY3/l3fsdRJU
         kBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYZgOIDpeyXdRQZEgsOvcXF5wBILziAWZfWUdtEGWVaHTM9Q15Stq7VSiOLO1tHjnyGWNws+PtPKt1m2CaXAchRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFRY//G1YCyFsZCfMA1MX2+derqEzneDh0y2s0dxHbiiNNxF0X
	iW1widiUGM20/xQySmnIpZ6Fn4mLtsnjuZh6gJMm3C3gloOiExWOtGEA7YlD9t9G
X-Gm-Gg: AeBDieuBkTXFznjEi2E4lVcDeuHhlAozHyDvrdcvryv8WosuXmU7HNACvOEWCOBSKGa
	G6K+EC6iT7hOXdMooEdBnbsaBl5jWw9S3pBeteIMdCx3u9Nrz5m13Skdl7VUryCScKTbLwvBUsI
	GBJPgSKYSj5gWc4BzFHAmoJIZ/sqx5LRAs0rJMMvI+K2G+ngf9jXSL2RbooxOh/Iebq9G+ECjwG
	ki7DF2aJmDCpABtM7xdNTshYvRDtg/uwQl4TxtS1fXdmlvKtOPD4C/wWPvrElSTPzR+RYDBrBye
	PNjFSsu6rA9PuTd1EvyhPtJb9IDEhi/QcaQV2stZwqBHa7JCHEqETN8Uby4hnDrsx0tyTOv3kwv
	n1ga6ffqyFXh6mxpyVFBToaE/K5TOYxhN3QSvHSDKjEV3yw3DqaNq2TLbJLfluewQe3/NO1BlzJ
	sPU2xloIDTNO0cM2ALVpvegvKmaz2lWk1178oeCLWmY74QzWgYBffReZxwS0RRrrNo
X-Received: by 2002:a05:6102:5cc1:b0:602:a651:11d7 with SMTP id ada2fe7eead31-605a4ca8866mr830037137.7.1775206925702;
        Fri, 03 Apr 2026 02:02:05 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbac435dsm5665778241.11.2026.04.03.02.02.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:02:04 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso645947e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:02:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwlZzcv72lU7ASo7123fKrxQRT/5nXMQnWYBQBeP9y04gAA3L+tB1Pd2kNXoVhyq0dYjQEyKm91nHUhAErYz7GRQ==@vger.kernel.org
X-Received: by 2002:a05:6122:d1e:b0:56c:ca38:ebeb with SMTP id
 71dfb90a1353d-56dab8243c8mr760736e0c.2.1775206924117; Fri, 03 Apr 2026
 02:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:01:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCRCbqWdJMMEsJCbk2TFVxUurjOmFxwLMYxHzPdDCo5Q@mail.gmail.com>
X-Gm-Features: AQROBzAnTN9lYrSaM9ZtCA2x2wm4A4eG7aiOhMzuh5U7vdK_Tlzo08dmx-AhkbM
Message-ID: <CAMuHMdXCRCbqWdJMMEsJCbk2TFVxUurjOmFxwLMYxHzPdDCo5Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: Fix missing cells and reg in
 Draak/Ebisu panel DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30825-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.776];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,0.0.0.1:email,mail.gmail.com:mid,linux-m68k.org:email,mailbox.org:email]
X-Rspamd-Queue-Id: 0B65F39287C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into Draak/Ebisu panel DTO to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

