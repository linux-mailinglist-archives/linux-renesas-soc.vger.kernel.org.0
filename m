Return-Path: <linux-renesas-soc+bounces-33320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOYMLIxIGWrHuAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:04:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA875FEEBB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D22A330037F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 07:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779023A9619;
	Fri, 29 May 2026 07:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPaWnZXB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12E3A0E8D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 07:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041490; cv=pass; b=O6Y0Mwxlm3Ie+bJmItx5VEbOI9lm3M8pMtTIv5Fk+PGOA6egpY2pDZamIlUGjCQ99HiGaT2dDxF6BrL6Ekk3mrvOGxNy4IfpZMQS12bllIM3HzHmRiPjxTVLsI3uHxnuTt8+bn08MzuvD7WRjGQJhGX9FRhInYH3SCJIXY/0pbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041490; c=relaxed/simple;
	bh=a0KniOszvMfa6XS1uuRuomxsbQoyEQFI7eLxL2NmUQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYDc5OYCBS39u22Zm5U3mUs1yoONRTyYY7zfzklfJirk5wrj27gPjNOOrVmrqXtgOej3pjfDUzUmMUGrh0LpI9xxEHl41N8yw9cRJPWylbau4l1zULFeB6ZTiZh3lWujVU+bh4Uet8vGOZ9KIsrlwOsFpxoBVhvgEGXtvUSGr9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPaWnZXB; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c856db4fcacso867903a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 00:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041489; cv=none;
        d=google.com; s=arc-20240605;
        b=O7q6oGt/3TLhw1vkmnz491FpjWioKNz9d/0zMHGvqNk4B8W0kvLQFwuCpub87N+l3c
         imO6KNtqSq1aE+FZXJw/DyD4F5noM1cSSB8MqlivrNyUbW2eNviRFPulQbCiNQMOapvb
         kjtqYT+0+pq0N/F+NUkAPm1Tu/0xfScPxDK4oKvy15ko2zasEKVOcnYsGsIrRlBhWuOH
         tyJ9WCmTmV6xud3u3BJA0m2pzrlJu2tZi8YrWbLCOG9VaFnrinTcOqRfD9gGExz2VYFG
         0R4iyUZJnyLOBXWIkYek9hupuQ5SNdtPVy5c8BL6yrmJ2cXhvW5EodNrAzjPcfTr1yxa
         8OOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a0KniOszvMfa6XS1uuRuomxsbQoyEQFI7eLxL2NmUQs=;
        fh=rj73joufNBq95qLa7ZQ7grwcA/6EVguv5QIKr6+e7Fs=;
        b=SPkB44rM4WCgbHuzXD+OOraxHHTvl1DwVJa6rwAy74CIOX7Yb7Heen2fh2Kbd6FXkn
         pGEDwSFm+4X9YREPDxEq4cWsWLI9WLFVQ7mNLw+BwF5iIubqEmMYhd6UYEAiTH28Q9d7
         0Ve7XtM5Kq6UiXuSQr5Xhn94HxcTPMkX5p5ZUsKoh27Z3yj14JI7fRFrSHOmVHoEEAJV
         rAip/El2Mn/t47haG8ronxr0C4kmJRGICDjHJmRpmfas25VEUuJLbYr0K+Yu49pGnUXT
         0ohEeXc1M741ylXHdZ/ePuL3CmXXXdOAKJmXqOdQrvUJhiOQAr2p0HYCeKyOjzhx9cR+
         KFhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780041489; x=1780646289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0KniOszvMfa6XS1uuRuomxsbQoyEQFI7eLxL2NmUQs=;
        b=PPaWnZXB0K3VGnxiNC9w7SWFiMeR6BIFztop+8eTkqkHbXHlhHH+nnag0CH6ginHte
         n3xY+4Am3HSGAYVycyefoA+c6VANgtdmhPc67qqPkSGi4gkU73xnZBOeZQ+DeuzM+Foy
         P9KjQgPN8ah/Gkr0h58xM1HlR/THfteyfo9w4Kjg1IKndSY57ALNxrDb7n9sQPVEFKzZ
         O0SauuBMiBemVppr1gf8OHJIHv5NyDPtkkpwtkV53eFWgGLp4PseFhbPO9x0zmcSPICP
         gdQgzMPAtjY6C7S5XRC7FSwOy62yT4G5IWHW7qFA6NGlsnj+cMOOICsylqeVBHeWmbcT
         5/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041489; x=1780646289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0KniOszvMfa6XS1uuRuomxsbQoyEQFI7eLxL2NmUQs=;
        b=n2TQN8AJ0RL+S0ohfr/KcMdqrfubiE3UPlnn9K2AIN5UElWGVmAvcwwOPhfCCVXPM5
         yNjTPbf6N1OLRfiZCxI8dZ1uID8T7ZKxEADVijsIwW1bkjTU2umUGcEBDM99DScr9b5F
         ldc6gol0eAQ+ICN8tL/1K5IoNUTob5hL/F3+1z2R/6heo2XiAjsKStsIRIALw8qDbbQm
         rp8/Oxf7sUwk21zhsP+iDbqAgHMD6UH6Ewpw1e2zW5g3ZAhT9RNxVyHnDvVWimUNyCHJ
         hBLlnZBDh0VNLKTDTs/9CM8RVHE6uUSMJydL0YJC7EFl+4SrmbHmB5J4TVtcMcIdUqP3
         n0YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZZXLVkz8sQDiD68Otn7TZJh6d+xWeSwHioOL329BzNHaLCHnQkIgQ1iO8UenMz/d2lx0c2hEEwndB7wFmUF+44A==@vger.kernel.org
