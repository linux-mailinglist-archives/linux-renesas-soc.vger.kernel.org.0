Return-Path: <linux-renesas-soc+bounces-29118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI0MGfXZr2kzdAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 09:44:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 045F8247861
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 09:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC03830DEC1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB9A4301B8;
	Tue, 10 Mar 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTvciSqq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C305430B84
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132140; cv=none; b=DsEfg6QVSDTJB3XadRFO8Ovj9I5H2/oWcC5Kz+p5gjH1iGjnwOl2U0x0JEV/Ftogw452PFK90NYKwn/1rXpoRskC9F8bqwvgr0qYFtF7Obj+PatjLGrOT67d4FX27iUgHtKWh+5uP5LLRhCw2yiUa5M0fHc3cIxwV/ZQInimnDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132140; c=relaxed/simple;
	bh=+hdxOVwm077ylsjLu0wR0T6SVFeW4T69FussqsDDRHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNe4no7rUWWTEn+TeqWnHg6W8KAcZ7tXbMdkzn+Dd68tjATDc2y+FAUfibpdUN7WOhwoOqFsFbv3XbmEOwxL3y7VmSXTdpjjYnjsQyUwiJPwHk/Szd+RrfGhB/XDas2Xze3hr8TnqohagS8Mh6ao3tw/gJJRq3dS1PaB1m9usbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTvciSqq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F66C2BCB6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 08:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773132140;
	bh=+hdxOVwm077ylsjLu0wR0T6SVFeW4T69FussqsDDRHA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=GTvciSqq+x8/zCMOtuyLli8n1vUX944BWGl817kV9StHpWn/ZCnegugKuRQsP31zc
	 BzAgQT7AReGa+w9FNTeP0MAZpzB8BrfJNqjl8scrI0LyBvBQY7rG+irphiVi9e9Pay
	 H9kcdpBYkJtzeYMnQcffp0/6DqalOD85Ero6OlpmOhuOcyq6hlw5qVhAebzG2/YIXB
	 DnMhuDw8gGVkaM59hP3I087c+z0UZ4KsUJrbnznXy+njrrp6YDnmMQ++sMxHFuRr6G
	 HFUyohjET/eAy2mVYsy+9Qp1f3+sfdypP6FF2U5DFevqkN4m7+QA91ws+sAjszCwIj
	 fWqe+XRjm8C8A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a13d6a2d7bso3429656e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 01:42:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzAvuQ0NitBbqE8Iw3orMns0cHSMZ85M/QuMy8b43RAllapREjXYczDWFge096x4DCFBxdIkLwuw9OM8eq0BqlSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQ49oo+1YUeRwO2z4Eh9K31b/fBJ7Jcgd5RGdGr/txbKskTOA
	fEMF8KNYmpe7xrFOIaGj3laJUSVjaP/dkPt0tnUmMBNO9t2z0T24Y4SpNAyGq+AujbMLpbYPgIp
	R3M5oYXuKb26+704ImM2mHPYpgQcVOGA=
X-Received: by 2002:a2e:880b:0:b0:388:4329:c054 with SMTP id
 38308e7fff4ca-38a5d04ed61mr6094121fa.15.1773132138304; Tue, 10 Mar 2026
 01:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309190842.927634-1-vladimir.oltean@nxp.com> <20260309190842.927634-22-vladimir.oltean@nxp.com>
In-Reply-To: <20260309190842.927634-22-vladimir.oltean@nxp.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 16:42:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v649jsoT9Uw5=gg5Zzxmgd4E04f8B8St_vUseP3JOrGG5g@mail.gmail.com>
X-Gm-Features: AaiRm50ffNFGTkd49hJolMVvUoYaIAAtO7JRlAyrrCfXMo0y-iPLjdkpqATmeN0
Message-ID: <CAGb2v649jsoT9Uw5=gg5Zzxmgd4E04f8B8St_vUseP3JOrGG5g@mail.gmail.com>
Subject: Re: [PATCH v3 phy-next 21/24] phy: include PHY provider header (1/2)
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 045F8247861
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29118-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 3:10=E2=80=AFAM Vladimir Oltean <vladimir.oltean@nx=
p.com> wrote:
>
> The majority of PHY drivers are PHY providers (obviously).
>
> Some are providers *and* consumers (phy-meson-axg-mipi-dphy,
> phy-meson-axg-pcie). These are the Amlogic AXG SoCs, which split the
> physical layer into two chained PHYs: the digital layer and the analog
> layer. The DSI or PCIe controller interacts only with the digital PHY,
> presumably for simplicity.
>
> The rest of PHY drivers which include <linux/phy/phy.h> do so because
> they call phy_set_bus_width(), a consumer function.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Conflicts in drivers/phy/canaan/phy-k230-usb.c with commit 8787fa1da603
> ("phy: usb: Add driver for Canaan K230 USB 2.0 PHY").
> Conflicts in drivers/phy/eswin/phy-eic7700-sata.c with commit
> 67ee9ccaa34a ("phy: eswin: Create eswin directory and add EIC7700 SATA
> PHY driver")
>
> Both drivers are newly added in linux-phy/next and not present in
> v7.0-rc1. The recommendation is to drop the changes in this patch and
> readd them when merging into linux-phy/next.
>
> v2->v3: add conflict resolution details
> v1->v2: split in two parts to pass through linux-phy mailing list
> moderation
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c                 | 3 ++-
>  drivers/phy/allwinner/phy-sun50i-usb3.c               | 3 ++-
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c           | 4 ++--
>  drivers/phy/allwinner/phy-sun9i-usb.c                 | 3 ++-

Acked-by: Chen-Yu Tsai <wens@kernel.org> # allwinner

