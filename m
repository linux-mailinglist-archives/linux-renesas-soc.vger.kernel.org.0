Return-Path: <linux-renesas-soc+bounces-29472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK94JL7ot2mzWwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 12:25:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FDF298A33
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 12:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D579C301B15D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 11:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0409328B4FD;
	Mon, 16 Mar 2026 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaemV8UV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75F3282F03
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660346; cv=none; b=e41lPIB/wkiED2oh/qfi/CxdsnWilTa2GLrgjublMBejnPDNEI4I7oIaQcMvawWIg08mEhjEFoKNRHQlC1WoEILd0GTyUcyZUypeftiK2+nCxy+vj3ChKH4/I7FKI03uiDnLyAmBmg0/EqTfX/gWTRCVVNJKlzKfmF/QM1YZjfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660346; c=relaxed/simple;
	bh=wgmZwA5aTm7ncl3DyHbavGYhjXi/iScqCoLnw+YPzBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PXpdYHkn6vsVqR4MVsmo7ye90I3L/Lf7tQO2oqkLJYhYj3EVzMgDRm26ukzepWcAk66rA7zwMxpXBz3w8yhPAnlRmUvyYo8fJpQei33N0VrsOicT2SYCGllCVfgK88k6Sj5dJrbZcm/QgLehNXr1B3XO9F4mRntbB74PhaKQdWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaemV8UV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c7382731edfso3109241a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773660345; x=1774265145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgmZwA5aTm7ncl3DyHbavGYhjXi/iScqCoLnw+YPzBw=;
        b=KaemV8UVTXGHkz2vF5hVy6ScsiEhHS1LRzf5Q7bp6tONWM/yU4ai2+s7Ff3xy+I+8m
         VKBskrudzQaIS0j6aBtjsOwcGXDAjLqO38zLsvcgGpREyPPDgnli0gIrRU9ot7uqs39M
         udweoICqMdqexP5PiUCWerOB9JsnrvkWY4hr4rOm4BQelGJCdAMkR4n3H1zyCj7Gu+bm
         TUPjY1ocBpw705lTDraxnuE+pxxeLgetncKC6YWxwuo1eXUkcYzN4CmmUveSOvUQTIZ5
         6ACDRclT+nXq1vpxh+cdHcqhYRSwQYbt4fRQbcqpoyjPXw6THka4QmxBYCOfrpZZd0Md
         LcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660345; x=1774265145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgmZwA5aTm7ncl3DyHbavGYhjXi/iScqCoLnw+YPzBw=;
        b=ptDT9udyBGFvRwcsV9f9pH3JWN8fJBX9KHD65PZew6MNWSzlwF0G+axPHxEBMbjUBv
         3Qo4SmDQOiwhnlaAzJ3SgMRCU19KlHc7iBnBwa7LG6siutXEpgKxii1jPcsskfkIfOrm
         X8Cy1LDO2KUBkB9OZZH3DNYsjeRaCX4nZjjsY7I0U0yF6SaltJ3beMUfZv1PVWKOsWs/
         EvBesoxoCkdyNwScPis6hYrAd7RFal1xmjaTWfSnh7epH8o2VAIsIFVN1zwbH0IcMxjE
         BVgEYv0Ntha/sobURS7faVSFzVvLzbx2txczChrSqnG42PdehS0LCGjTnMWWSqul2RpE
         UWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVa8FSPewppn8HEk+X6UQ7WmyFwRIdrxQTqDG9efOqWqlDUwAmxEygfMYhM8fj+2u0eaDtwvz/G/Ogm7nuO2RQhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1cDYieAF1zPTsivKaEkof0mgxjU6VR6FLCRSGnhZBl2ZfPcFA
	NPkx+GTFTH1xiDbJrNW7LTaIOFVV1lc9qpJtmNcndnamv+4xWy3GunMN
X-Gm-Gg: ATEYQzy71gvJzd9450JYxJLKYaoJbZZJKqFwJ+m9yL+aHCeXrZBRGGgnocqEqYRBZgi
	rWfnB3A+vH0EscSDbsTFRtBxOZ4BMkXR6WrZNdd1LkEiLzCcurI75Ocot4MRujPKoDll6VgVVph
	s6BHNuW0aO1drUv2fpHT7UPxSgyo/yiC0GFRd9eUAXLUZLPM/F/yaC7JrzK2xfhK+oHVIEqe+kQ
	VAPb6zmonceUyDMEfwexY6xwA+OW+atEd9IhTlom2Oqj+IvEqYBDYehtqtS/EF9r/uRfMgiracs
	Q4o8+ehyWxmhpG1WcSK2y0GOaousvFdqY3YioHbA+SsKY6LvdtqLiqRyOLRJ+7ORZAJImHhLsdW
	ilWKGuPfnXF3Vv+9o5gp6OKTXKEXOs7xFRgCt/d/X2eKuDtzM1C3amni97AE1LH/cih/WN8zEaG
	9gS60MEA5EaNfX6A5uJDQpZUFiB/jWP9f/j4t9UUWKbMl+GKAomjjX0+XrJG4hb3M/LrPtv8QD5
	bmrn5g5+dkIqoKh
