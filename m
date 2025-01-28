Return-Path: <linux-renesas-soc+bounces-12685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56CA21319
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 21:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFA9A165B3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 20:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3445D1DF259;
	Tue, 28 Jan 2025 20:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iu1UaUfU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D5713632B;
	Tue, 28 Jan 2025 20:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738095890; cv=none; b=fv13gIEI5mowxMDXyZVU9crzM/GJP7OTxT4WPU26YNX+CdgyCwRphcsbfnDFGweDVNVI/QkwRGtZz85wjuIVn9c78/22BTibewf+2T6jXr9Omc4pbTj+JjnQxW76dnEXsyoDr2JLtQAmNHnAKtZBFwl9e604ftZOD4lzaFQa59g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738095890; c=relaxed/simple;
	bh=Oj0FH7f+T/3QsH3mVYW72/VhUKr2omWuGVRyCJeJKnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZwgrNoM6KWkeUOnLE0ZK/0sUkRp28axm4T7cYqX9GjF2KFk1uLk0YO41CD58BXsaVXp72lefGJRd/WtiPenWNkSPK5IiUaeNIqvtg/6dBawXZjLB4o309LKD72GSeextwHP2Hgey2gmtZNxn6aOkaDSKU47WdLfIpOnpPeRyms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iu1UaUfU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5924FC4CEE2;
	Tue, 28 Jan 2025 20:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738095889;
	bh=Oj0FH7f+T/3QsH3mVYW72/VhUKr2omWuGVRyCJeJKnE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Iu1UaUfUEiyurQ67S64ZM/jnpWpIogw33yAJtyis8CMN5Z/lQR3+ushpphVRn9gUJ
	 ljVkjZYZBdz72O6llmtnH2CZAQ+xL3UBfZb+M+XKwKCj/CBNScKDzPPWKDPRhwHmcW
	 Ogzak3RC9QIRZcEkgSh4UPWQ3VsR5BcxsYnmVw5LDVi207uXUzp9vdBD6uk4i3dj4v
	 J0MmXKMYfqSQCRt5NlyuWH8G/rD5iROy3QlaZ+JmEl6v6O0i0p+ke0IUDHgVLaD6yB
	 1liIWWrLGL0qFrx5XTrtQ1vhM0oKjXJUlcFWc9LevAYUqjWqw4UXM/Zt63iTjfMNs0
	 kUGInVONLcr9Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e384e3481so5804366e87.2;
        Tue, 28 Jan 2025 12:24:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcqeLB6eRJ7Rrtvw6fx72wBmR2Hf5cekyH5yNCzTWkRk46OS/Bjt3owTXBiHVOzflOE0a5e7Z4G9tM@vger.kernel.org, AJvYcCW5oqvWIeEvgLDaUoNFYUkQJLTzb0yp4GxQs1XDSKUUsusJpBu+GGfhQDcRcyfj6ovuaqJpfSOcbfBCC0k=@vger.kernel.org, AJvYcCWg442Bpoy2Q8yW2QGlvHRnDwRq5ZE0tBgevcs/xe7JwGnyQH+1RAT/+l0kUqdQA8rqqpofhDBbJrjsMp0c/oz4rt0=@vger.kernel.org, AJvYcCXXUFom+o3EXUA1Q6AsNjSiUokVFmEG3yJr3TxoFm5nD+aq74vsgW8k8z0nK7E8+ZSLdDaqtVEvnoeMX5ul@vger.kernel.org
X-Gm-Message-State: AOJu0YyE3GLBdF6zSkN+1PveejdQQgyvtquUY5Jop3FQogqOF9E0qxAj
	LD4z4u2awr8wu2yQFnFVoK2l7eXAL5qU6Yb8fbkbXK/5noGgwY3fC3QmCNfoTf0mXWiY3JyostQ
	Z+Nm/yAoWrFrZm3ZcrS0Icp32xA==
X-Google-Smtp-Source: AGHT+IEe+HCSZJQOEu86nMb2CZy5o2eVixsL+82Vty9LQca4I4z2F+IDr7qWtkLq+02s7p65WncZs+SuG06sQYpYvAc=
X-Received: by 2002:a05:6512:102f:b0:542:8cf5:a3a3 with SMTP id
 2adb3069b0e04-543e4bdef58mr134851e87.5.1738095887597; Tue, 28 Jan 2025
 12:24:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <db10e96fbda121e7456d70e97a013cbfc9755f4d.1737533954.git.geert+renesas@glider.be>
In-Reply-To: <db10e96fbda121e7456d70e97a013cbfc9755f4d.1737533954.git.geert+renesas@glider.be>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Jan 2025 14:24:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLAJ076Mb+XNkU5okLC6paO_Bi4PdJx+-z=BzEVBXYLGw@mail.gmail.com>
X-Gm-Features: AWEUYZlpVRpyEluF6nedQbkSHys9N7OV5THNlp3boYylHkMqUHckOA8yoJPXaXc
Message-ID: <CAL_JsqLAJ076Mb+XNkU5okLC6paO_Bi4PdJx+-z=BzEVBXYLGw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-core: Stop using of_property_read_bool() for
 non-boolean properties
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 2:21=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> On R-Car:
>
>     OF: /sound: Read of boolean property 'simple-audio-card,bitclock-mast=
er' with a value.
>     OF: /sound: Read of boolean property 'simple-audio-card,frame-master'=
 with a value.
>
> or:
>
>     OF: /soc/sound@ec500000/ports/port@0/endpoint: Read of boolean proper=
ty 'bitclock-master' with a value.
>     OF: /soc/sound@ec500000/ports/port@0/endpoint: Read of boolean proper=
ty 'frame-master' with a value.
>
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Replace testing for presence before calling of_property_read_u32() by
> testing for an -EINVAL return value from the latter, to simplify the
> code.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Seen since commit c141ecc3cecd7647 ("of: Warn when
> of_property_read_bool() is used on non-boolean properties") in
> dt-rh/for-next.
>
> I could not exercise all code paths, so review/testing would be
> appreciated. Thanks!
> ---
>  sound/soc/soc-core.c | 32 +++++++++++++-------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

