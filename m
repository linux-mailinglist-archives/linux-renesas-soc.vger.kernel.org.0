Return-Path: <linux-renesas-soc+bounces-28893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEZYN/yaqWnGAwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:02:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 278CA214160
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 062993119BB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 14:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCA719E7F7;
	Thu,  5 Mar 2026 14:57:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C64248891
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722654; cv=none; b=DbPvGLxPx6gDjzRL7eR/ptTVEg3QtWzP/NLbVWezYd6t1mM3Vu012hMdFrB1sgvnX50iBsD3mAmf44+dH7z2O/Moba2spoLTVzjsGQewA149b3b3wX36MPywWZlxuQ/w5al2C2OVZVSipuzfQZni84RRoGkEhrffhtuQdd1ANts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722654; c=relaxed/simple;
	bh=Pe/zMDtVeqDupHBRn2OXYvPIzkzrvWK116YkgoB7+zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8UN9ZglpRCLWCbEsWR4Nqpnwi30fyd1HCWuQottl78QWJgqJwxxDPmE0jpT6eUe7dX3Ckuw05iBxGGBgB0qoJKNPwP9EBVn7cgNQVjkbJPJzd5Q6jIDtmaZfoAtHe96eLJlNiXwe16vrOyCaGNuQhYMuzCY7bnIuNG2i7Iau4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5637886c92aso4410423e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 06:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722652; x=1773327452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dcuFR60hveY60fAZyf/s5PIgNTW95vthRXdXlHvp0c=;
        b=V5QMh8cXgZrt2qaLQ+GnLEx6xYqgPhia+wE+nnEuyAztMd+IyRYevMT2xDivI7LaYh
         cxcp2IpLb7B73YhmOBE5LAk+t7h+ALukp+gBSCoLOzRULxiuUEBd/GaEcLAXCbaWwJkF
         QDEXsNeEVuf6SOuVqrIkZYhjgQoUGXTIGHpo4r9n0ZDqCH7j9f2X+Ach13acRbnqXCsS
         LAKnDGUTmMCYXPtSDGQgVsEbA5ZvSSAQR7ipU9s4nq/YNzzyFrhYjNCZVlJI7tLEcKM+
         cPpDPX/JYJ8sk7vpHqodNa/7i47MS8d+Kp4C1nTCdvWQZEQ8C9rGGDXYHYSIlRO28IKE
         12TQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3AfiwLKkx65zIuel5wzYTV5ILG21PO4OSqQHgtf2drsY3/rH+6lhaKeWR13bmAoAaUgGTY4TC66PimwG6mcLGaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxAwca9xrK5rp6Kj21hZbcLqzaOE+dkVB+mDyE1qdcdqWFeRIO
	AlPRRNR9RncgalZ/GGPssZyU/K/c0jtQBKZocIhrh+meQlu2GDmsgGMIXgbTe5EpstE=
X-Gm-Gg: ATEYQzxKYrY5V0Fhpy2w+E0+Pb0tWONwSYrP+/OCTclMAQRCnQtn1lAqGUQkG4Vy5FT
	3GuR6DJxGyNSCJFXLFvxVW2JoO29gLhjXuxBo0z1k9/0WLA0aLJ3Nxr2J2moTfay7sGwDvYIl3c
	+RUh0ywNwd4q2kacnIIdy+LkN9XjQ94Vx4VvV5+UscJ7DiD+h1Cq/mUeMqWlY6FuTM9IhngM8Hk
	60dOp/0Os7Twv11hv9BIPaGD/kbMuGImwvWF/vBgpqcxlnhCu94EsK3XRqBumcormQzW7e94H+P
	C41B1k68zAIoaXSnaTXOyNemKDp4fV18x0voj7/nIFB2MQPkJnSuNqVBK7ruT2ilTjqqnJAYVex
	2FeK9tU3OptPTVKDVSguTcqIiTdbDqwrqOji1BNh6EOCz/WEYDbBJKdArbW7P+lmBAU5nYkCqhE
	vUqAr60KkehTm77vd06NT5YO7CCmTLOULCnHfSAfdbHDOwaVgz4SWAKcx4rB4J
X-Received: by 2002:a05:6122:8c24:b0:56a:feae:fc18 with SMTP id 71dfb90a1353d-56afeaefe57mr331531e0c.9.1772722652526;
        Thu, 05 Mar 2026 06:57:32 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c7ddsm27068587e0c.3.2026.03.05.06.57.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 06:57:32 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ffbcfbcec4so441482137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 06:57:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZHDnmneNcFie6A7bBC1epf9W4AoG627YghnnqkQQkIxECbF096yREq48hfAXG1s8VnTIud+4HfUDpm+EujXiUug==@vger.kernel.org
X-Received: by 2002:a05:6102:3047:b0:5f5:459f:9860 with SMTP id
 ada2fe7eead31-5ffaafc5884mr3178458137.28.1772722651999; Thu, 05 Mar 2026
 06:57:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-8-biju.das.jz@bp.renesas.com> <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
In-Reply-To: <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 15:57:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsv-T-Vjd4yNK2k_pP_YQfw82UvFvYf9ynxMaQJQYxQQ@mail.gmail.com>
X-Gm-Features: AaiRm50jZ7a-mlXjMP6hSbGsppnnjJS_CDX5Y2PRok5fzeGTQCHReypSkXL-uwc
Message-ID: <CAMuHMdVsv-T-Vjd4yNK2k_pP_YQfw82UvFvYf9ynxMaQJQYxQQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 278CA214160
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-28893-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.612];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Biju,

On Thu, 5 Mar 2026 at 15:54, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add the initial DTSI for the RZ/G3L SoC.
> > The files in this commit have the following meaning:
> >   - r9a08g046.dtsi:    RZ/G3L family SoC common parts
> >   - r9a08g046l48.dtsi: RZ/G3L R0A08G046L{46,48} SoC specific parts

r9a08g046l48.dtsi does not apply to R0A08G046L46, as it uses the
wrong compatible value?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

