Return-Path: <linux-renesas-soc+bounces-17492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69662AC3C74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 11:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32CD93B4786
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 09:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8D019CD1B;
	Mon, 26 May 2025 09:14:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB263596A;
	Mon, 26 May 2025 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250850; cv=none; b=iE0OkNDg2cJL2xkMdyeHCABSjNpnMrDezOzDgzOchfSWFKi8HprzDPvF1OXqsoOE+hmEfsotHaE596HN7XhSqXuYKhqvZEh3neV5CCo8qZBVK5QaGbDjzfBnD6DvjGDlMGX6Z+patlW0jE4DyvJRY/0qIs3iMLVUVh2MiSA0Wo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250850; c=relaxed/simple;
	bh=2/SVAaHCAZFysnEgfwG3OLk5mEvVV8sfktksjtDC8ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSjLFNCQLTFg7eLS5O6HkF2Bl7FQ0vtlYWa5LbRsChwKY7CNl0PwuqbzAIPtw8u9RqUvtBpACBSslVXgILS1FdBwuC16H76KjO5oLZ6r/OBbyaIbCUZdPJKUrYVssSSCrFmhNx/KnnzmcVECy9532Nnj/EG7D6DPw3LLwD4+7lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5240a432462so1328462e0c.1;
        Mon, 26 May 2025 02:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748250847; x=1748855647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHHl3kxB/rKMhdmAcTI6YIxxCctpYm2ZTkKcUrpPxy8=;
        b=Zt4oWaQDDlVW72TT6C+je0ZEV34H9qrJ3sMygHs7yWOgnRUn4l02b7KgQur0c3nx7z
         0JhHU5Us4ZnAT4qF1RDih1QsDDYbYzKPBoYY/jiVbEB4XHYTsBS4sfFdvQskeDjuZTxq
         wMib0LIg5+s8uRBvUCdDCQ79GFj6m7il3rygKhF8p2mNKMPL2OL5qDPxYiQHBCgmyutR
         cRGGKKTEYaHfwEYX626XfYPcj4ndtrG8aq1ja7ftKS12G14AYJ+jIC09Q1AiO/fS9j+q
         BIbId/AguW2iKM88lC/RqDHWiUWKcyp7BPdyeARlnGOxnf5l3O14NCAdk0UKbOv9TbRM
         cJvw==
X-Forwarded-Encrypted: i=1; AJvYcCUtghdiYf9c2twEKNG4AH85rnzOXDn9wf1XCIwxk/VSkTnEXy1wiYxSrhKuCaRTEarCYgmuqJ1KvNiY9Urt/wY3Kqo=@vger.kernel.org, AJvYcCWg9NO6HncbdY9eVobottXWfWVj2Sd3a81sFcunawrZ7O3f2aGEcKQVVs7HLuj18whu/+q5hNlhGdgO6dA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlInqaA3XMQ/p2fXv6W563aecBbfvQSOzIGPgWozOW/lvRj106
	W7aEi62wQHxw52clv+QpIi1qezcq/NLFqpYG00FI9/aBYOZ3MP3lduN7Z0SiUMQd
X-Gm-Gg: ASbGncu1I/1n/Sid9nOna083pmDLoa9b/XJkcbr0Eu8rkySLt/x+wBnB7OLPHo7fKxS
	IByDmkHWF1m5PIbpS2A6qPmFadAzSngzstO82dUJz029ECxRueiKdF+I0CIX4IUKPp+cM/S4ANZ
	/dMGJZKm041HAhPD6nDKaincqVhFoLIiWLDakh/QJSc7A0AcWuMjQnRF2XrFoczTlI1Ih3fSoYu
	kLrwSsMN7Lk44V+tFG8yfNE2SyxRPx3RgH/2cmTTfZ1w3bSdRfzVDU6mlaSEdDJdcbPvuK4heeG
	+8OOgzh5EIhVfn6ZT8eqmMReNhh3fWDiXQ3Yju63rfCYTT4MXMI5PN2zeCsUDZ2XCcZPMd1qnXw
	fctPdLKRVlQmevQ==
X-Google-Smtp-Source: AGHT+IG6p0ULGqSIY6DiRzvQueeZzisJweOXW/aUNs+Y+HvFyS3mTxYtOQ2uck51XYZ+kPWo90OLgQ==
X-Received: by 2002:a05:6122:3547:b0:52e:630b:166f with SMTP id 71dfb90a1353d-52f1eec45a4mr9548283e0c.3.1748250846838;
        Mon, 26 May 2025 02:14:06 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87de8b6b864sm3980161241.25.2025.05.26.02.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 02:14:06 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so1279928241.1;
        Mon, 26 May 2025 02:14:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrngsCdMal8XIg58Jq4nrFP3Ia7NDrNEl5LJSFUmwSt5Q2goFXyHZu1QLTvBpC4KLda2bLwlt9Cml8dgM=@vger.kernel.org, AJvYcCXuMJPpuXToAlNZ9XAAUM18QhdUx7KChWr8ge2yOdff/LkoqziCbKYMNF3W4wm8BjCepA6bODFDYCnEqyR84DMm6gg=@vger.kernel.org
X-Received: by 2002:a67:e446:0:b0:4e4:3c3a:f163 with SMTP id
 ada2fe7eead31-4e43c3af25bmr2968298137.7.1748250846395; Mon, 26 May 2025
 02:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 May 2025 11:13:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMDd2abFFzMY_Rbm=7pnX5C2qHBsa68tF_c=bRnp3zkg@mail.gmail.com>
X-Gm-Features: AX0GCFs0iTAPJyn3o_dQ93Zo1B5zmQvHXVBeKOyo9bKkSBZ5LaEVKWOqRf2Nfi4
Message-ID: <CAMuHMdVMDd2abFFzMY_Rbm=7pnX5C2qHBsa68tF_c=bRnp3zkg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with atomic_enable()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Douglas Anderson <dianders@chromium.org>, Adam Ford <aford173@gmail.com>, 
	Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 26 May 2025 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> After adv7511_mode_set() was merged into .atomic_enable(), only the
> native resolution is working when using modetest.
>
> This is caused by incorrect timings: adv7511_mode_set() must not be
> merged into .atomic_enable().
>
> Move adv7511_mode_set() back to the .mode_set() callback in
> drm_bridge_funcs to restore correct behavior.

Thanks for your patch!

> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector helpers")

I can't find that commit? I guess you mean:
Fixes: ae01d3183d2763ed ("drm/bridge: adv7511: switch to the HDMI
connector helpers")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

