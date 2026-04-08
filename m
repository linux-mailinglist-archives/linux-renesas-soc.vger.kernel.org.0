Return-Path: <linux-renesas-soc+bounces-30967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPSSJucX1mnwAwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:55:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7ED3B95CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C69CA30268A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 08:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA033AD530;
	Wed,  8 Apr 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbqaqLI7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F01381B0F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 08:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638467; cv=none; b=GjApKf+5O9QE2MfQ2nfa/ELaAJ4C5733rByASOzYNJ0e6fYFxD9h1b6dORSDsuDJj5ztfkAN2c2s9rb0DgmlR6VWaUw+w2UCcNjKEmzLPkjtwnXXh7ebwWZvBLThH2bdY9eZ2OC0uF2XRnWVKmG0ztekH9dn0Dqom4Z4oJTGUvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638467; c=relaxed/simple;
	bh=EJoIKdPOFttSrswQ0GhOBa78hx20inKvrF1KVKuuER4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgDlu6W+rv2UYdIKI0nJN8pS2obNJ021GWZhurK8SalwTzDukAJxEHNcVSGSbKiuMwMDE8LynanUmJNmUTvjRa5mgkfl2SAaQjyzMrasrMRpDMo7jod3LEiEAG1/e4rtm8BmVO/ejLNbCVZSxn2mnsaQop12nzxNrxCoLgbMRMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbqaqLI7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d029f346eso5021709f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 01:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775638462; x=1776243262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=npVCOnxTjrbDOE2h2othHyWsXIp2uhsqGskjgUSWuQE=;
        b=hbqaqLI7NiMtlzaftxNdS/iakAotRc2d1XNqo//drautVFTJ5CwKo6591GpqceUoL8
         1IfQZEhCPOx1XXBE8uSIuIVvo9Qb6ebgM2vmPN3E6/zFV3K3sO7Cpp2r+/NTRUccFB3P
         /7g7jCvbgRGv+g2918cbUr+wyPcGMPmOb58IGvDfu0UGhW0Dkj6XQozAJhVYrYn91rfT
         +RtJ7DgJ5GzpxdVl9zlfwtSGiFEREq0ubJozJ7pgJ/tgucjPPYsgDieXj2lsQ2ZVSD0J
         hQO3EUnbmS1ho968Dfn0blct0Ggh8QKoPrjjjRjwU6Zl8O6XYlG+/EVwlc3QZo5E1NxR
         WCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638462; x=1776243262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npVCOnxTjrbDOE2h2othHyWsXIp2uhsqGskjgUSWuQE=;
        b=N1EunkHUkoAjobdmTySI5O712fNrTuHuzvteN5s0D59hqtXLLiwWf7DQYVbbDKz2JF
         4Nw3EI1nsOMDB8WCgc/prnQhWJE9/e65Z6+UXer+YH9SRDKqCAiPOdGV7D9dmvWvGPz/
         rmJoY7bfa6y87HHvdolOJIPnKD0kLjQksv5yh/h1CiZ/uTM6Rr879sngutVAwKdU/qPN
         w5HleqV/N+4eEZxpjgovjti/CfXekTguc4hxeGpWmOF1tW5M4xLr4y5Qdcy8F6yoTb+8
         qFnmbcDT7GvZkZWpdK5k/63/UZBNfoxnhtdHw8gJYOik059f+2qOu4nDQwJc+PKj4jyN
         HZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh28OMawxQgl1XBxkysyywn6YinXg71S2yoyNV5OoV3m9S/Uaze2uS9u8FsIMysnnwoEY4TxD0TUUfrwVX+SolQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP6iND9Cbrs95rGHOUeD+Lc/ZNmgz+ZscgPDq4Jt17ITCS5Ygw
	PD0jSNwuvxZe/iixbP2eRPLnOtE5Tz66glY6TDL2tbWSz55WN2JixAIF
X-Gm-Gg: AeBDievsVgD0WvlVsm3KBHN0oln2GkmnL8/hlwx7ljS2nSJG9rEbwpgpoUBaSutKdPQ
	Cqz7ipGDngc3jGnKkrxrXSH1/ni0jtMm9S60Vn390q7DZvAyMbN2pIoFAKlViCNJ7eiVuaCYqBE
	qKMQYOY6AP8k6WLtcRzGPqnewnT9x+FxMDCudHNOB6KG+tfXxv24e6+C0JgYoEAb+05L46mvNTe
	2WPWWx4bdYL1DpRc81JxDh92OJ20TG3dMq8YS1dtw0eQyFb4xSb+ZDGNaIveO/2sGDeXytM6p4z
	dWQqQIxRjc4WovJD3cLQp48RJOS+6phcqoQmtaEhrH1rqwEQcfwokv376C7wV9bBIBC+q2QGZ3V
	ugqur7mGFwf1qtw72yG6NaTYUUicobBZUt1RS0gKT49srCO4dZOAGOcRdPYkAK9fmWmxibxoadg
	sNQTG6NHQwblnSVxNMb4IgKp+iqPGTxwc0HC+yQ1irVBr9ee0=
X-Received: by 2002:a05:6000:4201:b0:43c:f28b:8863 with SMTP id ffacd0b85a97d-43d29295e1bmr29241260f8f.13.1775638461548;
        Wed, 08 Apr 2026 01:54:21 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:f65c:8080:131a:202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm56437678f8f.15.2026.04.08.01.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:54:21 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/2] Add Renesas RZ/G3L RSPI support
Date: Wed,  8 Apr 2026 09:54:13 +0100
Message-ID: <20260408085418.18770-1-biju.das.jz@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30967-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A7ED3B95CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series adds binding and driver support for RSPI IP found on the
RZ/G3L SoC. The RSPI is compatible with RZ/V2H RSPI, but has 2 clocks
compared to 3 on RZ/V2H.

v3->v4:
 * Added a blank line before the dmas property in bindings.
 * Collected tags for binding patch.
v2->v3:
 * Added ordered DMA names for the dma-names property.
 * Dropped the tag from bindings as there is a change related to dma-names
   property.
v1->v2:
 * Rebased to next
 * Collected tags

Biju Das (2):
  dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
  spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)

 .../bindings/spi/renesas,rzv2h-rspi.yaml      | 29 +++++++++++++++++++
 drivers/spi/spi-rzv2h-rspi.c                  |  8 +++++
 2 files changed, 37 insertions(+)

-- 
2.43.0


