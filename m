Return-Path: <linux-renesas-soc+bounces-28895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ip+IBacqWnGAwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:07:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A882142B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF9B33078A19
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 15:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209653B895B;
	Thu,  5 Mar 2026 15:00:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACE93B8D42
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722837; cv=none; b=SulCf2TIH6tYOHZ/1ghTwuZVd3FOHjqz6QdY47UAwN6nPSTpyv8FbWPlW7RKW2OZIaLmHHwWrw2iGGejhd2KcgaDzsuwCWgj7opD51Ht3JlvQMj1SQ/fMUmAeyUeXhXrl0+Pypnoo+bQKiFE4crLmoObI0DKcuFaQ14g32H6+nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722837; c=relaxed/simple;
	bh=GbA6aSfcx2Hqd8m3T7ZdoScgM3GztERyFBKwEGsbNx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3oEIAsnojj+8QssdVHSPrIs2Y0k/sNy64DEkyJEH1vm0ajw47o00s2KZzgVOZH9t++LpHQhp+5ka6etapcU4t0PUrtlamIsoBYyFBlgETiSx0vRJp0q3AfB4Yu4JlPZDmVfosZxtQg+Lel30iCS188ohIFEzxnhOke7docBoOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so2406673241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 07:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722833; x=1773327633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/1uy9mVi4gphP4U04z22L3rxy2hmE0d+BgYwDutqjU=;
        b=oeeKf/f4pVq2ElB/bYSQGKNZ7WJfHMIIsXcMbrWU+CT8muEH2Dp7ipDI1FhlgW8Rt1
         OpUG6x0xoVjSgiUoUK1Mopf/sP8w+AZJ8n+SHDx6l7y5UJKRLLdSgWmbmixKOmIiTtGK
         hfOcfLoc6VufZIEXzL49GbkrOBMLLHiI3m4+snShshCbBe634ezhWEW4QaB2tas4R2l2
         KjRFEpcZNxRRRsWVRCVAg+EZj7o/4SvHEEUypQPQm2uiNaXhxRev9Ta8Sb88yB3BNiBX
         uxqG2SqR/Ia8FsgUk25jX2gOlVCHtV5D3UpD+rVok0WkPKefgpFpbLqPCsMEJdedQWN/
         dIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPwvzTqDMge4cdb0MIKNEh5Dr6T50/gW0vDaT6+Nq/piu6nFhaNu2TIY/Afi2sx0MJlPt81rJI4a7/MOhRUVbqZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEIjOjLkPXmKJIQah/zN7raqflXIfmuqL2Nodq2ZkOe1yIkmMU
	jjzyG3+cNQ48uWcjgJeoMqMFFhXnfPbKJNmEWipWRd8qPSbon/adaGZLbAlJ8Z9gKyI=
X-Gm-Gg: ATEYQzwULPHOiL/9egcL3YIqWFipp//UPHpRONZLuF63cp8ev+dBmiPfB+26P6/KZYe
	joommXTrQxJd0/fxdOqUhQG/7LvcIfve/DJoovWLDoLDpgPn9VqhAWfKOLTVA2yz/hpWzL/33If
	AiHhj8V2bde/G5v+bZex6DERql3JH2XtDHhw8MQuECyQ/hPTiE49Is67fme//5em0WWJESTT+fw
	DM+DA+6pbm+DSSJt66uQ+McvUFUBbCSP43u19CRrmLCj9hQqTS92swofcjIJOv3By0FCCh7RjPx
	C67hAxZnXgARDt2Bq9h/ZJ8A2WDm0JFN7+lcN7bQQvvcKAAjgYwDt4yWCSj3QIbw8pBrJUWzAcV
	dWBJtsklrEhDy5R4NEDeikTl9vxIWBn45XtlO6NrQA3lOnWVMaaVmMiW3O5NBI2EYLLRh54ln3U
	fEDxMa6Ds0xpC6yl978USjL2Fl6duKej9jwvUZxQDU8OKPZvhLoWN+hJT/8wVr
X-Received: by 2002:a05:6102:3f56:b0:5fe:c506:c83 with SMTP id ada2fe7eead31-5ffab0187a1mr2103884137.39.1772722833280;
        Thu, 05 Mar 2026 07:00:33 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7afde2sm23883399137.1.2026.03.05.07.00.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 07:00:32 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94dd687e040so1900107241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 07:00:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbm9bQJpjnvOxvb9+T3hZZbVzlB/p31yeG1RiLrWtOgmvo2KJ5yOyaVmRgdurDTPf2AsubENGifJmpfzffgFY6Cw==@vger.kernel.org
X-Received: by 2002:a05:6102:3709:b0:5ff:2dce:82b1 with SMTP id
 ada2fe7eead31-5ffaaf5d425mr2398231137.31.1772722831229; Thu, 05 Mar 2026
 07:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com> <20260203103031.247435-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 16:00:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWs0wX2feonmMw1aAGwNR85gTWKW1FqbpGO1t4rKcdwxg@mail.gmail.com>
X-Gm-Features: AaiRm52FWBkPSYtq8h0YFO7WWmHF8v9I_omS-XjFKfqCRS69zoA9SXo9G5r6Z9A
Message-ID: <CAMuHMdWs0wX2feonmMw1aAGwNR85gTWKW1FqbpGO1t4rKcdwxg@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] arm64: dts: renesas: renesas-smarc2: Move usb3
 nodes to board DTS
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: F1A882142B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28895-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.353];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:email,glider.be:email]
X-Rspamd-Action: no action

Hi Biju,

Thanks for your patch!

On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:

> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> SMARC2 board dtsi is common for multiple SoCs. So move usb3 nodes
> to board DTS as some SOCs (eg: RZ/G3{S,L}) does not support USB3.

s/does/do/

>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

