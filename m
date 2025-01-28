Return-Path: <linux-renesas-soc+bounces-12661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D5A20AFF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D7FF164D8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 13:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449BF1A256B;
	Tue, 28 Jan 2025 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucla-edu.20230601.gappssmtp.com header.i=@ucla-edu.20230601.gappssmtp.com header.b="uLQpZfvX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB61A2872
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 13:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738069809; cv=none; b=qm6P27pOvJBNM/6z8GRI5JOZtoZ1GJPBPWffBCE+rKIEiDHVb19tQf860oJUyoPd3rprVZ6oLjIo+JzBhbogWckMJys2FZv4dASIz/xYt6tCDdHoMbAp/5JiwkYYfg9pjCnSnPhNHOMAESkayXkkDtmHVb2pjdwJxrm78Ik9qt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738069809; c=relaxed/simple;
	bh=nFBQP7x+Hh15t4kXeClaj+SIeVVVy/bSd3699jF//r0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbTr6TbeDGz4QZ75V3zFxJvI7bwQGKM3zBUmuiAt1RmWVoKE08MyuoIm6bbPG/L/xojuuenxjhrD54BlYEIMOS0BBlfiXLDGmbGPdzQ+pfazF3IDp5FyEOQ/v6f4hy0P6o8RlyFCbDwiSfozIvulYtQ2ihR2EA7qbFNkMYiY6Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ucla.edu; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=ucla-edu.20230601.gappssmtp.com header.i=@ucla-edu.20230601.gappssmtp.com header.b=uLQpZfvX; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so9751198a91.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 05:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucla-edu.20230601.gappssmtp.com; s=20230601; t=1738069806; x=1738674606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOCE/EHkpCoKrKjffslP9jwtGrP2mva2YP7SdD8IH90=;
        b=uLQpZfvXzGCiVamfqqz5uiXfxYWMfDxez7zWkxEHPYLWfaEz8FNHp3X3HIj+EptGpz
         0bz1X+xhQwqskmRQjh9ibrj3fic2lwKZmVzDMeYEZt+JwTwLFPSCbyz+LfcanCSw8mM6
         z+nQ66WvfXkuwK9IaNTbpQ821fZQkrgYedPNHCVi9Dnf7b5S2QTXliTIYl9LiUZxjG0j
         6xahKR7DCBOimkFYLioj2G3AkN10sVd37TJspyhK1ROlzpcCJcAzPbmVfjuoHTHc265z
         NCRmXHKIoVTTEl099vH/Dv/FiM1vPt1t/lrvl6LEHvBE2oCNpmPr3wuAE5GwujfgQxie
         4SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738069806; x=1738674606;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eOCE/EHkpCoKrKjffslP9jwtGrP2mva2YP7SdD8IH90=;
        b=wRQe/VGAIuE3vuVoDKRZ7ivybXdboO4Q5+Q0r8WfyNakDBKq41XPfGP/tyUumCz+z2
         fk8HHkWlZxQ2hzp3vd0IB8ycGBRxu6s1PCaena3cpAdHGzfGSB4/+IF98o6a6bdBjvuT
         nb5+9eLuaavoZdnHxBgwtLXBCbhjGqxzwqlt4Qgc1ZSSW8bAg5VX78Xc6tHmKgB70Bog
         o75lFS7feRanhRsRG56XOq5hQK2LYAYx8Q0Cg6kCBp4lEQYiEQtrWgKH/pYRTsDd4Ucw
         kO/5fEYY/bEarl65TvoFo4JyTW5TpIpt9zmM9ZkvQAu7Rip+86UdwBNIUEayGUJELOHz
         GpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQY3496Gu+KZ4thuSvm2LnWMXA1lW4f8w4ZXMKA1YfXnToEqyCpZthyyR1roECuTeZ0mHR/iZpFh965bx9ZKu5Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jb/cuB+VgeYNYc2bQobewHrKWr8r270O6lPkv/iAY/7M/l5Z
	+G85W4xxxfFNJaxIBlgM6dM+KEXw70lqTqVudp8lqSWuXRLvFaFhw/lOOCFFHITZSfTLmFp60Ds
	6zLYHxVkevZmybQYPqf5o0U9teXA=
X-Gm-Gg: ASbGncsUa1JD6x0MWzbGn57jpwYZf3bOOzGIpm3+ib9BKjdbe07OpZ/aFrdEW5PbHhE
	BkQvbPZB1ofaW26J7Hh+C59ZlDP/WIGPanBJXDesaqXbi2LtEGlD95d3a3KMrhKeQRzdWIr0=
X-Google-Smtp-Source: AGHT+IGq1BQZlpLc+CvZtxDUQ+7vPprEVzPNA1d0MyWaN/4D01igismyTzTXS0V3Z/mXOS4PSTdMSpcc87fhUGayM/4=
X-Received: by 2002:a05:6a00:ad8a:b0:725:8b00:167e with SMTP id
 d2e1a72fcca58-72dafb714eamr60833180b3a.16.1738069806277; Tue, 28 Jan 2025
 05:10:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jan 2025 05:10:05 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jan 2025 05:10:05 -0800
From: Linus Arver <linus@ucla.edu>
In-Reply-To: <Z5dtxESPVtg2Ba2J@ninjato>
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
 <Z5Z06WowFspmXby9@thinkpad> <Z5dtxESPVtg2Ba2J@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 05:10:05 -0800
X-Gm-Features: AWEUYZm38Z474eKpjhMRIXEFk36nkeAzhfIviQ5oE56LTDugmpHo-AfJPm2G3_I
Message-ID: <CAMo6p=E8R=jm81eLuSOvCg+F_bgWTu2vK7PmajHurmaFJkvg1w@mail.gmail.com>
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Yury Norov <yury.norov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, 
	linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Wolfram, funloop.org owner/author here (also, thanks Geert for
CC'ing me).

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

>> If you guys feel that you can explain the algorithm you're employing
>> in a half-VGA-screen comment, it would be the best choice, and that's
>> enough.
>
> I agree that in-kernel would be super-great to have. On the other hand,
> I especially liked the *detailed* explanation of different approaches on
> this website. Which is helpful for users wondering if they can use the
> new generic helper even though the algorithm they want to replace looks
> different. Yet, this is not half a VGA-screen.

I'm glad you found it useful!

>> If it's impossible or you think that external reference is really needed=
,
>> I trust you. But please refer the original source. In this case, it's:
>>
>>         Warren, H. S. (2013). Hacker=E2=80=99s Delight (2nd ed), page 97=
.
>
> I decided against this reference. It is a great book, but why pay bucks
> when there is freely available information for just this one topic.
> Besides, the book is a collection of algorithms and references other
> sources for this implementation as well. Maybe as a second reference?

Adding as a second reference sounds like a good idea to me. You could
also add the ISBN number of the book, although maybe that's overkill.

