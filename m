Return-Path: <linux-renesas-soc+bounces-29298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAL0NgrmsmktQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:12:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463EF2754F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82547303A5C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 16:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2089D3CF694;
	Thu, 12 Mar 2026 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHmhClIt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC8C3F2101
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 16:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331473; cv=none; b=UrwiTXgAW6zne3CaOAby8aGJ/Nd398HIW8pfHleb/tJhaDLxnkfUMWMmaZVotuUvNV1KfRuOFLANDs0XfoqBBAyyU1T1jcXU3Hu7R/ekOSTPcMYf4oMTZF+NYPdi+1PuPjlLf8JVbgHZFaLF9G+iZrXY+IGV5xoTEXwbgjNuigI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331473; c=relaxed/simple;
	bh=/FpJ/+dfa/F2us/EyAIKrqnW3m2fgHQOTC6HPrFx3qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L6NAqhEzCicSnqMFF6oT+coPQBgLPZ4uRBur9M8ZkRovlv551+DvrFtw32clUO3/83Tqw8lhKe+V7k6mTgEO1pPlp4P8IF8HGXugjQTBRwUe8dW5SAD9n07kuiHwx4nByPVDmmX0tqzrliLecp7llWOO8njlMVZ7YvBsLWTXlW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHmhClIt; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso981848f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 09:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773331470; x=1773936270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wxv8jN6w9lX3I24+o8BtoBV6RsdBNdfHaFJY2ryON0M=;
        b=XHmhClItr/Y5AmebzRAb9LRRyFZyeJYk4HlpIwmnh99T6LN/YlfuBvSxEHF9VDcDOU
         EA+346LhkAfJ0aITrw+YPlLvYxEh5C0MOxb1TPp2WVE5ZNwRVP963Rew62qedjU6JL9M
         4CNQsT0BHO3mABeWTNnn7VWEtC6/VuSR3Cf2+FrfDW9G1w+8PoInfIeRAMpGsjpMc4VF
         AbdjwRUxxGU31i/w7mvdQt4nEZfHOcwQSCkhckKtY98lFsydiACoTnvNxcWmC0OYcoNb
         so+To1Q1KLyWxGiSsWWT3kvsy52YwD5lUtqY7vRW3QuhG5OdYb3VUXxicyq99dov8YWm
         oyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331470; x=1773936270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxv8jN6w9lX3I24+o8BtoBV6RsdBNdfHaFJY2ryON0M=;
        b=ag0QTxlY905Y+0igixqFELs590mHF4iLtXbQEeFBSfRVsC0F2KYJdRY0oJjVZlR76s
         YhzKM8VoPXNN1g+dxF5hJfrJF7vbh+t1h7JHvNXaHA8zOjaKTFe0EIYX2JBntZZzqRGX
         nEPqyxIoKUECDAl0owZsB90Z3/mucha1iGZkjJhWF8XTCHYytWTfuOJ8+oZbBTyDsiHF
         PDS4qt4hhUgI1F/epcbpPFRJxxmBxponoapodcaHIlTfBLsorOVRCkaYtCyWrklU17xW
         rfHaUTTkVmy/+wgJcvBi9YRvFtzsLT1/eQUp1Br2S3NZXzDMHh0quu0M8QBLtlZNMZKs
         9T+g==
X-Gm-Message-State: AOJu0Yz8ci9rywKoCP19uhIaVB1PjKEvjaOLRtK01IlciPCE2gjpkVho
	UlhmrUoCFpGAaC6woysR1PwoU0KfLdcNnDB9/5XR+R4rXv99jPHs7xKm
X-Gm-Gg: ATEYQzwygEoPw7GgayT6IdiGfXjTDdh02gyfREG1IyKUUKSdzPrrEEIpcq03p/7bqXO
	1YhrgoK/vlTvRRGEGSlTF4clbV3HhJTZSDHXJn7a6GWGtwWUWATKrUcMFaXwqLlnz9AmqXbTmKI
	tVc4Ngxc8385hXrsrBvjh1vqoGvOFsaUjhyCsfpKpnKyzwQfSkQ8P+q7saSTFTaQZ0NWpgYbwJn
	aEsD5guu0QEJ/6etsv608QrBPM1YjWwmMzdnhEdIWxSryJ4jfFARh4b+xicyfLzw7ycIFlCt4AB
	v7yQcS7oWU+dXPHFTw51RZc2mfP53fAoH7tqJI7Junu7QQJGN5ToECyPzquLsZN3LzdoxeBiwuw
	2hG/hbf40WCCujXBNTLmkmsg/RDjLm77AsryzNu4ZQ2HPwXBXwfFwr72El5RthgfDZLoYAoZapP
	ViR6RtKlUgrmixoVw7uk61oUnb2dKYpxsLumezzzPrItpgVkoGtcssjoHws7OgHJyMZGET7L227
	R9R2bzW/MNrbF1GGTFdc8yg9vDG6wGgfBH8/vSGKO1BQjs=
X-Received: by 2002:a05:6000:200d:b0:439:ca57:cc85 with SMTP id ffacd0b85a97d-43a04dcb2a2mr318240f8f.39.1773331469618;
        Thu, 12 Mar 2026 09:04:29 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:fc52:7d64:32f4:e21e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm9775528f8f.23.2026.03.12.09.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 09:04:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: rzn2h/rzt2h: Add PHY interrupt support
Date: Thu, 12 Mar 2026 16:04:05 +0000
Message-ID: <20260312160407.3387840-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29298-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 463EF2754F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the PHY interrupts on the RZ/N2H and
RZ/T2H EVK boards. The PHYs are connected to the ICU via IRQ14 and IRQ15
lines on the RZ/N2H, and IRQ3 and IRQ13 lines on the RZ/T2H.

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add PHY interrupt support
  arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add PHY interrupt support

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi     | 18 ++++++++++++++++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts     |  8 ++++++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi     | 18 ++++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts     |  9 +++++++--
 4 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.53.0


