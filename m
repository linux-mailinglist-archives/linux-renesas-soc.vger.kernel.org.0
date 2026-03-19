Return-Path: <linux-renesas-soc+bounces-29854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPZIMFm6u2nanAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:56:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 663A02C8285
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BEA83079F8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98A13A2576;
	Thu, 19 Mar 2026 08:54:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9BF3AD524
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910475; cv=none; b=kS84O9kbmp9ahlIiYa2s/tBBAkPSGlA5m84S7kiwZsOQxVuvskhweemvzsbHQwB8lCUdY3FsCGLXVRPVzqJe6Dnnph/4lQgnqEfRqqv5OfJldD5z4KdaMkg4t8e830H2oudNVwNXpwbta5V1qUdgQN5g/5iggnHVMPntwy8f7ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910475; c=relaxed/simple;
	bh=WIWBkTl9bfce3Qj4kW9OckN8Sty42b9Q8UgDdppvcqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzFRAIrkt1Lhwt9iw4WM64LMMz5OAFGlD7n63Tjoi9Lesq4zblRMLVaGWvs1hiNQpcRMwcdyaxfcPfVd6pwEP4UWAgZz4m+Lr/Rfro6su6fNAZlyNik+l+M6Kn4087+FZVxUWpo/vIiwfhbyyNomfdCxeAHUgJfqWnL+Q6DPDqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-602947681e2so437354137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910472; x=1774515272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIK47jhWtUjQOc+SchNfm0Az7lIIfFr81y4hdkDrfzo=;
        b=JG5AaHYnNli2EHR3c2QXgzjic+lpOIx2F290DA/s7Ssadjmv46zTrChN/Ao8uKEgf3
         DaLeCYZ4ZcwCKet3x4BrGS1M4AjEo63lLJjOmsQ+hlnBl/JhgBeHBn4X3z8pWcH+hUqJ
         T8hEjQ1NXzyYjIANmvEOJCUOmnng0cdoEwtVOxyHD+uwwbB6ynHRSaTI05t357ZUHzhj
         0n6BT0DCh/XxM7FEibJ6j8KfYN04zSBS7QCJfORD3gxiDpeT67Z2L6mwTRPo1zMkKMss
         Yw9SH5c1LmBlSFeofq8q90Ohvn+cAXqjnijEiLOrAhDHdySD6MdhYW+OX4wX6ZbM6PUN
         oxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYKwQGdZGqqdPmlW4E3XqAkJpnyCeQ7i8hLJM5w8DcV3SKv2kNXIMGb0qZryzh/9kWnW5+CZyKHVegF5bNeHessw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWrFypN1PsghZqrb1b31IKj0eX2jB0a9cW0JV6ZvS1/BxCrQDe
	fTKyA2O3tfDefsyWN3EvKfyeQXtU0UkfbwZZagqrbz2Sdq6Kt7HHjQY38LwsO2mx
X-Gm-Gg: ATEYQzxg9mBhsBfcN1GRVkFqPPCrJWkyNJx7PFHGIAchSzAutQqc0UV/FH20CENmr0h
	kmUER+B7bC/TH6SJibpH7g4TwrUt1WmeHphGKanZS6OzqqEOdUQAzX0EVxEFmZvcI7vcvvEq1rw
	r2NxywE2KT2iUyw1y310G/grRlzf2Rf0ki3Z8JMlaLqOiua37qJt3vRAF1+PGLT5WpV3RCgHKj1
	67+mQMGBeBH1I+nx0f99daidAj2C6OD1U08jx+KYQoQc7glltmnT9IwNdNevW772w0B1j+daizD
	PspLmHQShAsTaTCnu/ZrSoeE76Ul27D3u1iGclR8aEk6Xx+djjQ/X1niqpnP8oMrTcoI0O+mzq4
	MjqTwoZBdBTt1Ur9y8aJbdh6cmM7DDttj5zyC7XRKyyKRVhm5duff8Kd/kqfdU+nlmw0C0EgSvp
	MOxWZD0OTFPrg+QDlkGI00sPwCV/oZH7vlr1rojMb6tFzAJDs0YFXOB3UKxRlK
