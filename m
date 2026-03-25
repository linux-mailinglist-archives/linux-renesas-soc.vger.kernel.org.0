Return-Path: <linux-renesas-soc+bounces-30242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HyTNInlw2lvugQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:39:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3A325F1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B781301D4D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 13:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD2F39B97E;
	Wed, 25 Mar 2026 13:20:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EC823B612
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444847; cv=none; b=UgjIrV2F6pyxccrhH1e4Lk6FUzhH9WwrgY8b28bvTyKUx6s1LeBNR0Nw/XfM0hBysh2SJ8fP7OwVn0seXvqmOXlbkRoDc8CLEYglvF0e4C6/jFylTaIgjSaIdxNVNVTNEpA/+MO/hFgK8QUTbZgTV6lmRgLA5RdKAxHXCwZrFls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444847; c=relaxed/simple;
	bh=A3BH2U/sY4o7946Q9Hmq3lUJVkCY45IcyWCVPKcRuYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PK+bmkLibrwvNfacVpxtblqCHk+06gE3h1xV6dc6mAxWVs+5wrn7HnzkVA6QwnKZNebkqbjyq6hocR0Nj4gL/ILAoyEYGifpYRsbOJECZyBq3g/hMSYC/ogUmAylr6NMCzKXVuT37V8nGPvHtVRarqSANt9EJu2RTYF43Bjo25M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso326260566b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 06:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444844; x=1775049644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGKhB9qy7hiwPLOMIV/4ydxNNnNMBwmIgfNydUSJ0fg=;
        b=X1Wd6dl16wwboM4HIEKWtJ4GCSlENL/px5gtC8xB7fsFNspELnHXxUUUlMRGzI278q
         8vBEpYiiDhgU1rj7OPHqPD24iWrvhI4iz9gfNGJ8vvVkUXeT0C8vdcmTrpyZdQI7D3EP
         i1CyhF3DKWWgM1XNnO4wrHBaWPf+JJNgErypUbfYTU79SeLDJit/x7UQATtsflD9Wv88
         h/PGp26UyNYXWYowq0vOtC+9peC7ihoP631aPsdjDMDQKAwQU/rlykGJpfZII0WnmjX7
         tJz853JOpRbruaSUh0T2RdcfHITCAnixkwvQMx6sc2dDYZv2u5TwLCkPqyzAe488iPJf
         9Iow==
X-Forwarded-Encrypted: i=1; AJvYcCUNNTOppgD0MlBV5mjIeC1ohtsNJxeBL+9aIO3TfFB185GdxzauJrd7LtAqyd+I9QTiIq48TbUflBHjH/V+hXusvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCEocfg3DA4C6sRLPbwHRDJH7yGrz8naLvnggan1HPq+7j5ROw
	bCKu5aER1zoLt6lkYkDjktRVECsPqTPTdaELRnDqMzFeIHHtakavoFbFuJ1q6r+ht4g=
X-Gm-Gg: ATEYQzwuLHcKNjsagNhnsIj+2R9bpx5OWTXNvq7aZagnSVIumN3QUYvblYNUCaGY2qi
	93wYurg1LyTL2e8YziW/UOA0pHAKqflTbOWRlE1DBABYnOZ0HzjE89viprPsO1vMeqGsyysWXLk
	p2DA0B3Y1Ad8NVysT/5I+w5IhArWhTJTQDLXB3k9nd1OXm2HXFvef6Mrkpy4IDs0olEK1XNZ0C6
	M6FzuDDTM9BuKocePsozpANcqlgJkUsi0HetfPaBTmecmou1QyMadooXjR6U9wJ0lFSc8cOWVMH
	MqVX3UTH1MyA8Huxww7MomeC+n5tQ0E+pwefzmApSTRxXRZAnBIeXS56UdYtp0LU5uMtfJvk0OK
	ZquWHPkdfxZrA8IOMpqgNHpJAhke9m5kPemsvGK1tU/lYFh/Tqr8G2S1SqLM5FtHxijOM44UEH5
	rrM70sWh+hXc14E6FriU2vyjbCm+aHVtlmnlCu/Hh5xXksd2GiLFPPQFFfKI8n
X-Received: by 2002:a17:907:d0f:b0:b9b:171f:4f05 with SMTP id a640c23a62f3a-b9b171f5901mr119427466b.11.1774444844351;
        Wed, 25 Mar 2026 06:20:44 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871a44sm801269466b.56.2026.03.25.06.20.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:20:43 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6686697f578so4035209a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 06:20:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUO7eZhE55JhdvqHZhJ7oAuuK0fDzGzDxY35yCZIurHOitr5LuTUVny8/sVWWXx6FpD6sLJPUY2bQ/5uGeDlYlxDQ==@vger.kernel.org
X-Received: by 2002:a17:907:7a89:b0:b98:3ffc:1c39 with SMTP id
 a640c23a62f3a-b9a542bc0ffmr242084966b.56.1774444843570; Wed, 25 Mar 2026
 06:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org> <20260117005028.126361-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117005028.126361-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 14:20:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXM8FOnwrCPXUdKmOKYUdB7qvgbrmXn8Je5FEgm6uSjQ@mail.gmail.com>
X-Gm-Features: AQROBzDEx4zWUiv2Aeo1TfPzF_xYHWi738ocpywTiKEOtgvD-VvYpp4M8-J7Tcw
Message-ID: <CAMuHMdWXM8FOnwrCPXUdKmOKYUdB7qvgbrmXn8Je5FEgm6uSjQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare Display 13.3"
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,gmail.com,linux.intel.com,linaro.org,ravnborg.org,ffwll.ch,suse.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30242-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,waveshare.com:url,glider.be:email,mailbox.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 66A3A325F1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 17 Jan 2026 at 01:50, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 13.3inch 1920x1080 DSI Capacitive
> Touch Display on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> DEPENDS:
> - https://lore.kernel.org/linux-input/20260112234534.225954-1-marek.vasut+renesas@mailbox.org/
> - https://lore.kernel.org/linux-devicetree/20260112234834.226128-1-marek.vasut+renesas@mailbox.org/

> ---
> V2: No change
> V3: Use compatible = "waveshare,13.3inch-panel" and drop timings
>     and dimensions, those are part of panel-simple

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

