Return-Path: <linux-renesas-soc+bounces-346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218267FBB2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 14:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0352B20E78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 13:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B21E56B7B;
	Tue, 28 Nov 2023 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE40BDA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 05:17:07 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5cd81e76164so46763787b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 05:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701177427; x=1701782227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7Lbj/iDgIl6mIwZwAI8rICbFPBFEI97XQcR55PL1mE=;
        b=Co6zjo0Bf9mn6MfGiRraeUNkOgwKXmuia+V9yTcfbmDME5Q1LnMpeo1A/ie7p6rCr4
         Nw332dRvcB9sLmK1X0xccC+5015+BYpU5xrGhPNWaso4efNjDz82tHbuJmSgsYdwiGCY
         8AywzebvOC9L0luAsLN+60y55BRucn7yBajJhMgqyc+0EQP1VUVIN5driAm5tI8HcX0d
         p9O4neO4bU7MW0tVI0ffvRnHc2mdW18GNp/2JY6Xq/bFSbMVAsyNJxKi3hxmjPhwBaWP
         5C/BTjfgu/1vrnHMlfC5wFgCXwlWtoILZ/lWBiWN62STr2pkpzwOwLB4o/Nqp/Fb0BEQ
         ZPNQ==
X-Gm-Message-State: AOJu0YxFksVqG9p7h1XW941KK/AkX35ECKcnShDgCq8lyr/NYkOJITJU
	pdXS0w/hMrK8pqOofOtNudgSxI6xb4InYA==
X-Google-Smtp-Source: AGHT+IHF5zqdtynSIDp80u9cNqB6KZ1gJjJVIV4MLmJTPYOFZg/N/URDsD7W+oR8IYnfSjVFTXnleg==
X-Received: by 2002:a0d:d907:0:b0:5ca:81ff:b5e5 with SMTP id b7-20020a0dd907000000b005ca81ffb5e5mr14791286ywe.12.1701177426883;
        Tue, 28 Nov 2023 05:17:06 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id m14-20020a819e0e000000b005869ca8da8esm3798348ywj.146.2023.11.28.05.17.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 05:17:06 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-daf4f0e3a0fso5234535276.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 05:17:06 -0800 (PST)
X-Received: by 2002:a05:6902:49:b0:d9a:cd50:b99a with SMTP id
 m9-20020a056902004900b00d9acd50b99amr14894279ybh.12.1701177425865; Tue, 28
 Nov 2023 05:17:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128104723.20622-1-tzimmermann@suse.de> <20231128104723.20622-5-tzimmermann@suse.de>
In-Reply-To: <20231128104723.20622-5-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2023 14:16:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkcnx3WdPXHLq+NJCv9O+tWyhzwZR-VFcY69sciGioSQ@mail.gmail.com>
Message-ID: <CAMuHMdUkcnx3WdPXHLq+NJCv9O+tWyhzwZR-VFcY69sciGioSQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/shmobile: Do not include <drm/drm_plane_helper.h>
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

