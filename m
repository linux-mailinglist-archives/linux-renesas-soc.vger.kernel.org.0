Return-Path: <linux-renesas-soc+bounces-23621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5AC0CEC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 11:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 225E94E1E3D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 10:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AE322424E;
	Mon, 27 Oct 2025 10:19:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDE2134BD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761560362; cv=none; b=mOdnc/AGHx96O4D1wt2fZmxtHZsoXX+Q8VqH1eBFaEqDlbgdY2DDnrpMPePjMs2TdFsH/nY/hcEpYJ7d5lef9talGys1cas8wSmt/hPJ2NcGDfrReOd/vRaEyqISp8+cIu2Zwsx6XIL6DZyqwwyU833KnV7h/lMhrSv4m0xBC0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761560362; c=relaxed/simple;
	bh=1CGlZhqIQvYA7WimTIlAMBMJHUvSD0oWhLmffEV7Gd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=L5W7dbGA7lMRWTAGF5H2vQXlYiKVkk6eclOMJ9b2pC5+y39tDShuRYijZWVm9zsQpa7P72HGgY9aX6JOqoZ77EmlWx+rlRuFbeI/EGnfWXd1dg10kWFR0K5GARhPHJnfQ4VmGlYq3xJcYNmxS3t4H4K+j3o4tR4R2TRUtwgzYwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-930ae1b2627so3590705241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 03:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761560360; x=1762165160;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2iM6j2loYaO6+dXNOqmP/cbIsYA1Y3OWRe5CibvG3mI=;
        b=K1Wxcup9/IjaRgh76QoX1/u4UhYW0qUpiqDIa7ZwSsZ2ma5V8Twzw9mcjODujN7fvI
         TH3RCRMnjeSkbd5UfRVEPt2bKsNnRMx1cB68dHnftX86shmHmVpB01G1nz7CFKcX2D8+
         zK1JzNP07MR8L2+6JUFOyRCPZjgXMBVNqjqSHFvBs72vWeOZ62+EA7hO/R/Z+xStTXzM
         el17m8dB9GzMB8wc5rFj5mwgw5woPEgDgw0CfYNryw+N1udzlDuGLK4d833OWLMTX+/t
         gKxl//jwy/c4abzeshD9e/WtdsfDNXPo4Tft62Rn8NiFzhUIfbhM0V2C4jpgCtRk8TtG
         52Pg==
X-Gm-Message-State: AOJu0YzJSaQWqe1UkSy6hGsK32HsQ3cHkwLKIcC+/7kSnKUSlSHVdXJ7
	w6sjAn0AOCSG2Ml2LfrALtHC2dXJYlvICy4ArO9Im+VOy+oks0HjB1hPqUgQJC+v
X-Gm-Gg: ASbGncsnA793h5HohYogl3E1L2VdeMcudwcMeQ7sJ4TWzE49mGnuVmJJZJj4NS6A5Us
	uuYyI6S75ANTd4HdGAdqRiWHA+iu+r+lBxcYmL/1eJXmYN/3zOX1J87Ud8v5VXMquI1tgJkaQgD
	wDnpXG5kQ1eiMJ4ryeomNy6ohQgxYWC7/kpkEA1VPrgo/4jKqZVVmd9VwY3WuhU9dU2mBinTCVV
	KnLkrlmUoK73AB1PksDy/1+4Dbdnh3f0uetql7w0KdlerwnMhNoD40zvICbz7cw1tS6jhgNLHzf
	E0ZtjvfC41LIdljoHi4X54F+e76UEl+gKMbMgNRZbCn3MGjVNSvcT8p0sKMgU5MZKMtpFVqondf
	b2C6T9zp8n3AZ20TUfLBEnIcya6a42ZZJZbMQtHmzz1WqQD6/L8DCaJJehKKxrJ9JYF6lU5fDnN
	vqcHU4TyrDVKJM+POVTQk26jWvY8aZRFEQvd5cZJO90lQU1DLa
X-Google-Smtp-Source: AGHT+IFtkUcF924pkD5cp2/9b5Xkcs+sq3wDTdL+Dz7QwsVy2wiCBjXsN7KRmoxvxM95tyudHhH9gQ==
X-Received: by 2002:a05:6102:358e:b0:5db:3d11:c8d3 with SMTP id ada2fe7eead31-5db3d11c9c2mr3234809137.8.1761560359531;
        Mon, 27 Oct 2025 03:19:19 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c3ed019fsm2746866241.2.2025.10.27.03.19.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 03:19:19 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-932bced8519so3773663241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 03:19:19 -0700 (PDT)
X-Received: by 2002:a05:6102:3e86:b0:5d7:c1e3:3a69 with SMTP id
 ada2fe7eead31-5d7dd42398cmr13353348137.1.1761560359147; Mon, 27 Oct 2025
 03:19:19 -0700 (PDT)
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
 <CAMuHMdVJ2joZgT6Yp4VhXs3yr4ntgHSyCt0JiyWHXueN-3pNFA@mail.gmail.com>
 <CAMuHMdUS=MTCYxgCzWT1K6NX-BzxxKpBm_Q85GbCGTN3ppUhYQ@mail.gmail.com>
 <CAMuHMdW2d+kh=J2GUeL2f16DUM5ExBD4eva34tHSq-JH38RM+A@mail.gmail.com>
 <CAMuHMdWBc002vKmUsTpDpxZPU+Z8J2=NM1hYXWj-z26oV3gxwg@mail.gmail.com> <CAMuHMdVCcjNwnS+1cJ-EAhr9vdwZx2F97ta-nwrMEgqptboAvg@mail.gmail.com>
In-Reply-To: <CAMuHMdVCcjNwnS+1cJ-EAhr9vdwZx2F97ta-nwrMEgqptboAvg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 11:19:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQv9i1ZUhzZV+YhhmjbO-f-0n9ocfBYAiVYP6We5Evpw@mail.gmail.com>
X-Gm-Features: AWmQ_bkwtvuCZVaYJUhlv0VQTOpBM6pOzFPNb4LOxietWMMQrSVAXevWRqp22ZY
Message-ID: <CAMuHMdUQv9i1ZUhzZV+YhhmjbO-f-0n9ocfBYAiVYP6We5Evpw@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Aug 2025 at 13:28, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2025-09-30-v6.17 (TBD),
>   - renesas-drivers-2025-10-07-v6.17 (TBD).

That became renesas-drivers-2025-09-30-v6.17, followed by
renesas-drivers-2025-10-14-v6.18-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2025-10-28-v6.18-rc3,
  - renesas-drivers-2025-11-12-v6.18-rc5 (delayed due to holiday),
  - renesas-drivers-2025-11-25-v6.18-rc7,
  - renesas-drivers-2025-12-02-v6.18 (TBD),
  - renesas-drivers-2025-12-09-v6.18 (TBD, oops during OSSJ).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

