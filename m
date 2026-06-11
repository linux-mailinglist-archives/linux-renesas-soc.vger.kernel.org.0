Return-Path: <linux-renesas-soc+bounces-33862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZxbADfJsKmqhpAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 10:08:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8543666FB3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 10:08:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 096F430B563C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 08:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B520F2BE621;
	Thu, 11 Jun 2026 08:02:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BCE3769E1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 08:02:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164971; cv=none; b=S/EMwWoxCC/PxbEt4OkdMSA1Sa8TbSXDB1ZhoBRGS4lvkatGJikB/qYDj0o5v+c/cxicjGtv6ITSaiAamap41ffVxw19ICUGw6dvG3Snh/VxXEf5FXHhHD1uyW01NqZiniuS+c3F/cFBQKk32uuldQk07HxrOiVAGMP3xJFRYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164971; c=relaxed/simple;
	bh=5zL0Z6X7165+7ISPsPo8Jg+DzQNbIFkl5tKsObApxbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QV9ijtriZsE3oyhjClvxxWGHFVFlrXJAwGIP960Z2TxwgXcl6G1wPKP3Dp27xqc3iiF+aAOo7pyAfoSOI845vI2uZK+uVWXpHDnY8lW+gMCoLny9ULb3NjkhYPSDRZY/eLahWdf3xIma19rEu58J58eGuyIwxw1GeAnlvO+nArc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9158643e538so682997985a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 01:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164969; x=1781769769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg1AD3f/1jWyYR3P0Z5p8wEPI+MYZzqh5FcI4v1k2P8=;
        b=eu4TuxvSR8YWfsyS2T9drx6xhwor4eil+sRvfHq+YN1te0jtJ6mV0LX3dBlxEdUmBg
         KiKiVb+0eX9TTNhW6+bo5Aws1UT0G6WJOqFu/W4rJwAQPh40rWN7ygp8S9LwcGhkdKH3
         Vhy6EGz56Q95xKG7DuHg259g2p2Al/hG0rpZ07r5j3NQhLSnZiZNNlgXINA/5vL7J1ve
         7/bRrKLqDOXWn9zmQ3vutliOZgqYgGp9g6nn72ydXypS99xiX9097d1b6qYlr4JfVZ3J
         1I/XmqLEYqv6kehH5zgkT1KBY4UqXpeGQvhH6xjDuB7jwr+RiMLq+Q9rfYk8WKb9HcJQ
         4vtg==
X-Forwarded-Encrypted: i=1; AFNElJ82Yuz6GsPk/zN/CNYyZckIJAURyW+RJUOOlVkTC748z5mYizIHT6sEPIISciqXhej+Cmi6fahLdEhqPJsmhcHYdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Ma3TUieVOPK+VtTLkgjHuPpX9eeYNw0vq+F2xwZgln6OL86V
	cLCqwS2B+fXNSsw+nsc9UC7HWme6/OguIIWKDTYiWnrDIWVs980CGpm+k+vI+ssw8vQ=
X-Gm-Gg: Acq92OEVCdN26ZEsAtXiaKbUAgljSAKrfVTIfP6uIN5tqk44oyQYzRoK9HPwodMeRpl
	gpfiNJDt5EGWEJK0cl8cnenKBn1HC+R3l9YWwqDwShhRqZwNw1VvxSrpx7CQUV9DTX8oirG9quC
	FcaCqbt+1l5GGEb4UbiP63jBUV92ADhxk/MnhCO5LKdqwTmdtM/oKLCQuVxrd1TG6IFzYL5t2qW
	KJEv9zRgjHXmOTA4vR3wp3AqWjFFl60c3wvstw45z3S9qlG73fGNTy24FuXjqRwZRKbe8aRqFfZ
	2Z5ONyi3gkmTsS6AzBOvp2cna/78u3guaCB7Py5lkO4COC94o7NrYEo2rKiBdgY3lZDmBRAvRMW
	mfo38PJAjhLD8lT+7+uNsDPBERrf+0i3LZ40NJId3OBgT4pMXWGlthA3TuKajcBieTVd5CV4JHu
	5QkewylYEzU361ND6PWCEThxLDse2ix1rHtRgOMCP7c4y5QYFO5B3+whxLkCLOqjwIk0cCgDI=
X-Received: by 2002:a05:620a:25d3:b0:911:1a2c:f953 with SMTP id af79cd13be357-9160ace9c6fmr227197585a.20.1781164968609;
        Thu, 11 Jun 2026 01:02:48 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160b03b485sm117626085a.39.2026.06.11.01.02.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:02:48 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ce9ddeddefso82924046d6.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 01:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8M2eR33HHIFJq6oS2iLlHObit75KvC5kOD0vAY9t7DdbraQKsQwM7RawTI+DQMJOSKaOhldsGf+XIqxMUu0XGb5w==@vger.kernel.org
X-Received: by 2002:a05:6102:54a0:b0:631:28c1:155c with SMTP id
 ada2fe7eead31-71d5d8a78fdmr441637137.7.1781164516527; Thu, 11 Jun 2026
 00:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 09:55:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkxCo3p6SEB4a=wUY+qXE9AxqmYtsGyLH_+wb_e328Pw@mail.gmail.com>
X-Gm-Features: AVVi8CfMFk11kDzU1W7A90vpbtR6Nnss2ELpEbzCC4jdTDTJHmSm7MM16QZwFsU
Message-ID: <CAMuHMdVkxCo3p6SEB4a=wUY+qXE9AxqmYtsGyLH_+wb_e328Pw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a77965-salvator-x: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33862-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-arm-kernel@lists.infradead.org,m:conor+dt@kernel.org,m:airlied@gmail.com,m:frank.binns@imgtec.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:magnus.damm@gmail.com,m:matt.coster@imgtec.com,m:mripard@kernel.org,m:niklas.soderlund@ragnatech.se,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,imgtec.com,linux.intel.com,ragnatech.se,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8543666FB3F

On Thu, 11 Jun 2026 at 03:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X with R-Car M3-N.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