X-Received: by 2002:a05:6102:b0e:b0:5ff:b8d8:b40b with SMTP id ada2fe7eead31-6027d12e892mr3500013137.11.1773910471936;
        Thu, 19 Mar 2026 01:54:31 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6027ee242b4sm2684389137.10.2026.03.19.01.54.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 01:54:31 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so344071241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:54:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUghiSIyWg5SIwx03WudbL9yWjX239meKc8vgP9MugxKVgztGqNTwfhY7E1yyo/hIwCK4ImvhlAkjkvnGE+U/JikA==@vger.kernel.org
X-Received: by 2002:a05:6102:2ad4:b0:5ff:1d91:a4bc with SMTP id
 ada2fe7eead31-6027d2ceda1mr3144375137.18.1773910471170; Thu, 19 Mar 2026
 01:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-2-wsa+renesas@sang-engineering.com> <20260318-camouflaged-umber-oxpecker-b2b29e@quoll>
In-Reply-To: <20260318-camouflaged-umber-oxpecker-b2b29e@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 09:54:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX=DRnFWG1ky8wT7mK=LHeJ6LduL28nYd19QpASrn6mew@mail.gmail.com>
X-Gm-Features: AaiRm53-6h1yt3u-46ZjxBclCr5aop1cQ-v42sIa610EI5YqQxDLYM8BFeoUn0A
Message-ID: <CAMuHMdX=DRnFWG1ky8wT7mK=LHeJ6LduL28nYd19QpASrn6mew@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: soc: renesas: add MFIS binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,vger.kernel.org,gmail.com,glider.be,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-29854-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.198];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 663A02C8285
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Wed, 18 Mar 2026 at 10:17, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Mar 17, 2026 at 02:06:34PM +0100, Wolfram Sang wrote:
> > Add device tree bindings for the Renesas Multifunctional Interface
> > (MFIS) as found on the Renesas R-Car X5H (r8a78000) SoC. MFIS includes
> > features like Mailbox/HW Spinlock/Product Register.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml

> > +  "#hwlock-cells":
> > +    const: 1
> > +
> > +  "#mbox-cells":
> > +    const: 2
> > +    description:
> > +      The first cell is the channel number as specified in the documentation
> > +      of the SoC. The second cell may specify flags as described in the file
> > +      <dt-bindings/mailbox/renesas,r8a78000-mfis.h>.

> > --- /dev/null
> > +++ b/include/dt-bindings/mailbox/renesas,r8a78000-mfis.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Constants for the mailbox part of the Renesas MFIS IP core.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_MAILBOX_RENESAS_MFIS_H
> > +#define _DT_BINDINGS_MAILBOX_RENESAS_MFIS_H
> > +
> > +/*
> > + * MFIS HW design before r8a78001 requires a channel to be marked as either
> > + * TX or RX.
> > + */
> > +#define MFIS_CHANNEL_TX      (0 << 0)
>
> 0, bindings constants are abstract (so without dedicated meaning)
> numbers, starting from 0 or 1 and incremented by 1. Shifting this
> implies there is some other logic and that would mean - not a binding.
>
> > +#define MFIS_CHANNEL_RX      (1 << 0)
>
> 1
>
>
> > +
> > +/*
> > + * MFIS variants before r8a78001 work with pairs of IICR and EICR registers.
> > + * Usually, it is specified in the datasheets which of the two a specific core
> > + * should use. Then, it does not need extra description in DT. For plain MFIS
> > + * of r8a78000, this is selectable, though. According to the system design and
> > + * the firmware in use, these channels need to be marked. This is not needed
> > + * with other versions of the MFIS, not even with MFIS-SCP of r8a78000.
> > + */
> > +#define MFIS_CHANNEL_IICR    (0 << 1)
> > +#define MFIS_CHANNEL_EICR    (1 << 1)
>
> Same here.

These are flags as the documentation for the #mbox-cells property in the
bindings file states, to be ORed.

E.g. include/dt-bindings/i2c/i2c.h and include/dt-bindings/i3c/i3c.h
also use shifts to make this clear.
include/dt-bindings/gpio/gpio.h uses "Bit N express ..." comments instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

