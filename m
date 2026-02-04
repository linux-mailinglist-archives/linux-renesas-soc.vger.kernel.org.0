Return-Path: <linux-renesas-soc+bounces-27901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLcvBI5ug2lNmwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 17:06:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8CFE9E0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 17:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D9133193289
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 15:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F079840B6FF;
	Wed,  4 Feb 2026 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBanTtoM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658132D8DA8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219265; cv=pass; b=Gmp1f8cFstbN3t2JVN3v+k1tSirBFkSTcfrrDtgbZIsn0wKcO9VtXkakU+64xVq8sH/Q+L1g9UndjFxor/dJpCuY749fL2UNpkxyp7jLHJkl1sGo16dnBNFBD0dIIJyGk4fdaQPoB+mSxYoRh79CqQwGQVGpnD8V2hrID0WhsZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219265; c=relaxed/simple;
	bh=nlKsoL4i0v+dpEX8d/w92v6q3wSKthXMOjn4z01pwP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nj3F2pV/vfsZzzlezksF+hsg/P6LdZMWC2WQ8piT/F6w/5vfVYQQM5ciz2t0N2DL+ASrOyyTihh+fR+h4h+zXpN2c6YshlWrPDn/ZjZwhfIsAzSeUkqQmwjUSSAhLzGpPhPIv4/TjDiJix4Iyo+8m5DCKO8SBEXwMnKRPU40gpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pBanTtoM; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so7733269e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 07:34:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770219263; cv=none;
        d=google.com; s=arc-20240605;
        b=Nt/FgTH6i8gUwleWSaxkVI7YG0tri+k+ckScODY4L9tH8Cgd8vrJHfxg/sYjm3sC87
         G4p4oerCf08QxRNWrfGUNv8AITimBUXlnhsxExl68W8f7Sj3W5D7hUV7eazYBVeuX/bF
         2l2HhKpaXPKNYCtHNQEGnCruTszTn+EATmby/ixgIU2iXyjugl/Km4vrqDyGrnI7O2jr
         YImHKPqNbtRGosW9KNBKEfrvsPdofswM5ROGxQtyF7QLXqrG0Y1t+JMg/Kk/nKAoRG7z
         yk43FPMPYO8Cco3tdV4hu3FgHFw2QIl6nVCFjJtyxDlRI5UGkXal6V6Da8YfGg8Bf/q6
         2cuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qkOzGCctQL30LKjh61z23+b/2EwmO+vcdgiQ7sj0+R4=;
        fh=rz56yN2txz7dxIwBPSGfT9GPb7T9kNjBbFTNmQoxn0w=;
        b=E91mirmsOjVjXcO9Hy+3LHFzzm4J4Kx7E71wB6cC4f9dTvbuybluaqfjCPj/pA0g2t
         Mf9CT9ANMjwHRvjfVLF0IM1UyhgcKHBra8mjujMFV0uzeqB70dDoV0sODam7vdlhM91i
         0gHXWtbSlKyoGUM/rgSzKA/OmQ/BbfnzTH0DCnY8vURnxMwcRKE4KYxwxCsn7EgMW0VS
         N/741awhvE9LPoFz6ApmBhMGe3GGAgqFrR5RzOQPqRFCRUUKWLkb4c88YGWbKu+CUkvV
         Ss1Koyr1qQOrGnBCYZaFyoQ35wrfwvgP//Iaco1hdDSkLb2jqWJFG0gxgRRz+5caJlNw
         QWDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770219263; x=1770824063; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qkOzGCctQL30LKjh61z23+b/2EwmO+vcdgiQ7sj0+R4=;
        b=pBanTtoMvLNrPLrmbtThb+8EkALU8o+e1Rf1NK9EDF/mTIMxSG6WUsh5PHvLj0lVDd
         rLLYEJsTuk89Ikt4ESXLIRTjZjquPHEpd/OiH6cHB+9GsY94hRe+6ezqJBOKeSSlYnVY
         y9hAMGPC5gbROzcaBfGasf2Kp8QiBmAZt7+ctzhQt2hXOx49IEbV5aihVb69ER9ashR1
         sDu8zaF+L/YHX2sflPI1fJaVa9F/Ltz5wNRjpbe4qVoUkMkpaEFErL0xjKSKC18JmD4p
         VeimxaY3QXZfJhEoIpTasyUt3McSVTu+Vv4jB+uhNu+qzc1Mm6LKbye4ru/RuyZ+qOvu
         +Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770219263; x=1770824063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkOzGCctQL30LKjh61z23+b/2EwmO+vcdgiQ7sj0+R4=;
        b=HCnLfG4g9ud7Q00YB5K4ka8uJ5/GDiQ4ZwmNHbebQ7zDYEngIxOIEBqyE8NJODCG81
         XyU8tWnsdUBGgeUx7Fm02jZkb3Xr1LO9hq3xn4t1tCfrvMSy/0ws158pBy8z1w56u4kH
         LnKwyjcW2Os08R3glYHkik+XFuUIPd7dfc3CF5ezXJN/4YrIANicnIgxpOKtgxqPrF4p
         yFIiIcMOz2bux4qDe9SqQax3PMFNqqlGVefOORTYTnDP0AJAmoOhrZIMrFOW0GX7k+fT
         stEhPTlLG3cipu6OYN9eqZgf/eXTrd7OgN+6eaLNH+Aj4lUwQhVyeRuMxWYF+tFrOBvH
         Ac0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZCbwou4xT0ueY0uvg8xkcH+g1LrAdtJraQUi+staGUqNNho7PQxEhaYe6fAeoC66cxMhkFhvgWhRbxwAQgFrwhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybUmFf3TwPy2dow3CaSsUCno9RtWVIBdXBnRFrQtiHlc5ZKSUS
	MeDgZ0VgtdZYptLUubKw1riD9crDagK2D8Snb1DAVqGsldGYflGtv2iHFEtjHpN/vbxmzgrTW64
	VG3Nf4y3cAhDRKWDxxCjtWr9ntHt7h09lf+fRyiwkNQ==
