Return-Path: <linux-renesas-soc+bounces-28423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCzACK9qnWnhPwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 10:09:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78444184460
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 10:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E623831001F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 09:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76856369988;
	Tue, 24 Feb 2026 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsvtQJdz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C3434D915
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923868; cv=none; b=bAZ8NejaIUJJkRTg09l/8YuLYs8CPJTzIfN9T+EZfsdhb7CVzEbj0ZMzgSPbOhyRgroz5h6UGzwQlqg4iOBAOMyKMsH1qvfMz5FGZQSMV3ZV9foI86pwkxDfKpKtnH9opRXN3bySN3K3IWbzAbEfwYmy5awhc+XY7INev1OVge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923868; c=relaxed/simple;
	bh=bQYgmnn8sOYlUFg/9V0yJqhIzqXBbMQU2rAHg1qohEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpaOdRBONiiwRraYVtRKHGiDoShGz9EQGm50OHEHBU0QSnVd3JFzAuevn648SiSZFHzWjrMBX3u7jKeGBkgRg8LDHZ95fUQlP1hkBGPVpwoCBX+XTM6bidFpudYkJODmY1vvt8kmeeDt+zQNsCpyE3QNVf4NjkZkGBcbu2PB8Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsvtQJdz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1FEC19424
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 09:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923868;
	bh=bQYgmnn8sOYlUFg/9V0yJqhIzqXBbMQU2rAHg1qohEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KsvtQJdzn3KFvmSoN1gUDA9p8jtBuzteEtJg3Z8YolPE3Dq4Uy8Bd8VoPkLO12L5H
	 mM/mM7ll8joM7abb0jX/2A46asBQUle6HccE23DjmG+ShxEX4z+ibNUEBlJxPTKp4F
	 sx673+/j33puviSlS6+6mlqQnnLkQnd+H7elYy8eGDltZD6kumMQwD8wj5VqR8jYta
	 cuh3grk/URTAnSZiTerm49sBreZ34paHQ/tjtoSOse7J29I6JyzOrnKR6NKoFXEP2C
	 cc/PA9XJt4EmbsAX/8wKJLmvhx+Jag3lXhmYilpJacEKrvE33s4trSz3j1OqVjTghV
	 h6Or3ax6omYWQ==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7950881727cso37394267b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 01:04:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWO9cY9wHgJkYdxPxYeSfOnXDCyEvtLzhwJOyeSP3Sn/c8HJEuXld8L/suIRhrPI0Xj4VZwsmB0A3l4D/8qY0Xftg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc+I8vyN3Xp5EGLeRdzxgCRx003mxxBFzFdCWWsKt6KGkTKK53
	H6xpQianLWhYXBu4acIrOLPMTpfJ9F5rPyc86iFI97fT4wWcUV5WDc5i0YU+X3PM9EdygJU9P+V
	Gdrv5S9bnLOrqdiPbKesBUioIkGr5VC0=
X-Received: by 2002:a53:d007:0:b0:64a:d312:47ca with SMTP id
 956f58d0204a3-64c79072dacmr8416529d50.77.1771923867291; Tue, 24 Feb 2026
 01:04:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYnyl-Nf4S1U2yj@google.com>
In-Reply-To: <aZYnyl-Nf4S1U2yj@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:04:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLmvck+_UG5cNKLCVs2PJb2zynvhr8EbVbB6cYU9925+Vg@mail.gmail.com>
X-Gm-Features: AaiRm51uKefiPMUGTC2iK4ftF5TGZPurxc4swtyqTTKWnBbTWws6yw-RnAyZMSc
Message-ID: <CAD++jLmvck+_UG5cNKLCVs2PJb2zynvhr8EbVbB6cYU9925+Vg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28423-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78444184460
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 9:58=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by rza1_gpio_get() is normalized
> to the [0, 1] range.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

I expect Geert will pick this up, else tell me & I'll queue it.

Yours,
Linus Walleij

