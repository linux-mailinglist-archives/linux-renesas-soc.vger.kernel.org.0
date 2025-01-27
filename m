Return-Path: <linux-renesas-soc+bounces-12594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4EAA1D8CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 15:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F14467A05EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 14:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2EB17D2;
	Mon, 27 Jan 2025 14:54:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7338460
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737989676; cv=none; b=qxGRWZcaDmT1ht4LtPYDmHOaLi1u1Uk3sLfliAWwXw2LKx8Zh5waGwCBm5O93YLoPe3Jfu3Q9PbWACE1Bawa5bVvL404atd2CQaaQsB3D2oj7wRENQGucXXxeSiWh5XJjjBq0DsQHAfVw5FGxgJuXOk9wixy2agxdmUeWbSzkB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737989676; c=relaxed/simple;
	bh=G7HLYm6hTKioU17Z56rPkZjRBAZQn7jvwnqqOlNFsdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pba1s5qGyhPoZM3RbqrZhC6C4T1T+JVBq8xqr5zTfPA/Vge2AEA6tyBIYq5Pwh7nTwYJMgDTU4qNz9CxN5yzDBiL8yUPRYmAZvX6KKa+wf1LQ+FFZLwMZXrwKd603kSQwjCTUKLBTh9PNwI4/IKQfy1QsVTFYF/LyNNhubcEzO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-518a861612eso3118344e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 06:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737989671; x=1738594471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nc7EhYWNNGPAPBjGFyDk18ipW3ZlGb/1I/eDqrYDPc=;
        b=nSxlSa/MYefRNgeLWLK3fk2whwJs29HDOZArhfKH58O05V/xR2EbcJilraIDXMoOL4
         6oxUxOWKy7xFHoY+U7uisZCwgEywXeasdyaHFSRsVRGGV7zijQwS6XCqysS3YReiVHDA
         xLAPt9sFzwIJLG1i70fxXwvpIIt4d/GmtxTaUu1qFc6EoyID1kvKeI/tkWrVzVDMo2pW
         4U4D538622Pd1YfDJsM0O2vOXaG60z1xDrQvSqGEy9dovR8u++30BOEvJ0qQTTBLFGsu
         EADliJnKimtzOrGOgCQFvEPdyupE85JhrL86GkfW61BjlQLxIiXD2p34jKsKqbNLCpuo
         6tbA==
X-Gm-Message-State: AOJu0Ywm+kcnSnlfSOoZPKw3irv86XAQIav/nEnO268kOe+tgyCbEI4I
	60Eq7yjbkbduaVztH7ro5DzwS1NyA5qXOzQTVooooSPWllOjiOXcLKcIO5e+Fhw=
X-Gm-Gg: ASbGncusTKofmtP/iACnzsSw0XbD3dk5UWpX/jx+xr3v60ZnHLQ+f/Ge51jIcddf2T/
	UDA7iSjAIf38+zY97hRBIEqQpdEwtTeI/pZQb9eJAYnU+Esa4pmFUbfHHyoHby4IDeJmlFd+d//
	oKWx5aBJgXS7ArXLTNEAsUT6r8Rg6vaym1JLFXyfrxEuqXyR4cCej/ZParbap5xgPODgGrxyJWf
	ayvlxO0NcBmG4EycoNTe/KoW6ISZlKIw5+fckSzs+ydBCmhfSCOhKYcp6DwB5CWE7hPxZXQ2gvv
	b6GCDe+lLe1SX8F6GyItx2Ntfyck45haI7qHA1Gw48Qsjxioc2ghRxsnJw==
X-Google-Smtp-Source: AGHT+IHFCg1i/9hWqm+a+QgIK+gADPYOFgqlgwUiG0uHXqJAe1aiB1Wf960NDWoeNDvbU54lg2ZY/A==
X-Received: by 2002:a05:6122:2402:b0:51c:93a2:d809 with SMTP id 71dfb90a1353d-51e3de6de6bmr13453112e0c.5.1737989671340;
        Mon, 27 Jan 2025 06:54:31 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea363b6sm1440213e0c.8.2025.01.27.06.54.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 06:54:30 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-518799f2828so2256333e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 06:54:30 -0800 (PST)
X-Received: by 2002:a05:6122:4003:b0:515:25f5:46f6 with SMTP id
 71dfb90a1353d-51e4fca5564mr10621253e0c.4.1737989670322; Mon, 27 Jan 2025
 06:54:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com> <20250125125320.37285-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250125125320.37285-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 15:54:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjTYa54Lz66JBgw5NXcJAP3BTnH2TOx987ma-EcDMdww@mail.gmail.com>
X-Gm-Features: AWEUYZmdKSZIgZIfMZy-VJzd1ow6q4l6gByfQtsq1ZQj4hinISzDeB8Zc0BLYKQ
Message-ID: <CAMuHMdXjTYa54Lz66JBgw5NXcJAP3BTnH2TOx987ma-EcDMdww@mail.gmail.com>
Subject: Re: [PATCH RFT 2/2] drm/bridge: ti-sn65dsi86: Use per-client debugfs entry
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sat, 25 Jan 2025 at 13:53, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

I gave it a try on Gray Hawk Single.

Old location:

    /sys/kernel/debug/1-002c
    `-- status

New location:

    /sys/kernel/debug/i2c/i2c-1/1-002c
    `-- status

Contents of the status file without a display connected:

    STATUS REGISTERS:
    [0xf0] = 0x00000000
    [0xf1] = 0x0000000b
    [0xf2] = 0x00000000
    [0xf3] = 0x00000000
    [0xf4] = 0x00000009
    [0xf5] = 0x00000020
    [0xf6] = 0x00000000
    [0xf7] = 0x00000000
    [0xf8] = 0x00000002

Contents of the status file with a 1920x1080 display connected:

    STATUS REGISTERS:
    [0xf0] = 0x00000000
    [0xf1] = 0x00000000
    [0xf2] = 0x00000000
    [0xf3] = 0x00000000
    [0xf4] = 0x00000001
    [0xf5] = 0x00000000
    [0xf6] = 0x00000002
    [0xf7] = 0x00000000
    [0xf8] = 0x00000001

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

