Return-Path: <linux-renesas-soc+bounces-14824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1EEA7130E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 09:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19EB01882359
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 08:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939F71DFDE;
	Wed, 26 Mar 2025 08:49:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2FC3D6A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Mar 2025 08:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742978942; cv=none; b=AGmPJztLI0DWoSy4lOI3oB7s6oZYU2QQHina083jdG/tf5OA9foU9YClNmDEtB2QiCYzNkfJEpqhFEdlZ9zpqApUOXdmKl3e1IYUCp2Esst2bajF8NvFFCN0n+qIQsYvmFbO0+8LDiZ7Q4oMVb3kWvsu9uyeTe9gzBMf/R9vvE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742978942; c=relaxed/simple;
	bh=V/FCiqSNBIeHl4VG1BAT3jfUmGRhPGGKGDuhjBbOTyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nz8lFswfqd8GsLrtbQR//vsOm7DeYFZD00847kHO4CdQ/ZRh3I6QMbu4drmdAqmVaKFC3A8Ri/7dMStU1i0sbGz5tHsYxrmBGRGJTFqa5ibh6lcxo5GLE7aOBaT0IlSWB4j4bLTyAee0BxOKVu61zN4jv+2gXqZWAXorTDUVuoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5240a432462so665888e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Mar 2025 01:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742978939; x=1743583739;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJYVwvS/k66PEiwRw63kBHGvndLuBJQ8ciAj5yN+FgA=;
        b=s2Eb7DDz7YEm9az39qFSNeusI6cAgtZ9r4bI5RWNlvcqgW+3zzvB2jUPe9ebJNNwrX
         fDidCQued0AQBp/4n5GfjuwNmDS6fBdw4gEOInraUSefo9BHmfJ49G+d2YBEQLeV3Vm1
         mV8iXZObO/u2nIMd0kcXzxy80uYj7eeMTMZoYCEixyTbu2A3p7xJMmRemHJvGfkWhgHG
         xJjfiO+X/WLSyv/v2zptotYixevNYn0A08d5LJnTXfMy+JYLOZqy/KUajggbutGTpRPf
         f8sAlGz13a63iN5O9xt/NmDPhyIx0Kng7++qbkqSYAxLsMqXPNhujiNnNyU6dK4SRV9q
         VTtQ==
X-Gm-Message-State: AOJu0Yy4qrg1gLE/7ZM2xKAr1J3Bk7TebcrqBxnzLf9vRqGDcmjolNDB
	BWtQ7H+Rgm7WtFA3orbvKgGQqyXAS82Hs25IGkrF+ODxl9COShIQ9Nk3NlJREL0=
X-Gm-Gg: ASbGncslRn9B2j5jrUMJS80jjz/ZXJn283x3lE5Sy9uJHlu4czbLSRn5YmPaaR7019z
	LufyAEOaJoXJyLFgDW8/ziNhAb7wxNadiz7gj9j2XSXiBK05eEKojcxYtLGpUhRp5kuvmMK8jA1
	f0iei/by3/S7yZRVsIfR2Fb4cssSA9nDqFkHP0ZfRV3mkKP+T6+TJejk0m6UGfcxnRGNE4A2a5/
	Ff7vxYeEb9Su8WA43vDDYoYOXk39D2QtOTTFUwYSmNf6XoG4DXAQw3EWtFzazA7Hej9Gg9+t4UT
	fy3Zy1cKS329SEZOkjtBfycBbU7cycDTAng+pK2+Dh9iKvD0FhhI0AklmXNmlNaD4+c6o5ak0YU
	y9AViUow=
X-Google-Smtp-Source: AGHT+IEdHYxzwsamfG5zhu7IV+uOdaNOLzN7xkCOyvoIXAlSK6vFdcMASIcEE2/wGmCPJM+Aq8uryg==
X-Received: by 2002:a05:6122:3208:b0:520:4806:a422 with SMTP id 71dfb90a1353d-525f0b17d31mr2401078e0c.3.1742978938745;
        Wed, 26 Mar 2025 01:48:58 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a738cfa3sm2123825e0c.13.2025.03.26.01.48.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 01:48:58 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so697115241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Mar 2025 01:48:58 -0700 (PDT)
X-Received: by 2002:a67:f58b:0:b0:4c4:ebb1:4f6d with SMTP id
 ada2fe7eead31-4c5739219d9mr2165298137.11.1742978938297; Wed, 26 Mar 2025
 01:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
 <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
 <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
 <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
 <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
 <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
 <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
 <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com>
 <CAMuHMdXbJvFC9n=LTW=fXhGBRgrDzQG2LUDTbZZruyovU5OsQw@mail.gmail.com>
 <CAMuHMdXPg6dBhvdgKwKVVDHP+7qJDKTfRzKGhXkUTb=gX833Ag@mail.gmail.com>
 <CAMuHMdVJ2joZgT6Yp4VhXs3yr4ntgHSyCt0JiyWHXueN-3pNFA@mail.gmail.com> <CAMuHMdUS=MTCYxgCzWT1K6NX-BzxxKpBm_Q85GbCGTN3ppUhYQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUS=MTCYxgCzWT1K6NX-BzxxKpBm_Q85GbCGTN3ppUhYQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Mar 2025 09:48:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2d+kh=J2GUeL2f16DUM5ExBD4eva34tHSq-JH38RM+A@mail.gmail.com>
X-Gm-Features: AQ5f1Jq9tnIeaDm3imImctD0b9opxXkiyMUfbNgzSGLOqfLUG5dbDmk_nTudJ_E
Message-ID: <CAMuHMdW2d+kh=J2GUeL2f16DUM5ExBD4eva34tHSq-JH38RM+A@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 10:47, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2025-03-25-v6.14 (TBD),
>   - renesas-drivers-2025-04-01-v6.14 (TBD).

This became renesas-drivers-2025-03-25-v6.14.

Next planned releases, if all goes well:
  - renesas-drivers-2025-04-08-v6.15-rc1,
  - renesas-drivers-2025-04-22-v6.15-rc3,
  - renesas-drivers-2025-05-06-v6.15-rc5,
  - renesas-drivers-2025-05-20-v6.15-rc7,
  - renesas-drivers-2025-05-27-v6.15 (TBD),
  - renesas-drivers-2025-06-03-v6.15 (TBD).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

