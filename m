Return-Path: <linux-renesas-soc+bounces-9749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF0299E6F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9814B27429
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 11:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774F31E9078;
	Tue, 15 Oct 2024 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1zkhdSJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55571AB534;
	Tue, 15 Oct 2024 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992849; cv=none; b=KcPh2c0nuAfIqLOu/z09G3ZqYVbL71bbMjVggJF76BXea9hNqqrcqwiI9liI/Uf6QWcG32YCsBbtUHn+bZ0rSriyDJDsUaB071TXulC5zyUBg+ADHrlm2/vwuIEcU2/G4+sy2vhZvYlQNLWrnuXb6rifW8091pMkhnN21AaCGpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992849; c=relaxed/simple;
	bh=abSjYnI0GhL3FbwW1Rwj6HPg3h4DmAthIKhez/p3p5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1y+3GmIXqVbdGpSV2xxCEeNQ2aFy8fI7D89riqCvIkzy2olelWoNHPf2el/dE61458DWzFjKtYyFUXsFtkVSurh2iAQkT2xSqVo9suguUCBa3vX6TNhfMdZPeQ/3ifFa1JF5YuwBdDOrmlkZpuM+xkgB142MuRhxsNsEER0yjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1zkhdSJ; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-50d35639bfaso1202424e0c.2;
        Tue, 15 Oct 2024 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728992845; x=1729597645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYoo+/bq9AOhakrbDZ5H5biZzWXgqg8gSzOfld6jvh8=;
        b=A1zkhdSJx45GNO6SHqPlEJfzcRY5UooibYu386+SJrBG/trzKRMPa0h9gb+hdHHJ0+
         BBH8R1XXJE/QH7ZizwMEOD1+kDYWGYBGGvn3Rm9QMCfAtCcbj0gdn+OXqoaKjvE2I+Nl
         HR4lW7m61wSgADg+DWUnsCXE49/gJKVFyVVhOToV28fjtrNoW98WoF3gXWDW+M0uYdB8
         ohmAU2TqrI/1q8PdujmHZ68gblWTrr6jSr0MoWC4kBDi+nHTp/cE9+9NLYmmqV1PR1c2
         KwmS8oFXqUGg+VBSIVokRYxFxOgqOjRG/PS3dLKMcO/+ihC9+lQcOSVR7IqIDkznk4+m
         WH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728992845; x=1729597645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYoo+/bq9AOhakrbDZ5H5biZzWXgqg8gSzOfld6jvh8=;
        b=Q8LeT3LsRar5WcCbp04X5in8M8N2jAdfAdH4paim5Rwjz08jjtB1oPCggnD8UFZEeL
         qpIxI5CG6acoS83QXQKoJFv4dH2ZlcYcX931D9mRbXCsWFGWwTpY8Z4JKGZTM6UbpSPX
         3dztP01JsDPnCA7SE2ycf42QhyaEognZAsTUE9DMGoCiVo4Di+SHdlZX8iwXcj+dGS/E
         yDggyeWjMV8eyqXToVuWO3sTBissCJV+hy4b78qIGDK2gqLYSuZj1jc/T07FODNUvKm2
         SLYdjIEhfI4PDSW8Lq6a6Bml8vZaRpY8ybdsSb2w8Nl7oKslwKPlcmYu7ky2ti7E6Fc5
         uBnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZvclDQrHogXM/AuHTdAoVt/FbzwpS+A6wPjIGFtexW6JsLxm0pbKxzvHcLSLH3bBiZbFUGWKZP/07nBg7JV6rK/U=@vger.kernel.org, AJvYcCUkpp8QDRQUPs837C4yBHJ8TlZfRsPKpUMC7uyBTr8X0vcYHK8NLhSuerG/VbJUEWSqaHEBXjUm7djqA84=@vger.kernel.org, AJvYcCW1HSvpYrq7goL+x2HjG8UylSzB6AHiu55oDD+aAwmRFJPpOWDqA0Tmn4S4Q8DnWxn368v/RgbfvWaV2fE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpZ3wh6m9pLcyb3/WkA0ecc36n8GeI31umXjenjAvihQgzjWNy
	XyigWuxsq5/i7sJovJ5GRJoGUVv+oxauaaS4u53oaa7iHl9t8LDMQqvNChCXp2G/MXWOM6pelaw
	92mba7k93Z/qPqACTYguxlvS24FpQ8uwj
X-Google-Smtp-Source: AGHT+IGJ5rt7SATV/bvR+ew/lplGMHA6k4Rt9V2RoDGmOYVuZg+rIWZ8olUZUwZA+z7mykUUgTU8VY7g0S6+WIlK5gM=
X-Received: by 2002:a05:6122:32d0:b0:50d:39aa:787b with SMTP id
 71dfb90a1353d-50d39aa79f7mr7964349e0c.0.1728992844638; Tue, 15 Oct 2024
 04:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Oct 2024 12:46:58 +0100
Message-ID: <CA+V-a8u8bkCjL-YSyMOiKOtfZC8upBwGzhrJ0o+EmZ9S3z5hGA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: Rename "sh" to "renesas"
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Tue, Oct 15, 2024 at 12:38=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series aims to rename "sh" to "renesas", along with this
> the references to this path have been updated.
>
> Note,
> - This patch series applies on top of [0] + [1]
> - This change was agrreed based on the discussion [2]
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for=
-next
> [1] https://lore.kernel.org/all/20241011175346.1093649-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
> [2] https://lore.kernel.org/all/87v7xuqm84.wl-kuninori.morimoto.gx@renesa=
s.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (3):
>   ASoC: Rename "sh" to "renesas"
>   ASoC: renesas, rsnd: Update file path
>   ASoC: audio-graph-card2: Update comment with renamed file path
>
I was intending to add the below entry to MAINTAINERS file, but wanted
to make sure you are happy with below (I can send it as a follow up
patch),

RENESAS AUDIO (ASoC) DRIVERS
M: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
L: linux-sound@vger.kernel.org
L: linux-renesas-soc@vger.kernel.org
S: Supported
F: Documentation/devicetree/bindings/sound/renesas,rsnd.*
F: Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
F: sound/soc/renesas/

Let me know if you want me to add yourself just for sh7* and r-car
only or include rz* too.

Cheers,
Prabhakar

