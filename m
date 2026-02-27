Return-Path: <linux-renesas-soc+bounces-28514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKMSMaBqoWkOswQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 10:57:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B71B5A7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 10:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC805302B194
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 09:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9754621770A;
	Fri, 27 Feb 2026 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSk2VH27"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4034E36EAAD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186270; cv=none; b=t4mPoHQcYqZ4nmT42nT7JV629lZKID8ZAQ94ZvDZX1vVri1AWM7jC5aXCf3pSJGfMhfSC7y+6M377Ig6+JB2cOapTjwpTG9OgiUBxbLy3ew7cJIxwuy8/eLCKrBHCN3cpIaU7IxvHiiAppJIxa2kmelWEIxXqGn+/HQ/+VC5JUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186270; c=relaxed/simple;
	bh=R+MD4L7KiKI5zqVeN2wD8gMho6QHFy0bgHj7RAZxGSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SdU0rLsLWmna9+X2qW0a6lk9bIQG7HDqojq4SJUOjrdsCclFedYsxrscLYbELGGAxoLBVGsTCDe4D9IeyQS0wg59NTxMxib3KQzfPqrhBlWyL0jw+08QZDKPhNBoLHWqB/5xn6zv2msRcG6GxFMt2xFh/wHWb1+AxX6yP8MjvGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSk2VH27; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c70bc5b4e86so746224a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772186268; x=1772791068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7k7Krg43fqr0O/qL5plo5lVAc8TPlY5swC/VeSBhiq4=;
        b=YSk2VH27rLclaxuEKbPPfjM7aK+H/LyxVgPeIGQ0qwizqwXbPj+xJ9yJkNXk7klCM6
         ULBl3DlLUTmEdpF7NyDG+ayvrXJD1Q/1xiGKI9/L32fBjbInHldN554fepaJUUlZuy/y
         3GEw8n4vDBghoxbnbVhYHF8ohZwhZ8WjjjRtm6WbFgIJcy9Nm1FIgKqTnDxk6opa3404
         GJ8ROrSGWT2MTe6NLF6GUgnn7jLifW81luHrUnlOqtzTFCf1MsmQiL6THQxFpNFMxIKS
         Rl0+Mqh2DyjW06dvBunbbl/eT8eKFM4HcCqvRvgyIZOhGNI8XjOGcbEaxZlTrm37ClI2
         PPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772186268; x=1772791068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7k7Krg43fqr0O/qL5plo5lVAc8TPlY5swC/VeSBhiq4=;
        b=mk4OBWIrz4bSTaf5VnMfZazO0VuwKy6D/zIRBqmX9+08WDIKpeKRHF+KWKHaUYtVsE
         y1z8p7G0DSa29zxsBahlA8QIzL9gmQxxA4Mbbc8TWPTMr4XkqyCFJ6RnXxX36zlrGnWD
         UDk/96DUd8hFuBFhfr01aXlyDy8blKZbZOVin4dyUQv534EG6wNLlF2gLLdl8f3RIxGc
         Kn9iLBhIENEpOJtrYHPvBaf2H90O0KxpjapzEvNBK42beQMtHAn54Lf1pWLeq1i/5C1p
         DAgn1yzVzSYmUXDaIdqwJYzlGyfRBTaAzmEyqyvmmWmgDoAPrR/iZLELKIAqT+W63MNa
         V49A==
X-Forwarded-Encrypted: i=1; AJvYcCVvTAroWXNGricTkTeW2s9Lk8oKKIAqEw5bKEg7xCns2LxJjCI2Yfk1XOO+g+NS4czH+OmTidqPzuDW5+NWk0+ktA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfRZBP05ucs3BIkJsgLAhaT3kTCEkD2IhtykhiR9iI9C3+e3D3
	3CFN6WzBz0Ef40GpFjFZq69y3eyCNfnyk5lJKX4g9fLU2x5ElCjZk15imz3h6w==
