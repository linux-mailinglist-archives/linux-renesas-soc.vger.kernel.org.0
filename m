Return-Path: <linux-renesas-soc+bounces-24896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A6C76554
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 22:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 8E6F22A8B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 21:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295F72E7BCB;
	Thu, 20 Nov 2025 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Teso5gjf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037C0253958
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763673019; cv=none; b=BgEzAb5KMvrSy0WrJ0CZb7psY1XDOwQu2GGsS0jrJ78kyPCsnin/0spOf8rWzvket6IS1juj4FN+swHva20Itb/rhaB7Y8Yzv9B/+LuiFiLGrL07w+rxPil7WtCuLUGmzpMGQWM6DnCnLxwStZNYR+3xJ2iSviAUzvjFH+T5NXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763673019; c=relaxed/simple;
	bh=TO5ZlSYR+vXFAZTLgdO27XZTNfldjtuuWh045oi2yvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ/Fub9L/PTavdOdXJ/CLvGGkaXyie2CNw/1p7wucR6d0wo/umvGr5QHH7kAM69NPIdD7ZtInY/syxKPRLP+T38epTOVhcCEFOEhI8Zi3IPWApXW50nzJCTGBEsJ//7hsdxcgh9qI7AMjngVFrfgEU2T17usGLaeW4fNmqXcjkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Teso5gjf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED59C116B1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 21:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763673018;
	bh=TO5ZlSYR+vXFAZTLgdO27XZTNfldjtuuWh045oi2yvk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Teso5gjfcmDobRb9H8GajE87+VDUCO75k+p/SS7mx6NZLnt8VAX1ICqz2s4GeYMzs
	 35T7dZoj2hrX76CKpPdd0pk7s09z0pGkRhYIOcqAdP0UPCEdFaZzZwKhxKkSoSS/rB
	 htSVHmYcX5QDlA3gJadtlm61XRsfWqdga1+J8NCA+nRtCoLFvqzZdE8GHxgDCV97De
	 26r8dlKSZcoxBPjwduF0OGBGIV6lg/yJmPeqIGbSuZrnjWhS7uJVWgUwYmXOX3ZIR4
	 TWWCl+5OVE+aXT9bq5ott7AAih7scENNd3y1SdxYyG9mzdDDzlv30h0ukKCzjBl/N8
	 QpGWosf0jjs1Q==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-642fcb9c16aso699163d50.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 13:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPxwxYiT7jyE1CpwAk67S4F7EoSvzmz+tzscHzPec3gYILTMxku4KcJjcZE5jJpITkoRA+rjxuuSjDyOsn+laIBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb9WvlOiiaGKFEwKWTVnD2fytLB/52I1NXBHX/KoUm9KY8aRko
	qpjJtj4JxTBjXbU2P8IAecrjuh9VYeTecSQw/iGVeOrjq1IAVdPH4tT5r7hReC+T2gaji3KYdgg
	YUYrPnOFpf0RgfCXOcenJviKTs1cxQSk=
X-Google-Smtp-Source: AGHT+IEZudifwNOqgis3jmKlimmWAPiJkTPTTiLqjeNfeVyTfv8VPTYcSvS+vYaz9jrIleKmeG3Do8TsPKOS/DIyLkA=
X-Received: by 2002:a05:690c:45c4:b0:786:7a54:4624 with SMTP id
 00721157ae682-78a7955c38cmr81864247b3.7.1763673017764; Thu, 20 Nov 2025
 13:10:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com> <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
 <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc>
 <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com> <tcu23ayvadb3vtz6vksrrkw6rkngofxnhokaa4khat2grnqgcu@ttmqg6illoz7>
 <5da8f176-4db5-4d2d-a7df-23b8047b293e@ideasonboard.com>
In-Reply-To: <5da8f176-4db5-4d2d-a7df-23b8047b293e@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Nov 2025 22:10:06 +0100
X-Gmail-Original-Message-ID: <CAD++jL=c-87rk7_DqvmhBCOnqP7OkygCPhmBrsw50nDMAFYfhQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnj0c8oHH5Bx83BWdy5etdS3VldniUzdyRs563oFevARZgv26EbaPVq-pM
Message-ID: <CAD++jL=c-87rk7_DqvmhBCOnqP7OkygCPhmBrsw50nDMAFYfhQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 6:08=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> In any case, it makes sense to fix these in the respective drivers (with
> some core functions exported). It will get the issue sorted out for now,
> without needing elaborate reverts, and without hacking the core.
>
> Linus, Marek, is this ok for you?

Yes sure, I'll take a stab at it and try to fix Marek's regression too.

I guess I should namespace the next exported helpers drm_*
and export them so that will be a separate patch.

Yours,
Linus Walleij

