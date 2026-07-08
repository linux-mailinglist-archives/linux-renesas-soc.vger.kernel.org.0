Return-Path: <linux-renesas-soc+bounces-34847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t1b5AYwdTmoaDgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 11:51:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5C723E69
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 11:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c5RWgA47;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B07A301DC08
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 09:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D425731D757;
	Wed,  8 Jul 2026 09:49:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238DB23ED6F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 09:49:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504184; cv=pass; b=Htyeg9l7dtvSwHNdLsMKYCvON2ZoCjRS959BVUYt1yXCMS3L0KjI/b22D0O++/ftVNLZjwSljnZw27HhzdzjNmLLtVJDtczFofsihJtMR/Tka9ekiJw12grpCCunVt+vgvvM9o6iJSucbVgk2w165BQ/uzIbyu/7MWePD5EtL5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504184; c=relaxed/simple;
	bh=2ocFIX82rm4dEa1oVxO5JXtXF7MTiyhhS+58T3RbcxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca5Yfvnmm5QyfSrmNk3w+mCruv9iBePsS72e5Z6ORvNpUiDo8odI/pqtBU+8HXEXkVllm3dejYmLQRm/AaogHU3jATtzChjV87vw98atxQhaQFG6x8B/5Ct12hVwKIU4bSa1tcArKIOVgsNxqL2YCFp7nmuGzUmf+CgLiLNHnVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5RWgA47; arc=pass smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4728c12ba97so276968f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 02:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783504181; cv=none;
        d=google.com; s=arc-20260327;
        b=Dtq1Bjv1Dc+X8XNS8enxClSgzQV61ReEnbw1r12DY7B35qCUsqgPAh+SoeA/HQR8pU
         ptIMymJEDDXIlfwCPj2n1fmN9wqJtxTbZ1054EXVG+5yLOitsLbn2+8wa+2/30fj47hE
         XpLSlDcNgwFmjz+U+mEwFJad8AcnTTkxh59+ZEH15k+rTf9A9NBe1dfL7ngDOjkcltfr
         3ZkCtcUgWk3Lu2M2KhE/qi61ljW94JbRpl+4/5HexCjH+kp6hhnBrna587bfPDBsKhk5
         y+idIKndsJjbmuKlWBSdy/26OUVkrO5/L+URenOYIAiv7rTZ8YZPX5YD4WmStn1r4C3+
         6wGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2PHZjtADNnCn0QLMDaRS0NseXX2MUWl75IergG6pEgI=;
        fh=3SUvFN7FHjNGXf3oft9ggJgpI04US8+qXManqPNkCrc=;
        b=qO9A9xW27+Q5m8loZLfzIJ1xmuLL4p0ya4PUKcNGm4WROLlhtzwjH/2svo1IRtw6cM
         C8S5AVwEwOSCc3OHsZG+UPWGCCaNy22kDifKl8nPFudUHD79KgRbvteDpqByZBqA9grx
         2k6/zxs9Q+zBldCkyLqosdAewV0WFnYWjlKfpUi/EVKVXNimkHg7tXAIKGiAFTDwNyS9
         t+EgumWPTn3qsm52ZSb9w70cK+oUuUvkXianlJGBasO5eRbVcZ9EOBXNWfdi5fCbY5av
         qWokV70zWDUmDReUCini+XdHXWi0SJyGnZRYOFh61wD3c4J6W7BevMbUP/BYAkn4bAtr
         vonQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783504181; x=1784108981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2PHZjtADNnCn0QLMDaRS0NseXX2MUWl75IergG6pEgI=;
        b=c5RWgA476xuuVg+XBRvgPIRcpL9yTkeM4BodSkG3+Assjvupa2IPC+a3RO9Q9Ab8FR
         UPbFW01p/PPguYxnXJeX6F1HoTHQPDtNYDXC9hLamODZ0aOnI+/U7Pt8zNfYxB4A8/5q
         YN+vD/GcYTsD2rSr5chGvFRxPmX5dAQMF33HUDHx6PUa5m/67Q8xoHLxf8hpXFy0rC0K
         YWnaPYywGGZVxwEp18eza1S+uP/zX6SU2T7mBU1XBxdF/Qzjk4bPwXIovuNrOCGF7mhz
         SKmGaIbhTAPhnEzG2lc1QNeQs5iz3AVJDEP+Suy8SarRL0hiWzgMctufKPjjNr7qCqwW
         Lnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504181; x=1784108981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PHZjtADNnCn0QLMDaRS0NseXX2MUWl75IergG6pEgI=;
        b=Q+EO2DnaOvEyuRDQLrfPLp5WI28mBVIM+z56gQH35/TT4qvDNf9dU/eGi+XIr5cN3Q
         k2Ei/kQygjhaNOY02OU6BBV0k6ZH/oBBBMyMDKIyw5KsT8J0W8jPQK05SPtDSRVj9AcM
         yOKo6P+pK9Uw8KGyZ8mOQm60c9LgnNW32sQxYdlzZUw3YL9rXs8axP0yqH3OAHjXyWg7
         zN8thpxSEZiP1JirJ1o46b/wByFKefpw0G2wahl2upu5xUm2PMI0SpRlQvmYgFiTJrAV
         Peo6+BAhBDE4th/eZfpMecjF33hu6Pd+4SnGIPGxlWBqBeSA+fHKNzNKKbNqXNcO4SiD
         X91g==
