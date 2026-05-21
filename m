Return-Path: <linux-renesas-soc+bounces-32905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE91N1XQDmrOCQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 11:28:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E68C25A2546
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 11:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F7FD3001583
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 09:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F023655F0;
	Thu, 21 May 2026 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4LePJCp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4CF368D5A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354832; cv=none; b=JfZSTHfiEw4yfqtUG/oP81CPTlb9IozzQmOoazVMnKAmcP2LIU5D4qMfzHtTTuDu0OIMaNEhkeRTDiNf7Q+A8YIGIuRBN2BGMW0Ia6FIwOC7A5LPis/DJHB764sGP+Y6SEPoXGrUqOpCaAqWioRlAvIPI3hOYbPzEWcFB/0cjIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354832; c=relaxed/simple;
	bh=0vBPw7VjKlz+RexFcUPzVoxGG58YG7pfMZS145Qmrc0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myXkt93F0KQzS2j5g864FWh3I9zUjjY0UEgXKuGvtlxLIJXnerzYa68dBttwG/1zPD0D6NiN8uyk3xF/745FJtcdFlM/WVTX2n088LFqW4IecMUDv2d3brqhJP7pukB7LWabDEADZhhsGAJKP2OBTyzbZ7hZopQEw4ozeg2fW4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4LePJCp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457061F00A3D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354830;
	bh=0vBPw7VjKlz+RexFcUPzVoxGG58YG7pfMZS145Qmrc0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=I4LePJCpmSpxLP+QSZzZtWGYMLO2XpjTx2AWROM284hAgNMgZY7zSpiIHSSn8Y+88
	 wuj4SqKvulvrIIS7f+W7wu268Fr7mnNi+DWID1KW1kKNlLqToMahogYnf0dQt25CY0
	 Sn/xHyigx3dejaubNMEOpWgo44+jh6fYKMNxgluEB6ZKx31j7rnb5cPFQFqnrwAHDk
	 Iww4hAXBZC8irijXzDnM/hBzrdrdqdgn7nE6SJZ6v/gYdhj6qt5KT9C19dToJKwTxa
	 7espEeLWNxENt/K/9IbAt5Vyeo0nAEn4MhqDQA6mUDMMNJvM2M2mZ30fXRneqev+uF
	 /Em1NEiArNA+Q==
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13643f6d1a9so101309c88.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 02:13:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Pf3l9YMa3JAKfxx5CwD705N+SEcD83+R7CU7eri/tjaJ3PoaSlt7KOqpgDr99AN5MEYOCsS8J7ZET05/Ijj+h4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvNy5leRp8YnV7CF8xyhJTxPjZOKx3rVOHctUo1YMeAqaUA2sJ
	nvN3yrL1UaeP8rUk5kkhrh1CI58VN/tk45T6u/b9I+Uh2o4sFX/qHPuU+62BqqXXQsu32zn2A+j
	j6L//oLk/vedD2HyIBc6Q2WPlcMfp7m39erKrYCfWYA==
X-Received: by 2002:a05:7022:ecc:b0:130:5c90:5a22 with SMTP id
 a92af1059eb24-13632d46078mr839041c88.42.1779354829751; Thu, 21 May 2026
 02:13:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 04:13:47 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 04:13:47 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520-rsk7203-properties-v2-4-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com> <20260520-rsk7203-properties-v2-4-465f3308021b@gmail.com>
Date: Thu, 21 May 2026 04:13:47 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mc=vRLNyWwzmERjXNuFmi-LFfwLJd7aG6ZM2RTi=Sr03A@mail.gmail.com>
X-Gm-Features: AVHnY4IfLFZw7KJUVevq8YdpY49HKtSOEdxQcctWDLoc_Mgggt3xtpZpTVf3yw8
Message-ID: <CAMRc=Mc=vRLNyWwzmERjXNuFmi-LFfwLJd7aG6ZM2RTi=Sr03A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: renesas: gpio: support software nodes for
 function GPIOs
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32905-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E68C25A2546
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 07:13:20 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> This patch extends the sh-pfc GPIO driver to support software-node-based
> configuration for the secondary 'function' GPIO chip.
>
> While the primary GPIO chip typically uses the firmware node attached to
> the parent platform device, the secondary chip should target a specific
> child node to avoid ambiguity when defining GPIO hogs or properties.
>
> Update gpio_function_setup() to look for a child node named 'functions',
> but only when the parent is a software node. This ensures the behavior
> is restricted to legacy platforms being migrated to software nodes.
>
> Assisted-by: Gemini:gemini-3.1-pro
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

