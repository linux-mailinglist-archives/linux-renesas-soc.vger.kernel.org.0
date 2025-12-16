Return-Path: <linux-renesas-soc+bounces-25831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DDACC4E82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 19:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8B3730109BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 18:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202BE2701BB;
	Tue, 16 Dec 2025 18:32:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2763F3A1E9E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 18:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765909949; cv=none; b=oesHy9yn01qmeCVFpdeFlsavQrkZE1ZjA3qSFKHIUyXOW1aahAS7DVPoF9dBn0jAvlmA4Xpoz1H0jbKsI+8jFFHqhXGeGXdFIpPC9fnuV3c0865/4i2Xy4QFJC7e0Cli8KYoD88+uylF0V+HjOxL7zKb8sV6kWyU9vSkXMmiU4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765909949; c=relaxed/simple;
	bh=xGffopx20mBrXKJzYPGqlK+o9Vr/NtAqttxNcbmzESQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=XRuItzdSU80NSRV14JCXd1WcS1XNbWouw7qf5wiw1s76xmyeXPKC3MH1d8q/6AjLv5sTtkrznTDODn/iyx7eq/QP3bC72hh3vHzYbHRcAkVK5Egbbat2ENErgQquYS4lax15WAI17f8NeVxaSdDHYdujfaMGhB90Bzjvpa3c2Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-93f5905e698so1190974241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 10:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765909946; x=1766514746;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZKQogYZ5pK6OMUmtmPyBGc9k/lo0hOBVMdT8UwMUEE=;
        b=Rw9HekYNLjxmT/kzGbz/WdfqHqKxKUzfz9airJ5mn3QQkoo3gyBFpcrW4MrKYzEmjq
         CxmXXS/cx3pKt1eZzdsUJP6rXfVyu/b7DgYRyugXVeoVu2lDa+l8528mQzCCubFkDq0F
         DiC6Hn3cTS1IzNo2AUqPbOSa5rpEUYKLdturPbT7LR4eXxSpMZ6IMbcKAamk9jWC3uge
         fat3ThsT7dnyUmR7emhv9n17FXyFp/2xQfwrZL2UBZFERlb6yGvDNDKnNVspHwJjHDTO
         B0NeUAH76m0oy+ndnueJK0qz2AA8YqWND2mfh0VXtQOE/YuxjeBVR+VeP7cNaUWIhekl
         s+2w==
X-Gm-Message-State: AOJu0YxdxoYo5SNXszQPdIj9n0eMs0aJCQzKb0pKKUlXE3r9RVg6SocS
	WvXuWmrzU2v/raj9Te5bWVMHK02Pe0V8ddbVttSjexPjpRvaDT3VXXsKY1flsxl8
X-Gm-Gg: AY/fxX5L8HVr/rMzWI4pTMBQ3azp8JZPQWQSiUG674fV19dFJ5D5IA6LPMyHlwWaE0o
	P9qTsV9lWGdKcBRqfbObC4TlXKPVR8VdS8y/m40HbynWYTMwen4KzaHqm/6YKiG+t2nX3jPwrNo
	PHGhX6S66lzc9VIw84iQDrRdjzHaHwjt0CMmuP+xcFE8+l3wvsd9bv6epGTVRBnzYQaVtD9oNYa
	3c3GnFTg2JcNFSzSIR+C/2FJEeM6+420QijZXfdJmrKOIziKtBDR1KH/yXvFX37dSHB1pIVNNWo
	GUvIgyzH0S/IdkTi4jAjwwltPGI5LO+uztgQF68ern2y1Qebmq+6uFQE05UT5ePobKA+Hqa8Pii
	IE2bemlh4i6trasBKmBF0/p1mRSOSGi/oeSlvrJKhtOOUFG7R//hlTyG1jus6w0wvDQuZBqPPby
	2JyVjLpBsVmRWKGjcDZ8VI+ksUv7oNcH/kX1i3vlokPZgdm4A8yZtkLSv792HCeQA=
X-Google-Smtp-Source: AGHT+IGy+/itT4G2k5x9wQJguX+cGKyqKCGazNrIhLUciwuDJYnkNf4NlmjqGtfZhTboNXa5BIMVng==
X-Received: by 2002:a05:6102:5cc7:b0:5db:ef30:b74f with SMTP id ada2fe7eead31-5e827488afemr4810359137.8.1765909945832;
        Tue, 16 Dec 2025 10:32:25 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7d0ecd8f3sm7400446137.4.2025.12.16.10.32.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 10:32:25 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56021b53e9eso366992e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 10:32:25 -0800 (PST)
X-Received: by 2002:a05:6122:2a13:b0:55b:305b:4e46 with SMTP id
 71dfb90a1353d-55fed659a38mr4694510e0c.18.1765909945130; Tue, 16 Dec 2025
 10:32:25 -0800 (PST)
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
 <CAMuHMdWBc002vKmUsTpDpxZPU+Z8J2=NM1hYXWj-z26oV3gxwg@mail.gmail.com>
 <CAMuHMdVCcjNwnS+1cJ-EAhr9vdwZx2F97ta-nwrMEgqptboAvg@mail.gmail.com> <CAMuHMdUQv9i1ZUhzZV+YhhmjbO-f-0n9ocfBYAiVYP6We5Evpw@mail.gmail.com>
In-Reply-To: <CAMuHMdUQv9i1ZUhzZV+YhhmjbO-f-0n9ocfBYAiVYP6We5Evpw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Dec 2025 19:32:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrk5GzMWqbYa7PnrQf157TCnS1xjyiV267EakcL+bCLQ@mail.gmail.com>
X-Gm-Features: AQt7F2oLBIqeH5wkwl-BXCnWETH4xsnJFGCN6A6-zwfScVZxt04MYeEbp60y180
Message-ID: <CAMuHMdUrk5GzMWqbYa7PnrQf157TCnS1xjyiV267EakcL+bCLQ@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 11:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2025-12-02-v6.18 (TBD),
>   - renesas-drivers-2025-12-09-v6.18 (TBD, oops during OSSJ).

That became renesas-drivers-2025-12-02-v6.18, followed by
renesas-drivers-2025-12-16-v6.19-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2025-12-30-v6.19-rc3,
  - renesas-drivers-2026-01-13-v6.19-rc5,
  - renesas-drivers-2026-01-27-v6.19-rc7,
  - renesas-drivers-2026-02-03-v6.19 (TBD),
  - renesas-drivers-2026-02-10-v6.19 (TBD).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