X-Forwarded-Encrypted: i=1; AHgh+Rp2KNQBVPe/mRdEP48chwbx8YjzYNIOn6sutIHGhfxmvIjljZEQ/WUdtFs/OhZf/gKykbmTf78/oZk/XYH6M92cug==@vger.kernel.org
X-Gm-Message-State: AOJu0YylX7AtrXOZeeo2QiZYDZq7G79WuyirMctlASqr2acv4bBGwVxr
	Gm8FLAmmSMlG3odr//ywks34/GodTNqgURvIfBXxkiehP6+5CaoKnKvXqWNEzfADyHUkRBJXxR3
	+tcM9h2Sff+HymIieZu6YkN6qaYNXYFE=
X-Gm-Gg: AfdE7ckxsdPGVKLXIgRr15QqR5hKrEaz+u43DoduCj/g3oTP7q823KM3CAQ18oxwIB9
	nn919HTbe4jv1pVLvUbXBrklsUYbPCyWTopbY8GvMzqscJrddWVEfandqJHmffr1jzMdXz8BNyT
	OiytNrcj6kiPSP/nUK2/l4NQuPjvApn+83R0MMTFw6njdH0DVNzreVbDS+gYjrp/s0Dl55bmlXq
	BOEJZGd3Hps6avGK1/oj7ovLauLmJz6Ke1btCSiM4ZKS3BVCnj3TVWSIMBAtKkpZOzUuUM9afZT
	0pmGp1g41L1O46QGEm/M/pAhL5ZAwInttFmUzQl7huTrDrVKEdn/sBGzf/Y=
X-Received: by 2002:a5d:59c9:0:b0:475:f0f0:9efb with SMTP id
 ffacd0b85a97d-47df0787b87mr1790194f8f.50.1783504181280; Wed, 08 Jul 2026
 02:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602204707.1920839-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX9S18T8fou_pGGYFGPbMSLohfJp=QS-LTHA0rFbL6zpQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX9S18T8fou_pGGYFGPbMSLohfJp=QS-LTHA0rFbL6zpQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 8 Jul 2026 10:49:15 +0100
X-Gm-Features: AVVi8CfeOYtJ-2yrVV7ulXxmGMg3Rv7iYee7gVieHGVSx8IvXGQEQluq3FFYs2w
Message-ID: <CA+V-a8shGvL3Antq=x_NFuK5r+2ewYEgfqpPYKE-JEk7hWdu=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add PCIe nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34847-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DB5C723E69

Hi Geert,

Thank you for the review.

On Wed, Jul 1, 2026 at 3:08=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 2 Jun 2026 at 22:47, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add PCIe nodes to Renesas RZ/V2H(P) ("R9A09G057") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -1025,6 +1025,146 @@ rsci9: serial@12803000 {
> >                         status =3D "disabled";
> >                 };
> >
> > +               pcie0: pcie@13400000 {
> > +                       compatible =3D "renesas,r9a09g057-pcie";
> > +                       reg =3D <0 0x13400000 0 0x10000>;
> > +                       ranges =3D <0x02000000 0 0x30000000 0 0x3000000=
0 0 0x8000000>,
>
> (kast cell) 0x08000000, for better alignment with the next line?
>
Agreed (and below)

> > +                                <0x43000000 4 0x40000000 4 0x40000000 =
6 0x00000000>;
> > +                       dma-ranges =3D <0x42000000 0 0x40000000 0 0x400=
00000 4 0x00000000>;
>
> Sashiko wonders if the first cell should be 0x43000000, as the window
> is 16 GiB large, i.e. larger than 4 GiB.  I don't know...
Agreed; this needs to be 0x43000000 since we can access beyond 4GiB.
The driver currently has GFP_DMA flag for __get_free_pages() and we
need dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));  I'll
preprare driver changes for it. and send v2 for this fixing your
review comments.

> If Sashiko is right:
>   - RZ/G3E is also wrong.
I will fix it.

>   - Should there be a second line for the 32-bit window, covering all
>     low 4 GiB RAM?
>
It's not needed; the driver handles it internally, as seen in the logs belo=
w.

[    1.849811] rzg3s-pcie-host 13400000.pcie: host bridge
/soc/pcie@13400000 ranges:
[    1.857545] rzg3s-pcie-host 13400000.pcie:      MEM
0x0030000000..0x0037ffffff -> 0x0030000000
[    1.872114] rzg3s-pcie-host 13400000.pcie:      MEM
0x0440000000..0x0a3fffffff -> 0x0440000000
[    1.880920] rzg3s-pcie-host 13400000.pcie:   IB MEM
0x0040000000..0x043fffffff -> 0x0040000000
[    1.896393] Setting inbound window 0: CPU 0x40000000, PCI
0x40000000, size 0x40000000
[    1.904323] Setting inbound window 1: CPU 0x80000000, PCI
0x80000000, size 0x80000000
[    1.922267] Setting inbound window 2: CPU 0x100000000, PCI
0x100000000, size 0x100000000
[    1.930407] Setting inbound window 3: CPU 0x200000000, PCI
0x200000000, size 0x200000000
[    1.938533] Setting inbound window 4: CPU 0x400000000, PCI
0x400000000, size 0x40000000

Cheers,
Prabhakar

> > +               pcie1: pcie@13410000 {
> > +                       compatible =3D "renesas,r9a09g057-pcie";
> > +                       reg =3D <0 0x13410000 0 0x10000>;
> > +                       ranges =3D <0x02000000 0 0x38000000 0 0x3800000=
0 0 0x8000000>,
>
> 0x0 and 0x080000000, for better alignment with the next line?
>
> > +                                <0x43000000 0xa 0x40000000 0xa 0x40000=
000 5 0xc0000000>;
> > +                       dma-ranges =3D <0x42000000 0 0x40000000 0 0x400=
00000 4 0x00000000>;
>
> Same as above.
>
> The rest LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