X-Received: by 2002:a05:6a21:a345:b0:398:9820:f6ed with SMTP id adf61e73a8af0-398ecd67b1cmr13269758637.56.1773660345183;
        Mon, 16 Mar 2026 04:25:45 -0700 (PDT)
Received: from localhost.localdomain ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73fc935ad4sm4744131a12.2.2026.03.16.04.25.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Mar 2026 04:25:44 -0700 (PDT)
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
	tzimmermann@suse.de,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v2] drm: shmobile: Fix blank screen after resume when LCDC is stopped
Date: Mon, 16 Mar 2026 18:25:40 +0700
Message-Id: <20260316112540.8636-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <CAMuHMdXJQmfU0p=yk1kROTm=ZiiQoUHZQpw5kj813x=RWCS1fg@mail.gmail.com>
References: <CAMuHMdXJQmfU0p=yk1kROTm=ZiiQoUHZQpw5kj813x=RWCS1fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de,sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29472-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Queue-Id: 12FDF298A33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

> Your MIRROR value is truncated (I don't trust the final zero)

I apologize for the inconvenience. The displayed value was
truncated due to a missing newline character in my debug print
function. As you suspected, the value is indeed not zero.

>>>Enter: shmob_drm_crtc_atomic_enable
>>>ENTER: shmob_drm_plane_atomic_update
>>>ENTER: shmob_drm_primary_plane_setup
shmob-drm fe940000.lcd-controller:
[BEFORE] LDSA1R: A=0x00000000 B=0x5c100000 MIRROR=0x5c100000
shmob-drm fe940000.lcd-controller:
[AFTER MIRROR] LDSA1R: A=0x00000000 B=0x5c100000 MIRROR=0x5c100000
shmob-drm fe940000.lcd-controller:
[AFTER SWAP] LDSA1R: A=0x00000000 B=0x5c100000 MIRROR=0x5c100000
OOM killer enabled.
Restarting tasks: Starting
Restarting tasks: Done
PM: suspend exit

> TL;DR it depends on kernel config.
> With my .config, your patch is not needed (but it doesn't hurt).
> With your .config, your patch is needed.
> Unfortunately I haven't found yet which config options causes this.
> I will send you my .config by personal email.

Thank you for sharing your configuration file. I noticed there are
numerous differences between our configurations. After further
investigation, I narrowed down the main cause to the following debug
options:

CONFIG_PROVE_LOCKING=n

CONFIG_DEBUG_LOCK_ALLOC=n

CONFIG_DEBUG_RT_MUTEXES=n

CONFIG_DEBUG_SPINLOCK=n

CONFIG_DEBUG_MUTEXES=n

CONFIG_DEBUG_WW_MUTEX_SLOWPATH=n

CONFIG_DEBUG_RWSEMS=n

CONFIG_DEBUG_LOCKING_API_SELFTESTS=n

CONFIG_LOCK_STAT=n

CONFIG_DEBUG_ATOMIC_SLEEP=n


These options are enabled in your configuration but disabled in mine.
Enabling these debug features introduces additional overhead, which
slows down the resume process. This delay unintentionally provides
enough time for the hardware to generate the Frame End interrupt,
effectively masking the issue on your system.

It is also worth mentioning that this behavior is not new. I have been
able to reproduce it consistently for a long time, dating back to the
Kernel 3.x era when armadillo800eva_defconfig was used upstream. In
fact, the issue can be reproduced as far back as Kernel 3.12. While the
exact configurations may have changed over time, the underlying
behavior has remained the same across multiple kernel versions.

This observation suggests the presence of a systemic race condition.
If the resume process completes too quickly, the Frame End interrupt
may not occur in time to trigger the transfer from Side B to Side A.
As a result, explicitly initializing Side A (priming) during resume,
as proposed in my patch, provides a more robust and deterministic
solution. This ensures correct behavior regardless of CPU speed,
system load, or debug configuration, rather than relying on the
incidental timing introduced by debug options.


Best regard,

Phuc


