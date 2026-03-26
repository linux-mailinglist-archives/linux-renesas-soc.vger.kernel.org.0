Return-Path: <linux-renesas-soc+bounces-30388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM/VLfV7xWnw+QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:33:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D8A33A252
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 214D330A3566
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CE63A4F35;
	Thu, 26 Mar 2026 18:24:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59A93A383D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549457; cv=none; b=k2knfIVelgj/JU3TJ6DevycA2g8TDw6LDCT99tMovZ/pR/MCdsxBEaKZL7Oc6fFWUNS+HT+M9k5OohA5TOos3lzMj0L8py9yIgj09uz6U4U/u4EdFpVqZVCDHZrzBnNFHvwgDIic+ufaClXVnP2sKgCuZ+GGJwGHYZ7gZZj/aiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549457; c=relaxed/simple;
	bh=tO0kKqMcHiRW4jgj+xRAYt7gnMl3D/ehWiA/z8rWMQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFK/pkrr6f/9JZ40NSllkaL7BqYkcJ2aiSUb52R/jle7yXEDg5DRM+OUm9FNyUqLHNMBSBfh9gLExa20e7KWR3zKx+4dN3H9ZylP4k/68G/YjfCsY+C5apy9wYJ5BVXEUAgDhNyDvfLuKi3uz2V5+Y6LvQmNuVZv6we+OKt2MrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-60327793ec9so414652137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549453; x=1775154253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bj75loc1E52Z/CUJZse9tw6FoxbOVmuknNYD8Ky8Q+c=;
        b=ZcnU33HyLf71wW7PJ8e6ZXP/RjsVRejr9Wi7maC70Hu4kM4LWQh8DrZDwsdZnaHv8a
         PwoG9rcvpBdXr66IlOUf8mvV6q8cdBfXbC+6hiaPx4ck4BZFmeIMhwpKpXRMpsGR8o6L
         JlqT2Up14QjZ14WiIRgEAUp8P97yL8bbdW3L2I2liuDHi7XWulYTYPj4pjTLbUr3CAFF
         cTTcCGgB5KrzL6fzL7jcxlmVY5Gg4VeNDpwewCnbrScXGseUZ0Ppik5qL0OHyzfNe4yy
         qBHKn1r+Jv6qngwNCg2mvyKOoadLsAss8eehtz7+M44d53vb/akWWjZh8oDZ0BjVV3qp
         2bzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhNvBrjZtZrYoJtl0amR25MSqGDX+dR3Ez5IDyS8vnT2PZYBHRIUfxj5JIid26Cq1wUOWRzrZc8EnivBCf4pjgGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyygFlqx7LT79TeXEby2UnUBl8zwoOV+TRR9FRXJPtkaY0XY+MW
	dWShCQyv2+9bGcMuX551tRlq1ArWstpLgOA5EBxFGLFP+DaiO+2RuOxTj36O7pS30uI=
X-Gm-Gg: ATEYQzzkRKeAOXGQK5AB8+26qXiAH1srfUO/Q00mNP0MDWHMD5G/YHoQY66mIMLY2ki
	GWKQKk6OPhA+90lfOeV/M3CfZGNbml4ao7QxpuhgK4St3uwinBh6QPaXseXi6pO7PEZBZ2sfFuH
	wyhb2cXeFsyHadpmNTaPvkWArrS3EoY7NLNiVSKxbKDVCYQBql6JTxdpwRA2+dQ0k1w5+y/A/Su
	CrHfOojUqfrId/ea4N0jCbAZdLgNAYXZ6QJzgeCh94CfZ0B65vCGFQdxOdXjY7IjY66njKEIzM2
	vFKLGePJbjTuBaaUKiaRHtxT9s6QBcqMyCDUnoDS1Ifx7prfaIfxtN8F+IHn50nIKcXJYYwER+Y
	rZJVI+GPyJnP7yrZ6nD6kRYJSBu+YKIpkFL+Oaxbix+edzPWR02N/2B8N/XrbtBc4l9GTm2LImt
	AwEnQqjz/n9Uj22Fml4/E9oerTtrtcMiQESliRuCVh5jZkYE5MH5lZcQkCdOn5P34+
X-Received: by 2002:a05:6102:3fa7:b0:602:a9f3:74d8 with SMTP id ada2fe7eead31-60387316665mr3660272137.25.1774549453552;
        Thu, 26 Mar 2026 11:24:13 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d5105e59sm3983449137.6.2026.03.26.11.24.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:24:13 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a9076813bso740539e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj1dEgtTEtyQossVM9ynzq8dSFVOedr0ycieZQmpgAIbCcYjnr7M4v5nv1mjnAiA3Rec2Llb/rfPEp5zmG5IRtKQ==@vger.kernel.org
X-Received: by 2002:a05:6122:6594:b0:56c:d757:a045 with SMTP id
 71dfb90a1353d-56d220616ddmr4278555e0c.9.1774549452747; Thu, 26 Mar 2026
 11:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 19:24:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjLuAWrADbKY9QqD4MY54G5P_jaU4=4aHTeiZXaoR67w@mail.gmail.com>
X-Gm-Features: AQROBzC_p1Kljv4QwMsHpFr_0owHvWZf4w8nt4uS54T258NW1gw6G16asR7xggw
Message-ID: <CAMuHMdVjLuAWrADbKY9QqD4MY54G5P_jaU4=4aHTeiZXaoR67w@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30388-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,microchip.com:email,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 84D8A33A252
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse
> Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has 5 clocks
> compared to 1 clock on other SoCs.
>
> Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clocks, as
> listed in section 4.4.4.1 ("Block Diagram of the Clock System"), module
> clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
> Reset definitions referring to registers CPG_RST_* in Section 4.4.3
> ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a08g046-cpg.h

Missing "renesas," prefix.

> @@ -0,0 +1,342 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__

Missing RENESAS_ infix.

Will fix accordingly while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

