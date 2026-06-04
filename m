Return-Path: <linux-renesas-soc+bounces-33587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eA7pNelyIWpvGgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:43:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6374063FFE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:43:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01C19300F554
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 12:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D264502F;
	Thu,  4 Jun 2026 12:37:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497A246AF08
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 12:37:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576648; cv=none; b=Ahw74zW2QNwq7Ln6o5zNWFR6ghz8zqVdG4uX/sYH2yJDUqQI8He+jmt7NrG9tGbyvAjS7x/r3lJLnhe0do0UvqqQp6kNL4jYvD7MAfZ1W8JEpLitQQ1ONqwEJ08ulvGW79ikPFqhDLtqqDO5Dk0CPb8E7/JtnNwEaLOdc9/+X6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576648; c=relaxed/simple;
	bh=Vu59IXWoqahv904gjXxamc81lnnIdAi+ZPq7oroe/dE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INI6/TvjU7U6lE2k+z4gO+t3cgrCkcJqDOWsUXvbAD9wh8xgU2iNGA/mcYyhNIHH388KvdXzKeR/IVRLeWyGkMIcZmUQ8VIAWvv1UdgSVMN+GJGcgZBdobjrGO50eViZkkRe5rHEaOwCh+rsmcpiSj1rQLE6TjR8Bhew1AVTUFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5a0e9e798e4so158964e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576645; x=1781181445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQTWlarxfkJvz4aV2P+qXhfE+LdhATPUYr6EStsDJy0=;
        b=Uj2iCz3ktUkHeESQ9qxYQzuyy6S9TBswHgZLNsIrQtBp7yHO4epdpNLAHgZ8TjkBMP
         cQhW+uMBx4zrZBmuCDTTenhPrKfHyM6ftf0aoRwc3Qi2kWEAguG7s/wkUmBm2RwMy8VB
         yypCppg9/5OZtH3GiUz0oodEnb0UB2rbq8XGzlh6clxFs1Y8Gh2pu3Pp/+i8F4EkzL/u
         fQXmMzzIkZ/SveZWLSwNAq6LbDkkJ/WfwDE5v+3yTrgv62dD7za2vwEfBwPK70vDm15S
         b92bfiX1G1jl5uDkTnmvwUcimvlTeRz9EMLOBCyIecf7tizXttT6yv8ZrUp6ofWCQ/y/
         e8FQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7Hh+5JiILJvtb9CFk26rOu2p+F66RCz37CRmhYug+JLCJBGmTVzKpuHSb32iiFvyoi1gKay4E5s2+8119mMdNRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSA1Ypmpyabtzywb6dZxZ6Aijnx3iUYLoYwGHhjb8EduebYeTL
	oUrM9PVRS/4Bc7Vi7wL8dlEKxJoBYLc6s6UNKcd7doFncWzbiE9GMdVaX1OAtqZqV9g=
X-Gm-Gg: Acq92OEO5aw1WvWUcJDRYTioPw/wdCFNHgUfLZ+HCj+iN6OOtIjr0tZonjBM/papK+3
	k/7emmJFov+SjQRrDaBpJWpUwxz/35XetVwToQVraOibiFiA0ZDfElURwy1EtdKrxCX9wRWYoqZ
	yPxyFdOx6Xx2bl59wFjWZg4SwpgkOwGS1eLnTLqsBjI3xVOcGVdBbTOztgQO2MPETtH/8KJcuLZ
	j8PQpa2T0+NVyR2iAjabQfu4Sh7NkEAg6ZY19QadcM4NLrv/k+J2gzAR69Vk6+v+Q+BPx4fn8OM
	/gejVahLm/eLMbfGG1DtRHec9taQDD0fLRYersDObNV1A5XOh9sjtO7hcnb9vWm73j+sCjuqig2
	rMmMawGaRZwj563BVH8K6KhgSJvEvQGlZ47R/FWZHWGOdfVdMJcJLuXLmC7OwnraF2wr7wMc/Q8
	kR9KGCQSHQhxypgtyKaKZvwBCfGeOE5q1xxnrfk44fEGxLFNs2omJDvsCfJe5haH/7+I702hcuc
	B8=
X-Received: by 2002:a05:6123:2ca:b0:59d:6004:d453 with SMTP id 71dfb90a1353d-5a6e45659e1mr4037912e0c.2.1780576645129;
        Thu, 04 Jun 2026 05:37:25 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d64139fcsm4994883e0c.4.2026.06.04.05.37.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:37:23 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59ebde7d704so205417e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:37:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9dle4DjJX5DghOKlta7bhySYIlNowMOC7oSyM9Aezi9NmObb0QwHuqFtJIfBQPkHvwtxG8dtd0g1n8bZjPF0ehhg==@vger.kernel.org
X-Received: by 2002:a67:e701:0:b0:633:e67f:b7f with SMTP id
 ada2fe7eead31-6ec46679e58mr3392792137.25.1780576643147; Thu, 04 Jun 2026
 05:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-7-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-7-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:37:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEV0iydvRQvR8j934OpbAkMP0eo5KO=0=4coBDPojKHg@mail.gmail.com>
X-Gm-Features: AVVi8CdW_DNBZw_4xjeS4zyp_RzBGilzh1a7HpuO0jzATgzOq6tO3Hu4fHvpTjg
Message-ID: <CAMuHMdWEV0iydvRQvR8j934OpbAkMP0eo5KO=0=4coBDPojKHg@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33587-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,redhat.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6374063FFE2

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add and enable I2C1 controller support with pin configuration.
> The I2C1 bus is routed to the carrier board and used for peripherals
> such as the audio codec.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

