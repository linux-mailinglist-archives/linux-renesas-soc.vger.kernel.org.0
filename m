Return-Path: <linux-renesas-soc+bounces-34785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x5a+DraJTGrUlwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 07:08:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9929A7175B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 07:08:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MNa9a8qO;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F2AF301A7DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 05:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CDA37F75A;
	Tue,  7 Jul 2026 05:08:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D17D379C37
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 05:08:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400882; cv=none; b=fjlgMqorir0heRUoMQjlVmHlC5iWA5kvDT35Gz7MtI5n5kUYPUi9BFG0xSQa5KwcvRlLDXpMEh3TH3WgPR8msPgnUL5hgELTSd+5z8c7ckMJYluRokW2AmRvzibjKzv9QI9ZvW3c9EZuwPmTaJ3J/lVU3HE7JXGWlAM2emNIAvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400882; c=relaxed/simple;
	bh=+3wzVO86JvHn/zy/QiAav3aAi02uo3iz7iLz2++JB6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIJ34D62ccOZwT+Vpnpo1Ym6kYBkXrn8ilVTw2chHjiOPGcA2Es4nuakBIkkkoL56+gXyrSZ06VeLn6fetSNYgUbcyTUgtT52Cwm+nli/GaHLi3RYB0p/NTiPGpqJVzboxHUqcXemDq+LKh3e1caFcYH9TPcOJkKZR/+SQPkn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNa9a8qO; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38175907a56so195886a91.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 22:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783400880; x=1784005680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWdFSvLr4RwKy66Rs67JQ/ht1Wwyc8ZXtBXqpIcmCH4=;
        b=MNa9a8qOj3ZiPnh2vJo5m59YVRbZBD/JKgYXh8+W2755TcvCqEibgsspq8dQda1bu0
         agUX2LXCJ/u+ZtxNMZiL/cE7c2iXRQsw3AT0YuWpQ363ZG7JTnwDPvI5zRwkMnNLDUiL
         gxE+KyCAGKyplyMgaDsQL+PO2O63IWcFwtHxPYcHP/arK9VmOgxSxMcNDs37suceoJWZ
         jglQNaaErSSAx+WOfs76gSbyTfspBXSU3JksY8FGxJ8JYjHcPWbn+BT3eQwK84GjLOZn
         SnsmzdJzHr8xgWnem87d0Zm6As8gtOcpyqwBDzQI1hRPjNFrd9CNRFGHHAirGxDYjgKa
         VycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400880; x=1784005680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWdFSvLr4RwKy66Rs67JQ/ht1Wwyc8ZXtBXqpIcmCH4=;
        b=W0oiQIiIyCL6+1nMtAQy3Z6kXDX1GQgSptGco8ETuVPmYODw/kccPQv9thPS8r8R6D
         PF4A+Qqbr+4ogf7UMHREP7NEmNfvewH2KbN65G4gRjWEELVHBNeUECZKWS/dULh6gaaB
         DHGIZIRG4Tsb7g4sNDA9mpnKMPJki9RnYyfMTkcbxE5YAeRrNnch6FwsmFynyaliOnPd
         TzlOdJf53XNIjJGlOYc8pxogScvzXMX+syDVBDBNTq9Wy5wSGgeUF5t6Oyq09/C26bo/
         JqbQd5Zg1JsHHyalWrSCjrjr8GVG4bZYITtver3UBGoFOTj63+wiW+00km7453tOfs3O
         RUhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhnBNOsq/AWb3j/Vcs/v0i1a0XOMkt4/mgFcl6DCnj+EHkkZu9AQXtpj3faXOnNfvUIdOMav67PluXFpzJVpCnEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnMEUgiPJkj009F6beDxVJ3UwwmW2aS/sWw2K8U2zVe/vOGExG
	lptS6tiVawIv5gAr1ATJZWiV+jRLyn3nlC3Kbu7tIlYSLTTKI0zKU/p+
