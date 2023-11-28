Return-Path: <linux-renesas-soc+bounces-345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6E7FBB28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 14:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35C2282714
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 13:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A446256B77;
	Tue, 28 Nov 2023 13:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DF0D51
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 05:16:20 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5d1f8bc279aso1001487b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 05:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701177379; x=1701782179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9th/BD77eUlMr387q5dkgInc/R3bzqxX0OMMyBPcVw=;
        b=asK2srK4yMoLVHvs0XZ6xwCYcH3Pa2YVfFDUvjiE7sKaDqLpuP9FtT+bK9XJ7H1Y3s
         ERHmIU4Dm7orG1Ls2LEAGyofjhCoXxoxAmZS5nWIdbtW2EuEFay4xBazNS0QqwUq+0kF
         yTsg4qI2Cx4CWmYxd5xpxKuIbgdEcvOQClYCycF54hyMevi1O0UqUSq5AcQXIF0v3aHS
         XpbYaB1L7XO14/TO7krwT6vnJnb4JfTIFkKhW4dqdH0dDHseq6a0jqNoJuN62o6dcZgC
         UHzVWdfTkAA6xiJK6fs77dtBbz5q9L5pk7Ybv1WMm3iRAaUd63mJwzUcxadJVB1yI9uS
         O95Q==
X-Gm-Message-State: AOJu0YxsSlA4mU69ObJskkHQGfv9Z31OKxI/Khk5wMftC+4dPm6S98D6
	kug4ieoipTRBBTxjCrF/MCG5e0le8b6KNQ==
X-Google-Smtp-Source: AGHT+IHLc2fJo23aoifjhaoHpSB/cFdDYE4o9kjHdVu0h24tYY00yBqF3QtDJ9mcytCjLNrxZNAarw==
X-Received: by 2002:a81:84d1:0:b0:5cc:61d9:21dd with SMTP id u200-20020a8184d1000000b005cc61d921ddmr13919829ywf.12.1701177378909;
        Tue, 28 Nov 2023 05:16:18 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id c127-20020a0dda85000000b005a7b8d12f52sm3871540ywe.40.2023.11.28.05.16.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 05:16:18 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9a6399cf78so4204433276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 05:16:18 -0800 (PST)
X-Received: by 2002:a25:d287:0:b0:db4:c7c:ede0 with SMTP id
 j129-20020a25d287000000b00db40c7cede0mr14829349ybg.24.1701177377982; Tue, 28
 Nov 2023 05:16:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128104723.20622-1-tzimmermann@suse.de> <20231128104723.20622-6-tzimmermann@suse.de>
In-Reply-To: <20231128104723.20622-6-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2023 14:16:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3R=JkCeaM3m_TO_EOBbgut7qr_PJTJbTgs=CU05bgTQ@mail.gmail.com>
Message-ID: <CAMuHMdU3R=JkCeaM3m_TO_EOBbgut7qr_PJTJbTgs=CU05bgTQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/solomon: Do not include <drm/drm_plane_helper.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, 
	airlied@gmail.com, suijingfeng@loongson.cn, laurent.pinchart@ideasonboard.com, 
	javierm@redhat.com, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 11:47=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