X-Gm-Message-State: AOJu0YycXSYgn1kJ01ftiQYAqLenHc/9F87fWgxQQzL2VclDJBvcFfkW
	NThq6EiM/QPs3kdIqjJ1KBy5ka8+VHKA6xO6u4XL06peCINrQdARX34ejfoWQhMSa7p0c1dgOKO
	s8Gk1AvuTTI6xtRPHkDRHkz10gxGT6uw=
X-Gm-Gg: Acq92OFrNxewAnANfStJpUAHMztpJVXAndoo7ggrYKSnRjit8YrQZ/77cGBZawLekA+
	3QL0BreV4g8X1ynl01t+2hVfaCiI67oc2GFOgo6JKOpTDZEP10aO6CHwVzW0kX5gd/KN29pEIWm
	sjpqhBAqV9WxDeiUG/U0PYZila+m1Mr/0/CoRo/WuoRD89HxNQ/IV6sRy4A4bdSnt7NhPVrmmmc
	y+atYJjymXOdycCLIjf0G130Q1aqielOowpuGhmH3h7B54Ot01pyuqSixxUOObEqvhmxXpHPDgu
	HxzkY/Hr6uE2gUETnDE=
X-Received: by 2002:a17:90b:3e82:b0:368:341a:a925 with SMTP id
 98e67ed59e1d1-36bbcfaecf2mr2292215a91.23.1780041488492; Fri, 29 May 2026
 00:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com> <b8f7581e9311d5579447304ac4f2d557b29e4f9d.1779893336.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <b8f7581e9311d5579447304ac4f2d557b29e4f9d.1779893336.git.u.kleine-koenig@baylibre.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Fri, 29 May 2026 10:57:57 +0300
X-Gm-Features: AVHnY4LQ-jWF2c7_aSBtntPbH41tJ-A1RaFPwn1TJSq1AkOwWmb4Y_coE3Xjxe0
Message-ID: <CANhJrGP7vSUUd0DSsyqgE+CyLp4mgsO0zkb0JexbER7W50nTDw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpio: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33320-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,gmail.com,linaro.org,free.fr,iki.fi,kemnade.info,baylibre.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,baylibre.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0CA875FEEBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ke 27.5.2026 klo 17.57 Uwe Kleine-K=C3=B6nig (The Capable Hub)
(u.kleine-koenig@baylibre.com) kirjoitti:
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

--=20

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

