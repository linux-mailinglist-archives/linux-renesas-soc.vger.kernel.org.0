Return-Path: <linux-renesas-soc+bounces-11887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A5FA0316C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 21:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E1C3164CA3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 20:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E921DF97C;
	Mon,  6 Jan 2025 20:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzBeHqy3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9BC70830;
	Mon,  6 Jan 2025 20:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736195614; cv=none; b=q/Vc/PmiosShgGoTU2dkLHG3RzdLj8I99ieLYBdqA8mRU97lYqpOuCVvTqyE1vnVRB+EXhv6Sq9ky/LrdWY0KMQusJhp2xWWP0Ob584jJp3kvKMIREgf/I9XdRKxM97krs9k/6IYZo8tOSEOn66TdHU2OzyQaCcijyntvZgEHlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736195614; c=relaxed/simple;
	bh=ds4umUueXZrE4C9yZ6upe/0XSEfeYEfJiKi3/3YkeT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+bKWoUwgl09ICpoymab5vIZPFFThXcWhIwJ0c2Z+Yjr2I/u9rXAxhv7bIghktfga5vzLpuBB1TTWJoazQALbts3/GExgEF0E530j3MzaaWVOoVCFK158vrhOgG7K8CYFZ3ZY2XsNYf/FZxBBt7eWywdfjs249gZfDQ1ySFGtoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzBeHqy3; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51882748165so5040434e0c.3;
        Mon, 06 Jan 2025 12:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736195612; x=1736800412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwA0QG8KFrY51D4/eLZpynusCjwVd44R6ZJGJ9HJwVE=;
        b=CzBeHqy3EM0Zkplfe7SwL1dOmfEOIZpQv00cj4UerWtyEOxse5JL3+CKHBEtlOTcWC
         UmNfWESHQAaYCycPAjg8NSe21wbQncMctYDdxnN4oW1pdIudZHwIaWrocyTMMNKk5QwN
         +E2/c341ebi/GVlZjZzrMnpToNLCgtAGVnbUPRJ1EwA4VWwF5vS62xKOmNkHP5ysIX9X
         DVIq0wH3lJOIJuIITbqoR8caNssG2A9/4SCkbBjRa8yYF7SloFlgA3MDs6gDjC9FDd4C
         FkTXjOR3SDVwV2egS3JhBF0RqaZ9AMyfxQ6ClgD4q/caVJShfJlsashZqx91gb+lRfR0
         iPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736195612; x=1736800412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwA0QG8KFrY51D4/eLZpynusCjwVd44R6ZJGJ9HJwVE=;
        b=aF2AsajuAISo/jn6BRY5MnYSqiQhfa6bA3QG40Y364+oBdubElaY5HzebRCImjf2YK
         qKn7zkYn2ky5EYwc2glgGcJlqiNnMWpFAT6JNdlmdbZRkRdID+U5yI2aATKGPcfo0FMp
         58nm1FMNALSKwtlsd638G8qzg1asMltDMzvo9dwYwSkx+2R+NSv20fwdFFlnn/1L1IkD
         vL3MH0PIJemn+lC7W1Fi2+NJbWTX96Zt0YtjOrWrsSDRp8tLtbiZKnCg/AWfsnf1W1ty
         zOTEm2NosOnvZIoj7Gq0gWjzbDPfkcl97zQHavMgqV6SCTkwr8SFKRRwrHWcdm0i4ntb
         EzNw==
X-Forwarded-Encrypted: i=1; AJvYcCUsgzjgZ2nJtPOVyAkYu0rG36P+3LdHbn+pcyBc5Wu59PA6Wc69bi/0RqZByeZYLptxd8Wwv0Gphow=@vger.kernel.org, AJvYcCVQsgovxB7W/GIU+Ossg0ZMokDGRCP7ZNcO2+qtEVxEwhwGQTN6859qkV8zSau1Mbfa/3B2QLaYrctsorOT@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRfWCw0sSetQ6Q1rGYpI1GNbnxTU9grmZ/ByFJ+lJ8sVPea9K
	A0++gPf5KAknYfSDIgYskk/u6mD6Y8NJG1D1xrR4G5kYHpE6Znv0COHkcK0TIvUZJVaKE9isVnI
	2OVZvjtIsjKqJACvcrE+K/pd6ZDU=
X-Gm-Gg: ASbGncvjOZFce8wdCWpcgF0zZAC8+Jk6EqZrvVKspEaDcgFsqWBxEJSORmLccJL26gd
	hbPdau407/DFyNovlWsAZMgGLa3B8poG0T47rVOA=
X-Google-Smtp-Source: AGHT+IGr04vcTRYJhHOq7sZFudn2xOVjXM6iF1i3lH8XioAKtXTwRZZN/9TGi09akuhlcP0ygwqnEwkE0J3TpHIDotY=
X-Received: by 2002:a05:6122:2893:b0:518:859e:87c3 with SMTP id
 71dfb90a1353d-51b75d317f6mr41788901e0c.7.1736195611815; Mon, 06 Jan 2025
 12:33:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216210201.239855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241216210201.239855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 6 Jan 2025 20:33:06 +0000
X-Gm-Features: AbW1kvY2GSWt5VwP6ZkL_0Mhx2y36qLqIh92ZlPizU1ICe0qjbI0n4_MdV1m1Kc
Message-ID: <CA+V-a8tYphwwTqzzwH+0kBGLGZZYLW+eiJsHpe-cvpywMRnEaA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Refactor Runtime PM clock validation
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Dec 16, 2024 at 9:02=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor rzg2l_cpg_attach_dev to delegate clock validation for Runtime PM
> to the updated rzg2l_cpg_is_pm_clk function. Ensure validation of clocks
> associated with the power domain while excluding external and core clocks=
.
> Prevent incorrect Runtime PM management for clocks outside the domain's
> scope.
>
> Update rzg2l_cpg_is_pm_clk to operate on a per-power-domain basis. Verify
> clkspec.np against the domain's device node, check argument validity, and
> validate clock type (CPG_MOD). Use the no_pm_mod_clks array to exclude
> specific clocks from PM management.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 102 +++++++++++++++++---------------
>  1 file changed, 54 insertions(+), 48 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

