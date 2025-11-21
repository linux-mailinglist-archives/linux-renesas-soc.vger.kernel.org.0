Return-Path: <linux-renesas-soc+bounces-24943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A1C7A12B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 862233441EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B94927AC41;
	Fri, 21 Nov 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9IpAzoB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FFC258ECB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734113; cv=none; b=bL1iTG7YgcWCCmEVTPKBECBI2v4XaaSrttlQZruJQaUMI4TLazzaIwPRGZF+Qa57NkdOG2uhN+39rDL2cz/C4do/TLl4nciApPY4sz8dyeAlyYVf1b/vNtrtY+zCUyoZW0ZCVEbU2yDgBhj7eR5G2U4bpMZjO+OrPgEi5pLTCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734113; c=relaxed/simple;
	bh=0fCbJXVaRsjMjtguRu/YsukqpYHe/AkvAEGzOZNdCgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppYHziRVKU2X0tI8au8E6zuGJt96MKr1CFJmrO3eWrf5TTx2IT3Uy/l+mHj8ceKRdkoATjSEiz0yK/zBQ73mbG4WH0I72rgobqSpW9qlELFMEzwGOEF3vj8ypn6AhRkyqcmZv9i2sSdvWwEwv9jMVsPWmeEj+Oh7uWHv2lDVjX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9IpAzoB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8F9C2BCB4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763734113;
	bh=0fCbJXVaRsjMjtguRu/YsukqpYHe/AkvAEGzOZNdCgo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O9IpAzoBuVRMrevcA/LP5+FxO+d7THQqqggg2UnDtDZQ7D9SRR1R8DXG3oRqWHdnW
	 n/T9VCkUo9kVuBZr718MbtzS9o4CMjme3wwo94EQRgvdLGDowxTLkkNIvDnB+ZSHin
	 heyTKVZnoH9YV3KGLy9j+a7K/duhiSCiPIpCf6vGq+Pq0rx03lDv2gdWz3w0LuQEcp
	 OrVfEvyjm/Oae9YXK7xNytGNYETnThyIhSjTj0fY9R+GZ+90L8sMeYlklloYSsppFU
	 ehkXwHQDD9Xc/3IwSoLJM7llM1ytFb6AdYsCwVQsKgo73jxVahR+P0nFTvghvg+whk
	 IQIE75xsTvB3A==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78a76afeff6so22236697b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:08:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoNG7wFFmOaEkhVQ3nl7+8jGPSFGAvXBzCFQUD2XIAdjVCKxVU+/EYv8eiNAfcJLHjtkBtJ9kP+GgUFshQX0NUdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykWhrWXOSZtBcJFM8igDxHHBUNK7wqosUFM2U0uyTk150jQK69
	nGuA7CnDohONDHIbXVPP2CB3a1CGRmtDNcNk35FtI8dUCpt08YhzjJQzxi82ho80ju9H4FpYAFh
	AJS1wUxoPgAXU0MkAEWvbufqSZJHwBTk=
X-Google-Smtp-Source: AGHT+IHn5jEsZ0BtZoSto5k16h0MyU6Y6yhqYrPHncjkwNUuqAj4geBqpE3DR4Uk9KNwriieQja2wt73XxPwhHdG6i8=
X-Received: by 2002:a05:690c:48c4:b0:784:f14d:6946 with SMTP id
 00721157ae682-78a8b558e24mr18038797b3.55.1763734112542; Fri, 21 Nov 2025
 06:08:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
 <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org> <CAMuHMdW5SuSChcSz_DvHTBC=CQbaVaHZqRUM=DcD5mz0axrzyA@mail.gmail.com>
In-Reply-To: <CAMuHMdW5SuSChcSz_DvHTBC=CQbaVaHZqRUM=DcD5mz0axrzyA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 21 Nov 2025 15:08:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLm+3=9fQh1bSMjXF0WitPmvCpRRSTac_tiLVtaVwzHWUA@mail.gmail.com>
X-Gm-Features: AWmQ_bl73q8t03jFuPMAfW_tRiVDAo8JLkMwiotfhKXRVPKG6_ka_qrjVQozlrs
Message-ID: <CAD++jLm+3=9fQh1bSMjXF0WitPmvCpRRSTac_tiLVtaVwzHWUA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] RFT: drm/rcar-du: Modify custom commit tail
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thanks for your help!

On Fri, Nov 21, 2025 at 9:52=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > +       /* Variant of drm_atomic_helper_commit_modeset_disables() */
> > +       drm_encoder_bridge_disable(dev, state);
>
> drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:555:41: error: =E2=80=98sta=
te=E2=80=99
> undeclared (first use in this function); did you mean =E2=80=98statx=E2=
=80=99?
>
> old_state (everywhere)?

Fixing it up and sending v4 FWIW (we still don't know if we go this route).

> After making that change, it still works on Koelsch (R-Car M2-W),
> which was not affected by the breakage.

Recording this as Tested-by!

Yours,
Linus Walleij

