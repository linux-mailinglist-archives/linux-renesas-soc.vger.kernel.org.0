Return-Path: <linux-renesas-soc+bounces-25609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF8CA7E68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 15:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A9593014DA6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 14:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4A6308F03;
	Fri,  5 Dec 2025 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTZnhLf0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62102F9DB2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764943878; cv=none; b=XNxp8jzBLiBp4If8WQC3vKJNh4AfVvHQLcmAL6e+0+32YDR5XmTT82e7Bsys3JPWT3hO7NPcRmN1dyDQK5ea93E0Qdht13qKmB4ixaWIy0pWe8HfQ4NlIDtzcRrBt7nsfASZJKA0FN5zzwvgsdwCi5pYO7r2t/xcsOTpvMfR7Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764943878; c=relaxed/simple;
	bh=ZMCm7W6YKxTJT59+fIMuX3/S1J4Ngcse8UNpCxHCdqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGh7wEd9Bwr0m/seBSCtilOK5zMYMQUnzoY2G58hi5dfTmcmX74KvqKWvLuoBdxpIdlM36geTuU2Y02KujBilSv3zcbvmKisXBWMwzAKWW0vp2qNe6GMABXlaAVy8B8aOnqBp7fYAl8+YSGqs3c6Aw2xPAJfl0DPHZ5pwHC7yEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTZnhLf0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBFFC2BC86
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764943878;
	bh=ZMCm7W6YKxTJT59+fIMuX3/S1J4Ngcse8UNpCxHCdqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aTZnhLf0ECuEd+wBDSz0AMoQtzHDH2muG/rA7NAE/mBWWKos11pQfN6DQKHyajT3q
	 1ldqVgVOftBtTGLAjyfh3NxEJTDF0TVQ8Oo0Nnng0AjBuccgRMCl8y8O5S8QNj+F8j
	 RVz9ccGlOoGqRNPl1UQTX9wWDU/O+2ynyd21f5CJxRG/IyruDubgznt0hRBOoOrGoI
	 aOLajKEFJHuptc1VjQ4y+ccYZqGG1JyKet67HzwOteyGpi6P8Jd7N3a+e0VaTQtI4S
	 GpuhMaHeDFW6RKmMraIZAOJSPY5ecSwmDSAAACq1Dr2Pl5cKiZUO4qWhgR/YRhnsJr
	 0pSmAJiJa61vg==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6420c08f886so2457366d50.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Dec 2025 06:11:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWEWKdh57+XbWYKrFd0EgiO7di0aNAii3kDxptq4WJlPGk3ovWvt3qNctvSo4SAQRCalnHBapmyNJC+9mQqomREJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnuEGXqx8XsFG8LJsG/HTjm2rxZRzU5Oo9EZxLbv+41WGhIOQ7
	W1bhouVIhYumV4ntbl29U1S0rpsXciltoSe4cuEp5mL4EJ+Rlf7e45QoIHaBLcNAhwoOkvF7nbs
	kUXYAG9Vlm0No7k5vYB3GMHDyPn5zc9s=
X-Google-Smtp-Source: AGHT+IEIfvC759yuVcH02RE4GW4qH2Ys7uHp2NQ72HenyKnTBQYRbNArLc/QN0zNZJGg6Ck/JosV6/HWxtziBHNuB3Y=
X-Received: by 2002:a05:690e:13cf:b0:63f:aef7:d01b with SMTP id
 956f58d0204a3-64436f96e35mr6953289d50.8.1764943877033; Fri, 05 Dec 2025
 06:11:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
 <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com> <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>
 <20251205-strong-dandelion-newt-a776af@houat>
In-Reply-To: <20251205-strong-dandelion-newt-a776af@houat>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 5 Dec 2025 15:11:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLkjMRQ3piayZYdKEMDmiwzARfxY36b3=PVUepw0PqUyTA@mail.gmail.com>
X-Gm-Features: AQt7F2ooVl-aRLrmmqtuqQJpJ731dmMHgmyyfa05zyP1eQASt7uZOJRtxkCEx78
Message-ID: <CAD++jLkjMRQ3piayZYdKEMDmiwzARfxY36b3=PVUepw0PqUyTA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
To: Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Vicente Bergas <vicencb@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 2:53=E2=80=AFPM Maxime Ripard <mripard@kernel.org> w=
rote:

> - We need to figure out the bridge ordering mess in the first place

I was thinking about what we can do here, adding various flags was
discussed and deemed too kludgy.

What exists in the kernel are things such as the MMC power sequencer
which can be found in

drivers/mmc/core/pwrseq_simple.c
drivers/mmc/core/pwrseq_emmc.c
drivers/mmc/core/pwrseq_sd8787.c

with some DT bindings in

Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml

So here the approach is that the specific sequencing requirements
are added to the hardware description (the device tree) but there the
resources are really flat, then the driver for each type of sequence
takes care of the semantics, i.e. the actual sequencing and ordering.

Maybe we want to look into something like this?

Yours,
Linus Walleij

