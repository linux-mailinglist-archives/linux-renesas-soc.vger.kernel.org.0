Return-Path: <linux-renesas-soc+bounces-32236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI1fKfiA/GkcQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:09:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E63B4E801D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 952303030D0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2B83932F7;
	Thu,  7 May 2026 12:09:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF853EDAAF
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155750; cv=none; b=OY/1RjeNdmNSrb0/vJzRqFabfs0DENG8W5HcLwXEpDt2s+blniglZ6bwV6tyy9evCbvzYo9lsD5biNFtNfeGsXnsr+53mwh5ZcR/nW1nVj0MxZ3Qv76tUMUtBpEQXcpm7YuWcYSRHJlFnFY2gir4yBmPzgstRljAx/i0J6orYg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155750; c=relaxed/simple;
	bh=lypAgJzHWEncZmxR4E+oh/3JTHBe5p1D6fz+pUoKT14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOXFmpvzw8ob6LRfvxGpsXaL8jVDG5FiKYqrssWV3yMMliTnJvrR+beIR9OCSTD1tUYTgPtoPBygCkx6YqPFpLUVYq7BqOXmbgPnf12GJRgH11KEioLz82d19bWvRiwj2CZSx3DNoPo15NHyULWoveMYSzdU4UUPRuAcfmla6qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a9076813bso300791e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155748; x=1778760548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzrFYBx2GSnIKOYLrSqa83GGZKfmsA8+rixqzY0vY7E=;
        b=bFqzRI6UovzRPI5ihKf9vtD8ij3QZ3MXsZ6fYDkgsn18PveAV56MD2OEr5/n9ONT4s
         y1Kvy6sIWRHc6Tjn/Ouj3jhrxm9ticbw0UrJMMGb4TeqGktumKqNIkGkY/ZhslIMGv7e
         jSVDrJg1mfENnWjolKpORdIhY62t0a/8dyO3i1riMKBl2IB75AIn4H4j3RiEDw2WHReH
         eEvxFY0jivxKCT45g9bSyYDG1AnA5r5iXD+rbWmjeG501zeRmIvRW2Af7n2eC2SQRAiT
         tpHiAYWy7rqu/LP11BF2GaECFb3o6BoJdkWf8mBTxDHvbgBWDjLMswYksDAo4c2OtI7q
         winw==
X-Forwarded-Encrypted: i=1; AFNElJ9HC6EG7T83Kx6rd6U0JFCrG+cQjQ3EYuzJUoQJXiBZkVPqZBl54CCe/sqx99qBuCA756dDruQrHQ0NyNP462TVwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywWBDoTtOPmAhrTZkwVyDFoG/dFgCFDzMZd0G2PYVEVtmo//WB
	+l3Lfve2WDTB+R3ddPHUQayMYE3QqyqeAKh9bG4zeYIZoJNE81UClZ1LcoiXmIHi5A4=
X-Gm-Gg: AeBDietjE3sols+ZZx/po0IyymNAbTtUCjL0NC/NwVzR4JAcQ2XZZRu/lyUtwt6zTzU
	GZqAAvv5Rw0G+DQ2B9z0QLT0mSQy1/t+GemIW78w/jXAmf0k1SX3D0BsMuldJY2ExXbFxGWKQzM
	TMcX0OLoBtnZqLkefTyBm0429Mf2FiVLVK8uaXgQxfva9EOFhMSmJX1otGzhrVXZWPsOlJSYVRF
	LDQUNcUzh04aTuw0eHPhGssEhpoUrL5zAKGP/k18oi1dAf9UVDBzLtArOXvGsR+pzQdOZKTkfk3
	Ah9JNWCxVxug1EOar9QWeFLdkiQSNGSeRYZfx0CXT3Giwuh/0kko7vAH9hJQPufH7ua/8uU8z7A
	Pga90hhAQqY2qlYV173Z+lDCGwNn2R2GrOpa8WjE8kupycgZ2aqQHABgWTm1euSNfLa4LD9eZNT
	9f2NHLRbmB8wxRggdD11WX8eQxn4OPqh2NV1Ds3dSWaxs5km86o54HUPx7MPS+YT3S2m6bfvP5G
	vY=
X-Received: by 2002:a05:6122:4f9f:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-575595a9b05mr4119560e0c.6.1778155748289;
        Thu, 07 May 2026 05:09:08 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0b49973sm10450310241.11.2026.05.07.05.09.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:09:07 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9076813bso300785e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:09:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/KOXUOqbqLVYuZz88EGWAN5miOv9f+XRPmkRXvv4Ykf62ONE8I9gVh9j17FjmtCEIydY3VIK9Qf8fZdTjfxi8K2g==@vger.kernel.org
X-Received: by 2002:a05:6122:6e0f:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-575595fff69mr3644664e0c.7.1778155747714; Thu, 07 May 2026
 05:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505125921.149682-1-biju.das.jz@bp.renesas.com> <20260505125921.149682-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505125921.149682-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:08:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgPN_xBs8Ac9ZA9qVLR37i1FOSpPDOJUauZyFM7PDt9Q@mail.gmail.com>
X-Gm-Features: AVHnY4KSzRkAu5HLwdsgATVzqQZtbLqhW6kNfH65xaatEyZ_QR1qMUgvGU8AF_s
Message-ID: <CAMuHMdWgPN_xBs8Ac9ZA9qVLR37i1FOSpPDOJUauZyFM7PDt9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable watchdog
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2E63B4E801D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32236-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, 5 May 2026 at 14:59, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable watchdog timer channel0 on RZ/G3L SoM DTSI
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

