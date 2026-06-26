Return-Path: <linux-renesas-soc+bounces-34449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AT8WNflwPmqsGAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 14:30:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 292066CD004
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 14:30:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 951623008637
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 12:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39EA3F23D5;
	Fri, 26 Jun 2026 12:30:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6F31F8AC5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 12:30:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477040; cv=none; b=dxa/o2ulTu/P9zfY+DisP4jV54X4fmi1sYgbKR91po/ERtJuIhhu4luLKVhsRLC9PGLrifI8ynjH+DBrZGmV8PAF1ztRrEwkJtQAVmLDCc0IVT2rog2RMCr5v+KuQufkrH9sREXBhgqOqfC+pXRqAd9jb9kTcXN4qPPy91j0x3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477040; c=relaxed/simple;
	bh=L8m+v9Mumd9PBrIoKCr6p8n/MbxpHP4z26Qvy7erVnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1kPgr8Njb1t8oSjtOcci7FUgOdw+st7gCj9UXmUbTchExBvAUgDCrO+c8C3iO69HXIfbLTic1wbaTkqPEqZrH+SHEKLEoadqFFEfK1k/CMOc3NWzC9T1jHgljLZvmwHQQppqAV/Ic7OksQju0/o76uv8IkWhGuUxU99KrgsuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bbf01bcfb9so624856e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 05:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477038; x=1783081838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qc4TavqegVrav+S2qpl9+8s6wcCSKt3nqOoGSJ8Fvk=;
        b=FSCojNMvGzSOpPRBkcAIL+m5tEHUx5jhXAYBy3skzK6OxJIGa44rgb0+ZKvOoxJqhh
         di66FEFeremZGrazC3OJiwiiWgkI4ZQrF4e1x3sSdy/d0s64LuS03Js2pZQlOMIMOyAW
         4tWjfKujmnSyp/Z4eeTnZBSHP30mn4xdavvirf90bOdFNBN18ugYF+C8QsQPU21il84A
         gA26E2LLKvbKu9oZ4Hv5o/qOIU5rQ60rpCRtqwXOnb4Ke0QJ9CjxytWe5b/swWaALqco
         HgY3XVQ1VcA5ukENDpzOE18jH/rb+EU8RKVoW9jbHenotdZz0PzWnFEEj2zEe8wQ2KlQ
         OpKw==
X-Forwarded-Encrypted: i=1; AHgh+Roh3CDsIA4+XzeCCDG0kqdAXRFx/+cbjG+XbHOxe1JH+kedLtQmQOhDsgi+Z0YuAZr9SOeEqrWMgQgyO70/5B3kug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytg9v71MqBnPqnwonJr/aDWk5gM1GpeFxnLHmjScPjdjpKBfDt
	Lqw/WAco5sMaVW0F6NMRY8b01zaKozEVLyG+hqBYC6Z0vw5bBaWoR4CuyeO1zh+y
X-Gm-Gg: AfdE7ckS/XBxEVy0j+2cbxe7beScMXlWBv+mULTEnxs8jrPiZmgU3tTSkXXDepVaEzE
	oMEEh0L7u2fonqFTCqIbTTFMqGS87p3GpV8x+8+zuig+cr3W5d4uQB5sufE8PPm1dW98kLTbvGq
	+B9BPzGbnE8GMLYHj/gaaM++8zFd/szRrhy4v52yIiZowsUXMHn8n2cX3O6nmrbwAClH8XHXkbC
	RFMg+qwbJxM9MzaDEcnZky4A12eS1yoBMJYXILjP/zFH5RmREeCkbBVMmAcpz2zoXBEdqBY04kU
	QQZYCJPoKxmzEhCmIkX+LU3q3eCty3C3zS0w4roa5MWpqAiuns7xf3jITuYEoSVZggJIYGoTcMn
	No+5q/M5YGvs7yEe9pzW1GUB+PTTzqs+negO7+67aliyqNt9qZjXCoeatJarAG4IJU+TnJNym47
	nOSkQ2gm5SrNoCihNhqACsS6t71Q0mIROb/WdoYDL9vIHAOrRjeA==
X-Received: by 2002:a05:6122:d87:b0:56e:f1d2:c3ca with SMTP id 71dfb90a1353d-5bd69c31db8mr3293004e0c.2.1782477038410;
        Fri, 26 Jun 2026 05:30:38 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bd7908a3d1sm969264e0c.12.2026.06.26.05.30.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:30:37 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-966e7380109so664564241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 05:30:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro9yken7Y8K4kP6zGhowud8QUjog9R2qNOplty+ZdT3rY2qkp1NqBTy3krZq0Sc0mSTDwksbl3kdi789cQC4RByEg==@vger.kernel.org
X-Received: by 2002:a05:6102:5491:b0:631:4580:6a46 with SMTP id
 ada2fe7eead31-73435b90f5fmr3476500137.17.1782477036873; Fri, 26 Jun 2026
 05:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com> <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
In-Reply-To: <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jun 2026 14:30:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
X-Gm-Features: AVVi8Cc1rFvCNNORSHDtFmL_tkYQ91oxJ5vGSfmmYwanPmDM2yIyJwQSJ-fX378
Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: Convert to new media
 orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34449-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux@ew.tq-group.com,m
 :imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kieran.bingham+renesas@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	FREEMAIL_CC(0.00)[kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,ideasonboard.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,sntech.de,vger.kernel.org,ew.tq-group.com,lists.linux.dev,lists.infradead.org];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 292066CD004

On Fri, 26 Jun 2026 at 14:08, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the renesas device trees to use the new
> definitions.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

