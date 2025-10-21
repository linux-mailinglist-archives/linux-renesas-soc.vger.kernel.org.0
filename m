Return-Path: <linux-renesas-soc+bounces-23383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 344BCBF6BBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 15:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E76601884793
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 13:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848594A06;
	Tue, 21 Oct 2025 13:22:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B1A3321DC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052940; cv=none; b=KBziOrVKRDHXmX8RDLbDQxPiI7oIk0nqK7HmJOolF/NVO9otGFq2M2VDU2h4+rvlyL98yviP8gwXg58h54oSvgjT/jvjhKqqy/BBbuLLJg/LW7cPfzJd3J2UMeuecOPKybS1050Zo2sBLY2TkuwWbh75IyAKpc6Pl9d9l8wlnvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052940; c=relaxed/simple;
	bh=0uBoagiYHO+cyUPZLgM55Q/MvfDRnviDbb0BFOjR7+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYw1HY0KtVSzPutg0fH9F8b0mOlxcAhjtaJ2kwzFYteLNNeE8xi8ypwbgUuzwfcXFikCP1AwdF0AMLdVC97MoJEkgL5X0xrZdW9oRofCAgVuhRv79DtpO9y3yUzy8BESJzUH6df4Ywc1FCEahCfYv9y2QL/ejUyaEE5Xgy7YTe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5d5fbfca7e2so4681931137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761052937; x=1761657737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvZqifROs3RUIga+LmVYgxTzui6YYka8rzDZzlcR0C4=;
        b=F06IgPO8ExO+Ifb+T6inMOFOMIDpOdtQksCW8xHOxQ1rHfTUxpHFKrzL5rAkpV0QMo
         VoAq+4f9ixOiIXtZeV7/rSlIUrMJSIPV3aOG137ASXezHif9ewzUKpDG48enB4FDPTcT
         m+egEnE04uYndEpEI0/PsUgHKrZMrqM1dY2SURsn49VtzM+m/zRlV56ogJI+hC5CmrB7
         sKkRH6VWp/XUE3+fbrgT4k+YyDkx+qVK3SRQqG11AKiXxcX95QY/8xYXklW95n8uIcQQ
         Ho6leMuLAd935hwP4D1odIXDc5jfDbm9SUjGdzeY5akKt2Np0gNBNDajBx4bLfvOl6IJ
         ckrg==
X-Forwarded-Encrypted: i=1; AJvYcCXWAesYKacjMYGPrKP6YkIhAnYjQPJNc1MLmUtFCFdDmVFJaShxAr+AEpMrNNAXTatgfWIYAHu50eMN7foUcG5Lqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmcc/hxcChei/gP7URCj+Gqh0rlMso5K+/DyKWcugkrjh6j6bc
	3oyofUcupmP3G2jkX0BTDOw+7fElHwtA/0If/RQNAIykULTb0zzxVTbgp3dsj7c8
X-Gm-Gg: ASbGncs1vOGsFKt7vSTr1QpPrbSaiLwM2aUNvjBNiJJpE8ZHvi6DWX3IbGF5mdx0lbM
	Ba/G+wp104a5cpqWRamLU26MkviaIbg1+bu4FRXSCZixIokf6eJaZX/KzG7P/u77jwHpcK7b5Gm
	f1Sr9aoJ5Uuj1f/IsMhi1rzN2amLxKvUZ+zXwy2+mKjXkxpKEKUJZ+9TSyQfnVHKa/vIDlMuaQY
	CUT1rtvNhIuqYvCVRtv+BIxXI2HJX8qkpvXD2UuI4WmJ4ATh2H91iottjNRnyi1v+Ehzg+0AvA7
	u4Ph82oXCZL1B1wyh1i9zABHnpER1defhQvcaqtw99UR8aaHBT1gUX+ZFvwFH4tus46UdxeITe9
	sdOKfd0KEsIiVajpdz7UNUltOQfQuRoJPiMrVlixunW+vMUaBzZLSEgFDXoMh2p0Mv4d7D2LpMa
	d29g6BLO8g3DTSeeT1zTf0by4A505P1Z4VMIlWcjI22j45Fgg2
X-Google-Smtp-Source: AGHT+IEmC/aKMZmdCWro3E16NH3AhpQxbNdZPYV+k6IPlcnyXW1WeTktgWqmBm3yKZLKlFbRxu1lvQ==
X-Received: by 2002:a67:f859:0:b0:5db:1484:3dde with SMTP id ada2fe7eead31-5db148443b0mr362719137.17.1761052936823;
        Tue, 21 Oct 2025 06:22:16 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-932c3e479f6sm3406580241.15.2025.10.21.06.22.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:22:15 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-932c428442aso2281496241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:22:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQ4psz2F6oAT97f5ehi//0BFCQmcBw/7Q9efef80ytR+d30FGOM9lsiBYb4S4xkCKkDf5Pz4A6OfqpIa78DI5l1w==@vger.kernel.org
X-Received: by 2002:a05:6102:304a:b0:59c:d78:dca with SMTP id
 ada2fe7eead31-5d7dd6aaed1mr6029714137.15.1761052935327; Tue, 21 Oct 2025
 06:22:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com>
 <aPaSF2lokJ748cTx@shikoro> <CAMuHMdXv_R6POTQe=MEcEOraKhjhzwrW5skkWnzgvijF2qAykw@mail.gmail.com>
 <fba13116-2495-49a3-a1b5-2eecb33bb448@mailbox.org>
In-Reply-To: <fba13116-2495-49a3-a1b5-2eecb33bb448@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 15:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUP_bH5WW3=3J1H=6SocKzQXPdP7PFfYDrgaj4EhYTaYQ@mail.gmail.com>
X-Gm-Features: AS18NWDXxXzByrAwA63AeQ3A7tiTE8rGRfiOTREJO5xJyBq7hy3jZBwr2WwZDio
Message-ID: <CAMuHMdUP_bH5WW3=3J1H=6SocKzQXPdP7PFfYDrgaj4EhYTaYQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 21 Oct 2025 at 15:14, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/21/25 9:09 AM, Geert Uytterhoeven wrote:
> > On Mon, 20 Oct 2025 at 21:48, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> >>> Or better: drop all these swdt = reserved commits?
> >>
> >> Maybe. Since Marek is maybe interested in fixing FW...
> >>
> >>> TBH, I always had my doubts about making them reserved in the upstream
> >>> DTS, and there does not seem to be much gain in doing so...
> >>
> >> No strong opinion here. With "reserved" I think I followed your
> >> suggestion but I personally don't mind.
> >
> > Well, the proper mechanism would be that firmware using SWDT would
> > override the status to reserved, preventing the user from using it if
> > it was enabled in the DTB passed by the user.  But (a) the current
> > firmware doesn't do that, and (b) we currently do not have a use-case
> > for enabling SWDT in the DTB.
>
> Upstream TFA does enable SWDT for R-Car Gen3, but not for Gen4.

Oh, so this is a "generic" R-Car Gen4 issue?
Does that mean we can use SWDT in Linux on R-Car Gen4 with TF-A,
or does TF-A still block access to it?

> I can pass SWDT node from upstream TFA to next stage on Gen3 if you
> would like that ?

I guess that would be a good thing to do.  But I am afraid it is a bit
late in the product life cycle.  Ideally, everything that is used by
firmware should be marked reserved...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

