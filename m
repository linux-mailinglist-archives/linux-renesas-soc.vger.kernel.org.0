Return-Path: <linux-renesas-soc+bounces-18439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C605CADC946
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72752177737
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 11:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B6C2DBF5A;
	Tue, 17 Jun 2025 11:25:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BF42980AF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159558; cv=none; b=mkVZB7W8azM5d7kt3rudjLvk06PCy1WDiDROg0lhA6mFgQ8WKBjQNl5TZ8SLirt3715qsnYfrI1JiLh9vrWnQkYCLgAqF8Nv8DPtQLkS3wfPl5+zTe0XwZTuw8snUdNZFgjD0m5BHQA4AaV15LLOe+WIfUdq4vU0PXrn1TDkuH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159558; c=relaxed/simple;
	bh=W3rd3YFqLqs6oaBtTWk4eEC8Uwn0umRcC0MCOfpNwdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=gVQLeoCmXyp9NPs0XCp1aJ52GfLxGsL2RBjdZDf1PYrlKUD6isHUFsuNkZjlP5H5I9A78mb4oqJAxNWGNwNRpGSz8C8VraSYbZ/2e2ebK6Xmb82PwraroYiKI5puC/a9ELFrsY+nTqLN8h7SC6GuAh1dvfH7dWqBceei2ju6rHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-53145c74e15so1021564e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 04:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750159554; x=1750764354;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4s7zjWnMrE51CHcpWDoAC8/Fv14R357c5YrFei33PNM=;
        b=ZRnzT7UPOMY6DDcPboLV3U31Jxzm3N2eHaoCETQZoF3N0HP9dUN3C3MTqpxiiPZQJt
         qAImC4Mypk9T81BN4HG65aq6G08ea/m/pHVxkuPfGCde9OWwug5OrwMpqxtIfdJg/7ni
         BeGpeqIquI6W50bUagGeBCHbJpelFcDdezcx0dN4izi/5rRqFo22AQay4Tp4KdbzBzYu
         giFI51HBi0XUWOYndw4iUpY8mzH8ZgfpgX40tbbK5QNN561LKZwsqY6B0NZ+WmjNuLgn
         /LGZ3mYk/dmUjLIeFbCv1EQ+C0rcBWcUCIXyES5o+G5p+rKu+5BUuJSGJrzcOq+3I+aO
         rqaw==
X-Gm-Message-State: AOJu0Yw9JaoZbf7s1mmxLuwj9dUY9wEsDfX0osYiV/mdlFX63n1cuVyo
	TDBH1VQgQyM0hTMsaokS5xBk9hm/VGNmZ1v9yrFFFF5pCUqDjPYEhQT9lWggkghw
X-Gm-Gg: ASbGncs7iymxYXxfL1r+x+CfD+kR0FYiqmk6zQSgxJ8NDrWuauZ7g5bfbwhx4qXPUOu
	zTqPk0uhVJph8BKnQLn27OZq/ZjD4piYE+Cf97s4gGsEFjXm0RKmQKcPEAtupuPeMhMISuGGwT/
	537/6wnKerO3XQ4rqIuzALv2KIPh6m6tJ0dlLYN//42s9WRoab4FUooCTYuZLVKF1MTPcRXcssA
	W+GV7qpeer3dt1E/ECPSoX2Psaj43MT6/+mYE/NQpcxKMtOVeDKb1b5AkxxPXFRrVQqMHuCVyV5
	BGZDkKbrpLET8cqSCdtjk6LSmntzaFGt2LIAFOoNdFcHOm3SY9MXVN6GKAG0kfZbFhYU2VTx4d9
	uZNLmCZuf+XpPEnCsoiqP1OsGfLP6
X-Google-Smtp-Source: AGHT+IHCmsdRQy2z2J8DEdfUOeuDNTpowy3UtwLBtOYYf3X/Bsy1Bj8jMNjW0tIMclhy51CRQVyQ0A==
X-Received: by 2002:a05:6122:1d86:b0:520:af9c:c058 with SMTP id 71dfb90a1353d-531495f865dmr7836960e0c.5.1750159554140;
        Tue, 17 Jun 2025 04:25:54 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313e028c88sm1610381e0c.32.2025.06.17.04.25.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:25:53 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-530d764149eso1568743e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 04:25:53 -0700 (PDT)
X-Received: by 2002:a05:6102:4194:b0:4e5:949b:78de with SMTP id
 ada2fe7eead31-4e7f6147da9mr8536448137.11.1750159553716; Tue, 17 Jun 2025
 04:25:53 -0700 (PDT)
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
 <CAMuHMdUS=MTCYxgCzWT1K6NX-BzxxKpBm_Q85GbCGTN3ppUhYQ@mail.gmail.com> <CAMuHMdW2d+kh=J2GUeL2f16DUM5ExBD4eva34tHSq-JH38RM+A@mail.gmail.com>
In-Reply-To: <CAMuHMdW2d+kh=J2GUeL2f16DUM5ExBD4eva34tHSq-JH38RM+A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 13:25:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBc002vKmUsTpDpxZPU+Z8J2=NM1hYXWj-z26oV3gxwg@mail.gmail.com>
X-Gm-Features: Ac12FXyHFw7xm2bs-ddrDAZTnsr_o_xlxU0-Ps6qHdDJuahM5kTDknnR4AlgQ74
Message-ID: <CAMuHMdWBc002vKmUsTpDpxZPU+Z8J2=NM1hYXWj-z26oV3gxwg@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Mar 2025 at 09:48, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2025-05-27-v6.15 (TBD),
>   - renesas-drivers-2025-06-03-v6.15 (TBD).

This became renesas-drivers-2025-05-27-v6.15, followed by
renesas-drivers-2025-06-10-v6.16-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2025-06-24-v6.16-rc3,
  - renesas-drivers-2025-07-08-v6.16-rc5,
  - renesas-drivers-2025-07-29-v6.16 (TBD),
  - renesas-drivers-2025-08-05-v6.16 (TBD).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

