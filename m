Return-Path: <linux-renesas-soc+bounces-24499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82CC53947
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 18:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23D6650831D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 15:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EF333B6F3;
	Wed, 12 Nov 2025 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V804Wny5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C84C337B80
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962089; cv=none; b=FAFyrFPJ2g1eBkvtqcirsjmFnfKBmmcsDPs/VXuxrKglnktd5yYYNh1fY/UPPnxrtuXycbx/Rtw0Pud1L+Xs4UQ5IkH2GXuxHMuN/DyoTVo03rWSZvxo7/t9F21nD+rs80/rpemRfpGNyO7c5o0HcsdY/6pmQb+aTBJMmEz/Qto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962089; c=relaxed/simple;
	bh=P70ux5XoL4sP7XKBF8mt9nEhNWg2Y0bKzzy2WXyp+MA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfI/me/T/rD89nWE++tCxjx+EiQ/t7vShPkdkTcax4K2TlEP/LXk1Oc/xJDgzuUHONf96ET031B4Pq4W+ECLGyk9KMulm3W2TOXfFYfFCndDFPBUHV4nmS51cGlWjQz27DVqCAOehymxku9Zh9UtnXEDeanpmZW2766o6Yl9pqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V804Wny5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so1446633a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 07:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762962085; x=1763566885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EcqGRuJDH5DuPAeW4wBjcQ/B5B6evG4AWgj1C7n+4kU=;
        b=V804Wny53F8rsoC0D2aHjH3g007OZpczWy9EsPNIadKYAww8Y8cJy0gMWtiyigO7EF
         ufLqCRVh/dAU0gvUeIsZq+Oz0TNRumgNEDnzdjcvd+9IsJr4O8q9nrKazJh8CS4HCvLF
         kcdlLpsV3fXSgH9z9e74m+FOBbfSECchh87NXSim7QqqQiWuc0z2sjq2nYjVFUf3MWqx
         qCm4kg6kSCwL7Q+HYonTH5oTUKRBOk1HBGVougmD56vv2FJqKTG7QI14eYD2dlxsnqxu
         LICNUx7WzbvFwBuQ/YWBSrXenMSRKrERAZw/l6bo4oFuSZHEoqc8Z1JJDqN66SKMZGKD
         hJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962085; x=1763566885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcqGRuJDH5DuPAeW4wBjcQ/B5B6evG4AWgj1C7n+4kU=;
        b=Gh5m+OJ3HeAZu02uPmevSqvl5M+3Rm5YojpgWViqB6BfFxV17Wo+evRpUly0hBQ2g/
         N2EG9AuoolzvmWfzuq7CXRnXhH30CVoRNF7kAa+/pcyqFeWmkiP1r6GXfT6kZ7dOAGwP
         KnODZuul0lw5V8Q2k6rNu6NnGC8xSsn+WeMbMJi+gs+BtDsFTM3l+kAOhScRzHn8ECFg
         sLHVtTsN6hUouaMzAUBWymWHsYDOmZLR6ujJGNDcbxabKk43o3gbs05wHATJDWRE2L0d
         JAba6+JSQoarDbc6BSBdchp1oKCrPVmefEzS34oC1/lGFCbP5BdiOVEIiHcGwTtC8oaJ
         ofYw==
X-Forwarded-Encrypted: i=1; AJvYcCX8e6DkNKhylpTok4lzlSmf2nU4olcP6EXKWA+aKjSDNnMfcnNXOQZsAzaueBlA/FfWItXawjfHa2C4Akde6dllNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB8xRa0QOg68QVRvXmEzNrTu5HKBCfTaf5pt/kOiGsL31k65ss
	gYJ9JEgIK2IpzOnJdkTDHIRzMWsBelOpkrrms/Ah6hrCHU4QdGfnuLW7
X-Gm-Gg: ASbGncs8B+G645odVC2eD6qSH4XN3zI8OxZti4uj/AJzdtL8kmdRmW6zp/cqIri5LFN
	kzi7u3MBCnt1k4HsJzDfsQIz4sfAHLRwJvuvBIhGEYwma177ILW2AAs9qXVCL3i6DqOLLxJHQ0n
	g1ycvQJZsyVaJc/W83/DXyEENdmgChVLPuLlU/JUh9eYkovPdx9tcSZylOX3ErvQnm1iDVgnR2W
	gH4CCeXA6JoE83n9MQZgjlNWXq7qxpiFw0QlgcrtT8x+7iPkdKcnTmi2G+QCfWxY6NN6zrjq0Ib
	1HEHBtsJ3Oy/5ndR0IoEjLEfJFViEdNNFuMHg+UUpOyPJY735Q0xis/q7xaoS62HVTe38Sh+16+
	sEolXC/lupPxLikY7oWnUo80sU7adDdPS//bTDhu+3LTuTVtojMZJztxMBp4/f+0YcedUgpmhY+
	AWJ4MJP7h4XMugfteFPqjEm9NiVICX0w/XIDWPGyIw901VGOsZsq+IYTnzfWMKhvfsYvZ8WsaXx
	MCqqg==
X-Google-Smtp-Source: AGHT+IHX3eOJnJ6b2ckYQuN9nF0Y5Rkb79t/DFxTrsKsHI+zlzbswhY4DwsGngMKF9S9FWP+40tSmg==
X-Received: by 2002:a17:907:6092:b0:b70:bc2e:a6f0 with SMTP id a640c23a62f3a-b7331a054camr337287566b.5.1762962085303;
        Wed, 12 Nov 2025 07:41:25 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm1670023566b.39.2025.11.12.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:41:25 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/7] RZ/G2L SSI Improvements
Date: Wed, 12 Nov 2025 15:41:01 +0000
Message-ID: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The first patch in this series fixes audio channel swap issue because of
half duplex to full duplex switching during the streaming that involves
FIFO reset which drops the word leading to audio channel swap issue. The
second patch fixes sample width value in the hw_params_cache::sample_width
Apart from this, support 24 and 32 bit sample format width.

Biju Das (7):
  ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
  ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
  ASoC: renesas: rz-ssi: Use dev variable in probe()
  ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
  ASoC: renesas: rz-ssi: Move DMA configuration
  ASoC: renesas: rz-ssi: Add support for 24 bits sample width
  ASoC: renesas: rz-ssi: Add support for 32 bits sample width

 sound/soc/renesas/rz-ssi.c | 193 +++++++++++++++++++++++++------------
 1 file changed, 132 insertions(+), 61 deletions(-)

-- 
2.43.0


