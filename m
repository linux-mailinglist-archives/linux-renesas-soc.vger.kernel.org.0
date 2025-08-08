Return-Path: <linux-renesas-soc+bounces-20135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F13B1E5C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 11:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EA9817EDCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 09:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBCA26F477;
	Fri,  8 Aug 2025 09:43:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C5A26A1A8;
	Fri,  8 Aug 2025 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754646211; cv=none; b=hBj91xEtxb8eqB+SHgIvodCmfl93tg4LoBuU7aYAKHrqF7ZfYg0qTayKOsvh0FkzFbMZ4yLBarTBFfREkZIa8L0lkLcznqaZ1ROYBc9uzUpQR/XdmGz8rvo7wap1FcJliN008ZdReap5ff86OwqOnM29LRVTD+PoAUFMHaHFUd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754646211; c=relaxed/simple;
	bh=oeEwC4ZDaAQgoo6SqMA1EuL7WIKD8dRERWoDKgxJRt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNIaRLI/qK9fRCKYwrzuhJPObNwXThG/Vqmtyv0lNw2g0K1mFj3tL+DzIHQSr0y6kRvIc1fhyudtzlSlsOzrK65Glj1CMfTKceodZzKdEwblZPteBR//JFzg/kI+qQxIyFV3tVRro+1Sw+aN6cHdtv5MJBJ0J9lpljBg12Ze8hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-504dd871d70so614612137.0;
        Fri, 08 Aug 2025 02:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754646208; x=1755251008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHWNDK3s9P7e7V2iAmBr/rqn1vtS3VyQHGTysnO++tw=;
        b=Lx1UC0CGh5vAePtsi31gTnOozo/nuOOtb9HfyyuE1do1XT3UlHLftJtRyE1cTJQVqm
         IpsWxvksj8xqg4Klc8tX7CWXeh5HRQ/Y8HcUa3Vbued6A33ZVjyDqgAOCKidCgMsEWct
         if8UzIDunuJvz+yQYQQcybHcrF7z9hcPv41XT5rzosh7NRr+AdUT4qHPPuMvgDzGInPM
         +nL7kWy0kbflwLd36J9g4jo/ITEofyIR+Fy08q/JH8eO7gDdSwRyZ4v015A9Q8lSfggu
         ilOEqVJ/22dWlKa0zkAl26Y+vGV4uJ7dNK0en3m8sCyFYXMBSK04eQBaF6B5wxJmmM9M
         JKoA==
X-Forwarded-Encrypted: i=1; AJvYcCUWo46jdc1upAKUWSN24OB6GicdOVRQ3HVQx0JLbd7ibCZrExyr47zKBNTKEmQENcdS1vy3Hn9xtNkStyU=@vger.kernel.org, AJvYcCWd6Sn2tbKmNe1gXm0UUaCdoiM/IfiMHl5PFqCop3/tndrjwcLs2qO8XQoXS3mqLcJTG9bn9uUCMGJoPw==@vger.kernel.org, AJvYcCXY0lYeL+o8UEqFb08TUgvMcy80KXniwS3gcezGvUSOArLTP8GmnqUCFJC2j9NlzEgFtf1owOi73ykn/WequqZqGJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxloX//3CdVK9x5sOAWYOTzncf2Y9C4ZMjhqarrXYDI0/0lP37n
	egMqr/SDi5xgWpGsnUmBR/UMyq3kg6Ujtj41AOC0v57rfMQgZu8SVk/+mNcvUiop
X-Gm-Gg: ASbGncvOEJtwQqIG/UvuVH72ztAV4/M7KXLdpwS+UjycWpWZJ5GJoiC7vYmx5DBVOu/
	fFqFtCQWOaKNuYbBxuFD3ZsFGhseMvxSPAefC0ML4VKo3uDjXUHuo+IC+15D5qADDptAzNVEY7x
	/fm7ZrPLKuFCJv6GsyYiy7Fjd9n4PRanYDrgy8y8juaMQ0CzVWfzrlakwOlTuuWdXlAgMT8dR4T
	ADugCJ+p7z5gXWoQH/+ZZw91aWz24O36bzY6qmAfT4HHi8qOaslPew1/7UWeDVbOkUNC2/nxy53
	0onEQ5dNLclCtEDiItLt0cUVJtyNS1VaaRBQGyoX621h115V0/BAd5fLL2eykpzfU7NATvUSl7k
	9V9kOnSXx8iAoylA4nm4zGChDyUIIXXRDWzlHbE4cuaCXhjTgFbvXLE3sSVU/
