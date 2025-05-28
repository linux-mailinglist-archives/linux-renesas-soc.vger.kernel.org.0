Return-Path: <linux-renesas-soc+bounces-17583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0E5AC632C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 09:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62AD99E098B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 07:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A41824469C;
	Wed, 28 May 2025 07:38:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8916F44C94;
	Wed, 28 May 2025 07:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417884; cv=none; b=Lo862uFWy+o8iGNx3g/+Rncv/uhrbBErbig92i6z9blM+eyGhAWuVu00TBgJ0gtK8LOOlfKI1HONvmqujJcwBsBOoN7ATifk2nNzFCmTRmXh6Z9GSe0FsfPMM3xKs3jgLFfCYhBX7C/I+2AADKy97Q21QN2/PZpf8OWnGAUGplc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417884; c=relaxed/simple;
	bh=dC6/r+XL94KrBaJDEg8ysPYbOiXiNK3lHLZP0ifcAGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kTxAf7rV/xP0/J4YaEMyJZMJUO9RGlOUySWFTruLZyS8OrTLQZ8zBuEZvUtw6vhu/24Wqsh+8NDjeSzMoP+rqoftN6aZq1nM4DNUkfgUIQ3uvH4YKj9ADEekxaAZk1hoPd6aP+LPi8afzCbzU+QjqB5GTZXvBNPoztLb9GSGAZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52413efd0d3so1395947e0c.2;
        Wed, 28 May 2025 00:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417881; x=1749022681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0FIvnATmtkNNdXQbt1Fz7I3kCcVI6Dqou2JsI1LDaQ=;
        b=A9bhradSkN8DWqfBk3rvVrpiTtQl65UtOoPNI4pulVn4A/Hv32aGMExEdMtpBezzuC
         ZJXob/1rOEf3VSQo1PuP/wCiPZFln09UBCjGMIBZreyhzqz7E1IQ9huF+lZl40ufFdX2
         sICx5RQkEuOJ/LPmvuia/PajdePAZM5HXFsi/bjnYcDlO4Hq/QNW2ULMi/U9zlWXw7UQ
         mT/Wmb7j8eF+oncTR/O9CxUPMaWUIiYjfPU2baw48echfXQFFFKiwuAYFZa476vCRsDC
         Yu52foPtOWA/K4JT5u1YqqzlXzv9D4lJKTPuBV/V8tKDAKzYG470V0cjJuy4Fen3sk2A
         Jksg==
X-Forwarded-Encrypted: i=1; AJvYcCUEYeFh8j9rwwPAz1uEQXUZ4lVvjAdwZL+ezGGXBBN1IoNhsSNAXZdKo1NnQs/qsDJ11PNQbD5aLNTV2v9Y@vger.kernel.org, AJvYcCUnM+XU6UpQXTyqOouCBKVscaelBJZTKj/U5d9QjIlBFqc0vuaeXfthsjnZr09ftY3H7CnNubIOIFxw+zfCdhrY5h8=@vger.kernel.org, AJvYcCV5zdEC3VdrrOUS/tgFrlJY/uh1tAKVbHCaIuCEYBtbAvHXVeRhALr1gBbptiVWzkdw5QKhw5Dzbx3qHJ8=@vger.kernel.org, AJvYcCVXHifsSyyJilK+CKodWu6mvewV26NEiRHUzsPIUSSOYXO8WlHRGuvftN3yIYw8smdTv4oNlayLU/qxCDSO@vger.kernel.org
X-Gm-Message-State: AOJu0YxIUucXOAyU7uv2XEXViTG2bkg4gok9OW5XaMOm0GG+D27albWV
	nlbsY3n0laGy+F8v7zeYFipbaajQhffy8qIp5+S/cQDJb+G0Oa3NwNfWU/ayb8Xh
