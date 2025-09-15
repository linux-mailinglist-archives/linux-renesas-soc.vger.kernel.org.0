Return-Path: <linux-renesas-soc+bounces-21861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA920B58233
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 18:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B67F33B512D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 16:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9B027B33B;
	Mon, 15 Sep 2025 16:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmfuQ0tf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A5C22068F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 16:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757954203; cv=none; b=rFjvc5yEIF3tmXqMtKF6aM0E/VQa/LdIFCnCpQU96g7fmFBNn7noSk0YAo5vYvNeZW5bNXXen20UtlGWDfIVmD1cYf7a5ZdhTLKC9rjAT9H7pJlWui1i6RPkZLxus/3nJ1SdCABHy753QqfHaDVlnYp0dd+zaRg1Vr5+6tbydUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757954203; c=relaxed/simple;
	bh=LmUDYigashfMZF6CZHcwIHmyuo0kJL6Jfg0MzEexKl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAwxn/P1KHlrIFo9WlDNGUnOdyMBnBx0DStvQPNDHFxwErA1NDQGQdlzJs20/fspd2PPxjwO22J6jD2kOew5Z3wcMZ/uv/7T9xxjqarQlC73RNyTxLXH+YAaTNozyX6wwBlU03rFeRX50Q7bOQWaVWiIPZcZM/0tTOd/lnI1XbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmfuQ0tf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3eb08d8d9e7so808790f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757954200; x=1758559000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n8HdgELhKqPV9nUMnND4gW+HT0yEwJDjyUHYZ5laZEk=;
        b=GmfuQ0tfdEC14TGHeWlrWZwwCeQylEtzu7Qujlk5GCexyvb2Y9SWvZ+TUntGer/jgC
         YrdB6Ali51ki8hdOCI++yBD4Rbil9rUMHj47VpsHBlIs3sPLnxn0eGWlkJmXJdRY7Nyx
         Sc3mzD4jsGjn0fKC224qFgNWfgDDrYWwTH5fH74ersFlBj3wH/TX6ueQCS9P3uvWeBkd
         sP4331cKCwlsZmOeeHTw3zUM7UNVFAAgE5FhUcLllLAs1OK+SfATTDT5UnKYnekN+oBi
         ql4itAwG2ss+V6AsiClcJaxwSKnP0H2Eupddvr0F7SIT6hocwQlQqsufar108ZMcexW1
         OCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757954200; x=1758559000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8HdgELhKqPV9nUMnND4gW+HT0yEwJDjyUHYZ5laZEk=;
        b=bDbiEQqfH63DGsog3LDFm3uUOCmYXVezXU5dhDBt2EASp3+gFeoxjjJZQhvJfOvFMs
         8dHmAQtJzO91Ll97xXoEsLoqzREMF4ZQw++ThTYOKPSewt8YxEgNpI/TZtC5cFyqGPfU
         bR2jzhdf5+1PwDOCjdrDYKoDSM+ZFIElIfhJ2W/MQZTno+DipB1cTOgjyRSwNLkIaIab
         XnJw+l8zrL47maXmMfqg0aAvvaGCIYh1H8PLTqdK+3ypHxMxfvh3UaVuENNLG/GWE3k2
         LQIadtZv7tnpf0egP8iA7ybXX+qBDzcdBDABNUlqfTQzyeX9BwjDgPpvjTYC+YCWUgfA
         vC5A==
X-Forwarded-Encrypted: i=1; AJvYcCVfYGSq2Y3o5iBD+WdpB0rhRU6peddmbhc2LpIwCJvg3oeqn6j7gDcmlW2zFL3pmjuKcaX4Eipb/LVB9fgBj89mjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1ucfAoyz/zM3v8ZWeE/qXw5aHWimsQpPa4Dbka096AGPz9I+
	UxPb2w/Mt45qo0k5YsdTjw+HLftSVgjGWbvZSfpT/AAqNkBmbJakpwpw
X-Gm-Gg: ASbGncv0uk6vw2Gn4FRDD/qBPYIAMDbePao25KuHDxpW1e6bENfLD3EbLDTJ3/z12y/
	Uu2lCxnVAo+AD8HJDdkZ7fNsONNgb21gYGum9I8FckaJ876+54tbsoONFW5BnqCykDvYmhSwGAF
	ygT8yUCGpacn/ddOv/hm4+KAepoD8WZUaf53ss6Q9u9RaQkfzDW4w6epA9oAkGA7pTdxh4Ug1x4
	HZGDJ7Jnll0KQLmVbUY6dIjoAiEwABni2SdqmeWvUZ8g31uQMxNQbrRnrl01wDGCtQsYqMQAiVy
	y91Ztb2ckLHr+bcstk1zwSew/9fAL6paC/CUQlXBRY5D6C7rGLBbJaRPrd71XDxc6Yz2qbucg6t
	ksu01jmeQv8Y/OOUYMhhNU5EssI+DoJxuNYWap6vCBLAu7ZUJfvzsK8OXXypsDI9X883HhQqhcm
	U+/QcXKSobBtQTwAj0F3BJH08=
X-Google-Smtp-Source: AGHT+IGmi/H1It/1GPFQp8dQ47NqyEPOwZpWvVqqC9+daZXqWT08e6o60zckzEx8yfWYIt5WqEutxQ==
X-Received: by 2002:a05:6000:3103:b0:3eb:7f7d:af0c with SMTP id ffacd0b85a97d-3eb7f7db39amr2336521f8f.0.1757954199825;
        Mon, 15 Sep 2025 09:36:39 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8f4d644adsm9521728f8f.52.2025.09.15.09.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:36:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/2] pwm: rzg2l-gpt: Adaptation to waveform callbacks
Date: Mon, 15 Sep 2025 17:36:29 +0100
Message-ID: <20250915163637.3572-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Convert the rzg2l-gpt driver to use the new callbacks for hardware
programming. The first patch fixes an issue where cache value is
uninitialized during disable().

v2->v3:
 * Prepared as a series.
 * Created separate patch for fix for reinitialization of the cache
   variable in disable().
 * .round_waveform_tohw() do not fail if the requested period is too small
   but use the smallest possible value.
 * Added lock in rzg2l_gpt_read_waveform().
 * wfhw is reinitialized in rzg2l_gpt_read_waveform if channel is disabled
 * Optimizated rzg2l_gpt_is_ch_enabled() to avoid redundant reads to 
   RZG2L_GTCR(ch).
 * .write_waveform() returns error incase of invalid period for second
   channel.

Biju Das (2):
  pwm: rzg2l-gpt: Reinitialize cache value
  pwm: rzg2l-gpt: Implementation of the waveform callbacks

 drivers/pwm/pwm-rzg2l-gpt.c | 197 ++++++++++++++++++++++--------------
 1 file changed, 121 insertions(+), 76 deletions(-)


base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
-- 
2.43.0


