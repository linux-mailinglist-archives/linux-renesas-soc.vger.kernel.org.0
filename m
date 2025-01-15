Return-Path: <linux-renesas-soc+bounces-12170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC1A12619
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 15:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A8901888110
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 14:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E187C78F44;
	Wed, 15 Jan 2025 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="oG8rU6C7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F06B41C6C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736951680; cv=none; b=JMzO3SLgLSnq5f7jlu12sZcViXcsJWarG40iwGZPwgnJZLDwmu8rAeGEwrPex7cYbcmYj9vDgsIQKibCIylILPnN/gNVxzfc8M46efX6quoF4pr8oVIJzK5m3KUSRZHzUQPNCg/bLeFIkpOr7dYdTErjwUywJFVqQCO8iYXvHzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736951680; c=relaxed/simple;
	bh=wgpCbUXuk0fjx7PlpFBa3YSbnvvXmj+DNx/eEdB8F5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stiCbmpCzQxEtXmljQRpbSrc4jcVNIzDLCsLN3V0HvSINKw08SjlBKCA4yZIh/wFWPDkA04oRT+MPgPNo2pxN8zHVV1x3bDYXd/DkHra7pebWep/qLoVgBp7R0NngLB4zp+0pxzlsTvzO3GFBEVgVwv1VEt9nevyR3VL2eo/c/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=oG8rU6C7; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d92cd1e811so8074846d6.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1736951678; x=1737556478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wgpCbUXuk0fjx7PlpFBa3YSbnvvXmj+DNx/eEdB8F5M=;
        b=oG8rU6C7AeXdphOpn5qywnwajKLel67+fgv9teTt33rFV46pmyVN9eRZXUiuo3gLYP
         f62u/PhVmd69sOprj3jmW4qAGGtzYKZ21cQC4IjiwjlTz5/YksFFLb+UBrCN6rdkxBUt
         fAd4UUzGBGTrUKgJh2tcVFs7+uEdRiVqN7VulejG3b/alA/S1MDA3xB9CdQfolmAjMoK
         k2ED9dapQEqwpg8XOjfn3Qzt0E/5lWo6C8m1Ctcvl2RgPmi8azT5cEuCAUajt/ae+kcQ
         6HIUzvFtq678JxdKsjJmeAm7fopoflOzHFRMjemsG7g6h9Hh/YQTDQyuqhUZJhD+33Qd
         1qDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951678; x=1737556478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgpCbUXuk0fjx7PlpFBa3YSbnvvXmj+DNx/eEdB8F5M=;
        b=omXD7oxEX8Y6IXDyyJPmC8/7QDXEP5J9Uq8ibjY2dBzAAHzq5lldbnLaJtsPTamoda
         cJ0u5INHYxStU6R1kpv/lcvxDpr0uLH/khxZFLD9Kyc1BEkrASlZ5GTmvHIO2N5C8t4P
         2ASboK3UBihqDAJCxbzKFIvQZqLrwYzGxoAE9Z/vyy2MSxK+ctb4v/gz575TPX7znJSl
         J89fFVwmOpy0EtXUtb0/rqUhsUaVE3FBOkFDD+M7WrJGjS0oNOqE1EQ299pc/zgfAur2
         SNHrgnW2+PkmvNQYI87fB/013YwEZ23z/iYCjlLe2ExDkC0a9OuH9xmCsemBfiUTsXAA
         znrw==
X-Forwarded-Encrypted: i=1; AJvYcCX+lQqdXG/fKHE6vLEJdKl+LXn2wR8X0wTPJ7rgpndKBQxFgBJR92ni9RFzOgdmM0AjyJmVI7P7L9EYh6qjS8rzww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWxAK9Ys3UfjVmDHMYNiPUd/o7zrIJHDFuCgv7NGv2j5xNK/Eu
	7eZ2lqoMj0RxxvRhV2fNWf7BZGY0RB5xmw+qk2t9uOtmjHznjW3I6w9RpoOJ9E61MyCEpQTAHMb
	Klg9rih0JAFycHU1IO35Mk3YwdwmBfOPsDnp6GQ==
X-Gm-Gg: ASbGncvJD0wq8WmnKV5nS/EsNantk564E3b9QicatNT6qmRSN17vOK324eEU6FL4jIK
	xOD3WALBIQsV/TRMV0EizATrYqIqa3vsZwu8=
X-Google-Smtp-Source: AGHT+IFPz9fbMcvhhyZZGYYuWLUwXCRTy8s+kBCbi69J2hIRU1+TB7begqOpM0+xy1s6GqB+nx1X6ZJAR0totDSXOwo=
X-Received: by 2002:a05:6214:486:b0:6d8:e7c9:ffa0 with SMTP id
 6a1803df08f44-6e192c73ef5mr43851476d6.19.1736951677902; Wed, 15 Jan 2025
 06:34:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109150310.219442-1-tzimmermann@suse.de> <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com> <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com> <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com> <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com> <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
In-Reply-To: <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Jan 2025 14:34:26 +0000
X-Gm-Features: AbW1kvZOqZIfsgr5MQqIuf1jKNJtcUmkb-2ddanRpBEhDxEw_Wl931RGN2rzkA8
Message-ID: <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> No disagreement there, we need CREATE_DUMB2.
>
> My point is that we have the current UAPI, and we have userspace using
> it, but we don't have clear rules what the ioctl does with specific
> parameters, and we don't document how it has to be used.
>
> Perhaps the situation is bad, and all we can really say is that
> CREATE_DUMB only works for use with simple RGB formats, and the behavior
> for all other formats is platform specific. But I think even that would
> be valuable in the UAPI docs.

Yeah, CREATE_DUMB only works for use with simple RGB formats in a
linear layout. Not monochrome or YUV or tiled or displayed rotated or
whatever.

If it happens to accidentally work for other uses, that's fine, but
it's not generically reliable for anything other than simple linear
RGB. It's intended to let you do splash screens, consoles, recovery
password entries, and software-rendered compositors if you really
want. Anything more than that isn't 'dumb'.

Cheers,
Daniel

