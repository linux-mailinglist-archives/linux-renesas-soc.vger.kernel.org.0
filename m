Return-Path: <linux-renesas-soc+bounces-32863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG0LIaygDWq10QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:53:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AD758CFC0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A011530387AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092803D890E;
	Wed, 20 May 2026 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeKNFCZq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F12F363F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277912; cv=none; b=qDxn9HHQTmUumVN2ARYpWAntG2Z3DRi12OkCFfYPJfsWNCxaTexM1xRLw7FhAjd8+kjz8Q2NaIxPtxJN3N6OdIg2Wenrugiew5UzShdYtp3D7KQ447VAhES0haDBCPGVZXHw1ZBpUaBnMinjWrpcL5iVGKM5V1zoSa6LVo7llds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277912; c=relaxed/simple;
	bh=+qlZ7fazAMGxu3Hd8OkV5YA9OWuEtW/FxzhapTkzCDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9UKFqCAqphc0Qf0UbQwNiAYQIb45UYGUZAF5Q9vUTQKWAiM061/Bx/Aaptw5XuCkPqtIfRcqUW/PmSGyBE38DRueHVgkAZSIoSCEtdlBA3ti1eRlSFmirmRF26qPEcumfzuVE9JId64a28Tejly9ewUVNm9dj9dOXb+5xbqzJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeKNFCZq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488d2079582so46158875e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 04:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779277908; x=1779882708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aQwLHpqBSK7UgRP9vgct1RBilZORVWgtZbFjt5RtZp8=;
        b=WeKNFCZqh6y3QcKsj5vA3KbA0vaIvmYQIaOGl18BXwGvmvMJIMwZkrslr3Gd7wWVJt
         uBPqhSLvXwLQwiPkS8VNy6UjOg+DTeOOMhf7AinY5R0diG1/wX4uLC4Lq7BbXFu1YLrv
         tsBX/e4l8eGxWvfidPhjGWbxCE+jkMtqzgVcwyf8Z7sCaTf6Aysm2yvMdIuJUs5Ai4lC
         fJAoNba2CjbbLUvnrdhM5DQT96qb5NPtRG1sCwUWHFegCkB+qrQuhuhB6+O0DQpVWD27
         D/3Y18hITQYLfMxiDDtNAXv72VgYjPw2O8VWC8PMcGUh/hxbdr+xuI+ww/jkq3w1Y1YP
         pTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277908; x=1779882708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQwLHpqBSK7UgRP9vgct1RBilZORVWgtZbFjt5RtZp8=;
        b=MLYLdh+BOnNWLM8LIIkNdpTGvm2EcdvPyI9pO5oVbXs0yEgjwNqsjHBuZnd6ltKxPS
         PwU3xCLkXvUZfywge0wjDUr8c4lHasbhtOqdaBH9JOn1/Fr893gg2OhFD6w8radus/8+
         SPBGceyeWgF8ovabZRGnM0X5JWZ+GVQdkp7SMlqnFWAvPprGxWPmpJaJyLJHNGQnAK6P
         MXyVAj8JUsZi/atw4ohsitpTFWB9VrFH8weblRncMGiJtN3/dgwcWYhGJLb8TPCKbIls
         Ap7B5GurenAvd9aBxr5uEprH8jukwzZt+iGd4wx22jYeCOcCYmWSpwZIIgAPCq0Wd5Xt
         sIiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YpOVkep+eHUX7GmJvfgy5rMQMgz62HtgLuppYv5GgRe/4DqUOwvLiUflC6kbYeewV6phz/1B+95xMYa/lmH1BOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzg0fvPZhZ5hbUbdray3ErZ7kXcuD2+kn5Qv5ZxTAQUlZXGc2e
	j36BtdOTwKV477uzX4hwV2cjUOpWVwePzPE1Io3cMbgYAsHmyyH7bjdF
X-Gm-Gg: Acq92OF2bFzwXkqDo3ETAW6bGtqrAe2uN2Sbt4vD6FUnaFW0CCVg3+CCkWEP/BgwwkL
	bW7a2wa/DyulFBJtGJcErNu2862j24ABV7dEsFk57F7Y5dAd7r9zmmVmgDpjfNksXB1e0d/CX6/
	GYnE6+tE6GQ4Vrs8vszelLuv91TlR3UU8LMkKmJkQv1M7Yvl9Djye4v29CLfvEITD+FqXZWkiia
	V/AES4yZSZC+8/yddlKYbzFc09M1RlLwntFQsBnFXHHHjsVqKDxLUOJa/mh9VHTUtJ4r6bliA9u
	mxzjpJfzNWt5tDKOb6lB28JzDTF6S4xVkN4CgfQHjJ8+7wgwF92A7YuVtnwyNLsychk2bJttyjG
	CSX+JlfRDU2hLirMODng12F858YugvcjBdXElqYeTTDyhNc2OmpvsNyKk/kRVF+u0c1US6E03dy
	zPz9hMguOHdInPPp1bIeXlofXvolkJd7j5+5dFazM0KebwS0s=
X-Received: by 2002:a05:600d:c:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-48fe60eca75mr329874945e9.11.1779277907399;
        Wed, 20 May 2026 04:51:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:a11b:196c:5f9e:ac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm278842735e9.2.2026.05.20.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:51:47 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] arm64: dts: renesas: Add max-frequency to SDHI nodes
Date: Wed, 20 May 2026 12:51:38 +0100
Message-ID: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32863-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 02AD758CFC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
SDHI0 and SDHI1 MMC controller nodes in the RZ/G2{L,LC,UL}/RZ/V2L
device tree.

This change results in approximately 33% performance improvement as
it sets the SD clk to 100 MHz instead of the max 133 MHz.

Biju Das (3):
  arm64: dts: renesas: r9a07g043: Add max-frequency to SDHI nodes
  arm64: dts: renesas: r9a07g044: Add max-frequency to SDHI nodes
  arm64: dts: renesas: r9a07g054: Add max-frequency to SDHI nodes

 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 2 ++
 3 files changed, 6 insertions(+)

-- 
2.43.0