X-Gm-Gg: AfdE7cnSfA8gwfEcCB2L3RHSz9cLluNVnhgcHeT+MTPTIZKBJkMahxFN2A1abM/x3lo
	CFXCDQBOFsXuw8lanrZ58qcB1b1XnYhBX1QXleQm86O2AYVXpaCodWrksjLYfKOm+WtDryxz+Vg
	lOVQ+yZNCq6Uq83TBpySgIDt/ygK+kwXUh3V4UxWbavIQgY3gGXvzQqjb5Fxcj5gsbJuuGs/h9f
	kdwO+KFzfPJxZRJgPeVPd1P5vKSZ9OFsYOgoMie4gXVGWDQ9wkWS6BqvxY+oyJl7jJfevVUTQ5/
	wgiq6ulqyv9q67y8hgqAbVNASf8Sc44klmAkG/xDscl9C7EvnXD2NElLi4dur0wnsWmoyCsZpbe
	S12uAzw7w8uIsq+zKhUXWoe6bxDsgr3QVBeoWDAsa4T2XcnbJbnCIJjm+WE15wpdhYcsPauhB7f
	SnNob67PKz+ZlXvADkp1PGKq3fBDNmpwlmFHWaIUDBWFd6aD5DH8oOgPmKRyfDM3X2
X-Received: by 2002:a17:90b:5628:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-387d880ae82mr1470644a91.9.1783400880337;
        Mon, 06 Jul 2026 22:08:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac0557sm4212818eec.26.2026.07.06.22.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:07:58 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:07:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/5] rsk7203: switch to using static device property,
 drop legacy gpio API
Message-ID: <akyJOW79W0xvI-P9@google.com>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-34785-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:ysato@users.sourceforge.jp,m:geert+renesas@glider.be,m:linusw@kernel.org,m:brgl@kernel.org,m:andriy.shevchenko@linux.intel.com,m:arnd@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9929A7175B1

On Wed, May 20, 2026 at 10:13:16PM -0700, Dmitry Torokhov wrote:
> This series of patches converts rsk7203 to use static device properties
> for its devices, including gpio-keys and gpio-leds, and removing
> dependency on legacy gpio API (in favor of gpiod API).
> 
> To configure pin functions the board is switched to use gpio-hogs, as
> doing full conversion to pinmux is too challenging without access to
> hardware.
> 
> v2:
> - Added a patch to isolate the function gpiochip from the parent fwnode
>   to prevent ambiguous property lookups
> - Added a patch attaching a software node to the main PFC gpiochip device
> - Adjusted the board setup to use the PFC's software node for LEDs and
>   GPIO keys instead of creating a standalone node
> - Added support to sh-pfc for configuring the secondary "function"
>   gpiochip via a "functions" child software node.
> - Converted board pin configuration from legacy gpio_request() to GPIO
>   hogs, using postcore_initcall to ensure nodes are available during
>   driver probe.
> 
> v1:
> 
> http://lore.kernel.org/r/jwtdoptatzfo47mbpmmjwhhhjn4mbw6ekp4gtoopca7azbcelo@uvtz4w2ga5qn
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Gentle ping on this series... It still applies cleanly and we need this
to be able top drop legacy gpio interfaces from gpio-keys (and
eventually from the kernel).

> ---
> Dmitry Torokhov (5):
>       pinctrl: renesas: gpio: isolate function gpiochip from parent fwnode
>       sh: pfc: attach software node to the GPIO chip
>       sh: mach-rsk: rsk7203: use static device properties for LEDs and GPIO buttons
>       pinctrl: renesas: gpio: support software nodes for function GPIOs
>       sh: mach-rsk: rsk7203: convert pin configuration to using software nodes
> 
>  arch/sh/boards/mach-rsk/devices-rsk7203.c | 282 ++++++++++++++++++++++--------
>  arch/sh/include/cpu-common/cpu/pfc.h      |   3 +
>  arch/sh/kernel/cpu/pfc.c                  |  20 ++-
>  drivers/pinctrl/renesas/gpio.c            |  28 +++
>  4 files changed, 254 insertions(+), 79 deletions(-)
> ---
> base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
> change-id: 20260310-rsk7203-properties-82bf2c12b985
> 
> Thanks.
> 

-- 
Dmitry

