Return-Path: <linux-renesas-soc+bounces-25125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2B9C85E73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 17:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0ABA3B11E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFA925393E;
	Tue, 25 Nov 2025 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkKcdiR8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FFF1F7098
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764087249; cv=none; b=s1pdrNtCyompNEBj68CCjp0Ue4y+5JoabAhn2oWBJdsZ6O6fCRzSB11QrrY2F39ES22uxg5mFHipKqhItE7ouG2JkWCrvLlbCTmESx9t2S/aBYj2AqH/TpTBqX6bgIEdDuHTENispOX27Wgl6gEYcPk7jM8aY2JsAm6dbmmZSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764087249; c=relaxed/simple;
	bh=qAc86pFUbSJN7iHKIQNJp1vjBlkAY2LqtEa+tE6XHzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBmaNbfY8SDtjBqTOrlJeWE1BkhmLUt9oeTzmGeLig9QcOlIV15M1+yxmGJUlIoCs1lO4he6cicT8HZv2k+Qh2MKQqhzgmDFsNsWkUHo0heDF4BnZXvUdGJPLmmeK/zdZeeS1GRQ8koceKFOfPA63yZOxeSDm8vnAJ0JfAcL4TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkKcdiR8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461B0C116B1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764087249;
	bh=qAc86pFUbSJN7iHKIQNJp1vjBlkAY2LqtEa+tE6XHzE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VkKcdiR8nWjV1KHTXCBWJnGxUiazzOab/kwvE5IYbG6m0xyi4HKumQ3+RGWDcz6Uj
	 a7chTbe8/7AVuzZq38awT1QG7rVKkU88EAQse+pVDSED70d0yVFZdoq1Qt2rcOmObl
	 dRo+LtZBn75qA7M+PVaFTBx5+MckcNz74dqa3Jyw522WSVvAfGIY27WzAoSqD8HLyV
	 wryJ+cUmGqglPXVIUGF4Iq7Fx0WmRgYGgYu2DAMjH3a5WVGXXh6tTbE0Wt+dc8RXeD
	 ITh7LAp3UbmJXNnpXIbyUJ4dn15D0MpZbcB4o7/5OzJhQuJtOMvuW3hyz2VrQQMIoJ
	 lD0Mb1llp7Y5Q==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63f996d4e1aso6013580d50.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 08:14:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSutAA9VTQgzGqW5X3NFTDSXm4zwCw/676XWewW9TJgiaiLl9qRiwNnGjeyTAsrj/KAMIw15/MBo8m2mxY87qsWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMOotoxW0tKGzE57nGpaxn17lm/KoDfXU7CMc5JHRpt0Cd9ANY
	p2Ch9OmvKT0g2Zay4Ou3yVJLG5Xu8kL4H55PNwGwykERN2t4R+kHShXNVz+3jik98hWbVpCDQD3
	PmOa8aY8hN3mBqmIfmXE3awZefM0bevg=
X-Google-Smtp-Source: AGHT+IFv7JEVIIVvVDywANbCWFoFi90fVPPq64qx041hRYmTTye2SbDhS5D5hv7EmCXcdrsKJQ+lTXduKjXsLF1Wdak=
X-Received: by 2002:a53:d057:0:10b0:63f:aef7:d01b with SMTP id
 956f58d0204a3-64302a3aa3dmr8871189d50.8.1764087248492; Tue, 25 Nov 2025
 08:14:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
In-Reply-To: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Nov 2025 17:13:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=_wTX6H1uKEHRf7Ud1EKUEhTxmTRqZtUKZzergx-8knw@mail.gmail.com>
X-Gm-Features: AWmQ_bmDXNdbMUOreLvINg_modE7PvILqWmU6FhDborI3I0JGNQHaHDUnKbdGNk
Message-ID: <CAD++jL=_wTX6H1uKEHRf7Ud1EKUEhTxmTRqZtUKZzergx-8knw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 3:08=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> This fixes two regressions experienced in the MCDE and
> R-Car DU DRM drivers after
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks.
>
> This series make it possible to selectively bring back the
> old behaviour with explicit semantics and implements
> the old behaviour as modified commit tails in MCDE and
> R-Car DU.

So what's the take on this patch series?

Maxime: is this what you had in mind? Acked-by?

Marek: do you think you have an opportunity to test this on the R-Car DU?

I am happy to develop a fifth version using the approach outlined by
Tomi (special codepaths in the helpers) if there is some consensus
that this is better in the long run.

Yours,
Linus Walleij