X-Gm-Gg: AZuq6aJ3yQMJlzTEP5K2e5VDu4oEBcZABiOoKdcMqDg5krBDxB2J8VGBqRgAQCnUGg4
	S3ID3k6qgocrsA8F8q15Gdy5hWtKBx8HRMtu2EMmq8yCwfdgK/+6p67kWobx44RiSLwh+LBqNG9
	BP/vR1d8iHjxNQG9Kqx4XvqdRAKLC3rIuuMz3oey6zoRc5eB9N/ny23eNGFnTF+jG1GembIOZE8
	xBoQ588bf9vDnPW1CKS+MjGDfYao4vQvsfsUwjxXP1MVC8RyZ6sbFPa05yp/1Mx7KsFr3lm
X-Received: by 2002:a05:6512:b87:b0:59e:161:652a with SMTP id
 2adb3069b0e04-59e38c27b46mr1376642e87.31.1770219263338; Wed, 04 Feb 2026
 07:34:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-rz-sdio-mux-v8-0-024ea405863e@solid-run.com>
In-Reply-To: <20260203-rz-sdio-mux-v8-0-024ea405863e@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Feb 2026 16:33:46 +0100
X-Gm-Features: AZwV_Qh7tniAwClRnk-rPGRk4VKw9IxuzE_pomII0cTXEalWLMydXWCz4mlcfmk
Message-ID: <CAPDyKFoeKCPbsaRh+0t7=naO0pFvFCD3NV9nA7a4UOjxj4aDwg@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27901-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email,solid-run.com:email,linaro.org:email,linaro.org:dkim,intel.com:email]
X-Rspamd-Queue-Id: 9B8CFE9E0F
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 at 14:01, Josua Mayer <josua@solid-run.com> wrote:
>
> Some Renesas SoC based boards mux SD and eMMC on a single sdio
> controller, exposing user control by dip switch and software control by
> gpio.
>
> Purpose is to simplify development and provisioning by selecting boot
> media at power-on, and again before starting linux.
>
> Add binding and driver support for linking a (gpio) mux to renesas sdio
> controller.
>
> Introduce generic helper functions for getting managed and selected
> mux-state objects, and switch i2c-omap and phy-can-transceiver drivers.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
> Changes in v8:
> - Add defensive null checks for all non-optional calls to internal
>   mux_get function.
> - Document NULL return value on applicable functions.
> - Avoid IS_ERR_OR_NULL and ERR_PTR(0) to disarm smatch errors.
> - Link to v7: https://lore.kernel.org/r/20260128-rz-sdio-mux-v7-0-92ebb6da0df8@solid-run.com
>
> Changes in v7:
> - picked up reviewed-tags
> - fix Kconfig change to add the missing prompt for CONFIG_MULTIPLEXER,
>   and enable it by default when COMPILE_TEST is set.
>   (Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>)
> - fix another kernel build robot warning: undocumented C struct member
> - Link to v6: https://lore.kernel.org/r/20260121-rz-sdio-mux-v6-0-38aa39527928@solid-run.com
>
> Changes in v6:
> - replaced /* with /** for devm_mux_state_state function description.
> - collected review tags.
> - fixed checkpatch warnings (space-before-tab, void-return).
>   (Reported-by: Geert Uytterhoeven)
> - fixed use-after-free in mux core mux_get function.
>   (Reported-by: Geert Uytterhoeven)
> - fix mux helper error path uninitialised return code variable.
>   (Reported-by: kernel test robot <lkp@intel.com>)
> - Link to v5: https://lore.kernel.org/r/20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com
>
> Changes in v5:
> - implemented automatic mux deselect for devm_*_selected.
>   (Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>)
> - because of semantic changes I dropped reviewed and acks from omap-i2c
>   patch (Andreas Kemnade / Wolfram Sang).
> - fix invalid return value in void function for mux helper stubs
>   (Reported-by: kernel test robot <lkp@intel.com>)
> - Link to v4: https://lore.kernel.org/r/20251229-rz-sdio-mux-v4-0-a023e55758fe@solid-run.com
>
> Changes in v4:
> - added MULTIPLEXER Kconfig help text.
> - removed "select MULTIPLEXER" from renesas sdhi Kconfig, as it is
>   not required for all devices using this driver.
> - added stubs for all symbols exported by mux core.
>   (Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>)
> - refactored mux core logic to silence ENOENT errors only on optional
>   code paths, keeping error printing unchanged otherwise.
>   (Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>)
> - picked up various reviewed- and acked-by tags
> - Link to v3: https://lore.kernel.org/r/20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com
>
> Changes in v3:
> - updated omap-i2c and phy-can-transceiver to use new helpers.
> - created generic helper functions for getting managed optional mux-state.
>   (Reported-by: Rob Herring <robh@kernel.org>)
> - picked up binding ack by Rob Herring.
> - replaced use of "SDIO" with "SD/SDIO/eMMC" in binding document and
>   commit descriptions.
>   (Reported-by: Ulf Hansson <ulf.hansson@linaro.org>)
> - Link to v2: https://lore.kernel.org/r/20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com
>
> Changes in v2:
> - dropped mux-controller node from dt binding example
>   (Reported-by: Conor Dooley <conor@kernel.org>
>    Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
> - Link to v1: https://lore.kernel.org/r/20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com
>
> ---
> Josua Mayer (7):
>       phy: can-transceiver: rename temporary helper function to avoid conflict
>       mux: Add helper functions for getting optional and selected mux-state
>       mux: add help text for MULTIPLEXER config option
>       phy: can-transceiver: drop temporary helper getting optional mux-state
>       i2c: omap: switch to new generic helper for getting selected mux-state
>       dt-bindings: mmc: renesas,sdhi: Add mux-states property
>       mmc: host: renesas_sdhi_core: support selecting an optional mux
>
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml      |   6 +
>  drivers/i2c/busses/i2c-omap.c                      |  24 +--
>  drivers/mmc/host/renesas_sdhi_core.c               |   6 +
>  drivers/mux/Kconfig                                |   8 +-
>  drivers/mux/core.c                                 | 205 +++++++++++++++++----
>  drivers/phy/phy-can-transceiver.c                  |  10 -
>  include/linux/mux/consumer.h                       | 108 ++++++++++-
>  7 files changed, 302 insertions(+), 65 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251128-rz-sdio-mux-acc5137f1618
>
> Best regards,
> --
> Josua Mayer <josua@solid-run.com>
>
>

The series applied for next, thanks!

Kind regards
Uffe

