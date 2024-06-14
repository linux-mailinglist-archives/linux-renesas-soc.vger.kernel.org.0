Return-Path: <linux-renesas-soc+bounces-6202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6A09086A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 10:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD0D288AE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 08:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C776A18C341;
	Fri, 14 Jun 2024 08:45:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5C918F2EE;
	Fri, 14 Jun 2024 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718354721; cv=none; b=tI4K91O1aI0S5RFa7ZpNmiT26NWonb214VWhB7Dumirn5rtV3twPBnN9TZshB/t98PVntqQgEV0e3UdO7DaSyNtI94b7F6IyOV1lbxeIuOLPTSC8GQ7KqO1A2s22P2l2Dk9xbm6WMTCsxbD4I2Mk6WSVjjilJoiFKdvk+ddIg6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718354721; c=relaxed/simple;
	bh=OnYAzqe/0ha/DwV3E6L+ffKBQVrhGns47YViP6wrUmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ph3flteHwrDbjYpUaHT6OwvrqZ+Ja4Pp0123jS4UdtgFZtqHTVkTGu5/yuFNlGBL/mvf1ZccaG+nbnHTAjp7TQwm1k+ooAHS16FSq4kcCE6FWoD46xomQ845nUEM/k+IvY5w3SLIW/OA4qKtJXGN/t5FYrPHCUSIBRWNbgS3SJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfe71dd22a5so2121335276.2;
        Fri, 14 Jun 2024 01:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718354716; x=1718959516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiCB/V+P1k2dIn6UNeliORv8jYhwFlA7j9q655dR7a8=;
        b=rxmxV5fW98uKibMmaOynBR0sSqDia2R9v61uDuRC5wRblqyNHZRrqbqxw/cj5d2vlT
         v30uDlG1UE08YL5l+T7wvTzjMThc6tJHL8sNvPIGlwjoDPcjYIMFq9+igbnDapV9QJdJ
         fbtcdssOE7blgwKvAPrVvJ7H8WA97SVlbZ1Y7tUZyoU9dsXw0CLEx6+POIOLKIojh9vs
         ydx/Y9sh548wwAJU+FnO0A61lppCbuftM3gumUt0bjexA0RDCBnhcYNrzSM8SUlSkDOg
         PeZdv7Ev85WrERtWXk8JwsRRW+3tjnF9typtpdAxBDpAy3qeTim5h0hqAHNimDadluUY
         1Sqw==
X-Forwarded-Encrypted: i=1; AJvYcCUZXs+H7hC25nIff/09HEy4w/JZA9Cs1X0cWu/k+6k8Em/wumXGcO6+l1HnjX0/1gZ6me+LonsUK8cIODQANVLdJ3JR/0+HnqVAKl0Ualfz7BMaz+YkQxV/Vdfp0E1z3a9X9w2dmGNrBbuAta9qPg==
X-Gm-Message-State: AOJu0Yx3pR+T110kOXstctmghlTId6H4P3aqCIwaxQQxsmzRvAlXoVyW
	qAcOjpkncWnmtZ02zk6YKY0EGkk4cmEFuzN/7zyu4iVBojvSllpudWXSZ1en
X-Google-Smtp-Source: AGHT+IFTjeyuKL8ST47KBqu90m7Cq3bFsxR3pg0zqdSNep5pIzDRziWxPfK4Srj//3y+05Aa1/98Gg==
X-Received: by 2002:a25:2c7:0:b0:dfe:2739:348 with SMTP id 3f1490d57ef6-dff15342800mr1835477276.11.1718354715581;
        Fri, 14 Jun 2024 01:45:15 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff04a924d2sm437668276.60.2024.06.14.01.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 01:45:14 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfdff9771f8so2103579276.1;
        Fri, 14 Jun 2024 01:45:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQBYQ2pOMgfpZX+wa+wxabxZA2I7/amgDdIcAQ7st0tppxde/xhKxZZPD6on5k0dQm6YqR/GPldqWjk8ONukVIpeZ8ImG0OE7i/3BkEK1Go7naL9lvwJCqsb2JQicn+Ejfw3tu17ZLaWgPPVHkJw==
X-Received: by 2002:a25:b21d:0:b0:dfb:dc8:a0ac with SMTP id
 3f1490d57ef6-dff1544368amr1814971276.42.1718354714280; Fri, 14 Jun 2024
 01:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718199918.git.geert+renesas@glider.be> <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
 <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
 <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com> <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
 <20240614075949.3a3c667f@canb.auug.org.au> <CAMuHMdUn4w74q0-_xDvX5vZogR68pKjmmRw0rC26jcr6_vcPMA@mail.gmail.com>
 <20240614-fractal-organic-doberman-ee0cc5@houat>
In-Reply-To: <20240614-fractal-organic-doberman-ee0cc5@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jun 2024 10:45:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmHQ43kH-5KOR7crL_-G6S=h5WmpLN3zo+snu_OuhkLw@mail.gmail.com>
Message-ID: <CAMuHMdUmHQ43kH-5KOR7crL_-G6S=h5WmpLN3zo+snu_OuhkLw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Maxime Ripard <mripard@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jocelyn Falempe <jfalempe@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Fri, Jun 14, 2024 at 10:35=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Fri, Jun 14, 2024 at 08:58:26AM GMT, Geert Uytterhoeven wrote:
> > Looks like the top commit of last drm-misc PR [1] is part of the
> > drm-misc-next branch. but not of the for-linux-next branch, while
> > Stephen pulls the latter.
> > Is that a drm-misc or a linux-next issue?
>
> This was a drm-misc issue, it should now be solved

Thanks, confirmed!
(and updated my .git/config for next renesas-drivers release again ;-)

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

