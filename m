Return-Path: <linux-renesas-soc+bounces-31213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCwvJ4es22mzEwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:30:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BA3E446A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEC3B302453F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4356F37AA95;
	Sun, 12 Apr 2026 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYQDKcj/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD1C3783A0
	for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776003937; cv=none; b=dbtfXuW/qUPnV2RZlgIzGfTZFyC9i4e3oeEx5wobd8HFXywQInXaRq675XvM1rUJb7ohzf03Pt8QzcbeuVSkkob7Sms7kKWx61/ePdomCFqMU0TCgilq5RNUXkyyuu3CAKai/aSfORO1GLN+C1RLs5skPxrnJPw9ssMggSqpo/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776003937; c=relaxed/simple;
	bh=VVOC4s3iXK2PZz2ie4uah1Tby+qhawXzz3OeBhh68lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNBB/QuWUPd7JsGgZno4zg7Lew842eyqjzQYtClDBKPLKmKOlddARjWEfkz0Ye96paQr146gN6bhSZo9GeF5kPT1tX/t9GI+rAu2iHTk+pOnlhfo4mO3Y36msWFdJE9SnRMUMRs09hFzV3NW1airOiG3AWXyCarfsins2uLALeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYQDKcj/; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c1a170a50so3179661c88.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776003935; x=1776608735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M30xANEd1ygJtod+3qHO0f8EgzfcgPO7IE86jmDM8co=;
        b=mYQDKcj/J7p6alVm4WoQdQH44A1GyVjfkCjkCpzqUZCawHKRfekA7UJvuPWlAOeLJc
         KAlLbYwtNH+U/Lzvy+l1eYgOay4SxSdtZ3iiAn1qiVQv0Xshql9ka2r0hjlX3gQkYP9x
         ct9KGzIOtCvwTR6giQqGC277eHNqf3UfyeH3ls8B63IwnSRrv82bZgZjAIhkBF6TBHEI
         L2k2bESdeWJSNACi3C5jpCUinrBEZW6VEHmgn5DAS6QWOqV+H4ach8yjE4XoLSDtHROF
         xafMWOEpuXapzryx0v4EROOkpLpcqjdfQq62LOZvmEqVFxSH0/c0vg1s7CnybywlL271
         jjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776003935; x=1776608735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M30xANEd1ygJtod+3qHO0f8EgzfcgPO7IE86jmDM8co=;
        b=RbOy7gI3zkWf2ovBUuUUUKy+H31gcvSVkEQIAlsvDcno5oH5xbFF1hTomsIQ59xDcO
         /UA5NNLkAH4nu9kiGd8J3KDxqAE7DybYR8xuJZE7Q788j2j3gYgDvDn679+wTtdhlpHn
         H07VTNRX6DD/RLrQw/uQkjDpzd7xFHSA4ntpK6xzgPqx8bytJr+pYElB7WgMNl1pBcjF
         kpcobUR+lZlCpMxPREKl89+LeSuAc7ega7d8dGhRIurppRsUG83xmRzEqGBWc0ejzqlR
         a5xJZ91UTDqkrhiUUiDVFxn4RhKQ8erSExpMasEWm65sJnPNoknJM6dHV94c7XL7lvbJ
         x8lw==
X-Forwarded-Encrypted: i=1; AJvYcCUqk8ubhjrbC1sgxqv+uIrDZhQynSCP8OviMyxfXnDuIYQEdsyR5ncPtfDIuFeRDbHxqYm3vX7fRCRkEGEzM22ZUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFm6CvrM2CrkFEcx8eaZRMxlKJSrH07OaeKeOnaGK2kKMRgaq5
	rSxdTePIszAfFM++H3W9B2A3sr8Xp08C+vPFbHRWfxRAnqyLXQUtDTjJ
X-Gm-Gg: AeBDievukBLbq9A3vUTUxCxzGrGih7b+HkWcZ+F2ERhARabsoYiZjndc9SOQfv2zP7P
	JmjolMK9CUZ0wAGyKwWrir8v8GzrV6gF3oAr1pUmqcjZjLJ84ybzGpMbC0tKHhKUiBURZzPgWOD
	E1tZBl8Lxk67tx8kQmr7TCLZbXDJHRdxDYFKvR2xuCyEIylYF6HlyGVgKgn3SiYF2JWY9q9s+m5
	6QIxdflQUiFNpg+WlDYFVF+boUNRzUCgVtTVvStu0I9L+XIIjuE1zxIVxeE0zURMiBufD3A0QeO
	R966p7iHrIpT5ikXtRHGXoDB6ISRHDzqz55fk1F+fZpvoTxuBW4OrzHdLLAfzRuyOgmsBxjoMUn
	M3hqec/qqm9ABShAJdtTFixMz3JUpVEwqd2BK/uEVVWNKfCH2Na7F9CZN5i4oZ1mp4cqlSNl8tU
	z1/FQG8geOH0fOssPDlSCBcYdxhMd++YedhZWD9jwnXJ9OTVs=
X-Received: by 2002:a05:7022:6894:b0:128:cf5c:5356 with SMTP id a92af1059eb24-12c34e68d6amr6026225c88.5.1776003935113;
        Sun, 12 Apr 2026 07:25:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d8dee27fccsm1501965eec.28.2026.04.12.07.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:25:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Apr 2026 07:25:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v1 1/1] hwmon: (isl28022) Don't check for specific errors
 when parsing properties
Message-ID: <b2c92ca4-51d1-4253-a77b-17fc3f9e0894@roeck-us.net>
References: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,carsten-spiess.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31213-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 824BA3E446A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 19, 2026 at 03:05:32PM +0100, Andy Shevchenko wrote:
> Instead of checking for the specific error codes (that can be considered
> a layering violation to some extent) check for the property existence first
> and then either parse it, or apply a default value.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied.

Thanks,
Guenter

