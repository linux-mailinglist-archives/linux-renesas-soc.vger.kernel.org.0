Return-Path: <linux-renesas-soc+bounces-29550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAECKPEUuWkPpgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:46:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2572D2A5E2C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F1F5301384D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA6325A2C6;
	Tue, 17 Mar 2026 08:46:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ECE330D24
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737198; cv=none; b=Rcn4GAmnHnno/AXIQ6rzlIRO7GFoiaoO9dSIx5JqxL+6jdMhQ+SyyZpmbGtHeX0alFQESTpVROfuP5vTmLULO8Tv4OTyeIdrKHiePgDDl1bxMDHRBzZCJg5M/dxI1XrVsbL6R+ePCSB9uiW+7nhIVGsVTAnD2qcucBbcGaaenXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737198; c=relaxed/simple;
	bh=fsSLl0utw0kSOjDU4o9OujfyZbzihSmnCKdOLX2Z70A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1/RW+jyd3hHLURd7C1NXqO82Mj22ooF62oyxElnZdu0TyWBuBoF4gCStxJ26JJYOdH2Zwaohb/tWZzCIebzf8Bb7u1xDCaR2bvaOquuCthEF2lz32i2xzDP/bqVwL0xO3SxR9AtdFcU0WVWUc6+hC+Qk8in+S1HAO3Rx3x6/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56b069fed64so2175984e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 01:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737196; x=1774341996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1dFAsgiIjJwbzkv4iAkhLhnDR/uX1wmLjNNPR+w9HA=;
        b=T+UhmmrGbYcoRK83si4LWTbKq40JH4QVwnzIXXS2kfntp1MGOvvqzx6ZSFwajufnFN
         4q59zhcoHu+guJpulxdV/k5qiQCbEm29DxYgpKZDTFpWl+pQnv38CfJtyAPIjppOqx0/
         oaIQZJLf+/IfDGw4/oedzDXELcOziMUGtUXuq0uynJbM8RM1F+ygqoL0+n0gbvGoRH+A
         GjYKYwXioXrn2h8GujE11S4vaszyHXFHQeYk54N3mlcDqHwk/xZfPlIux63lOyTha77b
         oEXc0zZCXMn9fIhFDGZzr0ers+y70SR0aSKkLkNrK00uFb5WdUR1W+lLK/GDh2sHVtz8
         OhYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOvX9h5nTYNQm8eepCGrlZW0bfdiHEjjPRNru/dWAZLMmabJQmKLgD7xBIxuCc9YmxB5eoH+CpaI6eAb/EbpRuHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0bw87yh9FlosEPQD4z/mpvHazYFVzAEZPswqJD1S4r7RV50p7
	0j6pX3JOz3IGWnuYuJSoNGA9olzVxuIOelCXmb18dKAjqhgm+wrQcqfguxBkk5Aa
X-Gm-Gg: ATEYQzzcxhNrfasZW+u5m2CvY27+Zu+2GeujG0r4eW0fvgEO8U1tgmvzHDTiX76ll8E
	wVo1FzNJOY4uCTYWkNcPLPG8h3MUf8a6qHqdMDDp7l0LJ4SCgXNTGOWjg3AdpdRhNb53y5w4l6/
	xbVOVdOjRvGSExjmTgyl01zw5+iU7Z7kh3Ux2Yt5123bFwEyV3ZJsOcCcAH9J+rJdsnDv6BNSxt
	NipOMnGmlbBEuD+RsIMa4msW59fi0bxQFYhfRwpAZUMClRllN9bNL5QQJlkKZgKror349rrpqY5
	Pi515sZduayvCUt3+ddGfdCktLb2YsCKCu5TJNnqANu3MPR5k7DZLat0gdqeckd8kRISnOhRPUG
	HT3k++y5wa5Sco5WP6V1fJPhhqYUzTGLipcojo3O/llqkI4RRTNe4Z3jr3fNPfnz3DKCM3lqFd7
	JLIvtvk3d8FgN7PyTnT/hMCDYfE4YHIdTZKAAEm/222R0maFgto6Z27qWXXpJq
X-Received: by 2002:a05:6122:9005:b0:56b:8399:c3 with SMTP id 71dfb90a1353d-56b83990755mr2772860e0c.14.1773737196135;
        Tue, 17 Mar 2026 01:46:36 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b6f39166asm5160090e0c.9.2026.03.17.01.46.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:46:36 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffe16290e2so1120700137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 01:46:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRYyrp/0BxNojRybGnksmOWEmW8VyZl9IM28V0FgVTby1e9G79UnPjkYepKdoE71Zp9gde64HKFzed9og+YyEDaw==@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5ff:8b8:9f89 with SMTP id
 ada2fe7eead31-6020e682490mr6012940137.35.1773737195424; Tue, 17 Mar 2026
 01:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <20260317-spirited-mahogany-swift-b1ac53@quoll>
In-Reply-To: <20260317-spirited-mahogany-swift-b1ac53@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:46:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
X-Gm-Features: AaiRm518-F2BTcrALlb72his_SW49wZkbqH0hdFeWMeWLkKc2Nwvr-LXzIlrumI
Message-ID: <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29550-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.744];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2572D2A5E2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Tue, 17 Mar 2026 at 09:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Mar 13, 2026 at 12:12:56PM +0100, Geert Uytterhoeven wrote:
> > This is my first pull request for the inclusion of Renesas SoC updates
> > for v7.1.
> >
> > It consists of 4 parts:
>
> I think pw-bot did not reply to any of these pulls, but I applied now
> all of them.

That is correct: no replies from the pw-bot.
renesas-dts-for-v7.1-tag1 does not seem to be in soc/for-next yet,
perhaps you forgot to push? No need to confirm if that is true,
I'll notice tomorrow ;-)
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

