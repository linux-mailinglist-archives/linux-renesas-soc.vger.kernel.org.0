Return-Path: <linux-renesas-soc+bounces-32802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOrXJP1HDGprdAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:22:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2957D7AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2F9D3001449
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 11:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150724921B2;
	Tue, 19 May 2026 11:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcXl/y+L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92730480DF4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 11:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189604; cv=none; b=P8Qap6aCA/ax5DGFH1Wvk87R06dDikW5jeATjQpAGif+/hvEJn3UMWfhOn6D2xtJI5ZgVy9Hbrx7LD7DqDmKsnekZvmMBSmvUDeHztESgPPbm27eMw9iv7BFWANFVYeH2tWDnQw0ZDIzDzcAQgFFz9IHD5GsWRdQfxy0MWa1DhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189604; c=relaxed/simple;
	bh=8cnkHSegsO8bCumTqwhx1lBs+4+12pjVx9tdbJJpbo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cxNJX+IfyeNKSmMn9K2T0ZTipG/YVER3PYFui2SqUuLcvcUHa3AzdzFQFNz8e6DHRjSRpi78LlXO7MbM8pwByGii4B/KYBwcfKWbbRpOAgTffQDCHcDHWGHHHlh3QKzxTI8YdX7EQXDhJD6qURPjsFVrq2NvT2MhnlfY1xSsuuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcXl/y+L; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso3203344f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779189601; x=1779794401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zFSzGFM0qEWox8JUZ4uZiuf3xKGhoFzadCX3KqMCbLM=;
        b=YcXl/y+LsfoFOwKOt7RpItSBSzm7wZNNauos9bsWXjNwGkq8+g5nAklV04y1lv3ZjL
         FD0H4Y/Vnqka+OusjOl0zSfBcG4ZPld2lO2BE1BIW7CgZU3nCqdlqTmZU8p8qINSedtL
         DhyV0nlIISNKpxF8IW+DS+AiJNcpM98W69AofdoIvQu/TEpckfZc1rzcggadHPDB8gZT
         ATbi0xT3Q6/4vI6bKm2jIDj+lVbpRp/8wxIk+3xMx5pdTGpEz6bt8vWp5BSftCtshbqU
         aJX6v6jOMvbzb+Z4X1aOsL42m+Ba+tpLr1OUf3cnEBN4wDX5apOwq5pl54TD7QK0FHSH
         GBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189601; x=1779794401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFSzGFM0qEWox8JUZ4uZiuf3xKGhoFzadCX3KqMCbLM=;
        b=I16a7fREkhDuZGIKqLlYKRz6ybExP7kD10lo/AX4fh8/2lLE08e1CD9Gf+x5xpyfqF
         9oECaTyP/fdwDpdUMwz9Xd8A8K+ICzm6JIKJ5yRLZ9k9NiIrK73lfzGEuRv3HehMbDJR
         F4GHK+sn259JUblUUakmGfl9qew4ZNzcGEkBgSgWrnzLZofLQ1BedZocFEY/oI3jNYbF
         mVb1qdonTrUS+1PJLJOgy26zHiuAZ3g0aLCpnG9SF+F14w84m9rTX19rkMFpsQ+FrD99
         MzxE0kj2wmul610AmAHpnoV6PdwGZLHs2RjLB45lntopKYI5SSFz/+1ozdR1tz2EO6d8
         b16Q==
X-Forwarded-Encrypted: i=1; AFNElJ+O+Ewa/mnG+gl/EwZj0x3/1kkFldSySVGn30EloHDkVZR8SOfNbW/UdLBau+cUIRJm5b9yuwy8LiLBZG9wGq+XRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj6cvuowH1CKXlcveWAcmM1FAs83dtS7jA6THp4tCB7Fsdlg2Q
	nSJdRc2RXvrR3fxQc6+Hs7pBT1rd6Q8IYynMz+VQ79i7fC7QFOV5XdOL
X-Gm-Gg: Acq92OEoCuH/Jrc0Xb91jKAP1NU/ijTPG4lOXLuRBCnr/65109HH2BoRZ427Whagz1s
	pxpHv1I4boIra1Of7PeGNPr/UCC7TD3gsvZXR+cpC9h/6Ohyy9CE4p1g8OqBRnIzU3baPHQCjG0
	cFoJxGDy1fATc7JJpcnB4vtR7AFj97f3TMVFE1B726/A2BGQRjEr+iMD2RvinuMyzGHIl5tbWzV
	YWR6KOJqppkokEpYDEClvLHgxwfTouxqJJt4Pp0jSKJD8y/LkaRMT1mgUvWMU+CjGS25w09zQFg
	1LWCdwspYVJbtvukh8NnikGQ2FzIB3gskmoyJoE+AuJUhRVCGr1rWMTW0QYyzWTO1KWq/6ZJRtn
	awNlQBxMcO1rqjGxnwIfFoyt4cF4pcrfLeGmtFXw88Wx3bGCp0fvopwQ+kOsSzIYWiCZUWdbfBW
	QvK6I3Kh+l3wh8D8AXLtRWB09rPEqgkXYrSH0dw31tFeVbtFwn
X-Received: by 2002:a05:6000:22c1:b0:449:a07a:9676 with SMTP id ffacd0b85a97d-45e5c59ec63mr30296381f8f.29.1779189600659;
        Tue, 19 May 2026 04:20:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm46066323f8f.34.2026.05.19.04.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:20:00 -0700 (PDT)
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
Subject: [PATCH 0/2] Enable RSPI support on RZ/G3L SMARC EVK
Date: Tue, 19 May 2026 12:19:52 +0100
Message-ID: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32802-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 3BC2957D7AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series enables RSPI support to RZ/G3L SMARC EVK.

Geert,
There is an internal discussion about dropping patch#2, as RSPI is useless
without a device connected to that interface. However, as per the
schematic, RSPI signals are wired up to the PMOD connector. Currently, it
is enabled on RZ/G2L and RZ/G3E. Please share your thoughts on this.

Note: Patches are dependent on series [1] and [2].
[1] https://lore.kernel.org/all/20260505123708.134069-2-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260519100022.116318-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 72 +++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 19 +++++
 2 files changed, 91 insertions(+)

-- 
2.43.0


