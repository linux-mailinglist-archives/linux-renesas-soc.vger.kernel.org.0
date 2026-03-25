Return-Path: <linux-renesas-soc+bounces-30245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNRJLJ7nw2lvugQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:48:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F1A32616A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3577531CB488
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 13:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF4F23EA8C;
	Wed, 25 Mar 2026 13:31:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FB23D297
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445508; cv=none; b=AVjtI2tLuDgyq7oZdRxxJAr3Mu+Ct6sJHiAjQ13BtUYkhzRiZ2+7nWK8MnSZDeWu6rN/HGESqA85UI/6hjW3/oFCrX2zE4pZ4lWo2/O5+wIEqFoHadhIv68ktPb7ambCGdTDa2SoTNBbD2d3JwcNJ41pWuEuN3xp0/1FfeS3ly0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445508; c=relaxed/simple;
	bh=+q20ONbrOyxDkAN5+EHcA3ci9E6n9dWeyiwm4j9RLFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvDgUwYAgXTPjpTH3XhjuOPaSEQPTlUjkV8You7bwjYP07ygYIPyIvng2Y+mngB085d6YYMqq/YoGHTDawI8n+PDribS6KtHBqD8Nht0u1S1AXB7uJZvKbFtQ/dbQsF1fCENYYM80v/aKZzsPBCQEThZJGImF/nTMbPQ1lK/ilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59dcdf60427so2507603e87.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 06:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445505; x=1775050305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stp9ZXzQjSgCaz4WCE1iOcAb662w0+RcOPCoDeQo2tE=;
        b=jqikoDzU8gca+Jl0Z2BnecX8kPpuswiiua0BUxL6SxhiVjw/2hWrhbZdeDQp1Yg2/l
         vRwtoc/S5ltX882pWQjPotMFldeswTwwk/rSqFhB2stGDgc0pPSvENLUts8h/3hwn4gM
         4r5Hga/ad2JvfZIYnBlrGOel6k9aC9EFyTFPVZqt0+lZpNLQZPEhTpXLyCvChc875ALQ
         9NPSuSf4tX233obOSBNGFywxo7gJMrVHEJXB4Y6FmMQnk80Hapou2A+oRsKhol8Ah0YY
         TVAlB7B3M+iKWFT4NUPpPobvSoCfzf6qgxZr922VemEfzXrxlDchHaF+gL+JdUrdYCBn
         eyDA==
X-Forwarded-Encrypted: i=1; AJvYcCUidW0FoZR3QdGqcMsGD8goZ+W1loewOVjKtKv2mog3K2SuB7yywHHzEwuTdh2fiqQT3q8zVupTgLTABKsb06GkJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYkypUywMr77TA5o3o1r2R71cjLOBmcNJ3a/KUK5QZgRFvrtp5
	hOFVrO60Wf2bTqGzthtIVv1/3xaS+Ygxr7ev9hyOihO/vG+6+LeqXuTkJ4jRtnePpGM=
X-Gm-Gg: ATEYQzzuSdv4GZO46YvU3Myo6Wv4tWXX/Z3qNbtOlEP4SmjO7P+y000TYs19+Wm109H
	rRtv/cHiynFM0BaHepjTXYPQAUq6dF15G9LXVNPjNJoVu4P0n46eiEnltpvQjn4DKpl1C3m8ZIv
	PXISRFtoeq3JdxlLdITt66PMcj3a//c9NIhLL/ivh/aFvX1PkwlEo0RZ5baKPkQLkXmzo4AE0Ms
	1wEhrdsN7EgCvOKlsadC0jPPfqSxsr4C+oaKiYXXW8pbuvTFnqq8UKdztZPdvT5CALOHAVegTOF
	Yj6VsjU0bowHjcRz42N7x0XAXURybFeSt8DolUnEcjdLpKyYDgU8L05YcCZpboj5JFxQHfudVex
	6o9at9tiuyztMNTMZFgKmx1fzBvfUg3lELWPgw9e1BO0MBPWCXf/HMeySvjG8MFiZllvvc6K43H
	DkwvzQrYPrbDQx80Xhz3kYcmEOpa0qNKfkWSTJAqKGWATP6luiEnhVICWmx1USBaJSYviystQ=
X-Received: by 2002:a05:6512:33d1:b0:59e:5c8f:a5 with SMTP id 2adb3069b0e04-5a29b9767bemr1433687e87.4.1774445504899;
        Wed, 25 Mar 2026 06:31:44 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192e88sm3881148e87.12.2026.03.25.06.31.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:31:44 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a27a90a7b6so2858983e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 06:31:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPrl9j6peJXZM3EVkujv4KIyhvY4zO4sUt/xUhZzYwXa0VpTEOrV1Sds8Ozt/3vl2Pkl++Ty0YrW7/nqLjMkw4Iw==@vger.kernel.org
X-Received: by 2002:a17:907:8690:b0:b98:2b55:f7c6 with SMTP id
 a640c23a62f3a-b9a677f3293mr242621366b.57.1774445026817; Wed, 25 Mar 2026
 06:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org> <20260117005028.126361-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117005028.126361-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 14:23:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUM5W7PLEaX_7SEwxXuc2aUvRUX7L0cT5Fg7YEZ1n3AwQ@mail.gmail.com>
X-Gm-Features: AQROBzCABV8bWPZtK2TcL9-PzQxkhTblJ0GblRNzGWfFAoDGkar56sRfrxg7ob8
Message-ID: <CAMuHMdUM5W7PLEaX_7SEwxXuc2aUvRUX7L0cT5Fg7YEZ1n3AwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare Display 13.3"
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,gmail.com,glider.be,linux.intel.com,linaro.org,ravnborg.org,ffwll.ch,suse.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30245-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,mailbox.org:email,linux-m68k.org:email,waveshare.com:url]
X-Rspamd-Queue-Id: F3F1A32616A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Sat, 17 Jan 2026 at 01:50, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 13.3inch 1920x1080 DSI Capacitive
> Touch Display on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Overlay for the Waveshare 13.3 MIPI DSI panel connected
> + * to J4:DSI on R-Car V4H ES3.0 Sparrow Hawk board
> + *
> + * Copyright (C) 2025-2026 Marek Vasut <marek.vasut+renesas@mailbox.org>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>

This include is not needed, so I will drop it while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

