Return-Path: <linux-renesas-soc+bounces-24830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2306C6F767
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86F724F7D94
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14B132FA28;
	Wed, 19 Nov 2025 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MdSFXj6G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E732FA27
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562977; cv=none; b=rRo31PS0uOCoKJK8m3OeXaOpp9WbkgQF0x1WIy+084Umsn29YvNOG4hzvvtzLqBOxN373Tr06WiTKChjEz0mU3g0MoK1+0krbQNkYsTxXtd2RAX4qzaG1GaE2zT8tEEGqYQttnD9f/YmBqEc9Dajh2RNNaAnyUh/ribMfwZMsoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562977; c=relaxed/simple;
	bh=M+Bii+RiTrkB2X/mKcLWf1awOoW7N75l75I3y6PNfN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8nWQjz8w55vpZg8XnCNTRPafufymvgfC6qq+IE2XwiQMa8uy9UUPIM01P+nts3VeJBJ861Mob5l5Bm5YAXyPtKsdjzQLqqMqa+PLzK7BlvGIpNGfwtRfgg1YKfqw00DAZD2ebBMIk+Iw78+RE5dIzz8ybwHwIPIDHceo3jTEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MdSFXj6G; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-640c857ce02so6510312d50.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763562975; x=1764167775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+Bii+RiTrkB2X/mKcLWf1awOoW7N75l75I3y6PNfN4=;
        b=MdSFXj6GUCaCkC/9ivZdmy2jVMoi0HUe8wXBdaEOXUtTWiDwgDVDVP824ljAIR/R3R
         4xe35XNlvzyUo7JTrhhfHkVGafBWPBoJj0v8DQGhtXzHMIgV/QK7B9lFq2o4/n/b1Hys
         H0kh6De5QmtYi8mKjLnGGMvk0lMWHYlNumjBSm3yvhA1Ew1u+162WENZtTigw+Kd1pnb
         2J9AlPRljMyu5IqLzU4VPcRbcTyrbYq+9tqsiUcwvcsITdaOjXlwfax6ZuTbrjY861E0
         sxSgoQlQTY0gk/ABiWxboeIOLONuUtj9zM609lh9E9xvS108qt3xEQ5an41RdEuPXdPw
         /B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562975; x=1764167775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M+Bii+RiTrkB2X/mKcLWf1awOoW7N75l75I3y6PNfN4=;
        b=u1lxYaE9/oRWhIQCJ1T0GPuqIPynFEBF8nlLsqVCmYudEKGD/clnihQ0HhuVG/YZb3
         id05piduhtQ/M47kUZZp532S1z0u6zEnLVrgM4F8izzoyijTOUzp6Hc8+uy1JYwDuxcp
         1yEWwbIYbxcw+Lu4kLzFa9bgSvhCpe6kCT1+0evb84ZY9wL+o0WUQQIt3Iqdq0ID5X5s
         fywZF7h7pmK4KDRGrV13RvvLzBhFzuSLT+JOzlt07qL2eM4ltsAx9RiBFRxFNnmkMD+/
         Sx7BEWMBYcdt6db7Ow1FW0gNeM+ymRG4N95qAdY3zMPNGQuNbmZsboOTO6xRxxOTTACW
         Ectw==
X-Forwarded-Encrypted: i=1; AJvYcCU5b09UsL7QT6qcRmnmHSnQLX+nHi4whZ8e9HUISTD3viOm+fGvxvcaPrLIh6d3XpUURaxVOfupnqYIMCOS1Mn0jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ZGeM9YMOJhrWYDn1O2niyiHhEwnww8Ud2IS+uScBHavjYpb7
	uS6SKQDoXsw1qcxiBX7JSpbrzWW4OYIdm06tr1Noeizbz+QEL3XEEAEQJWr5BiggpySMRrbV2an
	MPj+W1BAxVvm1eUohlTRosqQhNw+P5BmHzgf6ZX+PcQ==
X-Gm-Gg: ASbGnctdMhCPPXyt/FhV0fblqp1xcccAfnVPsWgHuG5dmfSvoY9WjMoQHB0QnOj6UMy
	gYclSI4OQGVVQkpNKru69JeWnW/X3l9G8U4QYFKY//XZnGYp18GqWFzQWsFKD+CwJwVOu2JIjSE
	eWD9bH4h75Fwi8OS3P5CY+d+fuRB5NlGz3wBfBmOsinRYyDAU8gdACudz2Wt0kwSoLaQ8xBLyoF
	hOy0FBEPwcM5mPvOOvB4A4GJC7qKOI9lyJ2QISJPMVp7WgKvUGomqQBPvM8XeiXCeGsR2j7ssV8
	tofyFg==
X-Google-Smtp-Source: AGHT+IG0rlRszzqFAzy7UncYTzf2x1uJRdbR85NR+j9SldtaZ3yuYuTp6LZVrTm4jp3pO5PkxWPLhTxM6czkiRKNvlA=
X-Received: by 2002:a05:690e:80b:b0:63f:b624:4c14 with SMTP id
 956f58d0204a3-641e7540ac5mr11888434d50.21.1763562974824; Wed, 19 Nov 2025
 06:36:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com> <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
 <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc> <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
In-Reply-To: <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:35:57 +0100
X-Gm-Features: AWmQ_bmMkgPmHsCijgrOLLXKkGyiMIJjrnzB7EuSaST5ezw7Nr7BGD6PKnZIlps
Message-ID: <CACRpkdZ9MA3WyO_Qhsi4ZjnsGrGJ-rFVxdkZLHx1HPAEpKmTzA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 11:41=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> But I digress. I think initially we should just look for a clean fix for
> the platforms affected:
>
> - Add the implementation into the drivers?
> - Add helpers to the core?
> - Add a flag of some kind so the core can do the right thing?
>
> I made a quick test with the flag approach, below. It's not many lines,
> but... Ugh, it does feel like a hack.

I did something similar but didn't submit it because I had similar
feelings.

I still feel it's the lesser evil compared to reverting the offending
patch, somehow the core needs to be aware about hardware
behaviours/limitations, we can't keep pretending that the map
is a good approximation of reality if we instead push voluminous
quirks into different drivers.

Yours,
Linus Walleij

