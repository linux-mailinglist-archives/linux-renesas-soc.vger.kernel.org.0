Return-Path: <linux-renesas-soc+bounces-34642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y0fLBBIzRmqMLgsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 11:44:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D676F56D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 11:44:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E624630253AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 09:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2D647D930;
	Thu,  2 Jul 2026 09:35:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFF547DF96
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 09:35:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984933; cv=none; b=kmIKPak/ga71lYwu2deSeaEKBCGVI9qHq5BKPw4T4McSsd7qTwBKjdgLSQUvAFgCfdaXIKlP0tTaJ1D8v3lBb5sHtKZD7IvPjS3+OrS2mJh4mDOz8IuKl6ZtxLX/8a7Sc2/nhS1ge6BmknVtcUVBFYzJ2p8FoSRdU1Oy9AqfxiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984933; c=relaxed/simple;
	bh=oaHVnd87z43W7j09tTxLlnmC4YG6JXhvjpcX3CpNAuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSAVBFbjTg+eMdREgLq1A7COJRYzoKMwC3TA/GQFqzr9XJm66VOsFL1D5Dn47fy8vjpB6xY2GPNaLUaMDhRs1CGruavu8MkV76cEG2mSRSZ4me9s1sI8lBPQwvzkY4YEHrgc1pW+eq/57uwDR74/7oGjdhpU6c6VznIhCJYOB7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.180
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-847d1e9db22so454314b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 02:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984931; x=1783589731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xiqnp7i51oc7KGFElhrnKuIK1In1osntTe68gEGmGg=;
        b=ayEHVYPvltCRHf6HynLumHDP5z/kUiPHcpBQ6UoNXTn+aFlztzZTm3wwXBV/6E+a1l
         xGyVkWQR2SgQL+YjL6z+U9iGh4jtYc2lsOKlLYxEofCF9bHg47vjsz/ufGuexWFwu0Cm
         XrB4b4C6WQvJkSPvqSTGmpPHIA8+oDsT4+/KVXHiKCAqHYpWqxmQLICXwQzwzI2WEyAQ
         ud/HxRxO5fcYf1oo+D1luaHxz07Bq1bIv9xNpaqo3d5Tuj7j/CM6QaB+hf2Pl+kKhOCS
         AliY5XVuhl/nhDAnN+Aw4C+8Vaflh9NceD3TVtJaKZLemTev7O36ufh7c1VHzeKZlERp
         mmGw==
X-Forwarded-Encrypted: i=1; AFNElJ/99fkhmy0SLhsFRFah6XPrB0pYKSoJsL/WPkN8stuvR4EgOYwjHNG/eRyMHidrTqq6/9x5hjikEBLy4PEOg2H1MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4IetQMufVozVag90TpYJvbzaaVRs5xqQPAw9uBV28WXz7DOGj
	XsuFS2c55ix7+x5qwyw7SfknSwi+wIuu1m/fQSx5yke+K1tOES67ZV1qG/Xcy2DFvJU=
X-Gm-Gg: AfdE7cnUQAl2PRAI2db1oWXQNxwOixD1aSREyd5x+t24bcQ/gxXQJVjSMfp2QajWEJe
	pvayt6+T2UHmKikHU9i0ptd0dfKyuALQOj+gWRxuTQU+7twEKjwjtCBTmRWhG5dc9CY1fTUEc6e
	NOS8CnAOLe+6c35/f0izo4y4OLVptMB/fvRksNdxtNkRz4m1yR94WXDl4uLvGbOvZL9R6Uv9x2O
	1uR097uYVosnV/GsAkVajTMa9gU5RxkhhKgkw3oUvqyHQRhTl+jv3yrMFLQS04/jWvpH1Epk+7z
	uKtozYYb/NrOWElj/e1vefbyXBnNh8a9XjiynolmquRLbDHjZ5jGHBBEc43K6YdrMalyCNpqQC9
	+74MkzOpv774qmBoMAVw/0lHppP/gs7y84NobIDTCJv1R+nZaxBblwNnGhXcJz5jmYN/3sIdgoB
	yNL89bS7fAqf8pOxfVEXcorBCT7z9DdTF3NSwE+n2P23ojy+3mYvvBFA==
X-Received: by 2002:a05:6a00:a253:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-847c075cb0dmr5658295b3a.1.1782984931310;
        Thu, 02 Jul 2026 02:35:31 -0700 (PDT)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b38asm1060534b3a.35.2026.07.02.02.35.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:35:31 -0700 (PDT)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so1206561b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 02:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ82qGEM+IAAENc7s8o3PzfiNouYInXQe+gzXVvq/CWBrClnYfuk5+VK3WBD5o4+G3qywaW0StO8XlcY7UjixUxOQw==@vger.kernel.org
X-Received: by 2002:a05:6102:dd4:b0:650:aa33:5dd7 with SMTP id
 ada2fe7eead31-73da8519caamr2375794137.2.1782984487236; Thu, 02 Jul 2026
 02:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com> <20260615-rcar-du-dsc-v5-3-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-3-aed1a28610e4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 11:27:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoR_dUG9gHKpaR_53EcS5gm68=gqF3UE3aNApBZ5Wd_g@mail.gmail.com>
X-Gm-Features: AVVi8Ccj1J5pvkR0bSkeR64npr1GsYH8otXyCLdk_qEnm1EVAcQxHJFY-QII4Ko
Message-ID: <CAMuHMdUoR_dUG9gHKpaR_53EcS5gm68=gqF3UE3aNApBZ5Wd_g@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] drm/rcar-du: dsc: Add rudimentary Renesas R-Car
 V4H DSC driver
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34642-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen+renesas@ideasonboard.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen@ideasonboard.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,s:lists@lfd
 r.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,ideasonboard.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91D676F56D4

Hi Tomi,

On Mon, 15 Jun 2026 at 15:12, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s. Add rudimentary driver, which currently acts as a
> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

> +static const struct drm_bridge_funcs rcar_dsc_bridge_ops = {
> +       .attach = rcar_dsc_attach,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,

As of commit 57acfbe5bbc16624 ("drm/atomic-state-helper: Remove
drm_atomic_helper_bridge_reset()") in drm-misc/for-linux-next, this
no longer builds:

-       .atomic_reset = drm_atomic_helper_bridge_reset,
+       .atomic_create_state = drm_atomic_helper_bridge_create_state,

> +       .atomic_enable = rcar_dsc_atomic_enable,
> +       .atomic_disable = rcar_dsc_atomic_disable,
> +       .mode_valid = rcar_dsc_bridge_mode_valid,
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

