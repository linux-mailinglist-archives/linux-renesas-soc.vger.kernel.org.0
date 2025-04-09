Return-Path: <linux-renesas-soc+bounces-15666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D78A824D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 14:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF24A19E13A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 12:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB162620C8;
	Wed,  9 Apr 2025 12:26:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9BD26657D;
	Wed,  9 Apr 2025 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201566; cv=none; b=tz+9VWsldCOMCb/RYZMwRZZdMNpirL4ZRswPRm6nssvaQwqVfYnIdGllB1kHc5UPkNY0WNwjcYttlmObH+Pa3+OHQBnFBVHejM/Io/X3lM+H3TZOGhcDX6doWo5jkFnvLsfuKU7kEHgfDKlwHJPyTUlWbA99Fw5n7a2HAK3BABc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201566; c=relaxed/simple;
	bh=v8SmZPkBKtgitgD4I5VqgBozH7bCwR2oTxGY0EkAkrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jt5aoW8vichVxegitFN3+/eDhrieOepmivRbmD+vv061k8hy77O7P4ysuEkjZjBmQ+I3YxYuopvYkCRaiuEsnBoW+zKZvwW2tELbtxihNkMIoinsVlWVS3RAdheqGwKNfHTUh5OGqA+3PdC9oh7l4n87YzaHNekbXYf7ooxLpPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso7947827e0c.1;
        Wed, 09 Apr 2025 05:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744201561; x=1744806361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLofmsDNJz6a8tN2PE/KFwLpm79s5qyqgCo17acWdOg=;
        b=KeiJTmsXJNQxqn2+vbheeCQQ7VB/Tdrhq3xr/m85A0x65EuXcXSlfiiVMdUbiRv7CS
         8BEKZc5B6VMSUMHSZ0JrLAf7f5nNLBJRB0JJ1xn6XLjx4EroeG47LrIK1aIzxcU1vKhS
         IVq7HxYf12nBKbVIPfwy9BTg77H9KGURIfB8YQY0f/zWTKkjYpyHAujI1PfLB1pL23Q1
         nZ4Bo8ckK7vuYNnj91tF7QRUz6ra8yW06D7fX1mpHhGBIv7g7DPRXn2PFL5V80dadh8B
         H6rAADvCF4IkkWBqPI+wsDuizHktIeS5Cw0v1JP2Bi083CKnQowHCr98B0rnO0sJFRnq
         BycA==
X-Forwarded-Encrypted: i=1; AJvYcCV3YbOvqcBrSKRrZ2/PTLrUiNOoOmy1b4kL/lME/iKgpN8zY8yjEs0hcFDwseoesPsYyJB2KnXaB9nmQyDf8WCcDs8=@vger.kernel.org, AJvYcCXq3iAj8+5H3uLRVAx5w1sJbO/4AVKEKsvhh44gNRYHx5OJPzEN7ry1uklSJnsOxQZV1y4B1fXljLrD3lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhPteyzUtj1fs3ddPGvuL4fW9WClQe5+O3ti0zgDUM0+/4UMRw
	AJ5WYI//YzxKPEjgHS3rxvDJ/E8enqQINCaEbpJCB3aEPasQSsab3sbrwKj/GLM=
X-Gm-Gg: ASbGnct0lBhQOAgpcX8grSDmcGDB4mvipiaJ+5C5DSUoJsANWl15UtUklXvD3bIp2Cx
	jkXXQe5QlL5hNaoYykXUgbmHxEu/2A8jncCBKovP/eXKmJRjl4IMMuqJeSFEghZ5X7DOgU3V+SF
	wXePr1+v9l5OF0CRrGTgTR8g6pIK9/55XPpKxgBBGmKeWm85FeJz7Kstolsm5kHDvOxDJdAuckD
	z5CxQ0zpqVFqW4m6n7Cg6/vmXUVUzkUnaX/OauL16206bJphZpKaoWYoBjDjfE4Yl6LUEO3Cdp/
	ahpf7tcYnEdp+7BK4vfOUkLJ3Yp184xocZBTDF3N/dWI7vizQ56Q3V8O7Y1D9KDrR08L8dYA2sF
	sf+o=
X-Google-Smtp-Source: AGHT+IE4nP9sHCqoEfAXKapSvU370PSy1HcdOBLYhOBIcs0kqen14EQ/BiiLz69rp+OLHpMRCpGm3A==
X-Received: by 2002:a05:6122:252a:b0:518:91b3:5e37 with SMTP id 71dfb90a1353d-527a91af7abmr1749779e0c.5.1744201561482;
        Wed, 09 Apr 2025 05:26:01 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4cde2sm182159e0c.10.2025.04.09.05.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:26:00 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so5971637241.1;
        Wed, 09 Apr 2025 05:26:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2vZzVqw78yTNVvTRUlleNBb4lD8ubTO3lVfNDBfBpSw9MzmNxNOHAwo1ewvx6Ey7Rzxrs3qiJ7FtI4Os=@vger.kernel.org, AJvYcCVy7ZKKhjNELhi75K4tTymeZzKTFOTTr7Ipfogm2uxDKuo/pPLN30XQhjYYsQiMrWxmB7voVngn0kLZnEfIyF2w5zk=@vger.kernel.org
X-Received: by 2002:a05:6102:80a6:b0:4bb:c24b:b61a with SMTP id
 ada2fe7eead31-4c9c445a383mr2092287137.19.1744201560103; Wed, 09 Apr 2025
 05:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250401090133.68146-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250401090133.68146-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 14:25:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzpEJn=24HBC2+cATwKKLtDFd33JXHMugUXNAsQX_Y4g@mail.gmail.com>
X-Gm-Features: ATxdqUFJNg6w-BI8dIVJ1F4IvtULXKwQUo9xfmn0tN2_Y0EF5dzaxljN2HWD5Fc
Message-ID: <CAMuHMdVzpEJn=24HBC2+cATwKKLtDFd33JXHMugUXNAsQX_Y4g@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm: multi_v7_defconfig: Drop individual Renesas SoC entries
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 11:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> ARCH_RENESAS is already enabled in multi_v7_defconfig, which ensures that
> all ARM32 Renesas SoCs are enabled by default. As a result, explicitly
> listing individual Renesas SoC entries is redundant. Remove these entries
> to simplify the configuration.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

