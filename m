Return-Path: <linux-renesas-soc+bounces-32906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLwnN1PODmpoCQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 11:20:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C835A2308
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 11:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F6E03086817
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 09:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9F123D297;
	Thu, 21 May 2026 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxogNg7l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0320336997A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 09:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354875; cv=none; b=LZTfP6HhsGEjj5/k1UDhtBdkSwgnpHZSv2vBJpj2Fg2NHdoLp5IdeFnUF3pQO9Ri3je092sdx19dWBkCXniOGg4ErJ9LxJNfFKLcE8UFfF3sK9rdXLJr/Wxj4qtljTrahrdyihafBD4R8ziJEQF+4V7/3nlnNNjJWO0M6/RfKgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354875; c=relaxed/simple;
	bh=jNuoxjZvMo6Jgup5tnUJClP0fblgmtv3uErnOkOncoM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+9zOUotu3v6VGTclNybJjjjEych8xD2KkECVjJ97tm62cgmsj4t18tpzCDKdCqrUBoRt2kqJ4GCzMvMBH6AZj3KsJzCfXsfVrUL+xLQPnfeHqMgPauXA17M4O0d0yweT+0rJsaHEa74kqcYEoIQXqjSQ+s01Zqe5Vrh6/t6Mtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxogNg7l; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8261F0155A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354873;
	bh=jNuoxjZvMo6Jgup5tnUJClP0fblgmtv3uErnOkOncoM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cxogNg7l1qXEYFBamqNrd8hkQEn3EoPMaSqcz6iCiEOMVtaOCBn8VTV2GXUUgc9pH
	 td+4rPYZxS/nTAz8Yk5xvRSfvjkN3aK9PTQon7Sr+Jr0Gphd7gYB5XLAbSCK5tzyqe
	 9EWGCTGeCfSDPaIjoJ1MK1QANz711YjSR4NsCTkWQ1xqzmXv239Sy4i8wE2hWfE1BY
	 SXVg5LrQZvkyTMY/PePM+ZnBBdenPak2go4KXtxR7AS0nO1lEwpLvsUO2Zgq7m/Hmb
	 JZyYgFbgxr901p5g+CHSgPDpp5o5gmSeG+QpWJyhSb7Q/Pw8hj47dQh0PO8mgp/Urt
	 9ihffcsEujsbA==
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13621cca8f5so1729704c88.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 02:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/f7GTlL99iAPHwo4rwJOGiOA24sQGr1ZpSadblB/gb3ikFOhf0hu8YtyBrO7c6lmLoa5wiM3Hyiig/agjSRtc1Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyOWoKQ0L1xlIC8L4i0BAqPYUMyxLe7iJCNjlAGKtX6ksNal6m
	i/b6chKt4PNRAlkH7ndhYNlMHrH+xdDXPVHrEUqafb3Ktf3MxaTmTNGaQkOySd4h2InEoXCPwOY
	WOzf0dPa/OB8HQXdWLrtTJeJbEyOrJvMaNrrfWcYASw==
X-Received: by 2002:a05:7022:f312:b0:12b:fc21:874d with SMTP id
 a92af1059eb24-13632d44123mr623001c88.19.1779354873386; Thu, 21 May 2026
 02:14:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 09:14:27 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 09:14:27 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520-rsk7203-properties-v2-5-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com> <20260520-rsk7203-properties-v2-5-465f3308021b@gmail.com>
Date: Thu, 21 May 2026 09:14:27 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfFDeFqo2n44VLZEEFhFOzfKX0bdO3DR08uiNC8LBZLXw@mail.gmail.com>
X-Gm-Features: AVHnY4LoATEnodB_zt-b1si7q7FaQdB8dn4GF6c9ZIQaby5NHH8SRjLCl2kmz7M
Message-ID: <CAMRc=MfFDeFqo2n44VLZEEFhFOzfKX0bdO3DR08uiNC8LBZLXw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] sh: mach-rsk: rsk7203: convert pin configuration
 to using software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32906-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85C835A2308
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 07:13:21 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Replace legacy gpio_request() calls used to configure function pins
> (SCIF0 TXD/RXD and LAN9118 IRQ) with software nodes describing GPIO
> hogs. These hogs are attached to the PFC gpiochip node, allowing the
> GPIO subsystem to automatically configure these pins when the driver is
> registered.
>
> Assisted-by: Gemini:gemini-3.1-pro
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

