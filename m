Return-Path: <linux-renesas-soc+bounces-32763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDrROAH7Cmpd+wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 13:41:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A852556BC39
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 13:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3764D300E00E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EA53F6C42;
	Mon, 18 May 2026 11:41:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0960D3F7887
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104471; cv=none; b=YiD0/i+GE3vEiXhcYBNIyVJ41WM2qWXtOp1h8rF17qqKSylAmqMFAGbD5MZv7qb8WRZSW0fcrdlC+9fgD0/FbtX0Bn+e/P3ni8Ia2+TsEh+YEppghiqra9UXJZbgdxXuBjqgPZLgEtO9Fq1UpCCsb8+OuAyIxBCR1nMLGpMz3GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104471; c=relaxed/simple;
	bh=Ax2y7pmSuZrEkSP0ce0Fej26Z6ct7xdJQdPYertuzbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdxqNC+rDzxYpop0qn8hB22qX5UghkUqowFGiXp94M837C+LvYbmwzLjLBhUgXwjW6sPTtMj6UMevt56fZPRFxFAsUF2IOO3DX62ANba8fez39nzgwbVk1W/5A0qsrQu3E4OuZyUWS2d0MJuQ2eSnyhZsQzzQMUqRPJ9ZL+36y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6314d2e31d6so668958137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 04:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104465; x=1779709265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3bmWUZgjAYZamnd3Aw3Zf+CdNP9jYAgiNz9GJP8Rro=;
        b=YE6Qmv7h2coPzVlKaNw+wX1OOSHCrhMI6UwWJ6KHyH8pcO+Y7DFdXmd0O6C4Qk0Klw
         WkR7zjPoLrHtMZqqrdJwGGiQwhmcsi7AByYIIBdRTHP6zqzRIIcwaUixi5qSvx58nqNF
         qZH7d/kMKltZQSmPrskJoM1obZK8VOBj6I9LSDiWXCJCG6e2xLNbLQ/qBo2z3PqVbVtF
         hKFHD6c3KSro+A19zglgPWXWTso+zE5eh+fL3Hcjl7XrSynCo3yMo6L5+ncAmTdehUqn
         3YHCAVkmdFfVvU+AK84PDMkjmAXytMVHY2JA+5tiraoS+NQ9mG6lul8jF/AYHB3xLv2V
         Y4xA==
X-Forwarded-Encrypted: i=1; AFNElJ9Jl7zwsMui62cM/M0IFmQ7QTzJKh0zU7WnAJiJ623XGaSyZxr0clX2IXKD/5UziOKRlAsZ41T+VPSM+dKzfVcwfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwLkXFkGfHJx0DWtvx3Ps1V4w6e7l5tCagzL6W57t25GA+dl1F
	vrEqyetQ75CIyTlJWcVBvpmExljxBSbjY0LHlXi4l7c3Nof3O6AZd/43Ahxmwvqu
X-Gm-Gg: Acq92OGjMsMQSQ49+tzwpPRVCVj6XPJT5lDdlXDXL8bLmxalzOU9GxOmOAjNfRvKiTz
	K1oRj9dHT5vP34sOp7cMV1H6p2Cm9tVC3nC0wUUd57I40bu0InuhTVBW7a8XeBhEyANOoVOzWgx
	BRHkIVgdIrc4SlppKB407phXvr35+a+lrc5GKibvEKxMlhb/REESJ54He1A6ZwZlsj6RqvBQDjI
	RK2hOgjEluRxIs4p/LMyBJSBGMtMq9a+Jq5c1/d5cwH/Jercpg/GuSiRFxTJexn/dWl6fXC15/K
	6Yby2i+aLpyxRqYgsf3mkBnFvmSyn0HeJVBYnXZ9I7wu5NL72yU9slIQg3s8CvMvFzcxmw9fxlg
	nfNHzYIq42Qme1ZeEhWsjcILH80yfMJ4Sqqhtg3KvDJ90mLXANRW3VAROpupFPYwqTIXeOQ0WSY
	JX2k2x47nEaH1xv132HTg/QVenmjubanULB17KOyvn8YQzJeKLhp1uIBK1iI+lop37
X-Received: by 2002:a05:6102:5092:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-63a3f887b32mr5957038137.22.1779104465201;
        Mon, 18 May 2026 04:41:05 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ccf18cfc4sm4466614137.2.2026.05.18.04.41.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:41:04 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-57611a6a69eso481253e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 04:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/kJad480yhGhFsN4zfEOgYak9gbahy9aE7iEtxm+i9JPbHzGcvkCO8UP5xIMlaIkUYXIrlA8xlP6KWaWLr/HmfZA==@vger.kernel.org
X-Received: by 2002:a05:6122:4690:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-5760beaed3bmr5626640e0c.7.1779104463611; Mon, 18 May 2026
 04:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com> <20260515-rcar-du-dsc-v3-3-164157820498@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v3-3-164157820498@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 13:40:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUf4dGnK4ooTyw_31Ueanr-Ym3nhML4a12exU+5nFYh2g@mail.gmail.com>
X-Gm-Features: AVHnY4Lo5h0gdtI7uD_PcBRMzgonT5rakDO4TjP7cpU7h0ngOw5-dH_yEpIVciE
Message-ID: <CAMuHMdUf4dGnK4ooTyw_31Ueanr-Ym3nhML4a12exU+5nFYh2g@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/rcar-du: dsc: Add rudimentary Renesas R-Car
 V4H DSC driver
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A852556BC39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-32763-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:email,mail.gmail.com:mid,linux-m68k.org:email,ideasonboard.com:email]
X-Rspamd-Action: no action

Hi Tomi,

On Fri, 15 May 2026 at 11:10, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> +                                  struct drm_atomic_state *state)

drm_atomic_state is no more since commit 5164f7e7ff8ec7d4
("drm: Rename struct drm_atomic_state to drm_atomic_commit") in
drm-misc/for-linux-next (next-20260506 and later).

> +{
> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +       WARN_ON(pm_runtime_resume_and_get(dsc->dev));
> +}
> +
> +static void rcar_dsc_atomic_disable(struct drm_bridge *bridge,
> +                                   struct drm_atomic_state *state)

s/drm_atomic_state/drm_atomic_commit/g

> +{
> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +       pm_runtime_put(dsc->dev);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

