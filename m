Return-Path: <linux-renesas-soc+bounces-30966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAi/B/4R1mmxAwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:29:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B168B3B90B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2581E3006794
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 08:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E3E3A3E83;
	Wed,  8 Apr 2026 08:28:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476BB3A2543
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 08:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636895; cv=none; b=t5M8teSY0uFCpuyEmrfreXpo7e/3GM752flU9GcSJb3xXtCNX6RHaDd6p5EFSK64ybGhBZIcTYhILNayQc1pSG+OPulyEx5PlOZtM1uFiNxgFfjG7zbdwyh1dTlNHbep2uPp+1/hVFFzkBVq2yXssMnz+XPmSSfElRcKaFFqpZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636895; c=relaxed/simple;
	bh=o9aFN/oBxjJk7ilLKE+iObF5zpOesxCwPJ4VHcL/xkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hktm8rODx95R9WGHVRP6F0zcq6yKDthAb5BC9Md2ODfub/Azm0ad1USRXdKqK2mOGuuE8krHSzvZxHQubzRpiuZ+/dpNSV1/ni13kkTAH6RS/uL1qC2pkn6ppkbgcORAwCJKqD1nnoDK4syTc6k5G4yqfTP83BCxvHoeRckbBTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56d89f35940so2058699e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 01:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775636893; x=1776241693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQpQOf4fWDiiKTZ8RNLIoiaoYNDkkDqXEA0sfJBBI8c=;
        b=lJuFD9BRex1zIfh0jTlaTW9KdQDoWp0fxlduwi3XW2Ykf17HdzAoMAIO/20yHUnNbD
         xwpDkuEnl5IOlRiJmKFPBBkDkr7WyuwTMSJsa6SH8vRl41S3xgnqFtNPTWNbBCapEpL2
         tJN4+Cz8+v+osoDSa9kigBTXk7poutD44sezFfXaIabd+Un/QJpOCnYlb6eBl8p5qau2
         gdJrGE37GQhLhCtHAOGiUViqf1+yhjGRtlWQ+TKd/Ac55a8gg4U5Kaouuxd5Fh3gqvE2
         qk34EMySUZqArwis/hIUJtEgzf7lDhO7WBVEiAsztyBZ/J5QG9SplPGJ7fQeVhLFPWAr
         1hzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3067aLDgF852AL7vpypfaKLCUpPHAI75boFybKSunTXn/MgJmGSoIias56q7TjUIHdqOv+AEQHUPAhtoQ3HYFHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi4BNy0c+kYZ1HPLFj0HgJXYYTOH8WZ3AbAeciA4bVSp+jcCHe
	wNCxyMbe+2lXjR8PjH6DJVrOYrSFDwr0H51oQcnDkb6jJvtpa/wZDxDumRmS8QYC
X-Gm-Gg: AeBDievucTu0CUpB3RFrwpo5zWTIORIyE1hhU8o3PIMDuBLaQe5yignaIj+AAuTs2GZ
	iaz6y9lugc6TOVIDcd96u6pHgw4VzHFVf+lwI57+4jRms3CmqyVeAyX7Cjq6ZgeGmpPWE3PC5d1
	wdRLukZADON0yQeoWYhRPDjtjWHUof0Iiwg3yKx5asUrPUaxxsNiXY1XEjThohripJUlb8b7MGW
	dTrN8a+4Km8Hm2LJ9HAk5n1nn4Ws+nRsvq9jNSErkX6fo2DekweNeDWcr45wL7t18bMM244W8E3
	6FNjuY58MS3CqkhXhoT/MaZhRPLBg+R5cnI8uruQRrcsRDHy2lKZgbnMmajRw8ohajxED1nMvX0
	OKVoeemd4SCfRou7ncOBs3cqvl5EM0F16+eKIqsGlL5XL76QqXWUyU7T+f6Klj1Io+3k6vPNLpm
	271rfhazLTOCV63MXEEfqZQUfdxihOodJ0qgUROtTiX0K0B7YQXxZ8DCdyJgK1
X-Received: by 2002:a05:6102:2085:b0:607:9d3e:2662 with SMTP id ada2fe7eead31-6079d3e58bbmr385838137.4.1775636893192;
        Wed, 08 Apr 2026 01:28:13 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm15499872241.7.2026.04.08.01.28.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:28:12 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff05af29b4so1980265137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 01:28:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKQ5/6IJfZHOmjJFd4Syl52SL1gOLmb9IRJ4Ut4HsKOSvuOwVCrzYIUHxWxXSUyZai5JECMMvsMSyk7bkqxfdifg==@vger.kernel.org
X-Received: by 2002:a05:6102:2923:b0:602:8ccb:c993 with SMTP id
 ada2fe7eead31-605a5013b05mr6453381137.24.1775636891875; Wed, 08 Apr 2026
 01:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407145753.101840-1-biju.das.jz@bp.renesas.com> <20260407145753.101840-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260407145753.101840-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 10:28:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHWxmY7fCue2Q+4Wvf2QbB2ABaQL2yi1Z9koov7tj6Zg@mail.gmail.com>
X-Gm-Features: AQROBzA34NCraYwlgtVmX6Zb7nvooLN9XjKRAeqpyWsi4l4Jb7X8ZFeX4g2U_rk
Message-ID: <CAMuHMdVHWxmY7fCue2Q+4Wvf2QbB2ABaQL2yi1Z9koov7tj6Zg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30966-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: B168B3B90B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 7 Apr 2026 at 16:57, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible with
> the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added ordered DMA names for the dma-names property.
>  * Dropped the tag
> v1->v2:
>  * Collected tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

