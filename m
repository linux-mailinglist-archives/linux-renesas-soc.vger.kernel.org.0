Return-Path: <linux-renesas-soc+bounces-27022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AB9D3A23B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 09:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4EE2300440C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 08:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E361C3BFC;
	Mon, 19 Jan 2026 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/mtPhXF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247703382EB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768813078; cv=none; b=GqGZ6eXMuKXBDtBe/7qV+Lyl+bnAUJcjMD3Vu3CbxhNTWYlL7QbIpwPlUGZllC4xPYzcUV8873MZVAJ8PzIcw7iH5eZktrI8SeIKm4lK6XicF4v1X+3sWiWtgalP798eQ8IzKAu1eGAuTPVEvrLCVLEGQ0qPEtKxfERgfbesDKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768813078; c=relaxed/simple;
	bh=eUIdkUA5rSHUc/16jWwY/MLc6uCqT0F2f5ANhd+0ZMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/NcbrmKFjQ+lWvkovxuIehBkBlP2sOEmrHFmmD5K4onP2KbS5LAwNzBZA+WHMwIhyaFnH5PUKB6d7CAF7Qltefg81EyUgwJgFvlmgyOLAyON1S0Emo4B+8qvvmaprWiQHfv//xC5IDlyo7xMomK0anLwaRLaZLWlKOrH3yqdQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/mtPhXF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC623C4AF0E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768813077;
	bh=eUIdkUA5rSHUc/16jWwY/MLc6uCqT0F2f5ANhd+0ZMI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i/mtPhXFXtuQOx4GTYTOhellOiwIMNlHGM78B2WUjRqymYwTUeL2i8p2l0da/Sf5v
	 Jw9h4qwOA7OtI672KQIJ7lekPY7xvnZjLVv9GaQmNfMeTNlrjG7qEegGPXf5+Zql+U
	 GNMhXpSfl1t+0cIFkRZSAEFq+q+hWh3tq3KNbzazrpdQnm/u1949R5lDfqG0WjhF8E
	 Yp2jpskWoathBbQgI+dkpyF45WoOgmePAiTbRrbTSWFL5b+a8ABa+1yAXm550OKJJY
	 k2+h+ZEpWcWE18+r9Aee9pLmYVET1ROtnOJ4WYzsbXFDRPb9qkAkveNONEh28Bsx9o
	 04FlmXVquVJLQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fc3572431so42300507b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 00:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVX3itxJ7ZQtsBY3divxHNfrPhmfDDTQnHHeYsIKFozwTj724D2eaHVl3hxb9KOzYhncgbASvWaMFbb5a6wgCYTGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL7wNYedWs82mXrN7OkfWgVuxLI38ghiTAUiKm2lBIUrrRAcI9
	Ik3nZyKp4/fUlosZVy7s/foaV/y+5FxpBuIPUh0JrHwyBpg3zY2BKyCE2r8nxeJetvUy34CccBG
	hJP2pRkGXvbVvhCrsILZGAf6aMTfRxVo=
X-Received: by 2002:a05:690c:e3e6:b0:793:c8ab:8bc5 with SMTP id
 00721157ae682-793c8ab8bcbmr75254207b3.46.1768813077137; Mon, 19 Jan 2026
 00:57:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
 <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-4-e34b38f50d27@bootlin.com>
In-Reply-To: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-4-e34b38f50d27@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 09:57:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLmriwfBaMKGP=-pOZyCnHZt78RKKURmOXuyNSTZz5geWQ@mail.gmail.com>
X-Gm-Features: AZwV_QisP2RcYqah-7gXatWhtjOE-lesyGnKBPPcwA2KdgqZekYhuvcO0Ej5zQQ
Message-ID: <CAD++jLmriwfBaMKGP=-pOZyCnHZt78RKKURmOXuyNSTZz5geWQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/mcde: dsi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Edmund Dea <edmund.j.dea@intel.com>, 
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

On Fri, Jan 16, 2026 at 6:33=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> We need to handle the two cases: when a panel is found and when it isn't,
> even though the latter is not supported. So:
>
>  * in case a panel is not found and bridge is, get a reference to the
>    found bridge
>  * in case a panel is found, get a reference to the panel_bridge when it
>    is added, so the following code always get exactly one reference that
>    it needs to put
>
> Finally, use the next_bridge pointer in struct drm_bridge in order to
> simplify putting the reference.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I do not understand the change as a whole but the approach
looks sane so:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

