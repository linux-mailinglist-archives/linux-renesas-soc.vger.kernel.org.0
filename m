Return-Path: <linux-renesas-soc+bounces-34469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WuwHBHmWPmpvIgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 17:10:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 758DA6CE589
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 17:10:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=dfU9ntf5;
	dkim=pass header.d=redhat.com header.s=google header.b=ZJC0QmPf;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 123C230E3AEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 15:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897DB379EE4;
	Fri, 26 Jun 2026 15:05:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3650D3793BE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 15:05:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486325; cv=pass; b=Kc8xKr2BLcB9lyxWwbWvU/2GJ5jRlK4mdXJBrEV4ulZY1X4LiQNw5UGZPy7kc8bkuyVVplZAQfUlIcJghz7t3eV/aDcYgwIB5h7Rp2We04PMoibUPSuH6h1fqA591n9ucN1SYawv7sYMC1DOP0+doLpnyWtv2wazXm6JB9agk6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486325; c=relaxed/simple;
	bh=dQWoBG3cdhdrXUGK8cjuSemvsRSH2KT/hQo0wNib96o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9mPFGYpi+UYsvqBTxJxJO2Aqp9a2DQqd2/m3/tfMV9ZLNchzPOnpluXNGP3x60vvNLDPsi/J6bh69XvgTDRYJoNctGTZdvOwXA/YLGMY0DsSxWNTSwnPr7h9zlw3Ifjmidt10Bw2hKm1NNK4y+fk9vPyS7rCoRqGUqGCnSg4YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dfU9ntf5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJC0QmPf; arc=pass smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782486316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQWoBG3cdhdrXUGK8cjuSemvsRSH2KT/hQo0wNib96o=;
	b=dfU9ntf5VCw2uQpEIlX3yxWsHBXKkdctYP9boMfsXSD7lUE4lRBGTqCeh2mBRwh0nxa1Rs
	CxPrf1mw9fJDbFZAYsCrkZg4KrmeOu7oGZT9Oq3/m4anIwwWXyyubwdIAlGTcjDQAta7/D
	De8D06nLkneZ27FcIo0PQoEA73TKDyg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-jpMfsBRbND2ZY4w-Mq1DXA-1; Fri, 26 Jun 2026 11:05:14 -0400
X-MC-Unique: jpMfsBRbND2ZY4w-Mq1DXA-1
X-Mimecast-MFC-AGG-ID: jpMfsBRbND2ZY4w-Mq1DXA_1782486314
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-80af3844badso18863087b3.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 08:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782486314; cv=none;
        d=google.com; s=arc-20260327;
        b=duUSH0WANNkpbStbI24G1fA+81bBU56h48BngY7q0rkUagvpt4VXW4RlVfYo9eci+l
         GvErpFq7F+TfZvvhnqG1Ed8KgaaEzHzp/55AXRWVqtVMy1L+OhS/wtuPvqqAS6/AMdG6
         CFUXlQEQvxNB9WIjP8OkE/AAyjezkySsZiIa6zm5La86PAeEsidDDCSrQCmnHqAtMKdd
         1YhmeKSsq8yNyFbktzxt8LGrNSrpf2asveGdpL6BZgt0XIREAmOqP1kaQljyUob7Jm75
         hkBmNTu+HwW5Os9JZu9daHjbC9nBXKuGUdFe8GT30ctJY1DGWlhE4BunJqfi1s4QQV5P
         QxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dQWoBG3cdhdrXUGK8cjuSemvsRSH2KT/hQo0wNib96o=;
        fh=z22vUyNHh5eubodJ7T84r2D1+cHFpgSAWDkVFGQhHqo=;
        b=r8ENBELluqlUx2KZeeZ6YclhyLqVuIFsIwPCsiFx/u0PFvxyi2J8Negg3wqxE9UxNw
         Ldde3D4LK82XBbqmCtexYa8rWnK741zL22S/BjaUemEfcOP9cmkdp+XOEu4TVYuDdKvO
         W7On/5V8tiq/ZwL37zaZlaR89qywe4LOIxFCJM/lhjLaIo5aU/Ok65ozT2CmppR0Oqql
         lCHlmDGFHwW5D9mDzhL+3ZfwjP1eysTp5g7KXl9f7GjTqzSH7zTuAgMHkeRTnVuT79Vg
         118uAL97reNaoB23wUH9P0w4B+nhZW6lwFygxm09gHItI/ZrxJyJ+gX2xzpfM0oUcKsZ
         QkRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782486314; x=1783091114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQWoBG3cdhdrXUGK8cjuSemvsRSH2KT/hQo0wNib96o=;
        b=ZJC0QmPfKiPycIBd/ikXBnaGSCiyRW2OvqFhgsh1c/24pQKnY6i1FtV0z5gSAIlRln
         WU63sX643q0EKqypFtcTMQJ/gNeRazjO4NLyCXT4YlCXbVOfcDh9nlAW1Idxrh0mZLwD
         thSRzigLAq+mXz5FZgTd62ObnYRHV4uySPWGt7HjiZkuGIsf7r7iuGRTDX0jXIA1l336
         VnYt4YoBw8hK+4ztm9dP875mTpaqgsAbVNX0tIhf+T9gWAlZbQoHNMLc62WCjETuA5zp
         yYbwrLW6BfAggAX9AizZ/CcqP0rYWIa0VcL+lQE1d5P+gn5nqgnukShkiq2mX1o8oxEp
         3D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486314; x=1783091114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dQWoBG3cdhdrXUGK8cjuSemvsRSH2KT/hQo0wNib96o=;
        b=S4BNTZlJB6nOIYZ89/gEqboXvVJdi5y/sIYtmKVC5srjLGjEX5ZhOD/xSifrZtj8kr
         T4sum7eCXKJG01WJYmRh7RDfVTuQJoA9AIeRufmD9TWMHfJ1Tdse0ShoAdIuay8/xpRC
         6nuAS6XSjb/Ph4o4XwyHCjEJe8xJQ82scWW/1XsldAuoXb+9AMxZQN4YB8izkeYA1/Or
         IaXTGNgUl+H4FBSmrpdWofTL+VQq1Bll5pftXNDmw5qqw1tCJfoHiyOjbywYZKyJK2/L
         Efd60jECsHmyPqHN8NZcLhN+4DriBbu9D22PRBGjnivPWFXgobBfddGlfGyxvQxLOnIN
         4KhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4qhsDVjvuD5FGGUpxtdxeN4i7Ymqpf3Y5JpD8HBqkXphKftBj4EWdrKakZ/+Iv+GAdLhoPbN36BPtCub03NTG1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFdajgxRWfmfJdwXqZth5fIzITdSfcgxUltPVnY1ZQET7qlBSL
	rx5w3jJa8H+rnvxkT2IkDTgLni5yAK9JraZ9OXlfYWhundE/2EFp7SltvklH41PDR9SOJhQKto7
	mC655ABoEEu8ENRLI0P71I4oFuKNcSNitpjq8Ur89Ti5Fz88zNaaVXhRUJ1Yji8iC9gLSXeyJ9g
	BIa8HRZceHT9GRdbxP8hQ4qDuJl5Xsy8jTY9fJkrviETiahkM=
