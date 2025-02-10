Return-Path: <linux-renesas-soc+bounces-12969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B58E7A2E823
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 10:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63CB51631A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 09:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9076F1B6547;
	Mon, 10 Feb 2025 09:47:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF5F1C3C01
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180865; cv=none; b=MvVKbYJ6QhuttISduGr6a8f/pC0CZvvnfIRANn5CKK3HYI1K/RWi7JZI6pro6b5410G4vMaEgAeqa1vme7gdeX4Zf7ScELEyMM+pWPY10v2GjPNmZw/ClX7qgzcuYf/VFPVKQ5c/1f1RhGtQ23jLWP5w8pExYeX1vHH36hUbJt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180865; c=relaxed/simple;
	bh=47uA6mwWSIXzPx98yi4DTl0a8Etjoc0+rt0HmcxGIZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=k5jgfPVxMBREVXKUQtBfpB4vJ3Kz+NbqoJgTxPQESTn0UEHbZllzj+l8FapJVN/sTD0fpOwd9UICGdPK70dytM5zIJ2ncWBwH6KY69R/6lICh6v8Xt456L/ZUM+gdSrqXNKYrfvIWqnkYDnYrnVhR1h1PhVxQTWehmwWvqceVdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5162571e761so1103765e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 01:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739180862; x=1739785662;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKpHJaRLsurAZIiUZtuEWbWHtNEsNTv+3C1NHieaTC4=;
        b=kn0epyHdqiuMPde0KIXMN6B4lK5Jtupw619R9oIT+zYGJ8C9XCCQY2vApc1eEX8bKX
         z2pnnUhaVKxR6pWOs2CTPW58jg0uJLsy+3lfeLsF2/Kp8NFubw8+7pdR7per2OIRQ1D0
         ZWnY+8hpphaQCP/qeD8pHaWIq6jZruY+BB+rITNXSL9wws60BeM18XJYwGzMrWXv8ndo
         UIjVJa5Ej6S2An9RdPlIwyexqD7yrSpM40sodmLKlfGK3cxIUJ0DORp3mkt9VXzRSZXb
         Hg3K0FFWGGjNIl5bKpt8Y7sesYxqUjD+jDkML0bnO+CWK1RgK0NQepXMH4maQmKg6Psm
         1GPg==
X-Gm-Message-State: AOJu0YxjFALFZEYzFque0ZYa26c8xlmReB+nr82P7wmBycsjJR692gxM
	9KJ824Rj/xhZZB7nAHehG7E8ieWwuiuwqFiTz0k/Kk13Xh+tCKrlLfF/swcY
X-Gm-Gg: ASbGncsZuvn79vpQuN5w/+zum01WkKWRUvRYPKFBZ32LmqSM9Z/xN35gLof+B69QwyH
	akrjcCvNXWK3yd+CSzMf+ykkIwyQ+GmxkWxlUds8VVAac9X3X/JpLk7sTFThdaVf7pR+TIy939J
	0h9/eKgQTShUlzL+eeNkdkbcxtzufJ3MZMPBgtP/UibGc+qUwfOVF0r3O8MKgCCZXgFRlvomdh6
	z5/ndJlcYH6wPUcggrX+DDmrHYVLiuPKiv9i10LpJa/Aap6R9bp3Sxz72sTscE0Wb4GUofqN8cx
	HSV99Xj7jZ/O3c1GKOfM+St7lF+cmiAkHhmTk+72fSypANa4R5hATg==
X-Google-Smtp-Source: AGHT+IHEhblVNF7tMio1Qnj3eeO8TCVIwWG0ECawllLXN+Fs6nBksv7NsL1rE405yRrZ4J6HNxsqYA==
X-Received: by 2002:a05:6122:3212:b0:51f:3eee:89f4 with SMTP id 71dfb90a1353d-51f3eee8ab8mr6694605e0c.9.1739180862000;
        Mon, 10 Feb 2025 01:47:42 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5204dfbcba4sm94134e0c.3.2025.02.10.01.47.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 01:47:40 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8641c7574a5so1142125241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 01:47:40 -0800 (PST)
X-Received: by 2002:a05:6102:4b13:b0:4b6:20a5:8a11 with SMTP id
 ada2fe7eead31-4ba85da9f9dmr8264743137.1.1739180860184; Mon, 10 Feb 2025
 01:47:40 -0800 (PST)
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
 <CAMuHMdXPg6dBhvdgKwKVVDHP+7qJDKTfRzKGhXkUTb=gX833Ag@mail.gmail.com> <CAMuHMdVJ2joZgT6Yp4VhXs3yr4ntgHSyCt0JiyWHXueN-3pNFA@mail.gmail.com>
In-Reply-To: <CAMuHMdVJ2joZgT6Yp4VhXs3yr4ntgHSyCt0JiyWHXueN-3pNFA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 10:47:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUS=MTCYxgCzWT1K6NX-BzxxKpBm_Q85GbCGTN3ppUhYQ@mail.gmail.com>
X-Gm-Features: AWEUYZmqrdJSoblxxdO9EL0KFJk9pcloNCdhGKlnA8jAKN6sQvn40O5cK2LNJ7A
Message-ID: <CAMuHMdUS=MTCYxgCzWT1K6NX-BzxxKpBm_Q85GbCGTN3ppUhYQ@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Dec 2024 at 14:09, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2025-01-21-v6.13 (TBD),
>   - renesas-drivers-2025-01-28-v6.13 (TBD).

This became renesas-drivers-2025-01-21-v6.13, followed by
renesas-drivers-2025-02-04-v6.14-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2025-02-18-v6.14-rc3,
  - renesas-drivers-2025-03-04-v6.14-rc5,
  - renesas-drivers-2025-03-18-v6.14-rc7,
  - renesas-drivers-2025-03-25-v6.14 (TBD),
  - renesas-drivers-2025-04-01-v6.14 (TBD).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

