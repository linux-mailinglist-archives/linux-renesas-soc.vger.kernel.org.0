Return-Path: <linux-renesas-soc+bounces-26665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC7D186BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 12:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3C1A3004224
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 11:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837C5CA52;
	Tue, 13 Jan 2026 11:08:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489E41A262D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302486; cv=none; b=KwcywMj813sPEIV32XvtcyI/+Yo5XO40e2B+jX0yh38/zzgyR2JbV6qMZWSdhc20UNSXQCudCyF0zaKWwlswCHhrEi2vnskpuZYOdKNvshOCpRjNBA/jvT+uah4dBPwb6AbSZQLU/bNYJw9AenvkXf5FSf2zmffTBRWUa1appWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302486; c=relaxed/simple;
	bh=q763xDQsPM6UprpPWRAUoU+HU6QnwR3CZB0Sot9DdR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sI+BtK9oe0n/IDHVk1IfGLCUZA7HgdCzbc0d17+CgA0nPDJHFzVr9sEXMAoMh5suSczveyKznMPIK91IVqtbALJ+u4kblj9oHbboicJSPp1nn8PteNoB10OPToHfcNAn1S28PXcgTV+Lrwc3ezx6cYadPWyf/CBweIFb2l7HpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so4706011a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 03:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302484; x=1768907284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MR0NoHyZdJndLOZGMkASZoG8F5TIOzALE+PpGAFfY78=;
        b=fHRznSi0E6nWB8wXdYKMTUdq7Ow+w1XauXaftIfypN+wI3Rr+FmIG1GUGxV4HcNom+
         xh4tLRZiYmGxDG2CPI/VFJDk2m371zYvFwYhMp954JpErBnm/GYNWMi5CVDT9jKjHRgf
         fvr1sgqfJwGVsYoKFQOpsFUotmlvpPKxqOOTyO1sMnoxz++LCtZJWTLsAaiJKmtZObDH
         1+2kI+6gZggY/+D2QshW5clS/esXzF8xN9aQBQ/ZaWsjNTgnigqG+EbJgUFx9MZ3iCZ1
         3f8KnAIVN0aBUyNEkFQlrRJ9f0osHBR3qaV38/1VehmJ38IC+yU8tIdZG36pcJf6lKd3
         bQSg==
X-Forwarded-Encrypted: i=1; AJvYcCWeYR8OwLRBxfDWsP8/IYNjbwJ2zA4tkjKWy5QlTqBsHNOWDo/Ie5/FYHMnirYvmweGX9MmU/QQv/ewuQ8xy8jPVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxpMKu0vltwez/k5b8e+Dvf8nEgqoZrIGyjx09wOfQAelJSb76
	8Bqqf+TBqi8jlWCcuMzkdCjviKAweyOEM7nl27KT9cUpDouEbtGanTG8PHCXH/OkYIY=
X-Gm-Gg: AY/fxX7AzYPrahfWurARFG3ApQwZkSA0vZR2B5h19/fH1I5lLltnVW0Ks6NPBFMYqqU
	KmVogT8ZLo7xnhf47u9R4ias/8R3WjoobnYpnYeXwEiZ9IVuZgDYN/h2WwEdQpXiWRPJ5B9Rpv+
	S8zS6//IvBXO5PiIO15vHwj6rSiBKcBkLnD1V701Y6j9cLs2gFf38PolPmTWe5ExGg5EJ2YN1As
	SFC+s/q8aMJ+5TGvdmVgk+f34JOD981tvuII4T/vk3+mWi49Bvbd7zwmziNz2QXL1wACeqbHiku
	hAbD4/bq3HvbjlQxfhfH4pmajcUu5CSuH7mPGjW3maNwRe4mo1maiunlqwqEm101Cm3RH9MNO9t
	eYcH/H9QJ/mjiuDnOhRIO7+MLv+JIhH1ng9wIMjMVF5HVs9ZcGhpH8h2thPKzJHTpK6Li7nkwLV
	pCJeTtK8oT5ZKuQIsqu9udczS4jsUDCBrCTuX88ZPaMavohIZW
X-Google-Smtp-Source: AGHT+IFmPjMDUNJBdklcLXlG9/lKDU9NL1uuMQ7ZKmA7yfnf8gNl4cB2oxPQtQwIhJa5o0HmpmlvBA==
X-Received: by 2002:a05:6102:c8d:b0:5dd:8a21:3916 with SMTP id ada2fe7eead31-5ecb685758fmr7238234137.12.1768295621326;
        Tue, 13 Jan 2026 01:13:41 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5efaf4b2963sm9227362137.13.2026.01.13.01.13.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:13:40 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-943d0cafe77so2369664241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 01:13:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjE0tnHDppFKo6B2hwfHH99vlurgKxVbj8+3GiziGKEXkOPUqhVQiHTOr6QZelmZhBf4DcsdrmdpdoVCf2xE8rgA==@vger.kernel.org
X-Received: by 2002:a05:6102:419e:b0:5df:ab05:d846 with SMTP id
 ada2fe7eead31-5ecbae4aedemr6860725137.40.1768295619640; Tue, 13 Jan 2026
 01:13:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 10:13:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
X-Gm-Features: AZwV_Qhh8RJBBYa7gKoAKpUlBeVNsz1RZyqK3-3_U_RszPPYx3TukXyRJOwF8cM
Message-ID: <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 13 Jan 2026 at 01:07, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Move the Waveshare panels description into separate document, so they
> can be properly described with compatible = "waveshare,...", "panel-dpi"
> and attached to "waveshare,dsi2dpi" bridge.
>
> While these panels are described as DPI panels, they are generally part
> of a larger unit in non-removable metal casing, so the actual internal
> configuration is not known. It is likely that internally, those panels
> are LVDS panels, connected to ICN6211 DSI-to-DPI bridge and then another
> unknown DPI-to-LVDS bridge.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0

scripts/checkpatch.pl:

    WARNING: DT binding documents should be licensed (GPL-2.0-only OR
BSD-2-Clause)
    #68: FILE: Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml:1:

which matches what panel-simple.yaml uses.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

