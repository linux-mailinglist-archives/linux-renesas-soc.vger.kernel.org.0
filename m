Return-Path: <linux-renesas-soc+bounces-27021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3BD3A23E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 09:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4670D30402E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 08:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F9534D934;
	Mon, 19 Jan 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NISdHHjr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07CC33F37A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812882; cv=none; b=Qkqx5HokxImay/zZMypCD3badEazF1HtBVRTd8tAOWUOPj4Tl9LLhVmoEiFgc6PR8AAjcVsOU0TORzJkOEgxO/R+uY32rqNtcoQgU+O5FSc1PgewyW/Vhu9We44shi6i85ImKqPWM+Af7mNIu2MrtOkvtLXe1lfkiiYNkvexwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812882; c=relaxed/simple;
	bh=AfAFiAKqGuf4s4xS3t6rG82aL2XtowFNMfmV8sPSb4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=azQplKnt8yvZTkcGLRPN5i8AFC6o/UNDA2IBYeq2AToSNb2GWoRK1rOvARosOdG+7BbqQzo0mRGnJSH1G9adrRbFGTfWPj9033FzVsaA/YY3KGZlz++smVSHHQDoVlRbHnbybRRq1yk22maSRBzycjx62jv4XqkJySg+WmTQG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NISdHHjr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A31C2BCB6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768812882;
	bh=AfAFiAKqGuf4s4xS3t6rG82aL2XtowFNMfmV8sPSb4o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NISdHHjrH8h5CDOSzyncEnUY8cPRf27d3DeQzoulmU+Avg3x3HTsdoAhTpRESpqqS
	 0HFdBjPJWMto/P4ZENYva2l9+mOFMi81NwH+9X6A3KjY+ErI0T8bYBxyc6ilB7M/yV
	 Bed6aGnZWrCIZOxfhqShKfRXpzitEthqFOKRuI9yP5EFulV4C/5/aK2xItNq6VXyuh
	 3PFIK4sVzT4ivAAHgdOQjCgRfnCGwRzkXVjZUMhKeA83zBoeUYvAzWOhqIZE19J+WW
	 E9/D8ItKjIBgC3H23v5QtitkOiuZ4bmNrRFOS1Rv+YvSZpYUrtUT8X0uJmrDf2U9fr
	 5OLYIaTxA4oBg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-644715aad1aso4447681d50.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 00:54:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURtCsHHd/JB3pRi4CdmVCyVmFeiQzyxjOB3AYMSWYz8/aYFC5+e8P7r9AG9gqTi9JcowlmXXM9HyUo7n0rWGPdGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1MMNLwSnC3VCnnQO0JabPJB39T0Q/yb7V6ygj7sq6c+VGtH5D
	3+bm2tWi0mB+qDfqUfADHewjVm3xqR7w6XMETeQXfOdj8O2tKMpNbWGU/VLWU8kJjyzrdeTZkGp
	Hrhw04kxh7PATKDfjyRsylsTIvF4rM5M=
X-Received: by 2002:a05:690e:4004:b0:646:44ef:cee0 with SMTP id
 956f58d0204a3-6490a6045b0mr10201129d50.16.1768812881615; Mon, 19 Jan 2026
 00:54:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
 <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-3-e34b38f50d27@bootlin.com>
In-Reply-To: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-3-e34b38f50d27@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 09:54:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLm_Va+7c_usgoPDhsDiCr4NQMZWsQ3iJW5-a1ETP4EaJQ@mail.gmail.com>
X-Gm-Features: AZwV_QiQiCvJPbJl4OoLpqmgSDxUUuEabMx18a-5zdnevAobr9Cg_QY0Ktd2TjE
Message-ID: <CAD++jLm_Va+7c_usgoPDhsDiCr4NQMZWsQ3iJW5-a1ETP4EaJQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/mcde: dsi: warn in case of multiple subnodes
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

> mcde_dsi_bind() has a loop over all subnodes looking for a panel, but doe=
s
> not exit when a match is found and only stores the last match. However th=
is
> will be problematic when introducing refcounting on the struct drm_device
> pointer in a following commit, because of_drm_find_and_get_bridge() would
> get a reference to multiple bridges.
>
> Assuming there is no real reason for looking for multiple panels, add a
> warning so it gets noticed in case the assumption is wrong.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> I think the correct thing to do would be adding a break statement when
> there is a match. However I don't have knowledge of this driver and the
> hardware, thus this patch is a prudential alternative, not changing the
> behaviour.

Go ahead and insert a break when the panel is found, there is
no MCDE-attached device with more than one panel.

There *exist* the Samsung Gavini device which has a
LED panel, *and* the same lines attached to a mini-projector
so these two can be used at the same time. I have no idea
how to actually deal with that if someone one day want to
support it. Probably by putting the projector as a side thing
and not deal with the video stream in the device tree.

Yours,
Linus Walleij