X-Gm-Gg: AfdE7clnnZrOgjXlWPbBQ0S0or5paOYHpIuGRdhnMcSQ6VC3aUm3gPc5ohR0QqpkdyF
	w6MLyzRZc+N2OIOPMxsSFO1GCdiCLvyholJ4tAtW4CH7NiJmjRFRnilMeLrq97CllfdyDAQXAa2
	llNKq3UDN5arx+8iwLyae7id7wWaPQLgP4vxbjpq1KQPL+1Li/IAvvaYYjpB8PcsG7
X-Received: by 2002:a05:690c:4881:b0:80c:cad:c4e6 with SMTP id 00721157ae682-80c0cadc8fbmr18141477b3.32.1782486313689;
        Fri, 26 Jun 2026 08:05:13 -0700 (PDT)
X-Received: by 2002:a05:690c:4881:b0:80c:cad:c4e6 with SMTP id
 00721157ae682-80c0cadc8fbmr18140727b3.32.1782486313097; Fri, 26 Jun 2026
 08:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-5-cca1a7b3bdef@redhat.com> <20260626-ivory-tarantula-of-valor-af0e2a@houat>
In-Reply-To: <20260626-ivory-tarantula-of-valor-af0e2a@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 17:05:00 +0200
X-Gm-Features: AVVi8CfUWw7MSpxfIbgb0qtM7cCP9XXdSgcc1xFYb1Fq3hJmdhiO9Zy5mZXSYcU
Message-ID: <CADSE00Jy9-BR9e-Dg-S4_fiLnjWjXfTq3c6OO8PxTM=gQyA7xw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm: release panel reference after panel bridge creation
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,intel.com,kernel.org,ideasonboard.com,kwiboo.se,bootlin.com,samsung.com,amarulasolutions.com,oss.nxp.com,pengutronix.de,nxp.com,crapouillou.net,denx.de,agner.ch,glider.be,bp.renesas.com,rock-chips.com,sntech.de,foss.st.com,sholland.org,iki.fi,sys-base.io,nvidia.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-34469-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aesteve@redhat.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:laurentiu.palcu@oss.nxp.com,m:l.stach@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:paul@crapouillou.net,m:linusw@kernel.org,m:marex@denx.de,m:stefan@agner.ch,m:tomi.valkeinen@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.
 st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:samuel@sholland.org,m:jyri.sarha@iki.fi,m:jingoohan1@gmail.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:alison.wang@nxp.com,m:paulk@sys-base.io,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-samsung-soc@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[67];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 758DA6CE589

On Fri, Jun 26, 2026 at 3:00=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Jun 26, 2026 at 02:03:27PM +0200, Albert Esteve wrote:
> > of_drm_find_panel() and drm_of_find_panel_or_bridge() now return a
> > counted reference. In drivers that immediately wrap the panel in a
> > bridge via devm_drm_panel_bridge_add() or equivalent, the bridge
> > acquires its own reference, so the caller's lookup reference must be
> > released right afterwards.
> >
> > Also handle the cases where a panel is found but cannot be used,
> > dropping the reference immediately in those paths.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> drm_of_find_panel_or_bridge() does indeed return a refcounted pointer
> now, but afaik the doc wasn't updated to reflect that.

True, I'll fix that in the next version.

>
> More importantly, I feel like with both of_drm_find_panel and
> drm_of_find_panel_or_bridge we update a path that is considered legacy
> anyway now, and we should rather focus on providing a safe alternative.

Oh, I missed that this code path is considered legacy.

>
> But none of the functions you updated are unsafe, so it won't be more
> unsafe, or provide any illusion of safety to the caller. Idk.
>
> Either way, this should all be on its way out if Luca creates a bridge
> for every panel, and we'll consolidate on bridges only, so maybe it's
> not such a big deal to merge this patch.

I see. Given what you wrote, I think it'd make sense to correct them
while this code isn't completely dead.

BR,
Albert.

>
> Maxime


