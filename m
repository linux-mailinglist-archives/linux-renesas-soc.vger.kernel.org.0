Return-Path: <linux-renesas-soc+bounces-27783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O1jHGw7gWmUEwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 01:03:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FCFD2D28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 01:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 721CC304EF72
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 00:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6601D54FA;
	Tue,  3 Feb 2026 00:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwrsY72R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1FD1AB6F1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 00:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076842; cv=none; b=dv9x+WX1XSx3ij+leDaTUPmQA21qJIo8l+1W8Iil0GR7KI9qobQEF34Gn9NUaihhovrHR3l0J9pKPwsOfyhj0qNOesw+3JiAerxmw6NuQEOBjw257850IjlCxN6ojFcu2r3iOPRAiMIonh2dOC2J2mL67vSBroU8kW1Znoo1wRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076842; c=relaxed/simple;
	bh=WrPPs8WcaSvfdv5rnIAyJY574BdkZCY/wzVTg3/Q/hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/YUPD7nRmmh6m7bf604EOvd9NyZ3IE0NOINHMGIcjEemI3MW+tn00qEJA2JOv9OaMg0x4vpgwYSehk+f8zfTCzp81th2drQR+j+jiPA1cDALF9I3pPApxMPGCLE+UzVmVmieEHnMORZr52Mx/eso/ex0FZRPATLQrTUTFV6+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwrsY72R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FABC19425
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 00:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076842;
	bh=WrPPs8WcaSvfdv5rnIAyJY574BdkZCY/wzVTg3/Q/hg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dwrsY72RWvnbLmq45P/u9xVB7r09F5KmuvlEenvFLWEZeiO1ChAA4JcaKZrVgH9Js
	 bCnmYXGxkIqFx/rTA0v6oagewV0VtZZ/hfEkpfK+VyMGtmnFXX64v1NGSachg2ogFm
	 fX6l4n+o8zkkkAzORwDiBNeOpKOO07KSLyABCYY1QMk3WrCMKYpCRBTewVqLVvkwL1
	 Enfb1K4xK0UpJqJgPVNeSSaRiRIfuyyHUha+0/8L85ZQtrTbMQF+XjfNEgQN48/kpU
	 b9rzhjYFB9ib0Ye+bOW2OcXvx+Lzw0HHX19SX/d233ds7a8CszdQltvyQ66dh6yoHW
	 pwUHB04NdpdDw==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79088484065so46661307b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Feb 2026 16:00:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQ4ix/GFto/5xIvwLtX9Wiipd112yV7xXqBPNtMY004yDrjlxNtqWHzwW3JFiV3uhC3Ab43sx34250E7DnY2m6oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmioYkjB0gVAW3FsFRgo6XRL/IzTLrYuqwh2UJZXIXu/eigRQZ
	5rLw3zmP5+ssEsO35yYhzU1jixcpu58QFG2tfPfhpYhcmC9bIcIafJ80wi6+EQpixxM04+KOu+4
	1XiZIFllIWHHGuJVuJ5afho7POBLpxBU=
X-Received: by 2002:a05:690c:c3cb:b0:788:201c:a170 with SMTP id
 00721157ae682-7949e017673mr195191607b3.42.1770076841683; Mon, 02 Feb 2026
 16:00:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
 <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-3-e081bcdc1467@bootlin.com>
In-Reply-To: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-3-e081bcdc1467@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:00:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLnbXyCK+iY8M=tMTGvsSq=Gg5mxiqyGAh6NKOyVz5tzeA@mail.gmail.com>
X-Gm-Features: AZwV_Qh6fmiQ2UigTxCTLDFtCigzUbALA2x_oLrz-IzstcPkob2SbnZ13_CAUOc
Message-ID: <CAD++jLnbXyCK+iY8M=tMTGvsSq=Gg5mxiqyGAh6NKOyVz5tzeA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/mcde: dsi: mcde_dsi_bind: break when a panel
 or bridge is found
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27783-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2FCFD2D28
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 4:58=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> mcde_dsi_bind() has a loop over all subnodes looking for a panel, but doe=
s
> not exit when a match is found and only stores the last match. However th=
is
> will be problematic when introducing refcounting on the struct drm_device
> pointer in a following commit, because of_drm_find_and_get_bridge() would
> get a reference to multiple bridges.
>
> There seem to be no real reason for looking for multiple panels, so just
> break as soon as a match is found.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

