Return-Path: <linux-renesas-soc+bounces-29534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIu3GCIAuWkgnAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:17:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D16102A4AC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75E7D303C536
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 07:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC842D9484;
	Tue, 17 Mar 2026 07:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDpJkUgk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81434946C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773731867; cv=none; b=Gvb18wGQCzDoLU+JhAjuyIfoyV89Tyi6y5w/elFrLxvQJY5+JUxihHhebIALWNv3LRS0suGnM/KWdqZwo6bMVy8HjGPhfPm5mgX9s5QrMOUJQ/FyKlGMdsrswQlPI/pC8lGSDngH9aACsGtGcCo22NmtrhGeuCH1qUb18PR1jIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773731867; c=relaxed/simple;
	bh=tFnPL5x7ivygrIkdRXEnLlp1R6tWrg85WLqUxl13qlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=URwYUcLSqQ79Hs3dwcPoqy8YCw4c+duxkUBgKDvPrrPiXvh83uZzfAQaLQM61wEfjPRKAHrZck1vRcXg/hfCbyCMGhYSs0vie1jYov3NMLpAqT5xMcSs/znIcBbKflctRaD3cwjTYsk+vSCMCjsqoqT4d4IXalR9msAiPkx6kVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDpJkUgk; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c741692db4cso19883a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 00:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773731866; x=1774336666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFnPL5x7ivygrIkdRXEnLlp1R6tWrg85WLqUxl13qlY=;
        b=WDpJkUgk6FN8SEPE9vg8AyxK2Cvlp99bnr+baRHSyErVa7Y/YQOlI4iTwSx4NOnIWc
         rX6KIxBEIZ0ABIrkmYhd7KmO+/sEIx98+TpLlYwkZ66z2wltWS1xCRiK6dNYfNkUY1ot
         53OJ6bKsLcLM6z5EgeNwkZcOWHZ1Lsdkyr1XTSQkt0EuKWWrLtYckEpecve+xn5Ue/ST
         VDNPC4divEsk6ud+ePkVjz2J9bhVZ6UdtWuUygTkdrLf0NtH2k/+YKMvIIou2cBh70Ur
         7KAKDNBH2n6K98rHCRMTerbHTozwX6GZKY4lRGTWU17W94BLcTSKe1GD9iSLG8I0mWi2
         FNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773731866; x=1774336666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tFnPL5x7ivygrIkdRXEnLlp1R6tWrg85WLqUxl13qlY=;
        b=CS3n7ysb7wR9sRfowkQ/TARHInuDhrzCHxnEiYJxQl+zGVUQjDjgizqA1xJ8sRFIGl
         lPlb9QCKPBb/KnUS0vPy6k773j7hIWCUmKsQK9t/t960x71mtnKMCev/+X6nM2hm2DTO
         PQQVw4no2G63K+Nr1FvsrRtz1qhr2SfT59lgivpRkJIlB8TXNGfN7FE/ErCU8MD32zwe
         iCDJTuWZ/TSDR/sxwUnWz2G82ozmQ4ln97wmAbT/y5k2P+SZP0/kFmqcEYpIKXbCKWNM
         ka3EkppXqPkjQtFU0adUgiFZKgQ1MipdtUVG0gM0hvZJCB2SyM3yfFZ7UO8k/SMN/cAE
         VjWg==
X-Forwarded-Encrypted: i=1; AJvYcCXchPMLiM0Sz01U64/+yDZi8RAmShSI9eVkQF37DCCHi//2cUQov2sr+fNQ4zERA8H/DFvRhMrhavVe1QCPRoAisw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdYBpcOhmypMbDMnq2DEz50tYEUaffU8ajOIzXy2A+ea0GYLAz
	aN8TiOcADqU5c9MCIKKo+q0xRky8JTZQu04PTWn4rG7zfQA+j6Qg0FTz
X-Gm-Gg: ATEYQzz8F+Ww1utnzlGbnG7N9mx/+/J/XIsVXhZ1lS2+TPUx3L3xOXWcSIn/0cZzlJW
	Xxy6RLe1TRJUyTzBuowJNFA2QEoWdsy0LQPTux505yH4j8Rn5nCY77z2z3jr9NbauejTIooWm3I
	2qwh2cfLlq+L84GvBXuT6N6XQCc0yWGynT4nhRvITdbas/VjK+lSqw5x3MXYjbDLRQV11OccHdm
	dRrvzSogVQTgViKyLRRjEFhr0iGgdhfmk6qrLOZnaBYARhM9tePNlzjiBRruSopRSmDb28xAMwr
	LPDkOgmcC/D/uheDVfQxaRAoKqNyjnnefW9LU/qYKmD8x59lTqVdGd22YmwoJ+WNa/Jkg1R74CN
	ngwm/HlhnyQunJ3W0W1fL7G0ZTyacR46gwa7kmZjx+msZ2v7OD5tKan0ewg5bAs797b5JVmLVKt
	lIeh+DmesdSa1Y3E1G+CUai1Pa8vhP1zjZ9bWAIMVd9fmhXaQmbvXpc0LQg5Ca1mZnudDFouoyi
	XinXw==
X-Received: by 2002:a05:6a21:888c:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-39b7dfd49e4mr2000340637.27.1773731865863;
        Tue, 17 Mar 2026 00:17:45 -0700 (PDT)
Received: from localhost.localdomain ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725ca0asm18751443b3a.17.2026.03.17.00.17.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Mar 2026 00:17:45 -0700 (PDT)
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
Subject: Re: [PATCH v2] drm: shmobile: Fix blank screen after resume when 
Date: Tue, 17 Mar 2026 14:17:38 +0700
Message-Id: <20260317071738.3660-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <CAMuHMdUBwNtdhZYnA3+nwe-CEmrUdPu_K7923uMY5qi9edbkbg@mail.gmail.com>
References: <CAMuHMdUBwNtdhZYnA3+nwe-CEmrUdPu_K7923uMY5qi9edbkbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de,sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29534-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D16102A4AC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

> Thank you, that explains the difference!

Thank you for your confirmation. I am glad that we were able to
identify the root cause.

I also appreciate the support you and Morimoto-san have provided in
the past. It is a pleasure to work with you again.

If there are any further changes or improvements needed, please let
me know and I will prepare a v3 accordingly.

Best regards,

Phuc