X-Gm-Gg: ATEYQzxHwyThVCJw9tL8ooG/e1dIdbGLEkV3my525ha0WR9nwFXvDjk6OyVScGh61pK
	gcdD5wMZz7FQk4HWYkrwxXdfnKil2kZtJjzS/SxjcO5OCqWdU/eBrFiG7TPkzUEZ2xIjqCyeFpw
	pV2KCD7gZzg4IphZITENTQzL2edPggyL0dYVGaHW7zwDb2/5dLJ0H3eKCu4XvyQ4vDUwlH1BMRG
	P6csry1NmSrjTj1oSRfTr3LsqWNksgcs9F1o4I8GfggIEo9m1rTDwIXxIQGBnhjxzsy0REITxNY
	DDuNOM0ky4d/HHyVjCrqmuX7GFXH+unkqT8Jc2k6WFHxjQXCXqKXoJ2KOpEtLwS2Twrjvvdv7sK
	5V+wCaM4F6zASTnhtBWpUtMeiFobARGRYZ1Wkc2gtm7llgglzczx8riQ+n2oBLc/CUsVzWEvlWY
	U4B0ai99dTt+BLI7iT5y6B2eablhKi4Q5ugGZ2pMLWBHV/JYyF4s6dTT0BTulDNMA1PL6Ie4nOh
	2hgnw==
X-Received: by 2002:a17:903:1a28:b0:2ad:bd4c:b0 with SMTP id d9443c01a7336-2ae2e3cd0b5mr21806505ad.7.1772186268441;
        Fri, 27 Feb 2026 01:57:48 -0800 (PST)
Received: from localhost.localdomain ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4d826sm4640439b3a.10.2026.02.27.01.57.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Feb 2026 01:57:47 -0800 (PST)
From: phucduc.bui@gmail.com
To: geert@linux-m68k.org
Cc: airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	phucduc.bui@gmail.com,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2] drm: shmobile: Fix blank screen after resume when LCDC is stopped
Date: Fri, 27 Feb 2026 16:57:42 +0700
Message-Id: <20260227095742.4449-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <CAMuHMdXrYTGQkjC1Sr4NjOcsRyOw3_eEj9m5MVVo1GWUuCxo3Q@mail.gmail.com>
References: <CAMuHMdXrYTGQkjC1Sr4NjOcsRyOw3_eEj9m5MVVo1GWUuCxo3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28514-lists,linux-renesas-soc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,youtu.be:url]
X-Rspamd-Queue-Id: 594B71B5A7E
X-Rspamd-Action: no action

Hi Geert,

> Thanks for your patch!

> What do you mean by "deep sleep"? s2ram? In upstream, s2ram behaves
> the same as s2idle, and the LCD works fine after resume from s2ram on
> my Amadillo, with and without your patch,

> What am I missing?
> Thanks!

Thank you for your feedback.

To clarify the "deep sleep" context, I have tested both s2idle and deep 
states using:
- echo freeze > /sys/power/state
- echo mem > /sys/power/state

On my hardware, the issue is consistently reproducible in both cases, 
resulting in a completely white screen after resume.

Testing on Stable and Upstream:
I have verified this behavior on both the stable and latest upstream 
kernels. While the patch was originally developed on a stable branch, I 
have confirmed that it applies cleanly to the current upstream tree and 
successfully resolves the issue there as well.

Context and Environment Difference:
I first tested several Armadillo-800 EVA boards more than 10 years ago, 
and this specific resume failure was already a known, persistent 
issue back then. After 10 years, I am returning to this platform and 
testing with my current hardware, and I can confirm the behavior 
remains exactly the same.

Regarding why it works on your side: I cannot be certain about the 
specific differences in our hardware configurations. However, on my 
setup, the debug traces clearly confirm that the LDSA1R register is 
reset to 0 after resume.

Video demonstration:
I have recorded a short video demonstrating the bug (white screen after 
pressing "Switch 3" to resume):

https://youtu.be/0n9NHeZ7MWU

Detailed Logs and Configuration:
I have uploaded the kernel config and dmesg logs (including debug 
traces for LDSA1R) to this Gist:

https://gist.github.com/BuiDucPhuc/b31fc7ee784e65d192b2f49a406c3326

Technical Analysis:
I focused my debug traces on the LDSA1R register. The logs confirm that 
during resume, LDSA1R is reset to 0. When the driver updates the 
registers:
1. It writes the correct address to Side B (Mirror).
2. However, according to Figure 38.13 ("Two-set register switching 
timing") in the R8A7740 Group Hardware Manual, the transfer from Side B 
to Side A requires a Frame End interrupt.
3. Since the controller is currently stopped (DO=0), no frame is 
processed and no Frame End pulse is generated. Consequently, Side A 
remains 0x00000000, leading to the DMA fetch error and white screen.

This priming patch ensures Side A is explicitly initialized while the 
switching logic is idle, making the driver robust against register 
context loss.

Best regards,
Bui Duc Phuc

