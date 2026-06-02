Return-Path: <linux-renesas-soc+bounces-33471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ICNOClptH2pvlwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 01:55:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80380633050
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 01:55:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iEJLZDiq;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3A50305BFA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 23:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5003B3BF0;
	Tue,  2 Jun 2026 23:52:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4B22C326D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 23:52:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780444362; cv=none; b=PmHUkC8s2GAWXlyd3uYC6soeEN2bUB59kUW3JVKGyFrBDXksdSW6xx00SGifB7JnwwPAbpp7ccwl9KH3wecF0C5sfqQ2A88lHJynjQqME+QIPv0BEzkZrMu0O1uODG0fnqWzlWz9Wv5bZuKhQ5WUMnaNT57cI62yWSCXR5NUavM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780444362; c=relaxed/simple;
	bh=DIOSLPNBW69lrRHH5x5amd/IZx2BHF033Uckz1NfcS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZ8uC9yyqx+XOZfZeyq2CD2Clr4y2XmITY3G9qeH6rmDfYnYvY3hZFndcC5Ae8X7zI4QWS3Nj4HG8OUNgs18FhQTr1OMenGBNF+9FOPCxqoZcn5H89xNPlBMaqjTfPjTJCG+rvQs525ZvfBTtz+9RRl+rYL6rlgKnlDLb3z4I2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEJLZDiq; arc=none smtp.client-ip=74.125.82.173
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304f590dd91so4669156eec.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 16:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780444361; x=1781049161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iUBmAXGMJtpetlgRRPvXQnMJB+mGBvoOosal8pF9SxE=;
        b=iEJLZDiqvccKOE/Q1Ki0SjqZuspJenASKkDnz68A5Oz9r38JlwuhgAvaU44eoj/aZF
         iEBgguYTC6xwOnJP2bmzbnIJ2zxJxFBhP0BOVvKr4Ag0Hl1gOdWgKPLn54sW0hWYxC87
         Lzi4jRfEBlx+QKv1RtTsBPCWALqmJnglB4DMttEC9JFMnb7tr/CUeGV2kZTzaRnnmOrA
         vYi7Qa9245cbLc7w7vkAOuOp2mTLhsp8aR5MsSVcweTOSM8SxxvhjetLF2tvuywDQ6nG
         L7xknRtdAPCW4YMNeEmpf+oyrS8mveSM7A4WHOyHxB2ISJ+W7KPW6VHrgXuGfYuf4jDF
         DN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780444361; x=1781049161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUBmAXGMJtpetlgRRPvXQnMJB+mGBvoOosal8pF9SxE=;
        b=Idepl3rJo+vHCKqeEgxbUH5ghNLcRLWzDUROR/gQ/mBUwDJfkvPVwY9ODyUCfu9RVf
         nerW3sbRG89aMi/Sxx80hNa9ur/77V4a1r8mONmkGclhX3lO/0Ss2DCI6xZ6VbC0SD8J
         daNRdvsCkBgOXtPmvDifOnwCJHv75lVx0IJH3+Z06t/DLA+tPwVnGB5W0PQTP/pPdxP0
         /bXEZLyybZhT0VLLrwGgx4aRaGIRRc6oUi8V0eTCukgn4BnkfOuKoTJM32GZ2sPVVm44
         76NkPv4RKB/wuh9IQul1GUH0M4E7Ovvv8JgcE1G+FNED1T2cFP680QWSmc195L+yEJ/E
         l69w==
X-Forwarded-Encrypted: i=1; AFNElJ/EpPc0NTtnUXOnrcnM/PwPLFI47y5F8MKow7fXVOlculiFIEX+A/JaTZk+Wj4jsYTi+9yFZ1+thrAhjNXSkf7wOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOdxzgUiBvZTQjqFUvy+hfgkjwDVtZ7JKgnYmONGNNJlE+Sm1X
	k2Y31SP9f3nxc9IfwzDD9Fb7F+lk2H/0nqDar7FceKNYaX1vkDX9GYXh
X-Gm-Gg: Acq92OEw4jrdvhhHR1dytULM/HWQDM5YM/P7izuLpHaz8/J/IT9/Tjy1PISuAfSysTO
	sAzk5flaP/aezMIqmmfzrmt7Z00h4NSSGWPT2kPpr9JRdwMDvCvshIDXkWRDLxJUm9vIw06hNea
	Rny3BgeVs3tKkFKzFu7Y+jsI8qL9Ou2OOgsrdVJ2YnaXNFJjGQOaC4U4gx6ke1IClfiRKHPZO9V
	2k5JmZDwRVYVMsZ43Lb5S94pDvuMBHuuxA2/yP6JcdvCQ2hNXMz2mYrQUG+OcAUYac75tdiAkdX
	sHa0hE9OpVQFlZQb8LrYH19/yPdOXZfeZsLSvUMwFrStA7RIW23qHPMIKePguE5/Kcxw/wDKO1K
	anpHS3TTJMhoK61p1L7NDe4bFCksnlut60I20M4pH7U5evOWSSpn73c4Y6hoQymCG/wklOBLtpC
	fjAMeRdKPSaPCP2Z3pQXTnf1/Jy6pVFClOTqyoNpgmyQI6Egl1B8vOknkZChOR1CrNmPv8iakuA
	CM=
X-Received: by 2002:a05:7300:bc03:b0:304:562c:2338 with SMTP id 5a478bee46e88-3074fa8d4d0mr552498eec.14.1780444360805;
        Tue, 02 Jun 2026 16:52:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c4f4:520b:1304:b259])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm1165076eec.13.2026.06.02.16.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:52:40 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:52:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/5] sh: mach-rsk: rsk7203: use static device
 properties for LEDs and GPIO buttons
Message-ID: <ah9rmXIlZZUHAgag@google.com>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
 <20260520-rsk7203-properties-v2-3-465f3308021b@gmail.com>
 <ah9TEJ_jrfcJwrb9@ashevche-desk.local>
 <ah9TXCcBPNh77Ut5@google.com>
 <ah9rHgAvprCTwEed@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah9rHgAvprCTwEed@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-33471-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:ysato@users.sourceforge.jp,m:geert+renesas@glider.be,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80380633050

On Wed, Jun 03, 2026 at 02:45:34AM +0300, Andy Shevchenko wrote:
> On Tue, Jun 02, 2026 at 03:06:14PM -0700, Dmitry Torokhov wrote:
> > On Wed, Jun 03, 2026 at 01:02:56AM +0300, Andy Shevchenko wrote:
> > > On Wed, May 20, 2026 at 10:13:19PM -0700, Dmitry Torokhov wrote:
> 
> ...
> 
> > > > +	for (i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
> > > 
> > > 	for (unsigned int i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
> > > 
> > > ...and drop the above definition of i.
> > 
> > Why? I do not see coding style suggesting this. 
> 
> Linus Torvalds.

Context matters.

If you want this to be a universal requirement work on adding this to
coding style and to checkpatch. Otherwise declaring loop iterator inside
the loop can be beneficial but in many cases it does not really matter
and can be left to the code author and the revealing style for the
affected code area.

Thanks.

-- 
Dmitry