X-Google-Smtp-Source: AGHT+IH3kknl0Ndhe1PRTZCDkJS4dC15IakYyDFKi5Ct400Do5t2d7MQkFk9aFG8jmjIc3p9CnwUig==
X-Received: by 2002:a05:6102:dc6:b0:4fc:1484:5500 with SMTP id ada2fe7eead31-5060f0cccf0mr743441137.21.1754646208038;
        Fri, 08 Aug 2025 02:43:28 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5062bd4c2f1sm296320137.18.2025.08.08.02.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:43:27 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4fbfbda957fso650368137.2;
        Fri, 08 Aug 2025 02:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUN4f+cr39mbe39epuGS4r6038dBHxJNzsVmuQMH3LUX5mQQ0udnyh5qH2pA7W1dA7nbHVKgzTBzspTHB4mfddig8A=@vger.kernel.org, AJvYcCUaYW66pPiwEEtPXaaJSoqVeoCMhFp8FJIWpGytcyMe+nWRR+ZvgeQA5Oiwk9XtBBJTaNiHOkP6WtsdpFE=@vger.kernel.org, AJvYcCWuvoq5Xl89gRBkefb6gkt3IRHCjgFtjD2QsysNgMSfoR3aIpjwiW+VCAY9ujUj9Q7oyuzpV50Rn8A3Cg==@vger.kernel.org
X-Received: by 2002:a05:6102:32cb:b0:4e5:8b76:44c5 with SMTP id
 ada2fe7eead31-5060f0cc794mr693639137.22.1754646207387; Fri, 08 Aug 2025
 02:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807043456.1624-2-wsa+renesas@sang-engineering.com> <2025080720214218750df5@mail.local>
In-Reply-To: <2025080720214218750df5@mail.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Aug 2025 11:43:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwC=TNvvwf0_sgSSYTBGeq8UX5kRFN5kg3mFJ7wVA3kw@mail.gmail.com>
X-Gm-Features: Ac12FXzrLiEtwQSwABN_PovuC7CdyhBuG0HPwAa8_g9H9GakHs5gEOATJhO9jEM
Message-ID: <CAMuHMdUwC=TNvvwf0_sgSSYTBGeq8UX5kRFN5kg3mFJ7wVA3kw@mail.gmail.com>
Subject: Re: [PATCH] i3c: remove 'const' from FIFO helpers
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Frank Li <Frank.Li@nxp.com>, 
	Jorge Marques <jorge.marques@analog.com>, linux-i3c@lists.infradead.org, 
	sparclinux <sparclinux@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

CC sparclinux, arnd

On Fri, 8 Aug 2025 at 01:09, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 07/08/2025 06:31:24+0200, Wolfram Sang wrote:
> > As buildbot reports, some architectures do not want const pointers.
> >
> > Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202508070438.TZZA3f2S-lkp@intel.com/
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > I still wonder why SPARC discards the const but since nobody seems to be
> > commenting on that, I guess the fastest way to get the build error out
> > of Linus' tree is to adapt the usage in I3C.
>
> My plan was to let sparc people handle their mess, there is no reason
> const should be discarded.

Fully agreed.

Note that it is not just the const keyword that is missing from the
SPARC implementation, but also the volatile keyword.

> > --- a/drivers/i3c/internals.h
> > +++ b/drivers/i3c/internals.h
> > @@ -30,8 +30,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
> >   * @buf: Pointer to the data bytes to write
> >   * @nbytes: Number of bytes to write
> >   */
> > -static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
> > -                                int nbytes)
> > +static inline void i3c_writel_fifo(void __iomem *addr, void *buf, int nbytes)
> >  {
> >       writesl(addr, buf, nbytes / 4);
> >       if (nbytes & 3) {
> > @@ -48,8 +47,7 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
> >   * @buf: Pointer to the buffer to store read bytes
> >   * @nbytes: Number of bytes to read
> >   */
> > -static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
> > -                               int nbytes)
> > +static inline void i3c_readl_fifo(void __iomem *addr, void *buf, int nbytes)
> >  {
> >       readsl(addr, buf, nbytes / 4);
> >       if (nbytes & 3) {
> > --
> > 2.47.2

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

