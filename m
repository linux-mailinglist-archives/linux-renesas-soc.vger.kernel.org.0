Return-Path: <linux-renesas-soc+bounces-6083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76A904274
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 19:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A406B211DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 17:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3069925776;
	Tue, 11 Jun 2024 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ne1WzMar"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878DE111A1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2024 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718127237; cv=none; b=IuzGH5bRrroI2alhudzrR4qzKJXl40/f5gc2IdCH6s/YflcOYs8lcLS8gBuZIVng1jVTLIKbSlOteMeZaZCTlLMJpzgh8KxQ/jvcR3946CvqGtHOvPdcSBM5grVEqxnj70VbMEyX//fKccPaJ3L58a+oyI++NE4EE99/+9Scytc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718127237; c=relaxed/simple;
	bh=5/mmdbKOzKAv/6BTVb/GG3HwqN77keujb5fkVQR2GQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7Dj/d39qJgPkVBr/rz/swyIBZrAGRY238VzX2KSzPKtUq+o19iacV9a7ay+nEUftKjOM2zntJO5PMA+PYi6oUbfmKD9p/i97D7Zt8XJFo5YKbjzRm6H6mpLeW4qgEYWJZwnAXu3z1PLsw4dWlE1+YG3scdaS1onmX5FK0//KEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ne1WzMar; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a08b1a81bso60170167b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2024 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718127232; x=1718732032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbtkdbgCU8Tr9b8WsS7VgfWbCUiNhQDh9AT/ShV3toc=;
        b=Ne1WzMar9CU/dqw0DqKBEfRRr5GjdRrX8DdMFnNqOvQWCDnnzAcVaAmdp9RK3uHBJI
         WriJXGqpSt0EkpGv/oxcWVvK5/sgmMXDT52vlM8eVFBFboko/s+mc/mVLem3DdJTChpo
         cTnYJghvXZPdls07M9bDQESehSUsFLWb1+jws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718127232; x=1718732032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbtkdbgCU8Tr9b8WsS7VgfWbCUiNhQDh9AT/ShV3toc=;
        b=afUZ9kEUFlO+nJJq7V6htAkTRBBugoCnfIwEa2lAfnrVHoE3Bp7bfd1pupE7jZ5gzu
         tSlwrMnjdBB5vcfXS96Ztg5iRKLuethL9LR5ay8ySKlHpacfEAZSpf5SGR0f1Mf9elik
         DwAhhmDeYIx3X16SBZYpfEpfcsjJXf/Zojd5dM9wMHOBxwBupp/TnovqLSlnQnsl6w7O
         LaLQr6yiyEIVpP3c2UcMlISVjDcr1k+lozG9oIm3JwgOFBOoWGIg0+mdWTxohqSjfXT8
         gVjrZJw0QMaiuyb0bxKR4bh7l7jdGMDqSZ0iPlsWTYqzlsGEdQGz1mdSCFHetGhsFfgu
         Hklw==
X-Forwarded-Encrypted: i=1; AJvYcCVxPgk/qHpno1PBH3r8k8xkE78a9pFJGynUKig/biuDlHjvMRYE8TKn1D872Dk0cx8m1uxG5UIUqTyRM/wRMhBHLDU/Wf5LYgR5X7jjw9x66DE=
X-Gm-Message-State: AOJu0YxOCTbMgcB70VGOX5dBRnnQ8HmP01z3xnTbHleJm1XksK/KBQFz
	83xbp063Y1kw1LEUaserOejGDMSl4TruCzgNsv1dG7KSTj76zeDsPDF4GxR1f43wX8uTqaIcZBw
	=
X-Google-Smtp-Source: AGHT+IGa9gZ9Znz+E1Br/cp94aH3g1hFUZgkk5l2VH4eGJL1ALu8iDGFGxflPTNfsOnFy9YwJphp7g==
X-Received: by 2002:a81:84ca:0:b0:62c:c5f2:18a5 with SMTP id 00721157ae682-62cd56662dcmr134204957b3.40.1718127232082;
        Tue, 11 Jun 2024 10:33:52 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b0869d137csm15144426d6.64.2024.06.11.10.33.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 10:33:51 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4405cf01a7fso12061cf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2024 10:33:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBLopYPgWPyZDSJ8R0lk816ApjKr4gGX7CnzrA6vT42Bpr8aw6F9nkjegiVmTQV3v7toVfNEa1mQwQhmLJVdEfzIbC+xMzMvcImBk4jxRK1Aw=
X-Received: by 2002:a05:622a:191c:b0:441:5400:9ec5 with SMTP id
 d75a77b69052e-44154009ffbmr2778961cf.1.1718127230079; Tue, 11 Jun 2024
 10:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6ae804c7163b4d933dbcf940b8dbd5f4c961f037.1716984934.git.geert+renesas@glider.be>
In-Reply-To: <6ae804c7163b4d933dbcf940b8dbd5f4c961f037.1716984934.git.geert+renesas@glider.be>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Jun 2024 10:33:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VCwKaN8gmJ=CTx561t_OpAZUEgDQV-95RmKPL-M8+4=Q@mail.gmail.com>
Message-ID: <CAD=FV=VCwKaN8gmJ=CTx561t_OpAZUEgDQV-95RmKPL-M8+4=Q@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 29, 2024 at 5:16=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> From: Douglas Anderson <dianders@chromium.org>
>
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> This is important because drm_helper_force_disable_all() will cause
> panels to get disabled cleanly which may be important for their power
> sequencing.  Future changes will remove any custom powering off in
> individual panel drivers so the DRM drivers need to start getting this
> right.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case of
> OS shutdown comes straight out of the kernel doc "driver instance
> overview" in drm_drv.c.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c307a=
6192efabb4cbb06b195f15@changeid
> [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v2:
>   - Add Reviewed-by.
>
> Tested on Atmark Techno Armadillo-800-EVA.
> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

FWIW: I've created a patch to list DRM modeset drivers that handle
shutdown properly [1]. For now "shmob-drm" is not part of that
patchset. Assuming my patch lands we'll have to later add it to the
list.

[1] https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f=
746b93621749c@changeid

I will also note that the subject/description of this patch could be
adjusted. They still reference "drm_helper_force_disable_all" which
should have been changed to "drm_atomic_helper_shutdown".

-Doug

