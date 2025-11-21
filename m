Return-Path: <linux-renesas-soc+bounces-24908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE39C780BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 10:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 19FD1360DA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 09:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC4233DEE8;
	Fri, 21 Nov 2025 09:07:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8C2F60A1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716026; cv=none; b=RSXY1qq7MlqidIgsSmX8T8zav7zvr7seQy60zFLKv1s2eWTCG7b0jPrI6m+lFubVeoZMBiOXxb8fjmjPWQUbvdvGO6ekQF60Yw5ya6g/jhj+j55Wx1pMBSKB5vWf/aTLXfj5uBliiWhpP0c9aBf5tsc5uwF13eyP91dvnLqFinI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716026; c=relaxed/simple;
	bh=uE6zepwOl2z1+COed/KllN9wAqHdEuXlf0sVx3b9Uuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KB3Whx4zwmEPPvV4HxKyai8HNisnQQVI7Fp3WE0QxlIbxpOOAejjQvJWBG5+F/UtinML3foQprtkDNZ4RTSQ856xmvFjV1PUevrdmgiiNfPUt4LoMYqup92GOmAOJ1OJsTM2shNsvHJ2Gi8ahmp/z/Sh59nC24h/R6U4qGGE2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8823e39c581so26052096d6.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 01:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716022; x=1764320822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsQ8cDkyT01+wOfENQ+tLoOAH/3N4WY8TL/xOv6Ppek=;
        b=Vq3XoK2DoCnglkz217hMiXSijhX4ebVkHdVzt3gpm4a536/yWZXFOO/2ooRxpF/gEQ
         fcuXA8ZgfXtS7ZKrCrpfKhTUEsGac2OrdesEKEbDVxxeu7DmQd1PSPydWuG5Xb00rekZ
         0PToLK1yfH/LG0fbN6sH9RlYg8YbQiHD/mWlw7KeqOt8Z8zelN1t0szsigbzg0LXr1jf
         i8ruDfEBpRK2t7Dn7HNfFSpbEouhMU+Zls+dPwbkzELyTJLJL5WXaugiV9tk4sfxFTIX
         4RKLACM5Y3E+i1owx7vF6EciHI9rHPNziIAjZASx3iFf/qDHeLQtvtblMtdZKPYVK5G4
         fQCw==
X-Forwarded-Encrypted: i=1; AJvYcCXHQ3i63LuDTh5NhJ6oqcF+d+rNI+lv7jFs4c5BckOKihlD2qtB436pvdwpmoFI7CnXGaaYtbTNb4/I9NnZd1KxQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy21zHucvKj+RsLolo4jCQJ8NI+O1GKRVCAzrtiRxUkJwTYiXa+
	kRpxdF9vQltxjOzjwhn8j9tk7h9V3iIfmSnDBL7Yz0BTdOiHY7d6h9VArkETFOTI
X-Gm-Gg: ASbGnctx0EPvJUdZiup0IoGrzFr0MKA/CK7WA/0k05xAE7BV4Y0abD/j9CaA5NYHTZJ
	j7ce3U2rCoxDNZq50O0y8zap7ooyhgxZm5Hi8+walZnnRbAL7Xe9wqr2FNppVfNRD1rIaKDSvpA
	1SCeU0Iy3mcY6WBl4UUygIvpJNCkuDFZpZ/pz6QOlxgSo8yVDN5o6L1ah7j2QYo6g2Gnc1mepBQ
	0HbwvJE6j6xuY062Kc2Zy8XGMUG095j0qt05+O8esvz4Aax79zJPyWT+MndDF9rFZ3/J6TWxnXQ
	qy3KEGl7mtMT0Er9fKEadsHUazEUOVBq84f1VQk0BN9d+hBx+GyNC6HOGdp4Jz+RIf8479Qq/9g
	5Zpv11Og4jNtZjV2i4tshJoaQNL5owoREVjHyV37KHvLJBJwP8PGxcplxKTmhP7Oy12zoJvhXvS
	93X9x8g2qxp1gKtzq6GCjyjEnKD8yTVWnR7buQSFrIMMN9Wacl
X-Google-Smtp-Source: AGHT+IHxoPugDwGlEOvm+3YflOKkSogUx4boJD0atzm2wbKuJxEfTOGmGmFCGlWaF2PyUJTiJMFKRQ==
X-Received: by 2002:ad4:5bec:0:b0:884:6f86:e08d with SMTP id 6a1803df08f44-8847c4cb285mr19031146d6.22.1763716022105;
        Fri, 21 Nov 2025 01:07:02 -0800 (PST)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e48a64asm35336676d6.24.2025.11.21.01.07.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 01:07:01 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8824888ce97so24983216d6.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 01:07:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfSE8SdCEl7lThTweXxZuUAeJTc7mBV2yzj1zSTX4CwLk/vX0O9u0DW0noWghzYF9k2NeGGX6jh2ORHOYQiKFhXQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f10:b0:5db:d2b7:9518 with SMTP id
 ada2fe7eead31-5e1de423d78mr478729137.34.1763715558120; Fri, 21 Nov 2025
 00:59:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com> <20251119001030.bf900d1fcad4db5b63055e2e@hugovil.com>
 <20251119132235.795b633eedbb91f8544262db@hugovil.com> <OS3PR01MB8319EE3FB4460584BD8C62B68AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB8319EE3FB4460584BD8C62B68AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 09:59:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvKSDp3EVThcgU0UiUjXKAu16VtiWER1Xv4cEUdcCUZw@mail.gmail.com>
X-Gm-Features: AWmQ_blyptlri4Pqcl2NwaA7Kkvpb6TwU_7MqBj9JCpi6c-uP2G1untsfrdqMis
Message-ID: <CAMuHMdWvKSDp3EVThcgU0UiUjXKAu16VtiWER1Xv4cEUdcCUZw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Hugo Villeneuve <hugo@hugovil.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

On Fri, 21 Nov 2025 at 05:04, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wed, Nov 19, 2025 1:23 PM, Hugo Villeneuve wrote:
> > > +                           params->pl5_fracin = div_u64((u64)
> > > +                                                ((foutvco_rate * params->pl5_refdiv) %
> > > +                                                (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > > +                                                EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> > >
> > >
> > > Also:
> > >   foutvco_rate (max) = 3000000000 (3GHz)
> > >   pl5_refdiv (max) = 2
> > >
> > > so the result of (foutvco_rate * params->pl5_refdiv) could become
> > > 6GHz, which is greater than unsigned long on 32-bit platform and overflow?
> >
> > I confirm that when testing with "COMPILE_TEST" as Geert suggested on a 32-bit platform, the results are not
> >  valid for this combination (but they are valid on 64-bit platforms).
> >
> > I think that the kernel robot could potentially issue a build warning for 32-bit platforms (if they also build with
> > COMPILE_TEST enabled, which I'm not sure about). Maybe Geert could comment on this?
>
> I've got no comment here.
>
> I can't image when someone would ever want to compile this code for a 32-bit system.
>
> So I'll leave it as it is now unless Geert wants me to change it to something else.

Pieces of code are reused all the time. So I think it is better to make
sure it doesn't overflow on 32-bit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

