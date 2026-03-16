Return-Path: <linux-renesas-soc+bounces-29462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OSxFaHEt2m1VAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:51:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE904296798
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F0E8300F110
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 08:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B58381B18;
	Mon, 16 Mar 2026 08:51:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793723EA83
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651081; cv=none; b=sy47/oj/oC1uN2IPBaQVL0QdgCAhJeGn8VVviwcm2j9mfhpxTCdTfJDN8mV/rMJQf5PvifGUQnnahEZtay1f3tsfdHdlfMHWt3oLSNPkkEmZqMyAo4yhpkn6gTcVT/akpCHJxF2s0llda/QY4xMAEDcZgT1ZBG/N4Djn8P0LHwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651081; c=relaxed/simple;
	bh=27Xb/PjJ4oY9n6sievhbObmM/x8nGuiMHd/6chr7M+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HC0otqHHYifbth6ZErwqZqhlzOtUPTpqK//Dsu266hFiZ9KdvoisalaO72zCoSeyNs/fRZV6xfnAC7SzAaxmNcXU6p2WXg/tGFVZ9AT8qDnysA+UOMLRvjjLr2hZ+k2HUYsofm4R0fcBnP2LOlveTtEcQn6PeO+5loKpyIMvtRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffc879c1aeso2794055137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 01:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651079; x=1774255879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ni27tE4Uc17PebqPukQD2Audc02oOzEQcH3vVp9B4BQ=;
        b=gJiEY2XNBpvz3QfcRtlKu2xgHq6QXX+oLbVVdcgGXK6T+2faKwfjvDmucFKXUCFuDn
         cp6+Z8l1MtFDuLaCGClpfnLADUp4ngrzjSN/dwHGqNRyiBT3VUDigVgiqHV5pMPXIgG7
         zAE1MeaZYPDrUkQ2rrxX9CCr5jObDiyOPFgjzATs8ts/vwD12JLKkTIKB+ME+IerVtxz
         S4WWgfkfoHaghmju1171XFVmnkJ7ZMHrkJM28kGMH5U6vY4/nQeDVoy8hIVcFlaARBdK
         /qq3I7GxmN/N/HMLEZvCdqOmH4IEt1xoFjsLFThwA7dUD8Lj956y6ojxGolvsart7Sdz
         Xy3A==
X-Forwarded-Encrypted: i=1; AJvYcCUKZr5VOOe52iwpug3vJX2BsJctHQUQy5Jq4ZNldDYfbEi5alnt/cErYaYkfWfg+fz51ie21X1o4oABQRsBtbizhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEvWk/PzX1OOIV1E4vsDFpmwIBTAsGMYrKMxOn4Xbfrv71Tk7Z
	YLwYVIxsxWwyzxukwKCaVgW/Ns76dtQUTYasPUlfGy9XFlqld8t0m4XE5S0cT6ZV
X-Gm-Gg: ATEYQzwEANgWv4MfKuxU8fTpi4MArnbNCoNVv1/yG0Gat3Rh9VFM+FD9elVnX6ub3Cm
	aqvmsdlakOeFgeju489I3xAACZRogfs0m33e6hDKmQ7zXwBBOC9tSWMvW52zEB1uKbJ6azQOSn/
	2V0ytrcXP/Q3i7Bpb0LBAoyA81OzvTkB2mwF7dmddlKHsLoTbttkmSIr7Uruvy9nI7jd94FV/XS
	0u7TtZ+LuCQWg5Q0zPziXizIZ5Ny6buZgNjbiN8vXz8P7im936JPIJKJOl99KQ/ehkrlsmaLXh3
	jLLffMc65A3WNz9OD5fuTXAWnurDUbYrPwlHsKE9j/Mqv2Zb6svMC3LV6cDPJmmf+Eiqe8bcim3
	OTXTJpxweQ75s0++CUvC2hC5Ib23wETkSnqne7kEDBj+AQWZtDuwrewdLCuNnqJWn8DLvOxazAv
	03q/1+VcUjXXWObj4VjNztqimzfkVbWSD4l+I1wLZ4EKmREu5TN1RBSuM6ivdBPvfsFyYOYDo=
X-Received: by 2002:a05:6102:e07:b0:5ff:a4e0:1944 with SMTP id ada2fe7eead31-6020e209a9amr5587939137.1.1773651079387;
        Mon, 16 Mar 2026 01:51:19 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-950e481b25bsm153611241.6.2026.03.16.01.51.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:51:19 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ffc879c1aeso2794045137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 01:51:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP/wrW7+q57Cm8RbOJUBt4/e2y8QhPUf+0r8Uugbf1+PbodrWhpLGD+O6hEUxiDt/I3oOAO6KrjoyfKfFhXwmx3A==@vger.kernel.org
X-Received: by 2002:a05:6102:6cc:b0:5fd:f2ad:c653 with SMTP id
 ada2fe7eead31-6020e2cde73mr5380780137.16.1773651078892; Mon, 16 Mar 2026
 01:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399673.git.geert+renesas@glider.be>
 <20260314-quick-gray-saluki-0f96ff@quoll>
In-Reply-To: <20260314-quick-gray-saluki-0f96ff@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:51:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
X-Gm-Features: AaiRm51SoosmbfwaefU6BPqSHDNLBprafGmdntJh4QZy8XCfS9j5Er_XSACDcgM
Message-ID: <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
Subject: Re: [GIT PULL 3/4] Renesas DT binding updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29462-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AE904296798
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

Thanks for your comments!

On Sat, 14 Mar 2026 at 12:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Mar 13, 2026 at 12:12:59PM +0100, Geert Uytterhoeven wrote:
> > Renesas DT binding updates for v7.1
> >
> >   - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
> >     SMARC SoM and Carrier-II EVK boards.
> >
> > ----------------------------------------------------------------
> > Biju Das (2):
> >       dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK
>
> This is DTS branch patch.

It is a DT bindings patch.

> >       dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC
>
> This is drivers. Splitting it into additional branch is not making it
> easier. I don't know where is this supposed to be merged. I will take it
> to drivers, but in the future, please do not put DTS bindings into
> driver bindings.

This is also a DT bindings patch.

DT bindings are soft dependencies for drivers and DTS.
DT binding definitions (I don't have any this time) are hard
dependencies for drivers, DTS, and examples and DT bindings.
Arnd merges dt-bindings PRs in the soc DTS branch.

> See also submitting patches in DT dir.

So the second commit is subject to II.3:

  3) For a series going through multiple trees, the binding patch should be
     kept with the driver using the binding.

In this particular case, I could have included it in my drivers branch.
Where do I put SoC-specific DT binding changes that are not picked
up by anyone else (I don't have any this time)?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

