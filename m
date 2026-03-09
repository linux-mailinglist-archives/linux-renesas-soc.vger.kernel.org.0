Return-Path: <linux-renesas-soc+bounces-29061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNpuJgH9rmkxLQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:01:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D61F23D44D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4430B3013457
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 17:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D5433DED6;
	Mon,  9 Mar 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+q1TdCm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3488392C32
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075601; cv=none; b=nfYBKVDd1fFLruOgxk9n9HdBYOiG4QWssnih5iyOLURZgFlG0a4WH9fYzOH8mrIs0ANeYGr+5sUhfK8hBCPLS84FFVvpTDBxOAcuce5VGKxCxKRWqicfGy/LGVssdfXUe5xqi49HyqAZw3MVisF+2XdhB5bGN0sZvH9Bsdwyvgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075601; c=relaxed/simple;
	bh=Ksxvz4B9KiI0b6ovGpyLIaRxOLgX+9gl6MU/jJDmqdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BMQloqvyv4zIJmOfyz4cpi0AIN7RC/WAph9MNai1hV7onHVcrVmmospGf4gwlQFs/qoLlaOeI90eSM2zX2sZYVU1htfJgIhwQqPGFSj8YVdJwkZr3i70vDk1EpedmKGqP0xG4eFXB4Ieg1VuhKI+vDbMrAxHxWD29YfTTu8Ee7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+q1TdCm; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so5539640f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 09:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075598; x=1773680398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8JYZbGHeEAtdCgYl/7hFuyiU+YfYVmMBscLaCZ07Ulc=;
        b=C+q1TdCmLl+FMEyxgWVrLbgsNnGqpg7mgGenPSYykJ4K3fK6ksDws2YiKMRhQ/01X9
         EwPJklA7Dle1gF63XBFUKRCNBNRnUQfRqxxB08BSH41jGb7r18xzcUpZyQKMHixHvA8P
         Oyv+kpCy5UY5gp37kMvKIatDI7bcyGivrV8MrS1KFIyf/O4OaBE9hc94v2iLdgaf2qAy
         zLLcwRkvwWrDG9jNbmwCquCwkklRY0zkTSG8tTjmlw30bBvGDFKmfI+73l8bv6B04L8x
         sgLL/bSGirmaBHYODjFogFJ/QOPTnKXrRqbwXqr8dlRvWVA9623Tde0b2NTc2XsRb2Q3
         lS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075598; x=1773680398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JYZbGHeEAtdCgYl/7hFuyiU+YfYVmMBscLaCZ07Ulc=;
        b=MmJZ7PRFtWnHf0SzkpgMaGXvr1naTMgWyQ7tvkG1efFdF5c4iGFaEuhlMai0NN1jyq
         EAK51Qr51t62cVL81tiqOOTJvbRZKJ8dII7me5YDxUj42rUmJxODxy+WHCikLFYcwgtE
         o+49EH7IEoSOZXwWCCFdLNj9sI9xRf77fQKE/XtfgfAMAbP0y1/V3IRT31K7S5g5AD80
         Z0WM0w0heuGwU6/7jzgJT4ARJrljpvFrowZNFf0Y3dEY4M7Frmyyt20uM3COiu32fslR
         ZpYhmM+j6aNS06NSZ+oWx5sehitix52RLN/ZogImMyJNwrWw2HF8iso1O7E35/PP8MPK
         m8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO8Rt3p2hGKroXyfp8JP8YJNLmVskyzDKHiNTYwlAukVReCVohG9Gp2nLVOfeOtmANEPMWO1bflx0mxmH0/QCUsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3LLobLiQIgaVn5Vjj383O80JbpGJhqvv0r/RYh+BfeyvEdgiO
	w7bSi4sa3798Kqfebg/mtJDVdqIg9bmvalUGfUZs7kEgrpohCdsoXwOX
X-Gm-Gg: ATEYQzwu7K4wFvDg6UmBwSawLmzEUL0YExxiJymYWcxq3MJuNBUrc9TWEDhV1uHm6de
	mCgYN4nO0+WW29t8CatxxIZTX7Ia2dEplyKUihlBc+0MW97fOqNM7bCNiFpCN0OLhswLcS1MhiH
	rNlvxCahfGZi1naHrSLq+eWWxn+0GGKQ4ZMLJlgwz8GpVTVwlVK4W1oGJIZQsf/duPyM7JX02Ae
	Hmu5VWwm5aHgbN+GKe3xWs6aHQLHAO9xCSv+EmTEdlLI63xDKDzLpF6rnnHzWXBwZfQwUy7k85N
	hJCZ0alJColTpvbSwyGOttkjz/h5NTFG/rk0NMObbEvB3Exiao8szBXsO7kq/zpUvFAIwwFEi38
	MrT8JNX8tRDlvnsSHgWlUjNoOlOx2N54K19dl2iGtuIJ/vMp1dD8H++6RBa72dT3H5hdbtW34Me
	3ZotihM4f61gR4MROfBYHatVlzpO+8Mzi8gzB2Hz1YLkiecSSXNgCMxYPdKuJBe0yZlV/QoCbdA
	HDSpTFThSzLjGjl6EGwlA/BBgJTzTZZQlwx4/rsUyvQsFF6gboodG65kw==
X-Received: by 2002:a05:6000:290c:b0:439:b3d2:376b with SMTP id ffacd0b85a97d-439da66207amr21277110f8f.14.1773075597664;
        Mon, 09 Mar 2026 09:59:57 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a11b:83ee:a423:4205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97abasm25596307f8f.10.2026.03.09.09.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:59:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] soc: renesas: r9a09g047/056/057-sys: Mark sys_init_data as __initconst
Date: Mon,  9 Mar 2026 16:59:43 +0000
Message-ID: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5D61F23D44D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29061-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.982];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch set marks the rzv2h_sys_init_data, rzg3e_sys_init_data
and rzv2n_sys_init_data as __initconst as they are only used during
initialization.

Cheers,
Prabhakar

Lad Prabhakar (3):
  soc: renesas: r9a09g057-sys: Mark rzv2h_sys_init_data as __initconst
  soc: renesas: r9a09g047-sys: Mark rzg3e_sys_init_data as __initconst
  soc: renesas: r9a09g056-sys: Mark rzv2n_sys_init_data as __initconst

 drivers/soc/renesas/r9a09g047-sys.c | 2 +-
 drivers/soc/renesas/r9a09g056-sys.c | 2 +-
 drivers/soc/renesas/r9a09g057-sys.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.53.0


