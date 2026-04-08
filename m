Return-Path: <linux-renesas-soc+bounces-31011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCH3JQVX1mn5DwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:24:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD5E3BCCC8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1509F301B4DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 13:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49FC33C528;
	Wed,  8 Apr 2026 13:23:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC973368AF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654609; cv=none; b=VX1y6nAT1Eo7ZZ2qajw4Jy/oJQbzafJq7h6X5XNQakuGgr93BPzi5T2uPEspukw/RVkE0l8or97sV3nrRBhrFeYcLWaVTbuMbBegeNiU8ZYvcjVdj6X3X54tf405h8nloPQLC8ZbiuQWR1B4ByH8QXpD9gHNINeDdkMYJGb6/j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654609; c=relaxed/simple;
	bh=Esa6dVRyYOOr3vJIDSY5cJEBLjvkhKepH2lKClA4ih8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+gseUlzaT8KhlAGHCLE6tGAzrGAgKJvB5bqnpUyqe1yvao9Y+3g0oDgkcSgAH7Pc5lLIG+ttpRf1fWXsxxNCofwTe00+WZjtOG24Qy9FXiErjkelnHeTMmsdHOX9lZTOL33xmTrA6W7Pi/sUSDTOOzcR4Jww21qWP1/voczvGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56b8804f37cso2686005e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 06:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654606; x=1776259406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VHgesrf5StiprJKDytJNXvB7R5FJ2lBTM9ZJItFuhE=;
        b=GLtZCw1TTDeaqvVVwHLthrKdV9d67YRhWHrN+Yv9gCqLP4LCvzIwYo/tlDXdc5FWZY
         I3AwCf4jlBWgRtqjEIppgWeuv3BcFgzpsI0z7+7ZXLOvbmwUs58cAjrLB+BJtrNGLou+
         UdxMShD78trxaPfJwh/erBQ/xWg1vUCPJINTyeA5kbTzY7HkFV8vr3RFNw/GN0TnSo+Z
         oDNhooGYBwej/RKu4B8G64c9i5Nr9nyplrd4wQXLAf7JdXo3LGXYimhcdV093NrfkFE+
         OENpdf7MVhelX17pPWEzX0CimD2p6Zdrnku5k1wpb3GG4/cz3dBGfs8NfgiYRzL6Wufn
         bjig==
X-Forwarded-Encrypted: i=1; AJvYcCUORCt1ZYWt8leAQ2J7/PgkEWCksnP62uaaw3SUDXhIcuzSSEyA9d4diCT2XBUzLyjbVKrMLwzi4QspbiEhpVc71A==@vger.kernel.org
X-Gm-Message-State: AOJu0YynUEs2iEOTS0QgtmBsaG3pNDHlbfZZGSZX00WjeTAaAw8M5d5E
	OPWWZvqPsTB9JkGf/Or3pJvy6jJB3bDb1hoBelRJNljGBLifrzr8nX+MIfo22HPQ
X-Gm-Gg: AeBDievsJ2M3A9RcT9MjJTZZdO2kju/X+AnEAettvTP9LKiMdkb4aQ4o/EDeqEdOvsF
	RancX3fQg27BhA5uUu4Dcm0mzTwJbLwvTXpDbZfQLXaFkcfNthv1k3RFcBz352m7hMOXVhw60cT
	iAibUuzJCjhO+VzRJhEpzasQ4DYMZ8fiTIXrUmfG2diQLDZPLHTqGonV0NVViwmXeU0psM1F6Qy
	OAIDC/gZZMGJtOBI4CJPItLrmFy98rA3pThKuKryydMjlni/QGh0LsitzPIlzi6Bj41h9syqlKs
	qje4TCgX5x69jCdQEWAwNRTZe4WMd+uGAiviRiS3mOCe46B6wUpsbknZzQGOuGsFHowCKixrR+1
	7BOTesQKV0Sk9y1sEg/cmPJjtIQ7hb7e71dE6amvO64wTE67FoKt/QXv/VKSgcKZ4Wf4GflE+0w
	rmYixv/lq281I25V2rqEyntkBH63pyGHVPUHSSGArikL09lsbLW7VEx9YAD1GglAFn
X-Received: by 2002:a05:6122:4891:b0:56d:9e98:4676 with SMTP id 71dfb90a1353d-56daba1f4famr8435641e0c.13.1775654606446;
        Wed, 08 Apr 2026 06:23:26 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba8019bsm20172911e0c.1.2026.04.08.06.23.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:23:26 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56db63456d4so1607778e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 06:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWS1Cwg4Yt9fCopjvtpTStZfoEGMnHL4srD+bZmVkBizbZUYTpRLawO8B6oC+kICnOKuT46o1ehqA1jaRVGtDkkvQ==@vger.kernel.org
X-Received: by 2002:a05:6122:3a03:b0:56f:1a26:563a with SMTP id
 71dfb90a1353d-56f1a265761mr1211064e0c.7.1775654605828; Wed, 08 Apr 2026
 06:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com> <9595f56ce8ab120477bfc11eaafb0f2b655d049a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <9595f56ce8ab120477bfc11eaafb0f2b655d049a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 15:23:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXr_=E+WhCd0Tfrehn+2Mo3L+GUUUCWX5vc-gunYx_oTw@mail.gmail.com>
X-Gm-Features: AQROBzCAS3tdwS4I5i1ony0ZYqV2Tos82DINalsSZpND3OxFU3AJc31boq9f15A
Message-ID: <CAMuHMdXr_=E+WhCd0Tfrehn+2Mo3L+GUUUCWX5vc-gunYx_oTw@mail.gmail.com>
Subject: Re: [PATCH v6 06/21] clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,baylibre.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-31011-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.050];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 2CD5E3BCCC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 at 12:38, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
> present on the r9a09g047 SoC.
>
> These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
> using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).
>
> According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
> SELCTL0 or SELCTL1 must be set accordingly.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

