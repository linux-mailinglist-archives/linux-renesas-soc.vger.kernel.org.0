Return-Path: <linux-renesas-soc+bounces-34456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8RTtE0l7PmpPGwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 15:14:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BBE6CD54E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 15:14:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=KY1LPbaR;
	dkim=pass header.d=redhat.com header.s=google header.b=MgiDcA2I;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39270300C03A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 13:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A5E3EBF3D;
	Fri, 26 Jun 2026 13:13:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6FD3451BA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 13:13:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479585; cv=pass; b=UF+JdCGJEdxfFeNq7LECGRCG+IRZ5Q5m+zflGa4y/u+JVUGjlQhRjDlVA8FGgMm1iTtJliPQJLvS3/pBjkjaheD7tmcolk4AmG2PBAwoNc501kSAeQGg3fulYrLCykzZorWLcqHJpU7tIyJCkA2SfhSPchi+PFEpVyU7KKCXj5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479585; c=relaxed/simple;
	bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ry7IjlV/hujAZ7raDSrcvX+We9aaFkLUZd8zAirSIp3Lnq/ouQOHNdBZHU6fyccOjC0ar/hABB/1dp3q+maaJLzp0nYvrhyMiHye2stctMGC1jxDtRvPg3ZzkC93L6vKvI38LehU6NP4eQDpux7euBxr25wQU9xagPycrZR3Vss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KY1LPbaR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MgiDcA2I; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782479583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
	b=KY1LPbaRdP0/dRO/SwwKQYLWgoZcSN2wmaGU8mjHZDRLn03TRJKIoQZQyDBZVmwSPLKkpX
	TWIHeOnqHk/Ni6nLMFjSGPZwWBn6op7BXI8V648XG8KLlGDVm8LYYk7MDirgIEEgXMnME6
	V2avShz6ZKWVnQhUKMQOutJsymi+gKE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-ZKrt3cR3PkKbFEuAbAWYTg-1; Fri, 26 Jun 2026 09:11:54 -0400
X-MC-Unique: ZKrt3cR3PkKbFEuAbAWYTg-1
X-Mimecast-MFC-AGG-ID: ZKrt3cR3PkKbFEuAbAWYTg_1782479514
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7ff705a4289so13596687b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 06:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782479513; cv=none;
        d=google.com; s=arc-20260327;
        b=rcp43L89D445pi4Odssy2f7HqiNw1w4KIe3NxkDvit2aAQzr2up2FqhABa+qkfI+Mj
         geGqNTxvH1eFgwJ9K/kiNG6eCGHwu2cWiwGRPxIow3/C6SEhNMrMguSe9dyHyT3nH925
         TJOBTAP0qlVlaFxp7j9W2VBiFb92rJZJCTv6aJ+3K1suHvGFLGqLF2CEv+/ybRlCdhwv
         XVzwoYTzfUAdGj35vE6sx5D8rVmNtXVSnJYoCIu3Dt5Ihr+G5xdZ6iMw+X3aFB9KSqTp
         EaWl1NcI7Eu2t0JR5pCgrNdsRudI6BZCjy7INTLODaTn4r6VVUjE4h0MFkSqvJpVs3iD
         BBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        fh=+6djQ3LUmh7Ocw/iyOuSERzpwpSgQS7f8gR5Gk/IAkA=;
        b=kfbD6up2WXnEgEwU7ehJIbpNr3XCEZDMMJ6anmVxfaSPlzn4z4n4xkjRn+eo8+MexZ
         cpEdFLXYI7kkM3cDZcRgvSkKo6s5wn+M635WuzWrJ2LP+eePuJ+wKL810lGPiweju13I
         2PDKz8JGO76JtRE/ESgGS4ThE0ghXHWt5/hCslFNKfFOiHEbOr6CPOiG5hvCGd+y5cxI
         gY7QjzIk9G7/XbCxPfDyFp+CyCCJqgCecgG2rvu7ipn5rYC4cT22DsZdyy151p8m54Q+
         rqnPkKJY4fGvHp+Pasy8BaZcujpdyu4gXjFJxYQ/Ek4wpQ/KdLR9+ekNK6TgZdWo5S8J
         oFBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782479513; x=1783084313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        b=MgiDcA2IyareaUA8F+1bCR7ftoqsrzWDFpj/gpuOfEOqoQPeNn42ZtbsRBhxd96I4h
         KWAQtmWsLUa62XFLjckKGf55gTDDeM6hEcNDKfBw2VsHS+lMHjFvYm9SMMeWPQdy1DH7
         8nvtHcJKtEmzvz3ziDLdNO4xnwMS7DoiJsvf1ZG/CWZIVEIx0tARXyN3tu5LaM3W7gkq
         C4Uw0hk539NerXaKHjW6QeyQ1A5enFtd8XGchAufxt0XH+2WbgDbiBooZB9KKcxXYgGM
         nWZMRERb2hEYXxG/68R8DT74ScM2JnjBlsEV4H5Auwsf2+LhCNy4Q1rDCEMvz6/qOeMn
         rN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479513; x=1783084313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        b=f2CCGpu9HZAVJgLwz93HahhWcB0pk1G67PyBx+iwX1J0/KSW4Gs2lCUeM/x8CGA0Ec
         +TY+mOdbrMNAWhXVmzpsuh3EZC7ZCbgZ1i+fxMJocgNrGzHDPn1NkM/Z/LRn74F1/PkZ
         TOx0Kg0i0VxYWIjgD5LgUXoPq8VuMng+ts9fgEyZSosrJXlRs+Bh4q3/3RcDQL5CDnkq
         33fxKXScIPB0msQURo5xrNTl2mzusNX0MtgV7jrbr1n0Xd2Dh1yXKqGWy8sfZWwiDp78
         ap0hRSBodSwFjs3VIYvuuY4lVTZURWffR/Nvlu3ktWeuRwi5McVQ0+q/2Vmna69pVZtc
         8zeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpij0gk5V81c7240EKqCx9Vm1YmHV0wKbtNFZ/qqicWYfA5+j0Q/QduliO1Jid5+iJOcFEyZwOHQR5+aESkTQDPlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkyq+rpq0ozChPGOx98eZzVTzi7KWGX4QGLBpHO+ueWtUTrMNT
	sjrH5yLcqLaA431QYlHh24LDDbgUeFqGXTdizCFi4/JJaxdVoBD08Gbtrs9ogCLTKFaUZPd/kwP
	teuFrGIyxLZEZy92MTJauP74hJXa4YuY0B/BbCOZW+ZAWjvl9Ue64v1Cd3ZDRoAPomTscQwUEXR
	5kVPOJYSQOyGEUrTBW8H6S4vgZSwmFkm/be9uszn78udU68Bc=
