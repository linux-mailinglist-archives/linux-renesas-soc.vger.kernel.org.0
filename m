Return-Path: <linux-renesas-soc+bounces-26732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFBD1EBCE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 13:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D662300663C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 12:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FDB397ABF;
	Wed, 14 Jan 2026 12:24:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96510397AB2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393490; cv=none; b=pJC8XNTl+22KQoma9nvcfyXv0B3GeQWbjYHHGKKMqRG02qhuUVP6w/DM/+4BE2ljKCEjD4tiDMro/j1VVJmKKM1YPrs42mQK8pmRIDfi16wwZazhrQXq3uONpA6k3yXUb6CUzn8ACfy+00/Ff/D7MFJcwty/5GwvrlGglRa8afM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393490; c=relaxed/simple;
	bh=w2SWEURfKBz0bwwAwkZCgLtw40Isa8GTATbHUjONPg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xk6TBdmkEGmUyX/yQCRrGcLLuJe7A8g5QjC0vQuOuoOjKiIU3DnEcMcfcEEsFc+iFccKFdvPpmJ0cyBjhXzEWSrQvLTu7aU2t5g7my5TITSjecOypF15koyN0VUnI8OxPUF+IVrbTFTAKkA7g1Hgg/fcMSlgqla2ziVPKEEDX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5636f0cf5c3so3413675e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 04:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768393486; x=1768998286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPnBQEyeWBOms5sIla2SSLSuUnKgu8H+Zu07ilyLuCY=;
        b=vv/AGFzJzxHIJvJekN0J7MuUrSySA/PqRTku754O75xKTGv0JDj6zR/iY8YmjE9TzD
         Y+bPdWx+nbz7TbMFbs1JETndBsGV1GPq4yO36Lj/ORkpHwyry+n0V98gG60JnLOzZAYu
         FdPjyhLvt4TUcoEwmn9rjo91CgmsM/NkwjX/2zcCicvPOBVCGHiKxSIQCZjUt2llPiPh
         rTdleDwE/oEa40Xmw0/qG2MG/8AlYmAAvOiKhmGhFYUQIvd7Xw103F7a2vUEOKaBETN0
         8bOWCI1vfNiJPNeS0TnIFvaYoWxBqcyshCYsFD6aDFomkmAxs6Azpkvz3zBqSoX2FDZC
         jKbg==
X-Forwarded-Encrypted: i=1; AJvYcCVT7Hcyg+P/c5ssBtKl6O4NYpgDJnnoCvCd2zOzdTZ7yUIu/FtkBVo2SrT9Gi/eR4RNEmYhLlHKRhvzZthKRxBpNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYsWuLorfm1//75wso3U4f8dLdQAv1vXcvPVMDVFtcoO1dQH0Q
	5VxiGKLpBLzvzjmhoxz4Rv4U7rJdM0UkrtaZNg5k6/qeXXvjRzEZMKxigGuuqopE
X-Gm-Gg: AY/fxX6IWeqOQBZHQkcJ4QiA7VJowMPGF0RU2Sx77Xf165idwAAgfXUnEUCM9CZIgMk
	sICGVCXdvXqE9pDkD1CJLBax3lHZsC6cHuQeWeossHWmXsAmM81hdS9U35MYrHs1uYVeV+eQ3MS
	iDRCE1NqyMhfxEJ0OJQCXDHW3GXuOTDYeKiXF7T8lgRMXfWbP0GM9V2+rFPQLux4Q8mP+U9z7qG
	7I6k8mpLrV/u63nraD809a6R095QEFoz9yFpiu6DGZ7rwvx7KrjJpEnZI74+kEpsRSyQmHWRztV
	CpAOPkBS9f/k+ht/zDeP2O3JKtrBtBz09pBZzA5W4OtQNgPNwYeCdsD0/Dd9/dTiWKOZVTxltqU
	h4wC2ZJrZmalJvBKFM+psLAbbkAnmb04GMCqm4SktbbGIYi955OXKnTzHTfYFLeJix4IqAscAom
	vbO4o6CcZ85fhhJgI1K2a/DTTF42GQqrVBaG4JxcPBPV88rAtKpgzY
X-Received: by 2002:a05:6122:3c87:b0:563:60ce:9d53 with SMTP id 71dfb90a1353d-563a095a153mr962509e0c.9.1768393485985;
        Wed, 14 Jan 2026 04:24:45 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56375cd7cd6sm12280923e0c.10.2026.01.14.04.24.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 04:24:45 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-559f4801609so3284911e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 04:24:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWLkEoPSLc4n1L9hF6NOjQS86CkzWPXumAQ9IFLN7FsoNAMfhq/iJKdHuhkxi8lsZc7m04qPy6H+fJ0yXXD2Zouw==@vger.kernel.org
X-Received: by 2002:a05:6102:3f12:b0:5ef:b0d3:295f with SMTP id
 ada2fe7eead31-5f17f4045a2mr981972137.8.1768393485227; Wed, 14 Jan 2026
 04:24:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763638659.git.tommaso.merciai.xr@bp.renesas.com> <9d1cf2cdb1c11f24378404142e4c8aff680c6961.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <9d1cf2cdb1c11f24378404142e4c8aff680c6961.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 13:24:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWf_kX0nokg_CVWdb8FVsgW_5nYAOLp9xA-cL5FcaRJhQ@mail.gmail.com>
X-Gm-Features: AZwV_QhYgKxrCjqzp1sGfk0YsUT5meGZG-9hjk5Ki9UznzjaHJDOa63FHH-zXOg
Message-ID: <CAMuHMdWf_kX0nokg_CVWdb8FVsgW_5nYAOLp9xA-cL5FcaRJhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, wsa+renesas@sang-engineering.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Nov 2025 at 12:52, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable I3C on RZ/G3E SMARC SoM.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Dropped overlay and moved I3C support (pure bus mode) directly to the
>    rzg3e-smarc-som.dtsi as suggested by Wolfram Sang.
>  - Removed alias as suggested by Wolfram Sang.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

