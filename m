Return-Path: <linux-renesas-soc+bounces-3092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5985F5D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 11:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51AD21F2176F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 10:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372E83A8E4;
	Thu, 22 Feb 2024 10:33:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3560F2B9BF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708598014; cv=none; b=nOPcPFwb2grLqcnce/qRGQ/p90eo5AUfV9kMNmKUPL1JbCXGwF81R7Rh8PHAYzEsjagqp+q7Z6lILI1mHYW7cgEeCItSC8IY04AFXMY0NQDxNXaNO6FhooaVCrJTd5mGwYincQB2KBNEMSOGgCm+Iakc0jmms7qPKBZiW0q+wQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708598014; c=relaxed/simple;
	bh=F4woxzE8RbH8ymkqRK9zeZN8D83xinLm3a/ZIbuutHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdWa6YYgKoDXanI5nr8pR4uuWEz6sO4SB6B8sm+wSEQbfWNE3qyhWH5hdU2GX5XIBTfYpKxWoKeZcZCuqFoamb69xuGdgKSTKOrm6xh1DZX+we/9hbrwy5aYvDGd1/s5m8zhIPkaqJiPXEJzazMfqp7kuB+2w11ayUGfFm6Z0E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso1770652276.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 02:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708598011; x=1709202811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvSpiiUJ9iqys+97G/reNKOm9Cl7wv5bknYElgciSKA=;
        b=dU+TBq7tWcJEa2YxqBIzY87720R1YnVmKTVryeG86fmxdHk2fQsRO8GjoAVHeT5sb2
         os7r3n7Y9ldIedPqbzyKtda1U7pteYv3Vrx2KAmgYK1lpQeYFEKR21fZLH37RN6vbr0z
         iEM2+AflbNR7nJ6OMrFZHvI39yFyV1qW8IS+tlDpP+2YdKeua4gjjpbTOu4AyUVG68aa
         rbAo/8kDvaj/KwYbGys5DToR5Db1o2+KIfSPiYbL4pMaWgptfD146rFykt25/63C7JwT
         cgSyyQb14kBbmTsHSEbMTFYKAdtZ0SshOuOpeqOMRAJ75qsmk/lxG11SYofx+QD9uhwv
         wD+g==
X-Forwarded-Encrypted: i=1; AJvYcCU2r1zmgmaYOErDtNu7Mo8gdY8HajzIChz5dNj52QR5D3108VA8oAnyf0sHcQ/fY7F0rivTst2/byDhyIFSX9ylUEznU6z2YIGm2Dg/GxUsjIo=
X-Gm-Message-State: AOJu0YzTl6Nx5J/QmyZlWuOJMowGSDZHJHlpEeo0kahcEBfIRB3UyMJq
	kHk7b04DkdW+14lLCqv+Q4eNoOir//4+hbz1wIDcnuTcpYGz+e0NpRLYuRuny/0=
X-Google-Smtp-Source: AGHT+IFXnvP9LV6BYBAgozFNGvKVuVIVoaKaRMfuAJKdinF1W9ZcExRA3s66t8XRjxrkNF5B3dR+MA==
X-Received: by 2002:a25:bfd0:0:b0:dc2:32e6:18d9 with SMTP id q16-20020a25bfd0000000b00dc232e618d9mr2012536ybm.8.1708598010928;
        Thu, 22 Feb 2024 02:33:30 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id v14-20020a25fc0e000000b00dc254858399sm2733972ybd.2.2024.02.22.02.33.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 02:33:30 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6087192b092so17311717b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 02:33:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAb6MMRh2w8tdS92Fn0mro0ZfjWRwgx/CnJJ7olm2XL+WcZvdbCST5F25oL9qIF21/QfoVu8O8x4lPAwpKL3BsAe4Vno6UddtHWbtFciskW0I=
X-Received: by 2002:a81:4cd2:0:b0:602:ca0c:fea3 with SMTP id
 z201-20020a814cd2000000b00602ca0cfea3mr18679734ywa.10.1708598010471; Thu, 22
 Feb 2024 02:33:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Feb 2024 11:33:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXaaPP9Mx-2SY9_4H-X=-sQATTMCUW4sWPP0mmQL-qmkA@mail.gmail.com>
Message-ID: <CAMuHMdXaaPP9Mx-2SY9_4H-X=-sQATTMCUW4sWPP0mmQL-qmkA@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Fix redefinition errors related to rzg2l_du_vsp_*()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Feb 22, 2024 at 10:56=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Fix the redefinition errors for the below functions on x86 by replacing

Not just on x86, I assume?

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