X-Gm-Gg: AfdE7cmYkxh0pGNc45ggWgNFttRbq/T2zi9j0LZUwrmhTTRJUNqtqyTZui/VOBqWkgX
	4MfwYr7KixFBhEkba7ThkT0h/2HNSeTp4NbFq9MlW5g2eWVvxKOfZLXgfxMMnr3OHuq+dIoqof/
	Sptt3LpMPo5HkC7vJkJ9AZ27V5bnIn3fgN69+31tGeWrvwUBIsIhu7o3bHAi7vnjRB
X-Received: by 2002:a05:690c:2601:b0:80b:ef0a:7aad with SMTP id 00721157ae682-80bef0a8585mr15809537b3.31.1782479513418;
        Fri, 26 Jun 2026 06:11:53 -0700 (PDT)
X-Received: by 2002:a05:690c:2601:b0:80b:ef0a:7aad with SMTP id
 00721157ae682-80bef0a8585mr15808937b3.31.1782479512984; Fri, 26 Jun 2026
 06:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-4-cca1a7b3bdef@redhat.com> <20260626-manipulative-rainbow-rhino-d73b65@houat>
In-Reply-To: <20260626-manipulative-rainbow-rhino-d73b65@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 15:11:41 +0200
X-Gm-Features: AVVi8CcW-L7vrM5Bm_e3_mA7DiL0CVsM1LDa8FwSzsOcNktoquvN-pr6tbwgp5U
Message-ID: <CADSE00+1m1ASzJzefO2bLuMYAJa3kSmW4py7Qng70VnZSUv0sg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/bridge: release panel reference on all lookup
 exit paths
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,intel.com,kernel.org,ideasonboard.com,kwiboo.se,bootlin.com,samsung.com,amarulasolutions.com,oss.nxp.com,pengutronix.de,nxp.com,crapouillou.net,denx.de,agner.ch,glider.be,bp.renesas.com,rock-chips.com,sntech.de,foss.st.com,sholland.org,iki.fi,sys-base.io,nvidia.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-34456-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0BBE6CD54E

On Fri, Jun 26, 2026 at 2:53=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Jun 26, 2026 at 02:03:26PM +0200, Albert Esteve wrote:
> > of_drm_find_panel() and drm_of_find_panel_or_bridge() now return a
> > counted reference that the caller must release with drm_panel_put().
> >
> > For bridge drivers that immediately wrap the panel in a panel_bridge
> > (which acquires its own reference), release the lookup reference right
> > after the bridge creation call.
> >
> > For analogix-anx6345, which stores the panel for direct use, release
> > the reference in the i2c remove path.
> >
> > For platform drivers using analogix_dp_core with a component lifecycle
> > (exynos_dp, rockchip analogix_dp), release the lookup reference in the
> > platform remove() function. The panel_bridge created during bind() hold=
s
> > a separate reference that devm cleanup releases after remove() returns.
> >
> > Also fix devm_drm_of_get_bridge() and drmm_of_get_bridge() in
> > bridge/panel.c itself: both call drm_of_find_panel_or_bridge() and
> > then pass the panel to devm/drmm_panel_bridge_add(), which acquires
> > its own reference via drm_panel_bridge_add_typed(). The lookup
> > reference was never released; add drm_panel_put() after each bridge
> > creation call.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> I think this one should be either split into one patch per driver, or
> merged with the of_drm_find_panel patch. I'm still not quite sure which
> would be the best, maybe the latter?

I have spent some time myself thinking about how to approach this.
Initially I thought about doing one patch per driver as you suggested,
but since there are many similar fixes that are mostly one-liners, In
the end I decided that grouping them would make the review easier and
result in a less inflated series. Maybe merging with of_drm_find_panel
patch makes sense to avoid having one patch introducing a transient
reference leak (even if it is fixed right after and is bisectable).
But that will also create a giant patch (harder to review?). Another
option could be to merge patches 4 and 5, which basically update all
callers, and keep the API update separated. Either way, I am happy
with whatever you decide is better. I will take note of this for v2.

>
> Maxime