X-Gm-Gg: ASbGncvosmqhEra7BQ7lKL8qpJhmqbhMiGSnUwy8yc8CcOjn+71oz0zaWQsRsp00KfG
	KIh+pfAnzFVeI4VkgUlzvOoYPpjiyjHY00vp2s6GqOUL1F8vCDbRqE3pvvf7kmbGHSdvblnmdWr
	Oz+DQVrHplgx5ypMEuqdmu1rAB95ljNFpHg5AtmNwhDUpqAQj3ssIn/r5mVlSQiGgM1wn2U4GIx
	tlAj8wEii8uQY8x1HyGCje/2HOj2PvZTLoidaeByZStjW21lvCcApAM50VA9dIbWpPmyMipgJTn
	JIy5bhR4HtKqfXhMm9C4XKqfTNvfDYFxHaBljoNa6FwBRy4s0k6NWc4GYfOoWww9KMF1ypU91eW
	p5sQYRcsYIRVQtw==
X-Google-Smtp-Source: AGHT+IHispFt8IBDadtOKw22E5PPSlK7FrOJnlZ6MHJgJfUuzrpL8uTku28GgfXu+2wGW9Q/rkVwQg==
X-Received: by 2002:a05:6122:2986:b0:530:6bcb:c97f with SMTP id 71dfb90a1353d-5306bcbcb83mr91593e0c.8.1748417880716;
        Wed, 28 May 2025 00:38:00 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066979b54sm500426e0c.47.2025.05.28.00.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:38:00 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e5a1a4e4aaso51509137.0;
        Wed, 28 May 2025 00:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDZTB8ablys595TS9S9OnRgPpBY6bjjKNMugyGypR3fhN0i/Q39ycwczYEvVaow7PvAmWRr4Q3ZVLJGprXh6le5CA=@vger.kernel.org, AJvYcCVStZOEDp/IllMB/lm283bw//VTOrhXbbRh9Ii13zHVXVBQ61w37f5P4jO9SngvB3xPtoq4RUstL/hjoY7/@vger.kernel.org, AJvYcCWKlpDEaEZCdH4pHZes2TdL/ko2IYBVRjjW1FfTrmZM3T76t6BWkrxVRWIFMzcPgLL6xizbUtdMi/oDKuM=@vger.kernel.org, AJvYcCXgDU4RzsChkkcfW+3K/qDh6U8l4qHuK6mUfb/LW0xrueGwddvzgvkZDWA1Bn+SS+WIWonl2vrBJwm5P4BT@vger.kernel.org
X-Received: by 2002:a05:6102:d87:b0:4e5:9731:6ded with SMTP id
 ada2fe7eead31-4e597316ebfmr3313200137.6.1748417879962; Wed, 28 May 2025
 00:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527082446.2265500-1-aichao@kylinos.cn> <20250527082446.2265500-3-aichao@kylinos.cn>
In-Reply-To: <20250527082446.2265500-3-aichao@kylinos.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 09:37:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5ZhJrRiuEWLbU_gFcv40+izLpR0HN0EZU415s3QAkVg@mail.gmail.com>
X-Gm-Features: AX0GCFve4Aj5WArc9KkplJVctpVO9pqz2wSMOeJzSTUgarGo2ZgOa2T8YLQGOCU
Message-ID: <CAMuHMdV5ZhJrRiuEWLbU_gFcv40+izLpR0HN0EZU415s3QAkVg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] ALSA: aoa: Use helper function for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net, 
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, broonie@kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ai,

On Tue, 27 May 2025 at 12:52, Ai Chao <aichao@kylinos.cn> wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.
>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Thanks for your patch!

> --- a/sound/aoa/soundbus/i2sbus/core.c
> +++ b/sound/aoa/soundbus/i2sbus/core.c
> @@ -155,7 +155,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>                           struct device_node *np)
>  {
>         struct i2sbus_dev *dev;
> -       struct device_node *child, *sound = NULL;
> +       struct device_node *sound = NULL;
>         struct resource *r;
>         int i, layout = 0, rlen, ok = force;
>         char node_name[8];
> @@ -178,7 +178,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>                 return 0;
>
>         i = 0;
> -       for_each_child_of_node(np, child) {
> +       for_each_child_of_node_scoped(np, child) {
>                 if (of_node_name_eq(child, "sound")) {
>                         i++;
>                         sound = child;

As people pointed out before, the original (and new) code is buggy,
as child is saved to sound, and the latter is used after this loop.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

