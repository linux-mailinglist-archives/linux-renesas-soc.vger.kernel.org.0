Return-Path: <linux-renesas-soc+bounces-13944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB8A4D4DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 08:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BCF2165CC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 07:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242231DAC95;
	Tue,  4 Mar 2025 07:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgzQVgmF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EB8AD24;
	Tue,  4 Mar 2025 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741073631; cv=none; b=LT4kc9lFvDc+IK4XF8JbZxBnJfMgLoOTHvxlWz4N2m1WYNay7l7cRyGlzuE6T6Bq7sUi3xu+jj/gTc4U+VjhI34fG9TUyKv5IMlM+07f4Hmtr0TZ+EY4Y9BDnaaH+n0hQSVGR36IT4j/gG1TelqKJFyZY2LfdEeHcblULy9xFGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741073631; c=relaxed/simple;
	bh=nL4zk9QQnKRFWoisZN2nE8OPc+GM0wYjTqrNEnWRaPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7Nfhebq3/kAkrZ6RIsOUxjZwytMDFLlERutjDGANHYkZueHJa26Y1tp6/nvA/O9gvvlKuALDQJDh/BJ9fMvGBdF/HFXmJBJrM/tNvBtLpzAYToO9ypoE6BZlQvSNPXK7xvq68qop3QhBms3GfHzpt5FYGG5GeG8e611ANV3gro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgzQVgmF; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52379e9b7d2so958136e0c.1;
        Mon, 03 Mar 2025 23:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741073628; x=1741678428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nL4zk9QQnKRFWoisZN2nE8OPc+GM0wYjTqrNEnWRaPI=;
        b=DgzQVgmFR1PjsQLjptDZli9ZNdcFmDAdTHX/kV7ofJ+i0pqyLkJjLZvJgAIRzFFCgK
         LvvT/ZV/iGT9NP8LGuHjbs4USh64R1VvkH5CRGOENJuRxkBl84Hm7QLmr2LQSuQ8W+7R
         N6BFHp9S7f2PogHBXs0Ng22D9+lHabUJuKNh/eiAY1fmbCj5fb1ZQo5Lq3nD2Rruxu4d
         LU183fMPuBP5RyZHhWxcAwVv6aUbwEmu5YJY+OJXD5vKlAFkytNZopLNPhYgdcRGLpMq
         v+SAk9RdrJaJN+zcjdKx+y3FK9xWjmgTakVRCcZX7EamuMiDCzkKWLKEE5EeSvnEKZlr
         jIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741073628; x=1741678428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nL4zk9QQnKRFWoisZN2nE8OPc+GM0wYjTqrNEnWRaPI=;
        b=Mz8csFKmtKLY4A+rydl9YeC7Wkhu9FpfdFptjtNh2A8Mo++rBUAiGNfoZlO8NA2xxm
         2WqDhxxDV1BV2H4nSeHdArjXbHcZeA0AVjid66ZBBiQZBeFVMRmuDqAq83KEM8oxPJA6
         Z0ogoCFRBfJawnZegVPA5kIDEeqBXdrEln6pOTc3lUtW3UTyIZo+I9bFfH7u5tx8futD
         mS823GCUqXOa5imFllYTACcoD22nBybJjhIaeZ+nei0t5gVASJSxNbp97rg2a5kYph1g
         OKBPRM0naY69mXhgGcbQ+T51hoaTScdPbWxewnFo2i7b0WWhU/mapwRe/IOWaESOjjVk
         y4nA==
X-Forwarded-Encrypted: i=1; AJvYcCUkVJu6sia9iXnhP6hjV/i+JPSfjnXbl2ZOH4ZD3+A4BHaE9mPzIVWYvweEGMNiSnJBEscZxhBxIUmYxKaU2MB811w=@vger.kernel.org, AJvYcCXHnMbdfTe+F8Y3QisYiJEVcUbGJHXOXuW1mSi8fNjYvUbuRU7uktPuFKnujiHtaB4H6SCspmkgDtGT86c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpcsc0/SzQZG3v8SAFpnY4BjNFsShm8qE6Qs35fHDU7JgWILK
	hO6CzCmIbXFm2JglMKwRWGJZSnK13WfZN2fI4kGzM58TE4+Pwzq7bsNcWWLHzQYT+t56OtAhtGM
	QJyrDpF7VeIzpiRBPbCUmbHM0d9Y=
X-Gm-Gg: ASbGnctKHJsKqGsmTHAzccoNx8Zvfsg5r/zdkdglK2d4aVm+HVYx8jNEWHgBaPdhuX4
	zyShv3NPxe3iJM0a4125eRa/agpnrz6zfrJRcHEJnQ+mE4Cu2M6YLzZWFmdi04mVh6XMJloVGLO
	dC0/xQLv9YUfFoBsaa49JjNJih3A==
X-Google-Smtp-Source: AGHT+IG8pXgfPepWKEQesd9NhynNcTYDD3cA/ivic1r5Lq8XxYKalCI9+A5tReNldnOL/8L7uejFJJWyk2VkKnr/WEI=
X-Received: by 2002:a05:6122:21a1:b0:516:240b:58ff with SMTP id
 71dfb90a1353d-5235b855371mr9690355e0c.5.1741073627806; Mon, 03 Mar 2025
 23:33:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303201230.186227-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250303201230.186227-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <08f39668-99e7-4d66-b3a5-b21c89934902@kernel.org>
In-Reply-To: <08f39668-99e7-4d66-b3a5-b21c89934902@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Mar 2025 07:33:21 +0000
X-Gm-Features: AQ5f1JqmnadmW_ZeGdrLR-ltY0zWWuBUqDgzJaEib8QrDVQ0L89GqDMAVXRKwy0
Message-ID: <CA+V-a8u4bnoirzHnjCHj=dZ9XbboSF3MfHY+3b24NXYo9c4oTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY
 Control bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Mar 4, 2025 at 6:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/03/2025 21:12, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add device tree binding document for the Renesas RZ/V2H(P) USB2PHY Cont=
rol
> > Device. It mainly controls reset and power down of the USB2.0 PHY (for
> > both host and function).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree=
/bindings/submitting-patches.rst#L18
>
OK, I will drop the bindings at the end.

> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
>
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
>
Ouch I missed that, as I sent out a fix to one of the reset driver and
re-used the same command. I'll resend the series. Thanks for pointing
it out.

Cheers,
Prabhakar

